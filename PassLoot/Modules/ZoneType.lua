local PassLoot = LibStub("AceAddon-3.0"):GetAddon("PassLoot");
local L = LibStub("AceLocale-3.0"):GetLocale("PassLoot_Modules");
local module = PassLoot:NewModule(L["Zone Type"])

module.Choices = {
  {
    ["Name"] = L["Any"],
    ["Group"] = {},
    ["Value"] = 1,
  },
  {
    ["Name"] = L["Outside"],
    ["Group"] = {},
    ["Value"] = 2,
  },
  {
    ["Name"] = L["Group"],
    ["Group"] = {
      {
        ["Name"] = L["Any"],
        ["Value"] = 3,
      },
      {
        ["Name"] = L["Normal"],
        ["Value"] = 4,
      },
      {
        ["Name"] = L["Heroic"],
        ["Value"] = 5,
      },
    },
  },
};
if ( select(4, GetBuildInfo()) < 30200 ) then
  module.Choices[4] = {
    ["Name"] = L["Raid"],
    ["Group"] = {
      {
        ["Name"] = L["Any"],
        ["Value"] = 6,
      },
      {
        ["Name"] = L["Normal"],
        ["Value"] = 7,
      },
      {
        ["Name"] = L["Heroic"],
        ["Value"] = 8,
      },
    },
  };
else
  module.Choices[4] = {
    ["Name"] = L["10 Man Raid"],
    ["Group"] = {
      {
        ["Name"] = L["Any"],
        ["Value"] = 6,
      },
      {
        ["Name"] = L["Normal"],
        ["Value"] = 7,
      },
      {
        ["Name"] = L["Heroic"],
        ["Value"] = 9,
      },
    },
  };
  module.Choices[5] = {
    ["Name"] = L["25 Man Raid"],
    ["Group"] = {
      {
        ["Name"] = L["Any"],
        ["Value"] = 10,
      },
      {
        ["Name"] = L["Normal"],
        ["Value"] = 8,
      },
      {
        ["Name"] = L["Heroic"],
        ["Value"] = 11,
      },
    },
  };
