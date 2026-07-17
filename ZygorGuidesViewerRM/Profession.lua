local me = ZygorGuidesViewer
local ZGV = me
if not ZGV then return end

me.skills = {}

local LS=ZygorGuidesViewer_L("Skills")

local skillSpells = {
	['Alchemy']=2259,
	['Blacksmithing']=2018,
	['Inscription']=45357,
	['Jewelcrafting']=25229,
	['Leatherworking']=2108,
	['Tailoring']=3908,
	['Enchanting']=7411,
	['Engineering']=4036,

	['Herbalism']=13614,
	['Mining']=2575,
	['Skinning']=8613,

	['Cooking']=2550,
	['First Aid']=3273,
	['Fishing']=7620,
}

local skillLines = {
	['Alchemy']=171,
	['Blacksmithing']=164,
	['Inscription']=773,
	['Jewelcrafting']=755,
	['Leatherworking']=165,
	['Tailoring']=197,
	['Enchanting']=333,
	['Engineering']=202,
	['Herbalism']=182,
	['Mining']=186,
	['Skinning']=393,
	['Cooking']=185,
	['First Aid']=129,
	['Fishing']=356,
}

local function ParseItemIDFromLink(link)
	if not link then return nil end
	return tonumber(link:match("item:(%d+)"))
end

local function ParseSpellIDFromLink(link)
	if not link then return nil end
	return tonumber(link:match("|H%w+:(%d+)")) or tonumber(link:match("enchant:(%d+)")) or tonumber(link:match("spell:(%d+)"))
end

function me:SyncRecipeCacheToRuntime()
	self.db.char.RecipesKnownDetails = self.db.char.RecipesKnownDetails or {}
	ZGV.Professions = ZGV.Professions or {}
	ZGV.Professions.AllRecipes = {}

	for skillID, recipelist in pairs(self.db.char.RecipesKnownDetails) do
		local numericSkillID = tonumber(skillID) or skillID
		ZGV.Professions.AllRecipes[numericSkillID] = {}
		for spellID, recipe in pairs(recipelist) do
			local numericSpellID = tonumber(spellID) or spellID
			ZGV.Professions.AllRecipes[numericSkillID][numericSpellID] = recipe
		end
	end
end

tinsert(me.startups,function(self)
	self:AddEvent("SKILL_LINES_CHANGED","CacheSkills")
	self:AddEvent("TRADE_SKILL_UPDATE","CacheSkills")
	self:AddEvent("CHAT_MSG_SKILL","CacheSkills")
	self:AddEvent("CHAT_MSG_SYSTEM","Profession_CHAT_MSG_SYSTEM")
	self:AddEvent("TRADE_SKILL_SHOW","CacheRecipes")
	--self:AddEvent("CHAT_MSG_COMBAT_FACTION_CHANGE","CHAT_MSG_COMBAT_FACTION_CHANGE_Faction")

	self.skills[""]={
		active=false,
		level=0,
		max=0
	}

	if GetLocale()~="enUS" then
		ZGV.SkillsLocalized={}
		for skill,num in pairs(skillSpells) do
			ZGV.SkillsLocalized[skill]=GetSpellInfo(num)
		end
	end

	self.db.char.RecipesKnown = self.db.char.RecipesKnown or {}
	self.db.char.RecipesKnownDetails = self.db.char.RecipesKnownDetails or {}
	self:SyncRecipeCacheToRuntime()
end)

local ERR_LEARN_RECIPE_S_fmt = ERR_LEARN_RECIPE_S:gsub("%.","%%."):gsub("%%s","(.+)")
--local TRADESKILL_LOG_FIRSTPERSON_fmt = TRADESKILL_LOG_FIRSTPERSON:gsub("%%s","(.-)")

function me:Profession_CHAT_MSG_SYSTEM(event,text)
	local _,_,item = text:find(ERR_LEARN_RECIPE_S_fmt)
	if item then
		self.recentlyLearnedRecipes[item]=true
	end
end

function me:CacheSkills()
	if not TradeSkillFrame then
--TODO
	end
	self.db.char.SkillsKnown = self.db.char.SkillsKnown or {}
	for i=1,70 do
		local skillName, header, isExpanded, skillRank, numTempPoints, skillModifier, skillMaxRank, isAbandonable, stepCost, rankCost, minLevel, skillCostType, skillDescription = GetSkillLineInfo(i)

		if not header and not child and skillName then 
			local pro = self.skills[skillName]
			if not pro then
				pro={
				}
				self.skills[skillName]=pro
			end
			pro.level=skillRank
			pro.max=skillMaxRank
			pro.active=true
			pro.skillID = skillLines[skillName] or pro.skillID or 0
			pro.parentskillID = pro.skillID
			self.db.char.SkillsKnown[skillName] = {
				level = pro.level,
				max = pro.max,
				active = pro.active,
				skillID = pro.skillID,
				parentskillID = pro.parentskillID,
				name = skillName,
			}
		end
	end
