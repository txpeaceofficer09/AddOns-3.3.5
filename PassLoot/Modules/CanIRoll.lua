local PassLoot = LibStub("AceAddon-3.0"):GetAddon("PassLoot");
local L = LibStub("AceLocale-3.0"):GetLocale("PassLoot_Modules");
local module = PassLoot:NewModule(L["Can I Roll"])

module.Choices = {
  {
    ["Name"] = L["Any"],
    ["Value"] = 1,
  },
  {
    ["Name"] = L["None"],
    ["Value"] = 2,
  },
  {
    ["Name"] = NEED,
    ["Value"] = 3,
  },
  {
    ["Name"] = GREED,
    ["Value"] = 4,
  },
  {
    ["Name"] = ROLL_DISENCHANT,
    ["Value"] = 5,
  },
};
module.ConfigOptions_RuleDefaults = {
  -- { VariableName, Default },
  { 
    "CanIRoll",
    {
      -- [1] = { Value, Exception }
    },
  },
};
module.NewFilterValue = 1;

function module:OnEnable()
  self:RegisterDefaultVariables(self.ConfigOptions_RuleDefaults);
  self:AddWidget(self.Widget);
  -- self:AddProfileWidget(self.Widget);
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
  local Widget = CreateFrame("Frame", "PassLoot_Frames_Widgets_CanIRoll", nil, "UIDropDownMenuTemplate");
  Widget:EnableMouse(true);
  Widget:SetHitRectInsets(15, 15, 0 ,0);
  _G[Widget:GetName().."Text"]:SetJustifyH("CENTER");
  if ( select(4, GetBuildInfo()) < 30000 ) then
    UIDropDownMenu_SetWidth(120, Widget);
  else
    UIDropDownMenu_SetWidth(Widget, 120);
  end
  Widget:SetScript("OnEnter", function() self:ShowTooltip(L["Can I Roll"], L["Selected rule will only match if you can roll this."]) end);
  Widget:SetScript("OnLeave", function() GameTooltip:Hide() end);
  local Button = _G[Widget:GetName().."Button"];
  Button:SetScript("OnEnter", function() self:ShowTooltip(L["Can I Roll"], L["Selected rule will only match if you can roll this."]) end);
  Button:SetScript("OnLeave", function() GameTooltip:Hide() end);
  local Title = Widget:CreateFontString(Widget:GetName().."Title", "BACKGROUND", "GameFontNormalSmall");
  Title:SetParent(Widget);
  Title:SetPoint("BOTTOMLEFT", Widget, "TOPLEFT", 20, 0);
  Title:SetText(L["Can I Roll"]);
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
  Widget.PreferredPriority = 4;
  Widget.Info = {
    L["Can I Roll"],
    L["Selected rule will only match if you can roll this."],
  };
  return Widget;
end
module.Widget = module:CreateWidget();

-- Local function to get the data and make sure it's valid data
function module.Widget:GetData(RuleNum)
  local Data = module:GetConfigOption("CanIRoll", RuleNum);
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
    module:SetConfigOption("CanIRoll", Data);
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
  module:SetConfigOption("CanIRoll", Value);
end

function module.Widget:RemoveFilter(Index)
  local Value = self:GetData();
  table.remove(Value, Index);
  module:SetConfigOption("CanIRoll", Value);
end

function module.Widget:DisplayWidget(Index)
  if ( Index ) then
    module.FilterIndex = Index;
  end
  local Value = self:GetData();
  if ( select(4, GetBuildInfo()) < 30000 ) then
    UIDropDownMenu_SetText(module:GetRollTypeText(Value[module.FilterIndex][1]), module.Widget);
  else
    UIDropDownMenu_SetText(module.Widget, module:GetRollTypeText(Value[module.FilterIndex][1]));
  end
end

function module.Widget:GetFilterText(Index)
  local Value = self:GetData();
  return module:GetRollTypeText(Value[Index][1]);
end

function module.Widget:IsException(RuleNum, Index)
  local Data = self:GetData(RuleNum);
  return Data[Index][2];
end

function module.Widget:SetException(RuleNum, Index, Value)
  local Data = self:GetData(RuleNum);
  Data[Index][2] = Value;
  module:SetConfigOption("CanIRoll", Data);
end

module.CurrentMatch = {};
function module.Widget:SetMatch(ItemLink, Tooltip, RollID)
  _, _, _, _, _, module.CurrentMatch.Need, module.CurrentMatch.Greed, module.CurrentMatch.DE = GetLootRollItemInfo(RollID);
  module:Debug(string.format("Need: %s Greed: %s DE %s", tostring(module.CurrentMatch.Need), tostring(module.CurrentMatch.Greed), tostring(module.CurrentMatch.DE)));
end

function module.Widget:GetMatch(RuleNum, Index)
  local RuleValue = self:GetData(RuleNum);
  local RollType = RuleValue[Index][1];
  local Need, Greed, DE = module.CurrentMatch.Need, module.CurrentMatch.Greed, module.CurrentMatch.DE;
  if ( RollType > 1 ) then
    if ( RollType == 1 and ( Need or Greed or DE ) ) then
      return false;
    elseif ( RollType == 2 and not Need ) then
      return false;
    elseif ( RollType == 3 and not Greed ) then
      return false;
    elseif ( RollType == 4 and not DE ) then
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
  info.owner = Frame;
  for Key, Value in ipairs(self.Choices) do
    info.text = Value.Name;
    info.value = Value.Value;
    UIDropDownMenu_AddButton(info, Level);
  end
end

function module:DropDown_OnClick(Frame)
  local Value = self.Widget:GetData();
  Value[self.FilterIndex][1] = Frame.value;
  self:SetConfigOption("CanIRoll", Value);
  if ( select(4, GetBuildInfo()) < 30000 ) then
    UIDropDownMenu_SetText(Frame:GetText(), Frame.owner);
  else
    UIDropDownMenu_SetText(Frame.owner, Frame:GetText());
  end
end

function module:GetRollTypeText(Roll)
  for Key, Value in ipairs(self.Choices) do
    if ( Value.Value == Roll ) then
      return Value.Name;
    end
  end
  return "";
end

