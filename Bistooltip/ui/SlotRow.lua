-- ============================================================
-- ui/SlotRow.lua - Slot Row Rendering Component
-- Renders individual equipment slot rows with icons
-- WoW 3.3.5a compatible (Lua 5.1)
-- ============================================================

local ADDON_NAME = "Bis-Tooltip"

-- Create namespace
BistooltipSlotRow = BistooltipSlotRow or {}

-- Dependencies
local State = BistooltipState
local Data = BistooltipData
local Constants = BistooltipConstants
local Utils = BistooltipUtils

-- ============================================================
-- Configuration
-- ============================================================

local ROW_HEIGHT = 48
local ROW_HEIGHT_BIS = 48
local ROW_SPACING = 2
local ICON_SIZE = 40
local ICON_SPACING = 4

-- ============================================================
-- Row Pool
-- ============================================================

local rowPool = {}
local activeRows = {}
local rowCounter = 0

local function AcquireRow(parent)
    local row = table.remove(rowPool)

    if not row then
        rowCounter = rowCounter + 1
        row = CreateFrame("Frame", "BistooltipSlotRow" .. rowCounter, parent)

        -- Background
        local bg = row:CreateTexture(nil, "BACKGROUND")
        bg:SetAllPoints()
        bg:SetTexture("Interface\\Buttons\\WHITE8x8")
        row._bg = bg

        -- Border (for customize mode)
        local border = row:CreateTexture(nil, "BORDER")
        border:SetPoint("TOPLEFT", -1, 1)
        border:SetPoint("BOTTOMRIGHT", 1, -1)
        border:SetTexture("Interface\\Buttons\\WHITE8x8")
        border:Hide()
        row._border = border

        -- Slot label
        local slotLabel = row:CreateFontString(nil, "OVERLAY", "GameFontNormal")
        row._slotLabel = slotLabel

        -- Icon buttons pool for this row
        row._iconButtons = {}
        row._iconBtnIndex = 0

        -- Data storage
        row._data = {}
    end

    row:SetParent(parent)
    row:Show()
    table.insert(activeRows, row)
    row._activeIndex = #activeRows  -- Store index for O(1) removal

    return row
end

local function ReleaseRow(row)
    if not row then return end

    row:Hide()
    row:ClearAllPoints()

    -- Hide all icon buttons
    for _, btn in ipairs(row._iconButtons) do
        btn:Hide()
        btn:SetScript("OnClick", nil)
        btn:SetScript("OnEnter", nil)
        btn:SetScript("OnLeave", nil)
    end
    row._iconBtnIndex = 0

    -- Clear data
    if row._data then
        wipe(row._data)
    end

    -- Remove from active list using stored index (O(1) instead of O(n))
    local idx = row._activeIndex
    if idx and activeRows[idx] == row then
        local lastIdx = #activeRows
        if idx ~= lastIdx then
            -- Swap with last element
            local lastRow = activeRows[lastIdx]
            activeRows[idx] = lastRow
            lastRow._activeIndex = idx
        end
        activeRows[lastIdx] = nil
    else
        -- Fallback: linear search (for safety)
        for i, r in ipairs(activeRows) do
            if r == row then
                local lastIdx = #activeRows
                if i ~= lastIdx then
                    local lastRow = activeRows[lastIdx]
                    activeRows[i] = lastRow
                    lastRow._activeIndex = i
                end
                activeRows[lastIdx] = nil
                break
            end
        end
    end
    row._activeIndex = nil

    table.insert(rowPool, row)
end

function BistooltipSlotRow.ReleaseAll()
    for i = #activeRows, 1, -1 do
        ReleaseRow(activeRows[i])
    end
    wipe(activeRows)
end

-- ============================================================
-- Get Row Icon Button (pooled within row)
-- ============================================================

