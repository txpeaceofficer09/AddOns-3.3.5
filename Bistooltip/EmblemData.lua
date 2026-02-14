-- ============================================================
-- EmblemData.lua - Emblem vendor item database
-- ============================================================
-- This file contains mappings of items that can be purchased with emblems.
-- For custom servers, add your emblem vendor items here.

-- Initialize the emblem items table
Bistooltip_emblem_items = Bistooltip_emblem_items or {}

-- ============================================================
-- Helper function to register items
-- ============================================================

local function RegisterEmblemItems(currency, items)
    for itemId, cost in pairs(items) do
        Bistooltip_emblem_items[itemId] = {
            currency = currency,
            cost = cost,
        }
        
        -- Also register in Constants if available
        if BistooltipConstants and BistooltipConstants.RegisterEmblemItem then
            BistooltipConstants.RegisterEmblemItem(itemId, currency, cost)
        end
    end
end

-- ============================================================
-- Emblem of Ascension Items (Custom Server)
-- Format: [itemId] = cost
-- 
-- To find item IDs:
-- 1. Use /script print(GetItemInfo("item:ITEMID"))
-- 2. Or check wowhead.com URL: wowhead.com/wotlk/item=ITEMID
-- 
-- Example: Sanctified T10 gear typically costs 60-95 emblems
-- ============================================================

