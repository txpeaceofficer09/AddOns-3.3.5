local ZygorGuidesViewer=ZygorGuidesViewer
if not ZygorGuidesViewer then return end

ZygorGuidesViewer:RegisterGuide("WoW Professions Guides\\Profession 1-450 Coverage Plan",[[
	author ErebusAres
	type professions
	startlevel 5
	description Quick launcher for Wrath profession routes in this pack.
	description These guides are under development, untested, or may contain errors. Please report any issues you encounter!
	step
		'Open Mining route selector. |confirm |next "WoW Professions Guides\\Mining\\Mining Route Selector"
	step
		'Open Herbalism 1-450. |confirm |next "WoW Professions Guides\\Herbalism\\Herbalism 1-450 (WotLK Route)"
	step
		'Open Skinning 1-450. |confirm |next "WoW Professions Guides\\Skinning\\Skinning 1-450 (WotLK Route)"
	step
		'Open Alchemy 1-450. |confirm |next "WoW Professions Guides\\Alchemy\\Alchemy 1-450 (WotLK Route)"
	step
		'Open Jewelcrafting 1-450. |confirm |next "WoW Professions Guides\\Jewelcrafting\\Jewelcrafting 1-450 (WotLK Route)"
	step
		'Open Blacksmithing 1-450. |confirm |next "WoW Professions Guides\\Blacksmithing\\Blacksmithing 1-450 (WotLK Route)"
	step
		'Open Engineering 1-450. |confirm |next "WoW Professions Guides\\Engineering\\Engineering 1-450 (WotLK Route)"
	step
		'Open Enchanting 1-450. |confirm |next "WoW Professions Guides\\Enchanting\\Enchanting 1-450 (WotLK Route)"
]])

ZygorGuidesViewer:RegisterGuide("WoW Professions Guides\\Herbalism\\Herbalism 1-450 (WotLK Route)",[[
	author ErebusAres
	type professions
	startlevel 5
	description Wrath herbalism route using existing trainer/vendor/path include logic. Route data adapted from community route datasets and repackaged for Ares guides.
	step
		'Train Herbalism.
		#include "trainer_Herbalism"
		.skillmax Herbalism,75
	step
		'Herbalism 1-75 Complete|condition true
		'Herbalism 1-150 Complete|condition true
		'Herbalism 1-225 Complete|condition true
		'Herbalism 1-300 Complete|condition true
		'Herbalism 1-375 Complete|condition true
		'Herbalism 1-450 Complete|condition true
	step
		loop Elwynn Forest,42.4,66.2;33.6,59.4;28.1,54.5;26.8,44.2;33.2,37.8;40.9,39.8;48.6,48.1;50.6,62.5 |until skill("Herbalism")>=70
		#include "follow_path_herbs"
		skill Herbalism,70
	step
		#include "trainer_Herbalism"
		.skillmax Herbalism,150
	step
		loop Westfall,56.4,22.5;45.7,27.9;35.9,34.2;36.5,50.4;46.8,63.9;58.9,60.3;63.2,45.8;61.3,32.1 |until skill("Herbalism")>=150
		#include "follow_path_herbs"
		skill Herbalism,150
	step
		#include "trainer_Herbalism"
		.skillmax Herbalism,225
	step
		loop Arathi Highlands,35.1,44.1;42.6,56.8;53.6,72.9;66.4,72.4;74.7,54.7;70.2,36.9;55.8,32.1;42.3,33.8 |until skill("Herbalism")>=230
		#include "follow_path_herbs"
		skill Herbalism,230
	step
		#include "trainer_Herbalism"
		.skillmax Herbalism,300
	step
		loop Felwood,40.2,84.1;44.3,72.8;50.7,62.0;51.2,49.5;47.6,36.7;45.0,24.5;40.3,13.4;47.1,9.9 |until skill("Herbalism")>=300
		#include "follow_path_herbs"
		skill Herbalism,300
	step
		#include "trainer_Herbalism"
		.skillmax Herbalism,375
	step
		loop Hellfire Peninsula,22.8,61.7;32.6,75.6;49.8,80.2;61.8,67.4;68.8,44.1;63.1,29.8;47.7,22.7;32.6,24.6;24.2,40.8 |until skill("Herbalism")>=350
		#include "follow_path_herbs"
		skill Herbalism,350
	step
		#include "trainer_Herbalism"
		.skillmax Herbalism,450
	step
		loop Grizzly Hills,21.7,31.8;30.6,35.0;39.5,30.9;48.4,29.3;54.6,26.7;61.9,30.0;65.7,27.8;69.0,21.8;72.1,25.4;70.5,32.5;73.9,38.3;78.1,42.4;83.0,55.9;69.8,49.3;60.4,53.7;57.3,54.8;53.8,51.5;46.5,51.7 |until skill("Herbalism")>=400
		#include "follow_path_herbs"
		skill Herbalism,400
	step
		loop Zul'Drak,45.8,42.3;42.7,52.7;43.3,59.3;37.0,59.6;34.2,65.2;35.7,70.4;38.6,73.2;40.6,82.7;32.4,80.8;24.1,82.7;27.4,74.5;29.7,67.0;30.3,58.7;26.1,47.8;31.4,44.5;36.0,46.5;40.1,44.4 |until skill("Herbalism")>=425
		#include "follow_path_herbs"
		skill Herbalism,425
	step
		loop Sholazar Basin,30.9,47.4;33.9,45.6;37.3,47.6;38.5,53.2;36.0,58.4;33.9,63.6;37.6,68.3;42.9,77.9;43.7,81.9;40.5,85.9;34.4,85.2;31.1,83.7;29.7,75.0;29.5,68.8;25.3,65.6;23.4,61.9;24.2,54.0;30.7,57.8 |until skill("Herbalism")>=440
		#include "follow_path_herbs"
		skill Herbalism,440
	step
		loop The Storm Peaks,34.7,43.5;39.6,44.9;37.3,61.5;41.9,61.1;43.4,58.5;44.2,52.3;49.3,57.8;54.0,65.2;48.4,71.3;42.4,72.8;39.7,86.5;36.3,87.7;32.9,85.3;34.7,81.2;37.1,78.0;37.0,72.1;34.5,66.1;30.0,67.0 |until skill("Herbalism")>=450
		#include "follow_path_herbs"
		skill Herbalism,450
	step
		'Herbalism 1-450 complete. |condition skill("Herbalism")>=450
]])

