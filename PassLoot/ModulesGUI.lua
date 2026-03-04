local PassLoot = LibStub("AceAddon-3.0"):GetAddon("PassLoot");
local L = LibStub("AceLocale-3.0"):GetLocale("PassLoot");

-- Not using AceGUI until I decide to make my own multi-tier drop down menu widget.
-- local AceGUI = LibStub("AceGUI-3.0");

PassLoot.Prototypes = {};
PassLoot.PluginInfo = {};

-- Unused.  We can let the module unregister variables, and remove widgets from the filter list.
-- function PassLoot.Prototypes:OnDisable()
  -- ChatFrame1:AddMessage("OnDisable() Called for "..self:GetName());
  -- self:UnregisterDefaultVariables();
  -- self:RemoveWidgets();
-- end

-- Registers the default variables
-- RuleVariables = {
  -- { VariableName, Default},
  -- { VariableName, Default},
-- };
function PassLoot.Prototypes:RegisterDefaultVariables(RuleVariables)
  local Module = self:GetName();
  PassLoot.PluginInfo[Module] = PassLoot.PluginInfo[Module] or {};
  if ( type(RuleVariables) ~= "table" ) then
    return;
  end
  for NewKey, NewValue in pairs(RuleVariables) do
    if ( type(NewValue) ~= "table" ) then
      return;
    end
    for VariableKey, VariableValue in pairs(PassLoot.DefaultTemplate) do
      if ( NewValue[1] == VariableValue[1] ) then
        return;
      end
    end
  end
  PassLoot.PluginInfo[Module].RuleVariables = PassLoot.PluginInfo[Module].RuleVariables or {};
  for Key, Value in pairs(RuleVariables) do
    -- table.insert(PassLoot.PluginInfo[self:GetName()].RuleVariables, { Value[1], PassLoot:CopyTable(Value[2]) });
    PassLoot.PluginInfo[self:GetName()].RuleVariables[Value[1]] = true;
    -- table.sort(PassLoot.PluginInfo[self:GetName()].RuleVariables, function(A, B) if ( A[1] < B[1] ) then return true end end);
    table.insert(PassLoot.DefaultTemplate, { Value[1], PassLoot:CopyTable(Value[2]) });
  end
end

function PassLoot.Prototypes:UnregisterDefaultVariables()
  local Module = self:GetName();
  PassLoot.PluginInfo[Module] = PassLoot.PluginInfo[Module] or {};
  PassLoot.PluginInfo[Module].RuleVariables = PassLoot.PluginInfo[Module].RuleVariables or {};
  for RuleKey, RuleValue in ipairs(PassLoot.PluginInfo[Module].RuleVariables) do
    for DefaultKey, DefaultValue in ipairs(PassLoot.DefaultTemplate) do
      if ( DefaultValue[1] == RuleKey ) then
        table.remove(PassLoot.DefaultTemplate, DefaultKey);
        break;
      end
    end
  end
end

