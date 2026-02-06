function ArkInventory.EraseSavedData( player_id, loc_id, silent )
	
	--ArkInventory.Output( "EraseSavedData( ", player_id, ", ", loc_id, ", ", silent, " )" )
	
	for p, pd in pairs( ArkInventory.db.realm.player.data ) do
		
		if player_id == nil or string.lower( p ) == string.lower( player_id ) then
			
			for l, ld in pairs( pd.location ) do
				
				if loc_id == nil or l == loc_id then
					
					ArkInventory.Frame_Main_Hide( l )
					
					ld["slot_count"] = 0
					
					for b, bd in pairs( ld.bag ) do
						ArkInventory.Table.Clean( bd )
						bd.status = ArkInventory.Const.Bag.Status.Unknown
						bd.type = ArkInventory.Const.Slot.Type.Unknown
						bd.count = 0
						bd.empty = 0
						bd.slot = { }
					end
					
					ArkInventory.Frame_Main_DrawStatus( l, ArkInventory.Const.Window.Draw.Recalculate )
					if not silent then
						ArkInventory.Output( "Saved ", string.lower( ArkInventory.Global.Location[l].Name ), " data for ", pd.info.name, " has been erased" )
					end
					
				end
				
			end
			
			
			if string.lower( p ) == string.lower( UnitName( "player" ) ) then
				ArkInventory.ScanLocation( l )
			end
			
			if loc_id == ArkInventory.Const.Location.Vault and pd.info.guild_id and pd.info.class ~= "GUILD" then
				ArkInventory.EraseSavedData( pd.info.guild_id, loc_id, silent )
			end
			
		end
		
	end
	
	ArkInventory.PlayerInfoSet( )
	
end

function ArkInventory.Table.Sum( tbl, fcn )
	local r = 0
	for k, v in pairs( tbl ) do
		r = r + ( fcn( v ) or 0 )
	end
	return r
end

function ArkInventory.Table.Max( tbl, fcn )
	local r = nil
	for k, v in pairs( tbl ) do
		if not r then
			r = ( fcn( v ) or 0 )
		else
			if ( fcn( v ) or 0 ) > r then
				r = ( fcn( v ) or 0 )
			end
		end
	end
	return r
end

function ArkInventory.Table.Elements( tbl )
	-- #table only returns the number of elements where the table keys are numeric and does not take into account missing values
	if tbl and type( tbl ) == "table" then
		local r = 0
		for _ in pairs( tbl ) do
			r = r + 1
		end
		return r
	end
end

function ArkInventory.Table.IsEmpty( tbl )
	-- #table only returns the number of elements where the table keys are numeric and does not take into account missing values
	if tbl and type( tbl ) == "table" then
		for _ in pairs( tbl ) do
			return false
		end
		return true
	end
end

function ArkInventory.Table.Clean( tbl, key, full )

	-- tbl = table to be cleaned

	-- key = a specific key you want cleaned (nil for all keys)

	-- sub (true) = if a value is a table then clean it as well
	-- sub (false) = only clean the values from this table

	-- full (true) = if a value is a table then nil it as well
	-- full (false) = if a value is a table then leave the skeleton there
	
	if type( tbl ) ~= "table" then
		return
	end
	
	local sub = true
	
	for k, v in pairs( tbl ) do
		
		if key == nil or key == k then
		
			if type( v ) == "table" then
			
				if sub then
					--ArkInventory.Output( "cleaning subtable ", k )
					ArkInventory.Table.Clean( v, nil, full )
				end
				
				if full then
					--ArkInventory.Output( "erasing subtable ", k )
					tbl[k] = nil
				end
				
			else
			
				--ArkInventory.Output( "erasing value ", k )
				tbl[k] = nil

			end
			
		end
		
	end

end

local function spairs_iter( a )
	a.idx = a.idx + 1
	local k = a[a.idx]
	if k ~= nil then
		return k, a.tbl[k]
	end
	--table.wipe( a )
	a.tbl = nil
end

function ArkInventory.spairs( tbl, cf )
	
	if type( tbl ) ~= "table" then return end
	
	local a = { }
	local c = 0
	
	for k in pairs( tbl ) do
		c = c + 1
		a[c] = k
	end
	
	table.sort( a, cf )
	
	a.idx = 0
	a.tbl = tbl
	
	return spairs_iter, a
	
end

function ArkInventory.PlayerInfoSet( )
	
	--ArkInventory.OutputDebug( "PlayerInfoSet" )
	
	local r = GetRealmName( )
	local f, f2 = UnitFactionGroup( "player" )
	local n = UnitName( "player" )
	
	ArkInventory.Global.Me = ArkInventory.db.realm.player.data[n]
	
	local p = ArkInventory.Global.Me.info
	
	p["player_id"] = n
	
	p["realm"] = r
	p["faction"] = f
	p["faction_local"] = f2
	p["name"] = n
	
	
	-- WARNING, most of this stuff is not available upon first login, even when the mod gets to OnEnabled (ui reloads are fine), and some are not available on logout
	
	p["class_local"], p["class"] = UnitClass( "player" )
	p["level"] = UnitLevel( "player" )
	p["race_local"], p["race"] = UnitRace( "player" )
	p["gender"] = UnitSex( "player" )
	
	
	--ArkInventory.Output( "IsInGuild=[", IsInGuild( ), "], g=[", p.guild, "]" )
	p["guild"] = GetGuildInfo( "player" )
	if p.guild then
		p["guild_id"] = string.format( "%s%s", ArkInventory.Const.GuildTag, p.guild )
	else
		p["guild"] = nil
		p["guild_id"] = nil
	end
	
	local m = GetMoney( )
	if m > 0 then  -- returns 0 on logout so dont wipe the current value
		p["money"] = m
	end

	
	if p.guild then
	
		local n = string.format( "%s%s", ArkInventory.Const.GuildTag, p.guild )
		local g = ArkInventory.db.realm.player.data[n].info
		
		g["player_id"] = n
		
		g["realm"] = p.realm
		g["faction"] = p.faction
		g["faction_local"] = p.faction_local
		g["name"] = p.guild
		
		g["guild"] = p.guild
		g["guild_id"] = p.guild_id
		
		g["level"] = 0
		
		g["money"] = GetGuildBankMoney( )
		
		g["class_local"], g["class"] = GUILD, "GUILD"
		
	end
	
	return p

end

function ArkInventory.PlayerInfoGet( id )
	
	if id == nil then
		return
	end
	
	return ArkInventory.db.realm.player.data[id]
	
end

function ArkInventory:LISTEN_STORAGE_EVENT( msg, arg1, arg2, arg3, arg4 )

	--ArkInventory.OutputDebug( "LISTEN_STORAGE_EVENT( ", arg1, ", ", arg2, ", ", arg3, ", ", arg4, " )" )

	if arg1 == ArkInventory.Const.Event.BagUpdate then
		
		--ArkInventory.OutputDebug( "BAG_UPDATE( ", arg2, ", [", arg4, "] )" )
		ArkInventory.Frame_Main_Generate( arg2, arg4 )
		
	else
		
		ArkInventory.OutputError( "Unknown Storage Event Code: ", arg1 )
		
	end
	
end


function ArkInventory:LISTEN_PLAYER_ENTER( )

	--ArkInventory.OutputDebug( "LISTEN_PLAYER_ENTER" )
	
	ArkInventory.PlayerInfoSet( )
	
end

function ArkInventory:LISTEN_PLAYER_LEAVE( )

	--ArkInventory.OutputDebug( "LISTEN_PLAYER_LEAVE" )
	
	ArkInventory.Frame_Main_Hide( )
	
	ArkInventory.PlayerInfoSet( )
	
	for loc_id in pairs( ArkInventory.Global.Location ) do
		if not ArkInventory.LocationIsSaved( loc_id ) then
			ArkInventory.EraseSavedData( ArkInventory.Global.Me.info.player_id, loc_id, not ArkInventory.db.profile.option.location[loc_id].notifyerase )
		end
	end
	
end

function ArkInventory:LISTEN_PLAYER_MONEY( )

	--ArkInventory.Output( "PLAYER_MONEY" )

	ArkInventory.PlayerInfoSet( )
	
	-- set saved money amount here as well
	ArkInventory.db.realm.player.data[UnitName( "player" )].info.money = GetMoney( )
	
	ArkInventory.LDB.Money:Update( )
	
end

function ArkInventory:LISTEN_PLAYER_SKILLS( )

	--ArkInventory.OutputDebug( "SKILL_LINES_CHANGED" )
	
	ArkInventory.ScanProfessions( )
	
end


function ArkInventory:LISTEN_COMBAT_ENTER( )
	
	--ArkInventory.OutputDebug( "LISTEN_COMBAT_ENTER" )
	
	ArkInventory.Global.Mode.Combat = true
	
	if ArkInventory.db.global.option.auto.close.combat then
		ArkInventory.Frame_Main_Hide( )
	end
	
end

function ArkInventory:LISTEN_COMBAT_LEAVE( )
	
	--ArkInventory.OutputDebug( "LISTEN_COMBAT_LEAVE" )
	
	ArkInventory.Global.Mode.Combat = false
	
	for loc_id in pairs( ArkInventory.Global.Location ) do
		if ArkInventory.LocationOptionGet( loc_id, "slot", "cooldown", "show" ) and not ArkInventory.LocationOptionGet( loc_id, "slot", "cooldown", "combat" )  then
			ArkInventory.Frame_Main_Generate( loc_id, ArkInventory.Const.Window.Draw.Refresh )
		end
	end
	
end


function ArkInventory:LISTEN_BAG_UPDATE_BUCKET( bagTable )
	
	--ArkInventory.Output( "LISTEN_BAG_UPDATE_BUCKET( ", bagTable, " )" )
	
	-- bagTable[bag_id] = true

	local bag_changed = false
	
	for blizzard_id in pairs( bagTable ) do
		ArkInventory.Scan( blizzard_id )
		if ArkInventory.BagID_Internal( blizzard_id ) == ArkInventory.Const.Location.Bag then
			bag_changed = true
		end
		ArkInventory.RestackResume( ArkInventory.BagID_Internal( blizzard_id ) )
	end

	-- re-scan empty bag slots to wipe their data - no events are triggered when you move a bag from one bag slot into an empty bag slot (for the empty slot, new slot is fine)
	if bag_changed then
		for _, bag_id in pairs( ArkInventory.Global.Location[ArkInventory.Const.Location.Bag].Bags ) do
			if GetContainerNumSlots( bag_id ) == 0 then
				ArkInventory.ScanBag( bag_id )
			end
		end
	end

	
 	-- instant sorting enabled
	for loc_id in pairs( ArkInventory.Global.Location ) do
		if ArkInventory.LocationOptionGet( loc_id, "sort", "instant" ) then
			ArkInventory.Frame_Main_Generate( loc_id, ArkInventory.Const.Window.Draw.Recalculate )
		end
	end
	
	ArkInventory.LDB.Bags:Update( )
	
end

function ArkInventory:LISTEN_BAG_UPDATE( event, blizzard_id )
	
	--ArkInventory.Output( "LISTEN_BAG_UPDATE( ", blizzard_id, " )" )
	
	ArkInventory:SendMessage( "LISTEN_BAG_UPDATE_BUCKET", blizzard_id )
	
end

