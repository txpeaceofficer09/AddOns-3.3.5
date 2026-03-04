-- ============================================================
-- util/reset.lua - Centralized Frame Reset Functions
-- Single source of truth for cleaning up pooled UI elements
-- WoW 3.3.5a compatible (Lua 5.1)
-- ============================================================

local ADDON_NAME = "Bis-Tooltip"

-- Create namespace
BistooltipReset = BistooltipReset or {}

-- ============================================================
-- Helper: Safe script clearing
-- ============================================================

local SCRIPT_HANDLERS = {
    "OnClick",
    "OnEnter",
    "OnLeave",
    "OnUpdate",
    "OnShow",
    "OnHide",
    "OnMouseDown",
    "OnMouseUp",
    "OnDragStart",
    "OnDragStop",
    "OnValueChanged",
}

local function ClearAllScripts(frame)
    if not frame then return end
    for _, handler in ipairs(SCRIPT_HANDLERS) do
        if frame.SetScript then
            pcall(frame.SetScript, frame, handler, nil)
        end
    end
end

-- ============================================================
-- ResetTexture - Clean up a texture object
-- ============================================================

function BistooltipReset.ResetTexture(tex)
    if not tex then return end

    tex:Hide()
    tex:ClearAllPoints()

    -- Reset visual properties
    tex:SetTexture(nil)
    tex:SetTexCoord(0, 1, 0, 1)
    tex:SetVertexColor(1, 1, 1, 1)
    tex:SetAlpha(1)
    tex:SetBlendMode("BLEND")

    -- Reset size (will be set by new owner)
    tex:SetSize(1, 1)

    -- Reparent to UIParent (safe default)
    tex:SetParent(UIParent)
end

-- ============================================================
-- ResetFontString - Clean up a font string object
-- ============================================================

function BistooltipReset.ResetFontString(fs)
    if not fs then return end

    fs:Hide()
    fs:ClearAllPoints()

    -- Reset text properties
    fs:SetText("")
    fs:SetTextColor(1, 1, 1, 1)
    fs:SetJustifyH("LEFT")
    fs:SetJustifyV("MIDDLE")
    fs:SetAlpha(1)

    -- Reset font to default
    fs:SetFont("Fonts\\FRIZQT__.TTF", 12, "")

    -- Reset size
    fs:SetWidth(0)
    fs:SetHeight(0)

    -- Reparent
    fs:SetParent(UIParent)
end

-- ============================================================
-- ResetIconFrame - Clean up an icon button with overlays
-- Used for item icons, gem icons, enchant icons
-- ============================================================

function BistooltipReset.ResetIconFrame(frame)
    if not frame then return end

    frame:Hide()
    frame:ClearAllPoints()
    frame:SetParent(UIParent)
    frame:SetSize(40, 40)
    frame:SetAlpha(1)
    frame:EnableMouse(true)

    -- Clear all scripts
    ClearAllScripts(frame)

    -- Reset main texture (125% zoom preserved as default)
    if frame._bt_texture then
        frame._bt_texture:SetTexture(nil)
        frame._bt_texture:SetTexCoord(0.1, 0.9, 0.1, 0.9)
        frame._bt_texture:SetVertexColor(1, 1, 1, 1)
        frame._bt_texture:SetAlpha(1)
    end

    -- Hide all overlay elements
    if frame._bt_border then
        frame._bt_border:Hide()
        frame._bt_border:SetVertexColor(1, 1, 1, 1)
    end

    if frame._bt_glow then
        frame._bt_glow:Hide()
        frame._bt_glow:SetVertexColor(1, 1, 1, 1)
    end

    if frame._bt_checkmark then
        frame._bt_checkmark:Hide()
    end

    if frame._bt_boeMark then
        frame._bt_boeMark:Hide()
    end

    if frame._bt_tierMark then
        frame._bt_tierMark:Hide()
    end

    if frame._bt_countText then
        frame._bt_countText:SetText("")
    end

    if frame._bt_selectionBorder then
        frame._bt_selectionBorder:Hide()
    end

    -- Clear custom data table
    if frame._bt_data then
        wipe(frame._bt_data)
    else
        frame._bt_data = {}
    end
end

-- ============================================================
-- ResetRowFrame - Clean up a slot row frame
-- Used for item rows in the BIS list
-- ============================================================

function BistooltipReset.ResetRowFrame(row)
    if not row then return end

    row:Hide()
    row:ClearAllPoints()
    row:SetParent(UIParent)
    row:SetSize(1, 48)
    row:SetAlpha(1)

    -- Clear scripts
    ClearAllScripts(row)

    -- Reset backdrop if present
    if row.SetBackdrop then
        pcall(row.SetBackdrop, row, nil)
    end

    -- Reset labels
    if row._bt_slotLabel then
        row._bt_slotLabel:SetText("")
    end

    if row._bt_enhLabel then
        row._bt_enhLabel:SetText("")
    end

    -- Reset background
    if row._bt_background then
        row._bt_background:SetVertexColor(0, 0, 0, 0)
    end

    -- Hide icon slots
    if row._bt_icons then
        for _, iconSlot in ipairs(row._bt_icons) do
            iconSlot:Hide()
            iconSlot:ClearAllPoints()
        end
    end

    -- Clear custom data
    if row._bt_data then
        wipe(row._bt_data)
    else
        row._bt_data = {}
    end
