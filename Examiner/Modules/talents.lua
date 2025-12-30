local ex = Examiner;

-- Module
local mod = ex:CreateModule("Talents");
mod.page = CreateFrame("Frame",nil,ex);
mod.page:SetScript("OnEvent",ex.Standard_OnEvent);
mod:CreateButton("Talent","Talents","The Inspected Player's Talent Specialization");
mod.canCache = true;
mod.details = ex:CreateDetailObject();

-- Variables
local BRANCH_ARRAY = {};
local cfg, cache;
local activeTab = 1;
local activeSpec;
local arrowIndex, branchIndex;
local points = {};

-- Init Talent Branches
for i = 1, MAX_NUM_TALENT_TIERS do
	BRANCH_ARRAY[i] = {};
	for j = 1, NUM_TALENT_COLUMNS do
		BRANCH_ARRAY[i][j] = {};
	end
end

--------------------------------------------------------------------------------------------------------
--                                           Module Scripts                                           --
--------------------------------------------------------------------------------------------------------

-- OnInspect
function mod:OnInitialize()
	cfg = Examiner_Config;
	cache = Examiner_Cache;
end

-- OnInspect
function mod:OnInspect(unit)
	if (ex.canInspect) then
		self.page:RegisterEvent("INSPECT_TALENT_READY");
		if (cfg.activePage == self.index) then
			mod:UpdateTalents();
		end
		self.button:Enable();
	else
		self.page:Hide();
		self.button:Disable();
	end
end

-- OnCacheLoaded
function mod:OnCacheLoaded(entry,unit)
	if (entry.talentPoints and entry.talentSpec) then
		mod.details:Add("Talents");
		mod.details:Add("Specialization",entry.talentSpec or UNKNOWN);
		mod.details:Add("Points",entry.talentPoints or entry.talents); -- Az: backward compatibility
		mod.details:Update();
	end
	self.button:Disable();
end

-- OnClearInspect
function mod:OnClearInspect()
	self.details:Clear();
end

--------------------------------------------------------------------------------------------------------
--                                               Events                                               --
--------------------------------------------------------------------------------------------------------

-- Talent Update
function mod.page:INSPECT_TALENT_READY(event)
	self:UnregisterEvent(event);
	if (cfg.activePage == mod.index) then
		mod:UpdateTalents();
	end
	-- Gather Talent Info
	local group = GetActiveTalentGroup(true);
	local maxTree = 1;
	local combined = 0;
	for i = 1, MAX_TALENT_TABS do
		points[i] = select(3,GetTalentTabInfo(i,true,nil,group))
		combined = (combined + points[i]);
		if (points[i] > points[maxTree]) then
			maxTree = i;
		end
	end
	local talentPoints = points[1].."/"..points[2].."/"..points[3];
	-- Fancy level estimate since we can determine it from talents
	if (ex.info.level == -1) and (combined > 0) then
		ex.info.level = (combined + 9);
		ex.details:SetText(ex:UnitDetailString());
	end
	-- Details
	local talentSpec = GetTalentTabInfo(maxTree,true,nil,group);
	mod.details:Add("Talents");
	mod.details:Add("Specialization",combined > 0 and talentSpec or "No Talents");
	mod.details:Add("Points",talentPoints);
	mod.details:Update();
	-- Az: this needs a change, we no longer use this type of cache
	if (mod:CanCache()) then
		local cacheEntry = cache[ex:GetEntryName()];
		if (cacheEntry) and (time() - cacheEntry.time <= 8) then
			cacheEntry.talentSpec = talentSpec;
			cacheEntry.talentPoints = talentPoints;
			cacheEntry.level = ex.info.level;
		end
	end
end

--------------------------------------------------------------------------------------------------------
--                                                Menu                                                --
--------------------------------------------------------------------------------------------------------

