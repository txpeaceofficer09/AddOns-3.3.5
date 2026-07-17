Custom Talent Build Files

You can add your own builds in this folder and keep core files untouched.

Recommended workflow:
1. Create one of these files in this folder:
   build01.lua ... build10.lua
2. Put one or more RegisterBuild() entries inside that file.
3. Reload UI.

Build file skeleton:

	if not ZygorTalentAdvisor then return end

	ZygorTalentAdvisor:RegisterBuild(class, name, talents)

Valid class values:
- "HUNTER","MAGE","PALADIN","DRUID","WARRIOR","ROGUE","DEATHKNIGHT","PRIEST","SHAMAN","WARLOCK"
- Pet builds: "PET Tenacity","PET Ferocity","PET Cunning"

Talent input formats:
1) Named talent list (in leveling order)
   {"Talent One","Talent Two","Talent Three",...}

2) Blizzard numeric string
   "532122030000000000000225100202001312..."

3) Wowhead WotLK code or URL (3 tree segments)
   "2350002030023510253500331151--550000051"
   "https://www.wowhead.com/wotlk/talent-calc/warlock/2350002030023510253500331151--550000051_..."

Example:

	if not ZygorTalentAdvisor then return end

	ZygorTalentAdvisor:RegisterBuild(
		"WARLOCK",
		"My Affliction",
		"2350002030023510253500331151--550000051"
	)

Legacy-style example (kept for reference):

	if not ZygorTalentAdvisor then return end

	ZygorTalentAdvisor:RegisterBuild("DEATHKNIGHT","Blood with bits of Frost and Unholy",{
		"Anticipation",
		"Anticipation",
		"Anticipation",
		"Runic Power Mastery",
		"Runic Power Mastery",
		"Toughness",
		"Toughness",
		"Blade Barrier",
		"Blade Barrier",
		"Blade Barrier",
		"Blade Barrier",
		"Blade Barrier",
		"Two-Handed Weapon Specialization",
		"Two-Handed Weapon Specialization",
	})

	ZygorTalentAdvisor:RegisterBuild("DEATHKNIGHT","Frostie","00000000000000000000000000002250005105003101000000000000000000000000000000000000000000")

Notes argument example:

You can optionally provide notes right after the build title:

	ZygorTalentAdvisor:RegisterBuild(
		"WARRIOR",
		"WH T7+ Fury (Standard)",
		"Use this setup for general raiding. Swap to Overpower Weaving if needed.",
		"30202300233-325003005500310053120501351_001s0211rzn21s0h31rqh422j451rqg",
		[[
			Major Glyph of Whirlwind
			Major Glyph of Heroic Strike
			Major Glyph of Rending
			Minor Glyph of Charge
			Minor Glyph of Command
			Minor Glyph of Bloodrage
		]]
	)

Behavior:
- If notes are blank (""), they are ignored.
- If notes are omitted, nothing is shown.
- If notes are present, they are shown in the popout under the build selector.
