local gtt = GameTooltip;

-- Global Chat Message Function
function AzMsg(msg) DEFAULT_CHAT_FRAME:AddMessage(tostring(msg):gsub("|1","|cffffff80"):gsub("|2","|cffffffff"),0.5,0.75,1.0); end

-- Create Examiner Frame
local modName = "Examiner";
local ex = CreateFrame("Frame","Examiner",UIParent);
ex.compareStats = {};
ex.modules = {};

-- Local Saved Tables
local cfg, cache;

-- Data Tables
local info = { Sets = {}, Items = {} };
local unitStats = {};
ex.unitStats = unitStats;
ex.info = info;

-- Misc Constants
local EX_ClassificationNames = {
	worldboss = BOSS,
	rareelite = ITEM_QUALITY3_DESC..ELITE,
	elite = ELITE,
	rare = ITEM_QUALITY3_DESC,
};

-- Colors
local CACHE_VERTEX_COLOR = { 1, 1, 0.4 };
local CLASS_COLORS = CUSTOM_CLASS_COLORS or RAID_CLASS_COLORS;

-- Texture Mapping
local EX_Backgrounds = {
	"DeathKnightBlood",
	"DeathKnightFrost",
	"DeathKnightUnholy",
	"DruidBalance",
	"DruidFeralCombat",
	"DruidRestoration",
	"HunterBeastMastery",
	"HunterMarksmanship",
	"HunterSurvival",
--	"HunterPetCunning",
--	"HunterPetFerocity",
--	"HunterPetTenacity",
	"MageArcane",
	"MageFire",
	"MageFrost",
	"PaladinCombat",
	"PaladinHoly",
	"PaladinProtection",
	"PriestDiscipline",
	"PriestHoly",
	"PriestShadow",
	"RogueAssassination",
	"RogueCombat",
	"RogueSubtlety",
	"ShamanElementalCombat",
	"ShamanEnhancement",
	"ShamanRestoration",
	"WarlockCurses",
	"WarlockDestruction",
	"WarlockSummoning",
	"WarriorArms",
	"WarriorFury",
	"WarriorProtection",
};

-- Options
ex.options = {
	{ var = "makeMovable", default = false, label = "Make Examiner Movable", tip = "To freely move Examiner around, enable this option, otherwise it will behave like a normal frame, such as the Quest Log or Spellbook" },
	{ var = "autoInspect", default = true, label = "Auto Inspect on Target Change", tip = "With this option turned on, Examiner will automatically inspect your new target when you change it." },
	{ var = "clearInspectOnHide", default = false, label = "Clear Inspect Data on Hide", tip = "When Examiner gets hidden, this option will clear inspection data, thus freeing up some memory." },
	{ var = "percentRatings", default = false, label = "Show Ratings in Percentage", tip = "With this option enabled, ratings will be displayed in percent relative to the inspected person's level." },
	{ var = "combineAdditiveStats", default = true, label = "Combine Additive Stats", tip = "This option will combine certain stats which stacks with others. This include Spell Damage to specific spell schools and AP to Ranged AP." },
};

--------------------------------------------------------------------------------------------------------
--                                          Examiner Scripts                                          --
--------------------------------------------------------------------------------------------------------

-- OnShow / OnHide
local function Examiner_OnShow(self)
	self:RegisterEvent("PLAYER_TARGET_CHANGED");
	self:RegisterEvent("UNIT_MODEL_CHANGED");
	self:RegisterEvent("UNIT_PORTRAIT_UPDATE");
	self:RegisterEvent("UNIT_INVENTORY_CHANGED");
end

local function Examiner_OnHide(self)
	self.model.isRotating = nil;
	self.model.isPanning = nil;
	self:UnregisterEvent("PLAYER_TARGET_CHANGED");
	self:UnregisterEvent("UNIT_MODEL_CHANGED");
	self:UnregisterEvent("UNIT_PORTRAIT_UPDATE");
	self:UnregisterEvent("UNIT_INVENTORY_CHANGED");
	if (cfg.clearInspectOnHide) then
		ex:ClearInspect();
	end
end

-- OnUpdate
local function Examiner_OnUpdate(self,elapsed)
	if (ex:ValidateUnit()) and (CheckInteractDistance(ex.unit,1)) then
		ex.InspectUnit(ex.unit);
	end
end

-- Event Handler
function ex.Standard_OnEvent(self,event,...)
	if (self[event]) then
		self[event](self,event,...);
	end
end

-- Hide GTT
function ex.HideGTT()
	gtt:Hide();
end

-- Az: Horrible workaround here for gems not loading on initial inspect, although this does work, it still fails most of the time for mouseover units, simply because your mouseover
-- unit is likely invalid 0.5 sec after initial inspect. I'm guessing that 0.5 seconds would fail at times too, due to high latency, but meh, this workaround is fucked up anyway.
-- Az: This actually causes modules to send two inspect messages, take the glyph addon for instance, ITS BAD! So we only post the update to the Stats and ItemSlots module.
local postInspectFrame = CreateFrame("Frame");
postInspectFrame:Hide();
postInspectFrame:SetScript("OnUpdate",function(self,elapsed)
	self.lastUpdate = (self.lastUpdate + elapsed);
	if (self.lastUpdate > 0.6) then
		if (ex:ValidateUnit()) then
			local unit = ex.unit;
			NotifyInspect(unit);	-- Should fix some problems with tooltip addons wanting to call ClearInspectPlayer()
			wipe(unitStats);
			wipe(info.Sets);
			ExScanner:ScanUnitItems(unit,unitStats,info.Sets);
			-- re-scan & re-cache
			local entry = cache[ex:GetEntryName()];
			local reCache = (entry) and (time() - entry.time < 5);
			for slotName, slotId in next, ExScanner.SlotIDs do
				local link = (GetInventoryItemLink(unit,slotId) or ""):match(ExScanner.ItemLinkPattern);
				info.Items[slotName] = link;
				if (reCache) then
					entry.Items[slotName] = link;
				end
			end
			-- Post update to stats & ItemSlots module
			for index, mod in ipairs(ex.modules) do
				if (mod.token == "Stats" or mod.token == "ItemSlots") and (mod.OnInspect) then
					mod:OnInspect(unit);
				end
			end
		end
		self:Hide();
	end
end);

