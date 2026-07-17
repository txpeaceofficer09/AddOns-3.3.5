local ZygorGuidesViewer=ZygorGuidesViewer
if not ZygorGuidesViewer then return end

ZygorGuidesViewer:RegisterGuide("WoW Professions Guides\\Mining\\Mining 65-125\\Common",[[
	author wow-professions.com
	type professions
	startlevel 10
	description Choose your next mining location after 1-65.
	description This route set is incomplete, untested, or placeholder and may contain errors.
	step
		'Before continuing, reach Mining 50 so you can learn Journeyman.
		skill Mining,50
		'Train Journeyman Mining (requires Mining 50) before farming Tin, Copper, and Silver.
		#include "trainer_Mining"
		.skillmax Mining,150
	step
		'Choose your 65-125 route:
		.' Hillsbrad Foothills |confirm |next "WoW Professions Guides\\Mining\\Mining 65-125\\Hillsbrad Foothills"
		.' Redridge Mountains |confirm |next "WoW Professions Guides\\Mining\\Mining 65-125\\Redridge Mountains"
		.' Ashenvale |confirm |next "WoW Professions Guides\\Mining\\Mining 65-125\\Ashenvale"
		.' The Barrens |confirm |next "WoW Professions Guides\\Mining\\Mining 65-125\\The Barrens"
		.' Skip to Mining 125-175 zone selection |confirm |next "WoW Professions Guides\\Mining\\Mining 125-175\\Common"
		.' Open Mining route selector |confirm |next "WoW Professions Guides\\Mining\\Mining Route Selector"
]])

ZygorGuidesViewer:RegisterGuide("WoW Professions Guides\\Mining\\Mining 65-125\\Hillsbrad Foothills",[[
	author wow-professions.com
	type professions
	startlevel 10
	description Mine Tin, Copper, and Silver in Hillsbrad to 125.
	description This route is incomplete, untested, or placeholder and may contain errors.
	step
		'Requires Mining 50. Train Journeyman here if needed.
		skill Mining,50
		#include "trainer_Mining"
		.skillmax Mining,150
	step
		.' Start north of Tarren Mill and follow this full Hillsbrad circuit.
		loop Hillsbrad Foothills,46.5,31.7;26.8,58.7;65.0,16.8;67.7,14.6;68.7,11.1;67.0,8.0;65.0,5.6;62.4,6.4;61.6,13.6;59.9,16.0;55.4,12.1;55.3,26.9;52.0,31.7;44.7,34.4;38.3,28.2;33.6,28.4;30.9,57.2;29.0,63.0;31.8,66.3;34.9,63.6;39.1,64.5;42.7,63.0;46.9,61.6;50.1,59.3;55.9,58.1;58.1,57.0;61.2,71.0;64.0,72.9;66.7,74.4;69.4,68.4;69.9,56.0;65.0,52.9;66.3,47.5;71.3,41.0;69.9,37.4;65.6,29.6;70.8,31.3;77.6,28.8;71.2,19.3 |until skill("Mining")>=125 |tip Cave detours: Azurelode Mine at 26.8,58.7 and the northern cave near 46.5,31.7.
		#include "follow_path_mine"
		skill Mining,125
	step
		'Continue with Mining 125-175 zone selection. |confirm |next "WoW Professions Guides\\Mining\\Mining 125-175\\Common"
]])

ZygorGuidesViewer:RegisterGuide("WoW Professions Guides\\Mining\\Mining 65-125\\Redridge Mountains",[[
	author wow-professions.com
	type professions
	startlevel 10
	description Mine Tin, Copper, and Silver in Redridge to 125.
	description This route is incomplete, untested, or placeholder and may contain errors.
	step
		'Requires Mining 50. Train Journeyman here if needed.
		skill Mining,50
		#include "trainer_Mining"
		.skillmax Mining,150
	step
		loop Redridge Mountains,54.5,45.2;60.7,43.7;68.7,47.2;72.9,53.4;64.1,52.4;64.7,61.9;51.8,75.3;64.3,78.2;65.1,73.6;70.4,72.0;74.2,82.3;78.3,67.4;78.2,64.2;85.3,61.1;85.8,51.0;82.6,47.2;80.7,36.9;75.6,36.7;75.5,39.2;73.3,40.6;50.7,39.8;49.3,40.2;49.8,23.7;45.7,20.2;47.9,10.7;37.8,8.7;35.1,10.8;37.4,16.1;47.1,26.2;41.9,37.6;32.5,21.9;26.8,22.5;25.1,29.9;23.5,34.7;20.6,34.3;23.3,36.3;37.1,40.2 |until skill("Mining")>=125 |tip Skip the caves if low level.
		.' Caves located at: 33.5,6.4; 20.4,26.8
		#include "follow_path_mine"
		skill Mining,125
	step
		'Continue with Mining 125-175 zone selection. |confirm |next "WoW Professions Guides\\Mining\\Mining 125-175\\Common"
]])

ZygorGuidesViewer:RegisterGuide("WoW Professions Guides\\Mining\\Mining 65-125\\Ashenvale",[[
	author wow-professions.com
	type professions
	startlevel 10
	description Mine Tin, Copper, and Silver in Ashenvale to 125.
	description This route is incomplete, untested, or placeholder and may contain errors.
	step
		'Requires Mining 50. Train Journeyman here if needed.
		skill Mining,50
		#include "trainer_Mining"
		.skillmax Mining,150
	step
		loop Ashenvale,26.5,43.2;23.8,37.4;21.3,43.5;19.3,44.2;18.0,37.3;25.4,24.8;26.5,14.7;29.0,14.3;32.3,20.7;33.8,25.4;32.1,29.1;27.9,30.3;28.6,33.4;26.8,36.5;28.2,47.7;36.6,31.8;39.3,33.0;40.5,40.2;48.0,42.9;47.6,48.1;43.4,47.5;40.5,44.4;37.4,41.3;33.8,42.7;30.5,45.8 |until skill("Mining")>=125 |tip The respawn rate should be fast enough that you don't have to enter the cave marked on the map, but there are always two Tin Veins inside, so it's worth entering with high-level characters. Cave at 39.3,30.7.
		#include "follow_path_mine"
		skill Mining,125
	step
		'Continue with Mining 125-175 zone selection. |confirm |next "WoW Professions Guides\\Mining\\Mining 125-175\\Common"
]])

