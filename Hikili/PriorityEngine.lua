local addonName, addon = ...

if type(addon) ~= "table" then
    addon = _G[addonName] or {}
end
_G[addonName] = addon

addon.Priorities = addon.Priorities or {}
addon.AoePriorities = addon.AoePriorities or {}
addon.CleavePriorities = addon.CleavePriorities or {}
addon.CooldownPriorities = addon.CooldownPriorities or {}

local OPT_REQUIRE_TARGET = { requireTarget = true }
local OPT_SYNC_COOLDOWN = { syncCooldown = true }
local OPT_SYNC_TARGET = { syncCooldown = true, requireTarget = true }
local castTimeCache = {}
local hasTarget

local RAID_BURST_BUFFS = {
    "Bloodlust",
    "Heroism",
    "Power Infusion",
    "Tricks of the Trade",
    "Hysteria",
}

local SYNCED_COOLDOWNS = {
    ["Berserk"] = true,
    ["Starfall"] = true,
    ["Bestial Wrath"] = true,
    ["Rapid Fire"] = true,
    ["Killing Spree"] = true,
    ["Adrenaline Rush"] = true,
    ["Shadow Dance"] = true,
    ["Feral Spirit"] = true,
    ["Metamorphosis"] = true,
    ["Bladestorm"] = true,
}

local MELEE_AUTO_ATTACK_CLASSES = {
    DEATHKNIGHT = true,
    DRUID = true,
    PALADIN = true,
    ROGUE = true,
    SHAMAN = true,
    WARRIOR = true,
}

local RAID_UTILITY_CURSES = {
    "Curse of Elements",
    "Curse of Weakness",
    "Curse of Tongues",
}

local function isMineCaster(caster)
    return caster == "player" or caster == "pet" or caster == "vehicle"
end

local function debuffAny(state, spell)
    if not hasTarget(state) then
        return 0, nil
    end
    local found, remains, _, caster = addon:FindAura("target", spell, false, false)
    if not found then
        return 0, nil
    end
    return remains or 0, caster
end

local function needsRaidDebuff(state, spell, threshold)
    local remains = debuffAny(state, spell)
    return remains < (threshold or 0)
end

local FERAL_BLEED_VULN_DEBUFFS = {
    "Mangle",
    "Mangle (Cat)",
    "Mangle (Bear)",
    "Trauma",
}

local function maxDebuffAny(state, spells)
    local best = 0
    for i = 1, #spells do
        local remains = debuffAny(state, spells[i])
        if remains > best then
            best = remains
        end
    end
    return best
end

local function feralBleedVulnerabilityRemaining(state)
    return maxDebuffAny(state, FERAL_BLEED_VULN_DEBUFFS)
end

local function hasUtilityCurseFromOthers(state)
    for _, curse in ipairs(RAID_UTILITY_CURSES) do
        local remains, caster = debuffAny(state, curse)
        if remains > 2 and caster and not isMineCaster(caster) then
            return true
        end
    end
    return false
end

local function getSpellCastTimeMS(spell)
    local spellName = addon:GetSpellName(spell)
    if not spellName then
        return 0
    end
    local cached = castTimeCache[spellName]
    if cached ~= nil then
        return cached
    end
    local _, _, _, castMS = GetSpellInfo(spellName)
    castMS = tonumber(castMS) or 0
    castTimeCache[spellName] = castMS
    return castMS
end

local function hasRaidBurstBuff()
    for _, aura in ipairs(RAID_BURST_BUFFS) do
        if addon:BuffRemaining("player", aura) > 0 then
            return true
        end
    end
    return false
end

local function isSpellMovableByProc(state, spell)
    if spell == "Pyroblast" and addon:BuffRemaining("player", "Hot Streak") > 0 then
        return true
    end
    if spell == "Frostfire Bolt" and addon:BuffRemaining("player", "Brain Freeze") > 0 then
        return true
    end
    if spell == "Slam" and addon:BuffRemaining("player", "Slam!") > 0 then
        return true
    end
    return false
end

local function shouldUseSyncedCooldown(state, spell)
    if not SYNCED_COOLDOWNS[spell] then
        return true
    end
    if addon.db and addon.db.cooldownSync == false then
        return true
    end
    if not state.inCombat then
        return false
    end

    local burstNow = hasRaidBurstBuff()
    if burstNow then
        return true
    end

    if state.targetIsBoss then
        if (state.combatTime or 0) >= 8 then
            return true
        end
        if state.targetHealthPct <= 35 then
            return true
        end
        return false
    end

    local aoeThreshold = (addon.db and addon.db.aoeThreshold) or 3
    if (state.enemyCount or 0) >= (aoeThreshold + 1) then
        return true
    end
    if (state.combatTime or 0) >= 5 and state.targetHealthPct >= 80 then
        return true
    end
    if state.targetHealthPct <= 30 then
        return true
    end
    return false
end

hasTarget = function(state)
    return state.targetExists and state.targetAttackable and not state.targetDead
end

local function canCast(state, spell, opts)
    opts = opts or {}

    if not addon:GetSpellName(spell) then
        return false
    end
    if addon.IsSpellKnownLocal and not addon:IsSpellKnownLocal(spell) then
        return false
    end
    if state.moving and not opts.allowWhileMoving and not opts.ignoreMovement then
        local castMS = getSpellCastTimeMS(spell)
        if castMS > 0 and not isSpellMovableByProc(state, spell) then
            return false
        end
    end
    if opts.requireTarget and not hasTarget(state) then
        return false
    end
    if opts.syncCooldown and not shouldUseSyncedCooldown(state, spell) then
        return false
    end
    if not opts.skipUsable and not addon:IsSpellUsable(spell, true) then
        return false
    end
    if opts.requireTarget and not opts.skipRange and not addon:IsSpellInRange(spell, "target") then
        return false
    end

    local cd = addon:SpellCooldownRemaining(spell)
    if cd > (state.gcd + (opts.cooldownLeeway or 0.1)) then
        return false
    end

    return true
end

