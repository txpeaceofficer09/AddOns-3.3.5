local ZygorGuidesViewer=ZygorGuidesViewer
if not ZygorGuidesViewer then return end

--[[----------------------------------------------------------------------------
ExampleGuides.lua

Purpose:
- In-repo authoring reference with live, valid syntax examples.
- Starts with basic patterns, then moves into advanced flow control.

How to use:
1. Open this file while writing new guides.
2. Copy a section into your guide and replace names/IDs/coords.
3. Keep formatting consistent with existing guides in this addon.

Notes:
- This file is intentionally not auto-loaded by default.
- Add it to Autoload.xml temporarily if you want to browse it in-game.
- If implementing this file as part of addon guides, add it in `Guides/Autoload.xml` above `Guide01.lua`.
- For local-only test guides, use `Guide01.lua`, `Guide02.lua`, etc. as personal scratch files.
------------------------------------------------------------------------------]]

ZygorGuidesViewer:RegisterGuide("Ares' Guide Authoring\\Examples\\Step Syntax (Basic to Advanced)",[[
	author ErebusAres
	type professions
	startlevel 1
	description Ordered walkthrough of guide syntax from beginner patterns to advanced flow control.
	step //1 Basic notes with .'
		.'Welcome to the syntax walkthrough.
		.'Lines starting with `.'` are notes (display text).
		.'Continue. |confirm
	step //2 map vs goto (zone context)
		map Elwynn Forest
		.'`map Zone` sets local context for future short `goto x,y` lines.
	step //3 goto in that map
		goto 42.4,66.2
		.'This uses the map context from previous step.
	step //4 goto with explicit map
		goto Stormwind City,62.8,32.0
		.'Use `goto Zone,x,y` when you want a fully explicit destination.
	step //5 note + goto interaction
		.'You can combine text and a goto tag on one line. |goto Stormwind City,52.9,65.7
	step //6 introducing |noway and |c
		.'This line has no waypoint by design. |noway
		goto Elwynn Forest,39.4,58.2,1 |c
		.'`|c` forces completion when you reach the point.
	step //7 .talk with quest actions
		goto Northshire,48.9,41.6
		.talk Marshal McBride##197
		..accept A Threat Within##783
		..turnin A Threat Within##783
	step //8 talk with fpath and buy
		goto Elwynn Forest,42.1,65.9
		.talk Thor##523
		..fpath Goldshire
		#include "vendor_Mining"
		.buy 1 Mining Pick##2901
	step //9 using items and hearth
		use Hearthstone##6948
		.'You can also use the dedicated hearth command:
		hearth Stormwind City
	step //10 kill / collect / get commands
		.'These are executable objective commands:
		.kill 10 Kobold Vermin##6 |q 783/1
		.collect 8 Tough Wolf Meat##750 |q 783/2
		.get 4 Linen Cloth##2589 |n
	step //11 IDs and |q
		.'IDs use ##, like `Mob Name##1234` or `Item Name##5678`.
		.'`|q questID/objective` ties the objective to a specific quest objective.
		.'If not quest-bound, use `|n` to avoid quest-objective validation.
	step //12 skill and skillmax basics
		#include "trainer_Mining"
		.skillmax Mining,75
		skill Mining,65
	step //13 using |achieve and related objective checks
		goto Teldrassil,40.0,65.0 |achieve 842/6
		.'Use `|achieve achievementID/criteriaID` for exploration/achievement routes.
	step //14 explaining `|` followups
		.'Tags after `|` modify the current line objective.
		.'Examples: `|goto`, `|confirm`, `|only if`, `|condition`, `|next`, `|optional`.
	step //15 explaining |confirm
		.'`|confirm` creates a click-to-complete objective line. |confirm
	step //16 conditions: visible vs complete
		.'Visible only while Mining is below 75. |only if skill("Mining")<75
		.'Visible if Mining exists at all. |condition_visible skill("Mining")>0
		.'Auto-complete when Mining is at least 75. |condition skill("Mining")>=75
	step //17 route one-pass
		route Elwynn Forest,42.4,66.2;33.6,59.4;28.1,54.5;26.8,44.2
		.'Use `route` for one-pass movement.
	step //18 loop with until
		loop Elwynn Forest,42.4,66.2;33.6,59.4;28.1,54.5;26.8,44.2 |until mining>=400
		.'Use `loop` for repeated farming until threshold.
	step //19 single-line note with loop
		.'Loop this route until Mining is 400. |loop Elwynn Forest,42.4,66.2;33.6,59.4;28.1,54.5;26.8,44.2 |until mining>=400
	step //20 multiline route readability style
		.'Readability style with wrapped route rows:
		|route Elwynn Forest,42.4,66.2;
		33.6,59.4;
		28.1,54.5;
		26.8,44.2;
		.'This is parsed as one route command, then continues to next note.
	step //21 sticky blocks
		stickystart
		goto Elwynn Forest,39.4,58.2,1 |c
		goto Elwynn Forest,35.6,53.4,1 |c
		stickystop
		.'Sticky means goals in this block stay pinned/visible while you do nearby tasks.
		.'Use sticky for parallel objectives (example: keep route points visible while killing/looting).
		.'The sticky behavior ends at stickystop.
	step //22 optional/important/icons
		.'[Optional] Optional marker example. |optional
		.'[!] Important marker example. |important
		.'Storage icon example. |icon Interface\\Icons\\INV_Misc_QuestionMark
		.'Button icon example. |buttonicon Interface\\Icons\\INV_Pick_02
		.'Map icon example. |mapicon Interface\\MINIMAP\\ObjectIcons
	step //23 labels and next jumps
		label "jump_demo"
		.'Relative jump (+1). |confirm |next "+1"
	step //24 relative jump landing
		.'Now jump to absolute step 26. |confirm |next "26"
	step //25 fallback if no jump
		.'If you reached this manually, continue. |confirm
	step //26 final author notes
		.'Authoring checklist:
		.'1) Keep step flow playable.
		.'2) Prefer real IDs and real coordinates.
		.'3) Use includes for common trainer/vendor logic.
		.'4) Gate loops with clear stop conditions.
		.'5) For |next guide jumps, use the exact guide name and escape folder slashes as \\\\ in Lua strings.
		.'6) Test with /reload, then full relaunch if new assets are added.
]])