ZygorGuidesViewer:RegisterGuide("WoW Professions Guides\\Mining\\Mining 65-125\\The Barrens",[[
	author wow-professions.com
	type professions
	startlevel 10
	description Mine Tin, Copper, and Silver in The Barrens to 125.
	description This route is incomplete, untested, or placeholder and may contain errors.
	step
		'Requires Mining 50. Train Journeyman here if needed.
		skill Mining,50
		#include "trainer_Mining"
		.skillmax Mining,150
	step
		.' There is more Tin and Copper on the southern route, but you can use the northern route as an alternative if the zone is crowded.
		.' The difference between them is not that big.
	step
		.' Southern route (preferred). Start at 51.0,55.3.
		loop The Barrens,51.0,55.3;48.8,58.0;43.1,59.3;40.6,51.2;38.2,50.8;38.6,55.7;35.2,54.5;35.8,48.3;31.9,49.8;30.3,47.1;27.7,48.7;28.1,41.5;25.9,39.9;23.8,41.9;21.7,39.3;22.0,33.3;18.6,32.2;18.1,36.8;15.1,32.7;12.1,34.3;10.8,31.8;11.0,38.0;16.9,41.9;12.5,36.0;13.8,30.6;13.0,24.4;12.0,20.3;13.4,13.5;19.3,22.3;19.9,26.3;22.9,24.4;24.8,27.3;33.1,29.4;35.3,27.7;36.2,31.0;38.6,30.8;41.0,40.1;44.3,38.4;55.1,46.5;55.9,49.3;58.8,50.6;60.6,46.5;63.0,46.7;63.2,51.6;67.2,50.2;72.7,54.3;78.4,50.4;85.2,55.1;78.7,61.9;88.6,63.0;88.2,69.7;88.9,77.3;86.6,82.9;81.7,89.7;77.9,89.1;74.8,92.2;69.3,89.5;66.8,86.4;68.2,78.6;69.9,69.7;66.8,62.7;57.7,56.3;53.8,53.6;44.4,36.7;27.4,51.1 |until skill("Mining")>=125 |tip Caves: NE 44.4,36.7 and SW 27.4,51.1.
		#include "follow_path_mine"
		skill Mining,125
	step
		.' Northern route (alternative). Start at 53.3,27.9.
		loop The Barrens,53.3,27.9;55.0,27.5;55.1,25.0;58.3,24.1;57.0,16.1;53.6,16.1;53.1,18.4;51.0,11.8;50.2,15.7;48.3,14.3;47.1,11.4;44.1,11.4;41.2,14.0;40.0,10.7;38.4,11.2;38.3,14.0;36.2,16.5;40.6,19.0;39.9,21.9;40.1,27.4;43.0,29.1;44.4,21.7;46.5,21.9;51.0,23.3 |until skill("Mining")>=125
		#include "follow_path_mine"
		skill Mining,125
	step
		'Continue with Mining 125-175 zone selection. |confirm |next "WoW Professions Guides\\Mining\\Mining 125-175\\Common"
]])

ZygorGuidesViewer:RegisterGuide("WoW Professions Guides\\Mining\\Mining 125-175\\Common",[[
	author wow-professions.com
	type professions
	startlevel 10
	description Choose your next mining location after 65-125.
	description This route set is incomplete, untested, or placeholder and may contain errors.
	step
		'Visit your trainer and learn Expert Mining (requires level 10).
		skill Mining,125
		#include "trainer_Mining"
		.skillmax Mining,225
	step
		'Ores in these zones:
		.' Iron Ore
		.' Tin Ore
		.' Gold Ore
	step
		'Choose your 125-175 route:
		.' Arathi Highlands (Alliance) |confirm |next "WoW Professions Guides\\Mining\\Mining 125-175\\Arathi Highlands (Alliance)"
		.' Arathi Highlands (Horde) |confirm |next "WoW Professions Guides\\Mining\\Mining 125-175\\Arathi Highlands (Horde)"
		.' Desolace |confirm |next "WoW Professions Guides\\Mining\\Mining 125-175\\Desolace"
		.' Thousand Needles |confirm |next "WoW Professions Guides\\Mining\\Mining 125-175\\Thousand Needles"
		.' Skip to Mining 175-245 zone selection |confirm |next "WoW Professions Guides\\Mining\\Mining 175-245\\Common"
		.' Open Mining route selector |confirm |next "WoW Professions Guides\\Mining\\Mining Route Selector"
]])

ZygorGuidesViewer:RegisterGuide("WoW Professions Guides\\Mining\\Mining 125-175\\Arathi Highlands (Alliance)",[[
	author wow-professions.com
	type professions
	faction alliance
	startlevel 10
	description Mine Iron, Tin, and Gold in Arathi Highlands to 175 (Alliance variant).
	description This route is incomplete, untested, or placeholder and may contain errors.
	step
		'Requires Mining 125. Train Expert here if needed.
		skill Mining,125
		#include "trainer_Mining"
		.skillmax Mining,225
	step
		loop Arathi Highlands,49.1,51.1;53.3,36.7;50.0,38.7;47.6,37.5;34.6,43.9;53.8,77.1;69.2,74.8;81.1,35.4;39.7,43.0;38.9,47.0;35.7,41.8;42.5,34.0;39.2,26.8;31.1,20.0;27.6,19.3;29.8,31.3;24.1,27.8;24.1,33.6;20.2,33.2;23.5,44.3;30.5,51.7;31.6,56.2;32.7,61.8;34.0,64.9;37.5,57.7;39.2,61.8;39.7,68.8;41.8,72.1;42.7,76.4;52.0,76.7;54.2,73.8;55.1,66.6;62.1,72.1;64.6,65.9;65.5,73.2;70.4,71.1;72.5,60.8;71.2,48.6;80.0,39.1;79.3,34.0;77.1,32.1;76.2,29.0;65.6,27.4;63.9,31.9;59.5,32.5;59.8,41.6 |until skill("Mining")>=175 |tip Skip the caves if low level.
		.' Caves located at: 34.6,43.9; 53.8,77.1; 69.2,74.8; 81.1,35.4
		.' Start from Refuge Pointe at: 49.1,51.1; 53.3,36.7
		.' Alliance detour near Hammerfall: 71.2,48.6; 65.6,27.4
		#include "follow_path_mine"
		skill Mining,175
	step
		'Continue with Mining 175-245 zone selection. |confirm |next "WoW Professions Guides\\Mining\\Mining 175-245\\Common"
]])

