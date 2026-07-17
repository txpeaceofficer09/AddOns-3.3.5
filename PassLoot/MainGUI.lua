local PassLoot = LibStub("AceAddon-3.0"):GetAddon("PassLoot");
local L = LibStub("AceLocale-3.0"):GetLocale("PassLoot");
local LootOrderIcons = {
  "Interface\\MoneyFrame\\UI-GoldIcon",
  "Interface\\MoneyFrame\\UI-SilverIcon",
  "Interface\\MoneyFrame\\UI-CopperIcon",
};

--[=[  Frame layout:
PassLoot.RulesFrame = {
  ["List"] = {  -- Has a background
    ["ScrollFrame"] = FauxScrollFrame,
    ["ScrollLine1"] = {
      ["Highlight"] = Highlight Texture,
      ["Text"] = FontString,
      ["Pass"] = CheckButton {
        ["Title"] = FontString,
      },
      ["Greed"] = CheckButton {
        ["Title"] = FontString,
      },
      ["Need"] = CheckButton {
        ["Title"] = FontString,
      },
    },
    ["ScrollLine6"],
    ["Add"] = Button,
    ["Remove"] = Button,
    ["Up"] = Button,
    ["Down"] = Button,
  },
  ["Settings"] = {  -- Has a background
    ["Desc"] = EditBox {
      ["Title"] = FontString,
    },
    ["AvailableFilters"] = {  -- Has a background
      ["Title"] = FontString,
      ["ScrollFrame"] = FauxScrollFrame,
      ["ScrollLine1"] = {
        ["Highlight"] = Highlight Texture,
        ["Text"] = FontString,
      },
      ["ScrollLine8"],
    },
    ["ActiveFilters"] = {  -- Has a background
      ["Title"] = FontString,
      ["ScrollFrame"] = FauxScrollFrame,
      ["ScrollLine1"] = {
        ["Highlight"] = Highlight Texture,
        ["Text"] = FontString,
      },
      ["ScrollLine8"],
    },
    ["Add"] = Button,
    ["Remove"] = Button,
    -- We insert rule widgets here, PassLoot.PluginInfo[ModuleName].RuleWidgets is a table of widgets per module.
  },
};
]=]

function PassLoot:ShowTooltip(...)
  if ( select("#", ...) == 0 ) then
    return;
  end
  -- GameTooltip:SetOwner(PassLoot_MainFrame, "ANCHOR_TOPLEFT");
  GameTooltip:SetOwner(InterfaceOptionsFramePanelContainer, "ANCHOR_TOPLEFT");
  GameTooltip:SetText(PassLoot.FontWhite..select(1, ...));
  for i = 2, select("#", ...) do
    GameTooltip:AddLine(PassLoot.FontGold..select(i, ...));
  end
  GameTooltip:Show();
end

--Function to copy tables, since passing tables is always by reference.
function PassLoot:CopyTable(OldDB)
  if ( not OldDB or type(OldDB) ~= "table" ) then
    return OldDB;
  end
  local NewDB;
  NewDB = {};
  for Key, Value in pairs(OldDB) do
    if ( type(Value) ~= "table" ) then
      NewDB[Key] = Value;
    else
      NewDB[Key] = self:CopyTable(Value);
    end
  end
  return NewDB;
end

-- I am going to use this function to scroll text boxes to the left instead of SetCursorPosition()
-- SetCursorPosition(0) requires I ClearFocus(), which will create a loop that I don't really like.
function PassLoot:ScrollLeft(Frame, Elapsed)
  Frame:HighlightText(0,1);
  Frame:Insert(" "..strsub(Frame:GetText(),1,1));
  Frame:HighlightText(0,1);
  Frame:Insert("");
  Frame:SetScript("OnUpdate", nil);
end

function PassLoot:DisplayCurrentRule()
  if ( not self.CurrentRule ) then
    self.CurrentRule = 0;
  end
  self.CurrentOptionFilter = { nil, 0 }; -- Frame, line #
  self:DisplayCurrentOptionFilter();
  if ( self.CurrentRule > 0 ) then
    self.RulesFrame.Settings.Desc:Show();
    self.RulesFrame.Settings.AvailableFilters:Show();
    self.RulesFrame.Settings.ActiveFilters:Show();
    self:Rules_AvailableFilters_OnScroll();
    self:Rules_ActiveFilters_OnScroll();
    self.RulesFrame.Settings.Desc:SetText(self.db.profile.Rules[self.CurrentRule].Desc);
    self.RulesFrame.Settings.Desc:SetScript("OnUpdate", function(...) self:ScrollLeft(...) end);
  else
    self.RulesFrame.Settings.Desc:Hide();
    self.RulesFrame.Settings.AvailableFilters:Hide();
    self.RulesFrame.Settings.ActiveFilters:Hide();
  end
end

-- Show the widget that is selected
function PassLoot:DisplayCurrentOptionFilter()
  local Widget;
  if ( self.OldOptionFilter ) then
    self.OldOptionFilter:Hide();
  end
  if ( self.CurrentOptionFilter[1] == "Available" ) then
    self.RulesFrame.Settings.Add:Show();
    self.RulesFrame.Settings.Remove:Hide();
    self.RulesFrame.Settings.Exception:Hide();
  elseif ( self.CurrentOptionFilter[1] == "Active" ) then
    local WidgetKey, Offset = self:GetWidgetFromLineNum(self.CurrentOptionFilter[2]);
    self.RulesFrame.Settings.Add:Hide();
    self.RulesFrame.Settings.Remove:Show();
    self.RulesFrame.Settings.Exception:Show();
    if ( Offset ) then
      Widget = self.RuleWidgets[WidgetKey];
      Widget:DisplayWidget(Offset);
      Widget:Show();
    end
  else
    self.RulesFrame.Settings.Add:Hide();
    self.RulesFrame.Settings.Remove:Hide();
    self.RulesFrame.Settings.Exception:Hide();
  end
  self.OldOptionFilter = Widget;
