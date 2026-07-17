local ZGV = ZygorGuidesViewer
if not (ZGV and ZGV.ItemScore) then return end
local ItemScore = ZGV.ItemScore

function ItemScore:SetDualWield()
	-- Set dual wield 
	self.playerDualWield = false
	self.playerDualTwohanders = false
	if self.playerlevel>=10 and IsSpellKnown(674) then
		self.playerDualWield = true
	end
end

-- checks what slots can this item be equipped to. automatically called as part of GetItemDetails, but may be called as standalone
-- params:
--	item - array - item object
-- returns:
--	first slot - int/false - main slot for this item
--	second slot - int/false - optional second slot for the item (offhand, rings, trinkets)
--	twohander - bool - is item twohander
local function get_slots_by_type(type)
	if type=="INVTYPE_WEAPON" then return INVSLOT_MAINHAND,INVSLOT_OFFHAND end
	if type=="INVTYPE_2HWEAPON" then return INVSLOT_MAINHAND,INVSLOT_OFFHAND end
	if type=="INVTYPE_FINGER" then return INVSLOT_FINGER1,INVSLOT_FINGER2 end
	if type=="INVTYPE_TRINKET" then return INVSLOT_TRINKET1,INVSLOT_TRINKET2 end
	if type=="INVTYPE_RANGED" then return INVSLOT_RANGED,false end
	if type=="INVTYPE_RANGEDRIGHT" then return INVSLOT_RANGED,false end
	if type=="INVTYPE_THROWN" then return INVSLOT_RANGED,false end
	return ItemScore.TypeToSlot[type], false
end

function ItemScore:GetValidSlots(item)
	if not item then return end
	local s1, s2 = get_slots_by_type(item.type)

	if item.type=="INVTYPE_WEAPON" and ItemScore.playerDualWield then -- dual wield, 1 handed weapons are valid in offhand
		return s1, s2, false
	end
	if item.type=="INVTYPE_2HWEAPON" then -- two handed items go into main hand slot
		return s1, false, true
	end
	if item.type=="INVTYPE_WEAPON" and not ItemScore.playerDualWield then -- no dual wield, 1 handed weapons are valid only in mainhand
		return s1, false, false
	end

	-- rest is valid in proper slots
	return s1, s2, false
end

function ItemScore:SetData()
	ItemScore.Builds={}
	for class,classData in pairs(ItemScore.rules) do
		ItemScore.Builds[ZGV.ClassToNumber[class]] = {}
		for buildid,builddata in pairs(classData) do
			ItemScore.Builds[ZGV.ClassToNumber[class]][buildid] = builddata.name
		end
	end

	-- Build simpler defaults table for use in options
	ItemScore.Defaults = {}
	for class,specs in pairs(ItemScore.rules) do
		ZGV.ItemScore.Defaults[class] = {}
		for spec,data in pairs(specs) do
			ZGV.ItemScore.Defaults[class][spec] = {}
			for name,v in pairs(data.stats) do
				table.insert(ZGV.ItemScore.Defaults[class][spec],{name=name,weight=v})
			end
			table.sort(ZGV.ItemScore.Defaults[class][spec],function(a,b) return a.name<b.name end)
		end
	end
end

ItemScore:SetData()