ZygorGuidesViewer:RegisterGuide("WoW Professions Guides\\Mining\\Mining 125-175\\Arathi Highlands (Horde)",[[
	author wow-professions.com
	type professions
	faction horde
	startlevel 10
	description Mine Iron, Tin, and Gold in Arathi Highlands to 175 (Horde variant).
	description This route is incomplete, untested, or placeholder and may contain errors.
	step
		'Requires Mining 125. Train Expert here if needed.
		skill Mining,125
		#include "trainer_Mining"
		.skillmax Mining,225
	step
		loop Arathi Highlands,80.0,39.1;79.3,34.0;77.1,32.1;76.2,29.0;65.6,27.4;63.9,31.9;59.5,32.5;59.8,41.6;49.1,51.1;53.3,36.7;50.0,38.7;47.6,37.5;34.6,43.9;53.8,77.1;69.2,74.8;81.1,35.4;39.7,43.0;38.9,47.0;35.7,41.8;42.5,34.0;39.2,26.8;31.1,20.0;27.6,19.3;29.8,31.3;24.1,27.8;24.1,33.6;20.2,33.2;23.5,44.3;30.5,51.7;31.6,56.2;32.7,61.8;34.0,64.9;37.5,57.7;39.2,61.8;39.7,68.8;41.8,72.1;42.7,76.4;52.0,76.7;54.2,73.8;55.1,66.6;62.1,72.1;64.6,65.9;65.5,73.2;70.4,71.1;72.5,60.8;71.2,48.6 |until skill("Mining")>=175 |tip Skip the caves if low level.
		.' Caves located at: 34.6,43.9; 53.8,77.1; 69.2,74.8; 81.1,35.4
		.' Start from Hammerfall if available: 80.0,39.1; 79.3,34.0
		#include "follow_path_mine"
		skill Mining,175
	step
		'Continue with Mining 175-245 zone selection. |confirm |next "WoW Professions Guides\\Mining\\Mining 175-245\\Common"
]])

ZygorGuidesViewer:RegisterGuide("WoW Professions Guides\\Mining\\Mining 125-175\\Desolace",[[
	author wow-professions.com
	type professions
	startlevel 10
	description Mine Iron, Tin, and Gold in Desolace to 175.
	description This route is incomplete, untested, or placeholder and may contain errors.
	step
		'Requires Mining 125. Train Expert here if needed.
		skill Mining,125
		#include "trainer_Mining"
		.skillmax Mining,225
	step
		loop Desolace,41.3,77.3;45.5,74.8;48.1,71.5;45.8,78.1;50.9,92.5;53.3,86.9;55.1,84.5;60.7,80.4;59.5,84.1;59.0,87.2;59.9,90.0;66.5,88.6;65.9,83.0;65.8,74.6;64.5,70.4;60.4,67.8;62.6,65.3;70.9,63.9;70.9,58.5;74.7,57.5;74.8,54.6;78.1,53.3;72.5,44.9;75.5,37.0;78.7,36.4;78.4,33.8;73.4,33.5;65.9,35.8;65.5,42.4;64.6,60.3;62.0,49.4;56.6,43.8;50.7,42.8;48.1,37.3;48.3,33.1;49.4,30.0;51.8,23.9;47.9,23.4;44.5,16.8;44.3,21.8;41.5,25.9;42.0,29.2;41.1,33.1;39.7,39.3;40.9,45.7;40.6,54.0;45.7,51.1;48.4,51.3;48.8,54.6;47.4,59.1;47.9,62.6;46.3,65.1;44.3,65.7;42.6,63.8;39.3,66.9;38.9,72.7;38.9,76.6 |until skill("Mining")>=175
		#include "follow_path_mine"
		skill Mining,175
	step
		'Continue with Mining 175-245 zone selection. |confirm |next "WoW Professions Guides\\Mining\\Mining 175-245\\Common"
]])

ZygorGuidesViewer:RegisterGuide("WoW Professions Guides\\Mining\\Mining 125-175\\Thousand Needles",[[
	author wow-professions.com
	type professions
	startlevel 10
	description Mine Iron, Tin, and Gold in Thousand Needles to 175.
	description This route is incomplete, untested, or placeholder and may contain errors.
	step
		'Requires Mining 125. Train Expert here if needed.
		skill Mining,125
		#include "trainer_Mining"
		.skillmax Mining,225
	step
		loop Thousand Needles,12.0,24.0;16.0,34.0;14.0,46.0;16.0,58.0;22.0,71.0;30.0,80.0;40.0,87.0;50.0,88.0;57.0,80.0;61.0,70.0;66.0,61.0;72.0,52.0;79.0,44.0;86.0,39.0;94.0,40.0;95.0,50.0;89.0,59.0;80.0,64.0;70.0,67.0;59.0,70.0;48.0,73.0;37.0,72.0;28.0,65.0;22.0,54.0;22.0,43.0;27.0,34.0;36.0,28.0;48.0,24.0;60.0,25.0;72.0,29.0;84.0,34.0 |until skill("Mining")>=175 |tip Two caves are on this route.
		#include "follow_path_mine"
		skill Mining,175
	step
		'Continue with Mining 175-245 zone selection. |confirm |next "WoW Professions Guides\\Mining\\Mining 175-245\\Common"
]])