-- Menu Init Items
function mod.MenuInit(parent,list)
	local group = GetActiveTalentGroup(true);
	local _, _, p1 = GetTalentTabInfo(1,true,nil,2);
	local _, _, p2 = GetTalentTabInfo(2,true,nil,2);
	local _, _, p3 = GetTalentTabInfo(3,true,nil,2);
	local noSecondary = (p1 + p2 + p3 == 0);
	list[1].text = "Shown Spec"; list[1].header = 1;
	list[2].text = "Active"; list[2].value = nil; list[2].checked = (cfg.shownSpec == nil);
	list[3].text = (group == 1 and "|cff80ff80" or "").."Primary"; list[3].value = 1; list[3].checked = (cfg.shownSpec == 1);
	list[4].text = (group == 2 and "|cff80ff80" or noSecondary and "|cffff8080" or "").."Secondary"; list[4].value = 2; list[4].checked = (cfg.shownSpec == 2);
end

-- Menu Select Item
function mod.MenuSelect(parent,entry)
	cfg.shownSpec = entry.value;
	if (cfg.activePage == mod.index) then
		mod:UpdateTalents();
	end
end

--------------------------------------------------------------------------------------------------------
--                                       Talent Button Functions                                      --
--------------------------------------------------------------------------------------------------------

-- Select Tab
local function TalentsTab_OnClick(self,button)
	activeTab = self.id;
	PanelTemplates_SetTab(ex,activeTab);
	mod:UpdateTalents();
end

-- Talent OnClick
local function TalentButton_OnClick(self,button)
	local editBox = ChatEdit_GetActiveWindow();
	if (IsModifiedClick("CHATLINK")) and (editBox) and (editBox:IsVisible()) then
		editBox:Insert(GetTalentLink(activeTab,self.id,true,nil,activeSpec));
	end
end

-- Talent OnEnter
local function TalentButton_OnEnter(self,motion)
	GameTooltip:SetOwner(self,"ANCHOR_RIGHT");
	GameTooltip:SetTalent(activeTab,self.id,true,nil,activeSpec);
end

-- Create Talent Button
local function CreateTalentButton(parent,index)
	local btn = CreateFrame("Button",nil,parent);
	btn:SetWidth(37);
	btn:SetHeight(37);
	btn:SetScript("OnClick",TalentButton_OnClick);
	btn:SetScript("OnEnter",TalentButton_OnEnter);
	btn:SetScript("OnLeave",ex.HideGTT);
	btn:SetHighlightTexture("Interface\\Buttons\\ButtonHilight-Square");
	btn.id = index;

	btn.icon = btn:CreateTexture(nil,"BORDER");
	btn.icon:SetPoint("TOPLEFT",1,-1);
	btn.icon:SetPoint("BOTTOMRIGHT",-1,1);

	btn.slot = btn:CreateTexture(nil,"BACKGROUND");
	btn.slot:SetTexture("Interface\\Buttons\\UI-EmptySlot-White");
	btn.slot:SetWidth(64);
	btn.slot:SetHeight(64);
	btn.slot:SetPoint("CENTER");

	btn.rankBorder = btn:CreateTexture(nil,"OVERLAY");
	btn.rankBorder:SetTexture("Interface\\TalentFrame\\TalentFrame-RankBorder");
	btn.rankBorder:SetWidth(32);
	btn.rankBorder:SetHeight(32);
	btn.rankBorder:SetPoint("CENTER",btn,"BOTTOMRIGHT");

	btn.rank = btn:CreateFontString(nil,"OVERLAY","GameFontNormalSmall");
	btn.rank:SetPoint("CENTER",btn.rankBorder,0,1);

	return btn;
end

--------------------------------------------------------------------------------------------------------
--                                           Widget Creation                                          --
--------------------------------------------------------------------------------------------------------

-- OnShow
local function OnShow(self)
	mod:UpdateTalents();
	ex.model:Hide();
	ex.details:Hide();
	ex.guild:Hide();
	ex:ShowBackground(true);
end

-- OnHide
local function OnHide(self)
	ex.model:Show();
	ex.details:Show();
	ex.guild:Show();
	ex:ShowBackground();
	ex:SetBackgroundTexture();
end

