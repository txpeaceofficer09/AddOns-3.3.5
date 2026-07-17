local ZGV = ZygorGuidesViewer
if not ZGV then return end

local L = ZGV.L
local G = _G
local FONT = ZGV.Font or STANDARD_TEXT_FONT
local FONTBOLD = ZGV.FontBold or STANDARD_TEXT_FONT

local tinsert,tremove,print,ipairs,pairs,wipe=tinsert,tremove,print,ipairs,pairs,wipe
local Gratuity = LibStub("LibGratuity-3.0")

local ItemScore = ZGV.ItemScore

local function branded_tooltip_header(label)
	return ("|cffffff88Z|cffffee66y|cffffdd44g|cffffcc22o|cffffbb00r|r %s:"):format(label)
end

local function branded_chat_prefix(label)
	return ("|cffffff88Z|cffffee66y|cffffdd44g|cffffcc22o|cffffbb00r|r |cffffaa00%s:|r"):format(label)
end

local function round_score(value)
	if not value then return 0 end
	if value >= 0 then
		return math.floor(value * 10 + 0.5) / 10
	else
		return math.ceil(value * 10 - 0.5) / 10
	end
end

local function clamp_display_percent(percent)
	if not percent then return nil end
	if percent >= 100 then return 99.99 end
	if percent <= -100 then return -99.99 end
	return percent
end

if not ItemScore then return end
LibStub("AceHook-3.0"):Embed(ItemScore)

local item_weapon_types = ItemScore.Item_Weapon_Types
local item_armor_types = ItemScore.Item_Armor_Types
local item_gem_types = ItemScore.Item_Gem_Types

-- Pawn compatibility tables (optional, for import/export)
ItemScore.Gear_PawnToZygor = ItemScore.Gear_PawnToZygor or {}
ItemScore.KeywordsPawnToRules = ItemScore.KeywordsPawnToRules or {}
ItemScore.Gear_ZygorToPawn = ItemScore.Gear_ZygorToPawn or {}

local ItemCache = {}
ItemScore.ItemCache = ItemCache
ItemScore.PendingLootRolls = ItemScore.PendingLootRolls or {}
ItemScore.MasterLootNoticeCooldown = 10
ItemScore.MasterLootRecent = ItemScore.MasterLootRecent or {}
ItemScore.MasterLootSession = ItemScore.MasterLootSession or {}
ItemScore.PendingMasterLootNotice = ItemScore.PendingMasterLootNotice or false

local locale=GetLocale()
if locale=="enGB" then locale="enUS" end  -- just in case.

local function strip_link(itemlink)
	local _,itemstring,_ = itemlink:match("(.*)item:([0-9-:]*)(.*)")
	if itemstring then
		-- Strip all :0: to :: repeatedly until stable
		local result = itemstring
		local prev
		repeat
			prev = result
			result = result:gsub(":0:", "::")
		until result == prev
		-- Also strip trailing :0 sequences
		result = result:gsub(":0$", ":")
		return "item:"..result
	end
	return false
end
ItemScore.strip_link = strip_link

local function add_stat(stats, statname, value)
	if not statname then return end
	value = tonumber(value)
	if not value then return end
	stats[statname] = (stats[statname] or 0) + value
end

local function normalize_label(value)
	if not value then return nil end
	value = tostring(value):gsub("^%s+", ""):gsub("%s+$", ""):lower()
	value = value:gsub("%s+", " ")
	value = value:gsub("%-$", "")
	return value
end

local TYPE_CLASS_ALIASES = {
	armor = LE_ITEM_CLASS_ARMOR,
	weapon = LE_ITEM_CLASS_WEAPON,
}

local EQUIPPABLE_INV_TYPES = {
	INVTYPE_AMMO = true,
	INVTYPE_HEAD = true,
	INVTYPE_NECK = true,
	INVTYPE_SHOULDER = true,
	INVTYPE_BODY = true,
	INVTYPE_CHEST = true,
	INVTYPE_ROBE = true,
	INVTYPE_WAIST = true,
	INVTYPE_LEGS = true,
	INVTYPE_FEET = true,
	INVTYPE_WRIST = true,
	INVTYPE_HAND = true,
	INVTYPE_FINGER = true,
	INVTYPE_TRINKET = true,
	INVTYPE_CLOAK = true,
	INVTYPE_WEAPON = true,
	INVTYPE_SHIELD = true,
	INVTYPE_2HWEAPON = true,
	INVTYPE_WEAPONMAINHAND = true,
	INVTYPE_WEAPONOFFHAND = true,
	INVTYPE_HOLDABLE = true,
	INVTYPE_RANGED = true,
	INVTYPE_THROWN = true,
	INVTYPE_RANGEDRIGHT = true,
	INVTYPE_RELIC = true,
	TYPE = true,
}

local NON_GEAR_INV_TYPES = {
	INVTYPE_AMMO = true,
	INVTYPE_BODY = true,
	INVTYPE_TABARD = true,
}

local NON_GEAR_WEAPON_SUBTYPES = {
	["miscellaneous"] = true,
}

local FAMILY_ALIASES = {
	SWORD = {"sword","swords"},
	TH_SWORD = {"two-handed sword","two-handed swords"},
	AXE = {"axe","axes"},
	TH_AXE = {"two-handed axe","two-handed axes"},
	MACE = {"mace","maces"},
	TH_MACE = {"two-handed mace","two-handed maces"},
	TH_STAFF = {"staff","staves"},
	DAGGER = {"dagger","daggers"},
	FIST = {"fist weapon","fist weapons"},
	TH_POLE = {"polearm","polearms"},
	BOW = {"bow","bows"},
	GUN = {"gun","guns"},
	CROSSBOW = {"crossbow","crossbows"},
	WAND = {"wand","wands"},
	THROWN = {"thrown"},
	FISHPOLE = {"fishing pole","fishing poles"},
	CLOTH = {"cloth"},
	LEATHER = {"leather"},
	MAIL = {"mail"},
	PLATE = {"plate","plate mail"},
	SHIELD = {"shield","shields"},
	JEWELERY = {"miscellaneous","misc", "jewelry", "jewellery"},
}

local canonical_family_lookup
local function build_canonical_family_lookup()
	if canonical_family_lookup then return canonical_family_lookup end
	canonical_family_lookup = {}
	for family, skillName in pairs(ItemScore.SkillNames or {}) do
		local normalized = normalize_label(skillName)
		if normalized then canonical_family_lookup[normalized] = family end
	end
	for family, aliases in pairs(FAMILY_ALIASES) do
		for _, alias in ipairs(aliases) do
			canonical_family_lookup[normalize_label(alias)] = family
		end
	end
	return canonical_family_lookup
end

local function resolve_item_class_id(itemType)
	if not itemType then return nil end
	local classID = TYPE_CLASS_ALIASES[normalize_label(itemType)]
	if classID then return classID end
	local upper = tostring(itemType):upper()
	if upper == "ARMOR" then return LE_ITEM_CLASS_ARMOR end
	if upper == "WEAPON" then return LE_ITEM_CLASS_WEAPON end
	return nil
end

local function resolve_item_family(itemClassID, itemSubType)
	if not itemSubType then return nil, nil end
	local family = build_canonical_family_lookup()[normalize_label(itemSubType)]
	if not family then return nil, nil end
	if itemClassID == LE_ITEM_CLASS_ARMOR then
		for id, name in pairs(ItemScore.Item_Armor_Types or {}) do
			if name == family then return family, id end
		end
	elseif itemClassID == LE_ITEM_CLASS_WEAPON then
		for id, name in pairs(ItemScore.Item_Weapon_Types or {}) do
			if name == family then return family, id end
		end
	end
	return family, nil
end

local function resolve_family_from_equip_loc(itemEquipLoc)
	if itemEquipLoc == "INVTYPE_SHIELD" then return "SHIELD", 6 end
	if itemEquipLoc == "INVTYPE_HOLDABLE" then return "OFFHAND", nil end
	if itemEquipLoc == "INVTYPE_THROWN" then return "THROWN", 16 end
	if itemEquipLoc == "INVTYPE_RANGED" or itemEquipLoc == "INVTYPE_RANGEDRIGHT" then return "MISCARM", nil end
	return nil, nil
end

local function get_item_family(item)
	if not item then return nil end
	local equipFamily = resolve_family_from_equip_loc(item.equiploc or item.type)
	if equipFamily then return equipFamily end
	if item.family then return item.family end
	if item.subtype then
		local normalizedSubtype = normalize_label(item.subtype)
		if normalizedSubtype then
			for family, aliases in pairs(FAMILY_ALIASES) do
				for _, alias in ipairs(aliases) do
					local normalizedAlias = normalize_label(alias)
					if normalizedAlias and (normalizedSubtype == normalizedAlias or normalizedSubtype:find(normalizedAlias, 1, true)) then
						return family
					end
				end
			end
		end
		local subtypeFamily = select(1, resolve_item_family(item.class, item.subtype))
		if subtypeFamily then return subtypeFamily end
	end
	if item.class == LE_ITEM_CLASS_ARMOR then
		return item_armor_types[item.subclass]
	elseif item.class == LE_ITEM_CLASS_WEAPON then
		return item_weapon_types[item.subclass]
	end
	return nil
end

local ARMOR_FAMILY_ORDER = {
	CLOTH = 1,
	LEATHER = 2,
	MAIL = 3,
	PLATE = 4,
}

local CLASS_MAX_ARMOR_FAMILY = {
	WARRIOR = "PLATE",
	PALADIN = "PLATE",
	DEATHKNIGHT = "PLATE",
	HUNTER = "MAIL",
	SHAMAN = "MAIL",
	ROGUE = "LEATHER",
	DRUID = "LEATHER",
	MAGE = "CLOTH",
	WARLOCK = "CLOTH",
	PRIEST = "CLOTH",
}

local SHIELD_CLASSES = {
	WARRIOR = true,
	PALADIN = true,
	SHAMAN = true,
}

local function class_can_use_standard_family(classToken, family, level)
	if not classToken or not family then return nil end
	if family == "SHIELD" then
		return SHIELD_CLASSES[classToken] and true or false
	end
	local wantedRank = ARMOR_FAMILY_ORDER[family]
	if not wantedRank then return nil end
	local maxFamily = CLASS_MAX_ARMOR_FAMILY[classToken]
	local maxRank = maxFamily and ARMOR_FAMILY_ORDER[maxFamily]
	if not maxRank then return false end
	if family == "MAIL" and (classToken == "HUNTER" or classToken == "SHAMAN") and (tonumber(level) or 0) < 40 then
		return false
	end
	if family == "PLATE" and classToken ~= "DEATHKNIGHT" and (tonumber(level) or 0) < 40 then
		return false
	end
	return wantedRank <= maxRank
end

local function get_item_slot_info(item)
	if not item or not item.type or item.type == "" then
		return nil, nil, false, false, "not equipment"
	end
	if not EQUIPPABLE_INV_TYPES[item.type] then
		return nil, nil, false, false, "unsupported slot"
	end
	local slot_1, slot_2, twohander = ItemScore:GetValidSlots(item)
	if not slot_1 then
		return nil, nil, false, false, "unsupported slot"
	end
	return slot_1, slot_2, twohander or false, true, "ok"
end

local function item_is_gear(item)
	if not item or not item.type or NON_GEAR_INV_TYPES[item.type] then
		return false
	end
	if item.class == LE_ITEM_CLASS_WEAPON and item.subtype then
		local normalizedSubtype = normalize_label(item.subtype)
		if normalizedSubtype and NON_GEAR_WEAPON_SUBTYPES[normalizedSubtype] then
			return false
		end
	end
	local _, _, _, equippable = get_item_slot_info(item)
	return equippable and true or false
end

local function clamp_display_percent(percent)
	if not percent then return nil end
	if percent >= 100 then return 99.99 end
	if percent <= -100 then return -99.99 end
	return percent
end

local function get_class_tag(classRef)
	if type(classRef) == "string" then return classRef end
	if type(classRef) == "number" then
		if ZGV.NumberToClass and ZGV.NumberToClass[classRef] then
			return ZGV.NumberToClass[classRef]
		end
		if ZGV.ClassToNumber then
			for tag, id in pairs(ZGV.ClassToNumber) do
				if id == classRef then
					return tag
				end
			end
		end
	end
	return nil
end
	