ZygorGuidesViewer:RegisterGuide("WoW Professions Guides\\Mining\\Mining 175-245\\Common",[[
	author wow-professions.com
	type professions
	startlevel 25
	description Choose your next mining location after 125-175.
	description This route set is incomplete, untested, or placeholder and may contain errors.
	step
		'Requires Mining 175.
		skill Mining,175
	step
		'Don't forget to visit your Mining trainer and learn Artisan Mining between 200 and 225.
		.' Artisan Mining requires level 25 and Mining skill 200.
	step
		'Ores in these zones:
		.' Mithril Ore
		.' Truesilver Ore
	step
		'Choose your 175-245 route:
		.' The Hinterlands |confirm |next "WoW Professions Guides\\Mining\\Mining 175-245\\The Hinterlands"
		.' Tanaris |confirm |next "WoW Professions Guides\\Mining\\Mining 175-245\\Tanaris"
		.' Skip to Mining 245-275 zone selection |confirm |next "WoW Professions Guides\\Mining\\Mining 245-275\\Common"
		.' Open Mining route selector |confirm |next "WoW Professions Guides\\Mining\\Mining Route Selector"
]])

ZygorGuidesViewer:RegisterGuide("WoW Professions Guides\\Mining\\Mining 175-245\\The Hinterlands",[[
	author wow-professions.com
	type professions
	startlevel 25
	description Mine Mithril and Truesilver in The Hinterlands to 245.
	description This route is incomplete, untested, or placeholder and may contain errors.
	step
		'Requires Mining 175. Train Expert/Artisan here if needed.
		skill Mining,175
		#include "trainer_Mining"
		.skillmax Mining,300
	step
		loop The Hinterlands,71.8,60.4;77.8,48.8;68.5,52.7;64.8,49.0;63.9,42.6;57.6,39.5;61.9,39.3;55.9,39.5;50.7,46.8;47.9,40.8;46.6,36.2;44.9,43.4;41.4,45.3;40.0,48.4;35.7,43.7;32.1,42.6;32.7,47.0;30.8,50.3;27.3,53.3;23.8,52.7;22.1,56.9;25.6,60.4;26.6,66.1;28.8,65.7;31.2,55.6;35.1,62.4;34.7,65.9;30.8,69.8;31.3,73.8;34.1,74.2;37.0,71.5;36.0,66.8;36.6,63.5;41.5,60.4;42.2,65.3;45.0,70.1;48.0,69.2;50.6,71.7;51.6,68.8;50.9,64.3;52.8,55.8;56.6,50.3;60.3,54.6;63.0,59.5;63.6,63.7;67.2,64.7;72.6,65.1;70.4,63.0 |until skill("Mining")>=245 |tip Start at 71.8,60.4, then 77.8,48.8; 68.5,52.7; 64.8,49.0. Cave at 57.6,39.5. White route shortcut: 61.9,39.3 -> 55.9,39.5.
		#include "follow_path_mine"
		skill Mining,245
	step
		.' Optional northern red route for higher-level characters. |only if level>=62
		loop The Hinterlands,61.9,39.3;63.4,34.2;66.5,34.6;67.7,22.6;65.8,20.8;69.1,14.8;64.1,17.3;58.8,19.3;59.8,24.1;59.3,32.1;55.9,39.5 |only if level>=62 |tip The red route is best reserved for level 62+ due to elite mobs.
		#include "follow_path_mine"
		skill Mining,245
	step
		'Continue with Mining 245-275 zone selection. |confirm |next "WoW Professions Guides\\Mining\\Mining 245-275\\Common"
]])

ZygorGuidesViewer:RegisterGuide("WoW Professions Guides\\Mining\\Mining 175-245\\Tanaris",[[
	author wow-professions.com
	type professions
	startlevel 25
	description Mine Mithril and Truesilver in Tanaris to 245.
	description This route is incomplete, untested, or placeholder and may contain errors.
	step
		'Requires Mining 175. Train Expert/Artisan here if needed.
		skill Mining,175
		#include "trainer_Mining"
		.skillmax Mining,300
	step
		loop Tanaris,56.0,27.3;52.5,25.0;47.6,25.4;45.9,28.7;44.2,26.7;35.8,25.8;35.6,29.3;38.6,32.0;34.5,37.4;31.8,49.6;40.2,55.9;45.7,55.5;30.1,51.8;28.4,59.5;30.1,62.1;30.5,67.1;29.4,70.0;29.2,72.4;29.7,74.9;31.2,76.4;35.3,76.6;36.9,79.2;40.5,77.4;44.8,76.1;48.3,76.2;51.2,76.4;56.4,67.9;57.9,66.3;55.8,63.6;62.0,60.9;61.0,54.7;65.1,55.7;69.2,55.1;71.3,45.6;68.3,40.3;66.5,37.2;66.7,32.4;59.0,32.9 |until skill("Mining")>=245 |tip Skip the caves if low level.
		.' Caves located at: 34.0,42.7; 33.1,48.1; 54.7,68.5; 53.7,75.1
		#include "follow_path_mine"
		skill Mining,245
	step
		'Continue with Mining 245-275 zone selection. |confirm |next "WoW Professions Guides\\Mining\\Mining 245-275\\Common"
]])

ZygorGuidesViewer:RegisterGuide("WoW Professions Guides\\Mining\\Mining 245-275\\Common",[[
	author wow-professions.com
	type professions
	startlevel 25
	description Choose your next mining location after 175-245.
	description This route set is incomplete, untested, or placeholder and may contain errors.
	step
		'Requires Mining 245.
		skill Mining,245
	step
		'Ores in these zones:
		.' Mithril Ore
		.' Truesilver Ore
		.' Thorium Ore
	step
		'Choose your 245-275 route:
		.' Un'Goro Crater |confirm |next "WoW Professions Guides\\Mining\\Mining 245-275\\Un'Goro Crater"
		.' Blasted Lands (Alliance) |confirm |next "WoW Professions Guides\\Mining\\Mining 245-275\\Blasted Lands (Alliance)"
		.' Blasted Lands (Horde) |confirm |next "WoW Professions Guides\\Mining\\Mining 245-275\\Blasted Lands (Horde)"
		.' Felwood |confirm |next "WoW Professions Guides\\Mining\\Mining 245-275\\Felwood"
		.' Skip to Mining 275-300 zone selection |confirm |next "WoW Professions Guides\\Mining\\Mining 275-300\\Common"
		.' Open Mining route selector |confirm |next "WoW Professions Guides\\Mining\\Mining Route Selector"
]])