end

-- ============================================================
-- ResetSimpleFrame - Clean up a basic frame
-- Used for containers, separators, headers
-- ============================================================

function BistooltipReset.ResetSimpleFrame(frame)
    if not frame then return end

    frame:Hide()
    frame:ClearAllPoints()
    frame:SetParent(UIParent)
    frame:SetSize(1, 1)
    frame:SetAlpha(1)
    frame:SetFrameLevel(1)

    -- Clear scripts
    ClearAllScripts(frame)

    -- Reset backdrop
    if frame.SetBackdrop then
        pcall(frame.SetBackdrop, frame, nil)
    end

    -- Clear custom data
    if frame._bt_data then
        wipe(frame._bt_data)
    else
        frame._bt_data = {}
    end
end

-- ============================================================
-- ResetBossHeader - Clean up a boss header frame
-- Used in checklist panel
-- ============================================================

function BistooltipReset.ResetBossHeader(header)
    if not header then return end

    header:Hide()
    header:ClearAllPoints()
    header:SetParent(UIParent)

    -- Clear scripts
    ClearAllScripts(header)

    -- Reset text elements
    if header._bt_indicator then
        header._bt_indicator:SetText("+")
    end

    if header._bt_bossLabel then
        header._bt_bossLabel:SetText("")
    end

    if header._bt_zoneLabel then
        header._bt_zoneLabel:SetText("")
    end

    if header._bt_countLabel then
        header._bt_countLabel:SetText("")
    end

    -- Reset background
    if header._bt_bg then
        header._bt_bg:SetVertexColor(0.15, 0.15, 0.15, 0.9)
    end

    -- Clear data
    if header._bt_data then
        wipe(header._bt_data)
    else
        header._bt_data = {}
    end
end

-- ============================================================
-- ResetItemRow - Clean up an item row (checklist panel)
-- ============================================================

function BistooltipReset.ResetItemRow(row)
    if not row then return end

    row:Hide()
    row:ClearAllPoints()
    row:SetParent(UIParent)

    -- Reset icon
    if row._bt_icon then
        ClearAllScripts(row._bt_icon)
        if row._bt_icon._bt_texture then
            row._bt_icon._bt_texture:SetTexture(nil)
        end
    end

    -- Reset labels
    if row._bt_slotLabel then
        row._bt_slotLabel:SetText("")
    end

    if row._bt_nameLabel then
        row._bt_nameLabel:SetText("")
    end

    if row._bt_sourceLabel then
        row._bt_sourceLabel:SetText("")
    end

    -- Clear data
    if row._bt_data then
        wipe(row._bt_data)
    else
        row._bt_data = {}
    end
end

-- ============================================================
-- ResetSeparator - Clean up a separator line
-- ============================================================

function BistooltipReset.ResetSeparator(sep)
    if not sep then return end

    sep:Hide()
    sep:ClearAllPoints()
    sep:SetParent(UIParent)
    sep:SetWidth(1)
    sep:SetHeight(1)

    if sep._bt_line then
        sep._bt_line:SetVertexColor(0.3, 0.3, 0.3, 0.8)
    end
end

-- ============================================================
-- DeepResetFrame - Recursively reset frame and ALL children
-- Use sparingly - expensive but thorough
-- ============================================================

function BistooltipReset.DeepResetFrame(frame)
    if not frame then return end

    -- Reset all child frames first
    local children = {frame:GetChildren()}
    for _, child in ipairs(children) do
        BistooltipReset.DeepResetFrame(child)
    end

    -- Reset all regions (textures, fontstrings)
    local regions = {frame:GetRegions()}
    for _, region in ipairs(regions) do
        if region then
            if region.SetTexture then
                BistooltipReset.ResetTexture(region)
            elseif region.SetText then
                BistooltipReset.ResetFontString(region)
            else
                region:Hide()
            end
        end
    end

    -- Reset the frame itself
    BistooltipReset.ResetSimpleFrame(frame)
end

-- ============================================================
-- Helper: Reset frame children only (not the frame itself)
-- ============================================================

function BistooltipReset.ResetChildren(frame)
    if not frame then return end

    -- Hide and reset children
    local children = {frame:GetChildren()}
    for _, child in ipairs(children) do
        child:Hide()
        child:ClearAllPoints()
        ClearAllScripts(child)
    end

    -- Hide regions (textures, fontstrings)
    local regions = {frame:GetRegions()}
    for _, region in ipairs(regions) do
        if region and region.Hide then
            region:Hide()
        end
    end
end

-- ============================================================
-- Module loaded message (debug)
-- ============================================================

-- Uncomment for debug:
-- DEFAULT_CHAT_FRAME:AddMessage("|cff00ff00Bistooltip:|r Reset module loaded")
