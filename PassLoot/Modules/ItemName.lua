local PassLoot = LibStub("AceAddon-3.0"):GetAddon("PassLoot");
local L = LibStub("AceLocale-3.0"):GetLocale("PassLoot_Modules");
local module = PassLoot:NewModule(L["Item Name"])

module.ConfigOptions_RuleDefaults = {
  -- { VariableName, Default },
  {
    "Items",
    {
      -- [1] = { Name, Type, Exception }
    },
  },
};
module.NewFilterValue_Name = L["Temp Item Name"];
module.NewFilterValue_Type = "Exact";

function module:OnEnable()
  self:RegisterDefaultVariables(self.ConfigOptions_RuleDefaults);
  self:AddWidget(self.Widget);
  self:CheckDBVersion(2, "UpgradeDatabase");
end

function module:OnDisable()
  self:UnregisterDefaultVariables();
  self:RemoveWidgets();
end

function module:UpgradeDatabase(FromVersion, Rule)
  if ( FromVersion == 1 ) then
    local Table = {
      { "Items", {} },
    };
    if ( type(Rule.Items) == "table" ) then
      for Key, Value in ipairs(Rule.Items) do
        Table[1][2][Key] = { Value.Name, Value.Type, false };
      end
    end
    return Table;
  end
  return;
end

function module:CreateWidget()
  local Widget = CreateFrame("Frame", "PassLoot_Frames_Widgets_ItemName");
  
  local TextBox = CreateFrame("EditBox", "PassLoot_Frames_Widgets_ItemNameTextBox");
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
  TextBox:SetScript("OnEnter", function() self:ShowTooltip(L["Item Name"], L["Selected rule will match on item names."]) end);
  TextBox:SetScript("OnLeave", function() GameTooltip:Hide() end);
  TextBox:SetScript("OnEscapePressed", function(Frame) Frame:ClearFocus() end);
  TextBox:SetScript("OnEditFocusGained", function(Frame) Frame:HighlightText() end);
  TextBox:SetScript("OnEditfocusLost", function(Frame)
    Frame:HighlightText(0, 0);
    self.Widget:DisplayWidget();
  end);
  TextBox:SetScript("OnEnterPressed", function(Frame)
    self:SetItemName(Frame);
    Frame:ClearFocus();
  end);
  local Title = TextBox:CreateFontString(TextBox:GetName().."Title", "BACKGROUND", "GameFontNormalSmall");
  Title:SetParent(TextBox);
  Title:SetPoint("BOTTOMLEFT", TextBox, "TOPLEFT", 3, 0);
  Title:SetText(L["Item Name"]);
  TextBox:SetParent(Widget);
  TextBox:SetPoint("BOTTOMLEFT", Widget, "BOTTOMLEFT", 0, 0);
  Widget.TextBox = TextBox;
  
  local CheckBox = CreateFrame("CheckButton", "PassLoot_Frames_Widgets_ItemNameCheckBox", Widget, "UICheckButtonTemplate");
  CheckBox:SetHeight(24);
  CheckBox:SetWidth(24);
  CheckBox:SetHitRectInsets(0, -60, 0, 0);
  CheckBox:SetScript("OnLeave", function() GameTooltip:Hide() end);
  CheckBox:SetScript("OnClick", function(...) self:Exact_OnClick(...) end);
  CheckBox:SetScript("OnEnter", function() self:ShowTooltip(L["Exact"], L["Exact_Desc"]) end);
  _G[CheckBox:GetName().."Text"]:SetText(L["Exact"]);
  CheckBox:SetPoint("BOTTOMLEFT", TextBox, "BOTTOMRIGHT", 5, 0);
  Widget.CheckBox = CheckBox

  Widget:Hide();
  Widget:SetHeight(TextBox:GetHeight());
  Widget.YPaddingTop = Title:GetHeight() + 1;
  Widget.YPaddingBottom = 4;
  Widget.Height = Widget:GetHeight() + Widget.YPaddingTop + Widget.YPaddingBottom;
  Widget:SetWidth(TextBox:GetWidth() + 5 + CheckBox:GetWidth() + 30);
  Widget.PreferredPriority = 14;
  Widget.Info = {
    L["Item Name"],
    L["Selected rule will match on item names."],
  };
  return Widget;
end
module.Widget = module:CreateWidget();

-- Local function to get the data and make sure it's valid data
function module.Widget:GetData(RuleNum)
  local Data = module:GetConfigOption("Items", RuleNum);
  local Changed = false;
  if ( not Data or type(Data) ~= "table" ) then
    Data = {};
    Changed = true;
  end
  for Key, Value in ipairs(Data) do
    if ( type(Value) ~= "table" or type(Value[1]) ~= "string" or not ( Value[2] == "Exact" or Value[2] == "Partial" ) ) then
      Data[Key] = {
        module.NewFilterValue_Name,
        module.NewFilterValue_Type,
        false
      };
      Changed = true;
    end
  end
  if ( Changed ) then
    module:SetConfigOption("Items", Data);
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
    module.NewFilterValue_Name,
    module.NewFilterValue_Type,
    false
  };
  table.insert(Value, NewTable);
  module:SetConfigOption("Items", Value);
end

function module.Widget:RemoveFilter(Index)
  local Value = self:GetData();
  table.remove(Value, Index);
  module:SetConfigOption("Items", Value);
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
  if ( Value[module.FilterIndex][2] == "Exact" ) then
    module.Widget.CheckBox:SetChecked(true);
  else
    module.Widget.CheckBox:SetChecked(false);
  end
end

function module.Widget:GetFilterText(Index)
  local Value = self:GetData();
  return Value[Index][1];
end

function module.Widget:IsException(RuleNum, Index)
  local Data = self:GetData(RuleNum);
  return Data[Index][3];
end

function module.Widget:SetException(RuleNum, Index, Value)
  local Data = self:GetData(RuleNum);
  Data[Index][3] = Value;
  module:SetConfigOption("Items", Data);
end

function module.Widget:SetMatch(ItemLink, Tooltip)
  module.CurrentMatch, _, _, _, _, _, _, _, _, _ = GetItemInfo(ItemLink);
  module:Debug("Item name: "..(module.CurrentMatch or ""));
end

function module.Widget:GetMatch(RuleNum, Index)
  local RuleValue = self:GetData(RuleNum);
  local Name, Type = RuleValue[Index][1], RuleValue[Index][2];
  if ( Type == "Exact" ) then
    if ( string.lower(module.CurrentMatch) == string.lower(Name) ) then
      module:Debug("Found item name (exact)");
      return true;
    end
  else
    Name = string.lower(Name);
    Name = string.gsub(Name, "([%%%$%(%)%.%[%]%*%+%-%?%^])", "%%%1");
    if ( string.find(string.lower(module.CurrentMatch), Name) ) then
      module:Debug("Found item name (partial)");
      return true;
    end
  end
  return false;
end

function module:SetItemName(Frame)
  local Value = self.Widget:GetData();
  Value[self.FilterIndex][1] = Frame:GetText();
  self:SetConfigOption("Items", Value);
end

function module:Exact_OnClick(Frame, Button)
  local Value = self.Widget:GetData();
  if ( Frame:GetChecked() ) then
    Value[self.FilterIndex][2] = "Exact";
  else
    Value[self.FilterIndex][2] = "Partial";
  end
  self:SetConfigOption("Items", Value);
end