ZygorGuidesViewer:RegisterGuide("WoW Professions Guides\\Skinning\\Skinning 1-450 (WotLK Route)",[[
	author ErebusAres
	type professions
	startlevel 5
	description Wrath skinning route using existing trainer/vendor include logic. Route locations adapted from community and WoW profession references, repackaged for Ares guides.
	step
		'Train Skinning and buy a Skinning Knife.
		#include "trainer_Skinning"
		.skillmax Skinning,75
		#include "vendor_Skinning"
		.buy 1 Skinning Knife##7005
	step
		'Skinning 1-75 Complete|condition true
		'Skinning 1-150 Complete|condition true
		'Skinning 1-225 Complete|condition true
		'Skinning 1-300 Complete|condition true
		'Skinning 1-375 Complete|condition true
		'Skinning 1-450 Complete|condition true
	step
		loop Elwynn Forest,48.2,39.4;57.6,49.8;49.6,63.6;37.2,61.2 |until skill("Skinning")>=75
		'Skin wolves, bears, and boars around these points to 75.
		skill Skinning,75
	step
		#include "trainer_Skinning"
		.skillmax Skinning,150
	step
		loop Hillsbrad Foothills,42.8,38.6;51.8,46.4;58.0,33.8;49.5,24.8 |until skill("Skinning")>=150
		'Skin lions, bears, and yetis in the central/western foothills to 150.
		skill Skinning,150
	step
		#include "trainer_Skinning"
		.skillmax Skinning,225
	step
		loop Stranglethorn Vale,31.2,15.6;40.7,19.5;47.8,31.2;41.0,42.6 |until skill("Skinning")>=225
		'Skin jungle beasts and raptors in north/central STV to 225.
		skill Skinning,225
	step
		#include "trainer_Skinning"
		.skillmax Skinning,300
	step
		loop Un'Goro Crater,63.8,15.8;71.7,36.1;64.3,62.6;49.1,82.4;32.5,67.6;35.6,37.8 |until skill("Skinning")>=300
		'Skin dinosaurs and gorillas around the crater ring to 300.
		skill Skinning,300
	step
		#include "trainer_Skinning"
		.skillmax Skinning,375
	step
		loop Hellfire Peninsula,63.6,66.4;52.0,62.8;45.2,70.6;38.1,58.3 |until skill("Skinning")>=350
		'Skin Hellboars and Ravagers around Expedition Armory and central Hellfire to 330-350.
		skill Skinning,350
	step
		loop Nagrand,50.4,56.2;61.2,56.8;67.8,67.0;58.3,74.7 |until skill("Skinning")>=375
		'Skin Talbuks and Clefthooves in Nagrand grasslands to 375.
		skill Skinning,375
	step
		#include "trainer_Skinning"
		.skillmax Skinning,450
	step
		loop Borean Tundra,47.1,10.6;53.8,22.4;58.6,37.2;50.2,52.9;40.3,48.8 |until skill("Skinning")>=425
		'Skin rhinos, wolves, and mammoths to 425.
		skill Skinning,425
	step
		loop Sholazar Basin,27.5,59.8;33.6,73.4;46.8,63.8;56.3,52.7;66.8,43.0;58.6,29.1 |until skill("Skinning")>=450
		'Skin gorillas, cats, and crocolisks to 450.
		skill Skinning,450
	step
		'Skinning 1-450 complete. |condition skill("Skinning")>=450
]])