local FROST_ITEMS = {
    -- ==================
    -- Tier 10 Sanctified (264 -> 277)
    -- These are example items - uncomment and adjust for your server
    -- ==================
    
    -- Death Knight
    [51312] = 95,  -- Sanctified Scourgelord Helmet
    [51314] = 60,  -- Sanctified Scourgelord Shoulderplates
    [51310] = 95,  -- Sanctified Scourgelord Battleplate
    [51313] = 60,  -- Sanctified Scourgelord Gauntlets
    [51311] = 95,  -- Sanctified Scourgelord Legplates
    
    -- Druid
    [51147] = 95,  -- Sanctified Lasherweave Helmet
    [51149] = 60,  -- Sanctified Lasherweave Pauldrons
    [51145] = 95,  -- Sanctified Lasherweave Robes
    [51148] = 60,  -- Sanctified Lasherweave Gloves
    [51146] = 95,  -- Sanctified Lasherweave Legplates
    
    -- Hunter
    [51286] = 95,  -- Sanctified Ahn'Kahar Blood Hunter's Headpiece
    [51288] = 60,  -- Sanctified Ahn'Kahar Blood Hunter's Spaulders
    [51289] = 95,  -- Sanctified Ahn'Kahar Blood Hunter's Tunic
    [51287] = 60,  -- Sanctified Ahn'Kahar Blood Hunter's Handguards
    [51285] = 95,  -- Sanctified Ahn'Kahar Blood Hunter's Legguards
    
    -- Mage
    [51281] = 95,  -- Sanctified Bloodmage Hood
    [51284] = 60,  -- Sanctified Bloodmage Shoulderpads
    [51282] = 95,  -- Sanctified Bloodmage Robe
    [51280] = 60,  -- Sanctified Bloodmage Gloves
    [51283] = 95,  -- Sanctified Bloodmage Leggings
    
    -- Paladin
    [51167] = 95,  -- Sanctified Lightsworn Faceguard (Tank)
    [51161] = 95,  -- Sanctified Lightsworn Headpiece (Holy)
    [51277] = 95,  -- Sanctified Lightsworn Helmet (Ret)
    [51169] = 60,  -- Sanctified Lightsworn Shoulderguards (Tank)
    [51163] = 60,  -- Sanctified Lightsworn Spaulders (Holy)
    [51279] = 60,  -- Sanctified Lightsworn Shoulderplates (Ret)
    
    -- Priest
    [51261] = 95,  -- Sanctified Crimson Acolyte Hood (Shadow)
    [51178] = 95,  -- Sanctified Crimson Acolyte Cowl (Heal)
    [51264] = 60,  -- Sanctified Crimson Acolyte Shoulderpads (Shadow)
    [51181] = 60,  -- Sanctified Crimson Acolyte Mantle (Heal)
    
    -- Rogue
    [51252] = 95,  -- Sanctified Shadowblade Helmet
    [51254] = 60,  -- Sanctified Shadowblade Pauldrons
    [51253] = 95,  -- Sanctified Shadowblade Breastplate
    [51251] = 60,  -- Sanctified Shadowblade Gauntlets
    [51250] = 95,  -- Sanctified Shadowblade Legplates
    
    -- Shaman
    [51242] = 95,  -- Sanctified Frost Witch's Headpiece (Ele)
    [51202] = 95,  -- Sanctified Frost Witch's Faceguard (Enh)
    [51192] = 95,  -- Sanctified Frost Witch's Helm (Resto)
    [51244] = 60,  -- Sanctified Frost Witch's Shoulderpads (Ele)
    [51204] = 60,  -- Sanctified Frost Witch's Shoulderguards (Enh)
    [51194] = 60,  -- Sanctified Frost Witch's Spaulders (Resto)
    
    -- Warlock
    [51232] = 95,  -- Sanctified Dark Coven Hood
    [51234] = 60,  -- Sanctified Dark Coven Shoulderpads
    [51231] = 95,  -- Sanctified Dark Coven Robe
    [51233] = 60,  -- Sanctified Dark Coven Gloves
    [51230] = 95,  -- Sanctified Dark Coven Leggings
    
    -- Warrior
    [51227] = 95,  -- Sanctified Ymirjar Lord's Helmet (DPS)
    [51217] = 95,  -- Sanctified Ymirjar Lord's Greathelm (Tank)
    [51229] = 60,  -- Sanctified Ymirjar Lord's Pauldrons (DPS)
    [51219] = 60,  -- Sanctified Ymirjar Lord's Shoulderplates (Tank)
    
 
    -- Tier 10 (ilvl 251)
    -- Death Knight
    [50096] = 95,  -- Scourgelord Helmet
    [50098] = 60,  -- Scourgelord Shoulderplates
    [50094] = 95,  -- Scourgelord Battleplate
    [50095] = 60,  -- Scourgelord Gauntlets
    [50097] = 95,  -- Scourgelord Legplates
    
    -- Druid
    [50107] = 95,  -- Lasherweave Helmet
    [50109] = 60,  -- Lasherweave Pauldrons
    [50106] = 95,  -- Lasherweave Robes
    [50108] = 60,  -- Lasherweave Gloves
    [50105] = 95,  -- Lasherweave Legplates
    
    -- Mage
    [50276] = 95,  -- Bloodmage Hood
    [50279] = 60,  -- Bloodmage Shoulderpads
    [50277] = 95,  -- Bloodmage Robe
    [50275] = 60,  -- Bloodmage Gloves
    [50278] = 95,  -- Bloodmage Leggings
    
    -- Priest (Shadow)
    [50392] = 95,  -- Crimson Acolyte Hood
    [50396] = 60,  -- Crimson Acolyte Shoulderpads
    [50394] = 95,  -- Crimson Acolyte Robe
    [50391] = 60,  -- Crimson Acolyte Gloves
    [50393] = 95,  -- Crimson Acolyte Pants
    
    -- Rogue
    [50088] = 95,  -- Shadowblade Helmet
    [50090] = 60,  -- Shadowblade Pauldrons
    [50089] = 95,  -- Shadowblade Breastplate
    [50087] = 60,  -- Shadowblade Gauntlets
    [50086] = 95,  -- Shadowblade Legplates
    
    -- Warlock
    [50241] = 95,  -- Dark Coven Hood
    [50244] = 60,  -- Dark Coven Shoulderpads
    [50242] = 95,  -- Dark Coven Robe
    [50240] = 60,  -- Dark Coven Gloves
    [50243] = 95,  -- Dark Coven Leggings
    
    -- Warrior
    [50080] = 95,  -- Ymirjar Lord's Helmet
    [50082] = 60,  -- Ymirjar Lord's Pauldrons
    [50078] = 95,  -- Ymirjar Lord's Battleplate
    [50079] = 60,  -- Ymirjar Lord's Gauntlets
    [50081] = 95,  -- Ymirjar Lord's Legplates


    -- Back
    [50468] = 50,        -- Drape of the Violet Tower
    [50467] = 50,        -- Might of the Ocean Serpent
    [50470] = 50,        -- Recovered Scarlet Onslaught Cape
    [50466] = 50,        -- Sentinel's Winter Cloak
    [50469] = 50,        -- Volde's Cloak of the Night Sky
    -- Hands
    [50980] = 60,        -- Blizzard Keeper's Mitts
    [50982] = 60,        -- Cat Burglar's Grips
    [50977] = 60,        -- Gatecrasher's Gauntlets
    [50976] = 60,        -- Gauntlets of Overexposure
    [50978] = 60,        -- Gauntlets of the Kraken
    [50984] = 60,        -- Gloves of Ambivalence
    [50983] = 60,        -- Gloves of False Gestures
    [50981] = 60,        -- Gloves of the Great Horned Owl
    [50979] = 60,        -- Logsplitters
    -- Waist
    [50989] = 60,        -- Lich Killer's Lanyard
    [50474] = 30,        -- Shrapnel Star
    [50458] = 30,        -- Bizuri's Totem of Shattered Ice
    [50454] = 30,        -- Idol of the Black Willow
    [50456] = 30,        -- Idol of the Crying Moon
    [50457] = 30,        -- Idol of the Lunar Eclipse
    [50460] = 30,        -- Libram of Blinding Light
    [50455] = 30,        -- Libram of Three Truths
    [50461] = 30,        -- Libram of the Eternal Tower
    [50462] = 30,        -- Sigil of the Bone Gryphon
    [50459] = 30,        -- Sigil of the Hanged Man
    [50463] = 30,        -- Totem of the Avalanche
    [50464] = 30,        -- Totem of the Surging Sea
    -- Trinket
    [50356] = 60,        -- Corroded Skeleton Key
    [50355] = 60,        -- Herkuml War Token
    [50357] = 60,        -- Maghia's Misguided Quill
    [50358] = 60,        -- Purified Lunar Dust
    -- Waist
    [50996] = 60,        -- Belt of Omission
    [50994] = 60,        -- Belt of Petrified Ivy
    [50997] = 60,        -- Circle of Ossus
    [50987] = 60,        -- Malevolent Girdle
    [50995] = 60,        -- Vengeful Noose
    [50991] = 60,        -- Verdigris Chain Belt
    [50992] = 60,        -- Waistband of Despair

}

