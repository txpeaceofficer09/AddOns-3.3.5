local PassLoot = LibStub("AceAddon-3.0"):GetAddon("PassLoot");
local L = LibStub("AceLocale-3.0"):GetLocale("PassLoot_Modules");
local module = PassLoot:NewModule(L["Required Level"])

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
  {
    ["Name"] = L["Greater than"],
    ["Text"] = L["Greater than %num%"],
    ["Value"] = 5,
  },
};
module.ConfigOptions_RuleDefaults = {
  -- { VariableName, Default },
  {
    "RequiredLevel",
    {
      -- [1] = { Operator, Comparison, Exception }
    },
  },
};
module.NewFilterValue_LogicalOperator = 1;
module.NewFilterValue_Comparison = 0;

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
      { "RequiredLevel", {} },
    };
    if ( type(Rule.RequiredLevel) == "table" ) then
      for Key, Value in ipairs(Rule.RequiredLevel) do
        Table[1][2][Key] = { Value[1], Value[2], false };
      end
    end
    return Table;
  end
  return;
end

function module:CreateWidget()
  local DropDown = CreateFrame("Frame", "PassLoot_Frames_Widgets_RequiredLevelComparison", nil, "UIDropDownMenuTemplate");
  DropDown:EnableMouse(true);
  DropDown:SetHitRectInsets(15, 15, 0 ,0);
  _G[DropDown:GetName().."Text"]:SetJustifyH("CENTER");
  if ( select(4, GetBuildInfo()) < 30000 ) then
    UIDropDownMenu_SetWidth(200, DropDown);
  else
    UIDropDownMenu_SetWidth(DropDown, 200);
  end
  DropDown:SetScript("OnEnter", function() self:ShowTooltip(L["Required Level"], L["RequiredLevel_DropDownTooltipDesc"]) end);
  DropDown:SetScript("OnLeave", function() GameTooltip:Hide() end);
  local DropDownButton = _G[DropDown:GetName().."Button"];
  DropDownButton:SetScript("OnEnter", function() self:ShowTooltip(L["Required Level"], L["RequiredLevel_DropDownTooltipDesc"]) end);
  DropDownButton:SetScript("OnLeave", function() GameTooltip:Hide() end);
  local DropDownTitle = DropDown:CreateFontString(DropDown:GetName().."Title", "BACKGROUND", "GameFontNormalSmall");
  DropDownTitle:SetParent(DropDown);
  DropDownTitle:SetPoint("BOTTOMLEFT", DropDown, "TOPLEFT", 20, 0);
  DropDownTitle:SetText(L["Required Level"]);
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
  DropDown.PreferredPriority = 12;
  DropDown.Info = {
    L["Required Level"],
    L["Selected rule will only match items when comparing the required level to this."],
  };

  local DropDownEditBox = CreateFrame("EditBox", "PassLoot_Frames_Widgets_RequiredLevelDropDownEditBox");
  DropDownEditBox:Hide();
  DropDownEditBox:SetParent(nil);
  DropDownEditBox:SetFontObject(ChatFontNormal);
  DropDownEditBox:SetMaxLetters(50);  -- Was 8
  DropDownEditBox:SetAutoFocus(true);
  DropDownEditBox:SetScript("OnEnter", function(Frame)
    CloseDropDownMenus(Frame:GetParent():GetParent():GetID() + 1);
    UIDropDownMenu_StopCounting(Frame:GetParent():GetParent());
  end);
  DropDownEditBox:SetScript("OnEnterPressed", function(Frame)
    self:DropDown_OnClick(Frame)  -- Calls Hide(), ClearAllPoints() and SetParent(nil)
    -- CloseMenus() only hides the DropDownList2, not this object, and even tho i will set parent to nil, i might as well cover bases
    CloseMenus();
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
module.Widget, module.DropDownEditBox = module:CreateWidget();

-- Local function to get the data and make sure it's valid data
function module.Widget:GetData(RuleNum)
  local Data = module:GetConfigOption("RequiredLevel", RuleNum);
  local Changed = false;
  if ( not Data or type(Data) ~= "table" ) then
    Data = {};
    Changed = true;
  end
  for Key, Value in ipairs(Data) do
    if ( type(Value) ~= "table" or type(Value[1]) ~= "number" or (type(Value[2]) ~= "number" and type(Value[2]) ~= "string") ) then
      Data[Key] = {
        module.NewFilterValue_LogicalOperator,
        module.NewFilterValue_Comparison,
        false
      };
      Changed = true;
    end
  end
  if ( Changed ) then
    module:SetConfigOption("RequiredLevel", Data);
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
    module.NewFilterValue_LogicalOperator,
    module.NewFilterValue_Comparison,
    false
  };
  table.insert(Value, NewTable);
  module:SetConfigOption("RequiredLevel", Value);
end

function module.Widget:RemoveFilter(Index)
  local Value = self:GetData();
  table.remove(Value, Index);
  module:SetConfigOption("RequiredLevel", Value);
end

function module.Widget:DisplayWidget(Index)
  if ( Index ) then
    module.FilterIndex = Index;
  end
  local Value = self:GetData();
  local Value_LogicalOperator = Value[module.FilterIndex][1]
  local Value_Comparison = Value[module.FilterIndex][2]
  if ( select(4, GetBuildInfo()) < 30000 ) then
    UIDropDownMenu_SetText(module:GetRequiredLevelText(Value_LogicalOperator, Value_Comparison), module.Widget);
  else
    UIDropDownMenu_SetText(module.Widget, module:GetRequiredLevelText(Value_LogicalOperator, Value_Comparison));
  end
