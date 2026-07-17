local PassLoot = LibStub("AceAddon-3.0"):GetAddon("PassLoot");
local L = LibStub("AceLocale-3.0"):GetLocale("PassLoot_Modules");
local module = PassLoot:NewModule(L["Class Spec"]);
local btalent, BT;

if ( not LibStub("LibBabble-TalentTree-3.0", true) ) then
  return;
end

function module:SetupValues()
  btalent = LibStub("LibBabble-TalentTree-3.0");
  BT = btalent:GetUnstrictLookupTable();
  module.Choices = {
    {
      ["Name"] = L["Any"],
      ["Value"] = 1,
      ["Group"] = {},
    },
    {
      ["Name"] = LOCALIZED_CLASS_NAMES_MALE.DEATHKNIGHT,
      ["Value"] = 2,
      ["Group"] = {
        {
          ["Name"] = L["Any"],
          ["Value"] = 1,
        },
        {
          ["Name"] = NONE,
          ["Value"] = 2,
        },
        {
          ["Name"] = (BT["Blood"] or "Blood"),
          ["Value"] = 3,
        },
        {
          ["Name"] = (BT["Frost"] or "Frost"),
          ["Value"] = 4,
        },
        {
          ["Name"] = (BT["Unholy"] or "Unholy"),
          ["Value"] = 5,
        },
        {
          ["Name"] = (BT["Blood"] or "Blood").." / "..(BT["Frost"] or "Frost"),
          ["Value"] = 6,
        },
        {
          ["Name"] = (BT["Frost"] or "Frost").." / "..(BT["Unholy"] or "Unholy"),
          ["Value"] = 7,
        },
        {
          ["Name"] = (BT["Blood"] or "Blood").." / "..(BT["Unholy"] or "Unholy"),
          ["Value"] = 8,
        },
        {
          ["Name"] = L["Hybrid"],
          ["Value"] = 9,
        },
      },
    },
    {
      ["Name"] = LOCALIZED_CLASS_NAMES_MALE.DRUID,
      ["Value"] = 3,
      ["Group"] = {
        {
          ["Name"] = L["Any"],
          ["Value"] = 1,
        },
        {
          ["Name"] = NONE,
          ["Value"] = 2,
        },
        {
          ["Name"] = (BT["Balance"] or "Balance"),
          ["Value"] = 3,
        },
        {
          ["Name"] = (BT["Feral Combat"] or "Feral Combat"),
          ["Value"] = 4,
        },
        {
          ["Name"] = (BT["Restoration"] or "Restoration"),
          ["Value"] = 5,
        },
        {
          ["Name"] = (BT["Balance"] or "Balance").." / "..(BT["Feral Combat"] or "Feral Combat"),
          ["Value"] = 6,
        },
        {
          ["Name"] = (BT["Feral Combat"] or "Feral Combat").." / "..(BT["Restoration"] or "Restoration"),
          ["Value"] = 7,
        },
        {
          ["Name"] = (BT["Balance"] or "Balance").." / "..(BT["Restoration"] or "Restoration"),
          ["Value"] = 8,
        },
        {
          ["Name"] = L["Hybrid"],
          ["Value"] = 9,
        },
      },
    },
    {
      ["Name"] = LOCALIZED_CLASS_NAMES_MALE.HUNTER,
      ["Value"] = 4,
      ["Group"] = {
        {
          ["Name"] = L["Any"],
          ["Value"] = 1,
        },
        {
          ["Name"] = NONE,
          ["Value"] = 2,
        },
        {
          ["Name"] = (BT["Beast Mastery"] or "Beast Mastery"),
          ["Value"] = 3,
        },
        {
          ["Name"] = (BT["Marksmanship"] or "Marksmanship"),
          ["Value"] = 4,
        },
        {
          ["Name"] = (BT["Survival"] or "Survival"),
          ["Value"] = 5,
        },
        {
          ["Name"] = (BT["Beast Mastery"] or "Beast Mastery").." / "..(BT["Marksmanship"] or "Marksmanship"),
          ["Value"] = 6,
        },
        {
          ["Name"] = (BT["Marksmanship"] or "Marksmanship").." / "..(BT["Survival"] or "Survival"),
          ["Value"] = 7,
        },
        {
          ["Name"] = (BT["Beast Mastery"] or "Beast Mastery").." / "..(BT["Survival"] or "Survival"),
          ["Value"] = 8,
        },
        {
          ["Name"] = L["Hybrid"],
          ["Value"] = 9,
        },
      },
    },
    {
      ["Name"] = LOCALIZED_CLASS_NAMES_MALE.MAGE,
      ["Value"] = 5,
      ["Group"] = {
        {
          ["Name"] = L["Any"],
          ["Value"] = 1,
        },
        {
          ["Name"] = NONE,
          ["Value"] = 2,
        },
        {
          ["Name"] = (BT["Arcane"] or "Arcane"),
          ["Value"] = 3,
        },
        {
          ["Name"] = (BT["Fire"] or "Fire"),
          ["Value"] = 4,
        },
        {
          ["Name"] = (BT["Frost"] or "Frost"),
          ["Value"] = 5,
        },
        {
          ["Name"] = (BT["Arcane"] or "Arcane").." / "..(BT["Fire"] or "Fire"),
          ["Value"] = 6,
        },
        {
          ["Name"] = (BT["Fire"] or "Fire").." / "..(BT["Frost"] or "Frost"),
          ["Value"] = 7,
        },
        {
          ["Name"] = (BT["Arcane"] or "Arcane").." / "..(BT["Frost"] or "Frost"),
          ["Value"] = 8,
        },
        {
          ["Name"] = L["Hybrid"],
          ["Value"] = 9,
        },
      },
    },
    {
      ["Name"] = LOCALIZED_CLASS_NAMES_MALE.PALADIN,
      ["Value"] = 6,
      ["Group"] = {
        {
          ["Name"] = L["Any"],
          ["Value"] = 1,
        },
        {
          ["Name"] = NONE,
          ["Value"] = 2,
        },
        {
          ["Name"] = (BT["Holy"] or "Holy"),
          ["Value"] = 3,
        },
        {
          ["Name"] = (BT["Protection"] or "Protection"),
          ["Value"] = 4,
        },
        {
          ["Name"] = (BT["Retribution"] or "Retribution"),
          ["Value"] = 5,
        },
        {
          ["Name"] = (BT["Holy"] or "Holy").." / "..(BT["Protection"] or "Protection"),
          ["Value"] = 6,
        },
        {
          ["Name"] = (BT["Protection"] or "Protection").." / "..(BT["Retribution"] or "Retribution"),
          ["Value"] = 7,
        },
        {
          ["Name"] = (BT["Holy"] or "Holy").." / "..(BT["Retribution"] or "Retribution"),
          ["Value"] = 8,
        },
        {
          ["Name"] = L["Hybrid"],
          ["Value"] = 9,
        },
      },
    },
    {
      ["Name"] = LOCALIZED_CLASS_NAMES_MALE.PRIEST,
      ["Value"] = 7,
      ["Group"] = {
        {
          ["Name"] = L["Any"],
          ["Value"] = 1,
        },
        {
          ["Name"] = NONE,
          ["Value"] = 2,
        },
        {
          ["Name"] = (BT["Discipline"] or "Discipline"),
          ["Value"] = 3,
        },
        {
          ["Name"] = (BT["Holy"] or "Holy"),
          ["Value"] = 4,
        },
        {
          ["Name"] = (BT["Shadow"] or "Shadow"),
          ["Value"] = 5,
        },
        {
          ["Name"] = (BT["Discipline"] or "Discipline").." / "..(BT["Holy"] or "Holy"),
          ["Value"] = 6,
        },
        {
          ["Name"] = (BT["Holy"] or "Holy").." / "..(BT["Shadow"] or "Shadow"),
          ["Value"] = 7,
        },
        {
          ["Name"] = (BT["Discipline"] or "Discipline").." / "..(BT["Shadow"] or "Shadow"),
          ["Value"] = 8,
        },
        {
          ["Name"] = L["Hybrid"],
          ["Value"] = 9,
        },
      },
    },
    {
      ["Name"] = LOCALIZED_CLASS_NAMES_MALE.ROGUE,
      ["Value"] = 8,
      ["Group"] = {
        {
          ["Name"] = L["Any"],
          ["Value"] = 1,
        },
        {
          ["Name"] = NONE,
          ["Value"] = 2,
        },
        {
          ["Name"] = (BT["Assassination"] or "Assassination"),
          ["Value"] = 3,
        },
        {
          ["Name"] = (BT["Combat"] or "Combat"),
          ["Value"] = 4,
        },
        {
          ["Name"] = (BT["Subtlety"] or "Subtlety"),
          ["Value"] = 5,
        },
        {
          ["Name"] = (BT["Assassination"] or "Assassination").." / "..(BT["Combat"] or "Combat"),
          ["Value"] = 6,
        },
        {
          ["Name"] = (BT["Combat"] or "Combat").." / "..(BT["Subtlety"] or "Subtlety"),
          ["Value"] = 7,
        },
        {
          ["Name"] = (BT["Assassination"] or "Assassination").." / "..(BT["Subtlety"] or "Subtlety"),
          ["Value"] = 8,
        },
        {
          ["Name"] = L["Hybrid"],
          ["Value"] = 9,
        },
      },
    },
    {
      ["Name"] = LOCALIZED_CLASS_NAMES_MALE.SHAMAN,
      ["Value"] = 9,
      ["Group"] = {
        {
          ["Name"] = L["Any"],
          ["Value"] = 1,
        },
        {
          ["Name"] = NONE,
          ["Value"] = 2,
        },
        {
          ["Name"] = (BT["Elemental"] or "Elemental"),
          ["Value"] = 3,
        },
        {
          ["Name"] = (BT["Enhancement"] or "Enhancement"),
          ["Value"] = 4,
        },
        {
          ["Name"] = (BT["Restoration"] or "Restoration"),
          ["Value"] = 5,
        },
        {
          ["Name"] = (BT["Elemental"] or "Elemental").." / "..(BT["Enhancement"] or "Enhancement"),
          ["Value"] = 6,
        },
        {
          ["Name"] = (BT["Enhancement"] or "Enhancement").." / "..(BT["Restoration"] or "Restoration"),
          ["Value"] = 7,
        },
        {
          ["Name"] = (BT["Elemental"] or "Elemental").." / "..(BT["Restoration"] or "Restoration"),
          ["Value"] = 8,
        },
        {
          ["Name"] = L["Hybrid"],
          ["Value"] = 9,
        },
      },
    },
    {
      ["Name"] = LOCALIZED_CLASS_NAMES_MALE.WARLOCK,
      ["Value"] = 10,
      ["Group"] = {
        {
          ["Name"] = L["Any"],
          ["Value"] = 1,
        },
        {
          ["Name"] = NONE,
          ["Value"] = 2,
        },
        {
          ["Name"] = (BT["Affliction"] or "Affliction"),
          ["Value"] = 3,
        },
        {
          ["Name"] = (BT["Demonology"] or "Demonology"),
          ["Value"] = 4,
        },
        {
          ["Name"] = (BT["Destruction"] or "Destruction"),
          ["Value"] = 5,
        },
        {
          ["Name"] = (BT["Affliction"] or "Affliction").." / "..(BT["Demonology"] or "Demonology"),
          ["Value"] = 6,
        },
        {
          ["Name"] = (BT["Demonology"] or "Demonology").." / "..(BT["Destruction"] or "Destruction"),
          ["Value"] = 7,
        },
        {
          ["Name"] = (BT["Affliction"] or "Affliction").." / "..(BT["Destruction"] or "Destruction"),
          ["Value"] = 8,
        },
        {
          ["Name"] = L["Hybrid"],
          ["Value"] = 9,
        },
      },
    },
    {
      ["Name"] = LOCALIZED_CLASS_NAMES_MALE.WARRIOR,
      ["Value"] = 11,
      ["Group"] = {
        {
          ["Name"] = L["Any"],
          ["Value"] = 1,
        },
        {
          ["Name"] = NONE,
          ["Value"] = 2,
        },
        {
          ["Name"] = (BT["Arms"] or "Arms"),
          ["Value"] = 3,
        },
        {
          ["Name"] = (BT["Fury"] or "Fury"),
          ["Value"] = 4,
        },
        {
          ["Name"] = (BT["Protection"] or "Protection"),
          ["Value"] = 5,
        },
        {
          ["Name"] = (BT["Arms"] or "Arms").." / "..(BT["Fury"] or "Fury"),
          ["Value"] = 6,
        },
        {
          ["Name"] = (BT["Fury"] or "Fury").." / "..(BT["Protection"] or "Protection"),
          ["Value"] = 7,
        },
        {
          ["Name"] = (BT["Arms"] or "Arms").." / "..(BT["Protection"] or "Protection"),
          ["Value"] = 8,
        },
        {
          ["Name"] = L["Hybrid"],
          ["Value"] = 9,
        },
      },
    },
  };
