local ZGV = ZygorGuidesViewer

local ItemScore = {}
ZGV.ItemScore = ItemScore
local L = ZGV.L

-- Stat keywords:
-- Only stats defined in this table are valid. Use entry in blizz when filling rule sets

local locale=GetLocale()
if locale=="enGB" then locale="enUS" end  -- just in case.


ItemScore.Keywords = {
	{blizz="AGILITY", zgvdisplay="Agility",pattern="ITEM_MOD_AGILITY"},
	{blizz="INTELLECT", zgvdisplay="Intellect",pattern="ITEM_MOD_INTELLECT"},
	{blizz="SPIRIT", zgvdisplay="Spirit",pattern="ITEM_MOD_SPIRIT"},
	{blizz="STAMINA", zgvdisplay="Stamina",pattern="ITEM_MOD_STAMINA"},
	{blizz="STRENGTH", zgvdisplay="Strength",pattern="ITEM_MOD_STRENGTH"},
	{blizz="ARMOR", zgvdisplay="Armor",pattern="ARMOR_TEMPLATE"}, -- base armor on gear
	{blizz="ARMOR_PENETRATION", zgvdisplay="Armor Penetration",pattern="ITEM_MOD_ARMOR_PENETRATION_RATING"},
	{blizz="ATTACK_POWER", zgvdisplay="Attack Power",pattern="ITEM_MOD_ATTACK_POWER"},
	{blizz="BLOCK", zgvdisplay="Block",pattern="ITEM_MOD_BLOCK_RATING"}, -- incorrect, tooltip misses word shield
	{blizz="BLOCK_VALUE", zgvdisplay="Block Value",pattern="ITEM_MOD_BLOCK_VALUE"},
	{blizz="CRIT", zgvdisplay="Critical Strike %",pattern="ITEM_MOD_CRIT_RATING"},
	{blizz="CRIT_MELEE", zgvdisplay="Critical Strike Melee %",pattern="ITEM_MOD_CRIT_MELEE_RATING"},
	{blizz="CRIT_RANGED", zgvdisplay="Critical Strike Ranged %",pattern="ITEM_MOD_CRIT_RANGED_RATING"},
	--{blizz="CRIT_SPELL", zgvdisplay="Critical Strike Spell% ",pattern="ITEM_MOD_CRIT_SPELL_RATING"},
	{blizz="DAMAGE_PER_SECOND", zgvdisplay="Damage Per Second",pattern="DPS_TEMPLATE"},
	{blizz="DEFENSE_SKILL", zgvdisplay="Defense",pattern="ITEM_MOD_DEFENSE_SKILL_RATING"},
	{blizz="DODGE", zgvdisplay="Dodge",pattern="ITEM_MOD_DODGE_RATING"},
	{blizz="EXTRA_ARMOR", zgvdisplay="Extra Armor",pattern="ITEM_MOD_EXTRA_ARMOR"},
	{blizz="EXPERTISE", zgvdisplay="Expertise",pattern="ITEM_MOD_EXPERTISE_RATING"},
	{blizz="FERAL_ATTACK_POWER", zgvdisplay="Feral Attack Power",pattern="ITEM_MOD_FERAL_ATTACK_POWER"},
	{blizz="HASTE", zgvdisplay="Haste",pattern="ITEM_MOD_HASTE_RATING"},
	--{blizz="HASTE_SPELL", zgvdisplay="Haste Spell",pattern="ITEM_MOD_HASTE_MELEE_RATING"},
	{blizz="HASTE_MEELE", zgvdisplay="Haste Spell",pattern="ITEM_MOD_HASTE_SPELL_RATING"},
	{blizz="HASTE_RANGED", zgvdisplay="Haste Spell",pattern="ITEM_MOD_HASTE_RANGED_RATING"},
	{blizz="HEALTH_REGENERATION", zgvdisplay="Health Regeneration",pattern="ITEM_MOD_HEALTH_REGEN"},
	{blizz="HEALTH", zgvdisplay="Health",pattern="ITEM_MOD_HEALTH"},
	{blizz="HIT", zgvdisplay="Hit",pattern="ITEM_MOD_HIT_RATING"},
	{blizz="HIT_MELEE", zgvdisplay="Hit Melee %",pattern="ITEM_MOD_HIT_MELEE_RATING"},
	{blizz="HIT_RANGED", zgvdisplay="Hit Ranged %",pattern="ITEM_MOD_HIT_RANGED_RATING"},
	--{blizz="HIT_SPELL", zgvdisplay="Hit Spell %",pattern="ITEM_MOD_HIT_SPELL_RATING"},
	{blizz="MANA", zgvdisplay="Mana",pattern="ITEM_MOD_MANA"},
	{blizz="MANA_REGENERATION", zgvdisplay="Mana Regeneration",pattern="ITEM_MOD_MANA_REGENERATION"},
	{blizz="PARRY", zgvdisplay="Parry",pattern="ITEM_MOD_PARRY_RATING"},
	{blizz="RANGED_ATTACK_POWER", zgvdisplay="Ranged Attack Power",pattern="ITEM_MOD_RANGED_ATTACK_POWER"},
	--{blizz="SPELL_DAMAGE_DONE", zgvdisplay="Spell Bonus Damage",pattern="ITEM_MOD_SPELL_DAMAGE_DONE"},
	--{blizz="SPELL_HEALING_DONE", zgvdisplay="Spell Bonus Healing",pattern="ITEM_MOD_SPELL_HEALING_DONE"},
	{blizz="SPELL_PENETRATION", zgvdisplay="Spell Penetration",pattern="ITEM_MOD_SPELL_PENETRATION"},
	{blizz="SPELL_POWER", zgvdisplay="Spell Power",pattern="ITEM_MOD_SPELL_POWER"},
	{blizz="SPELL_DAMAGE_DONE_HOLY", zgvdisplay="Spell Damage Holy"},
	{blizz="SPELL_DAMAGE_DONE_FIRE", zgvdisplay="Spell Damage Fire"},
	{blizz="SPELL_DAMAGE_DONE_NATURE", zgvdisplay="Spell Damage Nature"},
	{blizz="SPELL_DAMAGE_DONE_FROST", zgvdisplay="Spell Damage Frost"},
	{blizz="SPELL_DAMAGE_DONE_SHADOW", zgvdisplay="Spell Damage Shadow"},
	{blizz="SPELL_DAMAGE_DONE_ARCANE", zgvdisplay="Spell Damage Arcane"},

	{blizz="HOLY_RESISTANCE", zgvdisplay="Resistance Holy", regex = ITEM_RESIST_SINGLE and _G["SPELL_SCHOOL1_CAP"] and ITEM_RESIST_SINGLE:gsub("%%s",_G["SPELL_SCHOOL1_CAP"])},
	{blizz="FIRE_RESISTANCE", zgvdisplay="Resistance Fire", regex = ITEM_RESIST_SINGLE and _G["SPELL_SCHOOL2_CAP"] and ITEM_RESIST_SINGLE:gsub("%%s",_G["SPELL_SCHOOL2_CAP"])},
	{blizz="NATURE_RESISTANCE", zgvdisplay="Resistance Nature", regex = ITEM_RESIST_SINGLE and _G["SPELL_SCHOOL3_CAP"] and ITEM_RESIST_SINGLE:gsub("%%s",_G["SPELL_SCHOOL3_CAP"])},
	{blizz="FROST_RESISTANCE", zgvdisplay="Resistance Frost", regex = ITEM_RESIST_SINGLE and _G["SPELL_SCHOOL4_CAP"] and ITEM_RESIST_SINGLE:gsub("%%s",_G["SPELL_SCHOOL4_CAP"])},
	{blizz="SHADOW_RESISTANCE", zgvdisplay="Resistance Shadow", regex = ITEM_RESIST_SINGLE and _G["SPELL_SCHOOL5_CAP"] and ITEM_RESIST_SINGLE:gsub("%%s",_G["SPELL_SCHOOL5_CAP"])},
	{blizz="ARCANE_RESISTANCE", zgvdisplay="Resistance Arcane", regex = ITEM_RESIST_SINGLE and _G["SPELL_SCHOOL6_CAP"] and ITEM_RESIST_SINGLE:gsub("%%s",_G["SPELL_SCHOOL6_CAP"])},

	--{blizz="SPELL_HEAL_DAMAGE", multi={"SPELL_DAMAGE_DONE","SPELL_HEALING_DONE"}},

}