RegisterEmblemItems("Emblem of Frost", FROST_ITEMS)

-- ============================================================
-- Emblem of Triumph Items
-- ============================================================

local TRIUMPH_ITEMS = {

    -- Chest
    [50965] = 50,        -- Castle Breaker's Battleplate
    [50968] = 50,        -- Cataclysmic Chestguard
    [50969] = 50,        -- Chestplate of Unspoken Truths
    [50975] = 50,        -- Ermine Coronation Robes
    [50970] = 50,        -- Longstrider's Vest
    [50971] = 50,        -- Mail of the Geyser
    [50974] = 50,        -- Meteor Chaser's Raiment
    [50972] = 50,        -- Shadow Seeker's Tunic
    [50973] = 50,        -- Vestments of Spruce and Fir
    -- Finger
    [47732] = 35,        -- Band of the Invoker
    [47729] = 35,        -- Bloodshed Band
    [47731] = 35,        -- Clutch of Fortification
    [47730] = 35,        -- Dexterous Brightstone Ring
    [47733] = 35,        -- Heartmender Circle
    [50993] = 35,        -- Band of the Night Raven

    -- Head
    [47688] = 75,        -- Mask of Lethal Intent
    [47691] = 75,        -- Mask of Abundant Growth
    [47692] = 75,        -- Hood of Smoldering Aftermath
    [47695] = 75,        -- Hood of Clouded Sight
    [47682] = 75,        -- Helm of the Restless Watch
    [47678] = 75,        -- Headplate of the Honorbound
    [47687] = 75,        -- Headguard of Inner Warmth
    [47675] = 75,        -- Faceplate of Thunderous Rampage
    [47684] = 75,        -- Coif of the Brooding Dragon
    -- Thrown
    [47660] = 25,        -- Blades of the Sable Cross
    [47659] = 25,        -- Crimson Star
    -- Relic
    [47667] = 19,        -- Totem of Quaking Earth
    [47666] = 25,        -- Totem of Electrifying Wind
    [47665] = 25,        -- Totem of Calming Tides
    [47673] = 25,        -- Sigil of Virulence
    [47672] = 25,        -- Sigil of Insolence
    [47662] = 25,        -- Libram of Veracity
    [47661] = 25,        -- Libram of Valiance
    [47664] = 25,        -- Libram of Defiance
    [47668] = 25,        -- Idol of Mutilation
    [47670] = 25,        -- Idol of Lunar Fury
    [47671] = 25,        -- Idol of Flaring Growth
    -- Shoulder
    [47706] = 45,        -- Shoulders of the Groundbreaker
    [47701] = 45,        -- Shoulderplates of the Cavalier
    [47696] = 45,        -- Shoulderplates of Trembling Rage
    [47699] = 45,        -- Shoulderguards of Enduring Order
    [47705] = 45,        -- Pauldrons of the Devourer
    [47714] = 45,        -- Pauldrons of Catastrophic Emanation
    [47716] = 45,        -- Mantle of Revered Mortality
    [47710] = 45,        -- Epaulets of the Fateful Accord
    [47709] = 45,        -- Duskstalker Pauldrons
    -- Trinket
    [48724] = 50,        -- Talisman of Resurgence
    [48722] = 50,        -- Shard of the Crystal Heart
    [47734] = 50,        -- Mark of Supremacy
    [47735] = 50,        -- Glyph of Indomitability
    [47658] = 25,        -- Brimstone Igniter

}

