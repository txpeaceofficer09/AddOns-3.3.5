-- ============================================================
-- ui/ProgressBar.lua - Progress Bar Component
-- Displays collection progress (items owned / total)
-- WoW 3.3.5a compatible (Lua 5.1)
-- ============================================================

local ADDON_NAME = "Bis-Tooltip"

-- Create namespace
BistooltipProgressBar = BistooltipProgressBar or {}

-- Dependencies
local Constants = BistooltipConstants

-- ============================================================
-- Configuration
-- ============================================================

local PROGRESS_BAR_HEIGHT = 20
local PROGRESS_BAR_PADDING = 4

-- ============================================================
-- Progress Bar State
-- ============================================================

local progressBarFrame = nil
local isCreated = false

-- ============================================================
-- Helper: Get fixed width from Constants
-- This ensures consistent width regardless of parent state
-- ============================================================

local function GetFixedBarWidth()
    -- Use MAIN_FRAME_WIDTH from Constants, subtract padding and scrollbar area
    -- Width should match content width: MAIN_FRAME_WIDTH (600) - padding (4) - scrollbar (24) = 572
    local mainWidth = (Constants and Constants.UI and Constants.UI.MAIN_FRAME_WIDTH) or 600
    return mainWidth - 4 - 24
end

-- ============================================================
-- Create Progress Bar
-- ============================================================

function BistooltipProgressBar.Create(parent)
    if progressBarFrame then
        progressBarFrame:Show()
        return progressBarFrame
    end

    -- Create as child of specContainerFrame (outside scroll)
    progressBarFrame = CreateFrame("Frame", "BistooltipProgressBarFrame", parent)
    progressBarFrame:SetHeight(PROGRESS_BAR_HEIGHT)

    -- CRITICAL: Use FIXED width from Constants - NEVER rely on parent width
    -- This prevents the bar from extending beyond the frame when parent has wrong size
    local fixedWidth = GetFixedBarWidth()
    progressBarFrame:SetWidth(fixedWidth)

    -- Position at TOP of container - use only TOPLEFT anchor with explicit width
    progressBarFrame:SetPoint("TOPLEFT", parent, "TOPLEFT", PROGRESS_BAR_PADDING, 0)

    -- Ensure progress bar is ABOVE scroll content
    progressBarFrame:SetFrameLevel(parent:GetFrameLevel() + 10)
    progressBarFrame:SetFrameStrata("DIALOG")

    -- Background
    local bg = progressBarFrame:CreateTexture(nil, "BACKGROUND")
    bg:SetAllPoints()
    bg:SetTexture("Interface\\Buttons\\WHITE8x8")
    bg:SetVertexColor(0.1, 0.1, 0.12, 0.95)
    progressBarFrame._bg = bg

    -- Progress fill
    local fill = progressBarFrame:CreateTexture(nil, "ARTWORK")
    fill:SetPoint("TOPLEFT", 1, -1)
    fill:SetPoint("BOTTOMLEFT", 1, 1)
    fill:SetWidth(1)
    fill:SetTexture("Interface\\Buttons\\WHITE8x8")
    fill:SetVertexColor(0.2, 0.7, 0.35, 1.0)
    progressBarFrame._fill = fill

    -- Text
    local text = progressBarFrame:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
    text:SetPoint("CENTER")
    text:SetTextColor(1, 1, 1)
    progressBarFrame._text = text

    -- Border
    local borderTop = progressBarFrame:CreateTexture(nil, "BORDER")
    borderTop:SetPoint("TOPLEFT")
    borderTop:SetPoint("TOPRIGHT")
    borderTop:SetHeight(1)
    borderTop:SetTexture("Interface\\Buttons\\WHITE8x8")
    borderTop:SetVertexColor(0.3, 0.3, 0.35, 1)

    local borderBottom = progressBarFrame:CreateTexture(nil, "BORDER")
    borderBottom:SetPoint("BOTTOMLEFT")
    borderBottom:SetPoint("BOTTOMRIGHT")
    borderBottom:SetHeight(1)
    borderBottom:SetTexture("Interface\\Buttons\\WHITE8x8")
    borderBottom:SetVertexColor(0.3, 0.3, 0.35, 1)

    -- Store fixed width for Update calculations
    progressBarFrame._fixedWidth = fixedWidth

    isCreated = true
    progressBarFrame:Show()

    return progressBarFrame
end

-- ============================================================
-- Update Progress Bar
-- ============================================================

function BistooltipProgressBar.Update(collected, total)
    if not progressBarFrame then return end

    local pct = total > 0 and (collected / total) or 0

    -- Use stored fixed width, NOT GetWidth() which may be wrong
    local barWidth = (progressBarFrame._fixedWidth or GetFixedBarWidth()) - 2

    -- Update fill width
    progressBarFrame._fill:SetWidth(math.max(barWidth * pct, 1))

    -- Update color based on progress
    local r, g, b
    if pct >= 1.0 then
        r, g, b = 0.2, 0.9, 0.3  -- Green (complete)
    elseif pct >= 0.75 then
        r, g, b = 0.3, 0.8, 0.4  -- Light green
    elseif pct >= 0.5 then
        r, g, b = 0.8, 0.8, 0.2  -- Yellow
    elseif pct >= 0.25 then
        r, g, b = 0.9, 0.6, 0.2  -- Orange
    else
        r, g, b = 0.8, 0.3, 0.2  -- Red
    end
    progressBarFrame._fill:SetVertexColor(r, g, b, 1)

    -- Update text
    progressBarFrame._text:SetText(string.format("Progress: %d/%d (%.0f%%)", collected, total, pct * 100))
end

-- ============================================================
-- Show/Hide
-- ============================================================

function BistooltipProgressBar.Show()
    if progressBarFrame then
        progressBarFrame:Show()
    end
end

function BistooltipProgressBar.Hide()
    if progressBarFrame then
        progressBarFrame:Hide()
    end
end

-- ============================================================
-- Destroy
-- ============================================================

function BistooltipProgressBar.Destroy()
    if progressBarFrame then
        progressBarFrame:Hide()
        progressBarFrame:SetParent(nil)
        progressBarFrame = nil
        isCreated = false
    end
end

-- ============================================================
-- Get Height (for layout calculations)
-- ============================================================

function BistooltipProgressBar.GetHeight()
    return PROGRESS_BAR_HEIGHT + PROGRESS_BAR_PADDING
end

-- ============================================================
-- Is Created
-- ============================================================

function BistooltipProgressBar.IsCreated()
    return isCreated and progressBarFrame ~= nil
end

-- Module loaded
-- DEFAULT_CHAT_FRAME:AddMessage("|cff00ff00Bistooltip:|r ProgressBar module loaded")
