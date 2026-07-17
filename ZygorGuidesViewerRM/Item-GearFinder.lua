local ZGV = ZygorGuidesViewer
if not (ZGV and ZGV.ItemScore) then return end

-- GLOBAL ZygorGearFinder

local L = ZGV.L
local G = _G
local FONT=ZGV.Font
local FONTBOLD=ZGV.FontBold
local CHAIN = ZGV.ChainCall
local ui = ZGV.UI
local SkinData = ui and ui.SkinData

local function GF_GetSlotLabel(slotKey, fallback)
	return _G[slotKey] or fallback
end

local tinsert,tremove,print,ipairs,pairs,wipe,debugprofilestop=tinsert,tremove,print,ipairs,pairs,wipe,debugprofilestop
local completedQuestsCache = {}
local function IsQuestFlaggedCompleted(questID)
	if _G.IsQuestFlaggedCompleted then
		return _G.IsQuestFlaggedCompleted(questID)
	end
	if GetQuestsCompleted then
		wipe(completedQuestsCache)
		GetQuestsCompleted(completedQuestsCache)
		return completedQuestsCache[questID] and true or false
	end
	return false
end

local ItemScore = ZGV.ItemScore
local GearFinder = {}
ItemScore.GearFinder = GearFinder
ItemScore.Items = {}
GearFinder.ITEM_RESOLVE_RETRY_LIMIT = 60
local cancel_gearfinder_timer
local queue_fallback_candidate

local function GF_FormatFinderSummary(slotID, item, change, secondnewitem)
	local upgrades = ItemScore and ItemScore.Upgrades
	if not upgrades or not upgrades.FormatUpgradeSummary then return nil end
	return upgrades:FormatUpgradeSummary(slotID, item, change, secondnewitem)
end

local function GF_GetEncounterLabel(encounterId, fallbackBossName)
	if encounterId and _G.EJ_GetEncounterInfo then
		local name = EJ_GetEncounterInfo(encounterId)
		if name and name ~= "" then
			return name
		end
	end
	return fallbackBossName or " "
end

local function GF_IsPositiveComparison(comparison)
	return comparison and (comparison.isNewItem or (comparison.deltaScore or 0) > 0)
end

local function GF_StripLink(itemlink)
	if not itemlink then return nil end
	if ItemScore and ItemScore.strip_link then
		return ItemScore.strip_link(itemlink) or itemlink
	end
	local _, itemstring = tostring(itemlink):match("(.*)item:([0-9-:]*)(.*)")
	if itemstring then
		local result = itemstring
		local prev
		repeat
			prev = result
			result = result:gsub(":0:", "::")
		until result == prev
		result = result:gsub(":0$", ":")
		return "item:" .. result
	end
	return itemlink
end

local function GF_EvaluateUpgrade(itemlink, future)
	if not itemlink then return false, nil, 0, 0, "no link" end
	itemlink = GF_StripLink(itemlink) or itemlink
	if not itemlink then return false, nil, 0, 0, "no link" end
	return ItemScore.Upgrades:IsUpgrade(itemlink, future)
end

