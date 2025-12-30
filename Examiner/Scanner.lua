local REVISION = 3;
if (type(ExScanner) == "table") and (ExScanner.vers and ExScanner.vers >= REVISION) then
	return;
end

-- Examiner Scanner Table
ExScanner = ExScanner or {};
ExScanner.vers = REVISION;

ExScanner.ItemLinkPattern = "^.+|H(item:[^|]+)|h%[.+$";
ExScanner.ItemUseToken = "^"..ITEM_SPELL_TRIGGER_ONUSE.." ";
ExScanner.SetNamePattern = "^(.+) %((%d)/(%d)%)$";
ExScanner.SetBonusTokenActive = "^"..ITEM_SET_BONUS:gsub("%%s","");

ExScanner.MagicSchools = { "FIRE", "NATURE", "ARCANE", "FROST", "SHADOW", "HOLY" };

ExScanner.Slots = {
	"HeadSlot", "NeckSlot", "ShoulderSlot", "BackSlot", "ChestSlot", "ShirtSlot", "TabardSlot", "WristSlot",
	"HandsSlot", "WaistSlot", "LegsSlot", "FeetSlot", "Finger0Slot", "Finger1Slot", "Trinket0Slot", "Trinket1Slot",
	"MainHandSlot", "SecondaryHandSlot", "RangedSlot",
};

ExScanner.SlotIDs = {};
for _, slotName in ipairs(ExScanner.Slots) do
	ExScanner.SlotIDs[slotName] = GetInventorySlotInfo(slotName);
end

ExScanner.StatRatingBaseTable = {
	SPELLHASTE = 10,
	SPELLHIT = 8,
	SPELLCRIT = 14,
	HASTE = 10,
	HIT = 10,
	CRIT = 14,
	EXPERTISE = 2.5,
	DEFENSE = 1.5,
	DODGE = 13.8,	-- Patch 3.2: Increased 15% from 12
	PARRY = 13.8,	-- Patch 3.2: Reduced 8% from 15
	BLOCK = 5,
	RESILIENCE = 28.75,	-- Patch 3.2: Increased 15% from 25
	ARMORPENETRATION = 4.69512176513672 / 1.25 * 1.12,		-- Patch 3.1 Quote:		"All classes now receive 25% more benefit from Armor Penetration Rating."
															-- Patch 3.2.2 Quote:	"The amount of armor penetration gained per point of this rating has been reduced by 12%."
};

-- ItemSlotValues Tables
-- Legendary items uses the same values as epics.
-- Heirloom items uses the same values as rares, although this is not entirely correct, and is messed up anyway, since their itemlevel is one.
-- White and Grey items uses a factor of one, which is totally wrong, but I have no idea what a real number for those qualities would be.
ExScanner.RarityFactor = { [0] = 1, [1] = 1, [2] = 2, [3] = 1.8, [4] = 1.2, [5] = 1.2, [6] = 1, [7] = 1.8 };
ExScanner.RaritySubtract = { [0] = 0, [1] = 0, [2] = 8, [3] = 0.75, [4] = 26, [5] = 26, [6] = 0, [7] = 0.75 };

ExScanner.Tip = ExScanner.Tip or CreateFrame("GameTooltip","ExScannerTip",nil,"GameTooltipTemplate");
ExScanner.Tip:SetOwner(UIParent,"ANCHOR_NONE");

-- Used in ScanUnitItems
local scannedSetNames = {};

