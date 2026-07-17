local name,addon = ...

addon.LibRoverData = addon.LibRoverData or {}
local data=addon.LibRoverData

data.basenodes.DungeonEntrances = {

--------------------------------------
---   DUNGEON ENTRANCES & EXITS    ---
--------------------------------------
	-- {autotype:portal_dungeon} gives the nice "enter dungeon"/"exit dungeon" mechanics.

	--------------------
	---   KALIMDOR   ---
	--------------------

		-- RAGEFIRE CHASM
			--"Orgrimmar/2 70.33,48.92 -x- Ragefire Chasm/1 0.00,0.00 {autotype:portal_dungeon}",

		-- WAILING CAVERNS
			--"Northern Barrens/20 28.59,69.26 <radius:15> <nofly:1>",
			--"@+ -x- Northern Barrens/20 25.41,50.67 <radius:15> <dark:1> <nofly:1>",
			--"@+ -x- Northern Barrens/20 24.08,26.47 <radius:15> <dark:1> <nofly:1>",
			--"@+ -x- Northern Barrens/20 32.28,22.43 <radius:15> <dark:1> <nofly:1>",
			--"@+ -x- Northern Barrens/20 41.54,29.02 <radius:15> <dark:1> <nofly:1>",
			--"@+ -x- Northern Barrens/20 49.10,31.95 <radius:15> <dark:1> <nofly:1>",
			--"@+ -x- Northern Barrens/20 50.62,48.50 <radius:15> <dark:1> <nofly:1>",
			--"@+ -x- Northern Barrens/20 55.03,66.11 <radius:15> <dark:1> <nofly:1>",
			--"@+ -x- Wailing Caverns/1 0.00,0.00 {autotype:portal_dungeon}",

		-- BLACKFATHOM DEEPS
			--"Ashenvale/0 13.94,13.76 <radius:10> <nofly:1> <title:Enter the underwater cave>",
			--"@+ -x- Ashenvale/0 13.16,13.09 <radius:15> <dark:1> <nofly:1>",
			--"@+ -x- Ashenvale/0 13.63,11.90 <radius:15> <dark:1> <nofly:1>",
			--"@+ -x- Ashenvale/0 13.93,11.14 <radius:15> <dark:1> <nofly:1>",
			--"@+ -x- Ashenvale/0 13.68,9.39 <radius:15> <dark:1> <nofly:1>",
			--"@+ -x- Ashenvale/0 14.32,9.08 <radius:15> <dark:1> <nofly:1>",
			--"@+ -x- Ashenvale/0 14.81,10.39 <radius:15> <dark:1> <nofly:1>",
			--"@+ -x- Ashenvale/0 15.69,11.35 <radius:15> <dark:1> <nofly:1>",
			--"@+ -x- Ashenvale/0 16.53,11.67 <radius:15> <dark:1> <nofly:1>",
			--"@+ -x- Ashenvale/0 16.49,10.99 <radius:15> <dark:1> <nofly:1>",
			--"@+ -x- Blackfathom Deeps/1 0.00,0.00 {autotype:portal_dungeon}",

		-- ZUL'FARRAK
			--"Tanaris/0 39.21,21.21 -x- Zul'Farrak/0 0.00,0.00 {autotype:portal_dungeon}",

		-- RAZORFEN DOWNS
			--"Thousand Needles 47.65,23.65 -x- Razorfen Downs/1 0.00,0.00 {autotype:portal_dungeon}",

		-- RAZORFEN KRAUL
			--"Southern Barrens 40.72,94.39 -x- Razorfen Kraul 69.89,82.97 {autotype:portal_dungeon}",

		-- MARAUDON: EARTHSONG FALLS
			--"Desolace/22 44.3,76.7 -to- Maraudon 28.1,35.5 {template:cityportal}",

		-- MARAUDON: THE WICKED GROTTO
			--"Desolace/22 52.4,23.8 -x- Maraudon 78.48,68.45 {autotype:portal_dungeon}",

		-- MARAUDON: FOULSPORE CAVERN
			--"Desolace/21 78.4,55.3 -x- Maraudon 62.16,28.18 {autotype:portal_dungeon}",

		-- DIRE MAUL: WARPWOOD QUARTER
			--"Feralas/0 64.8,30.2 -x- Dire Maul/5 6.71,38.29 {autotype:portal_dungeon}",
			--"Feralas/0 66.77,34.84 -x- Dire Maul/5 28.22,84.76 {autotype:portal_dungeon}",
			--"Feralas/0 76.45,35.90 -x- Dire Maul/5 92.12,45.20 {autotype:portal_dungeon}",
			--"Dire Maul/6 36.74,38.45 -to- Feralas/0 66.11,726.31 {template:portalDungeonExit}",
			
		-- DIRE MAUL: CAPITAL GARDENS
			--"Feralas/0 60.31,31.30 -x- Dire Maul/2 93.42,75.90 {autotype:portal_dungeon}",
			--"Feralas/0 60.32,30.12 -x- Dire Maul/2 93.53,47.68 {autotype:portal_dungeon}",
			
		-- DIRE MAUL: GORDOK COMMONS
			--"Feralas 62.51,24.89 -x- Dire Maul/1 71.13,93.54 {autotype:portal_dungeon}",

		-- THE BLACK MORASS
			--"Tanaris/18 36.3,83.2 -x- The Black Morass 52.06,0.15 {autotype:portal_dungeon}",



	----------------------------
	---   EASTERN KINGDOMS   ---
	----------------------------

		--Scholomance
			--"Western Plaguelands 69.1,72.9 -x- Scholomance/1 18.1,60.9 {autotype:portal_dungeon}",
		
		-- STRATHOLME: MAIN GATE
			--"Eastern Plaguelands/0 27.61,11.63 -x- Stratholme/1 68.02,88.46 {autotype:portal_dungeon}",
			--"Eastern Plaguelands/0 26.51,11.67 -x- Stratholme/1 64.46,88.52 {autotype:portal_dungeon}",
			
		-- STRATHOLME: SERVICE ENTRACE
			--"Eastern Plaguelands/0 43.82,17.42 -x- Stratholme/2 67.74,86.29 {autotype:portal_dungeon}",
			
		--SUNKEN TEMPLE
			--"Swamp of Sorrows/0 69.33,55.62 <title:Enter the building>",
			--"@+ -x- Swamp of Sorrows/0 70.10,51.03 <dark:1> <onlyhardwire:1> <title:Run down the stairs>",
			--"@+ -x- Swamp of Sorrows/0 70.54,48.47 <radius:15> <dark:1> <onlyhardwire:1> <title:Swim under the water>",
			--"@+ -x- Swamp of Sorrows/0 70.94,45.95 <radius:15> <dark:1> <onlyhardwire:1> <title:Continue swimming>",
			--"@+ -x- Swamp of Sorrows/0 71.57,43.49 <dark:1> <onlyhardwire:1> <title:Follow the path>",
			--"@+ -x- Swamp of Sorrows/0 72.89,43.97 <dark:1> <onlyhardwire:1> <title:Follow the stairs down>",
			--"@+ -x- Swamp of Sorrows/0 73.94,44.38 <dark:1> <onlyhardwire:1> <title:Follow the path>",
			--"@+ -x- Swamp of Sorrows/0 75.00,45.44 <dark:1> <onlyhardwire:1> <title:Continue following the path>",
			--"@+ -x- Swamp of Sorrows/0 76.09,45.25 <dark:1> <onlyhardwire:1> <title:Go through the portal>",
			--"@+ -x- The Temple of Atal'Hakkar/1 0.00,0.00 {autotype:portal_dungeon}",

		--Scarlet Halls
			--"Tirisfal Glades/13 78.5,58.2 -x- Scarlet Halls/1 34.3,90.1 {autotype:portal_dungeon}",
			
		--Scarlet Monastery
			--"Tirisfal Glades/13 69.4,25.1 -x- Scarlet Monastery/1 75.7,45.8 {autotype:portal_dungeon}",

		-- ZUL'GURUB
			--"Northern Stranglethorn 72.18,32.91 -x- Zul'Gurub 30.23,48.85 {autotype:portal_dungeon}",
			
		-- ZUL'AMAN
			--"Ghostlands 82.28,64.3 -x- Zul'Aman 7.32,52.97 {autotype:portal_dungeon}",

		-- DEADMINES
			--"Westfall/17 50.94,64.98",
			--"@+ -x- Westfall/17 25.8,51.1 <dark:1> <nofly:1> <radius:10> ",
			--"@+ -x- The Deadmines/1 26.5,13.4 {autotype:portal_dungeon}",
			--"The Deadmines/2 96.17,51.66 -to- Westfall/0 41.15,83.19 <style:portal_dungeon>",
			
		-- SHADOWFANG KEEP
			--"Silverpine Forest 44.75,67.79 -x- Shadowfang Keep 69.46,60.97 {autotype:portal_dungeon}",
			
		-- THE STOCKADE
			--"Stormwind City 50.42,66.31 -x- The Stockade 50.07,68.09 {autotype:portal_dungeon}",

		-- GNOMEREGAN
			--"Dun Morogh/10 30.0,74.7 -x- Gnomeregan 64.33,28.96 {autotype:portal_dungeon}",
			
		-- ULDAMAN
			--"Badlands/18 36.7,30.1 -x- Uldaman 67.03,72.71 {autotype:portal_dungeon}",

		-- BLACKROCK DEPTHS
			"Searing Gorge/0 34.76,83.84 <radius:15> <nofly:1> <title:Follow the path>",
			"@+ -x- Eastern Kingdoms/0 47.30,68.30 <radius:15> <dark:1> <title:Enter Blackrock Mountain>",
			"@+ -x- Eastern Kingdoms/0 47.43,68.80 <radius:10> <dark:1> <title:Run down the chain>",
			"@+ -x- Eastern Kingdoms/0 47.27,69.00 <radius:7> <dark:1> <title:Enter the building and go down the second chain>",
			"@+ -x- Eastern Kingdoms/0 46.88,67.61 <radius:15> <dark:1> <title:Enter the Blackrock Depths dungeon>",
			"@+ -x- Blackrock Depths 0,0 {autotype:portal_dungeon}",
			
		-- LOWER BLACKROCK SPIRE
			--"Burning Steppes/14 80.4,41.3 -x- Blackrock Spire/4 37.9,43.3 {autotype:portal_dungeon}",
			
		-- UPPER BLACKROCK SPIRE
			--"Burning Steppes/14 79.0,34.0 -x- Upper Blackrock Spire 2/1 37.2,32.5 {autotype:portal_dungeon}",

		-- MAGISTERS' TERRACE
			--"Isle of Quel'Danas 61.28,30.92 -x- Magisters' Terrace/2 42.53,90.01 {autotype:portal_dungeon}",
			--"Magisters' Terrace/1 4.63,50.20 -to- Isle of Quel'Danas/0 47.10,30.69 {mode:PORTAL}",
			
		-- KARAZHAN
			"Deadwind Pass/0 46.88,74.70 -x- Karazhan/0 0.00,0.00 {autotype:portal_dungeon}",

	-------------------
	---   OUTLAND   ---
	-------------------


			-- HELLFIRE RAMPARTS
			"Hellfire Peninsula/0 47.56,53.60 -x- Hellfire Ramparts/0 0.00,0.00 {autotype:portal_dungeon}",
			-- THE BLOOD FURNACE
			"Hellfire Peninsula/0 45.91,51.91 -x- The Blood Furnace/0 0.00,0.00 {autotype:portal_dungeon}",
			-- THE SHATTERED HALLS
			"Hellfire Peninsula/0 47.48,52.02 -x- The Shattered Halls/0 0.00,0.00 {autotype:portal_dungeon}",
			
			{"REGION",name="coilfangpipe",mapzone="Zangarmarsh",zonematch="Coilfang Reservoir/Coilfang Reservoir//Coilfang Reservoir",nofly=1,in_flight=1,submerged=1},
			{"REGION",name="coilfangcave",center="Zangarmarsh 51.92,33.22",radius=200,mapzone="Zangarmarsh",zonematch="Zangarmarsh/Zangarmarsh/Coilfang Reservoir/Coilfang Reservoir",indoors=1,nofly=1,in_flight=1},
			"Zangarmarsh 50.36,40.85 <radius:10> -x- Zangarmarsh 50.67,40.07 <radius:10> <region:coilfangpipe> {title_atob1:Swim into the Underwater Pipe} {title_atob2:Swim through the Underwater Pipe} {title_btoa1:Swim through the Underwater Pipe} {title_btoa2:Leave the Underwater Pipe}",
			"Zangarmarsh 51.75,38.88 <region:coilfangpipe> <radius:10> -x- Zangarmarsh 51.91,37.93 <region:coilfangcave> <radius:10> {title_atob1:Swim through the Underwater Pipe} {title_atob2:Swim into the Underwater Cave} {title_btoa1:Swim into the Underwater Pipe} {title_btoa2:Swim through the Underwater Pipe}",
			-- THE STEAMVAULT
			"Zangarmarsh 50.29,33.33 <region:coilfangcave> -x- The Steamvault 17.59,29.76 {autotype:portal_dungeon}",
			-- THE SLAVE PENS
			"Zangarmarsh 48.95,35.70 <region:coilfangcave> -x- The Slave Pens 19.95,13.37 {autotype:portal_dungeon}",
			-- THE UNDERBOG
			"Zangarmarsh 54.28,34.40 <region:coilfangcave> -x- The Underbog 29.68,67.88 {autotype:portal_dungeon}",

			-- THE STEAMVAULT
			--"Zangarmarsh/0 50.39,40.85 -to- The Steamvault 17.59,29.76 {title:Swim down through the underwater pipe, then follow the path northwest in the large room you come to, then enter the Steamvault dungeon portal}",

			-- THE SLAVE PENS
			--"Zangarmarsh/0 50.39,40.85 -to- The Slave Pens 19.95,13.37 {title:Swim down through the underwater pipe, then follow the path west in the large room you come to, then enter the Steamvault dungeon portal}",

			-- THE UNDERBOG
			--"Zangarmarsh/0 50.39,40.85 -to- The Underbog 29.68,67.88 {title:Swim down through the underwater pipe, then follow the path west in the large room you come to, then enter the Steamvault dungeon portal}",

			-- MANA-TOMBS
			"Terokkar Forest 39.64,57.63 -x- Mana-Tombs 33.52,17.29 {autotype:portal_dungeon}",
			-- AUCHENAI CRYPTS
			"Terokkar Forest 34.30,65.61 -x- Auchenai Crypts/1 44.12,75.10 {autotype:portal_dungeon}",
			-- SETHEKK HALLS
			"Terokkar Forest 44.95,65.61 -x- Sethekk Halls 73.35,36.47 {autotype:portal_dungeon}",
			-- SHADOW LABYRINTH
			"Terokkar Forest 39.63,73.60 -x- Shadow Labyrinth 22.01,12.45 {autotype:portal_dungeon}",

			-- OLD HILLSBRAD FOOTHILLS
			--"Tanaris/18 26.9,35.9 -x- Old Hillsbrad Foothills 23.23,24.80 {autotype:portal_dungeon}",

			-- THE BOTANICA
			"Netherstorm/0 71.77,54.92 -x- The Botanica/0 0.00,0.00 {autotype:portal_dungeon}",

			-- THE MECHANAR
			"Netherstorm/0 70.66,69.84 -x- The Mechanar/0 49.41,83.51 {autotype:portal_dungeon}",
			--"The Mechanar/1 27.34,73.16 -to- Netherstorm/0 70.49,69.56 <style:portal_dungeon>",

			-- THE ARCATRAZ
			"Netherstorm 74.49,57.68 -x- The Arcatraz/1 41.26,81.70 {autotype:portal_dungeon}",
		
--[[
-----------------------------------
---   RAID ENTRANCES & EXITS    ---
-----------------------------------

	--------------------
	---   KALIMDOR   ---
	--------------------
		-- Temple of Ahn'Qiraj
			"Ahn'Qiraj: The Fallen Kingdom/0 46.78,7.45 -x- Ahn'Qiraj/2 52.00,26.92 {autotype:portal_dungeon}",
			
		-- Ruins of Ahn'Qiraj
			"Ahn'Qiraj: The Fallen Kingdom/0 58.92,14.29 -x- Ruins of Ahn'Qiraj/0 60.51,11.70 {autotype:portal_dungeon}",
			
			
	
	----------------------------
	---   EASTERN KINGDOMS   ---
	----------------------------
		--Molten Core
			"Blackrock Depths/2 68.8,38.2 -x- Molten Core/1 26.6,25.0 <subtype:portaldungeon>",
			"Molten Core/1 26.5,24.3 -x- Burning Steppes/16 54.1,83.1 <subtype:portaldungeon>",
			"Burning Steppes/16 54.1,83.1 -x- Molten Core/1 26.5,24.3 {autotype:portal_dungeon}",
			
		--Blackwing Lair
			"Blackrock Spire/7 54.7,22.5 -x- Blackwing Lair/1 52.5,83.6 <subtype:portaldungeon>",
			"Blackwing Lair/1 52.5,83.6 -x- Burning Steppes/14 65.6,42.2 <subtype:portaldungeon>",
			"Burning Steppes/14 64.3,70.9 -x- Blackwing Lair/1 52.5,83.6 {autotype:portal_dungeon}",	
--]]
}








