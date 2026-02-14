-- =============================================================================
-- OmniInventory Item Button Widget
-- =============================================================================
-- Purpose: Reusable item slot button with icon, count, quality border,
-- tooltip, and click handling. Uses object pooling for efficiency.
-- =============================================================================

local addonName, Omni = ...

Omni.ItemButton = {}
local ItemButton = Omni.ItemButton

-- =============================================================================
-- Constants
-- =============================================================================

local BUTTON_SIZE = 37
local ICON_SIZE = 32
local BORDER_SIZE = 2

local QUALITY_COLORS = {
    [0] = { 0.62, 0.62, 0.62 },  -- Poor (Grey)
    [1] = { 1.00, 1.00, 1.00 },  -- Common (White)
    [2] = { 0.12, 1.00, 0.00 },  -- Uncommon (Green)
    [3] = { 0.00, 0.44, 0.87 },  -- Rare (Blue)
    [4] = { 0.64, 0.21, 0.93 },  -- Epic (Purple)
    [5] = { 1.00, 0.50, 0.00 },  -- Legendary (Orange)
    [6] = { 0.90, 0.80, 0.50 },  -- Artifact (Light Gold)
    [7] = { 0.00, 0.80, 1.00 },  -- Heirloom (Light Blue)
}

-- =============================================================================
-- Button Creation
-- =============================================================================

local buttonCount = 0

