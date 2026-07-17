local name,addon = ...

addon.LibRoverData = addon.LibRoverData or {}
local data=addon.LibRoverData

data.basenodes.transit = {






---------------------
----   PORTALS   ----
---------------------

	--## ALLIANCE ##--
		-- Rut'theran Village / Darnassus Pink Portal
			"Teldrassil 55.91,89.64 <region:ruttheran> -x- Darnassus 30.06,41.44 {fac:A} {mode:PORTAL} {title_atob:Enter the pink portal to Darnassus} {title_btoa:Enter the pink portal to Rut'theran Village}",

		-- Moonglade to Rut'theran Village Druid fake taxi
			"Moonglade 44.19,45.33 -to- Teldrassil 58.33,93.86 <region:ruttheran> {mode:PORTAL} {fac:A} {title:Take hippogryph to Rut'theran Village } {cost:145} {cond:ZGV:RaceClassMatch('DRUID')}",

		-- Darnassus, Kalimdor -to- Blasted Lands, Eastern Kingdoms
			"Darnassus/0 40.51,81.68 -to- Blasted Lands/0 57.50,51.12 {fac:A} {mode:PORTAL}",

	--## HORDE ##--

		-- Moonglade to Thunderbluff Druid fake taxi
			"Moonglade 44.27,45.77 -to- Thunder Bluff 46.70,49.92 {mode:PORTAL} {fac:H} {title:Take windrider to Thunder Bluff} {cost:515} {cond:ZGV:RaceClassMatch('DRUID')}",

		-- Silvermoon City to Undercity (Orb of Translocation)
			"Silvermoon City/0 49.50,14.80 -to- Undercity/0 56.93,11.40 {mode:PORTAL} {fac:H} {title:Click the Orb of Translocation\nInside the Building to\nTeleport to Undercity}",

		-- Undercity to Silvermoon City (Orb of Translocation)
			"Undercity/0 54.85,11.26 -to- Silvermoon City/0 50.62,16.45 {mode:PORTAL} {fac:H} {title:Click the Orb of Translocation\ to Teleport to Undercity}",

		-- Orgrimmar, Kalimdor -to- Blasted Lands, Eastern Kingdoms
			"Orgrimmar/0 38.07,85.70 -to- Blasted Lands/0 57.50,51.12 {fac:H} {mode:PORTAL}",

	--## NEUTRAL ##--

		-- Eastern Plaguelands / Darnassus Pink Portal
			"Eastern Plaguelands/0 59.73,12.50 -x- Ghostlands/0 51.98,97.99 {mode:PORTAL} {title_atob:Enter the Portal to\nGhostlands} {title_btoa:Enter the Portal to\nEastern Plaguelands}",
		
		-- The Dark Portal (Blasted Lands)
			"Blasted Lands/0 58.72,59.93 -to- Hellfire Peninsula/0 89.39,50.22 {mode:PORTAL} {title:Enter the Dark Portal\nto Hellfire Peninsula} "..
			"{cond:(PlayerCompletedQuest(10119) or PlayerIsOnQuest(10119)) or (PlayerCompletedQuest(9407) or PlayerIsOnQuest(9407))}",

		-- The Dark Portal (Hellfire Peninsula)
			"Hellfire Peninsula/0 89.82,50.21 -to- Blasted Lands/0 58.66,59.56 {title:Enter the Dark Portal\nto Blasted Lands} "..
			"{cond:(PlayerCompletedQuest(10119) or PlayerIsOnQuest(10119)) or (PlayerCompletedQuest(9407) or PlayerIsOnQuest(9407))}",

		-- Shattrath City, Terokkar Forest -to- Sun's Reach, Isle of Quel'Danas
			"Shattrath City/0 48.58,42.02 -to- Isle of Quel'Danas/0 48.25,34.48 {mode:PORTAL} {title:Click the Shattrath Portal\nto Isle of Quel'Danas} "..
			"{cond:PlayerCompletedQuest(11534)}",


	-- SHATTRATH PORTALS:
		"Shattrath City/0 55.19,36.49 -to- Darnassus/0 39.69,82.44 {fac:A} {mode:PORTAL} {cost:15}",
		"Shattrath City/0 55.80,36.63 -to- Stormwind City/0 49.59,86.53 {fac:A} {mode:PORTAL}",
		"Shattrath City/0 56.32,36.87 -to- Ironforge/0 25.51,8.43 {fac:A} {mode:PORTAL}",
		"Shattrath City/0 59.53,46.65 -to- The Exodar/0 47.62,59.82 {fac:A} {mode:PORTAL}",

		"Shattrath City/0 52.77,53.09 -to- Thunder Bluff/0 22.21,16.87 {fac:H} {mode:PORTAL}",
		"Shattrath City/0 52.19,52.81 -to- Orgrimmar/0 38.64,85.94 {fac:H} {mode:PORTAL}",
		"Shattrath City/0 51.65,52.56 -to- Undercity/0 84.58,16.33 {fac:H} {mode:PORTAL}",
		"Shattrath City/0 59.17,48.32 -to- Silvermoon City/0 58.26,19.24 {fac:H} {mode:PORTAL}",
	
-------------------------
-- BOATS AND ZEPPELINS --
-------------------------

	--## ALLIANCE ##--

		-- Stormwind City (Elwynn Forest) / Auberdine (Darkshore) Boat
			"Stormwind City/0 22.49,56.18 -x- Darkshore/0 32.42,43.82 {fac:A} {mode:SHIP} {title_atob:Ride the Boat to Auberdine} {title_btoa:Ride the Boat to Stormwind}",
		
		-- Rut'theran Village (Teldrassil) / Auberdine (Darkshore) Boat
			"Teldrassil 54.86,96.79 <region:ruttheran> -x- Darkshore 33.19,40.13 {fac:A} {mode:SHIP} {title_atob:Ride the Boat to Auberdine} {title_btoa:Ride the Boat to Rut'theran Village}",

		-- Menethil Harbor (Wetlands) / Theramore Isle (Dustwallow Marsh) Boat
			"Wetlands 5.08,63.40 -x- Dustwallow Marsh 71.54,56.34 {fac:A} {mode:SHIP} {title_atob:Ride the Boat to Theramore Isle} {title_btoa:Ride the Boat to Menethil Harbor}",

		-- Azuremyst Isle / Auberdine (Darkshore) Boat
			"Azuremyst Isle/0 20.42,54.17 -x- Darkshore 30.77,41.00 {fac:A} {mode:SHIP} {title_atob:Ride the Boat to Darkshore} {title_btoa:Ride the Boat to Azuremyst Isle}",



		-- DEEPRUN TRAM (Ironforge / Stormwind City)
			-- Stormwind - Elwyyn Forest, Eastern Kingdoms --
			--"Stormwind City/0 69.62,31.11 -x- Deeprun Tram/1 42.53,11.53 @deeprun_sw {mode:PORTAL} {title_atob:Enter the Deeprun Tram Portal\nand Ride the Tram to Ironforge} "..
			--	"{title_btoa:Enter Ironforge through the Portal}",

			-- Ironforge - Dun Morogh, Eastern Kingdoms --
			--"Ironforge/0 76.93,51.25 -x- Deeprun Tram/1 45.77,12.47 @deeprun_if {mode:PORTAL} {title_atob:Enter the Deeprun Tram Portal\nand Ride the Tram to Stormwind City} "..
			--	"{title_btoa:Ride the Tram to Ironforge\nand Enter Ironforge through the Portal}",
			"Stormwind City/0 69.12,30.79 -x- Ironforge 72.90,50.27 {fac:A} {mode:PORTAL} {cost:500} {title_atob:Ride the Deeprun Tram to Ironforge} {title_btoa:Ride the Deeprun Tram to Stormwind}",

		-- Northrend boat
			"Stormwind City/0 18.04,25.49 -x- Borean Tundra/0 59.7,69.4 (mode:SHIP) {fac:A}",


	--## HORDE ##--

		-- Undercity (Tirisfal Glades) / Orgrimmar (Durotar) Zeppelin
			"Tirisfal Glades 60.70,58.76 -x- Durotar 50.82,13.81 {fac:H} {mode:ZEPPELIN} {title_atob:Ride the Zeppelin to Orgrimmar} {title_btoa:Ride the Zeppelin to Undercity}",

		-- Undercity (Tirisfal Glades) / Grom'gol Base Camp (Stranglethorn Vale) Zeppelin
			"Tirisfal Glades 61.88,59.10 -x- Stranglethorn Vale 31.53,29.15 {fac:H} {mode:ZEPPELIN} {title_atob:Ride the Zeppelin to Grom'gol Base Camp} {title_btoa:Ride the Zeppelin to Undercity}",

		-- Orgrimmar (Durotar) / Grom'gol Base Camp (Stranglethorn Vale) Zeppelin
			"Durotar 50.57,12.66 -x- Stranglethorn Vale 31.35,30.12 {fac:H} {mode:ZEPPELIN} {title_atob:Ride the Zeppelin to Grom'gol Base Camp} {title_btoa:Ride the Zeppelin to Orgrimmar}",
	
		-- Northrend boat
			"Tirisfal Glades/0 59.08,59.01 -x- Howling Fjord/0 77.73,28.32 {fac:H} {mode:ZEPPELIN}",


	--## NEUTRAL ##--

		-- Booty Bay (Stranglethorn Vale) -x- Rachet (The Barrens) Boat
			"Stranglethorn Vale 25.92,73.15 -x- The Barrens 63.66,38.65 {fac:B} {mode:SHIP} {title_atob:Ride the Boat to Ratchet} {title_btoa:Ride the Boat to Booty Bay}",






------------------
-- CLASS SPELLS --
------------------

	----------------
	---   MAGE   ---		-- NOTE: ACCOUNT FOR "Rune of Teleportation" REQUIRED TO CAST TELEPORT SPELLS
	----------------
	
	--## ALLIANCE ##--
		-- Teleport: Darnassus
			"Darnassus 40.13,81.83		<spell:3565>	<faction:A>",

		-- Teleport: Exodar
			"The Exodar 47.62,59.82		<spell:32271>	<faction:A>",
		
		-- Teleport: Ironforge
			"Ironforge 25.52,8.41		<spell:3562>	<faction:A>",

		-- Teleport: Shattrath
			"Shattrath City 54.97,40.23	<spell:33690>	<faction:A>",
		
		-- Teleport: Stormwind
			"Stormwind City 49.59,86.53	<spell:3561>	<faction:A>",

		-- Teleport: Theramore
			"Dustwallow Marsh 66.00,48.99	<spell:49359>	<faction:A>",

		



	--## HORDE ##--
		-- Teleport: Orgrimmar
			"Orgrimmar 38.57,85.95		<spell:3567>	<faction:H>",

		-- Teleport: Shattrath
			"Shattrath City 53.01,49.21	<spell:35715>	<faction:H>",

		-- Teleport: Silvermoon
			"Silvermoon City 58.26,19.24	<spell:32272>	<faction:H>",

		-- Teleport: Stonard
			"Swamp of Sorrows 48.33,55.47	<spell:49358>	<faction:H>",

		-- Teleport: Thunder Bluff
			"Thunder Bluff 22.35,16.52	<spell:3566>	<faction:H>",

		-- Teleport: Undercity
			"Undercity 84.65,16.32		<spell:3563>	<faction:H>",

		
		
		
		
	

	-----------------
	---   DRUID   ---
	-----------------
		-- Teleport: Moonglade
			"Moonglade 56.26,32.46		<spell:18960>",
	


	------------------
	---   SHAMAN   ---
	------------------

		-- NOTE: ADD "Astral Recall" SPELL, IF POSSIBLE.
}