end

function PassLoot:SetLootMethod(LineNum, Method)
  local Frame = self.RulesFrame.List;
  local RuleNum = LineNum + FauxScrollFrame_GetOffset(Frame.ScrollFrame);
  local Value;
  if ( Method == "pass" ) then
    Value = Frame["ScrollLine"..LineNum].Pass:GetChecked();
  elseif ( Method == "greed" ) then
    Value = Frame["ScrollLine"..LineNum].Greed:GetChecked();
  elseif ( Method == "need" ) then
    Value = Frame["ScrollLine"..LineNum].Need:GetChecked();
  elseif ( Method == "de" ) then
    Value = Frame["ScrollLine"..LineNum].Disenchant:GetChecked();
  end
  if ( Value ) then
    table.insert(self.db.profile.Rules[RuleNum].Loot, Method);
    table.sort(self.db.profile.Rules[RuleNum].Loot, function(a, b) return self.RollOrderToIndex[a] < self.RollOrderToIndex[b] end);
  else
    for LootKey, LootValue in pairs(self.db.profile.Rules[RuleNum].Loot) do
      if ( LootValue == Method ) then
        table.remove(self.db.profile.Rules[RuleNum].Loot, LootKey);
        return;
      end
    end
    self:Debug("Couldn't find roll method to remove");
  end
end

function PassLoot:SetDisenchant(LineNum)
  local Frame = self.RulesFrame.List;
  local RuleNum = LineNum + FauxScrollFrame_GetOffset(Frame.ScrollFrame);
  if ( self.db.profile.Rules[RuleNum].Disenchant ) then
    self.db.profile.Rules[RuleNum].Disenchant = nil;
    Frame["ScrollLine"..LineNum].Disenchant:SetChecked(false);
  else
    self.db.profile.Rules[RuleNum].Disenchant = true;
  end
end

function PassLoot:SetCurrentRule(LineNum)
  local Counter;
  local Frame = self.RulesFrame.List;
  self.CurrentRule = LineNum + FauxScrollFrame_GetOffset(Frame.ScrollFrame);
  for Counter = 1, self.NumRuleListLines do
    if ( Counter == LineNum ) then
      Frame["ScrollLine"..Counter].Highlight:Show();
    else
      Frame["ScrollLine"..Counter].Highlight:Hide();
    end
  end
  self:DisplayCurrentRule();
end

function PassLoot:SetCurrentOptionFilter(FilterList, LineNum, Button)
  local Counter;
  self.CurrentOptionFilter = {
    FilterList,
    LineNum + FauxScrollFrame_GetOffset(self.RulesFrame.Settings[FilterList.."Filters"].ScrollFrame),
  };
  if ( Button == "RightButton" and IsShiftKeyDown() and FilterList == "Active" ) then
    self:RemoveFilter();
  else
    for Counter = 1, self.NumFilterLines do
      if ( LineNum == Counter ) then
        if ( FilterList == "Available" ) then
          self.RulesFrame.Settings.AvailableFilters["ScrollLine"..Counter].Highlight:Show();
          self.RulesFrame.Settings.ActiveFilters["ScrollLine"..Counter].Highlight:Hide();
        else
          self.RulesFrame.Settings.AvailableFilters["ScrollLine"..Counter].Highlight:Hide();
          self.RulesFrame.Settings.ActiveFilters["ScrollLine"..Counter].Highlight:Show();
        end
      else
        self.RulesFrame.Settings.AvailableFilters["ScrollLine"..Counter].Highlight:Hide();
        self.RulesFrame.Settings.ActiveFilters["ScrollLine"..Counter].Highlight:Hide();
      end
    end
  end
  self:DisplayCurrentOptionFilter();
end

function PassLoot:RemoveFilter()
  if ( self.CurrentRule > 0 and self.CurrentOptionFilter[1] == "Active" and self.CurrentOptionFilter[2] > 0 ) then
    local WidgetKey, Offset = self:GetWidgetFromLineNum(self.CurrentOptionFilter[2]);
    if ( Offset ) then
      self.RuleWidgets[WidgetKey]:RemoveFilter(Offset);
    else
      for Index = self.RuleWidgets[WidgetKey]:GetNumFilters(), 1, -1 do
        self.RuleWidgets[WidgetKey]:RemoveFilter(Index);
      end
    end
    for Key, Value in pairs(self.RuleWidgets) do
      Value:Hide();
    end
    self.CurrentOptionFilter = { nil, 0 }; -- Frame, line #
    -- self:DisplayCurrentOptionFilter();
    self:Rules_AvailableFilters_OnScroll();
    self:Rules_ActiveFilters_OnScroll();
  end
end

