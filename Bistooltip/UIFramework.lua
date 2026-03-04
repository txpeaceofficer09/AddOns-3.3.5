-- ============================================================
-- UIFramework.lua - Custom UI Layout System
-- Replaces problematic AceGUI Table Layout with precise positioning
-- ============================================================

local ADDON_NAME = "Bis-Tooltip"

-- Create namespace
BistooltipUI = BistooltipUI or {}

local Utils = BistooltipUtils
local Constants = BistooltipConstants
local Pools = BistooltipPools

-- ============================================================
-- Layout Constants
-- ============================================================

local LAYOUT = {
    PADDING = 4,
    SPACING = 2,
    ROW_HEIGHT = 48,
    HEADER_HEIGHT = 24,
    ICON_SIZE = 40,
    ICON_SPACING = 4,
    SLOT_LABEL_WIDTH = 80,
    ENH_LABEL_WIDTH = 55,
    SCROLL_STEP = 40,
}

BistooltipUI.LAYOUT = LAYOUT

-- ============================================================
-- ScrollFrame Factory
-- Creates a scrollable container with proper mouse wheel support
-- ============================================================

function BistooltipUI.CreateScrollFrame(parent, name)
    local scrollFrame = CreateFrame("ScrollFrame", name, parent)
    scrollFrame:EnableMouseWheel(true)
    
    -- Content frame that holds all children
    local content = CreateFrame("Frame", (name or "BT_Scroll") .. "Content", scrollFrame)
    content:SetPoint("TOPLEFT")
    content:SetWidth(scrollFrame:GetWidth())
    scrollFrame:SetScrollChild(content)
    
    -- Scrollbar
    local scrollBar = CreateFrame("Slider", (name or "BT_Scroll") .. "Bar", scrollFrame, "UIPanelScrollBarTemplate")
    scrollBar:SetPoint("TOPRIGHT", -4, -16)
    scrollBar:SetPoint("BOTTOMRIGHT", -4, 16)
    scrollBar:SetMinMaxValues(0, 1)
    scrollBar:SetValueStep(LAYOUT.SCROLL_STEP)
    scrollBar:SetValue(0)
    scrollBar:SetWidth(16)
    scrollBar:SetScript("OnValueChanged", function(self, value)
        scrollFrame:SetVerticalScroll(value)
    end)
    
    -- Mouse wheel support
    scrollFrame:SetScript("OnMouseWheel", function(self, delta)
        local current = scrollBar:GetValue()
        local min, max = scrollBar:GetMinMaxValues()
        local step = LAYOUT.SCROLL_STEP * 2
        
        if delta > 0 then
            scrollBar:SetValue(math.max(min, current - step))
        else
            scrollBar:SetValue(math.min(max, current + step))
        end
    end)
    
    -- Update scroll range when content changes
    local function UpdateScrollRange()
        local contentHeight = content:GetHeight()
        local frameHeight = scrollFrame:GetHeight()
        local maxScroll = math.max(0, contentHeight - frameHeight)
        scrollBar:SetMinMaxValues(0, maxScroll)
        
        if maxScroll > 0 then
            scrollBar:Show()
            content:SetWidth(scrollFrame:GetWidth() - 24)
        else
            scrollBar:Hide()
            scrollBar:SetValue(0)
            content:SetWidth(scrollFrame:GetWidth())
        end
    end
    
    scrollFrame._content = content
    scrollFrame._scrollBar = scrollBar
    scrollFrame._updateScrollRange = UpdateScrollRange
    
    -- Helper: set scroll position
    function scrollFrame:SetScroll(value)
        scrollBar:SetValue(value or 0)
    end
    
    -- Helper: get scroll position
    function scrollFrame:GetScroll()
        return scrollBar:GetValue()
    end
    
    -- Size change handler
    scrollFrame:SetScript("OnSizeChanged", function(self)
        content:SetWidth(self:GetWidth() - (scrollBar:IsShown() and 24 or 0))
        UpdateScrollRange()
    end)
    
    return scrollFrame
end

-- ============================================================
-- GridLayout - Arranges children in a grid pattern
-- ============================================================

local GridLayout = {}
GridLayout.__index = GridLayout

