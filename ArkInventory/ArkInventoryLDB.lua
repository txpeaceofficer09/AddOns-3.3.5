ArkInventory.LDB = {
	Bags = ArkInventory.Lib.DataBroker:NewDataObject( string.format( "%s_%s", ArkInventory.Const.Program.Name, "Bags" ), {
		type = "data source",
		icon = ArkInventory.Global.Location[ArkInventory.Const.Location.Bag].Texture,
		text = ArkInventory.Const.Slot.Data[ArkInventory.Const.Location.Bag].name,
	} ),
	Money = ArkInventory.Lib.DataBroker:NewDataObject( string.format( "%s_%s", ArkInventory.Const.Program.Name, "Money" ), {
		type = "data source",
		icon = [[Interface\Icons\INV_Misc_Coin_02]],
		text = "Money",
	} ),
	Ammo = ArkInventory.Lib.DataBroker:NewDataObject( string.format( "%s_%s", ArkInventory.Const.Program.Name, "Ammunition" ), {
		type = "data source",
		icon = [[Interface\Icons\INV_Misc_Ammo_Bullet_02]],
		text = "Ammo",
	} ),
	Companion = { },
	Pets = ArkInventory.Lib.DataBroker:NewDataObject( string.format( "%s_%s", ArkInventory.Const.Program.Name, "Pets" ), {
		type = "data source",
		icon = ArkInventory.Global.Location[ArkInventory.Const.Location.Pet].Texture,
		text = "",
	} ),
	Mounts = ArkInventory.Lib.DataBroker:NewDataObject( string.format( "%s_%s", ArkInventory.Const.Program.Name, "Mounts" ), {
		type = "data source",
		icon = ArkInventory.Global.Location[ArkInventory.Const.Location.Mount].Texture,
		text = "",
	} ),
	Tracking_Currency = ArkInventory.Lib.DataBroker:NewDataObject( string.format( "%s_%s_%s", ArkInventory.Const.Program.Name, "Tracking", "Currency" ), {
		type = "data source",
		icon = ArkInventory.Global.Location[ArkInventory.Const.Location.Token].Texture,
		text = "",
	} ),
	Tracking_Item = ArkInventory.Lib.DataBroker:NewDataObject( string.format( "%s_%s_%s", ArkInventory.Const.Program.Name, "Tracking", "Item" ), {
		type = "data source",
		icon = [[Interface\Icons\Ability_Tracking]],
		text = "",
	} ),
}

local companionTable = { }



function ArkInventory.LDB.Bags:OnClick( button )
	if button == "RightButton" then
		ArkInventory.MenuLDBBagsOpen( self )
	else
		ArkInventory.Frame_Main_Toggle( ArkInventory.Const.Location.Bag )
	end
end

function ArkInventory.LDB.Bags:Update( )
	local loc_id = ArkInventory.Const.Location.Bag
	--ArkInventory.LDB.Bags.icon = ArkInventory.Global.Location[loc_id].Texture
	self.text = ArkInventory.Frame_Status_Update_Empty( loc_id, ArkInventory.Global.Me, true )
end



function ArkInventory.LDB.Money:Update( )
	self.text = ArkInventory.MoneyText( GetMoney( ) )
end

function ArkInventory.LDB.Money.OnTooltipShow( frame )
	ArkInventory.MoneyFrame_Tooltip( frame )
end



function ArkInventory.LDB.Ammo:OnClick( button )
	
	if ArkInventory.IsCataclysm then return end
	
	if button == "RightButton" then
		ArkInventory.MenuLDBAmmoOpen( self )
	end
	
end

