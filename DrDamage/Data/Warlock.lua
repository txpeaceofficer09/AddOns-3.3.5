if select(2, UnitClass("player")) ~= "WARLOCK" then return end
local PetSpellInfo = GetSpellInfo
local GetSpellInfo = DrDamage.SafeGetSpellInfo
local UnitHealth = UnitHealth
local UnitHealthMax = UnitHealthMax
local UnitBuff = UnitBuff
local UnitDebuff = UnitDebuff
local UnitExists = UnitExists
local UnitIsFriend = UnitIsFriend
local UnitPower = UnitPower
local UnitPowerMax = UnitPowerMax
local UnitIsUnit = UnitIsUnit
local math_min = math.min
local select = select
local GetPetSpellBonusDamage = GetPetSpellBonusDamage
local GetSpellCritChanceFromIntellect = GetSpellCritChanceFromIntellect
local GetPrimaryTalentTree = GetPrimaryTalentTree
local GetMastery = GetMastery

function DrDamage:PlayerData()
	--Health updates
	self.PlayerHealth = { [1] = 0.251, [0.251] = GetSpellInfo(689) }
	self.TargetHealth = { [1] = 0.251, }
	--General
	--Drain Mana
	self.ClassSpecials[GetSpellInfo(5138)] = function()
		local value = not UnitIsFriend("player","target") and math_min(UnitPower("target",0), math_min(0.18 * UnitPowerMax("player",0), 0.09 * UnitPowerMax("target",0)))
		if value and value > 0 then
			return value, false, true
		else
			return "", false, true
		end
	end
--GENERAL
	self.Calculation["WARLOCK"] = function( calculation, ActiveAuras, Talents, spell, baseSpell )
		if calculation.group ~= "Pet" then
			if Talents["Death's Embrace"] then
				if UnitHealth("target") ~=0 and (UnitHealth("target") / UnitHealthMax("target")) <= 0.25 then
					calculation.dmgM = calculation.dmgM * ( 1 + 0.04 * Talents["Death's Embrace"] )
				end
			end
			if ActiveAuras["Metamorphosis"] == 0 then
				calculation.dmgM = calculation.dmgM * 1.2
			end
		--else
		--	if ActiveAuras["Metamorphosis"] and ActiveAuras["Metamorphosis"] > 0 then
		--		calculation.dmgM = calculation.dmgM / 1.2
		--	end
		end
		local spec = GetPrimaryTalentTree()
		local mastery = GetMastery()
		if spec == 1 then
			if calculation.school == "Shadow" then
				calculation.dmgM = calculation.dmgM * 1.25
				calculation.dmgM_dot = calculation.dmgM_dot * (1.13 + mastery * 0.0163)
			end
		elseif spec == 2 then
			if calculation.school == "Shadow" or calculation.school == "Fire" then
				calculation.dmgM = calculation.dmgM * 1.15
				if calculation.group == "Pet" or (ActiveAuras["Metamorphosis"] == 0) then
					calculation.dmgM = calculation.dmgM * (1.12 + mastery * 0.015)
				end
			end		
		elseif spec == 3 then
			if calculation.school == "Fire" then
				calculation.dmgM = calculation.dmgM * 1.25
				calculation.dmgM = calculation.dmgM * (1.1 + mastery * 0.0125) 
			end		
		end
	end
--TALENTS
	--[[
	self.Calculation["Custom Emberstorm"] = function( calculation, talentValue )
		local baseValue = self.BaseTalents["Emberstorm"]
		if baseValue ~= talentValue then
			calculation.castTime = calculation.castTime + (baseValue - talentValue) * 0.05
		end
	end
	--]]