function ItemScore:Initialise()
	-- apply lower armor types as viable
	for class,classrules in pairs(ItemScore.rules) do
		for spec,rule in pairs(classrules) do
			local stats = rule["stats"]
			local types = rule["itemtypes"]

			stats.DAMAGE_PER_SECOND = stats.DPS stats.DPS = nil -- Switch DPS to the full string.

			-- players use only final armor types, so no fallbacks to lower ones anymore

			types["JEWELERY"] = 1 -- rings, trinkets, necklaces
		end
	end

	-- register all needed events
	self.eventFrame=CreateFrame("Frame")
	ZGV.ChainCall(self.eventFrame)
		:RegisterEvent("LOADING_SCREEN_DISABLED")

		:RegisterEvent("PLAYER_LEVEL_UP")
		:RegisterEvent("PLAYER_EQUIPMENT_CHANGED")
		:RegisterEvent("BAG_UPDATE")
		:RegisterEvent("MAIL_INBOX_UPDATE")
		:RegisterEvent("MAIL_CLOSED")
		:RegisterEvent("GET_ITEM_INFO_RECEIVED")
		:RegisterEvent("ACTIVE_TALENT_GROUP_CHANGED")
		:RegisterEvent("START_LOOT_ROLL")
		:RegisterEvent("CANCEL_LOOT_ROLL")
		:RegisterEvent("LOOT_OPENED")
		:RegisterEvent("LOOT_CLOSED")

		:RegisterEvent("PLAYER_REGEN_DISABLED")
		:RegisterEvent("PLAYER_REGEN_ENABLED")

		:SetScript("OnEvent",function(self,event,...) ItemScore:OnEvent(event,...) end)
		:Show()

	-- 3.3.5a: use talent/skill events instead of retail spec events
	self.eventFrame:RegisterEvent("CHARACTER_POINTS_CHANGED")
	self.eventFrame:RegisterEvent("SKILL_LINES_CHANGED")


	ZGV.UpdateCentral:AddHandler(ItemScore.ItemDetailsHandler)


	ZGV:AddMessageHandler("ZGV_STEP_FINALISED",ItemScore.OnEvent)
	ZGV:AddMessageHandler("LIBROVER_TRAVEL_REPORTED",ItemScore.OnEvent)

	-- create item popup
	ItemScore.Upgrades:CreatePopup()

	-- set up initial data
	ItemScore:RefreshUserData()

	self.Initialised = true
end

-- Fallback build used before talent-based spec detection is meaningful.
-- Baseline source: Wowhead WotLK Classic class leveling overviews (accessed 2026-04-20).
-- This fallback is only for pre-talent / no-points-spent states, so where a guide suggests
-- an early-level split, prefer the early-game recommendation over the end-to-end spec.
ItemScore.LevelingBuildFallback = {
	WARRIOR = 1,
	PALADIN = 3,
	HUNTER = 1,
	ROGUE = 2,
	PRIEST = 1,
	DEATHKNIGHT = 3,
	SHAMAN = 2,
	MAGE = 3,
	WARLOCK = 1,
	DRUID = 2,
}

function ItemScore:GetFallbackBuildForClass(classToken)
	return (classToken and self.LevelingBuildFallback[classToken]) or 1
end

function ItemScore:GetActiveTalentGroup()
	if not GetActiveTalentGroup then return nil end
	local candidates = {
		function() return GetActiveTalentGroup() end,
		function() return GetActiveTalentGroup(false, false) end,
	}
	for _, getter in ipairs(candidates) do
		local ok, group = pcall(getter)
		if ok and tonumber(group) and tonumber(group) > 0 then
			return tonumber(group)
		end
	end
	return nil
end

function ItemScore:GetTalentState(classToken, level)
	level = tonumber(level) or 0
	local fallbackBuild = self:GetFallbackBuildForClass(classToken)
	local activeTalentGroup = self:GetActiveTalentGroup()
	local treePoints = {}
	local bestTree, bestPoints, totalPoints = fallbackBuild, 0, 0
	local numTabs = GetNumTalentTabs and GetNumTalentTabs() or 0

	for i = 1, numTabs do
		local _, _, pointsSpent
		if activeTalentGroup and activeTalentGroup > 0 then
			_, _, pointsSpent = GetTalentTabInfo(i, false, false, activeTalentGroup)
		else
			_, _, pointsSpent = GetTalentTabInfo(i)
		end
		pointsSpent = tonumber(pointsSpent) or 0
		treePoints[i] = pointsSpent
		totalPoints = totalPoints + pointsSpent
		if pointsSpent > bestPoints then
			bestPoints = pointsSpent
			bestTree = i
		end
	end

	local availablePoints
	if UnitCharacterPoints then
		local ok, value = pcall(UnitCharacterPoints, "player")
		if ok then
			availablePoints = tonumber(value)
		end
	end

	local preTalentState = false
	local uncertain = false
	if level < 10 then
		preTalentState = true
	elseif totalPoints == 0 then
		if level == 10 then
			preTalentState = true
		elseif availablePoints and availablePoints > 0 then
			preTalentState = true
		else
			uncertain = true
		end
	end

	return {
		activeTalentGroup = activeTalentGroup,
		treePoints = treePoints,
		bestTree = bestTree,
		bestPoints = bestPoints,
		totalPoints = totalPoints,
		availablePoints = availablePoints,
		preTalentState = preTalentState,
		uncertain = uncertain,
	}
end

function ItemScore:ClearPreTalentOverride()
	ZGV.db.char.gear_pre_talent_override_build = nil
	ZGV.db.char.gear_pre_talent_override_explicit = nil
end

function ItemScore:GetActiveBuildOverrideTable()
	ZGV.db.char.gear_active_build_override_by_group = ZGV.db.char.gear_active_build_override_by_group or {}
	return ZGV.db.char.gear_active_build_override_by_group
end

function ItemScore:GetActiveTalentGroupKey()
	return tonumber(self:GetActiveTalentGroup()) or 1
end

function ItemScore:ClearActiveBuildOverride(groupKey)
	local overrides = self:GetActiveBuildOverrideTable()
	if groupKey then
		overrides[tonumber(groupKey) or 1] = nil
	elseif ZGV.db.char.gear_active_build_override_by_group then
		wipe(ZGV.db.char.gear_active_build_override_by_group)
	end
	ZGV.db.char.gear_active_build_override_enabled = nil
	ZGV.db.char.gear_active_build_override_build = nil
end

function ItemScore:SetActiveBuildOverride(buildNum, groupKey)
	buildNum = tonumber(buildNum)
	if not buildNum then return end
	groupKey = tonumber(groupKey) or self:GetActiveTalentGroupKey()
	self:GetActiveBuildOverrideTable()[groupKey] = buildNum
	ZGV.db.char.gear_active_build_override_enabled = true
	ZGV.db.char.gear_active_build_override_build = buildNum
end

function ItemScore:GetActiveBuildOverrideBuild(classToken, groupKey)
	if not classToken or classToken ~= self.playerclass then return nil, false end
	groupKey = tonumber(groupKey) or self:GetActiveTalentGroupKey()
	local overrideBuild = tonumber(self:GetActiveBuildOverrideTable()[groupKey])
	local classRules = self.rules and self.rules[classToken]
	if classRules and overrideBuild and classRules[overrideBuild] then
		return overrideBuild, true
	end
	if overrideBuild then
		self:ClearActiveBuildOverride(groupKey)
	end
	return nil, false
end

function ItemScore:GetActiveBuildSourceLabel()
	if self:GetActiveBuildOverrideBuild(self.playerclass, self:GetActiveTalentGroupKey()) then
		return "Overridden build"
	end
	return "Detected build"
end

function ItemScore:GetPreTalentOverrideBuild(classToken, level, talentState)
	if not ZGV.db.char.gear_pre_talent_override_explicit then return nil, false end
	if not classToken or classToken ~= self.playerclass then return nil, false end
	talentState = talentState or self:GetTalentState(classToken, level)
	if not talentState or not talentState.preTalentState then return nil, false end
	local overrideBuild = tonumber(ZGV.db.char.gear_pre_talent_override_build)
	local classRules = self.rules and self.rules[classToken]
	if classRules and overrideBuild and classRules[overrideBuild] then
		return overrideBuild, true
	end
	self:ClearPreTalentOverride()
	return nil, false
end

function ItemScore:GetResolvedBuild(classToken, level, buildNum)
	level = tonumber(level) or level
	local classRules = classToken and self.rules and self.rules[classToken]
	if not classRules then
		return buildNum or 1, false
	end
	local fallbackBuild = self:GetFallbackBuildForClass(classToken)
	if level and level < 10 then
		return classRules[fallbackBuild] and fallbackBuild or 1, true
	end
	if buildNum and classRules[buildNum] then
		return buildNum, false
	end
	return classRules[fallbackBuild] and fallbackBuild or 1, false
end

function ItemScore:DetectActiveBuild(classToken, level)
	local fallbackBuild = self:GetFallbackBuildForClass(classToken)
	local classRules = classToken and self.rules and self.rules[classToken]
	local talentState = self:GetTalentState(classToken, level)
	if not classToken or talentState.preTalentState then
		return fallbackBuild, true
	end
	local activeTalentGroup = talentState.activeTalentGroup
	local pointsTree = talentState.totalPoints > 0 and talentState.bestTree or nil
	local pointsFallback = talentState.totalPoints > 0 and false or nil

	-- Druid Feral specialization detection
	if classToken == "DRUID" and pointsTree == 2 then
		-- Check points in Thick Hide talent (position 11 in Feral tree)
		local _, _, pointsThickHide = GetTalentInfo(2, 11, false, false, activeTalentGroup)
		
		-- 2+ points in this talent = Tank build
		if pointsThickHide and pointsThickHide >= 2 then
			return 3, false
		else
			return 2, false
		end
	end

	if pointsTree and classRules and classRules[pointsTree] then
		return pointsTree, pointsFallback
	end

	if GetPrimaryTalentTree then
		local tree
		if activeTalentGroup then
			local ok, result = pcall(GetPrimaryTalentTree, false, false, activeTalentGroup)
			if ok and tonumber(result) and tonumber(result) > 0 then
				tree = tonumber(result)
			end
		end
		if not tree then
			local ok, result = pcall(GetPrimaryTalentTree, false, false)
			if ok and tonumber(result) and tonumber(result) > 0 then
				tree = tonumber(result)
			end
		end
		if tree and classRules and classRules[tree] then
			return tree, false
		end
	end
	return fallbackBuild, true
end

function ItemScore:GetBuildName(classRef, buildNum, level, usesFallback)
	local classToken, classNum = classRef, nil
	if type(classRef) == "number" then
		classNum = classRef
		classToken = get_class_tag(classNum)
	elseif type(classRef) == "string" then
		classNum = ZGV.ClassToNumber and ZGV.ClassToNumber[classRef]
	end
	local resolvedBuild = buildNum
	local classRules = classToken and self.rules and self.rules[classToken]
	if classToken and (not resolvedBuild or not classRules or not classRules[resolvedBuild]) then
		resolvedBuild = self:GetResolvedBuild(classToken, level, buildNum)
		usesFallback = true
	end
	local buildLabel = (classNum and self.Builds and self.Builds[classNum] and self.Builds[classNum][resolvedBuild])
		or (classToken and ZGV.SpecByNumber and ZGV.SpecByNumber[classToken] and ZGV.SpecByNumber[classToken][resolvedBuild])
	local fallbackBuild = classToken and self:GetFallbackBuildForClass(classToken) or 1
	if not buildLabel and classToken then
		resolvedBuild = self:GetResolvedBuild(classToken, level, fallbackBuild)
		buildLabel = (classNum and self.Builds and self.Builds[classNum] and self.Builds[classNum][resolvedBuild])
			or (classToken and ZGV.SpecByNumber and ZGV.SpecByNumber[classToken] and ZGV.SpecByNumber[classToken][resolvedBuild])
			or ("Spec "..tostring(resolvedBuild or 1))
		usesFallback = true
	end
	buildLabel = buildLabel or ("Spec "..tostring(resolvedBuild or 1))
	if usesFallback then
		return buildLabel .. " (Leveling baseline)"
	end
	return buildLabel
end

function ItemScore:GetRuleSourceInfo(classRef, buildNum)
	local classToken = get_class_tag(classRef)
	if not classToken then return nil end
	local classSources = self.RuleSources and self.RuleSources[classToken]
	return classSources and classSources[buildNum] or nil
end

function ItemScore:GetRuleSourceLabel(classRef, buildNum)
	local meta = self:GetRuleSourceInfo(classRef, buildNum)
	if not meta then return "Unverified local baseline" end
	if meta.mode == "normalized_priority" then
		return ("%s (normalized stat-priority baseline)"):format(meta.label or "Curated baseline")
	end
	return meta.label or "Curated baseline"
end

local function copy_simple_table(source)
	local out = {}
	if not source then return out end
	for k, v in pairs(source) do out[k] = v end
	return out
end

