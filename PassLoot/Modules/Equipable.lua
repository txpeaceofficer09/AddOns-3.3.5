local PassLoot = LibStub("AceAddon-3.0"):GetAddon("PassLoot");
local L = LibStub("AceLocale-3.0"):GetLocale("PassLoot_Modules");
local module = PassLoot:NewModule(L["Equipable"])

local binv, BI;

if ( not LibStub("LibBabble-Inventory-3.0", true) ) then
  return;
end
binv = LibStub("LibBabble-Inventory-3.0");
BI = binv:GetUnstrictLookupTable();

module.Choices = {
  {
    ["Name"] = L["Any"],
    ["Value"] = 1,
  },
  {
    ["Name"] = NEVER,
    ["Value"] = 2,
  },
  {
    ["Name"] = L["Now"],
    ["Value"] = 3,
  },
  {
    ["Name"] = L["Later"],
    ["Value"] = 4,
  },
};
module.ConfigOptions_RuleDefaults = {
  -- { VariableName, Default },
  { 
    "Equipable",
    {
      -- [1] = { Value, Exception }
    },
  },
};
module.NewFilterValue = 1;

-- A list of Type / SubTypes to check for.
-- nil entries will not be checked.
local TypeSubTypes = {
  [BI["Weapon"]] = {
    [BI["One-Handed Axes"]] = true,
    [BI["Two-Handed Axes"]] = true,
    [BI["Bows"]] = true,
    [BI["Guns"]] = true,
    [BI["One-Handed Maces"]] = true,
    [BI["Two-Handed Maces"]] = true,
    [BI["Polearms"]] = true,
    [BI["One-Handed Swords"]] = true,
    [BI["Two-Handed Swords"]] = true,
    [BI["Staves"]] = true,
    [BI["Fist Weapons"]] = true,
    [BI["Miscellaneous"]] = true,
    [BI["Daggers"]] = true,
    [BI["Thrown"]] = true,
    [BI["Crossbows"]] = true,
    [BI["Wands"]] = true,
    -- [BI["Fishing Poles"]] = true,
  },
  [BI["Armor"]] = {
    [BI["Miscellaneous"]] = true,  -- Head, Neck, Shirt, Finger, Trinket, Held in Off Hand
    [BI["Cloth"]] = true,  -- Head, Shoulder, Chest, Waist, Legs, Feet, Wrist, Hands, Back
    [BI["Leather"]] = true,  -- Head, Shoulder, Chest, Waist, Legs, Feet, Wrist, Hands
    [BI["Mail"]] = true,  -- Head, Shoulder, Chest, Waist, Legs, Feet, Wrist, Hands
    [BI["Plate"]] = true,  -- Head, Shoulder, Chest, Waist, Legs, Feet, Wrist, Hands
    [BI["Shields"]] = true,
    [BI["Librams"]] = true,
    [BI["Idols"]] = true,
    [BI["Totems"]] = true,
    [BI["Sigils"]] = true,
  },
  --[=[
  [BI["Container"]] = {
    [BI["Bag"]] = true,
    [BI["Soul Bag"]] = true,
    [BI["Herb Bag"]] = true,
    [BI["Enchanting Bag"]] = true,
    [BI["Engineering Bag"]] = true,
    [BI["Gem Bag"]] = true,
    [BI["Mining Bag"]] = true,
    [BI["Leatherworking Bag"]] = true,
    [BI["Inscription Bag"]] = true,
  },
  [BI["Consumable"]] = {
    [BI["Food & Drink"]] = true,
    [BI["Potion"]] = true,
    [BI["Elixir"]] = true,
    [BI["Flask"]] = true,
    [BI["Bandage"]] = true,
    [BI["Item Enhancement"]] = true,
    [BI["Scroll"]] = true,
    [BI["Other"]] = true,
    [BI["Consumable"]] = true,
  },
  [BI["Glyph"]] = {
    [BI["Warrior"]] = true,
    [BI["Paladin"]] = true,
    [BI["Hunter"]] = true,
    [BI["Rogue"]] = true,
    [BI["Priest"]] = true,
    [BI["Death Knight"]] = true,
    [BI["Shaman"]] = true,
    [BI["Mage"]] = true,
    [BI["Warlock"]] = true,
    [BI["Druid"]] = true,
  },
  [BI["Trade Goods"]] = {
    [BI["Elemental"]] = true,
    [BI["Cloth"]] = true,
    [BI["Leather"]] = true,
    [BI["Metal & Stone"]] = true,
    [BI["Meat"]] = true,
    [BI["Herb"]] = true,
    [BI["Enchanting"]] = true,
    [BI["Jewelcrafting"]] = true,
    [BI["Parts"]] = true,
    [BI["Devices"]] = true,
    [BI["Explosives"]] = true,
    [BI["Materials"]] = true,
    [BI["Other"]] = true,
    [BI["Armor Enchantment"]] = true,
    [BI["Weapon Enchantment"]] = true,
    [BI["Trade Goods"]] = true,
  },
  [BI["Projectile"]] = {
    [BI["Arrow"]] = true,
    [BI["Bullet"]] = true,
  },
  [BI["Quiver"]] = {
    [BI["Quiver"]] = true,
    [BI["Ammo Pouch"]] = true,
  },
  [BI["Reagent"]] = {
    [BI["Reagent"]] = true,
  },
  [BI["Recipe"]] = {
    [BI["Book"]] = true,
    [BI["Leatherworking"]] = true,
    [BI["Tailoring"]] = true,
    [BI["Engineering"]] = true,
    [BI["Blacksmithing"]] = true,
    [BI["Cooking"]] = true,
    [BI["Alchemy"]] = true,
    [BI["First Aid"]] = true,
    [BI["Enchanting"]] = true,
    [BI["Fishing"]] = true,
    [BI["Jewelcrafting"]] = true,
  },
  [BI["Gem"]] = {
    [BI["Red"]] = true,
    [BI["Blue"]] = true,
    [BI["Yellow"]] = true,
    [BI["Purple"]] = true,
    [BI["Green"]] = true,
    [BI["Orange"]] = true,
    [BI["Meta"]] = true,
    [BI["Simple"]] = true,
    [BI["Prismatic"]] = true,
  },
  [BI["Miscellaneous"]] = {
    [BI["Junk"]] = true,
    [BI["Reagent"]] = true,
    [BI["Pet"]] = true,
    [BI["Holiday"]] = true,
    [BI["Mount"]] = true,
    [BI["Other"]] = true,
  },
  [BI["Key"]] = {
    [BI["Key"]] = true,
  },
  [BI["Quest"]] = {
    [BI["Quest"]] = true,
  },
  ]=]
};
-- Same thing for Equip Slots - Will not check nil entries
local EquipSlots = {
  [INVTYPE_AMMO] = true,  -- Ammo
  -- [INVTYPE_HEAD] = true,  -- Head
  -- [INVTYPE_NECK] = true,  -- Neck
  -- [INVTYPE_SHOULDER] = true,  -- Shoulder
  -- [INVTYPE_BODY] = true,  -- Shirt
  -- [INVTYPE_CHEST] = true,  -- Chest
  -- [INVTYPE_ROBE] = true,  -- Chest
  -- [INVTYPE_WAIST] = true,  -- Waist
  -- [INVTYPE_LEGS] = true,  -- Legs
  -- [INVTYPE_FEET] = true,  -- Feet
  -- [INVTYPE_WRIST] = true,  -- Wrist
  -- [INVTYPE_HAND] = true,  -- Hands
  -- [INVTYPE_FINGER] = true,  -- Fingers
  -- [INVTYPE_TRINKET] = true,  -- Trinkets
  -- [INVTYPE_CLOAK] = true,  -- Cloaks
  [INVTYPE_WEAPON] = true,  -- One-Hand
  [INVTYPE_SHIELD] = true,  -- Shield
  [INVTYPE_2HWEAPON] = true,  -- Two-Handed
  [INVTYPE_WEAPONMAINHAND] = true,  -- Main-Hand Weapon
  [INVTYPE_WEAPONOFFHAND] = true, -- Off-Hand Weapon
  [INVTYPE_HOLDABLE] = true,  -- Held In Off-Hand
  [INVTYPE_RANGED] = true,  -- Bows
  [INVTYPE_THROWN] = true,  -- Ranged
  [INVTYPE_RANGEDRIGHT] = true,  -- Wands, Guns, and Crossbows
  [INVTYPE_RELIC] = true,
  -- [INVTYPE_TABARD] = true,
  -- [INVTYPE_BAG] = true,  -- Containers
  [INVTYPE_QUIVER] = true,
};
module.Wearable = {  -- Type, SubType, EquipSlot (nil matches all)
  ["DEATHKNIGHT"] = {
    { BI["Armor"], BI["Miscellaneous"], nil },
    -- { BI["Weapon"], BI["Fishing Poles"], nil },
    { BI["Armor"], BI["Leather"], nil },
    { BI["Armor"], BI["Mail"], nil },
    { BI["Armor"], BI["Plate"], nil },
    { BI["Weapon"], BI["One-Handed Maces"], nil },
    { BI["Weapon"], BI["One-Handed Axes"], nil },
    { BI["Weapon"], BI["Polearm"], nil },
    { BI["Weapon"], BI["One-Handed Swords"], nil },
    { BI["Weapon"], BI["Two-Handed Maces"], nil },
    { BI["Weapon"], BI["Two-Handed Swords"], nil },
    { BI["Armor"], BI["Sigils"], nil },
  },
  ["DRUID"] = {
    { BI["Armor"], BI["Miscellaneous"], nil },
    -- { BI["Weapon"], BI["Fishing Poles"], nil },
    { BI["Armor"], BI["Cloth"], nil },
    { BI["Armor"], BI["Leather"], nil },
    { BI["Armor"], BI["Idols"], nil },
    { BI["Weapon"], nil, INVTYPE_HOLDABLE },
    { BI["Weapon"], BI["Daggers"], nil },
    { BI["Weapon"], BI["One-Handed Maces"], nil },
    { BI["Weapon"], BI["Two-Handed Maces"], nil },
    { BI["Weapon"], BI["Staves"], nil },
    { BI["Weapon"], BI["Polearm"], nil },
  },
  ["MAGE"] = {
    { BI["Armor"], BI["Miscellaneous"], nil },
    { BI["Weapon"], BI["Fishing Poles"], nil },
    { BI["Armor"], BI["Cloth"], nil },
    { BI["Weapon"], nil, INVTYPE_HOLDABLE },
    { BI["Weapon"], BI["Daggers"], nil },
    { BI["Weapon"], BI["Staves"], nil },
    { BI["Weapon"], BI["One-Handed Swords"], nil },
    { BI["Weapon"], BI["Wands"], nil },
  },
  ["PALADIN"] = {
    { BI["Armor"], BI["Miscellaneous"], nil },
    -- { BI["Weapon"], BI["Fishing Poles"], nil },
    { BI["Armor"], BI["Cloth"], nil },
    { BI["Armor"], BI["Leather"], nil },
    { BI["Armor"], BI["Mail"], nil },
    { BI["Armor"], BI["Plate"], nil },
    { BI["Weapon"], nil, INVTYPE_HOLDABLE },
    { BI["Weapon"], BI["One-Handed Maces"], nil },
    { BI["Weapon"], BI["One-Handed Axes"], nil },
    { BI["Weapon"], BI["Polearm"], nil },
    { BI["Weapon"], BI["One-Handed Swords"], nil },
    { BI["Weapon"], BI["Two-Handed Maces"], nil },
    { BI["Weapon"], BI["Two-Handed Swords"], nil },
    { BI["Armor"], BI["Shields"], nil },
    { BI["Armor"], BI["Librams"], nil },
  },
  ["PRIEST"] = {
    { BI["Armor"], BI["Miscellaneous"], nil },
    -- { BI["Weapon"], BI["Fishing Poles"], nil },
    { BI["Armor"], BI["Cloth"], nil },
    { BI["Weapon"], nil, INVTYPE_HOLDABLE },
    { BI["Weapon"], BI["Daggers"], nil },
    { BI["Weapon"], BI["One-Handed Maces"], nil },
    { BI["Weapon"], BI["Staves"], nil },
    { BI["Weapon"], BI["Wands"], nil },
  },
  ["ROGUE"] = {
    { BI["Armor"], BI["Miscellaneous"], nil },
    -- { BI["Weapon"], BI["Fishing Poles"], nil },
    { BI["Armor"], BI["Cloth"], INVTYPE_CLOAK },
    { BI["Armor"], BI["Leather"], nil },
    { BI["Weapon"], nil, INVTYPE_HOLDABLE },
    { BI["Weapon"], BI["Daggers"], nil },
    { BI["Weapon"], BI["One-Handed Maces"], nil },
    { BI["Weapon"], BI["One-Handed Axes"], nil },
    { BI["Weapon"], BI["One-Handed Swords"], nil },
    { BI["Weapon"], BI["Fist Weapons"], nil },
    { BI["Weapon"], BI["Bows"], nil },
    { BI["Weapon"], BI["Guns"], nil },
    { BI["Weapon"], BI["Crossbows"], nil },
    { BI["Weapon"], BI["Thrown"], nil },
  },
  ["HUNTER"] = {
    { BI["Armor"], BI["Miscellaneous"], nil },
    -- { BI["Weapon"], BI["Fishing Poles"], nil },
    { BI["Armor"], BI["Cloth"], INVTYPE_CLOAK },
    { BI["Armor"], BI["Leather"], nil },
    { BI["Armor"], BI["Mail"], nil },
    { BI["Weapon"], BI["Daggers"], nil },
    { BI["Weapon"], BI["Staves"], nil },
    { BI["Weapon"], BI["One-Handed Axes"], nil },
    { BI["Weapon"], BI["Polearm"], nil },
    { BI["Weapon"], BI["One-Handed Swords"], nil },
    { BI["Weapon"], BI["Fist Weapons"], nil },
    { BI["Weapon"], BI["Two-Handed Axes"], nil },
    { BI["Weapon"], BI["Two-Handed Swords"], nil },
    { BI["Weapon"], BI["Bows"], nil },
    { BI["Weapon"], BI["Guns"], nil },
    { BI["Weapon"], BI["Crossbows"], nil },  
  },
  ["SHAMAN"] = {
    { BI["Armor"], BI["Miscellaneous"], nil },
    -- { BI["Weapon"], BI["Fishing Poles"], nil },
    { BI["Armor"], BI["Cloth"], nil },
    { BI["Armor"], BI["Leather"], nil },
    { BI["Armor"], BI["Mail"], nil },
    { BI["Weapon"], BI["Daggers"], nil },
    { BI["Weapon"], BI["One-Handed Maces"], nil },
    { BI["Weapon"], BI["Staves"], nil },
    { BI["Weapon"], BI["One-Handed Axes"], nil },
    { BI["Weapon"], BI["Fist Weapons"], nil },
    { BI["Weapon"], BI["Two-Handed Maces"], nil },
    { BI["Weapon"], BI["Two-Handed Axes"], nil },
    { BI["Armor"], BI["Shields"], nil },
    { BI["Armor"], BI["Totems"], nil },
  },
  ["WARLOCK"] = {
    { BI["Armor"], BI["Miscellaneous"], nil },
    -- { BI["Weapon"], BI["Fishing Poles"], nil },
    { BI["Armor"], BI["Cloth"], nil },
    { BI["Weapon"], BI["Daggers"], nil },
    { BI["Weapon"], BI["Staves"], nil },
    { BI["Weapon"], BI["One-Handed Swords"], nil },
    { BI["Weapon"], BI["Wands"], nil },
  },
  ["WARRIOR"] = {
    { BI["Armor"], BI["Miscellaneous"], nil },
    -- { BI["Weapon"], BI["Fishing Poles"], nil },
    { BI["Armor"], BI["Leather"], nil },
    { BI["Armor"], BI["Mail"], nil },
    { BI["Armor"], BI["Plate"], nil },
    { BI["Weapon"], BI["Daggers"], nil },
    { BI["Weapon"], BI["One-Handed Maces"], nil },
    { BI["Weapon"], BI["Staves"], nil },
    { BI["Weapon"], BI["One-Handed Axes"], nil },
    { BI["Weapon"], BI["Polearm"], nil },
    { BI["Weapon"], BI["One-Handed Swords"], nil },
    { BI["Weapon"], BI["Fist Weapons"], nil },
    { BI["Weapon"], BI["Two-Handed Maces"], nil },
    { BI["Weapon"], BI["Two-Handed Axes"], nil },
    { BI["Weapon"], BI["Two-Handed Swords"], nil },
    { BI["Armor"], BI["Shields"], nil },
    { BI["Weapon"], BI["Bows"], nil },
    { BI["Weapon"], BI["Guns"], nil },
    { BI["Weapon"], BI["Crossbows"], nil },
    { BI["Weapon"], BI["Thrown"], nil },
  },
};

