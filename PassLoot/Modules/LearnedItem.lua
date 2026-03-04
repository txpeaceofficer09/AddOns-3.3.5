local PassLoot = LibStub("AceAddon-3.0"):GetAddon("PassLoot");
local L = LibStub("AceLocale-3.0"):GetLocale("PassLoot_Modules");
local module = PassLoot:NewModule(L["Learned Item"])

module.Choices = {
  {
    ["Name"] = L["Any"],
    ["Value"] = 1,
  },
  {
    ["Name"] = L["Learned"],
    ["Value"] = 2,
  },
  {
    ["Name"] = L["Unlearned"],
    ["Value"] = 3,
  },
};
module.ConfigOptions_RuleDefaults = {
  -- { VariableName, Default },
  {
    "LearnedItem",
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
  self:CheckDBVersion(2, "UpgradeDatabase");
end

function module:OnDisable()
  self:UnregisterDefaultVariables();
  self:RemoveWidgets();
end

function module:UpgradeDatabase(FromVersion, Rule)
  if ( FromVersion == 1 ) then
    local Table = {
      { "LearnedItem", {} },
    };
    if ( type(Rule.LearnedItem) == "table" ) then
      for Key, Value in ipairs(Rule.LearnedItem) do
        Table[1][2][Key] = { Value, false };
      end
    end
    return Table;
  end
  return;
end

function module:CreateWidget()
  local Widget = CreateFrame("Frame", "PassLoot_Frames_Widgets_LearnedItem", nil, "UIDropDownMenuTemplate");
  Widget:EnableMouse(true);
  Widget:SetHitRectInsets(15, 15, 0 ,0);
  _G[Widget:GetName().."Text"]:SetJustifyH("CENTER");
  if ( select(4, GetBuildInfo()) < 30000 ) then
    UIDropDownMenu_SetWidth(120, Widget);
  else
    UIDropDownMenu_SetWidth(Widget, 120);
  end
  Widget:SetScript("OnEnter", function() self:ShowTooltip(L["Learned Item"], L["Selected rule will only match these items."]) end);
  Widget:SetScript("OnLeave", function() GameTooltip:Hide() end);
  local Button = _G[Widget:GetName().."Button"];
  Button:SetScript("OnEnter", function() self:ShowTooltip(L["Learned Item"], L["Selected rule will only match these items."]) end);
  Button:SetScript("OnLeave", function() GameTooltip:Hide() end);
  local Title = Widget:CreateFontString(Widget:GetName().."Title", "BACKGROUND", "GameFontNormalSmall");
  Title:SetParent(Widget);
  Title:SetPoint("BOTTOMLEFT", Widget, "TOPLEFT", 20, 0);
  Title:SetText(L["Learned Item"]);
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
  Widget.PreferredPriority = 10;
  Widget.Info = {
    L["Learned Item"],
    L["Selected rule will only match these items."],
  };
  return Widget;
end
module.Widget = module:CreateWidget();

-- Local function to get the data and make sure it's valid data
function module.Widget:GetData(RuleNum)
  local Data = module:GetConfigOption("LearnedItem", RuleNum);
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
    module:SetConfigOption("LearnedItem", Data);
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
  module:SetConfigOption("LearnedItem", Value);
end

function module.Widget:RemoveFilter(Index)
  local Value = self:GetData();
  table.remove(Value, Index);
  module:SetConfigOption("LearnedItem", Value);
end

function module.Widget:DisplayWidget(Index)
  if ( Index ) then
    module.FilterIndex = Index;
  end
  local Value = self:GetData();
  if ( select(4, GetBuildInfo()) < 30000 ) then
    UIDropDownMenu_SetText(module:GetLearnedItemText(Value[module.FilterIndex][1]), module.Widget);
  else
    UIDropDownMenu_SetText(module.Widget, module:GetLearnedItemText(Value[module.FilterIndex][1]));
  end
end

function module.Widget:GetFilterText(Index)
  local Value = self:GetData();
  return module:GetLearnedItemText(Value[Index][1]);
end

function module.Widget:IsException(RuleNum, Index)
  local Data = self:GetData(RuleNum);
  return Data[Index][2];
end

function module.Widget:SetException(RuleNum, Index, Value)
  local Data = self:GetData(RuleNum);
  Data[Index][2] = Value;
  module:SetConfigOption("LearnedItem", Data);
end

function module.Widget:SetMatch(ItemLink, Tooltip)
  local TextLine, Text;
  module.CurrentMatch = 3;  -- module.Choices[2] = "Unlearned"
  -- Found on line 7 of Reins of the Bronze Drake
  for Index = 2, Tooltip:NumLines() do
    TextLine = _G[Tooltip:GetName().."TextLeft"..Index];
    if ( TextLine ) then
      Text = TextLine:GetText();
      -- Search for the "Already known" text unless we hit a newline character at the beginning of a line.
      -- new line is usually a recipe.  We don't want to scan the item a recipe makes
      -- as that might be a mount (mechano-hog / chopper) that might be learned.
      -- Might be items other than recipes that are similar...
      if ( string.find(Text, "^\n") ) then
        break;
      elseif ( Text == ITEM_SPELL_KNOWN ) then
        module.CurrentMatch = 2;  -- module.Choices[2] = "Learned"
        break;
      end
    end
  end
  module:Debug("Learned Item: "..module.CurrentMatch.." ("..module:GetLearnedItemText(module.CurrentMatch)..")");
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
  self:SetConfigOption("LearnedItem", Value);
  if ( select(4, GetBuildInfo()) < 30000 ) then
    UIDropDownMenu_SetText(Frame:GetText(), Frame.owner);
  else
    UIDropDownMenu_SetText(Frame.owner, Frame:GetText());
  end
end

function module:GetLearnedItemText(Which)
  for Key, Value in ipairs(self.Choices) do
    if ( Value.Value == Which ) then
      return Value.Name;
    end
  end
  return "";
end