-- Talent Page
mod.page:SetWidth(320);
mod.page:SetHeight(354);
mod.page:SetPoint("BOTTOM",-11,10);
mod.page:Hide();
mod.page:SetScript("OnShow",OnShow);
mod.page:SetScript("OnHide",OnHide);

-- Scroll
local sc = CreateFrame("ScrollFrame","ExaminerTalentsScrollChild",mod.page,"UIPanelScrollFrameTemplate");
sc:SetPoint("TOPLEFT",ex.model,0,-2);
sc:SetPoint("BOTTOMRIGHT",ex.model,-25,25);

-- Scroll Child Frame
local scf = CreateFrame("Frame","ExaminerScrollChildFrame");
scf:SetWidth(320);
scf:SetHeight(1);
sc:SetScrollChild(scf);

-- Talent Tabs
for i = 1, MAX_TALENT_TABS do
	local tab = CreateFrame("Button","ExaminerTab"..i,mod.page,"TabButtonTemplate");
	tab.id = i;
	tab:SetScript("OnClick",TalentsTab_OnClick);
	if (i == 1) then
		tab:SetPoint("TOPLEFT",45,36);
	else
		tab:SetPoint("LEFT","ExaminerTab"..(i - 1),"RIGHT");
	end
end
ex.selectedTab = 1;
PanelTemplates_SetNumTabs(ex,3);
PanelTemplates_UpdateTabs(ex);

-- Talent Buttons -- Az: workaround, if I create these dynamically with a metatable (see commented out line below), the framelevel/strata of the arrowframe screws up, seems like a blizzard ui bug
local talentBtns = {};
for i = 1, 40 do
	talentBtns[i] = CreateTalentButton(scf,i);
end

-- ArrowFrame -- To make them appear above talent buttons
local af = CreateFrame("Frame",nil,scf);
af:SetAllPoints();

-- Talent Buttons + Arrows + Branches
--local talentBtns = setmetatable({},{ __index = function(t,k) t[k] = CreateTalentButton(scf,k); return t[k]; end });
local branches = setmetatable({},{ __index = function(t,k) t[k] = scf:CreateTexture(nil,"BACKGROUND","TalentBranchTemplate"); return t[k]; end });
local arrows = setmetatable({},{ __index = function(t,k) t[k] = af:CreateTexture(nil,"OVERLAY","TalentArrowTemplate"); return t[k]; end });

--------------------------------------------------------------------------------------------------------
--                                              Functions                                             --
--------------------------------------------------------------------------------------------------------

-- Branch
local function SetBranchTexture(coords,x,y)
	local branch = branches[branchIndex];
	branch:SetTexCoord(unpack(coords));
	branch:SetPoint("TOPLEFT",x,y);
	branch:Show();
	branchIndex = (branchIndex + 1);
end

-- Arrows
local function SetArrowTexture(coords,x,y)
	local arrow = arrows[arrowIndex];
	arrow:SetTexCoord(unpack(coords));
	arrow:SetPoint("TOPLEFT",x,y);
	arrow:Show();
	arrowIndex = (arrowIndex + 1);
end

-- CalculateBranchLines
local function CalculateBranchLines(tier,column,rank,...)
	local type = (rank > 0 and 1 or -1);
	for i = 1, select("#",...), 4 do
		local preTier, preColumn = select(i,...);
		local left = min(preColumn,column);
		local right = max(preColumn,column);
		-- Same Column
		if (preColumn == column) then
			for i = preTier, tier - 1 do
				BRANCH_ARRAY[i][column].down = type;
				if (i + 1 <= tier - 1) then
					BRANCH_ARRAY[i + 1][column].up = type;
				end
			end
			BRANCH_ARRAY[tier][column].topArrow = type;
		-- Same Tier
		elseif (preTier == tier) then
			for i = left, right - 1 do
				BRANCH_ARRAY[tier][i].right = type;
				BRANCH_ARRAY[tier][i + 1].left = type;
			end
			BRANCH_ARRAY[tier][column][preColumn < column and "leftArrow" or "rightArrow"] = type
		-- Diagonal
		else
			local blocked;
			for i = preTier, tier - 1 do
				if (BRANCH_ARRAY[i][column].id) then
					blocked = true;
