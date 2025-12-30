local ex = Examiner;
local gtt = GameTooltip;
local GetAchievementInfo = GetAchievementInfo;

-- Modules
local mod = ex:CreateModule("Feats");
mod:CreatePage(true,"");
mod:CreateButton("Feats",ACHIEVEMENTS.." & "..STATISTICS,"Right Click for extended menu");
mod.details = ex:CreateDetailObject();
mod.canCache = true;

-- Variables
local professionFeatIds = { 1527, 1532, 1535, 1536, 1537, 1538, 1539, 1540, 1541, 1542, 1544 };
local featsSortMethods = { "none", "name", "category", "reward", "id", "value", "completed", "points" };
local BUTTON_HEIGHT = (252 / 8);
local cfg;
local cache;
local hasData;
local feats = LibTableRecycler:New();
local buttons = {};
local catDropDown;
local UpdateShownItems;

-- Dialog Func
local FeatsFilterOkayFunc = function(text) cfg.featsFilter = text; mod:QueryFeats(); end

-- Options
ex.options[#ex.options + 1] = { var = "inspectFeats", default = true, label = "Request Achievement Data", tip = "Asks the server for achievement data when inspecting a player" };

-- OnShow
mod.page:SetScript("OnShow",function(self) if (#feats == 0) then mod:QueryFeats(); end end);

--------------------------------------------------------------------------------------------------------
--                                           Module Scripts                                           --
--------------------------------------------------------------------------------------------------------

-- OnInitialize
function mod:OnInitialize()
	cfg = Examiner_Config;
	cache = Examiner_Cache;
	-- Defaults
	cfg.featsCat = cfg.featsCat or 92;	-- 92 is the General category
	cfg.featsStub = cfg.featsStub or -1;
	cfg.featsSort = cfg.featsSort or "none";
	cfg.featsFilter = cfg.featsFilter or "";
	-- Add cache sort method
	local cacheMod = ex:GetModuleFromToken("Cache");
	if (cacheMod) and (cacheMod.cacheSortMethods) then
		cacheMod.cacheSortMethods[#cacheMod.cacheSortMethods + 1] = "achievementPoints";
	end
end

-- OnButtonClick
function mod:OnButtonClick(button)
	-- left
	if (button == "LeftButton") then
		if (IsShiftKeyDown()) then
			AzDialog:Show("Enter new feats filter...",cfg.featsFilter,FeatsFilterOkayFunc);
		end
	-- right
	elseif (IsShiftKeyDown()) then
		cfg.featsFilter = "";
		cfg.featsHideComplete = false;
		cfg.featsHideIncomplete = false;
		self:QueryFeats();
	end
end

-- OnInspect
-- Request Achievements, which work even when CanInspect() returns false, range seems to not matter either, unit just have to be in loading range.
-- 09.01.25: No longer queries the opposing faction if flagged, got reports that it disconnects some from the server, though I've been unable to reproduce.
function mod:OnInspect(unit)
	if (cfg.inspectFeats and ex.unitType ~= 1 and UnitIsVisible(unit)) and (ex.unitType == 3 or not UnitIsPVP(unit) or UnitIsPVPSanctuary(unit)) then
		-- Makes the Achievement UI, if loaded, not update when we query the achievements
		if (AchievementFrameComparison) then
			AchievementFrameComparison:UnregisterEvent("INSPECT_ACHIEVEMENT_READY");
		end
		self.page:RegisterEvent("INSPECT_ACHIEVEMENT_READY");
		SetAchievementComparisonUnit(unit);
		self.button:Enable();
	else
		self.page:Hide();
		self.button:Disable();
	end
end

-- OnCacheLoaded
function mod:OnCacheLoaded(entry,unit)
	if (not unit) then
		self.button:Disable();
		if (entry.achievementPoints) then
			self.details:Add(ACHIEVEMENTS);
			self.details:Add("Points",entry.achievementPoints);
			self.details:Update();
		end
	end
end

-- OnClearInspect
function mod:OnClearInspect()
	hasData = nil;
	self.details:Clear();
	ClearAchievementComparisonUnit();
	feats:Recycle();
	self.page.header:SetText(cfg.featsStub == -2 and STATISTICS or ACHIEVEMENTS);
	for i = 1, #buttons do
		buttons[i]:Hide();
	end
end

--------------------------------------------------------------------------------------------------------
--                                               Events                                               --
--------------------------------------------------------------------------------------------------------

-- Achievements Update "Feats"
function mod.page:INSPECT_ACHIEVEMENT_READY(event)
	if (AchievementFrameComparison) then
		AchievementFrameComparison:RegisterEvent("INSPECT_ACHIEVEMENT_READY");
	end
	hasData = true;
	self:UnregisterEvent("INSPECT_ACHIEVEMENT_READY");
	if (cfg.activePage == mod.index) then
		mod:QueryFeats();
	end
	-- Details
	mod.details:Add(TRADE_SKILLS);
	for index, id in ipairs(professionFeatIds) do
		local skill = GetComparisonStatistic(id);
		local val, max = skill:match("(%d+) / (%d+)");
		if (val and max) then
			local _, name = GetAchievementInfo(id);
			mod.details:Add(name,skill);
		end
	end
	mod.details:Update();
	-- Cache
	if (mod:CanCache()) then
		local cacheEntry = cache[ex:GetEntryName()];
		if (cacheEntry) and (time() - cacheEntry.time <= 8) then
			cacheEntry.achievementPoints = GetComparisonAchievementPoints();
		end
	end
end

--------------------------------------------------------------------------------------------------------
--                                          Helper Functions                                          --
--------------------------------------------------------------------------------------------------------

-- Red/Green Color
local function BoolCol(bool)
	return (bool and "|cff80ff80" or "|cffff8080");
end

-- Sort Feats Table
local function SortFeatsListFunc(a,b)
	if (a[cfg.featsSort] == b[cfg.featsSort]) then
		return a.name < b.name;
	elseif (cfg.featsSort == "completed") then
		return a[cfg.featsSort] and true;
	else
		return (a[cfg.featsSort] or "") < (b[cfg.featsSort] or "");
	end
end

--------------------------------------------------------------------------------------------------------
--                                                Menu                                                --
--------------------------------------------------------------------------------------------------------

-- Menu Init Items
function mod.MenuInit(parent,list)
	-- filter
	list[1].text = "Filter"; list[1].header = 1;
	list[2].text = "Set Filter..."; list[2].value = 1;
	list[3].text = "Hide Complete"; list[3].value = 2; list[3].checked = cfg.featsHideComplete;
	list[4].text = "Hide Incomplete"; list[4].value = 3; list[4].checked = cfg.featsHideIncomplete;
	-- sort
	list[5].header = 1;
	list[6].text = "Sort Method"; list[6].header = 1;
	for index, method in ipairs(featsSortMethods) do
		list[index + 6].text = "Sort by "..method; list[index + 6].value = method; list[index + 6].checked = (cfg.featsSort == method);
	end
end

-- Menu Select Item
function mod.MenuSelect(parent,entry)
	-- Sort
	if (type(entry.value) == "string") then
		cfg.featsSort = entry.value;
		if (cfg.featsSort ~= "none") then
			sort(feats,SortFeatsListFunc);
			UpdateShownItems();
		else
			mod:QueryFeats();
		end
	-- Filter
	elseif (entry.value == 1) then
		AzDialog:Show("Enter new feats filter...",cfg.featsFilter,FeatsFilterOkayFunc);
	elseif (entry.value == 2) then
		cfg.featsHideComplete = not cfg.featsHideComplete;
		mod:QueryFeats();
	elseif (entry.value == 3) then
		cfg.featsHideIncomplete = not cfg.featsHideIncomplete;
		mod:QueryFeats();
	end
end

--------------------------------------------------------------------------------------------------------
--                                           Feats Functions                                          --
--------------------------------------------------------------------------------------------------------

-- FeatsEntry: OnClick
local function FeatsEntry_OnClick(self,motion)
	local entry = feats[self.index];
	if (IsModifiedClick("CHATLINK")) then
		local isPlayer = ex:ValidateUnit() and UnitIsUnit(ex.unit,"player");
		local editBox = ChatEdit_GetActiveWindow();
		if (editBox and editBox:IsVisible()) then
			if (IsControlKeyDown() and not isPlayer) or (not IsControlKeyDown() and isPlayer) then
				editBox:Insert(GetAchievementLink(entry.id));
			else
				editBox:Insert(ex.info.name..": "..entry.name..(entry.value and ": "..entry.value:gsub("|T[^|]-GoldIcon[^|]-|t","g"):gsub("|T[^|]-SilverIcon[^|]-|t","s"):gsub("|T[^|]-CopperIcon[^|]-|t","c") or ""));
			end
		elseif (isPlayer) then
			if (IsTrackedAchievement(entry.id)) then
				RemoveTrackedAchievement(entry.id);
			else
				AddTrackedAchievement(entry.id);
			end
		end
	elseif (feats.sub) then
		mod:QueryFeats();
	else
		mod:QuerySubFeats(entry.id);
	end
end

-- FeatsEntry: OnEnter
local function FeatsEntry_OnEnter(self,motion)
	local entry = feats[self.index];
	if (not entry) then
		return;
	end
	-- Simple Tip
	local isPlayer = ex:ValidateUnit() and UnitIsUnit(ex.unit,"player");
--	if (IsAltKeyDown() and not isPlayer) or (not IsAltKeyDown() and isPlayer) then -- wtb xor
	if (IsAltKeyDown()) then
		gtt:SetOwner(self,"ANCHOR_RIGHT");
		gtt:SetHyperlink(GetAchievementLink(entry.id));
		return;
	end
	-- Tip
	gtt:SetOwner(self,"ANCHOR_RIGHT");
	gtt:AddDoubleLine(entry.name,entry.value,nil,nil,nil,1,1,1);
	gtt:AddLine("<"..entry.category..">");
	gtt:AddLine(entry.reward,0.2,0.6,1);
	gtt:AddLine(entry.description,1,1,1,1);
	gtt:AddDoubleLine("Achievement Points",tostring(entry.points),0.25,.75,0.25,1,1,1);
	if (entry.year and entry.month and entry.day) then
		gtt:AddDoubleLine("Date Completed",format("%d.%.2d.%.2d",entry.year + 2000,entry.month,entry.day),0.25,0.75,0.25,1,1,1);
	end
	gtt:AddDoubleLine("Cat / Achievement ID",entry.catId.." / "..entry.id,0.25,0.75,0.25,1,1,1);
	-- Criteria
 	local nCriteria = GetAchievementNumCriteria(entry.id);
 	if (nCriteria and nCriteria > 0) then
		gtt:AddLine(" ");
		gtt:AddLine("Achievement Criteria |cffffffff"..nCriteria);
		local index = 1;
		while (true) do
			--criteriaString, criteriaType, completed, quantity, reqQuantity, charName, flags, assetID, quantityString, unknown = GetAchievementCriteriaInfo(achievementID, criteriaNum)
			--local criteriaName, completed, month, day, year, charName, unknown = GetCriteriaComparisonInfo(entry.id,i,1);
			--gtt:AddDoubleLine(criteriaName and criteriaName ~= "" and (criteriaName.." ") or "n/a",criteriaNameOld,1,1,1);
			local criteriaName1, _, criteriaComplete1 = GetAchievementCriteriaInfo(entry.id,index);
			local criteriaName2, _, criteriaComplete2 = GetAchievementCriteriaInfo(entry.id,index + 1);
--			criteriaComplete1 = (GetCriteriaComparisonInfo(entry.id,i,1) ~= nil);
--			if (criteriaName2) then
--				criteriaComplete2 = (GetCriteriaComparisonInfo(entry.id,i + 1,1) ~= nil);
--			end
			if (not criteriaName1) or (index == 43) then
				break;
			elseif (index == 41) then
				criteriaName2 = "...";
				criteriaComplete2 = false;
			end
			local r1, g1, b1 = (isPlayer and criteriaComplete1 and 0.25 or 0.5), (isPlayer and criteriaComplete1 and 0.75 or 0.5), (isPlayer and criteriaComplete1 and 0.25 or 0.5);
			local r2, g2, b2 = (isPlayer and criteriaComplete2 and 0.25 or 0.5), (isPlayer and criteriaComplete2 and 0.75 or 0.5), (isPlayer and criteriaComplete2 and 0.25 or 0.5);
			criteriaName1 = criteriaName1 and (isPlayer and "" or BoolCol(criteriaComplete1).."*|r")..(criteriaName1 == "" and "n/a" or criteriaName1);
			criteriaName2 = criteriaName2 and (criteriaName2 == "" and "n/a" or criteriaName2)..((isPlayer or criteriaName2 == "...") and "" or BoolCol(criteriaComplete2).."*");
			gtt:AddDoubleLine(criteriaName1,criteriaName2,r1,g1,b1,r2,g2,b2);
			index = (index + 2);
		end
	end
	-- Show
	gtt:Show();
end

-- ScrollBar: Feats update -- This is a local function, defined at the header
function UpdateShownItems()
	-- Header
	local hasFilter = (cfg.featsFilter ~= "" or cfg.featsHideComplete or cfg.featsHideIncomplete);
	mod.page.header:SetFormattedText("%s (%d)%s",(cfg.featsStub == -2 and STATISTICS or ACHIEVEMENTS),GetComparisonAchievementPoints(),(hasFilter and " |cffffff00*" or ""));
	-- Update
	FauxScrollFrame_Update(ExaminerFeatsScroll,#feats,#buttons,BUTTON_HEIGHT);
	local gttOwner = gtt:GetOwner();
	local index = ExaminerFeatsScroll.offset;
	for i = 1, #buttons do
		index = (index + 1);
		local entry = feats[index];
		local btn = buttons[i];
		if (entry) then
			btn.index = index;
			btn.name:SetFormattedText("%s%s%s",BoolCol(entry.completed),entry.name,(entry.reward and "|cffffff00 *" or "")); --ff3399ff
			btn.category:SetText((cfg.featsStub == -2 or cfg.featsCat == -1) and entry.category or entry.description);
			btn.val:SetText(entry.value);
			btn.icon:SetTexture(entry.icon or "Interface\\Icons\\INV_Misc_QuestionMark");
			if (btn == gttOwner) then
				FeatsEntry_OnEnter(btn);
			end
			btn:Show();
		else
			btn:Hide();
		end
	end
	-- Set Width
	buttons[1]:SetPoint("TOPRIGHT",#feats <= #buttons and -12 or -26,-68);
end

-- Add Feat Entry
local function AddFeatEntry(id,name,points,description,icon,reward)
	local friendCompleted, friendMonth, friendDay, friendYear = GetAchievementComparisonInfo(id); -- Also returns a 5th parameter, but it is always 0
	local catId = GetAchievementCategory(id);
	local value = GetComparisonStatistic(id);
	-- Cat
	local category, catParent = GetCategoryInfo(catId);
	while (catParent > 0) do
		catName, catParent = GetCategoryInfo(catParent);
		category = catName.." - "..category;
	end
	-- Cleanup
	if (icon == "") then
		icon = nil;
	end
	if (value == 0 or value == "0" or value == "--") then
		value = nil;
	end
	if (reward == "") then
		reward = nil;
	end
	if (cfg.featsStub == -2) then
		friendCompleted = (value ~= nil);
	end
	-- Filter + Add
	if (not cfg.featsHideComplete or not friendCompleted) and (not cfg.featsHideIncomplete or friendCompleted) then
		local filter = cfg.featsFilter:upper();
		if (filter == "") or (name:upper():find(filter)) or (category:upper():find(filter)) or (description:upper():find(filter)) or (reward and reward:upper():find(filter)) then
			local tbl = feats:Fetch();
			tbl.id = id; tbl.category = category; tbl.catId = catId; tbl.name = name; tbl.icon = icon; tbl.points = points; tbl.reward = reward; tbl.description = description; tbl.value = value; tbl.completed = friendCompleted; tbl.month = friendMonth; tbl.day = friendDay; tbl.year = friendYear;
		end
	end
end

-- Query "Feats"
function mod:QueryFeats()
	if (not hasData) then
		return;
	end
	feats.sub = nil;
	feats:Recycle();
	-- Brute Force "Feats of Strength" achievements
	if (cfg.featsStub == -3) then
		for i = 1, 10000 do
			local id, name, points, _, _, _, _, description, _, icon, reward = GetAchievementInfo(i);
			if (id) then
				local category = GetCategoryInfo(GetAchievementCategory(id));
				if (category == "Feats of Strength") then
					AddFeatEntry(id,name,points,description,icon,reward);
				end
			end
		end
	-- List Selected Category
	else
		for i = 1, GetCategoryNumAchievements(cfg.featsCat) do
			local id, name, points, _, _, _, _, description, _, icon, reward = GetAchievementInfo(cfg.featsCat,i);
			AddFeatEntry(id,name,points,description,icon,reward);
		end
	end
	-- Fin
	catDropDown:InitSelectedItem(cfg.featsCat);
	if (cfg.featsSort ~= "none") then
		sort(feats,SortFeatsListFunc);
	end
	UpdateShownItems();
end

-- Query Sub Feats
function mod:QuerySubFeats(id)
	-- Get First
	while (GetPreviousAchievement(id)) do
		id = GetPreviousAchievement(id);
	end
	-- Check if there are any followup achievements
	if (not GetNextAchievement(id)) then
		return;
	end
	-- Init
	feats:Recycle();
	local _, name, points, description, icon, reward;
	-- loop
	while (id) do
		id, name, points, _, _, _, _, description, _, icon, reward = GetAchievementInfo(id);
		AddFeatEntry(id,name,points,description,icon,reward);
		id = GetNextAchievement(id);
	end
	-- Fin
	if (cfg.featsSort ~= "none") then
		sort(feats,SortFeatsListFunc);
	end
	UpdateShownItems();
	feats.sub = 1;
end

--------------------------------------------------------------------------------------------------------
--                                         Category Drop Down                                         --
--------------------------------------------------------------------------------------------------------

-- InitFunc
local function FeatsDropDown_InitFunc(dropDown,list)
	-- All Feats of Strength
	local tbl = list[#list + 1];
	tbl.text = "Feats of Strength Query"; tbl.value = -3; tbl.stub = -3;
	-- Achievements
	local tbl = list[#list + 1];
	tbl.text = "All Achievements |cffc0c0c0("..GetComparisonCategoryNumAchievements(-1).."/"..GetCategoryNumAchievements(-1)..")"; tbl.value = -1; tbl.stub = -1;
	local color = "|cff00ff00";
	local catList = GetCategoryList();
	for _, catId in next, catList do
		local catName, catParent = GetCategoryInfo(catId);
		if (catParent < 0) then
			local count = GetCategoryNumAchievements(catId);
			local complete = GetComparisonCategoryNumAchievements(catId);
			local tbl = list[#list + 1];
			tbl.text = color..catName.."|cffc0c0c0 ("..complete.."/"..count..")"; tbl.value = catId; tbl.stub = -1;
			for _, catId2 in next, catList do
				local catName2, catParent2 = GetCategoryInfo(catId2);
				if (catParent2 == catId) then
					local count = GetCategoryNumAchievements(catId2);
					local complete = GetComparisonCategoryNumAchievements(catId2);
					local tbl = list[#list + 1];
					tbl.text = color.."     "..catName2.."|cffc0c0c0 ("..complete.."/"..count..")"; tbl.value = catId2; tbl.stub = -1;
				end
			end
		end
	end
	-- Statistics
	local tbl = list[#list + 1];
	tbl.text = "All Statistics |cffc0c0c0("..GetCategoryNumAchievements(-2)..")"; tbl.value = -2; tbl.stub = -2;
	catList = GetStatisticsCategoryList();
	color = "|cffffff00";
	for _, catId in next, catList do
		local catName, catParent = GetCategoryInfo(catId);
		if (catParent < 0) then
			local count = GetCategoryNumAchievements(catId);
			local tbl = list[#list + 1];
			tbl.text = color..catName.."|cffc0c0c0 ("..count..")"; tbl.value = catId; tbl.stub = -2;
			for _, catId2 in next, catList do
				local catName2, catParent2 = GetCategoryInfo(catId2);
				if (catParent2 == catId) then
					local count = GetCategoryNumAchievements(catId2);
					local tbl = list[#list + 1];
					tbl.text = color.."     "..catName2.."|cffc0c0c0 ("..count..")"; tbl.value = catId2; tbl.stub = -2;
				end
			end
		end
	end
end

-- DropDown Text
local cat = mod.page:CreateFontString(nil,"ARTWORK","GameFontNormalSmall");
cat:SetPoint("TOPLEFT",14,-46);
cat:SetText("Select Category:");

-- DropDown
catDropDown = AzDropDown.CreateDropDown(mod.page,220,true,FeatsDropDown_InitFunc,function(dropDown,entry) cfg.featsCat = entry.value; cfg.featsStub = entry.stub; mod:QueryFeats(); end);
catDropDown:SetPoint("TOPRIGHT",-8,-40);

--------------------------------------------------------------------------------------------------------
--                                           Widget Creation                                          --
--------------------------------------------------------------------------------------------------------

-- Buttons
for i = 1, 8 do
	local btn = CreateFrame("Button",nil,mod.page);
	btn:SetHeight(BUTTON_HEIGHT);
	btn:RegisterForClicks("LeftButtonDown","RightButtonDown");
	btn:SetHighlightTexture("Interface\\QuestFrame\\UI-QuestTitleHighlight");
	btn:Hide();

	if (i == 1) then
		btn:SetPoint("TOPLEFT",8,-68);
		btn:SetPoint("TOPRIGHT",-28,-68);
	else
		btn:SetPoint("TOPLEFT",buttons[i - 1],"BOTTOMLEFT");
		btn:SetPoint("TOPRIGHT",buttons[i - 1],"BOTTOMRIGHT");
	end

	btn:SetScript("OnClick",FeatsEntry_OnClick);
	btn:SetScript("OnEnter",FeatsEntry_OnEnter);
	btn:SetScript("OnLeave",ex.HideGTT);

	btn.icon = btn:CreateTexture(nil,"ARTWORK");
	btn.icon:SetPoint("LEFT",3,0);
	btn.icon:SetWidth(BUTTON_HEIGHT - 2);
	btn.icon:SetHeight(BUTTON_HEIGHT - 2);
	btn.icon:SetTexCoord(0.07,0.93,0.07,0.93);

	btn.val = btn:CreateFontString(nil,"ARTWORK","GameFontHighlightSmall");
	btn.val:SetPoint("RIGHT",-4,0);
	btn.val:SetTextColor(1,1,0);

	btn.name = btn:CreateFontString(nil,"ARTWORK","GameFontHighlightSmall");
	btn.name:SetPoint("LEFT",btn.icon,"RIGHT",3,6);
	btn.name:SetPoint("RIGHT",btn.val,"LEFT",-8,6);
	btn.name:SetJustifyH("LEFT");

	btn.category = btn:CreateFontString(nil,"ARTWORK","GameFontHighlightSmall");
	btn.category:SetPoint("TOPLEFT",btn.name,"BOTTOMLEFT",0,-2);
	btn.category:SetPoint("TOPRIGHT",btn.name,"BOTTOMRIGHT",0,-2);
	btn.category:SetJustifyH("LEFT");

	buttons[i] = btn;
end

-- Feats Scroll
local scroll = CreateFrame("ScrollFrame","ExaminerFeatsScroll",mod.page,"FauxScrollFrameTemplate");
scroll:SetPoint("TOPLEFT",buttons[1]);
scroll:SetPoint("BOTTOMRIGHT",buttons[#buttons],-6,-1);
scroll:SetScript("OnVerticalScroll",function(self,offset) FauxScrollFrame_OnVerticalScroll(self,offset,BUTTON_HEIGHT,UpdateShownItems) end);