function ArkInventory:LISTEN_BAG_LOCK( event, arg1, arg2 )

	--ArkInventory.OutputDebug( "LISTEN_BAG_LOCK( ", arg1, ",", arg2, " )" )

	if not arg2 then
	
		-- inventory lock
		
		for blizzard_id = 1, NUM_BAG_SLOTS do
			local slotName = string.format( "Bag%sSlot", blizzard_id - 1 )
			if arg1 == GetInventorySlotInfo( slotName ) then
				local loc_id, bag_id = ArkInventory.BagID_Internal( blizzard_id )
				ArkInventory.ObjectLockChanged( loc_id, bag_id, nil )
			end
		end
	
	else
	
		if arg1 == BANK_CONTAINER then
		
			local count = GetContainerNumSlots( BANK_CONTAINER )
	
			if arg2 <= count then
				-- item lock
				local loc_id, bag_id = ArkInventory.BagID_Internal( arg1 )
				ArkInventory.ObjectLockChanged( loc_id, bag_id, arg2 )
				--ArkInventory.RestackResume( loc_id )
			else
				-- bag lock
				local loc_id, bag_id = ArkInventory.BagID_Internal( arg2 - count + NUM_BAG_SLOTS )
				ArkInventory.ObjectLockChanged( loc_id, bag_id, nil )
			end

		else
	
			-- item lock
			local loc_id, bag_id = ArkInventory.BagID_Internal( arg1 )
			ArkInventory.ObjectLockChanged( loc_id, bag_id, arg2 )
			--ArkInventory.RestackResume( loc_id )
			
		end
	
	end

end

function ArkInventory:LISTEN_CHANGER_UPDATE_BUCKET( arg1 )

	--ArkInventory.OutputDebug( "LISTEN_CHANGER_UPDATE_BUCKET( ", arg1, " )" )
	
	-- arg1 = table in the format loc_id_id=true so we need to loop through them

	for k in pairs( arg1 ) do
		ArkInventory.Frame_Changer_Update( k )
	end
	
end


function ArkInventory:LISTEN_BANK_ENTER( )
	
	--ArkInventory.OutputDebug( "LISTEN_BANK_ENTER" )
	
	local loc_id = ArkInventory.Const.Location.Bank
	
	ArkInventory.Global.Mode.Bank = true
	ArkInventory.Global.Location[loc_id].isOffline = false
	
	ArkInventory.ScanLocation( loc_id )
	
	ArkInventory.Frame_Main_DrawStatus( loc_id, ArkInventory.Const.Window.Draw.Refresh )
	
	if ArkInventory.LocationIsControlled( loc_id ) then
		ArkInventory.Frame_Main_Show( loc_id )
	end
	
	if ArkInventory.db.global.option.auto.open.bank and ArkInventory.LocationIsControlled( ArkInventory.Const.Location.Bag ) then
		ArkInventory.Frame_Main_Show( ArkInventory.Const.Location.Bag )
	end
	
	ArkInventory.Frame_Main_Generate( loc_id )
	
end

function ArkInventory:LISTEN_BANK_LEAVE( )
	
	--ArkInventory.Output( "LISTEN_BANK_LEAVE" )
	
	ArkInventory:SendMessage( "LISTEN_BANK_LEAVE_BUCKET" )
	
end

function ArkInventory:LISTEN_BANK_LEAVE_BUCKET( )
	
	--ArkInventory.Output( "LISTEN_BANK_LEAVE_BUCKET" )
	
	local loc_id = ArkInventory.Const.Location.Bank
	
	ArkInventory.Global.Mode.Bank = false
	ArkInventory.Global.Location[loc_id].isOffline = true
	
	ArkInventory.Frame_Main_DrawStatus( loc_id, ArkInventory.Const.Window.Draw.Refresh )
	
	if ArkInventory.LocationIsControlled( loc_id ) then
		ArkInventory.Frame_Main_Hide( loc_id )
	end
	
	if ArkInventory.db.global.option.auto.close.bank and ArkInventory.LocationIsControlled( ArkInventory.Const.Location.Bag ) then
		ArkInventory.Frame_Main_Hide( ArkInventory.Const.Location.Bag )
	end
	
	if not ArkInventory.LocationIsSaved( loc_id ) then
		ArkInventory.EraseSavedData( ArkInventory.Global.Me.info.player_id, loc_id, not ArkInventory.db.profile.option.location[loc_id].notifyerase )
	end
	
end

function ArkInventory:LISTEN_BANK_UPDATE( event, arg1 )

	-- player changed a bank bag or item

	--ArkInventory.OutputDebug( "LISTEN_BANK_UPDATE( ", arg1, " ) " )

	local count = GetContainerNumSlots( BANK_CONTAINER )
	
	if arg1 <= count then
		-- item was changed
		ArkInventory:SendMessage( "LISTEN_BAG_UPDATE_BUCKET", BANK_CONTAINER )
	else
		-- bag was changed
		ArkInventory:SendMessage( "LISTEN_BAG_UPDATE_BUCKET", arg1 - count + NUM_BAG_SLOTS )
	end
	
end

function ArkInventory:LISTEN_BANK_SLOT( )

	-- player just purchased a bank bag slot
	
	--ArkInventory.OutputDebug( "LISTEN_BANK_SLOT" )
	
	for x = NUM_BAG_SLOTS + 1, NUM_BAG_SLOTS + NUM_BANKBAGSLOTS do
		ArkInventory:SendMessage( "LISTEN_BAG_UPDATE_BUCKET", x )
	end

end


function ArkInventory:LISTEN_VAULT_ENTER( )

	--ArkInventory.Output( "LISTEN_VAULT_ENTER" )

	local loc_id = ArkInventory.Const.Location.Vault

	ArkInventory.Global.Mode.Vault = true
	ArkInventory.Global.Location[loc_id].isOffline = false
	
	ArkInventory.PlayerInfoSet( )

	ArkInventory.ScanVaultHeader( )
	
	QueryGuildBankTab( GetCurrentGuildBankTab( ) or 1 )
	
	local cp = ArkInventory.Global.Me

	ArkInventory.Frame_Main_DrawStatus( loc_id, ArkInventory.Const.Window.Draw.Refresh )
	
	if ArkInventory.LocationIsControlled( loc_id ) then
		ArkInventory.Frame_Main_Show( loc_id )
		ArkInventory.Frame_Main_DrawStatus( loc_id, ArkInventory.Const.Window.Draw.Recalculate )
	end
	
	if ArkInventory.db.global.option.auto.open.vault and ArkInventory.LocationIsControlled( ArkInventory.Const.Location.Bag ) then
		ArkInventory.Frame_Main_Show( ArkInventory.Const.Location.Bag )
	end
	
end

function ArkInventory:LISTEN_VAULT_LEAVE( )

	--ArkInventory.Output( "LISTEN_VAULT_LEAVE" )
	
	ArkInventory:SendMessage( "LISTEN_VAULT_LEAVE_BUCKET" )
	
end

function ArkInventory:LISTEN_VAULT_LEAVE_BUCKET( )

	--ArkInventory.Output( "LISTEN_VAULT_LEAVE_BUCKET" )
	
	local loc_id = ArkInventory.Const.Location.Vault

	ArkInventory.Global.Mode.Vault = false
	ArkInventory.Global.Location[loc_id].isOffline = true

	ArkInventory.Frame_Main_Generate( loc_id, ArkInventory.Const.Window.Draw.Refresh )
	
	if ArkInventory.LocationIsControlled( loc_id ) then
		ArkInventory.Frame_Main_Hide( loc_id )
	end
	
	if ArkInventory.db.global.option.auto.close.vault and ArkInventory.LocationIsControlled( ArkInventory.Const.Location.Bag ) then
		ArkInventory.Frame_Main_Hide( ArkInventory.Const.Location.Bag )
	end

	if not ArkInventory.LocationIsSaved( loc_id ) then
		ArkInventory.EraseSavedData( ArkInventory.Global.Me.info.player_id, loc_id, not ArkInventory.db.profile.option.location[loc_id].notifyerase )
	end
	
end

function ArkInventory:LISTEN_VAULT_UPDATE_BUCKET( )
	
	--ArkInventory.Output( "LISTEN_VAULT_UPDATE_BUCKET" )
	
	local loc_id = ArkInventory.Const.Location.Vault

	ArkInventory.ScanVault( )
	ArkInventory.ScanVaultHeader( )

	ArkInventory.RestackResume( ArkInventory.Const.Location.Vault )
	
 	-- instant sorting enabled
	if ArkInventory.LocationOptionGet( loc_id, "sort", "instant" ) then
		ArkInventory.Frame_Main_Generate( loc_id, ArkInventory.Const.Window.Draw.Recalculate )
	end
	
end

function ArkInventory:LISTEN_VAULT_UPDATE( event, ... )
	
	--local tab = ...
	--ArkInventory.Output( "LISTEN_VAULT_UPDATE: ", tab )
	
	ArkInventory:SendMessage( "LISTEN_VAULT_UPDATE_BUCKET" )
	
end

function ArkInventory:LISTEN_VAULT_LOCK( event, ... )

	--local tab = ...
	--ArkInventory.Output( "LISTEN_VAULT_LOCK: ", tab )
	
	local loc_id = ArkInventory.Const.Location.Vault
	local bag_id = GetCurrentGuildBankTab( )
	
	for slot_id = 1, ArkInventory.Global.Location[loc_id].maxSlot[bag_id] or 0 do
		ArkInventory.ObjectLockChanged( loc_id, bag_id, slot_id )
	end

	--ArkInventory.RestackResume( ArkInventory.Const.Location.Vault )
	
end

function ArkInventory:LISTEN_VAULT_MONEY( )

	--ArkInventory.Output( "LISTEN_VAULT_MONEY" )

	local loc_id = ArkInventory.Const.Location.Vault
	
	ArkInventory.PlayerInfoSet( )
	
end

function ArkInventory:LISTEN_VAULT_TABS( )
	
	--ArkInventory.Output( "LISTEN_VAULT_TABS" )
	
	local loc_id = ArkInventory.Const.Location.Vault
	if not ArkInventory.Global.Location[loc_id].isOffline then
		-- ignore pre vault entrance events
		ArkInventory.ScanVaultHeader( )
	end
	
end

function ArkInventory:LISTEN_VAULT_LOG( event, ... )

	--local tab = ...
	--ArkInventory.OutputDebug( "LISTEN_VAULT_LOG: ", tab )
	
	ArkInventory.Frame_Vault_Log_Update( )
	
end

function ArkInventory:LISTEN_VAULT_INFO( event, ... )

	--local tab = ...
	--ArkInventory.Output( "LISTEN_VAULT_INFO: ", tab )
	
	ArkInventory.Frame_Vault_Info_Update( )
	
end


function ArkInventory:LISTEN_INVENTORY_CHANGE_BUCKET( )
	
	--ArkInventory.OutputDebug( "LISTEN_INVENTORY_CHANGE_BUCKET" )
	
	local loc_id = ArkInventory.Const.Location.Wearing
	
	ArkInventory.ScanLocation( loc_id )
	
end

function ArkInventory:LISTEN_INVENTORY_CHANGE( event, arg1, arg2 )
	
	--ArkInventory.OutputDebug( "LISTEN_INVENTORY_CHANGE( ", arg1, ", ", arg2, " ) " )

	if arg1 == "player" then
		ArkInventory:SendMessage( "LISTEN_INVENTORY_CHANGE_BUCKET" )
	end
	
end


function ArkInventory:LISTEN_MAIL_ENTER( event, ... )
	
	--ArkInventory.Output( "MAIL_SHOW" )
	
	ArkInventory.Global.Mode.Mail = true
	
	local BACKPACK_WAS_OPEN = ArkInventory.Frame_Main_Get( ArkInventory.Const.Location.Bag ):IsVisible( )
	
	MailFrame_OnEvent( MailFrame, event, ... )
	
	local loc_id = ArkInventory.Const.Location.Mail
	ArkInventory.ScanLocation( loc_id )
	ArkInventory.Frame_Main_DrawStatus( loc_id, ArkInventory.Const.Window.Draw.Refresh )
	
	if ArkInventory.LocationIsControlled( loc_id ) then
		ArkInventory.Frame_Main_Show( loc_id )
	end
	
	if ArkInventory.LocationIsControlled( ArkInventory.Const.Location.Bag ) then
		-- blizzard auto-opens the backpack when you open the mailbox
		if not ArkInventory.db.global.option.auto.open.mail and not BACKPACK_WAS_OPEN then
			-- so we need to close it if we didnt already have it open
			ArkInventory.Frame_Main_Hide( ArkInventory.Const.Location.Bag )
		end
	end
	
	ArkInventory.Frame_Main_Generate( loc_id )
	
