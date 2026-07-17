--========================================================--
-- LFDAscended
-- Automatically selects your preferred LFD queue type
--========================================================--

local playerName = UnitName("player")
local _, class = UnitClass("player")
local classColorData = RAID_CLASS_COLORS and RAID_CLASS_COLORS[class] or { r = 1, g = 1, b = 1 }
local classColor = string.format("|cff%02x%02x%02x", classColorData.r * 255, classColorData.g * 255, classColorData.b * 255)


--========================================================--
-- Constants & Saved Variables
--========================================================--

local AUTO_WINDOW = 1.0 -- seconds after opening where we "fight" the default
local lastOpenTime = 0
local reapplying = false

local DEFAULT_OPTIONS = {
  "Specific Dungeons",
  "Random Lich King Dungeon",
  "Random Lich King Heroic",
  "Random Ascended | Dungeon",
}

local function EnsureDB()
  if not LFDAscendedDB then
    LFDAscendedDB = {}
  end

  if not LFDAscendedDB.defaultText or LFDAscendedDB.defaultText == "" then
    local level = UnitLevel("player") or 1
    -- You can change this logic if you want level-based defaults later
    if level >= 80 then
      LFDAscendedDB.defaultText = "Random Ascended | Dungeon"
    else
      LFDAscendedDB.defaultText = "Random Ascended | Dungeon"
    end
  end
end

local ADDON_NAME = ...
local ADDON_VERSION = GetAddOnMetadata(ADDON_NAME, "Version") or "unknown"

DEFAULT_CHAT_FRAME:AddMessage(
  "|cff00ff00LFDAscended|r: Loaded. Welcome back "
  .. classColor .. playerName .. "|r, enjoy not accidentally queuing heroic!"
)

--========================================================--
-- Utility Helpers
--========================================================--

local function GetDropdown()
  return _G["LFDQueueFrameTypeDropDown"]
      or _G["LFDDungeonTypeDropDown"]
      or _G["LFDQueueFrame_TypeDropDown"]
end

local function GetLFDParent()
  return _G["LFDParentFrame"]
      or _G["LFDFrame"]
      or _G["LFDQueueFrame"]
end

local function NormalizeText(s)
  s = string.lower(s or "")
  s = s:gsub("|c%x%x%x%x%x%x%x%x", "") -- strip color codes
  s = s:gsub("|r", "")
  s = s:gsub("↑", "")
  s = s:gsub("%s+", " ")
  s = s:gsub("^%s+", "")
  s = s:gsub("%s+$", "")
  return s
end

local function TableContains(tbl, value)
  if not tbl then return false end
  for _, v in ipairs(tbl) do
    if v == value then
      return true
    end
  end
  return false
end

local function WithOpenDropdown(fn)
  local dd = GetDropdown()
  if not dd then return nil end

  local ddName = dd:GetName()
  local button = ddName and _G[ddName .. "Button"]

  if button and button.Click then
    button:Click()
  else
    ToggleDropDownMenu(1, nil, dd)
  end

  local result = fn()
  CloseDropDownMenus()
  return result
end

local function ForEachDropdownButton(callback)
  for i = 1, 50 do
    local b = _G["DropDownList1Button" .. i]
    local t = _G["DropDownList1Button" .. i .. "NormalText"]
    local text = t and t:GetText()

    if b and b:IsShown() and type(text) == "string" then
      callback(b, text)
    end
  end
end

--========================================================--
-- Dropdown Option Scanning & Selection
--========================================================--

local function ScanLFDTypeOptions()
  return WithOpenDropdown(function()
    local found, seen = {}, {}

    ForEachDropdownButton(function(_, text)
      local trimmed = text:gsub("^%s+", ""):gsub("%s+$", "")
      if trimmed ~= "" and not seen[trimmed] then
        seen[trimmed] = true
        table.insert(found, trimmed)
      end
    end)

    if #found > 0 then
      return found
    end
    return nil
  end)
end