local function GetRowIconButton(row)
    row._iconBtnIndex = row._iconBtnIndex + 1
    local btn = row._iconButtons[row._iconBtnIndex]

    if not btn then
        btn = CreateFrame("Button", nil, row)
        btn:RegisterForClicks("AnyUp")

        -- Main texture
        btn._tex = btn:CreateTexture(nil, "ARTWORK")
        btn._tex:SetAllPoints()
        btn._tex:SetTexCoord(0.08, 0.92, 0.08, 0.92)

        -- Owned glow
        btn._glow = btn:CreateTexture(nil, "OVERLAY", nil, 1)
        btn._glow:SetPoint("TOPLEFT", -20, 20)
        btn._glow:SetPoint("BOTTOMRIGHT", 20, -20)
        btn._glow:SetTexture("Interface\\Buttons\\UI-ActionButton-Border")
        btn._glow:SetBlendMode("ADD")

        -- Owned border
        btn._border = btn:CreateTexture(nil, "OVERLAY", nil, 2)
        btn._border:SetPoint("TOPLEFT", -10, 10)
        btn._border:SetPoint("BOTTOMRIGHT", 10, -10)
        btn._border:SetTexture("Interface\\Buttons\\UI-ActionButton-Border")
        btn._border:SetBlendMode("ADD")

        -- Checkmark
        btn._check = btn:CreateTexture(nil, "OVERLAY", nil, 3)
        btn._check:SetSize(22, 22)
        btn._check:SetPoint("TOPRIGHT", 8, 8)
        btn._check:SetTexture("Interface\\RaidFrame\\ReadyCheck-Ready")

        -- Selection glows
        btn._selGlow = btn:CreateTexture(nil, "OVERLAY", nil, 4)
        btn._selGlow:SetPoint("TOPLEFT", -14, 14)
        btn._selGlow:SetPoint("BOTTOMRIGHT", 14, -14)
        btn._selGlow:SetTexture("Interface\\Buttons\\UI-ActionButton-Border")
        btn._selGlow:SetBlendMode("ADD")

        btn._selMid = btn:CreateTexture(nil, "OVERLAY", nil, 5)
        btn._selMid:SetPoint("TOPLEFT", -10, 10)
        btn._selMid:SetPoint("BOTTOMRIGHT", 10, -10)
        btn._selMid:SetTexture("Interface\\Buttons\\UI-ActionButton-Border")
        btn._selMid:SetBlendMode("ADD")

        btn._selInner = btn:CreateTexture(nil, "OVERLAY", nil, 6)
        btn._selInner:SetPoint("TOPLEFT", -6, 6)
        btn._selInner:SetPoint("BOTTOMRIGHT", 6, -6)
        btn._selInner:SetTexture("Interface\\Buttons\\UI-ActionButton-Border")
        btn._selInner:SetBlendMode("ADD")

        -- BoE indicator
        btn._boe = btn:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
        btn._boe:SetPoint("BOTTOM", 0, -2)

        row._iconButtons[row._iconBtnIndex] = btn
    end

    -- Reset button state
    btn:ClearAllPoints()
    btn:SetScript("OnEnter", nil)
    btn:SetScript("OnLeave", nil)
    btn:SetScript("OnClick", nil)
    btn:Show()
    btn._tex:Show()
    btn._tex:SetTexture(nil)

    -- Hide all overlays
    btn._glow:Hide()
    btn._border:Hide()
    btn._check:Hide()
    btn._selGlow:Hide()
    btn._selMid:Hide()
    btn._selInner:Hide()
    btn._boe:Hide()

    return btn
end

-- ============================================================
-- Create Slot Row
-- ============================================================