end

function ArkInventory:LISTEN_MAIL_LEAVE( )
	
	--ArkInventory.Output( "MAIL_CLOSED" )
	
	ArkInventory:SendMessage( "LISTEN_MAIL_LEAVE_BUCKET" )
	
end

function ArkInventory:LISTEN_MAIL_LEAVE_BUCKET( )
	
	--ArkInventory.Output( "MAIL_CLOSED_BUCKET" )
	
	ArkInventory.Global.Mode.Mail = false
	
	local loc_id = ArkInventory.Const.Location.Mail
	
	ArkInventory.Frame_Main_Generate( loc_id, ArkInventory.Const.Window.Draw.Refresh )
	
	if ArkInventory.LocationIsControlled( loc_id ) then
		ArkInventory.Frame_Main_Hide( loc_id )
	end
	
	if ArkInventory.db.global.option.auto.close.mail and ArkInventory.LocationIsControlled( ArkInventory.Const.Location.Bag ) then
		ArkInventory.Frame_Main_Hide( ArkInventory.Const.Location.Bag )
	end
	
	if not ArkInventory.LocationIsSaved( loc_id ) then
		ArkInventory.EraseSavedData( ArkInventory.Global.Me.info.player_id, loc_id, not ArkInventory.db.profile.option.location[loc_id].notifyerase )
	end
	
end

function ArkInventory:LISTEN_MAIL_UPDATE_BUCKET( )

	--ArkInventory.OutputDebug( "LISTEN_MAIL_UPDATE_BUCKET" )

	local loc_id = ArkInventory.Const.Location.Mail
	
	ArkInventory.ScanLocation( loc_id )
	
	ArkInventory.Frame_Main_Generate( loc_id, ArkInventory.Const.Window.Draw.Recalculate )
	
end

function ArkInventory:LISTEN_MAIL_UPDATE( )

	--ArkInventory.OutputDebug( "MAIL_UPDATE" )
	
	ArkInventory:SendMessage( "LISTEN_MAIL_UPDATE_BUCKET" )
	
end


function ArkInventory:LISTEN_TRADE_ENTER( )

	--ArkInventory.OutputDebug( "LISTEN_TRADE_ENTER" )
	
	if ArkInventory.db.global.option.auto.open.trade and ArkInventory.LocationIsControlled( ArkInventory.Const.Location.Bag ) then
		ArkInventory.Frame_Main_Show( ArkInventory.Const.Location.Bag )
	end
	
end

function ArkInventory:LISTEN_TRADE_LEAVE( )

	--ArkInventory.OutputDebug( "LISTEN_TRADE_LEAVE" )
	
	if ArkInventory.db.global.option.auto.close.trade and ArkInventory.LocationIsControlled( ArkInventory.Const.Location.Bag ) then
		ArkInventory.Frame_Main_Hide( ArkInventory.Const.Location.Bag )
	end
	
end


function ArkInventory:LISTEN_AUCTION_ENTER( )
	
	--ArkInventory.Output( "LISTEN_AUCTION_ENTER" )
	
	if ArkInventory.db.global.option.auto.open.auction and ArkInventory.LocationIsControlled( ArkInventory.Const.Location.Bag ) then
		ArkInventory.Frame_Main_Show( ArkInventory.Const.Location.Bag )
	end
	
end

function ArkInventory:LISTEN_AUCTION_LEAVE( )
	
	--ArkInventory.Output( "LISTEN_AUCTION_LEAVE" )
	
	if ArkInventory.db.global.option.auto.close.auction and ArkInventory.LocationIsControlled( ArkInventory.Const.Location.Bag ) then
		ArkInventory.Frame_Main_Hide( ArkInventory.Const.Location.Bag )
	end
	
end


function ArkInventory:LISTEN_MERCHANT_ENTER( event, ... )

	--ArkInventory.Output( "LISTEN_MERCHANT_ENTER" )
	
	ArkInventory.Global.Mode.Merchant = true
	
	local BACKPACK_WAS_OPEN = ArkInventory.Frame_Main_Get( ArkInventory.Const.Location.Bag ):IsVisible( )
	
	MerchantFrame_OnEvent( MerchantFrame, event, ... )
	
	if ArkInventory.LocationIsControlled( ArkInventory.Const.Location.Bag ) then
		-- blizzard auto-opens the backpack when you talk to a merchant
		if not ArkInventory.db.global.option.auto.open.merchant and not BACKPACK_WAS_OPEN then
			-- so we need to close it if we didnt already have it open
			ArkInventory.Frame_Main_Hide( ArkInventory.Const.Location.Bag )
		end
	end
	
end

function ArkInventory:LISTEN_MERCHANT_LEAVE( )

	--ArkInventory.Output( "LISTEN_MERCHANT_LEAVE" )
	
	ArkInventory.Global.Mode.Merchant = false
	
	if ArkInventory.db.global.option.auto.close.merchant and ArkInventory.LocationIsControlled( ArkInventory.Const.Location.Bag ) then
		ArkInventory.Frame_Main_Hide( ArkInventory.Const.Location.Bag )
	end
	
end

function ArkInventory:LISTEN_COMPANION_UPDATE_BUCKET( )

	--ArkInventory.Output( "LISTEN_COMPANION_UPDATE_BUCKET" )
	
	ArkInventory.CompanionDataCorrect( )
	
	local loc_id = ArkInventory.Const.Location.Pet
	ArkInventory.ScanLocation( loc_id )
	ArkInventory.Frame_Main_Generate( loc_id, ArkInventory.Const.Window.Draw.Recalculate )
	
	local loc_id = ArkInventory.Const.Location.Mount
	ArkInventory.ScanLocation( loc_id )
	ArkInventory.Frame_Main_Generate( loc_id, ArkInventory.Const.Window.Draw.Recalculate )
	
end

function ArkInventory:LISTEN_COMPANION_UPDATE( )
	ArkInventory:SendMessage( "LISTEN_COMPANION_UPDATE_BUCKET", 1 )
end

function ArkInventory:LISTEN_CURRENCY_UPDATE( )

	--ArkInventory.Output( "LISTEN_CURRENCY_UPDATE" )
	
	local loc_id = ArkInventory.Const.Location.Token
	
	ArkInventory.ScanLocation( loc_id )
	
	ArkInventory.Frame_Main_Generate( loc_id, ArkInventory.Const.Window.Draw.Recalculate )
	
	ArkInventory.Frame_Status_Update_Tracking( )
	
	ArkInventory.LDB.Tracking_Currency:Update( )
	
end

function ArkInventory:LISTEN_EQUIPMENT_SETS_CHANGED( )
	
	--ArkInventory.Output( "LISTEN_EQUIPMENT_SETS_CHANGED" )
	
	ArkInventory.ItemCacheClear( )
	ArkInventory.Frame_Main_Generate( nil, ArkInventory.Const.Window.Draw.Recalculate )
	
end

function ArkInventory:LISTEN_BAG_UPDATE_COOLDOWN_BUCKET( arg )
	
	for loc_id in pairs( arg ) do
		if ArkInventory.LocationOptionGet( loc_id, "slot", "cooldown", "show" ) then
			if not ArkInventory.Global.Mode.Combat or ArkInventory.LocationOptionGet( loc_id, "slot", "cooldown", "combat" ) then
				if not ArkInventory.LocationOptionGet( loc_id, "sort", "instant" ) then
					ArkInventory.Frame_Main_Generate( loc_id, ArkInventory.Const.Window.Draw.Refresh )
				end
			end
		end
	end
	
end

function ArkInventory:LISTEN_BAG_UPDATE_COOLDOWN( event, arg1 )
	
	--ArkInventory.Output( "LISTEN_BAG_UPDATE_COOLDOWN( ", arg1, " )" )
	
	if arg1 then
		local loc_id = ArkInventory.BagID_Internal( k )
		ArkInventory:SendMessage( "LISTEN_BAG_UPDATE_COOLDOWN_BUCKET", loc_id )
	else
--[[
		-- global cooldown
		for loc_id in pairs( ArkInventory.Global.Location ) do
			if ArkInventory.LocationOptionGet( loc_id, "slot", "cooldown", "global" ) then
				ArkInventory:SendMessage( "LISTEN_BAG_UPDATE_COOLDOWN_BUCKET", loc_id )
			end
		end
]]--
	end
end

function ArkInventory:LISTEN_QUEST_UPDATE_BUCKET( )
	ArkInventory.Frame_Main_Generate( nil, ArkInventory.Const.Window.Draw.Refresh )
end

function ArkInventory:LISTEN_QUEST_UPDATE( )
	ArkInventory:SendMessage( "LISTEN_QUEST_UPDATE_BUCKET", 1 )
end

function ArkInventory:LISTEN_CVAR_UPDATE( event, cvar, value )
	
	--ArkInventory.Output( event, ": ", cvar, " = ", value )
	
	if cvar == "USE_COLORBLIND_MODE" then
		ArkInventory.Frame_Main_Generate( nil, ArkInventory.Const.Window.Draw.Refresh )
		ArkInventory.LDB.Money:Update( )
	end
	
end

function ArkInventory:LISTEN_ZONE_CHANGED_BUCKET( )
	ArkInventory.LDB.Mounts:Update( )
end

function ArkInventory:LISTEN_ZONE_CHANGED( )
	ArkInventory:SendMessage( "LISTEN_ZONE_CHANGED_BUCKET", 1 )
end

function ArkInventory:LISTEN_ACTIONBAR_UPDATE_USABLE_BUCKET( )
	ArkInventory.LDB.Mounts:Update( )
end

function ArkInventory:LISTEN_ACTIONBAR_UPDATE_USABLE( event )
	ArkInventory:SendMessage( "LISTEN_ACTIONBAR_UPDATE_USABLE_BUCKET", 1 )
end

function ArkInventory:LISTEN_UNIT_POWER_BUCKET( )
	ArkInventory.LDB.Tracking_Item:Update( )
end

function ArkInventory:LISTEN_UNIT_POWER( )
	ArkInventory:SendMessage( "LISTEN_UNIT_POWER_BUCKET", 1 )
end

function ArkInventory:LISTEN_RESCAN_LOCATION_BUCKET( arg1 )
	
	--ArkInventory.Output( "LISTEN_RESCAN_LOCATION_BUCKET( ", arg1, " )" )
	
	-- arg1 = table in the format loc_id=true so we need to loop through them
	
	for k in pairs( arg1 ) do
		ArkInventory.ScanLocation( k )
	end
	
end



function ArkInventory.BagID_Blizzard( loc_id, bag_id )
	
	-- converts internal location+bag codes into blizzzard bag ids
	
	assert( loc_id ~= nil, "location is nil" )
	assert( bag_id ~= nil, "bag id is nil" )
	
	return ArkInventory.Global.Location[loc_id].Bags[bag_id]

end

function ArkInventory.BagID_Internal( blizzard_id )
	
	-- converts blizzard bag codes into storage location+bag ids
	
	assert( blizzard_id ~= nil, "blizard id is nil" )
	
	for loc_id, loc in pairs( ArkInventory.Global.Location ) do
		for bag_id, v in pairs( loc.Bags ) do
			if blizzard_id == v then
				return loc_id, bag_id
			end
		end
	end
	
	error( string.format( "unknown blizzard id [%s]", blizzard_id ) )
	
	return
	
end