local function ClickDefaultInOpenMenu()
  local target = (LFDAscendedDB and LFDAscendedDB.defaultText) or "Random Ascended | Dungeon"
  local nTarget = NormalizeText(target)

  local matched = nil

  -- Pass 1: exact normalized match
  ForEachDropdownButton(function(b, text)
    if not matched and NormalizeText(text) == nTarget then
      b:Click()
      matched = text
    end
  end)

  if matched then
    return true, matched
  end

  -- Pass 2: Ascended fallback (only if target is Ascended)
  if string.find(nTarget, "ascended", 1, true) then
    ForEachDropdownButton(function(b, text)
      if matched then return end
      local lower = NormalizeText(text)
      if string.find(lower, "random", 1, true) and string.find(lower, "ascended", 1, true) then
        b:Click()
        matched = text
      end
    end)
  end

  if matched then
    return true, matched
  end

  return false, nil
end

local function ForceDefaultOnce()
  return WithOpenDropdown(function()
    local ok = ClickDefaultInOpenMenu()
    return ok
  end)
end

--========================================================--
-- Auto-Reapply Logic After Opening LFD
--========================================================--

local forceFrame
local function StartForceAfterOpen()
  if not forceFrame then
    forceFrame = CreateFrame("Frame")
  end

  local tries = 0
  forceFrame:SetScript("OnUpdate", function(self)
    tries = tries + 1

    local parent = GetLFDParent()
    if parent and parent:IsShown() then
      if ForceDefaultOnce() then
        self:SetScript("OnUpdate", nil)
        self:Hide()
        return
      end
    end

    if tries >= 40 then
      self:SetScript("OnUpdate", nil)
      self:Hide()
    end
  end)

  forceFrame:Show()
end

-- Hook opening via function
if type(_G["ToggleLFDParentFrame"]) == "function" then
  hooksecurefunc("ToggleLFDParentFrame", function()
    lastOpenTime = GetTime()
    StartForceAfterOpen()
  end)
end

-- Hook opening via frame OnShow
local parentFrame = GetLFDParent()
if parentFrame then
  parentFrame:HookScript("OnShow", function()
    lastOpenTime = GetTime()
    StartForceAfterOpen()
  end)
end

-- Prevent heroic/lich king override right after opening
hooksecurefunc("UIDropDownMenu_SetText", function(frame, text)
  local dd = GetDropdown()
  if frame ~= dd then return end
  if type(text) ~= "string" then return end

  if (GetTime() - lastOpenTime) > AUTO_WINDOW then
    return
  end

  local lower = string.lower(text)
  if (string.find(lower, "heroic", 1, true) or string.find(lower, "lich king", 1, true))
     and not string.find(lower, "ascended", 1, true) then

    if reapplying then return end
    reapplying = true

    local f = CreateFrame("Frame")
    f:SetScript("OnUpdate", function(self)
      self:SetScript("OnUpdate", nil)
      StartForceAfterOpen()
      reapplying = false
    end)
  end
end)

--========================================================--
-- Settings UI
--========================================================--

local LFDAsc_UI

