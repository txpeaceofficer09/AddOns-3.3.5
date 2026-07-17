local name,addon = ...

addon.LibRoverData = addon.LibRoverData or {}
local data=addon.LibRoverData

data.basenodes.inns = {
	['Teldrassil']={
		{name="Shadowglen",x=58.59,y=44.79},								-- No NPC (Night Elf starter zone default hearthstone)
		{name="Dolanaar",faction="A",npc="Innkeeper Keldamyr",npcid=6736,x=55.62,y=59.79},
	},
	
	['Ghostlands']={
		{name="Tranquillien",faction="H",npc="Innkeeper Kalarin",npcid=16542,x=48.91,y=32.42},
	},

	['Bloodmyst Isle']={
		{name="Blood Watch",faction="H",npc="Caregiver Topher Loaal",npcid=17553,x=55.85,y=59.81},
	},
	
	['Dun Morogh']={
		{name="Coldridge Valley",x=29.87,y=71.98},								-- No NPC (Gnome & Dwarf starter zone default hearthstone)
		{name="Thunderbrew Distillery",faction="A",npc="Innkeeper Belm",npcid=1247,x=47.38,y=52.52},
	},

	['Elwynn Forest']={
		{name="Northshire Valley",x=48.06,y=43.65},								-- No NPC (Human starter zone default hearthstone)		
		{name="Goldshire",faction="A",npc="Innkeeper Farley",npcid=295,x=43.77,y=65.80},
	},

	['Darnassus']={
		{name="Craftsmen's Terrace",faction="A",npc="Innkeeper Saelienne",npcid=6735,x=67.42,y=15.65},
	},

	['Azuremyst Isle']={
		{name="Ammen Vale",x=84.29,y=43.02},									-- No NPC (Draenei starter zone default hearthstone)
		{name="Azure Watch",faction="A",npc="Caregiver Chellan",npcid=16553,x=48.34,y=49.15},
	},

	['Eversong Woods']={
		{name="Sunstrider Isle",x=37.97,y=21.08},									-- No NPC (Blood Elf starter zone default hearthstone)
		{name="Falconwing Square",faction="H",npc="Innkeeper Delaniel",npcid=15433,x=48.16,y=47.66},
		{name="Fairbreeze Village",faction="H",npc="Marniel Amberlight",npcid=15397,x=43.67,y=71.31},
	},
	
	['Darkshore']={
		{name="Auberdine",faction="A",npc="Innkeeper Shaussiy",npcid=6737,x=37.04,y=44.13},
	},

	['Ironforge']={
		{name="Ironforge",faction="A",npc="Innkeeper Firebrew",npcid=5111,x=18.15,y=51.45},
	},

	['Stormwind City']={
		{name="Stormwind City",faction="A",npc="Innkeeper Allison",npcid=6740,x=60.39,y=75.28},
	},

	['Loch Modan']={
		{name="Stoutlager Inn",faction="A",npc="Innkeeper Hearthstove",npcid=6734,x=35.53,y=48.40},
	},

	['Westfall']={
		{name="Sentinel Hill",faction="A",npc="Innkeeper Heather",npcid=8931,x=52.86,y=53.72},
	},

	['Redridge Mountains']={
		{name="Lakeshire",faction="A",npc="Innkeeper Brianna",npcid=6727,x=27.01,y=44.82},
	},

	['Wetlands']={
		{name="Deepwater Tavern",faction="A",npc="Innkeeper Helbrek",npcid=1464,x=10.70,y=60.95},
	},

	['Duskwood']={
		{name="Darkshire",faction="A",npc="Innkeeper Trelayne",npcid=6790,x=73.87,y=44.41},
	},

	['Ashenvale']={
		{name="Astranaar",faction="A",npc="Innkeeper Kimlya",npcid=6738,x=36.99,y=49.22},
		{name="Splintertree Post",faction="H",npc="Innkeeper Kaylisk",npcid=12196,x=73.99,y=60.65},
	},

	['Stonetalon Mountains']={
		{name="Stonetalon Peak",faction="A",npc="Innkeeper Faralia",npcid=16458,x=35.79,y=5.74},
		{name="Sun Rock Retreat",faction="H",npc="Innkeeper Jayka",npcid=7731,x=47.47,y=62.13},
	},

	['Desolace']={
		{name="Nijel's Point",faction="A",npc="Innkeeper Lyshaerya",npcid=11103,x=66.27,y=6.55},
		{name="Shadowprey Village",faction="H",npc="Innkeeper Sikewa",npcid=11106,x=24.09,y=68.21},
	},

	['Dustwallow Marsh']={
		{name="Theramore Isle",faction="A",npc="Innkeeper Janene",npcid=6272,x=66.59,y=45.22},
		{name="Mudsprocket",faction="B",npc="Axle",npcid=23995,x=41.89,y=73.89},
		{name="Brackenwall Village",faction="H",npc="\"Little\" Logok",npcid=24208,x=36.89,y=32.35},
	},

	['Tanaris']={
		{name="Gadgetzan",faction="B",npc="Innkeeper Fizzgrimble",npcid=7733,x=52.51,y=27.91},
	},

	['Durotar']={
		{name="Valley of Trials",x=43.29,y=68.85},							-- No NPC (Orc & Troll starter zone default hearthstone)
		{name="Razor Hill",faction="H",npc="Innkeeper Grosk",npcid=6928,x=51.51,y=41.64},
	},

	['Mulgore']={
		{name="Camp Narache",x=44.88,y=77.22},								-- No NPC (Tauren starter zone default hearthstone)
		{name="Bloodhoof Village",faction="H",npc="Innkeeper Kauth",npcid=6747,x=46.62,y=61.09},
	},

	['Tirisfal Glades']={
		{name="Shadow Grave",x=30.01,y=71.74},							-- No NPC (Undead starter zone default hearthstone)		
		{name="Gallows' End Tavern",faction="H",npc="Innkeeper Renee",npcid=5688,x=61.71,y=52.05},
	},

	['Orgrimmar']={
		{name="Orgrimmar",faction="H",npc="Innkeeper Gryshka",npcid=6929,x=54.10,y=68.41},
	},

	['Thunder Bluff']={
		{name="Thunder Bluff",faction="H",npc="Innkeeper Pala",npcid=6746,x=45.82,y=64.73},
	},

	['Undercity']={
		{name="Undercity",faction="H",npc="Innkeeper Norman",npcid=6741,x=67.74,y=37.89},
	},

	['Silverpine Forest']={
		{name="The Sepulcher",faction="H",npc="Innkeeper Bates",npcid=6739,x=43.18,y=41.28},
	},

	['The Barrens']={
		{name="The Crossroads",faction="H",npc="Innkeeper Boorand Plainswind",npcid=3934,x=51.99,y=29.89},
		{name="Ratchet",faction="B",npc="Innkeeper Wiley",npcid=6791,x=62.05,y=39.41},
		{name="Camp Taurajo",faction="H",npc="Byula",npcid=7714,x=45.58,y=59.04},
	},

	['Hillsbrad Foothills']={
		{name="Tarren Mill",faction="H",npc="Innkeeper Shay",npcid=2388,x=62.78,y=19.03},
		{name="Southshore",faction="A",npc="Innkeeper Anderson",npcid=2352,x=51.17,y=58.93},
	},

	['Thousand Needles']={
		{name="Freewind Post",faction="H",npc="Innkeeper Abeqwa",npcid=11116,x=46.07,y=51.52},
	},

	['Arathi Highlands']={
		{name="Hammerfall",faction="H",npc="Innkeeper Adegwa",npcid=7731,x=73.84,y=32.46},
	},

	['Stranglethorn Vale']={
		{name="Grom'gol Base Camp",faction="H",npc="Innkeeper Thulbek",npcid=5814,x=31.49,y=29.75},
		{name="Booty Bay",faction="B",npc="Innkeeper Skindle",npcid=6807,x=27.04,y=77.31},
	},

	['Swamp of Sorrows']={
		{name="Stonard",faction="H",npc="Innkeeper Karakul",npcid=6930,x=45.16,y=56.66},
	},

	['Badlands']={
		{name="Kargath",faction="H",npc="Innkeeper Shul\'kar",npcid=9356,x=2.81,y=45.85},
	},

	['Feralas']={
		{name="Feathermoon Stronghold",faction="A",npc="Innkeeper Shyria",npcid=7736,x=30.97,y=43.49},
		{name="Camp Mojache",faction="H",npc="Innkeeper Greul",npcid=7737,x=74.80,y=45.18},
	},

	['The Hinterlands']={
		{name="Wildhammer Keep",faction="A",npc="Innkeeper Thulfram",npcid=7744,x=14.15,y=41.57},
		{name="Revantusk Village",faction="H",npc="Lard",npcid=14731,x=78.14,y=81.38},
	},

	['Winterspring']={
		{name="Everlook",faction="B",npc="Innkeeper Vizzie",npcid=11118,x=61.36,y=38.83},
	},

	['Silithus']={
		{name="Cenarion Hold",faction="B",npc="Calandrath",npcid=15174,x=51.89,y=39.16},
	},

	['Eastern Plaguelands']={
		{name="Light's Hope Chapel",faction="B",npc="Jessica Chambers",npcid=16256,x=81.63,y=58.08},
	},

	['The Exodar']={
		{name="The Exodar",faction="B",npc="Caregiver Breel",npcid=16739,x=59.59,y=19.40},
	},

	['Silvermoon City']={
		{name="Silvermoon City",faction="H",npc="Innkeeper Jovia",npcid=17630,x=67.86,y=72.89},
	},



	----------------------------------------------
	---      THE BURNING CRUSADE (OUTLAND)     ---
	----------------------------------------------
	['Hellfire Peninsula']={
		{name="Honor Hold",faction="A",npc="Sid Limbardi",npcid=16826,x=54.22,y=63.60},
		{name="Temple of Telhamat",faction="A",npc="Caregiver Ophera Windfury",npcid=18906,x=23.35,y=36.36},
		{name="Thrallmar",faction="H",npc="Floyd Pinkus",npcid=16602,x=56.71,y=37.47},
		{name="Falcon Watch",faction="H",npc="Innkeeper Bazil Olof'tazun",npcid=18905,x=26.88,y=59.53},
	},

	['Zangarmarsh']={
		{name="Cenarion Refuge",faction="B",npc="Innkeeper Coryth Stoktron",npcid=18907,x=78.49,y=62.94},
		{name="Telredor",faction="A",npc="Caregiver Abidaar",npcid=18251,x=67.17,y=49.32},
		{name="Orebor Harborage",faction="A",npc="Innkeeper Kerp",npcid=18908,x=41.85,y=26.22},
		{name="Zabra'jin",faction="H",npc="Merajit",npcid=18245,x=30.66,y=50.93},
	},

	['Shattrath City']={
		{name="Shattrath City",faction="B",npc="Minalei",npcid=19046,x=28.31,y=49.42},				-- THE ALDOR
		{name="Shattrath City",faction="B",npc="Innkeeper Haelthol",npcid=19232,x=56.32,y=81.54},		-- THE SCRCYERS
	},

	['Terokkar Forest']={
		{name="Allerian Stronghold",faction="A",npc="Innkeeper Biribi",npcid=19296,x=56.70,y=53.27},
		{name="Stonebreaker Hold",faction="H",npc="Innkeeper Grilka",npcid=18957,x=48.76,y=45.05},
	},

	['Nagrand']={
		{name="Telaar",faction="A",npc="Caregiver Isel",npcid=18914,x=54.22,y=76.10},
		{name="Garadar",faction="H",npc="Matron Tikkit",npcid=18913,x=56.73,y=34.51},
	},

	['Blade\'s Edge Mountains']={
		{name="Sylvanaar",faction="A",npc="Innkeeper Shaunessy",npcid=19495,x=35.80,y=63.88},
		{name="Toshley's Station",faction="A",npc="Fizit \"Doc\" Clocktock",npcid=21110,x=60.98,y=68.11},
		{name="Evergrove",faction="B",npc="Innkeeper Aelerya",npcid=22922,x=62.87,y=38.29},
		{name="Thunderlord Stronghold",faction="H",npc="Gholah",npcid=19470,x=53.37,y=55.42},
		{name="Mok'Nathal Village",faction="H",npc="Matron Varah",npcid=21088,x=76.09,y=60.31},
	},

	['Netherstorm']={
		{name="Area 52",faction="B",npc="Innkeeper Remi Dodoso",npcid=19571,x=31.96,y=64.42},
		{name="The Stormspire",faction="B",npc="Eyonix",npcid=19531,x=43.36,y=36.14},
	},

	['Shadowmoon Valley']={
		{name="Wildhammer Stronghold",faction="A",npc="Dreg Cloudsweeper",npcid=19352,x=37.06,y=58.27},
		{name="Sanctum of the Stars",faction="B",npc="Roldemar",npcid=21744,x=56.32,y=59.84},
		{name="Altar of Sha'tar",faction="B",npc="Caretaker Aluuro",npcid=21746,x=61.12,y=28.24},
		{name="Shadowmoon Village",faction="H",npc="Innkeeper Darg Bloodclaw",npcid=19319,x=30.24,y=27.74},
	},


	---------------------------------------------------
	---      WRATH OF THE LICH KING (NORTHREND)     ---
	---------------------------------------------------

	['Borean Tundra']={
		{name="Valiance Keep",faction="A",npc="James Deacon",npcid=25245,x=58.2,y=68.0},
		{name="Fizzcrank Airstrip",faction="A",npc="\"Charlie\" Northtop",npcid=26596,x=57.0,y=18.6},
		{name="Warsong Hold",faction="H",npc="Williamson",npcid=25278,x=41.8,y=54.6},
		{name="Taunka\'le Village",faction="H",npc="Pahu Frosthoof",npcid=26709,x=76.2,y=37.2},
		{name="Unu\'pe",faction="B",npc="Caregiver Poallu",npcid=27187,x=78.4,y=49.2},
	},
	['Howling Fjord']={
		{name="Valgarde",faction="A",npc="Innkeeper Hazel Lagras",npcid=23731,x=58.4,y=62.6},
		{name="Westguard Keep",faction="A",npc="Innkeeper Celeste Goodhutch",npcid=23937,x=30.8,y=41.4},
		{name="Fort Wildervar",faction="A",npc="Christina Daniels",npcid=24057,x=60.4,y=15.8},
		{name="Vengeance Landing",faction="H",npc="Timothy Holland",npcid=24342,x=79.7,y=30.8},
		{name="New Agamand",faction="H",npc="Basil Osgood",npcid=24149,x=52.2,y=66.4},
		{name="Kamagua",faction="B",npc="Caregiver Iqniq",npcid=27148,x=25.4,y=59.8},
	},
	['Dragonblight']={
		{name="Wintergarde Keep",faction="A",npc="Illusia Lune",npcid=27042,x=77.4,y=51.6},
		{name="Stars Rest",faction="A",npc="Naohain",npcid=27052,x=28.8,y=56.0},
		{name="Camp Winterhoof",faction="H",npc="Bori Wintertotem",npcid=24033,x=49.4,y=10.8},
		{name="Venomspite",faction="H",npc="Mrs. Winterby",npcid=27027,x=76.8,y=63.0},
		{name="Agmar\'s Hammer",faction="H",npc="Barracks Master Harga",npcid=26985,x=38.2,y=46.6},
		{name="Moa\'ki Harbor",faction="B",npc="Caregiver Mumik",npcid=27174,x=48.2,y=74.6},
		{name="Wyrmrest Temple",faction="B",npc="Demestrasz",npcid=27950,x=59.8,y=54.2},
	},
	['Grizzly Hills']={
		{name="Amberpine Lodge",faction="A",npc="Jennifer Bell",npcid=27066,x=32.0,y=60.2},
		{name="Westfall Brigade Encampment",faction="A",npc="Quartermaster McCarty",npcid=26375,x=59.6,y=26.4},
		{name="Conquest Hold",faction="H",npc="Barracks Master Rhekku",npcid=27125,x=20.8,y=64.6},
		{name="Camp Oneqwah",faction="H",npc="Aiyan Coldwind",npcid=26680,x=65.4,y=47.0},
	},
	['Dalaran']={
		{name="The Silver Enclave",faction="A",npc="Isirami Fairwind",npcid=32413,x=44.6,y=63.0},
		{name="Sunreaver\'s Sanctuary",faction="H",npc="Uda the Beast",npcid=31557,x=65.6,y=32.6},
		{name="Runeweaver Square",faction="B",npc="Amisi Azuregaze",npcid=28687,x=51.0,y=40.0},
		{name="The Underbelly",faction="B",npc="Ajay Green",npcid=29532,x=37.0,y=56.8},
	},
	['The Storm Peaks']={
		{name="Frosthold",faction="A",npc="Gunda Boldhammer",npcid=29926,x=28.6,y=74.4},
		{name="Camp Tunka\'lo",faction="H",npc="Wabada Whiteflower",npcid=29971,x=67.6,y=50.6},
		{name="Grom\'arsh Crash-Site",faction="H",npc="Peon Gakra",npcid=29944,x=37.0,y=49.6},
		{name="K3",faction="B",npc="Smilin\' Slirk Brassknob",npcid=29904,x=41.0,y=85.8},
		{name="Brunnhildar Village",faction="B",npc="Lodge-Matron Embla",npcid=30005,x=48.8,y=65.0},
		{name="Bouldercrag\'s Refuge",faction="B",npc="Magorn",npcid=29963,x=30.8,y=37.2},
	},
	['Icecrown']={
		{name="Argent Tournament Grounds",faction="A",npc="Caris Sunlance",npcid=33970,x=76.2,y=19.6},
		{name="Argent Tournament Grounds",faction="H",npc="Jarin Dawnglow",npcid=33971,x=76.0,y=24.0},
		{name="Shadow Vault",faction="H",npc="Initiate Brenners",npcid=30308,x=44.0,y=22.2},
	},


}