ZygorGuidesViewer:RegisterGuide("WoW Professions Guides\\Mining\\Mining 245-275\\Un'Goro Crater",[[
	author wow-professions.com
	type professions
	startlevel 25
	description Mine Mithril, Truesilver, and Thorium in Un'Goro Crater to 275.
	description This route is incomplete, untested, or placeholder and may contain errors.
	step
		'Requires Mining 245. Train Artisan here if needed.
		skill Mining,245
		#include "trainer_Mining"
		.skillmax Mining,300
	step
		loop Un'Goro Crater,42.8,18.5;50.4,32.0;56.7,22.9;63.6,17.6;71.4,26.5;74.1,39.5;76.1,59.6;68.2,68.1;60.6,68.6;62.2,83.7;44.9,86.9;53.7,66.3;36.3,47.5;43.0,29.8 |until skill("Mining")>=275 |tip There are 2-3 mineral veins in the two caves marked on the map. Lower-level players should probably skip the southern cave depending on level/gear/class.
		#include "follow_path_mine"
		skill Mining,275
	step
		'Continue with Mining 275-300 zone selection. |confirm |next "WoW Professions Guides\\Mining\\Mining 275-300\\Common"
]])

ZygorGuidesViewer:RegisterGuide("WoW Professions Guides\\Mining\\Mining 245-275\\Blasted Lands (Alliance)",[[
	author wow-professions.com
	type professions
	startlevel 25
	description Mine Mithril, Truesilver, and Thorium in Blasted Lands to 275 (Alliance variant).
	description This route is incomplete, untested, or placeholder and may contain errors.
	step
		'Requires Mining 245. Train Artisan here if needed.
		skill Mining,245
		#include "trainer_Mining"
		.skillmax Mining,300
	step
		loop Blasted Lands,55.0,14.0;45.0,13.0;35.0,21.0;29.0,31.0;31.0,42.0;39.0,52.0;48.0,61.0;56.0,56.0;62.0,48.0;66.0,39.0;63.0,28.0;58.0,20.0 |until skill("Mining")>=275 |tip Two caves on this route have many mobs. Recommended for level 60 players with good gear, or Druids/Rogues with stealth. Alliance players cannot mine inside the Garrison Armory mine.
		#include "follow_path_mine"
		skill Mining,275
	step
		'Continue with Mining 275-300 zone selection. |confirm |next "WoW Professions Guides\\Mining\\Mining 275-300\\Common"
]])

ZygorGuidesViewer:RegisterGuide("WoW Professions Guides\\Mining\\Mining 245-275\\Blasted Lands (Horde)",[[
	author wow-professions.com
	type professions
	startlevel 25
	description Mine Mithril, Truesilver, and Thorium in Blasted Lands to 275 (Horde variant).
	description This route is incomplete, untested, or placeholder and may contain errors.
	step
		'Requires Mining 245. Train Artisan here if needed.
		skill Mining,245
		#include "trainer_Mining"
		.skillmax Mining,300
	step
		loop Blasted Lands,55.0,14.0;45.0,13.0;35.0,21.0;29.0,31.0;31.0,42.0;39.0,52.0;48.0,61.0;56.0,56.0;62.0,48.0;66.0,39.0;63.0,28.0;58.0,20.0 |until skill("Mining")>=275 |tip Two caves on this route have many mobs. Recommended for level 60 players with good gear, or Druids/Rogues with stealth. Garrison Armory is hard to navigate, use the cave map route.
		#include "follow_path_mine"
		skill Mining,275
	step
		'Continue with Mining 275-300 zone selection. |confirm |next "WoW Professions Guides\\Mining\\Mining 275-300\\Common"
]])

ZygorGuidesViewer:RegisterGuide("WoW Professions Guides\\Mining\\Mining 245-275\\Felwood",[[
	author wow-professions.com
	type professions
	startlevel 25
	description Mine Mithril, Truesilver, and Thorium in Felwood to 275.
	description This route is incomplete, untested, or placeholder and may contain errors.
	step
		'Requires Mining 245. Train Artisan here if needed.
		skill Mining,245
		#include "trainer_Mining"
		.skillmax Mining,300
	step
		loop Felwood,41.0,10.0;49.0,11.0;52.0,20.0;50.0,30.0;50.0,41.0;49.0,52.0;48.0,62.0;48.0,72.0;50.0,80.0;46.0,85.0;42.0,80.0;41.0,69.0;40.0,58.0;40.0,47.0;40.0,36.0;40.0,25.0;41.0,14.0 |until skill("Mining")>=275 |tip There are usually 2 mining nodes inside the marked cave, and it is worth entering. Skip the two Jaedenar caves (especially Shadow Hold) unless you have stealth.
		#include "follow_path_mine"
		skill Mining,275
	step
		'Continue with Mining 275-300 zone selection. |confirm |next "WoW Professions Guides\\Mining\\Mining 275-300\\Common"
]])

ZygorGuidesViewer:RegisterGuide("WoW Professions Guides\\Mining\\Mining 275-300\\Common",[[
	author wow-professions.com
	type professions
	startlevel 25
	description Choose your next mining location after 245-275.
	description This route set is incomplete, untested, or placeholder and may contain errors.
	step
		'Requires Mining 275.
		skill Mining,275
	step
		'Ores in these zones:
		.' Thorium Ore
		.' Mithril Ore
	step
		'Now you can mine Rich Thorium Veins too.
	step
		'Choose your 275-300 route:
		.' Un'Goro Crater |confirm |next "WoW Professions Guides\\Mining\\Mining 275-300\\Un'Goro Crater"
		.' Eastern Plaguelands |confirm |next "WoW Professions Guides\\Mining\\Mining 275-300\\Eastern Plaguelands"
		.' Winterspring |confirm |next "WoW Professions Guides\\Mining\\Mining 275-300\\Winterspring"
		.' Burning Steppes |confirm |next "WoW Professions Guides\\Mining\\Mining 275-300\\Burning Steppes"
		.' Skip to Mining 300-350 zone selection |confirm |next "WoW Professions Guides\\Mining\\Mining 300-350\\BC Classic"
		.' Open Mining route selector |confirm |next "WoW Professions Guides\\Mining\\Mining Route Selector"
]])