end
module.ConfigOptions_RuleDefaults = {
  -- { VariableName, Default },
  {
    "ZoneType",
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
      { "ZoneType", {} },
    };
    if ( Rule.ZoneType ) then
      Table[1][2][1] = { Rule.ZoneType, false };
    end
    return Table;
  end
  if ( FromVersion == 2 ) then
    local Table = {
      { "ZoneType", {} },
    };
    if ( type(Rule.ZoneType) == "table" ) then
      for Key, Value in ipairs(Rule.ZoneType) do
        Table[1][2][Key] = { Value, false };
      end
    end
    return Table;
  end
  return;
end

function module:CreateWidget()
  local Widget = CreateFrame("Frame", "PassLoot_Frames_Widgets_ZoneType", nil, "UIDropDownMenuTemplate");
  Widget:EnableMouse(true);
  Widget:SetHitRectInsets(15, 15, 0 ,0);
  _G[Widget:GetName().."Text"]:SetJustifyH("CENTER");
  if ( select(4, GetBuildInfo()) < 30000 ) then
    UIDropDownMenu_SetWidth(160, Widget);
  else
    UIDropDownMenu_SetWidth(Widget, 160);
  end
  Widget:SetScript("OnEnter", function() self:ShowTooltip(L["Zone Type"], L["Selected rule will only match items when you are in this type of zone."]) end);
  Widget:SetScript("OnLeave", function() GameTooltip:Hide() end);
  local Button = _G[Widget:GetName().."Button"];
  Button:SetScript("OnEnter", function() self:ShowTooltip(L["Zone Type"], L["Selected rule will only match items when you are in this type of zone."]) end);
  Button:SetScript("OnLeave", function() GameTooltip:Hide() end);
  local Title = Widget:CreateFontString(Widget:GetName().."Title", "BACKGROUND", "GameFontNormalSmall");
  Title:SetParent(Widget);
  Title:SetPoint("BOTTOMLEFT", Widget, "TOPLEFT", 20, 0);
  Title:SetText(L["Zone Type"]);
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
  Widget.PreferredPriority = 2;
  Widget.Info = {
    L["Zone Type"],
    L["Selected rule will only match items when you are in this type of zone."],
  };
  return Widget;
end
module.Widget = module:CreateWidget();

-- Local function to get the data and make sure it's valid data
function module.Widget:GetData(RuleNum)
  local Data = module:GetConfigOption("ZoneType", RuleNum);
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
    module:SetConfigOption("ZoneType", Data);
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
  module:SetConfigOption("ZoneType", Value);
end

function module.Widget:RemoveFilter(Index)
  local Value = self:GetData();
  table.remove(Value, Index);
  module:SetConfigOption("ZoneType", Value);
end

function module.Widget:DisplayWidget(Index)
  if ( Index ) then
    module.FilterIndex = Index;
  end
  local Value = self:GetData();
  if ( select(4, GetBuildInfo()) < 30000 ) then
    UIDropDownMenu_SetText(module:GetZoneTypeText(Value[module.FilterIndex][1]), module.Widget);
  else
    UIDropDownMenu_SetText(module.Widget, module:GetZoneTypeText(Value[module.FilterIndex][1]));
  end
end

function module.Widget:GetFilterText(Index)
  local Value = self:GetData();
  return module:GetZoneTypeText(Value[Index][1]);
end

function module.Widget:IsException(RuleNum, Index)
  local Data = self:GetData(RuleNum);
  return Data[Index][2];
end

function module.Widget:SetException(RuleNum, Index, Value)
  local Data = self:GetData(RuleNum);
  Data[Index][2] = Value;
  module:SetConfigOption("ZoneType", Data);
end

function module.Widget:SetMatch(ItemLink, Tooltip)
end

if ( select(4, GetBuildInfo()) < 30200 ) then
  function module.Widget:GetMatch(RuleNum, Index)
    local RuleValue = self:GetData(RuleNum);
    -- 1 = Any
    -- 2 = Outside
    -- 3 = Group - Any
    -- 4 = Group - Normal
    -- 5 = Group - Heroic
    -- 6 = Raid - Any
    -- 7 = Raid - Normal
    -- 8 = Raid - Heroic
    local InInstance, InstanceType = IsInInstance();
    -- InInstance is either nil or 1
    -- InstanceType is none, pvp, arena, party, raid
    
    -- GetInstanceDifficulty() Would be the correct function, but doesn't seem to always work properly.
    -- Set to normal, zone in, it returns 1 (normal)
    -- Zone out, set to heroic, zone in, it returns 2 (heroic)
    -- Zone out, set to normal, zone in, it returns 2 (heroic)  BUGGED HERE
    -- So, we will use GetCurrentDungeonDifficulty()  which returns the current 'setting', not the actual level of the instance
    -- However, if we are IN the instance, this should correspond to the level of the instance.
    -- Both functions return the same values.
    -- local Difficulty = GetInstanceDifficulty();  -- This one doesn't always work right.
    local Difficulty = GetCurrentDungeonDifficulty();
    -- Difficulty is 1, 2, 3
    
    local LookupTable = {
      -- RuleValue = { InInstance, InstanceType, Difficulty }
      [1] = { "ANY", "ANY", "ANY" },
      [2] = { nil, "none", "ANY" },
      [3] = { 1, "party", "ANY" },
      [4] = { 1, "party", 1 },
      [5] = { 1, "party", 2 },
      [6] = { 1, "raid", "ANY" },
      [7] = { 1, "raid", 1 },
      [8] = { 1, "raid", 2 },
    };
    if ( LookupTable[RuleValue[Index][1]][1] == "ANY" or LookupTable[RuleValue[Index][1]][1] == InInstance ) then
      if ( LookupTable[RuleValue[Index][1]][2] == "ANY" or LookupTable[RuleValue[Index][1]][2] == InstanceType ) then
        if ( LookupTable[RuleValue[Index][1]][3] == "ANY" or LookupTable[RuleValue[Index][1]][3] == Difficulty ) then
          return true;
        end
      end
    end
    module:Debug("ZoneType doesn't match");
    return false;
  end
elseif ( select(4, GetBuildInfo()) < 30300 ) then
  module.Widget.LookupTable = {
    -- 1 = Any
    -- 2 = Outside
    -- 3 = Group - Any
    -- 4 = Group - Normal
    -- 5 = Group - Heroic
    -- 6 = 10 Raid - Any
    -- 7 = 10 Raid - Normal
    -- 9 = 10 Raid - Heroic
    -- 10 = 25 Raid - Any
    -- 8 = 25 Raid - Normal
    -- 11 = 25 Raid - Heroic  
    [1] = function(InInstance, InstanceType, DungDiff, RaidDiff) return true end,
    [2] = function(InInstance, InstanceType, DungDiff, RaidDiff) return ( InInstance == nil and InstanceType == "none" ) end,
    [3] = function(InInstance, InstanceType, DungDiff, RaidDiff) return ( InInstance == 1 and InstanceType == "party" ) end,
    [4] = function(InInstance, InstanceType, DungDiff, RaidDiff) return ( InInstance == 1 and InstanceType == "party" and DungDiff == 1 ) end,
    [5] = function(InInstance, InstanceType, DungDiff, RaidDiff) return ( InInstance == 1 and InstanceType == "party" and DungDiff == 2 ) end,
    [6] = function(InInstance, InstanceType, DungDiff, RaidDiff) return ( InInstance == 1 and InstanceType == "raid" and ( RaidDiff == 1 or RaidDiff == 3 ) ) end,
    [7] = function(InInstance, InstanceType, DungDiff, RaidDiff) return ( InInstance == 1 and InstanceType == "raid" and RaidDiff == 1 ) end,
    [9] = function(InInstance, InstanceType, DungDiff, RaidDiff) return ( InInstance == 1 and InstanceType == "raid" and RaidDiff == 3 ) end,
    [10] = function(InInstance, InstanceType, DungDiff, RaidDiff) return ( InInstance == 1 and InstanceType == "raid" and ( RaidDiff == 2 or RaidDiff == 4 ) ) end,
    [8] = function(InInstance, InstanceType, DungDiff, RaidDiff) return ( InInstance == 1 and InstanceType == "raid" and RaidDiff == 2 ) end,
    [11] = function(InInstance, InstanceType, DungDiff, RaidDiff) return ( InInstance == 1 and InstanceType == "raid" and RaidDiff == 4 ) end,
  };

  function module.Widget:GetMatch(RuleNum, Index)
    local RuleValue = self:GetData(RuleNum);
    local InInstance, InstanceType = IsInInstance();
    -- InInstance is either nil or 1
    -- InstanceType is none, pvp, arena, party, raid
    local DungeonDifficulty, _ = GetDungeonDifficulty();
    -- 1st: Returns 1 for Normal, 2 for Heroic
    -- 2nd: unknown
    local RaidDifficulty, _ = GetRaidDifficulty();
    -- 1st: Returns 1 for 10 Player, 2 for 25 Player, 3 for 10 Player (Heroic), 4 for 25 Player (Heroic)
    -- 2nd: unknown
    
    -- GetInstanceDifficulty() Would be the correct function, but doesn't seem to always work properly. (at least in 3.1, don't know of 3.2)
    -- Set to normal, zone in, it returns 1 (normal)
    -- Zone out, set to heroic, zone in, it returns 2 (heroic)
    -- Zone out, set to normal, zone in, it returns 2 (heroic)  BUGGED HERE
    -- So, we will use GetCurrentDungeonDifficulty()  which returns the current 'setting', not the actual level of the instance
    -- However, if we are IN the instance, this should correspond to the level of the instance.
    -- Both functions return the same values.
    if ( self.LookupTable[RuleValue[Index][1]](InInstance, InstanceType, DungeonDifficulty, RaidDifficulty) ) then
      return true;
    end
    module:Debug("ZoneType doesn't match");
    return false;
  end
