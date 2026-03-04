local addonName, addon = ...

if type(addon) ~= "table" then
    addon = _G[addonName] or {}
end
_G[addonName] = addon

local updateFrame
local root
local icons = {}
local elapsedSinceUpdate = 0
local updateInterval = 0.10
local UPDATE_INTERVAL_COMBAT = 0.08
local UPDATE_INTERVAL_TARGET = 0.12
local UPDATE_INTERVAL_IDLE = 0.22
local forceUpdate = false
local QUESTION_MARK = "Interface\\Icons\\INV_Misc_QuestionMark"
local glowPulseTime = 0
local floor = math.floor
local min = math.min
local max = math.max
local MIN_QUEUE = 1
local MAX_QUEUE = 3
local ICON_UV_INSET = 0.07
local NEXT_ICON_SCALE = 1.00
local PREVIEW_ICON_SCALE = 0.72
local NEXT_ICON_ALPHA = 1.00
local PREVIEW_ICON_ALPHA = 0.76
local ROOT_PAD_X = 8
local ROOT_PAD_Y = 6
local CD_PANEL_GAP = 8
local CD_PANEL_SCALE = 0.84
local CD_PANEL_PAD_X = 6
local CD_PANEL_PAD_Y = 5
local deferredUIState = {
    movable = false,
    visibility = nil,
}

local function clampQueueLength(value)
    return floor(max(MIN_QUEUE, min(MAX_QUEUE, tonumber(value) or MIN_QUEUE)))
end

local function inCombat()
    return (InCombatLockdown and InCombatLockdown()) or false
end

local function iconVisualSize(baseSize, index)
    if index <= 1 then
        return floor((baseSize * NEXT_ICON_SCALE) + 0.5)
    end
    return floor((baseSize * PREVIEW_ICON_SCALE) + 0.5)
end

local function iconTexturePad(iconSize)
    return max(1, floor((iconSize * 0.03) + 0.5))
end

local function borderPad(iconSize)
    return max(1, floor((iconSize * 0.05) + 0.5))
end

local function glowPad(iconSize)
    return max(3, floor((iconSize * 0.06) + 0.5))
end

local function applyIconGeometry(icon, iconSize)
    local texPad = iconTexturePad(iconSize)
    local brPad = borderPad(iconSize)
    local glPad = glowPad(iconSize)

    icon.texture:ClearAllPoints()
    icon.texture:SetPoint("TOPLEFT", icon, "TOPLEFT", texPad, -texPad)
    icon.texture:SetPoint("BOTTOMRIGHT", icon, "BOTTOMRIGHT", -texPad, texPad)
    icon.texture:SetTexCoord(ICON_UV_INSET, 1 - ICON_UV_INSET, ICON_UV_INSET, 1 - ICON_UV_INSET)

    icon.border:ClearAllPoints()
    icon.border:SetPoint("TOPLEFT", -brPad, brPad)
    icon.border:SetPoint("BOTTOMRIGHT", brPad, -brPad)

    icon.glow:ClearAllPoints()
    -- Keep glow a bit larger than the spell image itself.
    icon.glow:SetPoint("TOPLEFT", icon.texture, "TOPLEFT", -glPad, glPad)
    icon.glow:SetPoint("BOTTOMRIGHT", icon.texture, "BOTTOMRIGHT", glPad, -glPad)
end

local function updateModeBadge(profileKey)
    if not root or not root.modeText then
        return
    end

    local mode = "ST"
    if type(profileKey) == "string" then
        if string.find(profileKey, ":aoe", 1, true) then
            mode = "AOE"
        elseif string.find(profileKey, ":cleave", 1, true) then
            mode = "CLV"
        end
    end

    root.modeText:SetText(mode)
    if mode == "AOE" then
        root.modeBadge:SetBackdropColor(0.20, 0.06, 0.02, 0.82)
        root.modeBadge:SetBackdropBorderColor(1.00, 0.45, 0.18, 0.95)
        root.modeText:SetTextColor(1.00, 0.86, 0.74)
    elseif mode == "CLV" then
        root.modeBadge:SetBackdropColor(0.20, 0.14, 0.03, 0.82)
        root.modeBadge:SetBackdropBorderColor(1.00, 0.82, 0.22, 0.95)
        root.modeText:SetTextColor(1.00, 0.92, 0.68)
    else
        root.modeBadge:SetBackdropColor(0.04, 0.16, 0.06, 0.82)
        root.modeBadge:SetBackdropBorderColor(0.35, 0.90, 0.45, 0.95)
        root.modeText:SetTextColor(0.82, 1.00, 0.82)
    end