local function push(queue, used, spell, skipKnownCheck)
    if not spell or used[spell] then
        return
    end
    if not skipKnownCheck and addon.IsSpellKnownLocal and not addon:IsSpellKnownLocal(spell) then
        return
    end
    used[spell] = true
    queue[#queue + 1] = spell
end

local function pushIf(queue, used, state, spell, opts)
    if canCast(state, spell, opts) then
        push(queue, used, spell, true)
    end
end

local function pushCooldownIf(queue, used, state, spell, opts)
    if opts then
        if opts.syncCooldown then
            pushIf(queue, used, state, spell, opts)
            return
        end
        local copy = opts._withSyncCooldown
        if not copy then
            copy = {}
            for k, v in pairs(opts) do
                copy[k] = v
            end
            copy.syncCooldown = true
            opts._withSyncCooldown = copy
        end
        pushIf(queue, used, state, spell, copy)
    else
        pushIf(queue, used, state, spell, OPT_SYNC_COOLDOWN)
    end
end

local function makeQueue()
    return {}, {}
end

local function buff(spell)
    return addon:BuffRemaining("player", spell)
end

local function debuff(state, spell)
    if not hasTarget(state) then
        return 0
    end
    return addon:DebuffRemaining("target", spell)
end

local function choosePaladinJudgement(state)
    local list = { "Judgement of Wisdom", "Judgement of Light", "Judgement of Justice" }
    for _, spell in ipairs(list) do
        if canCast(state, spell, { requireTarget = true }) then
            return spell
        end
    end
    return nil
end

local function choosePaladinSeal(state, preferWisdom)
    if buff("Seal of Wisdom") > 0 or buff("Seal of Vengeance") > 0 or buff("Seal of Command") > 0 then
        return nil
    end

    if preferWisdom and canCast(state, "Seal of Wisdom") then
        return "Seal of Wisdom"
    end
    if canCast(state, "Seal of Vengeance") then
        return "Seal of Vengeance"
    end
    if canCast(state, "Seal of Command") then
        return "Seal of Command"
    end
    if canCast(state, "Seal of Wisdom") then
        return "Seal of Wisdom"
    end
    return nil
end

local function chooseWarlockCurse(state)
    if not hasTarget(state) then
        return nil
    end
    local doom = debuff(state, "Curse of Doom")
    local agony = debuff(state, "Curse of Agony")
    local doomAny, doomCaster = debuffAny(state, "Curse of Doom")
    local agonyAny, agonyCaster = debuffAny(state, "Curse of Agony")
    local targetLevel = UnitLevel("target")
    local classification = UnitClassification and UnitClassification("target")
    local isBoss = (targetLevel == -1) or (classification == "worldboss")
    if hasUtilityCurseFromOthers(state) then
        return nil
    end

    if isBoss then
        local doomKnown = (not addon.IsSpellKnownLocal) or addon:IsSpellKnownLocal("Curse of Doom")
        -- On bosses, prefer Doom and do not overwrite it with Agony while it should be active.
        if doomKnown and state.targetHealthPct > 25 then
            if doom < 5 and (doomAny < 5 or isMineCaster(doomCaster)) and canCast(state, "Curse of Doom", { requireTarget = true }) then
                return "Curse of Doom"
            end
            return nil
        end

        if agony < 3 and (agonyAny < 3 or isMineCaster(agonyCaster)) and canCast(state, "Curse of Agony", { requireTarget = true }) then
            return "Curse of Agony"
        end
        return nil
    end

    if agony < 3 and (agonyAny < 3 or isMineCaster(agonyCaster)) and canCast(state, "Curse of Agony", { requireTarget = true }) then
        return "Curse of Agony"
    end
    return nil
end

local function shouldLifeTapForGlyph(state)
    if not addon.HasGlyphLike or not addon:HasGlyphLike("life tap") then
        return false
    end

    local lifeTapBuff = buff("Life Tap")
    if lifeTapBuff >= 8 then
        return false
    end

    if not state.inCombat then
        return state.playerHealthPct > 45
    end

    -- During combat, keep uptime without over-tapping at very low health.
    return state.playerHealthPct > 55 and state.manaPct <= 75
end

local function pushWarlockLifeTap(queue, used, state)
    if shouldLifeTapForGlyph(state) then
        -- Some 3.3.5 cores report Life Tap as unusable at full mana; keep glyph upkeep priority.
        if canCast(state, "Life Tap", { skipUsable = true }) then
            push(queue, used, "Life Tap")
        end
        return
    end

    if state.manaPct <= 35 then
        pushIf(queue, used, state, "Life Tap")
    end
end

local function pushWarlockMovementFallback(queue, used, state)
    if not state.moving or not hasTarget(state) then
        return
    end

    local curse = chooseWarlockCurse(state)
    if curse then
        push(queue, used, curse)
    end
    -- Allow earlier Corruption refresh while moving to avoid dead GCD windows.
    if debuff(state, "Corruption") < 12 then
        pushIf(queue, used, state, "Corruption", { requireTarget = true, skipRange = true })
    end

    if state.targetHealthPct <= 20 then
        pushIf(queue, used, state, "Shadowburn", { requireTarget = true, skipRange = true })
        pushIf(queue, used, state, "Death Coil", { requireTarget = true, skipRange = true })
    end

    if #queue == 0 then
        pushWarlockLifeTap(queue, used, state)
    end
    if #queue == 0 then
        -- If no instant action is available while moving, suggest the best
        -- standstill filler so the player can "plant and cast".
        pushIf(queue, used, state, "Shadow Bolt", { requireTarget = true, ignoreMovement = true, skipRange = true })
    end
end

local function ensureHunterAspect(state, queue, used)
    if buff("Aspect of the Dragonhawk") < 60 then
        pushIf(queue, used, state, "Aspect of the Dragonhawk")
    end
end

local function aoePush(queue, used, state, entry)
    if type(entry) == "string" then
        if SYNCED_COOLDOWNS[entry] then
            pushCooldownIf(queue, used, state, entry, OPT_SYNC_TARGET)
        else
            pushIf(queue, used, state, entry, OPT_REQUIRE_TARGET)
        end
        return
    end

    if type(entry) ~= "table" or not entry.spell then
        return
    end
    if entry.when and not entry.when(state) then
        return
    end

    local opts = entry.opts
    if not opts then
        opts = OPT_REQUIRE_TARGET
    elseif opts.requireTarget == nil then
        local copy = entry._optsWithTarget
        if not copy then
            copy = {}
            for k, v in pairs(opts) do
                copy[k] = v
            end
            copy.requireTarget = true
            entry._optsWithTarget = copy
        end
        opts = copy
    end

    if entry.syncCooldown or SYNCED_COOLDOWNS[entry.spell] then
        pushCooldownIf(queue, used, state, entry.spell, opts)
    else
        pushIf(queue, used, state, entry.spell, opts)
    end
end

local function makeAoeHandler(entries, pre)
    return function(state, queueLength)
        local queue, used = makeQueue()

        if pre then
            pre(state, queue, used)
        end
        if not hasTarget(state) then
            return queue, queueLength
        end

        for _, entry in ipairs(entries) do
            aoePush(queue, used, state, entry)
        end

        return queue, queueLength
    end
end

local function preDeathKnightAoe(state, queue, used)
    if buff("Horn of Winter") < 6 then
        pushIf(queue, used, state, "Horn of Winter")
    end
end

local function preHunterAoe(state, queue, used)
    ensureHunterAspect(state, queue, used)
end

local function preWarlockAoe(state, queue, used)
    pushWarlockLifeTap(queue, used, state)

    if buff("Fel Armor") < 60 then
        pushIf(queue, used, state, "Fel Armor")
    end

    local curse = chooseWarlockCurse(state)
    if curse then
        push(queue, used, curse)
    end
end

local function cooldownPush(queue, used, state, entry)
    if type(entry) == "string" then
        pushCooldownIf(queue, used, state, entry)
        return
    end
    if type(entry) ~= "table" or not entry.spell then
        return
    end
    if entry.when and not entry.when(state) then
        return
    end

    local opts = entry.opts
    if entry.syncCooldown == false then
        pushIf(queue, used, state, entry.spell, opts)
    else
        pushCooldownIf(queue, used, state, entry.spell, opts)
    end
end

local function shouldUseMajorCooldown(state)
    if not state.inCombat then
        return false
    end

    local combatTime = state.combatTime or 0
    if state.targetIsBoss then
        return combatTime >= 4 or state.targetHealthPct <= 35
    end

    local enemyCount = state.enemyCount or 0
    local cleaveThreshold = (addon.db and addon.db.cleaveThreshold) or 2
    if enemyCount >= cleaveThreshold then
        return true
    end
    if state.targetHealthPct <= 30 then
        return true
    end
    return combatTime >= 8
end

local function healthBelow(state, pct)
    return (state.playerHealthPct or 100) <= pct
end

local function manaBelow(state, pct)
    return (state.manaPct or 100) <= pct
end

local function energyBelow(state, value)
    return (state.energy or 0) <= value
end

local function enemyCountAtLeast(state, value)
    return (state.enemyCount or 0) >= value
end

addon.CooldownPriorities["DEATHKNIGHT:1"] = {
    { spell = "Dancing Rune Weapon", syncCooldown = false, when = shouldUseMajorCooldown },
    { spell = "Empower Rune Weapon", syncCooldown = false, when = function(state) return shouldUseMajorCooldown(state) and (state.runicPower or 0) <= 80 end },
}

addon.CooldownPriorities["DEATHKNIGHT:2"] = {
    { spell = "Unbreakable Armor", syncCooldown = false, when = shouldUseMajorCooldown },
    { spell = "Empower Rune Weapon", syncCooldown = false, when = function(state) return shouldUseMajorCooldown(state) and (state.runicPower or 0) <= 70 end },
}

addon.CooldownPriorities["DEATHKNIGHT:3"] = {
    { spell = "Summon Gargoyle", syncCooldown = false, when = shouldUseMajorCooldown },
    { spell = "Empower Rune Weapon", syncCooldown = false, when = function(state) return shouldUseMajorCooldown(state) and (state.runicPower or 0) <= 75 end },
}

addon.CooldownPriorities["DRUID:1"] = {
    { spell = "Starfall", syncCooldown = false, when = shouldUseMajorCooldown },
    { spell = "Force of Nature", syncCooldown = false, when = shouldUseMajorCooldown },
}

addon.CooldownPriorities["DRUID:2"] = {
    { spell = "Berserk", syncCooldown = false, when = shouldUseMajorCooldown },
    { spell = "Tiger's Fury", syncCooldown = false, when = function(state) return energyBelow(state, 45) end },
}

addon.CooldownPriorities["DRUID:3"] = {
    { spell = "Nature's Swiftness", syncCooldown = false, when = function(state) return healthBelow(state, 60) end },
    { spell = "Barkskin", syncCooldown = false, when = function(state) return healthBelow(state, 50) end },
}

addon.CooldownPriorities["HUNTER:1"] = {
    { spell = "Bestial Wrath", syncCooldown = false, when = shouldUseMajorCooldown },
    { spell = "Rapid Fire", syncCooldown = false, when = shouldUseMajorCooldown },
    { spell = "Readiness", syncCooldown = false, when = function(state) return (state.combatTime or 0) >= 25 end },
}

addon.CooldownPriorities["HUNTER:2"] = {
    { spell = "Rapid Fire", syncCooldown = false, when = shouldUseMajorCooldown },
    { spell = "Readiness", syncCooldown = false, when = function(state) return (state.combatTime or 0) >= 25 end },
}

addon.CooldownPriorities["HUNTER:3"] = {
    { spell = "Rapid Fire", syncCooldown = false, when = shouldUseMajorCooldown },
    { spell = "Readiness", syncCooldown = false, when = function(state) return (state.combatTime or 0) >= 25 end },
}

addon.CooldownPriorities["MAGE:1"] = {
    { spell = "Arcane Power", syncCooldown = false, when = function(state) return shouldUseMajorCooldown(state) and not manaBelow(state, 35) end },
    { spell = "Presence of Mind", syncCooldown = false, when = shouldUseMajorCooldown },
    { spell = "Mirror Image", syncCooldown = false, when = shouldUseMajorCooldown },
}

addon.CooldownPriorities["MAGE:2"] = {
    { spell = "Combustion", syncCooldown = false, when = shouldUseMajorCooldown },
    { spell = "Mirror Image", syncCooldown = false, when = shouldUseMajorCooldown },
}

addon.CooldownPriorities["MAGE:3"] = {
    { spell = "Icy Veins", syncCooldown = false, when = shouldUseMajorCooldown },
    { spell = "Mirror Image", syncCooldown = false, when = shouldUseMajorCooldown },
    { spell = "Cold Snap", syncCooldown = false, when = function(state) return shouldUseMajorCooldown(state) and addon:SpellCooldownRemaining("Icy Veins") > 20 end },
}

addon.CooldownPriorities["PALADIN:1"] = {
    { spell = "Avenging Wrath", syncCooldown = false, when = shouldUseMajorCooldown },
    { spell = "Divine Favor", syncCooldown = false, when = shouldUseMajorCooldown },
    { spell = "Divine Plea", syncCooldown = false, when = function(state) return manaBelow(state, 70) end },
}

addon.CooldownPriorities["PALADIN:2"] = {
    { spell = "Avenging Wrath", syncCooldown = false, when = shouldUseMajorCooldown },
    { spell = "Divine Plea", syncCooldown = false, when = function(state) return manaBelow(state, 75) end },
    { spell = "Divine Protection", syncCooldown = false, when = function(state) return healthBelow(state, 45) end },
}

addon.CooldownPriorities["PALADIN:3"] = {
    { spell = "Avenging Wrath", syncCooldown = false, when = shouldUseMajorCooldown },
    { spell = "Divine Plea", syncCooldown = false, when = function(state) return manaBelow(state, 70) end },
}

addon.CooldownPriorities["PRIEST:1"] = {
    { spell = "Power Infusion", syncCooldown = false, when = shouldUseMajorCooldown },
    { spell = "Shadowfiend", syncCooldown = false, when = function(state) return manaBelow(state, 70) end },
    { spell = "Pain Suppression", syncCooldown = false, when = function(state) return healthBelow(state, 45) end },
}

addon.CooldownPriorities["PRIEST:2"] = {
    { spell = "Shadowfiend", syncCooldown = false, when = function(state) return manaBelow(state, 70) end },
    { spell = "Inner Focus", syncCooldown = false, when = function(state) return manaBelow(state, 80) end },
    { spell = "Divine Hymn", syncCooldown = false, when = function(state) return healthBelow(state, 35) end },
}

addon.CooldownPriorities["PRIEST:3"] = {
    { spell = "Shadowfiend", syncCooldown = false, when = function(state) return manaBelow(state, 65) end },
    { spell = "Dispersion", syncCooldown = false, when = function(state) return manaBelow(state, 30) or healthBelow(state, 35) end },
}

addon.CooldownPriorities["ROGUE:1"] = {
    { spell = "Cold Blood", syncCooldown = false, when = shouldUseMajorCooldown },
}

addon.CooldownPriorities["ROGUE:2"] = {
    { spell = "Killing Spree", syncCooldown = false, when = shouldUseMajorCooldown },
    { spell = "Adrenaline Rush", syncCooldown = false, when = function(state) return shouldUseMajorCooldown(state) and energyBelow(state, 60) end },
    { spell = "Blade Flurry", syncCooldown = false, when = function(state) return enemyCountAtLeast(state, 2) end },
}

addon.CooldownPriorities["ROGUE:3"] = {
    { spell = "Shadow Dance", syncCooldown = false, when = shouldUseMajorCooldown },
    { spell = "Preparation", syncCooldown = false, when = function(state) return (state.combatTime or 0) >= 30 end },
}

addon.CooldownPriorities["SHAMAN:1"] = {
    { spell = "Elemental Mastery", syncCooldown = false, when = shouldUseMajorCooldown },
    { spell = "Fire Elemental Totem", syncCooldown = false, when = shouldUseMajorCooldown },
}

addon.CooldownPriorities["SHAMAN:2"] = {
    { spell = "Feral Spirit", syncCooldown = false, when = shouldUseMajorCooldown },
    { spell = "Fire Elemental Totem", syncCooldown = false, when = function(state) return shouldUseMajorCooldown(state) and enemyCountAtLeast(state, 2) end },
}

addon.CooldownPriorities["SHAMAN:3"] = {
    { spell = "Mana Tide Totem", syncCooldown = false, when = function(state) return manaBelow(state, 70) end },
    { spell = "Nature's Swiftness", syncCooldown = false, when = function(state) return healthBelow(state, 60) end },
}

addon.CooldownPriorities["WARLOCK:1"] = {
    { spell = "Summon Infernal", syncCooldown = false, when = shouldUseMajorCooldown },
    { spell = "Death Coil", syncCooldown = false, when = function(state) return healthBelow(state, 60) end },
}

addon.CooldownPriorities["WARLOCK:2"] = {
    { spell = "Metamorphosis", syncCooldown = false, when = shouldUseMajorCooldown },
    { spell = "Summon Infernal", syncCooldown = false, when = function(state) return shouldUseMajorCooldown(state) and (state.combatTime or 0) >= 20 end },
}

addon.CooldownPriorities["WARLOCK:3"] = {
    { spell = "Summon Infernal", syncCooldown = false, when = shouldUseMajorCooldown },
    { spell = "Death Coil", syncCooldown = false, when = function(state) return healthBelow(state, 60) end },
}

addon.CooldownPriorities["WARRIOR:1"] = {
    { spell = "Bladestorm", syncCooldown = false, when = shouldUseMajorCooldown },
    { spell = "Recklessness", syncCooldown = false, when = shouldUseMajorCooldown },
    { spell = "Sweeping Strikes", syncCooldown = false, when = function(state) return enemyCountAtLeast(state, 2) end },
}

addon.CooldownPriorities["WARRIOR:2"] = {
    { spell = "Death Wish", syncCooldown = false, when = shouldUseMajorCooldown },
    { spell = "Recklessness", syncCooldown = false, when = shouldUseMajorCooldown },
}

addon.CooldownPriorities["WARRIOR:3"] = {
    { spell = "Shield Wall", syncCooldown = false, when = function(state) return healthBelow(state, 40) end },
    { spell = "Last Stand", syncCooldown = false, when = function(state) return healthBelow(state, 50) end },
    { spell = "Enraged Regeneration", syncCooldown = false, when = function(state) return healthBelow(state, 55) end },
}

addon.Priorities["DEATHKNIGHT:1"] = function(state, queueLength)
    local queue, used = makeQueue()

    if buff("Horn of Winter") < 6 then
        pushIf(queue, used, state, "Horn of Winter")
    end
    if not hasTarget(state) then
        return queue, queueLength
    end

    if debuff(state, "Frost Fever") < 3 then
        pushIf(queue, used, state, "Icy Touch", { requireTarget = true })
    end
    if debuff(state, "Blood Plague") < 3 then
        pushIf(queue, used, state, "Plague Strike", { requireTarget = true })
    end

    pushIf(queue, used, state, "Death Strike", { requireTarget = true })
    pushIf(queue, used, state, "Heart Strike", { requireTarget = true })

    if state.runicPower >= 40 then
        pushIf(queue, used, state, "Death Coil", { requireTarget = true })
    end

    pushIf(queue, used, state, "Blood Strike", { requireTarget = true })
    return queue, queueLength
end

addon.Priorities["DEATHKNIGHT:2"] = function(state, queueLength)
    local queue, used = makeQueue()

    if buff("Horn of Winter") < 6 then
        pushIf(queue, used, state, "Horn of Winter")
    end
    if not hasTarget(state) then
        return queue, queueLength
    end

    if debuff(state, "Frost Fever") < 3 then
        pushIf(queue, used, state, "Icy Touch", { requireTarget = true })
    end
    if debuff(state, "Blood Plague") < 3 then
        pushIf(queue, used, state, "Plague Strike", { requireTarget = true })
    end

    pushIf(queue, used, state, "Howling Blast", { requireTarget = true })
    pushIf(queue, used, state, "Obliterate", { requireTarget = true })

    if state.runicPower >= 40 then
        pushIf(queue, used, state, "Frost Strike", { requireTarget = true })
    end

    pushIf(queue, used, state, "Blood Strike", { requireTarget = true })
    return queue, queueLength
end

addon.Priorities["DEATHKNIGHT:3"] = function(state, queueLength)
    local queue, used = makeQueue()

    if buff("Horn of Winter") < 6 then
        pushIf(queue, used, state, "Horn of Winter")
    end
    if not hasTarget(state) then
        return queue, queueLength
    end

    if debuff(state, "Frost Fever") < 3 then
        pushIf(queue, used, state, "Icy Touch", { requireTarget = true })
    end
    if debuff(state, "Blood Plague") < 3 then
        pushIf(queue, used, state, "Plague Strike", { requireTarget = true })
    end

    pushIf(queue, used, state, "Scourge Strike", { requireTarget = true })
    pushIf(queue, used, state, "Blood Strike", { requireTarget = true })

    if state.runicPower >= 80 then
        pushIf(queue, used, state, "Death Coil", { requireTarget = true })
    end

    return queue, queueLength
end

addon.Priorities["DRUID:1"] = function(state, queueLength)
    local queue, used = makeQueue()
    if not hasTarget(state) then
        return queue, queueLength
    end

    if needsRaidDebuff(state, "Faerie Fire", 25) then
        pushIf(queue, used, state, "Faerie Fire", { requireTarget = true })
    end
    pushCooldownIf(queue, used, state, "Starfall")

    if debuff(state, "Moonfire") < 2 then
        pushIf(queue, used, state, "Moonfire", { requireTarget = true })
    end
    if debuff(state, "Insect Swarm") < 2 then
        pushIf(queue, used, state, "Insect Swarm", { requireTarget = true })
    end

    if state.moving then
        pushIf(queue, used, state, "Moonfire", { requireTarget = true })
    end

    pushIf(queue, used, state, "Starfire", { requireTarget = true })
    pushIf(queue, used, state, "Wrath", { requireTarget = true })
    return queue, queueLength
end

addon.Priorities["DRUID:2"] = function(state, queueLength)
    local queue, used = makeQueue()
    local cp = state.comboPoints or 0

    if state.energy <= 35 then
        pushIf(queue, used, state, "Tiger's Fury")
    end
    pushCooldownIf(queue, used, state, "Berserk")
    if not hasTarget(state) then
        return queue, queueLength
    end

    if needsRaidDebuff(state, "Faerie Fire", 3) then
        local ffOpts = { requireTarget = true }
        if canCast(state, "Faerie Fire (Feral)", ffOpts) then
            push(queue, used, "Faerie Fire (Feral)", true)
        else
            pushIf(queue, used, state, "Faerie Fire", ffOpts)
        end
    end
    if cp >= 1 and buff("Savage Roar") < 2 then
        pushIf(queue, used, state, "Savage Roar")
    end
    if buff("Clearcasting") > 0 then
        pushIf(queue, used, state, "Shred", { requireTarget = true })
    end
    if feralBleedVulnerabilityRemaining(state) < 8 then
        pushIf(queue, used, state, "Mangle (Cat)", { requireTarget = true })
    end
    if cp >= 5 and debuff(state, "Rip") < 1 then
        pushIf(queue, used, state, "Rip", { requireTarget = true })
    end
    if debuff(state, "Rake") < 1 then
        pushIf(queue, used, state, "Rake", { requireTarget = true })
    end
    if cp >= 5 and debuff(state, "Rip") > 8 and buff("Savage Roar") > 8 then
        pushIf(queue, used, state, "Ferocious Bite", { requireTarget = true })
    end

    pushIf(queue, used, state, "Shred", { requireTarget = true })
    pushIf(queue, used, state, "Mangle (Cat)", { requireTarget = true })
    return queue, queueLength
end

addon.Priorities["DRUID:3"] = function(state, queueLength)
    local queue, used = makeQueue()

    if state.playerHealthPct < 55 then
        pushIf(queue, used, state, "Rejuvenation")
    end
    if state.playerHealthPct < 40 then
        pushIf(queue, used, state, "Healing Touch")
    end
    if not hasTarget(state) then
        return queue, queueLength
    end

    if debuff(state, "Moonfire") < 2 then
        pushIf(queue, used, state, "Moonfire", { requireTarget = true })
    end
    if debuff(state, "Insect Swarm") < 2 then
        pushIf(queue, used, state, "Insect Swarm", { requireTarget = true })
    end

    pushIf(queue, used, state, "Wrath", { requireTarget = true })
    pushIf(queue, used, state, "Starfire", { requireTarget = true })
    return queue, queueLength
end
addon.Priorities["HUNTER:1"] = function(state, queueLength)
    local queue, used = makeQueue()

    ensureHunterAspect(state, queue, used)
    if not hasTarget(state) then
        return queue, queueLength
    end

    if needsRaidDebuff(state, "Hunter's Mark", 30) then
        pushIf(queue, used, state, "Hunter's Mark", { requireTarget = true })
    end
    if state.targetHealthPct <= 20 then
        pushIf(queue, used, state, "Kill Shot", { requireTarget = true })
    end
    if debuff(state, "Serpent Sting") < 3 then
        pushIf(queue, used, state, "Serpent Sting", { requireTarget = true })
    end

    pushCooldownIf(queue, used, state, "Bestial Wrath")
    pushIf(queue, used, state, "Kill Command", { requireTarget = true })
    pushIf(queue, used, state, "Arcane Shot", { requireTarget = true })
    pushIf(queue, used, state, "Steady Shot", { requireTarget = true })
    return queue, queueLength
end

addon.Priorities["HUNTER:2"] = function(state, queueLength)
    local queue, used = makeQueue()

    ensureHunterAspect(state, queue, used)
    if not hasTarget(state) then
        return queue, queueLength
    end

    if needsRaidDebuff(state, "Hunter's Mark", 30) then
        pushIf(queue, used, state, "Hunter's Mark", { requireTarget = true })
    end
    if state.targetHealthPct <= 20 then
        pushIf(queue, used, state, "Kill Shot", { requireTarget = true })
    end
    if debuff(state, "Serpent Sting") < 3 then
        pushIf(queue, used, state, "Serpent Sting", { requireTarget = true })
    end

    pushIf(queue, used, state, "Chimera Shot", { requireTarget = true })
    pushIf(queue, used, state, "Aimed Shot", { requireTarget = true })
    pushIf(queue, used, state, "Arcane Shot", { requireTarget = true })
    pushIf(queue, used, state, "Steady Shot", { requireTarget = true })
    return queue, queueLength
end

addon.Priorities["HUNTER:3"] = function(state, queueLength)
    local queue, used = makeQueue()

    ensureHunterAspect(state, queue, used)
    if not hasTarget(state) then
        return queue, queueLength
    end

    if needsRaidDebuff(state, "Hunter's Mark", 30) then
        pushIf(queue, used, state, "Hunter's Mark", { requireTarget = true })
    end
    if state.targetHealthPct <= 20 then
        pushIf(queue, used, state, "Kill Shot", { requireTarget = true })
    end
    if debuff(state, "Serpent Sting") < 3 then
        pushIf(queue, used, state, "Serpent Sting", { requireTarget = true })
    end

    pushIf(queue, used, state, "Explosive Shot", { requireTarget = true })
    pushIf(queue, used, state, "Black Arrow", { requireTarget = true })
    pushIf(queue, used, state, "Aimed Shot", { requireTarget = true })
    pushIf(queue, used, state, "Steady Shot", { requireTarget = true })
    pushIf(queue, used, state, "Arcane Shot", { requireTarget = true })
    return queue, queueLength
end

addon.Priorities["MAGE:1"] = function(state, queueLength)
    local queue, used = makeQueue()

    if state.manaPct <= 30 then
        pushIf(queue, used, state, "Evocation")
    end
    if not hasTarget(state) then
        return queue, queueLength
    end

    if state.moving then
        pushIf(queue, used, state, "Arcane Barrage", { requireTarget = true })
    end
    if buff("Missile Barrage") > 0 then
        pushIf(queue, used, state, "Arcane Missiles", { requireTarget = true })
    end

    pushIf(queue, used, state, "Arcane Blast", { requireTarget = true })
    pushIf(queue, used, state, "Arcane Missiles", { requireTarget = true })
    pushIf(queue, used, state, "Arcane Barrage", { requireTarget = true })
    return queue, queueLength
end

addon.Priorities["MAGE:2"] = function(state, queueLength)
    local queue, used = makeQueue()

    if state.manaPct <= 30 then
        pushIf(queue, used, state, "Evocation")
    end
    if not hasTarget(state) then
        return queue, queueLength
    end

    if buff("Hot Streak") > 0 then
        pushIf(queue, used, state, "Pyroblast", { requireTarget = true })
    end
    if debuff(state, "Living Bomb") < 2 then
        pushIf(queue, used, state, "Living Bomb", { requireTarget = true })
    end
    if state.moving then
        pushIf(queue, used, state, "Scorch", { requireTarget = true })
    end
    if buff("Clearcasting") > 0 then
        pushIf(queue, used, state, "Pyroblast", { requireTarget = true })
    end

    pushIf(queue, used, state, "Fireball", { requireTarget = true })
    pushIf(queue, used, state, "Scorch", { requireTarget = true })
    return queue, queueLength
end

addon.Priorities["MAGE:3"] = function(state, queueLength)
    local queue, used = makeQueue()

    if state.manaPct <= 30 then
        pushIf(queue, used, state, "Evocation")
    end
    if not hasTarget(state) then
        return queue, queueLength
    end

    if buff("Fingers of Frost") > 0 then
        pushIf(queue, used, state, "Deep Freeze", { requireTarget = true })
    end
    if buff("Brain Freeze") > 0 then
        pushIf(queue, used, state, "Frostfire Bolt", { requireTarget = true })
    end
    if state.moving then
        pushIf(queue, used, state, "Ice Lance", { requireTarget = true })
    end

    pushIf(queue, used, state, "Frostbolt", { requireTarget = true })
    pushIf(queue, used, state, "Ice Lance", { requireTarget = true })
    return queue, queueLength
end

addon.Priorities["PALADIN:1"] = function(state, queueLength)
    local queue, used = makeQueue()
    local seal = choosePaladinSeal(state, true)
    local judgement = choosePaladinJudgement(state)

    if seal then
        push(queue, used, seal)
    end
    if state.playerHealthPct < 45 then
        pushIf(queue, used, state, "Holy Light")
    end
    if state.playerHealthPct < 80 then
        pushIf(queue, used, state, "Flash of Light")
    end
    if not hasTarget(state) then
        return queue, queueLength
    end

    if judgement then
        push(queue, used, judgement)
    end
    pushIf(queue, used, state, "Holy Shock", { requireTarget = true })
    pushIf(queue, used, state, "Exorcism", { requireTarget = true })
    pushIf(queue, used, state, "Consecration")
    return queue, queueLength
end

addon.Priorities["PALADIN:2"] = function(state, queueLength)
    local queue, used = makeQueue()
    local seal = choosePaladinSeal(state, false)
    local judgement = choosePaladinJudgement(state)

    if buff("Righteous Fury") < 60 then
        pushIf(queue, used, state, "Righteous Fury")
    end
    if seal then
        push(queue, used, seal)
    end
    if not hasTarget(state) then
        return queue, queueLength
    end

    pushIf(queue, used, state, "Hammer of the Righteous", { requireTarget = true })
    pushIf(queue, used, state, "Shield of Righteousness", { requireTarget = true })
    if judgement then
        push(queue, used, judgement)
    end
    pushIf(queue, used, state, "Consecration")
    pushIf(queue, used, state, "Holy Shield")
    pushIf(queue, used, state, "Avenger's Shield", { requireTarget = true })
    return queue, queueLength
end

addon.Priorities["PALADIN:3"] = function(state, queueLength)
    local queue, used = makeQueue()
    local seal = choosePaladinSeal(state, false)
    local judgement = choosePaladinJudgement(state)

    if seal then
        push(queue, used, seal)
    end
    if not hasTarget(state) then
        return queue, queueLength
    end

    if state.targetHealthPct <= 20 then
        pushIf(queue, used, state, "Hammer of Wrath", { requireTarget = true })
    end

    pushIf(queue, used, state, "Crusader Strike", { requireTarget = true })
    pushIf(queue, used, state, "Divine Storm", { requireTarget = true })
    if judgement then
        push(queue, used, judgement)
    end
    pushIf(queue, used, state, "Consecration")
    pushIf(queue, used, state, "Exorcism", { requireTarget = true })
    pushIf(queue, used, state, "Holy Wrath")
    return queue, queueLength
end
addon.Priorities["PRIEST:1"] = function(state, queueLength)
    local queue, used = makeQueue()

    if state.playerHealthPct < 65 then
        pushIf(queue, used, state, "Power Word: Shield")
    end
    if state.playerHealthPct < 45 then
        pushIf(queue, used, state, "Flash Heal")
    end
    if not hasTarget(state) then
        return queue, queueLength
    end

    if debuff(state, "Shadow Word: Pain") < 3 then
        pushIf(queue, used, state, "Shadow Word: Pain", { requireTarget = true })
    end

    pushIf(queue, used, state, "Penance", { requireTarget = true })
    pushIf(queue, used, state, "Mind Blast", { requireTarget = true })
    pushIf(queue, used, state, "Holy Fire", { requireTarget = true })
    pushIf(queue, used, state, "Smite", { requireTarget = true })
    return queue, queueLength
end

addon.Priorities["PRIEST:2"] = function(state, queueLength)
    local queue, used = makeQueue()

    if state.playerHealthPct < 65 then
        pushIf(queue, used, state, "Renew")
    end
    if state.playerHealthPct < 45 then
        pushIf(queue, used, state, "Flash Heal")
    end
    if not hasTarget(state) then
        return queue, queueLength
    end

    pushIf(queue, used, state, "Holy Fire", { requireTarget = true })
    if debuff(state, "Shadow Word: Pain") < 3 then
        pushIf(queue, used, state, "Shadow Word: Pain", { requireTarget = true })
    end
    pushIf(queue, used, state, "Smite", { requireTarget = true })
    return queue, queueLength
end

addon.Priorities["PRIEST:3"] = function(state, queueLength)
    local queue, used = makeQueue()

    if state.manaPct <= 25 then
        pushIf(queue, used, state, "Dispersion")
    end
    if not hasTarget(state) then
        return queue, queueLength
    end

    if debuff(state, "Vampiric Touch") < 2 then
        pushIf(queue, used, state, "Vampiric Touch", { requireTarget = true })
    end
    if debuff(state, "Devouring Plague") < 2 then
        pushIf(queue, used, state, "Devouring Plague", { requireTarget = true })
    end
    if debuff(state, "Shadow Word: Pain") < 2 then
        pushIf(queue, used, state, "Shadow Word: Pain", { requireTarget = true })
    end
    if state.targetHealthPct <= 25 then
        pushIf(queue, used, state, "Shadow Word: Death", { requireTarget = true })
    end

    pushIf(queue, used, state, "Mind Blast", { requireTarget = true })
    pushIf(queue, used, state, "Mind Flay", { requireTarget = true })
    return queue, queueLength
end

addon.Priorities["ROGUE:1"] = function(state, queueLength)
    local queue, used = makeQueue()
    local cp = state.comboPoints or 0

    if buff("Hunger for Blood") < 6 then
        pushIf(queue, used, state, "Hunger for Blood")
    end
    if not hasTarget(state) then
        return queue, queueLength
    end

    if cp >= 1 and buff("Slice and Dice") < 2 then
        pushIf(queue, used, state, "Slice and Dice")
    end
    if cp >= 4 and debuff(state, "Rupture") < 2 then
        pushIf(queue, used, state, "Rupture", { requireTarget = true })
    end
    if cp >= 4 then
        pushIf(queue, used, state, "Envenom", { requireTarget = true })
    end

    pushIf(queue, used, state, "Mutilate", { requireTarget = true })
    pushIf(queue, used, state, "Backstab", { requireTarget = true })
    pushIf(queue, used, state, "Sinister Strike", { requireTarget = true })
    return queue, queueLength
end

addon.Priorities["ROGUE:2"] = function(state, queueLength)
    local queue, used = makeQueue()
    local cp = state.comboPoints or 0

    if state.energy <= 45 then
        pushCooldownIf(queue, used, state, "Adrenaline Rush")
    end
    if not hasTarget(state) then
        return queue, queueLength
    end

    pushCooldownIf(queue, used, state, "Killing Spree", OPT_SYNC_TARGET)

    if cp >= 1 and buff("Slice and Dice") < 2 then
        pushIf(queue, used, state, "Slice and Dice")
    end
    if cp >= 5 and debuff(state, "Rupture") < 2 then
        pushIf(queue, used, state, "Rupture", { requireTarget = true })
    end
    if cp >= 5 then
        pushIf(queue, used, state, "Eviscerate", { requireTarget = true })
    end

    pushIf(queue, used, state, "Sinister Strike", { requireTarget = true })
    return queue, queueLength
end

addon.Priorities["ROGUE:3"] = function(state, queueLength)
    local queue, used = makeQueue()
    local cp = state.comboPoints or 0

    pushCooldownIf(queue, used, state, "Shadow Dance")
    if not hasTarget(state) then
        return queue, queueLength
    end

    if cp >= 1 and buff("Slice and Dice") < 2 then
        pushIf(queue, used, state, "Slice and Dice")
    end
    if cp >= 5 then
        pushIf(queue, used, state, "Eviscerate", { requireTarget = true })
    end

    pushIf(queue, used, state, "Hemorrhage", { requireTarget = true })
    pushIf(queue, used, state, "Backstab", { requireTarget = true })
    pushIf(queue, used, state, "Sinister Strike", { requireTarget = true })
    return queue, queueLength
end

addon.Priorities["SHAMAN:1"] = function(state, queueLength)
    local queue, used = makeQueue()

    if state.manaPct <= 35 then
        pushIf(queue, used, state, "Thunderstorm")
    end
    if not hasTarget(state) then
        return queue, queueLength
    end

    if debuff(state, "Flame Shock") < 2 then
        pushIf(queue, used, state, "Flame Shock", { requireTarget = true })
    end

    pushIf(queue, used, state, "Lava Burst", { requireTarget = true })
    pushIf(queue, used, state, "Chain Lightning", { requireTarget = true })
    pushIf(queue, used, state, "Lightning Bolt", { requireTarget = true })
    return queue, queueLength
end

addon.Priorities["SHAMAN:2"] = function(state, queueLength)
    local queue, used = makeQueue()

    if buff("Lightning Shield") < 20 then
        pushIf(queue, used, state, "Lightning Shield")
    end
    if not hasTarget(state) then
        return queue, queueLength
    end

    pushCooldownIf(queue, used, state, "Feral Spirit")
    pushIf(queue, used, state, "Stormstrike", { requireTarget = true })
    pushIf(queue, used, state, "Lava Lash", { requireTarget = true })

    if debuff(state, "Flame Shock") < 2 then
        pushIf(queue, used, state, "Flame Shock", { requireTarget = true })
    end

    pushIf(queue, used, state, "Earth Shock", { requireTarget = true })
    pushIf(queue, used, state, "Lightning Bolt", { requireTarget = true })
    return queue, queueLength
end

addon.Priorities["SHAMAN:3"] = function(state, queueLength)
    local queue, used = makeQueue()

    if buff("Earth Shield") < 10 then
        pushIf(queue, used, state, "Earth Shield")
    end
    if state.playerHealthPct < 65 then
        pushIf(queue, used, state, "Riptide")
    end
    if state.playerHealthPct < 45 then
        pushIf(queue, used, state, "Lesser Healing Wave")
    end
    if not hasTarget(state) then
        return queue, queueLength
    end

    if debuff(state, "Flame Shock") < 2 then
        pushIf(queue, used, state, "Flame Shock", { requireTarget = true })
    end

    pushIf(queue, used, state, "Lava Burst", { requireTarget = true })
    pushIf(queue, used, state, "Lightning Bolt", { requireTarget = true })
    pushIf(queue, used, state, "Chain Lightning", { requireTarget = true })
    return queue, queueLength
end
addon.Priorities["WARLOCK:1"] = function(state, queueLength)
    local queue, used = makeQueue()

    pushWarlockLifeTap(queue, used, state)
    if buff("Fel Armor") < 60 then
        pushIf(queue, used, state, "Fel Armor")
    end
    if not hasTarget(state) then
        return queue, queueLength
    end

    local curse = chooseWarlockCurse(state)
    if curse then
        push(queue, used, curse)
    end

    if debuff(state, "Corruption") < 3 then
        pushIf(queue, used, state, "Corruption", { requireTarget = true })
    end
    if debuff(state, "Unstable Affliction") < 3 then
        pushIf(queue, used, state, "Unstable Affliction", { requireTarget = true })
    end
    if debuff(state, "Haunt") < 2 then
        pushIf(queue, used, state, "Haunt", { requireTarget = true })
    end
    if state.targetHealthPct <= 25 then
        pushIf(queue, used, state, "Drain Soul", { requireTarget = true })
    end

    if state.moving then
        pushWarlockMovementFallback(queue, used, state)
        return queue, queueLength
    end

    pushIf(queue, used, state, "Shadow Bolt", { requireTarget = true })
    return queue, queueLength
end

addon.Priorities["WARLOCK:2"] = function(state, queueLength)
    local queue, used = makeQueue()

    pushWarlockLifeTap(queue, used, state)
    if buff("Fel Armor") < 60 then
        pushIf(queue, used, state, "Fel Armor")
    end
    if not hasTarget(state) then
        return queue, queueLength
    end

    local curse = chooseWarlockCurse(state)
    if curse then
        push(queue, used, curse)
    end

    if debuff(state, "Corruption") < 3 then
        pushIf(queue, used, state, "Corruption", { requireTarget = true })
    end
    if debuff(state, "Immolate") < 2 then
        pushIf(queue, used, state, "Immolate", { requireTarget = true })
    end

    pushCooldownIf(queue, used, state, "Metamorphosis")
    if buff("Metamorphosis") > 0 then
        pushIf(queue, used, state, "Immolation Aura")
    end
    if state.targetHealthPct <= 25 then
        pushIf(queue, used, state, "Drain Soul", { requireTarget = true })
    end

    if state.moving then
        pushWarlockMovementFallback(queue, used, state)
        return queue, queueLength
    end

    pushIf(queue, used, state, "Incinerate", { requireTarget = true })
    pushIf(queue, used, state, "Shadow Bolt", { requireTarget = true })
    return queue, queueLength
end

addon.Priorities["WARLOCK:3"] = function(state, queueLength)
    local queue, used = makeQueue()

    pushWarlockLifeTap(queue, used, state)
    if buff("Fel Armor") < 60 then
        pushIf(queue, used, state, "Fel Armor")
    end
    if not hasTarget(state) then
        return queue, queueLength
    end

    local curse = chooseWarlockCurse(state)
    if curse then
        push(queue, used, curse)
    end

    local immolate = debuff(state, "Immolate")
    if immolate < 2 then
        pushIf(queue, used, state, "Immolate", { requireTarget = true })
    end
    if immolate > 2 then
        pushIf(queue, used, state, "Conflagrate", { requireTarget = true })
    end

    if state.moving then
        pushWarlockMovementFallback(queue, used, state)
        return queue, queueLength
    end

    pushIf(queue, used, state, "Chaos Bolt", { requireTarget = true })
    if state.targetHealthPct <= 20 then
        pushIf(queue, used, state, "Shadowburn", { requireTarget = true })
    end

    pushIf(queue, used, state, "Incinerate", { requireTarget = true })
    pushIf(queue, used, state, "Shadow Bolt", { requireTarget = true })
    return queue, queueLength
end

addon.Priorities["WARRIOR:1"] = function(state, queueLength)
    local queue, used = makeQueue()
    if not hasTarget(state) then
        return queue, queueLength
    end

    if state.targetHealthPct <= 20 then
        pushIf(queue, used, state, "Execute", { requireTarget = true })
    end
    if debuff(state, "Rend") < 3 then
        pushIf(queue, used, state, "Rend", { requireTarget = true })
    end

    pushIf(queue, used, state, "Mortal Strike", { requireTarget = true })
    pushIf(queue, used, state, "Overpower", { requireTarget = true })
    pushIf(queue, used, state, "Slam", { requireTarget = true })

    if state.rage >= 60 then
        pushIf(queue, used, state, "Heroic Strike", { requireTarget = true })
    end

    return queue, queueLength
end

addon.Priorities["WARRIOR:2"] = function(state, queueLength)
    local queue, used = makeQueue()
    if not hasTarget(state) then
        return queue, queueLength
    end

    if state.targetHealthPct <= 20 then
        pushIf(queue, used, state, "Execute", { requireTarget = true })
    end

    pushIf(queue, used, state, "Bloodthirst", { requireTarget = true })
    pushIf(queue, used, state, "Whirlwind", { requireTarget = true })
    pushIf(queue, used, state, "Slam", { requireTarget = true })

    if state.rage >= 55 then
        pushIf(queue, used, state, "Heroic Strike", { requireTarget = true })
    end

    return queue, queueLength
end

addon.Priorities["WARRIOR:3"] = function(state, queueLength)
    local queue, used = makeQueue()
    if not hasTarget(state) then
        return queue, queueLength
    end

    pushIf(queue, used, state, "Shield Slam", { requireTarget = true })
    pushIf(queue, used, state, "Revenge", { requireTarget = true })
    pushIf(queue, used, state, "Shockwave", { requireTarget = true })
    pushIf(queue, used, state, "Thunder Clap", { requireTarget = true })
    pushIf(queue, used, state, "Devastate", { requireTarget = true })

    if state.rage >= 50 then
        pushIf(queue, used, state, "Heroic Strike", { requireTarget = true })
    end

    return queue, queueLength
end

addon.AoePriorities["DEATHKNIGHT:1"] = makeAoeHandler({
    "Death and Decay",
    { spell = "Icy Touch", when = function(state) return debuff(state, "Frost Fever") < 3 end },
    { spell = "Plague Strike", when = function(state) return debuff(state, "Blood Plague") < 3 end },
    "Pestilence",
    "Blood Boil",
    "Heart Strike",
    { spell = "Death Coil", when = function(state) return state.runicPower >= 40 end },
}, preDeathKnightAoe)

addon.AoePriorities["DEATHKNIGHT:2"] = makeAoeHandler({
    "Howling Blast",
    "Death and Decay",
    { spell = "Icy Touch", when = function(state) return debuff(state, "Frost Fever") < 3 end },
    { spell = "Plague Strike", when = function(state) return debuff(state, "Blood Plague") < 3 end },
    "Pestilence",
    "Blood Boil",
    "Obliterate",
    { spell = "Frost Strike", when = function(state) return state.runicPower >= 40 end },
}, preDeathKnightAoe)

addon.AoePriorities["DEATHKNIGHT:3"] = makeAoeHandler({
    "Death and Decay",
    { spell = "Icy Touch", when = function(state) return debuff(state, "Frost Fever") < 3 end },
    { spell = "Plague Strike", when = function(state) return debuff(state, "Blood Plague") < 3 end },
    "Pestilence",
    "Blood Boil",
    "Scourge Strike",
    { spell = "Death Coil", when = function(state) return state.runicPower >= 60 end },
}, preDeathKnightAoe)

addon.AoePriorities["DRUID:1"] = makeAoeHandler({
    "Starfall",
    "Hurricane",
    "Typhoon",
    { spell = "Moonfire", when = function(state) return debuff(state, "Moonfire") < 2 end },
    { spell = "Insect Swarm", when = function(state) return debuff(state, "Insect Swarm") < 2 end },
    "Wrath",
    "Starfire",
})

addon.AoePriorities["DRUID:2"] = makeAoeHandler({
    { spell = "Tiger's Fury", opts = { requireTarget = false }, when = function(state) return state.energy <= 35 end },
    "Swipe (Cat)",
    "Mangle (Cat)",
    { spell = "Rake", when = function(state) return debuff(state, "Rake") < 2 end },
    { spell = "Ferocious Bite", when = function(state) return (state.comboPoints or 0) >= 5 end },
    "Shred",
})

addon.AoePriorities["DRUID:3"] = makeAoeHandler({
    { spell = "Rejuvenation", opts = { requireTarget = false }, when = function(state) return state.playerHealthPct < 70 end },
    { spell = "Healing Touch", opts = { requireTarget = false }, when = function(state) return state.playerHealthPct < 45 end },
    "Hurricane",
    { spell = "Moonfire", when = function(state) return debuff(state, "Moonfire") < 2 end },
    { spell = "Insect Swarm", when = function(state) return debuff(state, "Insect Swarm") < 2 end },
    "Wrath",
})

addon.AoePriorities["HUNTER:1"] = makeAoeHandler({
    "Explosive Trap",
    "Multi-Shot",
    "Volley",
    "Kill Command",
    "Arcane Shot",
    "Steady Shot",
}, preHunterAoe)

addon.AoePriorities["HUNTER:2"] = makeAoeHandler({
    "Volley",
    "Multi-Shot",
    "Chimera Shot",
    "Aimed Shot",
    "Steady Shot",
}, preHunterAoe)

addon.AoePriorities["HUNTER:3"] = makeAoeHandler({
    "Explosive Trap",
    "Multi-Shot",
    "Volley",
    "Explosive Shot",
    "Black Arrow",
    "Steady Shot",
}, preHunterAoe)

addon.AoePriorities["MAGE:1"] = makeAoeHandler({
    { spell = "Evocation", opts = { requireTarget = false }, when = function(state) return state.manaPct <= 25 end },
    "Arcane Explosion",
    "Flamestrike",
    "Blizzard",
    "Arcane Barrage",
    "Arcane Missiles",
})

addon.AoePriorities["MAGE:2"] = makeAoeHandler({
    { spell = "Evocation", opts = { requireTarget = false }, when = function(state) return state.manaPct <= 25 end },
    { spell = "Living Bomb", when = function(state) return debuff(state, "Living Bomb") < 2 end },
    "Flamestrike",
    "Blizzard",
    "Dragon's Breath",
    "Fireball",
    "Scorch",
})

addon.AoePriorities["MAGE:3"] = makeAoeHandler({
    { spell = "Evocation", opts = { requireTarget = false }, when = function(state) return state.manaPct <= 25 end },
    "Blizzard",
    "Cone of Cold",
    { spell = "Deep Freeze", when = function(state) return buff("Fingers of Frost") > 0 end },
    { spell = "Frostfire Bolt", when = function(state) return buff("Brain Freeze") > 0 end },
    "Arcane Explosion",
    "Frostbolt",
})

addon.AoePriorities["PALADIN:1"] = function(state, queueLength)
    local queue, used = makeQueue()
    local seal = choosePaladinSeal(state, true)

    if seal then
        push(queue, used, seal)
    end
    if state.playerHealthPct < 55 then
        pushIf(queue, used, state, "Flash of Light")
    end
    if state.playerHealthPct < 40 then
        pushIf(queue, used, state, "Holy Light")
    end
    if not hasTarget(state) then
        return queue, queueLength
    end

    local judgement = choosePaladinJudgement(state)
    if judgement then
        push(queue, used, judgement)
    end

    pushIf(queue, used, state, "Consecration")
    pushIf(queue, used, state, "Holy Wrath")
    pushIf(queue, used, state, "Holy Shock", { requireTarget = true })
    pushIf(queue, used, state, "Exorcism", { requireTarget = true })
    return queue, queueLength
end

addon.AoePriorities["PALADIN:2"] = function(state, queueLength)
    local queue, used = makeQueue()
    local seal = choosePaladinSeal(state, false)

    if buff("Righteous Fury") < 60 then
        pushIf(queue, used, state, "Righteous Fury")
    end
    if seal then
        push(queue, used, seal)
    end
    if not hasTarget(state) then
        return queue, queueLength
    end

    local judgement = choosePaladinJudgement(state)
    if judgement then
        push(queue, used, judgement)
    end

    pushIf(queue, used, state, "Consecration")
    pushIf(queue, used, state, "Hammer of the Righteous", { requireTarget = true })
    pushIf(queue, used, state, "Holy Wrath")
    pushIf(queue, used, state, "Shield of Righteousness", { requireTarget = true })
    pushIf(queue, used, state, "Avenger's Shield", { requireTarget = true })
    return queue, queueLength
end

addon.AoePriorities["PALADIN:3"] = function(state, queueLength)
    local queue, used = makeQueue()
    local seal = choosePaladinSeal(state, false)

    if seal then
        push(queue, used, seal)
    end
    if not hasTarget(state) then
        return queue, queueLength
    end

    local judgement = choosePaladinJudgement(state)
    if judgement then
        push(queue, used, judgement)
    end

    pushIf(queue, used, state, "Divine Storm", { requireTarget = true })
    pushIf(queue, used, state, "Consecration")
    pushIf(queue, used, state, "Holy Wrath")
    pushIf(queue, used, state, "Crusader Strike", { requireTarget = true })
    pushIf(queue, used, state, "Exorcism", { requireTarget = true })
    return queue, queueLength
end

addon.AoePriorities["PRIEST:1"] = makeAoeHandler({
    { spell = "Power Word: Shield", opts = { requireTarget = false }, when = function(state) return state.playerHealthPct < 70 end },
    { spell = "Flash Heal", opts = { requireTarget = false }, when = function(state) return state.playerHealthPct < 45 end },
    "Holy Nova",
    "Mind Sear",
    "Penance",
    "Smite",
})

addon.AoePriorities["PRIEST:2"] = makeAoeHandler({
    { spell = "Renew", opts = { requireTarget = false }, when = function(state) return state.playerHealthPct < 70 end },
    { spell = "Flash Heal", opts = { requireTarget = false }, when = function(state) return state.playerHealthPct < 45 end },
    "Holy Nova",
    "Mind Sear",
    "Holy Fire",
    "Smite",
})

addon.AoePriorities["PRIEST:3"] = makeAoeHandler({
    { spell = "Dispersion", opts = { requireTarget = false }, when = function(state) return state.manaPct <= 25 end },
    { spell = "Vampiric Touch", when = function(state) return debuff(state, "Vampiric Touch") < 2 end },
    { spell = "Shadow Word: Pain", when = function(state) return debuff(state, "Shadow Word: Pain") < 2 end },
    "Mind Sear",
    "Mind Blast",
    "Mind Flay",
})

addon.AoePriorities["ROGUE:1"] = makeAoeHandler({
    { spell = "Hunger for Blood", opts = { requireTarget = false }, when = function(state) return buff("Hunger for Blood") < 6 end },
    { spell = "Slice and Dice", opts = { requireTarget = false }, when = function(state) return (state.comboPoints or 0) >= 1 and buff("Slice and Dice") < 2 end },
    "Fan of Knives",
    { spell = "Envenom", when = function(state) return (state.comboPoints or 0) >= 4 end },
    "Mutilate",
    "Sinister Strike",
})

addon.AoePriorities["ROGUE:2"] = makeAoeHandler({
    { spell = "Adrenaline Rush", opts = { requireTarget = false }, when = function(state) return state.energy <= 45 end },
    { spell = "Blade Flurry", opts = { requireTarget = false } },
    "Killing Spree",
    "Fan of Knives",
    { spell = "Slice and Dice", opts = { requireTarget = false }, when = function(state) return (state.comboPoints or 0) >= 1 and buff("Slice and Dice") < 2 end },
    { spell = "Eviscerate", when = function(state) return (state.comboPoints or 0) >= 5 end },
    "Sinister Strike",
})

addon.AoePriorities["ROGUE:3"] = makeAoeHandler({
    { spell = "Shadow Dance", opts = { requireTarget = false } },
    "Fan of Knives",
    { spell = "Slice and Dice", opts = { requireTarget = false }, when = function(state) return (state.comboPoints or 0) >= 1 and buff("Slice and Dice") < 2 end },
    { spell = "Eviscerate", when = function(state) return (state.comboPoints or 0) >= 5 end },
    "Hemorrhage",
    "Backstab",
})

addon.AoePriorities["SHAMAN:1"] = makeAoeHandler({
    { spell = "Thunderstorm", opts = { requireTarget = false }, when = function(state) return state.manaPct <= 35 end },
    { spell = "Magma Totem", opts = { requireTarget = false } },
    "Fire Nova",
    "Chain Lightning",
    { spell = "Flame Shock", when = function(state) return debuff(state, "Flame Shock") < 2 end },
    "Lava Burst",
    "Lightning Bolt",
})

addon.AoePriorities["SHAMAN:2"] = makeAoeHandler({
    { spell = "Lightning Shield", opts = { requireTarget = false }, when = function(state) return buff("Lightning Shield") < 20 end },
    { spell = "Magma Totem", opts = { requireTarget = false } },
    "Fire Nova",
    { spell = "Feral Spirit", opts = { requireTarget = false } },
    "Chain Lightning",
    "Stormstrike",
    "Lava Lash",
    "Earth Shock",
})

addon.AoePriorities["SHAMAN:3"] = makeAoeHandler({
    { spell = "Earth Shield", opts = { requireTarget = false }, when = function(state) return buff("Earth Shield") < 10 end },
    { spell = "Riptide", opts = { requireTarget = false }, when = function(state) return state.playerHealthPct < 65 end },
    { spell = "Lesser Healing Wave", opts = { requireTarget = false }, when = function(state) return state.playerHealthPct < 45 end },
    { spell = "Magma Totem", opts = { requireTarget = false } },
    "Fire Nova",
    "Chain Lightning",
    "Lava Burst",
    "Lightning Bolt",
})

addon.AoePriorities["WARLOCK:1"] = makeAoeHandler({
    "Seed of Corruption",
    { spell = "Corruption", when = function(state) return debuff(state, "Corruption") < 3 end },
    { spell = "Unstable Affliction", when = function(state) return debuff(state, "Unstable Affliction") < 3 end },
    { spell = "Haunt", when = function(state) return debuff(state, "Haunt") < 2 end },
    { spell = "Drain Soul", when = function(state) return state.targetHealthPct <= 25 end },
    "Shadow Bolt",
}, preWarlockAoe)

addon.AoePriorities["WARLOCK:2"] = makeAoeHandler({
    { spell = "Metamorphosis", opts = { requireTarget = false } },
    { spell = "Immolation Aura", opts = { requireTarget = false }, when = function() return buff("Metamorphosis") > 0 end },
    "Seed of Corruption",
    "Hellfire",
    { spell = "Immolate", when = function(state) return debuff(state, "Immolate") < 2 end },
    { spell = "Drain Soul", when = function(state) return state.targetHealthPct <= 25 end },
    "Incinerate",
    "Shadow Bolt",
}, preWarlockAoe)

addon.AoePriorities["WARLOCK:3"] = makeAoeHandler({
    "Rain of Fire",
    "Shadowfury",
    "Seed of Corruption",
    { spell = "Immolate", when = function(state) return debuff(state, "Immolate") < 2 end },
    { spell = "Conflagrate", when = function(state) return debuff(state, "Immolate") > 2 end },
    "Incinerate",
    "Shadow Bolt",
}, preWarlockAoe)

addon.AoePriorities["WARRIOR:1"] = makeAoeHandler({
    "Bladestorm",
    "Sweeping Strikes",
    "Whirlwind",
    "Thunder Clap",
    "Mortal Strike",
    { spell = "Cleave", when = function(state) return state.rage >= 45 end },
    { spell = "Execute", when = function(state) return state.targetHealthPct <= 20 end },
})

addon.AoePriorities["WARRIOR:2"] = makeAoeHandler({
    "Whirlwind",
    "Bloodthirst",
    { spell = "Cleave", when = function(state) return state.rage >= 40 end },
    "Slam",
    { spell = "Execute", when = function(state) return state.targetHealthPct <= 20 end },
})

addon.AoePriorities["WARRIOR:3"] = makeAoeHandler({
    "Shockwave",
    "Thunder Clap",
    "Revenge",
    "Shield Slam",
    "Devastate",
    { spell = "Cleave", when = function(state) return state.rage >= 35 end },
    { spell = "Heroic Strike", when = function(state) return state.rage >= 55 end },
})

addon.CleavePriorities["WARLOCK:1"] = makeAoeHandler({
    "Seed of Corruption",
    { spell = "Corruption", when = function(state) return debuff(state, "Corruption") < 3 end },
    { spell = "Unstable Affliction", when = function(state) return debuff(state, "Unstable Affliction") < 3 end },
    { spell = "Haunt", when = function(state) return debuff(state, "Haunt") < 2 end },
    "Shadow Bolt",
}, preWarlockAoe)

addon.CleavePriorities["WARLOCK:2"] = makeAoeHandler({
    { spell = "Metamorphosis", opts = { requireTarget = false }, syncCooldown = true },
    { spell = "Immolation Aura", opts = { requireTarget = false }, when = function() return buff("Metamorphosis") > 0 end },
    "Seed of Corruption",
    { spell = "Immolate", when = function(state) return debuff(state, "Immolate") < 2 end },
    "Incinerate",
    "Shadow Bolt",
}, preWarlockAoe)

addon.CleavePriorities["WARLOCK:3"] = makeAoeHandler({
    "Shadowfury",
    "Rain of Fire",
    "Seed of Corruption",
    { spell = "Immolate", when = function(state) return debuff(state, "Immolate") < 2 end },
    { spell = "Conflagrate", when = function(state) return debuff(state, "Immolate") > 2 end },
    "Incinerate",
}, preWarlockAoe)

local CLASS_FALLBACKS = {
    DEATHKNIGHT = { "Icy Touch", "Plague Strike", "Death Coil" },
    DRUID = { "Moonfire", "Wrath", "Starfire" },
    HUNTER = { "Serpent Sting", "Arcane Shot", "Steady Shot" },
    MAGE = { "Frostbolt", "Fireball", "Arcane Blast" },
    PALADIN = { "Crusader Strike", "Exorcism", "Consecration" },
    PRIEST = { "Shadow Word: Pain", "Mind Blast", "Smite" },
    ROGUE = { "Sinister Strike", "Eviscerate", "Rupture" },
    SHAMAN = { "Flame Shock", "Lava Burst", "Lightning Bolt" },
    WARLOCK = { "Corruption", "Shadow Bolt", "Immolate" },
    WARRIOR = { "Mortal Strike", "Bloodthirst", "Slam" },
}

local CLASS_CLEAVE_FALLBACKS = {
    DEATHKNIGHT = { "Howling Blast", "Blood Boil", "Obliterate" },
    DRUID = { "Starfall", "Hurricane", "Wrath" },
    HUNTER = { "Multi-Shot", "Volley", "Steady Shot" },
    MAGE = { "Arcane Explosion", "Blizzard", "Arcane Barrage" },
    PALADIN = { "Consecration", "Divine Storm", "Crusader Strike" },
    PRIEST = { "Mind Sear", "Mind Blast", "Mind Flay" },
    ROGUE = { "Fan of Knives", "Sinister Strike", "Eviscerate" },
    SHAMAN = { "Chain Lightning", "Lava Burst", "Lightning Bolt" },
    WARLOCK = { "Seed of Corruption", "Shadow Bolt", "Corruption" },
    WARRIOR = { "Whirlwind", "Cleave", "Bloodthirst" },
}

local CLASS_AOE_FALLBACKS = {
    DEATHKNIGHT = { "Death and Decay", "Howling Blast", "Blood Boil" },
    DRUID = { "Hurricane", "Starfall", "Wrath" },
    HUNTER = { "Volley", "Multi-Shot", "Steady Shot" },
    MAGE = { "Blizzard", "Flamestrike", "Arcane Explosion" },
    PALADIN = { "Consecration", "Holy Wrath", "Crusader Strike" },
    PRIEST = { "Mind Sear", "Holy Nova", "Mind Blast" },
    ROGUE = { "Fan of Knives", "Sinister Strike", "Eviscerate" },
    SHAMAN = { "Chain Lightning", "Fire Nova", "Lightning Bolt" },
    WARLOCK = { "Seed of Corruption", "Rain of Fire", "Shadow Bolt" },
    WARRIOR = { "Whirlwind", "Thunder Clap", "Cleave" },
}

local function genericAoeFallback(state)
    local queue, used = makeQueue()

    if hasTarget(state) then
        local list = CLASS_AOE_FALLBACKS[state.class] or CLASS_FALLBACKS[state.class]
        if list then
            for _, spell in ipairs(list) do
                pushIf(queue, used, state, spell, { requireTarget = true })
            end
        end
    end

    if #queue == 0 and state.moving and state.class ~= "HUNTER" and not MELEE_AUTO_ATTACK_CLASSES[state.class] then
        return queue
    end

    if #queue == 0 and hasTarget(state) then
        if state.class == "HUNTER" then
            if addon:IsSpellKnownLocal(75) and addon:IsSpellInRange(75, "target") then
                push(queue, used, 75, true)
            end
        elseif MELEE_AUTO_ATTACK_CLASSES[state.class] and addon:IsSpellKnownLocal(6603) and addon:IsSpellInRange(6603, "target") then
            push(queue, used, 6603, true)
        end
    end

    return queue
end

local function genericCleaveFallback(state)
    local queue, used = makeQueue()

    if hasTarget(state) then
        local list = CLASS_CLEAVE_FALLBACKS[state.class] or CLASS_FALLBACKS[state.class]
        if list then
            for _, spell in ipairs(list) do
                pushIf(queue, used, state, spell, OPT_REQUIRE_TARGET)
            end
        end
    end

    if #queue == 0 and state.moving and state.class ~= "HUNTER" and not MELEE_AUTO_ATTACK_CLASSES[state.class] then
        return queue
    end

    if #queue == 0 and hasTarget(state) then
        if state.class == "HUNTER" then
            if addon:IsSpellKnownLocal(75) and addon:IsSpellInRange(75, "target") then
                push(queue, used, 75, true)
            end
        elseif MELEE_AUTO_ATTACK_CLASSES[state.class] and addon:IsSpellKnownLocal(6603) and addon:IsSpellInRange(6603, "target") then
            push(queue, used, 6603, true)
        end
    end

    return queue
end

local function genericFallback(state)
    local queue, used = makeQueue()

    if hasTarget(state) then
        local list = CLASS_FALLBACKS[state.class]
        if list then
            for _, spell in ipairs(list) do
                pushIf(queue, used, state, spell, { requireTarget = true })
            end
        end
    end

    if #queue == 0 and state.moving and state.class ~= "HUNTER" and not MELEE_AUTO_ATTACK_CLASSES[state.class] then
        return queue
    end

    if #queue == 0 and hasTarget(state) then
        if state.class == "HUNTER" then
            if addon:IsSpellKnownLocal(75) and addon:IsSpellInRange(75, "target") then
                push(queue, used, 75, true)
            end
        elseif MELEE_AUTO_ATTACK_CLASSES[state.class] and addon:IsSpellKnownLocal(6603) and addon:IsSpellInRange(6603, "target") then
            push(queue, used, 6603, true)
        end
    end

    return queue
end

local function genericMovementFallback(state)
    local queue, used = makeQueue()
    if not state.moving or not hasTarget(state) then
        return queue
    end

    local list = CLASS_FALLBACKS[state.class]
    if list then
        for _, spell in ipairs(list) do
            pushIf(queue, used, state, spell, { requireTarget = true, ignoreMovement = true, skipRange = true })
        end
    end

    if #queue == 0 and state.class == "HUNTER" and addon:IsSpellKnownLocal(75) then
        push(queue, used, 75, true)
    elseif #queue == 0 and MELEE_AUTO_ATTACK_CLASSES[state.class] and addon:IsSpellKnownLocal(6603) then
        push(queue, used, 6603, true)
    end

    return queue
end

local function applyCastAwareness(state, queue, queueLength)
    if not queue or #queue == 0 then
        return queue
    end
    if not state.casting or not state.currentCastSpell then
        return queue
    end
    if (state.castRemaining or 0) <= max(0.10, (state.gcd or 0) + 0.05) then
        return queue
    end
    if state.moving then
        local castMS = getSpellCastTimeMS(state.currentCastSpell)
        if castMS > 0 and not isSpellMovableByProc(state, state.currentCastSpell) then
            return queue
        end
    end

    local newQueue = {}
    local used = {}
    push(newQueue, used, state.currentCastSpell, true)
    for i = 1, #queue do
        local spell = queue[i]
        if spell and not used[spell] then
            push(newQueue, used, spell, true)
        end
    end

    while #newQueue > queueLength do
        table.remove(newQueue)
    end
    return newQueue
end

local function finalizeQueue(state, queue, queueLength)
    if not queue or #queue == 0 then
        return queue
    end
    queue = applyCastAwareness(state, queue, queueLength)
    while #queue > queueLength do
        table.remove(queue)
    end
    return queue
end

function addon:GetCooldownQueue(state)
    local key = state.specKey
    local queue, used = makeQueue()

    if not state.inCombat then
        return queue, key and (tostring(key) .. ":cooldown") or "cooldown"
    end

    local entries = key and self.CooldownPriorities[key]
    if not entries then
        return queue, key and (tostring(key) .. ":cooldown") or "cooldown"
    end

    for _, entry in ipairs(entries) do
        cooldownPush(queue, used, state, entry)
    end

    while #queue > 1 do
        table.remove(queue)
    end

    return queue, tostring(key) .. ":cooldown"
end

function addon:GetPriorityQueue(state)
    local queueLength = (self.db and self.db.queueLength) or 1
    local key = state.specKey
    local cleaveThreshold = (self.db and self.db.cleaveThreshold) or 2
    local aoeThreshold = (self.db and self.db.aoeThreshold) or 3
    if aoeThreshold < cleaveThreshold then
        aoeThreshold = cleaveThreshold
    end
    local enemyCount = state.enemyCount or 0
    local cleaveMode = enemyCount >= cleaveThreshold and enemyCount < aoeThreshold
    local aoeMode = enemyCount >= aoeThreshold

    if aoeMode then
        local aoeHandler = key and self.AoePriorities[key]
        if aoeHandler then
            local aoeQueue = aoeHandler(state, queueLength)
            if aoeQueue and #aoeQueue > 0 then
                aoeQueue = finalizeQueue(state, aoeQueue, queueLength)
                return aoeQueue, tostring(key) .. ":aoe"
            end
        end

        local aoeFallback = genericAoeFallback(state)
        if aoeFallback and #aoeFallback > 0 then
            aoeFallback = finalizeQueue(state, aoeFallback, queueLength)
            return aoeFallback, "fallback:aoe"
        end
    end

    if cleaveMode then
        local cleaveHandler = key and self.CleavePriorities[key]
        if cleaveHandler then
            local cleaveQueue = cleaveHandler(state, queueLength)
            if cleaveQueue and #cleaveQueue > 0 then
                cleaveQueue = finalizeQueue(state, cleaveQueue, queueLength)
                return cleaveQueue, tostring(key) .. ":cleave"
            end
        end

        local cleaveFallback = genericCleaveFallback(state)
        if cleaveFallback and #cleaveFallback > 0 then
            cleaveFallback = finalizeQueue(state, cleaveFallback, queueLength)
            return cleaveFallback, "fallback:cleave"
        end
    end

    local handler = key and self.Priorities[key]

    if handler then
        local queue = handler(state, queueLength)
        if queue and #queue > 0 then
            queue = finalizeQueue(state, queue, queueLength)
            return queue, key
        end
    end

    local fallback = genericFallback(state)
    if fallback and #fallback > 0 then
        fallback = finalizeQueue(state, fallback, queueLength)
        return fallback, "fallback"
    end

    local movementFallback = genericMovementFallback(state)
    if movementFallback and #movementFallback > 0 then
        movementFallback = finalizeQueue(state, movementFallback, queueLength)
        return movementFallback, "fallback:move"
    end
    return fallback, "fallback"
end