function BistooltipSlotRow.Create(parent, slot, yOffset, rowIndex, columns)
    local bisChecklistMode = State and State.Get and State.Get("bisChecklistMode")
    local customizeMode = State and State.Get and State.Get("customizeMode")
    local rowHeight = bisChecklistMode and ROW_HEIGHT_BIS or ROW_HEIGHT

    local row = AcquireRow(parent)
    -- CRITICAL: Use FIXED width from Constants - NEVER use parent:GetWidth()
    -- This prevents rows from being too wide when parent is inside wrong frame (ElvUI issue)
    local fixedWidth = (Constants and Constants.UI and Constants.UI.MAIN_FRAME_WIDTH or 600) - 24 - 8
    row:SetSize(fixedWidth, rowHeight)
    row:SetPoint("TOPLEFT", 4, yOffset)

    -- Background
    row._bg:Show()
    if customizeMode then
        if rowIndex % 2 == 0 then
            row._bg:SetVertexColor(0.18, 0.10, 0.18, 0.7)
        else
            row._bg:SetVertexColor(0.14, 0.08, 0.14, 0.7)
        end
    else
        if rowIndex % 2 == 0 then
            row._bg:SetVertexColor(0.12, 0.12, 0.12, 0.6)
        else
            row._bg:SetVertexColor(0.08, 0.08, 0.08, 0.6)
        end
    end

    -- Border (customize mode)
    if customizeMode then
        row._border:SetVertexColor(0.6, 0.2, 0.8, 0.3)
        row._border:Show()
    else
        row._border:Hide()
    end

    -- Store slot data
    row._data.slot = slot
    row._data.slotName = slot.slot_name or ""

    local slotName = row._data.slotName
    local isHorde = State and State.Get and State.Get("isHorde")
    local showOnlyMissing = State and State.Get and State.Get("showOnlyMissing")
    local selectedSwapItem = State and State.GetSelectedSwapItem and State.GetSelectedSwapItem()
    local isUnlocked = State and State.IsSlotUnlocked and State.IsSlotUnlocked(slotName)

    local itemIndex = 1

    -- Render columns
    for _, col in ipairs(columns) do
        if col.type == "label" then
            row._slotLabel:ClearAllPoints()
            row._slotLabel:SetPoint("LEFT", row, "LEFT", col.x, 0)
            row._slotLabel:SetWidth(col.width)
            row._slotLabel:SetJustifyH("LEFT")
            row._slotLabel:SetText("|cffffd700" .. slotName .. "|r")
            row._slotLabel:Show()

        elseif col.type == "item" then
            local itemId = slot[itemIndex]
            if itemId and type(itemId) == "number" and itemId > 0 then
                local displayId = Data and Data.GetDisplayItemID and Data.GetDisplayItemID(itemId, isHorde) or itemId
                local ownedState, ownedCount = Data and Data.GetOwnedState and Data.GetOwnedState(displayId)

                if not (showOnlyMissing and ownedState) then
                    local iconFrame = GetRowIconButton(row)
                    iconFrame:SetSize(ICON_SIZE, ICON_SIZE)
                    iconFrame:SetPoint("LEFT", row, "LEFT", col.x, 0)

                    -- Set icon texture
                    local _, itemLink, quality, _, _, _, _, _, _, texture = GetItemInfo(displayId)
                    iconFrame._tex:SetTexture(texture or "Interface\\Icons\\INV_Misc_QuestionMark")

                    -- Owned status overlays
                    if ownedState then
                        local borderColor = ownedState == "equipped"
                            and {0.1, 0.96, 0.13, 1}
                            or {0.96, 0.88, 0.1, 1}

                        iconFrame._glow:SetVertexColor(borderColor[1], borderColor[2], borderColor[3], 0.9)
                        iconFrame._glow:Show()

                        iconFrame._border:SetVertexColor(borderColor[1], borderColor[2], borderColor[3], 1)
                        iconFrame._border:Show()

                        if ownedState == "equipped" then
                            iconFrame._check:Show()
                        end
                    end

                    -- Selection border (customize mode)
                    if customizeMode and selectedSwapItem and
                       selectedSwapItem.slotName == slotName and selectedSwapItem.index == itemIndex then
                        iconFrame._selGlow:SetVertexColor(1, 0, 0, 1)
                        iconFrame._selGlow:Show()
                        iconFrame._selMid:SetVertexColor(1, 0.3, 0.3, 1)
                        iconFrame._selMid:Show()
                        iconFrame._selInner:SetVertexColor(1, 0.5, 0.5, 1)
                        iconFrame._selInner:Show()
                    end

                    -- Tooltip
                    local capturedDisplayId = displayId
                    local capturedLink = itemLink
                    iconFrame:SetScript("OnEnter", function(self)
                        GameTooltip:SetOwner(self, "ANCHOR_RIGHT")
                        if capturedLink then
                            GameTooltip:SetHyperlink(capturedLink)
                        else
                            Utils.TooltipSetItemByID(GameTooltip, capturedDisplayId)
                        end
                        GameTooltip:Show()
                    end)
                    iconFrame:SetScript("OnLeave", function() GameTooltip:Hide() end)

                    -- Click handler (basic - insert to chat)
                    iconFrame:SetScript("OnClick", function(self, button)
                        if button == "LeftButton" and capturedLink then
                            ChatEdit_InsertLink(capturedLink)
                        end
                    end)
                end
            end
            itemIndex = itemIndex + 1
        end

        -- Note: enchant, gems, and other column types are handled by BislistUI.lua
        -- This module provides basic row structure; full rendering is in BislistUI
    end

    row:Show()
    return row, rowHeight + ROW_SPACING
end

-- ============================================================
-- Get Active Row Count
-- ============================================================

function BistooltipSlotRow.GetActiveCount()
    return #activeRows
end

-- ============================================================
-- Get Row Height (for layout calculations)
-- ============================================================

function BistooltipSlotRow.GetHeight(isBISMode)
    return (isBISMode and ROW_HEIGHT_BIS or ROW_HEIGHT) + ROW_SPACING
end

-- Module loaded
-- DEFAULT_CHAT_FRAME:AddMessage("|cff00ff00Bistooltip:|r SlotRow module loaded")