--ABILITIES
	self.Calculation["Life Tap"] = function( calculation )
		local amount = UnitHealthMax("player") * 0.15 * 1.20
		calculation.minDam = amount
		calculation.maxDam = amount
	end
	self.Calculation["Drain Life"] = function( calculation, ActiveAuras, Talents )
		if ActiveAuras["Soul Siphon"] and Talents["Soul Siphon"] then
			calculation.dmgM = calculation.dmgM * (1 + math_min(3, ActiveAuras["Soul Siphon"]) * Talents["Soul Siphon"] * 0.03)
		end
		--[[
		if Talents["Death's Embrace"] then
			if (UnitHealth("player") / UnitHealthMax("player")) <= 0.25 then
				calculation.minDam = calculation.minDam +
				calculation.maxDam = calculation.maxDam +
			end
		end
		--]]
	end
	self.Calculation["Drain Soul"] = function ( calculation, ActiveAuras, Talents, spell )
		if ActiveAuras["Soul Siphon"] and Talents["Soul Siphon"] then
			calculation.dmgM = calculation.dmgM * (1 + math_min(3, ActiveAuras["Soul Siphon"]) * Talents["Soul Siphon"] * 0.03)
		end
		if UnitHealth("target") ~= 0 and (UnitHealth("target") / UnitHealthMax("target")) <= 0.25 then
			calculation.minDam = calculation.minDam * 4
			calculation.maxDam = calculation.maxDam * 4
		end
	end
	self.Calculation["Incinerate"] = function( calculation, ActiveAuras, Talents, spell )
		--Glyph of Incinerate (4.0)
		if self:HasGlyph(56242) then
			calculation.dmgM_Add = calculation.dmgM_Add + 0.05
		end
		if ActiveAuras["Immolate"] then
			calculation.minDam = 1.25 * calculation.minDam
			calculation.maxDam = 1.25 * calculation.maxDam
			calculation.dmgM = calculation.dmgM * (1 + (Talents["Fire and Brimstone"] or 0))
		end
		if ActiveAuras["Molten Core"] and Talents["Molten Core"] then
			calculation.dmgM = calculation.dmgM * (1 + 0.06 * Talents["Molten Core"])
			--TODO: CATA verify
			--calculation.castTime = calculation.castTime * 0.7
		end
		if self:GetSetAmount( "T8" ) >= 4 then
			calculation.critPerc = calculation.critPerc + 5
		end
		if self:GetSetAmount( "T10" ) >= 2 then
			calculation.critPerc = calculation.critPerc + 5
		end
	end
	self.Calculation["Soul Fire"] = function( calculation, ActiveAuras, Talents, spell )
		if self:GetSetAmount( "T10" ) >= 2 then
			calculation.critPerc = calculation.critPerc + 5
		end		
	end
	self.Calculation["Chaos Bolt"] = function( calculation, ActiveAuras, Talents )
		if ActiveAuras["Immolate"] and Talents["Fire and Brimstone"] then
			calculation.dmgM = calculation.dmgM * (1 + Talents["Fire and Brimstone"])
		end
		--Glyph of Chaos Bolt (4.0)
		if self:HasGlyph(63304) then
			calculation.cooldown = calculation.cooldown - 2
		end
	end
	self.Calculation["Immolate"] = function( calculation )
		calculation.hybridCanCrit = true
		--Glyph of Immolate (4.0)
		if self:HasGlyph(56228) then
			calculation.dmgM_dot_Add = calculation.dmgM_dot_Add + 0.1
		end
		if self:GetSetAmount( "T8" ) >= 2 then
			calculation.dmgM_Add = calculation.dmgM_Add + 0.1
		end
		if self:GetSetAmount( "T9" ) >= 4 then
			calculation.dmgM_Add = calculation.dmgM_Add + 0.1
		end
	end
	self.Calculation["Bane of Agony"] = function( calculation )
		--Glyph of Bane of Agony (4.0)
		if self:HasGlyph(56241) then
			calculation.eDuration = calculation.eDuration + 4
			--Total damage goes from 100% -> 133.2%. 28/24 increase is handled in the core, but the glyph gives high-end ticks so it gain more base damage.
			calculation.bDmgM = calculation.bDmgM * (133.2/(100*(28/24)))
		end
	end
	self.Calculation["Searing Pain"] = function( calculation, _, Talents )
		if Talents["Improved Searing Pain"] and UnitHealth("target") ~=0 and (UnitHealth("target") / UnitHealthMax("target")) <= 0.25 then
				calculation.critPerc = calculation.critPerc + Talents["Improved Searing Pain"]
		end
	end
	self.Calculation["Corruption"] = function( calculation )
		if self:GetSetAmount( "T9" ) >= 4 then
			calculation.dmgM_Add = calculation.dmgM_Add + 0.1
		end
		if self:GetSetAmount( "T10" ) >= 2 then
			calculation.critPerc = calculation.critPerc + 5
		end
	end
	local Conflagrate = GetSpellInfo(17962)
	local Immolate = GetSpellInfo(348)
	local Shadowflame = GetSpellInfo(47897)
	self.Calculation["Conflagrate"] = function( calculation, ActiveAuras, Talents, spell )
		calculation.hybridCanCrit = true
		calculation.eDuration = 6
		calculation.sTicks = 2
		
		--Glyph of Conflagrate (4.0)
		if self:HasGlyph(63304) then
			calculation.cooldown = calculation.cooldown - 2
		end

		if ActiveAuras["Immolate"] or not ActiveAuras["Shadowflame"] then
			if self:GetSetAmount( "T8" ) >= 2 then
				--Set bonus stacks additively with firestone
				calculation.dmgM_dd_Add = calculation.dmgM_dd_Add + 0.14 - (calculation.dmgM_dd - 1) * 0.14
			end
			if self:GetSetAmount( "T9" ) >= 4 then
				--Additive - 3.3.3. Works as expected with firestone (multiplicative).
				calculation.dmgM_Add = calculation.dmgM_Add + 0.1
			end
			--Glyph of Immolate (4.0)
			if self:HasGlyph(56228) then
				calculation.dmgM_Add = calculation.dmgM_Add + 0.1
			end
			
			--Spellstone doesn't apply to dd or dot part of Conflagrate
			calculation.dmgM_Add = calculation.dmgM_Add + (Talents["Improved Immolate"] or 0)
			calculation.spellDmgM = 0.6
			calculation.spellDmgM_dot = 0.4
			calculation.minDam = 0.6 * self.spellInfo[Immolate][1].hybridDotDmg
			calculation.maxDam = calculation.minDam
			calculation.hybridDotDmg = 0.4 * self.spellInfo[Immolate][1].hybridDotDmg
			calculation.tooltipName = Conflagrate
			calculation.tooltipName2 = Immolate
		elseif ActiveAuras["Shadowflame"] then
			--This applies also to shadowflame conflagrate for some reason. T9 with a similar bonus doesn't apply.
			if self:GetSetAmount( "T8" ) >= 2 then
				--Set bonus stacks additively with firestone
				calculation.dmgM_dd_Add = calculation.dmgM_dd_Add + 0.10 - (calculation.dmgM_dd - 1) * 0.10
			end
			calculation.spellDmgM = 0.6 * 8/30
			calculation.spellDmgM_dot = 0.4 * 8/30
			calculation.minDam = 0.6 * self.spellInfo[Shadowflame]["Secondary"][1].hybridDotDmg
			calculation.maxDam = calculation.minDam
			calculation.hybridDotDmg = 0.4 * self.spellInfo[Shadowflame]["Secondary"][1].hybridDotDmg
			calculation.tooltipName = Conflagrate
			calculation.tooltipName2 = Shadowflame
		end
	end
	self.Calculation["Unstable Affliction"] = function( calculation )
		if self:GetSetAmount( "T8" ) >= 2 then
			calculation.dmgM_Add = calculation.dmgM_Add + 0.2
		end
		if self:GetSetAmount( "T9" ) >= 4 then
			calculation.dmgM_Add = calculation.dmgM_Add + 0.1
		end
	end
	self.Calculation["Shadow Bolt"] = function( calculation )
		if self:GetSetAmount( "T8" ) >= 4 then
			calculation.critPerc = calculation.critPerc + 5
		end
		if self:GetSetAmount( "T10" ) >= 2 then
			calculation.critPerc = calculation.critPerc + 5
		end
	end
	self.Calculation["Immolation Aura"] = function( calculation, ActiveAuras )
		if not ActiveAuras["Metamorphosis"] then
			calculation.dmgM = calculation.dmgM * 1.2
		end
	end
	self.Calculation["Shadow Cleave"] = function( calculation, ActiveAuras )
		if not ActiveAuras["Metamorphosis"] then
			calculation.dmgM = calculation.dmgM * 1.2
		end
	end
	self.Calculation["Firebolt"] = function( calculation, ActiveAuras, Talents, spell )
		--Benefits from Master Demonologist. Doesn't benefit from Emberstorm, Malediction or self-buff part of Demonic Pact.
		--PTR:
		calculation.spellDmg = GetPetSpellBonusDamage and GetPetSpellBonusDamage() or calculation.spellDmg * 0.15
		calculation.critPerc = GetSpellCritChanceFromIntellect("pet") + calculation.spellCrit
		--calculation.manaRegen = GetUnitManaRegenRateFromSpirit("pet")
		--calculation.playerMana = UnitPower("pet",0)
		calculation.castTime = 2.5 - (Talents["Dark Arts"] or 0)
		calculation.haste = 1
		--Glyph of Imp (4.0)
		calculation.dmgM = calculation.dmgM * (1 + (self:HasGlyph(56248) and 0.2 or 0))
		if self:GetSetAmount( "T9" ) >= 2 then
			calculation.critPerc = calculation.critPerc + 10
		end
	end
	local shadowbite = {
		--Immolate, Corruption, Bane of Agony
		[GetSpellInfo(348)] = true, [GetSpellInfo(172)] = true, [GetSpellInfo(980)] = true, 
		--Unstable Affliction, Bane of Doom, Drain Soul
		[GetSpellInfo(30108)] = true, [GetSpellInfo(603)] = true, [GetSpellInfo(1120)] = true,
		--Drain Life, Seed of Corruption, 
		[GetSpellInfo(689)] = true, [GetSpellInfo(27243)] = true,
		--Also benefits from: Shadowflame
		--Doesn't benefit from: Hellfire, Rain of Fire
	}
	self.Calculation["Shadow Bite"] = function( calculation, ActiveAuras, Talents, spell )
		--Doesn't benefit from Malediction, Death's Embrace, Shadow Embrace or Haunt.
		--PTR:
		calculation.spellDmg = GetPetSpellBonusDamage and GetPetSpellBonusDamage() or calculation.spellDmg * 0.15
		calculation.critPerc = GetSpellCritChanceFromIntellect("pet") + calculation.spellCrit
		calculation.castTime = 1.5
		calculation.haste = 1
		if self:GetSetAmount( "T9" ) >= 2 then
			calculation.critPerc = calculation.critPerc + 10
		end
		if UnitExists("pettarget") then
			local dots = 0
			for i = 1, 40 do
				local name, _, _, _, _, _, _, caster = UnitDebuff("pettarget",i)
				if name then
					if shadowbite[name] and caster and UnitIsUnit("player", caster) then
						dots = dots + 1
					end
				else break end
			end
			calculation.dmgM = calculation.dmgM * (1 + dots * 0.15)
		end
	end
	self.Calculation["Lash of Pain"] = function( calculation, ActiveAuras, Talents, spell )
		--Benefits from Master Demonologist. Doesn't benefit from Shadow Mastery, Malediction, Death's Embrace, Haunt.
		--PTR:
		calculation.spellDmg = GetPetSpellBonusDamage and GetPetSpellBonusDamage() or calculation.spellDmg * 0.15
		calculation.critPerc = GetSpellCritChanceFromIntellect("pet") + calculation.spellCrit
		calculation.castTime = 1.5
		calculation.haste = 1
		--Glyph of Lash of Pain (4.0)
		calculation.dmgM = calculation.dmgM * (1 + (self:HasGlyph(70947) and 0.25 or 0))
		if self:GetSetAmount( "T9" ) >= 2 then
			calculation.critPerc = calculation.critPerc + 10
		end
	end		