local function RefreshSettingsDropdown()
  if not LFDAsc_UI or not LFDAsc_UI._dd then return end

  local f = LFDAsc_UI
  local dd = f._dd
  local options = ScanLFDTypeOptions() or DEFAULT_OPTIONS

  UIDropDownMenu_Initialize(dd, function(self, level)
    for _, optText in ipairs(options) do
      local info = UIDropDownMenu_CreateInfo()
      info.text = optText
      info.func = function()
        f._selected = optText
        UIDropDownMenu_SetText(dd, f._selected or options[1])
      end
      UIDropDownMenu_AddButton(info, level)
    end
  end)

  local chosen = f._selected
  if not chosen or not TableContains(options, chosen) then
    chosen = options[#options] or options[1]
    f._selected = chosen
  end

  UIDropDownMenu_SetText(dd, chosen)
end

local function CreateSettingsUI()
  if LFDAsc_UI then return end

  EnsureDB()

  local f = CreateFrame("Frame", "LFDAscendedSettingsFrame", UIParent)
  f:SetSize(380, 175)
  f:SetPoint("CENTER")
  f:SetBackdrop({
    bgFile = "Interface\\DialogFrame\\UI-DialogBox-Background",
    edgeFile = "Interface\\DialogFrame\\UI-DialogBox-Border",
    tile = true, tileSize = 32, edgeSize = 32,
    insets = { left = 8, right = 8, top = 8, bottom = 8 }
  })
  f:SetMovable(true)
  f:EnableMouse(true)
  f:RegisterForDrag("LeftButton")
  f:SetScript("OnDragStart", f.StartMoving)
  f:SetScript("OnDragStop", f.StopMovingOrSizing)
  f:Hide()

  local title = f:CreateFontString(nil, "OVERLAY", "GameFontNormalLarge")
  title:SetPoint("TOP", 0, -12)
  title:SetText("LFDAscended Default")

  local label = f:CreateFontString(nil, "OVERLAY", "GameFontNormal")
  label:SetPoint("TOPLEFT", 18, -46)
  label:SetWidth(340)
  label:SetJustifyH("LEFT")
  label:SetText("Choose your default LFD Type:")

  local dd = CreateFrame("Frame", "LFDAscendedPickerDropDown", f, "UIDropDownMenuTemplate")
  dd:SetPoint("TOPLEFT", 18, -76)
  UIDropDownMenu_SetWidth(dd, 185)
  UIDropDownMenu_JustifyText(dd, "LEFT")
  f._dd = dd

  local hint = f:CreateFontString(nil, "OVERLAY", "GameFontHighlightSmall")
  hint:SetPoint("BOTTOMLEFT", 18, 44)
  hint:SetWidth(340)
  hint:SetJustifyH("LEFT")
  hint:SetText("This sets what the addon selects when you press I.")

  f._selected = LFDAscendedDB.defaultText

  local saveBtn = CreateFrame("Button", nil, f, "UIPanelButtonTemplate")
  saveBtn:SetSize(90, 22)
  saveBtn:SetPoint("BOTTOMRIGHT", -16, 14)
  saveBtn:SetText("Save")
  saveBtn:SetScript("OnClick", function()
    if f._selected and f._selected ~= "" then
      LFDAscendedDB.defaultText = f._selected
      DEFAULT_CHAT_FRAME:AddMessage("|cff00ff00LFDAscended|r: Default set to: " .. f._selected)
      f:Hide()
    end
  end)

  local closeBtn = CreateFrame("Button", nil, f, "UIPanelButtonTemplate")
  closeBtn:SetSize(90, 22)
  closeBtn:SetPoint("BOTTOMRIGHT", -112, 14)
  closeBtn:SetText("Close")
  closeBtn:SetScript("OnClick", function() f:Hide() end)

  LFDAsc_UI = f
  RefreshSettingsDropdown()
end

local function ShowSettings()
  EnsureDB()
  if not LFDAsc_UI then
    CreateSettingsUI()
  else
    RefreshSettingsDropdown()
  end
  LFDAsc_UI:Show()
end

SLASH_LFDASC1 = "/lfdasc"
SlashCmdList["LFDASC"] = ShowSettings

--========================================================--
-- Add Settings Button to LFD Frame
--========================================================--

local function AddSettingsButtonToLFD()
  local parent = _G["LFDQueueFrame"] or _G["LFDParentFrame"] or _G["LFDFrame"]
  if not parent then return end
  if parent.LFDAscendedSettingsButton then return end

  local btn = CreateFrame("Button", nil, parent, "UIPanelButtonTemplate")
  parent.LFDAscendedSettingsButton = btn

  btn:SetSize(60, 20)
  btn:SetText("Default")

  local dd = _G["LFDQueueFrameTypeDropDown"]
  if dd then
    btn:ClearAllPoints()
    btn:SetPoint("RIGHT", dd, "LEFT", -40, 2)
  else
    btn:SetPoint("TOPLEFT", parent, "TOPLEFT", 20, -48)
  end

  btn:SetScript("OnClick", ShowSettings)
end

--========================================================--
-- Initialization
--========================================================--

local ev = CreateFrame("Frame")
ev:RegisterEvent("PLAYER_LOGIN")
ev:SetScript("OnEvent", function()
  EnsureDB()
  AddSettingsButtonToLFD()

  local parent = GetLFDParent()
  if parent and not parent._LFDAscHooked then
    parent._LFDAscHooked = true
    parent:HookScript("OnShow", function()
      AddSettingsButtonToLFD()
    end)
  end
end)