local name,addon = ...

addon.LibRoverData = addon.LibRoverData or {}
local data=addon.LibRoverData

-- WATCH OUT. These are GROUND ONLY, and WILL be ignored by flight!

-- indexed by continent, but that's ignored anyway.
data.basenodes.borders = {

	

	--------------------
	---   KALIMDOR   ---
	--------------------

		-- Ashenvale / Darkshore Crossing 1
			"Ashenvale 19.02,18.30 <radius:30> -x- Darkshore 37.55,96.26 <radius:30>",

		-- Ashenvale / Darkshore Crossing 2
			"Ashenvale 29.19,15.00 < radius:30>  -x- Darkshore 43.12,93.63 <radius:30>",

		"Ashenvale 42.29,71.06 <radius:10> -x- Stonetalon Mountains 78.23,42.70 <radius:10> {title_atob:Walk through the tunnel to Stonetalon Mountain} {title_btoa:Walk through the tunnel to Ashenvale}",
		
		"Ashenvale 55.75,29.28 <radius:30> -x- Felwood 54.82,91.17 <radius:30>",

		"Ashenvale 68.62,86.48 <radius:30> -x- The Barrens 48.16,4.32 <radius:15>",

		"Ashenvale 94.74,47.77 <radius:15> -x- Azshara 10.56,75.09 <radius:15> {title_atob:Cross the bridge to Azshara} {title_btoa:Cross the bridge to Ashenvale}",

		"Darnassus 86.26,35.56 <radius:15> -x- Teldrassil 36.16,54.39 <radius:15>",

		"Desolace 40.93,90.68 <radius:15> -x- Feralas 45.55,3.09 <radius:15>",

		"Desolace 53.38,5.68 <radius:15> -x- Stonetalon Mountains 30.18,75.95 <radius:15>",

		"Durotar 45.53,12.12 <radius:15> -x- Orgrimmar 52.52,84.77 <radius:15> {title_atob:Enter Orgrimmar} {title_btoa:Leave Orgrimmar}",

		"Dustwallow Marsh 28.80,47.15 <radius:30> -x- The Barrens 49.63,78.41 <radius:30>",

		"Felwood 65.08,8.14 <radius:10> -x- Moonglade 35.74,72.44 <radius:10> {title_atob:Enter the tunnel and follow it north to Moonglade} {title_btoa:Enter the tunnel and follow it west to Felwood}",

		"Felwood 65.08,8.14 <radius:10> -x- Winterspring 27.91,34.45 <radius:10> {title_atob:Enter the tunnel and follow it east to Winterspring} {title_btoa:Enter the tunnel and follow it west to Felwood}",

		"Mulgore 69.05,60.47 <radius:30> -x- The Barrens 41.40,58.57 <radius:30>",

		"Un'Goro Crater 29.31,22.36 <radius:15> -x- Silithus 84.04,13.93 <radius:15> {title_atob:Follow the path up into Silithus} {title_btoa:Follow the path down into Un'Goro Crater}",

		"Stonetalon Mountains 83.38,97.72 <radius:70> -x- The Barrens 35.72,27.50 <radius:70>",
		
		"The Barrens 44.55,86.57 <radius:30> -x- Thousand Needles 32.25,22.17 <radius:20> {title_atob:Enter the Thousand Needles and ride the elevator down} {title_btoa:Ride the elevator up and enter The Barrens}",

		"Thousand Needles 74.19,93.34 <radius:15> -x- Tanaris 50.75,24.13 <radius:20> {title_atob:Follow the path up into Tanaris} {title_btoa:Follow the path down into Thousand Needles}",

		"Tanaris 27.05,56.84 <radius:20> -x- Un'Goro Crater 71.61,77.44 <radius:15> {title_atob:Follow the path down into Un'Goro Crater} {title_btoa:Follow the path up into Tanaris}",	
		
		

	----------------------------
	---   EASTERN KINGDOMS   ---
	----------------------------

		"Elwynn Forest 32.42,50.02 <radius:20> -x- Stormwind City/0 74.40,92.79 <radius:20> {title_atob:Enter Stormwind City} {title_btoa:Leave Stormwind City}",

		"Duskwood 44.91,79.81 <radius:20> -x- Stranglethorn Vale 39.30,5.62 <radius:15> {title_atob:Follow the road into Stranglethorn Vale} {title_btoa:Follow the road into Duskwood}",

		"Duskwood 88.61,41.02 <radius:20> -x- Deadwind Pass 35.65,35.60 <radius:20>",

		"Deadwind Pass 59.11,41.16 <radius:15> -x- Swamp of Sorrows 10.37,50.22 <radius:15> {title_atob:Follow the path down into Swamp of Sorrows} {title_btoa:Follow the path up into Deadwind Pass}",

		"Swamp of Sorrows 35.64,62.07 <radius:30> -x- Blasted Lands 52.01,7.81 <radius:30>",

		"Elwynn Forest 91.26,73.48 <radius:30> -x- Redridge Mountains 10.70,71.99 <radius:30>",

		"Redridge Mountains 7.01,89.62 <radius:15> -x- Duskwood 93.78,11.37 <radius:15> {title_atob:Cross the bridge to Duskwood} {title_btoa:Cross the bridge to Redridge Mountains}",

		"Redridge Mountains 47.04,24.72 <radius:15> -x- Burning Steppes 78.31,77.57 <radius:10> {title_atob:Follow the path into Burning Steppes} {title_btoa:Follow the path into Redridge Mountains}",

		"Searing Gorge 69.54,54.29 <radius:15> -x- Badlands 4.18,61.56 <radius:15> {title_atob:Follow the path up into Badlands} {title_btoa:Follow the path up into Searing Gorge}",

		"Badlands 49.25,7.42 <radius:30> -x- Loch Modan 46.83,77.75 <radius:20>",

		"Dun Morogh 80.15,52.59 <radius:20> -x- Loch Modan 22.34,70.01 <radius:15> {title_atob:Follow the path up and through the tunnels into Loch Modan} {title_btoa:Follow the path up and through the tunnel into Dun Morogh}",

		"Dun Morogh 84.38,31.04 <radius:10> -x- Loch Modan 19.14,17.29 <radius:10> {title_atob:Enter the tunnel to Loch Modan} {title_btoa:Enter the tunnel to Dun Morogh}",

		"Loch Modan 25.57,10.29 <radius:10> -x- Wetlands 53.88,70.33 <radius:10> {title_atob:Follow the path through multiple tunnels to Wetlands} {title_btoa:Follow the path through multiple tunnels to Loch Modan}",

		"Wetlands 51.08,11.70 <radius:20> -x- Arathi Highlands 45.46,89.18 <radius:20> {title_atob:Cross the bridge into Arathi Highlands} {title_btoa:Cross the bridge into Wetlands}",

		"Arathi Highlands 20.36,29.78 <radius:20> -x- Hillsbrad Foothills 82.16,57.08 <radius:20>",

		"Hillsbrad Foothills 84.39,32.27 <radius:30> -x- The Hinterlands 11.22,51.19 <radius:20> {title_atob:Follow the path into the Hinterlands} {title_btoa:Follow the path up into Hillsbrad Foothills}",

		"The Hinterlands 20.72,47.95 <radius:15> -x- Western Plaguelands 65.28,86.79 <radius:20> {title_atob:Follow the path up into Western Plaguelands} {title_btoa:Follow the path up into the Hinterlands}",

		"Alterac Mountains 67.91,47.05 <radius:20> -x- Western Plaguelands 44.04,86.38 <radius:30> {title_atob:Follow the road into Alterac Mountains} {title_btoa:Follow the road into Western Plaguelands}",

		"Silverpine Forest 65.80,79.45 <radius:30> -x- Hillsbrad Foothills 14.13,46.20 <radius:30>",

		"Tirisfal Glades 54.88,72.60 <radius:30> -x- Silverpine Forest 66.03,7.65 <radius:30>",

		"Tirisfal Glades 84.50,70.39 <radius:15> -x- Western Plaguelands 28.99,57.48 <radius:30>",

		"Dun Morogh 53.40,35.00 <radius:15> -x- Ironforge 16.16,84.58 <radius:15> {title_atob:Enter Ironforge} {title_btoa:Leave Ironforge}",

		-- Main Undercity Entrance
			"Tirisfal Glades 61.87,65.01 <radius:10> -x- Undercity 66.22,1.89 <radius:10> {title_atob:Enter Undercity} {title_btoa:Leave Undercity}",

		-- Undercity Sewer Entrance
			"Tirisfal Glades 15.28,30.86 <radius:20> -x- Undercity 14.81,35.28 <radius:20> {title_atob:Enter Undercity through the Sewer} {title_btoa:Leave Undercity through the Sewer}",

		"Eversong Woods/0 56.66,49.68 <radius:20> -x- Silvermoon City/0 72.47,85.16 <radius:15> {title_atob:Enter Silvermoon City} {title_btoa:Leave Silvermoon City}",



	--------------------
	---   Outlands   ---
	--------------------
		"Hellfire Peninsula 8.21,49.99 <radius:30> -x- Zangarmarsh 82.35,64.76 <radius:30> {title_atob:Follow the road into Zangarmarsh} {title_btoa:Follow the road into Hellfire Peninsula}",

		"Hellfire Peninsula 37.48,89.14 <radius:40> -x- Terokkar Forest 53.05,23.04 <radius:30> {title_atob:Follow the road into Terokkar Forest} {title_btoa:Follow the road into Hellfire Peninsula}",

		"Zangarmarsh 82.08,91.99 <radius:70> -x- Terokkar Forest 34.92,13.35 <radius:30> {title_atob:Follow the road into Terokkar Forest} {title_btoa:Follow the road into Zangarmarsh}",

		"Zangarmarsh 67.44,88.23 <radius:30> -x- Nagrand 73.91,33.43 <radius:30> {title_atob:Follow the road into Nagrand} {title_btoa:Follow the road into Zangarmarsh}",

		"Zangarmarsh 21.10,68.36 <radius:30> -x- Nagrand 33.50,17.24 <radius:30> {title_atob:Follow the road into Nagrand} {title_btoa:Follow the road into Zangarmarsh}",

		"Zangarmarsh 69.31,35.69 <radius:30> -x- Blade's Edge Mountains 51.62,75.04 <radius:30> {title_atob:Follow the road up and through the tunnel\ninto Blade's Edge Mountains} {title_btoa:Enter the tunnel and\nfollow the path into Zangarmarsh}",

		"Zangarmarsh 43.01,27.30 <radius:30> -x- Blade's Edge Mountains 37.10,81.46 <radius:15> {fac:A} {title_atob:Follow the road up and through the tunnel\ninto Blade's Edge Mountains} {title_btoa:Enter the tunnel and\nfollow the path into Zangarmarsh}",
	
		"Terokkar Forest 20.74,57.29 <radius:50> -x- Nagrand 72.77,72.91 <radius:30> {title_atob:Follow the road into Nagrand} {title_btoa:Follow the road into Terokkar Forest}",

		"Terokkar Forest 70.02,48.55 <radius:70> -x- Shadowmoon Valley 23.15,29.26 <radius:40> {title_atob:Follow the road into Shadowmoon Valley} {title_btoa:Follow the road into Terokkar Forest}",

		"Terokkar Forest 35.02,13.16 <radius:40> -x- Shattrath City 58.15,26.12 <radius:30> {title_atob:Follow the road into Shattrath City} {title_btoa:Cross the bridge\nand follow the road into Terokkar Forest}",

		"Terokkar Forest 40.26,25.69 <radius:40> -x- Shattrath City 66.64,51.13 <radius:30> {title_atob:Follow the road into Shattrath City} {title_btoa:Cross the bridge\nand follow the road into Terokkar Forest}",

		"Terokkar Forest 36.54,31.72 <radius:30> -x- Shattrath City 66.64,51.13 <radius:30> {title_atob:Follow the road into Shattrath City} {title_btoa:Cross the bridge\nand follow the road into Terokkar Forest}",

		"Blade's Edge Mountains 76.10,23.00 <radius:70> -x- Netherstorm 27.31,54.08 <radius:40> {title_atob:Follow the road and\n cross the bridge into Netherstorm} {title_btoa:Follow the road and\n cross the bridge into Blade's Edge Mountains}",		



	--------------------
	---   Northrend   ---
	--------------------

		"Borean Tundra 52.80,07.00 <radius:30> -x- Sholazar Basin 32.20,91.40 <radius:30>",
		"Borean Tundra 78.90,53.60 <radius:30> -x- Dragonblight 48.00,78.70 <radius:30>",
		"Borean Tundra 93.70,35.80 <radius:30> -x- Dragonblight 08.20,54.90 <radius:30>",
		"Crystalsong Forest 39.80,38.40 <radius:30> -x- Dalaran 82.40,47.10 <radius:30>",
		"Crystalsong Forest 46.10,71.70 <radius:30> -x- Dragonblight 61.30,10.10 <radius:30>",
		"Crystalsong Forest 58.20,33.20 <radius:30> -x- Icecrown 89.1,84.30 <radius:30>",
		"Crystalsong Forest 63.60,44.30 <radius:30> -x- The Storm Peaks 30.0,94.80 <radius:30>",
		"Crystalsong Forest 86.30,44.30 <radius:30> -x- The Storm Peaks 38.6,94.80 <radius:30>",
		"Crystalsong Forest 97.10,58.50 <radius:30> -x- Zul'Drak 12.00,66.90 <radius:30>",
		"Dragonblight 48.00,78.70 <radius:30> -x- Borean Tundra 78.90,53.60 <radius:30>",
		"Dragonblight 49.60,78.40 <radius:30> -x- Howling Fjord 23.50,57.80 <radius:30>",
		"Dragonblight 89.00,24.00 <radius:30> -x- Zul'Drak 15.40,89.70 <radius:30>",
		"Dragonblight 92.00,30.80 <radius:30> -x- Grizzly Hills 08.01,31.20 <radius:30>",
		"Dragonblight 93.20,64.00 <radius:30> -x- Grizzly Hills 09.04,66.70 <radius:30>",
		"Grizzly Hills 33.70,81.30 <radius:30> -x- Howling Fjord 24.50,11.30 <radius:30>",
		"Grizzly Hills 67.30,70.00 <radius:30> -x- Howling Fjord 53.70,01.30 <radius:30>",
		"Grizzly Hills 87.90,69.90 <radius:30> -x- Howling Fjord 71.60,01.30 <radius:30>",
		"Grizzly Hills 43.00,25.30 <radius:30> -x- Zul'Drak 55.40,91.10 <radius:30>",
		"Grizzly Hills 58.70,13.80 <radius:30> -x- Zul'Drak 71.90,79.10 <radius:30>",

}