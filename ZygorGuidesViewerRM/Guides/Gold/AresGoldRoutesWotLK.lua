local ZygorGuidesViewer=ZygorGuidesViewer
if not ZygorGuidesViewer then return end

ZygorGuidesViewer:RegisterGuide("Ares' WotLK 3.3.5a Guides\\Gold\\Gold Route Hub (Starter + Optimized)",[[
	author ErebusAres
	type gold
	startlevel 80
	description Practical level 80 gold routing for Wrath 3.3.5a.
	step
		.' Use this hub to pick your daily gold plan:
		.' _Starter 80_: lower setup and easier execution.
		.' _Optimized 80_: maximum daily throughput.
	step
		.' You are below level 80. Finish leveling first for these routes. |only if level<80
	step
		.' Alliance players: open _Starter 80 Gold Route_. |confirm |next "Ares' WotLK 3.3.5a Guides\\Gold\\Starter 80 Gold Route (Alliance)"
		.' Horde players: open _Starter 80 Gold Route_. |confirm |next "Ares' WotLK 3.3.5a Guides\\Gold\\Starter 80 Gold Route (Horde)"
	step
		.' Alliance players: open _Optimized 80 Gold Route_. |confirm |next "Ares' WotLK 3.3.5a Guides\\Gold\\Optimized 80 Gold Route (Alliance)"
		.' Horde players: open _Optimized 80 Gold Route_. |confirm |next "Ares' WotLK 3.3.5a Guides\\Gold\\Optimized 80 Gold Route (Horde)"
	step
		.' Open _Sholazar 30-Min Gathering Circuit_. |confirm |next "Ares' WotLK 3.3.5a Guides\\Gold\\Sholazar 30-Min Gathering Circuit"
	step
		.' Open _Icecrown Cloth + Vendor Circuit_. |confirm |next "Ares' WotLK 3.3.5a Guides\\Gold\\Icecrown Cloth + Vendor Circuit"
]])

ZygorGuidesViewer:RegisterGuide("Ares' WotLK 3.3.5a Guides\\Gold\\Starter 80 Gold Route (Alliance)",[[
	author ErebusAres
	type gold
	faction alliance
	startlevel 80
	description Starter-friendly daily gold checklist for Alliance level 80 characters.
	daily
	step
		.' Prep checklist:
		.' Empty at least 40 bag slots.
		.' Bring food/water and repair before leaving Dalaran.
		.' Set Hearthstone to Dalaran.
	step
		.' This route is tuned for level 80 only. |only if level<80
	step
		.' Complete _Dalaran Cooking Daily_.
		.' Complete _Dalaran Fishing Daily_.
		.' If Jewelcrafting is 350+, complete _Dalaran Jewelcrafting Daily_.
	step
		.' Run these fast solo daily clusters:
		.' _K3 / Sons of Hodir_ dailies in Storm Peaks.
		.' _Wyrmrest Temple_ dailies in Dragonblight.
		.' _The Oracles_ or _Frenzyheart_ dailies in Sholazar Basin.
	step
		only if skill("Mining")>0 or skill("Herbalism")>0
		.' Fallback farm if you cannot access all dailies yet:
		.' Spend 25-30 minutes gathering in Sholazar Basin.
		.' Prioritize Saronite nodes and Goldclover/Tiger Lily.
	step
		only if skill("Mining")>0 or skill("Herbalism")>0
		.' Click to run the dedicated _Sholazar 30-Min Gathering Circuit_. |confirm |next "Ares' WotLK 3.3.5a Guides\\Gold\\Sholazar 30-Min Gathering Circuit"
	step
		only if skill("Mining")==0 and skill("Herbalism")==0
		.' You do not have Mining/Herbalism.
		.' Use _Icecrown Cloth + Vendor Circuit_ as your fallback farm. |confirm |next "Ares' WotLK 3.3.5a Guides\\Gold\\Icecrown Cloth + Vendor Circuit"
	step
		.' End-of-run checklist:
		.' Vendor gray/white trash.
		.' Post stackable mats to Auction House.
		.' Keep one stack each of Northrend cooking fish for future dailies.
]])

