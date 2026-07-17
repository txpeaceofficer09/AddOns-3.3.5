local ZygorGuidesViewer=ZygorGuidesViewer
if not ZygorGuidesViewer then return end

ZygorGuidesViewer:RegisterGuide("Ares' Guide Authoring\\Misc Dev Tests\\Comment Icon Header Test",[[
	author ErebusAres
	type leveling
	startlevel 1
	description Dev-only test guide for comment/header icon behavior on note rows versus objective rows.
	step //13 comment-header style
		.'East of the main path, loot Ambercorns around the trees.|route Mulgore,50.36,66.49;47.74,68.21;55.72,66.67
		.'And loot Well Stones (around the well at waypoint). |goto Mulgore,53.68,66.29
		.collect 2 Ambercorn##4809|q 771/1|icon Interface\\Icons\\INV_Misc_Food_02
		.collect 2 Well Stone##4808|q 771/2|icon Interface\\Icons\\INV_Stone_12
		info
		.'Grind any mobs you see along the way.
		info
		.'Kill/loot Wolves and Plainstriders.|icon Interface\\Icons\\Ability_MeleeDamage
		.collect 6 Prairie Wolf Paw##4758|q 748/1|icon Interface\\Icons\\INV_Misc_MonsterClaw_04
		.collect 4 Plainstrider Talon##4759|q 748/2|n|icon Interface\\Icons\\Spell_Nature_NaturesWrath
		info
		.'Kill/loot Swoops, Wolves, Plainstriders and Cougars.|icon Interface\\Icons\\Ability_MeleeDamage
		.collect 1 Prairie Wolf Heart##4804|q 766/1|n|icon Interface\\Icons\\INV_Misc_Organ_01
		.collect 1 Flatland Cougar Femur##4805|q 766/2|n|icon Interface\\Icons\\INV_Misc_Bone_01
		.collect 1 Plainstrider Scale##4806|q 766/3|n|icon Interface\\Icons\\INV_Misc_MonsterScales_03
		.collect 1 Swoop Gizzard##4807|q 766/4|n|icon Interface\\Icons\\INV_Misc_Organ_04
		info
		.'Kill/loot Swoops.|icon Interface\\Icons\\Ability_MeleeDamage
		.collect 8 Trophy Swoop Quill##4769|q 761/1|n|icon Interface\\Icons\\Spell_Magic_FeatherFall
	step //14 objective-header control
		.'Control step using real objective header rows below.
		.kill Prairie Wolf##2966, Plainstrider##2955 |n|buttonicon Interface\\Icons\\INV_Pick_02
		.collect 6 Prairie Wolf Paw##4758|q 748/1|icon Interface\\Icons\\INV_Misc_MonsterClaw_04
		.collect 4 Plainstrider Talon##4759|q 748/2|n|icon Interface\\Icons\\Spell_Nature_NaturesWrath
		.'
		.kill Swoop##2971, Prairie Wolf##2966, Plainstrider##2955, Flatland Cougar##3035 |n|buttonicon Interface\\Icons\\INV_Pick_02
		.collect 1 Prairie Wolf Heart##4804|q 766/1|n|icon Interface\\Icons\\INV_Misc_Organ_01
		.collect 1 Flatland Cougar Femur##4805|q 766/2|n|icon Interface\\Icons\\INV_Misc_Bone_01
		.collect 1 Plainstrider Scale##4806|q 766/3|n|icon Interface\\Icons\\INV_Misc_MonsterScales_03
		.collect 1 Swoop Gizzard##4807|q 766/4|n|icon Interface\\Icons\\INV_Misc_Organ_04
		.'
		.kill Swoop##2971 |n
		.collect 8 Trophy Swoop Quill##4769|q 761/1|n|icon Interface\\Icons\\Spell_Magic_FeatherFall
	step //15 known-good icon syntax control
		.'Known-good storage icon. |icon Interface\\Icons\\INV_Misc_QuestionMark
		.'Known-good button icon. |buttonicon Interface\\Icons\\INV_Pick_02
		.'Known-good map icon. |mapicon Interface\\MINIMAP\\ObjectIcons
		.'Go do this|goto Stormwind City,52.3,67.1|title Camp A
	step //16 Stormwind sequential goto example
		.'Sequential goto example: these are separate goals with normal progression.
		.'Go to the Trade District bank. |goto Stormwind City,58.9,69.8|title Bank Stop
		.'Then go to the Auction House. |goto Stormwind City,61.1,70.8|title Auction Stop
		.'Then go to the flight master. |goto Stormwind City,71.0,72.5|title Flight Stop
	step //17 Stormwind route example
		.'Route example: this should create a grouped route with walking ants between points. |route Stormwind City,58.9,69.8;61.1,70.8;71.0,72.5
		.'The route should move you through bank, auction house, then flight master.
	step //18 Stormwind loop example
		.'Loop example: this should create a closed square-ish loop with walking ants returning to the first point. |loop Stormwind City,58.9,69.8;61.1,70.8;67.8,79.4;73.8,73.6
		.'Useful for repeated farming or patrol-style routes. This test uses four stops so the loop is easier to see.
	step //19 Stormwind mixed header plus goto example
		.'A header note can still have its own icon. |icon Interface\\Icons\\INV_Misc_QuestionMark
		.'Go to the Trade District bank. |goto Stormwind City,58.9,69.8|title Bank Stop
		.'Then go to the Auction House. |goto Stormwind City,61.1,70.8|title Auction Stop
		.'Then go to the flight master. |goto Stormwind City,71.0,72.5|title Flight Stop

]])