ZygorGuidesViewer:RegisterGuide("WoW Professions Guides\\Alchemy\\Alchemy 1-450 (WotLK Route)",[[
	author ErebusAres
	type professions
	startlevel 5
	description Wrath alchemy route using existing trainer/vendor include logic. Recipe bands and material checkpoints adapted from Wrath profession references, repackaged for Ares guides.
	step
		'Train Alchemy and buy vials.
		#include "trainer_Alchemy"
		.skillmax Alchemy,75
		#include "vendor_Alchemy"
	step
		'Alchemy 1-75 Complete|condition true
		'Alchemy 1-150 Complete|condition true
		'Alchemy 1-225 Complete|condition true
		'Alchemy 1-300 Complete|condition true
		'Alchemy 1-375 Complete|condition true
		'Alchemy 1-450 Complete|condition true
	step
		'Classic materials checkpoint (rough):
		.' Peacebloom/Silverleaf/Earthroot, Briarthorn/Bruiseweed, Liferoot/Goldthorn.
		'Craft Minor Healing Potions to 60.
		skill Alchemy,60
	step
		#include "trainer_Alchemy"
		.skillmax Alchemy,150
	step
		'Use Lesser Healing Potion / Elixir of Wisdom style orange recipes.
		skill Alchemy,110
	step
		'Use Healing Potion / Greater Healing / Elixir crafts through mid-classic.
		skill Alchemy,185
	step
		#include "trainer_Alchemy"
		.skillmax Alchemy,225
	step
		'Craft elixir/potion trainer options to 250 (prioritize yellow recipes with cheap herbs).
		skill Alchemy,250
	step
		#include "trainer_Alchemy"
		.skillmax Alchemy,300
	step
		'Finish classic with Major Healing/Mana style crafts to 300.
		skill Alchemy,300
	step
		#include "trainer_Alchemy"
		.skillmax Alchemy,375
	step
		'Outland materials checkpoint:
		.' Felweed, Dreaming Glory, Ragveil, Terocone, Netherbloom.
		'Craft Outland potions/elixirs from trainer path to 350.
		skill Alchemy,350
	step
		#include "trainer_Alchemy"
		.skillmax Alchemy,450
	step
		'Northrend materials checkpoint:
		.' Goldclover, Tiger Lily, Talandra's Rose, Lichbloom, Icethorn.
		'Craft Northrend potion/elixir path to 425.
		skill Alchemy,425
	step
		'Finish with high-end Northrend potion/flask crafts to 450.
		skill Alchemy,450
	step
		'Alchemy 1-450 complete. |condition skill("Alchemy")>=450
]])

