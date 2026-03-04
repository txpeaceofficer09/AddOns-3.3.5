local PassLoot = LibStub("AceAddon-3.0"):GetAddon("PassLoot");
local L = LibStub("AceLocale-3.0"):GetLocale("PassLoot_Modules");
local module = PassLoot:NewModule(L["Loot Won"], "AceEvent-3.0")

module.Choices = {
  {
    ["Name"] = L["Any"],
    ["Text"] = L["Any"],
    ["Value"] = 1,
  },
  {
    ["Name"] = L["Equal to"],
    ["Text"] = L["Equal to %num%"],
    ["Value"] = 2,
  },
  {
    ["Name"] = L["Not Equal to"],
    ["Text"] = L["Not Equal to %num%"],
    ["Value"] = 3,
  },
  {
    ["Name"] = L["Less than"],
    ["Text"] = L["Less than %num%"],
    ["Value"] = 4,
  },
  -- Can't increment something if we have to have a number greater than this..
  -- {
    -- ["Name"] = L["Greater than"],
    -- ["Text"] = L["Greater than %num%"],
    -- ["Value"] = 5,
  -- },
};
module.ConfigOptions_RuleDefaults = {
  -- { VariableName, Default },
  { "LootWonLogicalOperator", nil },  -- No longer used
  {
    "LootWonComparison",
    {
      -- [1] = { Operator, Comparison, Exception }
    },
  },
  { "LootWonCounter", nil },
};
module.NewFilterValue_LogicalOperator = 1;
module.NewFilterValue_Comparison = 0;
module.NewFilterValue_Counter = 0;

module.ProfileOptionsTable = {
  ["name"] = L["Reset Counters On Join"],
  ["desc"] = L["Reset Counters On Join_Desc"],
  ["type"] = "toggle",
  ["get"] = function(info)
    return module:GetProfileVariable("ResetLootCounter")
  end,
  ["set"] = function(info, value)
    if ( IsShiftKeyDown() ) then
      module:ResetProfileLootWonCounters()
    else
      module:SetProfileVariable("ResetLootCounter", value)
    end
  end,
};

function module:OnEnable()
  self:RegisterDefaultVariables(self.ConfigOptions_RuleDefaults);
  self:AddWidget(self.WidgetComparison);
  self:AddWidget(self.WidgetCounter);
  self:AddModuleOptionTable("ResetLootCounter", self.ProfileOptionsTable);
  self:RegisterEvent("CHAT_MSG_LOOT");
  self:RegisterEvent("RAID_ROSTER_UPDATE");
  self:RegisterEvent("PARTY_MEMBERS_CHANGED", "RAID_ROSTER_UPDATE");
  self:RegisterMessage("PassLoot_OnRoll");
  self.ItemsBeingRolledOn = {};
  self.InRaid = false;
  self:CheckDBVersion(3, "UpgradeDatabase");
  self:RAID_ROSTER_UPDATE();
end

function module:OnDisable()
  self:UnregisterEvent("CHAT_MSG_LOOT");
  self:UnregisterEvent("RAID_ROSTER_UPDATE");
  self:UnregisterEvent("PARTY_MEMBERS_CHANGED");
  self:UnregisterMessage("PassLoot_OnRoll");
  self:UnregisterDefaultVariables();
  self:RemoveWidgets();
end

function module:UpgradeDatabase(FromVersion, Rule)
  if ( FromVersion == 1 ) then
    local Table = {
      { "LootWonLogicalOperator", nil },
      { "LootWonComparison", {} },
    };
    if ( Rule.LootWonLogicalOperator and Rule.LootWonComparison ) then
      Table[2][2][1] = {
        Rule.LootWonLogicalOperator,
        Rule.LootWonComparison,
        false
      };
    end
    return Table;
  end
  if ( FromVersion == 2 ) then
    local Table = {
      { "LootWonLogicalOperator", Rule.LootWonLogicalOperator },
      { "LootWonComparison", {} },
    };
    if ( type(Rule.LootWonComparison) == "table" ) then
      for Key, Value in ipairs(Rule.LootWonComparison) do
        Table[2][2][Key] = { Value[1], Value[2], false };
      end
    end
    return Table;
  end
  return;