function ItemScore:BuildRuleContext(classToken, buildNum, level)
	local resolvedBuild, usesFallback = self:GetResolvedBuild(classToken, level, buildNum)
	local rules = self.rules and self.rules[classToken] and self.rules[classToken][resolvedBuild]
	if not rules then return nil end

	local context = {
		classToken = classToken,
		buildNum = resolvedBuild,
		usesFallback = usesFallback,
		playerlevel = level,
		playerclassName = self.playerclassName,
		playerclass = self.playerclass,
		playerspecName = self:GetBuildName(classToken, resolvedBuild, level, usesFallback),
		ActiveRuleSet = {
			itemtypes = copy_simple_table(rules.itemtypes),
			stats = copy_simple_table(rules.stats),
			caps = copy_simple_table(rules.caps),
		},
	}

	local saved_vars_prefix = "gear_"..classToken.."_"..tostring(resolvedBuild).."_"
	for _, stat in pairs(self.Keywords or {}) do
		if ZGV.db.profile[saved_vars_prefix..(stat.blizz)] then
			context.ActiveRuleSet.stats[stat.blizz] = tonumber(ZGV.db.profile[saved_vars_prefix..(stat.blizz)] or 0)
		end
	end

	local lowestPositive
	for _, weight in pairs(context.ActiveRuleSet.stats) do
		if weight and weight > 0 then
			if not lowestPositive or weight < lowestPositive then
				lowestPositive = weight
			end
		end
	end
	context.whiteScoreWeight = (lowestPositive or 1) * 0.1
	return context
end

function ItemScore:GetItemScoreForContext(itemlink, context)
	local item = ItemScore:GetItemDetails(itemlink)
	if not item then return -1, false, "no info yet" end
	if not context or not context.ActiveRuleSet then return -1, false, "no context" end

	local stats = item.stats
	local score = 0
	local statweights = context.ActiveRuleSet.stats
	local caps = context.ActiveRuleSet.caps

	for statname, statvalue in pairs(stats) do
		statname = ItemScore:NormaliseStatName(statname)
		local statweight = statweights[statname] or 0
		if caps and caps[statname] then
			local current_rating = ItemScore:GetEquippedStatValue(statname)
			if (current_rating > caps[statname]) or context.playerlevel < GetMaxPlayerLevel() then
				statweight = statweight / 2
			end
		end
		score = score + statvalue * statweight
	end

	if not statweights.ARMOR then
		score = score + (item.stats.ARMOR or 0) * context.whiteScoreWeight
	end
	if not statweights.DAMAGE_PER_SECOND then
		score = score + (item.stats.DAMAGE_PER_SECOND or 0) * context.whiteScoreWeight
	end

	if item.class == LE_ITEM_CLASS_ARMOR and item.type ~= "INVTYPE_CLOAK" then
		local types = context.ActiveRuleSet.itemtypes
		local subclass = get_item_family(item)
		local limit = types[subclass] or 0
		if limit < 0 then
			if context.playerlevel >= (-limit + 10) then
				score = score * 0.5
			elseif context.playerlevel >= -limit then
				score = score * 0.9
			end
		end
	end

	return score, true, "scored ok"
end

function ItemScore:GetItemValidityForContext(itemlink, future, context)
	if not context then return {valid = false, final = false, reason = "No context", code = "missing_context"} end
	local item = ItemScore:GetItemDetails(itemlink)
	if not item then return {valid = false, final = false, reason = "No info", code = "missing_info"} end

	local slot_1, slot_2, twohander, equippable, slotReason = get_item_slot_info(item)
	if not equippable then
		return {valid = false, final = true, reason = slotReason or "not equipment", code = "slot", item = item}
	end

	if item.playerclass then
		local validclass = false
		for _, v in pairs(ZGV.ExplodeString(", ", item.playerclass)) do
			if v == context.playerclassName then
				validclass = true
				break
			end
		end
		if not validclass then
			return {valid = false, final = true, reason = "wrong class", code = "class", item = item, slot = slot_1, slot_2 = slot_2, twohander = twohander}
		end
	end

	if item.playerspec and item.playerspec ~= context.playerspecName then
		return {valid = false, final = true, reason = "wrong spec", code = "spec", item = item, slot = slot_1, slot_2 = slot_2, twohander = twohander}
	end

	if not future and item.minlevel and item.minlevel > context.playerlevel then
		return {valid = false, final = true, reason = ("required level %d to equip"):format(item.minlevel), code = "level", item = item, slot = slot_1, slot_2 = slot_2, twohander = twohander}
	end

	if item.equiploc == "INVTYPE_SHIELD" and context.ActiveRuleSet and context.ActiveRuleSet.itemtypes and context.ActiveRuleSet.itemtypes.SHIELD == nil then
		return {
			valid = false,
			final = true,
			reason = "unsupported item type",
			code = "shield",
			item = item,
			slot = slot_1,
			slot_2 = slot_2,
			twohander = twohander,
		}
	end

	local fallbackFamily = get_item_family(item)
	local standardFamilyAllowed = class_can_use_standard_family(context.classToken or context.playerclass, fallbackFamily, context.playerlevel)
	if standardFamilyAllowed == false then
		return {
			valid = false,
			final = true,
			reason = "unsupported item type",
			code = "class_family",
			item = item,
			slot = slot_1,
			slot_2 = slot_2,
			twohander = twohander,
		}
	end

	if fallbackFamily and context.ActiveRuleSet and context.ActiveRuleSet.itemtypes then
		local useable_since_level = context.ActiveRuleSet.itemtypes[fallbackFamily] or (item.type == "INVTYPE_CLOAK" and 1)
		if useable_since_level == nil and fallbackFamily ~= "JEWELERY" and fallbackFamily ~= "COSMETIC" then
			return {
				valid = false,
				final = true,
				reason = "unsupported item type",
				code = "family",
				item = item,
				slot = slot_1,
				slot_2 = slot_2,
				twohander = twohander,
			}
		end
		if useable_since_level and not future and useable_since_level > 0 and context.playerlevel < useable_since_level then
			return {valid = false, final = true, reason = ("required level %d to use"):format(useable_since_level), code = "fallback_level", item = item, slot = slot_1, slot_2 = slot_2, twohander = twohander}
		end
	end

	return {valid = true, final = true, reason = "ok", code = "ok", item = item, slot = slot_1, slot_2 = slot_2, twohander = twohander, family = fallbackFamily}
end

local function context_has_non_armor_stats(item)
	if not item or not item.stats then return false end
	for statname, value in pairs(item.stats) do
		if value and value ~= 0 then
			local normalized = ItemScore:NormaliseStatName(statname)
			if normalized ~= "ARMOR" then
				return true
			end
		end
	end
	return false
end

local function context_get_normalized_stat_value(item, statname)
	if not item or not item.stats then return 0 end
	local total = 0
	for key, value in pairs(item.stats) do
		if ItemScore:NormaliseStatName(key) == statname then
			total = total + (tonumber(value) or 0)
		end
	end
	return total
end

function ItemScore:GetUpgradeComparisonForContext(slot, newitem, context, secondnewitem)
	local candidateScore = newitem and (select(1, self:GetItemScoreForContext(newitem.itemlink, context)) or 0) or 0
	local baselineScore = 0
	local currentLink = GetInventoryItemLink("player", slot)
	local current = currentLink and ItemScore:GetItemDetails(currentLink)
	local hasBaselineItem = currentLink and true or false
	if currentLink then
		baselineScore = select(1, self:GetItemScoreForContext(currentLink, context)) or 0
	end

	if secondnewitem and (slot == INVSLOT_MAINHAND or slot == INVSLOT_OFFHAND) then
		candidateScore = candidateScore + (select(1, self:GetItemScoreForContext(secondnewitem.itemlink, context)) or 0)
		local mh = GetInventoryItemLink("player", INVSLOT_MAINHAND)
		local oh = GetInventoryItemLink("player", INVSLOT_OFFHAND)
		hasBaselineItem = (mh and true) or (oh and true) or false
		baselineScore = (mh and (select(1, self:GetItemScoreForContext(mh, context)) or 0) or 0) + (oh and (select(1, self:GetItemScoreForContext(oh, context)) or 0) or 0)
	end

	local armorFallback = false
	if newitem and newitem.class == LE_ITEM_CLASS_ARMOR and newitem.type ~= "INVTYPE_CLOAK" then
		local candidateHasStats = context_has_non_armor_stats(newitem)
		local currentIsArmor = current and current.class == LE_ITEM_CLASS_ARMOR
		local currentHasStats = current and context_has_non_armor_stats(current)
		if not candidateHasStats and (not current or (currentIsArmor and not currentHasStats)) then
			candidateScore = context_get_normalized_stat_value(newitem, "ARMOR")
			baselineScore = current and context_get_normalized_stat_value(current, "ARMOR") or 0
			armorFallback = true
		end
	end

	local deltaScore = candidateScore - baselineScore
	local isNewItem = not hasBaselineItem
	local percent = (not isNewItem and baselineScore and baselineScore > 0) and ((candidateScore * 100 / baselineScore) - 100) or nil
	local state = "sidegrade"
	if isNewItem then
		state = "new"
	elseif deltaScore > 0 then
		state = armorFallback and "armor_upgrade" or "upgrade"
	elseif deltaScore < 0 then
		state = "downgrade"
	end
	return {
		candidateScore = candidateScore,
		baselineScore = baselineScore,
		deltaScore = deltaScore,
		percent = percent,
		isNewItem = isNewItem,
		state = state,
		armorFallback = armorFallback,
	}
end

function ItemScore:EnsureSelectedWeightTarget(forceReset)
	local classToken = self.playerclass or (select(2, UnitClass("player")))
	local classNum = self.playerclassNum or (classToken and ZGV.ClassToNumber and ZGV.ClassToNumber[classToken]) or 1
	local level = tonumber(self.playerlevel) or UnitLevel("player")
	local activeBuild = tonumber(ZGV.db.char.gear_active_build) or self:GetResolvedBuild(classToken, level, nil)
	local selectedClass = tonumber(ZGV.db.char.gear_selected_class)
	local selectedBuild = tonumber(ZGV.db.char.gear_selected_build)
	local selectedClassToken = get_class_tag(selectedClass)
	local needsInit = forceReset or not ZGV.db.char.gear_weights_initialized or not selectedClass or not selectedClassToken or not ZGV.db.char.gear_weights_manual_class

	if needsInit then
		ZGV.db.char.gear_selected_class = classNum
		ZGV.db.char.gear_selected_build = activeBuild
		ZGV.db.char.gear_weights_initialized = true
	elseif selectedClassToken then
		-- Only validate that the build index actually exists in the rules table.
		-- CRITICAL: Do NOT use GetResolvedBuild here. It forces fallback builds
		-- based on player level (<10 always falls back), which overrides the
		-- user's manual selection in the Options UI. We want the UI to show
		-- exactly what the user picked, regardless of character level.
		local classRules = self.rules and self.rules[selectedClassToken]
		if classRules then
			if not selectedBuild or not classRules[selectedBuild] then
				local fallbackBuild = self:GetFallbackBuildForClass(selectedClassToken)
				ZGV.db.char.gear_selected_build = classRules[fallbackBuild] and fallbackBuild or 1
			end
		end
	end

	return ZGV.db.char.gear_selected_class, ZGV.db.char.gear_selected_build
end

function ItemScore:UpdateConfig()
	self:EnsureSelectedWeightTarget()
	self:DelayedRefreshUserData()
end

function ItemScore:IsLiveWeightTarget(classToken, buildNum)
	classToken = get_class_tag(classToken) or classToken
	buildNum = tonumber(buildNum)
	if not classToken or not buildNum then return false end

	local playerClass = self.playerclass or (select(2, UnitClass("player")))
	local activeBuild = tonumber(ZGV.db.char.gear_active_build)
	local activeBuildOverride = self:GetActiveBuildOverrideBuild(playerClass, self:GetActiveTalentGroupKey())
	if activeBuildOverride then
		activeBuild = activeBuildOverride
	end
	return classToken == playerClass and activeBuild == buildNum
end

function ItemScore:RefreshAfterWeightChange(classToken, buildNum)
	if classToken and buildNum and not self:IsLiveWeightTarget(classToken, buildNum) then
		return
	end
	if self.GearFinder and self.GearFinder.ClearResults then
		self.GearFinder:ClearResults()
	end
	self:DelayedRefreshUserData()
end

function ItemScore:NotifyStatWeightsOptionsChanged()
	local ACR = LibStub and LibStub("AceConfigRegistry-3.0", true)
	if ACR and ACR.NotifyChange then
		ACR:NotifyChange("ZygorGuidesViewer-ItemScore")
	end
	if self.StatWeightsOptionsRefreshTimer and ZGV.CancelTimer then
		ZGV:CancelTimer(self.StatWeightsOptionsRefreshTimer)
		self.StatWeightsOptionsRefreshTimer = nil
	end
	if ZGV and ZGV.ScheduleTimer then
		self.StatWeightsOptionsRefreshTimer = ZGV:ScheduleTimer(function()
			self.StatWeightsOptionsRefreshTimer = nil
			if tonumber(ZGV.db.char.gear_selected_class) == self.playerclassNum then
				ZGV.db.char.gear_selected_build = tonumber(ZGV.db.char.gear_active_build) or ZGV.db.char.gear_selected_build
			end
			local ACR2 = LibStub and LibStub("AceConfigRegistry-3.0", true)
			if ACR2 and ACR2.NotifyChange then
				ACR2:NotifyChange("ZygorGuidesViewer-ItemScore")
			end
			local gm = ZGV and ZGV.GuideManagerStandaloneFrame
			if gm and gm:IsShown() and gm.currentSection == "options" and gm.currentOptionsApp == "ZygorGuidesViewer-ItemScore" then
				gm.currentOptionsApp = "ZygorGuidesViewer-ItemScore"
				if ZGV.db and ZGV.db.profile then
					ZGV.db.profile.guidebrowseroptionsapp = "ZygorGuidesViewer-ItemScore"
				end
				if gm.SetSection then
					gm:SetSection("options")
				elseif gm.RenderOptionsApp then
					gm:RenderOptionsApp("ZygorGuidesViewer-ItemScore")
				end
			end
		end, 0.7)
	end