ZygorGuidesViewer:RegisterGuide("Ares' Guide Authoring\\Examples\\Guide Skeleton Templates",[[
	author ErebusAres
	type professions
	startlevel 1
	description Copy-ready templates for common guide categories in this repo.
	step //1 Minimal guide skeleton
		.'A live copy/paste skeleton guide is included at the bottom of this file.
		.'Open it in the guide list: Ares' Guide Authoring\\Examples\\Copy-Paste Skeleton (Live)
	step //2 Professions skeleton
		.'Core pattern:
		.'1) Train and set .skillmax
		.'2) Add route/crafting step
		.'3) Add skill Profession,target checkpoint
		.'4) Repeat per bracket
		.'5) End with completion condition
	step //3 Achievement skeleton
		.'Core pattern:
		.'goto Zone,x,y |achieve achievementID/criteriaID
		.'Use one line per location or use route/loop if your criteria ordering allows it.
		.'Chain zones with |next "Guide Name".
	step //4 Gold route skeleton
		.'Core pattern:
		.'1) Setup (hearth, flight path, dailies unlocked)
		.'2) Ordered objective steps (quests, farms, vendor flips)
		.'3) Optional repeat loop with |until condition
		.'4) End-of-run checklist (bag space, AH post, cooldown crafts)
	step //5 Quality checklist
		.'Before PR/merge:
		.'- Every NPC/item/quest uses real IDs.
		.'- Coordinates are reachable on 3.3.5a terrain.
		.'- No placeholder text remains.
		.'- /reload test done, plus full relaunch if assets changed.
]])