function ArkInventory.LDB.Ammo:Update( )
	
	if ArkInventory.IsCataclysm then return end
	
	local inv_id, texture = GetInventorySlotInfo( "RangedSlot" )
	local hw = GetInventoryItemLink( "player", inv_id )
	
	if not hw then
		
		-- no ranged weapon equipped
		self.icon = texture
		self.text = ""
		
	else
		
		local d1, d2 = GetInventoryItemDurability( inv_id )
		if d1 == d2 then
			d1 = ""
		elseif d1 == 0 then
			d1 = string.format( "%s%s%s", RED_FONT_COLOR_CODE, ArkInventory.Localise["LDB_AMMO_WEAPON_BROKEN"], FONT_COLOR_CODE_CLOSE )
		else
			if ArkInventory.db.char.option.ldb.ammo.durability then
				d1 = string.format( "%i%%", ( d1 / d2 ) * 100 )
			else
				d1 = ""
			end
		end
		
		local needsammo = false
		
		inv_id = GetInventorySlotInfo( "AmmoSlot" )
		
		local check = { 264, 5011, 266 }
		for _, v in pairs( check ) do
			local wt = GetSpellInfo( v )
			if IsEquippedItemType( wt ) then --if select( 8, ArkInventory.ObjectInfo( hw ) ) == wt then
				needsammo = true
				break
			end
		end
		
		if not needsammo then
			
			self.icon = GetItemIcon( hw )
			self.text = d1
			
		else
			
			local na = string.format( "%s%s%s", RED_FONT_COLOR_CODE, SPELL_FAILED_NO_AMMO, FONT_COLOR_CODE_CLOSE )
			
			local ha = GetInventoryItemLink( "player", inv_id )
			
			if not ha then
				
				-- use weapon icon
				self.icon = GetItemIcon( hw )
				
				-- show durability
				if d1 == "" then
					self.text = na
				else
					self.text = string.format( "%s (%s)", na, d1 )
				end
				
			else
				
				-- use ammo icon
				self.icon = GetItemIcon( ha )
				
				-- get ammo count
				local c = GetItemCount( ha )
				if c == 0 then c = na end
				
				-- show count and durability
				if d1 == "" then
					self.text = string.format( "%s", c )
				else
					self.text = string.format( "%s (%s)", c, d1 )
				end
				
			end
			
		end
		
	end
	
end

function ArkInventory.LDB.Ammo:OnTooltipShow( )
	
	if ArkInventory.IsCataclysm then
		
		self:AddLine( "Ammunition has been removed from Cataclysm, please disable this object in your LDB display mod" )
		
	else
		
		local inv_id = GetInventorySlotInfo( "RangedSlot" )
		local h = GetInventoryItemLink( "player", inv_id )
		
		if not h then
			self:AddLine( ArkInventory.Localise["LDB_AMMO_WEAPON_NONE"] )
		else
			self:AddLine( h )
		end
		
	end

end



function ArkInventory.LDB.Tracking_Currency:Update( )
	
	if ArkInventory.IsCataclysm then
		self:Update4( )
	else
		self:Update3( )
	end
	
end

function ArkInventory.LDB.Tracking_Currency:Update3( )
	
	self.text = ""
	
	-- expand all token headers
	local numTokenTypes = GetCurrencyListSize( )
	
	if numTokenTypes == 0 then return end
	
	local name, isHeader, isExpanded, isUnused, isWatched, count, currencyType, icon
	
	for j = numTokenTypes, 1, -1 do
		name, isHeader, isExpanded = GetCurrencyListInfo( j )
		if isHeader and not isExpanded then
			ExpandCurrencyList( j, 1 )
		end
	end
	
	local numTracked = 0
	numTokenTypes = GetCurrencyListSize( )
	local size = ( ArkInventory.db.char.option.ldb.tracking.currency.size or 0 ) + 1
	
	for j = 1, numTokenTypes do
		
		if ArkInventory.IsCataclysm then
			name, isHeader, isExpanded, isUnused, isWatched, count, icon = GetCurrencyListInfo( j )
		else
			name, isHeader, isExpanded, isUnused, isWatched, count, currencyType, icon = GetCurrencyListInfo( j )
		end
		
		if not isHeader then
			
			if ArkInventory.db.char.option.ldb.tracking.currency.tracked[name] then
				
				if currencyType == 1 then
					icon = [[Interface\PVPFrame\PVP-ArenaPoints-Icon]]
				elseif currencyType == 2 then
					icon = string.format( "%s%s", [[Interface\PVPFrame\PVP-Currency-]], UnitFactionGroup( "player" ) )
				end
				
				numTracked = numTracked + 1
				size = size - 1
				self.text = string.format( "%s  |T%s:!!!:!!!|t %d", self.text, icon or ArkInventory.Const.Texture.Missing, count or 0 )
				
			end
			
		end
		
	end
	
	if numTracked > 0 then
		if size < 1 then
			size = 0
		end
		size = string.format( "%d", size )
		self.text = string.gsub( self.text, "!!!", size )
	end
	