ZygorGuidesViewer:RegisterGuide("Ares' WotLK 3.3.5a Guides\\Gold\\Starter 80 Gold Route (Horde)",[[
	author ErebusAres
	type gold
	faction horde
	startlevel 80
	description Starter-friendly daily gold checklist for Horde level 80 characters.
	daily
	step
		.' Prep checklist:
		.' Empty at least 40 bag slots.
		.' Bring food/water and repair before leaving Dalaran.
		.' Set Hearthstone to Dalaran.
	step
		.' This route is tuned for level 80 only. |only if level<80
	step
		.' Complete _Dalaran Cooking Daily_.
		.' Complete _Dalaran Fishing Daily_.
		.' If Jewelcrafting is 350+, complete _Dalaran Jewelcrafting Daily_.
	step
		.' Run these fast solo daily clusters:
		.' _K3 / Sons of Hodir_ dailies in Storm Peaks.
		.' _Wyrmrest Temple_ dailies in Dragonblight.
		.' _The Oracles_ or _Frenzyheart_ dailies in Sholazar Basin.
	step
		only if skill("Mining")>0 or skill("Herbalism")>0
		.' Fallback farm if you cannot access all dailies yet:
		.' Spend 25-30 minutes gathering in Sholazar Basin.
		.' Prioritize Saronite nodes and Goldclover/Tiger Lily.
	step
		only if skill("Mining")>0 or skill("Herbalism")>0
		.' Click to run the dedicated _Sholazar 30-Min Gathering Circuit_. |confirm |next "Ares' WotLK 3.3.5a Guides\\Gold\\Sholazar 30-Min Gathering Circuit"
	step
		only if skill("Mining")==0 and skill("Herbalism")==0
		.' You do not have Mining/Herbalism.
		.' Use _Icecrown Cloth + Vendor Circuit_ as your fallback farm. |confirm |next "Ares' WotLK 3.3.5a Guides\\Gold\\Icecrown Cloth + Vendor Circuit"
	step
		.' End-of-run checklist:
		.' Vendor gray/white trash.
		.' Post stackable mats to Auction House.
		.' Keep one stack each of Northrend cooking fish for future dailies.
]])

ZygorGuidesViewer:RegisterGuide("Ares' WotLK 3.3.5a Guides\\Gold\\Optimized 80 Gold Route (Alliance)",[[
	author ErebusAres
	type gold
	faction alliance
	startlevel 80
	description High-throughput daily gold route for geared Alliance level 80 characters.
	daily
	step
		.' Optimization setup:
		.' Have fast flying unlocked.
		.' Maintain dedicated gold-run bags (no gear clutter).
		.' Use a banker alt mailing workflow if available.
	step
		.' This route is tuned for level 80 only. |only if level<80
	step
		.' Run Zygor's proven gold sequence:
		.' _Level 80 Dailies Speed Gold Run (No ATG Dailies)_ on low-time days.
		.' _Level 80 Dailies Speed Gold Run (With ATG Dailies)_ on full-time days.
	step
		.' Open _No ATG_ speed run now. |confirm |next "Zygor's Alliance Dailies Guides\\Speed Gold Runs\\Level 80 Dailies Speed Gold Run (No ATG Dailies)"
	step
		.' Open _With ATG_ speed run now. |confirm |next "Zygor's Alliance Dailies Guides\\Speed Gold Runs\\Level 80 Dailies Speed Gold Run (With ATG Dailies)"
	step
		.' Post-run optimization:
		.' Convert Frostweave Cloth into bolts if Tailoring is available.
		.' Smelt and stack ore bars if bar prices are higher than raw ore.
		.' Re-list undercut-sensitive mats in evening prime time.
	step
		.' If daily quests are locked out, run _Icecrown Cloth + Vendor Circuit_ for filler gold. |confirm |next "Ares' WotLK 3.3.5a Guides\\Gold\\Icecrown Cloth + Vendor Circuit"
]])