function PassLoot:ChangeFilterException()
  if ( self.CurrentRule > 0 and self.CurrentOptionFilter[1] == "Active" and self.CurrentOptionFilter[2] > 0 ) then
    local WidgetKey, Offset = self:GetWidgetFromLineNum(self.CurrentOptionFilter[2]);
    if ( Offset ) then
      self.RuleWidgets[WidgetKey]:SetException(self.CurrentRule, Offset, not self.RuleWidgets[WidgetKey]:IsException(self.CurrentRule, Offset));
    else
      for Index = 1, self.RuleWidgets[WidgetKey]:GetNumFilters() do
        self.RuleWidgets[WidgetKey]:SetException(self.CurrentRule, Index, not self.RuleWidgets[WidgetKey]:IsException(self.CurrentRule, Index));
      end
    end
    self:Rules_ActiveFilters_OnScroll();
  end
end

function PassLoot:Rules_RuleList_OnScroll()
  local Frame = self.RulesFrame.List;
  local Line, LineNum;
  local NumRules = #self.db.profile.Rules;
  FauxScrollFrame_Update(Frame.ScrollFrame, NumRules, self.NumRuleListLines, self.RuleListLineHeight);
  for Line=1, self.NumRuleListLines do
    LineNum = Line + FauxScrollFrame_GetOffset(Frame.ScrollFrame);
    if ( LineNum <= NumRules ) then
      Frame["ScrollLine"..Line].Text:SetText(self.db.profile.Rules[LineNum].Desc);
      Frame["ScrollLine"..Line].Pass:SetChecked(false);
      Frame["ScrollLine"..Line].Greed:SetChecked(false);
      Frame["ScrollLine"..Line].Need:SetChecked(false);
      Frame["ScrollLine"..Line].Disenchant:SetChecked(false);
      for Key, Value in ipairs(self.db.profile.Rules[LineNum].Loot) do
        if ( Value == "pass" ) then
          Frame["ScrollLine"..Line].Pass:SetChecked(true);
          -- Frame["ScrollLine"..Line].Pass:SetCheckedTexture(LootOrderIcons[Key] or "Interface\\Buttons\\UI-CheckBox-Check");
        elseif ( Value == "greed" ) then
          Frame["ScrollLine"..Line].Greed:SetChecked(true);
          -- Frame["ScrollLine"..Line].Greed:SetCheckedTexture(LootOrderIcons[Key] or "Interface\\Buttons\\UI-CheckBox-Check");
        elseif ( Value == "need" ) then
          Frame["ScrollLine"..Line].Need:SetChecked(true);
          -- Frame["ScrollLine"..Line].Need:SetCheckedTexture(LootOrderIcons[Key] or "Interface\\Buttons\\UI-CheckBox-Check");
        elseif ( Value == "de" ) then
          Frame["ScrollLine"..Line].Disenchant:SetChecked(true);
          -- Frame["ScrollLine"..Line].Disenchant:SetCheckedTexture(LootOrderIcons[Key] or "Interface\\Buttons\\UI-CheckBox-Check");
        end
      end
      Frame["ScrollLine"..Line]:Show();
      if ( LineNum == self.CurrentRule ) then
        Frame["ScrollLine"..Line].Highlight:Show();
      else
        Frame["ScrollLine"..Line].Highlight:Hide();
      end
    else
      Frame["ScrollLine"..Line].Highlight:Hide();
      Frame["ScrollLine"..Line]:Hide();
    end
  end
end

function PassLoot:Rules_AvailableFilters_OnScroll()
  local Frame = self.RulesFrame.Settings.AvailableFilters;
  local Line, LineNum;
  local NumOptions = #self.RuleWidgets;
  FauxScrollFrame_Update(Frame.ScrollFrame, NumOptions, self.NumFilterLines, self.FilterLineHeight);
  for Line=1, self.NumFilterLines do
    LineNum = Line + FauxScrollFrame_GetOffset(Frame.ScrollFrame);
    if ( LineNum <= NumOptions ) then
      Frame["ScrollLine"..Line].Text:SetText(self.RuleWidgets[LineNum].Info[1] or "");
      Frame["ScrollLine"..Line]:Show();
      if ( self.CurrentOptionFilter[1] == "Available" and self.CurrentOptionFilter[2] == LineNum ) then
        Frame["ScrollLine"..Line].Highlight:Show();
      else
        Frame["ScrollLine"..Line].Highlight:Hide();
      end
    else
      Frame["ScrollLine"..Line].Highlight:Hide();
      Frame["ScrollLine"..Line]:Hide();
    end
  end
end

function PassLoot:Rules_ActiveFilters_OnScroll()
  if ( self.CurrentRule < 1 ) then
    return;
  end
  local Frame = self.RulesFrame.Settings.ActiveFilters;
  local Line, LineNum;
  local NumLines = 0;
  local WidgetKey, Offset, Text, NumFilters;
  for WidgetKey, WidgetValue in ipairs(self.RuleWidgets) do
    NumFilters = (WidgetValue:GetNumFilters() or 0);
    if ( NumFilters > 0 ) then
      NumLines = NumLines + NumFilters + 1;
    end
  end
  FauxScrollFrame_Update(Frame.ScrollFrame, NumLines, self.NumFilterLines, self.FilterLineHeight);
  for Line=1, self.NumFilterLines do
    LineNum = Line + FauxScrollFrame_GetOffset(Frame.ScrollFrame);
    if ( LineNum <= NumLines ) then
      WidgetKey, Offset = self:GetWidgetFromLineNum(LineNum);
      if ( Offset ) then
        Text = self.RuleWidgets[WidgetKey]:GetFilterText(Offset) or "Value Error";
        if ( self.RuleWidgets[WidgetKey]:IsException(self.CurrentRule, Offset) ) then
          Text = self.FontRed..L["EXCEPTION_PREFIX"].."|r"..Text;
        end
      else
        Text = PassLoot.FontGold..(self.RuleWidgets[WidgetKey].Info[1] or "Name Error");
      end
      Frame["ScrollLine"..Line].Text:SetText(Text);
      Frame["ScrollLine"..Line]:Show();
      if ( self.CurrentOptionFilter[1] == "Active" and self.CurrentOptionFilter[2] == LineNum ) then
        Frame["ScrollLine"..Line].Highlight:Show();
      else
        Frame["ScrollLine"..Line].Highlight:Hide();
      end
    else
      Frame["ScrollLine"..Line].Highlight:Hide();
      Frame["ScrollLine"..Line]:Hide();
    end
  end
