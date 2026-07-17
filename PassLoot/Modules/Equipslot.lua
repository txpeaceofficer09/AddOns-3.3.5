local PassLoot = LibStub("AceAddon-3.0"):GetAddon("PassLoot");
local L = LibStub("AceLocale-3.0"):GetLocale("PassLoot_Modules");
local module = PassLoot:NewModule(L["Equip Slot"])
local binv, BI;

if ( not LibStub("LibBabble-Inventory-3.0", true) ) then
  return;
end

function module:SetupValues()
  binv = LibStub("LibBabble-Inventory-3.0");
  BI = binv:GetUnstrictLookupTable();
  module.Choices = {
    {
      ["Name"] = L["Any"],
      ["Type"] = {
        "",
      },
      ["Group"] = {},
      ["Value"] = 1,
    },
    {
      ["Name"] = L["None"],
      ["Type"] = {
        "",
      },
      ["Group"] = {},
      ["Value"] = 2,
    },
    {
      ["Name"] = L["Armor"],
      ["Type"] = {
        "",
      },
      ["Group"] = {
        {
          ["Name"] = BI["Chest"] or INVTYPE_CHEST,
          ["Type"] = {
            "INVTYPE_CHEST",
            "INVTYPE_ROBE",
          },
          ["Value"] = 5,
        },
        {
          ["Name"] = BI["Feet"] or INVTYPE_FEET,
          ["Type"] = {
            "INVTYPE_FEET",
          },
          ["Value"] = 6,
        },
        {
          ["Name"] = BI["Hands"] or INVTYPE_HAND,
          ["Type"] = {
            "INVTYPE_HAND",
          },
          ["Value"] = 8,
        },
        {
          ["Name"] = BI["Head"] or INVTYPE_HEAD,
          ["Type"] = {
            "INVTYPE_HEAD",
          },
          ["Value"] = 9,
        },
        {
          ["Name"] = BI["Legs"] or INVTYPE_LEGS,
          ["Type"] = {
            "INVTYPE_LEGS",
          },
          ["Value"] = 11,
        },
        {
          ["Name"] = BI["Shield"] or "Shield", --INVTYPE_SHIELD == "Off Hand"
          ["Type"] = {
            "INVTYPE_SHIELD",
          },
          ["Value"] = 20,
        },
        {
          ["Name"] = BI["Shoulder"] or INVTYPE_SHOULDER,
          ["Type"] = {
            "INVTYPE_SHOULDER",
          },
          ["Value"] = 22,
        },
        {
          ["Name"] = BI["Waist"] or INVTYPE_WAIST,
          ["Type"] = {
            "INVTYPE_WAIST",
          },
          ["Value"] = 26,
        },
        {
          ["Name"] = BI["Wrist"] or INVTYPE_WRIST,
          ["Type"] = {
            "INVTYPE_WRIST",
          },
          ["Value"] = 27,
        },
      },
    },
    {
      ["Name"] = L["Weapons"],
      ["Type"] = {
        "",
      },
      ["Group"] = {
        {
          ["Name"] = BI["Held in Off-Hand"] or INVTYPE_HOLDABLE,
          ["Type"] = {
            "INVTYPE_HOLDABLE",
          },
          ["Value"] = 10,
        },
        {
          ["Name"] = BI["Main Hand"] or INVTYPE_WEAPONMAINHAND, --Main-Hand Weapon
          ["Type"] = {
            "INVTYPE_WEAPONMAINHAND",
          },
          ["Value"] = 12,
        },
        {
          ["Name"] = BI["Off Hand"] or INVTYPE_WEAPONOFFHAND, --Off Hand Weapon
          ["Type"] = {
            "INVTYPE_WEAPONOFFHAND",
          },
          ["Value"] = 14,
        },
        {
          ["Name"] = BI["One-Hand"] or INVTYPE_WEAPON, --One-Hand Weapon
          ["Type"] = {
            "INVTYPE_WEAPON",
          },
          ["Value"] = 15,
        },
        {
          ["Name"] = BI["Ranged"] or INVTYPE_RANGED, --Ranged Weapon
          ["Type"] = {
            "INVTYPE_RANGED",
            "INVTYPE_RANGEDRIGHT",
            "INVTYPE_THROWN",
          },
          ["Value"] = 18,
        },
        {
          ["Name"] = BI["Two-Hand"] or INVTYPE_2HWEAPON, --Two-Handed Weapon
          ["Type"] = {
            "INVTYPE_2HWEAPON",
          },
          ["Value"] = 25,
        },
      },
    },
    {
      ["Name"] = L["Accessories"],
      ["Type"] = {
        "",
      },
      ["Group"] = {
        {
          ["Name"] = BI["Back"] or INVTYPE_CLOAK,
          ["Type"] = {
            "INVTYPE_CLOAK",
          },
          ["Value"] = 3,
        },
        {
          ["Name"] = BI["Bag"] or INVTYPE_BAG,
          ["Type"] = {
            "INVTYPE_BAG",
          },
          ["Value"] = 4,
        },
        {
          ["Name"] = BI["Neck"] or INVTYPE_NECK,
          ["Type"] = {
            "INVTYPE_NECK",
          },
          ["Value"] = 13,
        },
        {
          ["Name"] = BI["Projectile"] or INVTYPE_AMMO,
          ["Type"] = {
            "INVTYPE_AMMO",
          },
          ["Value"] = 16,
        },
        -- Quiver equip slot defined in GlobalStrings.lua, but nothing uses it as of WoW patch 2.3.3
        -- {
          -- ["Name"] = BI["Quiver"] or INVTYPE_QUIVER,
          -- ["Type"] = {
            -- "INVTYPE_QUIVER",
          -- },
          -- ["Value"] = 17,
        -- },
        {
          ["Name"] = BI["Relic"] or INVTYPE_RELIC,
          ["Type"] = {
            "INVTYPE_RELIC",
          },
          ["Value"] = 19,
        },
        {
          ["Name"] = BI["Ring"] or INVTYPE_FINGER, --Finger
          ["Type"] = {
            "INVTYPE_FINGER",
          },
          ["Value"] = 7,
        },
        {
          ["Name"] = BI["Shirt"] or INVTYPE_BODY,
          ["Type"] = {
            "INVTYPE_BODY",
          },
          ["Value"] = 21,
        },
        {
          ["Name"] = BI["Tabard"] or INVTYPE_TABARD,
          ["Type"] = {
            "INVTYPE_TABARD",
          },
          ["Value"] = 23,
        },
        {
          ["Name"] = BI["Trinket"] or INVTYPE_TRINKET,
          ["Type"] = {
            "INVTYPE_TRINKET",
          },
          ["Value"] = 24,
        },
      },
    },
  };