for i,v in pairs(ItemScore.Keywords) do -- convert blizzard templates to lua regex match
	local regex,regex2
	v.regexs = {}

	-- try to use defined patterns
	if v.pattern or v.regex then
		regex = v.regex or _G[v.pattern]
		if regex then
			regex = regex:gsub("1%$",""):gsub("2%$",""):gsub("3%$",""):gsub("4%$","")
			regex = regex:gsub("%(","%%("):gsub("%)","%%)"):gsub("%%d","([0-9]+)"):gsub("%%c","([+-]+)"):gsub("%%s","([0-9.]+)"):gsub("%%([0-9]+)%$","%%").."$"
			regex = regex:lower()

			local short = v.pattern and _G[v.pattern.."_SHORT"]
			if short then
				if locale=="koKR" or locale=="zhCN" or locale=="zhTW" then
					regex2 = "^"..short.." ([+-]+)([0-9]+)".."$"
				else
					regex2 = "^".."([+-]+)([0-9]+) "..short.."$"
				end
				regex2 = regex2:lower()
			end

			if regex==regex2 then regex2=nil end
			table.insert(v.regexs,regex)
			table.insert(v.regexs,regex2)
		end
	end

	-- try to pull from localisation files
	local pattern = L[v.blizz]
	if pattern ~= v.blizz then table.insert(v.regexs,pattern:lower()) end
	for i=2,10 do
		local pattern = L[v.blizz..i]
		if pattern ~= v.blizz..i then table.insert(v.regexs,pattern:lower()) end
	end