ZygorGuidesViewer:RegisterGuide("WoW Professions Guides\\Jewelcrafting\\Jewelcrafting 1-450 (WotLK Route)",[[
	author ErebusAres
	type professions
	startlevel 5
	description Wrath jewelcrafting route using existing trainer/vendor include logic. Skill bands and material checkpoints adapted from WotLK profession references, repackaged for Ares guides.
	step
		'Train Jewelcrafting and buy supplies.
		#include "trainer_Jewelcrafting"
		.skillmax Jewelcrafting,75
		#include "vendor_Jewelcrafting"
	step
		'Jewelcrafting 1-75 Complete|condition true
		'Jewelcrafting 1-150 Complete|condition true
		'Jewelcrafting 1-225 Complete|condition true
		'Jewelcrafting 1-300 Complete|condition true
		'Jewelcrafting 1-375 Complete|condition true
		'Jewelcrafting 1-450 Complete|condition true
	step
		'Classic ore/gem checkpoint:
		.' Copper, Tin, Iron, Mithril, Thorium plus early uncommon gems.
		.' Prospect your own ore from the Mining guide for cheaper leveling.
		'Use starter ring/amulet and basic gem cuts to 75.
		skill Jewelcrafting,75
	step
		#include "trainer_Jewelcrafting"
		.skillmax Jewelcrafting,150
	step
		'Cut uncommon gems and craft simple settings/necklaces to 150.
		skill Jewelcrafting,150
	step
		#include "trainer_Jewelcrafting"
		.skillmax Jewelcrafting,225
	step
		'Use Mithril/Thorium-era gem cuts and trinkets to 225.
		skill Jewelcrafting,225
	step
		#include "trainer_Jewelcrafting"
		.skillmax Jewelcrafting,300
	step
		'Finish classic with high-yellow cuts/trinkets to 300.
		skill Jewelcrafting,300
	step
		#include "trainer_Jewelcrafting"
		.skillmax Jewelcrafting,375
	step
		'Outland checkpoint:
		.' Fel Iron, Adamantite, Eternium, and green-quality Outland gems.
		'Craft Outland cuts and jewelry to 350.
		skill Jewelcrafting,350
	step
		'Finish Outland with best-value yellow recipes to 375.
		skill Jewelcrafting,375
	step
		#include "trainer_Jewelcrafting"
		.skillmax Jewelcrafting,450
	step
		'Northrend checkpoint:
		.' Cobalt/Saronite/Titanium and green/blue Northrend gems.
		'Craft Northrend starter cuts/jewelry to 420.
		skill Jewelcrafting,420
	step
		'Use daily token designs or high-demand cuts to 450.
		skill Jewelcrafting,450
	step
		'Jewelcrafting 1-450 complete. |condition skill("Jewelcrafting")>=450
]])

ZygorGuidesViewer:RegisterGuide("WoW Professions Guides\\Blacksmithing\\Blacksmithing 1-450 (WotLK Route)",[[
	author ErebusAres
	type professions
	startlevel 5
	description Wrath blacksmithing route using existing trainer/vendor include logic. Skill bands and material checkpoints adapted from WotLK profession references, repackaged for Ares guides.
	step
		'Train Blacksmithing and buy flux.
		#include "trainer_Blacksmithing"
		.skillmax Blacksmithing,75
		#include "vendor_Blacksmithing"
	step
		'Blacksmithing 1-75 Complete|condition true
		'Blacksmithing 1-150 Complete|condition true
		'Blacksmithing 1-225 Complete|condition true
		'Blacksmithing 1-300 Complete|condition true
		'Blacksmithing 1-375 Complete|condition true
		'Blacksmithing 1-450 Complete|condition true
	step
		'Classic metals checkpoint:
		.' Copper, Bronze, Iron, Steel, Mithril, Thorium (plus vendor flux/coal).
		'Craft rough sharpening stones and early bracers/belts to 75.
		skill Blacksmithing,75
	step
		#include "trainer_Blacksmithing"
		.skillmax Blacksmithing,150
	step
		'Craft bronze/iron armor and weapons using yellow recipes to 150.
		skill Blacksmithing,150
	step
		#include "trainer_Blacksmithing"
		.skillmax Blacksmithing,225
	step
		'Use steel/mithril plans (spurs, helms, bracers) to 225.
		skill Blacksmithing,225
	step
		#include "trainer_Blacksmithing"
		.skillmax Blacksmithing,300
	step
		'Finish classic with thorium plans and imperial plate style crafts to 300.
		skill Blacksmithing,300
	step
		#include "trainer_Blacksmithing"
		.skillmax Blacksmithing,375
	step
		'Outland metals checkpoint:
		.' Fel Iron, Adamantite, and Eternium for weapon/armor plans.
		'Craft Outland weapons/armor path to 350.
		skill Blacksmithing,350
	step
		'Finish Outland with best-value yellow plans to 375.
		skill Blacksmithing,375
	step
		#include "trainer_Blacksmithing"
		.skillmax Blacksmithing,450
	step
		'Northrend metals checkpoint:
		.' Cobalt first, then Saronite, then Titansteel endgame crafts.
		'Craft Cobalt set and Cobalt weapons to 415.
		skill Blacksmithing,415
	step
		'Craft Saronite weapons/armor and shield spikes to 440.
		skill Blacksmithing,440
	step
		'Finish with Titansteel and high-end Wrath plans to 450.
		skill Blacksmithing,450
	step
		'Blacksmithing 1-450 complete. |condition skill("Blacksmithing")>=450
]])