--SETS
	self.SetBonuses["T8"] = { 46135, 46136, 46137, 46139, 46140, 45417, 45419, 45420, 45421, 45422 }
	self.SetBonuses["T9"] = { 47798, 47799, 47800, 47801, 47802, 47783, 47784, 47785, 47786, 47787, 47782, 47778, 47780, 47779, 47781, 47788, 47789, 47790, 47791, 47792, 47803, 47804, 47805, 47806, 47807, 47797, 47796, 47795, 47794, 47793 }
	self.SetBonuses["T10"] = { 50240, 50241, 50242, 50243, 50244, 51230, 51231, 51232, 51233, 51234, 51205, 51206, 51207, 51208, 51209, }
--AURA
--Player
	--Demonic Soul (T7 proc)
	self.PlayerAura[GetSpellInfo(61595)] = { Spells = { 686, 29722 }, ModType = "critPerc", Value = 10, NoManual = true }
	--Eradication (Affliction proc)
	self.PlayerAura[GetSpellInfo(47195)] = { Update = true }
	--Decimation (Demonology proc - Soulfire)
	self.PlayerAura[GetSpellInfo(63156)] = { Update = true, Spells = 6353 }
	--Molten Core (Demonology proc - Incinerate)
	self.PlayerAura[GetSpellInfo(47383)] = { Spells = 29722, ActiveAura = "Molten Core", ID = 47383 }
	--Improved Soul Fire (Destruction proc)
	self.PlayerAura[GetSpellInfo(85113)] = { Update = true }
	--Backlash (Destruction proc - Shadow Bolt, Incinerate)
	self.PlayerAura[GetSpellInfo(34935)] = { Update = true, Spells = { 29722, 686 } }	
	--Empowered Imp (Destruction proc - Soulfire)
	self.PlayerAura[GetSpellInfo(47283)] = { Update = true, Spells = 6353 }
	--Metamorphosis
	self.PlayerAura[GetSpellInfo(59672)] = { ActiveAura = "Metamorphosis", Index = true, ID = 59672 }