end
module.ConfigOptions_RuleDefaults = {
  -- { VariableName, Default },
  {
    "ClassSpec",
    {
      -- [1] = { Class, Spec, Exception }
    },
  },
};
module.NewFilterValue_Class = 1;
module.NewFilterValue_Spec = 1;

function module:OnEnable()
  self:SetupValues();
  self:RegisterDefaultVariables(self.ConfigOptions_RuleDefaults);
  self:AddWidget(self.Widget);
  self:CheckDBVersion(1, "UpgradeDatabase");
end

function module:OnDisable()
  self:UnregisterDefaultVariables();
  self:RemoveWidgets();
end

function module:UpgradeDatabase(FromVersion, Rule)
  return;
end

function module:CreateWidget()
  local Widget = CreateFrame("Frame", "PassLoot_Frames_Widgets_ClassSpec", nil, "UIDropDownMenuTemplate");
  Widget:EnableMouse(true);
  Widget:SetHitRectInsets(15, 15, 0 ,0);
  _G[Widget:GetName().."Text"]:SetJustifyH("CENTER");
  if ( select(4, GetBuildInfo()) < 30000 ) then
    UIDropDownMenu_SetWidth(180, Widget);
  else
    UIDropDownMenu_SetWidth(Widget, 180);
  end
  Widget:SetScript("OnEnter", function()
    local Spec = string.gsub(L["Current Spec: %spec%"], "%%spec%%", self:GetCurrentSpec())
    self:ShowTooltip(L["Class Spec"], L["Selected rule will only match items when you are this class and spec."], Spec)
  end);
  Widget:SetScript("OnLeave", function() GameTooltip:Hide() end);
  local Button = _G[Widget:GetName().."Button"];
  Button:SetScript("OnEnter", function()
    local Spec = string.gsub(L["Current Spec: %spec%"], "%%spec%%", self:GetCurrentSpec())
    self:ShowTooltip(L["Class Spec"], L["Selected rule will only match items when you are this class and spec."], Spec)
  end);
  Button:SetScript("OnLeave", function() GameTooltip:Hide() end);
  Widget.Title = Widget:CreateFontString(nil, "BACKGROUND", "GameFontNormalSmall");
  Widget.Title:SetParent(Widget);
  Widget.Title:SetPoint("BOTTOMLEFT", Widget, "TOPLEFT", 20, 0);
  Widget.Title:SetText(L["Class Spec"]);
  Widget:SetParent(nil);
  Widget:Hide();
  if ( select(4, GetBuildInfo()) < 30000 ) then
    Widget.initialize = function(...) self:DropDown_Init(Widget, ...) end;
  else
    Widget.initialize = function(...) self:DropDown_Init(...) end;
  end
  
  Widget.YPaddingTop = Widget.Title:GetHeight();
  Widget.Height = Widget:GetHeight() + Widget.YPaddingTop;
  Widget.XPaddingLeft = -15;
  Widget.XPaddingRight = -15;
  Widget.Width = Widget:GetWidth() + Widget.XPaddingLeft + Widget.XPaddingRight;
  Widget.PreferredPriority = 2;
  Widget.Info = {
    L["Class Spec"],
    L["Selected rule will only match items when you are this class and spec."],
  };
  return Widget;