ZygorGuidesViewer:RegisterGuide("WoW Professions Guides\\Mining\\Mining 275-300\\Un'Goro Crater",[[
	author wow-professions.com
	type professions
	startlevel 25
	description Mine Thorium and Mithril in Un'Goro Crater to 300.
	description This route is incomplete, untested, or placeholder and may contain errors.
	step
		'Requires Mining 275.
		skill Mining,275
	step
		loop Un'Goro Crater,42.8,18.5;50.4,32.0;56.7,22.9;63.6,17.6;71.4,26.5;74.1,39.5;76.1,59.6;68.2,68.1;60.6,68.6;62.2,83.7;44.9,86.9;53.7,66.3;36.3,47.5;43.0,29.8 |until skill("Mining")>=300 |tip Almost the same as the previous Un'Goro route, but now it includes Rich Thorium Veins.
		#include "follow_path_mine"
		skill Mining,300
	step
		'Continue with Burning Crusade Classic Mining 300-350. |confirm |next "WoW Professions Guides\\Mining\\Mining 300-350\\BC Classic"
]])

ZygorGuidesViewer:RegisterGuide("WoW Professions Guides\\Mining\\Mining 275-300\\Eastern Plaguelands",[[
	author wow-professions.com
	type professions
	startlevel 25
	description Mine Thorium and Mithril in Eastern Plaguelands to 300.
	description This route is incomplete, untested, or placeholder and may contain errors.
	step
		'Requires Mining 275.
		skill Mining,275
	step
		loop Eastern Plaguelands,16.0,58.0;23.0,64.0;35.0,66.0;45.0,63.0;53.0,57.0;60.0,50.0;63.0,43.0;69.0,36.0;76.0,30.0;82.0,20.0;75.0,16.0;67.0,22.0;60.0,27.0;53.0,33.0;46.0,38.0;40.0,45.0;34.0,51.0;28.0,56.0;21.0,58.0 |until skill("Mining")>=300 |tip The red route is filled with level 57-58 elites, so if you have bad gear, skip it unless you have stealth. With practice, you can usually pass through while only aggroing a few.
		#include "follow_path_mine"
		skill Mining,300
	step
		'Continue with Burning Crusade Classic Mining 300-350. |confirm |next "WoW Professions Guides\\Mining\\Mining 300-350\\BC Classic"
]])

ZygorGuidesViewer:RegisterGuide("WoW Professions Guides\\Mining\\Mining 275-300\\Winterspring",[[
	author wow-professions.com
	type professions
	startlevel 25
	description Mine Thorium and Mithril in Winterspring to 300.
	description This route is incomplete, untested, or placeholder and may contain errors.
	step
		'Requires Mining 275.
		skill Mining,275
	step
		loop Winterspring,61.0,37.0;61.0,47.0;59.0,56.0;57.0,64.0;55.0,72.0;54.0,80.0;50.0,86.0;44.0,83.0;43.0,76.0;43.0,68.0;42.0,59.0;42.0,50.0;44.0,42.0;48.0,35.0;52.0,30.0;58.0,30.0;63.0,31.0;66.0,35.0 |until skill("Mining")>=300 |tip For players below level 70: 1) The cave at note 1 is usually worth clearing. 2) Most classes can enter the first part of cave 2; go deeper based on gear. 3) The gorge at note 3 has many elite patrols, but you can often pass most of them with careful movement. 4) Note 4 area is not recommended for most players unless you are experienced at avoiding mobs.
		#include "follow_path_mine"
		skill Mining,300
	step
		'Continue with Burning Crusade Classic Mining 300-350. |confirm |next "WoW Professions Guides\\Mining\\Mining 300-350\\BC Classic"
]])

ZygorGuidesViewer:RegisterGuide("WoW Professions Guides\\Mining\\Mining 275-300\\Burning Steppes",[[
	author wow-professions.com
	type professions
	startlevel 25
	description Mine Thorium and Mithril in Burning Steppes to 300.
	description This route is incomplete, untested, or placeholder and may contain errors.
	step
		'Requires Mining 275.
		skill Mining,275
	step
		loop Burning Steppes,18.0,31.0;26.0,31.0;35.0,29.0;44.0,27.0;53.0,25.0;60.0,22.0;68.0,21.0;77.0,22.0;84.0,28.0;84.0,39.0;82.0,49.0;76.0,56.0;68.0,59.0;60.0,61.0;50.0,62.0;40.0,60.0;30.0,57.0;22.0,51.0;17.0,44.0;16.0,36.0 |until skill("Mining")>=300 |tip The two caves marked on the map are filled with level 50 mobs, so lower-level players may want to skip them depending on gear and level.
		#include "follow_path_mine"
		skill Mining,300
	step
		'Continue with Burning Crusade Classic Mining 300-350. |confirm |next "WoW Professions Guides\\Mining\\Mining 300-350\\BC Classic"
]])

ZygorGuidesViewer:RegisterGuide("WoW Professions Guides\\Mining\\Mining 300-350\\BC Classic",[[
	author wow-professions.com
	type professions
	startlevel 40
	description Burning Crusade Classic Mining 300-350.
	description This route set is incomplete, untested, or placeholder and may contain errors.
	step
		'Learn the TBC Mining skill from Fono or Hanlir in Shattrath City, or Hurnak Grimmord or Krugosh in Hellfire Peninsula. |tip Requires level 40.
		skill Mining,300
		#include "trainer_Mining"
		.skillmax Mining,375
	step
		'300-325 notes:
		.' There is not much difference between the two Hellfire routes.
		.' Small Thorium Veins give points up to 345, and Rich Thorium Veins up to 350.
		.' If Hellfire is crowded or you don't have a flying mount, mine more Thorium in previous zones up to 325.
	step
		'Choose your 300-325 route in Hellfire Peninsula:
		.' Route 1 |confirm |next "WoW Professions Guides\\Mining\\Mining 300-325\\Hellfire Peninsula (Route 1)"
		.' Route 2 |confirm |next "WoW Professions Guides\\Mining\\Mining 300-325\\Hellfire Peninsula (Route 2)"
		.' Skip to Mining 325-350 zone selection |confirm |next "WoW Professions Guides\\Mining\\Mining 325-350\\BC Classic"
		.' Open Mining route selector |confirm |next "WoW Professions Guides\\Mining\\Mining Route Selector"
]])