RegisterEmblemItems("Emblem of Triumph", TRIUMPH_ITEMS)


-- ============================================================
-- Emblem of Conquest Items
-- ============================================================
local CONQUEST_ITEMS = {

-- Head (Token T8)
    [45639] = 58,        -- Crown of the Wayward Protector
    [45633] = 58,        -- Breastplate of the Wayward Protector

    -- Relic
    [45144] = 19,        -- Sigil of Deflection
    [45254] = 19,        -- Sigil of the Vengeful Heart
    [45114] = 19,        -- Steamcaller's Totem
    [45255] = 19,        -- Thunderfall Totem
    [45169] = 19,        -- Totem of the Dancing Flame
    [45509] = 19,        -- Idol of the Corruptor
    [45270] = 19,        -- Idol of the Crying Wind
    [46138] = 19,        -- Idol of the Flourishing Life
    [45436] = 19,        -- Libram of the Resolute
    [45510] = 19,        -- Libram of Discord
    [45145] = 19,        -- Libram of the Sacred Shield

    -- Hands
    [45833] = 28,        -- Bladebreaker Gauntlets
    [45834] = 28,        -- Gauntlets of the Royal Watch
    [45835] = 28,        -- Gauntlets of Serene Blessing
    [45836] = 28,        -- Gloves of Unerring Aim
    [45837] = 28,        -- Gloves of Augury
    [45838] = 28,        -- Gloves of the Blind Stalker
    [45839] = 28,        -- Grips of the Secret Grove
    [45840] = 28,        -- Touch of the Occult
    -- Legs
    [45841] = 39,        -- Legplates of the Violet Champion
    [45842] = 39,        -- Wyrmguard Legplates
    [45843] = 39,        -- Legguards of the Peaceful Covenant
    [45844] = 39,        -- Leggings of the Tireless Sentry
    [45845] = 39,        -- Leggings of the Weary Mystic
    [45846] = 39,        -- Leggings of Wavering Shadow
    [45847] = 39,        -- Wildstrider Legguards
    [45848] = 39,        -- Legwraps of the Master Conjurer
    -- Neck
    [45819] = 25,        -- Spiked Battleguard Choker
    [45820] = 25,        -- Broach of the Wailing Night
    [45821] = 25,        -- Shard of the Crystal Forest
    [45822] = 25,        -- Evoker's Charm
    [45823] = 25,        -- Frozen Tear of Elune
    -- Waist
    [45824] = 28,        -- Belt of the Singing Blade
    [45825] = 28,        -- Shieldwarder Girdle
    [45826] = 28,        -- Girdle of Unyielding Trust
    [45827] = 28,        -- Belt of the Ardent Marksman
    [45828] = 28,        -- Windchill Binding
    [45829] = 28,        -- Belt of the Twilight Assassin
    [45830] = 28,        -- Belt of the Living Thicket
    [45831] = 28,        -- Sash of Potent Incantations
    }