function ArkInventory.BagType( blizzard_id )
	
	if blizzard_id == BACKPACK_CONTAINER then
		return ArkInventory.Const.Slot.Type.Bag
	elseif blizzard_id == KEYRING_CONTAINER then
		return ArkInventory.Const.Slot.Type.Key
	elseif blizzard_id == BANK_CONTAINER then
		return ArkInventory.Const.Slot.Type.Bag
	end
	
	local loc_id, bag_id = ArkInventory.BagID_Internal( blizzard_id )
	
	if loc_id == nil then
		return ArkInventory.Const.Slot.Type.Unknown
	elseif loc_id == ArkInventory.Const.Location.Vault then
		return ArkInventory.Const.Slot.Type.Bag
	elseif loc_id == ArkInventory.Const.Location.Mail then
		return ArkInventory.Const.Slot.Type.Mail
	elseif loc_id == ArkInventory.Const.Location.Wearing then
		return ArkInventory.Const.Slot.Type.Wearing
	elseif loc_id == ArkInventory.Const.Location.Pet then
		return ArkInventory.Const.Slot.Type.Critter
	elseif loc_id == ArkInventory.Const.Location.Mount then
		return ArkInventory.Const.Slot.Type.Mount
	elseif loc_id == ArkInventory.Const.Location.Token then
		return ArkInventory.Const.Slot.Type.Token
	end
	
	
	if ArkInventory.Global.Location[loc_id].isOffline then
		
		local cp = ArkInventory.LocationPlayerInfoGet( loc_id )
		return cp.location[loc_id].bag[bag_id].type
		
	else
		
		local h = GetInventoryItemLink( "player", ContainerIDToInventoryID( blizzard_id ) )
		
		if h and h ~= "" then
			
			local t, s = select( 8, ArkInventory.ObjectInfo( h ) )
			
			--ArkInventory.Output( "bag[", blizzard_id, "], type[", t, "], sub[", s, "], h=", h )
			
			if t == ArkInventory.Localise["WOW_ITEM_TYPE_CONTAINER"] then
				
				if s == ArkInventory.Localise["WOW_ITEM_TYPE_CONTAINER_BAG"] then
					return ArkInventory.Const.Slot.Type.Bag
				elseif s == ArkInventory.Localise["WOW_ITEM_TYPE_CONTAINER_ENCHANTING"] then
					return ArkInventory.Const.Slot.Type.Enchanting
				elseif s == ArkInventory.Localise["WOW_ITEM_TYPE_CONTAINER_ENGINEERING"] then
					return ArkInventory.Const.Slot.Type.Engineering
				elseif s == ArkInventory.Localise["WOW_ITEM_TYPE_CONTAINER_GEM"] then
					return ArkInventory.Const.Slot.Type.Gem
				elseif s == ArkInventory.Localise["WOW_ITEM_TYPE_CONTAINER_HERB"] then
					return ArkInventory.Const.Slot.Type.Herb
				elseif s == ArkInventory.Localise["WOW_ITEM_TYPE_CONTAINER_INSCRIPTION"] then
					return ArkInventory.Const.Slot.Type.Inscription
				elseif s == ArkInventory.Localise["WOW_ITEM_TYPE_CONTAINER_LEATHERWORKING"] then
					return ArkInventory.Const.Slot.Type.Leatherworking
				elseif s == ArkInventory.Localise["WOW_ITEM_TYPE_CONTAINER_MINING"] then
					return ArkInventory.Const.Slot.Type.Mining
				elseif not ArkInventory.IsCataclysm and s == ArkInventory.Localise["WOW_ITEM_TYPE_CONTAINER_SOULSHARD"] then
					return ArkInventory.Const.Slot.Type.Soulshard
				end
				
			elseif not ArkInventory.IsCataclysm and t == ArkInventory.Localise["WOW_ITEM_TYPE_QUIVER"] then
				
				if s == ArkInventory.Localise["WOW_ITEM_TYPE_QUIVER_ARROW"] then
					return ArkInventory.Const.Slot.Type.Arrow
				elseif s == ArkInventory.Localise["WOW_ITEM_TYPE_QUIVER_BULLET"] then
					return ArkInventory.Const.Slot.Type.Bullet
				end
				
			end
			
--			if t and s then
--				if t == "" and s == "" then
--					ArkInventory.OutputWarning( "<temporary> item cache not updated yet, location=[", ArkInventory.Global.Location[loc_id].Name, "], bag=[", blizzard_id, "], please wait a minute for your game client to cache the data and try again" )
--				else
--					if ArkInventory.TranslationsLoaded then
--						ArkInventory.OutputWarning( "<report to author> missing translation: language=[", GetLocale( ), "], location=[", ArkInventory.Global.Location[loc_id].Name, "], bag=[", blizzard_id, "], type=[", t, "], sub=[", s, "]" )
--					end
--				end
--			end
			
			return ArkInventory.Const.Slot.Type.Unknown
			
		else
			
			-- empty bag slots
			return ArkInventory.Const.Slot.Type.Bag
			
		end
	
	end
	
	ArkInventory.OutputWarning( "Unknown Type: [", ArkInventory.Global.Location[loc_id].Name, "] id[", blizzard_id, "]=[empty]" )
	return ArkInventory.Const.Slot.Type.Unknown
	
end

function ArkInventory.ScanLocation( arg1 )
	
	--ArkInventory.Output( "ScanLocation( ", arg1, " )" )
	
	for loc_id, loc in pairs( ArkInventory.Global.Location ) do
		if arg1 == nil or arg1 == loc_id then
			ArkInventory.Scan( loc.Bags )
		end
	end
	
end

function ArkInventory.Scan( bagTable )
	
	local bagTable = bagTable
	if type( bagTable ) ~= "table" then
		bagTable = { bagTable }
	end
	
	for _, blizzard_id in pairs( bagTable ) do
		
		local loc_id = ArkInventory.BagID_Internal( blizzard_id )
		
		if loc_id == nil then
			--ArkInventory.Output( "aborted scan of bag ", blizzard_id, ", not an ", ArkInventory.Const.Program.Name, " controlled bag" )
			return
		elseif loc_id == ArkInventory.Const.Location.Bag or loc_id == ArkInventory.Const.Location.Bank or loc_id == ArkInventory.Const.Location.Key then
			ArkInventory.ScanBag( blizzard_id )
		elseif loc_id == ArkInventory.Const.Location.Vault then
			ArkInventory.ScanVault( )
		elseif loc_id == ArkInventory.Const.Location.Wearing then
			ArkInventory.ScanWearing( )
		elseif loc_id == ArkInventory.Const.Location.Mail then
			ArkInventory.ScanMail( )
		elseif loc_id == ArkInventory.Const.Location.Pet then
			ArkInventory.ScanCompanion( "CRITTER" )
		elseif loc_id == ArkInventory.Const.Location.Mount then
			ArkInventory.ScanCompanion( "MOUNT" )
		elseif loc_id == ArkInventory.Const.Location.Token then
			ArkInventory.ScanCurrency( )
		else
			ArkInventory.OutputError( "uncoded location [", loc_id, "] for bag [", blizzard_id, "]" )
		end
		
	end

end

