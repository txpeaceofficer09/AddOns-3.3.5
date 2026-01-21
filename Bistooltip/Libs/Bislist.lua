local AceGUI = LibStub("AceGUI-3.0")

local class = nil
local spec = nil
local phase = nil
local class_index = nil
local spec_index = nil
local phase_index = nil

local class_options = {}
local class_options_to_class = {}

local spec_options = {}
local spec_options_to_spec = {}
local spec_frame = nil
local items = {}
local spells = {}
local main_frame = nil

local classDropdown = nil
local specDropdown = nil
local phaseDropDown = nil

local checkmarks = {}
local boemarks = {}

local isHorde = UnitFactionGroup("player") == "Horde"

-- Class colors (for nicer dropdown UI)
local CLASSNAME_TO_FILE = {
  Warrior = "WARRIOR",
  Paladin = "PALADIN",
  Hunter = "HUNTER",
  Rogue = "ROGUE",
  Priest = "PRIEST",
  DeathKnight = "DEATHKNIGHT",
  Shaman = "SHAMAN",
  Mage = "MAGE",
  Warlock = "WARLOCK",
  Druid = "DRUID",
}

local function ColorizeClassOption(className)
  local file = CLASSNAME_TO_FILE[className]
  local c = file and _G.RAID_CLASS_COLORS and _G.RAID_CLASS_COLORS[file]
  if c and c.r then
    return string.format("|cff%02x%02x%02x%s|r", c.r*255, c.g*255, c.b*255, className)
  end
  return className
end


-- ============================================================
-- Premium UX additions:
--   - background item preloader (avoids "Reload spam" / server throttle feel)
--   - owned-state overlays (equipped vs bags + count)
--   - search filter
-- ============================================================

local searchText = ""
local searchTextLower = ""
local showOnlyMissing = false

local bisChecklistMode = false -- "BIS checklist" mode (hide completed BIS slots + show sources + targets summary)
local checklistSummaryLabel = nil
local drawSpecData -- forward declaration (called by preloader before definition)

-- Owned info helper (cache from Core.lua)
local function GetOwnedRow(item_id)
    local t = _G.Bistooltip_char_equipment
    if not t then return nil end
    return t[item_id]
end

-- Checklist-mode helpers

local function OwnedCount(item_id)
    local row = GetOwnedRow(item_id)
    if not row then return 0 end
    return (row.bags or 0) + (row.equipped or 0)
end

local function NormalizeItemID(original_item_id)
    if not original_item_id or original_item_id <= 0 then return nil end
    if _G.Bistooltip_horde_to_ali and _G.Bistooltip_horde_to_ali[original_item_id] then
        return _G.Bistooltip_horde_to_ali[original_item_id]
    end
    return original_item_id
end

local function IsDualSlot(slot, item_id)
    -- Prefer equipLoc when cached; fallback to slot name hints
    local equipLoc
    if item_id then
        local _, _, _, _, _, _, _, _, loc = GetItemInfo(item_id)
        equipLoc = loc
    end
    if equipLoc == "INVTYPE_TRINKET" or equipLoc == "INVTYPE_FINGER" then
        return true
    end
    local sn = slot and (slot.slot_name or slot.name)
    if sn then
        sn = tostring(sn):lower()
        if sn:find("trinket") or sn:find("ring") or sn:find("finger") then
            return true
        end
    end
    return false
end