end

module.ConfigOptions_RuleDefaults = {
  -- { VariableName, Default },
  {
    "EquipSlot",
    {
      -- [1] = { Value, Exception }
    }
  },
};
module.NewFilterValue = 1;

function module:OnEnable()
  self:SetupValues();
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
      { "EquipSlot", {} }
    };
    if ( Rule.EquipSlot ) then
      Table[1][2][1] = { Rule.EquipSlot, false };
    end
    return Table;
  end
  if ( FromVersion == 2 ) then
    local Table = {
      { "EquipSlot", {} },
    };
    if ( type(Rule.EquipSlot) == "table" ) then
      for Key, Value in ipairs(Rule.EquipSlot) do
        Table[1][2][Key] = { Value, false };
      end
    end
    return Table;
  end
  return;
end

function module:CreateWidget()
  local Widget = CreateFrame("Frame", "PassLoot_Frames_Widgets_EquipSlot", nil, "UIDropDownMenuTemplate");
  Widget:EnableMouse(true);
  Widget:SetHitRectInsets(15, 15, 0 ,0);
  _G[Widget:GetName().."Text"]:SetJustifyH("CENTER");
  if ( select(4, GetBuildInfo()) < 30000 ) then
    UIDropDownMenu_SetWidth(140, Widget);
  else
    UIDropDownMenu_SetWidth(Widget, 140);
  end
  Widget:SetScript("OnEnter", function() self:ShowTooltip(L["Equip Slot"], L["Selected rule will only match items with this equip slot."]) end);
  Widget:SetScript("OnLeave", function() GameTooltip:Hide() end);
  local Button = _G[Widget:GetName().."Button"];
  Button:SetScript("OnEnter", function() self:ShowTooltip(L["Equip Slot"], L["Selected rule will only match items with this equip slot."]) end);
  Button:SetScript("OnLeave", function() GameTooltip:Hide() end);
  local Title = Widget:CreateFontString(Widget:GetName().."Title", "BACKGROUND", "GameFontNormalSmall");
  Title:SetParent(Widget);
  Title:SetPoint("BOTTOMLEFT", Widget, "TOPLEFT", 20, 0);
  Title:SetText(L["Equip Slot"]);
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
  Widget.PreferredPriority = 8;
  Widget.Info = {
    L["Equip Slot"],
    L["Selected rule will only match items with this equip slot."],
  };
  return Widget;