ZygorGuidesViewer:RegisterGuide("WoW Professions Guides\\Engineering\\Engineering 1-450 (WotLK Route)",[[
	author ErebusAres
	type professions
	startlevel 5
	description Wrath engineering route using existing trainer/vendor include logic. Skill bands and material checkpoints adapted from WotLK profession references, repackaged for Ares guides.
	step
		'Train Engineering and buy basic supplies.
		#include "trainer_Engineering"
		.skillmax Engineering,75
		#include "vendor_Engineering"
	step
		'Engineering 1-75 Complete|condition true
		'Engineering 1-150 Complete|condition true
		'Engineering 1-225 Complete|condition true
		'Engineering 1-300 Complete|condition true
		'Engineering 1-375 Complete|condition true
		'Engineering 1-450 Complete|condition true
	step
		'Classic metals/parts checkpoint:
		.' Copper, Bronze, Iron, Mithril, Thorium + cloth/stone for components.
		'Craft Rough Blasting Powder, Copper Bolts, and starter goggles/parts to 75.
		skill Engineering,75
	step
		#include "trainer_Engineering"
		.skillmax Engineering,150
	step
		'Craft bronze framework/devices and target dummies to 150.
		skill Engineering,150
	step
		#include "trainer_Engineering"
		.skillmax Engineering,225
	step
		'Use iron/steel explosive parts and utility crafts to 225.
		skill Engineering,225
	step
		#include "trainer_Engineering"
		.skillmax Engineering,300
	step
		'Finish classic with mithril/thorium devices and shells to 300.
		skill Engineering,300
	step
		#include "trainer_Engineering"
		.skillmax Engineering,375
	step
		'Outland checkpoint:
		.' Fel Iron, Adamantite, Netherweave, and Handfuls of Fel Iron Bolts.
		'Craft Outland parts and explosives to 350.
		skill Engineering,350
	step
		'Use best-value yellow Outland recipes to 375.
		skill Engineering,375
	step
		#include "trainer_Engineering"
		.skillmax Engineering,450
	step
		'Northrend checkpoint:
		.' Cobalt, Saronite, Crystallized elements, and Froststeel Tube parts.
		'Craft Northrend bolts/overcharged capacitors and utility items to 425.
		skill Engineering,425
	step
		'Finish with high-value Wrath crafts (ammo/helm/utility items) to 450.
		skill Engineering,450
	step
		'Engineering 1-450 complete. |condition skill("Engineering")>=450
]])

ZygorGuidesViewer:RegisterGuide("WoW Professions Guides\\Enchanting\\Enchanting 1-450 (WotLK Route)",[[
	author ErebusAres
	type professions
	startlevel 5
	description Wrath enchanting route using existing trainer/vendor include logic. Skill bands and material checkpoints adapted from WotLK profession references, repackaged for Ares guides.
	step
		'Train Enchanting and buy basic supplies.
		#include "trainer_Enchanting"
		.skillmax Enchanting,75
		#include "vendor_Enchanting"
	step
		'Enchanting 1-75 Complete|condition true
		'Enchanting 1-150 Complete|condition true
		'Enchanting 1-225 Complete|condition true
		'Enchanting 1-300 Complete|condition true
		'Enchanting 1-375 Complete|condition true
		'Enchanting 1-450 Complete|condition true
	step
		'Classic disenchant checkpoint:
		.' Strange/Lesser/Greater Magic, Astral, Mystic, and Vision dust/essences.
		'Use bracer enchants and minor stats enchants to 75.
		skill Enchanting,75
	step
		#include "trainer_Enchanting"
		.skillmax Enchanting,150
	step
		'Use Lesser/Greater Stamina and related bracer/cloak enchants to 150.
		skill Enchanting,150
	step
		#include "trainer_Enchanting"
		.skillmax Enchanting,225
	step
		'Use Mystic/Vision dust enchants and oils to 225.
		skill Enchanting,225
	step
		#include "trainer_Enchanting"
		.skillmax Enchanting,300
	step
		'Finish classic with high-yellow weapon/glove/bracer enchants to 300.
		skill Enchanting,300
	step
		#include "trainer_Enchanting"
		.skillmax Enchanting,375
	step
		'Outland disenchant checkpoint:
		.' Arcane Dust, Greater Planar Essence, Large Prismatic Shard.
		'Use Outland ring/chest/bracer enchants to 350.
		skill Enchanting,350
	step
		'Finish Outland with yellow enchants to 375.
		skill Enchanting,375
	step
		#include "trainer_Enchanting"
		.skillmax Enchanting,450
	step
		'Northrend disenchant checkpoint:
		.' Infinite Dust, Greater Cosmic Essence, Dream Shard, Abyss Crystal.
		'Craft Northrend starter enchants to 425.
		skill Enchanting,425
	step
		'Finish with high-demand Wrath enchants to 450.
		skill Enchanting,450
	step
		'Enchanting 1-450 complete. |condition skill("Enchanting")>=450
]])