function ArkInventory.ScanBag( blizzard_id )
	
	--local m1 = ArkInventory.MemoryUsed( true )
	
	--ArkInventory.OutputDebug( "ScanBag( ", blizzard_id, " )" )
	
	local loc_id, bag_id = ArkInventory.BagID_Internal( blizzard_id )
	
	if not loc_id then
		ArkInventory.OutputWaring( "aborted scan of bag [", blizzard_id, "], unknown bag id" )
		return
	else
		--ArkInventory.OutputWaring( "found bag id [", blizzard_id, "] in location ", loc_id, " [", ArkInventory.Global.Location[loc_id].Name, "]" )
	end
	
	if loc_id == ArkInventory.Const.Location.Bank and ArkInventory.Global.Mode.Bank == false then
		--ArkInventory.OutputWaring( "aborted scan of bag id [", blizzard_id, "], not at bank" )
		return
	end
	
	local cp = ArkInventory.Global.Me
	
	if not ArkInventory.LocationIsMonitored( loc_id ) then
		--ArkInventory.OutputWaring( "aborted scan of bag id [", blizzard_id, "], location ", loc_id, " [", ArkInventory.Global.Location[loc_id].Name, "] is not being monitored" )
		return
	end
	
	--ArkInventory.OutputDebug( "scaning: ", ArkInventory.Global.Location[loc_id].Name, " [", loc_id, ".", bag_id, "] - [", blizzard_id, "]" )

	
	local count = 0
	local empty = 0
	local bt = ArkInventory.BagType( blizzard_id )
	local texture = nil
	local status = ArkInventory.Const.Bag.Status.Unknown
	local h = nil
	local quality = 1
	
	if loc_id == ArkInventory.Const.Location.Bag then
		
		count = GetContainerNumSlots( blizzard_id )
		
		if blizzard_id == BACKPACK_CONTAINER then
			
			if not count or count == 0 then
				if ArkInventory.db.global.option.bugfix.zerosizebag.alert then
					ArkInventory.OutputWarning( "Aborted scan of bag ", blizzard_id, ", location ", loc_id, " [", ArkInventory.Global.Location[loc_id].Name, "] size returned was ", count, ", rescan has been scheduled for 10 seconds.  This warning can be disabled in the config menu" )
				end
				ArkInventory:SendMessage( "LISTEN_RESCAN_LOCATION_BUCKET", loc_id )
				return
			end
			
			texture = ArkInventory.Global.Location[loc_id].Texture
			status = ArkInventory.Const.Bag.Status.Active
			
		else
			
			h = GetInventoryItemLink( "player", ContainerIDToInventoryID( blizzard_id ) )
			
			if not h then
				
				texture = ArkInventory.Const.Texture.Empty.Bag
				status = ArkInventory.Const.Bag.Status.Empty
				
			else
				
				if not count or count == 0 then
					if ArkInventory.db.global.option.bugfix.zerosizebag.alert then
						ArkInventory.OutputWarning( "Aborted scan of bag ", blizzard_id, ", location ", loc_id, " [", ArkInventory.Global.Location[loc_id].Name, "] size returned was ", count, ", rescan has been scheduled for 10 seconds.  This warning can be disabled in the config menu" )
					end
					ArkInventory:SendMessage( "LISTEN_RESCAN_LOCATION_BUCKET", loc_id )
					return
				end
				
				texture = ArkInventory.ObjectInfoTexture( h )
				status = ArkInventory.Const.Bag.Status.Active
				quality = ArkInventory.ObjectInfoQuality( h )
				
			end
			
		end
		
	end

	
	if loc_id == ArkInventory.Const.Location.Key then
	
		count = GetContainerNumSlots( blizzard_id )
		
		if not count or count == 0 then
			if ArkInventory.db.global.option.bugfix.zerosizebag.alert then
				ArkInventory.OutputWarning( "Aborted scan of bag ", blizzard_id, ", location ", loc_id, " [", ArkInventory.Global.Location[loc_id].Name, "] size returned was ", count, ", rescan has been scheduled for 10 seconds.  This warning can be disabled in the config menu" )
			end
			ArkInventory:SendMessage( "LISTEN_RESCAN_LOCATION_BUCKET", loc_id )
			return
		end
		
		texture = ArkInventory.Global.Location[loc_id].Texture
		status = ArkInventory.Const.Bag.Status.Active
		
	end

	
	if loc_id == ArkInventory.Const.Location.Bank then
	
		count = GetContainerNumSlots( blizzard_id )
		
		if blizzard_id == BANK_CONTAINER then
			
			if not count or count == 0 then
				if ArkInventory.db.global.option.bugfix.zerosizebag.alert then
					ArkInventory.OutputWarning( "Aborted scan of bag ", blizzard_id, ", location ", loc_id, " [", ArkInventory.Global.Location[loc_id].Name, "] size returned was ", count, ", rescan has been scheduled for 10 seconds.  This warning can be disabled in the config menu" )
				end
				ArkInventory:SendMessage( "LISTEN_RESCAN_LOCATION_BUCKET", loc_id )
				return
			end
			
			texture = ArkInventory.Global.Location[loc_id].Texture
			status = ArkInventory.Const.Bag.Status.Active
			
		else
			
			if blizzard_id - NUM_BAG_SLOTS > GetNumBankSlots( ) then
			
				texture = ArkInventory.Const.Texture.Empty.Bag
				status = ArkInventory.Const.Bag.Status.Purchase
				
			else
				
				h = GetInventoryItemLink( "player", ContainerIDToInventoryID( blizzard_id ) )
				
				if not h then
					
					texture = ArkInventory.Const.Texture.Empty.Bag
					status = ArkInventory.Const.Bag.Status.Empty
					
				else
					
					if not count or count == 0 then
						if ArkInventory.db.global.option.bugfix.zerosizebag.alert then
							ArkInventory.OutputWarning( "Aborted scan of bag ", blizzard_id, ", location ", loc_id, " [", ArkInventory.Global.Location[loc_id].Name, "] size returned was ", count, ", rescan has been scheduled for 10 seconds.  This warning can be disabled in the config menu" )
						end
						ArkInventory:SendMessage( "LISTEN_RESCAN_LOCATION_BUCKET", loc_id )
						return
					end
					
					texture = ArkInventory.ObjectInfoTexture( h )
					status = ArkInventory.Const.Bag.Status.Active
					quality = ArkInventory.ObjectInfoQuality( h )
					
				end
				
			end

		end

	end
	
	
	local bag = cp.location[loc_id].bag[bag_id]
	
	local old_bag_count = bag.count
	local old_bag_link = bag.h
	local old_bag_status = bag.status
	
	bag.count = count
	bag.empty = empty
	bag.type = bt
	bag.texture = texture
	bag.status = status
	bag.h = h
	bag.q = quality
	
	local changed_bag = false
	if old_bag_count ~= bag.count or old_bag_link ~= bag.h or old_bag_status ~= bag.status then
		changed_bag = true
	end
	
	for slot_id = 1, bag.count do
		
		if not bag.slot[slot_id] then
			bag.slot[slot_id] = { }
		end
		
		local i = bag.slot[slot_id]
		local item_to_reset = i.h
		
		local h = GetContainerItemLink( blizzard_id, slot_id )
		local sb = false
		local texture, count, locked, quality, readable
		
		if h then
			
			texture, count, locked, quality, readable = GetContainerItemInfo( blizzard_id, slot_id )
			--ArkInventory.Output( "h=", h, ", count[", count, "], q[", quality, "], read[", readable, "]" )
			ArkInventory.TooltipSetItem( ArkInventory.Global.Tooltip.Scan, blizzard_id, slot_id )
			
			if ArkInventory.TooltipContains( ArkInventory.Global.Tooltip.Scan, "^" .. ITEM_SOULBOUND .. "$" ) or ArkInventory.TooltipContains( ArkInventory.Global.Tooltip.Scan, "^" .. ITEM_BIND_ON_PICKUP .. "$" ) then
				sb = true
			end
			
		else
			
			count = 1
			bag.empty = bag.empty + 1
			
		end
		
		
		local changed_item, new, reset_count = ArkInventory.ScanChanged( i, h, sb, count )

		if changed_item or i.loc_id == nil then
			
			i.age = ArkInventory.ItemAgeUpdate( )
			
			i.loc_id = loc_id
			i.bag_id = bag_id
			i.slot_id = slot_id
			
			i.h = h
			i.count = count
			i.sb = sb
			i.readable = readable or nil
			i.q = ArkInventory.ObjectInfoQuality( h )
			i.new = new
			
			i.cat = nil
			i.catdef = nil
			
			if h then
				item_to_reset = h
			end
			
			if not changed_bag then
				ArkInventory.Frame_Item_Update( loc_id, bag_id, slot_id )
				ArkInventory:SendMessage( "LISTEN_CHANGER_UPDATE_BUCKET", loc_id )
			end
			
			ArkInventory.Frame_Main_DrawStatus( loc_id, ArkInventory.Const.Window.Draw.Refresh )
			
		end
		
		if item_to_reset and reset_count then
			--ArkInventory.Output( "clear item count for ", item_to_reset )
			ArkInventory.ObjectCountClear( item_to_reset )
			ArkInventory.LDB.Tracking_Item:Update( )
		end
		
	end

	-- remove unwanted slots
	if old_bag_count > bag.count then
		for slot_id = bag.count + 1, old_bag_count do
			
			if bag.slot[slot_id] and bag.slot[slot_id].h then
				ArkInventory.ObjectCountClear( bag.slot[slot_id].h )
				ArkInventory.LDB.Tracking_Item:Update( )
			end
			
			bag.slot[slot_id] = nil
			
		end
	end
	
	if changed_bag then
		
		if old_bag_link then
			ArkInventory.ObjectCountClear( old_bag_link )
			ArkInventory.LDB.Tracking_Item:Update( )
		end
		
		cp.location[loc_id].slot_count = ArkInventory.Table.Sum( cp.location[loc_id].bag, function( a ) return a.count end )
		ArkInventory:SendMessage( "LISTEN_STORAGE_EVENT", ArkInventory.Const.Event.BagUpdate, loc_id, bag_id, ArkInventory.Const.Window.Draw.Recalculate )
		
	end
	
	--local m0 = string.format( "%.3f", ArkInventory.MemoryUsed( ) - m1 )
	--ArkInventory.OutputDebug( "Scan( ", loc_id, "-", bag_id, " ) =  ", m0 )
	
end

function ArkInventory.ScanVault( )

	--local m1 = ArkInventory.MemoryUsed( true )

	--ArkInventory.Output( GREEN_FONT_COLOR_CODE, "ScanVault( )" )
	
	if ArkInventory.Global.Mode.Vault == false then
		--ArkInventory.Output( RED_FONT_COLOR_CODE, "aborted scan of vault, not at vault" )
		return
	end
	
	if not IsInGuild( ) or not ArkInventory.Global.Me.info.guild_id then
		--ArkInventory.Output( RED_FONT_COLOR_CODE, "aborted scan of vault, not in a guild" )
		return
	end
	
	if GetNumGuildBankTabs( ) == 0 then
		--ArkInventory.Output( RED_FONT_COLOR_CODE, "aborted scan of vault, no tabs purchased" )
		return
	end
	
	local loc_id = ArkInventory.Const.Location.Vault
	local bag_id = GetCurrentGuildBankTab( )

	if not ArkInventory.LocationIsMonitored( loc_id ) then
		--ArkInventory.Output( RED_FONT_COLOR_CODE, "aborted scan of bag id [", blizzard_id, "], location ", loc_id, " [", ArkInventory.Global.Location[loc_id].Name, "] is not being monitored" )
		return
	end
	
	local cp = ArkInventory.PlayerInfoGet( ArkInventory.Global.Me.info.guild_id )
	
	--ArkInventory.Output( GREEN_FONT_COLOR_CODE, "scaning: ", ArkInventory.Global.Location[loc_id].Name, " [", loc_id, ".", bag_id, "] - [", blizzard_id, "]" )
	
	
	local bag = cp.location[loc_id].bag[bag_id]
	
	local old_bag_count = bag.count
	local old_bag_status = bag.status
	
	bag.count = 0
	bag.empty = 0
	bag.type = ArkInventory.Const.Slot.Type.Bag
	
	if bag_id <= GetNumGuildBankTabs( ) then
		
		local name, icon, isViewable, canDeposit, numWithdrawals, remainingWithdrawals = GetGuildBankTabInfo( bag_id )
		
		bag.name = name
		bag.texture = icon
		bag.count = MAX_GUILDBANK_SLOTS_PER_TAB
		bag.status = ArkInventory.Const.Bag.Status.Active
		
	end
	
	local isViewable, canDeposit = select( 3, GetGuildBankTabInfo( bag_id ) )

	local changed_bag = false
	if old_bag_count ~= bag.count or old_bag_status ~= bag.status then
		changed_bag = true
	end
	
	--local m1 = ArkInventory.MemoryUsed( true )
	
	for slot_id = 1, bag.count or 0 do
		
		--local m1 = ArkInventory.MemoryUsed( true )
		
		if not bag.slot[slot_id] then
			bag.slot[slot_id] = { }
		end
		
		local i = bag.slot[slot_id]
		local item_to_reset = i.h
		
		local texture, count = GetGuildBankItemInfo( bag_id, slot_id )
		local h = nil
		local sb = false
		
		if texture then
		
			h = GetGuildBankItemLink( bag_id, slot_id )
			
			if h == nil then
				ArkInventory.TooltipSetGuildBankItem( ArkInventory.Global.Tooltip.Scan, bag_id, slot_id )
				h = select( 2, ArkInventory.TooltipGetItem( ArkInventory.Global.Tooltip.Scan ) )
			end
			
		else
			
			bag.empty = bag.empty + 1
			
		end
		
		
		local changed_item, new, reset_count = ArkInventory.ScanChanged( i, h, sb, count )
		
		if changed_item or i.loc_id == nil then
			
			i.age = ArkInventory.ItemAgeUpdate( )
			
			i.loc_id = loc_id
			i.bag_id = bag_id
			i.slot_id = slot_id
			
			i.h = h
			i.count = count
			i.sb = sb
			
			i.q = ArkInventory.ObjectInfoQuality( h )
			i.new = new
			
			i.cat = nil
			i.catdef = nil
			
			if h then
				item_to_reset = h
			end
			
			if not changed_bag then
				ArkInventory.Frame_Item_Update( loc_id, bag_id, slot_id )
				ArkInventory:SendMessage( "LISTEN_CHANGER_UPDATE_BUCKET", loc_id )
			end
			
			ArkInventory.Frame_Main_DrawStatus( loc_id, ArkInventory.Const.Window.Draw.Refresh )
			
		end
		
		if item_to_reset and reset_count then
			--ArkInventory.Output( "reset item count in tab ", bag_id, " for ", item_to_reset )
			ArkInventory.ObjectCountClear( item_to_reset, true )
		end
		
		--local m0 = string.format( "%.3f", ArkInventory.MemoryUsed( true ) - m1 )
		--ArkInventory.OutputDebug( "Scan( ", loc_id, "-", bag_id, "-", slot_id, " ) =  ", m0, " [", changed_item, "]" )
		
	end

	--local m0 = string.format( "%.3f", ArkInventory.MemoryUsed( ) - m1 )
	--ArkInventory.OutputDebug( "Scan( ", loc_id, "-", bag_id, " ) =  ", m0 )
	
	cp.location[loc_id].slot_count = ArkInventory.Table.Sum( cp.location[loc_id].bag, function( a ) return a.count end )

	if changed_bag then
		ArkInventory:SendMessage( "LISTEN_STORAGE_EVENT", ArkInventory.Const.Event.BagUpdate, loc_id, bag_id, ArkInventory.Const.Window.Draw.Recalculate )
	else
		ArkInventory:SendMessage( "LISTEN_STORAGE_EVENT", ArkInventory.Const.Event.BagUpdate, loc_id, bag_id, ArkInventory.Const.Window.Draw.Refresh )
	end

	--local m0 = string.format( "%.3f", ArkInventory.MemoryUsed( ) - m1 )
	--ArkInventory.OutputDebug( "Scan( ", loc_id, "-", bag_id, " ) =  ", m0 )

	
end

function ArkInventory.ScanVaultHeader( )
	
	--ArkInventory.Output( "ScanVaultHeader( ) start" )
	
	if ArkInventory.Global.Mode.Vault == false then
		--ArkInventory.Output( "aborted scan of tab headers, not at vault" )
		return
	end
	
--	if bag_id < 1 or bag_id > MAX_GUILDBANK_TABS then
		--ArkInventory.OutputDebug( "aborted scan of tab ", bag_id, " header, invalid tab id" )
