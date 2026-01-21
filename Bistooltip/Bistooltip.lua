-- ============================================================
-- Bistooltip.lua - Tooltip enhancement for BIS item information
-- ============================================================

local eventFrame = CreateFrame("Frame", nil, UIParent)
Bistooltip_phases_string = ""

-- Import utilities
local Utils = BistooltipUtils
local Constants = BistooltipConstants

-- ============================================================
-- Local Utility Functions (using Utils module)
-- ============================================================

local ColorizeByClass = Utils.ColorizeByClass
local ColorizeClassName = Utils.ColorizeClassName
local GetPhaseWeight = Constants.GetPhaseWeight
local NormalizeClassFileToken = Utils.NormalizeClassFileToken
local GetClassFileFromDatasetName = Utils.GetClassFileFromDatasetName
local TableContains = Utils.TableContains
local CaseInsensitivePairs = Utils.CaseInsensitivePairs

-- ============================================================
-- Spec Detection Configuration (from Constants)
-- ============================================================

local SPEC_BY_CLASSFILE_TAB = Constants.SPEC_BY_CLASSFILE_TAB

-- ============================================================
-- Local Helper Functions
-- ============================================================

local function GetSpecIcon(className, specName)
    return Utils.GetSpecIcon(className, specName)
end

local function ParseBestRankFromPhases(phasesText)
    if not phasesText or phasesText == "" then return nil end
    local s = tostring(phasesText)
    if s:find("BIS") then
        return { kind = "BIS" }
    end
    local bestAlt
    for n in s:gmatch("alt%s*(%d+)") do
        n = tonumber(n)
        if n and (not bestAlt or n < bestAlt) then bestAlt = n end
    end
    if bestAlt then
        return { kind = "ALT", n = bestAlt }
    end
    return { kind = "FOUND" }
end

-- Parse "T8 BIS / T9 alt 2" => phaseStats + bestPhase label for bestRank
local function ParsePhaseStatsFromString(phasesText)
    local bisCount, bestAlt = 0, nil
    local earliestBisW, earliestAnyW = 999, 999
    local bestRankKind, bestRankN = nil, nil
    local bestRankPhase, bestRankPhaseW = nil, 999

    if type(phasesText) ~= "string" or phasesText == "" then
        return 0, nil, 999, 999, nil
    end

    for token in phasesText:gmatch("([^/]+)") do
        local s = token:gsub("^%s+", ""):gsub("%s+$", "")
        local phase = s:match("^([^%s]+)") or s
        local w = GetPhaseWeight(phase)
        if w < earliestAnyW then earliestAnyW = w end

        local isBis = s:find("BIS") ~= nil
        local altN = s:match("alt%s*(%d+)")
        altN = altN and tonumber(altN) or nil

        if isBis then
            bisCount = bisCount + 1
            if w < earliestBisW then earliestBisW = w end
            if bestRankKind ~= "BIS" or w < bestRankPhaseW then
                bestRankKind, bestRankN = "BIS", nil
                bestRankPhase, bestRankPhaseW = phase, w
            end
        elseif altN then
            if not bestAlt or altN < bestAlt then bestAlt = altN end
            if bestRankKind ~= "BIS" then
                if (bestRankKind ~= "ALT") or (not bestRankN) or (altN < bestRankN) or (altN == bestRankN and w < bestRankPhaseW) then
                    bestRankKind, bestRankN = "ALT", altN
                    bestRankPhase, bestRankPhaseW = phase, w
                end
            end
        end
    end

    return bisCount, bestAlt, earliestBisW, earliestAnyW, bestRankPhase
end