function ItemButton:Create(parent)
    buttonCount = buttonCount + 1
    local name = "OmniItemButton" .. buttonCount

    -- Create secure action button for protected item usage
    -- This allows WoW's secure action system to handle item use directly
    local button = CreateFrame("Button", name, parent, "SecureActionButtonTemplate")
    button:SetSize(BUTTON_SIZE, BUTTON_SIZE)
    button:RegisterForClicks("AnyUp")  -- SecureActionButton needs this for both left/right
    button:RegisterForDrag("LeftButton")

    -- Dark background
    button.bg = button:CreateTexture(nil, "BACKGROUND")
    button.bg:SetAllPoints()
    button.bg:SetTexture("Interface\\Buttons\\WHITE8X8")
    button.bg:SetVertexColor(0.1, 0.1, 0.1, 1)

    -- Icon texture
    button.icon = button:CreateTexture(nil, "ARTWORK")
    button.icon:SetPoint("TOPLEFT", 2, -2)
    button.icon:SetPoint("BOTTOMRIGHT", -2, 2)
    button.icon:SetTexCoord(0.08, 0.92, 0.08, 0.92)  -- Trim icon edges

    -- Stack count
    button.count = button:CreateFontString(nil, "OVERLAY", "NumberFontNormal")
    button.count:SetPoint("BOTTOMRIGHT", -2, 2)
    button.count:SetJustifyH("RIGHT")

    -- Quality border (our custom colored border)
    button.border = button:CreateTexture(nil, "OVERLAY")
    button.border:SetPoint("TOPLEFT", -1, 1)
    button.border:SetPoint("BOTTOMRIGHT", 1, -1)
    button.border:SetTexture("Interface\\Buttons\\WHITE8X8")
    button.border:SetVertexColor(0.3, 0.3, 0.3, 1)
    button:CreateTexture(nil, "OVERLAY"):Hide()  -- Placeholder

    -- Create actual border using 4 edge textures for clean look
    button.borderTop = button:CreateTexture(nil, "OVERLAY")
    button.borderTop:SetTexture("Interface\\Buttons\\WHITE8X8")
    button.borderTop:SetHeight(1)
    button.borderTop:SetPoint("TOPLEFT", 0, 0)
    button.borderTop:SetPoint("TOPRIGHT", 0, 0)
    button.borderTop:SetVertexColor(0.3, 0.3, 0.3, 1)

    button.borderBottom = button:CreateTexture(nil, "OVERLAY")
    button.borderBottom:SetTexture("Interface\\Buttons\\WHITE8X8")
    button.borderBottom:SetHeight(1)
    button.borderBottom:SetPoint("BOTTOMLEFT", 0, 0)
    button.borderBottom:SetPoint("BOTTOMRIGHT", 0, 0)
    button.borderBottom:SetVertexColor(0.3, 0.3, 0.3, 1)

    button.borderLeft = button:CreateTexture(nil, "OVERLAY")
    button.borderLeft:SetTexture("Interface\\Buttons\\WHITE8X8")
    button.borderLeft:SetWidth(1)
    button.borderLeft:SetPoint("TOPLEFT", 0, 0)
    button.borderLeft:SetPoint("BOTTOMLEFT", 0, 0)
    button.borderLeft:SetVertexColor(0.3, 0.3, 0.3, 1)

    button.borderRight = button:CreateTexture(nil, "OVERLAY")
    button.borderRight:SetTexture("Interface\\Buttons\\WHITE8X8")
    button.borderRight:SetWidth(1)
    button.borderRight:SetPoint("TOPRIGHT", 0, 0)
    button.borderRight:SetPoint("BOTTOMRIGHT", 0, 0)
    button.borderRight:SetVertexColor(0.3, 0.3, 0.3, 1)

    -- Hide the backdrop border texture we created earlier
    button.border:Hide()

    -- New item glow using AnimationGroup
    button.glow = button:CreateTexture(nil, "OVERLAY")
    button.glow:SetTexture("Interface\\Buttons\\UI-ActionButton-Border")
    button.glow:SetBlendMode("ADD")
    button.glow:SetPoint("CENTER")
    button.glow:SetSize(BUTTON_SIZE * 1.5, BUTTON_SIZE * 1.5)
    button.glow:SetVertexColor(0.0, 1.0, 0.5, 1)
    button.glow:Hide()

    -- New item glow animation (Classic WoW compatible)
    local ag = button.glow:CreateAnimationGroup()
    ag:SetLooping("BOUNCE")
    local fade = ag:CreateAnimation("Alpha")
    fade:SetChange(0.5)  -- Pulse alpha by 0.5 (Classic compatible)
    fade:SetDuration(0.8)
    fade:SetSmoothing("IN_OUT")
    button.glow.anim = ag

    -- Register with Masque if available
    if Omni.MasqueGroup then
        Omni.MasqueGroup:AddButton(button)
    end

    -- Pawn Upgrade Arrow
    button.upgradeArrow = button:CreateTexture(nil, "OVERLAY")
    button.upgradeArrow:SetTexture("Interface\\AddOns\\Pawn\\Textures\\UpgradeArrow")
    button.upgradeArrow:SetSize(23, 23)
    button.upgradeArrow:SetPoint("TOPLEFT", button, "TOPLEFT", 1, -1)
    button.upgradeArrow:Hide()

    -- Search dim overlay
    button.dimOverlay = button:CreateTexture(nil, "OVERLAY", nil, 7)
    button.dimOverlay:SetAllPoints(button.icon)
    button.dimOverlay:SetTexture("Interface\\Buttons\\WHITE8X8")
    button.dimOverlay:SetVertexColor(0, 0, 0, 0.7)
    button.dimOverlay:Hide()

    -- Pin/Favorite icon (star in top-right corner)
    button.pinIcon = button:CreateTexture(nil, "OVERLAY")
    button.pinIcon:SetTexture("Interface\\TargetingFrame\\UI-RaidTargetingIcon_1") -- Star icon
    button.pinIcon:SetSize(14, 14)
    button.pinIcon:SetPoint("TOPRIGHT", button, "TOPRIGHT", -1, -1)
    button.pinIcon:Hide()

    -- Store item info reference
    button.itemInfo = nil

    -- Click handlers - use PostClick so secure action fires first
    button:SetScript("PostClick", function(self, mouseButton)
        ItemButton:OnClick(self, mouseButton)
    end)

    button:SetScript("OnEnter", function(self)
        ItemButton:OnEnter(self)
    end)

    button:SetScript("OnLeave", function(self)
        ItemButton:OnLeave(self)
    end)

    -- Drag handlers
    button:SetScript("OnDragStart", function(self)
        ItemButton:OnDragStart(self)
    end)

    button:SetScript("OnReceiveDrag", function(self)
        ItemButton:OnReceiveDrag(self)
    end)

    return button
end

-- =============================================================================
-- Button Update
-- =============================================================================