end

function ItemScore:CancelPendingBagScan()
	if self.BagScanTimer and ZGV.CancelTimer then
		ZGV:CancelTimer(self.BagScanTimer)
		self.BagScanTimer = nil
	end
end

function ItemScore:CancelPendingEquipRescore()
	if self.EquipTimer and ZGV.CancelTimer then
		ZGV:CancelTimer(self.EquipTimer)
		self.EquipTimer = nil
	end
end

function ItemScore:ScheduleBagAcquisitionScan(delay)
	if self.EquipTimer then return end
	if self.BagScanTimer then return end
	self.BagScanTimer = ZGV:ScheduleTimer(function()
		self.BagScanTimer = nil
		self.Upgrades:ScanRecentBagAcquisitions()
	end, delay or 0.25)
end

function ItemScore:ScheduleEquipRescore(delay)
	self:CancelPendingBagScan()
	if self.EquipTimer then return end
	self.EquipTimer = ZGV:ScheduleTimer(function()
		self.EquipTimer = nil
		self.Upgrades:ScoreEquippedItems()
	end, delay or 0.5)
end

function ItemScore:OnEvent(event,arg1,arg2,...)
	if not self.Initialised then return end
	if event == "PLAYER_LEVEL_UP" or event == "CHARACTER_POINTS_CHANGED" or event == "ACTIVE_TALENT_GROUP_CHANGED" then
		-- using timer as delay, since in the same frame PLAYER_LEVEL_UP player is still on previous level
		-- and to run it only once, as both PLU and PSC can fire more than once
		ItemScore:DelayedRefreshUserData()
		if event == "ACTIVE_TALENT_GROUP_CHANGED" then
			ItemScore:NotifyStatWeightsOptionsChanged()
		end
	elseif event == "SKILL_LINES_CHANGED" then -- on classic, skills changed, so user may have learned new weapon skill
		ItemScore:GetEquipmentSkills()
	elseif event == "LOADING_SCREEN_DISABLED" then -- user logged in, see what upgrades we have
		ItemScore:DelayedRefreshUserData()
		ItemScore.LoginRefreshTimer = ItemScore.LoginRefreshTimer or ZGV:ScheduleTimer(function()
			ItemScore.LoginRefreshTimer = nil
			ItemScore:DelayedRefreshUserData()
		end,1.5)
		ItemScore:ScheduleEquipRescore(0.5)
	elseif event == "BAG_UPDATE" or event == "MAIL_INBOX_UPDATE" or event == "MAIL_CLOSED" then -- 3.3.5a-safe bag/mail hooks; debounce to one scan
		ItemScore:ScheduleBagAcquisitionScan(0.25)
	elseif event == "PLAYER_EQUIPMENT_CHANGED"
		or event=="ZGV_STEP_FINALISED"  or event=="LIBROVER_TRAVEL_REPORTED" or event=="GET_ITEM_INFO_RECEIVED" -- step finished loading, or travel route updated, see if we have useless quest equip or portkey
		then 
		-- on timer to run it only once, since equip/unequip fires both events, and we would get spammed
		ItemScore:ScheduleEquipRescore(0.5)
	elseif event == "PLAYER_REGEN_DISABLED" then -- combat started, kill all upgrade popups
		if ItemScore.Upgrades.EquipPopup then ItemScore.Upgrades.EquipPopup:Hide() end
	elseif event == "PLAYER_REGEN_ENABLED" then -- combat ended, check if anything is waiting for equip
		ItemScore.Upgrades:ProcessPossibleUpgrades()
	elseif event == "START_LOOT_ROLL" then
		ItemScore:QueueLootRollMarker(arg1)
	elseif event == "CANCEL_LOOT_ROLL" then
		ItemScore:HideLootRollMarker(arg1)
	elseif event == "LOOT_OPENED" then
		ItemScore:HandleMasterLootOpened()
	elseif event == "LOOT_CLOSED" then
		ItemScore:ResetMasterLootSession()
	end

	if event == "PLAYER_EQUIPMENT_CHANGED" then
		ItemScore.GearFinder:ClearResults()
	end
	if event == "GET_ITEM_INFO_RECEIVED" then
		for rollID in pairs(ItemScore.PendingLootRolls) do
			ItemScore:RefreshLootRollMarker(rollID)
		end
		if ItemScore.PendingMasterLootNotice and GetLootMethod and GetLootMethod() == "master" then
			ItemScore.PendingMasterLootNotice = false
			ItemScore:HandleMasterLootOpened()
		end
		if ItemScore.GearFinder and ItemScore.GearFinder.HadUnresolvedItems and ItemScore.GearFinder.MainFrame and ItemScore.GearFinder.MainFrame:IsVisible() then
			ItemScore.GearFinder:ScheduleItemInfoRefresh()
		end
	end
end

function ItemScore:ResetMasterLootSession()
	wipe(self.MasterLootSession)
end

function ItemScore:BuildMasterLootSourceKey(slot)
	local source = nil
	if GetLootSourceInfo then
		local ok, s1, s2 = pcall(GetLootSourceInfo, slot)
		if ok then
			if s1 and s1 ~= "" then
				source = tostring(s1)
				if s2 and s2 ~= "" then
					source = source .. ":" .. tostring(s2)
				end
			end
		end
	end
	return source or ("slot:%s"):format(tostring(slot))
end

function ItemScore:BuildMasterLootNoticeKey(slot, itemlink)
	local stripped = strip_link(itemlink) or itemlink or "nil"
	return ("%s|%s"):format(self:BuildMasterLootSourceKey(slot), stripped)
end

function ItemScore:HasMasterLootAnnouncement(slot, itemlink)
	local now = GetTime and GetTime() or 0
	local cooldown = self.MasterLootNoticeCooldown or 10
	local key = self:BuildMasterLootNoticeKey(slot, itemlink)

	for existingKey, stamp in pairs(self.MasterLootRecent) do
		if not stamp or (now - stamp) > cooldown then
			self.MasterLootRecent[existingKey] = nil
		end
	end

	if self.MasterLootSession[key] then return false end
	local lastSeen = self.MasterLootRecent[key]
	if lastSeen and (now - lastSeen) < cooldown then return false end
	return key
end

function ItemScore:MarkMasterLootAnnouncement(key)
	if not key then return end
	self.MasterLootSession[key] = true
	self.MasterLootRecent[key] = GetTime and GetTime() or 0
end

function ItemScore:GetMasterLootBaselineLink(validity, comparison)
	local upgrades = self.Upgrades
	if not upgrades or not validity then return nil end

	local slot = validity.slot
	local slot_2 = validity.slot_2

	if comparison and comparison.weaponSlot then
		slot = comparison.weaponSlot
	end

	if slot then
		local current = upgrades:GetEquippedItemData(slot)
		if current and current.itemlink then return current.itemlink end
	end
	if slot_2 then
		local current = upgrades:GetEquippedItemData(slot_2)
		if current and current.itemlink then return current.itemlink end
	end
	return nil
end