RegisterEmblemItems("Emblem of Conquest", CONQUEST_ITEMS)


-- ============================================================
-- Emblem of Valor Items
-- ============================================================

local VALOR_ITEMS = {

    -- Chest (Token T7)
    [40635] = 75,        -- Legplates of the Lost Protector
    [40638] = 60,        -- Mantle of the Lost Protector
    -- Back
    [40724] = 25,        -- Cloak of Kea Feathers
    [40723] = 25,        -- Disguise of the Kumiho
    [40722] = 25,        -- Platinum Mesh Cloak
    [40721] = 25,        -- Hammerhead Sharkskin Cloak
    [40751] = 40,        -- Slippers of the Holy Light
    [40750] = 40,        -- Xintor's Expeditionary Boots
    [40749] = 40,        -- Rainey's Chewed Boots
    [40748] = 40,        -- Boots of Captain Ellis
    [40747] = 40,        -- Treads of Coastal Wandering
    [40746] = 40,        -- Pack-Ice Striders
    [40745] = 40,        -- Sabatons of Rapid Recovery
    [40743] = 40,        -- Kyzoc's Ground Stompers
    [40742] = 40,        -- Bladed Steelboots
    -- Finger
    [40719] = 25,        -- Band of Channeled Magic
    [40718] = 25,        -- Signet of the Impregnable Fortress
    [40717] = 25,        -- Ring of Invincibility
    [40720] = 25,        -- Renewal of Life
    -- Relic
    [40342] = 15,        -- Idol of Awakening
    [40337] = 15,        -- Libram of Resurgence
    [40322] = 15,        -- Totem of Dueling
    [40321] = 15,        -- Idol of the Shooting Star
    [40268] = 15,        -- Libram of Tolerance
    [40267] = 15,        -- Totem of Hex
    [40207] = 15,        -- Sigil of Awareness
    [40191] = 15,        -- Libram of Radiance
    [39757] = 15,        -- Idol of Worship
    [39728] = 15,        -- Totem of Misery

    -- Wrist
    [40741] = 60,        -- Cuffs of the Shadow Ascendant
    [40740] = 60,        -- Wraps of the Astral Traveler
    [40739] = 60,        -- Bands of the Great Tree
    [40738] = 60,        -- Wristwraps of the Cutthroat
    [40737] = 60,        -- Pigmented Clan Bindings
    [40736] = 60,        -- Armguard of the Tower Archer
    [40735] = 60,        -- Zartson's Jungle Vambraces
    [40734] = 60,        -- Bracers of Dalaran's Parapets
    [40733] = 60,        -- Wristbands of the Sentinel Huntress


}

RegisterEmblemItems("Emblem of Valor", VALOR_ITEMS)


-- ============================================================
-- Emblem of Heroism Items
-- ============================================================