function ItemButton:SetItem(button, itemInfo)
    if not button then return end

    button.itemInfo = itemInfo

    if not itemInfo then
        -- Empty slot
        button.icon:SetTexture(nil)
        button.count:SetText("")
        -- Reset border to dark grey
        local grey = 0.3
        if button.borderTop then button.borderTop:SetVertexColor(grey, grey, grey, 1) end
        if button.borderBottom then button.borderBottom:SetVertexColor(grey, grey, grey, 1) end
        if button.borderLeft then button.borderLeft:SetVertexColor(grey, grey, grey, 1) end
        if button.borderRight then button.borderRight:SetVertexColor(grey, grey, grey, 1) end
        button.glow:Hide()
        button.dimOverlay:Hide()
        -- Clear secure attributes
        button:SetAttribute("type", nil)
        button:SetAttribute("item", nil)
        return
    end

    -- Set icon
    local texture = itemInfo.iconFileID
    if texture then
        button.icon:SetTexture(texture)
    else
        button.icon:SetTexture("Interface\\Icons\\INV_Misc_QuestionMark")
    end

    -- Set count
    local count = itemInfo.stackCount or 1
    if count > 1 then
        button.count:SetText(count)
    else
        button.count:SetText("")
    end

    -- Set quality border color
    local quality = itemInfo.quality or 1
    local color = QUALITY_COLORS[quality] or QUALITY_COLORS[1]
    local r, g, b = color[1], color[2], color[3]

    if button.borderTop then button.borderTop:SetVertexColor(r, g, b, 1) end
    if button.borderBottom then button.borderBottom:SetVertexColor(r, g, b, 1) end
    if button.borderLeft then button.borderLeft:SetVertexColor(r, g, b, 1) end
    if button.borderRight then button.borderRight:SetVertexColor(r, g, b, 1) end

    -- Store bag/slot for container operations
    button.bagID = itemInfo.bagID
    button.slotID = itemInfo.slotID

    -- Configure secure action attributes for item usage
    -- This allows WoW's protected action system to handle item use directly
    -- Format: "bag slot" where bag is container ID (0-4) and slot is slot number
    button:SetAttribute("type", "item")
    button:SetAttribute("item", itemInfo.bagID .. " " .. itemInfo.slotID)

    -- New item glow with animation
    if itemInfo.isNew then
        button.glow:Show()
        button.glow.anim:Play()
    else
        button.glow.anim:Stop()
        button.glow:Hide()
    end

    -- Pawn Upgrade Check (wrapped in pcall for safety)
    button.upgradeArrow:Hide()
    if PawnIsContainerItemAnUpgrade and itemInfo.bagID and itemInfo.bagID >= 0 then
        local ok, isUpgrade = pcall(PawnIsContainerItemAnUpgrade, itemInfo.bagID, itemInfo.slotID)
        if ok and isUpgrade then
            button.upgradeArrow:Show()
        end
    end

    -- Apply quick filter dimming or clear search dim
    if itemInfo.isQuickFiltered then
        button.dimOverlay:Show()
        button.icon:SetDesaturated(true)
        button.icon:SetAlpha(0.4)
    else
        button.dimOverlay:Hide()
        button.icon:SetDesaturated(false)
        button.icon:SetAlpha(1)
    end

    -- Show pin icon if item is pinned
    if itemInfo.itemID and Omni.Data and Omni.Data:IsPinned(itemInfo.itemID) then
        button.pinIcon:Show()
    else
        button.pinIcon:Hide()
    end
end

-- =============================================================================
-- Search Highlighting
-- =============================================================================

function ItemButton:SetSearchMatch(button, isMatch)
    if not button then return end

    if isMatch then
        button.dimOverlay:Hide()
        button.icon:SetDesaturated(false)
        button.icon:SetAlpha(1)
    else
        button.dimOverlay:Show()
        button.icon:SetDesaturated(true)
        button.icon:SetAlpha(0.5)
    end
end

function ItemButton:ClearSearch(button)
    if not button then return end

    button.dimOverlay:Hide()
    button.icon:SetDesaturated(false)
    button.icon:SetAlpha(1)
end

-- =============================================================================
-- Event Handlers
-- =============================================================================

