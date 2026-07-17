local PassLoot = LibStub("AceAddon-3.0"):GetAddon("PassLoot");
local L = LibStub("AceLocale-3.0"):GetLocale("PassLoot_Modules");
local module = PassLoot:NewModule(L["Unique"])

module.Choices = {
  {
    ["Name"] = L["Any"],
    ["Value"] = 1,
  },
  {
    ["Name"] = L["Not"],
    ["Value"] = 2,
  },
  {
    ["Name"] = L["Unique"],
    ["Value"] = 3,
  },
};
module.ConfigOptions_RuleDefaults = {
  -- { VariableName, Default },
  {
    "Unique",
    {
      -- [1] = { Value, Exception }
    },
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
      { "Unique", {} },
    };
    if ( Rule.Unique ) then
      Table[1][2][1] = { Rule.Unique, false };
    end
    return Table;
  end
  if ( FromVersion == 2 ) then
    local Table = {
      { "Unique", {} },
    };
    if ( type(Rule.Unique) == "table" ) then
      for Key, Value in ipairs(Rule.Unique) do
        Table[1][2][Key] = { Value, false };
      end
    end
    return Table;
  end
  return;
end

function module:CreateWidget()
  local Widget = CreateFrame("Frame", "PassLoot_Frames_Widgets_Unique", nil, "UIDropDownMenuTemplate");
  Widget:EnableMouse(true);
  Widget:SetHitRectInsets(15, 15, 0 ,0);
  _G[Widget:GetName().."Text"]:SetJustifyH("CENTER");
  if ( select(4, GetBuildInfo()) < 30000 ) then
    UIDropDownMenu_SetWidth(100, Widget);
  else
    UIDropDownMenu_SetWidth(Widget, 100);
  end
  Widget:SetScript("OnEnter", function() self:ShowTooltip(L["Unique"], L["Unique_Desc"]) end);
  Widget:SetScript("OnLeave", function() GameTooltip:Hide() end);
  local Button = _G[Widget:GetName().."Button"];
  Button:SetScript("OnEnter", function() self:ShowTooltip(L["Unique"], L["Unique_Desc"]) end);
  Button:SetScript("OnLeave", function() GameTooltip:Hide() end);
  local Title = Widget:CreateFontString(Widget:GetName().."Title", "BACKGROUND", "GameFontNormalSmall");
  Title:SetParent(Widget);
  Title:SetPoint("BOTTOMLEFT", Widget, "TOPLEFT", 20, 0);
  Title:SetText(L["Unique"]);
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
  Widget.PreferredPriority = 7;
  Widget.Info = {
    L["Unique"],
    L["Unique_Desc"],
  };
  return Widget;
end
module.Widget = module:CreateWidget();

-- Local function to get the data and make sure it's valid data
function module.Widget:GetData(RuleNum)
  local Data = module:GetConfigOption("Unique", RuleNum);
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
    module:SetConfigOption("Unique", Data);
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
  module:SetConfigOption("Unique", Value);
end

function module.Widget:RemoveFilter(Index)
  local Value = self:GetData();
  table.remove(Value, Index);
  module:SetConfigOption("Unique", Value);
end

function module.Widget:DisplayWidget(Index)
  if ( Index ) then
    module.FilterIndex = Index;
  end
  local Value = self:GetData();
  if ( select(4, GetBuildInfo()) < 30000 ) then
    UIDropDownMenu_SetText(module:GetUniqueSlotText(Value[module.FilterIndex][1]), module.Widget);
  else
    UIDropDownMenu_SetText(module.Widget, module:GetUniqueSlotText(Value[module.FilterIndex][1]));
  end
end

function module.Widget:GetFilterText(Index)
  local Value = self:GetData();
  return module:GetUniqueSlotText(Value[Index][1]);
end

function module.Widget:IsException(RuleNum, Index)
  local Data = self:GetData(RuleNum);
  return Data[Index][2];
end

function module.Widget:SetException(RuleNum, Index, Value)
  local Data = self:GetData(RuleNum);
  Data[Index][2] = Value;
  module:SetConfigOption("Unique", Data);
end

function module.Widget:SetMatch(ItemLink, Tooltip)
  local Line, LineText
  local Unique;
  -- Found on line 2 for normal items
  -- Found on line 3 for heroic and/or colorblind option items
  -- Found on line 4 for heroic and/or colorblind option bop items.
  -- Scan till line 5 or until newline character detected (patterns have a newline, not sure if anything else does)
  Unique = 2; -- module.Choices[2] = "Not"
  for Index = 1, math.min(5, Tooltip:NumLines()) do
    Line = _G[Tooltip:GetName().."TextLeft"..Index];
    if ( Line ) then
      LineText = Line:GetText();
      if ( LineText and LineText ~= "" ) then
        if ( string.find(LineText, "^\n") ) then
          break;
        end
        if ( LineText == ITEM_UNIQUE or LineText == ITEM_UNIQUE_EQUIPPABLE or LineText:match(ITEM_UNIQUE_MULTIPLE:gsub("%%d", ".+")) ) then
          Unique = 3;  -- module.Unique[3] == "Unique";
          break;
        end
      end
    end
  end
  module.CurrentMatch = Unique;
  module:Debug("Unique Type: "..Unique.." ("..module:GetUniqueSlotText(Unique)..")");
end

function module.Widget:GetMatch(RuleNum, Index)
  local RuleValue = self:GetData(RuleNum);
  if ( RuleValue[Index][1] > 1 ) then
    if ( RuleValue[Index][1] ~= module.CurrentMatch ) then
      module:Debug("Unique doesn't match");
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
  self:SetConfigOption("Unique", Value);
  if ( select(4, GetBuildInfo()) < 30000 ) then
    UIDropDownMenu_SetText(Frame:GetText(), Frame.owner);
  else
    UIDropDownMenu_SetText(Frame.owner, Frame:GetText());
  end
end

function module:GetUniqueSlotText(UniqueID)
  for Key, Value in ipairs(self.Choices) do
    if ( Value.Value == UniqueID ) then
      return Value.Name;
    end
  end
  return "";
end