function module:OnEnable()
  self:RegisterDefaultVariables(self.ConfigOptions_RuleDefaults);
  self:AddWidget(self.Widget);
  self:CheckDBVersion(1, "UpgradeDatabase");
  local _, Class = UnitClass("player");
  self.ClassTable = self.Wearable[Class];
  if ( not self.ClassTable ) then
    self:Print("Unable to figure out what class we are.");
    self:Disable();
  end
end

function module:OnDisable()
  self:UnregisterDefaultVariables();
  self:RemoveWidgets();
end

function module:UpgradeDatabase(FromVersion, Rule)
end

function module:CreateWidget()
  local Widget = CreateFrame("Frame", "PassLoot_Frames_Widgets_Equipable", nil, "UIDropDownMenuTemplate");
  Widget:EnableMouse(true);
  Widget:SetHitRectInsets(15, 15, 0 ,0);
  _G[Widget:GetName().."Text"]:SetJustifyH("CENTER");
  if ( select(4, GetBuildInfo()) < 30000 ) then
    UIDropDownMenu_SetWidth(120, Widget);
  else
    UIDropDownMenu_SetWidth(Widget, 120);
  end
  Widget:SetScript("OnEnter", function() self:ShowTooltip(L["Equipable"], L["Selected rule will only match items that are equipable."]) end);
  Widget:SetScript("OnLeave", function() GameTooltip:Hide() end);
  local Button = _G[Widget:GetName().."Button"];
  Button:SetScript("OnEnter", function() self:ShowTooltip(L["Equipable"], L["Selected rule will only match items that are equipable."]) end);
  Button:SetScript("OnLeave", function() GameTooltip:Hide() end);
  local Title = Widget:CreateFontString(Widget:GetName().."Title", "BACKGROUND", "GameFontNormalSmall");
  Title:SetParent(Widget);
  Title:SetPoint("BOTTOMLEFT", Widget, "TOPLEFT", 20, 0);
  Title:SetText(L["Equipable"]);
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
  Widget.PreferredPriority = 4;
  Widget.Info = {
    L["Equipable"],
    L["Selected rule will only match items that are equipable."],
  };
  return Widget;
