local PassLoot = LibStub("AceAddon-3.0"):GetAddon("PassLoot");
local L = LibStub("AceLocale-3.0"):GetLocale("PassLoot_Modules");
local module = PassLoot:NewModule(L["Group / Raid"])

module.Choices = {
  L["Any"],
  L["Group"],
  L["Raid"],
};
module.ConfigOptions_RuleDefaults = {
  -- { VariableName, Default },
  {
    "GroupRaid",
    {
      -- [1] = { Value, Exception }
    }
  },
};
module.NewFilterValue = 1;

function module:OnEnable()
  self:RegisterDefaultVariables(self.ConfigOptions_RuleDefaults);
  self:AddWidget(self.Widget);
  self:CheckDBVersion(3, "UpgradeDatabase");
end

function module:OnDisable()
  self:UnregisterDefaultVariables();
  self:RemoveWidgets();
end

function module:UpgradeDatabase(FromVersion, Rule)
  if ( FromVersion == 1 ) then
    local Table = {
      { "GroupRaid", {} }
    };
    if ( Rule.GroupRaid ) then
      Table[1][2][1] = { Rule.GroupRaid, false };
    end
    return Table;
  end
  if ( FromVersion == 2 ) then
    local Table = {
      { "GroupRaid", {} },
    };
    if ( type(Rule.GroupRaid) == "table" ) then
      for Key, Value in ipairs(Rule.GroupRaid) do
        Table[1][2][Key] = { Value, false };
      end
    end
    return Table;
  end
  return;
end

function module:CreateWidget()
  local Widget = CreateFrame("Frame", "PassLoot_Frames_Widgets_GroupRaid", nil, "UIDropDownMenuTemplate");
  Widget:EnableMouse(true);
  Widget:SetHitRectInsets(15, 15, 0 ,0);
  _G[Widget:GetName().."Text"]:SetJustifyH("CENTER");
  if ( select(4, GetBuildInfo()) < 30000 ) then
    UIDropDownMenu_SetWidth(100, Widget);
  else
    UIDropDownMenu_SetWidth(Widget, 100);
  end
  Widget:SetScript("OnEnter", function() self:ShowTooltip(L["Group / Raid"], L["Selected rule will only match if you are in a group or raid."]) end);
  Widget:SetScript("OnLeave", function() GameTooltip:Hide() end);
  local Button = _G[Widget:GetName().."Button"];
  Button:SetScript("OnEnter", function() self:ShowTooltip(L["Group / Raid"], L["Selected rule will only match if you are in a group or raid."]) end);
  Button:SetScript("OnLeave", function() GameTooltip:Hide() end);
  local Title = Widget:CreateFontString(Widget:GetName().."Title", "BACKGROUND", "GameFontNormalSmall");
  Title:SetParent(Widget);
  Title:SetPoint("BOTTOMLEFT", Widget, "TOPLEFT", 20, 0);
  Title:SetText(L["Group / Raid"]);
  Widget:SetParent(nil);
  Widget:Hide();
  if ( select(4, GetBuildInfo()) < 30000 ) then
    Widget.initialize = function(...) self:DropDown_Init(Widget, ...) end;
  else
    Widget.initialize = function(...) self:DropDown_Init(...) end;
  end
  Widget.YPaddingTop = Title:GetHeight();
  Widget.Height = Widget:GetHeight() + Widget.YPaddingTop;
  Widget.XPaddingLeft = -15;
  Widget.XPaddingRight = -15;
  Widget.Width = Widget:GetWidth() + Widget.XPaddingLeft + Widget.XPaddingRight;
  Widget.PreferredPriority = 13;
  Widget.Info = {
    L["Group / Raid"],
    L["Selected rule will only match if you are in a group or raid."],
  };
  return Widget;
end
module.Widget = module:CreateWidget();

-- Local function to get the data and make sure it's valid data
function module.Widget:GetData(RuleNum)
  local Data = module:GetConfigOption("GroupRaid", RuleNum);
  local Changed = false;
  if ( not Data or type(Data) ~= "table" ) then
    Data = {};
    Changed = true;
  end
  for Key, Value in ipairs(Data) do
    if ( type(Value) ~= "table" or type(Value[1]) ~= "number" ) then
      Data[Key] = { module.NewFilterValue, false };
      Changed = true;
    end
  end
  if ( Changed ) then
    module:SetConfigOption("GroupRaid", Data);
  end
  return Data;
end

function module.Widget:GetNumFilters(RuleNum)
  local Value = self:GetData(RuleNum);
  return #Value;
end

function module.Widget:AddNewFilter()
  local Value = self:GetData();
  table.insert(Value, { module.NewFilterValue, false });
  module:SetConfigOption("GroupRaid", Value);
end

function module.Widget:RemoveFilter(Index)
  local Value = self:GetData();
  table.remove(Value, Index);
  module:SetConfigOption("GroupRaid", Value);
end

function module.Widget:DisplayWidget(Index)
  if ( Index ) then
    module.FilterIndex = Index;
  end
  local Value = self:GetData();
  if ( select(4, GetBuildInfo()) < 30000 ) then
    UIDropDownMenu_SetText(module.Choices[Value[module.FilterIndex][1]], module.Widget);
  else
    UIDropDownMenu_SetText(module.Widget, module.Choices[Value[module.FilterIndex][1]]);
  end
end

function module.Widget:GetFilterText(Index)
  local Value = self:GetData();
  return module.Choices[Value[Index][1]];
end

function module.Widget:IsException(RuleNum, Index)
  local Data = self:GetData(RuleNum);
  return Data[Index][2];
end

function module.Widget:SetException(RuleNum, Index, Value)
  local Data = self:GetData(RuleNum);
  Data[Index][2] = Value;
  module:SetConfigOption("GroupRaid", Data);
end

function module.Widget:SetMatch(ItemLink, Tooltip)
  module.CurrentMatch = 1;  -- module.Choices[1] = "Any"
  if ( UnitInRaid("player") ) then
    module.CurrentMatch = 3; -- module.Choices[3] = "Raid"
  elseif ( GetNumPartyMembers() > 0 ) then
    module.CurrentMatch = 2; -- module.Choices[2] = "Group"
  end
  module:Debug("GroupRaid Type: "..module.CurrentMatch.." ("..module.Choices[module.CurrentMatch]..")");
end

function module.Widget:GetMatch(RuleNum, Index)
  local RuleValue = self:GetData(RuleNum);
  if ( RuleValue[Index][1] > 1 ) then
    if ( RuleValue[Index][1] ~= module.CurrentMatch ) then
      return false;
    end
  end
  return true;
end

function module:DropDown_Init(Frame, Level)
  Level = Level or 1;
  local info = {};
  info.checked = false;
  info.notCheckable = true;
  if ( select(4, GetBuildInfo()) < 30000 ) then
    info.func = function(...) self:DropDown_OnClick(this, ...) end;
  else
    info.func = function(...) self:DropDown_OnClick(...) end;
  end
  -- info.owner = self.Widget;
  info.owner = Frame;
  for Key, Value in ipairs(self.Choices) do
    info.text = Value;
    info.value = Key;
    UIDropDownMenu_AddButton(info, Level);
  end
end

function module:DropDown_OnClick(Frame)
  local Value = self.Widget:GetData();
  Value[self.FilterIndex][1] = Frame.value;
  self:SetConfigOption("GroupRaid", Value);
  if ( select(4, GetBuildInfo()) < 30000 ) then
    UIDropDownMenu_SetText(Frame:GetText(), Frame.owner);
  else
    UIDropDownMenu_SetText(Frame.owner, Frame:GetText());
  end
end