end

local function createIcon(parent, size)
    local f = CreateFrame("Frame", nil, parent)
    f:SetSize(size, size)

    f.texture = f:CreateTexture(nil, "ARTWORK")
    f.texture:SetVertexColor(1, 1, 1)

    f.border = f:CreateTexture(nil, "OVERLAY")
    f.border:SetTexture("Interface\\Buttons\\UI-ActionButton-Border")
    f.border:SetBlendMode("ADD")
    f.border:SetAlpha(0.36)
    f.border:Hide()

    f.glow = f:CreateTexture(nil, "OVERLAY")
    f.glow:SetTexture("Interface\\Buttons\\UI-ActionButton-Border")
    f.glow:SetBlendMode("ADD")
    f.glow:SetVertexColor(1.00, 0.86, 0.24)
    f.glow:SetAlpha(0)
    f.glow:Hide()

    f.cd = CreateFrame("Cooldown", nil, f, "CooldownFrameTemplate")
    f.cd:SetAllPoints(f)
    if f.cd.SetReverse then
        f.cd:SetReverse(true)
    end

    f:SetBackdrop({
        bgFile = "Interface\\Buttons\\WHITE8x8",
        edgeFile = "Interface\\Tooltips\\UI-Tooltip-Border",
        tile = false,
        edgeSize = 8,
        insets = { left = 1, right = 1, top = 1, bottom = 1 },
    })
    f:SetBackdropColor(0, 0, 0, 0.42)
    f:SetBackdropBorderColor(0.2, 0.2, 0.2, 0.82)
    applyIconGeometry(f, size)

    f:Hide()
    return f
end

local function ensureIconCount(count)
    for i = #icons + 1, count do
        icons[i] = createIcon(root, addon.db.iconSize)
    end
end

local function setMovableState()
    if not root then
        return
    end
    if inCombat() then
        deferredUIState.movable = true
        return
    end

    if addon.db.locked then
        root:EnableMouse(false)
        root:RegisterForDrag()
    else
        root:EnableMouse(true)
        root:RegisterForDrag("LeftButton")
    end
end

function addon:ApplyDeferredUI()
    if not root or inCombat() then
        return
    end

    if addon.pendingApplyPosition and addon.ApplyPosition then
        addon:ApplyPosition()
        addon.pendingApplyPosition = nil
    end
    if addon.pendingRefreshLayout and addon.RefreshLayout then
        addon:RefreshLayout()
        addon.pendingRefreshLayout = nil
    end

    if deferredUIState.movable then
        deferredUIState.movable = false
        setMovableState()
    end

    if deferredUIState.visibility ~= nil then
        local visible = deferredUIState.visibility
        deferredUIState.visibility = nil
        if visible then
            root:Show()
        else
            root:Hide()
        end
    end
end

local function savePosition()
    if not root then
        return
    end
    local point, _, relPoint, x, y = root:GetPoint(1)
    addon.db.point = point
    addon.db.relPoint = relPoint
    addon.db.x = x
    addon.db.y = y
end

local function setCooldown(icon, spell)
    local spellName = addon:GetSpellName(spell)
    if not spellName then
        icon.cd:Hide()
        return
    end

    local start, duration, enabled = GetSpellCooldown(spellName)
    if start and duration and enabled == 1 and duration > 1.5 and start > 0 then
        CooldownFrame_SetTimer(icon.cd, start, duration, 1)
        icon.cd:Show()
    else
        icon.cd:Hide()
    end
end