end

function ArkInventory.LDB.Tracking_Currency:Update4( )
	
	self.text = ""
	
	-- expand all token headers
	local numTokenTypes = GetCurrencyListSize( )
	
	if numTokenTypes == 0 then return end
	
	local name, isHeader, isExpanded, isUnused, isWatched, count, currencyType, icon
	
	for j = numTokenTypes, 1, -1 do
		name, isHeader, isExpanded = GetCurrencyListInfo( j )
		if isHeader and not isExpanded then
			ExpandCurrencyList( j, 1 )
		end
	end
	
	numTokenTypes = GetCurrencyListSize( )
	
	for j = 1, numTokenTypes do
		
		if ArkInventory.IsCataclysm then
			name, isHeader, isExpanded, isUnused, isWatched, count, icon = GetCurrencyListInfo( j )
		else
			name, isHeader, isExpanded, isUnused, isWatched, count, currencyType, icon = GetCurrencyListInfo( j )
		end
		
		if not isHeader then
			
			if ArkInventory.db.char.option.ldb.tracking.currency.tracked[name] then
				
--				if currencyType == 1 then
--					icon = [[Interface\PVPFrame\PVP-ArenaPoints-Icon]]
--				elseif currencyType == 2 then
--					icon = string.format( "%s%s", [[Interface\PVPFrame\PVP-Currency-]], UnitFactionGroup( "player" ) )
--				end
				
				self.text = string.format( "%s  |T%s:0|t %d", self.text, icon or ArkInventory.Const.Texture.Missing, count or 0 )
				
			end
			
		end
		
	end
	
end

function ArkInventory.LDB.Tracking_Currency.OnClick( frame, button )
	if button == "RightButton" then
		ArkInventory.MenuLDBTrackingCurrencyOpen( frame )
	else
		ArkInventory.Frame_Main_Toggle( ArkInventory.Const.Location.Token )
	end
end

function ArkInventory.LDB.Tracking_Currency:OnTooltipShow( )
	
	self:AddLine( string.format( "%s: %s", ArkInventory.Localise["LDB_TRACKING"], ArkInventory.Localise["LDB_TRACKING_CURRENCY"] ) )
	
	local numTokenTypes = GetCurrencyListSize( )
	
	if numTokenTypes == 0 then return end
	
	local name, isHeader, isExpanded, isUnused, isWatched, count, currencyType, icon
	
	-- expand all token headers
	for j = numTokenTypes, 1, -1 do
		name, isHeader, isExpanded = GetCurrencyListInfo( j )
		if isHeader and not isExpanded then
			ExpandCurrencyList( j, 1 )
		end
	end
	
	numTokenTypes = GetCurrencyListSize( )
	
	for j = 1, numTokenTypes do
		
		if ArkInventory.IsCataclysm then
			name, isHeader, isExpanded, isUnused, isWatched, count, icon = GetCurrencyListInfo( j )
		else
			name, isHeader, isExpanded, isUnused, isWatched, count, currencyType, icon = GetCurrencyListInfo( j )
		end
		
		if isHeader then
			self:AddLine( " " )
			self:AddLine( name )
		else
			if ArkInventory.db.char.option.ldb.tracking.currency.tracked[name] then
				self:AddDoubleLine( name, count, 0, 1, 0, 0, 1, 0 )
			else
				self:AddDoubleLine( name, count, 1, 1, 1, 1, 1, 1 )
			end
		end
		
	end
	
end



function ArkInventory.LDB.Tracking_Item:Update( )
	
	if ArkInventory.IsCataclysm then
		self:Update4( )
	else
		self:Update3( )
	end
	
end