end

function module.Widget:GetFilterText(Index)
  local Value = self:GetData();
  local LogicalOperator = Value[Index][1];
  local Comparison = Value[Index][2];
  local Text = module:GetRequiredLevelText(LogicalOperator, Comparison);
  return Text;
end

function module.Widget:IsException(RuleNum, Index)
  local Data = self:GetData(RuleNum);
  return Data[Index][3];
end

function module.Widget:SetException(RuleNum, Index, Value)
  local Data = self:GetData(RuleNum);
  Data[Index][3] = Value;
  module:SetConfigOption("RequiredLevel", Data);
end

function module.Widget:SetMatch(ItemLink, Tooltip)
  _, _, _, _, module.CurrentMatch = GetItemInfo(ItemLink)
  module.CurrentMatch = module.CurrentMatch or 0;
  module:Debug("Required Level: "..(module.CurrentMatch));
end

function module.Widget:GetMatch(RuleNum, Index)
  local Value = self:GetData(RuleNum);
  local LogicalOperator = Value[Index][1];
  local Comparison = self:Evaluate(Value[Index][2]);
  if ( not Comparison ) then
    return false;
  end
  if ( LogicalOperator > 1 ) then
    if ( LogicalOperator == 2 ) then -- Equal To
      if ( module.CurrentMatch ~= Comparison ) then
        module:Debug("RequiredLevel ("..module.CurrentMatch..") ~= "..Comparison);
        return false;
      end
    elseif ( LogicalOperator == 3 ) then -- Not Equal To
      if ( module.CurrentMatch == Comparison ) then
        module:Debug("RequiredLevel ("..module.CurrentMatch..") == "..Comparison);
        return false;
      end
    elseif ( LogicalOperator == 4 ) then -- Less than
      if ( module.CurrentMatch >= Comparison ) then
        module:Debug("RequiredLevel ("..module.CurrentMatch..") >= "..Comparison);
        return false;
      end
    elseif ( LogicalOperator == 5 ) then -- Greater than
      if ( module.CurrentMatch <= Comparison ) then
        module:Debug("RequiredLevel ("..module.CurrentMatch..") <= "..Comparison);
        return false;
      end
    end
  end
  return true;
end

-- Create an environment for the functions, so they can't access globals and such.
-- We can also add our variables here, so we don't have to string.gsub
module.Widget.Environment = {
  [L["level"]] = 0,
};
module.Widget.CachedFunc, module.Widget.CachedError = {}, {}; -- A list of functions and errors we have already tried loading
function module.Widget:Evaluate(Logic)
  self.Environment[L["level"]] = UnitLevel("player");
  local Function, Error = self.CachedFunc[Logic], self.CachedError[Logic];
  if ( not Function and not Error ) then
    Function, Error = loadstring("return "..Logic);
    self.CachedFunc[Logic], self.CachedError[Logic] = Function, Error;
  end
  if ( Function and not Error ) then
    setfenv(Function, self.Environment);  -- Limit what the loaded logic string can access
    local Success, ReturnValue = pcall(Function);  -- Catch errors.
    if ( Success ) then 
      return ReturnValue;
    else
      self:Debug("Could not evaluate "..(Logic or "").." - "..(ReturnValue or ""));
      return;
    end
  else
    self:Debug("Could not evaluate "..(Logic or "").." - "..(Error or ""));
  end
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
    local Value = self.Widget:GetData();
    self.DropDownEditBox:SetText(Value[self.FilterIndex][2]);
    self.DropDownEditBox:Show();
    self.DropDownEditBox:SetFocus();
    self.DropDownEditBox:HighlightText();
  end
end

function module:DropDown_OnClick(Frame)
  local Value = self.Widget:GetData();
  local LogicalOperator = Frame.value;
  local Comparison = Value[self.FilterIndex][2];
  if ( Frame:GetName() == self.DropDownEditBox:GetName() ) then
    Comparison = Frame:GetText() or "";
    -- Comparison = tonumber(Frame:GetText()) or 0;
    -- if ( Comparison < -1 ) then
      -- Comparison = 0;
    -- end
    -- if ( Comparison >= 0 ) then
      -- Comparison = math.floor(Comparison + 0.5);
    -- else
      -- Comparison = math.ceil(Comparison - 0.5);
    -- end
  end
  Value[self.FilterIndex][1] = LogicalOperator;
  Value[self.FilterIndex][2] = Comparison;
  self:SetConfigOption("RequiredLevel", Value);
  if ( select(4, GetBuildInfo()) < 30000 ) then
    UIDropDownMenu_SetText(self:GetRequiredLevelText(LogicalOperator, Comparison), Frame.owner);
  else
    UIDropDownMenu_SetText(Frame.owner, self:GetRequiredLevelText(LogicalOperator, Comparison));
  end
  self.DropDownEditBox:Hide();
  self.DropDownEditBox:ClearAllPoints();
  self.DropDownEditBox:SetParent(nil);
end

function module:GetRequiredLevelText(LogicalOperator, Comparison)
  -- if ( Comparison == -1 ) then
    -- Comparison = string.gsub(L["My Level (%num%)"], "%%num%%", UnitLevel("player"));
  -- end
  for Key, Value in ipairs(self.Choices) do
    if ( Value.Value == LogicalOperator ) then
      return string.gsub(Value.Text, "%%num%%", Comparison);
    end
  end
end
