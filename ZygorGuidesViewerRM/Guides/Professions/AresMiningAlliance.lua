local ZygorGuidesViewer=ZygorGuidesViewer
if not ZygorGuidesViewer then return end
if UnitFactionGroup("player")~="Alliance" then return end

ZygorGuidesViewer:RegisterGuide("WoW Professions Guides\\Mining\\Mining 1-65\\Starter Hub",[[
	author wow-professions.com
	type professions
	startlevel 5
	description Starter launcher for Alliance Mining 1-65 by race starting zone.
	step
		'Choose your Alliance 1-65 starter route:
		.' Elwynn Forest (Human) |confirm |next "WoW Professions Guides\\Mining\\Mining 1-65\\Elwynn Forest"
		.' Dun Morogh (Dwarf/Gnome) |confirm |next "WoW Professions Guides\\Mining\\Mining 1-65\\Dun Morogh"
		.' Darkshore (Night Elf) |confirm |next "WoW Professions Guides\\Mining\\Mining 1-65\\Darkshore"
		.' Skip to Mining 65-125 zone selection |confirm |next "WoW Professions Guides\\Mining\\Mining 65-125\\Common"
		.' Back to Professions landing page |confirm |next "WoW Professions Guides\\Profession 1-450 Coverage Plan"
]])

ZygorGuidesViewer:RegisterGuide("WoW Professions Guides\\Mining\\Mining 1-65\\Elwynn Forest",[[
	author wow-professions.com
	type professions
	startlevel 5
	description Mining 1-65 starter segment for Elwynn Forest (Alliance/Human).
	step
		'Train Mining and buy a Mining Pick.
		#include "trainer_Mining"
		.skillmax Mining,75
		#include "vendor_Mining"
		.buy 1 Mining Pick##2901
	step
		loop Elwynn Forest,34,51;40,52;43,49;49,59;50,64;59,61;57,56;61,53;70,68;50,85;51,76;48,72;43,73;41,80;38,78;40,73;37,70;34,71;31,70;25,68;20,71;21,78;27,66;30,64;29,59;28,57;32,53 |until skill("Mining")>=65
		.' Cave nodes at 61,53 and 41,80 can be dangerous at low level.
		#include "follow_path_mine"
		skill Mining,65
	step
		'Continue with Mining 65-125 zone selection. |confirm |next "WoW Professions Guides\\Mining\\Mining 65-125\\Common"
]])

ZygorGuidesViewer:RegisterGuide("WoW Professions Guides\\Mining\\Mining 1-65\\Dun Morogh",[[
	author wow-professions.com
	type professions
	startlevel 5
	description Mining 1-65 starter segment for Dun Morogh (Alliance/Dwarf/Gnome).
	step
		'Train Mining and buy a Mining Pick.
		#include "trainer_Mining"
		.skillmax Mining,75
		#include "vendor_Mining"
		.buy 1 Mining Pick##2901
	step
		.' Dun Morogh loop 1 (East route).
		loop Dun Morogh,62,48;66,50;73,49;75,54;82,54;81,57;77,60;77,62;74,61;72,58;71,61;68,60;67,59;70,56;68,56;64,59;62,61;58,58;57,55;55,55;62,52 |until skill("Mining")>=65
		.' Cave node at 70,56 can be dangerous at low level.
		#include "follow_path_mine"
		skill Mining,65
	step
		.' Dun Morogh loop 2 (West route).
		loop Dun Morogh,44,30;38,30;37,33;35,31;31,36;28,35;29,39;28,45;25,45;25,50;26,56;29,55;30,57;32,58;31,53;36,48;35,42;40,40 |until skill("Mining")>=65
		.' Cave node at 25,50 can be dangerous at low level.
		#include "follow_path_mine"
		skill Mining,65
	step
		'Continue with Mining 65-125 zone selection. |confirm |next "WoW Professions Guides\\Mining\\Mining 65-125\\Common"
]])

ZygorGuidesViewer:RegisterGuide("WoW Professions Guides\\Mining\\Mining 1-65\\Darkshore",[[
	author wow-professions.com
	type professions
	startlevel 5
	description Mining 1-65 starter segment for Darkshore (Alliance/Night Elf).
	step
		'Train Mining and buy a Mining Pick.
		#include "trainer_Mining"
		.skillmax Mining,75
		#include "vendor_Mining"
		.buy 1 Mining Pick##2901
	step
		.' Start at Auberdine (38,44), then run this loop:
		loop Darkshore,42,45;43,51;46,50;48,37;54,33;54,28;59,24;61,20;61,7;57,18;53,18;51,22;46,21;43,22;43,35;40,37 |until skill("Mining")>=65
		#include "follow_path_mine"
		skill Mining,65
	step
		'Continue with Mining 65-125 zone selection. |confirm |next "WoW Professions Guides\\Mining\\Mining 65-125\\Common"
]])

ZygorGuidesViewer:RegisterGuide("WoW Professions Guides\\Mining\\Mining Route Selector",[[
	author wow-professions.com
	type professions
	startlevel 5
	description Full in-view selector for Alliance mining routes.
	step
		label "start"
		'Choose an Alliance mining range:
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
		'Choose an Alliance 1-65 route:
		.' Starter hub |confirm |next "WoW Professions Guides\\Mining\\Mining 1-65\\Starter Hub"
		.' Elwynn Forest |confirm |next "WoW Professions Guides\\Mining\\Mining 1-65\\Elwynn Forest"
		.' Dun Morogh |confirm |next "WoW Professions Guides\\Mining\\Mining 1-65\\Dun Morogh"
		.' Darkshore |confirm |next "WoW Professions Guides\\Mining\\Mining 1-65\\Darkshore"
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
		.' Arathi Highlands (Alliance) |confirm |next "WoW Professions Guides\\Mining\\Mining 125-175\\Arathi Highlands (Alliance)"
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
		.' Blasted Lands (Alliance) |confirm |next "WoW Professions Guides\\Mining\\Mining 245-275\\Blasted Lands (Alliance)"
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