end
module.Widget = module:CreateWidget();

-- Local function to get the data and make sure it's valid data
function module.Widget:GetData(RuleNum)
  local Data = module:GetConfigOption("Equipable", RuleNum);
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
    module:SetConfigOption("Equipable", Data);
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
  module:SetConfigOption("Equipable", Value);
end

function module.Widget:RemoveFilter(Index)
  local Value = self:GetData();
  table.remove(Value, Index);
  module:SetConfigOption("Equipable", Value);
end

function module.Widget:DisplayWidget(Index)
  if ( Index ) then
    module.FilterIndex = Index;
  end
  local Value = self:GetData();
  if ( select(4, GetBuildInfo()) < 30000 ) then
    UIDropDownMenu_SetText(module:GetEquipableText(Value[module.FilterIndex][1]), module.Widget);
  else
    UIDropDownMenu_SetText(module.Widget, module:GetEquipableText(Value[module.FilterIndex][1]));
  end
end

function module.Widget:GetFilterText(Index)
  local Value = self:GetData();
  return module:GetEquipableText(Value[Index][1]);
end

function module.Widget:IsException(RuleNum, Index)
  local Data = self:GetData(RuleNum);
  return Data[Index][2];
end

function module.Widget:SetException(RuleNum, Index, Value)
  local Data = self:GetData(RuleNum);
  Data[Index][2] = Value;
  module:SetConfigOption("Equipable", Data);
