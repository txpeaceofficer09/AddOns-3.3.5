local PassLoot = LibStub("AceAddon-3.0"):GetAddon("PassLoot");
local L = LibStub("AceLocale-3.0"):GetLocale("PassLoot_Modules");
local module = PassLoot:NewModule(L["Guild Group"])

module.ConfigOptions_RuleDefaults = {
  -- { VariableName, Default },
  {
    "GuildGroup",
    {
      -- [1] = { MinGuildyPercent, Exception }
    },
  },
};
module.NewFilterValue = 60;

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
end

function module:CreateWidget()
  local Widget = CreateFrame("Frame", "PassLoot_Frames_Widgets_GuildGroup");
  
  local TextBox = CreateFrame("EditBox", "PassLoot_Frames_Widgets_GuildGroupTextBox");
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
  TextBox:SetWidth(80);
  TextBox:SetMaxLetters(5);
  -- TextBox:SetHistoryLines(0);
  TextBox:SetAutoFocus(false);
  TextBox:SetScript("OnEnter", function() self:ShowTooltip(L["Guild Group"], L["Guild Group_Desc"]) end);
  TextBox:SetScript("OnLeave", function() GameTooltip:Hide() end);
  TextBox:SetScript("OnEscapePressed", function(Frame) Frame:ClearFocus() end);
  TextBox:SetScript("OnEditFocusGained", function(Frame) Frame:HighlightText() end);
  TextBox:SetScript("OnEditfocusLost", function(Frame)
    Frame:HighlightText(0, 0);
    self.Widget:DisplayWidget();
  end);
  TextBox:SetScript("OnEnterPressed", function(Frame)
    self:SetPercentGuildies(Frame);
    Frame:ClearFocus();
  end);
  local Title = TextBox:CreateFontString(TextBox:GetName().."Title", "BACKGROUND", "GameFontNormalSmall");
  Title:SetParent(TextBox);
  Title:SetPoint("BOTTOMLEFT", TextBox, "TOPLEFT", 3, 0);
  Title:SetText(L["Guild Group"]);
  TextBox:SetParent(Widget);
  TextBox:SetPoint("BOTTOMLEFT", Widget, "BOTTOMLEFT", 0, 0);
  Widget.TextBox = TextBox;
  
  Widget:Hide();
  Widget:SetHeight(TextBox:GetHeight());
  Widget.YPaddingTop = Title:GetHeight() + 1;
  Widget.YPaddingBottom = 4;
  Widget.Height = Widget:GetHeight() + Widget.YPaddingTop + Widget.YPaddingBottom;
  Widget:SetWidth(TextBox:GetWidth());
  Widget.PreferredPriority = 14;
  Widget.Info = {
    L["Guild Group"],
    L["Guild Group_Desc"],
  };
  return Widget;
end
module.Widget = module:CreateWidget();

-- Local function to get the data and make sure it's valid data
function module.Widget:GetData(RuleNum)
  local Data = module:GetConfigOption("GuildGroup", RuleNum);
  local Changed = false;
  if ( not Data or type(Data) ~= "table" ) then
    Data = {};
    Changed = true;
  end
  for Key, Value in ipairs(Data) do
    if ( type(Value) ~= "table" or type(Value[1]) ~= "number" ) then
      Data[Key] = {
        module.NewFilterValue,
        false
      };
      Changed = true;
    end
  end
  if ( Changed ) then
    module:SetConfigOption("GuildGroup", Data);
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
  module:SetConfigOption("GuildGroup", Value);
end

function module.Widget:RemoveFilter(Index)
  local Value = self:GetData();
  table.remove(Value, Index);
  module:SetConfigOption("GuildGroup", Value);
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
  module:SetConfigOption("GuildGroup", Data);
end

function module.Widget:SetMatch(ItemLink, Tooltip)
  local Group, NumGroup;
  if ( UnitInRaid("player") ) then
    Group = "raid";
    NumGroup = GetNumRaidMembers();
  else
    Group = "party";
    NumGroup = GetNumPartyMembers();
  end
  if ( NumGroup > 0 ) then
    local NumInMyGuild = 0;
    for Index = 1, NumGroup do
      if ( UnitIsInMyGuild(Group..Index) ) then  -- If guildless, it's nil
        NumInMyGuild = NumInMyGuild + 1;
      end
    end
    module.CurrentMatch = math.floor(NumInMyGuild / NumGroup + 0.5);
  else
    module.CurrentMatch = 100;  -- We're solo.. maybe someone is doing a /passloot test
  end
  module:Debug(string.format("Guild Group: %s%%", module.CurrentMatch));
end

function module.Widget:GetMatch(RuleNum, Index)
  local Value = self:GetData(RuleNum);
  local NumGuildies = Value[Index][1];
  if ( module.CurrentMatch >= NumGuildies ) then
    return true;
  end
  return false;
end

function module:SetPercentGuildies(Frame)
  local Num = tonumber(Frame:GetText()) or 0;
  if ( Num < 0 ) then
    Num = 0;
  end
  if ( Num > 100 ) then
    Num = 100;
  end
  local Value = self.Widget:GetData();
  Value[self.FilterIndex][1] = Num;
  self:SetConfigOption("GuildGroup", Value);
end
