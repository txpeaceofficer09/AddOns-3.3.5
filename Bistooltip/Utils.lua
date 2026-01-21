-- ============================================================
-- Utils.lua - Shared utility functions for BisTooltip
-- ============================================================

local ADDON_NAME = "Bis-Tooltip"

-- Create addon-local Utils namespace
BistooltipUtils = BistooltipUtils or {}

-- ============================================================
-- Class Color Utilities
-- ============================================================

local FALLBACK_CLASS_HEX = {
    DEATHKNIGHT = "ffc41f3b",
    DRUID       = "ffff7d0a",
    HUNTER      = "ffabd473",
    MAGE        = "ff69ccf0",
    PALADIN     = "fff58cba",
    PRIEST      = "ffffffff",
    ROGUE       = "fffff569",
    SHAMAN      = "ff0070de",
    WARLOCK     = "ff9482c9",
    WARRIOR     = "ffc79c6e",
}

local CLASSFILE_TO_DATASET = {
    DEATHKNIGHT = "Death knight",
    DRUID       = "Druid",
    HUNTER      = "Hunter",
    MAGE        = "Mage",
    PALADIN     = "Paladin",
    PRIEST      = "Priest",
    ROGUE       = "Rogue",
    SHAMAN      = "Shaman",
    WARLOCK     = "Warlock",
    WARRIOR     = "Warrior",
}

local DATASET_TO_CLASSFILE = {}
for file, ds in pairs(CLASSFILE_TO_DATASET) do
    DATASET_TO_CLASSFILE[ds] = file
end

-- Also handle common name variations
local CLASSNAME_TO_FILE = {
    Warrior     = "WARRIOR",
    Paladin     = "PALADIN",
    Hunter      = "HUNTER",
    Rogue       = "ROGUE",
    Priest      = "PRIEST",
    DeathKnight = "DEATHKNIGHT",
    ["Death knight"] = "DEATHKNIGHT",
    Shaman      = "SHAMAN",
    Mage        = "MAGE",
    Warlock     = "WARLOCK",
    Druid       = "DRUID",
}

-- Export for other modules
BistooltipUtils.FALLBACK_CLASS_HEX = FALLBACK_CLASS_HEX
BistooltipUtils.CLASSFILE_TO_DATASET = CLASSFILE_TO_DATASET
BistooltipUtils.DATASET_TO_CLASSFILE = DATASET_TO_CLASSFILE
BistooltipUtils.CLASSNAME_TO_FILE = CLASSNAME_TO_FILE

-- Normalize class name/token to uppercase file token
function BistooltipUtils.NormalizeClassFileToken(classNameOrToken)
    if not classNameOrToken then return nil end
    local t = tostring(classNameOrToken)
    
    -- Check direct mapping first
    if CLASSNAME_TO_FILE[t] then
        return CLASSNAME_TO_FILE[t]
    end
    
    local up = string.upper(t):gsub("%s+", "")
    if up == "DEATHKNIGHT" or up == "DEATH_KNIGHT" or up == "DEATHKNIGHTS" then
        return "DEATHKNIGHT"
    end
    
    -- If already a class file token
    if FALLBACK_CLASS_HEX[up] then return up end
    
    -- Localized names -> token via UnitClass lookups
    local _, file = UnitClass("player")
    if file and t == UnitClass("player") then return file end
    
    return up
end

-- Get class file token from dataset name (e.g., "Death knight" -> "DEATHKNIGHT")
function BistooltipUtils.GetClassFileFromDatasetName(datasetClass)
    if not datasetClass then return nil end
    return DATASET_TO_CLASSFILE[tostring(datasetClass)]
end

-- Colorize text by class (accepts dataset name or class file token)
function BistooltipUtils.ColorizeByClass(datasetClass, text)
    local file = BistooltipUtils.GetClassFileFromDatasetName(datasetClass) 
                 or BistooltipUtils.NormalizeClassFileToken(datasetClass)
    local c = file and _G.RAID_CLASS_COLORS and _G.RAID_CLASS_COLORS[file]
    if c and c.r and c.g and c.b then
        return string.format("|cff%02x%02x%02x%s|r", c.r * 255, c.g * 255, c.b * 255, tostring(text))
    end
    local hx = file and FALLBACK_CLASS_HEX[file]
    if hx then 
        return "|c" .. hx .. tostring(text) .. "|r" 
    end
    return tostring(text)
end

-- Colorize class name specifically
function BistooltipUtils.ColorizeClassName(className)
    return BistooltipUtils.ColorizeByClass(className, className)
end

-- ============================================================
-- Table Utilities (avoid polluting global table namespace)
-- ============================================================

function BistooltipUtils.TableContains(tbl, element)
    if not tbl then return false end
    for _, value in pairs(tbl) do
        if value == element then
            return true
        end
    end
    return false
end

function BistooltipUtils.TableKeys(tbl)
    local keys = {}
    if tbl then
        for k in pairs(tbl) do
            table.insert(keys, k)
        end
    end
    return keys
end

function BistooltipUtils.TableCount(tbl)
    local count = 0
    if tbl then
        for _ in pairs(tbl) do
            count = count + 1
        end
    end
    return count
end

-- ============================================================
-- String Utilities
-- ============================================================

-- Get string length without WoW color codes
function BistooltipUtils.GetStringLengthWithoutColors(str)
    if not str then return 0 end
    -- Single pass: remove color codes and resets
    return #(str:gsub("|c%x%x%x%x%x%x%x%x", ""):gsub("|r", ""):gsub("|T.-|t", ""))