data.basenodes.DungeonFloors = {
	-- Dungeons

		--Kalimdor
			--["Maraudon"] = { --
				--"Maraudon/1 15.53,56.75 -x- Maraudon/2 28.99,4.84",
			--},
			--["Blackfathom Deeps"] = {
				--"Blackfathom Deeps/1 61.51,71.88 -x- Blackfathom Deeps/2 39.21,31.65",
				--"Blackfathom Deeps/2 47.24,79.12 -x- Blackfathom Deeps/3 43.60,61.06",
			--},
			--["Dire Maul"] = { -- Can't move between wings so limits the borders.
				--"Dire Maul/2 39.22,34.98 -x- Dire Maul/3 56.27,24.42",
				--"Dire Maul/2 31.69,72.04 -x- Dire Maul/3 48.30,74.24",
				--"Dire Maul/2 20.79,19.09 -x- Dire Maul/3 44.12,13.38",
				--"Dire Maul/2 29.47,42.67 -x- Dire Maul/4 75.94,39.95",
				--"Dire Maul/5 46.43,63.58 -x- Dire Maul/6 61.27,82.67",
			--},
			--["Ahn'Qiraj"] = {
				--"Ahn'Qiraj/1 34.6,45.0 -x- Ahn'Qiraj/3 66.4,46.3",
				--"Ahn'Qiraj/1 33.0,52.4 -x- Ahn'Qiraj/3 50.5,73.0",
				--"Ahn'Qiraj/2 49.2,63.3 -x- Ahn'Qiraj/3 47.5,29.3",
			--},

		--Eastern Kingdom
			--["The Deadmines"] = {
				-- TODO there are teleporters in DM that could/should be added. Only useful if you die and need to get back to where you were.
				--"The Deadmines/1 65.48,60.02 -x- The Deadmines/2 16.97,88.45",
			--},
			--["Uldaman"] = {
				--"Uldaman/1 46.08,9.57 -x- Uldaman/2 64.77,43.35",
			--},
			--["Shadowfang Keep"] = {
				--"Shadowfang Keep/1 38.18,39.14 -x- Shadowfang Keep/2 60.03,13.01",
				--"Shadowfang Keep/1 14.78,88.35 -x- Shadowfang Keep/2 27.49,87.84",
				--"Shadowfang Keep/1 34.01,70.58 -x- Shadowfang Keep/7 23.69,75.12",
				--"Shadowfang Keep/7 45.49,25.23 -to- Shadowfang Keep/3 44.44,61.70",
				--"Shadowfang Keep/3 60.72,31.88 -to- Shadowfang Keep/7 47.37,19.47",
				--"Shadowfang Keep/3 45.86,92.67 -x- Shadowfang Keep/4 48.93,77.89",
				--"Shadowfang Keep/4 34.60,55.37 -x- Shadowfang Keep/5 48.94,77.32",
				--"Shadowfang Keep/5 56.86,44.93 -to- Shadowfang Keep/4 54.68,54.74",
				--"Shadowfang Keep/5 34.62,57.88 -x- Shadowfang Keep/6 48.75,90.71",
			--},
			--["Stratholme"] = {
			--},
			--["Scholomance"] = {
				--"Scholomance/1 81.8,23.9 -x- Scholomance/2 76.0,26.5",
				--"Scholomance/2 57.5,92.2 -x- Scholomance/3 49.7,19.2",
				--"Scholomance/3 49.8,24.0 -x- Scholomance/4 49.6,28.2",
			--},
			--["Scarlet Monastery"] = {
				--"Scarlet Monastery/1 48.4,88.5 -x- Scarlet Monastery/2 49.1,11.2",
			--},
			--["Scarlet Halls"] = {
				--"Scarlet Halls/1 55.5,13.8 -x- Scarlet Halls/2 47.8,91.1",
			--},
			--["Gnomeregan"] = {
				--"Gnomeregan/1 57.67,50.98 -to- Gnomeregan/2 81.36,46.02",
				--"Gnomeregan/1 47.05,86.94 -x- Gnomeregan/2 75.38,74.06",
				--"Gnomeregan/1 34.33,61.78 -x- Gnomeregan/2 61.73,61.55",
				--"Gnomeregan/2 35.21,88.08 -x- Gnomeregan/3 38.60,50.33",
				--"Gnomeregan/3 48.26,71.95 -x- Gnomeregan/4 71.25,77.54",
			--},
			--["Blackrock Spire"]= {
				--"Blackrock Spire/1 66.1,51.1 -x- Blackrock Spire/3 66.0,49.2",
				--"Blackrock Spire/3 58.4,47.7 -x- Blackrock Spire/1 56.7,48.3",
				--"Blackrock Spire/2 64.8,70.9 -x- Blackrock Spire/1 59.8,70.2",
				--"Blackrock Spire/2 59.5,59.3 -x- Blackrock Spire/1 59.4,63.9",
				--"Blackrock Spire/2 53.2,52.8 -x- Blackrock Spire/3 57.0,51.2",
				--"Blackrock Spire/3 49.9,74.1 -x- Blackrock Spire/2 51.1,74.2",
				--"Blackrock Spire/3 46.5,65.8 -x- Blackrock Spire/4 45.1,59.5",
				--"Blackrock Spire/4 47.2,42.7 -x- Blackrock Spire/3 55.1,37.6",
				--"Blackrock Spire/4 37.2,34.2 -x- Blackrock Spire/5 37.1,32.1",
				--"Blackrock Spire/5 33.3,13.3 -x- Blackrock Spire/6 30.4,18.7",
				--"Blackrock Spire/6 29.0,41.4 -x- Blackrock Spire/7 28.4,36.1", -- bfa alpha, cannot find map for floor 7, on live it is... somewhere, but not within BRS
				--"Blackrock Spire/7 30.7,42.7 -to- Blackrock Spire/6 30.6,41.6", --cliff
				--"Blackrock Spire/7 36.4,43.3 -to- Blackrock Spire/6 36.1,41.3",
			--},
			--["Blackrock Caverns"] = {
				--"Blackrock Caverns/1 52.05,20.12 -to- Blackrock Caverns/2 29.97,17.32",
				--"Blackrock Caverns/1 49.93,12.98 -x- Blackrock Caverns/2 29.37,13.13",
			--},

	--Raids

		-- Old world
			["Karazhan"] = {
				"Karazhan/0 38.3,78.6 -x- Karazhan/1 29.1,80.8",
				"Karazhan/1 38.6,14.1 -x- Karazhan/2 39.8,81.7",
				"Karazhan/0 53.1,64.1 -x- Karazhan/2 52.5,91.3",
				"Karazhan/2 67.0,42.4 -x- Karazhan/3 67.9,42.9",
				"Karazhan/0 37.6,12.8 -x- Karazhan/3 47.2,29.1",
				"Karazhan/3 23.5,49.2 -x- Karazhan/4 45.4,83.7",
				"Karazhan/4 67.9,26.5 -x- Karazhan/5 41.4,13.3",
				"Karazhan/5 64.9,69.2 -x- Karazhan/6 73.2,65.3",
				"Karazhan/7 51.8,58.3 -x- Karazhan/8 61.5,19.2",
				"Karazhan/8 31.0,66.3 -x- Karazhan/9 30.9,59.9",
				"Karazhan/9 37.1,23.1 -x- Karazhan/10 64.0,26.8",
				"Karazhan/9 58.8,56.0 -x- Karazhan/11 47.0,56.0",
				"Karazhan/11 25.9,61.3 -x- Karazhan/12 53.8,78.5",
				"Karazhan/11 39.6,18.8 -x- Karazhan/13 20.6,81.3",
				"Karazhan/13 83.2,57.1 -x- Karazhan/14 82.3,69.8",
				"Karazhan/14 83.2,75.5 -x- Karazhan/15 71.9,70.5",
				"Karazhan/15 66.2,79.3 -x- Karazhan/16 50.9,91.1",
			},
			--["Blackwing Lair"] = {
				--"Blackwing Lair/1 45.4,27.7 -x- Blackwing Lair/2 49.7,36.0",
				--"Blackwing Lair/1 37.6,11.2 -x- Blackwing Lair/2 44.0,22.9",
				--"Blackwing Lair/2 49.4,80.3 -x- Blackwing Lair/3 57.0,87.2",
				--"Blackwing Lair/3 31.0,37.5 -x- Blackwing Lair/4 22.0,60.9",
			--},
			--["Blackrock Depths"] = {
				--"Blackrock Depths/1 40.7,67.1 -x- Blackrock Depths/2 41.8,92.4",
				--"Blackrock Depths/1 67.0,26.3 -x- Blackrock Depths/2 64.9,57.1",
				--"Blackrock Depths/1 59.8,30.9 -x- Blackrock Depths/2 59.9,60.1",
				--"Blackrock Depths/1 58.7,34.4 -x- Blackrock Depths/2 58.9,64.7",
				--"Blackrock Depths/1 55.0,35.6 -x- Blackrock Depths/2 54.2,65.6",
				--"Blackrock Depths/1 56.9,51.3 -x- Blackrock Depths/2 56.4,77.5",
				--"Blackrock Depths/1 57.3,57.1 -x- Blackrock Depths/2 56.9,85.7",
				--"Blackrock Depths/1 54.8,62.9 -x- Blackrock Depths/2 55.2,89.9",
				--"Blackrock Depths/1 45.4,63.1 -x- Blackrock Depths/2 44.6,90.0",
				--"Blackrock Depths/1 45.0,64.3 -x- Blackrock Depths/2 44.5,91.1",
				--"Blackrock Depths/1 46.6,52.5 -x- Blackrock Depths/2 47.5,81.1",
				--"Blackrock Depths/1 42.5,46.3 -x- Blackrock Depths/2 42.3,73.6",
				--"Blackrock Depths/1 41.6,39.1 -x- Blackrock Depths/2 41.4,68.1",
				--"Blackrock Depths/1 53.0,31.8 -x- Blackrock Depths/2 53.0,61.5",
				--"Blackrock Depths/1 54.0,27.0 -x- Blackrock Depths/2 53.2,55.6",
			--},

		--Outlands
			--["The Steamvault"]={
				--"The Steamvault/1 49.85,29.26 -x- The Steamvault/2 51.23,28.93",
				--"The Steamvault/1 51.38,27.47 -to- The Steamvault/2 51.48,29.20",
				--"The Steamvault/1 48.01,77.81 -x- The Steamvault/2 46.24,79.55",
				--"The Steamvault/1 36.64,73.70 -to- The Steamvault/2 35.59,72.57",
			--},
			--["The Mechanar"]={
				--"The Mechanar/1 41.73,22.82 -x- The Mechanar/2 41.77,31.54",
			--},
			--["The Arcatraz"]={
				--"The Arcatraz/1 65.11,35.34 -x- The Arcatraz/2 89.26,43.76",
				--"The Arcatraz/2 36.51,57.12 -x- The Arcatraz/3 26.97,88.52",
			--},
			--["Sethekk Halls"]={
				--"Sethekk Halls/1 48.71,95.13 -x- Sethekk Halls/2 53.33,94.35",
				--"Sethekk Halls/2 44.61,27.42 -to- Sethekk Halls/1 51.57,27.55",
			--},
			--["Auchenai Crypts"]={
				--"Auchenai Crypts/1 44.67,17.68 -x- Auchenai Crypts/2 22.77,12.22",
			--},
			--["Black Temple"]={
				--"Black Temple/2 29.58,19.61 -x- Black Temple/1 28.02,74.29",
				--"Black Temple/1 63.09,45.70 -x- Black Temple/3 24.31,50.07",
				--"Black Temple/3 58.48,91.11 -x- Black Temple/5 66.89,68.26",
				--"Black Temple/3 26.28,21.71 -x- Black Temple/6 8.40,59.62",
				--"Black Temple/6 67.17,51.10 -x- Black Temple/7 69.01,16.15",
				--"Black Temple/7 46.72,35.00 -x- Black Temple/8 52.69,20.84",
				--"Black Temple/3 61.32,34.65 -x- Black Temple/4 64.35,39.46",
			--},
			--["Magisters' Terrace"]={
				--"Magisters' Terrace/2 82.88,44.83 -x- Magisters' Terrace/1 83.15,55.44",
			--},
}

--[[
-- translate the flooring zone-folders from names to numbers
	local TEMP={}
	for zone,zonedata in pairs(data.basenodes.DungeonFloors) do
		if type(zone)~="number" then
			local id=data.MapIDsByName[zone]
			if type(id)=="table" then id=id[1] end
			if not id then error("Map "..zone.." has no ID!") end
			zone=id
		end
		TEMP[zone]=zonedata
	end
	data.basenodes.DungeonFloors=TEMP
--]]