ZygorGuidesViewer:RegisterGuide("Ares' WotLK 3.3.5a Guides\\Gold\\Optimized 80 Gold Route (Horde)",[[
	author ErebusAres
	type gold
	faction horde
	startlevel 80
	description High-throughput daily gold route for geared Horde level 80 characters.
	daily
	step
		.' Optimization setup:
		.' Have fast flying unlocked.
		.' Maintain dedicated gold-run bags (no gear clutter).
		.' Use a banker alt mailing workflow if available.
	step
		.' This route is tuned for level 80 only. |only if level<80
	step
		.' Run Zygor's proven gold sequence:
		.' _Level 80 Dailies Speed Gold Run (No ATG Dailies)_ on low-time days.
		.' _Level 80 Dailies Speed Gold Run (With ATG Dailies)_ on full-time days.
	step
		.' Open _No ATG_ speed run now. |confirm |next "Zygor's Horde Dailies Guides\\Speed Gold Runs\\Level 80 Dailies Speed Gold Run (No ATG Dailies)"
	step
		.' Open _With ATG_ speed run now. |confirm |next "Zygor's Horde Dailies Guides\\Speed Gold Runs\\Level 80 Dailies Speed Gold Run (With ATG Dailies)"
	step
		.' Post-run optimization:
		.' Convert Frostweave Cloth into bolts if Tailoring is available.
		.' Smelt and stack ore bars if bar prices are higher than raw ore.
		.' Re-list undercut-sensitive mats in evening prime time.
	step
		.' If daily quests are locked out, run _Icecrown Cloth + Vendor Circuit_ for filler gold. |confirm |next "Ares' WotLK 3.3.5a Guides\\Gold\\Icecrown Cloth + Vendor Circuit"
]])

ZygorGuidesViewer:RegisterGuide("Ares' WotLK 3.3.5a Guides\\Gold\\Sholazar 30-Min Gathering Circuit",[[
	author ErebusAres
	type gold
	startlevel 80
	description Repeatable 30-minute gathering loop focused on Saronite and high-demand herbs.
	daily
	step
		.' Setup:
		.' Enable _Find Minerals_ and _Find Herbs_.
		.' Empty bag space and repair before starting.
	step
		only if skill("Mining")==0 and skill("Herbalism")==0
		.' This circuit is intended for gatherers.
		.' If you have neither Mining nor Herbalism, use the Icecrown cloth route instead. |confirm |next "Ares' WotLK 3.3.5a Guides\\Gold\\Icecrown Cloth + Vendor Circuit"
	step
		goto Sholazar Basin,50.0,62.1
		.' Start at River's Heart and ride a clockwise outer-basin loop.
	step
		goto Sholazar Basin,58.9,83.9
		.' Sweep the southeast rim and mine/gather all visible nodes.
	step
		goto Sholazar Basin,77.5,69.1
		.' Continue along the eastern wall toward Makers' Perch.
	step
		goto Sholazar Basin,72.2,40.5
		.' Cut north and gather around the Lifeblood Pillar approach.
	step
		goto Sholazar Basin,49.8,21.0
		.' Cross the north rim toward the Skyreach / Avalanche shelf.
	step
		goto Sholazar Basin,28.8,35.2
		.' Sweep the west rim and gather near Mosswalker and wildgrowth pockets.
	step
		goto Sholazar Basin,25.8,58.5
		.' Finish the southwest pass and return to River's Heart.
	step
		goto Sholazar Basin,50.0,62.1
		.' Loop complete.
		.' Continue looping until your 30-minute timer ends, then vendor and auction materials.
]])

ZygorGuidesViewer:RegisterGuide("Ares' WotLK 3.3.5a Guides\\Gold\\Icecrown Cloth + Vendor Circuit",[[
	author ErebusAres
	type gold
	startlevel 80
	description Simple open-world circuit for Frostweave cloth, vendor gold, and trash drops.
	daily
	step
		.' Setup:
		.' Bring large bags and repair first.
		.' This route is strongest with good AoE and low downtime.
	step
		.' Optional: if you have Tailoring, keep Frostweave for bolts before selling. |only if skill("Tailoring")>0
	step
		goto Icecrown,71.8,37.3
		.' Start in Ymirheim and clear humanoid packs for Frostweave Cloth.
	step
		goto Icecrown,68.7,33.2
		.' Continue pulling groups through the central terraces.
	step
		goto Icecrown,64.8,43.6
		.' Move to the lower buildings and clear clockwise.
	step
		goto Icecrown,58.3,62.8
		.' Shift to Aldur'Thar outskirts and clear humanoid clusters.
	step
		goto Icecrown,54.2,71.1
		.' Finish in the southern platform pockets; focus fast-respawn packs.
	step
		.' Mail cloth/greens to your banker alt.
		.' Vendor gray items immediately.
		.' Repeat the circuit if respawns are active and your bags allow.
]])
