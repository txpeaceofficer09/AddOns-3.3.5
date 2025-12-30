local ex = Examiner;

-- Module
local mod = ex:CreateModule("PvP");
mod:CreatePage(true,PLAYER_V_PLAYER);
mod:CreateButton(PVP,PLAYER_V_PLAYER,"Honor & Arena Details");
mod.canCache = true;

-- Variables
local cfg, cache;
local rankIcon;
local labels = {};
local arena = {};

--------------------------------------------------------------------------------------------------------
--                                           Module Scripts                                           --
--------------------------------------------------------------------------------------------------------

-- OnInitialize
function mod:OnInitialize()
	cfg = Examiner_Config;
	cache = Examiner_Cache;
end

-- OnInspect
function mod:OnInspect(unit)
	if (ex.canInspect) then
		self:PVPUpdate();
		self.button:Enable();
	else
		mod.page:Hide();
		self.button:Disable();
	end
end

-- OnCacheLoaded
function mod:OnCacheLoaded(entry,unit)
	if (entry.Honor) then
		mod:LoadHonorFromCache(entry.Honor);
		mod:LoadArenaTeamsFromCache(entry);
		self.button:Enable();
	else
		self.button:Disable();
	end
end

-- OnClearInspect
function mod:OnClearInspect()
	self.page:UnregisterEvent("INSPECT_HONOR_UPDATE");
	-- Header
	rankIcon:Hide();
	-- Clear Honor
	for i = 4, 9 do
		labels[i]:SetText("---");
	end
	labels[9]:SetTextColor(1,1,0);
	-- Hide Arena Teams
	for i = 1, #arena do
		arena[i]:Hide();
	end
end

--------------------------------------------------------------------------------------------------------
--                                               Events                                               --
--------------------------------------------------------------------------------------------------------

-- Honor Update
function mod.page:INSPECT_HONOR_UPDATE(event)
	mod:PVPUpdate();
end

--------------------------------------------------------------------------------------------------------
--                                       Arena Point Calculator                                       --
--------------------------------------------------------------------------------------------------------

-- Calculate Arena Points -- Updated Formula for 2.2 -- Now always uses 1500 rating if rating is less than that
local function CalculateArenaPoints(teamRating,teamSize)
	teamRating = (teamRating < 1500 and 1500 or teamRating);
	local multiplier = (teamSize == 5 and 1) or (teamSize == 3 and 0.88) or (teamSize == 2 and 0.76)
	if (teamRating <= 1500) then
		return multiplier * (0.22 * teamRating + 14);
	else
		return multiplier * (1511.26 / (1 + 1639.28 * 2.71828 ^ (-0.00412 * teamRating)));
	end
end