end

function PassLoot:GetWidgetFromLineNum(Offset)
  local VariableList, NumFilters;
  for WidgetKey, WidgetValue in ipairs(self.RuleWidgets) do
    NumFilters = WidgetValue:GetNumFilters() or 0;
    if ( NumFilters > 0 ) then
      Offset = Offset - 1;
      if ( Offset == 0 ) then
        return WidgetKey, nil;
      end
    end
    if ( Offset <= NumFilters ) then
      return WidgetKey, Offset;
    else
      Offset = Offset - NumFilters;
    end
  end
end

--[=[ ##########################
           START OF LUA UI
      ##########################
]=]

-- Tooltip used for scanning (we pass the frame to modules, and they can scan)
function PassLoot:Create_PassLootTooltip()
  local Frame = CreateFrame("GameTooltip", "PassLootTooltip", UIParent, "GameTooltipTemplate");
  Frame:Hide();
  Frame:SetOwner(UIParent, "ANCHOR_NONE");
  return Frame;
end

function PassLoot:Create_RulesFrame()
  local Frame = CreateFrame("Frame");
  Frame:SetWidth(413);
  Frame:SetHeight(428);
  
  Frame.List = self:Create_RuleListFrame();
  Frame.List:SetParent(Frame);
  Frame.List:SetPoint("TOP", Frame, "TOP");

  Frame.Settings = self:Create_RuleSettingsFrame();
  Frame.Settings:SetParent(Frame);
  Frame.Settings:SetPoint("TOP", Frame.List, "BOTTOM");
  
  -- Blizzard Interface Options Panel stuff:
  Frame.name = L["PassLoot"];
  
  return Frame;
end