--Target
	--Immolate
	self.TargetAura[GetSpellInfo(348)] = { ActiveAura = "Immolate", Ranks = 11, Spells = { 29722, 17962, 50796 }, SelfCast = true, ID = 348 }
	--Shadowflame
	self.TargetAura[GetSpellInfo(47897)] = { ActiveAura = "Shadowflame", Ranks = 2, Spells = 17962, SelfCast = true, ID = 47897 }
--Soul Siphon
	--Corruption
	self.TargetAura[GetSpellInfo(172)] = 	{ ActiveAura = "Soul Siphon", Spells = { 689, 1120 }, SelfCast = true, NoManual = true }
	--Bane of Agony
	self.TargetAura[GetSpellInfo(980)] = 	self.TargetAura[GetSpellInfo(172)]
	--Bane of Doom
	self.TargetAura[GetSpellInfo(603)] = 	self.TargetAura[GetSpellInfo(172)]
	--Curse of Weakness
	self.TargetAura[GetSpellInfo(702)] = 	self.TargetAura[GetSpellInfo(172)]
	--Curse of Tongues
	self.TargetAura[GetSpellInfo(1714)] = 	self.TargetAura[GetSpellInfo(172)]
	--Curse of Exhaustion
	self.TargetAura[GetSpellInfo(18223)] = 	self.TargetAura[GetSpellInfo(172)]
	--Unstable Affliction
	self.TargetAura[GetSpellInfo(30108)] = 	self.TargetAura[GetSpellInfo(172)]
	--Seed of Corruption
	self.TargetAura[GetSpellInfo(27243)] = 	self.TargetAura[GetSpellInfo(172)]
	--Fear
	self.TargetAura[GetSpellInfo(5782)] = 	self.TargetAura[GetSpellInfo(172)]
	--Howl of Terror
	self.TargetAura[GetSpellInfo(5484)] = 	self.TargetAura[GetSpellInfo(172)]