end

function me:GetSkill(name)
	if self.SkillsLocalized and self.SkillsLocalized[name] then name=self.SkillsLocalized[name] end
	return self.skills[name] or self.skills[""]
end

function me:CacheRecipes()
	-- assume tradeskill window is open?
	local skill = GetTradeSkillLine()
	if skill=="UNKNOWN" then return end

	-- ah fuck this
	--[[
	-- clear filters
	if TradeSkillFrameAvailableFilterCheckButton:GetChecked() then
		TradeSkillOnlyShowMakeable(false)
		TradeSkillFrameAvailableFilterCheckButton:SetChecked(false)
	end
	--UIDropDownMenu_Initialize(TradeSkillInvSlotDropDown, TradeSkillInvSlotDropDown_Initialize)
	UIDropDownMenu_SetSelectedID(TradeSkillInvSlotDropDown,1)
	SetTradeSkillInvSlotFilter(0,1,1)
	--UIDropDownMenu_Initialize(TradeSkillSubClassDropDown, TradeSkillSubClassDropDown_Initialize)
	UIDropDownMenu_SetSelectedID(TradeSkillSubClassDropDown,1)
	SetTradeSkillSubClassFilter(0,1,1)

	--expand headers
	local openedheaders={}
	for i=GetNumTradeSkills(),1,-1 do
		local name,ttype,_,expanded = GetTradeSkillInfo(i)
		if ttype=="header" and not expanded then
			ExpandTradeSkillSubClass(i)
			openedheaders[name]=true
		end
	end
	--]]

	if IsTradeSkillLinked() then return end
	-- scan!
	local recipes = self.db.char.RecipesKnown
	local recipeDetails = self.db.char.RecipesKnownDetails
	local skillID = skillLines[skill] or (self.skills[skill] and self.skills[skill].skillID) or 0
	if skillID == 0 then return end

	recipeDetails[skillID] = {}
	ZGV.Professions = ZGV.Professions or {}
	ZGV.Professions.AllRecipes = ZGV.Professions.AllRecipes or {}
	ZGV.Professions.AllRecipes[skillID] = {}

	local scanned=0
	for i = 1,500 do
		local tradeName,tradeType = GetTradeSkillInfo(i)

		if tradeName and tradeType~="header" then
			local link = GetTradeSkillRecipeLink(i)
			local spell = ParseSpellIDFromLink(link)
			if spell then
				recipes[spell]=true

				local productLink = GetTradeSkillItemLink and GetTradeSkillItemLink(i)
				local productID = ParseItemIDFromLink(productLink)
				local productType = productID and "item" or "enchant"
				local numMadeMin, numMadeMax = GetTradeSkillNumMade and GetTradeSkillNumMade(i)
				local numMade = tonumber(numMadeMax) or tonumber(numMadeMin) or 1
				local reagents = {}
				local reagentCount = GetTradeSkillNumReagents and GetTradeSkillNumReagents(i) or 0
				for reagentIndex = 1, reagentCount do
					local _, _, requiredCount = GetTradeSkillReagentInfo(i, reagentIndex)
					local reagentLink = GetTradeSkillReagentItemLink and GetTradeSkillReagentItemLink(i, reagentIndex)
					local reagentID = ParseItemIDFromLink(reagentLink)
					if reagentID and requiredCount and requiredCount > 0 then
						reagents[#reagents + 1] = { id = reagentID, num = requiredCount }
					end
				end

				local recipe = {
					spell = spell,
					skill = skillID,
					productid = productID,
					producttype = productType,
					reagents = reagents,
					learned = true,
					learnedat = 1,
					name = tradeName,
					nummade = numMade,
				}

				recipeDetails[skillID][spell] = recipe
				ZGV.Professions.AllRecipes[skillID][spell] = recipe
				scanned=scanned+1
			end
		end
	end
	self:Debug(scanned.." "..skill.." recipes found")

	if ZGV.Goldguide and ZGV.Goldguide.initialized then
		ZGV.Goldguide:CalculateAllChores(true)
	end

	--[[
	--collapse headers
	for i=GetNumTradeSkills(),1,-1 do
		local name = GetTradeSkillInfo(i)
		if openedheaders[name] then CollapseTradeSkillSubClass(i) end
	end
	--]]
end

function me:PerformTradeSkill(id,count)
	if not count then count=1 end
	for i = 1,500 do
		local tradeName,tradeType = GetTradeSkillInfo(i)

		if tradeName and tradeType~="header" then
			local link = GetTradeSkillRecipeLink(i)
			local spell = tonumber(strmatch(link,"|H%w+:(%d+)"))
			if spell==id then
				DoTradeSkill(i,count)
			end
		end
	end
end