local Heroism_ITEMS = {

 
-- Chest (Token T7)
[40611] = 80,        -- Chestguard of the Lost Protector
[40614] = 60,        -- Gloves of the Lost Protector
-- Neck
[40678] = 25,        -- Pendant of the Outcast Hero
[40679] = 25,        -- Chained Military Gorget
[40680] = 25,        -- Encircling Burnished Gold Chains
[40681] = 25,        -- Lattice Choker of Light
[40698] = 40,        -- Ward of the Violet Citadel
[40699] = 40,        -- Handbook of Obscure Remedies
-- One-Hand
[40702] = 50,        -- Rolfsen's Ripper
[40703] = 50,        -- Grasscutter
[40704] = 50,        -- Pride
-- Shield
[40700] = 40,        -- Protective Barricade of the Light
[40701] = 40,        -- Crygil's Discarded Plate Panel
-- Trinket
[40682] = 40,        -- Sundial of the Exiled
[40683] = 40,        -- Valor Medal of the First War
[40684] = 40,        -- Mirror of Truth
[40685] = 40,        -- The Egg of Mortal Essence
[37111] = 60,        -- Soul Preserver
-- Waist
[40688] = 40,        -- Verdungo's Barbarian Cord
[40689] = 40,        -- Waistguard of Living Iron
[40691] = 40,        -- Magroth's Meditative Cincture
[40692] = 40,        -- Vereesa's Silver Chain Belt
[40693] = 40,        -- Beadwork Belt of Shamanic Vision
[40694] = 40,        -- Jorach's Crocolisk Skin Belt
[40695] = 40,        -- Vine Belt of the Woodland Dryad
[40696] = 40,        -- Plush Sash of Guzbah
[40697] = 40,        -- Elegant Temple Gardens' Girdle

--libram
[40705] = 15,        -- Libram of Resurgence
[40706] = 15,        -- Libram of Tolerance
[40707] = 15,        -- Libram of Radiance
[40715] = 15,        -- Sigil of Haunted Dreams
[40714] = 15,        -- Sigil of the Unfaltering Knight
[40713] = 15,        -- Idol of the Ravenous Beast
[40712] = 15,        -- Idol of Steadfast Renewal
[40711] = 15,        -- Idol of Lush Moss
[40710] = 15,        -- Totem of Splintering
[40709] = 15,        -- Totem of Forest Growth
[40708] = 15,        -- Totem of the Elemental Plane

--thrown
[40716] = 15,        -- Lillehoff's Winged Blades

}

RegisterEmblemItems("Emblem of Heroism", Heroism_ITEMS)

-- ============================================================
-- Emblem of Ascension Items
-- ============================================================

local ASCENSION_ITEMS = {


    -- Emblem of Ascension x12
    [40322] = 12, [40321] = 12, [40268] = 12, [40267] = 12, [40207] = 12, [40191] = 12, [39757] = 12, [40239] = 12, [39728] = 12,

    -- Emblem of Ascension x15
    [40433] = 15, [40375] = 15, [40370] = 15, [40108] = 15, [40107] = 15, [40080] = 15, [40075] = 15, [40074] = 15, [40378] = 15, 
    [40374] = 15, [40369] = 15, [40071] = 15, [40069] = 15, [40065] = 15, [40064] = 15, [40244] = 15, [40254] = 15, [40253] = 15, 
    [40252] = 15, [40251] = 15, [40250] = 15, [40332] = 15, [40325] = 15, [40324] = 15, [40323] = 15, [40306] = 15, [40282] = 15, 
    [40274] = 15, [40209] = 15, [40198] = 15, [40186] = 15, [39765] = 15, [39764] = 15, [39731] = 15, [39729] = 15, [39722] = 15, 
    [39702] = 15, [40330] = 15,

    -- Emblem of Ascension x19
    [40638] = 19, [40439] = 19, [40438] = 19, [40437] = 19, [40377] = 19, [40351] = 19, [40315] = 19, [40305] = 19, [40299] = 19, 
    [40289] = 19, [40288] = 19, [40286] = 19, [40185] = 19, [40063] = 19, [39725] = 19, [39719] = 19, [39704] = 19, [40334] = 19, 
    [44003] = 19, [40629] = 19, [40380] = 19, [40362] = 19, [40349] = 19, [40347] = 19, [40316] = 19, [40303] = 19, [40302] = 19, 
    [40262] = 19, [40261] = 19, [40242] = 19, [40238] = 19, [40197] = 19, [40188] = 19, [39733] = 19, [39727] = 19, [39726] = 19, 
    [39718] = 19, [39703] = 19, [44004] = 19, [40327] = 19, [40317] = 19, [40301] = 19, [40278] = 19, [40275] = 19, [40272] = 19, 
    [40271] = 19, [40263] = 19, [40260] = 19, [40259] = 19, [40241] = 19, [40205] = 19, [40200] = 19, [39762] = 19, [39759] = 19, 
    [39735] = 19, [39721] = 19, [40243] = 19, [40236] = 19, [40237] = 19, [40270] = 19, [40206] = 19, [40367] = 19, [40326] = 19, 
    [40320] = 19, [40297] = 19, [40269] = 19, [39701] = 19, [40187] = 19, [39706] = 19, [39734] = 19, [40246] = 19, [39717] = 19, 
    [40184] = 19,

    -- Emblem of Ascension x25
    [40451] = 25, [40366] = 25, [40344] = 25, [40304] = 25, [40298] = 25, [40296] = 25, [40287] = 25, [40247] = 25, [40235] = 25, 
    [39768] = 25, [39760] = 25, [39732] = 25, [39723] = 25, [40329] = 25, [40626] = 25, [40602] = 25, [40381] = 25, [40234] = 25, 
    [40062] = 25, [40453] = 25, [40365] = 25, [40319] = 25, [40283] = 25, [40279] = 25, [40277] = 25, [40249] = 25, [40210] = 25, 
    [40203] = 25, [40193] = 25, [40061] = 25, [39767] = 25, [39756] = 25, [39724] = 25, [40363] = 25, [40240] = 25, [39720] = 25, 
    [40379] = 25, [40294] = 25, [40196] = 25, [40635] = 25, [40318] = 25, [40352] = 25, [40398] = 25, [40560] = 25, [40589] = 25, 
    [40204] = 25, [39761] = 25,

    -- Emblem of Ascension x38
    [40532] = 38, [40531] = 38, [40432] = 38, [40431] = 38, [40382] = 38, [40373] = 38, [40372] = 38, [40371] = 38, [40258] = 38, 
    [40257] = 38, [40256] = 38, [40255] = 38, [40399] = 38, [40387] = 38, [40402] = 38, [40401] = 38, [40400] = 38, [40396] = 38, 
    [40395] = 38, [40388] = 38, [40386] = 38, [40385] = 38, [40384] = 38, [40383] = 38, [44007] = 38, [44006] = 38, [40562] = 38, 
    [40543] = 38, [40632] = 38, [40594] = 38, [40590] = 38, [40555] = 38, [44005] = 38, [40405] = 38, [40403] = 38, [40588] = 38, 
    [40539] = 38, [40194] = 38, [44008] = 38, [40541] = 38, [40564] = 38, [40566] = 38, [40561] = 38, [44011] = 38, [40201] = 38, 
    [40376] = 38, [40446] = 38, [40592] = 38, [40591] = 38, [40558] = 38, [40549] = 38,

    -- Emblem of Ascension x80
    [15000] = 80, [130023] = 80, [130031] = 80,
}