-- Slash Command -- Arena Calculator
ex.slashHelp[#ex.slashHelp + 1] = " |2arena 'rating'|r = Arena Point Calculator";
ex.slashFuncs["arena"] = function(cmd)
	cmd = tonumber(cmd);
	if (type(cmd) == "number") then
		AzMsg(format("|2Arena Point Calculation|r |1%d|r Rating |2=|r 2v2: |1%.1f|r, 3v3: |1%.1f|r, 5v5: |1%.1f|r.",cmd,CalculateArenaPoints(cmd,2),CalculateArenaPoints(cmd,3),CalculateArenaPoints(cmd,5)));
	end
end

--------------------------------------------------------------------------------------------------------
--                                             PvP Stuff                                              --
--------------------------------------------------------------------------------------------------------

-- PvP Update
function mod:PVPUpdate()
	if (HasInspectHonorData()) or (ex:ValidateUnit() and UnitIsUnit(ex.unit,"player")) then
		self:LoadHonorNormal();
		self:LoadArenaTeamsNormal();
	else
		self.page:RegisterEvent("INSPECT_HONOR_UPDATE");
		RequestInspectHonorData();
	end
end

-- Format Numbers
local function FormatNumbers(self,value,max)
	local color = (value == 0 and "|cffff8080" or "|cffffff80");
	if (max == 0) then
		self:SetFormattedText("%s0|r (%1$s0%%|r)",color);
	else
		self:SetFormattedText("%s%d|r (%s%.1f%%|r)",color,value,color,value / max * 100);
	end
end

-- Load Honor Normal
function mod:LoadHonorNormal()
	local isPlayer = (ex:ValidateUnit() and UnitIsUnit(ex.unit,"player"));
	local todayHK, todayHonor, yesterdayHK, yesterdayHonor, lifetimeHK, lifetimeRank;
	-- Query
	if (isPlayer) then
		todayHK, todayHonor = GetPVPSessionStats();
		yesterdayHK, yesterdayHonor = GetPVPYesterdayStats();
		lifetimeHK, lifetimeRank = GetPVPLifetimeStats();
	else
		todayHK, todayHonor, yesterdayHK, yesterdayHonor, lifetimeHK, lifetimeRank = GetInspectHonorData();
	end
	-- Update
	mod:UpdateHonor(todayHK, todayHonor, yesterdayHK, yesterdayHonor, lifetimeHK, lifetimeRank);
	-- Show Honor Points for Player only
	if (isPlayer) then
		labels[9]:SetText(GetHonorCurrency());
		labels[9]:SetTextColor(0,1,0);
	end
	-- Cache
	if (self:CanCache()) then
		local cacheEntry = cache[ex:GetEntryName()];
		if (cacheEntry) and (time() - cacheEntry.time <= 8) then
			cacheEntry.Honor = { todayHK = todayHK, todayHonor = todayHonor, yesterdayHK = yesterdayHK, yesterdayHonor = yesterdayHonor, lifetimeHK = lifetimeHK, lifetimeRank = lifetimeRank };
		end
	end
end

-- Load Honor From Cache
function mod:LoadHonorFromCache(entry)
	if (entry) then
		mod:UpdateHonor(entry.todayHK, entry.todayHonor, entry.yesterdayHK, entry.yesterdayHonor, entry.lifetimeHK, entry.lifetimeRank);
	end
end

-- Honor Update
function mod:UpdateHonor(todayHK, todayHonor, yesterdayHK, yesterdayHonor, lifetimeHK, lifetimeRank)
	-- Show Rank
	if (lifetimeRank ~= 0) then
		rankIcon.texture:SetTexture("Interface\\PvPRankBadges\\PvPRank"..format("%.2d",lifetimeRank-4));
		rankIcon.texture:SetTexCoord(0,1,0,1);
		rankIcon.tip = format("%s (Rank %d)",GetPVPRankInfo(lifetimeRank,ex.unit),(lifetimeRank - 4));
		rankIcon:Show();
	end
	-- Show Kills/Honor
	labels[4]:SetText(todayHK);
	labels[5]:SetText(yesterdayHK);
	labels[6]:SetText(lifetimeHK);
	labels[7]:SetText(todayHonor);
	labels[8]:SetText(yesterdayHonor);
	labels[9]:SetText("---");
	labels[9]:SetTextColor(1,1,0);
end

-- Load Arena Teams Normal
function mod:LoadArenaTeamsNormal()
	local teamName, teamSize, teamRating, teamPlayed, teamWins, playerPlayed, playerRating, emblem, border;
	local seasonTeamPlayed, seasonTeamWins, seasonPlayerPlayed, teamRank;
	local backR, backG, backB, emblemR, emblemG, emblemB, borderR, borderG, borderB;
	local cacheEntry = cache[ex:GetEntryName()];
	local isPlayer = (ex:ValidateUnit() and UnitIsUnit(ex.unit,"player"));
	-- Loop
	for i = 1, MAX_ARENA_TEAMS do
		if (isPlayer) then
			teamName, teamSize, teamRating, teamPlayed, teamWins, seasonTeamPlayed, seasonTeamWins, playerPlayed, seasonPlayerPlayed, teamRank, playerRating, backR, backG, backB, emblem, emblemR, emblemG, emblemB, border, borderR, borderG, borderB = GetArenaTeam(i);
			teamPlayed, teamWins, playerPlayed = seasonTeamPlayed, seasonTeamWins, seasonPlayerPlayed;
		else
			teamName, teamSize, teamRating, teamPlayed, teamWins, playerPlayed, playerRating, backR, backG, backB, emblem, emblemR, emblemG, emblemB, border, borderR, borderG, borderB = GetInspectArenaTeamData(i);
		end
		-- Update
		if (teamName) then
			mod:ArenaTeamUpdate(teamName, teamSize, teamRating, teamPlayed, teamWins, playerPlayed, playerRating, backR, backG, backB, emblem, emblemR, emblemG, emblemB, border, borderR, borderG, borderB);
			-- Cache
			if (self:CanCache()) and (cacheEntry) and (time() - cacheEntry.time <= 8) then
				cacheEntry["Arena"..i] = { teamName = teamName, teamSize = teamSize, teamRating = teamRating, teamPlayed = teamPlayed, teamWins = teamWins, playerPlayed = playerPlayed, playerRating = playerRating, backR = backR, backG = backG, backB = backB, emblem = emblem, emblemR = emblemR, emblemG = emblemG, emblemB = emblemB, border = border, borderR = borderR, borderG = borderG, borderB = borderB };
			end
		end
	end
end

-- Load Arena Team From Cache
function mod:LoadArenaTeamsFromCache(entry)
	for i = 1, MAX_ARENA_TEAMS do
		if (entry["Arena"..i]) then
			local a = entry["Arena"..i];
			mod:ArenaTeamUpdate(a.teamName, a.teamSize, a.teamRating, a.teamPlayed, a.teamWins, a.playerPlayed, a.playerRating, a.backR, a.backG, a.backB, a.emblem, a.emblemR, a.emblemG, a.emblemB, a.border, a.borderR, a.borderG, a.borderB);
		end
	end
end

-- Arena Team Update
function mod:ArenaTeamUpdate(teamName, teamSize, teamRating, teamPlayed, teamWins, playerPlayed, playerRating, backR, backG, backB, emblem, emblemR, emblemG, emblemB, border, borderR, borderG, borderB)
	local f = arena[floor(teamSize / 2 + 0.9)];
	-- General
	f.name:SetText(teamName);
	f.rating:SetText(teamRating);
	-- Games/Played
	f.details[1].right:SetFormattedText("|cffffff80%d",teamPlayed);
	FormatNumbers(f.details[2].right,playerPlayed,teamPlayed);
	-- Wins/Loss
	FormatNumbers(f.details[3].right,teamWins,teamPlayed);
	FormatNumbers(f.details[4].right,teamPlayed-teamWins,teamPlayed);
	-- Estimated Points & Personal Rating
	f.details[5].right:SetFormattedText("|cffffff80%.1f",CalculateArenaPoints(teamRating,teamSize));
	f.details[6].right:SetFormattedText("|cffffff80%s",tostring(playerRating));
	-- Banner
	f.banner:SetTexture("Interface\\PVPFrame\\PVP-Banner-"..teamSize);
	f.banner:SetVertexColor(backR,backG,backB);
	f.emblem:SetVertexColor(emblemR,emblemG,emblemB);
	f.border:SetVertexColor(borderR,borderG,borderB);
	f.border:SetTexture(border ~= -1 and "Interface\\PVPFrame\\PVP-Banner-"..teamSize.."-Border-"..border or nil);
	f.emblem:SetTexture(emblem ~= -1 and "Interface\\PVPFrame\\Icons\\PVP-Banner-Emblem-"..emblem or nil);
	-- Show Frame
	f:Show();
end

--------------------------------------------------------------------------------------------------------
--                                           Widget Creation                                          --
--------------------------------------------------------------------------------------------------------

-- Rank Icon
rankIcon = CreateFrame("Frame",nil,mod.page);
rankIcon:SetPoint("TOPLEFT",12,-12);
rankIcon:SetWidth(18);
rankIcon:SetHeight(18);
rankIcon:EnableMouse(1);
rankIcon:SetScript("OnEnter",function(self) GameTooltip:SetOwner(self,"ANCHOR_BOTTOMRIGHT"); GameTooltip:SetText(self.tip) end)
rankIcon:SetScript("OnLeave",ex.HideGTT);
rankIcon.texture = rankIcon:CreateTexture(nil,"ARTWORK");
rankIcon.texture:SetAllPoints();

-- Honor Labels
for i = 1, 9 do
	local l = mod.page:CreateFontString(nil,"ARTWORK","GameFontHighlightSmall");
	l:SetWidth(70);

	if (i <= 3) then
		l:SetText(i == 1 and "Today" or i == 2 and "Yesterday" or "Lifetime");
		l:SetTextColor(0.5,0.75,1);
	else
		l:SetTextColor(1,1,0);
	end

	if ((i - 1) % 3 == 0) then
		l:SetPoint("TOP",-28,-36 - (i - 1) / 3 * 12);
	else
		l:SetPoint("LEFT",labels[i - 1],"RIGHT");
	end

	labels[i] = l;
end

-- Honor Label Side Headers
local t = mod.page:CreateFontString(nil,"ARTWORK","GameFontHighlightSmall");
t:SetPoint("RIGHT",labels[4],"LEFT");
t:SetWidth(70);
t:SetJustifyH("LEFT");
t:SetText("Honor Kills");
t:SetTextColor(0.5,0.75,1);

t = mod.page:CreateFontString(nil,"ARTWORK","GameFontHighlightSmall");
t:SetPoint("RIGHT",labels[7],"LEFT");
t:SetWidth(70);
t:SetJustifyH("LEFT");
t:SetText("Honor Points");
t:SetTextColor(0.5,0.75,1);

-- Detail Frame for Arena Frames
local function MakeDetailFrame(parent)
	local f = CreateFrame("Frame",nil,parent);
	f:SetWidth(118);
	f:SetHeight(12);

	f.left = f:CreateFontString(nil,"ARTWORK","GameFontHighlightSmall");
	f.left:SetPoint("LEFT");

	f.right = f:CreateFontString(nil,"ARTWORK","GameFontHighlightSmall");
	f.right:SetPoint("RIGHT");
	f.right:SetTextColor(0.5,0.75,1);

	return f;
end

-- Arena
local backdrop = { bgFile = "Interface\\Tooltips\\UI-Tooltip-Background", edgeFile = "Interface\\Tooltips\\UI-Tooltip-Border", tile = true, tileSize = 16, edgeSize = 16, insets = { left = 4, right = 4, top = 4, bottom = 4 } };
local labelNames = { "Games", "Played", "Wins", "Losses", "Calculated Points", "PR" };
for i = 1, 3 do
	local a = CreateFrame("Frame",nil,mod.page);
	a:SetWidth(304);
	a:SetHeight(82);
	a:SetBackdrop(backdrop);
	a:SetBackdropColor(0.1,0.22,0.35,1);
	a:SetBackdropBorderColor(0.7,0.7,0.8,1);

	a.banner = a:CreateTexture(nil,"BORDER");
	a.banner:SetPoint("TOPLEFT",6,-4);
	a.banner:SetWidth(45);
	a.banner:SetHeight(90);
	a.border = a:CreateTexture(nil,"ARTWORK");
	a.border:SetPoint("CENTER",a.banner);
	a.border:SetWidth(45);
	a.border:SetHeight(90);
	a.emblem = a:CreateTexture(nil,"OVERLAY");
	a.emblem:SetPoint("CENTER",a.border,-5,17);
	a.emblem:SetWidth(24);
	a.emblem:SetHeight(24);

	a.name = a:CreateFontString(nil,"ARTWORK","GameFontHighlight");
	a.name:SetPoint("TOPLEFT",50,-8)
	a.name:SetTextColor(0.5,0.75,1);

	a.rating = a:CreateFontString(nil,"ARTWORK","GameFontHighlight");
	a.rating:SetPoint("TOPRIGHT",-8,-8)
	a.rating:SetTextColor(0.5,0.75,1);

	a.size = a:CreateFontString(nil,"ARTWORK","GameFontHighlightSmall");
	a.size:SetPoint("BOTTOMRIGHT",-8,8)
	a.size:SetFormattedText("%dv%1$d",floor(i + i / 2 + 0.5));

	a.details = {};
	for index, label in ipairs(labelNames) do
		local d = MakeDetailFrame(a);
		d.left:SetText(label);
		d.id = index;

		if (index % 2 == 1) then
			d:SetPoint("TOPLEFT",50,-29 - (index - 1) / 2 * 12 - (index == 5 and 6 or 0));
		else
			d:SetPoint("LEFT",a.details[index - 1],"RIGHT",8,0);
		end

		a.details[#a.details + 1] = d;
	end
	a.details[#a.details - 1]:SetWidth(130);
	a.details[#a.details]:SetWidth(50);

	if (i == 1) then
		a:SetPoint("TOPLEFT",8,-75);
	else
		a:SetPoint("TOP",arena[i - 1],"BOTTOM");
	end

	arena[i] = a;
end