ZygorGuidesViewer:RegisterGuide("WoW Professions Guides\\Mining\\Mining 300-325\\Hellfire Peninsula (Route 1)",[[
	author wow-professions.com
	type professions
	startlevel 40
	description Mine Fel Iron in Hellfire Peninsula to 325 (Route 1).
	description This route is incomplete, untested, or placeholder and may contain errors.
	step
		'Requires Mining 300. Train TBC Mining here if needed.
		skill Mining,300
		#include "trainer_Mining"
		.skillmax Mining,375
	step
		loop Hellfire Peninsula,31.1,31.4;38.1,52.0;42.5,32.7;56.2,28.8;48.8,46.5;61.1,55.1;45.3,62.0;35.0,61.1;29.4,73.7;27.0,54.9;13.8,62.4;18.7,39.4;25.7,41.2 |until skill("Mining")>=325
		#include "follow_path_mine"
		skill Mining,325
	step
		'Continue with Mining 325-350 zone selection. |confirm |next "WoW Professions Guides\\Mining\\Mining 325-350\\BC Classic"
]])

ZygorGuidesViewer:RegisterGuide("WoW Professions Guides\\Mining\\Mining 300-325\\Hellfire Peninsula (Route 2)",[[
	author wow-professions.com
	type professions
	startlevel 40
	description Mine Fel Iron in Hellfire Peninsula to 325 (Route 2).
	description This route is incomplete, untested, or placeholder and may contain errors.
	step
		'Requires Mining 300. Train TBC Mining here if needed.
		skill Mining,300
		#include "trainer_Mining"
		.skillmax Mining,375
	step
		loop Hellfire Peninsula,63.0,68.0;74.0,62.0;79.0,49.0;73.0,35.0;63.0,28.0;52.0,25.0;43.0,31.0;39.0,42.0;44.0,53.0;53.0,58.0;61.0,58.0;66.0,50.0;60.0,44.0;52.0,43.0;45.0,46.0;41.0,58.0;33.0,67.0;23.0,69.0 |until skill("Mining")>=325
		#include "follow_path_mine"
		skill Mining,325
	step
		'Continue with Mining 325-350 zone selection. |confirm |next "WoW Professions Guides\\Mining\\Mining 325-350\\BC Classic"
]])

ZygorGuidesViewer:RegisterGuide("WoW Professions Guides\\Mining\\Mining 325-350\\BC Classic",[[
	author wow-professions.com
	type professions
	startlevel 40
	description Burning Crusade Classic Mining 325-350.
	description This route set is incomplete, untested, or placeholder and may contain errors.
	step
		'Requires Mining 325.
		skill Mining,325
	step
		'There will be a few Rich Adamantite nodes in Terokkar Forest that you cannot mine until 350.
		.' They only spawn in flying-access areas (Skettis and the area above Shattrath), so this is not an issue for lower-level players.
	step
		'Choose your 325-350 route:
		.' Zangarmarsh |confirm |next "WoW Professions Guides\\Mining\\Mining 325-350\\Zangarmarsh"
		.' Terokkar Forest (Flying) |confirm |next "WoW Professions Guides\\Mining\\Mining 325-350\\Terokkar Forest (Flying)"
		.' Terokkar Forest (Flightless) |confirm |next "WoW Professions Guides\\Mining\\Mining 325-350\\Terokkar Forest (Flightless)"
		.' Skip to Mining 350-400 zone selection |confirm |next "WoW Professions Guides\\Mining\\Mining 350-400\\WotLK Classic"
		.' Open Mining route selector |confirm |next "WoW Professions Guides\\Mining\\Mining Route Selector"
]])

ZygorGuidesViewer:RegisterGuide("WoW Professions Guides\\Mining\\Mining 325-350\\Zangarmarsh",[[
	author wow-professions.com
	type professions
	startlevel 40
	description Mine Adamantite and Fel Iron in Zangarmarsh to 350.
	description This route is incomplete, untested, or placeholder and may contain errors.
	step
		'Requires Mining 325.
		skill Mining,325
	step
		loop Zangarmarsh,17.0,62.0;12.0,50.0;13.0,39.0;20.0,31.0;31.0,33.0;41.0,33.0;52.0,34.0;62.0,32.0;74.0,33.0;84.0,40.0;84.0,52.0;82.0,63.0;73.0,70.0;62.0,71.0;50.0,72.0;38.0,72.0;28.0,71.0;20.0,67.0 |until skill("Mining")>=350 |tip There are two caves marked on the map. Go all the way to the end of both caves because some mining nodes are not visible from the entrances.
		#include "follow_path_mine"
		skill Mining,350
	step
		'Continue with WotLK Classic Mining 350-400. |confirm |next "WoW Professions Guides\\Mining\\Mining 350-400\\WotLK Classic"
]])

ZygorGuidesViewer:RegisterGuide("WoW Professions Guides\\Mining\\Mining 325-350\\Terokkar Forest (Flying)",[[
	author wow-professions.com
	type professions
	startlevel 40
	description Mine Adamantite and Fel Iron in Terokkar Forest to 350 (flying route).
	description This route is incomplete, untested, or placeholder and may contain errors.
	step
		'Requires Mining 325.
		skill Mining,325
	step
		loop Terokkar Forest,31.0,23.0;41.0,16.0;54.0,12.0;67.0,16.0;73.0,28.0;74.0,42.0;69.0,54.0;66.0,68.0;59.0,78.0;49.0,81.0;38.0,79.0;29.0,73.0;24.0,60.0;20.0,48.0;22.0,34.0 |until skill("Mining")>=350 |tip You need a flying mount for this route. Use the flightless route if you do not have one.
		#include "follow_path_mine"
		skill Mining,350
	step
		'Continue with WotLK Classic Mining 350-400. |confirm |next "WoW Professions Guides\\Mining\\Mining 350-400\\WotLK Classic"
]])