end

ItemScore.KnownKeyWords = {}
for i,v in pairs(ItemScore.Keywords) do -- create lookup table for use in popups, since GetItemStats/Delta fails on suffix items, and we need to use our cached data instead
	ItemScore.KnownKeyWords[v.blizz] = v.zgvdisplay
end

ItemScore.ProtectedGear = {}
ItemScore.Unique_Equipped_Families = { }-- those items are unique equipped, but do not return GetItemUniqueness values

ItemScore.FixedLevelHeirloom = {}

ItemScore.HeirloomBonuses = {}

-- what stats are available on gems depending on source expansion
ItemScore.GemStatsByExp = {
--	[1] = {"STRENGTH", "INTELLECT", "AGILITY", "STAMINA", "HASTE", "VERSATILITY", "MASTERY", "CRIT", "PARRY", "DODGE"}, -- tbc
}

-- details about gems based on expansions and rarity. ilvl of socketed item required for gem to fit it, and how point budget changes with player level
ItemScore.GemData = { -- from level [a] gem gives b points
	--[2] = { -- uncommon
	--	[1] = { ilvl=1,   points={[1]=3, [59]=4}}, -- tbc
	--},
	--[3] = { -- rare
	--	[1] = { ilvl=1,   points={[1]=4, [59]=5}}, -- tbc
	--},
	--[4] = { -- epic
	--	[1] = { ilvl=1,   points={[1]=5, [59]=6}}, -- tbc
	--}
}


ItemScore.Item_Weapon_Types = {
	[0] = "AXE",
	[1] = "TH_AXE",
	[2] = "BOW",
	[3] = "GUN",
	[4] = "MACE",
	[5] = "TH_MACE",
	[6] = "TH_POLE",
	[7] = "SWORD",
	[8] = "TH_SWORD",
	[9] = "WARGLAIVE",
	[10] = "TH_STAFF",
	[11] = "DRUID_BEAR",
	[12] = "DRUID_CAT",
	[13] = "FIST",
	[14] = "MISCWEAP",
	[15] = "DAGGER",
	[16] = "THROWN",
	[17] = "SPEAR",
	[18] = "CROSSBOW",
	[19] = "WAND",
	[20] = "FISHPOLE",
	}

ItemScore.Item_Armor_Types = {
	[0] = "JEWELERY", -- necklace, rings and trinkets, also some cosmetic armor
	[1] = "CLOTH",
	[2] = "LEATHER",
	[3] = "MAIL",
	[4] = "PLATE",
	[5] = "COSMETIC",
	[6] = "SHIELD",
	}

ItemScore.TypeToSlot = {
	INVTYPE_WEAPON = INVSLOT_MAINHAND, -- dual wield handled in GetValidSlots
	INVTYPE_WEAPONMAINHAND = INVSLOT_MAINHAND,
	INVTYPE_2HWEAPON = INVSLOT_MAINHAND, -- titan fury hanndled in GetValidSlots
	INVTYPE_WEAPONOFFHAND = INVSLOT_OFFHAND,
	INVTYPE_SHIELD = INVSLOT_OFFHAND,
	INVTYPE_THROWN = INVSLOT_RANGED,
	INVTYPE_RANGED = INVSLOT_RANGED,
	INVTYPE_RANGEDRIGHT = INVSLOT_RANGED,
	INVTYPE_HOLDABLE = INVSLOT_OFFHAND,
	INVTYPE_HEAD = INVSLOT_HEAD,
	INVTYPE_NECK = INVSLOT_NECK,
	INVTYPE_SHOULDER = INVSLOT_SHOULDER,
	INVTYPE_BODY = INVSLOT_BODY,
	INVTYPE_CLOAK = INVSLOT_BACK,
	INVTYPE_CHEST = INVSLOT_CHEST,
	INVTYPE_ROBE = INVSLOT_CHEST,
	INVTYPE_WRIST = INVSLOT_WRIST,
	INVTYPE_HAND = INVSLOT_HAND,
	INVTYPE_WAIST = INVSLOT_WAIST,
	INVTYPE_LEGS = INVSLOT_LEGS,
	INVTYPE_FEET = INVSLOT_FEET,
	INVTYPE_FINGER = INVSLOT_FINGER1, -- second slot handled in GetValidSlots
	INVTYPE_TRINKET = INVSLOT_TRINKET1, -- second slot handled in GetValidSlots
	INVTYPE_TABARD = INVSLOT_TABARD,
}

