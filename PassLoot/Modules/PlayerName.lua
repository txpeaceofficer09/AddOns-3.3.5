local PassLoot = LibStub("AceAddon-3.0"):GetAddon("PassLoot");
local L = LibStub("AceLocale-3.0"):GetLocale("PassLoot_Modules");
local module = PassLoot:NewModule(L["Player Name"])

module.ConfigOptions_RuleDefaults = {
  -- { VariableName, Default },
  {
    "PlayerName",
    {
      -- [1] = { Name, Exception }
    },
  },
};
module.NewFilterValue = L["Temp Name"];

function module:OnEnable()
  self:RegisterDefaultVariables(self.ConfigOptions_RuleDefaults);
  self:AddWidget(self.Widget);
  self:CheckDBVersion(1, "UpgradeDatabase");
end

function module:OnDisable()
  self:UnregisterDefaultVariables();
  self:RemoveWidgets();
end

function module:UpgradeDatabase(FromVersion, Rule)
  return;
end

function module:CreateWidget()
  local Widget = CreateFrame("Frame");
  
  local TextBox = CreateFrame("EditBox");
  TextBox:SetBackdrop({
    ["bgFile"] = "Interface\\Tooltips\\UI-Tooltip-Background",
    ["edgeFile"] = "Interface\\Tooltips\\UI-Tooltip-Border",
    ["tile"] = true,
    ["insets"] = {
      ["top"] = 5,
      ["bottom"] = 5,
      ["left"] = 5,
      ["right"] = 5,
    },
    ["tileSize"] = 32,
    ["edgeSize"] = 16,
  });
  TextBox:SetBackdropColor(0, 0, 0, 0.95);
  TextBox:SetFontObject(ChatFontNormal);
  TextBox:SetTextInsets(6, 6, 6, 6);
  TextBox:SetHeight(26);
  TextBox:SetWidth(160);
  TextBox:SetMaxLetters(200);
  -- TextBox:SetHistoryLines(0);
  TextBox:SetAutoFocus(false);
  TextBox:SetScript("OnEnter", function() self:ShowTooltip(L["Player Name"], L["Selected rule will match on player names."]) end);
  TextBox:SetScript("OnLeave", function() GameTooltip:Hide() end);
  TextBox:SetScript("OnEscapePressed", function(Frame) Frame:ClearFocus() end);
  TextBox:SetScript("OnEditFocusGained", function(Frame) Frame:HighlightText() end);
  TextBox:SetScript("OnEditfocusLost", function(Frame)
    Frame:HighlightText(0, 0);
    self.Widget:DisplayWidget();
  end);
  TextBox:SetScript("OnEnterPressed", function(Frame)
    self:SetPlayerName(Frame);
    Frame:ClearFocus();
  end);
  Widget.Title = TextBox:CreateFontString(nil, "BACKGROUND", "GameFontNormalSmall");
  Widget.Title:SetParent(TextBox);
  Widget.Title:SetPoint("BOTTOMLEFT", TextBox, "TOPLEFT", 3, 0);
  Widget.Title:SetText(L["Player Name"]);
  TextBox:SetParent(Widget);
  TextBox:SetPoint("BOTTOMLEFT", Widget, "BOTTOMLEFT", 0, 0);
  Widget.TextBox = TextBox;
  
  Widget:Hide();
  Widget:SetHeight(TextBox:GetHeight());
  Widget.YPaddingTop = Widget.Title:GetHeight() + 1;
  Widget.YPaddingBottom = 4;
  Widget.Height = Widget:GetHeight() + Widget.YPaddingTop + Widget.YPaddingBottom;
  Widget:SetWidth(TextBox:GetWidth());
  Widget.PreferredPriority = 14;
  Widget.Info = {
    L["Player Name"],
    L["Selected rule will match on player names."],
  };
  return Widget;
end
module.Widget = module:CreateWidget();

-- Local function to get the data and make sure it's valid data
function module.Widget:GetData(RuleNum)
  local Data = module:GetConfigOption("PlayerName", RuleNum);
  local Changed = false;
  if ( not Data or type(Data) ~= "table" ) then
    Data = {};
    Changed = true;
  end
  for Key, Value in ipairs(Data) do
    if ( type(Value) ~= "table" or type(Value[1]) ~= "string" ) then
      Data[Key] = {
        module.NewFilterValue,
        false
      };
      Changed = true;
    end
  end
  if ( Changed ) then
    module:SetConfigOption("PlayerName", Data);
  end
  return Data;
end

function module.Widget:GetNumFilters(RuleNum)
  local Value = self:GetData(RuleNum);
  return #Value;
end

function module.Widget:AddNewFilter()
  local Value = self:GetData();
  local NewTable = {
    module.NewFilterValue,
    false
  };
  table.insert(Value, NewTable);
  module:SetConfigOption("PlayerName", Value);
end

function module.Widget:RemoveFilter(Index)
  local Value = self:GetData();
  table.remove(Value, Index);
  module:SetConfigOption("PlayerName", Value);
end

function module.Widget:DisplayWidget(Index)
  if ( Index ) then
    module.FilterIndex = Index;
  end
  local Value = self:GetData();
  if ( not Value or not Value[module.FilterIndex] ) then
    return;
  end
  module.Widget.TextBox:SetText(Value[module.FilterIndex][1]);
  module.Widget.TextBox:SetScript("OnUpdate", function(...) module:ScrollLeft(...) end);
end

function module.Widget:GetFilterText(Index)
  local Value = self:GetData();
  return Value[Index][1];
end

function module.Widget:IsException(RuleNum, Index)
  local Data = self:GetData(RuleNum);
  return Data[Index][2];
end

function module.Widget:SetException(RuleNum, Index, Value)
  local Data = self:GetData(RuleNum);
  Data[Index][2] = Value;
  module:SetConfigOption("PlayerName", Data);
end

function module.Widget:SetMatch(ItemLink, Tooltip)
  module.CurrentMatch = UnitName("player");
  module:Debug("Player name: "..(module.CurrentMatch or ""));
end

function module.Widget:GetMatch(RuleNum, Index)
  local RuleValue = self:GetData(RuleNum);
  local Name = RuleValue[Index][1];
  if ( string.lower(module.CurrentMatch) ~= string.lower(Name) ) then
    module:Debug("Player name doesn't match");
    return false;
  end
  return true;
end

function module:SetPlayerName(Frame)
  local Value = self.Widget:GetData();
  Value[self.FilterIndex][1] = Frame:GetText();
  self:SetConfigOption("PlayerName", Value);
end