--		return
--	end

	if not IsInGuild( ) or not ArkInventory.Global.Me.info.guild_id then
		--ArkInventory.Output( "aborted scan of tab headers, not in a guild" )
		return
	end
	
	local cp = ArkInventory.PlayerInfoGet( ArkInventory.Global.Me.info.guild_id )
	
	--ArkInventory.Output( "scaning tab headers" )
	
	local loc_id = ArkInventory.Const.Location.Vault
	
	for bag_id = 1, MAX_GUILDBANK_TABS do
		
		local bag = cp.location[loc_id].bag[bag_id]
	
		bag["type"] = ArkInventory.Const.Slot.Type.Bag
	
		if bag_id <= GetNumGuildBankTabs( ) then
			
			local name, icon, isViewable, canDeposit, numWithdrawals, remainingWithdrawals = GetGuildBankTabInfo( bag_id )
			
			--ArkInventory.Output( "tab = ", bag_id, ", icon = ", icon )
			
			bag["name"] = name
			bag["texture"] = icon
			bag["status"] = ArkInventory.Const.Bag.Status.Active
			
			-- from Blizzard_GuildBankUI.lua - GuildBankFrame_UpdateTabs( )
			local access = GUILDBANK_TAB_FULL_ACCESS
			if not isViewable then
				access = ArkInventory.Localise["VAULT_TAB_ACCESS_NONE"]
			elseif ( not canDeposit and numWithdrawals == 0 ) then
				access = GUILDBANK_TAB_LOCKED
			elseif ( not canDeposit ) then
				access = GUILDBANK_TAB_WITHDRAW_ONLY
			elseif ( numWithdrawals == 0 ) then
				access = GUILDBANK_TAB_DEPOSIT_ONLY
			end
			bag["access"] = access
			
			local stackString = nil
			if bag_id == GetCurrentGuildBankTab( ) then
				if remainingWithdrawals > 0 then
					stackString = string.format( "%s/%s", remainingWithdrawals, string.format( GetText( "STACKS", nil, numWithdrawals ), numWithdrawals ) )
				elseif remainingWithdrawals == 0 then
					stackString = NONE
				else
					stackString = UNLIMITED
				end
			end
			bag["withdraw"] = stackString
			
			if bag.access == ArkInventory.Localise["VAULT_TAB_ACCESS_NONE"] then
				bag.status = ArkInventory.Const.Bag.Status.NoAccess
				bag.withdraw = nil
			end
			
		else
			
			bag["name"] = string.format( GUILDBANK_TAB_NUMBER, bag_id )
			bag["texture"] = ArkInventory.Const.Texture.Empty.Bag
			bag["count"] = 0
			bag["empty"] = 0
			bag["access"] = ArkInventory.Localise["STATUS_PURCHASE"]
			bag["withdraw"] = nil
			bag["status"] = ArkInventory.Const.Bag.Status.Purchase
			
		end
		
	end
	
	ArkInventory.Frame_Changer_Update( loc_id, bag_id )
	
	--ArkInventory.OutputDebug( "ScanVaultHeader( ", bag_id, " ) end" )
	
end

function ArkInventory.ScanWearing( )

	--local m1 = ArkInventory.MemoryUsed( true )

	--ArkInventory.Output( GREEN_FONT_COLOR_CODE, "ScanWearing( ) start" )
	
	local blizzard_id = ArkInventory.Const.Offset.Wearing + 1
	
	local loc_id, bag_id = ArkInventory.BagID_Internal( blizzard_id )
	
	if not ArkInventory.LocationIsMonitored( loc_id ) then
		--ArkInventory.Output( RED_FONT_COLOR_CODE, "aborted scan of bag id [", blizzard_id, "], location ", loc_id, " [", ArkInventory.Global.Location[loc_id].Name, "] is not being monitored" )
		return
	end

	--ArkInventory.Output( GREEN_FONT_COLOR_CODE, "scaning: ", ArkInventory.Global.Location[loc_id].Name, " [", loc_id, ".", bag_id, "] - [", blizzard_id, "]" )
	
	
	local cp = ArkInventory.Global.Me
	
	local bag = cp.location[loc_id].bag[bag_id]

	bag.count = 0
	bag.empty = 0
	bag.type = ArkInventory.Const.Slot.Type.Wearing
	bag.status = ArkInventory.Const.Bag.Status.Active

	
	for slot_id, v in ipairs( ArkInventory.Const.InventorySlotName ) do
	
		bag.count = bag.count + 1
		
		if not bag.slot[slot_id] then
			bag.slot[slot_id] = { }
		end
		
		local i = bag.slot[slot_id]
		local item_to_reset = i.h
		
		local inv_id = GetInventorySlotInfo( v )
		local h = GetInventoryItemLink( "player", inv_id )
		local sb = false
		local count = 0
		
		if h then
		
			count = 1 --GetInventoryItemCount( "player", inv_id )

			-- check for soulbound
			ArkInventory.TooltipSetInventoryItem( ArkInventory.Global.Tooltip.Scan, inv_id )
			if ArkInventory.TooltipContains( ArkInventory.Global.Tooltip.Scan, "^" .. ITEM_SOULBOUND .. "$" ) or ArkInventory.TooltipContains( ArkInventory.Global.Tooltip.Scan, "^" .. ITEM_BIND_ON_PICKUP .. "$" ) then
				sb = true
			end
			
		else
		
			bag.empty = bag.empty + 1
			
		end

		
		local changed_item, new, reset_count = ArkInventory.ScanChanged( i, h, sb, count )

		if changed_item or i.loc_id == nil then
		
			i.age = ArkInventory.ItemAgeUpdate( )

			i.loc_id = loc_id
			i.bag_id = bag_id
			i.slot_id = slot_id
			
			i.h = h
			i.count = count
			i.sb = sb
			
			i.q = ArkInventory.ObjectInfoQuality( h )
			i.new = new
		
			i.cat = nil
			i.catdef = nil
			
			if h then
				item_to_reset = h
			end
			
			ArkInventory.Frame_Item_Update( loc_id, bag_id, slot_id )
			ArkInventory:SendMessage( "LISTEN_CHANGER_UPDATE_BUCKET", loc_id )
			
			ArkInventory.Frame_Main_DrawStatus( loc_id, ArkInventory.Const.Window.Draw.Refresh )
			
		end
		
		if item_to_reset and reset_count then
			ArkInventory.ObjectCountClear( item_to_reset )
		end

		--ArkInventory.Output( "slot=[", slot_id, "], item=[", i.h, "]" )
	
	end
	
	cp.location[loc_id].slot_count = bag.count
	
	--local m0 = string.format( "%.3f", ArkInventory.MemoryUsed( ) - m1 )
	--ArkInventory.OutputDebug( "Scan( ", loc_id, "-", bag_id, " ) =  ", m0 )
	
end

function ArkInventory.ScanMail( )

	--local m1 = ArkInventory.MemoryUsed( true )

	--ArkInventory.OutputDebug( "ScanMail( ) start" )
	
	local blizzard_id = ArkInventory.Const.Offset.Mail + 1
	
	local loc_id, bag_id = ArkInventory.BagID_Internal( blizzard_id )

	-- mailbox can be scanned from anywhere, just uses data from when it was last opened
	if ArkInventory.Global.Mode.Mail == false then
		--ArkInventory.Output( RED_FONT_COLOR_CODE, "aborted scan of mailbox, not at mailbox" )
		return
	end
	
	if not ArkInventory.LocationIsMonitored( loc_id ) then
		--ArkInventory.Output( RED_FONT_COLOR_CODE, "aborted scan of bag id [", blizzard_id, "], location ", loc_id, " [", ArkInventory.Global.Location[loc_id].Name, "] is not being monitored" )
		return
	end

	
	--ArkInventory.Output( GREEN_FONT_COLOR_CODE, "scaning: ", ArkInventory.Global.Location[loc_id].Name, " [", loc_id, ".", bag_id, "] - [", blizzard_id, "]" )
	
	local cp = ArkInventory.Global.Me
	
	local bag = cp.location[loc_id].bag[bag_id]
	
	local old_bag_count = bag.count

	bag.count = 0
	bag.empty = 0
	bag.type = ArkInventory.Const.Slot.Type.Mail
	bag.status = ArkInventory.Const.Bag.Status.Active
	
	
	local slot_id = 0
	
	for msg_id = 1, GetInboxNumItems( ) do
	
		--ArkInventory.Output( "scanning message ", msg_id )
		
		local _, _, _, _, _, _, daysLeft, hasItem, _, wasReturned, _, canReply, _ = GetInboxHeaderInfo( msg_id )
		
		--if ( daysLeft >= 1 ) then
--			daysLeft = GREEN_FONT_COLOR_CODE..format(DAYS_ABBR, floor(daysLeft)).." "..FONT_COLOR_CODE_CLOSE;
		--else
--			daysLeft = RED_FONT_COLOR_CODE..SecondsToTime(floor(daysLeft * 24 * 60 * 60))..FONT_COLOR_CODE_CLOSE;
		--end
		
		local expires_d = floor( daysLeft )
		local expires_s = ( daysLeft - floor( daysLeft ) ) * 24 * 60* 60
		
		
		
		
		
		local purge = not not ( wasReturned ) or ( not canReply )
		
		if hasItem then
		
			--ArkInventory.Output( "message ", msg_id, " has item(s)" )
			
			for attachment_id = 1, ATTACHMENTS_MAX_RECEIVE do
				
				local name, _, count = GetInboxItem( msg_id, attachment_id ) -- quality is bugged, always returns -1
				
				if name ~= nil then

					--ArkInventory.Output( "message ", msg_id, ", attachment ", attachment_id, " = ", name, " x ", count, " / (", { GetInboxItemLink( msg_id, attachment_id ) }, ")" )
					
					slot_id = slot_id + 1
					
					if not bag.slot[slot_id] then
						bag.slot[slot_id] = { }
					end
					
					local i = bag.slot[slot_id]
					local item_to_reset = i.h
					
					local h = GetInboxItemLink( msg_id, attachment_id )
					local sb = false -- always false, items sent by blizzard are bind on pickup, not soulbound
					
					if h then
						bag.count = bag.count + 1
					end
					
					local changed_item, new, reset_count = ArkInventory.ScanChanged( i, h, sb, count )
					
					if changed_item or i.loc_id == nil then
						
						i.age = ArkInventory.ItemAgeUpdate( )
						
						i.loc_id = loc_id
						i.bag_id = bag_id
						i.slot_id = slot_id
						
						i.h = h
						i.count = count
						i.sb = sb
						
						i.q = ArkInventory.ObjectInfoQuality( h )
						i.new = new
						
						i.cat = nil
						i.catdef = nil
						
						if h then
							item_to_reset = h
						end
						
						ArkInventory.Frame_Main_DrawStatus( loc_id, ArkInventory.Const.Window.Draw.Refresh )
						
					end
					
					if item_to_reset and reset_count then
						ArkInventory.ObjectCountClear( item_to_reset )
					end
					
				end
			
			end
		
		end
		
	end
	
	
	-- remove unwanted slots
	if old_bag_count > bag.count then
		
		for slot_id = bag.count + 1, old_bag_count do
			
			if bag.slot[slot_id] and bag.slot[slot_id].h then
				ArkInventory.ObjectCountClear( bag.slot[slot_id].h )
			end
			
			bag.slot[slot_id] = nil
			
		end
		
	end

	
	if old_bag_count ~= bag.count then
		cp.location[loc_id].slot_count = ArkInventory.Table.Sum( cp.location[loc_id].bag, function( a ) return a.count end )
		ArkInventory:SendMessage( "LISTEN_STORAGE_EVENT", ArkInventory.Const.Event.BagUpdate, loc_id, bag_id, ArkInventory.Const.Window.Draw.Recalculate )
	end

	--local m0 = string.format( "%.3f", ArkInventory.MemoryUsed( ) - m1 )
	--ArkInventory.OutputDebug( "Scan( ", loc_id, "-", bag_id, " ) =  ", m0 )
	
end