-- Each Widget is a filter for PassLoot.
-- Each Filter must have: (Index refers to the index of multiple filters for the same rule)
-- GetNumFilters(RuleNum) -- Returns the number of filters for the rule
-- AddNewFilter() -- Creates a new filter for the currently selected rule
-- RemoveFilter(Index) -- Removes a filter from the currently selected rule at Index
-- DisplayWidget(Index) -- Called when the Filter is selected from the active filters list.  (Needs to prepare/update the widget's display, does not need to do Widget:Show())
-- GetFilterText(Index) -- Gets text to be displayed for the active filter scroll frame for the Filter's Index
-- SetMatch(ItemLink, Tooltip) -- Called when a loot window is popped up with the itemlink and tooltip frame of the item.
-- GetMatch(RuleNum, Index) -- Needs to return true/false if the loot matches this filter's index.  DO NOT RETURN INVERSE RESULTS IF EXCEPTION IS SET
-- IsException(RuleNum, Index)  -- If the filter is an exception.
-- SetException(RuleNum, Index, true/false) -- Set the exception.
function PassLoot.Prototypes:AddWidget(Widget)
  if ( type(Widget) ~= "table"
  or not Widget.GetNumFilters
  or not Widget.AddNewFilter
  or not Widget.RemoveFilter
  or not Widget.DisplayWidget
  or not Widget.GetFilterText
  or not Widget.SetMatch
  or not Widget.GetMatch
  or type(Widget.Info) ~= "table" ) then
    -- 1 = Module Text to display in filter list
    -- 2 = Tooltip info
    -- 3 = Module this belongs to.  (Set here)
    return;
  end
  if ( not Widget.IsException or not Widget.SetException ) then
    Widget.IsException = PassLoot.TempIsException;
    Widget.SetException = PassLoot.TempSetException;
  end
  PassLoot.RuleWidgets = PassLoot.RuleWidgets or {};
  for Key, Value in pairs(PassLoot.RuleWidgets) do
    if ( Value == Widget ) then
      return;
    end
  end
  local Module = self:GetName();
  Widget.Info[3] = Module;
  Widget.PreferredPriority = Widget.PreferredPriority or 1000;
  -- Widget.ModuleOwner = self:GetName();
  table.insert(PassLoot.RuleWidgets, Widget);
  -- PassLoot:Settings_ScrollFrame_Update();
  -- table.sort(PassLoot.RuleWidgets, function(a, b) if ( a.PreferredPriority < b.PreferredPriority ) then return true end end);
  table.sort(PassLoot.RuleWidgets, function(a, b) if ( (a.Info[3] < b.Info[3]) or ((a.Info[3] == b.Info[3]) and (a.PreferredPriority < b.PreferredPriority)) ) then return true end end);
  Widget:ClearAllPoints();
  Widget:SetPoint("TOP", PassLoot.RulesFrame.Settings, "BOTTOM", ((Widget.XPaddingLeft or 0) - (Widget.XPaddingRight or 0)) / 2, 83 - (Widget.YPaddingTop or 0));
  Widget:SetParent(PassLoot.RulesFrame.Settings);
  Widget:Hide();
  PassLoot.PluginInfo[Module] = PassLoot.PluginInfo[Module] or {};
  PassLoot.PluginInfo[Module].RuleWidgets = PassLoot.PluginInfo[Module].RuleWidgets or {};
  for Key, Value in pairs(PassLoot.PluginInfo[Module].RuleWidgets) do
    if ( Value == Widget ) then
      return;
    end
  end
  table.insert(PassLoot.PluginInfo[Module].RuleWidgets, Widget);
end

function PassLoot.Prototypes:RemoveWidgets()
  local Module = self:GetName();
  PassLoot.PluginInfo[Module] = PassLoot.PluginInfo[Module] or {};
  PassLoot.PluginInfo[Module].RuleWidgets = PassLoot.PluginInfo[Module].RuleWidgets or {};
  for PluginKey, PluginValue in pairs(PassLoot.PluginInfo[Module].RuleWidgets) do
    for RuleKey, RuleValue in pairs(PassLoot.RuleWidgets) do
      if ( RuleValue == PluginValue ) then
        PluginValue:Hide();
        PluginValue:SetParent(nil);
        table.remove(PassLoot.RuleWidgets, RuleKey);
        break;
      end
    end
  end
end

function PassLoot.Prototypes:AddModuleOptionTable(TableName, Table)
  local Module = self:GetName();
  if ( not PassLoot.OptionsTable.args.Modules.args[Module].args[TableName] ) then
    PassLoot.OptionsTable.args.Modules.args[Module].args[TableName] = Table;
  end
end

function PassLoot.Prototypes:RemoveModuleOptionTable(TableName, Table)
  local Module = self:GetName();
  if ( PassLoot.OptionsTable.args.Modules.args[Module].args[TableName] ) then
    PassLoot.OptionsTable.args.Modules.args[Module].args[TableName] = nil;
  end
end

-- Sets a variable in the rule.  This function verifies that the variable being set is registered to the module.
function PassLoot.Prototypes:SetConfigOption(Variable, Value, RuleNum)
  local Module = self:GetName();
  RuleNum = RuleNum or PassLoot.CurrentRule
  if ( RuleNum > 0
  and Module
  and PassLoot.PluginInfo[Module]
  and PassLoot.PluginInfo[Module].RuleVariables ) then
    if ( PassLoot.PluginInfo[Module].RuleVariables[Variable] ) then
      PassLoot.db.profile.Rules[RuleNum][Variable] = Value;
      PassLoot:Rules_ActiveFilters_OnScroll();
      return;
    end
  end
end

-- Gets a variable from a rule.  This function does not verify that the variable belongs to the module.
function PassLoot.Prototypes:GetConfigOption(Variable, RuleNum)
  RuleNum = RuleNum or PassLoot.CurrentRule;
  if ( RuleNum > 0 ) then
    return PassLoot.db.profile.Rules[RuleNum][Variable];
  end
end

function PassLoot.Prototypes:SetGlobalVariable(Variable, Value)
  local Module = self:GetName();
  if ( Module
  and PassLoot.db.global.Modules
  and PassLoot.db.global.Modules[Module] ) then
    PassLoot.db.global.Modules[Module].Vars = PassLoot.db.global.Modules[Module].Vars or {};
    PassLoot.db.global.Modules[Module].Vars[Variable] = Value;
  end
end

function PassLoot.Prototypes:GetGlobalVariable(Variable)
  local Module = self:GetName();
  if ( Module
  and PassLoot.db.global.Modules
  and PassLoot.db.global.Modules[Module]
  and PassLoot.db.global.Modules[Module].Vars ) then
    return PassLoot.db.global.Modules[Module].Vars[Variable];
  end
end

function PassLoot.Prototypes:SetProfileVariable(Variable, Value)
  local Module = self:GetName();
  if ( Module
  and PassLoot.db.profile.Modules
  and PassLoot.db.profile.Modules[Module] ) then
    PassLoot.db.profile.Modules[Module].ProfileVars = PassLoot.db.profile.Modules[Module].ProfileVars or {};
    PassLoot.db.profile.Modules[Module].ProfileVars[Variable] = Value;
  end
end

function PassLoot.Prototypes:GetProfileVariable(Variable)
  local Module = self:GetName();
  if ( Module
  and PassLoot.db.profile.Modules
  and PassLoot.db.profile.Modules[Module]
  and PassLoot.db.profile.Modules[Module].ProfileVars ) then
    return PassLoot.db.profile.Modules[Module].ProfileVars[Variable];
  end
end

PassLoot.Prototypes.ShowTooltip = PassLoot.ShowTooltip;

-- I am going to use this function to scroll text boxes to the left instead of SetCursorPosition()
-- SetCursorPosition(0) requires I ClearFocus(), which will create a loop that I don't really like.
PassLoot.Prototypes.ScrollLeft = PassLoot.ScrollLeft;

function PassLoot.Prototypes:Debug(...)
  local DebugLine, Counter;
  if ( PassLoot.DebugVar == true ) then
    if ( self.GetName ) then
      DebugLine = "("..(self:GetName() or "")..") ";
    else
      DebugLine = "";
    end
    for Counter = 1, select("#", ...) do
      DebugLine = DebugLine..select(Counter, ...);
    end
    -- PassLoot:Print(_G[PassLoot.db.profile.OutputFrame], DebugLine);
    PassLoot:Pour("|cff33ff99PassLoot|r: "..DebugLine);
  end
end

-- CheckDBVersion()
-- ModuleVersion - The version of the module calling this function.
-- CallbackFunc - Function to call to get a new value.
-- If the ModuleVersion is newer, then we will iterate over every rule.  We will call the callback function with the entire rule.
-- This will allow the update to get any variable data it wants from the rule to make decisions on.
-- ReturnData = {
  -- { VariableToBeSet, ValueToBeSet },
  -- { VariableToBeSet, ValueToBeSet },
-- }
-- All variables to be set will be verified that they are variables allowed to be set.
function PassLoot.Prototypes:CheckDBVersion(ModuleVersion, CallbackFunc)
  local Module = self:GetName();
  if ( Module
  and PassLoot.PluginInfo[Module]
  and PassLoot.PluginInfo[Module].RuleVariables
  and ModuleVersion
  and ( type(CallbackFunc) == "string" or type(CallbackFunc) == "function" ) ) then
    local Version, ReturnData, VariableList
    PassLoot.db.global.Modules = PassLoot.db.global.Modules or {};
    PassLoot.db.global.Modules[Module] = PassLoot.db.global.Modules[Module] or {};
    PassLoot.db.global.Modules[Module].Version = PassLoot.db.global.Modules[Module].Version or 1;
    Version = PassLoot.db.global.Modules[Module].Version;
    if ( Version >= ModuleVersion ) then
      return;
    end
    PassLoot:Debug("Upgrading: "..Module.." from "..Version.." to "..ModuleVersion);
    VariableList = PassLoot.PluginInfo[Module].RuleVariables;  -- Use only the variables that were defined.
    -- Going to add a possible future upgrade module function.. I shouldn't mess with too many things at once.
    -- PassLoot:IterateRules("UpgradeModule", Module, CallbackFunc, Version, VariableList);
    if ( PassLootDB and PassLootDB.profiles ) then
      for ProfileKey, ProfileValue in pairs(PassLootDB.profiles) do
        if ( ProfileValue.Rules ) then
          for RuleKey, RuleValue in ipairs(ProfileValue.Rules) do
            if ( type(CallbackFunc) == "string" ) then
              ReturnData = self[CallbackFunc](self, Version, RuleValue);
            elseif ( type(CallbackFunc) == "function" ) then
              ReturnData = CallbackFunc(Version, RuleValue);
            end
            if ( ReturnData and type(ReturnData) == "table" ) then
              for ReturnKey, ReturnValue in pairs(ReturnData) do
                if ( type(ReturnValue) == "table" and ReturnValue[1] and VariableList[ReturnValue[1]] ) then
                  PassLootDB.profiles[ProfileKey].Rules[RuleKey][ReturnValue[1]] = ReturnValue[2];
                end
              end -- ReturnKey, ReturnValue
            end
          end -- RuleKey, RuleValue
        end -- if ProfileValue.Rules
      end -- ProfileKey, ProfileValue
    elseif ( self.db and self.db.profile and self.db.profile.Rules ) then
      for RuleKey, RuleValue in ipairs(self.db.profile.Rules) do
        if ( type(CallbackFunc) == "string" ) then
          ReturnData = self[CallbackFunc](self, Version, RuleValue);
        elseif ( type(CallbackFunc) == "function" ) then
          ReturnData = CallbackFunc(Version, RuleValue);
        end
        if ( ReturnData and type(ReturnData) == "table" ) then
          for ReturnKey, ReturnValue in pairs(ReturnData) do
            if ( type(ReturnValue) == "table" and ReturnValue[1] and VariableList[ReturnValue[1]] ) then
              self.db.profile.Rules[RuleKey][ReturnValue[1]] = ReturnValue[2];
            end
          end -- ReturnKey, ReturnValue
        end
      end -- RuleKey, RuleValue
    end
    PassLoot.db.global.Modules[Module].Version = ModuleVersion;
  end
end

PassLoot:SetDefaultModulePrototype(PassLoot.Prototypes);
PassLoot:SetDefaultModuleState(false);

--[=[
function PassLoot:UpgradeModule(RuleData, Module, CallbackFunc, Version, VariableList)
  local ReturnData;
  if ( type(CallbackFunc) == "string" ) then
    ReturnData = Module[CallbackFunc](Module, Version, RuleData);
  elseif ( type(CallbackFunc) == "function" ) then
    ReturnData = CallbackFunc(Version, RuleData);
  end
  if ( ReturnData and type(ReturnData) == "table" ) then
    for ReturnKey, ReturnValue in pairs(ReturnData) do
      if ( type(ReturnValue) == "table" and ReturnValue[1] and VariableList[ReturnValue[1]] ) then
        RuleData[ReturnValue[1]] = ReturnValue[2];
      end
    end -- ReturnKey, ReturnValue
  end
end
]=]

function PassLoot:IsModuleEnabled(Info)
  return self.modules[Info.arg].enabledState;
end

function PassLoot:SetModuleEnabled(Info, Value)
  local Module = Info.arg;
  self.db.profile.Modules[Module].Status = Value;
  if ( Value ) then
    self:EnableModule(Module);
    self:CheckRuleTables();
  else
    self:DisableModule(Module);
  end
  self:Rules_RuleList_OnScroll();
  self:DisplayCurrentRule();
  -- self:CountEnabledModules();
end

local Modules_ScrollFrame_RowSpacing = 3;
local Modules_ScrollFrame_InitialHeight = 10;
function PassLoot:SetupModulesOptionsTables()
  local Module;
  for Key, Value in self:IterateModules() do
    Module = Value:GetName();
    self.db.profile.Modules[Module] = self.db.profile.Modules[Module] or {};
    if ( not self.OptionsTable.args.Modules.args[Module] ) then
      self.OptionsTable.args.Modules.args[Module] = {
        ["name"] = Module,
        ["type"] = "group",
        ["inline"] = true,
        ["args"] = {
          ["Enabled"] = {
            ["name"] = L["Enabled"],
            ["desc"] = L["Enable / Disable this module."],
            ["type"] = "toggle",
            ["order"] = 0,
            ["get"] = "IsModuleEnabled",
            ["set"] = "SetModuleEnabled",
            ["arg"] = Module,
          },
        },
      };
    end
  end
end

function PassLoot:TempIsException()
  return false;
end

function PassLoot:TempSetException()
end