end
module.Widget = module:CreateWidget();

-- Local function to get the data and make sure it's valid data
function module.Widget:GetData(RuleNum)
  local Data = module:GetConfigOption("ClassSpec", RuleNum);
  local Changed = false;
  if ( not Data or type(Data) ~= "table" ) then
    Data = {};
    Changed = true;
  end
  for Key, Value in ipairs(Data) do
    if ( type(Value) ~= "table" or type(Value[1]) ~= "number" or type(Value[2]) ~= "number" ) then
      Data[Key] = { module.NewFilterValue_Class, module.NewFilterValue_Spec, false };
      Changed = true;
    end
  end
  if ( Changed ) then
    module:SetConfigOption("ClassSpec", Data);
  end
  return Data;
end

function module.Widget:GetNumFilters(RuleNum)
  local Value = self:GetData(RuleNum);
  return #Value;
end

function module.Widget:AddNewFilter()
  local Value = self:GetData();
  table.insert(Value, { module.NewFilterValue_Class, module.NewFilterValue_Spec, false });
  module:SetConfigOption("ClassSpec", Value);
end

function module.Widget:RemoveFilter(Index)
  local Value = self:GetData();
  table.remove(Value, Index);
  module:SetConfigOption("ClassSpec", Value);
end

function module.Widget:DisplayWidget(Index)
  if ( Index ) then
    module.FilterIndex = Index;
  end
  local Value = self:GetData();
  if ( select(4, GetBuildInfo()) < 30000 ) then
    UIDropDownMenu_SetText(module:GetClassSpecText(Value[module.FilterIndex][1], Value[module.FilterIndex][2]), module.Widget);
  else
    UIDropDownMenu_SetText(module.Widget, module:GetClassSpecText(Value[module.FilterIndex][1], Value[module.FilterIndex][2]));
  end
