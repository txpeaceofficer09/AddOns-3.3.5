local ZygorGuidesViewer=ZygorGuidesViewer
if not ZygorGuidesViewer then return end
if UnitFactionGroup("player")~="Horde" then return end

ZygorGuidesViewer:RegisterGuide("Ares' WotLK 3.3.5a Guides\\Professions\\Mining 1-65 (Starter Hub)",[[
	author ErebusAres
	type professions
	startlevel 5
	description Starter launcher for Horde Mining 1-65 by race starting zone.
	step
		'Horde starter segments (1-65):
		.' Tirisfal Glades (Undead)
		.' Mulgore (Tauren)
		.' Durotar (Orc/Troll)
	step
		'Open Tirisfal Glades Mining 1-65. |confirm |next "Ares' WotLK 3.3.5a Guides\\Professions\\Mining 1-65\\Tirisfal Glades"
	step
		'Open Mulgore Mining 1-65. |confirm |next "Ares' WotLK 3.3.5a Guides\\Professions\\Mining 1-65\\Mulgore"
	step
		'Open Durotar Mining 1-65. |confirm |next "Ares' WotLK 3.3.5a Guides\\Professions\\Mining 1-65\\Durotar"
	step
		'Back to Professions landing page. |confirm |next "Ares' WotLK 3.3.5a Guides\\Professions\\Profession 1-450 Coverage Plan"
]])

ZygorGuidesViewer:RegisterGuide("Ares' WotLK 3.3.5a Guides\\Professions\\Mining 1-65\\Tirisfal Glades",[[
	author ErebusAres
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
		loop Tirisfal Glades,79.0,32.2;75.1,40.0;67.4,45.2;60.4,51.9;52.1,54.8;44.3,55.7;35.7,47.1;31.8,35.0;34.6,25.6;43.4,19.2;52.0,13.3;61.3,14.4;69.7,20.0;75.8,25.6 |until skill("Mining")>=65
		#include "follow_path_mine"
		skill Mining,65
	step
		'Continue with Mining 1-450 route. |confirm |next "Ares' WotLK 3.3.5a Guides\\Professions\\Mining 1-450 (WotLK Route)"
]])

ZygorGuidesViewer:RegisterGuide("Ares' WotLK 3.3.5a Guides\\Professions\\Mining 1-65\\Mulgore",[[
	author ErebusAres
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
		loop Mulgore,36.0,70.4;44.2,72.8;52.5,72.6;58.6,66.1;61.6,57.4;64.2,47.2;58.8,40.2;49.8,36.3;41.0,35.5;34.3,42.7;32.0,52.6;31.0,62.6 |until skill("Mining")>=65
		#include "follow_path_mine"
		skill Mining,65
	step
		'Continue with Mining 1-450 route. |confirm |next "Ares' WotLK 3.3.5a Guides\\Professions\\Mining 1-450 (WotLK Route)"
]])

ZygorGuidesViewer:RegisterGuide("Ares' WotLK 3.3.5a Guides\\Professions\\Mining 1-65\\Durotar",[[
	author ErebusAres
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
		loop Durotar,52.2,10.3;45.4,14.9;41.0,20.8;43.0,28.6;46.3,37.3;52.2,44.6;54.0,53.1;52.3,62.9;44.5,67.4;39.2,57.6;38.1,46.5;40.3,35.5;45.7,29.7;50.8,23.8;54.4,18.1 |until skill("Mining")>=65
		#include "follow_path_mine"
		skill Mining,65
	step
		'Continue with Mining 1-450 route. |confirm |next "Ares' WotLK 3.3.5a Guides\\Professions\\Mining 1-450 (WotLK Route)"
]])