ItemScore.SkillNames = { -- gets trimmed in a moment										-- needs checking
	DUALWIELD = {id=118,	enUS="Dual Wield",	deDE="Beidhändigkeit",	esES="Doble empuñadura",	esMX="Doble empuñadura",	frFR="Ambidextrie",	ptBR="Empunhar Duas Armas",	ruRU="Бой двумя оружиями",	koKR="쌍수 무기",	zhCN="双武器",	zhTW="雙武器",	enGB="Dual Wield",	ptPT="Empunhar Duas Armas",},
	SWORD = {id=43,	enUS="Swords",	deDE="Schwerter",	esES="Espadas",	esMX="Espadas",	frFR="Epées",	ptBR="Espadas",	ruRU="Мечи",	koKR="도검류",	zhCN="单手剑",	zhTW="劍",	enGB="Swords",	ptPT="Espadas",},
	WAND = {id=228,	enUS="Wands",	deDE="Zauberstäbe",	esES="Varitas",	esMX="Varitas",	frFR="Baguettes",	ptBR="Varinhas",	ruRU="Жезлы",	koKR="마법봉류",	zhCN="魔杖",	zhTW="魔杖",	enGB="Wands",	ptPT="Varinhas",},
	TH_SWORD = {id=55,	enUS="Two-Handed Swords",	deDE="Zweihandschwerter",	esES="Espadas de dos manos",	esMX="Espadas de dos manos",	frFR="Epées à deux mains",	ptBR="Espadas de Duas Mãos",	ruRU="Двуручные мечи",	koKR="양손 도검류",	zhCN="双手剑",	zhTW="雙手劍",	enGB="Two-Handed Swords",	ptPT="Espadas de Duas Mãos",},
	THROWN = {id=176,	enUS="Thrown",	deDE="Wurfwaffen",	esES="Armas arrojadizas",	esMX="Armas arrojadizas",	frFR="Armes de jet",	ptBR="Arremesso",	ruRU="Метательное оружие",	koKR="투척 무기류",	zhCN="投掷武器",	zhTW="投擲武器",	enGB="Thrown",	ptPT="Arremesso",},
	FIST = {id=473,	enUS="Fist Weapons",	deDE="Faustwaffen",	esES="Armas de puño",	esMX="Armas de puño",	frFR="Armes de pugilat",	ptBR="Armas de punho",	ruRU="Кистевое оружие",	koKR="장착 무기류",	zhCN="拳套",	zhTW="拳套",	enGB="Fist Weapons",	ptPT="Armas de punho",},
	TH_MACE = {id=160,	enUS="Two-Handed Maces",	deDE="Zweihandstreitkolben",	esES="Mazas de dos manos",	esMX="Mazas de dos manos",	frFR="Masses à deux mains",	ptBR="Maças de Duas Mãos",	ruRU="Двуручное ударное оружие",	koKR="양손 둔기류",	zhCN="双手锤",	zhTW="雙手錘",	enGB="Two-Handed Maces",	ptPT="Maças de Duas Mãos",},
	TH_AXE = {id=172,	enUS="Two-Handed Axes",	deDE="Zweihandäxte",	esES="Hachas de dos manos",	esMX="Hachas de dos manos",	frFR="Haches à deux mains",	ptBR="Machados de Duas Mãos",	ruRU="Двуручные топоры",	koKR="양손 도끼류",	zhCN="双手斧",	zhTW="雙手斧",	enGB="Two-Handed Axes",	ptPT="Machados de Duas Mãos",},
	AXE = {id=44,	enUS="Axes",	deDE="Äxte",	esES="Hachas",	esMX="Hachas",	frFR="Haches",	ptBR="Machados",	ruRU="Топоры",	koKR="도끼류",	zhCN="单手斧",	zhTW="斧",	enGB="Axes",	ptPT="Machados",},
	GUN = {id=46,	enUS="Guns",	deDE="Schusswaffen",	esES="Armas de fuego",	esMX="Armas de fuego",	frFR="Armes à feu",	ptBR="Armas de Fogo",	ruRU="Ружья",	koKR="총기류",	zhCN="枪械",	zhTW="槍械",	enGB="Guns",	ptPT="Armas de Fogo",},
	TH_POLE = {id=229,	enUS="Polearms",	deDE="Stangenwaffen",	esES="Armas de asta",	esMX="Armas de asta",	frFR="Armes d'hast",	ptBR="Armas de Haste",	ruRU="Древковое оружие",	koKR="장창류",	zhCN="长柄武器",	zhTW="長柄武器",	enGB="Polearms",	ptPT="Armas de Haste",},
	BOW = {id=45,	enUS="Bows",	deDE="Bögen",	esES="Arcos",	esMX="Arcos",	frFR="Arcs",	ptBR="Arcos",	ruRU="Луки",	koKR="활류",	zhCN="弓",	zhTW="弓",	enGB="Bows",	ptPT="Arcos",},
	CROSSBOW = {id=226,	enUS="Crossbows",	deDE="Armbrüste",	esES="Ballestas",	esMX="Ballestas",	frFR="Arbalètes",	ptBR="Bestas",	ruRU="Арбалеты",	koKR="석궁류",	zhCN="弩",	zhTW="弩",	enGB="Crossbows",	ptPT="Bestas",},
	TH_STAFF = {id=136,	enUS="Staves",	deDE="Stäbe",	esES="Bastones",	esMX="Bastones",	frFR="Bâtons",	ptBR="Báculos",	ruRU="Посохи",	koKR="지팡이류",	zhCN="法杖",	zhTW="法杖",	enGB="Staves",	ptPT="Báculos",},
	MACE = {id=54,	enUS="Maces",	deDE="Streitkolben",	esES="Mazas",	esMX="Mazas",	frFR="Masse",	ptBR="Maças",	ruRU="Дробящее оружие",	koKR="둔기류",	zhCN="单手锤",	zhTW="錘",	enGB="Maces",	ptPT="Maças",},
	DAGGER = {id=173,	enUS="Daggers",	deDE="Dolche",	esES="Dagas",	esMX="Dagas",	frFR="Dagues",	ptBR="Adagas",	ruRU="Кинжалы",	koKR="단검류",	zhCN="匕首",	zhTW="匕首",	enGB="Daggers",	ptPT="Adagas",},
	PLATE = {id=293,	enUS="Plate Mail",	deDE="Plattenpanzer",	esES="Malla de placas",	esMX="Malla de placas",	frFR="Armure en plaques",	ptBR="Armadura de Placa",	ruRU="Латы",	koKR="판금 갑옷",	zhCN="板甲",	zhTW="鎧甲",	enGB="Plate Mail",	ptPT="Armadura de Placa",},
	MAIL = {id=413,	enUS="Mail",	deDE="Schwere Rüstung",	esES="Malla",	esMX="Malla",	frFR="Mailles",	ptBR="Malha",	ruRU="Кольчужные доспехи",	koKR="사슬",	zhCN="锁甲",	zhTW="鎖甲",	enGB="Mail",	ptPT="Malha",},
	CLOTH = {id=415,	enUS="Cloth",	deDE="Stoff",	esES="Tela",	esMX="Tela",	frFR="Tissu",	ptBR="Tecido",	ruRU="Ткань",	koKR="천",	zhCN="布甲",	zhTW="布甲",	enGB="Cloth",	ptPT="Tecido",},
	SHIELD = {id=433,	enUS="Shield",	deDE="Schild",	esES="Escudo",	esMX="Escudo",	frFR="Bouclier",	ptBR="Escudo",	ruRU="Щит",	koKR="방패",	zhCN="盾牌",	zhTW="盾牌",	enGB="Shield",	ptPT="Escudo",},
	LEATHER = {id=414,	enUS="Leather",	deDE="Leder",	esES="Cuero",	esMX="Cuero",	frFR="Cuir",	ptBR="Couro",	ruRU="Кожа",	koKR="가죽",	zhCN="皮甲",	zhTW="皮甲",	enGB="Leather",	ptPT="Couro",},
}
ItemScore.SkillNamesRev={}

for i,skillset in pairs(ItemScore.SkillNames) do -- drop other languages
	local name = skillset[locale] or skillset.enUS
	ItemScore.SkillNames[i] = name
	ItemScore.SkillNamesRev[name] = i
end