ZygorGuidesViewer:RegisterGuide("Ares' Dev Tests\\Visibility Probe (Temporary)",[[
	author ErebusAres
	type professions
	description Temporary probe guide registered from AresProfessionsWotLK.lua.
	step
		'If you can see this guide, dev tests are loading from the Professions file.
	step
		'Delete this probe after testing.
]])

ZygorGuidesViewer:RegisterGuide("Ares' Dev Tests\\Syntax Integration (Temporary)",[[
	author ErebusAres
	type professions
	description Temporary syntax validation guide. Delete after testing.
	startlevel 1
	step
		label "start"
		.' This guide validates parser/runtime syntax features. |confirm
	step
		.' Jump test: click to go to the label routing step. |confirm |next "routing"
	step
		label "routing"
		.' Relative jump test (+1) will move to next step. |confirm |next "+1"
	step
		.' You should have arrived here via relative jump.
		.' Now jump to the absolute step index target. |confirm |next "7"
	step
		.' If you see this without manual navigation, absolute jump did not trigger.
	step
		.' Filler safety step.
	step
		label "sticky_block"
		stickystart
		.' Sticky range start test line.
		goto Elwynn Forest,42.4,66.2,1 |c
		gotoontaxi Elwynn Forest,37.5,61.0,1 |c
		gotonpc Elwynn Forest,32.8,57.0,1 |c
		direct Elwynn Forest,30.6,52.6,1 |c
		stickystop
	step
		.' Sticky range stop test. Prior sticky goals should no longer auto-stick.
		.' Click to jump to condition tests. |confirm |next "conditions"
	step
		label "conditions"
		.' Visible only if you have Mining. |condition_visible skill("Mining")>0
		.' Condition-valid line should complete when Mining >= 1. |condition_valid skill("Mining")>=1
		.' Legacy only-if line should also work. |only if skill("Mining")>=1
	step
		stickyif skill("Mining")>0
		.' Sticky-if step test (only sticky when Mining > 0).
		goto Elwynn Forest,35.6,53.4,1 |c
		goto Elwynn Forest,39.4,58.2,1 |c
	step
		.' Optional marker test line. |optional
		.' Important marker test line. |important
		.' Icon storage compatibility test. |icon Interface\\Icons\\INV_Pick_02
		.' Button icon compatibility test. |buttonicon Interface\\Icons\\Spell_Nature_Strength
		.' Map icon compatibility test. |mapicon Interface\\Minimap\\ObjectIcons
	step
		.' Path expansion smoke test. |important
		' Follow the Route
		..route Elwynn Forest,42.4,66.2;39.4,58.2;35.6,53.4 |tip This is test 1 step |tip This is a Test. |tip This route follows the road.
	step
		.' Loop expansion smoke test. Repeat until Mining >= 400. |important |until skill("Mining")>=400
		loop Elwynn Forest,42.4,66.2;39.4,58.2;35.6,53.4
	step
		label "guide_jump"
		.' Guide jump test: opens Mining selector. |confirm |next "WoW Professions Guides\\Mining\\Mining Route Selector"
	step
		label "end"
		.' Syntax integration test complete. You can delete this guide after validation.
]])