local function GF_GetBossDropItems(bossdata, player)
	if type(bossdata) ~= "table" then return nil end

	local player_items = bossdata[player] or bossdata["ALL"]
	if player_items then return player_items end

	local flat = {}
	for k,v in pairs(bossdata) do
		if type(k) == "number" then
			flat[#flat + 1] = v
		end
	end
	if #flat > 0 then return flat end

	return nil
end

local function GF_IsPhaseActive(phase)
	if not phase then return true end
	if ZGV.IsClassicWOTLK and type(phase) == "string" and phase:match("^wotlk%d") then
		return true
	end
	return ZGV.Dungeons and ZGV.Dungeons.Phases and ZGV.Dungeons.Phases[phase]
end

local function GF_GetDungeonLeafName(dungeonName)
	if not dungeonName then return nil end
	return tostring(dungeonName):match("([^\\]+)$")
end

local function GF_NormalizeDungeonName(name)
	if not name then return nil end
	name = tostring(name)
	name = name:gsub("%s*%([Hh]eroic%)$", "")
	name = name:gsub("^The%s+", "")
	name = name:gsub("%s+", " ")
	return name:lower()
end

local function GF_GetDungeonData(ident)
	local dungeons = ZGV.Dungeons
	if not dungeons then return nil end
	return dungeons[ident] or (dungeons.hardcoded_dungeons and dungeons.hardcoded_dungeons[ident]) or nil
end

local function GF_ResolveDungeonIdent(dungeonId, instanceId, dungeonName, heroic)
	local dungeons = ZGV.Dungeons
	if not dungeons then return dungeonId end

	local candidates = {}
	if instanceId ~= nil then
		candidates[#candidates + 1] = instanceId
		if heroic and type(instanceId) == "number" then
			candidates[#candidates + 1] = tostring(instanceId) .. "H"
		end
	end

	for _, candidate in ipairs(candidates) do
		if GF_GetDungeonData(candidate) then
			return candidate
		end
	end

	local leafName = GF_GetDungeonLeafName(dungeonName)
	if not leafName or not dungeons.hardcoded_dungeons then return dungeonId end
	local wantedName = GF_NormalizeDungeonName(leafName)

	for ident, data in pairs(dungeons.hardcoded_dungeons) do
		local difficulty = data and data.difficulty
		local matchesDifficulty
		if heroic then
			matchesDifficulty = difficulty == 2 or tostring(ident):match("H$")
		else
			matchesDifficulty = difficulty == 1 or difficulty == 3 or difficulty == 4 or difficulty == 14
		end
		if data and GF_NormalizeDungeonName(data.name) == wantedName and matchesDifficulty then
			return ident
		end
	end

	return dungeonId
end

-- remove all non-player class drops, and all bosses that do not drop anything for player
function GearFinder:TrimDatabase() 
	local player = ZGV.ItemScore.playerclass

	for i,instance in pairs(ZygorGuidesViewer.ItemScore.Items) do
		for bossindex,boss in pairs(instance) do
			if type(boss)=="table" then
				local player_items = GF_GetBossDropItems(boss, player)
				for classindex,class in pairs(boss) do
					if type(class)=="table" then -- strip non quest drops for classes other than current
						if classindex~=player and classindex~="quest" then
							boss[classindex]=nil
						end
					end
				end
				if not player_items or #player_items==0 then -- strip bosses that do not offer anything to current class
					instance[bossindex]=nil
				end
			end
		end
	end
end

-- checks if gear from specific dungeon can be suggested
--	dungeon - int - dungeon id, as used in ZGV.Dungeons
--	instance - int - dungeon id, as used in ZGV.Dungeons
-- returns:
--	valid - bool - can be suggested now
--	future - bool - may contains upgrades later (level, ilvl, attunment)
--	ident - string or int - identificator of dungeon
--	maxscale - int - maximum level up to which drops are scaled
--	mythic - bool - is this a mythic dungeon
--	comment - string - verbose message
function GearFinder:IsValidDungeon(dungeon, instanceId, dungeonName, heroic)
	local ident = GF_ResolveDungeonIdent(dungeon, instanceId, dungeonName, heroic)
	if ident==0 and instanceId then ident="e_"..instanceId end

	local dungeon = GF_GetDungeonData(ident)

	if not dungeon then return false, false, ident, 0, false, false, "no dungeon" end
	if dungeon.phase and not GF_IsPhaseActive(dungeon.phase) then return false, false, ident, 0, false, false, "phase inactive" end

	-- 3.3.5a: no Chromie Time, no Mythic+
	local maxScaleLevel = dungeon.maxScaleLevel or 80

	-- handle permanent rejects
	if dungeon.max_level and dungeon.max_level<ItemScore.playerlevel then return false, false, ident, 0, false, false, "instance disabled" end
	if dungeon.expansionLevel>GearFinder.CurrentExpansion then return false, false, ident, 0, false, false, "no expansion " ..dungeon.expansionLevel end
	if dungeon.difficulty and not ZGV.db.profile["gear_"..dungeon.difficulty] then return false, false, ident, 0, false, false, "instance filtered out"..dungeon.difficulty end

	if dungeon.isHoliday then return false, false, ident, 0, false, false, "holiday dungeons not supported" end
	if dungeon.minLevel and dungeon.minLevel > (ItemScore.playerlevel+GearFinder.FUTURE_DUNGEONS_LIMIT) then return false, false, ident, 0, false, false, "need way higher level "..dungeon.minLevel end
	if dungeon.minLevel and dungeon.minLevel < (ItemScore.playerlevel-GearFinder.PAST_DUNGEONS_LIMIT) then return false, false, ident, 0, false, false, "outleveled "..dungeon.minLevel end
	if maxScaleLevel < (ItemScore.playerlevel-GearFinder.PAST_DUNGEONS_LIMIT) then return false, false, ident, 0, false, false, "outleveled "..maxScaleLevel..":"..(ItemScore.playerlevel-GearFinder.PAST_DUNGEONS_LIMIT)  end

	-- 3.3.5a: no LFG dungeon joinable check, no mythic
	local mythic = false
	local mythicplus = false

	-- handle future rejects
	if dungeon.minLevel and dungeon.minLevel > ItemScore.playerlevel then return false, true, ident, dungeon.maxScaleLevel, mythic, mythicplus, "need higher level" end
	-- 3.3.5a: no player ilvl system, skip min_ilevel check

	-- attunements
	if dungeon.attunement_achieve then
		local _,_,_,complete = GetAchievementInfo(dungeon.attunement_achieve)
		if not complete then return false, true, ident, maxScaleLevel, mythic, mythicplus, "attunement needed" end
	end	
	if dungeon.attunement_quest and not IsQuestFlaggedCompleted(dungeon.attunement_quest) then return false, true, ident, maxScaleLevel, mythic, mythicplus, "attunement needed" end
	if dungeon.attunement_queston and not (IsQuestFlaggedCompleted(dungeon.attunement_queston) or ZGV.Parser.ConditionEnv.haveq(dungeon.attunement_queston)) then return false, true, ident, maxScaleLevel, mythic, mythicplus, "attunement needed" end

	return true, true, ident, maxScaleLevel, mythic, mythicplus, "ok"
end

GearFinder.UpgradeQueue = {
	[INVSLOT_MAINHAND] = {},
	[INVSLOT_OFFHAND] = {},
	[INVSLOT_HEAD] = {},
	[INVSLOT_NECK] = {},
	[INVSLOT_SHOULDER] = {},
	[INVSLOT_BACK] = {},
	[INVSLOT_CHEST] = {},
	[INVSLOT_WRIST] = {},
	[INVSLOT_HAND] = {},
	[INVSLOT_WAIST] = {},
	[INVSLOT_LEGS] = {},
	[INVSLOT_FEET] = {},
	[INVSLOT_FINGER1] = {},
	[INVSLOT_FINGER2] = {},
	[INVSLOT_TRINKET1] = {},
	[INVSLOT_TRINKET2] = {},
}

GearFinder.FallbackQueue = {
	[INVSLOT_MAINHAND] = {},
	[INVSLOT_OFFHAND] = {},
	[INVSLOT_HEAD] = {},
	[INVSLOT_NECK] = {},
	[INVSLOT_SHOULDER] = {},
	[INVSLOT_BACK] = {},
	[INVSLOT_CHEST] = {},
	[INVSLOT_WRIST] = {},
	[INVSLOT_HAND] = {},
	[INVSLOT_WAIST] = {},
	[INVSLOT_LEGS] = {},
	[INVSLOT_FEET] = {},
	[INVSLOT_FINGER1] = {},
	[INVSLOT_FINGER2] = {},
	[INVSLOT_TRINKET1] = {},
	[INVSLOT_TRINKET2] = {},
}

if ZGV.IsClassic or ZGV.IsClassicTBC or ZGV.IsClassicWOTLK then
	GearFinder.UpgradeQueue[INVSLOT_RANGED] = {}
	GearFinder.FallbackQueue[INVSLOT_RANGED] = {}
end

GearFinder.DebugSlotStats = {}
GearFinder.DebugSlotReject = {}

local function reset_debug_slot_stats()
	table.wipe(GearFinder.DebugSlotStats)
	table.wipe(GearFinder.DebugSlotReject)
	for slot in pairs(GearFinder.UpgradeQueue) do
		GearFinder.DebugSlotStats[slot] = {
			seen = 0,
			resolved = 0,
			valid = 0,
			upgrades = 0,
			fallback = 0,
			meta = 0,
		}
	end
end

local function add_slot_debug(slot, field, amount)
	local stats = GearFinder.DebugSlotStats and GearFinder.DebugSlotStats[slot]
	if not stats then return end
	stats[field] = (stats[field] or 0) + (amount or 1)
end

local function set_slot_reject(slot, reason)
	if not slot then return end
	GearFinder.DebugSlotReject[slot] = tostring(reason or "")
end

local function get_slot_debug_reason(slot)
	local stats = GearFinder.DebugSlotStats and GearFinder.DebugSlotStats[slot]
	if GearFinder.LastError then
		return ("ERR %s"):format(tostring(GearFinder.LastError):sub(1, 30))
	end
	if not stats then return "DBG:no-data" end
	return ("S%d R%d V%d M%d F%d U%d"):format(
		stats.seen or 0,
		stats.resolved or 0,
		stats.valid or 0,
		stats.meta or 0,
		stats.fallback or 0,
		stats.upgrades or 0
	)
end

local function safe_get_item_details(itemlink)
	local ok, result = pcall(function()
		return ItemScore:GetItemDetails(itemlink) or ItemScore:GetItemDetailsQueued(itemlink, true)
	end)
	if not ok then
		return nil, result
	end
	return result, nil
end

-- those slots should not have the same item suggested
local slot_pairs = {
	[INVSLOT_MAINHAND] = INVSLOT_OFFHAND,
	[INVSLOT_FINGER1] = INVSLOT_FINGER2,
	[INVSLOT_TRINKET1] = INVSLOT_TRINKET2,
}

-- checks if gearfounder got upgrades for all slots, so that we may skip looking for future upgrades
-- no params
-- returns
--	bool - are all slots filled
local function are_all_slots_filled()
	for slot,data in pairs(GearFinder.UpgradeQueue) do
		if not next(data) then
			return false
		end
	end
	return true
end

local function get_equipped_item_level(slot)
	local upgrades = ItemScore and ItemScore.Upgrades
	if not upgrades or not upgrades.GetEquippedItemData then return 0 end
	local equipped = upgrades:GetEquippedItemData(slot)
	local details = equipped and equipped.itemlink and ItemScore:GetItemDetails(equipped.itemlink)
	return details and details.itemlvl or 0
end

local function get_fallback_metric(item)
	if not item then return 0 end
	return (tonumber(item.itemlvl) or 0) * 1000 + (tonumber(item.score) or 0)
end

local function get_equipped_item_details(slot)
	local upgrades = ItemScore and ItemScore.Upgrades
	if not upgrades or not upgrades.GetEquippedItemData then return nil end
	local equipped = upgrades:GetEquippedItemData(slot)
	return equipped and equipped.itemlink and ItemScore:GetItemDetails(equipped.itemlink) or nil
end

local FINDER_CLASS_MAX_ARMOR_FAMILY = {
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

local FINDER_ARMOR_FAMILY_ORDER = {
	CLOTH = 1,
	LEATHER = 2,
	MAIL = 3,
	PLATE = 4,
}

local function finder_family_allowed(family)
	if not family then return true end
	local maxFamily = FINDER_CLASS_MAX_ARMOR_FAMILY[ItemScore.playerclass]
	local maxRank = maxFamily and FINDER_ARMOR_FAMILY_ORDER[maxFamily]
	local wantedRank = FINDER_ARMOR_FAMILY_ORDER[family]
	if not maxRank or not wantedRank then return true end
	if family == "MAIL" and (ItemScore.playerclass == "HUNTER" or ItemScore.playerclass == "SHAMAN") and (tonumber(ItemScore.playerlevel) or 0) < 40 then
		return false
	end
	if family == "PLATE" and ItemScore.playerclass ~= "DEATHKNIGHT" and (tonumber(ItemScore.playerlevel) or 0) < 40 then
		return false
	end
	return wantedRank <= maxRank
end

local function queue_local_meta_candidate(itemlink, itemdata, ident, future)
	local itemid = ZGV.ItemLink.GetItemID(itemlink)
	local meta = itemid and ItemScore.GearFinderItemMeta and ItemScore.GearFinderItemMeta[itemid]
	if not meta or not meta.equipLoc then return end
	if meta.family and not finder_family_allowed(meta.family) then return end

	local pseudo = { type = meta.equipLoc }
	local slot1, slot2 = ItemScore:GetValidSlots(pseudo)
	if not slot1 then return end

	local function maybe_queue(slot)
		if not slot or not GearFinder.FallbackQueue[slot] then return end
		local equipped = get_equipped_item_details(slot)
		if equipped and equipped.class == LE_ITEM_CLASS_ARMOR and equipped.type ~= "INVTYPE_CLOAK" and meta.family then
			local equippedFamily = equipped.family
			if equippedFamily and equippedFamily ~= meta.family then
				return
			end
		end
		local queued = queue_fallback_candidate(slot, {
			itemlink = GF_StripLink(itemlink) or itemlink,
			texture = nil,
			itemlvl = 0,
			score = 0,
			minlevel = 0,
			cached_name = meta.name,
			approximate = true,
			force_approximate = true,
		}, itemdata, ident, future)
		if queued then
			add_slot_debug(slot, "meta")
		end
	end

	maybe_queue(slot1)
	maybe_queue(slot2)
end

local function queue_bare_fallback_candidate(itemlink, itemdata, ident, future)
	local itemName, itemLink2, itemRarity, itemLevel, itemMinLevel, itemType, itemSubType, itemStackCount, itemEquipLoc, texture = ZGV:GetItemInfo(itemlink)
	if not itemName or not itemEquipLoc or itemEquipLoc == "" then return end

	local pseudo = { type = itemEquipLoc }
	local slot1, slot2 = ItemScore:GetValidSlots(pseudo)
	if not slot1 then return end

	local function maybe_queue(slot)
		if not slot or not GearFinder.FallbackQueue[slot] then return end
		local equipped = get_equipped_item_details(slot)
		if equipped and equipped.class == LE_ITEM_CLASS_ARMOR and equipped.type ~= "INVTYPE_CLOAK" then
			if itemSubType and equipped.subtype and itemSubType ~= equipped.subtype then
				return
			end
		end
		local baseline = get_equipped_item_level(slot)
		local candidateLevel = tonumber(itemLevel) or 0
		if baseline > 0 and candidateLevel <= baseline then return end
		local queued = queue_fallback_candidate(slot, {
			itemlink = GF_StripLink(itemlink) or itemlink,
			texture = texture,
			itemlvl = candidateLevel,
			score = candidateLevel,
			minlevel = itemMinLevel,
		}, itemdata, ident, future)
		if queued then
			add_slot_debug(slot, "meta")
		end
	end

	maybe_queue(slot1)
	maybe_queue(slot2)
end

queue_fallback_candidate = function(slot, item, itemdata, ident, future)
	if not slot or not item or not GearFinder.FallbackQueue[slot] then
		set_slot_reject(slot, "reject: no fallback queue")
		return false
	end
	if itemdata and itemdata.quest and IsQuestFlaggedCompleted(itemdata.quest) then
		set_slot_reject(slot, ("reject: quest completed %s"):format(tostring(itemdata.quest)))
		return false
	end
	local queue = GearFinder.FallbackQueue[slot]
	local baseline = get_equipped_item_level(slot)
	local candidateLevel = tonumber(item.itemlvl) or 0
	if not item.force_approximate and candidateLevel > 0 and baseline > 0 and candidateLevel <= baseline then
		set_slot_reject(slot, ("reject: ilvl %d <= equipped %d for %s"):format(candidateLevel, baseline, tostring(item.cached_name or item.itemlink or "item")))
		return false
	end

	local candidate = {
		itemlink = item.itemlink,
		texture = item.texture,
		itemlvl = candidateLevel,
		score = tonumber(item.score) or candidateLevel or 0,
		ident = ident,
		boss = itemdata and itemdata.boss,
		bossname = itemdata and itemdata.bossname,
		encounterId = itemdata and itemdata.encounterId,
		quest = itemdata and itemdata.quest,
		questname = itemdata and itemdata.questname,
		minlevel = item.minlevel,
		future = future and true or false,
		approximate = true,
		force_approximate = item.force_approximate or candidateLevel <= 0,
		cached_name = item.cached_name or item.name,
		approximateText = L["gearfinder_no_upgrade"],
	}

	if future then
		local dungeon = GF_GetDungeonData(ident)
		if dungeon then
			candidate.minlevel = candidate.minlevel or dungeon.minLevel
			candidate.min_ilevel = dungeon.min_ilevel
		end
	end

	queue[#queue + 1] = candidate
	set_slot_reject(slot, ("queued: ilvl %d score %s %s"):format(candidateLevel, tostring(candidate.score), tostring(candidate.cached_name or candidate.itemlink or "item")))
	return true
end

local function promote_fallback_results()
	for slot, queue in pairs(GearFinder.FallbackQueue) do
		if (not GearFinder.UpgradeQueue[slot][1]) and queue[1] then
			GearFinder.UpgradeQueue[slot][1] = queue[1]
		end
	end
end

-- checks if item should be considered for weapon upgrade - don't switch between 2h and 1h when looking in dungeons
-- params:
--	current - bool - if user is using 2h weapon now
--	item - array - item that we will be checking
-- returns
--	valid - bool - should we queue this item
local function is_replacement(uses2h, item)
	if not item then return false end

	if (item.class == LE_ITEM_CLASS_WEAPON) or (item.type=="INVTYPE_HOLDABLE" or item.type=="INVTYPE_SHIELD") then
		return item.twohander == uses2h
	end

	return true
end

-- main worker function. goes first through all items prepared for scoring, if upgrades for all slots are not found, checks future items
-- sorts result slots by highest score and calls display when it is done
-- no params, no returns
local function loot_score_dungeon_thread()
	local total_current, total_future = 0,0
	for _,dungeon in pairs(GearFinder.ItemsToScore) do total_current = total_current + #dungeon end
	for _,dungeon in pairs(GearFinder.ItemsToMaybeScore) do total_future = total_future + #dungeon end
	local total = total_current + total_future
	if total <= 0 then total = 1 end

	GearFinder.MainFrame.Progress:SetPercent(0,"noanim")
	GearFinder.MainFrame.Progress:Show()
	local success_counter = 0


	local equipped_weapon = GetInventoryItemLink("player",INVSLOT_MAINHAND) and ItemScore:GetItemDetails(GetInventoryItemLink("player",INVSLOT_MAINHAND))
	local twohander_equipped = equipped_weapon and equipped_weapon.twohander

	while true do
		local fail_counter = 0
		for ident,dungeon in pairs(GearFinder.ItemsToScore) do
			for index,itemdata in pairs(dungeon) do
				local itemlink = itemdata.itemlink
				for slot in pairs(GearFinder.UpgradeQueue) do
					add_slot_debug(slot, "seen")
				end
				local item, itemerr = safe_get_item_details(itemlink)
				if itemerr then GearFinder.LastError = itemerr end
				if not item then
					queue_local_meta_candidate(itemlink, itemdata, ident, false)
					queue_bare_fallback_candidate(itemlink, itemdata, ident, false)
					itemdata.resolve_attempts = (itemdata.resolve_attempts or 0) + 1
					if itemdata.resolve_attempts >= GearFinder.ITEM_RESOLVE_RETRY_LIMIT then
						ZGV:Debug("&gear dropping unresolved current item after %d attempts: %s",itemdata.resolve_attempts,tostring(itemlink))
						GearFinder.HadUnresolvedItems = true
						GearFinder.ItemsToScore[ident][index]=nil
					else
						fail_counter = fail_counter + 1
					end
					else
						success_counter = success_counter + 1
						local is_upgrade, slot, change, score, comment, futurevalid, slot_2, change_2  = GF_EvaluateUpgrade(itemlink)
						local validity = ItemScore:GetItemValidity(itemlink)
						if validity and validity.slot then
							add_slot_debug(validity.slot, "resolved")
							if validity.valid then add_slot_debug(validity.slot, "valid") end
						end
						if validity and validity.slot_2 then
							add_slot_debug(validity.slot_2, "resolved")
							if validity.valid then add_slot_debug(validity.slot_2, "valid") end
						end
					if is_upgrade and is_replacement(twohander_equipped,item)  then
						item.ident = ident
						item.boss = itemdata.boss
						item.bossname = itemdata.bossname
						item.encounterId = itemdata.encounterId
						item.quest = itemdata.quest
						item.change = change
						if not (item.quest and IsQuestFlaggedCompleted(item.quest)) then
							table.insert(GearFinder.UpgradeQueue[slot],item)
							add_slot_debug(slot, "upgrades")

							if slot_2 then
								item.change_2 = change_2
								table.insert(GearFinder.UpgradeQueue[slot_2],item)
								add_slot_debug(slot_2, "upgrades")
							end
						end
					elseif validity and validity.valid and is_replacement(twohander_equipped, item) then
						if queue_fallback_candidate(validity.slot, item, itemdata, ident, false) then
							add_slot_debug(validity.slot, "fallback")
						end
						if validity.slot_2 then
							if queue_fallback_candidate(validity.slot_2, item, itemdata, ident, false) then
								add_slot_debug(validity.slot_2, "fallback")
							end
						end
					elseif futurevalid then
						GearFinder.ItemsToMaybeScore[ident] = GearFinder.ItemsToMaybeScore[ident] or {}
						table.insert(GearFinder.ItemsToMaybeScore[ident],itemdata)
					end
					GearFinder.ItemsToScore[ident][index]=nil
				end
			end
			ZGV:Debug("&gear current scored %d of %d/%d",success_counter,total_current,total)
			ZGV:Debug("&gear current failed %d",fail_counter)
			coroutine.yield()
			local ready = success_counter / total * 100
			GearFinder.MainFrame.Progress:SetPercent(ready)
		end
		if fail_counter==0 then break end
	end

	GearFinder.DungeonItemsScored = true
	local t2 = debugprofilestop()
	ZGV:Debug("&gear scoring current took %d",t2-GearFinder.TimeScoreStart)

	for i,slotupgrades in pairs(GearFinder.UpgradeQueue) do 
		table.sort(slotupgrades,function(a,b) return a.score>b.score end)
	end
	for i,slotupgrades in pairs(GearFinder.FallbackQueue) do
		table.sort(slotupgrades,function(a,b) return get_fallback_metric(a) > get_fallback_metric(b) end)
	end

	-- remove duplicates from primary/secondary slots
	for first,second in pairs(slot_pairs) do
		local first_equipped = ItemScore:GetItemDetails(ItemScore.Upgrades.EquippedItems[first].itemlink)
		local second_equipped = ItemScore:GetItemDetails(ItemScore.Upgrades.EquippedItems[second].itemlink)
		local first_queue = GearFinder.UpgradeQueue[first]
		local second_queue = GearFinder.UpgradeQueue[second]

		if first_queue[1] and second_queue[1] and first_queue[1]==second_queue[1] then
			if not first_equipped or first_equipped.twohander then
				ZGV:Debug("&itemscore SDG same item, drop second, no first")
				table.remove(second_queue,1)
			elseif not first_equipped then		
				ZGV:Debug("&itemscore SDG same item, drop first, no second")
				table.remove(first_queue,1)
			elseif second_queue[2] then
				ZGV:Debug("&itemscore SDG same item, drop second, has options")
				table.remove(second_queue,1)
			elseif first_queue[2] then
				ZGV:Debug("&itemscore SDG same item, drop first, has options")
				table.remove(first_queue,1)
			else
				ZGV:Debug("&itemscore SDG same item, drop second, no choice")
				table.remove(second_queue,1)
			end
		end
	end

	if are_all_slots_filled() then 
		GearFinder.ResultsReady=true 
		GearFinder.MainFrame.Progress:Hide()
		cancel_gearfinder_timer("AntsTimer")
		GearFinder:DisplayResults()
		return
	else
		GearFinder:DisplayResults()
		GearFinder.AntsMode = "future "
	end

	table.sort(GearFinder.FutureDungeons,function(a,b) if a.minLevel==b.minLevel then return a.min_ilevel<b.min_ilevel else return a.minLevel<b.minLevel end end)
	while true do
		local fail_counter = 0
		for _,dungeon in ipairs(GearFinder.FutureDungeons) do
			if GearFinder.ItemsToMaybeScore[dungeon.ident] then
				for index,itemdata in pairs(GearFinder.ItemsToMaybeScore[dungeon.ident]) do
					local itemlink = itemdata.itemlink
					for slot in pairs(GearFinder.UpgradeQueue) do
						add_slot_debug(slot, "seen")
					end
					local item, itemerr = safe_get_item_details(itemlink)
					if itemerr then GearFinder.LastError = itemerr end
					if not item then 
						queue_local_meta_candidate(itemlink, itemdata, dungeon.ident, true)
						queue_bare_fallback_candidate(itemlink, itemdata, dungeon.ident, true)
						itemdata.resolve_attempts = (itemdata.resolve_attempts or 0) + 1
						if itemdata.resolve_attempts >= GearFinder.ITEM_RESOLVE_RETRY_LIMIT then
							ZGV:Debug("&gear dropping unresolved future item after %d attempts: %s",itemdata.resolve_attempts,tostring(itemlink))
							GearFinder.HadUnresolvedItems = true
							GearFinder.ItemsToMaybeScore[dungeon.ident][index]=nil
						else
							fail_counter = fail_counter + 1
						end
					else
						success_counter = success_counter + 1
						local is_upgrade, slot, change, score, comment, validfuture, slot_2, change_2 = GF_EvaluateUpgrade(itemlink,"future")
						local validity = ItemScore:GetItemValidity(itemlink, true)
						if validity and validity.slot then
							add_slot_debug(validity.slot, "resolved")
							if validity.valid then add_slot_debug(validity.slot, "valid") end
						end
						if validity and validity.slot_2 then
							add_slot_debug(validity.slot_2, "resolved")
							if validity.valid then add_slot_debug(validity.slot_2, "valid") end
						end
						-- only record future items for slots that do not have upgrades from current dungeons
						-- if slot and GearFinder.UpgradeQueue[slot] then--and not GearFinder.UpgradeQueue[slot][1] then
						if slot and GearFinder.UpgradeQueue[slot] and (not GearFinder.UpgradeQueue[slot][1] or GearFinder.UpgradeQueue[slot][1].future) then
							if is_upgrade and is_replacement(twohander_equipped,item) then
								item.ident = dungeon.ident
								item.min_ilevel = dungeon.min_ilevel
								item.boss = itemdata.boss
								item.encounterId = itemdata.encounterId
								item.future = true
								item.quest = itemdata.quest
								item.change = change
								if not (item.quest and IsQuestFlaggedCompleted(item.quest)) then
									table.insert(GearFinder.UpgradeQueue[slot],item)
									add_slot_debug(slot, "upgrades")

									if slot_2 then
										item.change_2 = change_2
										table.insert(GearFinder.UpgradeQueue[slot_2],item)
										add_slot_debug(slot_2, "upgrades")
									end
								end
							end
						end
						if validity and validity.valid and is_replacement(twohander_equipped, item) then
							if not GearFinder.UpgradeQueue[validity.slot][1] or GearFinder.UpgradeQueue[validity.slot][1].future then
								if queue_fallback_candidate(validity.slot, item, itemdata, dungeon.ident, true) then
									add_slot_debug(validity.slot, "fallback")
								end
							end
							if validity.slot_2 and (not GearFinder.UpgradeQueue[validity.slot_2][1] or GearFinder.UpgradeQueue[validity.slot_2][1].future) then
								if queue_fallback_candidate(validity.slot_2, item, itemdata, dungeon.ident, true) then
									add_slot_debug(validity.slot_2, "fallback")
								end
							end
						end
						GearFinder.ItemsToMaybeScore[dungeon.ident][index]=nil
					end
				end
				local ready = success_counter / total * 100
				ZGV:Debug("&gear future scored %d of %d/%d",success_counter,total_future,total)
				ZGV:Debug("&gear future failed %d",fail_counter)
				GearFinder.MainFrame.Progress:SetPercent(ready)
				coroutine.yield()
			end
		end
		if fail_counter==0 then break end
	end

	for i,slotupgrades in pairs(GearFinder.UpgradeQueue) do 
		table.sort(slotupgrades,function(a,b)
			if a.future and b.future then -- future, find earliest
				if a.minLevel==b.minLevel and a.min_ilevel==b.min_ilevel then 
					return a.score>b.score -- same requirements, sort by score
				elseif a.minLevel==b.minLevel then
					return a.min_ilevel<b.min_ilevel -- same player level, sort by dungeon minilvl
				else 
					return a.minLevel<b.minLevel  -- sort by item min player level
				end
			else -- not future, sort by score
				return a.score>b.score
			end
		end)
	end
	for i,slotupgrades in pairs(GearFinder.FallbackQueue) do
		table.sort(slotupgrades,function(a,b)
			if a.future and b.future then
				if (a.minlevel or 0)==(b.minlevel or 0) and (a.min_ilevel or 0)==(b.min_ilevel or 0) then
					return get_fallback_metric(a) > get_fallback_metric(b)
				elseif (a.minlevel or 0)==(b.minlevel or 0) then
					return (a.min_ilevel or 0) < (b.min_ilevel or 0)
				else
					return (a.minlevel or 0) < (b.minlevel or 0)
				end
			else
				return get_fallback_metric(a) > get_fallback_metric(b)
			end
		end)
	end

	local t3 = debugprofilestop()
	ZGV:Debug("&gear scoring future took %d",t3-t2)
	ZGV:Debug("&gear scoring all took %d",t3-GearFinder.TimeScoreStart)
	promote_fallback_results()
	GearFinder.ResultsReady=true
	GearFinder.MainFrame.Progress:Hide()

	cancel_gearfinder_timer("AntsTimer")
	GearFinder:DisplayResults()
end

-- show crawling dots while calculation is running
-- executed on timer
-- no params
-- no returns
local function progress_dots()
	local progress_time = math.floor(debugprofilestop())%1500

	local progress_dots = ""
	if progress_time < 500 then
		progress_dots = "."
	elseif progress_time < 1000 then
		progress_dots = ".."
	else
		progress_dots = "..."
	end

	local Buttons = GearFinder.MainFrame.Buttons
	local searchingKey = GearFinder.AntsMode == "future " and "gearfinder_status_searching_future" or "gearfinder_status_searching"
	for i,v in pairs(GearFinder.UpgradeQueue) do
		local button = Buttons[i]
		if not button.link then
			button.itemdungeon:SetText(L[searchingKey]:format(progress_dots))
		end
	end
end

cancel_gearfinder_timer = function(field)
	local handle = GearFinder[field]
	if not handle then return end
	GearFinder[field] = nil
	ZGV:CancelTimer(handle, true)
end

-- prepares item lists for worker thread to work on
-- items from valid dungeons are added to ItemsToScore
-- items from dungeons that are not valid, but can be valid soon to ItemsToMaybeScore and dungeons to FutureDungeons
-- starts thread and resumes it 10 times a second
-- no params
-- no returns
GearFinder.ItemsToScore = {}
GearFinder.ItemsToMaybeScore = {}
GearFinder.FutureDungeons = {}
GearFinder.HadUnresolvedItems = false
GearFinder.DebugSummary = {}

function GearFinder:ScheduleItemInfoRefresh()
	if self.ItemInfoRefreshTimer or not self.MainFrame or not self.MainFrame:IsVisible() then return end
	self.ItemInfoRefreshTimer = ZGV:ScheduleTimer(function()
		self.ItemInfoRefreshTimer = nil
		if not self.MainFrame or not self.MainFrame:IsVisible() then return end
		self:ClearResults()
		self:ScoreDungeonItems()
	end, 0.4)
end

function GearFinder:ScoreDungeonItems()
	if GearFinder.ResultsReady then return end

	GearFinder.CurrentExpansion = (GetClassicExpansionLevel and GetClassicExpansionLevel()) or (GetServerExpansionLevel and GetServerExpansionLevel()) or 2 -- 2 = WOTLK

	GearFinder.TimeScoreStart = debugprofilestop()
	GearFinder.MainFrame.overlay:Hide()

	GearFinder.DungeonItemsScored = false
	GearFinder.HadUnresolvedItems = false
	GearFinder.LastError = nil
	reset_debug_slot_stats()

	local player = ZGV.ItemScore.playerclass or "ALL"
	for i,v in pairs(GearFinder.UpgradeQueue) do table.wipe(v) end
	for i,v in pairs(GearFinder.FallbackQueue) do table.wipe(v) end
	table.wipe(GearFinder.ItemsToScore)
	table.wipe(GearFinder.ItemsToMaybeScore)
	table.wipe(GearFinder.FutureDungeons)
	table.wipe(GearFinder.DebugSummary)

	local faction = self.playerfaction=="Alliance" and 1 or 2
	local sourceInstances, validDungeons, futureDungeons = 0, 0, 0
	local invalidReasons = {}

	-- 3.3.5a: no mythic+, no modified instances
	for dungeon,dungeondata in pairs(ZGV.ItemScore.Items) do
		sourceInstances = sourceInstances + 1
		local valid, future, ident, maxscale, mythic, mythicplus, comment = GearFinder:IsValidDungeon(dungeondata.dungeon or dungeondata.dungeonmap, dungeondata.instanceId, dungeon, dungeondata.heroic)
		local capped_player_level = math.min(maxscale or 80, ItemScore.playerlevel)

		if valid then
			validDungeons = validDungeons + 1
			GearFinder.ItemsToScore[ident] = {}
			for boss,bossdata in pairs(dungeondata) do
				if type(bossdata)=="table" and GF_IsPhaseActive(bossdata.phase) then
					local player_items = GF_GetBossDropItems(bossdata, player)
					if player_items then
						for _,itemlink in pairs(player_items) do
							if type(itemlink)=="number" then itemlink = "item:"..itemlink end
							-- 3.3.5a: no level scaling, no mythic bonuses
							local qname
							if bossdata.quest and bossdata.quest[faction] then
								qname = ZGV.QuestDB and ZGV.QuestDB:GetQuestName(bossdata.quest[faction])
							end
							table.insert(GearFinder.ItemsToScore[ident],{itemlink=itemlink,boss=bossdata.boss, bossname=bossdata.name, encounterId=bossdata.encounterId, quest=bossdata.quest and bossdata.quest[faction], questname=qname})
						end
					end
				end
			end
		elseif future then
			futureDungeons = futureDungeons + 1
			local future_dungeon = GF_GetDungeonData(ident)
			if future_dungeon then
				table.insert(GearFinder.FutureDungeons,{ident=ident,minLevel=future_dungeon.minLevel or 0,min_ilevel=future_dungeon.min_ilevel or 0})
			end

			GearFinder.ItemsToMaybeScore[ident] = {}

			for boss,bossdata in pairs(dungeondata) do
				if type(bossdata)=="table" and GF_IsPhaseActive(bossdata.phase) then
					local player_items = GF_GetBossDropItems(bossdata, player)
					if player_items then
						for _,itemlink in pairs(player_items) do
							if type(itemlink)=="number" then itemlink = "item:"..itemlink end
							-- 3.3.5a: no level scaling, no mythic bonuses
							local qname
							if bossdata.quest and bossdata.quest[faction] then
								qname = ZGV.QuestDB and ZGV.QuestDB:GetQuestName(bossdata.quest[faction])
							end
							table.insert(GearFinder.ItemsToMaybeScore[ident],{itemlink=itemlink,boss=bossdata.boss, bossname=bossdata.name, encounterId=bossdata.encounterId, quest=bossdata.quest and bossdata.quest[faction], questname=qname})
						end
					end
				end
			end
		else
			invalidReasons[comment or "invalid"] = (invalidReasons[comment or "invalid"] or 0) + 1
		end
	end
	GearFinder.DebugSummary.player = tostring(player)
	GearFinder.DebugSummary.sourceInstances = sourceInstances
	GearFinder.DebugSummary.validDungeons = validDungeons
	GearFinder.DebugSummary.futureDungeons = futureDungeons
	GearFinder.DebugSummary.invalidReasons = invalidReasons
	GearFinder.DebugSummary.gear1 = ZGV.db and ZGV.db.profile and ZGV.db.profile.gear_1 and true or false
	GearFinder.DebugSummary.gear2 = ZGV.db and ZGV.db.profile and ZGV.db.profile.gear_2 and true or false
	GearFinder.DebugSummary.gear3 = ZGV.db and ZGV.db.profile and ZGV.db.profile.gear_3 and true or false
	GearFinder.DebugSummary.gear4 = ZGV.db and ZGV.db.profile and ZGV.db.profile.gear_4 and true or false

	GearFinder.ScoreThread = coroutine.create(loot_score_dungeon_thread)
	if GearFinder.ScoreTimer then 
		cancel_gearfinder_timer("ScoreTimer")
	end
	GearFinder.ScoreTimer = ZGV:ScheduleRepeatingTimer(function()
		local ok,ret = coroutine.resume(GearFinder.ScoreThread)
		if not ok or coroutine.status(GearFinder.ScoreThread)=="dead" then 
			cancel_gearfinder_timer("ScoreTimer")
			if not ok then
				GearFinder.LastError = ret
				ZGV:Debug("&gear score thread error: %s", tostring(ret))
				GearFinder.ResultsReady = true
				GearFinder.MainFrame.Progress:Hide()
				cancel_gearfinder_timer("AntsTimer")
				GearFinder:DisplayResults()
			end
		end
	end,
	0.1)
	GearFinder.AntsMode = ""
	GearFinder.AntsTimer = ZGV:ScheduleRepeatingTimer(function() progress_dots() end, 0.5)
end

-- used to make item slots in gear finder window. creates texture and fontstrings, sets tooltip calls
-- params
--	object - array - int texture id, int slot id, string slot name
-- returns:
--	button - frame - pack of objects that make one slot
local function make_button(object)
	local parent = GearFinder.MainFrame.CenterColumn or GearFinder.MainFrame
	local button = CHAIN(CreateFrame("Button",nil,parent))
		:SetFrameLevel(parent:GetFrameLevel()+2)
		:SetSize(260,40)
		:Show()
	.__END
		button:SetScript("OnEnter",function()
			if button.dungeonguide then
				button.loadguide:Show()
			end
		end)
		button:SetScript("OnLeave",function()
			button.loadguide:Hide()
		end)


	button.tooltiphandler = CHAIN(CreateFrame("Button",nil,button))
		:SetFrameLevel(button:GetFrameLevel()+1)
		:SetPoint("TOPLEFT")
		:SetSize(40,40)
	.__END	
		button.itemicon = CHAIN(button.tooltiphandler:CreateTexture()) 
			:SetSize(40,40)
			:SetPoint("TOPLEFT",button) 
			:SetTexture(object[1])
		.__END

		button.tooltiphandler:SetScript("OnEnter",function()
			GameTooltip:SetOwner(button, "ANCHOR_CURSOR")
			if button.link then
				GameTooltip:SetHyperlink(button.link)
			else
				GameTooltip:SetText(button.slotName)
			end
			GameTooltip:Show()
		end)
		button.tooltiphandler:SetScript("OnLeave",function()
			GameTooltip:FadeOut()
		end)


	button.itemlink = CHAIN(button:CreateFontString())
		:SetPoint("TOPLEFT",button.itemicon,"TOPRIGHT",5,0)
		:SetFont(FONT,12)
		:SetText("")
		:SetWidth(210)
		:SetJustifyH("LEFT")
		:SetWordWrap(false)
	.__END

	button.itemdungeon = CHAIN(button:CreateFontString())
		:SetPoint("TOPLEFT",button.itemlink,"BOTTOMLEFT",0,-3)
		:SetFont(FONT,10)
		:SetText(L["gearfinder_no_upgrade"])
		:SetWidth(210)
		:SetJustifyH("LEFT")
		:SetWordWrap(false)
	.__END
	button.itemencounter = CHAIN(button:CreateFontString())
		:SetPoint("TOPLEFT",button.itemdungeon,"BOTTOMLEFT",0,-3)
		:SetFont(FONT,10)
		:SetText("")
		:SetWidth(210)
		:SetJustifyH("LEFT")
		:SetWordWrap(false)
	.__END

	button.loadguide = CHAIN(ZGV.CreateFrameWithBG("Button", nil, button, nil))
		:SetBackdropColor(0,0,0,1)
		:SetBackdropBorderColor(0,0,0,0)
		:SetSize(20,20)
		:SetPoint("RIGHT")
		:Hide()
		:SetScript("OnEnter",function()
			button.loadguide:Show()
			GameTooltip:SetOwner(button, "ANCHOR_TOP")
			GameTooltip:SetText(L["gearfinder_load_guide"] or L["frame_selectguide"])
			GameTooltip:Show()
		end)
		:SetScript("OnLeave",function()
			button.loadguide:Hide()
			GameTooltip:Hide()
		end)
		:SetScript("OnClick",function(self,b)
			if button.dungeonguide then
				if ZGV.Tabs and ZGV.Tabs.LoadGuideToTab then
					ZGV.Tabs:LoadGuideToTab(button.dungeonguide,button.dungeonguide.CurrentStepNum or 1)
				end
			end
		end)
	.__END

	button.slotID = object[2]
	button.slotName = object[3]
	button.slotTexture = object[1]
	button.dungeonguide = nil
	return button
end

-- update gearfinder window to use current skin
-- no params
-- no returns
function GearFinder:ApplySkin()
	local MF = GearFinder.MainFrame
	if not MF then return end

	MF.Logo:SetTexture("Interface\\Icons\\INV_Chest_Chain_04")
	MF.Logo:SetSize(24, 24)
	MF.Logo:SetTexCoord(0.07, 0.93, 0.07, 0.93)

	-- CenterColumn positioning set in CreateMainFrame

	MF.FooterSettingsButton:SetPoint("BOTTOMRIGHT",-12,8)
end

-- creates main frame, with header and footer, adds entries for all equip slots and guide info
-- no params
-- no returns
function GearFinder:CreateMainFrame()
	if self.MainFrame then return end

	GearFinder:AttachFrame()

	self.MainFrame = CHAIN(ZGV.CreateFrameWithBG("Frame","ZygorGearFinder",CharacterFrame))
		:SetPoint("TOPLEFT", CharacterFrame, "TOPLEFT")
		:SetPoint("BOTTOMLEFT", CharacterFrame, "BOTTOMLEFT")
		:SetWidth(580)
		:SetFrameStrata("HIGH")
		:SetFrameLevel(CharacterFrame:GetFrameLevel()+10)
		:SetToplevel(true)
		.__END
	-- Solid background so character sheet doesn't bleed through
	self.MainFrame:SetBackdrop({
		bgFile = "Interface\\Buttons\\white8x8",
		edgeFile = "Interface\\DialogFrame\\UI-DialogBox-Border",
		tile = true, tileSize = 16, edgeSize = 16,
		insets = { left = 4, right = 4, top = 4, bottom = 4 },
	})
	self.MainFrame:SetBackdropColor(0.05, 0.05, 0.08, 1.0)
	self.MainFrame:SetBackdropBorderColor(0.6, 0.6, 0.6, 1.0)

	local MF = self.MainFrame

	MF.Logo = CHAIN(MF:CreateTexture())
		:SetPoint("TOP",MF,"TOP",0,-3)
	.__END
	MF.Title = CHAIN(MF:CreateFontString())
		:SetPoint("TOPLEFT",8,-8)
		:SetFont(FONT,14)
		:SetTextColor(1, 0.82, 0)
		:SetText(L["gearfinder_title"])
	 .__END
	MF.close = CHAIN(CreateFrame("Button",nil,MF,"UIPanelCloseButton"))
		:SetPoint("TOPRIGHT",-2,-2)
		:SetSize(20,20)
		:SetScript("OnClick", function()
			MF:Hide()
			HideUIPanel(CharacterFrame)
		end)
		.__END

	-- Footer
	MF.FooterSettingsButton = CHAIN(CreateFrame("Button",nil,MF))
		:SetPoint("BOTTOMRIGHT",-8,5)
		:SetSize(15,15)
		:SetNormalTexture("Interface\\Buttons\\UI-OptionsButton")
		:SetScript("OnClick",function() ZGV:OpenOptions("gear") end)
	.__END

	-- content container
	MF.CenterColumn = CHAIN(ZGV.CreateFrameWithBG("Frame", nil, MF))
		:SetPoint("TOPLEFT", MF, "TOPLEFT", 10, -35)
		:SetPoint("BOTTOMRIGHT", MF, "BOTTOMRIGHT", -10, 25)
		:EnableMouse(true)
		:Show()
		.__END
	MF.CenterColumn:SetBackdropColor(0.03, 0.03, 0.05, 0.6)
	MF.CenterColumn:SetBackdropBorderColor(0.2, 0.2, 0.2, 0.5)


	-- 3.3.5a: use texture paths instead of FileDataIDs
	local SLOT_TEXTURES = {
		Head      = "Interface\\PaperDoll\\UI-PaperDoll-Slot-Head",
		Neck      = "Interface\\PaperDoll\\UI-PaperDoll-Slot-Neck",
		Shoulder  = "Interface\\PaperDoll\\UI-PaperDoll-Slot-Shoulder",
		Back      = "Interface\\PaperDoll\\UI-PaperDoll-Slot-Chest",
		Chest     = "Interface\\PaperDoll\\UI-PaperDoll-Slot-Chest",
		Wrist     = "Interface\\PaperDoll\\UI-PaperDoll-Slot-Wrists",
		MainHand  = "Interface\\PaperDoll\\UI-PaperDoll-Slot-MainHand",
		OffHand   = "Interface\\PaperDoll\\UI-PaperDoll-Slot-SecondaryHand",
		Ranged    = "Interface\\PaperDoll\\UI-PaperDoll-Slot-Ranged",
		Hands     = "Interface\\PaperDoll\\UI-PaperDoll-Slot-Hands",
		Waist     = "Interface\\PaperDoll\\UI-PaperDoll-Slot-Waist",
		Legs      = "Interface\\PaperDoll\\UI-PaperDoll-Slot-Legs",
		Feet      = "Interface\\PaperDoll\\UI-PaperDoll-Slot-Feet",
		Finger    = "Interface\\PaperDoll\\UI-PaperDoll-Slot-Finger",
		Trinket   = "Interface\\PaperDoll\\UI-PaperDoll-Slot-Trinket",
	}

	local left_column = {
		{SLOT_TEXTURES.Head,     INVSLOT_HEAD,     GF_GetSlotLabel("HEADSLOT", "Head")},
		{SLOT_TEXTURES.Neck,     INVSLOT_NECK,     GF_GetSlotLabel("NECKSLOT", "Neck")},
		{SLOT_TEXTURES.Shoulder, INVSLOT_SHOULDER, GF_GetSlotLabel("SHOULDERSLOT", "Shoulder")},
		{SLOT_TEXTURES.Back,     INVSLOT_BACK,     GF_GetSlotLabel("BACKSLOT", "Back")},
		{SLOT_TEXTURES.Chest,    INVSLOT_CHEST,    GF_GetSlotLabel("CHESTSLOT", "Chest")},
		{SLOT_TEXTURES.Wrist,    INVSLOT_WRIST,    GF_GetSlotLabel("WRISTSLOT", "Wrist")},
		{SLOT_TEXTURES.MainHand, INVSLOT_MAINHAND, GF_GetSlotLabel("MAINHANDSLOT", "Main Hand")},
		{SLOT_TEXTURES.OffHand,  INVSLOT_OFFHAND,  GF_GetSlotLabel("SECONDARYHANDSLOT", "Off Hand")},
		{SLOT_TEXTURES.Ranged,   INVSLOT_RANGED,   GF_GetSlotLabel("RANGEDSLOT", "Ranged")},
	}

	local right_column = {
		{SLOT_TEXTURES.Hands,   INVSLOT_HAND,     GF_GetSlotLabel("HANDSSLOT", "Hands")},
		{SLOT_TEXTURES.Waist,   INVSLOT_WAIST,    GF_GetSlotLabel("WAISTSLOT", "Waist")},
		{SLOT_TEXTURES.Legs,    INVSLOT_LEGS,     GF_GetSlotLabel("LEGSSLOT", "Legs")},
		{SLOT_TEXTURES.Feet,    INVSLOT_FEET,     GF_GetSlotLabel("FEETSLOT", "Feet")},
		{SLOT_TEXTURES.Finger,  INVSLOT_FINGER1,  GF_GetSlotLabel("FINGER0SLOT", "Ring 1")},
		{SLOT_TEXTURES.Finger,  INVSLOT_FINGER2,  GF_GetSlotLabel("FINGER1SLOT", "Ring 2")},
		{SLOT_TEXTURES.Trinket, INVSLOT_TRINKET1, GF_GetSlotLabel("TRINKET0SLOT", "Trinket 1")},
		{SLOT_TEXTURES.Trinket, INVSLOT_TRINKET2, GF_GetSlotLabel("TRINKET1SLOT", "Trinket 2")},
	}

	MF.Buttons = {}
	local previous = nil
	for i,object in ipairs(left_column) do
		local button = make_button(object)
	
		if previous then
			button:SetPoint("TOPLEFT",previous,"BOTTOMLEFT",0,-6)
		else
			button:SetPoint("TOPLEFT",MF.CenterColumn,"TOPLEFT",10,-10)
		end
		previous = button
		MF.Buttons[object[2]] = button
	end

	local previous = nil
	for i,object in ipairs(right_column) do
		local button = make_button(object)
	
		if previous then
			button:SetPoint("TOPLEFT",previous,"BOTTOMLEFT",0,-6)
		else
			button:SetPoint("TOPLEFT",MF.Buttons[INVSLOT_HEAD],"TOPRIGHT",20,0)
		end
		previous = button
		MF.Buttons[object[2]] = button
	end

	MF.ErrorBox = CHAIN(ZGV.CreateFrameWithBG("Frame", nil, MF.CenterColumn))
		:SetPoint("TOPLEFT", MF.Buttons[INVSLOT_TRINKET2], "BOTTOMLEFT", 0, -8)
		:SetPoint("TOPRIGHT", MF.CenterColumn, "TOPRIGHT", -10, -338)
		:SetHeight(72)
		:Hide()
		.__END
	MF.ErrorBox:SetBackdropColor(0.12, 0.03, 0.03, 0.88)
	MF.ErrorBox:SetBackdropBorderColor(0.55, 0.12, 0.12, 0.9)
	MF.ErrorBox.Label = CHAIN(MF.ErrorBox:CreateFontString())
		:SetPoint("TOPLEFT", MF.ErrorBox, "TOPLEFT", 6, -5)
		:SetPoint("TOPRIGHT", MF.ErrorBox, "TOPRIGHT", -6, -5)
		:SetFont(FONTBOLD, 9)
		:SetTextColor(1.0, 0.82, 0.35)
		:SetJustifyH("LEFT")
		:SetText("Gear Finder Debug")
		.__END
	MF.ErrorBox.Text = CHAIN(MF.ErrorBox:CreateFontString())
		:SetPoint("TOPLEFT", MF.ErrorBox.Label, "BOTTOMLEFT", 0, -3)
		:SetPoint("BOTTOMRIGHT", MF.ErrorBox, "BOTTOMRIGHT", -6, 5)
		:SetFont(FONT, 7)
		:SetTextColor(1.0, 0.78, 0.78)
		:SetJustifyH("LEFT")
		:SetJustifyV("TOP")
		:SetSpacing(1)
		:SetText("")
		.__END

	MF.DungeonImage = CHAIN(MF.CenterColumn:CreateTexture(nil,"ARTWORK")) 
		:SetSize(96,61)
		:SetPoint("BOTTOMLEFT",MF.CenterColumn,"BOTTOMLEFT",10,36)
		:SetTexture(ZGV.DIR.."\\Skins\\menu_noguide")
		:SetTexCoord(0,220/256,0,139/256)
	.__END

	MF.DungeonMessage = CHAIN(MF.CenterColumn:CreateFontString())
		:SetPoint("TOPLEFT",MF.DungeonImage,"TOPRIGHT",10,0)
		:SetFont(FONT,10)
		:SetText(L["gearfinder_suggested_dungeon"])
		:SetWidth(140)
		:SetJustifyH("LEFT")
		:Hide()
	.__END

	MF.AddButton = CHAIN(ZGV.CreateFrameWithBG("Button", nil, MF.CenterColumn, nil))
		:SetBackdropColor(0,0,0,1)
		:SetBackdropBorderColor(0,0,0,0)
		:SetSize(20,20)
		:SetNormalTexture("Interface\\Buttons\\UI-PlusButton-Up")
		:SetScript("OnEnter",function()
			GameTooltip:SetOwner(MF.AddButton, "ANCHOR_TOP")
			GameTooltip:SetText(L["gearfinder_load_guide"] or L["frame_selectguide"])
			GameTooltip:Show()
		end)
		:SetScript("OnLeave",function()
			GameTooltip:Hide()
		end)
		:SetScript("OnClick",function()
			if GearFinder.BestDungeonGuide and ZGV.Tabs and ZGV.Tabs.LoadGuideToTab then
				ZGV.Tabs:LoadGuideToTab(GearFinder.BestDungeonGuide,GearFinder.BestDungeonGuide.CurrentStepNum or 1)
			end
		end)
		:SetPoint("TOPRIGHT",MF.DungeonMessage,"TOPRIGHT",18,0)
		:Hide()
	.__END

	MF.DungeonName = CHAIN(MF.CenterColumn:CreateFontString())
		:SetPoint("TOPLEFT",MF.DungeonMessage,"BOTTOMLEFT",0,-4)
		:SetFont(FONT,12)
		:SetText("")
		:SetWidth(150)
		:SetJustifyH("LEFT")
	.__END
	MF.DungeonDesc = CHAIN(MF.CenterColumn:CreateFontString())
		:SetPoint("TOPLEFT",MF.DungeonName,"BOTTOMLEFT",0,-2)
		:SetFont(FONT,10)
		:SetText("")
		:SetWidth(150)
		:SetJustifyH("LEFT")
	.__END


	-- Simple progress bar (plain StatusBar instead of custom widget)
	MF.Progress = CreateFrame("StatusBar", nil, MF)
	MF.Progress:SetSize(500, 7)
	MF.Progress:SetFrameLevel(MF:GetFrameLevel()+3)
	MF.Progress:SetPoint("BOTTOMLEFT", MF, "BOTTOMLEFT", 5, 5)
	MF.Progress:SetStatusBarTexture("Interface\\TargetingFrame\\UI-StatusBar")
	MF.Progress:GetStatusBarTexture():SetVertexColor(0.2, 0.6, 1.0)
	MF.Progress:SetMinMaxValues(0, 100)
	MF.Progress:SetValue(0)
	MF.Progress.Texture = MF.Progress:GetStatusBarTexture()
	function MF.Progress:SetPercent(pct, mode)
		self:SetValue(pct or 0)
	end

	tinsert(UISpecialFrames, "ZygorGearFinder") -- allows the frame to be closable with ESC keypress

	MF.overlay = CHAIN(ZGV.CreateFrameWithBG("Button",nil,MF))
		:SetPoint("TOPLEFT",MF,"TOPLEFT",10,-27)
		:SetPoint("BOTTOMRIGHT",MF,"BOTTOMRIGHT",-10,20)
		:SetBackdropColor(0,0,0,0.7)
		:SetBackdropBorderColor(0,0,0,0.7)
		:SetFrameLevel(MF:GetFrameLevel()+5)
		:SetScript("OnClick", function() GearFinder:ScoreDungeonItems() end)
		:SetScript("OnEnter",function()
			GameTooltip:SetOwner(MF.overlay, "ANCHOR_CURSOR")
			GameTooltip:SetText(L["gearfinder_refresh"])
			GameTooltip:Show()
		end)
		:SetScript("OnLeave",function()
			GameTooltip:FadeOut()
		end)
		:Hide()
	.__END

	MF.overlay.tex = MF.overlay:CreateTexture()
	MF.overlay.tex:SetTexture(ZGV.DIR.."\\Skins\\refresh")
	MF.overlay.tex:SetSize(32,32)
	MF.overlay.tex:SetPoint("CENTER")


	ZGV:AddMessageHandler("SKIN_UPDATED",GearFinder.ApplySkin)
	GearFinder:ApplySkin()
	MF:Hide()
end

-- maps difficulty id to display name (normal, heroic etc)
local diff_to_name = {
	[1]=PLAYER_DIFFICULTY1,
	[2]=PLAYER_DIFFICULTY2,
	[3]=PLAYER_DIFFICULTY1,
	[4]=PLAYER_DIFFICULTY1,
	[5]=PLAYER_DIFFICULTY2,
	[6]=PLAYER_DIFFICULTY2,
	[7]=PLAYER_DIFFICULTY3,
	[23]=PLAYER_DIFFICULTY6,
	[24]=PLAYER_DIFFICULTY_TIMEWALKER,
	[17]=PLAYER_DIFFICULTY3,
	[14]=PLAYER_DIFFICULTY1,
	[15]=PLAYER_DIFFICULTY2,
	[16]=PLAYER_DIFFICULTY6,
}

local function find_dungeon_guide(ident)
	local dungeon = GF_GetDungeonData(ident)

	if not dungeon then return false end

	local dungeon_guide, dungeon_map, dungeon_lfg

	if type(dungeon.map)=="table" then
		for i,v in pairs(dungeon.map) do
			if not dungeon_map or v<dungeon_map then dungeon_map = v end
		end
	else
		dungeon.map = dungeon.map
	end
	dungeon_map = tonumber(dungeon_map)
	dungeon_lfg = tonumber(dungeon.id)

	if dungeon_lfg then
		for g,guide in ipairs(ZGV.registeredguides) do -- check by lfg codes first, for winded instances
			if tonumber(guide.lfgid)==(dungeon_lfg) then dungeon_guide=guide break end
		end
	end

	if not dungeon_guide and dungeon_map then
		for g,guide in ipairs(ZGV.registeredguides) do -- if nothing, then use dungeon maps
			if tonumber(guide.mapid)==tonumber(dungeon_map) then dungeon_guide=guide break end
		end
	end

	return dungeon_guide,dungeon
end

-- displays result of scoring all dungeon items
function GearFinder:DisplayResults()
	if not GearFinder.MainFrame then return end

	local MF = GearFinder.MainFrame
	local Buttons = MF.Buttons
	local dungeons = {}

	if MF.ErrorBox then
		local errtext = GearFinder.LastError and tostring(GearFinder.LastError) or ""
		if errtext == "" then
			local firstRejectSlot, firstRejectText
			if GearFinder.DebugSlotReject then
				for slot, reason in pairs(GearFinder.DebugSlotReject) do
					if reason and reason ~= "" then
						firstRejectSlot, firstRejectText = slot, reason
						break
					end
				end
			end
			local currentCount, futureCount = 0, 0
			for _, dungeonItems in pairs(GearFinder.ItemsToScore or {}) do
				currentCount = currentCount + #dungeonItems
			end
			for _, dungeonItems in pairs(GearFinder.ItemsToMaybeScore or {}) do
				futureCount = futureCount + #dungeonItems
			end
			local summary = GearFinder.DebugSummary or {}
			local reasonList = {}
			for reason, count in pairs(summary.invalidReasons or {}) do
				reasonList[#reasonList + 1] = { reason = tostring(reason), count = tonumber(count) or 0 }
			end
			table.sort(reasonList, function(a, b) return a.count > b.count end)
			errtext = ("Class: %s  Src: %d  Valid: %d  Future: %d\nCurrent pool: %d  Future pool: %d"):format(
				tostring(summary.player or "?"),
				tonumber(summary.sourceInstances) or 0,
				tonumber(summary.validDungeons) or 0,
				tonumber(summary.futureDungeons) or 0,
				currentCount,
				futureCount
			)
			if reasonList[1] then
				errtext = errtext .. ("\nRejects: %s (%d)"):format(reasonList[1].reason, reasonList[1].count)
				if reasonList[2] then
					errtext = errtext .. (" | %s (%d)"):format(reasonList[2].reason, reasonList[2].count)
				end
				if reasonList[3] then
					errtext = errtext .. (" | %s (%d)"):format(reasonList[3].reason, reasonList[3].count)
				end
			end
			errtext = errtext .. ("\ngear_1=%s gear_2=%s gear_3=%s gear_4=%s"):format(
				tostring(summary.gear1),
				tostring(summary.gear2),
				tostring(summary.gear3),
				tostring(summary.gear4)
			)
			if firstRejectText then
				errtext = errtext .. ("\nSlot %s: %s"):format(tostring(firstRejectSlot), firstRejectText)
			end
		end
		MF.ErrorBox.Text:SetText(errtext)
		MF.ErrorBox:Show()
	end

	for slotID, button in pairs(Buttons) do
		local upgrade = GearFinder.UpgradeQueue[slotID] and GearFinder.UpgradeQueue[slotID][1]
		if upgrade then
			local _,itemlink = ZGV:GetItemInfo(upgrade.itemlink)
			button.itemicon:SetTexture(upgrade.texture)
			button.itemlink:SetText(itemlink or upgrade.cached_name or upgrade.itemlink)
			button.link = itemlink or nil
			button.itemicon:SetDesaturated(upgrade.future)
			button:SetAlpha(1)

			local dungeon = GF_GetDungeonData(upgrade.ident)
			button.itemdungeon:SetText((dungeon and dungeon.name) or (L["gearfinder_label_unknown"] or "unknown"))

			if upgrade.future then
				button:SetAlpha(0.5)
				local playeritemlvl = ItemScore.playeritemlvl or 0
				if upgrade.minlevel and upgrade.minlevel > ItemScore.playerlevel then
					button.itemencounter:SetText("(requires level "..upgrade.minlevel..")")
				elseif dungeon and dungeon.minLevel and dungeon.minLevel > ItemScore.playerlevel then
					button.itemencounter:SetText("(requires level "..dungeon.minLevel..")")
				elseif dungeon and dungeon.min_ilevel and dungeon.min_ilevel > playeritemlvl then
					button.itemencounter:SetText("(requires item level "..dungeon.min_ilevel..")")
				else
					button.itemencounter:SetText(" ")
				end
			elseif upgrade.approximate then
				dungeons[upgrade.ident] = (dungeons[upgrade.ident] or 0) + 1
				button.dungeonguide, button.dungeon = find_dungeon_guide(upgrade.ident)
				button.itemencounter:SetText(("Approximate upgrade by item level (%d)"):format(upgrade.itemlvl or 0))
			else
				dungeons[upgrade.ident] = (dungeons[upgrade.ident] or 0) + 1
				button.dungeonguide, button.dungeon = find_dungeon_guide(upgrade.ident)
				if upgrade.quest then
					local questname = ZGV.QuestDB:GetQuestName(upgrade.quest)
					button.itemencounter:SetText("Quest: "..(upgrade.questname or questname or ""))
				elseif upgrade.encounterId then
					button.itemencounter:SetText(GF_GetEncounterLabel(upgrade.encounterId, upgrade.bossname))
				elseif upgrade.bossname then
					button.itemencounter:SetText(upgrade.bossname)
				else
					local summary = GF_FormatFinderSummary(slotID, upgrade, upgrade.change, upgrade.pair)
					button.itemencounter:SetText(summary or " ")
				end
			end
		else
			button.itemicon:SetTexture(button.slotTexture)
			button.itemlink:SetText(" ")
			button.link = nil
			button.dungeonguide = nil
			button.dungeon = nil
			button.itemdungeon:SetText(L["gearfinder_no_upgrade"])
			button.itemencounter:SetText(get_slot_debug_reason(slotID))
			button.itemicon:SetDesaturated(false)
			button:SetAlpha(0.5)
		end
	end

	local sorted_dungeons = {}
	for i,v in pairs(dungeons) do
		if i~="titanrune_alpha" and i~="titanrune_beta" then
			table.insert(sorted_dungeons,{i,v})
		end
	end
	table.sort(sorted_dungeons,function(x,y) return x[2]>y[2] end)

	local best_dungeon = sorted_dungeons[1]

	if best_dungeon then
		local dungeon_guide, dungeon = find_dungeon_guide(best_dungeon[1])
		if dungeon_guide then
			GearFinder.BestDungeonGuide = dungeon_guide

			MF.DungeonMessage:Show()
			if dungeon_guide.image then
				MF.DungeonImage:SetTexture(dungeon_guide.image)
				MF.DungeonImage:SetTexCoord(0,1,0,1)
			else
				MF.DungeonImage:SetTexture(ZGV.DIR.."\\Skins\\menu_noguide")
				MF.DungeonImage:SetTexCoord(0,220/256,0,139/256)
			end
			MF.AddButton:Show()
		else
			GearFinder.BestDungeonGuide = nil
			MF.AddButton:Hide()
		end

		MF.DungeonName:SetText(dungeon.name)
		MF.DungeonName:Show()
		local difftext = diff_to_name[dungeon.difficulty] or ""
		if dungeon.difficulty==8 then
			difftext = difftext .. ZGV.db.profile.gear_8_level
		end
		MF.DungeonDesc:SetText(difftext .. "\n\n" .. L["gearfinder_items_found"]:format(best_dungeon[2]))
		MF.DungeonDesc:Show()
	else
		GearFinder.BestDungeonGuide = nil
		MF.DungeonMessage:Hide()
		MF.DungeonImage:SetTexture(ZGV.DIR.."\\Skins\\menu_noguide")
		MF.DungeonImage:SetTexCoord(0,220/256,0,139/256)
		MF.DungeonName:Hide()
		MF.DungeonDesc:Hide()
		MF.AddButton:Hide()
	end

end

-- clears all displayed results, to be used when gearfinder/itemscore settings are changed or when user changes level/spec
-- no params
-- no returns
function GearFinder:ClearResults()
	if not GearFinder.MainFrame then return end
	local MF = GearFinder.MainFrame
	GearFinder.ResultsReady = false
	GearFinder.DungeonItemsScored = false
	
	-- Signal running coroutine to exit gracefully
	GearFinder.IsScanning = false
	
	-- Cancel timers first
	if GearFinder.ScoreTimer then
		cancel_gearfinder_timer("ScoreTimer")
	end
	if GearFinder.AntsTimer then
		cancel_gearfinder_timer("AntsTimer")
	end
	
	-- Release coroutine reference for GC (Lua 5.1 has no coroutine.close())
	GearFinder.ScoreThread = nil

	for i,v in pairs(ItemScore.GearFinder.UpgradeQueue) do 
		table.wipe(v) 
	end
	for i,v in pairs(ItemScore.GearFinder.FallbackQueue) do
		table.wipe(v)
	end

	MF.DungeonMessage:Hide()
	MF.DungeonImage:SetTexture(ZGV.DIR.."\\Skins\\menu_noguide")
	MF.DungeonImage:SetTexCoord(0,220/256,0,139/256)
	MF.DungeonName:Hide()
	MF.DungeonDesc:Hide()
	MF.AddButton:Hide()
	if MF.ErrorBox then
		MF.ErrorBox.Text:SetText("")
		MF.ErrorBox:Hide()
	end

	for i,button in pairs(MF.Buttons) do
		button.itemicon:SetTexture(button.slotTexture)
		button.itemlink:SetText(" ")
		button.link = nil
		button.dungeonguide = nil
		button.itemdungeon:SetText(L["gearfinder_no_upgrade"])
		button.itemencounter:SetText(" ")
		button.itemicon:SetDesaturated(false)
		button:SetAlpha(0.5)
	end

	MF.overlay:Show()
end

function GearFinder:RefreshForInventoryChange()
	GearFinder:ClearResults()
	if GearFinder.MainFrame and GearFinder.MainFrame:IsVisible() then
		GearFinder:ScoreDungeonItems()
	end
end