-- Compact SHIFT entry: Class (colored) + spec icon + [T#]
local function FormatShiftEntry(e)
    local classColored = ColorizeByClass(e.class, e.class)
    local iconString = e.icon and string.format("|T%s:14|t", e.icon) or ""

    -- Build phase range like [PR–RS] or [T8–T9]
    local phases = {}
    if type(e.phases) == "string" and e.phases ~= "" then
        for token in e.phases:gmatch("([^/]+)") do
            local s = token:gsub("^%s+", ""):gsub("%s+$", "")
            local phase = s:match("^([^%s]+)")
            if phase then
                phases[phase] = true
            end
        end
    end
    local ordered = {}
    for phase in pairs(phases) do
        table.insert(ordered, phase)
    end
    table.sort(ordered, function(a, b)
        local wa, wb = GetPhaseWeight(a), GetPhaseWeight(b)
        if wa ~= wb then return wa < wb end
        return tostring(a) < tostring(b)
    end)

    local phaseTag = ""
    if #ordered == 1 then
        phaseTag = "|cffaaaaaa[" .. ordered[1] .. "]|r"
    elseif #ordered > 1 then
        phaseTag = "|cffaaaaaa[" .. ordered[1] .. "–" .. ordered[#ordered] .. "]|r"
    end

    return string.format("%s%s%s%s",
        classColored,
        iconString ~= "" and (" " .. iconString) or "",
        phaseTag ~= "" and " " or "",
        phaseTag
    )
end

-- For "Your specialization" header we want a clearer status
local function RankTagForSelf(rank)
    if not rank then
        return "|cffff3b3bNO BIS|r"
    end
    if rank.kind == "BIS" then
        return "|cff00ff00BIS|r"
    end
    if rank.kind == "BIS2" then
        return "|cff009900BIS²|r"
    end
    if rank.kind == "ALT" then
        return string.format("|cffffa500[ALT %d]|r", rank.n or 0)
    end
    return "|cffff3b3bNO BIS|r"
end

-- Robust points extraction across API variations
local function ExtractTalentPoints(...)
    local best
    for i = 1, select("#", ...) do
        local v = select(i, ...)
        if type(v) == "number" and v >= 0 and v <= 71 then
            if not best or v > best then best = v end
        end
    end
    return best
end

-- Promote ALT2 to BIS2 for dual-slot items (rings/trinkets) and Fury DW weapons
local function NormalizeDualSlotRank(itemId, className, specName, rank)
    if not rank or rank.kind ~= "ALT" or tonumber(rank.n) ~= 2 then
        return rank
    end
    local _, _, _, _, _, _, _, _, equipLoc = GetItemInfo(itemId)
    if equipLoc == "INVTYPE_FINGER" or equipLoc == "INVTYPE_TRINKET" then
        return { kind = "BIS2" }
    end
    if tostring(className) == "Warrior" and tostring(specName) == "Fury" then
        if equipLoc == "INVTYPE_WEAPON" or equipLoc == "INVTYPE_WEAPONMAINHAND" or equipLoc == "INVTYPE_WEAPONOFFHAND" then
            return { kind = "BIS2" }
        end
    end
    return rank
end

-- Display helper: in dual-slot contexts, treat ALT2 as BIS² in the phase string
-- Also applies tier combining for consecutive BIS phases
local function FormatPhasesString(itemId, className, specName, phasesStr)
    if not phasesStr then return phasesStr end
    
    -- First apply tier combining
    if Constants and Constants.CombineBISPhases then
        phasesStr = Constants.CombineBISPhases(phasesStr)
    end
    
    -- If already processed by CombineBISPhases, it will have color codes
    if phasesStr:find("|cff00ff00BIS") then
        return phasesStr
    end
    
    if phasesStr:find("BIS") then return phasesStr end
    
    local _, _, _, _, _, _, _, _, equipLoc = GetItemInfo(itemId)
    local isDual = (equipLoc == "INVTYPE_FINGER" or equipLoc == "INVTYPE_TRINKET")
    if not isDual and tostring(className) == "Warrior" and tostring(specName) == "Fury" then
        if equipLoc == "INVTYPE_WEAPON" or equipLoc == "INVTYPE_WEAPONMAINHAND" or equipLoc == "INVTYPE_WEAPONOFFHAND" then
            isDual = true
        end
    end
    if not isDual then return phasesStr end

    local bis2Token = "|cff009900BIS²|r"
    local out = phasesStr:gsub("[Aa][Ll][Tt]%s*2%f[%D]", bis2Token)
    return out
end

local function RankTag(rank)
    if not rank then return "|cffff3b3bNO BIS|r" end
    if rank.kind == "BIS" then return "|cff00ff00BIS|r" end
    if rank.kind == "BIS2" then return "|cff009900BIS²|r" end
    if rank.kind == "ALT" then return string.format("|cffffa500ALT %d|r", rank.n or 0) end
    return "|cffffff00FOUND|r"
end

local function GetPlayerClassSpecKeys()
    local _, classFile = UnitClass("player")
    if not classFile then return nil end
    
    local classKey = Utils.CLASSFILE_TO_DATASET[classFile] or UnitClass("player")
    
    -- Active talent group (dual spec)
    local group = 1
    if type(_G.GetActiveTalentGroup) == "function" then
        local ok, g = pcall(_G.GetActiveTalentGroup, false, false)
        if not ok then ok, g = pcall(_G.GetActiveTalentGroup) end
        if ok and type(g) == "number" and g >= 1 then group = g end
    end
    
    local bestTab, bestPts = 1, -1
    local tabs = _G.GetNumTalentTabs and _G.GetNumTalentTabs(false, false) or 3
    
    for tab = 1, tabs do
        local points
        do
            local ok, r1, r2, r3, r4, r5, r6, r7, r8 = pcall(_G.GetTalentTabInfo, tab, false, false, group)
            if ok then
                points = ExtractTalentPoints(r1, r2, r3, r4, r5, r6, r7, r8)
            end
            if points == nil then
                local ok2, a1, a2, a3, a4, a5, a6, a7, a8 = pcall(_G.GetTalentTabInfo, tab, false, false)
                if ok2 then points = ExtractTalentPoints(a1, a2, a3, a4, a5, a6, a7, a8) end
            end
        end
        if points and points > bestPts then
            bestPts, bestTab = points, tab
        end
    end

    -- Druid edge: tab 2 can be cat or bear
    local specName = (SPEC_BY_CLASSFILE_TAB[classFile] and SPEC_BY_CLASSFILE_TAB[classFile][bestTab]) or nil
    if classFile == "DRUID" and bestTab == 2 then
        local form = GetShapeshiftForm and GetShapeshiftForm() or 0
        if form == 1 then specName = "Feral tank"
        elseif form == 3 then specName = "Feral dps"
        else specName = "Feral tank" end
    end
    if classFile == "DEATHKNIGHT" and bestTab == 1 then
        specName = "Blood tank"
    end
    
    return classKey, specName
end

local function specHighlighted(class_name, spec_name)
    if not BistooltipAddon or not BistooltipAddon.db or not BistooltipAddon.db.char then
        return false
    end
    local hs = BistooltipAddon.db.char.highlight_spec
    return hs and hs.spec_name == spec_name and hs.class_name == class_name
end

local function specFiltered(class_name, spec_name)
    if specHighlighted(class_name, spec_name) then
        return false
    end
    if BistooltipAddon and BistooltipAddon.db and BistooltipAddon.db.char then
        local fs = BistooltipAddon.db.char.filter_specs
        if fs and fs[class_name] then
            return not fs[class_name][spec_name]
        end
    end
    return false
end

local function classNamesFiltered()
    if BistooltipAddon and BistooltipAddon.db and BistooltipAddon.db.char then
        return BistooltipAddon.db.char.filter_class_names
    end
    return false
end

local function getFilteredItem(item)
    local filtered_item = {}
    for ki, spec in ipairs(item) do
        local class_name = spec.class_name
        local spec_name = spec.spec_name
        if not specFiltered(class_name, spec_name) then
            table.insert(filtered_item, spec)
        end
    end
    return filtered_item
end

local function printSpecLine(tooltip, slot, class_name, spec_name)
    local slot_name = slot.name
    local slot_ranks = slot.ranks
    local prefix = classNamesFiltered() and "" or "   "
    
    -- Safe icon lookup
    local icon = GetSpecIcon(class_name, spec_name)
    local left_text = prefix
    if icon then
        left_text = left_text .. "|T" .. icon .. ":14|t "
    end
    left_text = left_text .. ColorizeByClass(class_name, spec_name)
    
    if slot_name == "Off hand" or slot_name == "Weapon" or slot_name == "Weapon 1h" or slot_name == "Weapon 2h" then
        left_text = left_text .. " (" .. slot_name .. ")"
    end
    tooltip:AddDoubleLine(left_text, slot_ranks)
end

local function printClassName(tooltip, class_name)
    tooltip:AddLine(ColorizeByClass(class_name, class_name))
end

-- Search function for BIS lists
function searchIDInBislistsClassSpec(structure, id, class, spec)
    local paths = {}
    local seen = {}

    -- Sort phases according to Bistooltip_wowtbc_phases order
    local sortedPhases = {}
    if Bistooltip_wowtbc_phases then
        for _, phase in ipairs(Bistooltip_wowtbc_phases) do
            if structure and structure[class] and structure[class][spec] and structure[class][spec][phase] then
                table.insert(sortedPhases, phase)
            end
        end
    end

    for _, phase in ipairs(sortedPhases) do
        local items = structure[class][spec][phase]

        for index, itemData in pairs(items) do
            if type(itemData) == "table" and itemData[1] then
                for i, itemId in ipairs(itemData) do
                    if i ~= "slot_name" and i ~= "enhs" and itemId == id then
                        local phaseLabel
                        if i == 1 then
                            phaseLabel = phase .. " BIS"
                        else
                            phaseLabel = phase .. " alt " .. i
                        end

                        if not seen[phaseLabel] then
                            table.insert(paths, phaseLabel)
                            seen[phaseLabel] = true
                        end
                    end
                end
            end
        end
    end

    if #paths > 0 then
        return table.concat(paths, " / ")
    else
        return nil
    end
end

-- ============================================================
-- DataStore Integration
-- ============================================================

local function getDataStoreInventory()
    if _G.DataStore_Inventory then
        return _G.DataStore_Inventory
    end
    local ok, AceAddon = pcall(LibStub, "AceAddon-3.0")
    if ok and AceAddon and AceAddon.GetAddon then
        local ds = AceAddon:GetAddon("DataStore_Inventory", true)
        if ds then return ds end
    end
    return nil
end

local function formatInstanceName(instance)
    if not instance then return nil end
    instance = tostring(instance)
    local tmpInstance = string.lower(instance)

    -- Normalize heroic labels to 25-man naming
    if tmpInstance == "the obsidian sanctum (heroic)" then
        instance = "The Obsidian Sanctum(25)"
    elseif tmpInstance == "the eye of eternity (heroic)" then
        instance = "The Eye Of Eternity (25)"
    elseif tmpInstance == "naxxramas (heroic)" then
        instance = "Naxxramas (25)"
    elseif tmpInstance == "ulduar (heroic)" then
        instance = "Ulduar (25)"
    end

    return instance
end

local function findSourceInLootTable(itemId)
    local lt = rawget(_G, "lootTable")
    if type(lt) ~= "table" then
        lt = type(lootTable) == "table" and lootTable or nil
    end
    if type(lt) ~= "table" then
        return nil, nil
    end

    for zone, bosses in pairs(lt) do
        if type(bosses) == "table" then
            for boss, items in pairs(bosses) do
                if type(items) == "table" then
                    for k, v in pairs(items) do
                        if k == itemId or v == itemId then
                            return formatInstanceName(zone), boss
                        end
                    end
                end
            end
        end
    end

    return nil, nil
end

-- Public API used by Bislist: returns instance, boss
function BistooltipAddon:GetItemSourceInfo(itemId)
    if not itemId then return nil, nil end

    self._sourceCache = self._sourceCache or {}
    local cached = self._sourceCache[itemId]
    if cached then
        return cached[1], cached[2]
    end

    local zone, boss = findSourceInLootTable(itemId)

    if not zone then
        local DataStore_Inventory = getDataStoreInventory()
        if DataStore_Inventory and DataStore_Inventory.GetSource then
            local Instance, Boss = DataStore_Inventory:GetSource(itemId)
            if Instance and Boss then
                zone, boss = formatInstanceName(Instance), Boss
            end
        end
    end

    self._sourceCache[itemId] = { zone, boss }
    return zone, boss
end

local function GetItemSource(itemId)
    if not (BistooltipAddon and BistooltipAddon.GetItemSourceInfo) then
        return nil
    end
    local zone, boss = BistooltipAddon:GetItemSourceInfo(itemId)
    if zone and boss then
        return "|cFFFFFFFFSource:|r |cFF00FF00[" .. tostring(zone) .. "] - " .. tostring(boss) .. "|r"
    end
    return nil
end

-- Owned-item helper (cache from Core.lua)
local function GetOwnedInfo(itemId)
    if not itemId then return 0, 0 end
    local t = _G.Bistooltip_char_equipment
    if not t then return 0, 0 end
    local row = t[itemId]
    if not row then return 0, 0 end
    return row.bags or 0, row.equipped or 0
end

-- ============================================================
-- Dual Source Support (Boss + Emblems)
-- ============================================================

local function GetAllItemSources(itemId)
    local sources = {}
    if not itemId or itemId <= 0 then return sources end
    
    -- Get raid/dungeon source
    if _G.BistooltipAddon and _G.BistooltipAddon.GetItemSourceInfo then
        local zone, boss = _G.BistooltipAddon:GetItemSourceInfo(itemId)
        if zone and boss then
            local diffTag = nil
            if Constants and Constants.GetInstanceDifficulty then
                diffTag = Constants.GetInstanceDifficulty(zone)
            end
            table.insert(sources, {
                type = "raid",
                zone = zone,
                boss = boss,
                difficulty = diffTag,
            })
        end
    end
    
    -- Check for emblem source
    local emblemSource = nil
    if _G.Bistooltip_emblem_items then
        emblemSource = _G.Bistooltip_emblem_items[itemId]
    end
    if not emblemSource and Constants and Constants.GetEmblemSource then
        emblemSource = Constants.GetEmblemSource(itemId)
    end
    
    if emblemSource then
        table.insert(sources, {
            type = "emblem",
            currency = emblemSource.currency or "Emblems",
            cost = emblemSource.cost,
        })
    end
    
    return sources
end

local function FormatSourcesForTooltip(sources)
    if not sources or #sources == 0 then return nil end
    
    local lines = {}
    
    for _, src in ipairs(sources) do
        if src.type == "raid" then
            local text = "|cFF00FF00[" .. tostring(src.zone)
            if src.difficulty then
                text = text .. " " .. src.difficulty
            end
            text = text .. "]|r - |cFFFFD000" .. tostring(src.boss) .. "|r"
            table.insert(lines, text)
            
        elseif src.type == "emblem" then
            local emblemInfo = Constants and Constants.EMBLEM_VENDORS and Constants.EMBLEM_VENDORS[src.currency]
            local color = emblemInfo and emblemInfo.color or "ff00ff"
            local text = "|cff" .. color .. src.currency
            if src.cost then
                text = text .. " x" .. src.cost
            end
            text = text .. "|r"
            table.insert(lines, text)
        end
    end
    
    return lines
end

-- ============================================================
-- Tooltip Refresh with Cooldown
-- ============================================================

local lastRefreshTime = 0
local REFRESH_COOLDOWN = 0.1

local function RefreshAnyTooltip(tt)
    if not tt or not tt.GetItem then return end
    
    local now = GetTime()
    if now - lastRefreshTime < REFRESH_COOLDOWN then return end
    
    if BistooltipAddon._refreshing then return end
    
    local _, link = tt:GetItem()
    if not link then return end
    
    lastRefreshTime = now
    BistooltipAddon._refreshing = true
    tt:ClearLines()
    tt:SetHyperlink(link)
    BistooltipAddon._refreshing = false
end

-- ============================================================
-- Main Tooltip Handler
-- ============================================================

local function OnGameTooltipSetItem(tooltip)
    local shiftMode = IsShiftKeyDown() and true or false
    local ctrlDown = IsControlKeyDown() and true or false

    local _, link = tooltip:GetItem()
    if not link then return end

    local _, itemIdStr = strsplit(":", link)
    local itemId = tonumber(itemIdStr)
    if not itemId then return end

    -- Check if BIS data is loaded
    if not Bistooltip_bislists or not Bistooltip_spec_icons then
        return
    end

    -- Your specialization section (only for rare+ equippable items)
    local showSpec = false
    do
        local _, _, quality, _, _, _, _, _, equipLoc = GetItemInfo(link)
        if quality and quality >= 3 then
            if type(_G.IsEquippableItem) == "function" then
                local ok, eq = pcall(_G.IsEquippableItem, link)
                if ok and eq then showSpec = true end
            else
                if equipLoc and equipLoc ~= "" and equipLoc ~= "INVTYPE_NON_EQUIP" then
                    showSpec = true
                end
            end
        end
    end

    if showSpec then
        local pClass, pSpec = GetPlayerClassSpecKeys()
        if pClass and pSpec then
            tooltip:AddLine(" ", 1, 1, 0)
            tooltip:AddLine("Your specialization:", 1, 1, 1)

            local foundPhases = searchIDInBislistsClassSpec(Bistooltip_bislists, itemId, pClass, pSpec)
            local icon = GetSpecIcon(pClass, pSpec)
            local left = (icon and string.format("|T%s:16|t ", icon) or "")
                .. ColorizeByClass(pClass, pClass)
                .. " - "
                .. ColorizeByClass(pClass, tostring(pSpec))

            if foundPhases then
                local rank = NormalizeDualSlotRank(itemId, pClass, pSpec, ParseBestRankFromPhases(foundPhases))
                tooltip:AddDoubleLine(left, RankTagForSelf(rank), 1, 1, 1, 1, 1, 1)
                tooltip:AddDoubleLine("Where:", tostring(FormatPhasesString(itemId, pClass, pSpec, foundPhases)), 1, 1, 1, 1, 1, 0)
            else
                tooltip:AddDoubleLine(left, "|cffff3b3bNO BIS|r", 1, 1, 1, 1, 1, 1)
            end
            tooltip:AddLine(" ", 1, 1, 0)
        end
    end

    -- Collect all matching entries
    local anyFound = false
    local entries = {}
    local classOrder = _G.Bistooltip_classes_indexes or {}

    for class, specs in CaseInsensitivePairs(Bistooltip_spec_icons) do
        for spec, icon in pairs(specs) do
            if spec ~= "classIcon" then
                local foundPhases = searchIDInBislistsClassSpec(Bistooltip_bislists, itemId, class, spec)
                if foundPhases then
                    anyFound = true
                    local rank = ParseBestRankFromPhases(foundPhases)
                    local bisCount, bestAlt, earliestBisW, earliestAnyW, bestPhase = ParsePhaseStatsFromString(foundPhases)

                    table.insert(entries, {
                        class = class,
                        spec = spec,
                        icon = icon,
                        phases = foundPhases,
                        rank = rank,
                        bisCount = bisCount,
                        bestAlt = bestAlt,
                        earliestBisW = earliestBisW,
                        earliestAnyW = earliestAnyW,
                        bestPhase = bestPhase,
                        classIdx = tonumber(classOrder[class]) or 999,
                    })
                end
            end
        end
    end

    -- Helper: rank allowlist for CTRL focus mode
    local function isFocusRank(r)
        if not r then return false end
        if r.kind == "BIS" or r.kind == "BIS2" then return true end
        if r.kind == "ALT" then
            local n = tonumber(r.n) or 99
            return n <= 2
        end
        return false
    end

    -- Always show the hint line once we have any results
    if anyFound then
        tooltip:AddLine("|cffaaaaaaHold SHIFT for summary · Hold CTRL for focus|r")
    end

    -- SHIFT summary (compact)
    if shiftMode and #entries > 0 then
        tooltip:AddLine(" ", 1, 1, 0)
        tooltip:AddLine("Summary (SHIFT):", 1, 1, 1)

        local groupedBis, groupedBis2, groupedNo = {}, {}, {}
        local altGroups = {}

        for i = 1, #entries do
            local e = entries[i]
            local r = NormalizeDualSlotRank(itemId, e.class, e.spec, e.rank)
            e._normRank = r

            if r and r.kind == "BIS" then
                table.insert(groupedBis, e)
            elseif r and r.kind == "BIS2" then
                table.insert(groupedBis2, e)
            elseif r and r.kind == "ALT" and r.n then
                local n = tonumber(r.n) or 99
                altGroups[n] = altGroups[n] or {}
                table.insert(altGroups[n], e)
            else
                table.insert(groupedNo, e)
            end
        end

        local function entrySort(a, b)
            if a.classIdx ~= b.classIdx then return a.classIdx < b.classIdx end
            if a.class ~= b.class then return tostring(a.class) < tostring(b.class) end
            return tostring(a.spec) < tostring(b.spec)
        end
        table.sort(groupedBis, entrySort)
        table.sort(groupedBis2, entrySort)
        table.sort(groupedNo, entrySort)
        for n, list in pairs(altGroups) do
            table.sort(list, entrySort)
        end

        local function addWrapped(label, list, sep)
            if #list == 0 then return end
            sep = sep or " / "
            local maxPerLine = 3
            local idx = 1
            local indent = string.rep(" ", 6)
            local first = true
            while idx <= #list do
                local chunk = {}
                for j = 1, maxPerLine do
                    local e = list[idx]
                    if not e then break end
                    chunk[#chunk + 1] = FormatShiftEntry(e)
                    idx = idx + 1
                end
                if #chunk > 0 then
                    if first then
                        tooltip:AddLine(label .. table.concat(chunk, sep))
                        first = false
                    else
                        tooltip:AddLine(indent .. table.concat(chunk, sep))
                    end
                end
            end
        end

        addWrapped("  |cff00ff00BIS:|r ", groupedBis, " / ")
        addWrapped("  |cff009900BIS²:|r ", groupedBis2, " / ")

        local alts = {}
        for n in pairs(altGroups) do table.insert(alts, n) end
        table.sort(alts)
        for _, n in ipairs(alts) do
            addWrapped(string.format("  |cffffa500ALT%d:|r ", n), altGroups[n], " > ")
        end

        addWrapped("  |cffff3b3bNO BIS:|r ", groupedNo, " / ")
        return true
    end

    -- Default view: full list (sorted) / CTRL focus view (filtered)
    local focusMode = (not shiftMode) and ctrlDown

    -- Rank ordering: BIS > BIS2 > ALT1 > ALT2 ... > NO BIS
    local function RankWeight(r)
        if not r then return 999 end
        if r.kind == "BIS" then return 0 end
        if r.kind == "BIS2" then return 1 end
        if r.kind == "ALT" then return 10 + (tonumber(r.n) or 99) end
        return 900
    end

    local buckets = {}
    local classes = {}

    for i = 1, #entries do
        local e = entries[i]
        e._normRank = NormalizeDualSlotRank(itemId, e.class, e.spec, e.rank)
        if (not focusMode) or isFocusRank(e._normRank) then
            local c = e.class
            local b = buckets[c]
            if not b then
                b = {
                    class = c,
                    classIdx = e.classIdx or 999,
                    bestW = 999,
                    bestPhaseW = 999,
                    entries = {},
                }
                buckets[c] = b
                table.insert(classes, b)
            end

            local w = RankWeight(e._normRank)
            local pW = GetPhaseWeight(e.bestPhase)
            if (w < b.bestW) or (w == b.bestW and pW < b.bestPhaseW) then
                b.bestW = w
                b.bestPhaseW = pW
            end

            table.insert(b.entries, e)
        end
    end

    -- Sort classes by best rank, then by earliest phase, then by natural class order
    table.sort(classes, function(a, b)
        if a.bestW ~= b.bestW then return a.bestW < b.bestW end
        if a.bestPhaseW ~= b.bestPhaseW then return a.bestPhaseW < b.bestPhaseW end
        if a.classIdx ~= b.classIdx then return a.classIdx < b.classIdx end
        return tostring(a.class) < tostring(b.class)
    end)

    -- Sort specs inside each class by rank, then phase, then name
    local function specSort(a, b)
        local wa, wb = RankWeight(a._normRank), RankWeight(b._normRank)
        if wa ~= wb then return wa < wb end
        local pa, pb = GetPhaseWeight(a.bestPhase), GetPhaseWeight(b.bestPhase)
        if pa ~= pb then return pa < pb end
        return tostring(a.spec) < tostring(b.spec)
    end
    for i = 1, #classes do
        table.sort(classes[i].entries, specSort)
    end

    if focusMode and #classes > 0 then
        tooltip:AddLine("|cffaaaaaaFocus mode: BIS / BIS² / ALT1 / ALT2|r")
    end

    for i = 1, #classes do
        local b = classes[i]
        tooltip:AddLine(ColorizeByClass(b.class, b.class))
        for j = 1, #b.entries do
            local e = b.entries[j]
            local iconString = e.icon and string.format("|T%s:14|t ", e.icon) or ""
            local leftText = "   " .. iconString .. ColorizeByClass(b.class, e.spec)
            tooltip:AddDoubleLine(leftText, FormatPhasesString(itemId, e.class, e.spec, e.phases), 1, 1, 1, 1, 1, 0)
        end
    end

    -- Owned info
    local bags, equipped = GetOwnedInfo(itemId)
    if (bags > 0) or (equipped > 0) then
        tooltip:AddLine(" ", 1, 1, 0)
        if equipped > 0 then
            tooltip:AddLine("You have this item equipped", 0.074, 0.964, 0.129)
        else
            if bags > 1 then
                tooltip:AddLine("You have this item in your bags (x" .. bags .. ")", 0.074, 0.964, 0.129)
            else
                tooltip:AddLine("You have this item in your bags", 0.074, 0.964, 0.129)
            end
        end
    else
        if anyFound and not getDataStoreInventory() and not BistooltipAddon._noDSNoteShown then
            BistooltipAddon._noDSNoteShown = true
            tooltip:AddLine(" ", 1, 1, 0)
            tooltip:AddLine("Bis-Tooltip is running without DataStore: bank items won't be shown.", 0.6, 0.6, 0.6)
        end
    end

    -- Item source - NOW SUPPORTS MULTIPLE SOURCES
    local sources = GetAllItemSources(itemId)
    local sourceLines = FormatSourcesForTooltip(sources)
    
    if sourceLines and #sourceLines > 0 then
        tooltip:AddLine(" ", 1, 1, 0)
        tooltip:AddLine("|cFFFFFFFFSource:|r", 1, 1, 1)
        for _, line in ipairs(sourceLines) do
            tooltip:AddLine("  " .. line, 1, 1, 1)
        end
        tooltip:AddLine(" ", 1, 1, 0)
    end
end

-- ============================================================
-- Initialization
-- ============================================================

function BistooltipAddon:initBisTooltip()
    eventFrame:RegisterEvent("MODIFIER_STATE_CHANGED")
    eventFrame:SetScript("OnEvent", function(_, _, e_key)
        if e_key ~= "RCTRL" and e_key ~= "LCTRL" and e_key ~= "RSHIFT" and e_key ~= "LSHIFT" then
            return
        end
        if GameTooltip and GameTooltip:IsShown() then
            RefreshAnyTooltip(GameTooltip)
        end
        if ItemRefTooltip and ItemRefTooltip:IsShown() then
            RefreshAnyTooltip(ItemRefTooltip)
        end
    end)

    GameTooltip:HookScript("OnTooltipSetItem", OnGameTooltipSetItem)
    ItemRefTooltip:HookScript("OnTooltipSetItem", OnGameTooltipSetItem)
end