function ItemScore:FormatMasterLootNotice(itemlink, validity, comparison)
	if not (itemlink and validity and comparison) then return nil end

	local roundedDelta = round_score(comparison.deltaScore or 0)
	if roundedDelta <= 0 then return nil end

	local parts = {
		branded_chat_prefix("Gear Advisor"),
		itemlink,
		("|cff44ff44%s|r"):format(roundedDelta == 0 and "0.0" or string.format("%+.1f", roundedDelta)),
	}

	local displayPercent = clamp_display_percent(comparison.percent)
	if displayPercent and roundedDelta ~= 0 and not comparison.armorFallback and math.abs(displayPercent) >= 0.05 then
		parts[#parts + 1] = ("|cff44ff44(" .. (L["gearfinder_upgrade_percent_short"] or "%+.1f%%") .. ")|r"):format(displayPercent)
	end
	if comparison.armorFallback and roundedDelta > 0 then
		parts[#parts + 1] = "|cff88ccff(Armor)|r"
	end

	if ZGV.db and ZGV.db.profile and ZGV.db.profile.masterloot_compare then
		local baselineLink = self:GetMasterLootBaselineLink(validity, comparison)
		if baselineLink then
			parts[#parts + 1] = "|cffffaa00vs|r"
			parts[#parts + 1] = baselineLink
		end
	end

	return table.concat(parts, " ")
end

function ItemScore:GetMasterLootComparison(itemlink, item, validity)
	if not (itemlink and item and validity and validity.valid and self.Upgrades) then return nil end
	local stripped = strip_link(itemlink) or itemlink

	if item.class == LE_ITEM_CLASS_WEAPON then
		self.Upgrades:ResetWeaponQueue("onlytemp")
		if self.Upgrades:QueueWeapon(stripped) then
			local mh, oh, th = self.Upgrades:ProcessWeaponQueue()
			if th and th.itemlink == stripped then
				local comparison = self.Upgrades:GetUpgradeComparison(INVSLOT_MAINHAND, th)
				if comparison then comparison.weaponSlot = INVSLOT_MAINHAND end
				return comparison
			elseif mh and mh.itemlink == stripped then
				local comparison = self.Upgrades:GetUpgradeComparison(INVSLOT_MAINHAND, mh, oh)
				if comparison then comparison.weaponSlot = INVSLOT_MAINHAND end
				return comparison
			elseif oh and oh.itemlink == stripped then
				local comparison = self.Upgrades:GetUpgradeComparison(INVSLOT_OFFHAND, oh, mh)
				if comparison then comparison.weaponSlot = INVSLOT_OFFHAND end
				return comparison
			end
		end
	end

	return self:GetLootRollComparison(itemlink, item, validity)
end

function ItemScore:HandleMasterLootOpened()
	if not (ZGV and ZGV.db and ZGV.db.profile and ZGV.db.profile.autogear and ZGV.db.profile.masterloot_notices) then return end
	if not GetLootMethod or not GetNumLootItems or not GetLootSlotLink then return end

	local method = GetLootMethod()
	if method ~= "master" then return end

	for slot = 1, (GetNumLootItems() or 0) do
		local itemlink = GetLootSlotLink(slot)
		local noticeKey = itemlink and self:HasMasterLootAnnouncement(slot, itemlink)
		if itemlink and noticeKey then
			local item = self:GetItemDetails(itemlink) or self:GetItemDetailsQueued(itemlink, true)
			if item then
				local validity = self:GetItemValidity(itemlink)
				if validity and not validity.final then
					self.PendingMasterLootNotice = true
				elseif validity and validity.valid and validity.code ~= "slot" then
					local comparison = self:GetMasterLootComparison(itemlink, item, validity)
					if comparison and (comparison.deltaScore or 0) > 0 then
						local message = self:FormatMasterLootNotice(itemlink, validity, comparison)
						if message and DEFAULT_CHAT_FRAME and DEFAULT_CHAT_FRAME.AddMessage then
							self:MarkMasterLootAnnouncement(noticeKey)
							DEFAULT_CHAT_FRAME:AddMessage(message)
						elseif message then
							self:MarkMasterLootAnnouncement(noticeKey)
							print(message)
						end
					end
				end
			else
				self.PendingMasterLootNotice = true
				
				if UnitAffectingCombat("player") then
					-- Do not scan items during combat to prevent frame drops
					-- Automatically retry once combat ends
					ZGV:RegisterEventOnce("PLAYER_REGEN_ENABLED", function()
						if ItemScore.PendingMasterLootNotice then
							ItemScore.PendingMasterLootNotice = false
							ItemScore:HandleMasterLootOpened()
						end
					end)
					return
				end

				-- No combat, schedule scan with safe delay
				if ZGV.ScheduleTimer then
					ZGV:ScheduleTimer(function()
						if GetLootMethod and GetLootMethod() == "master" then
							ItemScore:HandleMasterLootOpened()
						end
					end, 0.5)
				end
			end
		end
	end
end

function ItemScore:GetLootRollFrame(rollID)
	for i = 1, (NUM_GROUP_LOOT_FRAMES or 4) do
		local frame = _G["GroupLootFrame"..i]
		if frame and frame.rollID == rollID then
			return frame
		end
	end
end

function ItemScore:GetLootRollAnchor(frame)
	if not frame then return end
	local name = frame.GetName and frame:GetName()
	return frame.IconFrame
		or frame.Icon
		or (name and _G[name.."IconFrame"])
		or (name and _G[name.."Icon"])
		or frame
end

function ItemScore:GetOrCreateLootRollMarker(frame)
	if not frame then return end
	if frame.ZGVRollMarker then return frame.ZGVRollMarker end

	local anchor = self:GetLootRollAnchor(frame) or frame
	local marker = CreateFrame("Frame", nil, frame)
	marker:SetFrameStrata("TOOLTIP")
	marker:SetFrameLevel((frame:GetFrameLevel() or 1) + 20)
	marker:SetSize(14, 14)
	marker:Hide()

	marker.glow = marker:CreateFontString(nil, "ARTWORK")
	marker.glow:SetFont(FONTBOLD, 16, "THICKOUTLINE")
	marker.glow:SetAllPoints(marker)
	marker.glow:SetJustifyH("CENTER")
	marker.glow:SetJustifyV("MIDDLE")
	marker.glow:SetTextColor(1, 1, 1, 0.22)

	marker.symbol = marker:CreateFontString(nil, "OVERLAY")
	marker.symbol:SetFont(FONTBOLD, 12, "OUTLINE")
	marker.symbol:SetAllPoints(marker)
	marker.symbol:SetJustifyH("CENTER")
	marker.symbol:SetJustifyV("MIDDLE")

	marker:SetPoint("TOPRIGHT", anchor, "TOPRIGHT", -1, -1)
	frame.ZGVRollMarker = marker
	return marker
end

function ItemScore:HideLootRollMarker(rollID)
	self.PendingLootRolls[rollID] = nil
	local frame = self:GetLootRollFrame(rollID)
	if frame and frame.ZGVRollMarker then
		frame.ZGVRollMarker:Hide()
	end
end

function ItemScore:GetLootRollComparison(itemlink, item, validity)
	if not (self.Upgrades and item and validity and validity.valid) then return nil end
	local stripped = strip_link(itemlink) or itemlink

	if item.class == LE_ITEM_CLASS_WEAPON then
		self.Upgrades:ResetWeaponQueue("onlytemp")
		if self.Upgrades:QueueWeapon(stripped) then
			local mh, oh, th = self.Upgrades:ProcessWeaponQueue()
			if th and th.itemlink == stripped then
				return self.Upgrades:GetUpgradeComparison(INVSLOT_MAINHAND, th)
			elseif mh and mh.itemlink == stripped then
				return self.Upgrades:GetUpgradeComparison(INVSLOT_MAINHAND, mh, oh)
			elseif oh and oh.itemlink == stripped then
				return self.Upgrades:GetUpgradeComparison(INVSLOT_OFFHAND, oh, mh)
			end
		end
	end

	local bestComparison
	local slot_1, slot_2 = validity.slot or item.slot, validity.slot_2 or item.slot_2
	if slot_1 then
		bestComparison = self.Upgrades:GetUpgradeComparison(slot_1, item)
	end
	if slot_2 then
		local secondComparison = self.Upgrades:GetUpgradeComparison(slot_2, item)
		if secondComparison and (not bestComparison or (secondComparison.deltaScore or 0) > (bestComparison.deltaScore or 0)) then
			bestComparison = secondComparison
		end
	end
	return bestComparison
end

function ItemScore:RefreshLootRollMarker(rollID, attempt)
	attempt = attempt or 0
	if not (ZGV.db and ZGV.db.profile and ZGV.db.profile.autogear) then
		return self:HideLootRollMarker(rollID)
	end

	local frame = self:GetLootRollFrame(rollID)
	if not frame then return false end

	local itemlink = GetLootRollItemLink and GetLootRollItemLink(rollID)
	if not itemlink then return false end

	local item = self:GetItemDetails(itemlink)
	if not item then item = self:GetItemDetailsQueued(itemlink, true) end
	if not item then
		if attempt < 10 and ZGV.ScheduleTimer then
			self.PendingLootRolls[rollID] = true
			ZGV:ScheduleTimer(function() ItemScore:RefreshLootRollMarker(rollID, attempt + 1) end, 0.2)
		end
		return false
	end

	local marker = self:GetOrCreateLootRollMarker(frame)
	if not marker then return false end

	local validity = self:GetItemValidity(itemlink)
	if not validity.final then
		marker:Hide()
		if attempt < 10 and ZGV.ScheduleTimer then
			self.PendingLootRolls[rollID] = true
			ZGV:ScheduleTimer(function() ItemScore:RefreshLootRollMarker(rollID, attempt + 1) end, 0.2)
		end
		return false
	end

	if validity.code == "slot" then
		marker:Hide()
		self.PendingLootRolls[rollID] = nil
		return true
	end

	if not validity.valid then
		marker.glow:SetText("x")
		marker.symbol:SetText("x")
		marker.symbol:SetTextColor(1.0, 0.10, 0.10)
		marker:Show()
		self.PendingLootRolls[rollID] = nil
		return true
	end

	local comparison = self:GetLootRollComparison(itemlink, item, validity)
	if not comparison then
		marker:Hide()
		self.PendingLootRolls[rollID] = nil
		return true
	end

	if comparison.isNewItem or (comparison.deltaScore or 0) > 0 or (comparison.armorFallback and (comparison.deltaScore or 0) > 0) then
		marker.glow:SetText("+")
		marker.symbol:SetText("+")
		marker.symbol:SetTextColor(0.20, 1.00, 0.20)
		marker:Show()
	elseif (comparison.deltaScore or 0) < 0 then
		marker.glow:SetText("-")
		marker.symbol:SetText("-")
		marker.symbol:SetTextColor(1.00, 0.25, 0.25)
		marker:Show()
	else
		marker.glow:SetText("")
		marker:Hide()
	end

	self.PendingLootRolls[rollID] = nil
	return true
end

function ItemScore:QueueLootRollMarker(rollID)
	if not rollID then return end
	self.PendingLootRolls[rollID] = true
	self:RefreshLootRollMarker(rollID, 0)
	if ZGV.ScheduleTimer then
		ZGV:ScheduleTimer(function() ItemScore:RefreshLootRollMarker(rollID, 1) end, 0.05)
	end
end

function ItemScore:DelayedRefreshUserData()
	if ItemScore.RefreshInProgress then
		ItemScore.RefreshPending = true
		return
	end
	ItemScore.RefreshTimer = ItemScore.RefreshTimer or ZGV:ScheduleTimer(function() 
		ItemScore:RefreshUserData()
		-- TODO: outleveled heirloom popup
	end,0.5)
end

function ItemScore:RefreshUserData()
	if ItemScore.RefreshInProgress then
		ItemScore.RefreshPending = true
		ItemScore.RefreshTimer = nil
		return
	end

	ItemScore.RefreshTimer = nil
	ItemScore.RefreshInProgress = true
	ItemScore.RefreshPending = false

	local ok, err = pcall(function()
		ItemScore:GetEquipmentSkills()
		ItemScore:SetStatWeights()
		ItemScore.Upgrades:ScoreEquippedItems()
	end)

	ItemScore.RefreshInProgress = false

	if ItemScore.RefreshPending then
		ItemScore.RefreshPending = false
		-- Cancel existing timer if running to prevent stacking calls
		if ItemScore.RefreshTimer then
			ZGV:CancelTimer(ItemScore.RefreshTimer)
		end
		-- Schedule refresh with safe delay to let client finish processing events
		-- 1.0s delay prevents recursion loops and gives server time to send item data
		ItemScore.RefreshTimer = ZGV:ScheduleTimer(function()
			ItemScore:DelayedRefreshUserData()
		end, 1.0)
	end

	if not ok then
		error(err)
	end
end

function ItemScore:QueueActiveBuildRetry()
	if self.ActiveBuildRetryTimer or not ZGV.ScheduleTimer then return end
	self.ActiveBuildRetryTimer = ZGV:ScheduleTimer(function()
		self.ActiveBuildRetryTimer = nil
		self:DelayedRefreshUserData()
	end,1.0)
end

function ItemScore:EnsureActiveRuleSet()
	if self.ActiveRuleSet and self.ActiveRuleSet.stats and self.ActiveRuleSet.itemtypes and self.playerclass then
		return true
	end
	self:SetStatWeights(self.playerclass, nil, self.playerlevel)
	return self.ActiveRuleSet and self.ActiveRuleSet.stats and self.ActiveRuleSet.itemtypes and true or false
end

function ItemScore:SetStatWeights(playerclass,playerspec,playerlevel)
	self.playerclass = playerclass or (select(2,UnitClass("player")))
	self.playerclassName = (select(1,UnitClass("player")))
	self.playerclassNum = (self.playerclass and ZGV.ClassToNumber and ZGV.ClassToNumber[self.playerclass]) or 1
	local fakeLevel = tonumber(ZGV.db.char.fakelevel or 0) or 0
	self.playerlevel = tonumber(playerlevel) or ((fakeLevel > 0 and fakeLevel) or UnitLevel("player"))
	self.playerfaction = UnitFactionGroup("player")

	-- 3.3.5a: detect spec from talent tree point distribution
	self.playeristank = self.playerclass=="DRUID" or self.playerclass=="PALADIN" or self.playerclass=="WARRIOR" or self.playerclass=="DEATHKNIGHT"
	self.playerishealer = self.playerclass=="DRUID" or self.playerclass=="SHAMAN" or self.playerclass=="PRIEST" or self.playerclass=="PALADIN"
	local previousActiveBuild = tonumber(ZGV.db.char.gear_active_build)
	local activeTalentGroupKey = self:GetActiveTalentGroupKey()
	local talentState = self:GetTalentState(self.playerclass, self.playerlevel)
	local detectedBuild, usingFallbackBuild = self:DetectActiveBuild(self.playerclass, self.playerlevel)
	local activeBuildOverride = self:GetActiveBuildOverrideBuild(self.playerclass, activeTalentGroupKey)
	local preTalentOverrideBuild = self:GetPreTalentOverrideBuild(self.playerclass, self.playerlevel, talentState)
	local fallbackUntrusted = usingFallbackBuild and (tonumber(self.playerlevel) or 0) >= 10 and not talentState.preTalentState and talentState.uncertain
	if not talentState.preTalentState and ZGV.db.char.gear_pre_talent_override_explicit then
		self:ClearPreTalentOverride()
	end
	if activeBuildOverride then
		ZGV.db.char.gear_active_build = activeBuildOverride
		usingFallbackBuild = false
	elseif preTalentOverrideBuild then
		ZGV.db.char.gear_active_build = preTalentOverrideBuild
		usingFallbackBuild = false
	elseif fallbackUntrusted and previousActiveBuild and self.rules[self.playerclass] and self.rules[self.playerclass][previousActiveBuild] then
		ZGV.db.char.gear_active_build = previousActiveBuild
		usingFallbackBuild = false
	else
		ZGV.db.char.gear_active_build = detectedBuild
		ZGV.db.char.gear_active_build = self:GetResolvedBuild(self.playerclass, self.playerlevel, ZGV.db.char.gear_active_build)
	end
	if fallbackUntrusted then
		self:QueueActiveBuildRetry()
	end
	-- CRITICAL: Do not override the user's manual UI selection during background refreshes.
	-- Only sync selected_build to active_build on initial setup before the user has interacted
	-- with the dropdowns. Once gear_weights_initialized is set, preserve the manual choice.
	if not ZGV.db.char.gear_weights_initialized then
		ZGV.db.char.gear_selected_build = ZGV.db.char.gear_active_build
	end
	self:EnsureSelectedWeightTarget()
	self.activeBuildUsesOverride = activeBuildOverride and true or false
	self.activeBuildUsesPreTalentOverride = preTalentOverrideBuild and true or false
	self.activeBuildUsesFallback = usingFallbackBuild
	self.playerspecName = self:GetBuildName(self.playerclass, ZGV.db.char.gear_active_build, self.playerlevel, usingFallbackBuild)
	ItemScore.Upgrades.BadUpgrades = ZGV.db.char.badupgrade

	-- create a copy so that the arrays in datatables are left untouched, as we will need them to handle custom weights resets
	self.ActiveRuleSet = {
		itemtypes = {},
		stats = {},
		primary = {},
		caps = {},
	}

	local active_set = ZGV.db.char.gear_active_build

	-- Copy values from our rules
	if ItemScore.rules[self.playerclass] and ItemScore.rules[self.playerclass][active_set] then
		for i,v in pairs(ItemScore.rules[self.playerclass][active_set].itemtypes) do self.ActiveRuleSet.itemtypes[i]=v end
		for i,v in pairs(ItemScore.rules[self.playerclass][active_set].stats) do self.ActiveRuleSet.stats[i]=v end
		if ItemScore.rules[self.playerclass][active_set].caps then
			for i,v in pairs(ItemScore.rules[self.playerclass][active_set].caps) do self.ActiveRuleSet.caps[i]=v end
		end
	else
		print("Unknown spec",self.playerclass,active_set)
	end

	-- Update stats with users profile
	local saved_vars_prefix = "gear_"..self.playerclass.."_"..tostring(active_set).."_"
	for index,stat in pairs(ZGV.ItemScore.Keywords) do
		if ZGV.db.profile[saved_vars_prefix..(stat.blizz)] then
			self.ActiveRuleSet.stats[(stat.blizz)]= tonumber(ZGV.db.profile[saved_vars_prefix..(stat.blizz)] or 0)
		end
	end

	-- Set dual wield 
	ItemScore:SetDualWield()

	-- record lowest statweight for scoring armor/dps
	self.whiteScoreWeight = nil
	for i,v in pairs(self.ActiveRuleSet.stats) do
		if v>0 then
			if not self.whiteScoreWeight or self.whiteScoreWeight>v then
				self.whiteScoreWeight = v
			end
		end
	end

	if not self.whiteScoreWeight then self.whiteScoreWeight=1 end -- in case user statweights are wiped clean
	self.whiteScoreWeight = self.whiteScoreWeight * 0.1

	-- if anything in user info has changed, all cached scores are no longer valid, and item stats could have changed due to level scaling
	-- Instead of wiping the entire cache and re-parsing everything, just invalidate calculated scores only
	-- This prevents massive memory churn and GC spikes on spec/level changes
	for link,item in pairs(ItemCache) do
		item.scored = nil
		item.score = nil
		item.comparison = nil
	end

	ItemScore.GearFinder:ClearResults()
end

-- converts ITEM_MOD_CRIT_RATING_SHORT to CRIT
local name_cache = {}
function ItemScore:NormaliseStatName(statname)
	if name_cache[statname] then return name_cache[statname] end

	-- primary and secondary stats
	statname = statname:gsub("_RATING_SHORT$","")
	statname = statname:gsub("_SHORT$","")
	statname = statname:gsub("^ITEM_MOD_","")

	-- tertiary stats
	statname = statname:gsub("^CR_","")

	-- element resist gear
	statname = statname:gsub("_NAME$","")
	
	-- specific case: armor
	if statname=="RESISTANCE0" then statname="ARMOR" end

	name_cache[statname] = statname
	return statname
end

ItemScore.GetItemDetailsQueue = {}
function ItemScore:GetItemDetails(itemlink,callback,force)
	if not itemlink then return end
	itemlink = strip_link(itemlink)
	if not itemlink then return end

	local item = ItemCache[itemlink]
	if not item then
		table.insert(ItemScore.GetItemDetailsQueue,{itemlink,callback,force})
		return
	end
	return item
end

function ItemScore:ItemDetailsHandler()
	if ItemScore.GetItemDetailsQueue[1] then
		local itemlink,callback,force = unpack(table.remove(ItemScore.GetItemDetailsQueue,1))
		local item = ItemScore:GetItemDetailsQueued(itemlink,force)
		if not item then
			table.insert(ItemScore.GetItemDetailsQueue,{itemlink,callback,force})
			return
		end
		if callback and type(callback)=="function" then callback(item) end
	end
end

local SKIP_CACHE = false
function ItemScore:GetItemDetailsQueued(itemlink,force)
	if not itemlink then return false end
	local itemlinkfull = itemlink
	itemlink = strip_link(itemlink)
	if not itemlink then return false end

	-- if item is not yet cached, grab its data
	if not ItemCache[itemlink] or SKIP_CACHE or force then
		local requires_detail
		-- that is a new one
		local itemName, itemLink2, itemRarity, itemLevel, itemMinLevel, itemType, itemSubType, itemStackCount, itemEquipLoc, texture = ZGV:GetItemInfo(itemlink)
		
		-- Pre-flight cache check: for suffix/random-enchant items GetItemInfo may return nil
		-- until the server pushes data. Trigger a tooltip scan to populate cache and exit safely.
		if not itemName then
			Gratuity:SetHyperlink(itemlink)
			return false
		end
		
		local itemlvl = itemLevel
		local itemClassID = resolve_item_class_id(itemType)
		local itemFamily, itemSubClassID = resolve_item_family(itemClassID, itemSubType)
		if not itemFamily then
			local equipFamily, equipSubClassID = resolve_family_from_equip_loc(itemEquipLoc)
			if equipFamily then
				itemFamily = equipFamily
				itemSubClassID = itemSubClassID or equipSubClassID
			end
		end

		if itemEquipLoc=="" then -- not equipment, don't bother parsing tooltip
			ItemCache[itemlink] = { 
				stats = {}, 
				itemlink = itemlink,
				itemid = ZGV.ItemLink.GetItemID(itemlink),
				itemlinkfull = itemlinkfull,
				class = itemClassID,
				subclass = itemSubClassID,
				family = itemFamily,
				subtype = itemSubType,
				equiploc = itemEquipLoc,
				quality = itemRarity,
				validated = false,
				texture = texture,
			}
			return ItemCache[itemlink]
		end

		local item = {}

		-- class, spec check, and level check. we need to scan tooltip for those. meh.
		local playerclass, playerspec
		Gratuity:SetHyperlink(itemlink)
		if Gratuity:NumLines()==0 then return false end

		local stats = {}
		local tooltip = {}

		-- use blizz GetItemStats to get sockets, since tooltip scanning would only detect empty ones
		local blizzstats = GetItemStats(itemlinkfull) or GetItemStats(itemlink)
		local blizz_present_normalized = {}
		if blizzstats then
			for i,v in pairs(blizzstats) do
				if type(v) == "number" then
					add_stat(stats, i, v)
					blizz_present_normalized[ItemScore:NormaliseStatName(i)] = true
				end
			end
		end

		for num=1,Gratuity:NumLines() do
			local line=Gratuity:GetLine(num)

			if not line then return false end
			if line==RETRIEVING_ITEM_INFO then return false end

			if ItemScore.SaveTooltip then table.insert(tooltip,line) end

			line = line:gsub("|c........",""):gsub("|r","") -- strip color codes, if any

			if ITEM_CLASSES_ALLOWED then
				local found_class = line:match( gsub(ITEM_CLASSES_ALLOWED,"%%s","(.*)"))
				if found_class then playerclass = found_class end
			end

			-- 3.3.5a: ITEM_REQ_SPECIALIZATION global does not exist in this client.
            -- Fallback to localized pattern matching to prevent nil-pointer crashes.
            if line:find(L["Requires"] .. " ") then
                -- Extract the requirement string (e.g., "Requires Paladin" or "Requires Protection")
                local requirement = line:match(L["Requires"] .. " (.+)")
                if requirement then
                    -- NOTE: Full validation against current talent build would require 
                    -- additional tooltip parsing logic. For now, capturing the requirement 
                    -- ensures we don't skip checks due to missing Blizzard global strings.
                    requires_detail = requirement 
                end
            end

			-- 3.3.5a: classic has normal stats as equip: effects, so do NOT early exit on those lines

			local socket_bonus = ITEM_SOCKET_BONUS and line:match( ITEM_SOCKET_BONUS:gsub("%%s","(.*)"))
			local set_bonus = ITEM_SET_BONUS_GRAY and line:match( ITEM_SET_BONUS_GRAY:gsub("%%s","(.*)"))
			local set2_bonus = ITEM_SET_BONUS and line:match( ITEM_SET_BONUS:gsub("%%s","(.*)"))
			if socket_bonus or set_bonus or set2_bonus then line="" end -- skip all extra lines

			local line = (ITEM_SPELL_TRIGGER_ONEQUIP and line:gsub(ITEM_SPELL_TRIGGER_ONEQUIP.." ","") or line):lower()
			local matchedThisLine = {}
			for _,statdata in pairs(ItemScore.Keywords) do
				local coveredByBlizzard = false
				if statdata.multi then
					for _,multiname in ipairs(statdata.multi) do
						if blizz_present_normalized[ItemScore:NormaliseStatName(multiname)] then
							coveredByBlizzard = true
							break
						end
					end
				else
					coveredByBlizzard = blizz_present_normalized[ItemScore:NormaliseStatName(statdata.blizz)] and true or false
				end
				if not coveredByBlizzard and not matchedThisLine[statdata.blizz] then
					for _,regex in ipairs(statdata.regexs) do
						local sign,value = line:match(regex)
						if sign and not value then value = sign end

						if statdata.boolean and sign then
							value="1"
						end

						if value then
							value = value:gsub(",",".")
							if sign=="-" then value=value*(-1) end
							if statdata.multi then
								for _,multiname in ipairs(statdata.multi) do
									add_stat(stats, multiname, value)
								end
							else
								add_stat(stats, statdata.blizz, value)
							end
							matchedThisLine[statdata.blizz] = true
							break
						end
					end
				end
			end
		end

		-- ok, got everything, cache it
		ItemCache[itemlink] = { 
			stats = stats, 
			itemlink = itemlink,
			itemid = ZGV.ItemLink.GetItemID(itemlink),
			itemlinkfull = itemlinkfull,
			minlevel = itemMinLevel,
			type = itemEquipLoc,
			equiploc = itemEquipLoc,
			class = itemClassID,
			subclass = itemSubClassID,
			family = itemFamily,
			subtype = itemSubType,
			quality = itemRarity,
			validated = false,
			texture = texture,
			itemlvl = itemlvl,
			playerclass = playerclass,
			playerspec = playerspec,
			requires_detail = requires_detail,
		}

		if ItemScore.SaveTooltip then ItemCache[itemlink].tooltip = tooltip end


		local slot_1, slot_2, twohander = get_item_slot_info(ItemCache[itemlink])
		ItemCache[itemlink].slot = slot_1
		ItemCache[itemlink].slot_2 = slot_2
		ItemCache[itemlink].twohander = twohander

	end

	if ItemCache[itemlink] and not (ItemCache[itemlink].itemlinkfull and ItemCache[itemlink].itemlinkfull:match("%[")) then -- in case we get a mangled (stripped) full link, try to rebuild it now
		local itemName,newfulllink = ZGV:GetItemInfo(itemlink) 
		if newfulllink then
			ItemCache[itemlink].itemlinkfull = newfulllink
		end
	end

	return ItemCache[itemlink]
end

-- function ItemScore:GetValidSlots(item) in flavour specific files

-- calculates item score based on item stats and current weights. result is cached
-- params:
--	itemlink - string - item that we are checking
-- return:
--	score - int - -1 or score of given item
--	success - bool - was item scored at all
--	comment - string - description
function ItemScore:GetItemScore(itemlink,verbose)
	local item = ItemScore:GetItemDetails(itemlink)
	if not item then return -1, -1, false, "no info yet" end
	if not self:EnsureActiveRuleSet() then return -1, false, "no active rules" end

	local stats = item.stats
	local score = 0
	local statweights = self.ActiveRuleSet.stats
	local caps = self.ActiveRuleSet.caps

	-- calculate score based on stats
	for statname,statvalue in pairs(stats) do
		statname = ItemScore:NormaliseStatName(statname)
		local statweight = statweights[statname] or 0

		if caps and caps[statname] then
			local current_rating = ItemScore:GetEquippedStatValue(statname)
			-- reduce value of stats that are already capped, or if player is not at max level
			if (current_rating > caps[statname]) or self.playerlevel < GetMaxPlayerLevel() then
				statweight = statweight / 2
			end
		end
		
		score = score + statvalue*statweight

		if verbose then table.insert(verbose,("  + |cff00ff00%.1f * %s|r: |cffaaaaaa * %.1f|r = |cffffffff%.1f|r"):format(statvalue,statname, statweight, statvalue*statweight))  end
		
		-- 3.3.5a: gem socket scoring not supported (no gem database for WOTLK)
	end

	-- add dps and armor at minimal weight, unless proper statweights for them exist
	if not statweights.ARMOR then 
		if verbose then table.insert(verbose,("  + |cff00ff00%.1f extra %s|r: |cffaaaaaa * %.1f|r = |cffffffff%.1f|r"):format((item.stats.ARMOR or 0),RESISTANCE0_NAME, self.whiteScoreWeight, (item.stats.ARMOR or 0)*self.whiteScoreWeight ))  end
		score = score + (item.stats.ARMOR or 0)*self.whiteScoreWeight 
	end
	if not statweights.DAMAGE_PER_SECOND then 
		if verbose then table.insert(verbose,("  + |cff00ff00%.1f extra %s|r: |cffaaaaaa * %.1f|r = |cffffffff%.1f|r"):format((item.stats.DAMAGE_PER_SECOND or 0),ITEM_MOD_DAMAGE_PER_SECOND_SHORT, self.whiteScoreWeight, (item.stats.DAMAGE_PER_SECOND or 0)*self.whiteScoreWeight ))  end
		score = score + (item.stats.DAMAGE_PER_SECOND or 0)*self.whiteScoreWeight 
	end

	-- adjust armor weights
	if item.class == LE_ITEM_CLASS_ARMOR and item.type~="INVTYPE_CLOAK" then
		if verbose then table.insert(verbose,("  ? |cff00ff00Is armor|r"))  end 
		local types = self.ActiveRuleSet.itemtypes
		local subclass = get_item_family(item)
		local limit = types[subclass] or 0
		if verbose then table.insert(verbose,("  ? |cff00ff00limit "..limit.." level "..self.playerlevel.."|r"))  end 
		-- if limit is below 0, item is good only till given level, with 10 level grace
		if limit < 0 then 
			if verbose then table.insert(verbose,("  ? |cff00ff00Has limit|r"))   end
			if self.playerlevel >= (-limit+10) then
				if verbose then table.insert(verbose,"  ? |cff00ff00Has limit, past grace|r") end  
				-- we are over the 10 level grace period, undervalue heavily. I mean, come on, farm a little...
				score = score * 0.5
			elseif self.playerlevel >= -limit then
				if verbose then table.insert(verbose,"  ? |cff00ff00Has limit, grace period|r") end  
				 -- we are within grace period, undervalue slightly
				 score = score * 0.9
				-- allows all classes to transition to final armor type after specified level
			end
		end

	end

	-- heirloom protection is now done in upgrades get_upgrade

	-- record scores
	item.score = score

	if verbose then 
		table.insert(verbose,("score %f"):format(score))
		table.insert(verbose,("comment %s"):format("scored ok"))
	end

	return score, true, "scored ok"
end

-- checks if given item is a heirloom that should be protected
-- params:
--	itemlink - string - item that we are checking
-- return:
--	is_protected - bool - whenever item is heirloom not outleveled by user
--	max_level - int - up to what level this item is valid heirloom
function ItemScore:GetHeirloomInfo(itemlink)
	-- in shadowland heirlooms no longer give exp bonus, so we are not protecting them anymore unless player asks for it
	do return ZGV.db.profile.autogear_keepheirlooms, 60 end

	local item = ItemScore:GetItemDetails(itemlink)
	if not item then return false,0 end
	if item.quality ~= 7 then return false,0 end

	local itemid = item.itemid
	local max_level = 60 -- default for all looms

	-- if it is one of items with hardcoded max levels
	max_level =  ItemScore.FixedLevelHeirloom[itemid] or max_level
		
	for bonus,_ in pairs(ZGV.ItemLink.GetItemBonuses(itemlink)) do
		max_level = math.max(max_level,ItemScore.HeirloomBonuses[tonumber(bonus)])
	end
	
	return self.playerlevel < max_level, max_level
end

function ItemScore:GetItemValidity(itemlink, future)
	if not itemlink then
		return {valid = false, final = false, reason = "No itemlink", code = "missing_link"}
	end
	if not self:EnsureActiveRuleSet() then
		return {valid = false, final = false, reason = "No active rules", code = "missing_rules"}
	end

	local item = ItemScore:GetItemDetails(itemlink)
	if not item then
		return {valid = false, final = false, reason = "No info", code = "missing_info"}
	end

	local slot_1, slot_2, twohander, equippable, slotReason = get_item_slot_info(item)
	if not equippable then
		return {
			valid = false,
			final = true,
			reason = slotReason or "not equipment",
			code = "slot",
			item = item,
		}
	end

	if item.playerclass then
		local validclass = false
		for _, v in pairs(ZGV.ExplodeString(", ", item.playerclass)) do
			if v == self.playerclassName then
				validclass = true
				break
			end
		end
		if not validclass then
			return {
				valid = false,
				final = true,
				reason = "wrong class",
				code = "class",
				item = item,
				slot = slot_1,
				slot_2 = slot_2,
				twohander = twohander,
			}
		end
	end

	if item.playerspec and item.playerspec ~= self.playerspecName then
		return {
			valid = false,
			final = true,
			reason = "wrong spec",
			code = "spec",
			item = item,
			slot = slot_1,
			slot_2 = slot_2,
			twohander = twohander,
		}
	end

	if not future and item.minlevel and item.minlevel > self.playerlevel then
		return {
			valid = false,
			final = true,
			reason = ("required level %d to equip"):format(item.minlevel),
			code = "level",
			item = item,
			slot = slot_1,
			slot_2 = slot_2,
			twohander = twohander,
		}
	end

	if item.equiploc == "INVTYPE_SHIELD" and self.ActiveRuleSet and self.ActiveRuleSet.itemtypes and self.ActiveRuleSet.itemtypes.SHIELD == nil then
		return {
			valid = false,
			final = true,
			reason = "unsupported item type",
			code = "shield",
			item = item,
			slot = slot_1,
			slot_2 = slot_2,
			twohander = twohander,
		}
	end

	local fallbackFamily = get_item_family(item)
	local standardFamilyAllowed = class_can_use_standard_family(self.playerclass, fallbackFamily, self.playerlevel)
	if standardFamilyAllowed == false then
		return {
			valid = false,
			final = true,
			reason = "unsupported item type",
			code = "class_family",
			item = item,
			slot = slot_1,
			slot_2 = slot_2,
			twohander = twohander,
		}
	end

	if fallbackFamily and self.ActiveRuleSet and self.ActiveRuleSet.itemtypes then
		local useable_since_level = self.ActiveRuleSet.itemtypes[fallbackFamily] or (item.type=="INVTYPE_CLOAK" and 1)
		if useable_since_level == nil and fallbackFamily ~= "JEWELERY" and fallbackFamily ~= "COSMETIC" then
			return {
				valid = false,
				final = true,
				reason = "unsupported item type",
				code = "family",
				item = item,
				slot = slot_1,
				slot_2 = slot_2,
				twohander = twohander,
			}
		end
		if useable_since_level and not future and useable_since_level > 0 and self.playerlevel < useable_since_level then
			return {
				valid = false,
				final = true,
				reason = ("required level %d to use"):format(useable_since_level),
				code = "fallback_level",
				item = item,
				slot = slot_1,
				slot_2 = slot_2,
				twohander = twohander,
			}
		end
	end

	return {
		valid = true,
		final = true,
		reason = "ok",
		code = "ok",
		item = item,
		slot = slot_1,
		slot_2 = slot_2,
		twohander = twohander,
		family = fallbackFamily,
	}
end


-- checks if item can be equipped by player at the moment. result is cached
-- params:
--	itemlink - string
--	future - anything - for checks for future upgrades. if set, level restriction is not checked
-- returns: 
--	is valid - bool - is item valid for current player
--	is final - bool - was validity really checked (and not skipped due to no gii info)
--	comment - string - verbose description of result
function ItemScore:IsValidItem(itemlink, future)
	if not itemlink then return false, false, "No itemlink" end

	local item = ItemScore:GetItemDetails(itemlink)
	if not item then return false, false, "No info" end

	local verdict = self:GetItemValidity(itemlink, future)
	item.slot = verdict.slot or item.slot
	item.slot_2 = verdict.slot_2 or item.slot_2
	if verdict.twohander ~= nil then item.twohander = verdict.twohander end
	item.validated = verdict.final and true or false
	item.valid = verdict.valid and true or false
	item.validstatus = verdict.reason or "No info"
	return item.valid, verdict.final, item.validstatus
end

-- 3.3.5a: gem scoring functions removed (retail-only feature)

-- returns items equipped by requested type, used by items-quest
-- params:
--	equiptype - int - invtype constant of type to check
-- returns
--	itemlink - string - itemlink of item in first possible slot
--	itemlink2 - string, optional - itemlink of item in second possible slot
function ItemScore:GetItemByType(equiptype)
	local s1, s2 = get_slots_by_type(equiptype)

	local itemlink1,itemlink2
	if s1 then itemlink1 = GetInventoryItemLink("player",s1) end
	if s2 then itemlink2 = GetInventoryItemLink("player",s2) end

	return itemlink1 and itemlink1:match("item[:%d]+"),itemlink2 and itemlink2:match("item[:%d]+"), itemlink1,itemlink2
end

-- returns items equipped in requested type, used by pointer
-- params:
--	slotid - int - invslot constant
-- returns
--	itemlink - string - itemlink of item in given slot
--	itemid - string - itemid of item in given slot
function ItemScore:GetItemInSlot(slotid)
	local itemlink = GetInventoryItemLink("player",slotid)
	if itemlink then
		return itemlink:match("item[:%d]+"), tonumber(itemlink:match("item:(%d+)"))
	end
end

-- 3.3.5a: Azerite powers do not exist
-- Stub function for compatibility
function ItemScore:GetAzeritePowers(itemlink)
	return {}, false
end



-- set of functions to add zygor item info to tooltip
local function ItemScore_SetTooltipData(tooltip, tooltipobj)
	if not ZGV.db.profile.autogear then return end
	if not ZGV.db.profile.itemscore_tooltips then return end
	tooltipobj=tooltipobj or GameTooltip -- we patch either gametooltip or itemreftooltip

	if not ItemScore.TooltipPatched then
		local itemName,originalLink = tooltipobj:GetItem()
		if not originalLink then ItemScore.TooltipPatched = true return end

		local function refresh_tooltip()
			if not tooltipobj or not tooltipobj:IsVisible() then return end
			local _, currentLink = tooltipobj:GetItem()
			if not currentLink or ItemScore.strip_link(currentLink) ~= ItemScore.strip_link(originalLink) then return end

			ItemScore.TooltipPatched = false

			if tooltipobj == GameTooltip then
				local owner = GameTooltip:GetOwner()
				if owner then
					local onEnter = owner:GetScript("OnEnter")
					if onEnter then
						local ok = pcall(onEnter, owner)
						if ok then return end
					end
				end
				local _, link = GameTooltip:GetItem()
				if link and GameTooltip.SetHyperlink then
					pcall(GameTooltip.SetHyperlink, GameTooltip, link)
				end
			elseif tooltipobj == ItemRefTooltip then
				local _, link = ItemRefTooltip:GetItem()
				if link and ItemRefTooltip.SetHyperlink then
					pcall(ItemRefTooltip.SetHyperlink, ItemRefTooltip, link)
				end
			else
				local _, link = tooltipobj:GetItem()
				if link and tooltipobj.SetHyperlink then
					pcall(tooltipobj.SetHyperlink, tooltipobj, link)
				end
			end
		end

		local item = ItemScore:GetItemDetails(originalLink, refresh_tooltip, true)
		if not item then
			-- Item not cached yet - queued for async parse. Tooltip will refresh via callback once data arrives.
			ItemScore.TooltipPatched = true
			return
		end

		local fulllink = originalLink
		local itemlink = item.itemlink
		if not item_is_gear(item) then
			ItemScore.TooltipPatched = true
			return
		end

		local score, success, scorecomment = ItemScore:GetItemScore(itemlink)
		if not success then ItemScore.TooltipPatched  = true return end

		local valid, final, validcomment = ItemScore:IsValidItem(itemlink)
		if not final then ItemScore.TooltipPatched  = true return end
		local debugVerdict = nil
		if ZGV.db and ZGV.db.profile and ZGV.db.profile.debug_display then
			debugVerdict = ItemScore:GetItemValidity(itemlink)
		end

		local heirloom_protected,heirloom_max = ItemScore:GetHeirloomInfo(itemlink)
		
		local slot_1,slot_2 = item.slot, item.slot_2
		local equipped_item_1, equipped_item_2
		if slot_1 then 
			equipped_item_1 = ItemScore.Upgrades:GetEquippedItemData(slot_1)
		end
		if slot_2 then 
			equipped_item_2 = ItemScore.Upgrades:GetEquippedItemData(slot_2) 
		end

		local function add_upgrade_line(slotinfo, equipped_item, slotid)
			local comparison = ItemScore.Upgrades:GetUpgradeComparison(slotid, item)
			local scoreDelta, percent, isNewItem = comparison.deltaScore, comparison.percent, comparison.isNewItem
			local line
			if isNewItem or not (equipped_item and equipped_item.itemlink) or scoreDelta ~= nil then
				local roundedDelta = round_score(scoreDelta or 0)
				local color = roundedDelta < 0 and "|cffff0000" or (roundedDelta > 0 and "|cff00ff00" or "|cffcccccc")
				local deltaText = roundedDelta == 0 and "0.0" or string.format("%+.1f", roundedDelta)
				line = "|r "..slotinfo..color..deltaText.."|r"
				local displayPercent = clamp_display_percent(percent)
				if displayPercent and roundedDelta ~= 0 and not comparison.armorFallback and math.abs(displayPercent) >= 0.05 then
					line = line .. " "..color.."("..string.format((L["gearfinder_upgrade_percent_short"] or "%+.1f%%"), displayPercent)..")|r"
				end
				if comparison.armorFallback and roundedDelta > 0 then
					line = line .. " |cff88ccff(Armor)|r"
				end
			else
				line = "|r "..slotinfo.."|cffcccccc0.0|r"
			end
			tooltip:AddLine(line)
		end

		local function add_context_upgrade_line(prefix, comparison)
			if not comparison then return end
			local scoreDelta, percent, isNewItem = comparison.deltaScore, comparison.percent, comparison.isNewItem
			local line
			if isNewItem or scoreDelta ~= nil then
				local roundedDelta = round_score(scoreDelta or 0)
				local color = roundedDelta < 0 and "|cffff0000" or (roundedDelta > 0 and "|cff00ff00" or "|cffcccccc")
				local deltaText = roundedDelta == 0 and "0.0" or string.format("%+.1f", roundedDelta)
				line = "|r "..prefix..color..deltaText.."|r"
				local displayPercent = clamp_display_percent(percent)
				if displayPercent and roundedDelta ~= 0 and not comparison.armorFallback and math.abs(displayPercent) >= 0.05 then
					line = line .. " "..color.."("..string.format((L["gearfinder_upgrade_percent_short"] or "%+.1f%%"), displayPercent)..")|r"
				end
				if comparison.armorFallback and roundedDelta > 0 then
					line = line .. " |cff88ccff(Armor)|r"
				end
			else
				line = "|r "..prefix.."|cffcccccc0.0|r"
			end
			tooltip:AddLine(line)
		end

		if valid then
			if slot_1 or slot_2 then -- valid equippable item, show comparison info even if weighted score is zero
				local mh, oh, th
				if item.class == LE_ITEM_CLASS_WEAPON then
					ItemScore.Upgrades:ResetWeaponQueue("onlytemp")
					ItemScore.Upgrades:QueueWeapon(itemlink)
					mh, oh, th = ItemScore.Upgrades:ProcessWeaponQueue()
				end

				tooltip:AddLine(" ")
				tooltip:AddLine(branded_tooltip_header("ItemScore"))
				tooltip:AddLine(("|cffcccccc%s:|r %s"):format(ItemScore:GetActiveBuildSourceLabel(), ItemScore:GetBuildName(ItemScore.playerclass, ZGV.db.char.gear_active_build, ItemScore.playerlevel, ItemScore.activeBuildUsesFallback)))
				if debugVerdict then
					tooltip:AddLine(("|cff8888ffdebug:|r eq=%s subtype=%s family=%s valid=%s code=%s"):format(
						tostring(item.equiploc or item.type or "nil"),
						tostring(item.subtype or "nil"),
						tostring(get_item_family(item) or "nil"),
						tostring(debugVerdict.valid),
						tostring(debugVerdict.code or "nil")
					))
				end
				local slotinfo1 = slot_2 and "Slot 1: " or ""
				local slotinfo2 = slot_2 and "Slot 2: " or ""

				if ZGV.db.profile.itemscore_tooltips_allbuilds then
					local classToken = ItemScore.playerclass
					local classNum = ItemScore.playerclassNum
					local level = ItemScore.playerlevel
					local builds = (ItemScore.Builds and classNum and ItemScore.Builds[classNum]) or {}
					for buildNum, _ in ipairs(builds) do
						local context = ItemScore:BuildRuleContext(classToken, buildNum, level)
						if context then
							local verdict = ItemScore:GetItemValidityForContext(itemlink, nil, context)
							local prefix = ("|cffcccccc%s:|r "):format(ItemScore:GetBuildName(classToken, buildNum, level, context.usesFallback))
							if not verdict.valid then
								tooltip:AddLine(prefix .. "|cffff3333x|r Unusable")
							else
								local comparison = nil
								if verdict.slot then
									comparison = ItemScore:GetUpgradeComparisonForContext(verdict.slot, item, context)
								end
								if verdict.slot_2 then
									local secondComparison = ItemScore:GetUpgradeComparisonForContext(verdict.slot_2, item, context)
									if secondComparison and (not comparison or (secondComparison.deltaScore or 0) > (comparison.deltaScore or 0)) then
										comparison = secondComparison
									end
								end
								if comparison then
									add_context_upgrade_line(prefix, comparison)
								else
									tooltip:AddLine(prefix .. "|cffcccccc0.0|r")
								end
							end
						end
					end
				else
					-- item in slot 1
					add_upgrade_line(slotinfo1, equipped_item_1, slot_1)

					if slot_2 and equipped_item_2.score then
						add_upgrade_line(slotinfo2, equipped_item_2, slot_2)
					elseif slot_2 then
						add_upgrade_line(slotinfo2, equipped_item_2, slot_2)
					end
				end
			end
			-- 3.3.5a: gem socket suggestions removed
		else
			if item.type~="" then
				tooltip:AddLine(" ")
				tooltip:AddLine(branded_tooltip_header("ItemScore"))
				tooltip:AddLine(("|cffcccccc%s:|r %s"):format(ItemScore:GetActiveBuildSourceLabel(), ItemScore:GetBuildName(ItemScore.playerclass, ZGV.db.char.gear_active_build, ItemScore.playerlevel, ItemScore.activeBuildUsesFallback)))
				if debugVerdict then
					tooltip:AddLine(("|cff8888ffdebug:|r eq=%s subtype=%s family=%s valid=%s code=%s"):format(
						tostring(item.equiploc or item.type or "nil"),
						tostring(item.subtype or "nil"),
						tostring(get_item_family(item) or "nil"),
						tostring(debugVerdict.valid),
						tostring(debugVerdict.code or "nil")
					))
				end
				tooltip:AddLine("|cffff3333Unusable|r")
			end
		end

		ItemScore.TooltipPatched  = true
	end
	if tooltipobj==ItemRefTooltip then ItemRefTooltip:Show() end -- update to new height, have to do it by hand since IRT is called just once
end
local function ItemScore_ClearTooltipData(tooltip, ...) ItemScore.TooltipPatched = false end

-- functions that support itemscore/gearfinder options panel
function ItemScore:UsesCustomWeights(class,spec)
	local statset = ZGV.ItemScore.rules[class][spec].stats
	local prefix = 'gear_'..class..'_'..spec..'_'
	local profile = ZGV.db.profile

	for index=1,#ZGV.ItemScore.Keywords do
		local statname = ZGV.ItemScore.Keywords[index].blizz

		if not profile[prefix..statname] and statset[statname] then
		
		elseif tonumber(profile[prefix..statname]) and not statset[statname] then
			return true
		elseif tonumber(profile[prefix..statname]) and tonumber(statset[statname])~=tonumber(profile[prefix..statname]) then
			return true
		end
	end
	return false
end

function ItemScore:GetEquipmentSkills()
	if not ItemScore.Skills then ItemScore.Skills = {} end
	table.wipe(ItemScore.Skills)

	if not ItemScore.SkillNamesRev then ItemScore.SkillNamesRev = {} end
	if not ItemScore.SkillNames then ItemScore.SkillNames = {} end

	-- Ensure ItemCache exists to prevent nil-pointer errors during early initialization
	if ItemCache then
		-- Instead of wiping the entire cache and re-parsing everything, just invalidate calculated scores only
		-- This prevents massive memory churn and GC spikes on skill changes
		for link, item in pairs(ItemCache) do
			item.scored = nil
			item.score = nil
			item.comparison = nil
		end
	end

	for i=1, GetNumSkillLines() do
		local skillName, _, _, skillRank, numTempPoints, skillModifier, skillMaxRank, isAbandonable, stepCost, rankCost, minLevel, skillCostType = GetSkillLineInfo(i);
		local skillTag = ItemScore.SkillNamesRev[skillName]
		if skillTag then
			ItemScore.Skills[skillTag] = skillRank
		end
	end
end

function ItemScore:GetEquippedStatValue(statname)
	local result = 0
	for slotID,item in pairs(ZGV.ItemScore.Upgrades.EquippedItems) do 
		local details = ItemScore:GetItemDetails(item.itemlink)
		if details then
			for sname,svalue in pairs(details.stats) do
				local name = ItemScore:NormaliseStatName(sname)
				if name==statname then
					result = result + svalue
				end
			end
		end
	end
	return result
end


function ItemScore:ImportPawn(datastring)
	if not datastring then return end
	local unknowns = false

	if not datastring:find("Pawn: v1:") then 
		ZGV:Print("Import: Incorrect pawn string") 
		return
	end

	datastring = datastring:gsub(" [)]",""):gsub("(.*): ","")

	local stattable = {}
	for statstring in string.gmatch(datastring, "([^,]+)") do
		local statname,statval = statstring:match("(%w+)=([-0-9%.]+)")
		if statname and statval then
			stattable[statname] = (tonumber(statval)~=0 and statval or nil)
		end
	end

	for statname,statval in pairs(stattable) do
		if not ItemScore.Gear_PawnToZygor[statname] and not ItemScore.KeywordsPawnToRules[statname] then
			unknowns = true
			stattable[statname]=nil
		end
	end

	if unknowns then
		ZGV:Print("Import: Some of Pawn stat names are not supported by Zygor, and have been skipped.") 
	end

	local classNum = tonumber(ZGV.db.char.gear_selected_class) or self.playerclassNum or 1
	local tag = get_class_tag(classNum)
	local build = tonumber(ZGV.db.char.gear_selected_build) or tonumber(ZGV.db.char.gear_active_build) or 1
	if not tag then return end
	local groupname = 'gear_'..tag..'_'..build.."_"

	for index,stat in pairs(ZGV.ItemScore.Keywords) do -- wipe
		ZGV.db.profile[groupname..stat.blizz] = "0"
	end

	for statname,statval in pairs(stattable) do
		if not ItemScore.Gear_PawnToZygor[statname] then
			ZGV.db.profile[groupname..ItemScore.KeywordsPawnToRules[statname]] = statval
		end
	end
end

function ItemScore:ExportPawn(datastring)
	local class = tonumber(ZGV.db.char.gear_selected_class) or self.playerclassNum or 1
	local spec = tonumber(ZGV.db.char.gear_selected_build) or tonumber(ZGV.db.char.gear_active_build) or 1
	local tag = get_class_tag(class)
	local name = (LOCALIZED_CLASS_NAMES_MALE and tag and LOCALIZED_CLASS_NAMES_MALE[tag]) or (LOCALIZED_CLASS_NAMES_FEMALE and tag and LOCALIZED_CLASS_NAMES_FEMALE[tag]) or tostring(tag)
	if not tag then return end
	local specname = ZGV.SpecByNumber[tag][spec] -- values taken from parser.lua classtalents
	local ruleset = ItemScore.rules[tag][spec]

	local returnstring = '( Pawn: v1: "Zygor: '
	returnstring = returnstring..name..' '..specname..'": '

	local data = {}

	--[[
	for namez,namep in pairs(ItemScore.Gear_ZygorToPawn) do
		if not ruleset.itemtypes[namez] then
			table.insert(data,namep.."=-1000000")
		else
			table.insert(data,namep.."="..ruleset.itemtypes[namez])
		end
	end
	--]]

	local playermask = "gear_"..tag.."_"..spec.."_"
	for index,stat in pairs(ZGV.ItemScore.Keywords) do
		local value = ZGV.db.profile[playermask..(stat.blizz)] or ruleset.stats[stat.blizz]
		if tonumber(value) then
			table.insert(data,stat.pawn.."="..value)
		end
	end
	
	returnstring = returnstring.." "..table.concat(data, ", ") 
	returnstring = returnstring..")"

	ZGV.ItemScore.lastPawnString = returnstring
end

tinsert(ZGV.startups,{"ItemScore",function(self)
	ZGV.db.char.badupgrade = ZGV.db.char.badupgrade or {}

	local ok, err

	ok, err = pcall(ItemScore.SetData, ItemScore)
	if not ok then ZGV:Print("|cffff0000ItemScore SetData error:|r "..tostring(err)) end

	ok, err = pcall(ItemScore.Initialise, ItemScore)
	if not ok then ZGV:Print("|cffff0000ItemScore Initialise error:|r "..tostring(err)) end

	ok, err = pcall(function() ItemScore.GearFinder:Initialise() end)
	if not ok then ZGV:Print("|cffff0000GearFinder Initialise error:|r "..tostring(err)) end

	-- 3.4.3: re-enabled tooltip hooks (LibGratuity fix resolved corruption)
	pcall(GameTooltip.HookScript, GameTooltip, "OnTooltipSetItem", ItemScore_SetTooltipData)
	pcall(GameTooltip.HookScript, GameTooltip, "OnTooltipCleared", ItemScore_ClearTooltipData)
	pcall(ItemRefTooltip.HookScript, ItemRefTooltip, "OnTooltipCleared", ItemScore_ClearTooltipData)
	if GameTooltip.SetHyperlink then pcall(hooksecurefunc, GameTooltip, "SetHyperlink", function(tip) ItemScore_SetTooltipData(tip,GameTooltip) end) end
	if ItemRefTooltip.SetHyperlink then pcall(hooksecurefunc, ItemRefTooltip, "SetHyperlink", function(tip) ItemScore_SetTooltipData(tip,ItemRefTooltip) end) end

	if Gratuity and Gratuity.vars and Gratuity.vars.tooltip then
		Gratuity.vars.tooltip:HookScript("OnTooltipSetItem", function() 
			local itemName,itemlink = Gratuity.vars.tooltip:GetItem()
			if itemlink then 
				ItemScore:GetItemDetails(itemlink,nil,"force") 
			end
		end)
	end
end})