end

function module.Widget:GetFilterText(Index)
  local Value = self:GetData();
  return module:GetClassSpecText(Value[Index][1], Value[Index][2]);
end

function module.Widget:IsException(RuleNum, Index)
  local Data = self:GetData(RuleNum);
  return Data[Index][3];
end

function module.Widget:SetException(RuleNum, Index, Value)
  local Data = self:GetData(RuleNum);
  Data[Index][3] = Value;
  module:SetConfigOption("ClassSpec", Data);
end

function module.Widget:SetMatch(ItemLink, Tooltip)
  local _, Class = UnitClass("player");
  Class = LOCALIZED_CLASS_NAMES_MALE[Class];
  local TalentMatchA, TalentMatchB = module:GetCurrentSpec();
  module.CurrentMatchClass = -1;
  module.CurrentMatchSpec = -1;
  for ClassKey, ClassValue in pairs(module.Choices) do
    if ( ClassValue.Name == Class ) then
      for SpecKey, SpecValue in pairs(ClassValue.Group) do
        if ( TalentMatchA == SpecValue.Name or TalentMatchB == SpecValue.Name ) then
          module.CurrentMatchSpec = SpecValue.Value;
          break;
        end
      end
      module.CurrentMatchClass = ClassValue.Value;
      break;
    end
  end
  if ( module.CurrentMatchClass == -1 ) then
    module:Debug("Could not find Class: "..(Class or "nil"));
  else
    module:Debug("Class: "..(Class or "nil").." Found: ("..module.CurrentMatchClass..") ");
  end
  if ( module.CurrentMatchSpec == -1 ) then
    module:Debug("Could not find Spec: "..(TalentMatchA or "nil"));
  else
    module:Debug("Spec: "..(TalentMatchA or "nil").." Found: ("..module.CurrentMatchSpec..") ");
  end