function ArkInventory.ScanCompanion( type_id )

	--ArkInventory.Output( "ScanCompanion( ", type_id, " ) start" )
	
	local blizzard_id
	if type_id == "CRITTER" then
		blizzard_id = ArkInventory.Const.Offset.Pet + 1
	elseif type_id == "MOUNT" then
		blizzard_id = ArkInventory.Const.Offset.Mount + 1
	else
		--ArkInventory.Output( "unknown companion type" )
		return
	end
	
	local loc_id, bag_id = ArkInventory.BagID_Internal( blizzard_id )
	
	if not ArkInventory.LocationIsMonitored( loc_id ) then
		--ArkInventory.Output( RED_FONT_COLOR_CODE, "aborted scan of bag id [", blizzard_id, "], location ", loc_id, " [", ArkInventory.Global.Location[loc_id].Name, "] is not being monitored" )
		return
	end

	
	--ArkInventory.Output( GREEN_FONT_COLOR_CODE, "scaning: ", ArkInventory.Global.Location[loc_id].Name, " [", loc_id, ".", bag_id, "] - [", blizzard_id, "]" )
	
	local cp = ArkInventory.Global.Me
	
	local bag = cp.location[loc_id].bag[bag_id]
	
	local old_bag_count = bag.count
	
	bag.count = GetNumCompanions( type_id )
	bag.empty = 0
	bag.type = ArkInventory.BagType( blizzard_id )
	bag.status = ArkInventory.Const.Bag.Status.Active
	
	local creatureID, creatureName, creatureSpellID, texture, active
	
	for slot_id = 1, bag.count do
		
		if not bag.slot[slot_id] then
			bag.slot[slot_id] = { }
		end
		
		local i = bag.slot[slot_id]
		local item_to_reset = i.h
		
		creatureID, creatureName, creatureSpellID, texture, active = GetCompanionInfo( type_id, slot_id )
		
		local h = GetSpellLink( creatureSpellID )
		local sb = true
		local count = 1
		
		--ArkInventory.Output( "type=[", type_id, "], slot=[", slot_id, "] link=", h, "." )
		
		local changed_item, new, reset_count = ArkInventory.ScanChanged( i, h, sb, count )
		
		if changed_item or i.loc_id == nil then
			
			i.age = ArkInventory.ItemAgeUpdate( )
			
			i.loc_id = loc_id
			i.bag_id = bag_id
			i.slot_id = slot_id
			
			i.h = h
			i.count = count
			i.sb = sb
			
			i.q = 1
			i.new = new
			
			i.type = type_id
			i.texture = texture
			
			i.cat = nil
			i.catdef = nil
			
			if h then
				item_to_reset = h
			end
			
			ArkInventory.Frame_Main_DrawStatus( loc_id, ArkInventory.Const.Window.Draw.Refresh )
			
		end
		
		if item_to_reset and reset_count then
			ArkInventory.ObjectCountClear( item_to_reset )
		end
		
	end
	
	
	if type_id == "MOUNT" then
		
		local spells = { }
		
		if IsSpellKnown( 33943 ) then
			bag.count = bag.count + 1
			spells[33943] = bag.count
			--ArkInventory.Output( "i know flight form" )
		end
		
		if IsSpellKnown( 40120 ) then
			bag.count = bag.count + 1
			spells[40120] = bag.count
			--ArkInventory.Output( "i know swift flight form" )
		end
		
		for spell_id, slot_id in pairs( spells ) do
			
			if not bag.slot[slot_id] then
				bag.slot[slot_id] = { }
			end
			
			local i = bag.slot[slot_id]
			local item_to_reset = i.h
			
			local h = GetSpellLink( spell_id )
			local sb = true
			local count = 1
			
			--ArkInventory.Output( "type=[", type_id, "], slot=[", slot_id, "] link=", h, "." )
			
			local changed_item, new, reset_count = ArkInventory.ScanChanged( i, h, sb, count )
			
			if changed_item or i.loc_id == nil then
				
				i.age = ArkInventory.ItemAgeUpdate( )
				
				i.loc_id = loc_id
				i.bag_id = bag_id
				i.slot_id = slot_id
				
				i.h = h
				i.count = count
				i.sb = sb
				
				i.q = 1
				i.new = new
				
				i.type = "SPELL"
				i.texture = select( 3, GetSpellInfo( spell_id ) )
				
				i.cat = nil
				i.catdef = nil
				
				if h then
					item_to_reset = h
				end
				
				ArkInventory.Frame_Main_DrawStatus( loc_id, ArkInventory.Const.Window.Draw.Refresh )
				
			end
			
			if item_to_reset and reset_count then
				ArkInventory.ObjectCountClear( item_to_reset )
			end
			
		end
		
	end
	

	-- remove unwanted slots
	if old_bag_count > bag.count then
		for slot_id = bag.count + 1, old_bag_count do
			
			if bag.slot[slot_id] and bag.slot[slot_id].h then
				ArkInventory.ObjectCountClear( bag.slot[slot_id].h )
			end
			
			bag.slot[slot_id] = nil
			
		end
	end
	
	if old_bag_count ~= bag.count then
		cp.location[loc_id].slot_count = ArkInventory.Table.Sum( cp.location[loc_id].bag, function( a ) return a.count end )
		ArkInventory:SendMessage( "LISTEN_STORAGE_EVENT", ArkInventory.Const.Event.BagUpdate, loc_id, bag_id, ArkInventory.Const.Window.Draw.Recalculate )
	end
	
	--ArkInventory.OutputDebug( "Scan( ", loc_id, "-", bag_id, " ) =  ", m0 )
	
end

function ArkInventory.ScanCurrency( )

	--ArkInventory.OutputDebug( "ScanCurrency( ) start" )
	
	local blizzard_id = ArkInventory.Const.Offset.Token + 1
	
	local loc_id, bag_id = ArkInventory.BagID_Internal( blizzard_id )

	if not ArkInventory.LocationIsMonitored( loc_id ) then
		--ArkInventory.Output( RED_FONT_COLOR_CODE, "aborted scan of bag id [", blizzard_id, "], location ", loc_id, " [", ArkInventory.Global.Location[loc_id].Name, "] is not being monitored" )
		return
	end
	
	--ArkInventory.Output( GREEN_FONT_COLOR_CODE, "scaning: ", ArkInventory.Global.Location[loc_id].Name, " [", loc_id, ".", bag_id, "] - [", blizzard_id, "]" )
	
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
	
	local cp = ArkInventory.Global.Me
	
	local bag = cp.location[loc_id].bag[bag_id]
	
	local old_bag_count = bag.count
	
	bag.count = 0
	bag.empty = 0
	bag.type = ArkInventory.Const.Slot.Type.Token
	bag.status = ArkInventory.Const.Bag.Status.Active
	
	local slot_id = 0
	
	numTokenTypes = GetCurrencyListSize( )
	
	for j = 1, numTokenTypes do
	
		if ArkInventory.IsCataclysm then
			name, isHeader, isExpanded, isUnused, isWatched, count, icon = GetCurrencyListInfo( j )
		else
			name, isHeader, isExpanded, isUnused, isWatched, count, currencyType, icon= GetCurrencyListInfo( j )
		end
  
		if not isHeader and name and count and count > 0 then
			
			slot_id = slot_id + 1
			
			if not bag.slot[slot_id] then
				bag.slot[slot_id] = { }
			end
			
			local i = bag.slot[slot_id]
			local item_to_reset = i.h
			
			local sb = true
			
			local id = 0
			
			local h = string.format( "|Htoken:%s:%s|h[%s]|h", name, icon, name )
			
			local changed_item, new, reset_count = ArkInventory.ScanChanged( i, h, sb, count )
			
			if changed_item or i.loc_id == nil then
				
				i.age = ArkInventory.ItemAgeUpdate( )
				
				i.loc_id = loc_id
				i.bag_id = bag_id
				i.slot_id = slot_id
				
				i.h = h
				i.count = count
				i.sb = sb
				i.texture = icon
				
				i.q = ArkInventory.ObjectInfoQuality( h )
				i.new = new
				
				i.cat = nil
				i.catdef = nil
				
				if h then
					item_to_reset = h
				end
				
				ArkInventory.Frame_Main_DrawStatus( loc_id, ArkInventory.Const.Window.Draw.Refresh )
				
			end
			
			if item_to_reset and reset_count then
				ArkInventory.ObjectCountClear( item_to_reset )
			end
		
		end
		
	end
	
	bag.count = slot_id

	-- remove unwanted slots
	if old_bag_count > bag.count then
		for slot_id = bag.count + 1, old_bag_count do
			
			if bag.slot[slot_id] and bag.slot[slot_id].h then
				ArkInventory.ObjectCountClear( bag.slot[slot_id].h )
			end
			
			bag.slot[slot_id] = nil
			
		end
	end
	
	
	
	if old_bag_count ~= bag.count then
		cp.location[loc_id].slot_count = ArkInventory.Table.Sum( cp.location[loc_id].bag, function( a ) return a.count end )
		ArkInventory:SendMessage( "LISTEN_STORAGE_EVENT", ArkInventory.Const.Event.BagUpdate, loc_id, bag_id, ArkInventory.Const.Window.Draw.Recalculate )
	end
	
	--ArkInventory.OutputDebug( "Scan( ", loc_id, "-", bag_id, " ) =  ", m0 )
	
	-- token "bag" blizzard is using (mapped to our second bag)
	bag_id = 2
	bag = cp.location[loc_id].bag[bag_id]
	bag.count = 0
	bag.empty = 0
	bag.type = ArkInventory.Const.Slot.Type.Token
	bag.status = ArkInventory.Const.Bag.Status.NoAccess
	
end

function ArkInventory.ScanChanged( old, h, sb, count )

	-- check for slot changes
	
	-- return item has changed, new status, reset count

	if not old then
		--  the old slot doesnt exist - new bag is larger
		--ArkInventory.Output( "changed, bag=", bag_id, ", slot=", i.slot_id, ", new slot" )
		return true, ArkInventory.Const.Slot.New.No, false
	end
	
	if h and not old.h then
		-- item added to empty slot
		--ArkInventory.Output( "changed, bag=", bag_id, ", slot=", i.slot_id, ", item added" )
		return true, ArkInventory.Const.Slot.New.Yes, true
	end
	
	if not h and old.h then
		-- item removed, slot is now empty
		--ArkInventory.Output( "changed, bag=", bag_id, ", slot=", i.slot_id, ", item removed" )
		return true, ArkInventory.Const.Slot.New.No, true
	end
	
	if h and old.h and h ~= old.h then
		-- different item
		--ArkInventory.Output( "changed, bag=", bag_id, ", slot=", i.slot_id, ", item swapped" )
		return true, ArkInventory.Const.Slot.New.Yes, true
	end
	
	if ( sb and not old.sb ) or ( not sb and old.sb ) then
		-- soulbound changed
		--ArkInventory.Output( "changed, bag=", bag_id, ", slot=", i.slot_id, ", soulbound changed" )
		return true, ArkInventory.Const.Slot.New.Yes, false
	end
	
	if h and old.h and count and old.count and count ~= old.count then
		-- same item, previously existed, count has changed
		if count > old.count then
			--ArkInventory.Output( "changed, bag=", bag_id, ", slot=", i.slot_id, ", increased" )
			return true, ArkInventory.Const.Slot.New.Inc, true
		else
			--ArkInventory.Output( "changed, bag=", bag_id, ", slot=", i.slot_id, ", decreased" )
			return true, ArkInventory.Const.Slot.New.Dec, true
		end
		
	end
	
	return false, nil, false --, ArkInventory.Const.Slot.New.No
	
end

function ArkInventory.ObjectInfoName( h )
	local x = select( 3, ArkInventory.ObjectInfo( h ) ) or strmatch( "%[(.+)%]", i.h ) or "!"
	return x
end

function ArkInventory.ObjectInfoTexture( h )
	local x = select( 4, ArkInventory.ObjectInfo( h ) )
	return x
end