function ArkInventory.LDB.Tracking_Item:Update3( )
	
	self.text = ""
	
	local numTracked = 0
	local size = ( ArkInventory.db.char.option.ldb.tracking.item.size or 0 ) + 1
	
	for k in ArkInventory.spairs( ArkInventory.db.global.option.tracking.items )  do
		
		if ArkInventory.db.char.option.ldb.tracking.item.tracked[k] then
			local count = GetItemCount( k )
			local icon = select( 10, GetItemInfo( k ) )
			numTracked = numTracked + 1
			size = size - 1
			self.text = string.format( "%s  |T%s:!!!:!!!|t %s", self.text, icon or ArkInventory.Const.Texture.Missing, count or 0 )
		end
		
	end
	
	if numTracked > 0 then
		if size < 1 then
			size = 0
		end
		size = string.format( "%d", size )
		self.text = string.gsub( self.text, "!!!", size )
	end
	
end

function ArkInventory.LDB.Tracking_Item:Update4( )
	
	self.text = ""
	
	for k in ArkInventory.spairs( ArkInventory.db.global.option.tracking.items )  do
		if ArkInventory.db.char.option.ldb.tracking.item.tracked[k] then
			local count = GetItemCount( k )
			if k == 6265 and ArkInventory.IsCataclysm then
				-- soul shards for cataclysm
				count = UnitPower( "player", 7 ) or 0
			end
			local icon = select( 10, GetItemInfo( k ) )
			self.text = string.format( "%s  |T%s:0|t %s", self.text, icon or ArkInventory.Const.Texture.Missing, count or 0 )
		end
	end
	
end

function ArkInventory.LDB.Tracking_Item:OnClick( button )
	if button == "RightButton" then
		ArkInventory.MenuLDBTrackingItemOpen( self )
	end
end

function ArkInventory.LDB.Tracking_Item:OnTooltipShow( )
	
	self:AddLine( string.format( "%s: %s", ArkInventory.Localise["LDB_TRACKING"], ArkInventory.Localise["LDB_TRACKING_ITEM"] ) )
	
	self:AddLine( " " )
	
	for k in ArkInventory.spairs( ArkInventory.db.global.option.tracking.items )  do
		
		local count = GetItemCount( k )
		if k == 6265 and ArkInventory.IsCataclysm then
			-- soul shards for cataclysm
			count = UnitPower( "player", 7 ) or 0
		end
		local name = GetItemInfo( k )
		
		local checked = ArkInventory.db.char.option.ldb.tracking.item.tracked[k]
		
		if checked then
			self:AddDoubleLine( name, count, 0, 1, 0, 0, 1, 0 )
		else
			self:AddDoubleLine( name, count, 1, 1, 1, 1, 1, 1 )
		end
		
	end
	
end



function ArkInventory.LDB.Pets:Update( )
	
	local companionType = "CRITTER"
	
	ArkInventory.LDB.Pets.Cleanup( )
	
	local total = ArkInventory.LDB.Companion.GetTotal( companionType )
	
	if total < 1 then
		self.icon = ArkInventory.Global.Location[ArkInventory.Const.Location.Pet].Texture
		return
	end
	
	local selected = ArkInventory.db.char.option.ldb.pets.selected
	local count = ArkInventory.LDB.Companion.GetSelectedCount( selected )
	
	if count == 0 then
		--all companions
		self.icon = [[Interface\Icons\INV_Misc_Dice_01]]
		return
	end
	
	if count > 1 then
		-- partial selection
		self.icon = [[Interface\Icons\INV_Misc_Dice_02]]
		return
	end
	
	-- just one
	for k, v in pairs( selected ) do
		if v then
			self.icon = select( 3, GetSpellInfo( k ) )
			return
		end
	end
	
end

function ArkInventory.LDB.Pets:OnTooltipShow( )
	
	local companionType = "CRITTER"
	
	local total = ArkInventory.LDB.Companion.GetTotal( companionType )
	
	if total < 1 then
		self:AddLine( ArkInventory.Localise["LDB_COMPANION_NONE"] )
		return
	end
	
	local selected = ArkInventory.db.char.option.ldb.pets.selected
	local count = ArkInventory.LDB.Companion.GetSelectedCount( selected )
	
	if count == 0 then
		-- random all
		self:AddLine( ArkInventory.Localise["RANDOM"] )
		return
	end
	
	if count > 1 then
		-- random selection
		self:AddLine( string.format( "%s (%s/%s)", ArkInventory.Localise["RANDOM"], count, total ) )
		return
	end
	
	-- just the one
	for k, v in pairs( selected ) do
		if v then
			local name = GetSpellInfo( k )
			self:AddLine( name )
			return
		end
	end

