local addonName, addon = ...

if type(addon) ~= "table" then
    addon = _G[addonName] or {}
end
_G[addonName] = addon

local max = math.max
local floor = math.floor
local UnitPowerSafe = UnitPower or UnitMana
local UnitPowerMaxSafe = UnitPowerMax or UnitManaMax
local BOOKTYPE_SPELL_SAFE = BOOKTYPE_SPELL or "spell"
local band = bit and bit.band
local strfind = string.find
local wipeTable = wipe or function(t)
    for k in pairs(t) do
        t[k] = nil
    end
end
local ENEMY_SCAN_INTERVAL = 0.25
local ENEMY_TRACK_WINDOW = 4
local ENEMY_TRACK_RECENT_SECONDS = 1.25
local ENEMY_TRACKER_MAX = 64
local SPELL_DATA_REFRESH_INTERVAL = 0.35
local ENEMY_DEATH_EVENTS = {
    UNIT_DIED = true,
    UNIT_DESTROYED = true,
    PARTY_KILL = true,
}

local ENEMY_UNITS_ALWAYS = {
    "target",
    "targettarget",
    "pettarget",
}

local ENEMY_UNITS_COMBAT = {}
for i = 1, 4 do
    ENEMY_UNITS_COMBAT[#ENEMY_UNITS_COMBAT + 1] = "party" .. i .. "target"
end
for i = 1, 5 do
    ENEMY_UNITS_COMBAT[#ENEMY_UNITS_COMBAT + 1] = "boss" .. i
    ENEMY_UNITS_COMBAT[#ENEMY_UNITS_COMBAT + 1] = "arena" .. i
end
for i = 1, 10 do
    ENEMY_UNITS_COMBAT[#ENEMY_UNITS_COMBAT + 1] = "nameplate" .. i
end

local defaults = {
    enabled = true,
    locked = false,
    scale = 1,
    alpha = 1,
    iconSize = 52,
    spacing = 6,
    point = "CENTER",
    relPoint = "CENTER",
    x = 0,
    y = -120,
    queueLength = 1, -- next-action mode by default
    cleaveThreshold = 2,
    aoeThreshold = 3,
    cooldownSync = true,
    cooldownWindow = true,
    dbVersion = 5,
}

addon.state = {}
addon.knownSpellsByName = addon.knownSpellsByName or {}
addon.knownSpellsByID = addon.knownSpellsByID or {}
addon.knownSpellCount = addon.knownSpellCount or 0
addon.knownLocalCache = addon.knownLocalCache or {}
addon.glyphNames = addon.glyphNames or {}
addon.enemyTracker = addon.enemyTracker or {}
addon.enemyTrackerCount = addon.enemyTrackerCount or 0
addon.playerGUID = addon.playerGUID or nil
addon.petGUID = addon.petGUID or nil
addon.auraQueryCache = addon.auraQueryCache or {}

local function copyDefaults(dst, src)
    for k, v in pairs(src) do
        if type(v) == "table" then
            if type(dst[k]) ~= "table" then
                dst[k] = {}
            end
            copyDefaults(dst[k], v)
        elseif dst[k] == nil then
            dst[k] = v
        end
    end
end

local function clamp(value, low, high)
    if value < low then
        return low
    end
    if value > high then
        return high
    end
    return value
end

local function safeNumber(v)
    if not v then
        return 0
    end
    return v
end

local function isHostileFlags(flags)
    if type(flags) ~= "number" then
        return false
    end
    if not band or not COMBATLOG_OBJECT_REACTION_HOSTILE then
        return false
    end
    return band(flags, COMBATLOG_OBJECT_REACTION_HOSTILE) > 0
end

local function isHostileCombatEvent(event)
    if type(event) ~= "string" then
        return false
    end
    return strfind(event, "_DAMAGE", 1, true) ~= nil
        or strfind(event, "_MISSED", 1, true) ~= nil
        or event == "SPELL_AURA_APPLIED"
        or event == "SPELL_AURA_REFRESH"
end

local function addHostileUnit(set, unit, requireCombat)
    if not unit or unit == "" then
        return
    end
    if not UnitExists(unit) or UnitIsDead(unit) then
        return
    end
    if not UnitCanAttack("player", unit) then
        return
    end
    if requireCombat and UnitAffectingCombat and not UnitAffectingCombat(unit) then
        return
    end
    local guid = UnitGUID(unit)
    if not guid then
        return
    end
    set[guid] = true
end

local function normalizeSpellKey(name)
    if type(name) ~= "string" then
        return nil
    end
    -- Strip rank suffix variants and normalize for matching.
    local clean = string.gsub(name, "%s*%b()", "")
    clean = string.gsub(clean, "%s+", " ")
    clean = string.lower(clean)
    return clean
end

function addon:GetSpellName(spell)
    if type(spell) == "number" then
        return GetSpellInfo(spell)
    end
    return spell
end

function addon:GetSpellTexture(spell)
    if type(spell) == "number" then
        return select(3, GetSpellInfo(spell))
    end
    local _, _, icon = GetSpellInfo(spell)
    return icon
end

function addon:RefreshGlyphs()
    local names = {}

    if GetGlyphSocketInfo and GetSpellInfo then
        for slot = 1, 6 do
            local a, b, c, d, e, f, g, h = GetGlyphSocketInfo(slot)
            local values = { a, b, c, d, e, f, g, h }
            for _, value in ipairs(values) do
                if type(value) == "number" and value > 0 then
                    local n = GetSpellInfo(value)
                    if n then
                        names[string.lower(n)] = true
                    end
                end
            end
        end
    end

    self.glyphNames = names
end

function addon:HasGlyphLike(text)
    if type(text) ~= "string" or text == "" then
        return false
    end
    local needle = string.lower(text)
    for glyphName in pairs(self.glyphNames or {}) do
        if string.find(glyphName, needle, 1, true) then
            return true
        end
    end
    return false
end

function addon:UpdateUnitGuids()
    self.playerGUID = UnitGUID("player")
    self.petGUID = UnitGUID("pet")
end

function addon:ResetEnemyTracker()
    self.enemyTracker = {}
    self.enemyTrackerCount = 0
    self.enemyScanTime = 0
    self.enemyScanCount = 0
    if self.enemyUnitSet then
        wipeTable(self.enemyUnitSet)
    end
end

function addon:TrackEnemyGUID(guid)
    if not guid then
        return
    end
    local tracker = self.enemyTracker or {}
    local now = GetTime()

    if tracker[guid] then
        tracker[guid] = now
        return
    end

    local count = self.enemyTrackerCount or 0
    if count >= ENEMY_TRACKER_MAX then
        local oldestGUID
        local oldestTS
        for g, ts in pairs(tracker) do
            if not oldestTS or ts < oldestTS then
                oldestTS = ts
                oldestGUID = g
            end
        end
        if oldestGUID then
            tracker[oldestGUID] = nil
            count = max(0, count - 1)
        end
    end

    tracker[guid] = now
    self.enemyTracker = tracker
    self.enemyTrackerCount = count + 1
end

function addon:UntrackEnemyGUID(guid)
    if not guid then
        return
    end
    local tracker = self.enemyTracker
    if not tracker or not tracker[guid] then
        return
    end
    tracker[guid] = nil
    self.enemyTrackerCount = max(0, (self.enemyTrackerCount or 0) - 1)
end

local function parseCombatLogEvent(...)
    if CombatLogGetCurrentEventInfo then
        local _, event, _, sourceGUID, _, sourceFlags, _, destGUID, _, destFlags, _, _, _, _, auraType = CombatLogGetCurrentEventInfo()
        return event, sourceGUID, sourceFlags, destGUID, destFlags, auraType
    end

    -- WoTLK 3.3.5 callback argument order:
    -- timestamp, event, sourceGUID, sourceName, sourceFlags, sourceRaidFlags,
    -- destGUID, destName, destFlags, destRaidFlags, spellID, spellName, spellSchool, auraType, ...
    local _, event, sourceGUID, _, sourceFlags, _, destGUID, _, destFlags, _, _, _, _, auraType = ...
    return event, sourceGUID, sourceFlags, destGUID, destFlags, auraType
end

function addon:HandleCombatLogEvent(...)
    local event, sourceGUID, sourceFlags, destGUID, destFlags, auraType = parseCombatLogEvent(...)
    if ENEMY_DEATH_EVENTS[event] then
        self:UntrackEnemyGUID(destGUID)
        return
    end
    if not isHostileCombatEvent(event) then
        return
    end
    if (event == "SPELL_AURA_APPLIED" or event == "SPELL_AURA_REFRESH") and auraType ~= "DEBUFF" then
        return
    end

    local playerGUID = self.playerGUID or UnitGUID("player")
    local petGUID = self.petGUID or UnitGUID("pet")

    if playerGUID then
        self.playerGUID = playerGUID
    end
    self.petGUID = petGUID

    local sourceMine = sourceGUID and (sourceGUID == playerGUID or sourceGUID == petGUID)
    local destMine = destGUID and (destGUID == playerGUID or destGUID == petGUID)

    if sourceMine and destGUID and destGUID ~= playerGUID and destGUID ~= petGUID then
        if isHostileFlags(destFlags) or not destFlags or destFlags == 0 then
            self:TrackEnemyGUID(destGUID)
        end
    elseif destMine and sourceGUID and sourceGUID ~= playerGUID and sourceGUID ~= petGUID then
        if isHostileFlags(sourceFlags) or not sourceFlags or sourceFlags == 0 then
            self:TrackEnemyGUID(sourceGUID)
        end
    end
end

function addon:CountEnemies(windowSeconds)
    local now = GetTime()
    local lastScan = self.enemyScanTime or 0
    if (now - lastScan) < ENEMY_SCAN_INTERVAL then
        return self.enemyScanCount or 0
    end
    self.enemyScanTime = now

    local set = self.enemyUnitSet
    if not set then
        set = {}
        self.enemyUnitSet = set
    else
        wipeTable(set)
    end

    local cutoff = now - (windowSeconds or ENEMY_TRACK_WINDOW)

    local targetExists = UnitExists("target") and not UnitIsDead("target")
    local inCombat = (InCombatLockdown and InCombatLockdown()) or (UnitAffectingCombat and UnitAffectingCombat("player")) or false
    if not targetExists and not inCombat and (self.enemyTrackerCount or 0) == 0 then
        self.enemyScanCount = 0
        self.enemyDirectCount = 0
        return 0
    end

    for _, unit in ipairs(ENEMY_UNITS_ALWAYS) do
        addHostileUnit(set, unit, false)
    end

    if inCombat or targetExists then
        for _, unit in ipairs(ENEMY_UNITS_COMBAT) do
            addHostileUnit(set, unit, true)
        end
    end

    local directCount = 0
    for _ in pairs(set) do
        directCount = directCount + 1
    end

    local tracker = self.enemyTracker or {}
    local trackerCount = self.enemyTrackerCount or 0
    local trackerRecentCutoff = now - ENEMY_TRACK_RECENT_SECONDS
    for guid, ts in pairs(tracker) do
        if ts >= cutoff then
            local includeTracker = true
            if directCount <= 1 and ts < trackerRecentCutoff then
                includeTracker = false
            end
            if includeTracker then
                set[guid] = true
            end
        else
            tracker[guid] = nil
            trackerCount = trackerCount - 1
        end
    end
    if trackerCount < 0 then
        trackerCount = 0
    end
    self.enemyTrackerCount = trackerCount
    self.enemyDirectCount = directCount

    local count = 0
    for _ in pairs(set) do
        count = count + 1
    end
    self.enemyScanCount = count
    return count
end

function addon:RefreshKnownSpells()
    local byName = {}
    local byID = {}
    local count = 0
    local hasSpellBookNameAPI = (type(GetSpellBookItemName) == "function") or (type(GetSpellName) == "function")
    local hasSpellBookInfoAPI = (type(GetSpellBookItemInfo) == "function")

    local function getSpellbookName(slot)
        if type(GetSpellBookItemName) == "function" then
            local n = GetSpellBookItemName(slot, BOOKTYPE_SPELL_SAFE)
            if n and n ~= "" then
                return n
            end
        end
        if type(GetSpellName) == "function" then
            local n = GetSpellName(slot, BOOKTYPE_SPELL_SAFE)
            if n and n ~= "" then
                return n
            end
        end
        return nil
    end

    local function getSpellbookInfo(slot)
        if hasSpellBookInfoAPI then
            return GetSpellBookItemInfo(slot, BOOKTYPE_SPELL_SAFE)
        end
        return nil, nil
    end

    local function addKnown(spellName, spellID)
        if not spellName or spellName == "" then
            return
        end
        if not byName[spellName] then
            count = count + 1
        end
        byName[spellName] = true
        local norm = normalizeSpellKey(spellName)
        if norm then
            byName[norm] = true
        end
        if spellID and type(spellID) == "number" and spellID > 0 then
            byID[spellID] = true
        end
    end

    if GetNumSpellTabs and GetSpellTabInfo and hasSpellBookNameAPI then
        local tabs = GetNumSpellTabs() or 0
        for tab = 1, tabs do
            local _, _, offset, numSlots = GetSpellTabInfo(tab)
            offset = offset or 0
            numSlots = numSlots or 0

            for slot = offset + 1, offset + numSlots do
                local spellType, spellID = getSpellbookInfo(slot)
                local spellName = getSpellbookName(slot)
                if spellName and spellName ~= "" and spellType ~= "FUTURESPELL" and spellType ~= "FLYOUT" then
                    addKnown(spellName, spellID)
                end
            end
        end
    end

    -- Fallback scan for private cores where tab metadata is broken.
    if count == 0 and hasSpellBookNameAPI then
        local empty = 0
        for slot = 1, 512 do
            local spellType, spellID = getSpellbookInfo(slot)
            local spellName = getSpellbookName(slot)
            if spellName and spellName ~= "" and spellType ~= "FUTURESPELL" and spellType ~= "FLYOUT" then
                addKnown(spellName, spellID)
                empty = 0
            else
                empty = empty + 1
                if empty >= 80 then
                    break
                end
            end
        end
    end

    self.knownSpellsByName = byName
    self.knownSpellsByID = byID
    self.knownSpellCount = count
    self.knownLocalCache = {}
end

function addon:RefreshSpellData(force)
    local now = GetTime()
    local nextAt = self.nextSpellDataRefreshAt or 0
    if not force and now < nextAt then
        self.pendingSpellDataRefresh = true
        return false
    end

    self.pendingSpellDataRefresh = false
    self.nextSpellDataRefreshAt = now + SPELL_DATA_REFRESH_INTERVAL
    self:RefreshKnownSpells()
    self:RefreshGlyphs()
    if self.RequestImmediateUpdate then
        self:RequestImmediateUpdate()
    end
    return true
end

function addon:IsSpellKnownLocal(spell)
    if type(spell) == "number" and spell == 6603 then
        return true
    end

    local spellName = self:GetSpellName(spell)
    if not spellName then
        return false
    end

    local spellID = type(spell) == "number" and spell or select(7, GetSpellInfo(spellName))
    if type(spellID) ~= "number" then
        spellID = nil
    end

    local cacheKey = spellID and ("id:" .. spellID) or ("n:" .. spellName)
    local cached = self.knownLocalCache and self.knownLocalCache[cacheKey]
    if cached ~= nil then
        return cached
    end

    local result = false

    if (self.knownSpellCount or 0) > 0 then
        if self.knownSpellsByName and self.knownSpellsByName[spellName] then
            result = true
        else
            local norm = normalizeSpellKey(spellName)
            if norm and self.knownSpellsByName and self.knownSpellsByName[norm] then
                result = true
            elseif self.knownSpellsByID and spellID and self.knownSpellsByID[spellID] then
                result = true
            end
        end
    else
        if IsSpellKnown and spellID and spellID > 0 then
            local ok, known = pcall(IsSpellKnown, spellID)
            if ok and known then
                result = true
            end
        end

        if not result and IsPlayerSpell and spellID and spellID > 0 then
            local ok, known = pcall(IsPlayerSpell, spellID)
            if ok and known then
                result = true
            end
        end

        if not result then
            -- If spellbook scan is unavailable on this core, use weak heuristics.
            local usable, noMana = IsUsableSpell(spellName)
            result = usable or noMana or false
        end
    end

    if self.knownLocalCache then
        self.knownLocalCache[cacheKey] = result and true or false
    end

    return result and true or false
end

function addon:SpellCooldownRemaining(spell)
    local spellName = self:GetSpellName(spell)
    if not spellName then
        return math.huge
    end

    local start, duration, enabled = GetSpellCooldown(spellName)
    if not start or not duration or enabled == 0 then
        return math.huge
    end
    if start == 0 then
        return 0
    end

    return max(0, (start + duration) - GetTime())
end

function addon:GCDRemaining()
    local start, duration = GetSpellCooldown(61304) -- global cooldown spell
    if not start or not duration or start == 0 then
        return 0
    end
    return max(0, (start + duration) - GetTime())
end

function addon:IsSpellUsable(spell, skipKnownCheck)
    local spellName = self:GetSpellName(spell)
    if not spellName then
        return false
    end
    if not skipKnownCheck and not self:IsSpellKnownLocal(spell) then
        return false
    end
    local usable, noMana = IsUsableSpell(spellName)
    return usable == true or usable == 1 or noMana == true or noMana == 1
end

function addon:IsSpellInRange(spell, unit)
    unit = unit or "target"
    local spellName = self:GetSpellName(spell)
    if not spellName then
        return false
    end
    if not UnitExists(unit) then
        return false
    end
    local inRange = IsSpellInRange(spellName, unit)
    if inRange == nil then
        -- If the spell is known to have range but API cannot evaluate it,
        -- prefer "out of range" to avoid false positive suggestions.
        if type(SpellHasRange) == "function" then
            local ok, hasRange = pcall(SpellHasRange, spellName)
            if (not ok or hasRange == nil) and BOOKTYPE_SPELL_SAFE then
                ok, hasRange = pcall(SpellHasRange, spellName, BOOKTYPE_SPELL_SAFE)
            end
            if ok and (hasRange == 1 or hasRange == true) then
                return false
            end
        end
        return true
    end
    return inRange == 1
end

local function auraRemaining(duration, expirationTime)
    if expirationTime and expirationTime > 0 then
        return max(0, expirationTime - GetTime())
    end
    if duration and duration > 0 then
        return duration
    end
    -- Some 3.3.5/private cores do not expose duration/expiration for target auras.
    -- If the aura exists but has no timer data, treat it as active.
    return 9999
end

local function isMine(caster)
    return caster == "player" or caster == "pet" or caster == "vehicle"
end

function addon:FindAura(unit, spell, helpful, mineOnly)
    local auraFunc = helpful and UnitBuff or UnitDebuff
    local spellName = self:GetSpellName(spell)
    if not spellName then
        return false, 0, 0
    end
    local spellKey = normalizeSpellKey(spellName)

    local cache = self.auraQueryCache
    local cacheKey
    if cache then
        cacheKey = tostring(unit) .. "\31" .. spellName .. "\31" .. (helpful and "1" or "0") .. "\31" .. (mineOnly and "1" or "0")
        local cached = cache[cacheKey]
        if cached then
            return cached[1], cached[2], cached[3], cached[4]
        end
    end

    -- Fast path: query by aura name when supported.
    do
        local name, _, _, count, _, duration, expirationTime, caster = auraFunc(unit, spellName)
        if name == spellName then
            if not mineOnly or isMine(caster) then
                local remaining = auraRemaining(duration, expirationTime)
                if cache and cacheKey then
                    cache[cacheKey] = { true, remaining, count or 0, caster }
                end
                return true, remaining, count or 0, caster
            end
        end
    end

    local i = 1
    while true do
        local name, _, _, count, _, duration, expirationTime, caster = auraFunc(unit, i)
        if not name then
            break
        end

        local nameMatches = (name == spellName)
        if (not nameMatches) and spellKey then
            local auraKey = normalizeSpellKey(name)
            nameMatches = (auraKey == spellKey)
        end

        if nameMatches then
            if not mineOnly or isMine(caster) then
                local remaining = auraRemaining(duration, expirationTime)
                if cache and cacheKey then
                    cache[cacheKey] = { true, remaining, count or 0, caster }
                end
                return true, remaining, count or 0, caster
            end
        end

        i = i + 1
    end

    if cache and cacheKey then
        cache[cacheKey] = { false, 0, 0, nil }
    end
    return false, 0, 0
end

function addon:BuffRemaining(unit, spell, mineOnly)
    local found, remaining = self:FindAura(unit, spell, true, mineOnly)
    if not found then
        return 0
    end
    return remaining
end

function addon:DebuffRemaining(unit, spell, mineOnly)
    if mineOnly == nil then
        mineOnly = true
    end
    local found, remaining = self:FindAura(unit, spell, false, mineOnly)
    if not found then
        return 0
    end
    return remaining
end

function addon:CountRunes()
    local ready = {
        blood = 0,
        frost = 0,
        unholy = 0,
        death = 0,
    }

    if not GetRuneType or not GetRuneCooldown then
        return ready
    end

    for i = 1, 6 do
        local _, _, runeReady = GetRuneCooldown(i)
        if runeReady then
            local runeType = GetRuneType(i)
            if runeType == 1 then
                ready.blood = ready.blood + 1
            elseif runeType == 2 then
                ready.unholy = ready.unholy + 1
            elseif runeType == 3 then
                ready.frost = ready.frost + 1
            elseif runeType == 4 then
                ready.death = ready.death + 1
            end
        end
    end

    return ready
end

function addon:HasRuneCost(runes, cost)
    local death = runes.death or 0
    local kinds = { "blood", "frost", "unholy" }

    for _, kind in ipairs(kinds) do
        local need = safeNumber(cost[kind])
        local have = safeNumber(runes[kind])
        if have < need then
            death = death - (need - have)
            if death < 0 then
                return false
            end
        end
    end

    return true
end

function addon:GetActiveSpec()
    local classTag = select(2, UnitClass("player"))
    local bestTab, bestPoints = 1, -1

    local tabs = GetNumTalentTabs and GetNumTalentTabs() or 0
    for tab = 1, tabs do
        local _, _, points = GetTalentTabInfo(tab)
        points = points or 0
        if points > bestPoints then
            bestPoints = points
            bestTab = tab
        end
    end

    return classTag, bestTab, bestPoints
end

function addon:GetSpecKey()
    local classTag, tab = self:GetActiveSpec()
    if not classTag then
        return nil
    end
    return classTag .. ":" .. tostring(tab)
end

function addon:BuildState()
    local s = self.state
    local now = GetTime()
    local auraCache = self.auraQueryCache
    if auraCache then
        wipeTable(auraCache)
    else
        self.auraQueryCache = {}
    end

    local targetExists = UnitExists("target") and not UnitIsDead("target")
    local canAttack = targetExists and not not UnitCanAttack("player", "target")
    local playerClass = select(2, UnitClass("player"))
    local targetLevel = targetExists and (UnitLevel("target") or 0) or 0
    local targetClassification = targetExists and UnitClassification and UnitClassification("target") or "normal"
    local targetIsBoss = targetExists and (targetLevel == -1 or targetClassification == "worldboss")

    local hp = UnitHealth("player")
    local hpMax = UnitHealthMax("player")
    local targetHP = targetExists and UnitHealth("target") or 0
    local targetHPMax = targetExists and UnitHealthMax("target") or 1
    local castName, _, _, _, castStartMS, castEndMS = UnitCastingInfo and UnitCastingInfo("player")
    local channelName, _, _, _, channelStartMS, channelEndMS = UnitChannelInfo and UnitChannelInfo("player")

    local currentCastSpell = nil
    local castRemaining = 0
    local channeling = false
    if castName and castEndMS then
        currentCastSpell = castName
        castRemaining = max(0, (castEndMS / 1000) - now)
    elseif channelName and channelEndMS then
        currentCastSpell = channelName
        castRemaining = max(0, (channelEndMS / 1000) - now)
        channeling = true
    end

    s.time = now
    s.class = playerClass
    s.specKey = self:GetSpecKey()
    s.gcd = self:GCDRemaining()
    s.targetExists = targetExists
    s.targetAttackable = canAttack
    s.targetDead = targetExists and UnitIsDead("target") or false
    s.targetLevel = targetLevel
    s.targetClassification = targetClassification
    s.targetIsBoss = targetIsBoss
    s.currentCastSpell = currentCastSpell
    s.castRemaining = castRemaining
    s.channeling = channeling
    s.casting = (currentCastSpell ~= nil)
    s.playerHealth = hp
    s.playerHealthPct = hpMax > 0 and (hp / hpMax) * 100 or 100
    s.targetHealth = targetHP
    s.targetHealthPct = targetHPMax > 0 and (targetHP / targetHPMax) * 100 or 100
    s.comboPoints = GetComboPoints and GetComboPoints("player", "target") or 0
    s.moving = (GetUnitSpeed and GetUnitSpeed("player") or 0) > 0
    s.inCombat = (InCombatLockdown and InCombatLockdown()) or (UnitAffectingCombat and UnitAffectingCombat("player")) or false
    s.combatTime = s.inCombat and max(0, now - (self.combatStartTime or now)) or 0
    s.enemyCount = self:CountEnemies(ENEMY_TRACK_WINDOW)
    s.enemyDirectCount = self.enemyDirectCount or s.enemyCount
    local cleaveThreshold = (self.db and self.db.cleaveThreshold) or defaults.cleaveThreshold
    local aoeThreshold = (self.db and self.db.aoeThreshold) or defaults.aoeThreshold
    if aoeThreshold < cleaveThreshold then
        aoeThreshold = cleaveThreshold
    end
    s.cleave = s.enemyCount >= cleaveThreshold and s.enemyCount < aoeThreshold
    s.aoe = s.enemyCount >= aoeThreshold

    s.mana = UnitPowerSafe("player", 0)
    s.manaMax = UnitPowerMaxSafe("player", 0)
    s.manaPct = s.manaMax > 0 and (s.mana / s.manaMax) * 100 or 0
    s.rage = UnitPowerSafe("player", 1)
    s.focus = UnitPowerSafe("player", 2)
    s.energy = UnitPowerSafe("player", 3)
    s.runicPower = UnitPowerSafe("player", 6)
    s.runes = self:CountRunes()

    return s
end

function addon:RecommendQueue()
    local state = self:BuildState()
    return self:GetPriorityQueue(state)
end

function addon:ApplySetting(name, value)
    if name == "scale" then
        self.db.scale = clamp(value, 0.5, 2)
    elseif name == "alpha" then
        self.db.alpha = clamp(value, 0.2, 1)
    elseif name == "iconSize" then
        self.db.iconSize = floor(clamp(value, 30, 96))
    elseif name == "spacing" then
        self.db.spacing = floor(clamp(value, 0, 20))
    elseif name == "queueLength" then
        self.db.queueLength = floor(clamp(value, 1, 3))
    elseif name == "cleaveThreshold" then
        self.db.cleaveThreshold = floor(clamp(value, 1, 10))
        if (self.db.aoeThreshold or defaults.aoeThreshold) < self.db.cleaveThreshold then
            self.db.aoeThreshold = self.db.cleaveThreshold
        end
    elseif name == "aoeThreshold" then
        local minAoe = self.db.cleaveThreshold or defaults.cleaveThreshold
        self.db.aoeThreshold = floor(clamp(value, minAoe, 10))
    elseif name == "cooldownSync" then
        self.db.cooldownSync = not not value
    elseif name == "cooldownWindow" then
        self.db.cooldownWindow = not not value
    end

    if self.RefreshLayout then
        if InCombatLockdown and InCombatLockdown() then
            self.pendingRefreshLayout = true
        else
            self:RefreshLayout()
            self.pendingRefreshLayout = nil
        end
    end
end

function addon:ResetPosition()
    self.db.point = defaults.point
    self.db.relPoint = defaults.relPoint
    self.db.x = defaults.x
    self.db.y = defaults.y

    if self.ApplyPosition then
        if InCombatLockdown and InCombatLockdown() then
            self.pendingApplyPosition = true
        else
            self:ApplyPosition()
            self.pendingApplyPosition = nil
        end
    end
end

function addon:Print(msg)
    DEFAULT_CHAT_FRAME:AddMessage("|cFF88CCFFHikili|r: " .. tostring(msg))
end

local eventFrame = CreateFrame("Frame")
eventFrame:RegisterEvent("ADDON_LOADED")
eventFrame:RegisterEvent("PLAYER_LOGIN")
eventFrame:RegisterEvent("SPELLS_CHANGED")
eventFrame:RegisterEvent("LEARNED_SPELL_IN_TAB")
eventFrame:RegisterEvent("GLYPH_ADDED")
eventFrame:RegisterEvent("GLYPH_REMOVED")
eventFrame:RegisterEvent("GLYPH_UPDATED")
eventFrame:RegisterEvent("PLAYER_TALENT_UPDATE")
eventFrame:RegisterEvent("CHARACTER_POINTS_CHANGED")
eventFrame:RegisterEvent("ACTIVE_TALENT_GROUP_CHANGED")
eventFrame:RegisterEvent("COMBAT_LOG_EVENT_UNFILTERED")
eventFrame:RegisterEvent("PLAYER_REGEN_DISABLED")
eventFrame:RegisterEvent("PLAYER_REGEN_ENABLED")
eventFrame:RegisterEvent("PLAYER_ENTERING_WORLD")
eventFrame:RegisterEvent("PLAYER_TARGET_CHANGED")
eventFrame:RegisterEvent("UNIT_PET")
eventFrame:SetScript("OnUpdate", function()
    if not addon.pendingSpellDataRefresh then
        return
    end
    addon:RefreshSpellData(false)
end)

eventFrame:SetScript("OnEvent", function(_, event, ...)
    if event == "ADDON_LOADED" then
        local loadedName = ...
        if loadedName ~= addonName then
            return
        end

        HikiliDB = HikiliDB or {}
        local oldVersion = HikiliDB.dbVersion or 0
        copyDefaults(HikiliDB, defaults)

        if oldVersion < 2 then
            if HikiliDB.queueLength == nil or tonumber(HikiliDB.queueLength) == 3 then
                HikiliDB.queueLength = 1
            end
            HikiliDB.dbVersion = 2
        end

        if oldVersion < 3 then
            if HikiliDB.aoeThreshold == nil then
                HikiliDB.aoeThreshold = defaults.aoeThreshold
            end
            HikiliDB.dbVersion = 3
        end

        if oldVersion < 4 then
            if HikiliDB.cooldownSync == nil then
                HikiliDB.cooldownSync = defaults.cooldownSync
            end
            HikiliDB.dbVersion = 4
        end

        if oldVersion < 5 then
            if HikiliDB.cleaveThreshold == nil then
                HikiliDB.cleaveThreshold = defaults.cleaveThreshold
            end
            HikiliDB.dbVersion = 5
        end

        HikiliDB.queueLength = floor(clamp(tonumber(HikiliDB.queueLength) or 1, 1, 3))
        HikiliDB.cleaveThreshold = floor(clamp(tonumber(HikiliDB.cleaveThreshold) or defaults.cleaveThreshold, 1, 10))
        HikiliDB.aoeThreshold = floor(clamp(tonumber(HikiliDB.aoeThreshold) or defaults.aoeThreshold, HikiliDB.cleaveThreshold, 10))
        HikiliDB.cooldownSync = not not HikiliDB.cooldownSync
        HikiliDB.cooldownWindow = HikiliDB.cooldownWindow ~= false
        HikiliDB.scale = clamp(tonumber(HikiliDB.scale) or 1, 0.5, 2)
        HikiliDB.alpha = clamp(tonumber(HikiliDB.alpha) or 1, 0.2, 1)
        HikiliDB.iconSize = floor(clamp(tonumber(HikiliDB.iconSize) or 52, 30, 96))
        HikiliDB.spacing = floor(clamp(tonumber(HikiliDB.spacing) or 6, 0, 20))

        addon.db = HikiliDB
    elseif event == "PLAYER_LOGIN" then
        addon.combatStartTime = nil
        addon:UpdateUnitGuids()
        addon:ResetEnemyTracker()
        addon:RefreshSpellData(true)
        addon:InitializeUI()
        addon:Print("Loaded for WoTLK 3.3.5a.")
    elseif event == "PLAYER_TARGET_CHANGED" then
        if UnitExists("target") and UnitCanAttack("player", "target") and not UnitIsDead("target") then
            addon:TrackEnemyGUID(UnitGUID("target"))
        end
    elseif event == "PLAYER_ENTERING_WORLD" then
        addon.combatStartTime = nil
        addon:UpdateUnitGuids()
        addon:ResetEnemyTracker()
    elseif event == "UNIT_PET" then
        local unit = ...
        if unit == "player" then
            addon:UpdateUnitGuids()
        end
    elseif event == "PLAYER_REGEN_DISABLED" then
        addon.combatStartTime = GetTime()
    elseif event == "PLAYER_REGEN_ENABLED" then
        addon.combatStartTime = nil
        addon:ResetEnemyTracker()
        if addon.pendingApplyPosition and addon.ApplyPosition then
            addon:ApplyPosition()
            addon.pendingApplyPosition = nil
        end
        if addon.pendingRefreshLayout and addon.RefreshLayout then
            addon:RefreshLayout()
            addon.pendingRefreshLayout = nil
        end
        if addon.ApplyDeferredUI then
            addon:ApplyDeferredUI()
        end
    elseif event == "COMBAT_LOG_EVENT_UNFILTERED" then
        addon:HandleCombatLogEvent(...)
    elseif event == "SPELLS_CHANGED" or event == "LEARNED_SPELL_IN_TAB" or event == "GLYPH_ADDED" or event == "GLYPH_REMOVED" or event == "GLYPH_UPDATED" or event == "PLAYER_TALENT_UPDATE" or event == "CHARACTER_POINTS_CHANGED" or event == "ACTIVE_TALENT_GROUP_CHANGED" then
        addon:RefreshSpellData(false)
    end
end)