end

function module.Widget:ColorCheck(Red, Green, Blue, Alpha)
  Red = math.floor(Red * 255 + 0.5);
  Green = math.floor(Green * 255 + 0.5);
  Blue = math.floor(Blue * 255 + 0.5);
  Alpha = math.floor(Alpha * 255 + 0.5);
  return ( Red == 255 and Green == 32 and Blue == 32 and Alpha == 255 );
end

function module.Widget:SetMatch(ItemLink, Tooltip)
  local CanEquip, Usable;
  if ( IsEquippableItem(ItemLink) ) then
    local _, _, _, _, _, ItemType, ItemSubType, _, EquipLoc, _, _ = GetItemInfo(ItemLink);
    if ( TypeSubTypes[ItemType] ) then  -- We check for this Type
      if ( not TypeSubTypes[ItemType][ItemSubType] ) then  -- We don't check for this SubType
        ItemSubType = nil;
      end
    else  -- We don't check for this Type
      ItemType = nil;
    end
    if ( not EquipSlots[EquipLoc] ) then  -- We don't check for this EquipSlot
      EquipLoc = nil;
    end
    for Key, Value in pairs(module.ClassTable) do
      if ( ( not Value[1] or not ItemType or Value[1] == ItemType )
      and ( not Value[2] or not ItemSubType or Value[2] == ItemSubType )
      and ( not Value[3] or not EquipLoc or Value[3] == EquipLoc ) ) then
        CanEquip = true;
        break;
      end
    end
    -- Reasons for not being able to equip it: (I'll just scan the tooltip for red text again)
    -- 1 - We havn't learned the skill yet
    -- 2 - Our level is below the required level.
    if ( CanEquip ) then
      Usable = true;
      local Line, Text, Red, Green, Blue, Alpha;
      for Index = 2, Tooltip:NumLines() do
        Line = _G[Tooltip:GetName().."TextLeft"..Index];
        if ( Line ) then
          Text = Line:GetText();
          if ( Text and Text ~= "" ) then
            Red, Green, Blue, Alpha = Line:GetTextColor();
            if ( string.find(Text, "^\n") ) then
              break;
            end
            if ( self:ColorCheck(Red, Green, Blue, Alpha) ) then
              Usable = false;  -- Unusable
              break;
            end
          end
        end
        Line = _G[Tooltip:GetName().."TextRight"..Index];
        if ( Line ) then
          Text = Line:GetText();
          if ( Text and Text ~= "" ) then  -- Check right side, as it might be armor type/weapon stuff
            Red, Green, Blue, Alpha = Line:GetTextColor();
            if ( self:ColorCheck(Red, Green, Blue, Alpha) ) then
              Usable = false;  -- Unusable
              break;
            end
          end
        end  -- if Line
      end  -- for Index = 2, Tooltip:NumLines()
    end  -- CanEquip
  end  -- IsEquippable()
  -- 1 = Any
  -- 2 = Never
  -- 3 = Now
  -- 4 = Later
  if ( CanEquip ) then
    if ( Usable ) then
      module.CurrentMatch = 3;
    else
      module.CurrentMatch = 4;
    end
  else
    module.CurrentMatch = 2;
  end
  module:Debug(string.format("Can Equip: %s, Now: %s", CanEquip and "true" or "false", Usable and "true" or "false"));
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
  self:SetConfigOption("Equipable", Value);
  if ( select(4, GetBuildInfo()) < 30000 ) then
    UIDropDownMenu_SetText(Frame:GetText(), Frame.owner);
  else
    UIDropDownMenu_SetText(Frame.owner, Frame:GetText());
  end
end

function module:GetEquipableText(Num)
  for Key, Value in ipairs(self.Choices) do
    if ( Value.Value == Num ) then
      return Value.Name;
    end
  end
  return "";
end

