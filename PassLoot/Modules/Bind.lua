local PassLoot = LibStub("AceAddon-3.0"):GetAddon("PassLoot");
local L = LibStub("AceLocale-3.0"):GetLocale("PassLoot_Modules");
local module = PassLoot:NewModule(L["Binds On"])

module.Choices = {
  {
    ["Name"] = L["Any"],
    ["Type"] = "",
    ["Value"] = 1,
  },
  {
    ["Name"] = L["None"],
    ["Type"] = "",
    ["Value"] = 2,
  },
  {
    ["Name"] = L["Equip"],
    ["Type"] = ITEM_BIND_ON_EQUIP,
    ["Value"] = 3,
  },
  {
    ["Name"] = L["Pickup"],
    ["Type"] = ITEM_BIND_ON_PICKUP,
    ["Value"] = 4,
  },
  {
    ["Name"] = L["Use"],
    ["Type"] = ITEM_BIND_ON_USE,
    ["Value"] = 5,
  },
  {
    ["Name"] = ITEM_BIND_QUEST,
    ["Type"] = ITEM_BIND_QUEST,
    ["Value"] = 6,
  },
  {
    ["Name"] = L["Account"],
    ["Type"] = ITEM_BIND_TO_ACCOUNT,
    ["Value"] = 7,
  },
};
module.ConfigOptions_RuleDefaults = {
  -- { VariableName, Default },
  { 
    "Bind",
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
  self:CheckDBVersion(3, "UpgradeDatabase");
end

function module:OnDisable()
  self:UnregisterDefaultVariables();
  self:RemoveWidgets();
end

function module:UpgradeDatabase(FromVersion, Rule)
  if ( FromVersion == 1 ) then
    local Table = {
      { "Bind", {} },
    };
    if ( Rule.Bind ) then
      Table[1][2][1] = { Rule.Bind, false };
    end
    return Table;
  end
  if ( FromVersion == 2 ) then
    local Table = {
      { "Bind", {} },
    };
    if ( type(Rule.Bind) == "table" ) then
      for Key, Value in ipairs(Rule.Bind) do
        Table[1][2][Key] = { Value, false };
      end
    end
    return Table;
  end
  return;
end

function module:CreateWidget()
  local Widget = CreateFrame("Frame", "PassLoot_Frames_Widgets_Bind", nil, "UIDropDownMenuTemplate");
  Widget:EnableMouse(true);
  Widget:SetHitRectInsets(15, 15, 0 ,0);
  _G[Widget:GetName().."Text"]:SetJustifyH("CENTER");
  if ( select(4, GetBuildInfo()) < 30000 ) then
    UIDropDownMenu_SetWidth(120, Widget);
  else
    UIDropDownMenu_SetWidth(Widget, 120);
  end
  Widget:SetScript("OnEnter", function() self:ShowTooltip(L["Bind On"], L["Selected rule will only match these items."]) end);
  Widget:SetScript("OnLeave", function() GameTooltip:Hide() end);
  local Button = _G[Widget:GetName().."Button"];
  Button:SetScript("OnEnter", function() self:ShowTooltip(L["Bind On"], L["Selected rule will only match these items."]) end);
  Button:SetScript("OnLeave", function() GameTooltip:Hide() end);
  local Title = Widget:CreateFontString(Widget:GetName().."Title", "BACKGROUND", "GameFontNormalSmall");
  Title:SetParent(Widget);
  Title:SetPoint("BOTTOMLEFT", Widget, "TOPLEFT", 20, 0);
  Title:SetText(L["Bind On"]);
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
    L["Bind On"],
    L["Selected rule will only match these items."],
  };
  return Widget;
end
module.Widget = module:CreateWidget();

-- Local function to get the data and make sure it's valid data
function module.Widget:GetData(RuleNum)
  local Data = module:GetConfigOption("Bind", RuleNum);
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
    module:SetConfigOption("Bind", Data);
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
  module:SetConfigOption("Bind", Value);
end

function module.Widget:RemoveFilter(Index)
  local Value = self:GetData();
  table.remove(Value, Index);
  module:SetConfigOption("Bind", Value);
end

function module.Widget:DisplayWidget(Index)
  if ( Index ) then
    module.FilterIndex = Index;
  end
  local Value = self:GetData();
  if ( select(4, GetBuildInfo()) < 30000 ) then
    UIDropDownMenu_SetText(module:GetBindSlotText(Value[module.FilterIndex][1]), module.Widget);
  else
    UIDropDownMenu_SetText(module.Widget, module:GetBindSlotText(Value[module.FilterIndex][1]));
  end
end

function module.Widget:GetFilterText(Index)
  local Value = self:GetData();
  return module:GetBindSlotText(Value[Index][1]);
end

function module.Widget:IsException(RuleNum, Index)
  local Data = self:GetData(RuleNum);
  return Data[Index][2];
end

function module.Widget:SetException(RuleNum, Index, Value)
  local Data = self:GetData(RuleNum);
  Data[Index][2] = Value;
  module:SetConfigOption("Bind", Data);
end

function module.Widget:SetMatch(ItemLink, Tooltip)
  local Line, LineText;
  local Bind;
  -- Found on line 2 for most items
  -- Found on line 3 for Heroic / colorblind mode items
  -- Scan till line 4 or until newline character detected (patterns have a newline, not sure if anything else does)
  Bind = 2; -- module.Bind[2] = "None"
  for Index = 2, math.min(4, Tooltip:NumLines()) do
    Line = _G[Tooltip:GetName().."TextLeft"..Index];
    if ( Line ) then
      LineText = Line:GetText();
      if ( LineText and LineText ~= "" ) then
        if ( string.find(LineText, "^\n") ) then
          break;
        end
        for Key = 3, #module.Choices do --Don't check for Key 1 (Any) or 2 (None)
          if ( LineText == module.Choices[Key].Type ) then
            Bind = Key;
            break;
          end
        end
      end
    end
  end
  module.CurrentMatch = Bind;
  module:Debug("Bind Type: "..Bind.." ("..module:GetBindSlotText(Bind)..")");
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
  self:SetConfigOption("Bind", Value);
  if ( select(4, GetBuildInfo()) < 30000 ) then
    UIDropDownMenu_SetText(Frame:GetText(), Frame.owner);
  else
    UIDropDownMenu_SetText(Frame.owner, Frame:GetText());
  end
end

function module:GetBindSlotText(BindID)
  for Key, Value in ipairs(self.Choices) do
    if ( Value.Value == BindID ) then
      return Value.Name;
    end
  end
  return "";
end