end

function module.Widget:GetMatch(RuleNum, Index)
  local Value = self:GetData(RuleNum);
  local Class = Value[Index][1];
  local Spec = Value[Index][2];
  if ( Class > 1 ) then
    if ( Class ~= module.CurrentMatchClass ) then
      module:Debug("Class doesn't match");
      return false;
    end
  end
  if ( Spec > 1 ) then
    if ( Spec ~= module.CurrentMatchSpec ) then
      module:Debug("Spec doesn't match");
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
  if ( Level == 1 ) then
    for Key, Value in ipairs(self.Choices) do
      info.text = Value.Name;
      info.value = {
        ["Key"] = Key,
        ["Class"] = Value.Value,
        ["Spec"] = 1,
      };
      info.notClickable = false;
      if ( #Value.Group > 0 ) then
        info.hasArrow = true;
      else
        info.hasArrow = false;
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
        ["Class"] = UIDROPDOWNMENU_MENU_VALUE.Class,
        ["Spec"] = Value.Value,
      };
      UIDropDownMenu_AddButton(info, Level);
    end
  end
end

function module:DropDown_OnClick(Frame)
  local Value = self.Widget:GetData();
  Value[self.FilterIndex][1] = Frame.value.Class;
  Value[self.FilterIndex][2] = Frame.value.Spec;
  self:SetConfigOption("ClassSpec", Value);
  if ( select(4, GetBuildInfo()) < 30000 ) then
    UIDropDownMenu_SetText(self:GetClassSpecText(Frame.value.Class, Frame.value.Spec), Frame.owner);
  else
    UIDropDownMenu_SetText(Frame.owner, self:GetClassSpecText(Frame.value.Class, Frame.value.Spec));
  end
  DropDownList1:Hide(); -- Nested dropdown buttons don't hide their parent menus on click.