end

-- Truncate text with ellipsis
function BistooltipUtils.TruncateText(s, maxlen)
    s = s and tostring(s) or ""
    if maxlen and maxlen > 3 and #s > maxlen then
        return string.sub(s, 1, maxlen - 1) .. "…"
    end
    return s
end

-- Smart truncate for display (handles multi-byte chars better)
function BistooltipUtils.SmartTrunc(s, limit)
    if not s then return "" end
    if string.len(s) > limit then
        return string.sub(s, 1, limit) .. ".."
    end
    return s
end

-- Clean line from tooltip (remove color codes, normalize whitespace)
function BistooltipUtils.CleanLine(line)
    if not line then return "" end
    line = tostring(line)
    line = line:gsub("|c%x%x%x%x%x%x%x%x", "")
    line = line:gsub("|r", "")
    line = line:gsub("\194\160", " ")  -- Non-breaking space
    line = line:gsub("%s+", " ")
    line = line:gsub("^%s+", ""):gsub("%s+$", "")
    return line
end

-- ============================================================
-- Item Utilities
-- ============================================================

-- Safe GetItemInfo wrapper that queues preload for uncached items
function BistooltipUtils.SafeGetItemInfo(itemId, queuePreloadFunc)
    if not itemId or itemId <= 0 then
        return nil, nil, 1, nil, nil, nil, nil, nil, nil, nil
    end
    
    local name, link, quality, iLevel, reqLevel, class, subclass, maxStack, equipSlot, texture = GetItemInfo(itemId)
    
    if not name then
        if queuePreloadFunc then
            queuePreloadFunc(itemId)
        end
        return "Loading...", nil, 1, nil, nil, nil, nil, nil, nil, "Interface\\Icons\\INV_Misc_QuestionMark"
    end
    
    return name, link, quality or 1, iLevel, reqLevel, class, subclass, maxStack, equipSlot, texture
end

-- Get item quality color as hex string
function BistooltipUtils.GetItemQualityHex(quality)
    local r, g, b = GetItemQualityColor(quality or 1)
    return string.format("ff%02x%02x%02x", r * 255, g * 255, b * 255)
end

-- Normalize item ID (handle Horde->Alliance translations)
function BistooltipUtils.NormalizeItemID(original_item_id)
    if not original_item_id or original_item_id <= 0 then return nil end
    if _G.Bistooltip_horde_to_ali and _G.Bistooltip_horde_to_ali[original_item_id] then
        return _G.Bistooltip_horde_to_ali[original_item_id]
    end
    return original_item_id
end

-- ============================================================
-- Spec Icon Utilities
-- ============================================================

function BistooltipUtils.GetSpecIcon(className, specName)
    if _G.Bistooltip_spec_icons and _G.Bistooltip_spec_icons[className] then
        return _G.Bistooltip_spec_icons[className][specName]
    end
    return nil
end

-- ============================================================
-- Iterator Utilities
-- ============================================================

-- Case-insensitive pairs iterator
function BistooltipUtils.CaseInsensitivePairs(t)
    if not t then return function() end end
    
    local keys = {}
    for k in pairs(t) do
        table.insert(keys, k)
    end
    table.sort(keys, function(a, b)
        return tostring(a):lower() < tostring(b):lower()
    end)
    
    local i = 0
    return function()
        i = i + 1
        local k = keys[i]
        if k then
            return k, t[k]
        end
    end
end

-- ============================================================
-- Frame Utilities
-- ============================================================

-- Reset frame decoration (backdrop, etc.)
function BistooltipUtils.ResetFrameDecor(fr)
    if not fr then return end
    if fr.SetBackdrop then
        fr:SetBackdrop(nil)
        if fr.SetBackdropColor then fr:SetBackdropColor(0, 0, 0, 0) end
        if fr.SetBackdropBorderColor then fr:SetBackdropBorderColor(0, 0, 0, 0) end
    end
    if fr.SetClipsChildren then
        fr:SetClipsChildren(false)
    end
end

-- Add frame to UISpecialFrames for ESC closing
function BistooltipUtils.AddToUISpecialFrames(frameName, beforeName)
    if not frameName then return end
    _G.UISpecialFrames = _G.UISpecialFrames or {}
    
    for _, n in ipairs(_G.UISpecialFrames) do
        if n == frameName then return end
    end
    
    if beforeName then
        for i, n in ipairs(_G.UISpecialFrames) do
            if n == beforeName then
                table.insert(_G.UISpecialFrames, i, frameName)
                return
            end
        end
    end
    table.insert(_G.UISpecialFrames, frameName)
end

-- Remove frame from UISpecialFrames
function BistooltipUtils.RemoveFromUISpecialFrames(frameName)
    if not frameName or not _G.UISpecialFrames then return end
    for i = #_G.UISpecialFrames, 1, -1 do
        if _G.UISpecialFrames[i] == frameName then
            table.remove(_G.UISpecialFrames, i)
        end
    end
end

-- ============================================================
-- Debug Utilities
-- ============================================================

function BistooltipUtils.DebugPrint(...)
    if BistooltipAddon and BistooltipAddon.db and BistooltipAddon.db.char and BistooltipAddon.db.char.debug_mode then
        DEFAULT_CHAT_FRAME:AddMessage("|cffffd000Bis-Tooltip Debug:|r " .. table.concat({...}, " "))
    end
end