--------------------------------------------------------------------------------------------------------
--                                           Event Handling                                           --
--------------------------------------------------------------------------------------------------------

-- Variables Loaded
function ex:VARIABLES_LOADED(event)
	-- Config
	if (not Examiner_Config) then
		Examiner_Config = {};
	end
	cfg = Examiner_Config;
	if (not cfg.caching) then
		cfg.caching = {};
	end
	-- Load Defaults
	if (cfg.showBackground == nil) then
		cfg.showBackground = true;
	end
	for _, option in ipairs(self.options) do
		if (cfg[option.var] == nil) then
			cfg[option.var] = option.default;
		end
	end
	-- Cache
	if (not Examiner_Cache) then
		Examiner_Cache = {};
	end
	cache = Examiner_Cache;
	-- SET: Background Visibility | Scale | Frame Movability
	self:ShowBackground();
	self:SetScale(cfg.scale or 1);
	self:SetMovable(cfg.makeMovable);
	if (cfg.makeMovable) and (cfg.left and cfg.bottom) then
		self:ClearAllPoints();
		self:SetPoint("BOTTOMLEFT",cfg.left,cfg.bottom);
	end
	-- HOOK: InspectUnit
	InspectUnit = self.InspectUnit;
	-- ExScanner: Create a List of Sorted Stats
	local stats = ExScanner.StatNames;
	local statsSorted = {};
	ExScanner.StatNamesSorted = statsSorted;
	for stat, name in next, stats do
		statsSorted[#statsSorted + 1] = stat;
	end
	sort(statsSorted,function(a,b) return stats[a] < stats[b]; end);
	-- Modules: Position Buttons + Set Width + Init Modules
	local btnCount = 0;
	for index, mod in ipairs(self.modules) do
		if (mod.button) and (not mod.button.exclude) then
			if (lastButton) then
				mod.button:SetPoint("LEFT",lastButton,"RIGHT",1,0);
			else
				mod.button:SetPoint("BOTTOMLEFT",24,13);
			end
			btnCount = (btnCount + 1);
			lastButton = mod.button;
		end
		if (mod.OnInitialize) then
			mod:OnInitialize();
			mod.OnInitialize = nil;
		end
	end
	local btnWidth = ((self.model:GetWidth() - 4) / btnCount - 1);
	for index, mod in ipairs(self.modules) do
		if (mod.button) and (not mod.button.exclude) then
			mod.button:SetWidth(btnWidth);
		end
	end
	-- Set Shown Page
	if (cfg.activePage) then
		if (cfg.activePage > #self.modules) or (not self.modules[cfg.activePage].page) then
			cfg.activePage = nil;
		end
		if (cfg.activePage) then
			ex:ShowModulePage();
		end
	end
	-- Initialise the Config for Modules -- Az: is this a good way?
	for index, mod in ipairs(self.modules) do
		if (mod.OnConfigChanged) then
			for _, option in ipairs(self.options) do
				mod:OnConfigChanged(option.var,cfg[option.var]);
			end
		end
	end
	-- Remove this event
	self:UnregisterEvent(event);
	self[event] = nil;
end

-- Target Unit Changed
function ex:PLAYER_TARGET_CHANGED(event)
	if (cfg.autoInspect) and (UnitExists("target")) then
		self.InspectUnit("target");
	elseif (self.unit == "target") then
		self.unit = nil;
		self:SetScript("OnUpdate",nil);
	end
end

-- Mouseover Unit Changed
function ex:UPDATE_MOUSEOVER_UNIT(event)
	self.unit = nil;
	self:SetScript("OnUpdate",nil);
	self:UnregisterEvent("UPDATE_MOUSEOVER_UNIT");
end

-- Model or Portrait Change
function ex:UNIT_MODEL_CHANGED(event,unit)
	if (ex:ValidateUnit() and UnitIsUnit(unit,self.unit)) then
		self.model:SetUnit(self.unit);
		SetPortraitTexture(self.portrait,self.unit);
	end
end
ex.UNIT_PORTRAIT_UPDATE = ex.UNIT_MODEL_CHANGED;

-- Refresh on Item Change -- Az: this event might fire when gem data is available?
function ex:UNIT_INVENTORY_CHANGED(event,unit)
	if (ex:ValidateUnit() and UnitIsUnit(unit,ex.unit) and CheckInteractDistance(ex.unit,1)) then
		ex.InspectUnit(ex.unit);
	end
end

--------------------------------------------------------------------------------------------------------
--                                         Model Frame Scripts                                        --
--------------------------------------------------------------------------------------------------------

-- Model Frame Workaround
local function Model_OnShow(self)
	if (self.cleared) then
		self:ClearModel();
	end
end

local function Model_OnUpdate(self,elapsed)
	if (self.isRotating) then
		local endx, endy = GetCursorPosition();
		self.rotation = (endx - self.startx) / 34 + self:GetFacing();
		self:SetFacing(self.rotation);
		self.startx, self.starty = GetCursorPosition();
	elseif (self.isPanning) then
		local endx, endy = GetCursorPosition();
		local z, x, y = self:GetPosition(z,x,y);
		x = (endx - self.startx) / 45 + x;
		y = (endy - self.starty) / 45 + y;
		self:SetPosition(z,x,y);
		self.startx, self.starty = GetCursorPosition();
	end
end

local function Model_OnMouseWheel(self,delta)
	local z, x, y = self:GetPosition();
	local scale = (IsControlKeyDown() and 2 or 0.7);
	z = (delta > 0 and z + scale or z - scale);
	self:SetPosition(z,x,y);
end

local function Model_OnMouseDown(self,button)
	self.startx, self.starty = GetCursorPosition();
	if (button == "LeftButton") then
		self.isRotating = 1;
		if (IsControlKeyDown()) then
			ex:SetBackgroundTexture(true);
		end
	elseif (button == "RightButton") then
		self.isPanning = 1;
		if (IsControlKeyDown()) then
			cfg.showBackground = (not cfg.showBackground);
			ex:ShowBackground();
		end
	end
end

local function Model_OnMouseUp(self,button)
	if (button == "LeftButton") then
		self.isRotating = nil;
	elseif (button == "RightButton") then
		self.isPanning = nil;
	end
end

--------------------------------------------------------------------------------------------------------
--                                            Init Examiner                                           --
--------------------------------------------------------------------------------------------------------

-- Allow Inspect from Any Range
UnitPopupButtons.INSPECT.dist = 0;
--UnitPopupButtons.INSPECT.text = "Examine";
-- UIPanelWindow & UISpecialFrames Entry
UIPanelWindows[modName] = { area = "left", pushable = 1, whileDead = 1 };
UISpecialFrames[#UISpecialFrames + 1] = modName;

-- Examiner Main Frame
ex:SetWidth(384);
ex:SetHeight(440);
ex:SetPoint("CENTER");
ex:SetToplevel(1);
ex:EnableMouse(1);
ex:Hide();
ex:SetHitRectInsets(12,35,10,2);
ex:SetScript("OnShow",Examiner_OnShow);
ex:SetScript("OnHide",Examiner_OnHide);
ex:SetScript("OnEvent",ex.Standard_OnEvent);
ex:SetScript("OnMouseDown",function(self,button) if (self:IsMovable()) then self:StartMoving(); end end);
ex:SetScript("OnMouseUp",function(self,button) if (self:IsMovable()) then self:StopMovingOrSizing(); cfg.left = self:GetLeft(); cfg.bottom = self:GetBottom() end end);

-- Events
ex:RegisterEvent("VARIABLES_LOADED");

-- Close Button
CreateFrame("Button",nil,ex,"UIPanelCloseButton"):SetPoint("TOPRIGHT",-30,-8);

-- Portrait
ex.portrait = ex:CreateTexture(nil,"BACKGROUND");
ex.portrait:SetWidth(60);
ex.portrait:SetHeight(60);
ex.portrait:SetPoint("TOPLEFT",7,-6);

-- FontStrings
ex.title = ex:CreateFontString(nil,"ARTWORK","GameFontNormal");
ex.title:SetPoint("TOP",5,-17);
ex.details = ex:CreateFontString(nil,"ARTWORK","GameFontHighlightSmall");
ex.details:SetPoint("TOP",5,-44);
ex.guild = ex:CreateFontString(nil,"ARTWORK","GameFontHighlightSmall");
ex.guild:SetPoint("TOP",ex.details,"BOTTOM",0,-2);

-- Dialog Textures
ex.dlgTopLeft = ex:CreateTexture(nil,"ARTWORK");
ex.dlgTopLeft:SetTexture("Interface\\PaperDollInfoFrame\\UI-Character-General-TopLeft");
ex.dlgTopLeft:SetPoint("TOPLEFT");
ex.dlgTopLeft:SetWidth(256);
ex.dlgTopLeft:SetHeight(256);
ex.dlgTopRight = ex:CreateTexture(nil,"ARTWORK");
ex.dlgTopRight:SetTexture("Interface\\PaperDollInfoFrame\\UI-Character-General-TopRight");
ex.dlgTopRight:SetPoint("TOPRIGHT");
ex.dlgTopRight:SetWidth(128);
ex.dlgTopRight:SetHeight(256);
ex.dlgBottomLeft = ex:CreateTexture(nil,"ARTWORK");
ex.dlgBottomLeft:SetTexture("Interface\\PaperDollInfoFrame\\UI-Character-General-BottomLeft");
ex.dlgBottomLeft:SetPoint("TOPLEFT",0,-256);
ex.dlgBottomLeft:SetWidth(256);
ex.dlgBottomLeft:SetHeight(256);
ex.dlgBottomRight = ex:CreateTexture(nil,"ARTWORK");
ex.dlgBottomRight:SetTexture("Interface\\PaperDollInfoFrame\\UI-Character-General-BottomRight");
ex.dlgBottomRight:SetPoint("TOPRIGHT",0,-256);
ex.dlgBottomRight:SetWidth(128);
ex.dlgBottomRight:SetHeight(256);

-- Background Textures -- Resize height, so they go beneath module buttons
local bgScale = 1.064;
ex.bgTopLeft = ex:CreateTexture(nil,"OVERLAY");
ex.bgTopLeft:SetPoint("TOPLEFT",21,-76);
ex.bgTopLeft:SetHeight(256 * bgScale);
ex.bgTopRight = ex:CreateTexture(nil,"OVERLAY");
ex.bgTopRight:SetPoint("LEFT",ex.bgTopLeft,"RIGHT");
ex.bgTopRight:SetHeight(256 * bgScale);
ex.bgBottomLeft = ex:CreateTexture(nil,"OVERLAY");
ex.bgBottomLeft:SetPoint("TOP",ex.bgTopLeft,"BOTTOM");
ex.bgBottomLeft:SetHeight(128 * bgScale);
ex.bgBottomRight = ex:CreateTexture(nil,"OVERLAY");
ex.bgBottomRight:SetPoint("LEFT",ex.bgBottomLeft,"RIGHT");
ex.bgBottomRight:SetHeight(128 * bgScale);

-- Model
ex.model = CreateFrame("PlayerModel",nil,ex);
ex.model:SetWidth(320);
ex.model:SetHeight(354);
ex.model:SetPoint("BOTTOM",-11,10);
ex.model:EnableMouse(1);
ex.model:EnableMouseWheel(1);
ex.model:SetScript("OnShow",Model_OnShow);
ex.model:SetScript("OnUpdate",Model_OnUpdate);
ex.model:SetScript("OnMouseDown",Model_OnMouseDown);
ex.model:SetScript("OnMouseUp",Model_OnMouseUp);
ex.model:SetScript("OnMouseWheel",Model_OnMouseWheel);

--------------------------------------------------------------------------------------------------------
--                                            Unit Details                                            --
--------------------------------------------------------------------------------------------------------

local uDetails = {};

-- Unit Detail String
function ex:UnitDetailString()
	-- Level
	local color = GetQuestDifficultyColor(info.level ~= -1 and info.level or 500);
	uDetails[#uDetails + 1] = format("%s |cff%.2x%.2x%.2x%s|r",LEVEL,color.r * 255,color.g * 255,color.b * 255,(info.level ~= -1 and info.level or "??"));
	-- Classification (non players only, so ok to use ex.unit)
	if (not info.raceFixed) then
		local classification = UnitClassification(ex.unit);
		if (EX_ClassificationNames[classification]) then
			uDetails[#uDetails + 1] = "("..EX_ClassificationNames[classification]..")";
		end
	end
	-- Race for Players / Family or Type for NPC's
	if (info.race) then
		uDetails[#uDetails + 1] = (info.race ~= "Not specified" and info.race or UNKNOWN);
	end
	-- Players Only: Class (+ Realm)
	if (info.raceFixed) then
		if (info.class) then
			local color = CLASS_COLORS[info.classFixed];
			uDetails[#uDetails + 1] = format("|cff%.2x%.2x%.2x%s|r",color.r * 255,color.g * 255,color.b * 255,info.class);
		end
		if (info.realm) then
			uDetails[#uDetails + 1] = "of "..info.realm
		end
	end
	-- Return Result
	local result = table.concat(uDetails," ");
	wipe(uDetails);
	return result;
end

-- Unit Guild String (Faction for NPC's)
function ex:UnitGuildString()
	-- Players
	if (info.raceFixed) then
		if (info.guild and info.guildRank and info.guildIndex) then
			return info.guildRank.." ("..info.guildIndex..") of <"..info.guild..">";
		end
	-- NPC's only, so ok to use 'ex.unit' here
	else
		ExScannerTip:ClearLines();
		ExScannerTip:SetUnit(ex.unit);
		local line;
		for i = 2, ExScannerTip:NumLines() - 1 do
			line = _G["ExScannerTipTextLeft"..i]:GetText();
			if (line:find("^"..TOOLTIP_UNIT_LEVEL:gsub("%%s",".+"))) then
				line = _G["ExScannerTipTextLeft"..(i + 1)]:GetText();
				if (line ~= PVP_ENABLED) then
					return line;
				end
			end
		end
	end
	-- Else return empty
	return "";
end

-- Return name used for entires
function ex:GetEntryName()
	return (info.realm and info.name.."-"..info.realm or info.name);
end

--------------------------------------------------------------------------------------------------------
--                                           Stats Stuff                                              --
--------------------------------------------------------------------------------------------------------

-- Returns a modified and formatted stat from the given "statTable", which might be adjusted by certain options
-- If "compareTable" is given a table, it assumes compare mode and displays and colorizes the differences.
-- As a control flag, "compareTable" set to a boolean, will return the value unformatted for use in compare mode.
function ex:GetStatValue(statToken,statTable,compareTable,level)
	local value = (statTable[statToken] or 0);
	local compareType = type(compareTable or nil);
	-- Compare
	if (compareType == "table") then
		value = (value - ex:GetStatValue(statToken,compareTable,true));
	end
	-- OPTION: Add additive stats which stack to each other
	if (cfg.combineAdditiveStats) then
		if (statTable["SPELLDMG"]) then
			for _, schoolToken in ipairs(ExScanner.MagicSchools) do
				if (statToken == schoolToken.."DMG") then
					value = (value + statTable["SPELLDMG"]);
					break;
				end
			end
		end
		if (statTable["AP"]) and (statToken == "RAP") then
			value = (value + statTable["AP"]);
		end
	end
	-- OPTION: Give Rating Values in Percent
	local valuePct;
	local rating = ExScanner:GetRatingInPercent(statToken,value,level or info.level,info.classFixed);
	if (rating) then
		valuePct = tonumber(format("%.2f",rating));
	end
	-- Do not modify the value further if we are just getting the compare value (compareTable == true)
	if (compareType ~= "boolean") then
		-- If Compare, Add Colors
		if (compareType == "table") then
			local color = (value > 0 and "|cff80ff80+") or (value < 0 and "|cffff8080");
			if (value ~= 0) then
				value = color..value;
			end
			if (valuePct) and (valuePct ~= 0) then
				valuePct = color..valuePct;
			end
		end
		-- Add "%" to converted ratings (Exclude Defense and Expertise)
		if (ExScanner.StatRatingBaseTable[statToken]) and (statToken ~= "DEFENSE") and (statToken ~= "EXPERTISE") then
			valuePct = valuePct.."%";
		end
	end
	-- Return
	if (compareType == "boolean") then
		return value;
	elseif (cfg.percentRatings) and (ExScanner.StatRatingBaseTable[statToken]) then
		return valuePct, value;
	else
		return value, valuePct;
	end
end

--------------------------------------------------------------------------------------------------------
--                                           Cache Functions                                          --
--------------------------------------------------------------------------------------------------------

-- Cache Player
function ex:CachePlayer(override)
	if (cfg.caching.Core or override) then
		local entry = ex:GetEntryName();
		cache[entry] = CopyTable(info);
		for index, mod in ipairs(ex.modules) do
			if (mod.OnCache) then
				mod:OnCache(cache[entry],mod:CanCache());
			end
		end
		return 1;
	end
end

-- Load player from cache
function ex:LoadPlayerFromCache(entryName)
	local entry = cache[entryName];
	if (not entry) then
		return;
	end
	-- Load Depending on Unit Token --
	info.time = entry.time;
	info.zone = entry.zone;
	if (not ex.unit or info.level == -1) then
		info.level = entry.level;
	end
	if (not ex.unit or not UnitIsVisible(ex.unit)) then
		info.pvpName = entry.pvpName;
		info.guild, info.guildRank, info.guildIndex = entry.guild, entry.guildRank, entry.guildIndex;
		if (not ex.unit) then
			info.name, info.realm = entry.name, entry.realm;
			info.level = entry.level;
			info.class, info.classFixed = entry.class, entry.classFixed;
			info.race, info.raceFixed = entry.race, entry.raceFixed;
			info.sex = entry.sex;
		end
	end
	-- Item Slots
	for slotName, slotId in next, ExScanner.SlotIDs do
		local link = entry.Items[slotName];
		info.Items[slotName] = link;
		ExScanner:ScanItemLink(link,ex.unitStats);
	end
	-- Sets + Set Bonuses
	for setName, setEntry in next, entry.Sets do
		info.Sets[setName] = { count = setEntry.count, max = setEntry.max };
		local idx = 1;
		while (setEntry["setBonus"..idx]) do
			info.Sets[setName]["setBonus"..idx] = setEntry["setBonus"..idx];
			ExScanner:ScanLineForPatterns(setEntry["setBonus"..idx],ex.unitStats);
			idx = (idx + 1);
		end
	end
	-- Cached Vertex Color
	ex.dlgTopLeft:SetVertexColor(unpack(CACHE_VERTEX_COLOR));
	ex.dlgTopRight:SetVertexColor(unpack(CACHE_VERTEX_COLOR));
	ex.dlgBottomLeft:SetVertexColor(unpack(CACHE_VERTEX_COLOR));
	ex.dlgBottomRight:SetVertexColor(unpack(CACHE_VERTEX_COLOR));
	-- Finalize
	ex:UpdateObjects();
	ex.isCacheEntry = true;
	ex.itemsLoaded = true;
	-- Modules: OnCacheLoaded
	for index, mod in ipairs(ex.modules) do
		if (mod.OnCacheLoaded) then
			mod:OnCacheLoaded(entry,ex.unit);
		end
	end
end

--------------------------------------------------------------------------------------------------------
--                                         Inspect Functions                                          --
--------------------------------------------------------------------------------------------------------

-- Normal Open
function ex:OpenSimple()
	if (not info.name) then
		self.InspectUnit("player");
	elseif (self:IsVisible()) then
		HideUIPanel(self);
	elseif (cfg.makeMovable) then
		self:Show();
	else
		ShowUIPanel(self);
	end
end

-- Normal Open
function ex:InspectMouseover()
	local unit = "mouseover";
	-- See if mouseover == unitframe unit
	local mouseFocus = GetMouseFocus();
	if (mouseFocus) then
		unit = (mouseFocus:GetAttribute("unit") or unit);
	end
	-- Show/Hide
	if (not UnitExists(unit)) then
		HideUIPanel(self);
	else
		self.InspectUnit(unit);
	end
end

-- ClearInspect
function ex:ClearInspect()
	ex.unit = nil;
	-- core
	ClearInspectPlayer();
	wipe(unitStats);
	for k, v in next, info do
		if (type(v) == "table") then
			wipe(v);
		else
			info[k] = nil;
		end
	end
	ex:SetScript("OnUpdate",nil);
	ex.itemsLoaded = nil;
	ex.isCacheEntry = nil;
	-- modules
	for index, mod in ipairs(ex.modules) do
		if (mod.OnClearInspect) then
			mod:OnClearInspect();
		end
	end
end

-- Inspect Unit
function ex.InspectUnit(unit,openFlag)
	-- Clear
	ex:ClearInspect();
	-- Reset Vertex Color
	ex.dlgTopLeft:SetVertexColor(1,1,1);
	ex.dlgTopRight:SetVertexColor(1,1,1);
	ex.dlgBottomLeft:SetVertexColor(1,1,1);
	ex.dlgBottomRight:SetVertexColor(1,1,1);
	-- Check Unit
	if (not unit or not UnitExists(unit)) then
		unit = "player";
	end
	-- Convert "mouseover" unit to party/raid unit
	if (unit == "mouseover") then
		if (GetNumRaidMembers() > 0) then
			for i = 1, GetNumRaidMembers() do
				if (UnitIsUnit("mouseover","raid"..i)) then
					unit = "raid"..i;
					break;
				end
			end
		elseif (GetNumPartyMembers() > 0) then
			for i = 1, GetNumPartyMembers() do
				if (UnitIsUnit("mouseover","party"..i)) then
					unit = "party"..i;
					break;
				end
			end
		end
	end
	-- Mouseover Event
	if (unit == "mouseover") then
		ex:RegisterEvent("UPDATE_MOUSEOVER_UNIT");
	else
		ex:UnregisterEvent("UPDATE_MOUSEOVER_UNIT");
	end
	-- Get Unit Info
	ex.unit = unit;
	info.isSelf = UnitIsUnit("player",unit);	-- This is what allows the cache module to filter out alts
	info.name, info.realm = UnitName(unit);
	if (info.realm == "") then
		info.realm = nil;
	end
	info.pvpName = UnitPVPName(unit);
	info.level = (UnitLevel(unit) or 0);
	info.sex = (UnitSex(unit) or 1);
	info.class, info.classFixed = UnitClass(unit);
	info.race, info.raceFixed = UnitRace(unit);
	if (not info.race) then
		info.race = UnitCreatureFamily(unit) or UnitCreatureType(unit);
	end
	info.guild, info.guildRank, info.guildIndex = GetGuildInfo(unit);
	info.time = time();
	info.zone = GetMinimapZoneText();
	if (GetRealZoneText() ~= info.zone) then
		info.zone = GetRealZoneText()..", "..info.zone;
	end
	-- Unit Type (1 = npc, 2 = opposing faction, 3 = same faction)
	ex.unitType = (not UnitIsPlayer(unit) and 1) or (UnitCanCooperate("player",unit) and 3) or 2;
	ex.canInspect = CanInspect(unit);
	-- Players we can Inspect
	if (ex.canInspect) then
		NotifyInspect(unit);

		-- Az: horrible workaround for the gem load bug
		postInspectFrame.lastUpdate = 0;
		postInspectFrame:Show();

		ExScanner:ScanUnitItems(unit,unitStats,info.Sets);
		for slotName, slotId in next, ExScanner.SlotIDs do
			info.Items[slotName] = (GetInventoryItemLink(unit,slotId) or ""):match(ExScanner.ItemLinkPattern);
		end
		ex.itemsLoaded = true;
	end
	-- Update the UI Objects
	ex:ShowModulePage();
	ex:UpdateObjects();
	-- Modules: OnInspect
	for index, mod in ipairs(ex.modules) do
		if (mod.OnInspect) then
			mod:OnInspect(unit);
		end
	end
	-- Auto Cache
	if (ex.itemsLoaded) then
		ex:CachePlayer();
	-- Players who are out of inspect range, or pvp enabled enemy faction
	elseif (ex.unitType ~= 1) then
		ex:SetScript("OnUpdate",Examiner_OnUpdate);
		ex:LoadPlayerFromCache(ex:GetEntryName());
	end
	-- Show Examiner
	if (openFlag ~= false) and (not ex:IsShown()) then
		if (cfg.makeMovable) then
			ex:Show();
		else
			ShowUIPanel(ex);
		end
	end
end

-- Updates the Main Objects
function ex:UpdateObjects()
	-- Textures & Model
	if (UnitIsVisible(ex.unit)) then
		SetPortraitTexture(ex.portrait,ex.unit);
		ex.model:SetUnit(ex.unit);
		ex.model.cleared = nil;
	else
		ex.portrait:SetTexture("Interface\\CharacterFrame\\TemporaryPortrait-"..(info.sex == 3 and "Female" or "Male").."-"..info.raceFixed);
		ex.model:ClearModel();
		ex.model.cleared = 1;
	end
	ex:SetBackgroundTexture();
	-- Title, Detail & Guild Text
	ex.title:SetText(info.pvpName or info.name);
	ex.details:SetText(ex:UnitDetailString());
	ex.guild:SetText(ex:UnitGuildString());
end

--------------------------------------------------------------------------------------------------------
--                                          Helper Functions                                          --
--------------------------------------------------------------------------------------------------------

-- Format Time (sec)
function ex:FormatTime(time)
	-- bugged?
	if (time < 0) then
		return "n/a";
	-- under a min
	elseif (time < 60) then
		return time.." seconds";
	-- less than 1 hour
	elseif (time < 60*60) then
		return format("%d minutes and %.2d seconds",time / 60,time % 60);
	-- less than 1 day
	elseif (time < 60*60*24) then
		time = (time/60);
		return format("%d hours and %.2d minutes",time / 60,time % 60);
	-- above 1 day
	else
		time = (time/60/60);
		return format("%d days and %.2d hours",time / 24,time % 24);
	end
end

-- Cache current stats for compare or clear previous marked one
function ex:CacheStatsForCompare(unmark)
	wipe(ex.compareStats);
	if (unmark) then
		ex.isComparing = nil;
	else
		ex.isComparing = true;
		ex.compareStats.entry = ex:GetEntryName();
		for k, v in next, unitStats do
			ex.compareStats[k] = v;
		end
		for slotName, itemLink in next, info.Items do
			ex.compareStats[slotName] = itemLink;
		end
	end
	-- Post OnCompare Event
	for index, mod in ipairs(ex.modules) do
		if (mod.OnCompare) then
			mod:OnCompare(ex.isComparing,ex.compareStats);
		end
	end
end

-- Toggle the Background
function ex:ShowBackground(show)
	if (show) or (show == nil and cfg.showBackground) then
		ex.bgTopLeft:Show();
		ex.bgTopRight:Show();
		ex.bgBottomLeft:Show();
		ex.bgBottomRight:Show();
	else
		ex.bgTopLeft:Hide();
		ex.bgTopRight:Hide();
		ex.bgBottomLeft:Hide();
		ex.bgBottomRight:Hide();
	end
end

-- Background Texture -- param can be a texture, or true for loading racial texture, or nothing to load a random texture
function ex:SetBackgroundTexture(param)
	local texture;
	-- Find Texture
	if (type(param) == "string") then
		texture = param;
	elseif (param == true) or (not info.raceFixed) then
		texture = "Interface\\TalentFrame\\"..EX_Backgrounds[random(#EX_Backgrounds)].."-";
	else
		param = (info.raceFixed == "Gnome" and "Dwarf") or (info.raceFixed == "Troll" and "Orc") or (info.raceFixed);
		texture = "Interface\\DressUpFrame\\DressUpBackground-"..param;
	end
	-- Set Texture
	local normal = texture:find("DressUpFrame");
	ex.bgTopLeft:SetTexture(texture..(normal and "1" or "TopLeft"));
	ex.bgTopRight:SetTexture(texture..(normal and "2" or "TopRight"));
	ex.bgBottomLeft:SetTexture(texture..(normal and "3" or "BottomLeft"));
	ex.bgBottomRight:SetTexture(texture..(normal and "4" or "BottomRight"));
	-- Set Texture Width -- Scaled about 1.063 for the talent frame textures
	local scale = (normal and 1 or 1.063);
	ex.bgTopLeft:SetWidth(256 * scale);
	ex.bgTopRight:SetWidth(64 * scale);
	ex.bgBottomLeft:SetWidth(256 * scale);
	ex.bgBottomRight:SetWidth(64 * scale);
end

-- Check Last Unit
function ex:ValidateUnit()
	if (ex.unit) and (UnitExists(ex.unit)) and (UnitName(ex.unit) == info.name) then
		return 1;
	else
		ex.unit = nil;
		ex:SetScript("OnUpdate",nil);
		return;
	end
end

-- Show Module Page
function ex:ShowModulePage(index)
	local lastMod = ex.modules[cfg.activePage];
	if (lastMod) then
		lastMod.page:Hide();
	end
	if (index == cfg.activePage) then
		cfg.activePage = nil;
	elseif (index) then
		cfg.activePage = index;
	end
	if (cfg.activePage) then
		local shownMod = ex.modules[cfg.activePage];
		shownMod.page:Show();
		for index, mod in ipairs(ex.modules) do
			if (mod.OnPageChanged) then
				mod:OnPageChanged(shownMod);
			end
		end
	end
end

--------------------------------------------------------------------------------------------------------
--                                          Module Functions                                          --
--------------------------------------------------------------------------------------------------------

local ModuleCore = {};
ModuleCore.__index = ModuleCore;

-- Main UI Buttons: OnClick
local function Buttons_OnClick(self,button)
	local id = self.id;
	local mod = ex.modules[id];
	-- Call Module OnButtonClick
	if (mod.OnButtonClick) then
		mod:OnButtonClick(button);
	end
	-- Unmodified Left Clicks
	if (not IsModifierKeyDown()) then
		if (button == "LeftButton") and (mod.page) then
			ex:ShowModulePage(id);
			AzDropDown.HideMenu();
		elseif (mod.MenuInit and mod.MenuSelect) then
			AzDropDown.ToggleMenu(self,mod.MenuInit,mod.MenuSelect,"TOPLEFT","BOTTOMLEFT");
		end
	end
end

-- Main UI Buttons: OnEnter
local function Buttons_OnEnter(self,motion)
	local mod = ex.modules[self.id];
	gtt:SetOwner(self,"ANCHOR_NONE");
	gtt:SetPoint("BOTTOMLEFT",self,"TOPLEFT");
	gtt:AddLine(self.tipHeader);
	gtt:AddLine(self.tipText,1,1,1);
	gtt:Show();
end

-- Returns the Module with given "token"
function ex:GetModuleFromToken(token)
	for index, mod in ipairs(ex.modules) do
		if (mod.token == token) then
			return mod;
		end
	end
end

-- Creates a new Module
function ex:CreateModule(token)
	local mod = setmetatable({ token = token, index = #ex.modules + 1 },ModuleCore);
	ex.modules[#ex.modules + 1] = mod;
	return mod;
end

-- Returns if module is allowed to cache
function ModuleCore:CanCache()
	return self.canCache and cfg.caching.Core and cfg.caching[self.token];
end

-- Create Button
function ModuleCore:CreateButton(label,tipHeader,tipText,exclude)
	local btn = CreateFrame("Button",nil,ex,"UIPanelButtonGrayTemplate");
	btn:SetWidth(75);
	btn:SetHeight(21);
	btn:SetFrameLevel(btn:GetFrameLevel() + 1);
	btn:RegisterForClicks("AnyUp");
	btn:SetScript("OnClick",Buttons_OnClick);
	btn:SetScript("OnEnter",Buttons_OnEnter);
	btn:SetScript("OnLeave",ex.HideGTT);
	btn:SetText(label);

	btn.id = self.index;
	btn.tipHeader = tipHeader;
	btn.tipText = tipText;
	btn.exclude = exclude;

	self.button = btn;
	return btn;
end

-- Creates a Default Module Page
local backdrop = { bgFile = "Interface\\Tooltips\\UI-Tooltip-Background", edgeFile = "Interface\\Tooltips\\UI-Tooltip-Border", tile = true, tileSize = 16, edgeSize = 16, insets = { left = 4, right = 4, top = 4, bottom = 4 } };
function ModuleCore:CreatePage(full,header)
	local page = CreateFrame("Frame",nil,ex.model);
	page:SetWidth(full and 320 or 235);
	page:SetHeight(full and 330 or 288);
	page:SetPoint("TOP");
	page:SetBackdrop(backdrop);
	page:SetBackdropColor(0.1,0.22,0.35,1);
	page:SetBackdropBorderColor(0.7,0.7,0.8,1);
	page:Hide();
	if (header) then
		page.header = page:CreateFontString(nil,"ARTWORK");
		page.header:SetFont(GameFontNormal:GetFont(),16,"THICKOUTLINE");
		page.header:SetTextColor(0.5,0.75,1);
		page.header:SetPoint("TOP",0,-14);
		page.header:SetText(header);
	end
	page:SetScript("OnEvent",ex.Standard_OnEvent);
	self.page = page;
	self.showItems = (not full or nil);
	return page;
end

--------------------------------------------------------------------------------------------------------
--                                            Detail Object                                           --
--------------------------------------------------------------------------------------------------------

local DetailObject = {};
DetailObject.__index = DetailObject;

function ex:CreateDetailObject()
	return setmetatable({ entries = LibTableRecycler:New() },DetailObject);
end

function DetailObject:Update()
	for index, mod in ipairs(ex.modules) do
		if (mod.OnDetailsUpdate) then
			mod:OnDetailsUpdate();
		end
	end
end

function DetailObject:Add(label,value,tip)
	local tbl = self.entries:Fetch();
	tbl.label = label; tbl.value = value; tbl.tip = tip;
end

function DetailObject:Clear()
	self.entries:Recycle();
end

--------------------------------------------------------------------------------------------------------
--                                           Slash Handling                                           --
--------------------------------------------------------------------------------------------------------

-- Slash Help
ex.slashHelp = {
	" |2inspect <unit>|r = Inspects the given unit ('target' if no unit given)",
	" |2si <itemlink>|r = Scans one item and shows the total sum of its stats combined",
	" |2compare <itemlink1> <itemlink2>|r = Compares two items by listing the stat differences",
	" |2rating <stat> <rating> <level>|r = Rating Converter",
	" |2scale <value>|r = Sets the scale of the Examiner window (Default is 1)",
	" |2clearcache|r = Clears the entire Examiner cache",
};

-- Slash Functions
ex.slashFuncs = {
	-- Inspect Unit
	["inspect"] = function(cmd)
		ex.InspectUnit(cmd == "" and "target" or cmd);
	end,
	-- Scan a Single Item
	["si"] = function(cmd)
		if (cmd ~= "") then
			local itemStats = {};
			ExScanner:ScanItemLink(cmd,itemStats);
			AzMsg("--- |2Scan Overview for "..cmd.."|r ---");
			for stat in next, itemStats do
				AzMsg((ExScanner.StatNames[stat] or stat).." = |1"..ex:GetStatValue(stat,itemStats,nil,UnitLevel("player")).."|r.");
			end
		else
			AzMsg("No item link given.");
		end
	end,
	-- Compares two Items
	["compare"] = function(cmd)
		if (cmd ~= "") then
			local item1, item2 = cmd:match("(|c.+|r)%s+(|c.+|r)");
			if (item1 and item2) then
				local itemStats1, itemStats2 = {}, {};
				ExScanner:ScanItemLink(item1,itemStats1);
				ExScanner:ScanItemLink(item2,itemStats2);
				AzMsg("--- |2Using "..item1.."|2 over "..item2.."|r ---");
				for statToken, statName in next, ExScanner.StatNames do
					if (itemStats1[statToken] or itemStats2[statToken]) then
						AzMsg(statName.." = |1"..ex:GetStatValue(statToken,itemStats1,itemStats2,UnitLevel("player")).."|r.");
					end
				end
			else
				AzMsg("Could not parse item links.");
			end
		else
			AzMsg("No item links given.");
		end
	end,
	-- Rating Converter
	["rating"] = function(cmd)
		local stat, rating, level = cmd:match("([^%s]+) (%d+) ?(%d*)");
		rating = tonumber(rating);
		if (stat and rating) then
			local value = ExScanner:GetRatingInPercent(stat:upper(),rating,tonumber(level) or UnitLevel("player"),select(2,UnitClass("player")));
			AzMsg("Converted Rating = |1"..(value or "Invalid Input"));
		else
			AzMsg("Invalid Input");
		end
	end,
	-- Scale
	["scale"] = function(cmd)
		cmd = tonumber(cmd);
		if (type(cmd) == "number") then
			cfg.scale = cmd;
			ex:SetScale(cmd);
		end
	end,
	-- Clear Cache
	["clearcache"] = function(cmd)
		wipe(cache);
	end,
};

-- Slash Handler
_G["SLASH_"..modName.."1"] = "/examiner";
_G["SLASH_"..modName.."2"] = "/ex";
SlashCmdList[modName] = function(cmd)
	-- Extract Parameters
	local param1, param2 = cmd:match("^([^%s]+)%s*(.*)$");
	param1 = (param1 and param1:lower() or cmd:lower());
	-- Check Param Function
	if (ex.slashFuncs[param1]) then
		ex.slashFuncs[param1](param2);
	-- Invalid or No Command
	else
		UpdateAddOnMemoryUsage();
		AzMsg(format("----- |2%s|r |1%s|r ----- |1%.2f |2kb|r -----",modName,GetAddOnMetadata(modName,"Version"),GetAddOnMemoryUsage(modName)));
		AzMsg("The following |2parameters|r are valid for this addon:");
		for index, help in ipairs(ex.slashHelp) do
			AzMsg(help);
		end
	end
end