end

function module:GetClassSpecText(Class, Spec)
  for ClassKey, ClassValue in ipairs(self.Choices) do
    if ( Class == ClassValue.Value ) then
      if ( #ClassValue.Group > 0 ) then
        for SpecKey, SpecValue in ipairs(ClassValue.Group) do
          if ( SpecValue.Value == Spec ) then
            local ReturnValue = string.gsub(L["%class% - %spec%"], "%%class%%", ClassValue.Name);
            ReturnValue = string.gsub(ReturnValue, "%%spec%%", SpecValue.Name);
            return ReturnValue;
          end
        end
      else
        return ClassValue.Name;
      end
    end
  end
  return "";
end

function module:GetCurrentSpec()
  local Talents = {};
  local Name, PointsSpent
  for Index = 1, GetNumTalentTabs() do
    if ( select(4, GetBuildInfo()) < 40000 ) then
      Name, _, PointsSpent, _, _ = GetTalentTabInfo(Index);
    else
      -- id, name, description, icon, pointsSpent, background, previewPointsSpent, isUnlocked
      _, Name, _, _, PointsSpent, _, _, _ = GetTalentTabInfo(Index);
    end
    Talents[Index] = { Name, PointsSpent or 0 };
  end
  table.sort(Talents, function(a, b) return a[2] > b[2] end);
  local TalentMatchA, TalentMatchB;
  if ( Talents[1][2] == 0 ) then
    TalentMatchA = NONE;
  elseif ( Talents[1][2]*3/4 <= Talents[2][2] ) then
    if ( Talents[1][2]*3/4 <= Talents[3][2] ) then
      TalentMatchA = L["Hybrid"];
    else
      TalentMatchA = Talents[1][1].." / "..Talents[2][1];
      TalentMatchB = Talents[2][1].." / "..Talents[1][1];
    end
  else
    TalentMatchA = Talents[1][1];
  end
  return TalentMatchA, TalentMatchB;
end