function ItemButton:OnClick(button, mouseButton)
    if not button or not button.itemInfo then return end

    local bagID = button.bagID
    local slotID = button.slotID

    if not bagID or not slotID then return end

    -- Clear new item status on any click
    if button.itemInfo and button.itemInfo.isNew then
        button.itemInfo.isNew = false
        button.glow:Hide()
        button.glowAnimating = false
        -- Also clear in Categorizer's tracking
        if Omni.Categorizer and button.itemInfo.itemID then
            Omni.Categorizer:ClearNewItem(button.itemInfo.itemID)
        end
    end

    -- Handle modifier clicks that the secure button doesn't handle
    -- Normal left/right clicks are handled by SecureActionButtonTemplate via type="item"
    if mouseButton == "LeftButton" then
        if IsModifiedClick("CHATLINK") then
            -- Shift-click to link item in chat
            local itemLink = GetContainerItemLink(bagID, slotID)
            if itemLink then
                ChatEdit_InsertLink(itemLink)
            end
        elseif IsModifiedClick("DRESSUP") then
            -- Ctrl-click for dressing room
            DressUpItemLink(GetContainerItemLink(bagID, slotID))
        elseif IsModifiedClick("PICKUPACTION") then
            -- Pickup item (drag)
            PickupContainerItem(bagID, slotID)
        elseif IsModifiedClick("SPLITSTACK") then
            -- Split stack
            local _, count = GetContainerItemInfo(bagID, slotID)
            if count and count > 1 then
                OpenStackSplitFrame(count, button, "BOTTOMRIGHT", "TOPRIGHT")
            end
        end
    elseif mouseButton == "RightButton" then
        -- Shift+Right-click to toggle pin/favorite
        if IsShiftKeyDown() and button.itemInfo.itemID then
            local isPinned = Omni.Data:TogglePin(button.itemInfo.itemID)

            -- Update pin icon immediately
            if isPinned then
                button.pinIcon:Show()
                print("|cFF00FF00Omni|r: Item pinned!")
            else
                button.pinIcon:Hide()
                print("|cFF00FF00Omni|r: Item unpinned.")
            end

            -- Refresh layout to re-sort with pinned items first
            if Omni.Frame then
                Omni.Frame:UpdateLayout()
            end
        end
    end
    -- Right-click item usage is handled by SecureActionButtonTemplate
end

function ItemButton:OnEnter(button)
    if not button or not button.itemInfo then return end

    local bagID = button.bagID
    local slotID = button.slotID

    GameTooltip:SetOwner(button, "ANCHOR_RIGHT")

    if bagID and bagID >= 0 then
        -- Standard online item
        GameTooltip:SetBagItem(bagID, slotID)
    elseif button.itemInfo.hyperlink then
        -- Offline/Bank item
        GameTooltip:SetHyperlink(button.itemInfo.hyperlink)
        GameTooltip:AddLine(" ")
        GameTooltip:AddLine("Bank Item (Offline)", 0.5, 0.5, 0.5)
    end

    -- Hook for Auctionator (if it doesn't hook automatically)
    if Auctionator and Auctionator.ShowTooltip then
         -- Auctionator usually hooks SetBagItem/SetHyperlink, but we can allow extra logic here if needed
    end

    GameTooltip:Show()

    -- Highlight in search
    if Omni.Frame and Omni.Frame.HighlightItem then
        Omni.Frame:HighlightItem(button.itemInfo)
    end
end

function ItemButton:OnLeave(button)
    GameTooltip:Hide()
end

function ItemButton:OnDragStart(button)
    if not button then return end

    local bagID = button.bagID
    local slotID = button.slotID

    if bagID and slotID then
        PickupContainerItem(bagID, slotID)
    end
end

function ItemButton:OnReceiveDrag(button)
    if not button then return end

    local bagID = button.bagID
    local slotID = button.slotID

    if bagID and slotID then
        PickupContainerItem(bagID, slotID)
    end
end

-- =============================================================================
-- Reset (for pool release)
-- =============================================================================

function ItemButton:Reset(button)
    if not button then return end

    button.itemInfo = nil
    button.bagID = nil
    button.slotID = nil
    button.icon:SetTexture(nil)
    button.count:SetText("")

    -- Reset border colors to grey
    local grey = 0.3
    if button.borderTop then button.borderTop:SetVertexColor(grey, grey, grey, 1) end
    if button.borderBottom then button.borderBottom:SetVertexColor(grey, grey, grey, 1) end
    if button.borderLeft then button.borderLeft:SetVertexColor(grey, grey, grey, 1) end
    if button.borderRight then button.borderRight:SetVertexColor(grey, grey, grey, 1) end

    if button.glow.anim then button.glow.anim:Stop() end
    button.glow:Hide()
    button.dimOverlay:Hide()
    button.icon:SetDesaturated(false)
    button.icon:SetAlpha(1)
    button:Hide()
end

print("|cFF00FF00OmniInventory|r: ItemButton loaded")