end

function module:CHAT_MSG_LOOT(Event, ...)
  -- needbeforegreed is round robin + rolling on some items.
  -- if ( GetLootMethod() == "group" or #self.ItemsBeingRolledOn == 0 ) then
  if ( #self.ItemsBeingRolledOn == 0 ) then
    return;
  end
  local CurrentCounter;
  local Pattern = string.gsub(LOOT_ROLL_WON, "%%s", "(.+)");
  local Start, End, Who, Item = string.find(select(1, ...), Pattern);
  if ( Start and Who and Item ) then
    self:Debug("Someone won "..Item);
    for Key, Value in pairs(self.ItemsBeingRolledOn) do
      if ( Value[1] == Item and PassLoot.db.profile.Rules[Value[2]] ) then
        if ( Who == YOU or Who == UnitName("player") ) then
          self:Debug("We won "..Item);
          local Counter = self.WidgetCounter:GetData(Value[2]);
          if ( Counter ) then
            Counter = Counter + 1;
            self:Debug("Incrementing Counter to "..Counter);
            self:SetConfigOption("LootWonCounter", Counter, Value[2]);
          end
          -- self:CurrentText();
          PassLoot:DisplayCurrentOptionFilter();
          PassLoot:Rules_ActiveFilters_OnScroll();
        else
          self:Debug("Someone else won "..Item);
        end
        self:Debug("Removing "..Item.." from ItemsBeingRolledOn");
        table.remove(self.ItemsBeingRolledOn, Key);
        return;
      end
    end
  end
  Pattern = string.gsub(LOOT_ROLL_ALL_PASSED, "%%s", "(.+)");
  Start, End, Item = string.find(select(1, ...), Pattern);
  if ( Start and Item ) then
    self:Debug("Everyone passed on "..Item);
    for Key, Value in pairs(self.ItemsBeingRolledOn) do
      if ( Value[1] == Item ) then
        self:Debug("Removing "..Item.." from ItemsBeingRolledOn");
        table.remove(self.ItemsBeingRolledOn, Key);
        return;
      end
    end
  end
end

function module:RAID_ROSTER_UPDATE()
  if ( UnitInRaid("player") or GetNumPartyMembers() > 0 ) then
    if ( not self.InRaid and self:GetProfileVariable("ResetLootCounter") ) then
      self:ResetProfileLootWonCounters();
    end
    self.InRaid = true;
  else
    self.InRaid = false;
  end
end

function module:PassLoot_OnRoll(Event, ItemLink, RuleNum, RollID, RollMethod)
  table.insert(self.ItemsBeingRolledOn, { ItemLink, RuleNum } );
end

function module:ResetProfileLootWonCounters()
  local Counter;
  for Key, Value in pairs(PassLoot.db.profile.Rules) do
    Counter = self.WidgetCounter:GetData(Key);
    if ( Counter ) then
      Counter = 0
      self:SetConfigOption("LootWonCounter", Counter, Key);
    end
  end
  self.WidgetCounter:DisplayWidget();
  PassLoot:Rules_ActiveFilters_OnScroll();
end

function module:CreateWidget_LootWonCounter()
  local EditBox = CreateFrame("EditBox", "PassLoot_Frames_Widgets_LootWonCounter");
  EditBox:SetBackdrop({
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
  EditBox:SetBackdropColor(0, 0, 0, 0.95);
  EditBox:SetFontObject(ChatFontNormal);
  EditBox:SetTextInsets(6, 6, 6, 6);
  EditBox:SetHeight(26);
  EditBox:SetWidth(80);
  EditBox:SetMaxLetters(8);
  -- EditBox:SetHistoryLines(0);
  EditBox:SetAutoFocus(false);
  EditBox:SetScript("OnEnter", function() self:ShowTooltip(L["Loot Won Counter"], L["Loot Won Counter_Desc"]) end);
  EditBox:SetScript("OnLeave", function() GameTooltip:Hide() end);
  EditBox:SetScript("OnEscapePressed", function(Frame) Frame:ClearFocus() end);
  EditBox:SetScript("OnEditFocusGained", function(Frame) Frame:HighlightText() end);
  EditBox:SetScript("OnEditfocusLost", function(Frame)
    Frame:HighlightText(0, 0);
    self.WidgetCounter:DisplayWidget();
  end);
  EditBox:SetScript("OnEnterPressed", function(Frame)
    self:SetCounter(Frame);
    Frame:ClearFocus();
  end);
  local EditBoxTitle = EditBox:CreateFontString(EditBox:GetName().."Title", "BACKGROUND", "GameFontNormalSmall");
  EditBoxTitle:SetParent(EditBox);
  EditBoxTitle:SetPoint("BOTTOMLEFT", EditBox, "TOPLEFT", 3, 0);
  EditBoxTitle:SetText(L["Loot Won Counter"]);
  EditBox:SetParent(nil);
  EditBox:Hide();
  EditBox.YPaddingTop = EditBoxTitle:GetHeight() + 1;
  EditBox.YPaddingBottom = 4;
  EditBox.Height = EditBox:GetHeight() + EditBox.YPaddingTop + EditBox.YPaddingBottom;
  EditBox.PreferredPriority = 17;
  EditBox.Info = {
    L["Loot Won Counter"],
    L["Loot Won Counter_Desc"],
  };
  return EditBox;
end
module.WidgetCounter = module:CreateWidget_LootWonCounter();

-- Local function to get the data and make sure it's valid data
function module.WidgetCounter:GetData(RuleNum)
  local Data = module:GetConfigOption("LootWonCounter", RuleNum);
  if ( Data and not tonumber(Data) ) then
    Data = module.NewFilterValue_Counter;
    module:SetConfigOption("LootWonCounter", Data);
  end
  return Data;
end

function module.WidgetCounter:GetNumFilters(RuleNum)
  local Value = self:GetData(RuleNum);
  if ( Value ) then
    return 1;
  else
    return 0;
  end
end

function module.WidgetCounter:AddNewFilter()
  module:SetConfigOption("LootWonCounter", module.NewFilterValue_Counter);
end

function module.WidgetCounter:RemoveFilter(Index)
  module:SetConfigOption("LootWonCounter", nil);
  module:SetConfigOption("LootWonComparison", {});
  -- module:SetConfigOption("LootWonLogicalOperator", {});
end

function module.WidgetCounter:DisplayWidget(Index)
  local Value = self:GetData();
  if ( Value ) then
    module.WidgetCounter:SetText(Value);
    module.WidgetCounter:SetScript("OnUpdate", function(...) module:ScrollLeft(...) end);
  end
end

function module.WidgetCounter:GetFilterText(Index)
  local Value = self:GetData();
  if ( Value ) then
    return Value;
  end
end

function module.WidgetCounter:IsException(RuleNum, Index)
  return false;
end

function module.WidgetCounter:SetException(RuleNum, Index, Value)
end

function module.WidgetCounter:SetMatch(ItemLink, Tooltip)
end

function module.WidgetCounter:GetMatch(RuleNum, Index)
  return true;
end

function module:SetCounter(Frame)
  local Value = tonumber(Frame:GetText()) or 0;
  if ( Value < 0 ) then
    Value = 0;
  end
  Value = math.floor(Value + 0.5);
  self:SetConfigOption("LootWonCounter", Value );
end

function module:CreateWidget_LootWonComparison()
  local DropDown = CreateFrame("Frame", "PassLoot_Frames_Widgets_LootWonComparison", nil, "UIDropDownMenuTemplate");
  DropDown:EnableMouse(true);
  DropDown:SetHitRectInsets(15, 15, 0 ,0);
  _G[DropDown:GetName().."Text"]:SetJustifyH("CENTER");
  if ( select(4, GetBuildInfo()) < 30000 ) then
    UIDropDownMenu_SetWidth(150, DropDown);
  else
    UIDropDownMenu_SetWidth(DropDown, 150);
  end
  DropDown:SetScript("OnEnter", function() self:ShowTooltip(L["Loot Won Comparison"], L["Selected rule will only match items when comparing the loot won counter to this."]) end);
  DropDown:SetScript("OnLeave", function() GameTooltip:Hide() end);
  local DropDownButton = _G[DropDown:GetName().."Button"];
  DropDownButton:SetScript("OnEnter", function() self:ShowTooltip(L["Loot Won Comparison"], L["Selected rule will only match items when comparing the loot won counter to this."]) end);
  DropDownButton:SetScript("OnLeave", function() GameTooltip:Hide() end);
  local DropDownTitle = DropDown:CreateFontString(DropDown:GetName().."Title", "BACKGROUND", "GameFontNormalSmall");
  DropDownTitle:SetParent(DropDown);
  DropDownTitle:SetPoint("BOTTOMLEFT", DropDown, "TOPLEFT", 20, 0);
  DropDownTitle:SetText(L["Loot Won Comparison"]);
  DropDown:SetParent(nil);
  DropDown:Hide();
  if ( select(4, GetBuildInfo()) < 30000 ) then
    DropDown.initialize = function(...) self:DropDown_Init(DropDown, ...) end;
  else
    DropDown.initialize = function(...) self:DropDown_Init(...) end;
  end
  DropDown.YPaddingTop = DropDownTitle:GetHeight();
  DropDown.Height = DropDown:GetHeight() + DropDown.YPaddingTop;
  DropDown.XPaddingLeft = -15;
  DropDown.XPaddingRight = -15;
  DropDown.Width = DropDown:GetWidth() + DropDown.XPaddingLeft + DropDown.XPaddingRight;
  DropDown.PreferredPriority = 16;
  DropDown.Info = {
    L["Loot Won Comparison"],
    L["Selected rule will only match items when comparing the loot won counter to this."],
  };

  local DropDownEditBox = CreateFrame("EditBox", "PassLoot_Frames_Widgets_LootWonDropDownEditBox");
  DropDownEditBox:Hide();
  DropDownEditBox:SetParent(nil);
  DropDownEditBox:SetFontObject(ChatFontNormal);
  DropDownEditBox:SetMaxLetters(8);
  DropDownEditBox:SetAutoFocus(true);
  DropDownEditBox:SetScript("OnEnter", function(Frame)
    CloseDropDownMenus(Frame:GetParent():GetParent():GetID() + 1);
    UIDropDownMenu_StopCounting(Frame:GetParent():GetParent());
  end);
  DropDownEditBox:SetScript("OnEnterPressed", function(Frame)
    self:DropDown_OnClick(Frame)  -- Calls Hide(), ClearAllPoints() and SetParent(nil)
    -- CloseMenus() only hides the DropDownList2, not this object, and even tho i will set parent to nil, i might as well cover bases
    CloseMenus()
  end);
  DropDownEditBox:SetScript("OnEscapePressed", function(Frame)
    Frame:Hide()
    Frame:ClearAllPoints()
    Frame:SetParent(nil)
    CloseMenus()
  end);
  DropDownEditBox:SetScript("OnEditFocusGained", function(Frame) UIDropDownMenu_StopCounting(Frame:GetParent():GetParent()) end);
  -- DropDownEditBox:SetScript("OnHide", function(Frame)
    -- if ( Frame:IsShown() ) then
      -- Frame:Hide()
    -- end
    -- Frame:SetParent(nil)
  -- end);
  DropDownEditBox:SetScript("OnEditFocusLost", function(Frame) Frame:Hide() end)
  return DropDown, DropDownEditBox;
end
module.WidgetComparison, module.DropDownEditBox = module:CreateWidget_LootWonComparison();

-- Local function to get the data and make sure it's valid data
function module.WidgetComparison:GetData(RuleNum)
  local Data = module:GetConfigOption("LootWonComparison", RuleNum);
  local Changed = false;
  if ( not Data or type(Data) ~= "table" ) then
    Data = {};
    Changed = true;
  end
  for Key, Value in ipairs(Data) do
    if ( type(Value) ~= "table" or type(Value[1]) ~= "number" or type(Value[2]) ~= "number" ) then
      Data[Key] = {
        module.NewFilterValue_LogicalOperator,
        module.NewFilterValue_Comparison,
        false
      };
      Changed = true;
    end
  end
  if ( Changed ) then
    module:SetConfigOption("LootWonComparison", Data);
  end
  return Data;
end

function module.WidgetComparison:GetNumFilters(RuleNum)
  local Value = self:GetData(RuleNum);
  return #Value;
end

function module.WidgetComparison:AddNewFilter()
  local Value = self:GetData();
  local NewTable = {
    module.NewFilterValue_LogicalOperator,
    module.NewFilterValue_Comparison,
    false
  };
  table.insert(Value, NewTable);
  module:SetConfigOption("LootWonComparison", Value);
  local Value = module.WidgetCounter:GetData();
  if ( not Value ) then
    module:SetConfigOption("LootWonCounter", module.NewFilterValue_Counter);
  end
end

function module.WidgetComparison:RemoveFilter(Index)
  local Value = self:GetData();
  table.remove(Value, Index);
  module:SetConfigOption("LootWonComparison", Value);
end

function module.WidgetComparison:DisplayWidget(Index)
  if ( Index ) then
    module.FilterIndex = Index;
  end
  local Value = self:GetData();
  local Value_LogicalOperator = Value[module.FilterIndex][1]
  local Value_Comparison = Value[module.FilterIndex][2]
  if ( select(4, GetBuildInfo()) < 30000 ) then
    UIDropDownMenu_SetText(module:GetLootWonText(Value_LogicalOperator, Value_Comparison), module.WidgetComparison);
  else
    UIDropDownMenu_SetText(module.WidgetComparison, module:GetLootWonText(Value_LogicalOperator, Value_Comparison));
  end
end

function module.WidgetComparison:GetFilterText(Index)
  local Value = self:GetData();
  local LogicalOperator = Value[Index][1];
  local Comparison = Value[Index][2];
  local Text = module:GetLootWonText(LogicalOperator, Comparison);
  return Text;
end

function module.WidgetComparison:IsException(RuleNum, Index)
  local Data = self:GetData(RuleNum);
  return Data[Index][3];
end

function module.WidgetComparison:SetException(RuleNum, Index, Value)
  local Data = self:GetData(RuleNum);
  Data[Index][3] = Value;
  module:SetConfigOption("LootWonComparison", Data);
end

function module.WidgetComparison:SetMatch(ItemLink, Tooltip)
end

function module.WidgetComparison:GetMatch(RuleNum, Index)
  local Value = self:GetData(RuleNum);
  local LogicalOperator = Value[Index][1];
  local Comparison = Value[Index][2];
  local Counter = module.WidgetCounter:GetData(RuleNum);
  if ( LogicalOperator > 1 ) then
    if ( LogicalOperator == 2 ) then -- Equal To
      if ( Counter ~= Comparison ) then
        module:Debug("LootWonCounter ~= LootWonComparison");
        return false;
      end
    elseif ( LogicalOperator == 3 ) then -- Not Equal To
      if ( Counter == Comparison ) then
        module:Debug("LootWonCounter == LootWonComparison");
        return false;
      end
    elseif ( LogicalOperator == 4 ) then -- Less than
      if ( Counter >= Comparison ) then
        module:Debug("LootWonCounter >= LootWonComparison");
        return false;
      end
    -- elseif ( LogicalOperator== 5 ) then -- Greater than
      -- if ( Counter<= Comparison ) then
        -- module:Debug("LootWonCounter <= LootWonComparison");
        -- return false;
      -- end
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
  -- info.owner = self.WidgetComparison;
  info.owner = Frame;
  if ( Level == 1 ) then
    for Key, Value in ipairs(self.Choices) do
      info.text = Value.Name;
      info.value = Value.Value;
      if ( Key == 1 ) then
        info.hasArrow = false;
      else
        info.hasArrow = true;
      end
      info.notClickable = false;
      UIDropDownMenu_AddButton(info, Level);
    end
  else
    -- if ( select(4, GetBuildInfo()) < 30000 ) then
      -- Frame = this;
    -- end
    -- local button = Frame;
    -- local parent = button:GetParent();
    -- if (parent:GetName() == "DropDownList1") then
      -- info.owner.selectedLevel1Button = button;  -- I can't remember if this was needed for anything? why did i put this here? lawl.
      -- self.DropDownEditBox.value = button.value;
    -- else
      -- info.owner.selectedLevel1Button = parent;  -- I can't remember if this was needed for anything? why did i put this here? lawl.
      -- self.DropDownEditBox.value = parent.value;
    -- end
    self.DropDownEditBox.value = UIDROPDOWNMENU_MENU_VALUE;
    info.text = "";
    info.notClickable = false;
    UIDropDownMenu_AddButton(info, Level);
    DropDownList2.maxWidth = 80;
    DropDownList2:SetWidth(80);
    self.DropDownEditBox.owner = info.owner;
    self.DropDownEditBox:ClearAllPoints();
    self.DropDownEditBox:SetParent(DropDownList2Button1);
    self.DropDownEditBox:SetPoint("TOPLEFT", DropDownList2Button1, "TOPLEFT");
    self.DropDownEditBox:SetPoint("BOTTOMRIGHT", DropDownList2Button1, "BOTTOMRIGHT");
    local Value = self.WidgetComparison:GetData();
    self.DropDownEditBox:SetText(Value[self.FilterIndex][2]);
    self.DropDownEditBox:Show();
    self.DropDownEditBox:SetFocus();
    self.DropDownEditBox:HighlightText();
  end
end

function module:DropDown_OnClick(Frame)
  local Value = self.WidgetComparison:GetData();
  local LogicalOperator = Frame.value;
  local Comparison = Value[self.FilterIndex][2];
  if ( Frame:GetName() == self.DropDownEditBox:GetName() ) then
    Comparison = tonumber(Frame:GetText()) or 0;
    if ( Comparison < 0 ) then
      Comparison = 0;
    end
    Comparison = math.floor(Comparison + 0.5);
  end
  Value[self.FilterIndex][1] = LogicalOperator;
  Value[self.FilterIndex][2] = Comparison;
  self:SetConfigOption("LootWonComparison", Value);
  if ( select(4, GetBuildInfo()) < 30000 ) then
    UIDropDownMenu_SetText(self:GetLootWonText(LogicalOperator, Comparison), Frame.owner);
  else
    UIDropDownMenu_SetText(Frame.owner, self:GetLootWonText(LogicalOperator, Comparison));
  end
  self.DropDownEditBox:Hide();
  self.DropDownEditBox:ClearAllPoints();
  self.DropDownEditBox:SetParent(nil);
end

--[=[
function module:CreateWidget_ResetCheckBox()
  local Checkbox = CreateFrame("CheckButton", "PassLoot_Frames_Widgets_LootWonResetCheckBox", nil, "UICheckButtonTemplate");
  Checkbox:SetHeight(24);
  Checkbox:SetWidth(24);
  Checkbox:SetHitRectInsets(0, -60, 0, 0);
  Checkbox:SetScript("OnLeave", function() GameTooltip:Hide() end);
  Checkbox:SetScript("OnClick", function(...) self:Checkbox_OnClick(...) end);
  Checkbox:SetScript("OnEnter", function() self:ShowTooltip(L["Reset Counters On Join"], L["Reset Counters On Join_Desc"]) end);
  _G[Checkbox:GetName().."Text"]:SetText(L["Reset Counters On Join"]);
  return Checkbox;
end
module.ResetCheckbox = module:CreateWidget_ResetCheckBox();

function module:Checkbox_OnClick(Frame, Button)
  local ResetLootCounter = self:GetProfileVariable("ResetLootCounter");
  if ( IsShiftKeyDown() ) then
    Frame:SetChecked(ResetLootCounter);
    self:ResetProfileLootWonCounters();
  else
    self:SetProfileVariable("ResetLootCounter", not ResetLootCounter);
  end
end
]=]

function module:GetLootWonText(LogicalOperator, Comparison)
  for Key, Value in ipairs(self.Choices) do
    if ( Value.Value == LogicalOperator ) then
      return string.gsub(Value.Text, "%%num%%", Comparison);
    end
  end
end
