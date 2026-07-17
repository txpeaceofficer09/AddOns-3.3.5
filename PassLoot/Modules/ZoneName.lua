local PassLoot = LibStub("AceAddon-3.0"):GetAddon("PassLoot");
local L = LibStub("AceLocale-3.0"):GetLocale("PassLoot_Modules");
local module = PassLoot:NewModule(L["Zone Name"])

module.ConfigOptions_RuleDefaults = {
  -- { VariableName, Default },
  {
    "Zone",
    {
      -- [1] = { Value, Exception }
    },
  },
};
module.NewFilterValue = L["Temp Zone Name"];

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
      { "Zone", {} },
    };
    if ( Rule.Zone ) then
      Table[1][2][1] = { Rule.Zone, false };
    end
    return Table;
  end
  if ( FromVersion == 2 ) then
    local Table = {
      { "Zone", {} },
    };
    if ( type(Rule.Zone) == "table" ) then
      for Key, Value in ipairs(Rule.Zone) do
        Table[1][2][Key] = { Value, false };
      end
    end
    return Table;
  end
  return;
end

function module:CreateWidget()
  local Widget = CreateFrame("EditBox", "PassLoot_Frames_Widgets_Zone");
  Widget:SetBackdrop({
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
  Widget:SetBackdropColor(0, 0, 0, 0.95);
  Widget:SetFontObject(ChatFontNormal);
  Widget:SetTextInsets(6, 6, 6, 6);
  Widget:SetHeight(26);
  Widget:SetWidth(160);
  Widget:SetMaxLetters(200);
  -- Widget:SetHistoryLines(0);
  Widget:SetAutoFocus(false);
  Widget:SetScript("OnEnter", function() self:ShowTooltip(L["Zone Name"], L["Zone Name_Desc"]) end);
  Widget:SetScript("OnLeave", function() GameTooltip:Hide() end);
  Widget:SetScript("OnEscapePressed", function(Frame) Frame:ClearFocus() end);
  Widget:SetScript("OnEditFocusGained", function(Frame) Frame:HighlightText() end);
  Widget:SetScript("OnEditfocusLost", function(Frame)
    Frame:HighlightText(0, 0);
    -- self:DisplayCurrentText();
    self.Widget:DisplayWidget();
  end);
  Widget:SetScript("OnEnterPressed", function(Frame, Button)
    self:SetRuleZone(Frame, Button);
    Frame:ClearFocus();
  end);
  Widget:SetScript("OnMouseUp", function(...) self:SetRuleZone(...) end);
  local Title = Widget:CreateFontString(Widget:GetName().."Title", "BACKGROUND", "GameFontNormalSmall");
  Title:SetParent(Widget);
  Title:SetPoint("BOTTOMLEFT", Widget, "TOPLEFT", 3, 0);
  Title:SetText(L["Zone Name"]);
  Widget:SetParent(nil);
  Widget:Hide();
  Widget.YPaddingTop = Title:GetHeight() + 1;
  Widget.YPaddingBottom = 4;
  Widget.Height = Widget:GetHeight() + Widget.YPaddingTop + Widget.YPaddingBottom;
  Widget.PreferredPriority = 1;
  Widget.Info = {
    L["Zone Name"],
    L["Zone Name_Desc"],
  };
  return Widget;
end
module.Widget = module:CreateWidget();

-- Local function to get the data and make sure it's valid data
function module.Widget:GetData(RuleNum)
  local Data = module:GetConfigOption("Zone", RuleNum);
  local Changed = false;
  if ( not Data or type(Data) ~= "table" ) then
    Data = {};
    Changed = true;
  end
  for Key, Value in ipairs(Data) do
    if ( type(Value) ~= "table" or type(Value[1]) ~= "string" ) then
      Data[Key] = { module.NewFilterValue, false };
      Changed = true;
    end
  end
  if ( Changed ) then
    module:SetConfigOption("Zone", Data);
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
  module:SetConfigOption("Zone", Value);
end

function module.Widget:RemoveFilter(Index)
  local Value = self:GetData();
  table.remove(Value, Index);
  module:SetConfigOption("Zone", Value);
end

function module.Widget:DisplayWidget(Index)
  if ( Index ) then
    module.FilterIndex = Index;
  end
  local Value = self:GetData();
  if ( not Value or not Value[module.FilterIndex] ) then
    return;
  end
  module.Widget:SetText(Value[module.FilterIndex][1]);
  module.Widget:SetScript("OnUpdate", function(...) module:ScrollLeft(...) end);
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
  module:SetConfigOption("Zone", Data);
end

function module.Widget:SetMatch(ItemLink, Tooltip)
  module.CurrentMatch = string.lower(GetRealZoneText());
  module:Debug("Zone: "..(module.CurrentMatch or ""));
end

function module.Widget:GetMatch(RuleNum, Index)
  local RuleValue = self:GetData(RuleNum);
  if ( RuleValue[Index][1] ~= "" ) then
    if ( string.lower(RuleValue[Index][1]) ~= module.CurrentMatch ) then
      module:Debug("Zone does not match");
      return false;
    end
  end
  return true;
end

function module:SetRuleZone(Frame, Button)
  local Value = self.Widget:GetData();
  if ( Button ) then
    if ( Button == "RightButton" and IsShiftKeyDown() and GetRealZoneText() ) then
      Value[self.FilterIndex][1] = GetRealZoneText();
      self:SetConfigOption("Zone", Value);
      Frame:SetText(GetRealZoneText());
      Frame:ClearFocus();
    end
    return;
  else
    Value[self.FilterIndex][1] = Frame:GetText();
    self:SetConfigOption("Zone", Value);
  end
end
