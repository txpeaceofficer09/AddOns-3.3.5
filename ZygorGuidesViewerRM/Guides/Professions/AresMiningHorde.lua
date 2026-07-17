local ZygorGuidesViewer=ZygorGuidesViewer
if not ZygorGuidesViewer then return end
if UnitFactionGroup("player")~="Horde" then return end

ZygorGuidesViewer:RegisterGuide("WoW Professions Guides\\Mining\\Mining 1-65\\Starter Hub",[[
	author wow-professions.com
	type professions
	startlevel 5
	description Starter launcher for Horde Mining 1-65 by race starting zone.
	step
		'Choose your Horde 1-65 starter route:
		.' Tirisfal Glades (Undead) |confirm |next "WoW Professions Guides\\Mining\\Mining 1-65\\Tirisfal Glades"
		.' Mulgore (Tauren) |confirm |next "WoW Professions Guides\\Mining\\Mining 1-65\\Mulgore"
		.' Durotar (Orc/Troll) |confirm |next "WoW Professions Guides\\Mining\\Mining 1-65\\Durotar"
		.' Skip to Mining 65-125 zone selection |confirm |next "WoW Professions Guides\\Mining\\Mining 65-125\\Common"
		.' Back to Professions landing page |confirm |next "WoW Professions Guides\\Profession 1-450 Coverage Plan"
]])

ZygorGuidesViewer:RegisterGuide("WoW Professions Guides\\Mining\\Mining 1-65\\Tirisfal Glades",[[
	author wow-professions.com
	type professions
	startlevel 5
	description Mining 1-65 starter segment for Tirisfal Glades (Horde/Undead).
	step
		'Train Mining and buy a Mining Pick.
		#include "trainer_Mining"
		.skillmax Mining,75
		#include "vendor_Mining"
		.buy 1 Mining Pick##2901
	step
		loop Tirisfal Glades,55,55;53,51;56,47;58,44;55,41;59,29;52,57;47,46;50,32;55,28;43,28;44,37;40,38;36,44;32,45;30,43;30,48;32,51;39,51;41,55;43,64;43,69;45,65;47,67;50,67;54,58 |until skill("Mining")>=65
		#include "follow_path_mine"
		skill Mining,65
	step
		'Continue with Mining 65-125 zone selection. |confirm |next "WoW Professions Guides\\Mining\\Mining 65-125\\Common"
]])

ZygorGuidesViewer:RegisterGuide("WoW Professions Guides\\Mining\\Mining 1-65\\Mulgore",[[
	author wow-professions.com
	type professions
	startlevel 5
	description Mining 1-65 starter segment for Mulgore (Horde/Tauren).
	step
		'Train Mining and buy a Mining Pick.
		#include "trainer_Mining"
		.skillmax Mining,75
		#include "vendor_Mining"
		.buy 1 Mining Pick##2901
	step
		.' Start in Thunder Bluff, head west, and skip the south loop.
		loop Mulgore,34,35;33,51;35,54;34,62;35,65;34,77;44,71;48,72;51,70;54,73;66,69;67,61;64,54;60,48;58,44;57,33;59,27;62,22;61,17;58,15;56,12;52,7;48,7;44,12;41,7;39,10;38,15;31,17;29,25 |until skill("Mining")>=65 |tip If strong enough enter cave at 61,46, clear it, and exit north at 60,34.
		.' Cave at 34,62.
		#include "follow_path_mine"
		skill Mining,65
	step
		'Continue with Mining 65-125 zone selection. |confirm |next "WoW Professions Guides\\Mining\\Mining 65-125\\Common"
]])

