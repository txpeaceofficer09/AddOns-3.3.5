local Dungeons = ZGV.Dungeons

Dungeons.ExpansionsLimits = {
	[0] = 60, -- vanilla
	[1] = 70, -- tbc
	[2] = 80, -- wotlk
}

Dungeons.Phases = {
	["wotlk1"] = false,
	["wotlk2"] = false,
	["wotlk3"] = false,
	["wotlk4"] = false,
	["wotlk5"] = false,
}



-- Timewalks and legion mythics do not have any lfg entry, so we need to hardcode basic data for them
Dungeons.hardcoded_dungeons = {
	[719] =  {instanceID=48,   expansionLevel=0, minLevel=15, difficulty=1, mapid=9001, name="Blackfathom Deeps"},
	[1584] = {instanceID=230,  expansionLevel=0, minLevel=42, difficulty=1, mapid=9002, name="Blackrock Depths"},
	[2557] = {instanceID=429,  expansionLevel=0, minLevel=31, difficulty=1, mapid=9005, name="Dire Maul East", instancename="Dire Maul"},
	[2558] = {instanceID=429,  expansionLevel=0, minLevel=31, difficulty=1, mapid=9005, name="Dire Maul North", instancename="Dire Maul"},
	[2559] = {instanceID=429,  expansionLevel=0, minLevel=31, difficulty=1, mapid=9005, name="Dire Maul West", instancename="Dire Maul"},
	[721] =  {instanceID=90,   expansionLevel=0, minLevel=19, difficulty=1, mapid=9006, name="Gnomeregan"},
	[1583] = {instanceID=229,  expansionLevel=0, minLevel=48, difficulty=1, mapid=9003, name="Lower Blackrock Spire"},
	[2102] = {instanceID=349,  expansionLevel=0, minLevel=25, difficulty=1, mapid=9007, name="Maraudon Inner", instancename="Maraudon"},
	[2101] = {instanceID=349,  expansionLevel=0, minLevel=25, difficulty=1, mapid=9007, name="Maraudon Orange", instancename="Maraudon"},
	[2100] = {instanceID=349,  expansionLevel=0, minLevel=25, difficulty=1, mapid=9007, name="Maraudon Purple", instancename="Maraudon"},
	[2437] = {instanceID=389,  expansionLevel=0, minLevel=10, difficulty=1, mapid=9010, name="Ragefire Chasm"},
	[722] =  {instanceID=129,  expansionLevel=0, minLevel=35, difficulty=1, mapid=9011, name="Razorfen Downs"},
	[491] =  {instanceID=47,   expansionLevel=0, minLevel=25, difficulty=1, mapid=9012, name="Razorfen Kraul"},
	[796] =  {instanceID=1004, expansionLevel=0, minLevel=20, difficulty=1, mapid=9015, name="Scarlet Monastery Armory", instancename="Scarlet Monastery"},
	[797] =  {instanceID=1004, expansionLevel=0, minLevel=20, difficulty=1, mapid=9015, name="Scarlet Monastery Cathedral", instancename="Scarlet Monastery"},
	[798] =  {instanceID=1004, expansionLevel=0, minLevel=20, difficulty=1, mapid=9015, name="Scarlet Monastery Graveyard", instancename="Scarlet Monastery"},
	[799] =  {instanceID=1004, expansionLevel=0, minLevel=20, difficulty=1, mapid=9015, name="Scarlet Monastery Library", instancename="Scarlet Monastery"},
	[2057] = {instanceID=1007, expansionLevel=0, minLevel=33, difficulty=1, mapid=9016, name="Scholomance"},
	[209] =  {instanceID=33,   expansionLevel=0, minLevel=11, difficulty=1, mapid=9017, name="Shadowfang Keep"},
	[2017] = {instanceID=329,  expansionLevel=0, minLevel=37, difficulty=1, mapid=9018, name="Stratholme Living", instancename="Stratholme"},
	[2018] = {instanceID=329,  expansionLevel=0, minLevel=37, difficulty=1, mapid=9018, name="Stratholme Undead", instancename="Stratholme"},
	[1581] = {instanceID=36,   expansionLevel=0, minLevel=10, difficulty=1, mapid=9020, name="The Deadmines"},
	[717] =  {instanceID=34,   expansionLevel=0, minLevel=15, difficulty=1, mapid=9021, name="The Stockade"},
	[1477] = {instanceID=109,  expansionLevel=0, minLevel=45, difficulty=1, mapid=9022, name="The Temple of Atal'Hakkar"},
	[1337] = {instanceID=70,   expansionLevel=0, minLevel=30, difficulty=1, mapid=9023, name="Uldaman"},
	[1582] = {instanceID=229,  expansionLevel=0, minLevel=48, difficulty=1, mapid=9003, name="Upper Blackrock Spire"},
	[718] =  {instanceID=43,   expansionLevel=0, minLevel=10, difficulty=1, mapid=9024, name="Wailing Caverns"},
	[1176] = {instanceID=209,  expansionLevel=0, minLevel=39, difficulty=1, mapid=9025, name="Zul'Farrak"},

	[2677] = {instanceID=469, expansionLevel=0, minLevel=60, difficulty=14, mapid=9004, name="Blackwing Lair"},
	[2717] = {instanceID=409, expansionLevel=0, minLevel=60, difficulty=14, mapid=9008, name="Molten Core"},
	[3456] = {instanceID=533, expansionLevel=0, minLevel=60, difficulty=14, mapid=9009, name="Naxxramas"}, -- verify instanceID, correct difficulty once unlocked
	[2159] = {instanceID=249, expansionLevel=0, minLevel=60, difficulty=14, mapid=9010, name="Onyxia"}, -- verify instanceID
	[3429] = {instanceID=509, expansionLevel=0, minLevel=60, difficulty=14, mapid=9013, name="The Ruins of Ahn'Qiraj"},
	[3428] = {instanceID=531, expansionLevel=0, minLevel=60, difficulty=14, mapid=9019, name="The Temple of Ahn'Qiraj"},
	[0] =    {instanceID=0,   expansionLevel=0, minLevel=60, difficulty=14, mapid=-1, name="World Bosses"},
	[1977] = {instanceID=309, expansionLevel=0, minLevel=60, difficulty=14, mapid=9026, name="Zul'Gurub"}, -- verify instanceID

	[9101] =    {expansionLevel=1, minLevel=62, maxLevel=72, difficulty=1, mapid=256, name="Auchenai Crypts"},
	["9101H"] = {expansionLevel=1, minLevel=70, maxLevel=72, difficulty=2, mapid=256, name="Auchenai Crypts"},
	[9102] =    {expansionLevel=1, minLevel=57, maxLevel=75, difficulty=1, mapid=347, name="Hellfire Ramparts"},
	["9102H"] = {expansionLevel=1, minLevel=70, maxLevel=75, difficulty=2, mapid=347, name="Hellfire Ramparts"},
	[9103] =    {expansionLevel=1, minLevel=65, maxLevel=75, difficulty=1, mapid=348, name="Magisters' Terrace"},
	["9103H"] = {expansionLevel=1, minLevel=70, maxLevel=75, difficulty=2, mapid=348, name="Magisters' Terrace"},
	[9104] =    {expansionLevel=1, minLevel=61, maxLevel=71, difficulty=1, mapid=272, name="Mana-Tombs"},
	["9104H"] = {expansionLevel=1, minLevel=70, maxLevel=71, difficulty=2, mapid=272, name="Mana-Tombs"},
	[9105] =    {expansionLevel=1, minLevel=63, maxLevel=75, difficulty=1, mapid=274, name="Old Hillsbrad Foothills"},
	["9105H"] = {expansionLevel=1, minLevel=70, maxLevel=73, difficulty=2, mapid=274, name="Old Hillsbrad Foothills"},
	[9106] =    {expansionLevel=1, minLevel=63, maxLevel=73, difficulty=1, mapid=246, name="Sethekk Halls"},
	["9106H"] = {expansionLevel=1, minLevel=70, maxLevel=75, difficulty=2, mapid=246, name="Sethekk Halls"},
	[9107] =    {expansionLevel=1, minLevel=65, maxLevel=75, difficulty=1, mapid=260, name="Shadow Labyrinth"},
	["9107H"] = {expansionLevel=1, minLevel=70, maxLevel=75, difficulty=2, mapid=260, name="Shadow Labyrinth"},
	[9108] =    {expansionLevel=1, minLevel=65, maxLevel=75, difficulty=1, mapid=269, name="The Arcatraz"},
	["9108H"] = {expansionLevel=1, minLevel=70, maxLevel=75, difficulty=2, mapid=269, name="The Arcatraz"},
	[9109] =    {expansionLevel=1, minLevel=65, maxLevel=75, difficulty=1, mapid=273, name="The Black Morass"},
	["9109H"] = {expansionLevel=1, minLevel=70, maxLevel=75, difficulty=2, mapid=273, name="The Black Morass"},
	[9110] =    {expansionLevel=1, minLevel=58, maxLevel=75, difficulty=1, mapid=261, name="The Blood Furnace"},
	["9110H"] = {expansionLevel=1, minLevel=70, maxLevel=75, difficulty=2, mapid=261, name="The Blood Furnace"},
	[9111] =    {expansionLevel=1, minLevel=65, maxLevel=75, difficulty=2, mapid=266, name="The Botanica"},
	["9111H"] = {expansionLevel=1, minLevel=70, maxLevel=75, difficulty=1, mapid=266, name="The Botanica"},
	[9112] =    {expansionLevel=1, minLevel=65, maxLevel=75, difficulty=1, mapid=267, name="The Mechanar"},
	["9112H"] = {expansionLevel=1, minLevel=70, maxLevel=75, difficulty=2, mapid=267, name="The Mechanar"},
	[9113] =    {expansionLevel=1, minLevel=65, maxLevel=75, difficulty=2, mapid=246, name="The Shattered Halls"},
	["9113H"] = {expansionLevel=1, minLevel=70, maxLevel=75, difficulty=1, mapid=246, name="The Shattered Halls"},
	[9114] =    {expansionLevel=1, minLevel=59, maxLevel=75, difficulty=1, mapid=265, name="The Slave Pens"},
	["9114H"] = {expansionLevel=1, minLevel=70, maxLevel=75, difficulty=2, mapid=265, name="The Slave Pens"},
	[9115] =    {expansionLevel=1, minLevel=65, maxLevel=75, difficulty=2, mapid=263, name="The Steamvault"},
	["9115H"] = {expansionLevel=1, minLevel=70, maxLevel=75, difficulty=1, mapid=263, name="The Steamvault"},
	[9116] =    {expansionLevel=1, minLevel=60, maxLevel=70, difficulty=1, mapid=262, name="The Underbog"},
	["9116H"] = {expansionLevel=1, minLevel=70, maxLevel=70, difficulty=2, mapid=262, name="The Underbog"},

	[9117] = {expansionLevel=1, minLevel=70, difficulty=14, mapid=339, name="Black Temple"},
	[9118] = {expansionLevel=1, minLevel=70, difficulty=14, mapid=330, name="Gruul's Lair"},
	[9119] = {expansionLevel=1, minLevel=70, difficulty=14, mapid=9119, name="Hyjal Summit"},
	[9120] = {expansionLevel=1, minLevel=70, difficulty=14, mapid=9120, name="Karazhan"},
	[9121] = {expansionLevel=1, minLevel=70, difficulty=14, mapid=331, name="Magtheridon's Lair"},
	[9122] = {expansionLevel=1, minLevel=70, difficulty=14, mapid=1554, name="Serpentshrine Cavern"},
	[9123] = {expansionLevel=1, minLevel=70, difficulty=14, mapid=9123, name="Sunwell Plateau"},
	[9124] = {expansionLevel=1, minLevel=70, difficulty=14, mapid=9124, name="Tempest Keep"},
	[9125] = {expansionLevel=1, minLevel=70, difficulty=14, mapid=9125, name="Zul'Aman"},

	   [619] = {expansionLevel=2, minLevel=71, maxlevel=80, difficulty=1, mapid=132, name="Ahn'kahet: The Old Kingdom", phase="wotlk1"},
	["619H"] = {expansionLevel=2, minLevel=80, maxlevel=80, difficulty=2, mapid=132, name="Ahn'kahet: The Old Kingdom", phase="wotlk1"},
	   [601] = {expansionLevel=2, minLevel=70, maxlevel=80, difficulty=1, mapid=157, name="Azjol-Nerub", phase="wotlk1"},
	["601H"] = {expansionLevel=2, minLevel=80, maxlevel=80, difficulty=2, mapid=157, name="Azjol-Nerub", phase="wotlk1"},
	   [600] = {expansionLevel=2, minLevel=72, maxlevel=80, difficulty=1, mapid=160, name="Drak'Tharon Keep", phase="wotlk1"},
	["600H"] = {expansionLevel=2, minLevel=80, maxlevel=80, difficulty=2, mapid=160, name="Drak'Tharon Keep", phase="wotlk1"},
	   [604] = {expansionLevel=2, minLevel=74, maxlevel=80, difficulty=1, mapid=153, name="Gundrak", phase="wotlk1"},
	["604H"] = {expansionLevel=2, minLevel=80, maxlevel=80, difficulty=2, mapid=153, name="Gundrak", phase="wotlk1"},
	   [602] = {expansionLevel=2, minLevel=77, maxlevel=80, difficulty=1, mapid=138, name="Halls of Lightning", phase="wotlk1"},
	["602H"] = {expansionLevel=2, minLevel=80, maxlevel=80, difficulty=2, mapid=138, name="Halls of Lightning", phase="wotlk1"},
	   [668] = {expansionLevel=2, minLevel=79, maxlevel=80, difficulty=1, mapid=185, name="Halls of Reflection", phase="wotlk4"},
	["668H"] = {expansionLevel=2, minLevel=80, maxlevel=80, difficulty=2, mapid=185, name="Halls of Reflection", phase="wotlk4"},
	   [599] = {expansionLevel=2, minLevel=75, maxlevel=80, difficulty=1, mapid=140, name="Halls of Stone", phase="wotlk2"},
	["599H"] = {expansionLevel=2, minLevel=80, maxlevel=80, difficulty=2, mapid=140, name="Halls of Stone", phase="wotlk2"},
	   [658] = {expansionLevel=2, minLevel=79, maxlevel=80, difficulty=1, mapid=184, name="Pit of Saron", phase="wotlk4"},
	["658H"] = {expansionLevel=2, minLevel=80, maxlevel=80, difficulty=2, mapid=184, name="Pit of Saron", phase="wotlk4"},
	   [595] = {expansionLevel=2, minLevel=77, maxlevel=80, difficulty=1, mapid=130, name="The Culling of Stratholme", phase="wotlk1"},
	["595H"] = {expansionLevel=2, minLevel=80, maxlevel=80, difficulty=2, mapid=130, name="The Culling of Stratholme", phase="wotlk1"},
	   [632] = {expansionLevel=2, minLevel=79, maxlevel=80, difficulty=1, mapid=183, name="The Forge of Souls", phase="wotlk4"},
	["632H"] = {expansionLevel=2, minLevel=80, maxlevel=80, difficulty=2, mapid=183, name="The Forge of Souls", phase="wotlk4"},
	   [576] = {expansionLevel=2, minLevel=69, maxlevel=80, difficulty=1, mapid=129, name="The Nexus", phase="wotlk1"},
	["576H"] = {expansionLevel=2, minLevel=80, maxlevel=80, difficulty=2, mapid=129, name="The Nexus", phase="wotlk1"},
	   [578] = {expansionLevel=2, minLevel=77, maxlevel=80, difficulty=1, mapid=142, name="The Oculus", phase="wotlk1"},
	["578H"] = {expansionLevel=2, minLevel=80, maxlevel=80, difficulty=2, mapid=142, name="The Oculus", phase="wotlk1"},
	   [608] = {expansionLevel=2, minLevel=73, maxlevel=80, difficulty=1, mapid=168, name="The Violet Hold", phase="wotlk1"},
	["608H"] = {expansionLevel=2, minLevel=80, maxlevel=80, difficulty=2, mapid=168, name="The Violet Hold", phase="wotlk1"},
	   [650] = {expansionLevel=2, minLevel=79, maxlevel=80, difficulty=1, mapid=171, name="Trial of the Champion", phase="wotlk3"},
	["650H"] = {expansionLevel=2, minLevel=80, maxlevel=80, difficulty=2, mapid=171, name="Trial of the Champion", phase="wotlk3"},
	   [574] = {expansionLevel=2, minLevel=68, maxlevel=80, difficulty=1, mapid=133, name="Utgarde Keep", phase="wotlk1"},
	["574H"] = {expansionLevel=2, minLevel=80, maxlevel=80, difficulty=2, mapid=133, name="Utgarde Keep", phase="wotlk1"},
	   [575] = {expansionLevel=2, minLevel=77, maxlevel=80, difficulty=1, mapid=136, name="Utgarde Pinnacle", phase="wotlk1"},
	["575H"] = {expansionLevel=2, minLevel=80, maxlevel=80, difficulty=2, mapid=136, name="Utgarde Pinnacle", phase="wotlk1"},

	 ["533_10"] = {expansionLevel=2, minLevel=80, difficulty=3, mapid=162, name="Naxxramas", phase="wotlk1"},
	 ["533_25"] = {expansionLevel=2, minLevel=80, difficulty=4, mapid=162, name="Naxxramas", phase="wotlk1"},
	 ["616_25"] = {expansionLevel=2, minLevel=80, difficulty=4, mapid=141, name="The Eye of Eternity", phase="wotlk1"},
	 ["603_10"] = {expansionLevel=2, minLevel=80, difficulty=3, mapid=147, name="Ulduar", phase="wotlk2"},
	 ["603_25"] = {expansionLevel=2, minLevel=80, difficulty=4, mapid=147, name="Ulduar", phase="wotlk2"},
	 ["631_10"] = {expansionLevel=2, minLevel=80, difficulty=3, mapid=186, name="Icecrown Citadel", phase="wotlk4"},
	 ["631_25"] = {expansionLevel=2, minLevel=80, difficulty=4, mapid=186, name="Icecrown Citadel", phase="wotlk4"},
	["631_10H"] = {expansionLevel=2, minLevel=80, difficulty=5, mapid=186, name="Icecrown Citadel", phase="wotlk4"},
	["631_25H"] = {expansionLevel=2, minLevel=80, difficulty=6, mapid=186, name="Icecrown Citadel", phase="wotlk4"},
	 ["649_10"] = {expansionLevel=2, minLevel=80, difficulty=3, mapid=172, name="Trial of the Crusader", phase="wotlk3"},
	 ["649_25"] = {expansionLevel=2, minLevel=80, difficulty=4, mapid=172, name="Trial of the Crusader", phase="wotlk3"},
	 ["624_10"] = {expansionLevel=2, minLevel=80, difficulty=3, mapid=156, name="Vault of Archavon", phase="wotlk1"},
	 ["624_25"] = {expansionLevel=2, minLevel=80, difficulty=4, mapid=156, name="Vault of Archavon", phase="wotlk1"},
	 ["615_10"] = {expansionLevel=2, minLevel=80, difficulty=3, mapid=155, name="The Obsidian Sanctum", phase="wotlk1"},
	 ["615_25"] = {expansionLevel=2, minLevel=80, difficulty=4, mapid=155, name="The Obsidian Sanctum", phase="wotlk1"},
	 ["724_10"] = {expansionLevel=2, minLevel=80, difficulty=3, mapid=200, name="The Ruby Sanctum", phase="wotlk5"},
	 ["724_25"] = {expansionLevel=2, minLevel=80, difficulty=4, mapid=200, name="The Ruby Sanctum", phase="wotlk5"},
	 
}

Dungeons.max_levels = {
}

Dungeons.add_flags = {
}