ZygorGuidesViewer:RegisterGuide("WoW Professions Guides\\Mining\\Mining 325-350\\Terokkar Forest (Flightless)",[[
	author wow-professions.com
	type professions
	startlevel 40
	description Mine Adamantite and Fel Iron in Terokkar Forest to 350 (flightless route).
	description This route is incomplete, untested, or placeholder and may contain errors.
	step
		'Requires Mining 325.
		skill Mining,325
	step
		.' Alternative route for players without flying mount.
		loop Terokkar Forest,30.0,46.0;33.0,34.0;42.0,28.0;54.0,28.0;64.0,31.0;67.0,42.0;63.0,52.0;59.0,62.0;50.0,70.0;39.0,72.0;30.0,66.0;26.0,56.0 |until skill("Mining")>=350
		#include "follow_path_mine"
		skill Mining,350
	step
		'Continue with WotLK Classic Mining 350-400. |confirm |next "WoW Professions Guides\\Mining\\Mining 350-400\\WotLK Classic"
]])

ZygorGuidesViewer:RegisterGuide("WoW Professions Guides\\Mining\\Mining 350-400\\WotLK Classic",[[
	author wow-professions.com
	type professions
	startlevel 55
	description Wrath of the Lich King Classic Mining 350-400.
	description This route set is incomplete, untested, or placeholder and may contain errors.
	step
		'Learn WotLK Mining from these trainers. |tip Requires level 55.
		.' Both factions: Jedidiah Handers in Dalaran.
		.' Horde: Jonathan Lewis in Howling Fjord, Brunna Ironaxe in Borean Tundra.
		.' Alliance: Grumbol Stoutpick in Howling Fjord, Fendrig Redbeard in Borean Tundra.
		skill Mining,350
		#include "trainer_Mining"
		.skillmax Mining,450
	step
		'350-400 notes:
		.' Borean Tundra and Howling Fjord are both great zones to reach 400.
		.' If you are still leveling and do not have a flying mount, use the no-flying routes.
		.' Lower-level players may want to skip some caves in Borean Tundra depending on level/gear.
	step
		'Choose your 350-400 route:
		.' Borean Tundra |confirm |next "WoW Professions Guides\\Mining\\Mining 350-400\\Borean Tundra"
		.' Howling Fjord |confirm |next "WoW Professions Guides\\Mining\\Mining 350-400\\Howling Fjord"
		.' Borean Tundra (Flightless) |confirm |next "WoW Professions Guides\\Mining\\Mining 350-400\\Borean Tundra (Flightless)"
		.' Howling Fjord (Flightless) |confirm |next "WoW Professions Guides\\Mining\\Mining 350-400\\Howling Fjord (Flightless)"
		.' Open Mining route selector |confirm |next "WoW Professions Guides\\Mining\\Mining Route Selector"
]])

ZygorGuidesViewer:RegisterGuide("WoW Professions Guides\\Mining\\Mining 350-400\\Borean Tundra",[[
	author wow-professions.com
	type professions
	startlevel 55
	description Mine Cobalt in Borean Tundra to 400 (flying route).
	description This route is incomplete, untested, or placeholder and may contain errors.
	step
		skill Mining,350
		#include "trainer_Mining"
		.skillmax Mining,450
	step
		loop Borean Tundra,43.8,10.0;59.1,15.1;61.1,22.1;79.3,23.8;83.3,47.2;68.1,30.6;61.7,46.8;55.1,64.7;38.1,70.5;32.6,50.3;49.1,38.4;47.2,22.6 |until skill("Mining")>=400
		#include "follow_path_mine"
		skill Mining,400
	step
		'Open Mining route selector. |confirm |next "WoW Professions Guides\\Mining\\Mining Route Selector"
]])

ZygorGuidesViewer:RegisterGuide("WoW Professions Guides\\Mining\\Mining 350-400\\Howling Fjord",[[
	author wow-professions.com
	type professions
	startlevel 55
	description Mine Cobalt in Howling Fjord to 400 (flying route).
	description This route is incomplete, untested, or placeholder and may contain errors.
	step
		skill Mining,350
		#include "trainer_Mining"
		.skillmax Mining,450
	step
		loop Howling Fjord,24.0,62.0;22.0,49.0;27.0,36.0;36.0,28.0;47.0,17.0;59.0,19.0;70.0,24.0;76.0,36.0;78.0,50.0;72.0,63.0;61.0,72.0;48.0,76.0;34.0,74.0 |until skill("Mining")>=400
		#include "follow_path_mine"
		skill Mining,400
	step
		'Open Mining route selector. |confirm |next "WoW Professions Guides\\Mining\\Mining Route Selector"
]])

ZygorGuidesViewer:RegisterGuide("WoW Professions Guides\\Mining\\Mining 350-400\\Borean Tundra (Flightless)",[[
	author wow-professions.com
	type professions
	startlevel 55
	description Mine Cobalt in Borean Tundra to 400 (flightless route).
	description This route is incomplete, untested, or placeholder and may contain errors.
	step
		skill Mining,350
		#include "trainer_Mining"
		.skillmax Mining,450
	step
		loop Borean Tundra,49.0,18.0;58.0,22.0;68.0,24.0;75.0,30.0;74.0,40.0;67.0,48.0;58.0,53.0;50.0,59.0;43.0,66.0;36.0,64.0;34.0,54.0;39.0,45.0;45.0,38.0;49.0,30.0 |until skill("Mining")>=400
		#include "follow_path_mine"
		skill Mining,400
	step
		'Open Mining route selector. |confirm |next "WoW Professions Guides\\Mining\\Mining Route Selector"
]])

ZygorGuidesViewer:RegisterGuide("WoW Professions Guides\\Mining\\Mining 350-400\\Howling Fjord (Flightless)",[[
	author wow-professions.com
	type professions
	startlevel 55
	description Mine Cobalt in Howling Fjord to 400 (flightless route).
	description This route is incomplete, untested, or placeholder and may contain errors.
	step
		skill Mining,350
		#include "trainer_Mining"
		.skillmax Mining,450
	step
		loop Howling Fjord,26.0,53.0;29.0,44.0;37.0,36.0;49.0,31.0;60.0,33.0;68.0,41.0;69.0,52.0;65.0,62.0;56.0,68.0;46.0,70.0;37.0,67.0;31.0,60.0 |until skill("Mining")>=400
		#include "follow_path_mine"
		skill Mining,400
	step
		'Open Mining route selector. |confirm |next "WoW Professions Guides\\Mining\\Mining Route Selector"
]])