RegisterEmblemItems("Emblem of Ascension", ASCENSION_ITEMS)


-- ============================================================
-- Emblem of Ascension Items
-- ============================================================

local TITAN_ITEMS = {

[46034] = 12,        -- Leggings of Profound Darkness
[46044] = 12,        -- Observer's Mantle
[46067] = 12,        -- Hammer of Crushing Whispers
[46047] = 12,        -- Pendant of the Somber Witness
[45989] = 12,        -- Tempered Mercury Greaves
[45930] = 12,        -- Combatant's Bootblade
[46045] = 12,        -- Pulsar Gloves
[46021] = 12,        -- Royal Seal of King Llane
[46040] = 12,        -- Strength of the Heavens
[45931] = 12,        -- Mjolnir Runestone
[46050] = 12,        -- Starlight Treads
[46036] = 12,        -- Void Sabre
[45982] = 12,        -- Fused Alloy Legplates
[46051] = 12,        -- Meteorite Crystal
[46032] = 12,        -- Drape of the Faceless General
[46041] = 12,        -- Starfall Girdle
[45947] = 12,        -- Serilas Blood Blade of Invar One-Arm
[46097] = 12,        -- Caress of Insanity
[45993] = 12,        -- Mimiron's Flight Goggles
[45988] = 12,        -- Greaves of the Iron Army
[46042] = 12,        -- Drape of the Messenger
[45300] = 12,        -- Mantle of Fiery Vengeance
[46096] = 12,        -- Signet of Soft Lament
[46038] = 12,        -- Dark Matter
[45945] = 12,        -- Seed of Budding Carnage
[45286] = 12,        -- Pyrite Infuser
[46037] = 12,        -- Shoulderplates of the Celestial Watch
[45943] = 12,        -- Gloves of Whispering Winds
[45928] = 12,        -- Gauntlets of the Thunder God
[46048] = 12,        -- Band of Lights
[45990] = 12,        -- Fusion Blade
[46039] = 12,        -- Breastplate of the Timeless
[45933] = 12,        -- Pendant of the Shallow Grave
[45946] = 12,        -- Fire Orchid Signet
[45297] = 12,        -- Shimmering Seal
[46049] = 12,        -- Zodiac Leggings
[45867] = 12,        -- Breastplate of the Stoneshaper
[46033] = 12,        -- Tortured Earth
[46043] = 12,        -- Gloves of the Endless Dark
[46035] = 12,        -- Aesuga Hand of the Ardent Champion
[46046] = 12,        -- Nebula Band
[46068] = 12,        -- Amice of Inconceivable Horror
[46095] = 12,        -- Soul-Devouring Cinch
[45888] = 12,        -- Bitter Cold Armguards
[45876] = 12,        -- Shiver
[45868] = 12,        -- Aesir's Edge
[45929] = 12,        -- Sif's Remembrance
[45295] = 12,        -- Gilded Steel Legplates
[45887] = 12,        -- Ice Layered Barrier
[45293] = 12,        -- Handguards of Potent Cures
[45886] = 12,        -- Icecore Staff
[45877] = 12,        -- The Boreal Guard
[45871] = 12,        -- Seal of Ulduar
[45870] = 12,        -- Magnetized Projectile Emitter
[45869] = 12,        -- Fluxing Energy Coils
[45456] = 12,        -- Loop of the Agile
[45449] = 12,        -- The Masticator
[45448] = 12,        -- Perilous Bite
[45308] = 12,        -- Eye of the Broodmother
[45294] = 12,        -- Petrified Ivy Sprig
[45296] = 12,        -- Twirling Blades
[45447] = 12,        -- Watchful Eye of Fate
[45703] = 12,        -- Spark of Hope
}
RegisterEmblemItems("Echo of the Titans", TITAN_ITEMS)