ZygorGuidesViewer:RegisterGuide("WoW Professions Guides\\Mining\\Mining 1-65\\Durotar",[[
	author wow-professions.com
	type professions
	startlevel 5
	description Mining 1-65 starter segment for Durotar (Horde/Orc/Troll).
	step
		'Train Mining and buy a Mining Pick.
		#include "trainer_Mining"
		.skillmax Mining,75
		#include "vendor_Mining"
		.buy 1 Mining Pick##2901
	step
		loop Durotar,44,21;42,16;39,15;38,20;39,21;36,25;42,28;39,29;39,32;44,33;47,31;47,33;46,34;47,36;45,39;40,39;36,34;35,43;38,53;41,47;43,49;48,46;50,53;52,60;51,61;56,59;61,59;58,47;58,42;56,41;56,36;54,35;53,30;53,26;54,22;52,18;50,20;53,26;50,27;48,22;49,17 |until skill("Mining")>=65 |tip After you pass Razor Hill, go inside the cave 53,30 before you jump down!
		#include "follow_path_mine"
		skill Mining,65
	step
		'Continue with Mining 65-125 zone selection. |confirm |next "WoW Professions Guides\\Mining\\Mining 65-125\\Common"
]])

ZygorGuidesViewer:RegisterGuide("WoW Professions Guides\\Mining\\Mining Route Selector",[[
	author wow-professions.com
	type professions
	startlevel 5
	description Full in-view selector for Horde mining routes.
	step
		label "start"
		'Choose a Horde mining range:
		.' Mining 1-65 |confirm |next "range_1_65"
		.' Mining 65-125 |confirm |next "range_65_125"
		.' Mining 125-175 |confirm |next "range_125_175"
		.' Mining 175-245 |confirm |next "range_175_245"
		.' Mining 245-275 |confirm |next "range_245_275"
		.' Mining 275-300 |confirm |next "range_275_300"
		.' Mining 300-325 |confirm |next "range_300_325"
		.' Mining 325-350 |confirm |next "range_325_350"
		.' Mining 350-400 |confirm |next "range_350_400"
		.' Back to Professions landing page |confirm |next "WoW Professions Guides\\Profession 1-450 Coverage Plan"
	step
		label "range_1_65"
		'Choose a Horde 1-65 route:
		.' Starter hub |confirm |next "WoW Professions Guides\\Mining\\Mining 1-65\\Starter Hub"
		.' Tirisfal Glades |confirm |next "WoW Professions Guides\\Mining\\Mining 1-65\\Tirisfal Glades"
		.' Mulgore |confirm |next "WoW Professions Guides\\Mining\\Mining 1-65\\Mulgore"
		.' Durotar |confirm |next "WoW Professions Guides\\Mining\\Mining 1-65\\Durotar"
		.' Back to range list |confirm |next "start"
	step
		label "range_65_125"
		'Choose a 65-125 route:
		.' Zone hub |confirm |next "WoW Professions Guides\\Mining\\Mining 65-125\\Common"
		.' Hillsbrad Foothills |confirm |next "WoW Professions Guides\\Mining\\Mining 65-125\\Hillsbrad Foothills"
		.' Redridge Mountains |confirm |next "WoW Professions Guides\\Mining\\Mining 65-125\\Redridge Mountains"
		.' Ashenvale |confirm |next "WoW Professions Guides\\Mining\\Mining 65-125\\Ashenvale"
		.' The Barrens |confirm |next "WoW Professions Guides\\Mining\\Mining 65-125\\The Barrens"
		.' Back to range list |confirm |next "start"
	step
		label "range_125_175"
		'Choose a 125-175 route:
		.' Zone hub |confirm |next "WoW Professions Guides\\Mining\\Mining 125-175\\Common"
		.' Arathi Highlands (Horde) |confirm |next "WoW Professions Guides\\Mining\\Mining 125-175\\Arathi Highlands (Horde)"
		.' Desolace |confirm |next "WoW Professions Guides\\Mining\\Mining 125-175\\Desolace"
		.' Thousand Needles |confirm |next "WoW Professions Guides\\Mining\\Mining 125-175\\Thousand Needles"
		.' Back to range list |confirm |next "start"
	step
		label "range_175_245"
		'Choose a 175-245 route:
		.' Zone hub |confirm |next "WoW Professions Guides\\Mining\\Mining 175-245\\Common"
		.' The Hinterlands |confirm |next "WoW Professions Guides\\Mining\\Mining 175-245\\The Hinterlands"
		.' Tanaris |confirm |next "WoW Professions Guides\\Mining\\Mining 175-245\\Tanaris"
		.' Back to range list |confirm |next "start"
	step
		label "range_245_275"
		'Choose a 245-275 route:
		.' Zone hub |confirm |next "WoW Professions Guides\\Mining\\Mining 245-275\\Common"
		.' Un'Goro Crater |confirm |next "WoW Professions Guides\\Mining\\Mining 245-275\\Un'Goro Crater"
		.' Blasted Lands (Horde) |confirm |next "WoW Professions Guides\\Mining\\Mining 245-275\\Blasted Lands (Horde)"
		.' Felwood |confirm |next "WoW Professions Guides\\Mining\\Mining 245-275\\Felwood"
		.' Back to range list |confirm |next "start"
	step
		label "range_275_300"
		'Choose a 275-300 route:
		.' Zone hub |confirm |next "WoW Professions Guides\\Mining\\Mining 275-300\\Common"
		.' Un'Goro Crater |confirm |next "WoW Professions Guides\\Mining\\Mining 275-300\\Un'Goro Crater"
		.' Eastern Plaguelands |confirm |next "WoW Professions Guides\\Mining\\Mining 275-300\\Eastern Plaguelands"
		.' Winterspring |confirm |next "WoW Professions Guides\\Mining\\Mining 275-300\\Winterspring"
		.' Burning Steppes |confirm |next "WoW Professions Guides\\Mining\\Mining 275-300\\Burning Steppes"
		.' Back to range list |confirm |next "start"
	step
		label "range_300_325"
		'Choose a 300-325 route:
		.' Zone hub |confirm |next "WoW Professions Guides\\Mining\\Mining 300-350\\BC Classic"
		.' Hellfire Peninsula (Route 1) |confirm |next "WoW Professions Guides\\Mining\\Mining 300-325\\Hellfire Peninsula (Route 1)"
		.' Hellfire Peninsula (Route 2) |confirm |next "WoW Professions Guides\\Mining\\Mining 300-325\\Hellfire Peninsula (Route 2)"
		.' Back to range list |confirm |next "start"
	step
		label "range_325_350"
		'Choose a 325-350 route:
		.' Zone hub |confirm |next "WoW Professions Guides\\Mining\\Mining 325-350\\BC Classic"
		.' Zangarmarsh |confirm |next "WoW Professions Guides\\Mining\\Mining 325-350\\Zangarmarsh"
		.' Terokkar Forest (Flying) |confirm |next "WoW Professions Guides\\Mining\\Mining 325-350\\Terokkar Forest (Flying)"
		.' Terokkar Forest (Flightless) |confirm |next "WoW Professions Guides\\Mining\\Mining 325-350\\Terokkar Forest (Flightless)"
		.' Back to range list |confirm |next "start"
	step
		label "range_350_400"
		'Choose a 350-400 route:
		.' Zone hub |confirm |next "WoW Professions Guides\\Mining\\Mining 350-400\\WotLK Classic"
		.' Borean Tundra |confirm |next "WoW Professions Guides\\Mining\\Mining 350-400\\Borean Tundra"
		.' Howling Fjord |confirm |next "WoW Professions Guides\\Mining\\Mining 350-400\\Howling Fjord"
		.' Borean Tundra (Flightless) |confirm |next "WoW Professions Guides\\Mining\\Mining 350-400\\Borean Tundra (Flightless)"
		.' Howling Fjord (Flightless) |confirm |next "WoW Professions Guides\\Mining\\Mining 350-400\\Howling Fjord (Flightless)"
		.' Back to range list |confirm |next "start"
]])