function BistooltipUI.CreateGridLayout(parent, columns, cellWidth, cellHeight, spacing)
    local self = setmetatable({}, GridLayout)
    
    self.parent = parent
    self.columns = columns or 6
    self.cellWidth = cellWidth or 48
    self.cellHeight = cellHeight or 48
    self.spacing = spacing or LAYOUT.SPACING
    self.children = {}
    self.currentRow = 0
    self.currentCol = 0
    
    return self
end

function GridLayout:AddChild(child)
    if not child then return end
    
    child:SetParent(self.parent)
    child:ClearAllPoints()
    
    local x = self.currentCol * (self.cellWidth + self.spacing)
    local y = -(self.currentRow * (self.cellHeight + self.spacing))
    
    child:SetPoint("TOPLEFT", self.parent, "TOPLEFT", x, y)
    child:SetSize(self.cellWidth, self.cellHeight)
    child:Show()
    
    table.insert(self.children, child)
    
    self.currentCol = self.currentCol + 1
    if self.currentCol >= self.columns then
        self.currentCol = 0
        self.currentRow = self.currentRow + 1
    end
end

function GridLayout:GetHeight()
    local rows = math.ceil(#self.children / self.columns)
    return rows * (self.cellHeight + self.spacing)
end

function GridLayout:Clear()
    self.children = {}
    self.currentRow = 0
    self.currentCol = 0
end

-- ============================================================
-- FlowLayout - Arranges children in a flow (wrap on width)
-- ============================================================

local FlowLayout = {}
FlowLayout.__index = FlowLayout

function BistooltipUI.CreateFlowLayout(parent, spacing)
    local self = setmetatable({}, FlowLayout)
    
    self.parent = parent
    self.spacing = spacing or LAYOUT.SPACING
    self.children = {}
    self.currentX = 0
    self.currentY = 0
    self.rowHeight = 0
    self.maxWidth = parent:GetWidth()
    
    return self
end

function FlowLayout:AddChild(child, width, height)
    if not child then return end
    
    width = width or child:GetWidth()
    height = height or child:GetHeight()
    
    -- Check if we need to wrap to next row
    if self.currentX + width > self.maxWidth and self.currentX > 0 then
        self.currentX = 0
        self.currentY = self.currentY + self.rowHeight + self.spacing
        self.rowHeight = 0
    end
    
    child:SetParent(self.parent)
    child:ClearAllPoints()
    child:SetPoint("TOPLEFT", self.parent, "TOPLEFT", self.currentX, -self.currentY)
    child:Show()
    
    table.insert(self.children, child)
    
    self.currentX = self.currentX + width + self.spacing
    self.rowHeight = math.max(self.rowHeight, height)
end

function FlowLayout:NewRow()
    self.currentX = 0
    self.currentY = self.currentY + self.rowHeight + self.spacing
    self.rowHeight = 0
end

function FlowLayout:GetHeight()
    return self.currentY + self.rowHeight
end

function FlowLayout:Clear()
    self.children = {}
    self.currentX = 0
    self.currentY = 0
    self.rowHeight = 0
end

function FlowLayout:SetMaxWidth(width)
    self.maxWidth = width
end

-- ============================================================
-- ListLayout - Vertical list of rows with fixed height
-- ============================================================

local ListLayout = {}
ListLayout.__index = ListLayout

function BistooltipUI.CreateListLayout(parent, rowHeight, spacing)
    local self = setmetatable({}, ListLayout)
    
    self.parent = parent
    self.rowHeight = rowHeight or LAYOUT.ROW_HEIGHT
    self.spacing = spacing or LAYOUT.SPACING
    self.children = {}
    self.currentY = 0
    
    return self
end

function ListLayout:AddChild(child, customHeight)
    if not child then return end
    
    local height = customHeight or self.rowHeight
    
    child:SetParent(self.parent)
    child:ClearAllPoints()
    child:SetPoint("TOPLEFT", self.parent, "TOPLEFT", 0, -self.currentY)
    child:SetPoint("TOPRIGHT", self.parent, "TOPRIGHT", 0, -self.currentY)
    child:SetHeight(height)
    child:Show()
    
    table.insert(self.children, child)
    self.currentY = self.currentY + height + self.spacing
end

function ListLayout:AddSpacer(height)
    self.currentY = self.currentY + (height or self.spacing * 2)
end

function ListLayout:GetHeight()
    return self.currentY
end

function ListLayout:Clear()
    self.children = {}
    self.currentY = 0
end

-- ============================================================
-- SlotRowBuilder - Creates properly laid out slot rows
-- ============================================================

function BistooltipUI.CreateSlotRow(parent, slotData, callbacks)
    local row = Pools.SlotRows:Acquire()
    row:SetParent(parent)
    row:SetHeight(LAYOUT.ROW_HEIGHT)
    
    -- Store data reference
    row._bt_data.slotData = slotData
    
    -- Slot name
    if row._bt_slotLabel then
        row._bt_slotLabel:SetText("|cffffd700" .. (slotData.slot_name or "") .. "|r")
        row._bt_slotLabel:SetFont(Constants.FONTS.DEFAULT, Constants.FONTS.SIZE_LARGE, "OUTLINE")
    end
    
    -- Enhancement info
    if row._bt_enhLabel and slotData.enhs then
        local enhText = BistooltipUI.FormatEnhancements(slotData.enhs)
        row._bt_enhLabel:SetText(enhText)
    end
    
    -- Layout icons horizontally
    local iconStartX = LAYOUT.SLOT_LABEL_WIDTH + LAYOUT.ENH_LABEL_WIDTH + LAYOUT.PADDING * 2
    local iconCount = 0
    
    for i, itemId in ipairs(slotData) do
        if type(itemId) == "number" and itemId > 0 and i <= 8 then
            iconCount = iconCount + 1
            local iconSlot = row._bt_icons[iconCount]
            if iconSlot then
                local x = iconStartX + (iconCount - 1) * (LAYOUT.ICON_SIZE + LAYOUT.ICON_SPACING)
                iconSlot:ClearAllPoints()
                iconSlot:SetPoint("LEFT", row, "LEFT", x, 0)
                iconSlot:SetSize(LAYOUT.ICON_SIZE, LAYOUT.ICON_SIZE)
                iconSlot:Show()
                
                -- Store item ID for later icon setup
                iconSlot._bt_data = iconSlot._bt_data or {}
                iconSlot._bt_data.itemId = itemId
                iconSlot._bt_data.index = i
                iconSlot._bt_data.slotName = slotData.slot_name
            end
        end
    end
    
    return row, iconCount
end

-- ============================================================
-- Icon Setup Helper
-- ============================================================

function BistooltipUI.SetupItemIcon(button, itemId, callbacks)
    if not button or not itemId or itemId <= 0 then return end
    
    -- Normalize Horde->Alliance item IDs
    local displayId = itemId
    if _G.Bistooltip_horde_to_ali and _G.Bistooltip_horde_to_ali[itemId] then
        displayId = _G.Bistooltip_horde_to_ali[itemId]
    end
    
    local itemName, itemLink, _, _, _, _, _, _, _, itemIcon = GetItemInfo(displayId)
    
    if itemIcon then
        button._bt_texture:SetTexture(itemIcon)
    else
        button._bt_texture:SetTexture("Interface\\Icons\\INV_Misc_QuestionMark")
        -- Queue for preload
        if callbacks and callbacks.queuePreload then
            callbacks.queuePreload(displayId)
        end
    end
    
    -- Store item data
    button._bt_data.itemId = displayId
    button._bt_data.originalItemId = itemId
    button._bt_data.itemLink = itemLink
    
    -- Tooltip callbacks
    button:SetScript("OnEnter", function(self)
        GameTooltip:SetOwner(self, "ANCHOR_RIGHT")
        if itemLink then
            GameTooltip:SetHyperlink(itemLink)
        else
            GameTooltip:SetHyperlink("item:" .. displayId .. ":0:0:0:0:0:0:0")
        end
        GameTooltip:Show()
    end)
    
    button:SetScript("OnLeave", function(self)
        GameTooltip:Hide()
    end)
    
    -- Click to link
    button:SetScript("OnClick", function(self, mouseButton)
        if mouseButton == "LeftButton" then
            if itemLink then
                ChatEdit_InsertLink(itemLink)
            end
        elseif mouseButton == "RightButton" and callbacks and callbacks.onRightClick then
            callbacks.onRightClick(self, displayId)
        end
    end)
    
    return button
end

-- ============================================================
-- Owned Status Overlay
-- ============================================================

function BistooltipUI.SetOwnedStatus(button, ownedState, count)
    if not button then return end
    
    -- Reset overlays
    if button._bt_border then button._bt_border:Hide() end
    if button._bt_checkmark then button._bt_checkmark:Hide() end
    if button._bt_countText then button._bt_countText:SetText("") end
    
    if not ownedState then return end
    
    if ownedState == "equipped" then
        -- Green border and checkmark for equipped
        if button._bt_border then
            button._bt_border:SetVertexColor(0.1, 0.96, 0.13, 1)
            button._bt_border:Show()
        end
        if button._bt_checkmark then
            button._bt_checkmark:Show()
        end
    elseif ownedState == "bags" then
        -- Yellow border for in bags
        if button._bt_border then
            button._bt_border:SetVertexColor(0.96, 0.88, 0.1, 1)
            button._bt_border:Show()
        end
        if button._bt_countText and count and count > 1 then
            button._bt_countText:SetText(tostring(count))
        end
    end
end

-- ============================================================
-- BoE Marker
-- ============================================================

function BistooltipUI.SetBoEMarker(button, isBoE)
    if not button or not button._bt_boeMark then return end

    if isBoE then
        button._bt_boeMark:Show()
    else
        button._bt_boeMark:Hide()
    end
end

-- ============================================================
-- Tier Gear Marker (for T7-10.5 items)
-- ============================================================

function BistooltipUI.SetTierMarker(button, isTier)
    if not button or not button._bt_tierMark then return end

    if isTier then
        button._bt_tierMark:Show()
    else
        button._bt_tierMark:Hide()
    end
end

-- ============================================================
-- Selection Border (for customize mode)
-- ============================================================

function BistooltipUI.SetSelectionBorder(button, isSelected)
    if not button or not button._bt_selectionBorder then return end
    
    if isSelected then
        button._bt_selectionBorder:Show()
    else
        button._bt_selectionBorder:Hide()
    end
end

-- ============================================================
-- Enhancement Formatting
-- ============================================================

function BistooltipUI.FormatEnhancements(enhs)
    if not enhs then return "" end
    
    local parts = {}
    
    -- Enchant
    if enhs.enchant_id or enhs.spell_id then
        local enchName = enhs.enchant_name
        if enchName then
            local short = Utils.TruncateText(enchName, 15)
            table.insert(parts, "|cff00ff00" .. short .. "|r")
        end
    end
    
    -- Gems
    if enhs.gems and #enhs.gems > 0 then
        local gemCount = #enhs.gems
        table.insert(parts, "|cff55aaff" .. gemCount .. " gem" .. (gemCount > 1 and "s" or "") .. "|r")
    end
    
    return table.concat(parts, "\n")
end

-- ============================================================
-- Separator Line Creator
-- ============================================================

function BistooltipUI.CreateSeparator(parent, yOffset)
    local sep = Pools.Separators:Acquire()
    sep:SetParent(parent)
    sep:ClearAllPoints()
    sep:SetPoint("TOPLEFT", parent, "TOPLEFT", 0, -yOffset)
    sep:SetPoint("TOPRIGHT", parent, "TOPRIGHT", 0, -yOffset)
    sep:SetHeight(1)
    sep:Show()
    return sep
end

-- ============================================================
-- Header Row Creator
-- ============================================================

function BistooltipUI.CreateHeaderRow(parent, columns, yOffset)
    local header = Pools.Frames:Acquire()
    header:SetParent(parent)
    header:ClearAllPoints()
    header:SetPoint("TOPLEFT", parent, "TOPLEFT", 0, -yOffset)
    header:SetPoint("TOPRIGHT", parent, "TOPRIGHT", 0, -yOffset)
    header:SetHeight(LAYOUT.HEADER_HEIGHT)
    
    -- Background
    local bg = Pools.Textures:Acquire()
    bg:SetParent(header)
    bg:SetAllPoints()
    bg:SetTexture("Interface\\Buttons\\WHITE8x8")
    bg:SetVertexColor(0.1, 0.1, 0.1, 0.8)
    bg:Show()
    header._bt_bg = bg
    
    -- Create column headers
    local currentX = 0
    header._bt_labels = {}
    
    for i, col in ipairs(columns) do
        local label = Pools.FontStrings:Acquire()
        label:SetParent(header)
        label:ClearAllPoints()
        label:SetPoint("LEFT", header, "LEFT", currentX + LAYOUT.PADDING, 0)
        label:SetWidth(col.width or 50)
        label:SetText(col.text or "")
        label:SetFont(Constants.FONTS.DEFAULT, Constants.FONTS.SIZE_SMALL, "OUTLINE")
        label:SetTextColor(0.8, 0.8, 0.8)
        label:SetJustifyH(col.align or "CENTER")
        label:Show()
        
        table.insert(header._bt_labels, label)
        currentX = currentX + (col.width or 50) + LAYOUT.SPACING
    end
    
    header:Show()
    return header
end

-- ============================================================
-- Boss Header Creator (for checklist)
-- ============================================================

function BistooltipUI.CreateBossHeader(parent, bossName, zoneName, difficulty, itemCount, isCollapsed, onClick)
    local header = Pools.BossHeaders:Acquire()
    header:SetParent(parent)
    
    -- Store data
    header._bt_data.bossName = bossName
    header._bt_data.zoneName = zoneName
    header._bt_data.isCollapsed = isCollapsed
    
    -- Update display
    header._bt_indicator:SetText(isCollapsed and "+" or "-")
    header._bt_bossLabel:SetText("|cffc41f3b" .. (bossName or "") .. "|r")
    
    local zoneText = zoneName or ""
    if difficulty then
        zoneText = zoneText .. " |cffaaaaaa(" .. difficulty .. ")|r"
    end
    header._bt_zoneLabel:SetText(zoneText)
    
    if itemCount and itemCount > 0 then
        header._bt_countLabel:SetText("|cffffd700" .. itemCount .. " items|r")
    else
        header._bt_countLabel:SetText("")
    end
    
    -- Click handler
    header:SetScript("OnClick", function(self)
        if onClick then
            onClick(bossName, zoneName)
        end
    end)
    
    -- Hover effect
    header:SetScript("OnEnter", function(self)
        self._bt_bg:SetVertexColor(0.25, 0.25, 0.25, 0.9)
    end)
    
    header:SetScript("OnLeave", function(self)
        self._bt_bg:SetVertexColor(0.15, 0.15, 0.15, 0.9)
    end)
    
    header:Show()
    return header
end

-- ============================================================
-- Item Row Creator (for checklist)
-- ============================================================

function BistooltipUI.CreateItemRow(parent, itemId, slotName, sources, callbacks)
    local row = Pools.ItemRows:Acquire()
    row:SetParent(parent)
    
    -- Store data
    row._bt_data.itemId = itemId
    row._bt_data.slotName = slotName
    
    -- Normalize item ID
    local displayId = itemId
    if _G.Bistooltip_horde_to_ali and _G.Bistooltip_horde_to_ali[itemId] then
        displayId = _G.Bistooltip_horde_to_ali[itemId]
    end
    
    local itemName, itemLink, quality, _, _, _, _, _, _, itemIcon = GetItemInfo(displayId)
    
    -- Icon
    if row._bt_icon and row._bt_icon._bt_texture then
        if itemIcon then
            row._bt_icon._bt_texture:SetTexture(itemIcon)
        else
            row._bt_icon._bt_texture:SetTexture("Interface\\Icons\\INV_Misc_QuestionMark")
            if callbacks and callbacks.queuePreload then
                callbacks.queuePreload(displayId)
            end
        end
        
        -- Icon tooltip
        row._bt_icon:SetScript("OnEnter", function(self)
            GameTooltip:SetOwner(self, "ANCHOR_RIGHT")
            if itemLink then
                GameTooltip:SetHyperlink(itemLink)
            else
                GameTooltip:SetHyperlink("item:" .. displayId .. ":0:0:0:0:0:0:0")
            end
            GameTooltip:Show()
        end)
        row._bt_icon:SetScript("OnLeave", function() GameTooltip:Hide() end)
        row._bt_icon:SetScript("OnClick", function()
            if itemLink then ChatEdit_InsertLink(itemLink) end
        end)
    end
    
    -- Slot label
    if row._bt_slotLabel then
        row._bt_slotLabel:SetText("|cffffd700[" .. string.upper(slotName or "") .. "]|r")
    end
    
    -- Item name
    if row._bt_nameLabel then
        local hexColor = Utils.GetItemQualityHex(quality)
        local displayName = itemName or ("Item " .. displayId)
        row._bt_nameLabel:SetText("|c" .. hexColor .. Utils.SmartTrunc(displayName, 24) .. "|r")
    end
    
    -- Source info
    if row._bt_sourceLabel and sources then
        local sourceText = BistooltipUI.FormatSourcesShort(sources)
        row._bt_sourceLabel:SetText(sourceText)
    end
    
    row:Show()
    return row
end

-- ============================================================
-- Source Formatting
-- ============================================================

function BistooltipUI.FormatSourcesShort(sources)
    if not sources or #sources == 0 then return "" end
    
    local parts = {}
    for _, src in ipairs(sources) do
        if src.type == "emblem" then
            local color = Constants.COLORS.ASCENSION or "00ffcc"
            local costText = src.cost and (" x" .. src.cost) or ""
            table.insert(parts, "|cff" .. color .. (src.currency or "Emblem") .. costText .. "|r")
        elseif src.type == "raid" then
            local text = Utils.TruncateText(src.boss or "", 12)
            if src.difficulty then
                text = text .. " |cffaaaaaa(" .. src.difficulty .. ")|r"
            end
            table.insert(parts, "|cffffd000" .. text .. "|r")
        end
    end
    
    return table.concat(parts, " | ")
end

-- ============================================================
-- Progress Bar Creator
-- ============================================================

function BistooltipUI.CreateProgressBar(parent, width, height)
    local bar = Pools.Frames:Acquire()
    bar:SetParent(parent)
    bar:SetSize(width, height)
    
    -- Background
    local bg = Pools.Textures:Acquire()
    bg:SetParent(bar)
    bg:SetAllPoints()
    bg:SetTexture("Interface\\Buttons\\WHITE8x8")
    bg:SetVertexColor(0.2, 0.2, 0.2, 0.8)
    bg:Show()
    bar._bt_bg = bg
    
    -- Fill
    local fill = Pools.Textures:Acquire()
    fill:SetParent(bar)
    fill:SetPoint("TOPLEFT", 1, -1)
    fill:SetPoint("BOTTOMLEFT", 1, 1)
    fill:SetWidth(1)
    fill:SetTexture("Interface\\Buttons\\WHITE8x8")
    fill:SetVertexColor(0.1, 0.8, 0.1, 1)
    fill:Show()
    bar._bt_fill = fill
    
    -- Text
    local text = Pools.FontStrings:Acquire()
    text:SetParent(bar)
    text:SetAllPoints()
    text:SetFont(Constants.FONTS.DEFAULT, Constants.FONTS.SIZE_MEDIUM, "OUTLINE")
    text:SetJustifyH("CENTER")
    text:SetJustifyV("MIDDLE")
    text:SetText("")
    text:Show()
    bar._bt_text = text
    
    -- Update function
    function bar:SetProgress(current, total)
        if not total or total == 0 then
            self._bt_fill:SetWidth(1)
            self._bt_text:SetText("0 / 0")
            return
        end
        
        local pct = current / total
        local fillWidth = math.max(1, (width - 2) * pct)
        self._bt_fill:SetWidth(fillWidth)
        self._bt_text:SetText(string.format("%d / %d", current, total))
        
        -- Color based on progress
        if pct >= 1 then
            self._bt_fill:SetVertexColor(0.1, 0.9, 0.1, 1)
        elseif pct >= 0.6 then
            self._bt_fill:SetVertexColor(0.1, 0.8, 0.1, 1)
        elseif pct >= 0.3 then
            self._bt_fill:SetVertexColor(1.0, 0.6, 0.0, 1)
        else
            self._bt_fill:SetVertexColor(0.9, 0.2, 0.2, 1)
        end
    end
    
    bar:Show()
    return bar
end

-- ============================================================
-- Cleanup Function
-- ============================================================

function BistooltipUI.ReleaseAll()
    Pools.ReleaseAll()
end

-- ============================================================
-- Tooltip Helper (3.3.5 safe)
-- ============================================================

function BistooltipUI.SetTooltipByItemID(tooltip, itemId)
    if not tooltip or not itemId or itemId <= 0 then return end
    tooltip:SetHyperlink("item:" .. itemId .. ":0:0:0:0:0:0:0")
end