-- ============================================================
-- Utility Functions
-- ============================================================

-- Check if an item is available from emblems
function Bistooltip_GetEmblemSource(itemId)
    if not itemId then return nil end
    return Bistooltip_emblem_items[itemId]
end

-- Calculate total emblems needed for a list of item IDs
function Bistooltip_CalculateEmblemsNeeded(itemIds)
    local totals = {}  -- currency -> { total = n, items = {} }
    
    for _, itemId in ipairs(itemIds) do
        local emblem = Bistooltip_emblem_items[itemId]
        if emblem then
            local currency = emblem.currency
            if not totals[currency] then
                totals[currency] = { total = 0, items = {} }
            end
            totals[currency].total = totals[currency].total + (emblem.cost or 0)
            table.insert(totals[currency].items, {
                id = itemId,
                cost = emblem.cost or 0,
            })
        end
    end
    
    return totals
end

-- Print emblem info for an item (useful for debugging)
function Bistooltip_PrintEmblemInfo(itemIdOrLink)
    local itemId = itemIdOrLink
    if type(itemIdOrLink) == "string" then
        itemId = tonumber(itemIdOrLink:match("item:(%d+)"))
    end
    
    if not itemId then
        print("|cffff0000Invalid item ID or link|r")
        return
    end
    
    local name = GetItemInfo(itemId)
    local emblem = Bistooltip_emblem_items[itemId]
    
    if emblem then
        print(string.format("|cffffd000%s|r (ID: %d): |cff00ff00%s x%d|r", 
            name or "Unknown", itemId, emblem.currency, emblem.cost or 0))
    else
        print(string.format("|cffffd000%s|r (ID: %d): |cffff0000Not available from emblems|r",
            name or "Unknown", itemId))
    end
end

-- Slash command to check emblem info
SLASH_BISEMBLEM1 = "/bisemblem"
SlashCmdList["BISEMBLEM"] = function(msg)
    if msg == "" then
        print("|cffffd000Bis-Tooltip Emblem Info:|r")
        print("Usage: /bisemblem [itemId or item link]")
        print("Example: /bisemblem 50356")
        return
    end
    
    Bistooltip_PrintEmblemInfo(msg)
end