local function updateIcon(icon, spell)
    if not spell then
        icon.texture:SetTexture(QUESTION_MARK)
        if icon.texture.SetDesaturated then
            icon.texture:SetDesaturated(true)
        end
        icon:SetAlpha(0.35)
        icon.cd:Hide()
        icon:Show()
        return
    end

    local tex = addon:GetSpellTexture(spell)
    if not tex then
        icon.texture:SetTexture(QUESTION_MARK)
        if icon.texture.SetDesaturated then
            icon.texture:SetDesaturated(true)
        end
        icon:SetAlpha(0.35)
        icon.cd:Hide()
        icon:Show()
        return
    end

    icon.texture:SetTexture(tex)
    if icon.texture.SetDesaturated then
        icon.texture:SetDesaturated(false)
    end
    icon:SetAlpha(1)
    setCooldown(icon, spell)
    icon:Show()
end

local function updateRecommendations()
    if not addon.db.enabled or not root then
        return
    end

    local state = addon:BuildState()
    local queue, specKey = addon:GetPriorityQueue(state)
    local cooldownQueue = addon.GetCooldownQueue and addon:GetCooldownQueue(state) or nil
    local cooldownSpell = cooldownQueue and cooldownQueue[1] or nil
    local queueLength = clampQueueLength(addon.db.queueLength or 1)
    updateModeBadge(specKey)

    for i = 1, queueLength do
        local spell = queue and queue[i] or nil
        updateIcon(icons[i], spell)

        if i == 1 and spell then
            icons[i]:SetAlpha(NEXT_ICON_ALPHA)
            icons[i].border:Show()
            icons[i].glow:Show()
            icons[i]:SetBackdropBorderColor(0.30, 0.30, 0.30, 0.95)
        else
            icons[i].border:Hide()
            icons[i].glow:Hide()
            if spell then
                local previewAlpha = PREVIEW_ICON_ALPHA - ((i - 2) * 0.10)
                icons[i]:SetAlpha(max(0.58, previewAlpha))
            else
                icons[i]:SetAlpha(0.30)
            end
            icons[i]:SetBackdropBorderColor(0.16, 0.16, 0.16, 0.78)
        end
    end

    for i = queueLength + 1, #icons do
        icons[i]:Hide()
        icons[i].glow:Hide()
    end

    if root.cooldownPanel and root.cooldownIcon then
        if addon.db.cooldownWindow == false or not cooldownSpell then
            root.cooldownIcon.glow:Hide()
            root.cooldownIcon.border:Hide()
            root.cooldownPanel:Hide()
        else
            updateIcon(root.cooldownIcon, cooldownSpell)
            root.cooldownIcon:SetAlpha(1)
            root.cooldownIcon.border:Show()
            root.cooldownIcon.glow:Show()
            root.cooldownIcon:SetBackdropBorderColor(0.64, 0.48, 0.16, 0.92)
            root.cooldownPanel:Show()
        end
    end

    -- unsupported specs keep frame at lower alpha for visual feedback
    if specKey == "fallback" then
        root:SetAlpha((addon.db.alpha or 1) * 0.65)
    else
        root:SetAlpha(addon.db.alpha or 1)
    end
end

local function resolveUpdateInterval()
    if not addon.db or not addon.db.enabled then
        return UPDATE_INTERVAL_IDLE
    end
    local s = addon.state
    if s and s.inCombat then
        return UPDATE_INTERVAL_COMBAT
    end
    if s and s.targetExists and s.targetAttackable then
        return UPDATE_INTERVAL_TARGET
    end
    return UPDATE_INTERVAL_IDLE
end

function addon:ApplyPosition()
    if not root then
        return
    end
    root:ClearAllPoints()
    root:SetPoint(
        addon.db.point or "CENTER",
        UIParent,
        addon.db.relPoint or "CENTER",
        addon.db.x or 0,
        addon.db.y or 0
    )
end