end

function ArkInventory.LDB.Pets:OnClick( button )

	if button == "RightButton" then
		
		ArkInventory.MenuLDBPetsOpen( self )
		
	else
		
		local companionType = "CRITTER"
		
		if GetNumCompanions( companionType ) == 0 then return end
		
		ArkInventory.LDB.Companion.GetUsable( companionType, true )
		
		if #companionTable == 0 then
			ArkInventory.Output( "no usable pets" )
		elseif #companionTable == 1 then
			CallCompanion( companionType, companionTable[1] )
		else
			ArkInventory.LDB.Companion.GetUsable( companionType )
			CallCompanion( companionType, companionTable[random( 1, #companionTable )] )
		end
		
	end
	
end

function ArkInventory.LDB.Pets.Cleanup( )
	
	local companionType = "CRITTER"
	
	local n = GetNumCompanions( companionType )
	
	-- get all companions we have
	local owned = { }
	for k = 1, n do
		local companionSpellID = select( 3, GetCompanionInfo( companionType, k ) )
		owned[companionSpellID] = true
	end
	
	-- remove any companions we no longer have
	local selected = ArkInventory.db.char.option.ldb.pets.selected
	for k, v in pairs( selected ) do
		if v and not owned[k] then
			selected[k] = false
		end
	end
	
	-- if all companions are selected then deselect them all
	if n == ArkInventory.LDB.Companion.GetSelectedCount( selected ) then
		table.wipe( selected )
	end
	
	table.wipe( owned )
	
end


function ArkInventory.LDB.Mounts:Update( )
	
	local companionType = "MOUNT"
	
	ArkInventory.LDB.Mounts.Cleanup( )
	
	local mountType = ArkInventory.LDB.Companion.GetUsable( companionType, true )
	
	if not mountType then
		-- no usable mounts
		self.icon = ArkInventory.Global.Location[ArkInventory.Const.Location.Mount].Texture
		return
	end
	
	local total = ArkInventory.LDB.Companion.GetTotal( companionType, mountType )
	
	--ArkInventory.Output( mountType, " / ", #companionTable, " / ", total )
	
	if total < 1 then
		self.icon = ArkInventory.Global.Location[ArkInventory.Const.Location.Mount].Texture
		return
	end
	
	local selected = ArkInventory.db.char.option.ldb.mounts[mountType].selected
	local count = ArkInventory.LDB.Companion.GetSelectedCount( selected )
	
	if count == 0 then
		--all companions
		self.icon = [[Interface\Icons\INV_Misc_Dice_01]]
		return
	end
	
	if count > 1 then
		-- partial selection
		self.icon = [[Interface\Icons\INV_Misc_Dice_02]]
		return
	end
	
	-- just one
	for k, v in pairs( selected ) do
		if v then
			self.icon = select( 3, GetSpellInfo( k ) )
			return
		end
	end
	
end

function ArkInventory.LDB.Mounts:OnTooltipShow( ... )
	
	local companionType = "MOUNT"
	
	self:AddDoubleLine( ArkInventory.Localise["LDB_MOUNTS_TOOLTIP_MODE"], ArkInventory.Localise["LDB_MOUNTS_TOOLTIP_SELECTION"] )
	
	for _, mountType in ipairs( { "ground", "flying", "water" } ) do
		
		local mode = ArkInventory.Localise[string.upper( string.format( "LDB_MOUNTS_%s", mountType ) )]
		local total = ArkInventory.LDB.Companion.GetTotal( companionType, mountType )
		
		if total < 1 then
			
			self:AddDoubleLine( mode, ArkInventory.Localise["LDB_COMPANION_NONE"], 1, 1, 1, 1, 0, 0 )
			
		else
	
			local selected = ArkInventory.db.char.option.ldb.mounts[mountType].selected
			local count = ArkInventory.LDB.Companion.GetSelectedCount( selected )
			
			if count == 0 then
				
				-- random all
				self:AddDoubleLine( mode, ArkInventory.Localise["RANDOM"], 1, 1, 1, 1, 1, 1 )
			
			else
				
				if count > 1 then
					
					-- random selection
					self:AddDoubleLine( mode, string.format( "%s (%s/%s)", ArkInventory.Localise["RANDOM"], count, total ), 1, 1, 1, 1, 1, 1 )
					
				else
					
					-- just the one
					for k, v in pairs( selected ) do
						if v then
							local name = GetSpellInfo( k )
							self:AddDoubleLine( mode, name, 1, 1, 1, 1, 1, 1 )
						end
					end
					
				end
				
			end
			
		end
		
	end
	
end

function ArkInventory.LDB.Mounts:OnClick( button )
	
	if button == "RightButton" then
		
		ArkInventory.MenuLDBMountsOpen( self )
		
	else
		
		local companionType = "MOUNT"
		
		if GetNumCompanions( companionType ) == 0 then return end
		
		if IsMounted( ) then
			
			if IsFlying( ) then
				if not ArkInventory.db.char.option.ldb.mounts.flying.dismount then
					ArkInventory.OutputWarning( ArkInventory.Localise["LDB_MOUNTS_FLYING_DISMOUNT_WARNING"] )
				else
					Dismount( )
				end
			else
				Dismount( )
			end
			
			return
			
		end
		
		ArkInventory.LDB.Companion.GetUsable( companionType, true, IsModifiedClick( ) )
		
		if #companionTable == 0 then
			-- no mounts
		elseif #companionTable == 1 then
			CallCompanion( companionType, companionTable[1] )
		else
			ArkInventory.LDB.Companion.GetUsable( companionType )
			CallCompanion( companionType, companionTable[random( 1, #companionTable )] )
		end
		
	end
	
end

function ArkInventory.LDB.Mounts.Cleanup( )
	
	local companionType = "MOUNT"
	
	local companionData = ArkInventory.Const.CompanionData
	
	-- remove any selected companions we no longer have
	for _, mountType in pairs( { "flying", "ground", "water" } ) do
		local selected = ArkInventory.db.char.option.ldb.mounts[mountType].selected
		for k, v in pairs( selected ) do
			if v and not companionData[k] then
				selected[k] = false
			end
		end
	end
	
	-- if all companions are selected then deselect them all
	for _, mountType in pairs( { "flying", "ground", "water" } ) do
		
		local selected = ArkInventory.db.char.option.ldb.mounts[mountType].selected
		local n1 = ArkInventory.LDB.Companion.GetTotal( companionType, mountType )
		local n2 = ArkInventory.LDB.Companion.GetSelectedCount( selected )
		
		--ArkInventory.Output( mountType, " / ", n1, " / ", n2, " / ", selected)
		
		if n1 == n2 then
			table.wipe( selected )
		end
		
	end
	
end


function ArkInventory.LDB.Companion.IsFlyable( )

	local result = IsFlyableArea( )
	
	--ArkInventory.Output( result, " / ", GetRealZoneText( ), " / ", GetWintergraspWaitTime( ) )
	
	if result and GetRealZoneText( ) == ArkInventory.Localise["WOW_ZONE_WINTERGRASP"] and not GetWintergraspWaitTime( ) then
		--ArkInventory.Output( "battle in progress, no flying allowed" )
		result = false
	end
	
	--ArkInventory.Output( result, " / ", GetRealZoneText( ), " / ", " / ", GetWintergraspWaitTime( ) )
	
	return result
	
end

function ArkInventory.LDB.Companion.GetAvailable( companionType, ignoreActive, mountType )
	
	-- gather all usable companions
	
	table.wipe( companionTable )
	
	local n = GetNumCompanions( companionType )
	if n == 0 then return end
	
	local selected
	
	if mountType then
		selected = ArkInventory.db.char.option.ldb.mounts[mountType].selected
	else
		selected = ArkInventory.db.char.option.ldb.pets.selected
	end
	
	if ArkInventory.LDB.Companion.GetSelectedCount( selected ) == 0 then
		selected = nil
	end
	
	local count = 0
	
	for creatureIndex = 1, n do
		
		local companionID, companionName, companionSpellID, texture, active = GetCompanionInfo( companionType, creatureIndex )
		
		if ( not active or ignoreActive ) and ( ( not selected ) or ( selected and selected[companionSpellID] ) ) then
			
			local companionData = ArkInventory.Const.CompanionData[companionSpellID]
			local ok = false
			
			if ArkInventory.IsCataclysm then
				
				ok = IsUsableSpell( companionSpellID )
					
				if ok and mountType then
					ok = companionData.usable[mountType] and companionData.speed[mountType]
				end
				
			else
				
				if mountType then
					
					-- speed check for mounts
					
					local speed = companionData.usable[mountType] and companionData.speed[mountType]
					
					if speed and ( speed == 0 or speed >= ArkInventory.db.char.option.ldb.mounts[mountType].min ) then
						ok = true
					--else
						--ArkInventory.Output( "ignoring ", companionName, ", does not meet minimum speed (", ArkInventory.db.char.option.ldb.mounts[mountType].min, ") or is not the requested type (", mountType, ")" )
					end
					
				else
					
					ok = true
					
				end
				
				if ok and ( companionData and companionData.r ) and ( not selected ) then
					
					ok = false
					
					-- has a zone based restriction
					local zone = true
					if companionData.r.zone then
						zone = false
						--ArkInventory.Output( "zone [", companionData.r.zone, "] == [", GetRealZoneText( ), "]")
						for k in string.gmatch( companionData.r.zone, "[^,]+") do
							if GetRealZoneText( ) == ( ArkInventory.Localise[k] or "" ) then
								zone = true
								break
							end
						end
						--if not zone then
							--ArkInventory.Output( "ignoring ", companionLink, ", not in correct zone" )
						--end
					end
					
					-- requires an item based reagent
					local item = true
					if companionData.r.item then
						item = false
						if GetItemCount( companionData.r.item, false, true ) > 0 then
							item = true
						end
						--if not item then
							--ArkInventory.Output( "ignoring ", companionLink, ", no reagent found" )
						--end
					end
				
					if zone and item then
						ok = true
					else
						--ArkInventory.Output( "restricted ", creatureIndex, " / ", companionID, " ", companionLink )
					end
					
				end
				
			end
			
			if ok then
				count = count + 1
				companionTable[count] = creatureIndex
			end
			
		end
		
	end
	
end

function ArkInventory.LDB.Companion.GetSelectedCount( selected )
	local count = 0				
	for k, v in pairs( selected ) do
		if v then count = count + 1 end
	end
	return count
end

function ArkInventory.LDB.Companion.GetUsable( companionType, ignoreActive, forceGround )
	
	table.wipe( companionTable )
	
	if companionType == "CRITTER" then
		return ArkInventory.LDB.Companion.GetAvailable( companionType, ignoreActive )
	end
	
	if IsSwimming( ) then
		--ArkInventory.Output( "water mount" )
		ArkInventory.LDB.Companion.GetAvailable( companionType, ignoreActive, "water" )
		if #companionTable > 0 then return "water" end
	end
	
	if ArkInventory.LDB.Companion.IsFlyable( ) and ( not forceGround ) then
		ArkInventory.LDB.Companion.GetAvailable( companionType, ignoreActive, "flying" )
		if #companionTable > 0 then return "flying" end
	end
	
	--ArkInventory.Output( "ground mount" )
	ArkInventory.LDB.Companion.GetAvailable( companionType, ignoreActive, "ground" )
	if #companionTable > 0 then return "ground" end
	
end

function ArkInventory.LDB.Companion.GetTotal( companionType, mountType )
	
	local n = GetNumCompanions( companionType )
	
	if companionType == "CRITTER" then
		return n
	end
	
	local count = 0
	
	for companionIndex = 1, n do
		
		local companionID, companionName, companionSpellID, texture, active = GetCompanionInfo( companionType, companionIndex )
		local companionData = ArkInventory.Const.CompanionData[companionSpellID]
		
		if companionData and companionData.usable[mountType] then
			count = count + 1
		end
		
	end
	
	return count
	
end