else
  module.Widget.LookupTable = {
    -- 1 = Any
    -- 2 = Outside
    -- 3 = Group - Any
    -- 4 = Group - Normal
    -- 5 = Group - Heroic
    -- 6 = 10 Raid - Any
    -- 7 = 10 Raid - Normal
    -- 9 = 10 Raid - Heroic
    -- 10 = 25 Raid - Any
    -- 8 = 25 Raid - Normal
    -- 11 = 25 Raid - Heroic  
    [1] = function(InInstance, InstanceType, Difficulty, MaxNumPlayers, DynamicDifficulty) return true end,
    [2] = function(InInstance, InstanceType, Difficulty, MaxNumPlayers, DynamicDifficulty) return ( InInstance == nil and InstanceType == "none" ) end,
    [3] = function(InInstance, InstanceType, Difficulty, MaxNumPlayers, DynamicDifficulty) return ( InInstance == 1 and InstanceType == "party" ) end,
    [4] = function(InInstance, InstanceType, Difficulty, MaxNumPlayers, DynamicDifficulty) return ( InInstance == 1 and InstanceType == "party" and Difficulty == 1 ) end,
    [5] = function(InInstance, InstanceType, Difficulty, MaxNumPlayers, DynamicDifficulty) return ( InInstance == 1 and InstanceType == "party" and Difficulty == 2 ) end,
    [6] = function(InInstance, InstanceType, Difficulty, MaxNumPlayers, DynamicDifficulty) return ( InInstance == 1 and InstanceType == "raid" and MaxNumPlayers == 10 ) end,
    [7] = function(InInstance, InstanceType, Difficulty, MaxNumPlayers, DynamicDifficulty) return ( InInstance == 1 and InstanceType == "raid" and MaxNumPlayers == 10 and Difficulty == 1 and DynamicDifficulty == 0 ) end,
    [9] = function(InInstance, InstanceType, Difficulty, MaxNumPlayers, DynamicDifficulty) return ( InInstance == 1 and InstanceType == "raid" and MaxNumPlayers == 10 and ( ( Difficulty == 3 and DynamicDifficulty == 0 ) or ( Difficulty == 1 and DynamicDifficulty == 1 ) ) ) end,
    [10] = function(InInstance, InstanceType, Difficulty, MaxNumPlayers, DynamicDifficulty) return ( InInstance == 1 and InstanceType == "raid" and MaxNumPlayers == 25 ) end,
    [8] = function(InInstance, InstanceType, Difficulty, MaxNumPlayers, DynamicDifficulty) return ( InInstance == 1 and InstanceType == "raid" and MaxNumPlayers == 25 and Difficulty == 2 and DynamicDifficulty == 0 ) end,
    [11] = function(InInstance, InstanceType, Difficulty, MaxNumPlayers, DynamicDifficulty) return ( InInstance == 1 and InstanceType == "raid" and MaxNumPlayers == 25 and ( ( Difficulty == 4 and DynamicDifficulty == 0 ) or ( Difficulty == 2 and DynamicDifficulty == 1 ) ) ) end,
  };

  function module.Widget:GetMatch(RuleNum, Index)
    local RuleValue = self:GetData(RuleNum);
    local InInstance, InstanceType = IsInInstance();
    -- InInstance is either nil or 1
    -- InstanceType is none, pvp, arena, party, raid
    local _, _, Difficulty, MaxNumPlayersText, MaxNumPlayers, DynamicDifficulty, DynamicInstance = GetInstanceInfo();
    -- DynamicDifficulty == 0 for normal, 1 for heroic
    if ( self.LookupTable[RuleValue[Index][1]](InInstance, InstanceType, Difficulty, MaxNumPlayers, DynamicDifficulty) ) then
      return true;
    end
    module:Debug("ZoneType doesn't match");
    return false;
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
      if ( #Value.Group > 0 ) then
        info.hasArrow = true;
        info.notClickable = false;
        info.value = {
          ["Key"] = Key,
          ["Value"] = self.Choices[Key].Group[1].Value,
        };
      else
        info.hasArrow = false;
        info.notClickable = false;
        info.value = {
          ["Key"] = Key,
          ["Value"] = Value.Value,
        };
      end
      UIDropDownMenu_AddButton(info, Level);
    end
  else
    for Key, Value in ipairs(self.Choices[UIDROPDOWNMENU_MENU_VALUE.Key].Group) do
      info.text = Value.Name;
      info.hasArrow = false;
      info.notClickable = false;
      info.value = {
        ["Key"] = UIDROPDOWNMENU_MENU_VALUE.Key,
        ["Value"] = Value.Value,
      };
      UIDropDownMenu_AddButton(info, Level);
    end
  end
end

function module:DropDown_OnClick(Frame)
  local Value = self.Widget:GetData();
  Value[self.FilterIndex][1] = Frame.value.Value;
  self:SetConfigOption("ZoneType", Value);
  if ( select(4, GetBuildInfo()) < 30000 ) then
    UIDropDownMenu_SetText(self:GetZoneTypeText(Frame.value.Value), Frame.owner);
  else
    UIDropDownMenu_SetText(Frame.owner, self:GetZoneTypeText(Frame.value.Value));
  end
  DropDownList1:Hide(); -- Nested dropdown buttons don't hide their parent menus on click.
end

function module:GetZoneTypeText(ZoneID)
  for Key, Value in ipairs(self.Choices) do
    if ( #Value.Group > 0 ) then
      for GroupKey, GroupValue in ipairs(Value.Group) do
        if ( GroupValue.Value == ZoneID ) then
          local ReturnValue = string.gsub(L["%zonetype% - %instancedifficulty%"], "%%zonetype%%", Value.Name);
          ReturnValue = string.gsub(ReturnValue, "%%instancedifficulty%%", GroupValue.Name);
          return ReturnValue;
        end
      end
    else
      if ( Value.Value == ZoneID ) then
        return Value.Name;
      end
    end
  end
  return "";
end