end
module.Widget = module:CreateWidget();

-- Local function to get the data and make sure it's valid data
function module.Widget:GetData(RuleNum)
  local Data = module:GetConfigOption("EquipSlot", RuleNum);
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
    module:SetConfigOption("EquipSlot", Data);
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
  module:SetConfigOption("EquipSlot", Value);
end

function module.Widget:RemoveFilter(Index)
  local Value = self:GetData();
  table.remove(Value, Index);
  module:SetConfigOption("EquipSlot", Value);
end

function module.Widget:DisplayWidget(Index)
  if ( Index ) then
    module.FilterIndex = Index;
  end
  local Value = self:GetData();
  if ( select(4, GetBuildInfo()) < 30000 ) then
    UIDropDownMenu_SetText(module:GetEquipSlotText(Value[module.FilterIndex][1]), module.Widget);
  else
    UIDropDownMenu_SetText(module.Widget, module:GetEquipSlotText(Value[module.FilterIndex][1]));
  end
end

function module.Widget:GetFilterText(Index)
  local Value = self:GetData();
  return module:GetEquipSlotText(Value[Index][1]);
end

function module.Widget:IsException(RuleNum, Index)
  local Data = self:GetData(RuleNum);
  return Data[Index][2];
end

function module.Widget:SetException(RuleNum, Index, Value)
  local Data = self:GetData(RuleNum);
  Data[Index][2] = Value;
  module:SetConfigOption("EquipSLot", Data);
end

function module.Widget:SetMatch(ItemLink, Tooltip)
  local _, _, _, _, _, _, _, _, EquipSlot, _ = GetItemInfo(ItemLink);
  module.CurrentMatch = module:FindEquipSlot(EquipSlot);
  if ( EquipSlot ) then
    module:Debug("Equip Loc: "..(EquipSlot or "nil").." Found: ("..module.CurrentMatch..") ");
    if ( module.CurrentMatch == -1 ) then
      module:Debug("Could not find EquipSlot: "..(EquipSlot or "nil"));
    end
  end
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
  if ( Level == 1 ) then
    for Key, Value in ipairs(self.Choices) do
      info.text = Value.Name;
      if ( #Value.Group > 0 ) then
        info.hasArrow = true;
        info.notClickable = true;
        info.value = Key;
      else
        info.hasArrow = false;
        info.notClickable = false;
        info.value = Value.Value;
      end
      UIDropDownMenu_AddButton(info, Level);
    end
  else
    for Key, Value in ipairs(self.Choices[UIDROPDOWNMENU_MENU_VALUE].Group) do
      info.text = Value.Name;
      info.hasArrow = false;
      info.notClickable = false;
      info.value = Value.Value;
      UIDropDownMenu_AddButton(info, Level);
    end
  end
end

function module:DropDown_OnClick(Frame)
  local Value = self.Widget:GetData();
  Value[self.FilterIndex][1] = Frame.value;
  self:SetConfigOption("EquipSlot", Value);
  if ( select(4, GetBuildInfo()) < 30000 ) then
    UIDropDownMenu_SetText(Frame:GetText(), Frame.owner);
  else
    UIDropDownMenu_SetText(Frame.owner, Frame:GetText());
  end
  DropDownList1:Hide(); -- Nested dropdown buttons don't hide their parent menus on click.
end

function module:GetEquipSlotText(EquipID)
  for Key, Value in ipairs(self.Choices) do
    if ( #Value.Group > 0 ) then
      for GroupKey, GroupValue in ipairs(Value.Group) do
        if ( GroupValue.Value == EquipID ) then
          return GroupValue.Name;
        end
      end
    else
      if ( Value.Value == EquipID ) then
        return Value.Name;
      end
    end
  end
  return "";
end

function module:FindEquipSlot(Slot)
  for Key, Value in pairs(self.Choices) do
    if ( #Value.Group > 0 ) then
      for GroupKey, GroupValue in pairs(Value.Group) do
        for TypeKey, TypeValue in pairs(GroupValue.Type) do
          if ( Slot == TypeValue ) then
            return GroupValue.Value;
          end
        end
      end
    else
      for TypeKey, TypeValue in pairs(Value.Type) do
        if ( Slot == TypeValue and Value.Value ~= 1 ) then  --Don't return type 1 (Any), can return 2 (None)
          return Value.Value;
        end
      end
    end
  end
  return -1;
end