--Custom
	--Curse of the Elements (debuff added in Aura.lua)
	self.TargetAura[GetSpellInfo(1490)].ActiveAura = "Soul Siphon"
	--Demon Armor
	self.PlayerAura[GetSpellInfo(687)] = { School = "Leech", ID = 687, ModType =
		function( calculation, _, Talents )
				calculation.leechBonus = (calculation.leechBonus or 0) * (1.2 + (Talents["Demonic Aegis"] or 0))
		end
	}
	--Backdraft
	self.PlayerAura[GetSpellInfo(47258)] = { NoManual = true, ModType =
		function( calculation, _, Talents )
			if Talents["Backdraft"] then
				calculation.haste = calculation.haste * (1 + Talents["Backdraft"])
			end
		end
	}
	--Haunt
	self.TargetAura[GetSpellInfo(48181)] = { School = "Shadow", SelfCast = true, ID = 48181, Not = { "Pet", "Bane of Doom" }, ModType =
		function( calculation, ActiveAuras, Talents )
			--Glyph of Haunt (4.0)
			if calculation.spellName == "Drain Life" or calculation.spellName == "Drain Soul" then
				calculation.dmgM = calculation.dmgM * (1.2 + (self:HasGlyph(63302) and 0.03 or 0))
			else
				calculation.dmgM_dot = calculation.dmgM_dot * (1.2 + (self:HasGlyph(63302) and 0.03 or 0))
			end
			if Talents["Soul Siphon"] then
				ActiveAuras["Soul Siphon"] = (ActiveAuras["Soul Siphon"] or 0) + 1
			end
		end
	}
	--Shadow Embrace
	self.TargetAura[GetSpellInfo(32386)] = { School = "Shadow", SelfCast = true, ID = 32386, Apps = 3, Not = { "Pet", "Bane of Doom" }, ModType =
		function( calculation, ActiveAuras, Talents, _, apps )
			if Talents["Shadow Embrace"] then
				if calculation.spellName == "Drain Life" or calculation.spellName == "Drain Soul" then
					calculation.dmgM = calculation.dmgM * (1 + Talents["Shadow Embrace"] * apps)
				else
					calculation.dmgM_dot = calculation.dmgM_dot * (1 + Talents["Shadow Embrace"] * apps)
				end
			end
			if Talents["Soul Siphon"] then
				ActiveAuras["Soul Siphon"] = (ActiveAuras["Soul Siphon"] or 0) + 1
			end
		end
	}

	self.spellInfo = {
		[GetSpellInfo(172)] = {
					["Name"] = "Corruption",
					[0] = { School = { "Shadow", "Affliction", }, SPBonus = 1.2, castTime = 2, eDot = true, eDuration = 18, sTicks = 3 },
					[1] = { 882, 882, },
		},
		[GetSpellInfo(686)] = {
					["Name"] = "Shadow Bolt",
					[0] = { School = { "Shadow", "Destruction" }, castTime = 3, canCrit = true },
					[1] = { 564, 628 },
		},
		[GetSpellInfo(1454)] = {
					["Name"] = "Life Tap",
					[0] = { School = { "Shadow", "Utility", }, SPBonus = 0, NoGlobalMod = true, NoTargetAura = true, NoSchoolTalents = true, NoDPS = true, NoTooltip = true, Unresistable = true },
					[1] = { 0, 0 },
		},
		[GetSpellInfo(6229)] = {
					["Name"] = "Shadow Ward",
					[0] = { School = { "Shadow", "Absorb" }, SPBonus = 0.807, NoGlobalMod = true, NoTargetAura = true, NoSchoolTalents = true, NoDPS = true, NoNext = true, NoDPM = true, NoDoom = true, Unresistable = true, },
					[1] = { 3551, 3551 },
		},
		[GetSpellInfo(980)] = {
					["Name"] = "Bane of Agony",
					[0] = { School = { "Shadow", "Affliction", }, SPBonus = 1.20, eDot = true, eDuration = 24, sTicks = 2, },
					[1] = { 1524, 1524, },
		},
		[GetSpellInfo(603)] = {
					["Name"] = "Bane of Doom",
					[0] = { School = { "Shadow", "Affliction", }, SPBonus = 2, eDot = true, eDuration = 60, sHits = 4 },
					[1] = { 1947, 1947, },
		},
		[GetSpellInfo(6789)] = {
					["Name"] = "Death Coil",
					[0] = { School = { "Shadow", "Affliction", "Leech" }, sFactor = 0.5, Cooldown = 120, Leech = 3, NoDoom = true, },
					[1] = { 754, 754, },
		},
		[GetSpellInfo(689)] = {
					["Name"] = "Drain Life",
					[0] = { School = { "Shadow", "Affliction" }, castTime = 5, sHits = 5, sFactor = 0.5, Channeled = true, Drain = true, },
					[1] = { 109, 109, },
		},
		[GetSpellInfo(1120)] = {
					["Name"] = "Drain Soul",
					[0] = { School = { "Shadow", "Affliction", }, castTime = 15, sFactor = 0.5, sTicks = 3, Channeled = true, Drain = true, },
					[1] = { 380, 380, },
		},
		[GetSpellInfo(5676)] = {
					["Name"] = "Searing Pain",
					[0] = { School = { "Fire", "Destruction" }, canCrit = true, },
					[1] = { 283, 335, },
		},
		[GetSpellInfo(6353)] = {
					["Name"] = "Soul Fire",
					[0] = { School = { "Fire", "Destruction" }, SPBonus = 1.15, castTime = 6, canCrit = true, },
					[1] = { 2172, 2722, },
		},
		[GetSpellInfo(17877)] = {
					["Name"] = "Shadowburn",
					[0] = { School = { "Shadow", "Destruction" }, Cooldown = 15, canCrit = true, },
					[1] = { 650, 725, },
		},
		[GetSpellInfo(348)] = {
					["Name"] = "Immolate",
					[0] = { School = { "Fire", "Destruction" }, canCrit = true, castTime = 2, SPBonus = 0.2, eDuration = 15, sTicks = 3, },
					[1] = { 647, 647, hybridDotDmg = 2050, },
		},
		[GetSpellInfo(1949)] = {
					["Name"] = "Hellfire",
					[0] = { School = { "Fire", "Destruction" }, castTime = 15, sHits = 15, sFactor = 1/2, Channeled = true, AoE = true },
					[1] = { 319, 319, },
		},
		[GetSpellInfo(5740)] = {
					["Name"] = "Rain of Fire",
					[0] = { School = { "Fire", "Destruction" }, castTime = 8, canCrit = true, SPBonus = 1.144157, sTicks = 2, Channeled = true, AoE = true },
					[1] = { 613 * 4, 613 * 4, },
		},
		[GetSpellInfo(30108)] = {
					["Name"] = "Unstable Affliction",
					[0] = { School = { "Shadow", "Affliction", }, eDot = true, eDuration = 15, sTicks = 3, },
					[1] = { 1115, 1115, spellLevel = 50, },
		},
		[GetSpellInfo(17962)] = {
					["Name"] = "Conflagrate",
					[0] = { School = { "Fire", "Destruction" }, canCrit = true, Cooldown = 10, },
					[1] = { 0, 0, hybridDotDmg = 0 },
		},
		[GetSpellInfo(27243)] = {
					["Name"] = "Seed of Corruption",
					[0] = { School = { "Shadow", "Affliction", }, castTime = 2, canCrit = true, SPBonus = 0.2129, dotFactor = 1.5, eDuration = 18, sTicks = 3, NoDotAverage = true, DotCap = true, AoE = true },
					[1] = { 568, 658, hybridDotDmg = 1452, },
		},
		[GetSpellInfo(30283)] = { 
					["Name"] = "Shadowfury",
					[0] = { School = { "Shadow", "Destruction" }, canCrit = true, SPBonus = 0.1932, Cooldown = 20, AoE = true },
					[1] = { 688, 818, },
		},
		[GetSpellInfo(29722)] = {
					["Name"] = "Incinerate",
					[0] = { School = { "Fire", "Destruction" }, canCrit = true, castTime = 2.5, },
					[1] = { 510, 592, },
		},
		[GetSpellInfo(47897)] = {
					["Name"] = "Shadowflame",
					[0] = { School = { "Shadow", "Destruction" }, SPBonus = 1.5/3.5 * (1/4), canCrit = true, Cooldown = 15, },
					[1] = { 668, 730, },
			["Secondary"] = {
					["Name"] = "Shadowflame",
					[0] = { School = { "Fire", "Destruction" }, dotFactor = 8/30, eDuration = 8, sTicks = 2, Cooldown = 15 },
					[1] = { 0, 0, hybridDotDmg = 486, },
			},
		},
		[GetSpellInfo(48181)] = {
					["Name"] = "Haunt",
					[0] = { School = { "Shadow", "Affliction" }, SPBonus = 0.429 * 1.25, canCrit = true, castTime = 1.5, Cooldown = 8 },
					[1] = { 709, 709, },
		},
		[GetSpellInfo(50796)] = {
					["Name"] = "Chaos Bolt",
					[0] = { School = { "Fire", "Destruction" }, castTime = 2.5, canCrit = true, Unresistable = true, Cooldown = 12, },
					[1] = { 1311, 1665, },
		},
		[GetSpellInfo(50589)] = {
					["Name"] = "Immolation Aura",
					[0] = { School = "Fire", SPBonus = 2.145, castTime = 15, Channeled = true, AoE = true, sHits = 15, Cooldown = 30, },
					[1] = { 251, 251, },
		},
		--[[
		[GetSpellInfo(50581)] = {
					["Name"] = "Shadow Cleave",
					[0] = { School = "Shadow", SPBonus = 0.214, AoE = 3, Cooldown = 6, canCrit = true, },
					[1] = { 110, 110, spellLevel = 60 },
		},
		--]]
		[GetSpellInfo(3110)] = {
					["Name"] = "Firebolt",
					[0] = { School = { "Fire", "Pet" }, SPBonus = 0.5, canCrit = true, NoGlobalMod = true, NoManaCalc = true, NoNext = true, NoMPS = true, NoDPM = true, NoManualRatings = true, },
					[1] = { 124, 124, },
		},
		[GetSpellInfo(54049)] = {
					["Name"] = "Shadow Bite",
					[0] = { School = { "Shadow", "Pet" }, SPBonus = 0.5, canCrit = true, Cooldown = 6, NoGlobalMod = true, NoManaCalc = true, NoNext = true, NoMPS = true, NoDPM = true, NoManualRatings = true, },
					[1] = { 70, 70, },
		},
		[GetSpellInfo(7814)] = {
					["Name"] = "Lash of Pain",
					[0] = { School = { "Shadow", "Pet" }, SPBonus = 0.5, canCrit = true, Cooldown = 12, NoGlobalMod = true, NoManaCalc = true, NoNext = true, NoMPS = true, NoDPM = true, NoManualRatings = true, },
					[1] = { 208, 208, },
		},	
	}
	self.talentInfo = {
	--AFFLICTION
		--Doom and Gloom
		[GetSpellInfo(18827)] = { 	[1] = { Effect = 4, Spells = { "Bane of Agony", "Bane of Doom" }, ModType = "critPerc" }, },
		--Improved Life Tap
		[GetSpellInfo(18182)] = { 	[1] = { Effect = 0.1, Spells = "Life Tap", }, },		
		--Improved Corruption
		[GetSpellInfo(17810)] = {	[1] = { Effect = 0.04, Spells = "Corruption" }, },
		--Soul Siphon
		[GetSpellInfo(17804)] = { 	[1] = { Effect = 1, Spells = { "Drain Soul", "Drain Life" }, ModType = "Soul Siphon" }, },
		--Shadow Embrace
		[GetSpellInfo(32385)] = {	[1] = { Effect = { 0.03, 0.04, 0.05 }, Spells = "Shadow", ModType = "Shadow Embrace" }, },
		--Death's Embrace
		[GetSpellInfo(47198)] = {	[1] = { Effect = 1, Spells = "Shadow", Not = "Pet", ModType = "Death's Embrace", }, },		
		--Everlasting Affliction
		[GetSpellInfo(47201)] = {	[1] = { Effect = 5, Spells = { "Corruption", "Seed of Corruption", "Unstable Affliction" }, ModType = "critPerc" }, },
		--Pandemic
		[GetSpellInfo(85099)] = {	[1] = { Effect = -0.25, Spells = { "Bane of Agony", "Bane of Doom" }, ModType = "castTime" }, },
	--DEMONOLOGY
		--Dark Arts
		[GetSpellInfo(85284)] = { 	[1] = { Effect = 0.25, Spells = "Firebolt", ModType = "Dark Arts" }, 
									[2] = { Effect = 0.05, Spells = "Shadow Bite", }, },
		--Demonic Aegis
		[GetSpellInfo(30143)] = { 	[1] = { Effect = 0.05, Spells = "Leech", ModType = "Demonic Aegis" }, },		
		--Molten Core
		[GetSpellInfo(47245)] = {	[1] = { Effect = 1, Spells = "Incinerate", ModType = "Molten Core", }, },
		--Cremation
		[GetSpellInfo(85104)] = { 	[1] = { Effect = 0.15, Spells = "Hellfire", }, },		
		--Demonic Pact
		[GetSpellInfo(47236)] = {	[1] = { Effect = 0.02, Spells = "All", Not = "Pet", Multiply = true }, },
	--DESTRUCTION:
		--Shadow and Flame
		[GetSpellInfo(17793)] = {	[1] = { Effect = 0.04, Spells = { "Shadow Bolt", "Incinerate" } }, },
		--Improved Immolate
		[GetSpellInfo(17815)] = { 	[1] = { Effect = 0.1, Spells = "Immolate" },
									[2] = { Effect = 0.1, Spells = "Conflagrate", ModType = "Improved Immolate" }, },
		--Improved Searing Pain
		[GetSpellInfo(17927)] = { 	[1] = { Effect = 20, Spells = "Searing Pain", ModType = "Improved Searing Pain", }, },
		--Backdraft
		[GetSpellInfo(47258)] = { 	[1] = { Effect = 0.1, Spells = { "Shadow Bolt", "Chaos Bolt", "Incinerate" }, ModType = "Backdraft", }, },
		--Burning Embers
		[GetSpellInfo(91986)] = { 	[1] = { Effect = 0.15, Spells = { "Firebolt", "Soulfire" }, ModType = "Burning Embers", }, },
		--Fire and Brimstone
		[GetSpellInfo(47266)] = {	[1] = { Effect = 5, Spells = "Conflagrate", ModType = "critPerc", },
									[2] = { Effect = 0.02, Spells = { "Incinerate", "Chaos Bolt" }, ModType = "Fire and Brimstone" }, },		
		
		--Emberstorm (additive - 3.3.3)
		--[GetSpellInfo(17954)] = {	[1] = { Effect = 0.03, Spells = "Fire", Not = "Firebolt" },
		--							[2] = { Effect = 0.03, Spells = "Fire", ModType = "Emberstorm" },
		--							[3] = { Effect = 1, Spells = "Incinerate", ModType = "Custom Emberstorm" }, Manual = "Emberstorm" },
	}
end