function PassLoot:Create_RuleListFrame()
  local Frame = CreateFrame("Frame");
  Frame:SetWidth(413);
  Frame:SetHeight(130);
  Frame:SetBackdrop({
    ["bgFile"] = "Interface\\Tooltips\\UI-Tooltip-Background",
    ["edgeFile"] = "Interface\\Tooltips\\UI-Tooltip-Border",
    ["tile"] = true,
    ["insets"] = {
      ["top"] = 5,
      ["bottom"] = 5,
      ["left"] = 5,
      ["right"] = 5,
    },
    ["tileSize"] = 16,
    ["edgeSize"] = 16,
  });
  Frame:SetBackdropBorderColor(0.4, 0.4, 0.4);
  Frame:SetBackdropColor(0.5, 0.5, 0.5);

  Frame.ScrollFrame = CreateFrame("ScrollFrame", "PassLoot_Rules_Scroll", Frame, "FauxScrollFrameTemplate");
  Frame.ScrollFrame:SetPoint("TOPLEFT", Frame, "TOPLEFT", 0, -8);
  Frame.ScrollFrame:SetWidth(381);
  Frame.ScrollFrame:SetHeight(96);
  if ( select(4, GetBuildInfo()) >= 30000 ) then
    Frame.ScrollFrame:SetScript("OnVerticalScroll", function(frame, offset)
      FauxScrollFrame_OnVerticalScroll(frame, offset, 16, function() self:Rules_RuleList_OnScroll() end)
    end);
  else
    Frame.ScrollFrame:SetScript("OnVerticalScroll", function()
      FauxScrollFrame_OnVerticalScroll(16, function() self:Rules_RuleList_OnScroll() end)
    end);
  end
  
  Frame.ScrollLine1 = self:Create_RuleListScrollLine();
  Frame.ScrollLine1:SetParent(Frame);
  Frame.ScrollLine1:SetPoint("TOPLEFT", Frame.ScrollFrame, "TOPLEFT", 8, 0);
  Frame.ScrollLine1.LineNum = 1;
  for Index = 2, 6 do
    Frame["ScrollLine"..Index] = self:Create_RuleListScrollLine();
    Frame["ScrollLine"..Index]:SetParent(Frame);
    Frame["ScrollLine"..Index]:SetPoint("TOPLEFT", Frame["ScrollLine"..(Index - 1)], "BOTTOMLEFT");
    Frame["ScrollLine"..Index].LineNum = Index;
  end
  
  Frame.Add = CreateFrame("Button", nil, Frame, "UIPanelButtonTemplate");
  Frame.Add:SetPoint("TOPLEFT", Frame.ScrollFrame, "BOTTOMLEFT", 12, 0);
  Frame.Add:SetWidth(90); -- My other mods: 80
  Frame.Add:SetHeight(21); -- My other mods: 22
  Frame.Add:SetScript("OnEnter", function() self:ShowTooltip(L["Add"], L["Add a new rule."]) end);
  Frame.Add:SetScript("OnLeave", function() GameTooltip:Hide() end);
  Frame.Add:SetScript("OnClick", function(frame, button)
    local TempDB = {}
    for Key, Value in ipairs(self.DefaultTemplate) do
      TempDB[Value[1]] = self:CopyTable(Value[2])
    end
    table.insert(self.db.profile.Rules, TempDB)
    self:Rules_RuleList_OnScroll()
  end);
  Frame.Add:SetText(L["Add"]);
  
  Frame.Remove = CreateFrame("Button", nil, Frame, "UIPanelButtonTemplate");
  Frame.Remove:SetPoint("TOPLEFT", Frame.Add, "TOPRIGHT", 10, 0);
  Frame.Remove:SetWidth(90); -- My other mods: 80
  Frame.Remove:SetHeight(21); -- My other mods: 22
  Frame.Remove:SetScript("OnEnter", function() self:ShowTooltip(L["Remove"], L["Remove selected rule."]) end);
  Frame.Remove:SetScript("OnLeave", function() GameTooltip:Hide() end);
  Frame.Remove:SetScript("OnClick", function(frame, button)
    if ( self.CurrentRule > 0 ) then
      table.remove(self.db.profile.Rules, self.CurrentRule)
      self.CurrentRule = 0
      self:Rules_RuleList_OnScroll()
      self:DisplayCurrentRule()
    end
  end);
  Frame.Remove:SetText(L["Remove"]);
  
  Frame.Up = CreateFrame("Button", nil, Frame, "UIPanelButtonTemplate");
  Frame.Up:SetPoint("TOPLEFT", Frame.Remove, "TOPRIGHT", 10, 0);
  Frame.Up:SetWidth(90); -- My other mods: 80
  Frame.Up:SetHeight(21); -- My other mods: 22
  Frame.Up:SetScript("OnEnter", function() self:ShowTooltip(L["Up"], L["Move selected rule up in priority."]) end);
  Frame.Up:SetScript("OnLeave", function() GameTooltip:Hide() end);
  Frame.Up:SetScript("OnClick", function(frame, button)
    if ( self.CurrentRule > 1 ) then
      local TempDB = self.db.profile.Rules[self.CurrentRule]
      self.db.profile.Rules[self.CurrentRule] = self.db.profile.Rules[self.CurrentRule - 1]
      self.db.profile.Rules[self.CurrentRule - 1] = TempDB
      self.CurrentRule = self.CurrentRule - 1
      self:Rules_RuleList_OnScroll()
      self:DisplayCurrentRule()
    end
  end);
  Frame.Up:SetText(L["Up"]);

  Frame.Down = CreateFrame("Button", nil, Frame, "UIPanelButtonTemplate");
  Frame.Down:SetPoint("TOPLEFT", Frame.Up, "TOPRIGHT", 10, 0);
  Frame.Down:SetWidth(90); -- My other mods: 80
  Frame.Down:SetHeight(21); -- My other mods: 22
  Frame.Down:SetScript("OnEnter", function() self:ShowTooltip(L["Down"], L["Move selected rule down in priority."]) end);
  Frame.Down:SetScript("OnLeave", function() GameTooltip:Hide() end);
  Frame.Down:SetScript("OnClick", function(frame, button)
    if ( self.CurrentRule > 0 and self.CurrentRule < #self.db.profile.Rules ) then
      local TempDB = self.db.profile.Rules[self.CurrentRule]
      self.db.profile.Rules[self.CurrentRule] = self.db.profile.Rules[self.CurrentRule + 1]
      self.db.profile.Rules[self.CurrentRule + 1] = TempDB
      self.CurrentRule = self.CurrentRule + 1
      self:Rules_RuleList_OnScroll()
      self:DisplayCurrentRule()
    end
  end);
  Frame.Down:SetText(L["Down"]);

  return Frame;
end

function PassLoot:Create_RuleListScrollLine()
  local Frame = CreateFrame("Button");
  Frame:SetWidth(379);
  Frame:SetHeight(16);
  Frame:SetScript("OnEnter", function(frame) self:ShowTooltip(L["Rule List"], L["Click to select and edit this rule."]) end);
  Frame:SetScript("OnLeave", function() GameTooltip:Hide() end);
  Frame:SetScript("OnClick", function(frame, button) self:SetCurrentRule(Frame.LineNum) end);
  
  Frame.Highlight = Frame:CreateTexture(nil, "BACKGROUND");
  Frame.Highlight:SetTexture("Interface\\QuestFrame\\UI-QuestTitleHighlight");
  Frame.Highlight:SetAllPoints(Frame);
  Frame.Highlight:SetBlendMode("ADD");
  Frame.Highlight:Hide();

  Frame.Text = Frame:CreateFontString(nil, "BACKGROUND", "ChatFontSmall");
  Frame.Text:SetPoint("TOPLEFT", Frame, "TOPLEFT", 0, 0);
  Frame.Text:SetWidth(155);
  Frame.Text:SetHeight(16);
  Frame.Text:SetJustifyH("LEFT");
  
  Frame.Need = self:Create_CheckBox();
  Frame.Need:SetParent(Frame);
  Frame.Need:SetPoint("TOPLEFT", Frame.Text, "TOPRIGHT");
  Frame.Need:SetScript("OnClick", function(frame, button) self:SetLootMethod(Frame.LineNum, "need") end);
  Frame.Need:SetScript("OnEnter", function() self:ShowTooltip(L["Need"], L["Will roll need on all loot matching this rule."], L["Rolling is tried from left to right"]) end);
  Frame.Need.Text:SetText(L["Need"]);

  Frame.Disenchant = self:Create_CheckBox();
  Frame.Disenchant:SetParent(Frame);
  Frame.Disenchant:SetPoint("TOPLEFT", Frame.Need, "TOPRIGHT", 40, 0);
  -- Frame.Disenchant:SetScript("OnClick", function(frame, button) self:SetDisenchant(Frame.LineNum) end);
  Frame.Disenchant:SetScript("OnClick", function(frame, button) self:SetLootMethod(Frame.LineNum, "de") end);
  Frame.Disenchant:SetScript("OnEnter", function() self:ShowTooltip(L["Disenchant"], L["Disenchant_Desc"], L["Rolling is tried from left to right"]) end);
  Frame.Disenchant.Text:SetText(L["Disenchant"]);

  Frame.Greed = self:Create_CheckBox();
  Frame.Greed:SetParent(Frame);
  Frame.Greed:SetPoint("TOPLEFT", Frame.Disenchant, "TOPRIGHT", 40, 0);
  Frame.Greed:SetScript("OnClick", function(frame, button) self:SetLootMethod(Frame.LineNum, "greed") end);
  Frame.Greed:SetScript("OnEnter", function() self:ShowTooltip(L["Greed"], L["Will roll greed on all loot matching this rule."], L["Rolling is tried from left to right"]) end);
  Frame.Greed.Text:SetText(L["Greed"]);

  Frame.Pass = self:Create_CheckBox();
  Frame.Pass:SetParent(Frame);
  Frame.Pass:SetPoint("TOPLEFT", Frame.Greed, "TOPRIGHT", 40, 0);
  Frame.Pass:SetScript("OnClick", function(frame, button) self:SetLootMethod(Frame.LineNum, "pass") end);
  Frame.Pass:SetScript("OnEnter", function() self:ShowTooltip(L["Pass"], L["Will pass on all loot matching this rule."], L["Rolling is tried from left to right"]) end);
  Frame.Pass.Text:SetText(L["Pass"]);


  return Frame;
end

function PassLoot:Create_CheckBox()
  local Frame = CreateFrame("CheckButton");
  Frame:SetHeight(16);
  Frame:SetWidth(16);
  Frame:SetNormalTexture("Interface\\Buttons\\UI-CheckBox-Up");
  Frame:SetPushedTexture("Interface\\Buttons\\UI-CheckBox-Down");
  Frame:SetHighlightTexture("Interface\\Buttons\\UI-CheckBox-Highlight");
  Frame:SetCheckedTexture("Interface\\Buttons\\UI-CheckBox-Check");
  Frame:SetScript("OnLeave", function() GameTooltip:Hide() end);
  Frame:SetHitRectInsets(0, -30, 0, 0);
  Frame.Text = Frame:CreateFontString(nil, "ARTWORK", "GameFontNormalSmall");
  Frame.Text:SetPoint("LEFT", Frame, "RIGHT", -2, 0);
  return Frame;
end

function PassLoot:Create_RuleSettingsFrame()
  local Frame = CreateFrame("Frame");
  Frame:SetWidth(413);
  Frame:SetHeight(298);
  Frame:SetBackdrop({
    ["bgFile"] = "Interface\\Tooltips\\UI-Tooltip-Background",
    ["edgeFile"] = "Interface\\Tooltips\\UI-Tooltip-Border",
    ["tile"] = true,
    ["insets"] = {
      ["top"] = 5,
      ["bottom"] = 5,
      ["left"] = 5,
      ["right"] = 5,
    },
    ["tileSize"] = 16,
    ["edgeSize"] = 16,
  });
  Frame:SetBackdropBorderColor(0.4, 0.4, 0.4);
  Frame:SetBackdropColor(0.5, 0.5, 0.5);
  
  Frame.Desc = self:Create_EditBox();
  Frame.Desc:SetParent(Frame);
  Frame.Desc:SetPoint("TOP", Frame, "TOP", 0, -15);
  Frame.Desc:SetWidth(160);
  Frame.Desc:SetHeight(26);
  Frame.Desc.Title:SetText(L["Description"]);
  Frame.Desc:SetScript("OnEnter", function(frame) self:ShowTooltip(L["Description"], L["Description_Desc"]) end);
  Frame.Desc:SetScript("OnEnterPressed", function(frame)
    if ( self.CurrentRule > 0 ) then
      self.db.profile.Rules[self.CurrentRule].Desc = frame:GetText();
    end
    frame:ClearFocus();
    self:Rules_RuleList_OnScroll();
  end);
  
  Frame.AvailableFilters = self:Create_RuleAvailableFiltersFrame();
  Frame.AvailableFilters:SetParent(Frame);
  Frame.AvailableFilters:SetPoint("TOPLEFT", Frame, "TOPLEFT", 5, -51);
  
  Frame.ActiveFilters = self:Create_RuleActiveFiltersFrame();
  Frame.ActiveFilters:SetParent(Frame);
  Frame.ActiveFilters:SetPoint("TOPLEFT", Frame.AvailableFilters, "TOPRIGHT", 0, 0);

  Frame.Add = CreateFrame("Button", nil, Frame, "UIPanelButtonTemplate");
  Frame.Add:SetPoint("TOPLEFT", Frame.AvailableFilters, "BOTTOMLEFT", 0, -5);
  Frame.Add:SetWidth(80);
  Frame.Add:SetHeight(21);
  Frame.Add:SetScript("OnEnter", function() self:ShowTooltip(L["Add"], L["Add this filter."]) end);
  Frame.Add:SetScript("OnLeave", function() GameTooltip:Hide() end);
  Frame.Add:SetScript("OnClick", function(frame, button)
    if ( self.CurrentRule > 0 and self.CurrentOptionFilter[1] == "Available" and self.CurrentOptionFilter[2] > 0 ) then
      self.RuleWidgets[self.CurrentOptionFilter[2]]:AddNewFilter()
      self:Rules_ActiveFilters_OnScroll()
    end
  end);
  Frame.Add:SetText(L["Add"]);
  Frame.Add:Hide();
  
  Frame.Remove = CreateFrame("Button", nil, Frame, "UIPanelButtonTemplate");
  Frame.Remove:SetPoint("TOPRIGHT", Frame.ActiveFilters, "BOTTOMRIGHT", 0, -5);
  Frame.Remove:SetWidth(80);
  Frame.Remove:SetHeight(21);
  Frame.Remove:SetScript("OnEnter", function() self:ShowTooltip(L["Remove"], L["Remove this filter."]) end);
  Frame.Remove:SetScript("OnLeave", function() GameTooltip:Hide() end);
  Frame.Remove:SetScript("OnClick", function(frame, button)
    self:RemoveFilter()
  end);
  Frame.Remove:SetText(L["Remove"]);
  Frame.Remove:Hide();
  
  Frame.Exception = CreateFrame("Button", nil, Frame, "UIPanelButtonTemplate");
  Frame.Exception:SetPoint("TOPRIGHT", Frame.Remove, "TOPLEFT", -5, 0);
  Frame.Exception:SetWidth(90);
  Frame.Exception:SetHeight(21);
  Frame.Exception:SetScript("OnEnter", function() self:ShowTooltip(L["Exception"], L["Change the exception status of this filter."]) end);
  Frame.Exception:SetScript("OnLeave", function() GameTooltip:Hide() end);
  Frame.Exception:SetScript("OnClick", function(frame, button)
    self:ChangeFilterException()
  end);
  Frame.Exception:SetText(L["Exception"]);
  Frame.Exception:Hide();
  
  return Frame;
end

function PassLoot:Create_EditBox()
  local Frame = CreateFrame("EditBox");
  Frame:SetBackdrop({
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
  Frame:SetBackdropColor(0, 0, 0, 0.95);
  Frame:EnableMouse(true);
  Frame:SetMaxLetters(200);
  -- Frame:SetHistoryLines(0);
  Frame:SetAutoFocus(false);
  Frame:SetFontObject("ChatFontNormal");
  Frame:SetTextInsets(6, 6, 6, 6);
  Frame:SetScript("OnLeave", function() GameTooltip:Hide() end);
  Frame:SetScript("OnEscapePressed", function() Frame:ClearFocus() end);
  Frame:SetScript("OnEditFocusGained", function() Frame:HighlightText() end);
  Frame:SetScript("OnEditFocusLost", function()
    Frame:HighlightText(0, 0)
    self:DisplayCurrentRule()
  end);
  
  Frame.Title = Frame:CreateFontString(nil, "BACKGROUND", "GameFontNormalSmall");
  Frame.Title:SetPoint("BOTTOMLEFT", Frame, "TOPLEFT", 3, 0);
  
  return Frame;
end

function PassLoot:Create_RuleAvailableFiltersFrame()
  local Frame = CreateFrame("Frame");
  Frame:SetWidth(190);
  Frame:SetHeight(137);
  Frame:SetBackdrop({
    ["bgFile"] = "Interface\\DialogFrame\\UI-DialogBox-Background",
    ["edgeFile"] = "Interface\\Tooltips\\UI-Tooltip-Border",
    ["tile"] = true,
    ["insets"] = {
      ["top"] = 2,
      ["bottom"] = 2,
      ["left"] = 2,
      ["right"] = 2,
    },
    ["tileSize"] = 16,
    ["edgeSize"] = 16,
  });

  Frame.Title = Frame:CreateFontString(nil, "BACKGROUND", "GameFontNormalSmall");
  Frame.Title:SetPoint("BOTTOMLEFT", Frame, "TOPLEFT", 3, 0);
  Frame.Title:SetText(L["Available Filters"]);

  Frame.ScrollFrame = CreateFrame("ScrollFrame", "PassLoot_AvailableFilters_Scroll", Frame, "FauxScrollFrameTemplate");
  Frame.ScrollFrame:SetPoint("TOPLEFT", Frame, "TOPLEFT", 0, -5);
  Frame.ScrollFrame:SetWidth(162);
  Frame.ScrollFrame:SetHeight(128);
  if ( select(4, GetBuildInfo()) >= 30000 ) then
    Frame.ScrollFrame:SetScript("OnVerticalScroll", function(frame, offset)
      FauxScrollFrame_OnVerticalScroll(frame, offset, 16, function() self:Rules_AvailableFilters_OnScroll() end)
    end);
  else
    Frame.ScrollFrame:SetScript("OnVerticalScroll", function()
      FauxScrollFrame_OnVerticalScroll(16, function() self:Rules_AvailableFilters_OnScroll() end)
    end);
  end
  
  Frame.ScrollLine1 = self:Create_AvailableFiltersScrollLine();
  Frame.ScrollLine1:SetParent(Frame);
  Frame.ScrollLine1:SetPoint("TOPLEFT", Frame.ScrollFrame, "TOPLEFT", 8, 0);
  Frame.ScrollLine1.LineNum = 1;
  for Index = 2, 8 do
    Frame["ScrollLine"..Index] = self:Create_AvailableFiltersScrollLine();
    Frame["ScrollLine"..Index]:SetParent(Frame);
    Frame["ScrollLine"..Index]:SetPoint("TOPLEFT", Frame["ScrollLine"..(Index - 1)], "BOTTOMLEFT");
    Frame["ScrollLine"..Index].LineNum = Index;
  end

  return Frame;
end

function PassLoot:Create_AvailableFiltersScrollLine()
  local Frame = CreateFrame("Button");
  Frame:SetWidth(162);
  Frame:SetHeight(16);
  Frame:SetScript("OnEnter", function(frame) self:ShowTooltip(L["Available Filters"], L["Available Filters_Desc"]) end);
  Frame:SetScript("OnLeave", function() GameTooltip:Hide() end);
  Frame:SetScript("OnClick", function(frame, button) self:SetCurrentOptionFilter("Available", Frame.LineNum, button) end);

  Frame.Highlight = Frame:CreateTexture(nil, "BACKGROUND");
  Frame.Highlight:SetTexture("Interface\\QuestFrame\\UI-QuestTitleHighlight");
  Frame.Highlight:SetAllPoints(Frame);
  Frame.Highlight:SetBlendMode("ADD");
  Frame.Highlight:Hide();

  Frame.Text = Frame:CreateFontString(nil, "BACKGROUND", "ChatFontNormal");
  Frame.Text:SetWidth(162);
  Frame.Text:SetHeight(16);
  Frame.Text:SetPoint("TOPLEFT", Frame, "TOPLEFT", 0, 0);
  Frame.Text:SetJustifyH("LEFT");
  return Frame;  
end

function PassLoot:Create_RuleActiveFiltersFrame()
  local Frame = CreateFrame("Frame");
  Frame:SetWidth(213);
  Frame:SetHeight(137);
  Frame:SetBackdrop({
    ["bgFile"] = "Interface\\DialogFrame\\UI-DialogBox-Background",
    ["edgeFile"] = "Interface\\Tooltips\\UI-Tooltip-Border",
    ["tile"] = true,
    ["insets"] = {
      ["top"] = 2,
      ["bottom"] = 2,
      ["left"] = 2,
      ["right"] = 2,
    },
    ["tileSize"] = 16,
    ["edgeSize"] = 16,
  });

  Frame.Title = Frame:CreateFontString(nil, "BACKGROUND", "GameFontNormalSmall");
  Frame.Title:SetPoint("BOTTOMLEFT", Frame, "TOPLEFT", 3, 0);
  Frame.Title:SetText(L["Active Filters"]);
  
  Frame.ScrollFrame = CreateFrame("ScrollFrame", "PassLoot_ActiveFilters_Scroll", Frame, "FauxScrollFrameTemplate");
  Frame.ScrollFrame:SetPoint("TOPLEFT", Frame, "TOPLEFT", 0, -5);
  Frame.ScrollFrame:SetWidth(185);
  Frame.ScrollFrame:SetHeight(128);
  if ( select(4, GetBuildInfo()) >= 30000 ) then
    Frame.ScrollFrame:SetScript("OnVerticalScroll", function(frame, offset)
      FauxScrollFrame_OnVerticalScroll(frame, offset, 16, function() self:Rules_ActiveFilters_OnScroll() end)
    end);
  else
    Frame.ScrollFrame:SetScript("OnVerticalScroll", function()
      FauxScrollFrame_OnVerticalScroll(16, function() self:Rules_ActiveFilters_OnScroll() end)
    end);
  end

  Frame.ScrollLine1 = self:Create_ActiveFiltersScrollLine();
  Frame.ScrollLine1:SetParent(Frame);
  Frame.ScrollLine1:SetPoint("TOPLEFT", Frame.ScrollFrame, "TOPLEFT", 8, 0);
  Frame.ScrollLine1.LineNum = 1;
  for Index = 2, 8 do
    Frame["ScrollLine"..Index] = self:Create_ActiveFiltersScrollLine();
    Frame["ScrollLine"..Index]:SetParent(Frame);
    Frame["ScrollLine"..Index]:SetPoint("TOPLEFT", Frame["ScrollLine"..(Index - 1)], "BOTTOMLEFT");
    Frame["ScrollLine"..Index].LineNum = Index;
  end

  return Frame;
end

function PassLoot:Create_ActiveFiltersScrollLine()
  local Frame = CreateFrame("Button");
  Frame:SetWidth(185);
  Frame:SetHeight(16);
  Frame:SetScript("OnEnter", function(frame) self:ShowTooltip(L["Active Filters"], L["Active Filters_Desc"]) end);
  Frame:SetScript("OnLeave", function() GameTooltip:Hide() end);
  Frame:SetScript("OnClick", function(frame, button) self:SetCurrentOptionFilter("Active", Frame.LineNum, button) end);
  Frame:RegisterForClicks("LeftButtonUp", "RightButtonUp");

  Frame.Highlight = Frame:CreateTexture(nil, "BACKGROUND");
  Frame.Highlight:SetTexture("Interface\\QuestFrame\\UI-QuestTitleHighlight");
  Frame.Highlight:SetAllPoints(Frame);
  Frame.Highlight:SetBlendMode("ADD");
  Frame.Highlight:Hide();

  Frame.Text = Frame:CreateFontString(nil, "BACKGROUND", "ChatFontNormal");
  Frame.Text:SetWidth(185);
  Frame.Text:SetHeight(16);
  Frame.Text:SetPoint("TOPLEFT", Frame, "TOPLEFT", 0, 0);
  Frame.Text:SetJustifyH("LEFT");
  return Frame;  
end
