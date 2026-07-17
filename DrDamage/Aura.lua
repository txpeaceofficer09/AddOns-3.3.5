local DrDamage = DrDamage
local GetSpellInfo = GetSpellInfo
DrDamage.PlayerAura = {}
DrDamage.TargetAura = {}
DrDamage.Consumables = {}
DrDamage.Calculation = {}

function DrDamage.SafeGetSpellInfo(...)
	local name, rank, icon, cost, isFunnel, powerType, castTime = GetSpellInfo(...)
	--[===[@debug@
	if not name then
		local id = ...
		DrDamage:Print("SpellID removed: " .. id)
	end
	--@end-debug@]===]
	return name or "", rank, icon or "", cost, isFunnel, powerType, castTime
end

local function DrD_LoadAuras()
	local L = LibStub("AceLocale-3.0"):GetLocale("DrDamage", true)
	local playerClass = select(2,UnitClass("player"))
	local playerHealer = (playerClass == "PRIEST") or (playerClass == "SHAMAN") or (playerClass == "PALADIN") or (playerClass == "DRUID")
	local playerCaster = (playerClass == "MAGE") or (playerClass == "PRIEST") or (playerClass == "WARLOCK")
	local playerMelee = (playerClass == "ROGUE") or (playerClass == "WARRIOR") or (playerClass == "HUNTER")
	local playerHybrid = (playerClass == "DEATHKNIGHT") or (playerClass == "DRUID") or (playerClass == "PALADIN") or (playerClass == "SHAMAN")
	local DK = (playerClass == "DEATHKNIGHT")
	local Aura = DrDamage.PlayerAura
	local GetSpellInfo = DrDamage.SafeGetSpellInfo
	local horde = (UnitFactionGroup("player") == "Horde")
	local UnitBuff = UnitBuff
	local select = select

	--[[ NOTES:
	 	School = "Spells" means it applies to both heals and spells
	 	School = "Damage Spells" means it applies to all damaging spells
		School = "Healing" applies only to heals
		School = "Physical" applies only to abilities dealing physical damage, which is the default in melee module unless otherwise specified
		School = "All" applies to everything
		No school or spell applies to everything but healing
		Caster = true or Melee = true limits it to respective modules
	--]]

	if horde then
		--Bloodlust
		Aura[GetSpellInfo(2825)] = { School = "All", Category = "30% haste", ID = 2825, CustomHaste = true, Multiply = true, Mods = { ["haste"] = 0.3 } }
	else
		--Heroism
		Aura[GetSpellInfo(32182)] = { School = "All", Category = "30% haste", ID = 32182, CustomHaste = true, Multiply = true, Mods = { ["haste"] = 0.3 } }
		--Heroic Presence
		Aura[GetSpellInfo(28878)] = { Value = 1, ModType = "hitPerc", ID = 28878 }
	end
	--Ancient Hysteria
	Aura[GetSpellInfo(90355)] = { School = "All", Category = "30% haste", ID = 90355, CustomHaste = true, Multiply = true, Mods = { ["haste"] = 0.3 } }
	--Time Warp
	Aura[GetSpellInfo(80353)] = { School = "All", Category = "30% haste", ID = 80353, CustomHaste = true, Multiply = true, Mods = { ["haste"] = 0.3 } }	
	--Ferocious Inspiration
	Aura[GetSpellInfo(34460)] = { Category = "+3% damage", Not = { "Absorb", "Utility", "Pet" }, Manual = GetSpellInfo(34460), ID = 34460, Multiply = true, Mods = { ["dmgM"] = 0.03 } }
	--Arcane Empowerment
	--Aura[GetSpellInfo(31579)] = Aura[GetSpellInfo(34460)]
	--Sanctified Retribution	
		--Concentration
		--Aura[GetSpellInfo(19746)] = { Category = "+3% damage", Not = { "Absorb", "Utility", "Pet" }, Manual = GetSpellInfo(31869), ID = 31869, Multiply = true, Mods = { ["dmgM"] = 0.03 } }
		--Retribution
		--Aura[GetSpellInfo(7294)] = 	Aura[GetSpellInfo(19746)]
		--Devotion
		--Aura[GetSpellInfo(465)] = Aura[GetSpellInfo(19746)]		
		--Crusader
		--Aura[GetSpellInfo(32223)] = Aura[GetSpellInfo(19746)]
		--Fire Resistance
		--Aura[GetSpellInfo(19891)] = Aura[GetSpellInfo(19746)]
		--Frost Resitance
		--Aura[GetSpellInfo(19888)] = Aura[GetSpellInfo(19746)]
		--Shadow Resistance
		--Aura[GetSpellInfo(19876)] = Aura[GetSpellInfo(19746)]
	--+5% crit
	--Elemental Oath
	Aura[GetSpellInfo(51466)] = { School = "All", Category = "+5% crit", ID = 51466, Mods = { ["spellCrit"] = 5, ["meleeCrit"] = 5 } }
	--Leader of the Pack
	Aura[GetSpellInfo(17007)] = { School = "All", Category = "+5% crit", ID = 17007, Mods = { ["spellCrit"] = 5, ["meleeCrit"] = 5 } }
	--Rampage
	Aura[GetSpellInfo(29801)] = { School = "All", Category = "+5% crit", ID = 29801, Mods = { ["spellCrit"] = 5, ["meleeCrit"] = 5 } }	
	--Terrifying Roar
	Aura[GetSpellInfo(90309)] = { School = "All", Category = "+5% crit", ID = 90309, Mods = { ["spellCrit"] = 5, ["meleeCrit"] = 5 } }	
	--Furious Howl
	Aura[GetSpellInfo(24604)] = { School = "All", Category = "+5% crit", ID = 24604, Mods = { ["spellCrit"] = 5, ["meleeCrit"] = 5 } }
	--Honor Among Thieves
	Aura[GetSpellInfo(51701)] = { School = "All", Category = "+5% crit", ID = 51701, Mods = { ["spellCrit"] = 5, ["meleeCrit"] = 5 } }
	
	if playerCaster or playerHybrid then
	--CORE
		--Bloodgem Infusion
		Aura[GetSpellInfo(34379)] = { School = "Damage Spells", Value = 0.05, NoManual = true }
		--Vibrant Blood
		Aura[GetSpellInfo(35329)] = { School = "Damage Spells", Value = 0.1, NoManual = true }
		--Hysteria (needs to be divided out from multiplier)
		--Aura[GetSpellInfo(49016)] = { School = "Damage Spells", Value = -1 + 1/1.2, NoManual = true }
		--Unrelenting Assault
		--Aura[GetSpellInfo(64850)] = { School = "Spells", Not = { "Absorb", "Utility", "Pet" }, Value = -0.25, Ranks = 2, NoManual = true }	
		if not DK then
			--+6% Spell Power
				--Arcane Brilliance
				Aura[GetSpellInfo(1459)] = { School = "All", Category = "+6% SP", Mods = { ["SPM"] = 0.06 }, ID = 1459, }
				--Dalaran Brilliance
				Aura[GetSpellInfo(61316)] = { School = "All", Category = "+6% SP", Mods = { ["SPM"] = 0.06 }, ID = 61316, }
				--Flametongue Totem
				Aura[GetSpellInfo(8227)] = { School = "All", Category = "+6% SP", Mods = { ["SPM"] = 0.06 }, ID = 8227, }
			--+10% Spell Power
				--Totemic Wrath
				Aura[GetSpellInfo(77746)] = { School = "All", Category = "+10% SP", Mods = { ["SPM"] = 0.1 }, ID = 77746, }
				--Demonic Pact
				Aura[GetSpellInfo(47236)] = { School = "All", Category = "+10% SP", Mods = { ["SPM"] = 0.1 }, ID = 47236 }
			--+5% spell haste
				--Wrath of Air
				Aura[GetSpellInfo(3738)] = { School = "Spells", Category = "+5% haste", Caster = true, CustomHaste = true, Mods = { ["haste"] = function(v, baseSpell) return baseSpell.MeleeHaste and v or v * 1.05 end }, ID = 3738 }
				--Moonkin Aura
				Aura[GetSpellInfo(24907)] = { School = "Spells", Category = "+5% haste", Caster = true, CustomHaste = true, Mods = { ["haste"] = function(v, baseSpell) return baseSpell.MeleeHaste and v or v * 1.05 end }, ID = 24907 }			
				--Mind Quickening
				Aura[GetSpellInfo(49868)] = { School = "Spells", Category = "+5% haste", Caster = true, CustomHaste = true, Mods = { ["haste"] = function(v, baseSpell) return baseSpell.MeleeHaste and v or v * 1.05 end }, ID = 49868 }			
			--Power Infusion
			Aura[GetSpellInfo(10060)] = { School = "Spells", Caster = true, Multiply = true, Mods = { ["haste"] = 0.2, ["manaCost"] = -0.2 }, ID = 10060 }
		end	
	end
	if playerHybrid or playerMelee then
		--+10% AP
			--Blessing of Might
			Aura[GetSpellInfo(19740)] = { Mods = { ["APM"] = 0.1 }, ID = 19740, Category = "+10% AP" }	
			--Trueshot Aura
			Aura[GetSpellInfo(19506)] = { Mods = { ["APM"] = 0.1 }, ID = 19506, Category = "+10% AP" }
			--Unleashed Rage
			Aura[GetSpellInfo(30808)] = { Mods = { ["APM"] = 0.1 }, ID = 30809, Category = "+10% AP" }
			--Abomination's Might
			Aura[GetSpellInfo(53138)] = { Mods = { ["APM"] = 0.1 }, ID = 53138, Category = "+10% AP" }
		--+10% melee haste
			--Windfury Totem
			Aura[GetSpellInfo(8512)] = { CustomHaste = true, Mods = { ["haste"] = function(v, baseSpell) return (baseSpell.WeaponDPS or baseSpell.NextMelee or baseSpell.MeleeHaste) and 1.1 * v or v end }, ID = 8512, Category = "+Meleehaste" }
			--Improved Icy Talons
			Aura[GetSpellInfo(55610)] = { CustomHaste = true, Mods = { ["haste"] = function(v, baseSpell) return (baseSpell.WeaponDPS or baseSpell.NextMelee or baseSpell.MeleeHaste) and 1.1 * v or v end }, ID = 58578, Category = "+Meleehaste" }
			--Hunting Party
			Aura[GetSpellInfo(53290)] = { CustomHaste = true, Mods = { ["haste"] = function(v, baseSpell) return (baseSpell.WeaponDPS or baseSpell.NextMelee or baseSpell.MeleeHaste) and 1.1 * v or v end }, ID = 53290, Category = "+Meleehaste" }			
	end
	if playerHealer then
	--Buffs
		--Nether Portal - Serenity (Karazhan)
		Aura[GetSpellInfo(30422)] = { School = "Healing", Caster = true, Value = 0.05, Apps = 99, NoManual = true }
		--Luck of the Draw (Random LFG Bonus)
		Aura[GetSpellInfo(72221)] = { School = "Healing", Caster = true, Value = 0.05, NoManual = true }
		--Strength of Wrynn
		Aura[GetSpellInfo(73762)] = { School = { "Healing", "Pet" }, Caster = true, NoManual = true, ModType = 
			function( calculation, _, _, index )
				local id
				if index then id = select(11,UnitBuff("player",index)) end
				local bonus = (id == 73828) and 0.3 or (id == 73827) and 0.25 or (id == 73826) and 0.2 or (id == 73825) and 0.15 or (id == 73824) and 0.1 or 0.05 --73762
				calculation.dmgM = calculation.dmgM * (1 + bonus)
				calculation.dmgM_absorb = (calculation.dmgM_absorb or 1) * (1 + bonus)
			end
		}
		--Hellscream's Warsong
		Aura[GetSpellInfo(73816)] = { School = { "Healing", "Pet" }, Caster = true, NoManual = true, ModType = 
			function( calculation, _, _, index )
				local id
				if index then id = select(11,UnitBuff("player",index)) end
				local bonus = (id == 73822) and 0.3 or (id == 73821) and 0.25 or (id == 73820) and 0.2 or (id == 73819) and 0.15 or (id == 73818) and 0.1 or 0.05 --73816
				calculation.dmgM = calculation.dmgM * (1 + bonus)
				calculation.dmgM_absorb = (calculation.dmgM_absorb or 1) * (1 + bonus)
			end
		}		
	--Debuffs
		--Stolen Soul (Exarch Maladaar)
		Aura[GetSpellInfo(32346)] = { School = "Healing", Caster = true, Value = -0.5, NoManual = true }
		--Wretching Bile (Stratholme)
		Aura[GetSpellInfo(52527)] = { School = "Healing", Caster = true, Value = -0.35, NoManual = true }
		--Necrotic Strike (Icecrown)
		Aura[GetSpellInfo(60626)] = { School = "Healing", Caster = true, Value = -0.1, Apps = 1, NoManual = true }
		--Emerald Vigor (Valithria Dreamwalker)
		Aura[GetSpellInfo(70873)] = { School = "Healing", Caster = true, Value = 0.10, Apps = 1, NoManual = true }
		--Hopelessness
		Aura[GetSpellInfo(72390)] = { School = "Healing", Caster = true, NoManual = true, ModType = 
			function( calculation, _, _, index )
				local id
				if index then id = select(11,UnitBuff("player",index)) end
				local penalty = (id == 72397) and 0.6 or (id == 72396) and 0.4 or (id == 72395) and 0.2 or (id == 72393) and 0.75 or (id == 72391) and 0.5 or 0.25 --72390
				calculation.dmgM = calculation.dmgM * (1 - penalty)
			end
		}
	end
	if playerHealer or playerCaster or playerHybrid then
		--Shadow Crash ((Valithria Dreamwalker)
		Aura[GetSpellInfo(63277)] = { School = "Spells", Not = { "Absorb", "Utility", "Pet" }, ModType = function(calculation) calculation.dmgM = calculation.dmgM * (calculation.healingSpell and 0.25 or 2) end, NoManual = true, }
		--Debilitating Strike (Melee damage done reduced by 75%)
		Aura[GetSpellInfo(37578)] = { School = "Damage Spells", Value = 1/(1-0.75) - 1, NoManual = true }
		--Bonegrinder (Melee damage done reduced by 75%)
		Aura[GetSpellInfo(43952)] = Aura[GetSpellInfo(37578)]
		--Hammer Drop (Physical damage done reduced by 5%)
		Aura[GetSpellInfo(57759)] = { School = "Damage Spells", Apps = 1, NoManual = true, ModType =
			function(calculation, _, _, _, apps)
				calculation.dmgM = calculation.dmgM * 1/(1-0.05 * apps)
			end
		}
		--Alluring Aura (Karazhan - Physical Damage done is reduced by 50%)
		--Aura[GetSpellInfo(29485)] = { School = "Damage Spells", Value = 1/(1-0.5) - 1, NoManual = true }
		--Shatter Armor (SSC - Melee damage done reduced by 35%)
		--Aura[GetSpellInfo(38591)] = { School = "Damage Spells", Value = 1/(1-0.35) - 1, NoManual = true }
	end

--Target
	Aura = DrDamage.TargetAura
	
--Buffs
	--Icebound Fortitude
	Aura[GetSpellInfo(48792)] = { Value = -0.2, NoManual = true }
	--Bone Shield
	Aura[GetSpellInfo(49222)] = { Value = -0.2, NoManual = true }
	--Blade Barrier
	Aura[GetSpellInfo(49182)] = { Value = -0.02, Ranks = 3, NoManual = true }
	--Shadowform
	Aura[GetSpellInfo(15473)] = { Value = -0.15, NoManual = true }	
--Debuffs
	--+8% Magic Damage
		--Curse of the Elements (Warlock)
		Aura[GetSpellInfo(1490)] = { Value = 0.08, Category = "+8% dmg", ID = 1490, ModType = "dmgM_Magic" }
		--Earth and Moon (Druid)
		Aura[GetSpellInfo(48506)] = { Value = 0.08, Category = "+8% dmg", ID = 48506, ModType = "dmgM_Magic" }
		--Ebon Plague (Death Knight)
		Aura[GetSpellInfo(51160)] = { Value = 0.08, Category = "+8% dmg", ID = 51160, ModType = "dmgM_Magic" }
		--Fire Breath (Hunter pet)
		Aura[GetSpellInfo(34889)] = { Value = 0.08, Category = "+8% dmg", ID = 34889, ModType = "dmgM_Magic" }
		--Lightning Breath (Hunter pet)
		Aura[GetSpellInfo(24844)] = { Value = 0.08, Category = "+8% dmg", ID = 24844, ModType = "dmgM_Magic" }
		--Master Poisoner (Rogue)
		Aura[GetSpellInfo(93068)] = { Value = 0.08, Category = "+8% dmg", ID = 93068, ModType = "dmgM_Magic" }
	--Focused Will
	Aura[GetSpellInfo(45234)] = { Apps = 2, Ranks = 2, NoManual = true, ModType =
		function( calculation, _, _, _, apps, _, rank )
			if UnitExists("target") and not UnitIsFriend("target","player") then
				calculation.dmgM = calculation.dmgM * (1 - (rank * 0.02 + 0.02) * apps)
			end
		end
	}
	if playerCaster or playerHybrid then
		--Anti-Magic Shell
		Aura[GetSpellInfo(48707)] = { School = "Damage Spells", Value = -0.75, NoManual = true }
		--Spell Vulnerability (from Nightfall)
		--Aura[GetSpellInfo(23605)] = { School = "Damage Spells", Value = 0.15, NoManual = true }
	end
	--Buffs
	if playerHealer then
		--Amplify Magic
		--Aura[GetSpellInfo(1008)] = { School = "Healing", Caster = true, ModType = "spellDmg", Ranks = 7, Value = { 16, 32, 53, 80, 96, 128, 255 }, ID = 1008 }
		--Demon Armor
		Aura[GetSpellInfo(687)] = { School = "Healing", Caster = true, Value = 0.2, ID = 687 }
		--Vampiric Blood
		Aura[GetSpellInfo(55233)] = { School = "Healing", Caster = true, Value = 0.25, NoManual = true }
		--Divine Hymn
		Aura[GetSpellInfo(64843)] = { School = "Healing", Caster = true, Value = 0.1, NoManual = true }
		--Guardian Spirit
		Aura[GetSpellInfo(47788)] = { School = "Healing", Caster = true, Value = 0.4, NoManual = true }
		--Tenacity
		--Aura[GetSpellInfo(58549)] = { School = "Healing", Caster = true, Texture = "Interface\\Icons\\Ability_Warrior_StrengthOfArms", Apps = 1, Value = 0.18, NoManual = true }		
		--Tree of Life
		--Aura[GetSpellInfo(34123)] = { School = "Healing", Caster = true, Category = "+6% Healing", BuffID = 34123, ID = 34123, Value = 0.06 }
	--Debuffs
	--Player
		--Mortal Strike
		Aura[GetSpellInfo(12294)] = { School = "Healing", Caster = true, Value = -0.1, Category = "Mortal Strike", Manual = GetSpellInfo(12294), ID = 12294 }
		--Legion Strike (Felguard)
		Aura[GetSpellInfo(30213)] = { School = "Healing", Caster = true, Value = -0.1, Category = "Mortal Strike", Manual = GetSpellInfo(12294), ID = 12294 }
		--Wound Poison I-VII
		Aura[GetSpellInfo(13218)] = Aura[GetSpellInfo(12294)]
		Aura[GetSpellInfo(13222)] = Aura[GetSpellInfo(12294)]
		Aura[GetSpellInfo(13223)] = Aura[GetSpellInfo(12294)]
		Aura[GetSpellInfo(13224)] = Aura[GetSpellInfo(12294)]
		Aura[GetSpellInfo(27189)] = Aura[GetSpellInfo(12294)]
		Aura[GetSpellInfo(57974)] = Aura[GetSpellInfo(12294)]
		Aura[GetSpellInfo(57975)] = Aura[GetSpellInfo(12294)]
		--Furious Attacks (Fury Warrior talent)
		Aura[GetSpellInfo(56112)] = Aura[GetSpellInfo(12294)]
		--Mind Trauma (Improved Mind Blast)
		Aura[GetSpellInfo(48301)] = Aura[GetSpellInfo(12294)]
	--NPC
	--25% reduction
		--Fetid Rot (King Ymiron)
		Aura[GetSpellInfo(48291)] = { School = "Healing", Caster = true, Value = -0.25, Category = "Mortal Strike", NoManual = true }
		--Wounding Strike (Chrono-Lord Epoch - Stratholme)
		Aura[GetSpellInfo(52771)] = Aura[GetSpellInfo(48291)]
		--Dark Volley (Ulduar - Guardian of Yogg-Saron)
		Aura[GetSpellInfo(63038)] = Aura[GetSpellInfo(48291)]
	--50% reduction (Mortal Strike)
		--Mortal Cleave (random mobs)
		Aura[GetSpellInfo(22859)] = { School = "Healing", Caster = true, Value = -0.5, Category = "Mortal Strike", NoManual = true }
		--Mutated Infection (Rotface)
		Aura[GetSpellInfo(69674)] = Aura[GetSpellInfo(22859)]
		--Soul Strike (Halls of Lightning, Mana-Tombs)
		Aura[GetSpellInfo(32315)] = Aura[GetSpellInfo(22859)]
		--Curse of the Deadwood (Felwood)
		Aura[GetSpellInfo(13583)] = Aura[GetSpellInfo(22859)]
		--Arcing Smash (Gurtogg)
		Aura[GetSpellInfo(40599)] = Aura[GetSpellInfo(22859)]
	--75% reduction
		--Veil of Shadow (Multiple places)
		Aura[GetSpellInfo(17820)] = { School = "Healing", Caster = true, Value = -0.75, Category = "Mortal Strike", NoManual = true }
		--Veil of Shadow Alternate (Different Localized name)
		Aura[GetSpellInfo(69633)] = Aura[GetSpellInfo(17820)]
		--Gehennas' Curse
		Aura[GetSpellInfo(19716)] = Aura[GetSpellInfo(17820)]
	--100% reduction
		--Necrotic Aura (Loatheb)
		Aura[GetSpellInfo(55593)] = { School = "Healing", Caster = true, Value = -1, Category = "Mortal Strike", NoManual = true }
		--Embrace of the Vampyr (Prince Taldaram)
		Aura[GetSpellInfo(59513)] = { School = "Healing", Caster = true, Value = -1, Category = "Mortal Strike", DebuffID = 59513, NoManual = true }
		--Enfeeble (Prince Malchezaar)
		Aura[GetSpellInfo(30843)] = Aura[GetSpellInfo(55593)]
	--Others
		--Nether Portal - Dominance (Kharazan)
		Aura[GetSpellInfo(30423)] = { School = "Healing", Caster = true, Value = -0.01, Apps = 10, Category = "Mortal Strike", NoManual = true }
		--Dark Touched (Eredar Twins)
		Aura[GetSpellInfo(45347)] = { School = "Healing", Caster = true, Value = -0.05, Apps = 1, Category = "Mortal Strike", NoManual = true }
		--Mortal Wound (Naxxramas etc)
		Aura[GetSpellInfo(28467)] = { School = "Healing", Caster = true, Value = -0.1, Apps = 1, Category = "Mortal Strike", NoManual = true }
		--Chop (random 70-80 mobs)
		Aura[GetSpellInfo(43410)] = { School = "Healing", Caster = true, Value = -0.1, Category = "Mortal Strike", NoManual = true }
		--Suppression (Valithria Dreamwalker)
		Aura[GetSpellInfo(70588)] = { School = "Healing", Caster = true, Value = -0.1, Category = "Mortal Strike", NoManual = true }
		--Shroud of Darkness (Zuramat the Obliterator)
		Aura[GetSpellInfo(54525)] = { School = "Healing", Caster = true, Value = -0.2, Apps = 1, Category = "Mortal Strike", NoManual = true }
	end
	if playerMelee or playerHybrid then
	--Buffs
	--Player
		--+4% physical damage
			--Savage Combat
			Aura[GetSpellInfo(58683)] = { School = "Physical", Melee = true, Value = 0.02, Ranks = 2, Category = "+4% Physical", ID = 58683 }
			--Blood Frenzy
			Aura[GetSpellInfo(30070)] = { School = "Physical", Melee = true, Value = 0.02, Ranks = 2, Category = "+4% Physical", ID = 30070 }
			--Acid Spit
			Aura[GetSpellInfo(55749)] = { School = "Physical", Melee = true, Value = 0.04, Category = "+4% Physical", ID = 55749 }
		--+30% bleed damage
			--Trauma
			--Aura[GetSpellInfo(46856)] = { School = "Physical", Melee = true, Value = 0.15, Ranks = 2, ModType = "bleedBonus", Category = "+30% bleed", Manual = GetSpellInfo(33917), ID = 33917 }
			--Mangle (Bear)
			Aura[GetSpellInfo(33878)] = { School = "Physical", Melee = true, Value = 0.3, ModType = "bleedBonus", Category = "+30% bleed", Manual = GetSpellInfo(33917), ID = 33917 }
			--Mangle (Cat)
			Aura[GetSpellInfo(33876)] = Aura[GetSpellInfo(33878)]
			--Hemorrhage
			Aura[GetSpellInfo(16511)] = { School = "Physical", Melee = true, Value = 0.3, ModType = "bleedBonus", Category = "+30% bleed", ID = 16511 }
			--Stampede
			Aura[GetSpellInfo(57386)] = { School = "Physical", Melee = true, Value = 0.3, ModType = "bleedBonus", Category = "+30% bleed", ID = 57386, NoManual = true }
	--Special
		--Armor Disruption
		--Aura[GetSpellInfo(36482)] = { School = "Physical", Melee = true, Value = 0.05, Apps = 5, NoManual = true }
	--Debuffs
	--Player
		--Sunder Armor
		Aura[GetSpellInfo(7386)] = { School = "Physical", Melee = true, Apps = 5, Value = 0.04, ModType = "armorM", Category = "-20% Armor", Manual = GetSpellInfo(7386), ID = 7386 }
		--Shattering Throw
		Aura[GetSpellInfo(64382)] = { School = "Physical", Melee = true, Value = 0.2, ModType = "armorM", Category = "-20% Armor", Manual = GetSpellInfo(7386), ID = 7386 }
		--Expose Armor
		Aura[GetSpellInfo(8647)] = { School = "Physical", Melee = true, Value = 0.12, ModType = "armorM", Category = "-12% Armor", ID = 8647 }		
		--Faerie Fire
		Aura[GetSpellInfo(770)] = { School = "Physical", Melee = true, Apps = 3, Value = 0.04, ModType = "armorM", Category = "-12% Armor", ID = 770 }
		--Faerie Fire (Feral)
		Aura[GetSpellInfo(16857)] = { School = "Physical", Melee = true, Apps = 3, Value = 0.04, ModType = "armorM", Category = "-12% Armor", Manual = GetSpellInfo(770), ID = 770 }
	--NPC
		--Holyform
		Aura[GetSpellInfo(46565)] = { School = "Physical", Melee = true, Value = -0.2, NoManual = true }
	end

	local Consumables = DrDamage.Consumables
	if (playerCaster or playerHybrid or playerHealer) and not DK then
		--Food
		Consumables[L["+46 Spell Power Food"]] = { School = "All", Mods = { ["spellDmg"] = 46, }, Category = "Food", Alt = GetSpellInfo(57327) }
		--Spellpower Elixir
		Consumables[GetSpellInfo(33721)] = { School = "All", Mods = { ["spellDmg"] = 58 }, Category = "Battle Elixir", ID = 33721 }		
		--Flask of the Frost Wyrm
		Consumables[GetSpellInfo(53755)] = { School = "All", Mods = { ["spellDmg"] = 125 }, Category = "Battle Elixir", Category2 = "Guardian Elixir", ID = 53755 }
		--Flask of Pure Mojo (TODO: Spirit 90)
		--Consumables[GetSpellInfo(54212)] = { School = "All", Caster = true, Mods = { ["manaRegen"] = 7.6 }, Category = "Battle Elixir", Category2 = "Guardian Elixir", ID = 54212 }
		--Elixir of Mighty Mageblood (TODO: Spirit 60)
		--Consumables[GetSpellInfo(56519)] = { School = "All", Caster = true, Mods = { ["manaRegen"] = 4.8 }, Category = "Guardian Elixir", Alt = GetSpellInfo(53764), ID = 53764 }
	end
	if playerMelee or playerHybrid then
		--Food
		Consumables[L["+80 AP Food"]] = { Mods = { ["AP"] = 80 }, Category = "Food", Alt = GetSpellInfo(57079) }	
		--Elixir of Wrath
		Consumables[GetSpellInfo(53746)] = { Mods = { ["AP"] = 90 }, Category = "Battle Elixir", ID = 53746 }	
		--Flask of Endless Rage
		Consumables[GetSpellInfo(53760)] = { Mods = { ["AP"] = 180 }, Category = "Battle Elixir", Category2 = "Guardian Elixir", ID = 53760 }
		--Elixir of Demonslaying
		Consumables[GetSpellInfo(11406)] = { Mods = { ["AP"] = 105 }, Category = "Battle Elixir", ID = 11406 }
		--Elixir of Armor Piercing
		--Consumables[GetSpellInfo(60365)] = 						{ Melee = true, Mods = { ["armorPen"] = function(v) return v + DrDamage:GetRating("ArmorPenetration", 45, true)/100 end }, Alt = GetSpellInfo(60345), Category = "Battle Elixir", ID = 60345 }
		--Consumables[L["+40 Armor Penetration Rating Food"]] = 	{ Melee = true, Mods = { ["armorPen"] = function(v) return v + DrDamage:GetRating("ArmorPenetration", 40, true)/100 end }, Alt = GetSpellInfo(33263), Category = "Food" }
		--Elixir of Expertise
		Consumables[GetSpellInfo(60357)] = 						{ Melee = true, Mods = { ["expertise"] = function(v) return v + DrDamage:GetRating("Expertise", 45, true) end }, Alt = GetSpellInfo(60344), Category = "Battle Elixir", ID = 60344 }
		Consumables[L["+40 Expertise Rating Food"]] = 			{ Melee = true, Mods = { ["expertise"] = function(v) return v + DrDamage:GetRating("Expertise", 40, true) end }, Alt = GetSpellInfo(33263), Category = "Food" }
	end
--CUSTOM
	--Elixir of Deadly Strikes
	Consumables[GetSpellInfo(60355)] = 	{ School = "All", Alt = GetSpellInfo(60341), Category = "Battle Elixir", ID = 60341, 
		Mods = {
			function(calculation, baseSpell)
				if not baseSpell.NoManualRatings then
					local value = DrDamage:GetRating("Crit", 45, true)
					calculation.spellCrit = calculation.spellCrit + value
					calculation.meleeCrit = calculation.meleeCrit + value
				end
			end
		}
	}
	--Food
	Consumables[L["+40 Critical Strike Rating Food"]] = { School = "All", Alt = GetSpellInfo(33263), Category = "Food",
		Mods = {
			function(calculation, baseSpell)
				if not baseSpell.NoManualRatings then
					local value = DrDamage:GetRating("Crit", 40, true)
					calculation.spellCrit = calculation.spellCrit + value
					calculation.meleeCrit = calculation.meleeCrit + value
				end
			end
		}
	}
	--Elixir of Accuracy
	Consumables[GetSpellInfo(60354)] = { Alt = GetSpellInfo(60340), Category = "Battle Elixir", ID = 60340,
		Mods = {
			function(calculation, baseSpell)
				if not baseSpell.NoManualRatings then
					calculation.spellHit = calculation.spellHit + DrDamage:GetRating("Hit", 45, true)
					calculation.meleeHit = calculation.meleeHit + DrDamage:GetRating("MeleeHit", 45, true)
				end
			end
		},
	}
	--Hit Rating Food
	Consumables[L["+40 Hit Rating Food"]] = { Alt = GetSpellInfo(33263), Category = "Food",
		Mods = {
			function(calculation, baseSpell)
				if not baseSpell.NoManualRatings then
					calculation.spellHit = calculation.spellHit + DrDamage:GetRating("Hit", 40, true)
					calculation.meleeHit = calculation.meleeHit + DrDamage:GetRating("MeleeHit", 40, true)
				end
			end
		},
	}
	--Elixir of Lightning Speed
	Consumables[GetSpellInfo(60366)] = { School = "All", Alt = GetSpellInfo(60346), Category = "Battle Elixir", ID = 60346,
		Mods = {
			function(calculation, baseSpell)
				if not baseSpell.NoManualRatings then
					local rating = (baseSpell.Melee or baseSpell.MeleeHaste) and "MeleeHaste" or "Haste"
					local base = DrDamage:GetRating(rating, calculation.hasteRating, true)/100
					calculation.haste = (calculation.haste / (1 + base)) * (1 + base + DrDamage:GetRating(rating, 45, true)/100)
				end
			end
		},
	}
	--Haste Rating Food
	Consumables[L["+40 Haste Rating Food"]] = { School = "All", Alt = GetSpellInfo(33263), Category = "Food",
		Mods = {
			function(calculation, baseSpell)
				if not baseSpell.NoManualRatings then
					local rating = (baseSpell.Melee or baseSpell.MeleeHaste) and "MeleeHaste" or "Haste"
					local base = DrDamage:GetRating(rating, calculation.hasteRating, true)/100
					calculation.haste = (calculation.haste / (1 + base)) * (1 + base + DrDamage:GetRating(rating, 40, true)/100)
				end
			end
		},

	}	
end

DrD_LoadAuras()
DrD_LoadAuras = nil