local function GetRequiredBISItemsForSlot(slot)
    local req = {}
    local a = NormalizeItemID(slot and slot[1])
    if a then table.insert(req, a) end

    if a and IsDualSlot(slot, a) then
        local b = NormalizeItemID(slot and slot[2])
        if b and b ~= a then
            table.insert(req, b)
        else
            -- If BIS1 == BIS2 (or missing), pick the next distinct item from the row as BIS2.
            local found
            for i = 2, math.min(#slot, 6) do
                local cand = NormalizeItemID(slot[i])
                if cand and cand ~= a then
                    found = cand
                    break
                end
            end
            if found then
                table.insert(req, found)
            end
        end
    end
    return req
end

local function SlotBISCompleted(slot)
    local req = GetRequiredBISItemsForSlot(slot)
    if #req == 0 then return false end

    if #req == 1 then
        return OwnedCount(req[1]) >= 1
    end

    -- Dual-slot completion: need BOTH BIS items (distinct).
    -- If the row contains only one distinct BIS item, treat as single requirement.
    if req[1] == req[2] then
        return OwnedCount(req[1]) >= 1
    end
    return OwnedCount(req[1]) >= 1 and OwnedCount(req[2]) >= 1
end

local function GetSourceShort(item_id)
    -- Legacy compact helper (zone + boss)
    if not item_id or item_id <= 0 then return "" end
    if _G.BistooltipAddon and _G.BistooltipAddon.GetItemSourceInfo then
        local zone, boss = _G.BistooltipAddon:GetItemSourceInfo(item_id)
        if zone and boss then
            return "|cffcfcfcf" .. tostring(zone) .. "|r\n|cffffd000" .. tostring(boss) .. "|r"
        end
    end
    return ""
end


local function GetChecklistUnderItemText(item_id)
    if not item_id or item_id <= 0 then return "" end

    local name, _, quality = GetItemInfo(item_id)
    if not name then
        if QueuePreload then QueuePreload(item_id) end
        name = "Item " .. tostring(item_id)
        quality = 1
    end

    -- Funkcja wstawiająca nową linię w połowie długiej nazwy
    local function formatNameMultiLine(str)
        if string.len(str) < 12 then return str end
        -- Znajdź spację w środku, żeby złamać linię
        local midpoint = math.floor(string.len(str) / 2)
        local spaceFound = string.find(str, " ", midpoint - 4) or string.find(str, " ", 1)
        
        if spaceFound then
             return string.sub(str, 1, spaceFound - 1) .. "\n" .. string.sub(str, spaceFound + 1)
        else
            -- Jeśli brak spacji, utnij
            return string.sub(str, 1, 11) .. ".."
        end
    end

    local r, g, b = GetItemQualityColor(quality or 1)
    local hexColor = string.format("ff%02x%02x%02x", r*255, g*255, b*255)
    
    -- Formatujemy nazwę na 2 linie (bez nazwy bossa, bo to robi bałagan w Gridzie)
    local cleanName = formatNameMultiLine(name)
    
    return "|c" .. hexColor .. cleanName .. "|r"
end



-- ============================================================
-- BIS checklist side panel (GRAPHICAL UI)
-- ============================================================
local checklistPanel = nil
local checklistContainer = nil -- Kontener na widgety

local function EnsureChecklistPanel()
    if not main_frame or not main_frame.frame then return end
    if checklistPanel then return end

    -- Główne tło panelu
    checklistPanel = CreateFrame("Frame", "BistooltipChecklistPanel", main_frame.frame)
    checklistPanel:SetPoint("TOPLEFT", main_frame.frame, "TOPRIGHT", 5, 0)
    checklistPanel:SetPoint("BOTTOMLEFT", main_frame.frame, "BOTTOMRIGHT", 5, 0)
    checklistPanel:SetWidth(330) -- Szerokość panelu bocznego
    checklistPanel:SetBackdrop({
        bgFile = "Interface\\DialogFrame\\UI-DialogBox-Background",
        edgeFile = "Interface\\DialogFrame\\UI-DialogBox-Border",
        tile = true, tileSize = 32, edgeSize = 24,
        insets = { left = 5, right = 5, top = 5, bottom = 5 }
    })
    checklistPanel:Hide()

    -- Tytuł
    local title = checklistPanel:CreateFontString(nil, "OVERLAY", "GameFontNormalHuge")
    title:SetPoint("TOP", 0, -15)
    title:SetText("|cffffd100BIS CHECKLIST|r")
    
    -- ScrollFrame (Kontener przewijany)
    checklistContainer = AceGUI:Create("ScrollFrame")
    checklistContainer:SetLayout("List") -- Układ lista pod listą
    checklistContainer:SetWidth(310)
    checklistContainer:SetHeight(0) -- Dopasuje się
    
    -- Musimy ręcznie osadzić ramkę AceGUI w naszym panelu WoW
    checklistContainer.frame:SetParent(checklistPanel)
    checklistContainer.frame:SetPoint("TOPLEFT", 15, -45)
    checklistContainer.frame:SetPoint("BOTTOMRIGHT", -15, 15)
    checklistContainer.frame:Show()

    checklistPanel._container = checklistContainer
end

local function DestroyChecklistPanel()
    if checklistPanel then
        checklistPanel:Hide()
        checklistPanel:SetParent(nil)
    end
    checklistPanel = nil
    checklistContainer = nil
end

local function TruncText(s, maxlen)
    s = s and tostring(s) or ""
    if maxlen and maxlen > 3 and string.len(s) > maxlen then
        return string.sub(s, 1, maxlen - 1) .. "…"
    end
    return s
end

local function BuildChecklistGroups()
    -- groups[zone][boss] = { items = { {id,name,slot}... } }
    local groups = {}
    local totalMissing = 0

    if not (class and spec and phase) then
        return groups, totalMissing
    end

    local slots = Bistooltip_bislists
        and Bistooltip_bislists[class]
        and Bistooltip_bislists[class][spec]
        and Bistooltip_bislists[class][spec][phase]

    if type(slots) ~= "table" then
        return groups, totalMissing
    end

    for _, slot in ipairs(slots) do
        local req = GetRequiredBISItemsForSlot(slot)
        for _, id in ipairs(req) do
            if id and id > 0 and OwnedCount(id) < 1 then
                totalMissing = totalMissing + 1

                local zone, boss = nil, nil
                if _G.BistooltipAddon and _G.BistooltipAddon.GetItemSourceInfo then
                    zone, boss = _G.BistooltipAddon:GetItemSourceInfo(id)
                end
                zone = zone or "Unknown instance"
                boss = boss or "Unknown boss"

                groups[zone] = groups[zone] or {}
                groups[zone][boss] = groups[zone][boss] or { items = {} }

                local name = GetItemInfo(id)
                if not name then
                    if QueuePreload then QueuePreload(id) end
                    name = "Item " .. tostring(id)
                end

                table.insert(groups[zone][boss].items, {
                    id = id,
                    name = name,
                    slot = slot.slot_name or "",
                })
            end
        end
    end

    -- Sort items within each boss
    for _, bosses in pairs(groups) do
        for _, row in pairs(bosses) do
            if row and row.items then
                table.sort(row.items, function(a, b)
                    if a.slot ~= b.slot then return tostring(a.slot) < tostring(b.slot) end
                    return tostring(a.name) < tostring(b.name)
                end)
            end
        end
    end

    return groups, totalMissing
end

-- ============================================================
-- GRAPHICAL CHECKLIST RENDERERS (Modern UI)
-- ============================================================

-- Rysuje nagłówek bossa (Czerwony, duży, wyśrodkowany)
local function DrawBossHeaderGUI(container, bossName, instanceName)
    local group = AceGUI:Create("SimpleGroup")
    group:SetLayout("Flow")
    group:SetFullWidth(true)

    local label = AceGUI:Create("Label")
    label:SetFont("Fonts\\FRIZQT__.TTF", 14, "OUTLINE")
    -- Formatowanie: Nazwa bossa na czerwno, instancja na szaro, wyśrodkowane
    local text = string.format("\n|cffef5350%s|r\n|cff90a4ae%s|r", bossName:upper(), instanceName:gsub("[%(%)]", ""))
    label:SetText(text)
    label:SetJustifyH("CENTER")
    label:SetFullWidth(true)
    
    group:AddChild(label)
    container:AddChild(group)
end

-- Rysuje wiersz przedmiotu (Ikona po lewej, Schludny tekst po prawej)
local function DrawItemRowGUI(container, item_id, slot_name)
    local row = AceGUI:Create("SimpleGroup")
    row:SetLayout("Flow") -- Pozwala układać elementy obok siebie
    row:SetFullWidth(true)
    
    -- 1. Ikona (Duża, wyraźna)
    local icon = AceGUI:Create("Icon")
    icon:SetImageSize(28, 28) -- Zwiększony rozmiar ikony
    icon:SetWidth(34)
    local _, link, quality, _, _, _, _, _, _, texture = GetItemInfo(item_id)
    
    if not texture then 
        texture = "Interface\\Icons\\Inv_misc_questionmark"
        BistooltipAddon:ScanEquipment(true) -- Próba wymuszenia odświeżenia
    end
    icon:SetImage(texture)
    
    -- Interakcja: Kliknięcie ikony linkuje przedmiot w czacie
    icon:SetCallback("OnClick", function()
        if link then ChatEdit_InsertLink(link) end
    end)
    -- Tooltip po najechaniu
    icon:SetCallback("OnEnter", function(widget)
        GameTooltip:SetOwner(widget.frame, "ANCHOR_TOPRIGHT")
        if link then GameTooltip:SetHyperlink(link) else GameTooltip:SetItemID(item_id) end
        GameTooltip:Show()
    end)
    icon:SetCallback("OnLeave", function() GameTooltip:Hide() end)
    
    -- 2. Tekst (Slot na niebiesko, Nazwa w kolorze jakości, ID na szaro)
    -- Używamy InteractiveLabel dla pewności klikalności
    local label = AceGUI:Create("InteractiveLabel") 
    label:SetFont("Fonts\\FRIZQT__.TTF", 11, "")
    
    local itemName = GetItemInfo(item_id) or ("loading " .. item_id)
    
    -- POPRAWKA KOLORÓW: Generujemy hex ręcznie, aby uniknąć błędu "|c|c..."
    local r, g, b = GetItemQualityColor(quality or 1)
    local colorHex = string.format("ff%02x%02x%02x", r * 255, g * 255, b * 255)
    
    -- Formatowanie HTML-like (AceGUI to obsługuje)
    -- Linia 1: [SLOT] (Cyan)
    -- Linia 2: Nazwa Przedmiotu (Kolor Rarity)
    local text = string.format("|cff00ccff[%s]|r\n|c%s%s|r", 
        slot_name:upper(),
        colorHex, itemName
    )
    
    label:SetText(text)
    label:SetWidth(240) -- Reszta szerokości dla tekstu
    
    -- Interakcja na tekście też (dla wygody)
    label:SetCallback("OnClick", function() if link then ChatEdit_InsertLink(link) end end)
    label:SetCallback("OnEnter", function(widget)
        GameTooltip:SetOwner(widget.frame, "ANCHOR_TOPRIGHT")
        if link then GameTooltip:SetHyperlink(link) else GameTooltip:SetItemID(item_id) end
        GameTooltip:Show()
    end)
    label:SetCallback("OnLeave", function() GameTooltip:Hide() end)

    row:AddChild(icon)
    row:AddChild(label)
    
    container:AddChild(row)
end

local function UpdateChecklistPanel()
    if not bisChecklistMode then
        if checklistPanel then checklistPanel:Hide() end
        return
    end
    if not main_frame or not main_frame.frame or not main_frame.frame:IsShown() then return end

    EnsureChecklistPanel()
    if not checklistPanel or not checklistPanel._container then return end
    checklistPanel:Show()
    
    -- Czyścimy stare elementy (ważne przy odświeżaniu!)
    checklistPanel._container:ReleaseChildren()

    local groups, totalMissing = BuildChecklistGroups()

    -- 1. Nagłówek "Missing Items"
    local headerGroup = AceGUI:Create("SimpleGroup")
    headerGroup:SetFullWidth(true)
    local headerLbl = AceGUI:Create("Label")
    headerLbl:SetText(string.format("Items Missing: |cffffd100%d|r", totalMissing))
    headerLbl:SetFont("Fonts\\FRIZQT__.TTF", 12)
    headerLbl:SetColor(1,1,1)
    headerLbl:SetJustifyH("CENTER")
    headerGroup:AddChild(headerLbl)
    checklistPanel._container:AddChild(headerGroup)

    local zones = {}
    for z in pairs(groups or {}) do table.insert(zones, z) end
    table.sort(zones)

    for _, z in ipairs(zones) do
        local bosses = {}
        for b in pairs(groups[z]) do table.insert(bosses, b) end
        table.sort(bosses)

        for _, b in ipairs(bosses) do
            -- Używamy funkcji graficznej do rysowania bossa
            DrawBossHeaderGUI(checklistPanel._container, b, z)
            
            local row = groups[z][b]
            if row and row.items then
                for _, it in ipairs(row.items) do
                    -- Używamy funkcji graficznej do rysowania przedmiotu
                    DrawItemRowGUI(checklistPanel._container, it.id, it.slot)
                end
            end
        end
    end
end

-- Background item preloader (small batch per tick)
local preloadFrame = CreateFrame("Frame")
preloadFrame:Hide()
local preloadQueue = {}
local preloadSeen = {}
local preloadCooldown = 0
local PRELOAD_BATCH = 12
local PRELOAD_INTERVAL = 0.12

local function QueuePreload(item_id)
    if not item_id or item_id <= 0 then return end
    if preloadSeen[item_id] then return end
    preloadSeen[item_id] = true
    table.insert(preloadQueue, item_id)
    preloadFrame:Show()
end

preloadFrame:SetScript("OnUpdate", function(self, elapsed)
    preloadCooldown = (preloadCooldown or 0) - (elapsed or 0)
    if preloadCooldown > 0 then return end
    preloadCooldown = PRELOAD_INTERVAL

    if #preloadQueue == 0 then
        self:Hide()
        return
    end

    -- Use a hidden scanner tooltip to trigger client cache fill in small batches
    if not BistooltipAddon._preloadScanner then
        local tt = CreateFrame("GameTooltip", "BistooltipPreloadScanner", UIParent, "GameTooltipTemplate")
        tt:SetOwner(UIParent, "ANCHOR_NONE")
        tt:Hide()
        BistooltipAddon._preloadScanner = tt
    end
    local scanTT = BistooltipAddon._preloadScanner

    for i = 1, PRELOAD_BATCH do
        local item_id = table.remove(preloadQueue, 1)
        if not item_id then break end
        if not GetItemInfo(item_id) then
            scanTT:SetHyperlink("item:" .. item_id .. ":0:0:0:0:0:0:0")
            scanTT:Hide()
        end
    end

    -- If UI is open, refresh visible rows once cache likely improved
    if main_frame and spec_frame and main_frame.frame:IsShown() then
        drawSpecData()
    end
end)



local function createItemFrame(item_id, size, with_checkmark)
    if item_id < 0 then
        return AceGUI:Create("Label")
    end

    local item_frame = AceGUI:Create("Icon")
    item_frame:SetImageSize(size, size)

    local aliItemID
    if Bistooltip_horde_to_ali then
        aliItemID = Bistooltip_horde_to_ali[item_id]
    end

    if aliItemID then
        item_id = aliItemID
    end

    local itemName, itemLink, _, _, _, _, _, _, _, itemIcon, _, itemType, _, bindType = GetItemInfo(item_id)

    if not itemName then
        item_frame:SetImage("Interface\\Icons\\INV_Misc_QuestionMark")
        QueuePreload(item_id)
        return item_frame
    end

    item_frame:SetImage(itemIcon)


    if with_checkmark then
        -- High-visibility owned overlay:
        --  - glowing border (equipped = green, bags = gold)
        --  - bold ready-check mark with shadow
        local texCheck  = "Interface\\RaidFrame\\ReadyCheck-Ready"
        local texBorder = "Interface\\Buttons\\UI-ActionButton-Border"
        local markSize  = math.max(18, math.floor(size * 0.60))
        local borderSize = math.floor(size * 1.6)
    
        local border = item_frame.frame:CreateTexture(nil, "OVERLAY")
        border:SetTexture(texBorder)
        border:SetBlendMode("ADD")
        border:SetPoint("CENTER", item_frame.frame, "CENTER", 0, 0)
        border:SetWidth(borderSize)
        border:SetHeight(borderSize)
        border:SetTexCoord(0.13, 0.87, 0.13, 0.87)
    
        local shadow = item_frame.frame:CreateTexture(nil, "OVERLAY")
        shadow:SetTexture(texCheck)
        shadow:SetWidth(markSize)
        shadow:SetHeight(markSize)
        shadow:SetPoint("BOTTOMRIGHT", -2, 2)
        shadow:SetVertexColor(0, 0, 0, 0.75)
    
        local mark = item_frame.frame:CreateTexture(nil, "OVERLAY")
        mark:SetTexture(texCheck)
        mark:SetWidth(markSize)
        mark:SetHeight(markSize)
        mark:SetPoint("BOTTOMRIGHT", -3, 3)
    
        if with_checkmark == "equipped" then
            mark:SetVertexColor(0.20, 1.00, 0.20, 1.00)
            border:SetVertexColor(0.20, 1.00, 0.20, 0.85)
        else
            mark:SetVertexColor(1.00, 0.85, 0.15, 1.00)
            border:SetVertexColor(1.00, 0.85, 0.15, 0.85)
        end
    
        table.insert(checkmarks, border)
        table.insert(checkmarks, shadow)
        table.insert(checkmarks, mark)
    end


    -- Small stack count overlay for bag copies
    if with_checkmark == "bags" then
        local countText = item_frame.frame:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
        countText:SetPoint("BOTTOMRIGHT", -2, 2)
        countText:SetJustifyH("RIGHT")
        countText:SetTextColor(1, 1, 1, 1)
        countText:SetText("")
        countText._bt_item_id = item_id
        item_frame.frame._bt_countText = countText
    end

    if bindType == 2 then
        local boeMark = item_frame.frame:CreateTexture(nil, "OVERLAY")
        boeMark:SetWidth(12)
        boeMark:SetHeight(12)
        boeMark:SetPoint("TOPLEFT", 2, -5)
        boeMark:SetTexture("Interface\\Icons\\INV_Misc_Coin_01")
        table.insert(boemarks, boeMark)
    end

    item_frame:SetCallback("OnClick", function(button)
        SetItemRef(itemLink, itemLink, "LeftButton")
    end)
    item_frame:SetCallback("OnEnter", function(widget)
        GameTooltip:SetOwner(item_frame.frame)
        GameTooltip:SetPoint("TOPRIGHT", item_frame.frame, "TOPRIGHT", 220, -13)
        GameTooltip:SetHyperlink(itemLink)
    end)
    item_frame:SetCallback("OnLeave", function(widget)
        GameTooltip:Hide()
    end)

    return item_frame
end

local function createSpellFrame(spell_id, size)
    if spell_id < 0 then
        local f = AceGUI:Create("Label")
        return f
    end

    local spell_frame = AceGUI:Create("Icon")
    spell_frame:SetImageSize(size, size)

    -- Retrieve spell info directly using GetSpellInfo
    local name, rank, icon, castTime, minRange, maxRange = GetSpellInfo(spell_id)
    if not name then
        print("Failed to retrieve spell info for spell ID:", spell_id)
        return spell_frame
    end

    spell_frame:SetImage(icon)
    local link = GetSpellLink(spell_id)
    if not link then
        link = "\124cffffd000\124Hspell:" .. spell_id .. "\124h[" .. name .. "]\124h\124r"
    end

    -- Set callbacks for interactivity
    spell_frame:SetCallback("OnClick", function(button)
        SetItemRef(link, link, "LeftButton")
    end)
    spell_frame:SetCallback("OnEnter", function(widget)
        GameTooltip:SetOwner(spell_frame.frame)
        GameTooltip:SetPoint("TOPRIGHT", spell_frame.frame, "TOPRIGHT", 220, -13)
        GameTooltip:SetHyperlink(link)
    end)
    spell_frame:SetCallback("OnLeave", function(widget)
        GameTooltip:Hide()
    end)

    return spell_frame
end

local function createEnhancementsFrame(enhancements)
    local frame = AceGUI:Create("SimpleGroup")
    frame:SetLayout("Table")
    frame:SetWidth(40)
    frame:SetHeight(40)
    frame:SetUserData("table", {
        columns = {{
            weight = 14
        }, {
            width = 14
        }},
        spaceV = -10,
        spaceH = 0,
        align = "BOTTOMRIGHT"
    })
    frame:SetFullWidth(true)
    frame:SetFullHeight(true)
    frame:SetHeight(0)
    frame:SetAutoAdjustHeight(false)
    for i, enhancement in ipairs(enhancements) do
        local size = 16

        if enhancement.type == "none" then
            frame:AddChild(createItemFrame(-1, size))
        end
        if enhancement.type == "item" then
            frame:AddChild(createItemFrame(enhancement.id, size))
        end
        if enhancement.type == "spell" then
            frame:AddChild(createSpellFrame(enhancement.id, size))
        end
    end
    return frame
end

local function drawItemSlot(slot)
    local f = AceGUI:Create("Label")
    f:SetText(slot.slot_name)
    f:SetFont("Fonts\\FRIZQT__.TTF", 14, "")
    spec_frame:AddChild(f)
    spec_frame:AddChild(createEnhancementsFrame(slot.enhs))

    for i, original_item_id in ipairs(slot) do
        local item_id = original_item_id

        -- Check if Bistooltip_horde_to_ali is defined and use it for translation if available
        if isHorde and Bistooltip_horde_to_ali then
            local translated_item_id = Bistooltip_horde_to_ali[original_item_id]
            if translated_item_id then
                item_id = translated_item_id
            end
        end

        -- Owned overlays (equipped vs bags) from Core.lua cache
        local owned = GetOwnedRow(item_id)
        local ownedState = nil
        local ownedCount = 0
        if owned then
            local bags = owned.bags or 0
            local eq = owned.equipped or 0
            if eq > 0 then
                ownedState = "equipped"
            elseif bags > 0 then
                ownedState = "bags"
                ownedCount = bags
            end
        end

        -- Optional filter: show only missing items
        if showOnlyMissing and ownedState then
            -- Keep layout stable: show a placeholder label
            spec_frame:AddChild(AceGUI:Create("Label"))
        else
            local w = createItemFrame(item_id, 40, ownedState)
            -- Stack count overlay (bags only)
            if w and w.frame and w.frame._bt_countText then
                if ownedState == "bags" and ownedCount > 1 then
                    w.frame._bt_countText:SetText(ownedCount)
                else
                    w.frame._bt_countText:SetText("")
                end
            end
            spec_frame:AddChild(w)
        end
    end

-- BIS checklist mode: show drop source under BIS slots (Top 1, and Top 2 for dual-slot items)
-- BIS checklist mode: show drop source under BIS slots (Top 1, and Top 2 for dual-slot items)
    if bisChecklistMode then
        local first = NormalizeItemID(slot and slot[1])
        local dual = first and IsDualSlot(slot, first)

        -- Puste etykiety pod Slot i Enchanty (zachowanie układu tabeli)
        spec_frame:AddChild(AceGUI:Create("Label")) 
        spec_frame:AddChild(AceGUI:Create("Label")) 

        for col = 1, 6 do
            local lbl = AceGUI:Create("Label")
            
            -- 1. Ustawienia czcionki: Mała, ale pogrubiona
            lbl:SetFont("Fonts\\FRIZQT__.TTF", 9, "OUTLINE")
            
            -- 2. WYMIARY (To naprawia nakładanie się tekstów):
            -- Szerokość 60px (szerokość kolumny) + Wysokość 24px (miejsce na 2 linie tekstu)
            lbl:SetWidth(60)
            lbl:SetHeight(24)
            
            -- 3. Centrowanie
            lbl:SetJustifyH("CENTER")
            lbl:SetJustifyV("TOP")
            
            local txt = ""
            if col == 1 then
                txt = GetChecklistUnderItemText(first)
            elseif col == 2 and dual then
                local second = NormalizeItemID(slot and slot[2])
                txt = GetChecklistUnderItemText(second)
            end
            
            lbl:SetText(txt)
            spec_frame:AddChild(lbl)
        end
    end
end

local function drawTableHeader(frame)
    local f = AceGUI:Create("Label")
    f:SetText("Slot")
    f:SetFont("Fonts\\FRIZQT__.TTF", 14, "")
    local color = 0.6
    f:SetColor(color, color, color)
    frame:AddChild(f)
    frame:AddChild(AceGUI:Create("Label"))
    for i = 1, 6 do
        f = AceGUI:Create("Label")
        f:SetText("Top " .. i)
        f:SetColor(color, color, color)
        frame:AddChild(f)
    end
end

local function saveData()
    BistooltipAddon.db.char.class_index = class_index
    BistooltipAddon.db.char.spec_index = spec_index
    BistooltipAddon.db.char.phase_index = phase_index
end

local function clearCheckMarks()
    for key, value in ipairs(checkmarks) do
        value:SetTexture(nil)
    end
    checkmarks = {}
end

local function clearBoeMarks()
    for key, value in ipairs(boemarks) do
        value:SetTexture(nil)
    end
    boemarks = {}
end

drawSpecData = function()
    clearCheckMarks()
    clearBoeMarks()
    saveData()
    items = {}
    spells = {}
    spec_frame:ReleaseChildren()
    drawTableHeader(spec_frame)
    if not spec or not phase then
        return
    end
    local slots = Bistooltip_bislists[class][spec][phase]
    if not slots then return end

    local function rowMatches(slot)
        if not searchTextLower or searchTextLower == "" then return true end
        -- match slot name
        if slot.slot_name and string.find(string.lower(slot.slot_name), searchTextLower, 1, true) then
            return true
        end
        -- match item id or cached item names
        for _, iid in ipairs(slot) do
            local id = iid
            if isHorde and Bistooltip_horde_to_ali and Bistooltip_horde_to_ali[iid] then
                id = Bistooltip_horde_to_ali[iid]
            end
            if tostring(id) == searchTextLower then
                return true
            end
            local name = GetItemInfo(id)
            if name and string.find(string.lower(name), searchTextLower, 1, true) then
                return true
            elseif not name then
                QueuePreload(id)
            end
        end
        return false
    end

    for i, slot in ipairs(slots) do
        if rowMatches(slot) then
            if bisChecklistMode and SlotBISCompleted(slot) then
                -- Slot is already completed (BIS owned) -> hide the whole line in checklist mode
            else
                drawItemSlot(slot)

                -- Build "targets to snipe" summary (missing BIS items only)
                if bisChecklistMode and checklistSummaryLabel then
                    checklistSummaryLabel._bt_targets = checklistSummaryLabel._bt_targets or {}
                    checklistSummaryLabel._bt_unknown = checklistSummaryLabel._bt_unknown or {}

                    local function addTarget(item_id)
                        if not item_id or item_id <= 0 then return end
                        if _G.BistooltipAddon and _G.BistooltipAddon.GetItemSourceInfo then
                            local zone, boss = _G.BistooltipAddon:GetItemSourceInfo(item_id)
                            if zone and boss then
                                local tz = checklistSummaryLabel._bt_targets
                                tz[zone] = tz[zone] or {}
                                local tb = tz[zone][boss]
                                if not tb then
                                    tb = { count = 0 }
                                    tz[zone][boss] = tb
                                end
                                tb.count = (tb.count or 0) + 1
                                return
                            end
                        end
                        checklistSummaryLabel._bt_unknown[item_id] = true
                    end

                    local req = GetRequiredBISItemsForSlot(slot)
                    if #req == 1 then
                        if OwnedCount(req[1]) < 1 then addTarget(req[1]) end
                    elseif #req >= 2 then
                        if req[1] == req[2] then
                            if OwnedCount(req[1]) < 2 then addTarget(req[1]) end
                        else
                            if OwnedCount(req[1]) < 1 then addTarget(req[1]) end
                            if OwnedCount(req[2]) < 1 then addTarget(req[2]) end
                        end
                    end
                end
            end
        end
    end

    -- Render checklist hint (full detail is in side panel)
    if checklistSummaryLabel then
        if not bisChecklistMode then
            checklistSummaryLabel:SetText("")
        else
            checklistSummaryLabel:SetText("|cffffff00BIS checklist|r: sources are shown under Top1/Top2. See targets on the right panel.")
        end
        checklistSummaryLabel._bt_targets = nil
        checklistSummaryLabel._bt_unknown = nil
    end

    -- Update checklist side panel
    UpdateChecklistPanel()
end




local function buildClassDict()
    class_options = {}
    class_options_to_class = {}

    -- Prefer explicit Bistooltip_classes (if present & populated)
    if Bistooltip_classes and type(Bistooltip_classes) == "table" and #Bistooltip_classes > 0 then
        for ci, class in ipairs(Bistooltip_classes) do
            local option_name = ColorizeClassOption(class.name)
            table.insert(class_options, option_name)
            class_options_to_class[option_name] = { name = class.name, i = ci }
        end
        return
    end

    -- Fallback: build from spec icons + optional index order
    local ordered = {}
    if Bistooltip_classes_indexes then
        for cname, idx in pairs(Bistooltip_classes_indexes) do ordered[idx] = cname end
    end
    if #ordered == 0 and Bistooltip_spec_icons then
        for cname, _ in pairs(Bistooltip_spec_icons) do table.insert(ordered, cname) end
        table.sort(ordered)
    end

    local ci = 1
    for _, cname in ipairs(ordered) do
        local option_name = ColorizeClassOption(cname)
        table.insert(class_options, option_name)
        class_options_to_class[option_name] = { name = cname, i = ci }
        ci = ci + 1
    end
end



local function buildSpecsDict(class_i)
    spec_options = {}
    spec_options_to_spec = {}

    -- If we have Bistooltip_classes, use its spec ordering (preferred)
    if Bistooltip_classes and type(Bistooltip_classes) == "table" and #Bistooltip_classes > 0 then
        local cls = Bistooltip_classes[class_i]
        if not cls or not cls.specs then return end

        for _, specName in ipairs(cls.specs) do
            local icon = nil
            if Bistooltip_spec_icons and Bistooltip_spec_icons[cls.name] then
                icon = Bistooltip_spec_icons[cls.name][specName]
            end

            local option_name = icon and ("|T" .. icon .. ":14|t " .. specName) or specName
            table.insert(spec_options, option_name)
            spec_options_to_spec[option_name] = specName
        end
        return
    end

    -- Fallback: build from bislists keys (alphabetical)
    local clsName = class_options_to_class[class_options[class_i]] and class_options_to_class[class_options[class_i]].name
    if not clsName or not Bistooltip_wowtbc_bislists or not Bistooltip_wowtbc_bislists[clsName] then return end

    local specs = {}
    for sname, _ in pairs(Bistooltip_wowtbc_bislists[clsName]) do
        table.insert(specs, sname)
    end
    table.sort(specs)

    for _, sname in ipairs(specs) do
        table.insert(spec_options, sname)
        spec_options_to_spec[sname] = sname
    end
end

local function loadData()
    class_index = BistooltipAddon.db.char.class_index
    spec_index = BistooltipAddon.db.char.spec_index
    phase_index = BistooltipAddon.db.char.phase_index
    if class_index then
        if not class_index or not class_options[class_index] then class_index = 1 end
    class = class_options_to_class[class_options[class_index]].name
        buildSpecsDict(class_index)
    end
    if spec_index then
        if not spec_index or not spec_options[spec_index] then spec_index = 1 end
    spec = spec_options_to_spec[spec_options[spec_index]]
    end
    if phase_index then
        if not phase_index or not Bistooltip_phases[phase_index] then phase_index = 1 end
    phase = Bistooltip_phases[phase_index]
    end
end

local function drawDropdowns()
    local dropDownGroup = AceGUI:Create("SimpleGroup")

    dropDownGroup:SetLayout("Table")
    dropDownGroup:SetUserData("table", {
        columns = {110, 180, 70},
        space = 1,
        align = "BOTTOMRIGHT"
    })
    main_frame:AddChild(dropDownGroup)

    classDropdown = AceGUI:Create("Dropdown")
    specDropdown = AceGUI:Create("Dropdown")
    phaseDropDown = AceGUI:Create("Dropdown")
    specDropdown:SetDisabled(true)

    phaseDropDown:SetCallback("OnValueChanged", function(_, _, key)
        phase_index = key
        phase = Bistooltip_phases[key]
        drawSpecData()
    end)

    specDropdown:SetCallback("OnValueChanged", function(_, _, key)
        spec_index = key
        spec = spec_options_to_spec[spec_options[key]]
        drawSpecData()
    end)

    classDropdown:SetCallback("OnValueChanged", function(_, _, key)
        class_index = key
        class = class_options_to_class[class_options[key]].name

        specDropdown:SetDisabled(false)
        buildSpecsDict(key)
        specDropdown:SetList(spec_options)
        specDropdown:SetValue(1)
        spec_index = 1
        spec = spec_options_to_spec[spec_options[1]]
        drawSpecData()
    end)

    classDropdown:SetList(class_options)
    phaseDropDown:SetList(Bistooltip_phases)

    dropDownGroup:AddChild(classDropdown)
    dropDownGroup:AddChild(specDropdown)
    dropDownGroup:AddChild(phaseDropDown)

    local fillerFrame = AceGUI:Create("Label")
    fillerFrame:SetText(" ")
    main_frame:AddChild(fillerFrame)

    classDropdown:SetValue(class_index)
    if (class_index) then
        buildSpecsDict(class_index)
        specDropdown:SetList(spec_options)
        specDropdown:SetDisabled(false)
    end
    specDropdown:SetValue(spec_index)
    phaseDropDown:SetValue(phase_index)
end

local function createSpecFrame()
    local frame = AceGUI:Create("ScrollFrame")
    frame:SetLayout("Table")
    frame:SetUserData("table", {
        columns = {{
            weight = 40
        }, {
            width = 44
        }, {
            width = 58
        }, {
            width = 58
        }, {
            width = 44
        }, {
            width = 44
        }, {
            width = 44
        }, {
            width = 44
        }},
        space = 1,
        align = "middle"
    })
    frame:SetFullWidth(true)
    frame:SetHeight(370)
    frame:SetAutoAdjustHeight(false)
    main_frame:AddChild(frame)
    spec_frame = frame
end

function BistooltipAddon:reloadData()
    buildClassDict()
    class_index = BistooltipAddon.db.char.class_index
    spec_index = BistooltipAddon.db.char.spec_index
    phase_index = BistooltipAddon.db.char.phase_index

    if not class_index or not class_options[class_index] then class_index = 1 end
    class = class_options_to_class[class_options[class_index]].name
    buildSpecsDict(class_index)
    if not spec_index or not spec_options[spec_index] then spec_index = 1 end
    spec = spec_options_to_spec[spec_options[spec_index]]
    if not phase_index or not Bistooltip_phases[phase_index] then phase_index = 1 end
    phase = Bistooltip_phases[phase_index]

    if main_frame then
        phaseDropDown:SetList(Bistooltip_phases)
        classDropdown:SetList(class_options)
        specDropdown:SetList(spec_options)

        classDropdown:SetValue(class_index)
        specDropdown:SetValue(spec_index)
        phaseDropDown:SetValue(phase_index)

        drawSpecData()
        main_frame:SetStatusText(Bistooltip_source_to_url[BistooltipAddon.db.char["data_source"]])
    end

    -- Refresh owned-item cache once (do NOT trigger continuous scans)
    if BistooltipAddon.ScanEquipment then
        BistooltipAddon:ScanEquipment(true)
    end
end

function BistooltipAddon:OpenDiscordLink()
    BistooltipAddon:closeMainFrame()
    StaticPopup_Show("DISCORD_LINK_DIALOG")
    StaticPopupDialogs["DISCORD_LINK_DIALOG"].preferredIndex = 4
end

StaticPopupDialogs["DISCORD_LINK_DIALOG"] = {
    text = "Join our Discord",
    button1 = "Copy Link",
    button2 = "Close",
    OnShow = function(self)
        self.editBox:SetText("https://discord.gg/Xk8BKqSapd")
        self.editBox:SetFocus()
        self.editBox:HighlightText()
    end,
    timeout = 0,
    whileDead = true,
    hideOnEscape = true,
    preferredIndex = 4,
    hasEditBox = true,
    EditBoxOnEscapePressed = function(self)
        self:GetParent():Hide()
    end,
    EditBoxOnEnterPressed = function(self)
        self:GetParent().button1:Click()
    end,
    OnHide = function(self)
        self.data = nil
    end,
    EditBoxOnTextChanged = function(self, userInput)
        if userInput then
            self:SetText(self.data)
            self:HighlightText()
        end
    end,
    OnAccept = function(self)
        -- On 3.3.5, EditBox:CopyText() may not exist. Keep text highlighted for Ctrl+C.
        self.editBox:SetFocus()
        self.editBox:HighlightText()
    end,
    OnCancel = function(self)
        self:Hide()
    end
}

function BistooltipAddon:initBislists()
    buildClassDict()
    loadData()
    LibStub("AceConsole-3.0"):RegisterChatCommand("bistooltip", function()
        BistooltipAddon:createMainFrame()
    end, persist)
end



function BistooltipAddon:createMainFrame()
    if main_frame then
        BistooltipAddon:closeMainFrame()
        return
    end

    -- Restore UI modes from saved variables (if present)
    if BistooltipAddon and BistooltipAddon.db and BistooltipAddon.db.char then
        if BistooltipAddon.db.char.bis_checklist ~= nil then
            bisChecklistMode = BistooltipAddon.db.char.bis_checklist and true or false
        end
    end

    main_frame = AceGUI:Create("Frame")
    main_frame:SetWidth(520)
    main_frame:SetHeight(640)

    main_frame.frame:SetMinResize(480, 360)
    main_frame.frame:SetMaxResize(1000, 800)

    -- ESC behavior: 1st ESC closes checklist panel (if open), 2nd ESC closes the main window
    main_frame.frame:EnableKeyboard(true)
    main_frame.frame:SetScript("OnKeyDown", function(_, key)
        if key == "ESCAPE" then
            if checklistPanel and checklistPanel:IsShown() then
                checklistPanel:Hide()
                if checklistContainer then checklistContainer:ReleaseChildren() end
            else
                main_frame:Hide()
            end
        end
    end)

    local statusFrame = nil

    main_frame:SetCallback("OnClose", function(widget)
        if statusFrame then
            statusFrame:SetScript("OnUpdate", nil)
            statusFrame = nil
        end

        clearCheckMarks()
        clearBoeMarks()
        spec_frame = nil
        items = {}
        spells = {}

        DestroyChecklistPanel()

        AceGUI:Release(widget)
        main_frame = nil
        checklistSummaryLabel = nil
    end)

    main_frame:SetLayout("List")
    main_frame:SetTitle(BistooltipAddon.AddonNameAndVersion)
    main_frame:SetStatusText(Bistooltip_source_to_url[BistooltipAddon.db.char["data_source"]])

    drawDropdowns()
    createSpecFrame()

    -- Search + filters
    local searchGroup = AceGUI:Create("SimpleGroup")
    searchGroup:SetFullWidth(true)
    searchGroup:SetLayout("Flow")

    local searchBox = AceGUI:Create("EditBox")
    searchBox:SetLabel("Search")
    searchBox:SetWidth(220)
    searchBox:SetCallback("OnTextChanged", function(_, _, txt)
        searchText = txt or ""
        searchTextLower = string.lower(searchText)
        drawSpecData()
    end)
    searchGroup:AddChild(searchBox)

    local missingToggle = AceGUI:Create("CheckBox")
    missingToggle:SetLabel("Only missing")
    missingToggle:SetWidth(120)
    missingToggle:SetValue(showOnlyMissing and true or false)
    missingToggle:SetCallback("OnValueChanged", function(_, _, val)
        showOnlyMissing = val and true or false
        drawSpecData()
    end)
    searchGroup:AddChild(missingToggle)

    local checklistToggle = AceGUI:Create("CheckBox")
    checklistToggle:SetLabel("BIS checklist")
    checklistToggle:SetWidth(120)
    checklistToggle:SetValue(bisChecklistMode and true or false)
    checklistToggle:SetCallback("OnValueChanged", function(_, _, val)
        bisChecklistMode = val and true or false

        -- Persist
        if BistooltipAddon and BistooltipAddon.db and BistooltipAddon.db.char then
            BistooltipAddon.db.char.bis_checklist = bisChecklistMode
        end

        -- Checklist mode takes priority over "Only missing" (mutual exclusion)
        if bisChecklistMode then
            showOnlyMissing = false
            missingToggle:SetValue(false)
            missingToggle:SetDisabled(true)
        else
            missingToggle:SetDisabled(false)
            DestroyChecklistPanel()
        end

        drawSpecData()
    end)
    searchGroup:AddChild(checklistToggle)

    if bisChecklistMode then
        missingToggle:SetDisabled(true)
        missingToggle:SetValue(false)
        showOnlyMissing = false
    end

    main_frame:AddChild(searchGroup)

    -- Compact checklist hint (full details are in the right panel)
    local checklistGroup = AceGUI:Create("SimpleGroup")
    checklistGroup:SetFullWidth(true)
    checklistGroup:SetLayout("Fill")

    checklistSummaryLabel = AceGUI:Create("Label")
    checklistSummaryLabel:SetFullWidth(true)
    checklistSummaryLabel:SetFont("Fonts\\FRIZQT__.TTF", 11, "")
    checklistSummaryLabel:SetText("")
    checklistGroup:AddChild(checklistSummaryLabel)
    main_frame:AddChild(checklistGroup)

    -- Buttons container
    local buttonContainer = AceGUI:Create("SimpleGroup")
    buttonContainer:SetFullWidth(true)
    buttonContainer:SetLayout("Flow")

    local reloadButton = AceGUI:Create("Button")
    reloadButton:SetText("Reload Data")
    reloadButton:SetWidth(120)
    reloadButton:SetCallback("OnClick", function()
        BistooltipAddon:reloadData()
    end)
    buttonContainer:AddChild(reloadButton)

    local discordButton = AceGUI:Create("Button")
    discordButton:SetText("Join our Discord")
    discordButton:SetWidth(140)
    discordButton:SetCallback("OnClick", function()
        BistooltipAddon:OpenDiscordLink()
    end)
    buttonContainer:AddChild(discordButton)

    local noteLabel = AceGUI:Create("Label")
    noteLabel:SetText("")
    noteLabel:SetWidth(250)
    noteLabel:SetFont(GameFontNormal:GetFont(), 9)

    local spacerLabel = AceGUI:Create("Label")
    spacerLabel:SetWidth(20)
    buttonContainer:AddChild(spacerLabel)
    buttonContainer:AddChild(noteLabel)

    noteLabel:SetHeight(reloadButton.frame:GetHeight())
    noteLabel:SetFullWidth(false)
    if noteLabel.label and noteLabel.label.SetPoint then
        noteLabel.label:SetPoint("BOTTOM")
    end

    local function UpdateStatusText()
        local ds = (_G.DataStore_Inventory and "ON") or "OFF"
        local q = #preloadQueue
        local s = "DataStore: " .. ds
        if q > 0 then
            s = s .. "  •  Loading item info: " .. q
        end
        if searchTextLower and searchTextLower ~= "" then
            s = s .. "  •  Filter: " .. searchText
        end
        noteLabel:SetText(s)
    end

    statusFrame = CreateFrame("Frame", nil, main_frame.frame)
    statusFrame:SetScript("OnUpdate", function()
        UpdateStatusText()
    end)

    local spacer = AceGUI:Create("Label")
    spacer:SetFullWidth(true)
    spacer:SetText(" ")
    main_frame:AddChild(spacer)
    main_frame:AddChild(buttonContainer)

    -- Initial draw (after UI elements exist)
    drawSpecData()
end

function BistooltipAddon:closeMainFrame()
    if main_frame then
        AceGUI:Release(main_frame)
        main_frame = nil
        classDropdown = nil
        specDropdown = nil
        phaseDropDown = nil
    end
end