--------------------------------------------------------------------------------------------------------
--          Scan all items and set bonuses on given 'unit' (Make sure the tables are reset)           --
--------------------------------------------------------------------------------------------------------
function ExScanner:ScanUnitItems(unit,statTable,setTable)
	if (not unit) or (not UnitExists(unit)) then
		return;
	end
	-- Check all item slots
	for _, slotName in ipairs(self.Slots) do
		-- Set New Item Tip
		self.Tip:ClearLines();
		self.Tip:SetInventoryItem(unit,GetInventorySlotInfo(slotName));
		local lastSetName;
		local lastBonusCount = 1;
		-- Check Lines
		for i = 2, self.Tip:NumLines() do
			if (self:DoLineNeedScan(_G["ExScannerTipTextLeft"..i],true)) then
				-- We use "setMax" to check if the Line was a SetNamePattern (WTB continue statement in Lua)
				local setName, setCount, setMax;
				-- Set Header (Only run this if we haven't found a set on this item yet)
				if (not lastSetName) then
					setName, setCount, setMax = self.text:match(self.SetNamePattern);
					if (setMax) and (not setTable[setName]) then
						setTable[setName] = { count = tonumber(setCount), max = tonumber(setMax) };
						lastSetName = setName;
						--continue :(
					end
				end
				-- Check Line for Patterns if this Line was not a SetNamePattern
				if (not setMax) then
					if (self.text:find(self.SetBonusTokenActive)) then
						-- If this item is part of a set, that we haven't scanned the setbonuses of, do it now.
						if (lastSetName) and (not scannedSetNames[lastSetName]) then
							self:ScanLineForPatterns(self.text,statTable);
							setTable[lastSetName]["setBonus"..lastBonusCount] = self.text;
							lastBonusCount = (lastBonusCount + 1);
						end
					else
						self:ScanLineForPatterns(self.text,statTable);
					end
				end
			end
		end
		-- Mark this set as scanned
		if (lastSetName) then
			scannedSetNames[lastSetName] = true;
		end
	end
	-- Cleanup
	wipe(scannedSetNames);
end
--------------------------------------------------------------------------------------------------------
--        Scans a single item given by 'itemLink', stats are added to the 'statTable' variable        --
--------------------------------------------------------------------------------------------------------
function ExScanner:ScanItemLink(itemLink,statTable)
	if (itemLink) then
		-- Set Link
		self.Tip:ClearLines();
		self.Tip:SetHyperlink(itemLink);
		-- Check Lines
		for i = 2, self.Tip:NumLines() do
			if (self:DoLineNeedScan(_G["ExScannerTipTextLeft"..i],false)) then
				self:ScanLineForPatterns(self.text,statTable);
			end
		end
	end
end
--------------------------------------------------------------------------------------------------------
--                         Checks if a Line Needs to be Scanned for Patterns                          --
--------------------------------------------------------------------------------------------------------
function ExScanner:DoLineNeedScan(tipLine,scanSetBonuses)
	-- Init Line
	local text = tipLine:GetText();
	local color = text:match("^(|c%x%x%x%x%x%x%x%x)");
	text = text:gsub("|c%x%x%x%x%x%x%x%x","");
	self.text = text;
	local r, g, b = tipLine:GetTextColor();
	r, g, b = ceil(r * 255), ceil(g * 255), ceil(b * 255);
	-- Always *Skip* Gray Lines
	if (r == 128 and g == 128 and b == 128) or (color == "|cff808080") then
		return;
	-- Active Set Bonuses (Must be checked before green color check)
	elseif (not scanSetBonuses and text:find(self.SetBonusTokenActive)) then
		return;
	-- Skip "Use:" lines, they are not a permanent stat, so don't include them
	elseif (text:find(self.ItemUseToken)) then
		return;
	-- Always *Scan* Green Lines
	elseif (r == 0 and g == 255 and b == 0) or (color == "|cff00ff00") then
		return 1;
	-- Should Match: Normal +Stat, Base Item Armor, Block Value on Shields
	elseif (text:find("^[+-]?%d+ [^%d]")) then
		return 1;
	-- Set Names (Needed to Check Sets)
	elseif (scanSetBonuses and text:find(self.SetNamePattern)) then
		return 1;
	end
	return;
end
--------------------------------------------------------------------------------------------------------
--                                 Checks a Single Line for Patterns                                  --
--------------------------------------------------------------------------------------------------------
function ExScanner:ScanLineForPatterns(text,statTable)
	for _, pattern in ipairs(self.Patterns) do
		local pos, _, value1, value2 = text:find(pattern.p);
		if (pos) and (value1 or pattern.v) then
			if (type(pattern.s) == "string") then
				statTable[pattern.s] = (statTable[pattern.s] or 0) + (value1 or pattern.v);
			elseif (type(pattern.s) == "table") then
				for statIndex, statName in ipairs(pattern.s) do
					if (type(pattern.v) == "table") then
						statTable[statName] = (statTable[statName] or 0) + (pattern.v[statIndex]);
					-- Az: This is a bit messy, only supports 2 now, needs to make it dynamic and support as many extra values as possible
					elseif (statIndex == 2) and (value2) then
						statTable[statName] = (statTable[statName] or 0) + (value2);
					else
						statTable[statName] = (statTable[statName] or 0) + (value1 or pattern.v);
					end
				end
			end
		end
	end
end
--------------------------------------------------------------------------------------------------------
--              Convert Rating to Percent          http://www.wowwiki.com/Combat_Rating_System        --
--------------------------------------------------------------------------------------------------------
function ExScanner:GetRatingInPercent(stat,rating,level,class)
	local base = self.StatRatingBaseTable[stat];
	-- Check Valid Input
	if (not base or not rating or not level) then
		return;
	end
	-- Patch 3.1 Quote: "shamans, paladins, druids, and death knights now receive 30% more melee haste from Haste Rating."
	if (class and stat == "HASTE") and (class == "PALADIN" or class == "SHAMAN" or class == "DEATHKNIGHT" or class == "DRUID") then
		base = (base / 1.3);
	end
	-- Calc Depending on Level
	if (level >= 70) then
		return rating / base / (82 / 52 * (131 / 63) ^ ((level - 70) / 10));
	elseif (level >= 60) then
		return rating / base / (82 / (262 - 3 * level));
	else
		return rating / base / ((level > 10 and level - 8 or 2) / 52);
	end
end
--------------------------------------------------------------------------------------------------------
--                                       Slot Value Calculation                                       --
--------------------------------------------------------------------------------------------------------
function ExScanner:CalculateItemSlotValue(itemLink)
	local _, _, itemRarity, itemLevel = GetItemInfo(itemLink);
	return (itemLevel - self.RaritySubtract[itemRarity]) / self.RarityFactor[itemRarity];
end