-- Az: debug, going to keep this in, one day talent trees might change so this is needed, this way people can see Examiner is the cause
AzMsg("|2Examiner Talent Module:|r blocked path |1"..tier.." x "..i.."|r    left = |1"..left.."|r, right = |1"..right);
					break;
				end
			end
			-- Top Connection -- Az: Currently, as of patch 3.1, no classes actually has a blocking talent above, so I haven't been able to test it, and it will most likely not be correct
			if (blocked) then
				for i = preTier, tier - 1 do
					BRANCH_ARRAY[i][column].up = type;
					BRANCH_ARRAY[i + 1][column].down = type;
				end
				BRANCH_ARRAY[tier][column][preColumn < column and "leftArrow" or "rightArrow"] = type
			-- Left/Right Connection
			else
				for i = preTier, tier - 1 do
					BRANCH_ARRAY[i][column].down = type;
					BRANCH_ARRAY[i + 1][column].up = type;
				end
				for i = left, right - 1 do
					BRANCH_ARRAY[preTier][i].right = type;
					BRANCH_ARRAY[preTier][i + 1].left = type;
				end
				BRANCH_ARRAY[tier][column].topArrow = type;
			end
		end
	end
end

-- Update Talents
function mod:UpdateTalents()
	activeSpec = cfg.shownSpec or GetActiveTalentGroup(true);
	local name, icon, pointsSpent, background, previewPointsSpent = GetTalentTabInfo(activeTab,true,nil,activeSpec);
	if (not name) then
		return;
	end
	ex:SetBackgroundTexture("Interface\\TalentFrame\\"..background.."-");
	-- Update Tabs
	for i = 1, MAX_TALENT_TABS do
		local tab = _G["ExaminerTab"..i];
		local tabName, _, pointsSpent = GetTalentTabInfo(i,true,nil,activeSpec);
		tab:SetFormattedText("%s |cff00ff00%d",tabName,pointsSpent);
		PanelTemplates_TabResize(tab,-18);
	end
	-- Reset Prereq
	arrowIndex = 1;
	branchIndex = 1;
	for i = 1, MAX_NUM_TALENT_TIERS do
		for j = 1, NUM_TALENT_COLUMNS do
			wipe(BRANCH_ARRAY[i][j])
		end
	end
	-- Talents
	local numTalents = GetNumTalents(activeTab,true,nil);
	for i = 1, numTalents do
		local name, iconTexture, tier, column, rank, maxRank, isExceptional, meetsPrereq, previewRank, meetsPreviewPrereq = GetTalentInfo(activeTab,i,true,nil,activeSpec);
		local btn = talentBtns[i];
		BRANCH_ARRAY[tier][column].id = i;
		CalculateBranchLines(tier,column,rank,GetTalentPrereqs(activeTab,i,true,nil,activeSpec));

		btn:Show();
		btn:ClearAllPoints();
		btn:SetPoint("TOPLEFT",(column - 1) * 63 + 35,(tier - 1) * -63 - 20);
		btn.icon:SetTexture(iconTexture);
		btn.icon:SetTexCoord(0.07,0.93,0.07,0.93);

		if (rank == 0) then
			btn.icon:SetDesaturated(true);
			btn.rankBorder:Hide();
			btn.rank:Hide();
			btn.slot:SetVertexColor(0.5, 0.5, 0.5);
		else
			btn.icon:SetDesaturated(false);
			btn.rankBorder:Show();
			btn.rank:Show();
			btn.rank:SetText(rank);
			if (rank < maxRank) then
				btn.slot:SetVertexColor(0.1,1,0.1);
				btn.rank:SetTextColor(0,1,0);
			else
				btn.slot:SetVertexColor(1,0.82,0);
				btn.rank:SetTextColor(1,0.82,0);
			end
		end
	end
	-- Draw Branches + Arrows
	local ignoreUp;
	for i = 1, MAX_NUM_TALENT_TIERS do
		for j = 1, NUM_TALENT_COLUMNS do
			local node = BRANCH_ARRAY[i][j];
			local x = ((j - 1) * 63) + INITIAL_TALENT_OFFSET_X + 2;
			local y = -((i - 1) * 63) - INITIAL_TALENT_OFFSET_Y - 2;
			-- Node
			if (node.id) then
				-- branches
				if (node.up) then
					if (ignoreUp) then
						ignoreUp = nil;
					else
						SetBranchTexture(TALENT_BRANCH_TEXTURECOORDS.up[node.up],x,y + TALENT_BUTTON_SIZE);
					end
				end
				if (node.down) then
					SetBranchTexture(TALENT_BRANCH_TEXTURECOORDS.down[node.down],x,y - TALENT_BUTTON_SIZE + 1);
				end
				if (node.left) then
					SetBranchTexture(TALENT_BRANCH_TEXTURECOORDS.left[node.left],x - TALENT_BUTTON_SIZE,y);
				end
				if (node.right) then
					SetBranchTexture(TALENT_BRANCH_TEXTURECOORDS.right[node.right],x + TALENT_BUTTON_SIZE,y);
				end
				-- arrows
				if (node.rightArrow) then
					SetArrowTexture(TALENT_ARROW_TEXTURECOORDS.right[node.rightArrow],x + 5 + TALENT_BUTTON_SIZE / 2,y);
				end
				if (node.leftArrow) then
					SetArrowTexture(TALENT_ARROW_TEXTURECOORDS.left[node.leftArrow],x - 5 - TALENT_BUTTON_SIZE / 2,y);
				end
				if (node.topArrow) then
					SetArrowTexture(TALENT_ARROW_TEXTURECOORDS.top[node.topArrow],x,y + 5 + TALENT_BUTTON_SIZE / 2);
				end
			-- No Node
			elseif (node.up and node.left and node.right) then
				SetBranchTexture(TALENT_BRANCH_TEXTURECOORDS.tup[node.up],x,y);
			elseif (node.down and node.left and node.right) then
				SetBranchTexture(TALENT_BRANCH_TEXTURECOORDS.tdown[node.down],x,y);
			elseif (node.left and node.down) then
				SetBranchTexture(TALENT_BRANCH_TEXTURECOORDS.topright[node.left],x,y);
				SetBranchTexture(TALENT_BRANCH_TEXTURECOORDS.down[node.down],x,y - 32);
			elseif (node.left and node.up) then
				SetBranchTexture(TALENT_BRANCH_TEXTURECOORDS.bottomright[node.left],x,y);
			elseif (node.left and node.right) then
				SetBranchTexture(TALENT_BRANCH_TEXTURECOORDS.right[node.right],x + TALENT_BUTTON_SIZE,y);
				SetBranchTexture(TALENT_BRANCH_TEXTURECOORDS.left[node.left],x + 1,y);
			elseif (node.right and node.down) then
				SetBranchTexture(TALENT_BRANCH_TEXTURECOORDS.topleft[node.right],x,y);
				SetBranchTexture(TALENT_BRANCH_TEXTURECOORDS.down[node.down],x,y - 32);
			elseif (node.right and node.up) then
				SetBranchTexture(TALENT_BRANCH_TEXTURECOORDS.bottomleft[node.right],x,y);
			elseif (node.up and node.down) then
				SetBranchTexture(TALENT_BRANCH_TEXTURECOORDS.up[node.up],x,y);
				SetBranchTexture(TALENT_BRANCH_TEXTURECOORDS.down[node.down],x,y - 32);
				ignoreUp = 1;
			end
		end
	end
	-- Hide Remaining Objects
	for i = numTalents + 1, #talentBtns do
		talentBtns[i]:Hide();
	end
	for i = branchIndex, #branches do
		branches[i]:Hide();
	end
	for i = arrowIndex, #arrows do
		arrows[i]:Hide();
	end
end