function addon:RefreshLayout()
    if not root then
        return
    end

    local size = addon.db.iconSize or 52
    local spacing = addon.db.spacing or 6
    local queueLength = clampQueueLength(addon.db.queueLength or 1)

    addon.db.queueLength = queueLength
    ensureIconCount(queueLength)

    local totalWidth = 0
    local maxHeight = 0
    for i = 1, queueLength do
        local iconSize = iconVisualSize(size, i)
        totalWidth = totalWidth + iconSize
        maxHeight = max(maxHeight, iconSize)
    end
    totalWidth = totalWidth + (spacing * max(0, queueLength - 1))

    root:SetScale(addon.db.scale or 1)
    root:SetAlpha(addon.db.alpha or 1)
    root:SetSize(totalWidth + (ROOT_PAD_X * 2), maxHeight + (ROOT_PAD_Y * 2))

    for i = 1, queueLength do
        local icon = icons[i]
        local iconSize = iconVisualSize(size, i)
        icon:SetSize(iconSize, iconSize)
        applyIconGeometry(icon, iconSize)
        icon:ClearAllPoints()
        if i == 1 then
            icon:SetPoint("LEFT", root, "LEFT", ROOT_PAD_X, 0)
        else
            icon:SetPoint("LEFT", icons[i - 1], "RIGHT", spacing, 0)
        end
    end

    for i = queueLength + 1, #icons do
        icons[i]:Hide()
    end

    if root.modeBadge then
        root.modeBadge:ClearAllPoints()
        root.modeBadge:SetPoint("TOPRIGHT", root, "TOPRIGHT", -1, 11)
    end

    if root.cooldownPanel and root.cooldownIcon then
        local cdIconSize = max(30, floor((size * CD_PANEL_SCALE) + 0.5))
        root.cooldownPanel:SetSize(cdIconSize + (CD_PANEL_PAD_X * 2), cdIconSize + (CD_PANEL_PAD_Y * 2))
        root.cooldownPanel:ClearAllPoints()
        root.cooldownPanel:SetPoint("TOP", root, "BOTTOM", 0, -(spacing + CD_PANEL_GAP))

        root.cooldownIcon:SetSize(cdIconSize, cdIconSize)
        applyIconGeometry(root.cooldownIcon, cdIconSize)
        root.cooldownIcon:ClearAllPoints()
        root.cooldownIcon:SetPoint("CENTER", root.cooldownPanel, "CENTER", 0, 0)

        if root.cooldownText then
            root.cooldownText:ClearAllPoints()
            root.cooldownText:SetPoint("BOTTOM", root.cooldownPanel, "TOP", 0, 2)
        end
    end
end

function addon:RequestImmediateUpdate()
    forceUpdate = true
end

local function parseSlash(msg)
    local cmd, rest = msg:match("^(%S+)%s*(.-)$")
    if not cmd then
        return "", ""
    end
    return string.lower(cmd), rest
end

local function help()
    addon:Print("Commands:")
    addon:Print("/hikili | /hk")
    addon:Print("/hikili lock | unlock")
    addon:Print("/hikili show | hide | toggle")
    addon:Print("/hikili scale <0.5-2>")
    addon:Print("/hikili alpha <0.2-1>")
    addon:Print("/hikili size <30-96>")
    addon:Print("/hikili spacing <0-20>")
    addon:Print("/hikili queue <1-3>")
    addon:Print("/hikili cleave <1-10>")
    addon:Print("/hikili aoe <1-10>")
    addon:Print("/hikili cdsync on|off")
    addon:Print("/hikili cdwindow on|off")
    addon:Print("/hikili rescan")
    addon:Print("/hikili reset")
    addon:Print("/hikili debug")
end

local function formatRemaining(remains)
    if not remains or remains <= 0 then
        return "0.0"
    end
    if remains >= 9000 then
        return "up"
    end
    return string.format("%.1f", remains)
end