function ArkInventory.ObjectInfoQuality( h )
	local x = select( 5, ArkInventory.ObjectInfo( h ) ) or 0
	return x
end

function ArkInventory.ObjectInfo( h )
	
	if h == nil or type( h ) ~= "string" then
		return
	end
	
	local class, v1, v2 = ArkInventory.ObjectStringDecode( h )
	
	if class == "item" then
	
		local itemName, itemLink, itemRarity, itemLevel, itemMinLevel, itemType, itemSubType, itemStackCount, itemEquipLoc, itemTexture, itemSellPrice = GetItemInfo( h )
		
		if itemTexture == nil then
			itemTexture = GetItemIcon( h )
		end
		
		if not itemName then
			itemName = string.match( h, "|h%[(.+)%]|h" )
		end
		
		return class, itemLink, itemName, itemTexture, itemRarity or 1, itemLevel or 0, itemMinLevel or 0, itemType or "", itemSubType or "", itemStackCount or 1, itemEquipLoc or "", itemSellPrice or 0
		
	elseif class == "empty" then
		
		return
		
	elseif class == "spell" then
		
		local name, _, texture = GetSpellInfo( v1 )
		local link = GetSpellLink( v1 )
		local quality = 1
		
		return class, link, name, texture, quality
		
	elseif class == "token" then
		
		link = string.format( "|H%s:%s:%s|h[%s]|h", class, v1, v2, v1 )
		
		return class, link, v1, v2, 1
		
	else
		
		assert( "unknown class [" .. class .. "]" )
		
	end
	
end

function ArkInventory.ObjectStringDecode( h )
	
	-- item:itemId:enchantId:jewelId1:jewelId2:jewelId3:jewelId4:suffixId:uniqueId:currentCharacterLevel
	-- spell:spellID
	-- token:name:texture
	
	local s = string.match( ( h or "" ), "|H(.-)|h" ) or string.match( ( h or "" ), "^([a-z]-:.+)" ) or ""
	local class, v1, v2, v3, v4, v5, v6, v7, v8, v9, v10 = strsplit( ":", s )
	
	class = string.lower( class or "" )
	
	if class == "token" then
		return class, v1, h, v2, 1, 0, 0, 0, 0, 0, 0
	end

	if class == "" then
		class = "empty"
	end
	
	v1 = tonumber( v1 ) or 0
	v2 = tonumber( v2 ) or 0
	v3 = tonumber( v3 ) or 0
	v4 = tonumber( v4 ) or 0
	v5 = tonumber( v5 ) or 0
	v6 = tonumber( v6 ) or 0
	v7 = tonumber( v7 ) or 0
	v8 = tonumber( v8 ) or 0
	v9 = tonumber( v9 ) or 0
	v10 = tonumber( v10 ) or 0
	
	return class, v1, v2, v3, v4, v5, v6, v7, v8, v9, v10
	
end

function ArkInventory.ObjectStringDecodeItem( h )
	
	local h = h
	if type( h ) == "number" then
		h = string.format( "item:%s", h )
	end
	
	local class, id, enchant, j1, j2, j3, j4, suffix, unique = ArkInventory.ObjectStringDecode( h )
	
	if class == "item" then
		return id, suffix, enchant, j1, j2, j3, j4
	end
	
end

function ArkInventory.ScanProfessions( )
	
	--ArkInventory.OutputDebug( "ScanProfessions" )
	
	ArkInventory.Global.Me.info.skills = { }
	local skills = ArkInventory.Global.Me.info.skills
	
	for _, k in pairs( ArkInventory.Const.Category.Code.Skill ) do
		local l = GetSpellLink( k.text )
		if l then
			local skill = strmatch( k.id, "SKILL_(.+)" )
			table.insert( skills, skill )
			--ArkInventory.Output( "skill=", skill, ", info=", l, "." )
		end
	end
	
	ArkInventory.Global.Cache.Default = { }
	ArkInventory.LocationSetValue( nil, "resort", true )
	
end

function ArkInventory.InventoryIDGet( loc_id, bag_id )
	
	local inv_id = nil
	
	local blizzard_id = ArkInventory.BagID_Blizzard( loc_id, bag_id )
	
	if blizzard_id == nil then
		return nil
	end
	
	if loc_id == ArkInventory.Const.Location.Bag and bag_id > 1 then
		inv_id = ContainerIDToInventoryID( blizzard_id )
	elseif loc_id == ArkInventory.Const.Location.Bank and bag_id > 1 then
		inv_id = BankButtonIDToInvSlotID( blizzard_id, 1 )
	end
	
	return inv_id
	
end


function ArkInventory.ObjectIDInternal( h )

	local class, id, suffix, enchant, j1, j2, j3, j4 = ArkInventory.ObjectStringDecode( h )
	
	if class == "item" then
		return string.format( "%s:%s:%s:%s:%s:%s:%s:%s", class, id, enchant, suffix, j1, j2, j3, j4 )
	elseif class == "empty" or class == "spell" then
		return string.format( "%s:%s", class, id )
	elseif class == "token" then
		return string.format( "%s:%s:%s", class, id, suffix )
	else
		assert( "unknown class [" .. class .. "]" )
	end
	
end

function ArkInventory.ObjectIDTooltip( h )
	
	local class, v1, v2 = ArkInventory.ObjectStringDecode( h )
	
	--ArkInventory.Output( "class[", class, "] : [", v1, "] : [", v2, "]" )
	
	if class == "item" or class == "empty" or class == "spell" then
		return string.format( "%s:%s", class, v1 )
	elseif class == "token" then
		return string.format( "%s:%s", class, v1 )
	else
		assert( "uncoded class [" .. class .. "]" )
	end

end

function ArkInventory.ObjectIDCacheCategory( i )
	
	local soulbound = 0
	
	if i.h then
		if i.sb then
			soulbound = 1
		end
	else
		-- empty slots
		local blizzard_id = ArkInventory.BagID_Blizzard( i.loc_id, i.bag_id )
		soulbound = ArkInventory.BagType( blizzard_id ) -- allows for unique codes per bag type
	end
	
	local class, v1, v2 = ArkInventory.ObjectStringDecode( i.h )
	
	if class == "item" then
		return string.format( "%s:%s:%s", class, v1, soulbound )
	elseif class == "empty" then
		return string.format( "%s:%s:%s", class, 0, soulbound )
	elseif class == "spell" then
		return string.format( "%s:%s:%s", class, v1, 0 )
	elseif class == "token" then
		return string.format( "%s:%s", class, v1 )
	else
		assert( "unknown class [" .. class .. "]" )
	end

end

function ArkInventory.ObjectIDCacheRule( i )

	if i ~= nil and type( i ) ~= "table" then
		assert( "item is not a table" )
	end
	
	local i = i or { }
	
	local soulbound = 0
	if i.sb then
		soulbound = 1
	end
	
	local internalString = ArkInventory.ObjectIDInternal( i.h )
	
	return string.format( "%i:%i:%i:%i:%s", i.loc_id or 0, i.bag_id or 0, i.slot_id or 0, soulbound, internalString )
	
end

function ArkInventory.ObjectCountClear( search_id, vault )
	
	if search_id == nil then
		return
	end
	
	local search_id = ArkInventory.ObjectIDTooltip( search_id )
	
	local cp = ArkInventory.Global.Me
	
	local player = cp.info.name
	
	if vault then 
		player = cp.info.guild_id
	end
	
	if not player then
		return
	end
	
	ArkInventory.Global.Cache.ItemCount[search_id] = nil
	
	--ArkInventory.Output( "id=", search_id, ", player=", player )
	
	if ArkInventory.Global.Cache.ItemCountRaw[search_id] and ArkInventory.Global.Cache.ItemCountRaw[search_id][player] then
		--ArkInventory.Output( "reset raw count for ", search_id, " for ", player )
		ArkInventory.Global.Cache.ItemCountRaw[search_id][player] = nil
	end
	
end

function ArkInventory.ObjectCountGet( search_id, just_me, ignore_vaults, ignore_other_faction )
	
	local search_id = ArkInventory.ObjectIDTooltip( search_id )
	
	if not ArkInventory.Global.Cache.ItemCountRaw[search_id] then
		ArkInventory.Global.Cache.ItemCountRaw[search_id] = {
--		[player] = {
--			["location"] = {
--				[loc_id] = number (count),
--			},
--			["total"] = number,
--			["vault"] = boolean,
--			["tabs"] = string ("1, 2, 3, 4, 5, 6, 7, 8")
--			["faction"] = string (english),
--		},
	}
	end
	
	local d = ArkInventory.Global.Cache.ItemCountRaw[search_id]
	
	local cp = ArkInventory.Global.Me
	
	if ( cp.info.name and not d[cp.info.name] ) or ( cp.info.guild_id and not d[cp.info.guild_id] ) then
		
		local search_alt = ArkInventory.Const.CompanionTranslation[search_id]
		
		-- build raw
		for pn, pd in pairs( ArkInventory.db.realm.player.data ) do
			
			if not d[pn] then
				
				for l, ld in pairs( pd.location ) do
					
					--ArkInventory.Output( "scanning location [", l, "] for item [", search_id, "]" )
					local c = 0
					local k = false
					local tabs = ""
					
					for b, bd in pairs( ld.bag ) do
						
						k = false
						
						if bd.h and search_id == ArkInventory.ObjectIDTooltip( bd.h ) then
							--ArkInventory.Output( "found bag [", b, "] equipped" )
							c = c + 1
							k = true
						end
						
						for s, sd in pairs( bd.slot ) do
							
							if sd and sd.h then
								
								-- primary match
								local oit = ArkInventory.ObjectIDTooltip( sd.h )
								local match = ( search_id == oit )
								
								-- secondary match
								if not match and search_alt then
									for k in pairs( search_alt ) do
										if k == oit then
											match = true
											break
										end
									end
								end
								
								if match then
									--ArkInventory.Output( pn, " has ", sd.count, " x ", sd.h, " in loc[", l, "], bag [", b, "] slot [", s, "]" )
									c = c + sd.count
									k = true
								end
								
							end
							
						end
						
						if k and l == ArkInventory.Const.Location.Vault then
							tabs = string.format( "%s%s, ", tabs, b )
						end
						
					end
					
					if not d[pn] then
						d[pn] = { ["vault"] = false, ["location"] = { }, ["total"] = 0, ["faction"] = pd.info.faction }
					end
					
					if c > 0 then
						
						if l == ArkInventory.Const.Location.Vault then
							d[pn].vault = true
							d[pn].tabs = string.sub( tabs, 1, string.len( tabs ) - 2 )
						end
						
						d[pn].location[l] = c
						
					end
					
				end
				
			end
			
		end
		
	end
	
	
	-- check cache
	if ArkInventory.Global.Cache.ItemCount[search_id] then
		return ArkInventory.Global.Cache.ItemCount[search_id]
	else
		ArkInventory.Global.Cache.ItemCount[search_id] = { }
	end
	
	-- build return
	d = ArkInventory.Global.Cache.ItemCount[search_id]
	
	for pn, pd in pairs( ArkInventory.Global.Cache.ItemCountRaw[search_id] ) do
		
		if ( not ignore_other_faction ) or ( ignore_other_faction and pd.faction == cp.info.faction ) then
			
			if ( not just_me ) or ( just_me and pn == cp.info.name ) then
				
				for l, c in pairs( pd.location ) do
					
					local ok = true
					
					if ignore_vaults and pd.vault then
						ok = false
					end
					
					if ok then
						
						if c > 0 then
							
							if not d[pn] then
								d[pn] = { ["vault"] = pd.vault, ["tabs"] = pd.tabs, ["location"] = { }, ["total"] = 0, ["faction"] = pd.faction }
							end
							
							d[pn].location[l] = c
							d[pn].total = d[pn].total + c
							
						end
						
					end
					
				end
				
			end
			
		end
		
	end
	
	table.sort( d )
	return d
	
end