ZygorGuidesViewer:RegisterGuide("Ares' Guide Authoring\\Examples\\Edge Cases and Pitfalls",[[
	author ErebusAres
	type professions
	startlevel 1
	description Edge cases contributors commonly hit. Each step demonstrates valid syntax and safe patterns.
	step //1 Goal text vs command tags in one line
		.'One line can combine text and tags. |confirm |next "+1"
	step //2 Single-line route note pattern
		.'Farm this route until Herbalism 150. |loop Westfall,56.4,22.5;45.7,27.9;35.9,34.2;36.5,50.4 |until herbalism>=150
		.'Use this style when you want readable prose and inline route logic.
	step //3 Path command with semicolons
		.'Path-style semicolon list also works. |path Elwynn Forest,42.4,66.2;33.6,59.4;28.1,54.5
		.'Use `path` for one-pass movement. Use `loop` for repeat circuits.
	step //4 Per-point achievement route
		route Teldrassil,40.0,65.0@842/6;43.0,74.0@842/4;54.0,68.0@842/5
		.'Use @achieve/criterion per route point when each coord maps to a different criterion.
	step //5 Relative and absolute guide jumps
		.'Relative jump (+1) and absolute step jump (8) are both valid. |confirm |next "+1"
	step //6 Absolute jump
		.'Jump to step 8. |confirm |next "8"
	step //7 Fallback if absolute jump fails
		.'If you landed here, test click behavior and debug logs.
	step //8 only-if and condition-visible separation
		.'Visible only while Mining is below 75. |only if skill("Mining")<75
		.'Always visible, but auto-completes at 75. |condition skill("Mining")>=75
		.'Visible-only checks do not complete goals by themselves.
	step //9 Forced completion / non-completion
		goto Elwynn Forest,42.4,66.2,1 |c
		.'Use |c to force-complete a waypoint objective on arrival.
		.kill 1 Stonetusk Boar##113 |n
		.'Use |n when a kill/get objective has no quest context.
	step //10 Sticky blocks and stickyif
		stickystart
		.'Sticky objective while you do nearby tasks.
		goto Elwynn Forest,39.4,58.2,1 |c
		stickystop
		.'Conditional stickiness example. |stickyif skill("Mining")<150
	step //11 Optional and important flags
		.'Optional side objective. |optional
		.'Important mandatory objective. |important
	step //12 noway and marker-only notes
		.'This note should not produce a waypoint. |noway
		.'Use noway for instructions where map arrow is not useful.
	step //13 Include pitfalls
		.'Include names must match registered include keys.
		.'Example valid includes: trainer_Mining, vendor_Mining, trainer_Alchemy.
		.'If include fails, parser reports "Include not found".
	step //14 Quest objective safety pattern
		.'Safe pattern for objective commands:
		.'- .kill/.get/.goal should include |q questID/objective OR |n
		.'- .collect can also carry |q when tied to quest progress.
	step //15 Next-guide escape pattern
		.'Guide jump string example:
		.'|next "Ares' WotLK 3.3.5a Guides\\Professions\\Mining 1-450 (WotLK Route)"
		.'In Lua source, backslashes must be escaped as \\\\.
	step //16 Final checks
		.'Edge-case checklist:
		.'1) Does every command line start with a dot command (or known bare command like goto/route/loop)?
		.'2) Are IDs/coords real and testable?
		.'3) Do jump labels and destinations exist?
		.'4) Do loops have clear |until exit conditions?
	step //17 comment icon header behavior test
		.'Dev test block using comment/header icon rows.
		.'East of the main path, loot Ambercorns around the trees.|route Mulgore,50.36,66.49;47.74,68.21;55.72,66.67
		.'And loot Well Stones (around the well at waypoint). |goto Mulgore,53.68,66.29
		.collect 2 Ambercorn##4809|q 771/1|icon Interface\\icons\\inv_misc_food_02
		.collect 2 Well Stone##4808|q 771/2|icon Interface\\icons\\INV_Stone_12
		.'
		.'Grind any mobs you see along the way.
		.'
		.'Kill/loot Wolves and Plainstriders.|icon Interface\\icons\\ability_meleedamage
		.collect 6 Prairie Wolf Paw##4758|q 748/1|icon Interface\\icons\\inv_misc_monsterclaw_04
		.collect 4 Plainstrider Talon##4759|q 748/2|n|icon Interface\\icons\\spell_nature_natureswrath
		.'
		.'Kill/loot Swoops, Wolves, Plainstriders and Cougars.|icon Interface\\icons\\ability_meleedamage
		.collect 1 Prairie Wolf Heart##4804|q 766/1|n|icon Interface\\icons\\inv_misc_organ_01
		.collect 1 Flatland Cougar Femur##4805|q 766/2|n|icon Interface\\icons\\inv_misc_bone_01
		.collect 1 Plainstrider Scale##4806|q 766/3|n|icon Interface\\icons\\inv_misc_monsterscales_03
		.collect 1 Swoop Gizzard##4807|q 766/4|n|icon Interface\\icons\\inv_misc_organ_04
		.'
		.'Kill/loot Swoops.|icon Interface\\icons\\ability_meleedamage
		.collect 8 Trophy Swoop Quill##4769|q 761/1|n|icon Interface\\icons\\spell_magic_featherfall
		only Tauren
	step //18 objective header control
		.'Control step using real objective header rows below.
		.kill Prairie Wolf##2966, Plainstrider##2955 |n|icon Interface\\icons\\ability_meleedamage
		.collect 6 Prairie Wolf Paw##4758|q 748/1|icon Interface\\icons\\inv_misc_monsterclaw_04
		.collect 4 Plainstrider Talon##4759|q 748/2|n|icon Interface\\icons\\spell_nature_natureswrath
		.'
		.kill Swoop##2971, Prairie Wolf##2966, Plainstrider##2955, Flatland Cougar##3035 |n|icon Interface\\icons\\ability_meleedamage
		.collect 1 Prairie Wolf Heart##4804|q 766/1|n|icon Interface\\icons\\inv_misc_organ_01
		.collect 1 Flatland Cougar Femur##4805|q 766/2|n|icon Interface\\icons\\inv_misc_bone_01
		.collect 1 Plainstrider Scale##4806|q 766/3|n|icon Interface\\icons\\inv_misc_monsterscales_03
		.collect 1 Swoop Gizzard##4807|q 766/4|n|icon Interface\\icons\\inv_misc_organ_04
		.'
		.kill Swoop##2971 |n|icon Interface\\icons\\ability_meleedamage
		.collect 8 Trophy Swoop Quill##4769|q 761/1|n|icon Interface\\icons\\spell_magic_featherfall
		only Tauren
]])

ZygorGuidesViewer:RegisterGuide("Ares' Guide Authoring\\Examples\\Copy-Paste Skeleton (Live)",[[
	author YourName
	type professions
	startlevel 1
	description Minimal live template. Duplicate this guide block and rename path/title for new guides.
	step //1 Start
		.'Replace this text with your first instruction. |confirm
	step //2 Movement example
		goto Elwynn Forest,42.4,66.2
		.'Replace zone/coords with your route start.
	step //3 Objective example
		.kill 5 Kobold Vermin##6 |n
		.'If objective is quest-bound, replace |n with |q questID/objective.
	step //4 Complete
		.'Guide template complete. Replace all steps with your own content.
]])