function addon:InitializeUI()
    root = CreateFrame("Frame", "HikiliFrame", UIParent)
    root:SetClampedToScreen(true)
    root:SetMovable(true)
    root:SetUserPlaced(true)
    root:SetBackdrop({
        bgFile = "Interface\\Buttons\\WHITE8x8",
        edgeFile = "Interface\\Tooltips\\UI-Tooltip-Border",
        tile = false,
        edgeSize = 9,
        insets = { left = 1, right = 1, top = 1, bottom = 1 },
    })
    root:SetBackdropColor(0, 0, 0, 0.34)
    root:SetBackdropBorderColor(0.24, 0.24, 0.24, 0.80)
    root:SetScript("OnDragStart", function(self)
        if addon.db.locked or inCombat() then
            return
        end
        self:StartMoving()
    end)
    root:SetScript("OnDragStop", function(self)
        self:StopMovingOrSizing()
        savePosition()
    end)

    root.modeBadge = CreateFrame("Frame", nil, root)
    root.modeBadge:SetSize(34, 14)
    root.modeBadge:SetBackdrop({
        bgFile = "Interface\\Buttons\\WHITE8x8",
        edgeFile = "Interface\\Tooltips\\UI-Tooltip-Border",
        tile = false,
        edgeSize = 8,
        insets = { left = 1, right = 1, top = 1, bottom = 1 },
    })
    root.modeBadge:SetBackdropColor(0.04, 0.16, 0.06, 0.82)
    root.modeBadge:SetBackdropBorderColor(0.35, 0.90, 0.45, 0.95)
    root.modeBadge:SetPoint("TOPRIGHT", root, "TOPRIGHT", -1, 11)

    root.modeText = root.modeBadge:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
    root.modeText:SetPoint("CENTER", root.modeBadge, "CENTER", 0, 0)
    root.modeText:SetTextColor(0.82, 1.00, 0.82)
    root.modeText:SetText("ST")

    root.cooldownPanel = CreateFrame("Frame", nil, root)
    root.cooldownPanel:SetBackdrop({
        bgFile = "Interface\\Buttons\\WHITE8x8",
        edgeFile = "Interface\\Tooltips\\UI-Tooltip-Border",
        tile = false,
        edgeSize = 8,
        insets = { left = 1, right = 1, top = 1, bottom = 1 },
    })
    root.cooldownPanel:SetBackdropColor(0, 0, 0, 0.30)
    root.cooldownPanel:SetBackdropBorderColor(0.58, 0.46, 0.18, 0.88)

    local cdInitSize = max(30, floor(((addon.db.iconSize or 52) * CD_PANEL_SCALE) + 0.5))
    root.cooldownIcon = createIcon(root.cooldownPanel, cdInitSize)
    root.cooldownIcon:SetPoint("CENTER", root.cooldownPanel, "CENTER", 0, 0)

    root.cooldownText = root.cooldownPanel:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
    root.cooldownText:SetTextColor(1.00, 0.88, 0.45)
    root.cooldownText:SetText("CD")
    root.cooldownPanel:Hide()

    addon.db.queueLength = clampQueueLength(addon.db.queueLength or 1)
    ensureIconCount(addon.db.queueLength)

    self:ApplyPosition()
    self:RefreshLayout()
    setMovableState()

    updateFrame = CreateFrame("Frame")
    updateFrame:SetScript("OnUpdate", function(_, elapsed)
        elapsedSinceUpdate = elapsedSinceUpdate + elapsed
        glowPulseTime = glowPulseTime + elapsed
        updateInterval = resolveUpdateInterval()
        if not inCombat() then
            addon:ApplyDeferredUI()
        end

        if forceUpdate or elapsedSinceUpdate >= updateInterval then
            forceUpdate = false
            elapsedSinceUpdate = 0
            updateRecommendations()
        end

        local icon = icons[1]
        if icon and icon.glow and icon.glow:IsShown() then
            local alpha = 0.18 + (0.18 * math.abs(math.sin(glowPulseTime * 4.2)))
            icon.glow:SetAlpha(alpha)
        end
        local cdIcon = root and root.cooldownIcon
        if cdIcon and cdIcon.glow and cdIcon.glow:IsShown() then
            local alpha = 0.16 + (0.20 * math.abs(math.sin((glowPulseTime * 3.8) + 0.6)))
            cdIcon.glow:SetAlpha(alpha)
        end
    end)

    SLASH_HIKILI1 = "/hikili"
    SLASH_HIKILI2 = "/hk"
    SlashCmdList.HIKILI = function(msg)
        local cmd, rest = parseSlash(msg or "")
        if cmd == "" then
            help()
            return
        end

        if cmd == "lock" then
            addon.db.locked = true
            if inCombat() then
                deferredUIState.movable = true
                addon:Print("Frame lock queued until combat ends.")
            else
                setMovableState()
                addon:Print("Frame locked.")
            end
        elseif cmd == "unlock" then
            addon.db.locked = false
            if inCombat() then
                deferredUIState.movable = true
                addon:Print("Frame unlock queued until combat ends.")
            else
                setMovableState()
                addon:Print("Frame unlocked.")
            end
        elseif cmd == "show" then
            addon.db.enabled = true
            if inCombat() then
                deferredUIState.visibility = true
                addon:Print("Show queued until combat ends.")
            else
                root:Show()
                addon:Print("Enabled.")
            end
        elseif cmd == "hide" then
            addon.db.enabled = false
            if inCombat() then
                deferredUIState.visibility = false
                addon:Print("Hide queued until combat ends.")
            else
                root:Hide()
                addon:Print("Hidden.")
            end
        elseif cmd == "toggle" then
            addon.db.enabled = not addon.db.enabled
            if inCombat() then
                deferredUIState.visibility = addon.db.enabled
                addon:Print("Toggle queued until combat ends.")
            elseif addon.db.enabled then
                root:Show()
                addon:Print("Enabled.")
            else
                root:Hide()
                addon:Print("Hidden.")
            end
        elseif cmd == "scale" then
            local n = tonumber(rest)
            if n then
                addon:ApplySetting("scale", n)
                addon:Print("Scale set to " .. string.format("%.2f", addon.db.scale))
            else
                addon:Print("Usage: /hikili scale 1.2")
            end
        elseif cmd == "alpha" then
            local n = tonumber(rest)
            if n then
                addon:ApplySetting("alpha", n)
                addon:Print("Alpha set to " .. string.format("%.2f", addon.db.alpha))
            else
                addon:Print("Usage: /hikili alpha 0.9")
            end
        elseif cmd == "size" then
            local n = tonumber(rest)
            if n then
                addon:ApplySetting("iconSize", n)
                addon:Print("Icon size set to " .. addon.db.iconSize)
            else
                addon:Print("Usage: /hikili size 56")
            end
        elseif cmd == "spacing" then
            local n = tonumber(rest)
            if n then
                addon:ApplySetting("spacing", n)
                addon:Print("Spacing set to " .. addon.db.spacing)
            else
                addon:Print("Usage: /hikili spacing 6")
            end
        elseif cmd == "queue" then
            local n = tonumber(rest)
            if n then
                addon:ApplySetting("queueLength", n)
                if addon.db.queueLength == 1 then
                    addon:Print("Queue set to 1 (next action only).")
                else
                    addon:Print("Queue set to " .. addon.db.queueLength .. " (next + preview).")
                end
            else
                addon:Print("Usage: /hikili queue 1")
            end
        elseif cmd == "cleave" then
            local n = tonumber(rest)
            if n then
                addon:ApplySetting("cleaveThreshold", n)
                addon:Print("Cleave threshold set to " .. tostring(addon.db.cleaveThreshold) .. " targets.")
            else
                addon:Print("Usage: /hikili cleave 2")
            end
        elseif cmd == "aoe" then
            local n = tonumber(rest)
            if n then
                addon:ApplySetting("aoeThreshold", n)
                addon:Print("AOE threshold set to " .. tostring(addon.db.aoeThreshold) .. " targets.")
            else
                addon:Print("Usage: /hikili aoe 3")
            end
        elseif cmd == "cdsync" then
            local arg = string.lower(tostring(rest or ""))
            if arg == "on" or arg == "1" or arg == "true" then
                addon:ApplySetting("cooldownSync", true)
                addon:Print("Cooldown sync enabled.")
            elseif arg == "off" or arg == "0" or arg == "false" then
                addon:ApplySetting("cooldownSync", false)
                addon:Print("Cooldown sync disabled.")
            else
                addon:Print("Usage: /hikili cdsync on")
            end
        elseif cmd == "cdwindow" then
            local arg = string.lower(tostring(rest or ""))
            if arg == "on" or arg == "1" or arg == "true" then
                addon:ApplySetting("cooldownWindow", true)
                addon:Print("Cooldown window enabled.")
            elseif arg == "off" or arg == "0" or arg == "false" then
                addon:ApplySetting("cooldownWindow", false)
                addon:Print("Cooldown window disabled.")
            else
                addon:Print("Usage: /hikili cdwindow on")
            end
        elseif cmd == "rescan" then
            if addon.RefreshKnownSpells then
                addon:RefreshKnownSpells()
            end
            if addon.RefreshGlyphs then
                addon:RefreshGlyphs()
            end
            addon:Print("Spellbook rescanned. knownCount=" .. tostring(addon.knownSpellCount or 0))
            if addon.HasGlyphLike then
                addon:Print("Glyph Life Tap detected=" .. tostring(addon:HasGlyphLike("life tap")))
            end
        elseif cmd == "reset" then
            addon:ResetPosition()
            addon:Print("Position reset.")
        elseif cmd == "debug" then
            local state = addon:BuildState()
            local queue, key = addon:GetPriorityQueue(state)
            local cdQueue, cdKey = nil, nil
            if addon.GetCooldownQueue then
                cdQueue, cdKey = addon:GetCooldownQueue(state)
            end
            local handler = addon.Priorities and state.specKey and addon.Priorities[state.specKey]
            local trackerSize = 0
            for _ in pairs(addon.enemyTracker or {}) do
                trackerSize = trackerSize + 1
            end
            local s1 = queue and queue[1] and addon:GetSpellName(queue[1]) or "-"
            local s2 = queue and queue[2] and addon:GetSpellName(queue[2]) or "-"
            local s3 = queue and queue[3] and addon:GetSpellName(queue[3]) or "-"
            local cd1 = cdQueue and cdQueue[1] and addon:GetSpellName(cdQueue[1]) or "-"
            local k1 = queue and queue[1] and addon:IsSpellKnownLocal(queue[1]) or false
            local k2 = queue and queue[2] and addon:IsSpellKnownLocal(queue[2]) or false
            local k3 = queue and queue[3] and addon:IsSpellKnownLocal(queue[3]) or false
            addon:Print("enabled=" .. tostring(addon.db.enabled) .. ", locked=" .. tostring(addon.db.locked))
            addon:Print("spec=" .. tostring(state.specKey) .. ", handler=" .. tostring(handler ~= nil) .. ", profile=" .. tostring(key) .. ", queue=" .. tostring(queue and #queue or 0))
            addon:Print("queueLength=" .. tostring(addon.db.queueLength) .. " uiInterval=" .. string.format("%.2f", updateInterval or 0) .. " cdsync=" .. tostring(addon.db.cooldownSync))
            addon:Print("enemyCount=" .. tostring(state.enemyCount or 0) .. " directEnemies=" .. tostring(state.enemyDirectCount or state.enemyCount or 0) .. " cleaveThreshold=" .. tostring(addon.db.cleaveThreshold or 2) .. " aoeThreshold=" .. tostring(addon.db.aoeThreshold or 3) .. " cleaveMode=" .. tostring(state.cleave) .. " aoeMode=" .. tostring(state.aoe) .. " trackerSize=" .. tostring(trackerSize))
            addon:Print("target exists=" .. tostring(state.targetExists) .. " dead=" .. tostring(state.targetDead) .. " attackable=" .. tostring(state.targetAttackable))
            addon:Print("combatTime=" .. string.format("%.1f", state.combatTime or 0) .. " boss=" .. tostring(state.targetIsBoss))
            addon:Print("resources energy=" .. tostring(state.energy or 0) .. " cp=" .. tostring(state.comboPoints or 0) .. " manaPct=" .. string.format("%.1f", state.manaPct or 0))
            addon:Print("casting=" .. tostring(state.casting) .. " channeling=" .. tostring(state.channeling) .. " moving=" .. tostring(state.moving) .. " castRem=" .. formatRemaining(state.castRemaining) .. " castSpell=" .. tostring(state.currentCastSpell or "-"))
            addon:Print("next=" .. tostring(s1) .. " | " .. tostring(s2) .. " | " .. tostring(s3))
            addon:Print("cdnext=" .. tostring(cd1) .. " cdprofile=" .. tostring(cdKey or "-") .. " cdwindow=" .. tostring(addon.db.cooldownWindow ~= false))
            addon:Print("known=" .. tostring(k1) .. " | " .. tostring(k2) .. " | " .. tostring(k3))
            addon:Print("knownCount=" .. tostring(addon.knownSpellCount or 0))
            local hasSBN = type(GetSpellBookItemName) == "function"
            local hasGSN = type(GetSpellName) == "function"
            local hasSBI = type(GetSpellBookItemInfo) == "function"
            local sample = "-"
            if hasSBN then
                sample = tostring(GetSpellBookItemName(1, BOOKTYPE_SPELL or "spell") or "-")
            elseif hasGSN then
                sample = tostring(GetSpellName(1, BOOKTYPE_SPELL or "spell") or "-")
            end
            addon:Print("api sbn=" .. tostring(hasSBN) .. " gsn=" .. tostring(hasGSN) .. " sbi=" .. tostring(hasSBI) .. " sample1=" .. tostring(sample))
            if state.specKey and string.find(state.specKey, "WARLOCK:", 1, true) == 1 then
                local corr = addon:DebuffRemaining("target", "Corruption", true)
                local ua = addon:DebuffRemaining("target", "Unstable Affliction", true)
                local haunt = addon:DebuffRemaining("target", "Haunt", true)
                local kc = addon:IsSpellKnownLocal("Corruption")
                local kua = addon:IsSpellKnownLocal("Unstable Affliction")
                local kh = addon:IsSpellKnownLocal("Haunt")
                local u1, m1 = IsUsableSpell("Corruption")
                local u2, m2 = IsUsableSpell("Unstable Affliction")
                local lifeTapBuff = addon:BuffRemaining("player", "Life Tap")
                local hasGlyphLT = addon.HasGlyphLike and addon:HasGlyphLike("life tap")
                local tl = UnitLevel("target")
                local tc = UnitClassification and UnitClassification("target") or "-"
                addon:Print("dots corr=" .. formatRemaining(corr) .. " ua=" .. formatRemaining(ua) .. " haunt=" .. formatRemaining(haunt))
                addon:Print("known dots corr=" .. tostring(kc) .. " ua=" .. tostring(kua) .. " haunt=" .. tostring(kh))
                addon:Print("usable corr=" .. tostring(u1) .. "/" .. tostring(m1) .. " ua=" .. tostring(u2) .. "/" .. tostring(m2))
                addon:Print("glyphLT=" .. tostring(hasGlyphLT) .. " lifeTapBuff=" .. formatRemaining(lifeTapBuff))
                addon:Print("target lvl=" .. tostring(tl) .. " classif=" .. tostring(tc))
            end
            if state.specKey == "DRUID:2" then
                local function debuffAnyText(spell)
                    local found, remains, _, caster = addon:FindAura("target", spell, false, false)
                    if not found then
                        return "0(-)"
                    end
                    return formatRemaining(remains) .. "(" .. tostring(caster or "-") .. ")"
                end
                local mangleMine = addon:DebuffRemaining("target", "Mangle", true)
                local mangleCatMine = addon:DebuffRemaining("target", "Mangle (Cat)", true)
                addon:Print("feral mangleMine=" .. formatRemaining(mangleMine) .. " mangleCatMine=" .. formatRemaining(mangleCatMine))
                addon:Print("feral mangleAny=" .. debuffAnyText("Mangle") .. " mangleCatAny=" .. debuffAnyText("Mangle (Cat)") .. " traumaAny=" .. debuffAnyText("Trauma"))
            end
            local cdShown = root.cooldownPanel and root.cooldownPanel:IsShown() or false
            addon:Print("frameShown=" .. tostring(root:IsShown()) .. " cdShown=" .. tostring(cdShown) .. ", point=" .. tostring(addon.db.point) .. " x=" .. tostring(addon.db.x) .. " y=" .. tostring(addon.db.y))
        else
            help()
        end

        addon:RequestImmediateUpdate()
    end

    if not addon.db.enabled then
        root:Hide()
    end

    addon:RequestImmediateUpdate()
end
