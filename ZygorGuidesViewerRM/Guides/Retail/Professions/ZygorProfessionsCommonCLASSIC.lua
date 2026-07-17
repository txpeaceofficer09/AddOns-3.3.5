local ZygorGuidesViewer=ZygorGuidesViewer
if not ZygorGuidesViewer then return end

ZygorGuidesViewer.GuideMenuTier = "CLA"

-----------------------------
---     TBC HERBALISM     ---
-----------------------------

ZygorGuidesViewer:RegisterGuide("Profession Guides\\Herbalism\\Farming Guides\\Felweed",{
	author="support@zygorguides.com",
	description="\nFelweed can be gathered from Terokkar Forest.",
	condition_suggested=function() return skill('Herbalism') >= 300 end,
	condition_valid=function() return skill('Herbalism') >= 300 end,
	condition_valid_msg="Your Herbalism skill must be at least 300 to gather Felweed.",
	},[[
	step
		map Terokkar Forest/0
		path follow smart; loop on; ants curved
		path	31.60,45.71	32.29,42.68	32.86,38.44	32.61,35.72	34.85,34.70
		path	36.60,32.54	36.98,30.09	38.61,28.59	39.20,26.76	40.64,25.10
		path	41.40,22.16	43.06,19.91	43.81,17.68	43.32,15.01	43.95,12.48
		path	45.94,12.75	48.58,14.35	50.45,17.02	49.36,20.09	49.79,22.32
		path	50.98,24.83	53.08,25.59	55.63,25.32	58.26,25.33	59.93,23.87
		path	61.12,26.59	62.13,28.15	63.46,29.60	65.02,31.32	67.13,31.63
		path	69.82,31.74	69.61,35.63	68.73,39.39	69.79,42.02	70.46,45.89
		path	70.51,48.71	68.94,53.17	68.11,54.89	65.38,54.27	63.87,51.31
		path	61.59,50.51	59.04,49.28	56.48,46.30	53.96,42.43	54.33,38.20
		path	53.25,35.66	50.24,35.67	48.92,34.53	46.58,34.04	43.68,34.49
		path	40.40,35.76	38.35,36.51	36.62,38.18	36.01,39.93	36.50,42.94
		path	35.72,43.53	33.66,44.98
		click Felweed##181270+
		|tip Gather Felweed along the path.
		collect Felweed##22785 |n
		'|confirm
]])

ZygorGuidesViewer:RegisterGuide("Profession Guides\\Herbalism\\Farming Guides\\Ancient Lichen",{
	author="support@zygorguides.com",
	description="\nAncient Lichen can be gathered from mobs in Zangarmarsh or from various dungeons.",
	condition_suggested=function() return skill('Herbalism') >= 340 end,
	condition_valid=function() return skill('Herbalism') >= 340 end,
	condition_valid_msg="Your Herbalism skill must be at least 340 to gather Ancient Lichen.",
	},[[
	step
		map Zangarmarsh/0 
		path	follow smart; ants curved; dist 20
		path	82.27,44.23	79.64,39.75	79.46,36.87	81.08,33.72	83.18,34.79
		path	84.92,37.43	85.23,40.76
		Kill Withered enemies around this area
		|tip Gather their corpses with Herbalism.
		|tip These can also be farmed from Slave Pens, Underbog and Steamvaults with stealth or a group.
		collect Ancient Lichen##22790 |n
		'|confirm
]])

ZygorGuidesViewer:RegisterGuide("Profession Guides\\Herbalism\\Farming Guides\\Dreaming Glory",{
	author="support@zygorguides.com",
	description="\nDreaming Glory can be gathered from Terokkar Forest.",
	condition_suggested=function() return skill('Herbalism') >= 315 end,
	condition_valid=function() return skill('Herbalism') >= 315 end,
	condition_valid_msg="Your Herbalism skill must be at least 315 to gather Dreaming Glory.",
	},[[
	step
		map Terokkar Forest/0
		path follow smart; loop on; ants curved
		path	31.60,45.71	32.29,42.68	32.86,38.44	32.61,35.72	34.85,34.70
		path	36.60,32.54	36.98,30.09	38.61,28.59	39.20,26.76	40.64,25.10
		path	41.40,22.16	43.06,19.91	43.81,17.68	43.32,15.01	43.95,12.48
		path	45.94,12.75	48.58,14.35	50.45,17.02	49.36,20.09	49.79,22.32
		path	50.98,24.83	53.08,25.59	55.63,25.32	58.26,25.33	59.93,23.87
		path	61.12,26.59	62.13,28.15	63.46,29.60	65.02,31.32	67.13,31.63
		path	69.82,31.74	69.61,35.63	68.73,39.39	69.79,42.02	70.46,45.89
		path	70.51,48.71	68.94,53.17	68.11,54.89	65.38,54.27	63.87,51.31
		path	61.59,50.51	59.04,49.28	56.48,46.30	53.96,42.43	54.33,38.20
		path	53.25,35.66	50.24,35.67	48.92,34.53	46.58,34.04	43.68,34.49
		path	40.40,35.76	38.35,36.51	36.62,38.18	36.01,39.93	36.50,42.94
		path	35.72,43.53	33.66,44.98
		click Dreaming Glory##181271+
		|tip Gather Dreaming Glory along the path.
		collect Dreaming Glory##22786 |n
		'|confirm
]])

ZygorGuidesViewer:RegisterGuide("Profession Guides\\Herbalism\\Farming Guides\\Fel Lotus",{
	author="support@zygorguides.com",
	description="\nFel Lotus can be gathered from Nightmare Vine in Shadowmoon Valley or any other Outland herb.",
	condition_suggested=function() return skill('Herbalism') >= 300 end,
	condition_valid=function() return skill('Herbalism') >= 300 end,
	condition_valid_msg="Your Herbalism skill must be at least 300 to gather Fel Lotus.",
	},[[
	step
		map Shadowmoon Valley/0
		path	follow smart; loop on; ants curved; dist 20
		path	42.51,59.05	43.42,65.13	43.35,72.41	47.71,69.62	47.32,51.73
		path	51.52,59.03	51.41,66.46	56.94,73.92	61.24,68.15	57.83,57.26
		path	62.03,56.22	65.24,61.52	70.61,60.71	68.51,58.02	67.94,47.22
		path	72.11,47.51	71.52,40.81	66.32,39.32	58.53,45.31	49.95,33.91
		path	53.12,33.55	59.63,37.35	67.13,28.91	66.02,21.82	58.01,23.62
		path	55.63,16.84	52.52,15.62	52.51,21.61	45.53,15.13	42.32,38.24
		path	38.31,32.18	31.21,34.61	24.92,29.64	22.04,34.71	22.04,40.81
		path	29.72,47.82	27.23,52.63	31.63,53.82
		click Nightmare Vine##181280+
		|tip Gather Nightmare Vine along the path.
		|tip Fel Lotus is gathered from any herb farmed in the Outland.
		collect Fel Lotus##22794 |n
		'|confirm
]])

ZygorGuidesViewer:RegisterGuide("Profession Guides\\Herbalism\\Farming Guides\\Mana Thistle",{
	author="support@zygorguides.com",
	description="\nMana Thistle can be gathered from Terokkar Forest and Shadowmoon Valley.",
	condition_suggested=function() return skill('Herbalism') >= 375 end,
	condition_valid=function() return skill('Herbalism') >= 375 end,
	condition_valid_msg="Your Herbalism skill must be at least 375 to gather Mana Thistle.",
	},[[
	step
	label "Start_Path"
		map Terokkar Forest/0
		path	follow smart; loop on; ants curved; dist 20
		path	27.11,10.51	22.10,6.50	20.21,14.21	23.90,10.50
		click Mana Thistle##181281+
		|tip Gather Mana Thistle along the path.
		|tip Mana Thistle is a rare herb, so pick nearby herbs to make it possibly spawn.
		collect Mana Thistle##22793 |n
		Farm Along the Path |goto 23.90,10.50 < 30 |noway |c
	step
		map Terokkar Forest/0
		path	follow smart; loop on; ants curved; dist 20
		path	62.42,73.60	65.70,79.21	68.72,85.72	72.21,88.52	74.91,87.50
		path	72.31,82.01	69.31,74.60	62.41,73.60
		click Mana Thistle##181281+
		|tip Gather Mana Thistle along the path.
		|tip Mana Thistle is a rare herb, so pick nearby herbs to make it possibly spawn.
		collect Mana Thistle##22793 |n
		Farm Along the Path |goto 62.41,73.60 < 30 |noway |c
	step
		map Shadowmoon Valley/0
		path	follow smart; loop on; ants curved; dist 20
		path	65.81,80.63	70.21,79.12	74.31,80.80	79.20,87.53	77.51,88.40
		path	74.32,88.92	71.12,88.31	68.33,87.51	70.21,83.92	72.02,85.91
		path	74.60,86.41
		click Mana Thistle##181281+
		|tip Gather Mana Thistle along the path.
		|tip Mana Thistle is a rare herb, so pick nearby herbs to make it possibly spawn.
		collect Mana Thistle##22793 |n
		Farm Along the Path |goto 74.60,86.41 < 30 |noway |c |next "Start_Path"
]])

ZygorGuidesViewer:RegisterGuide("Profession Guides\\Herbalism\\Farming Guides\\Netherbloom",{
	author="support@zygorguides.com",
	description="\nNetherbloom can be gathered from Netherstorm.",
	condition_suggested=function() return skill('Herbalism') >= 350 end,
	condition_valid=function() return skill('Herbalism') >= 350 end,
	condition_valid_msg="Your Herbalism skill must be at least 350 to gather Netherbloom.",
	},[[
	step
		map Netherstorm/0
		path follow smart; loop on; ants curved
		path	40.24,77.20	35.96,77.64	33.57,77.45	32.69,76.46	29.37,79.43
		path	26.96,78.02	25.18,76.67	22.65,76.95	21.15,76.56	20.31,74.78
		path	19.80,71.91	19.08,69.17	20.47,66.62	22.14,66.23	24.65,65.10
		path	27.12,60.26	25.78,57.60	24.23,55.80	25.51,54.63	28.56,54.51
		path	31.15,52.38	29.62,43.63	27.59,44.60	25.41,44.20	22.98,42.42
		path	23.01,39.51	24.33,37.29	25.59,34.57	28.07,36.77	29.58,40.32
		path	31.85,40.98	36.24,37.50	34.06,33.89	33.35,29.83	33.90,25.46
		path	35.11,23.24	35.65,19.13	37.78,16.74	39.58,16.09	42.42,14.81
		path	44.23,11.72	45.11,9.32	45.88,7.67	46.97,9.19	48.22,13.84
		path	50.05,15.38	50.32,17.83	53.22,17.87	55.50,17.51	55.81,20.17
		path	56.92,23.83	54.87,25.87	52.51,26.14	50.65,26.43	48.19,27.46
		path	47.13,31.47	47.76,34.54	49.01,37.61	54.64,32.59	56.67,31.80
		path	58.36,31.54	60.65,30.28	62.49,30.31	65.43,30.84	67.85,32.79
		path	68.63,35.87	70.41,36.32	72.66,35.05	73.97,35.64	73.61,37.25
		path	73.81,39.22	73.42,40.88	72.18,43.37	70.07,44.56	68.89,46.88
		path	66.51,48.70	64.20,50.40	61.71,50.31	59.22,50.15	57.37,48.48
		path	56.39,46.25	54.77,43.82	53.12,41.66	49.55,46.57	49.57,50.00
		path	50.42,52.90	51.84,54.87	53.70,56.61	56.10,56.66	57.95,57.14
		path	59.94,58.21	62.03,58.25	64.36,58.34	66.65,58.84	67.89,61.91
		path	66.70,65.88	64.15,67.93	62.18,68.23	61.37,64.52	60.24,63.12
		path	57.94,63.05	57.36,65.05	56.29,67.80	52.89,68.59	51.27,70.71
		path	51.54,75.15	54.25,76.46	57.15,77.98	59.64,78.82	62.25,79.25
		path	60.11,81.86	60.14,84.60	59.80,87.70	58.69,89.60	56.55,89.08
		path	54.83,88.42	52.69,86.63	50.15,86.35	48.74,85.68	46.78,84.05
		path	45.54,79.03	43.73,76.27
		click Netherbloom##181279+
		|tip Gather Netherbloom along the path.
		collect Netherbloom##22791 |n
		'|confirm
]])

ZygorGuidesViewer:RegisterGuide("Profession Guides\\Herbalism\\Farming Guides\\Nightmare Vine",{
	author="support@zygorguides.com",
	description="\nNightmare Vine can be gathered from Shadowmoon Valley.",
	condition_suggested=function() return skill('Herbalism') >= 365 end,
	condition_valid=function() return skill('Herbalism') >= 365 end,
	condition_valid_msg="Your Herbalism skill must be at least 365 to gather Nightmare Vine.",
	},[[
	step
		map Shadowmoon Valley/0
		path	follow smart; loop on; ants curved; dist 20
		path	42.51,59.05	43.42,65.13	43.35,72.41	47.71,69.62	47.32,51.73
		path	51.52,59.03	51.41,66.46	56.94,73.92	61.24,68.15	57.83,57.26
		path	62.03,56.22	65.24,61.52	70.61,60.71	68.51,58.02	67.94,47.22
		path	72.11,47.51	71.52,40.81	66.32,39.32	58.53,45.31	49.95,33.91
		path	53.12,33.55	59.63,37.35	67.13,28.91	66.02,21.82	58.01,23.62
		path	55.63,16.84	52.52,15.62	52.51,21.61	45.53,15.13	42.32,38.24
		path	38.31,32.18	31.21,34.61	24.92,29.64	22.04,34.71	22.04,40.81
		path	29.72,47.82	27.23,52.63	31.63,53.82
		click Nightmare Vine##181280+
		|tip Gather Nightmare Vine along the path.
		collect Nightmare Vine##22792 |n
		'|confirm
]])

ZygorGuidesViewer:RegisterGuide("Profession Guides\\Herbalism\\Farming Guides\\Ragveil",{
	author="support@zygorguides.com",
	description="\nRagveil can be gathered from Zangarmarsh.",
	condition_suggested=function() return skill('Herbalism') >= 325 end,
	condition_valid=function() return skill('Herbalism') >= 325 end,
	condition_valid_msg="Your Herbalism skill must be at least 325 to gather Ragveil.",
	},[[
	step
		map Zangarmarsh/0
		path follow smart; loop on; ants curved
		path	83.47,41.87	84.20,37.59	81.81,33.16	77.86,33.21	75.68,34.01
		path	73.86,38.51	70.74,40.47	68.52,41.50	65.65,39.18	62.93,38.46
		path	60.95,37.98	58.10,35.36	55.37,35.42	53.23,34.98	50.96,33.65
		path	48.21,33.08	44.78,31.79	42.54,31.68	40.63,33.89	38.56,33.56
		path	36.66,32.68	34.77,29.60	33.26,26.30	29.50,24.65	26.55,23.37
		path	24.63,23.97	21.65,27.24	18.44,29.85	17.29,33.67	17.04,36.75
		path	14.23,41.57	16.46,46.13	17.31,50.06	16.84,53.47	17.92,56.63
		path	15.63,58.80	12.99,59.63	13.11,63.17	16.33,63.54	19.08,61.78
		path	22.78,58.64	25.41,57.72	27.03,57.93	28.53,61.81	30.87,61.91
		path	33.55,65.37	35.31,64.62	38.20,64.75	41.54,64.06	42.44,62.80
		path	45.31,63.25	47.33,62.29	49.64,63.31	52.00,66.07	53.50,67.63
		path	55.24,67.25	57.43,68.85	59.99,68.42	62.10,69.89	64.46,71.61
		path	66.43,73.47	66.45,77.16	67.51,80.44	68.34,84.46	71.72,85.54
		path	73.36,85.21	76.07,84.45	78.24,85.58	80.78,86.39	82.03,87.58
		path	85.17,86.99	86.08,83.78	84.64,81.04	82.88,78.84	82.18,76.32
		path	82.33,72.85	80.95,70.67	78.39,67.26	77.98,62.18	78.15,60.45
		path	78.17,59.21	78.92,56.99	81.39,54.58	82.91,52.12	82.36,49.38
		path	82.90,46.26
		click Ragveil##181275+
		|tip Gather Ragveil along the path.
		collect Ragveil##22787 |n
		'|confirm
]])

ZygorGuidesViewer:RegisterGuide("Profession Guides\\Herbalism\\Farming Guides\\Terocone",{
	author="support@zygorguides.com",
	description="\nTerocone can be gathered from Terokkar Forest.",
	condition_suggested=function() return skill('Herbalism') >= 325 end,
	condition_valid=function() return skill('Herbalism') >= 325 end,
	condition_valid_msg="Your Herbalism skill must be at least 325 to gather Terocone.",
	},[[
	step
		map Terokkar Forest/0
		path follow smart; loop on; ants curved
		path	31.60,45.71	32.29,42.68	32.86,38.44	32.61,35.72	34.85,34.70
		path	36.60,32.54	36.98,30.09	38.61,28.59	39.20,26.76	40.64,25.10
		path	41.40,22.16	43.06,19.91	43.81,17.68	43.32,15.01	43.95,12.48
		path	45.94,12.75	48.58,14.35	50.45,17.02	49.36,20.09	49.79,22.32
		path	50.98,24.83	53.08,25.59	55.63,25.32	58.26,25.33	59.93,23.87
		path	61.12,26.59	62.13,28.15	63.46,29.60	65.02,31.32	67.13,31.63
		path	69.82,31.74	69.61,35.63	68.73,39.39	69.79,42.02	70.46,45.89
		path	70.51,48.71	68.94,53.17	68.11,54.89	65.38,54.27	63.87,51.31
		path	61.59,50.51	59.04,49.28	56.48,46.30	53.96,42.43	54.33,38.20
		path	53.25,35.66	50.24,35.67	48.92,34.53	46.58,34.04	43.68,34.49
		path	40.40,35.76	38.35,36.51	36.62,38.18	36.01,39.93	36.50,42.94
		path	35.72,43.53	33.66,44.98
		click Terocone##181277+
		|tip Gather Terocone along the path.
		collect Terocone##22789 |n
		'|confirm
]])

------------------------------
---     TBC ENCHANTING     ---
------------------------------

ZygorGuidesViewer:RegisterGuide("Profession Guides\\Enchanting\\Farming Guides\\Arcane Dust",{
	author="support@zygorguides.com",
	description="\nDisenchant items to gather Enchanting materials.",
	condition_end=function() return skill('Enchanting') >= 375 end,
	},[[
	step
		Disenchant item level 60 or higher green armor and weapons
		|tip You can disenchant old gear or buy some off the Auction House.
		|tip You may sometimes get Greater or Lesser Planar Essence instead of Arcane Dust.
		collect Arcane Dust##22445 |n
		'|confirm
]])

ZygorGuidesViewer:RegisterGuide("Profession Guides\\Enchanting\\Farming Guides\\Lesser Planar Essence",{
	author="support@zygorguides.com",
	description="\nDisenchant items to gather Enchanting materials.",
	condition_end=function() return skill('Enchanting') >= 375 end,
	},[[
	step
		Disenchant item level 60 or higher green armor and weapons
		|tip You can disenchant old gear or buy some off the Auction House.
		|tip These specifically come from The Burning Crusade greens.
		|tip This means that greens from Classic will not drop them when disenchanted.
		|tip You may sometimes get Greater or Lesser Planar Essence instead of Arcane Dust.
		collect Lesser Planar Essence##22447 |n
		'|confirm
]])

ZygorGuidesViewer:RegisterGuide("Profession Guides\\Enchanting\\Farming Guides\\Greater Planar Essence",{
	author="support@zygorguides.com",
	description="\nDisenchant items to gather Enchanting materials.",
	condition_end=function() return skill('Enchanting') >= 375 end,
	},[[
	step
		Disenchant item level 60 or higher green armor and weapons
		|tip You can disenchant old gear or buy some off the Auction House.
		|tip These specifically come from The Burning Crusade greens.
		|tip This means that greens from Classic will not drop them when disenchanted.
		|tip You may sometimes get Greater or Lesser Planar Essence instead of Arcane Dust.
		collect Greater Planar Essence##22446 |n
		'|confirm
]])

ZygorGuidesViewer:RegisterGuide("Profession Guides\\Enchanting\\Farming Guides\\Large Prismatic Shard",{
	author="support@zygorguides.com",
	description="\nDisenchant items to gather Enchanting materials.",
	condition_end=function() return skill('Enchanting') >= 375 end,
	},[[
	step
		Disenchant item level 67 or higher blue armor and weapons
		|tip You can disenchant old gear or buy some off the Auction House.
		collect Large Prismatic Shard##22449 |n
		'|confirm
]])

ZygorGuidesViewer:RegisterGuide("Profession Guides\\Enchanting\\Farming Guides\\Small Prismatic Shard",{
	author="support@zygorguides.com",
	description="\nDisenchant items to gather Enchanting materials.",
	condition_end=function() return skill('Enchanting') >= 375 end,
	},[[
	step
		Disenchant item level 58 or higher blue armor and weapons
		|tip You can disenchant old gear or buy some off the Auction House.
		|tip These specifically come from The Burning Crusade blues.
		|tip This means that blues from Classic will not drop them when disenchanted.
		collect Small Prismatic Shard##22448 |n
		'|confirm
]])

---------------------------
---     TBC COOKING     ---
---------------------------
ZygorGuidesViewer:RegisterGuide("Profession Guides\\Cooking\\Farming Guides\\Ravager Flesh",{
	author="support@zygorguides.com",
	description="\nRavager Flesh can be gathered from the western Hellfire Peninsula.",
	},[[
	step
		Kill Thornfang enemies around this area
		|tip They spawn on both sides of the road.
		collect Ravager Flesh##27674 |n |goto Hellfire Peninsula/0 10.26,51.72
		'|confirm
]])

ZygorGuidesViewer:RegisterGuide("Profession Guides\\Cooking\\Farming Guides\\Talbuk Venison",{
	author="support@zygorguides.com",
	description="\nTalbuk Venison can be gathered from central Nagrand.",
	},[[
	step
		map Nagrand/0
		path loop on; follow strict; dist 40
		path	53.83,31.31	52.92,29.15	51.38,26.84	48.38,27.04	47.30,30.27
		path	48.26,33.27	49.13,37.97	50.13,39.28	51.37,38.48	50.58,36.74
		path	52.29,33.21
		kill Talbuk Thorngrazer##17131+
		collect Talbuk Venison##27682 |n
		'|confirm
]])

ZygorGuidesViewer:RegisterGuide("Profession Guides\\Cooking\\Farming Guides\\Raptor Ribs",{
	author="support@zygorguides.com",
	description="\nRaptor Ribs can be gathered from the eastern Blade's Edge Mountains.",
	},[[
	step
		map Blade's Edge Mountains/0
		path loop on; follow strict; dist 40
		path	62.00,55.54	65.96,57.01	66.51,59.83	66.37,63.86	67.39,66.46
		path	67.69,71.59	69.27,71.36	68.95,65.95	68.53,63.09	68.54,60.21
		path	68.26,57.12	67.14,53.92	68.20,49.52
		kill Daggermaw Lashtail##20751+
		collect Raptor Ribs##31670 |n
		'|confirm
]])

---------------------------
---     TBC PRIMALS     ---
---------------------------

ZygorGuidesViewer:RegisterGuide("Profession Guides\\General Farming Guides\\Primal Air",{
	author="support@zygorguides.com",
	description="\nPrimal Air can be gathered from Shadowmoon Valley, Outland.",
	},[[
	step
	label "Start"
		map Shadowmoon Valley/0
		path follow smart; loop off; ants curved; dist 30
		path	55.53,72.49	59.06,69.81	61.40,66.56	62.46,62.66	61.26,59.46
		path	57.67,56.49	59.53,53.73	63.10,55.41	65.02,57.56	65.87,62.28
		path	63.43,60.68
		kill Enraged Air Spirit##21060+
		|tip Follow the path, killing any that you see.
		collect Mote of Air##22572 |n
		|tip Combine 10 Motes of Air into 1 Primal Air.
		'|goto 63.43,60.68 < 30 |c |noway
	step
		map Shadowmoon Valley/0
		path follow smart; loop off; ants curved; dist 30
		path	62.59,62.13	61.28,67.03	59.70,69.75	55.35,71.72
		kill Enraged Air Spirit##21060+
		|tip Follow the path, killing any that you see.
		collect Mote of Air##22572 |n
		|tip Combine 10 Motes of Air into 1 Primal Air.
		'|goto 55.35,71.72 < 30 |c |noway |next "Start"
]])

ZygorGuidesViewer:RegisterGuide("Profession Guides\\General Farming Guides\\Primal Earth",{
	author="support@zygorguides.com",
	description="\nPrimal Earth can be gathered from Nagrand.",
	},[[
	step
	label "Start"
		map Nagrand/0
		path follow smart; loop off; ants curved; dist 30
		path	46.19,77.20	41.98,78.72	40.31,82.83	32.13,80.25	29.34,79.24
		path	28.40,73.85	28.94,66.76	28.17,63.58
		kill Shattered Rumbler##17157+
		|tip Follow the path, killing any that you see.
		collect Mote of Earth##22573 |n
		|tip Combine 10 Motes of Earth into 1 Primal Earth.
		'|goto Nagrand/0 28.17,63.58 < 30 |c |noway
	step
		map Nagrand/0
		path follow smart; loop off; ants curved; dist 30
		path	28.17,63.58	28.94,66.76	28.40,73.85	29.34,79.24	32.13,80.25
		path	40.31,82.83	41.98,78.72	46.19,77.20
		kill Shattered Rumbler##17157+
		|tip Follow the path, killing any that you see.
		collect Mote of Earth##22573 |n
		|tip Combine 10 Motes of Earth into 1 Primal Earth.
		'|goto Nagrand/0 46.19,77.20 < 30 |c |noway |next "Start"
]])

ZygorGuidesViewer:RegisterGuide("Profession Guides\\General Farming Guides\\Primal Fire",{
	author="support@zygorguides.com",
	description="\nPrimal Fire can be gathered from Hellfire Peninsula.",
	},[[
	step
	label "Start"
		map Shadowmoon Valley/0
		path	loop off; ants curved; dist 25 
		path	44.47,46.46	46.81,48.88	48.83,51.69	51.70,52.00
		kill Enraged Fire Spirit##21061+
		collect Mote of Fire##22574 |n
		|tip Combine 10 Motes of Fire into 1 Primal Fire.
		'|goto 51.70,52.00 |noway |c
	step
		kill Enraged Fire Spirit##21061
		map Shadowmoon Valley/0
		path	loop off; ants curved; dist 25 
		path	48.34,46.75	47.93,42.37	49.03,37.97	51.34,36.12	49.04,34.47
		kill Enraged Fire Spirit##21061+
		collect Mote of Fire##22574 |n
		|tip Combine 10 Motes of Fire into 1 Primal Fire.
		'|goto 49.04,34.47 |noway |c |next "Start"
]])

ZygorGuidesViewer:RegisterGuide("Profession Guides\\General Farming Guides\\Primal Life",{
	author="support@zygorguides.com",
	description="\nPrimal Life can be gathered from The Underbog in Outland.",
	},[[
	step
		map Zangarmarsh/0 
		path	follow smart; ants curved; dist 20
		path	82.27,44.23	79.64,39.75	79.46,36.87	81.08,33.72	83.18,34.79
		path	84.92,37.43	85.23,40.76
		Kill Withered enemies around this area
		|tip Use Herbalism on their corpses.
		|tip You can also farm these inside The Underbog dungeon.
		collect Mote of Life##22575 |n
		|tip Combine 10 Motes of Life into one Primal Life.
		'|confirm
]])

ZygorGuidesViewer:RegisterGuide("Profession Guides\\General Farming Guides\\Primal Mana",{
	author="support@zygorguides.com",
	description="\nPrimal Mana can be gathered from the Netherstorm in Outland.",
	},[[
	step
		Kill enemies around this area
		map Netherstorm/0
		path follow smart; loop on; ants curved
		path	55.84,86.20	55.35,87.01	54.65,87.87	54.99,88.71	54.71,89.47
		path	55.95,89.43	57.09,87.92	57.19,86.41
		collect Mote of Mana##22576 |n
		|tip Combine 10 Motes of Mana into one Primal Mana.
		'|confirm
]])

ZygorGuidesViewer:RegisterGuide("Profession Guides\\General Farming Guides\\Primal Shadow",{
	author="support@zygorguides.com",
	description="\nPrimal Shadow can be gathered from Hellfire Peninsula.",
	},[[
	step
	label "Start"
		map Hellfire Peninsula/0
		path follow smart; loop off; ants curved; dist 30
		path	76.12,63.56	77.61,68.71	79.80,79.02
		Kill enemies around this area
		|tip Follow the path, killing any Collapsing Voidwalkers and Vacillating Voidcallers that you see.
		collect Mote of Shadow##22577 |n
		|tip Combine 10 Motes of Shadow into 1 Primal Shadow.
		'|goto 79.80,79.02 < 30 |c |noway
	step
		map Hellfire Peninsula/0
		path follow smart; loop off; ants curved; dist 30
		path	79.80,79.02	77.61,68.71	76.12,63.56
		Kill enemies around this area
		|tip Follow the path, killing any Collapsing Voidwalkers and Vacillating Voidcallers that you see.
		collect Mote of Shadow##22577 |n
		|tip Combine 10 Motes of Shadow into 1 Primal Shadow.
		'|goto 76.12,63.56 < 30 |c |noway |next "Start"
]])

ZygorGuidesViewer:RegisterGuide("Profession Guides\\General Farming Guides\\Primal Water",{
	author="support@zygorguides.com",
	description="\nPrimal Water can be gathered from Black Temple or Skettis, Terrokar Forest.",
	},[[
	--Elemental Plateau
	step
		map Nagrand/0
		path	loop on; dist 25
		path	64.09,18.97	62.65,16.17	60.84,15.07	59.37,14.55
		kill Crashing Wave-Spirit##22309+
		collect Mote of Water##22578 |n
		|tip Combine 10 Motes of Water into 1 Primal Water.
		|tip If you have fishing, you can also gather them from the "Pure Water" pools that spawn around here.
		'|confirm
	//step
	//label "Collect_Mote_Of_Water_Black_Temple"
	//	Kill Aqueous enemies around this area
	//	|tip Kill them up to High Warlord Naj'entus.
	//	|tip DO NOT kill him or the mobs won't respawn on reset.
	//	|tip When finished clearing, zone out and reset the instance.
	//	|tip You can do this by right-clicking your portrait and selecting "Reset all instances."
	//	|tip You can reset up to 10 times per hour.
	//	collect Mote of Water##22578 |n |goto Black Temple/2 0.00,0.00
	//	|tip Combine 10 Motes of Water into 1 Primal Water.
	//	Click Here to Farm in Skettis, Terrokar Forest |confirm
	//step
	//	kill Skettis Surger##21728+
	//	|tip They swim in the water all around this island.
	//	collect Mote of Water##22578 |n |goto Terokkar Forest/0 66.14,77.88
	//	|tip Combine 10 Motes of Water into 1 Primal Water.
		--Click Here to Farm in Black Temple (Best) |confirm |next "Collect_Mote_Of_Water_Black_Temple"
]])

--------------------------
---     TBC MINING     ---
--------------------------

ZygorGuidesViewer:RegisterGuide("Profession Guides\\Mining\\Farming Guides\\Adamantite Ore",{
	author="support@zygorguides.com",
	condition_suggested=function() return skill('Mining') >= 325 end,
	condition_valid=function() return skill('Mining') >= 325 end,
	condition_valid_msg="Your Mining skill must be at least 325 to gather Adamantite Ore.",
	description="Adamantite Ore can be gathered in Nagrand.",
	},[[
	step
		map Nagrand/0
		path follow smart; loop on; ants curved; dist 30
		path	49.90,71.01	48.62,71.28	48.51,75.60	46.76,77.91	42.77,74.39
		path	42.08,76.76	41.94,80.24	41.11,84.55	38.45,83.23	36.21,82.30
		path	33.57,82.12	31.13,80.54	28.19,78.49	27.67,72.30	28.58,69.31
		path	28.20,63.62	27.06,62.92	26.75,57.07	23.44,56.18	20.07,55.07
		path	19.35,47.46	20.31,41.40	21.27,38.46	23.05,33.49	26.76,32.99
		path	31.77,28.76	31.71,24.26	30.40,20.66	35.78,15.50	36.87,18.62
		path	39.06,20.24	41.69,21.71	42.81,19.43	50.53,20.11	54.00,21.00
		path	56.63,24.36	60.66,33.11	64.21,35.14	66.06,36.31	66.14,32.27
		path	67.70,35.36	70.24,37.57	74.08,37.81	72.33,43.08	73.43,46.30
		path	73.01,50.47	72.77,56.93	74.94,58.55	71.99,61.95	72.67,64.73
		path	72.21,67.00	71.71,71.30	72.96,76.49	70.91,75.13	68.49,75.92
		path	66.66,79.00	63.17,76.97	61.93,79.13	58.74,80.27	56.19,79.78
		path	54.59,81.99	51.75,79.79	49.42,82.67	47.62,81.24	48.39,79.11
		click Adamantite Deposit##181556+
		|tip They look like light blue mineral clusters around this path.
		click Rich Adamantite Deposit##181569+
		|tip They look like dark blue mineral clusters around this path.
		|tip Enter caves along the path.
		|tip Make sure you enable "Find Minerals" in the tracking menu on the minimap.
		collect Adamantite Ore##23425 |n
		'|confirm
]])

ZygorGuidesViewer:RegisterGuide("Profession Guides\\Mining\\Farming Guides\\Fel Iron Ore",{
	author="support@zygorguides.com",
	condition_suggested=function() return skill('Mining') >= 300 end,
	condition_valid=function() return skill('Mining') >= 300 end,
	condition_valid_msg="Your Mining skill must be at least 300 to gather Fel Iron Ore.",
	description="Fel Iron Ore can be gathered in Hellfire Penninsula.",
	},[[
	step
		map Hellfire Peninsula/0
		path follow smart; loop on; ants curved; dist 30
		path	61.18,53.16	59.42,53.54	56.91,53.92	54.90,54.86	53.18,55.25
		path	51.34,55.20	49.90,55.60	49.04,57.45	50.16,60.83	49.02,60.92
		path	47.44,58.77	46.76,60.05	46.20,62.02	47.37,63.98	47.83,65.81
		path	47.16,66.47	45.79,66.60	44.21,65.76	41.71,62.02	40.00,64.07
		path	39.07,67.14	37.06,68.58	35.58,67.87	34.61,66.03	35.33,62.85
		path	35.81,58.67	35.29,58.94	32.35,61.33	30.85,59.67	29.71,63.05
		path	29.26,65.43	27.21,66.94	27.80,69.02	30.66,71.05	30.28,73.48
		path	29.34,78.32	28.78,80.65	26.73,79.28	25.47,77.69	25.43,73.63
		path	26.11,68.83	23.56,68.58	22.88,67.22	23.04,64.10	23.13,61.46
		path	23.99,59.63	25.37,57.94	26.67,56.30	28.01,52.46	26.17,52.80
		path	22.27,53.94	20.01,54.64	18.67,53.50	17.72,54.20	16.52,56.20
		path	16.24,60.79	15.43,63.53	13.94,63.05	12.48,60.03	11.43,57.48
		path	9.19,53.83	7.40,50.44	8.67,48.71	11.35,46.39	11.48,40.72
		path	11.84,36.43	12.94,35.24	15.02,37.15	18.23,39.09	18.73,43.72
		path	20.37,43.29	22.88,44.31	25.01,44.71	26.26,42.90	27.05,39.10
		path	27.99,35.60	30.10,33.23	32.56,33.16	34.21,32.05	34.96,28.98
		path	36.33,30.40	34.65,39.54	34.51,46.14	35.32,48.06	38.11,52.58
		path	39.16,52.09	40.60,52.56	42.91,54.76	45.15,55.66	46.32,54.44
		path	46.57,52.82	45.70,51.11	43.85,48.65	41.20,45.62	38.61,43.47
		path	38.32,39.65	39.38,34.88	39.54,31.73	39.45,28.32	41.05,28.70
		path	44.26,31.10	47.36,29.11	49.58,28.68	52.45,22.67	53.60,25.94
		path	55.01,30.04	52.77,31.72	47.83,36.33	46.62,44.84	50.12,49.28
		path	54.39,48.02	62.02,47.32
		click Fel Iron Deposit##181555+
		|tip They look like green mineral clusters around this path.
		|tip Enter caves along the path.
		|tip Make sure you enable "Find Minerals" in the tracking menu on the minimap.
		collect Fel Iron Ore##23424 |n
		'|confirm
]])

ZygorGuidesViewer:RegisterGuide("Profession Guides\\Mining\\Farming Guides\\Khorium Ore",{
	author="support@zygorguides.com",
	condition_suggested=function() return skill('Mining') >= 375 end,
	condition_valid=function() return skill('Mining') >= 375 end,
	condition_valid_msg="Your Mining skill must be at least 375 to gather Khorium Ore.",
	description="Khorium Ore can be gathered in Nagrand.",
	},[[
	step
		map Nagrand/0
		path follow smart; loop on; ants curved; dist 30
		path	49.90,71.01	48.62,71.28	48.51,75.60	46.76,77.91	42.77,74.39
		path	42.08,76.76	41.94,80.24	41.11,84.55	38.45,83.23	36.21,82.30
		path	33.57,82.12	31.13,80.54	28.19,78.49	27.67,72.30	28.58,69.31
		path	28.20,63.62	27.06,62.92	26.75,57.07	23.44,56.18	20.07,55.07
		path	19.35,47.46	20.31,41.40	21.27,38.46	23.05,33.49	26.76,32.99
		path	31.77,28.76	31.71,24.26	30.40,20.66	35.78,15.50	36.87,18.62
		path	39.06,20.24	41.69,21.71	42.81,19.43	50.53,20.11	54.00,21.00
		path	56.63,24.36	60.66,33.11	64.21,35.14	66.06,36.31	66.14,32.27
		path	67.70,35.36	70.24,37.57	74.08,37.81	72.33,43.08	73.43,46.30
		path	73.01,50.47	72.77,56.93	74.94,58.55	71.99,61.95	72.67,64.73
		path	72.21,67.00	71.71,71.30	72.96,76.49	70.91,75.13	68.49,75.92
		path	66.66,79.00	63.17,76.97	61.93,79.13	58.74,80.27	56.19,79.78
		path	54.59,81.99	51.75,79.79	49.42,82.67	47.62,81.24	48.39,79.11
		click Khorium Vein##181557+
		|tip They look like dark purple mineral clusters around this path.
		|tip Mine all veins you encounter so they might respawn as Korium Veins.
		|tip Make sure you enable "Find Minerals" in the tracking menu on the minimap.
		collect Khorium Ore##23426 |n
		'|confirm
]])

---------------------------------
---     TBC JEWELCRAFTING     ---
---------------------------------

ZygorGuidesViewer:RegisterGuide("Profession Guides\\Jewelcrafting\\Farming Guides\\Shadow Pearl",{
	author="support@zygorguides.com",
	description="Shadow Pearls can be gathered in Shadowmoon Valley.",
	},[[
	step
		Kill Bloodscale enemies around this area
		use the Jaggal Clam##24476+
		collect Shadow Pearl##24479 |n |goto Zangarmarsh/0 27.67,41.93
		|tip These have a very low drop rate.
		You can find more around: |notinsticky
		[26.26,46.37]
		[25.96,42.41]
		[25.01,38.06]
		'|confirm
]])

----------------------------------
---     TBC LEATHERWORKING     ---
----------------------------------

ZygorGuidesViewer:RegisterGuide("Profession Guides\\Leatherworking\\Farming Guides\\Knothide Leather",{
	author="support@zygorguides.com",
	condition_suggested=function() return skill('Skinning') >= 335 end,
	condition_valid=function() return skill('Skinning') >= 335 end,
	condition_valid_msg="Your Skinning skill must be at least 335 to gather Knothide Leather.",
	description="Knothide Leather can be gathered in Netherstorm.",
	},[[
	step
		map Netherstorm/0
		path follow smart; loop on; ants curved; dist 30
		path	43.61,57.06	45.22,57.65	47.41,56.58	48.25,54.31	48.18,51.86
		path	46.52,51.17	45.58,49.75	43.63,50.57	43.29,52.27	43.66,54.99
		path	44.85,56.21
		Kill enemies around this area
		|tip Only Beast enemies will be skinnable.
		|tip Skin their corpses.
		collect Knothide Leather##21887 |n
		'|confirm
]])

ZygorGuidesViewer:RegisterGuide("Profession Guides\\Leatherworking\\Farming Guides\\Thick Clefthoof Leather",{
	author="support@zygorguides.com",
	condition_suggested=function() return skill('Skinning') >= 310 end,
	condition_valid=function() return skill('Skinning') >= 310 end,
	condition_valid_msg="Your Skinning skill must be at least 335 to gather Thick Clefthoof Leather.",
	description="Thick Clefthoof Leather can be gathered in Nagrand.",
	},[[
	step
		map Nagrand/0
		path follow smart; loop on; ants curved; dist 30
		path	44.28,26.55	43.25,29.59	45.88,33.29	47.54,38.47	50.14,51.61
		path	52.51,54.52	54.09,50.75	54.25,48.06	55.98,45.01	51.01,39.01
		path	50.63,31.76	46.12,27.60
		Kill Clefthoof enemies around this area
		|tip Skin their corpses.
		collect Thick Clefthoof Leather##25708 |n
		'|confirm
]])

ZygorGuidesViewer:RegisterGuide("Profession Guides\\Leatherworking\\Farming Guides\\Fel Hide",{
	author="support@zygorguides.com",
	condition_suggested=function() return skill('Skinning') >= 335 end,
	condition_valid=function() return skill('Skinning') >= 335 end,
	condition_valid_msg="Your Skinning skill must be at least 335 to gather Fel Hide.",
	description="Fel Hide can be gathered in Netherstorm.",
	},[[
	step
		map Netherstorm/0
		path follow smart; loop on; ants curved; dist 30
		path	55.33,60.50	58.09,60.46	58.98,58.47	61.66,59.15	63.22,59.54
		path	65.48,61.63	66.93,63.05	63.63,64.45	61.98,62.72
		kill Warp Chaser##18884+
		|tip Skin their corpses.
		collect Fel Hide##25707 |n
		|tip They have a low drop rate.
		'|confirm
]])

ZygorGuidesViewer:RegisterGuide("Profession Guides\\Leatherworking\\Farming Guides\\Fel Scales",{
	author="support@zygorguides.com",
	condition_suggested=function() return skill('Skinning') >= 295 end,
	condition_valid=function() return skill('Skinning') >= 295 end,
	condition_valid_msg="Your Skinning skill must be at least 295 to gather Fel Scales.",
	description="Fel Scales can be gathered in Hellfire Peninsula.",
	},[[
	step
	label "Begin_Farming_Fel_Scales"
		map Hellfire Peninsula/0
		path follow smart; loop on; ants curved; dist 30
		path	11.99,54.70	11.02,54.63	10.11,53.01	9.12,51.76	7.40,49.89
		path	7.82,49.71	8.95,49.91	9.61,49.40	11.37,48.08	12.38,47.51
		path	11.70,51.10	12.48,51.64	12.89,53.00
		Kill Razorfang, Thornfang, and Quillfang enemies along the path
		|tip Skin their corpses.
		collect Fel Scales##25700 |n
		|tip They have a low drop rate.
		'|goto 12.89,53.00 < 25 |c |noway
	step
		map Hellfire Peninsula/0
		path follow smart; loop off; ants curved; dist 30
		path	22.12,60.36	22.60,61.73	22.21,63.14	21.82,64.65	22.25,66.44
		path	22.56,67.91	22.79,69.19	24.04,69.01
		Kill Razorfang, Thornfang, and Quillfang enemies along the path
		|tip Skin their corpses.
		collect Fel Scales##25700 |n
		|tip They have a low drop rate.
		'|goto 24.04,69.01 < 25 |c |noway
	step
		map Hellfire Peninsula/0
		path follow smart; loop off; ants curved; dist 30
		path	32.45,91.83	33.79,91.14	34.99,90.66	36.06,90.40	37.14,89.48
		path	38.07,88.64	39.28,87.54	40.25,85.99	41.32,84.26	42.22,83.00
		Kill Razorfang, Thornfang, and Quillfang enemies along the path
		|tip Skin their corpses.
		collect Fel Scales##25700 |n
		|tip They have a low drop rate.
		'|goto 42.22,83.00 < 25 |c |noway |next "Begin_Farming_Fel_Scales"
]])

ZygorGuidesViewer:RegisterGuide("Profession Guides\\Leatherworking\\Farming Guides\\Nether Dragonscale",{
	author="support@zygorguides.com",
	condition_suggested=function() return skill('Skinning') >= 330 end,
	condition_valid=function() return skill('Skinning') >= 330 end,
	condition_valid_msg="Your Skinning skill must be at least 330 to gather Nether Dragonscales.",
	description="Nether Dragonscales can be gathered in Blade's Edge Mountains.",
	},[[
	step
		map Blade's Edge Mountains/0
		path follow smart; loop on; ants curved; dist 30
		path	60.26,73.31	60.57,74.53	61.37,75.60	62.11,76.26	62.42,76.84
		path	62.96,76.79	63.12,76.30	63.59,76.03	64.01,76.05	64.34,75.75
		path	64.86,75.75	65.24,75.75	65.91,75.52	66.63,75.09	67.21,74.57
		path	68.26,75.98	67.85,76.60	67.08,76.99	66.34,77.52	65.61,77.93
		path	64.80,77.96	64.18,77.82	63.42,78.28	62.54,78.67	61.76,78.97
		path	60.85,79.22	60.31,79.29	59.99,78.45	59.61,77.13	59.15,76.20
		path	58.91,75.00	58.97,71.42
		Kill Nether enemies around this area
		|tip Skin their corpses.
		collect Nether Dragonscale##29548 |n
		|tip They have a low drop rate.
		'|confirm
]])

ZygorGuidesViewer:RegisterGuide("Profession Guides\\Leatherworking\\Farming Guides\\Wind Scales",{
	author="support@zygorguides.com",
	condition_suggested=function() return skill('Skinning') >= 335 end,
	condition_valid=function() return skill('Skinning') >= 335 end,
	condition_valid_msg="Your Skinning skill must be at least 335 to gather Wind Scales.",
	description="Wind Scales can be gathered in Shadowmoon Valley.",
	},[[
	step
		map Shadowmoon Valley/0
		path follow smart; loop on; ants curved; dist 30
		path	51.41,60.67	50.94,61.54	50.01,62.38	49.05,64.07	48.50,65.32
		path	48.15,66.69	47.98,68.01	47.43,68.53	46.59,69.02	46.56,70.31
		path	45.98,71.11	45.27,70.66	44.57,70.08	44.10,69.14	44.12,67.74
		path	44.36,66.30	44.94,64.50	45.93,64.34	46.68,63.83	47.50,63.16
		path	48.16,62.04	48.59,61.00	50.07,59.97
		kill Eclipsion Dragonhawk##20502+
		|tip Skin their corpses.
		collect Wind Scales##29547 |n
		|tip They have a low drop rate.
		'|confirm
]])

ZygorGuidesViewer:RegisterGuide("Profession Guides\\Leatherworking\\Farming Guides\\Cobra Scales",{
	author="support@zygorguides.com",
	condition_suggested=function() return skill('Skinning') >= 345 end,
	condition_valid=function() return skill('Skinning') >= 345 end,
	condition_valid_msg="Your Skinning skill must be at least 345 to gather Cobra Scales.",
	description="Cobra Scales can be gathered in Nagrand.",
	},[[
	step
	label "Start_Farming_Cobra_Scales"
		map Nagrand/0
		path follow smart; loop on; ants curved; dist 30
		path	18.01,38.64	19.04,37.86	19.06,36.64	19.25,35.69	20.02,35.31
		path	19.99,34.69	19.56,33.70	18.80,33.09	17.97,33.44	17.51,34.01
		path	15.63,34.46	14.73,34.52	14.03,35.10	13.33,35.70	12.49,36.56
		path	12.49,37.51	11.91,39.12	11.00,40.08	10.15,40.92	9.39,41.92
		path	8.71,42.91
		kill Twilight Serpent##23026+
		|tip Skin their corpses.
		|tip Avoid elite enemies along the path.
		collect Cobra Scales##29539 |n
		|tip They have a low drop rate.
		'|goto 8.71,42.91 < 30 |c |noway
	step
		map Nagrand/0
		path follow smart; loop on; ants curved; dist 30
		path	8.71,42.91	9.39,41.92	10.15,40.92	11.00,40.08	11.91,39.12
		path	12.49,37.51	12.49,36.56	13.33,35.70	14.03,35.10	14.73,34.52
		path	15.63,34.46	17.51,34.01	17.97,33.44	18.80,33.09	19.56,33.70
		path	19.99,34.69	20.02,35.31	19.25,35.69	19.06,36.64	19.04,37.86
		path	18.01,38.64
		kill Twilight Serpent##23026+
		|tip Skin their corpses.
		|tip Avoid elite enemies along the path.
		collect Cobra Scales##29539 |n
		|tip They have a low drop rate.
		'|goto 18.01,38.64 < 30 |c |noway |next "Start_Farming_Cobra_Scales"
]])







-----------------------------
---     TBC TAILORING     ---
-----------------------------

ZygorGuidesViewer:RegisterGuide("Profession Guides\\Tailoring\\Farming Guides\\Netherweave Cloth",{
	author="support@zygorguides.com",
	description="\nGather Netherweave Cloth in Shadowmoon Valley.",
	},[[
	step
	label "Legion_Hold"
		map Shadowmoon Valley/0
		path follow smart; loop on; ants curved; dist 20
		path	51.1,58.8	53.0,59.3	53.2,60.5	52.8,63.2	52.8,65.4
		path	52.9,69.0	52.5,71.8	47.3,71.1	45.8,71.3	45.2,69.2
		path	45.6,66.1	48.0,67.2
		Kill enemies around this area
		collect Netherweave Cloth##21877 |n
		Click Here to Continue |confirm
	step
	
		map Shadowmoon Valley/0
		path follow smart; loop on; ants curved; dist 20
		path	23.9,41.3	22.6,40.1	22.3,38.4	22.1,37.1	20.7,38.0
		path	20.8,36.2	21.8,34.2	22.7,31.2	23.7,31.1	24.9,32.3
		path	26.0,33.3	25.1,34.6	26.2,36.1	25.1,38.1	24.9,39.8
		Kill enemies around this area
		collect Netherweave Cloth##21877 |n
		Click Here to Continue |confirm |next "Legion_Hold"
]])

ZygorGuidesViewer:RegisterGuide("Profession Guides\\Tailoring\\Farming Guides\\Netherweb Spider Silk",{
	author="support@zygorguides.com",
	description="\nGather Netherweave Cloth in Shadowmoon Valley.",
	},[[
	step
		Kill Dreadfang enemies around this area
		collect Netherweb Spider Silk##21881 |n |goto Terokkar Forest/0 53.64,57.86
		You can find more around here [52.22,78.65]
]])

---------------------------
---     TBC FISHING     ---
---------------------------

ZygorGuidesViewer:RegisterGuide("Profession Guides\\Fishing\\Farming Guides\\Barbed Gill Trout",{
	author="support@zygorguides.com",
	condition_suggested=function() return skill('Fishing') >= 305 end,
	condition_valid=function() return skill('Fishing') >= 305 end,
	condition_valid_msg="Your Fishing skill must be at least 305 to fish Barbed Gill Trout.",
	description="Barbed Gill Trout can be fished in Zangarmarsh.",
	},[[
	step
		Equip a Fishing Pole |equipped Fishing Pole##6256
		|tip A Fishing Pole can be purchased near most Fishing profession trainers.
		'|equipped Strong Fishing Pole##6365 |or
		'|equipped Blump Family Fishing Pole##12225 |or
		'|equipped Arcanite Fishing Pole##19970 |or
		'|equipped Darkwood Fishing Pole##6366 |or
		'|equipped Big Iron Fishing Pole##6367 |or
		'|equipped Nat Pagle's Extreme Angler FC-5000##19022 |or
		'|equipped Seth's Graphite Fishing Pole##25978 |or
	step
		cast Fishing##33095
		|tip Fish in the water.
		|tip You must have a Fishing Pole equipped to fish.
		|tip A Fishing Pole can be purchased near most Fishing profession trainers.
		collect Barbed Gill Trout##27422 |goto Zangarmarsh/0 78.95,71.48 |n
		'|confirm
]])

ZygorGuidesViewer:RegisterGuide("Profession Guides\\Fishing\\Farming Guides\\Spotted Feltail",{
	author="support@zygorguides.com",
	condition_suggested=function() return skill('Fishing') >= 305 end,
	condition_valid=function() return skill('Fishing') >= 305 end,
	condition_valid_msg="Your Fishing skill must be at least 305 to fish Spotted Feltail.",
	description="Spotted Feltail can be fished in Zangarmarsh.",
	},[[
	step
		Equip a Fishing Pole |equipped Fishing Pole##6256
		|tip A Fishing Pole can be purchased near most Fishing profession trainers.
		'|equipped Strong Fishing Pole##6365 |or
		'|equipped Blump Family Fishing Pole##12225 |or
		'|equipped Arcanite Fishing Pole##19970 |or
		'|equipped Darkwood Fishing Pole##6366 |or
		'|equipped Big Iron Fishing Pole##6367 |or
		'|equipped Nat Pagle's Extreme Angler FC-5000##19022 |or
		'|equipped Seth's Graphite Fishing Pole##25978 |or
	step
		cast Fishing##33095
		|tip Fish in the water.
		|tip You must have a Fishing Pole equipped to fish.
		|tip A Fishing Pole can be purchased near most Fishing profession trainers.
		collect Spotted Feltail##27425 |goto Zangarmarsh/0 78.95,71.48 |n
		'|confirm
]])

ZygorGuidesViewer:RegisterGuide("Profession Guides\\Fishing\\Farming Guides\\Zangarian Sporefish",{
	author="support@zygorguides.com",
	condition_suggested=function() return skill('Fishing') >= 305 end,
	condition_valid=function() return skill('Fishing') >= 305 end,
	condition_valid_msg="Your Fishing skill must be at least 305 to fish Zangarian Sporefish.",
	description="Zangarian Sporefish can be fished in Nagrand.",
	},[[
	step
		Equip a Fishing Pole |equipped Fishing Pole##6256
		|tip A Fishing Pole can be purchased near most Fishing profession trainers.
		'|equipped Strong Fishing Pole##6365 |or
		'|equipped Blump Family Fishing Pole##12225 |or
		'|equipped Arcanite Fishing Pole##19970 |or
		'|equipped Darkwood Fishing Pole##6366 |or
		'|equipped Big Iron Fishing Pole##6367 |or
		'|equipped Nat Pagle's Extreme Angler FC-5000##19022 |or
		'|equipped Seth's Graphite Fishing Pole##25978 |or
	step
		cast Fishing##33095
		|tip Fish in the water.
		|tip You must have a Fishing Pole equipped to fish.
		|tip A Fishing Pole can be purchased near most Fishing profession trainers.
		collect Zangarian Sporefish##27429 |goto Zangarmarsh/0 78.95,71.48 |n
		'|confirm
]])

ZygorGuidesViewer:RegisterGuide("Profession Guides\\Fishing\\Farming Guides\\Furious Crawdad",{
	author="support@zygorguides.com",
	condition_suggested=function() return skill('Fishing') >= 430 end,
	condition_valid=function() return skill('Fishing') >= 430 end,
	condition_valid_msg="Your Fishing skill must be at least 430 to fish Furious Crawdad.",
	description="Furious Crawdad can be fished in Terokkar Forest from Highland Mixed Schools.",
	},[[
	step
		Equip a Fishing Pole |equipped Fishing Pole##6256
		|tip A Fishing Pole can be purchased near most Fishing profession trainers.
		'|equipped Strong Fishing Pole##6365 |or
		'|equipped Blump Family Fishing Pole##12225 |or
		'|equipped Arcanite Fishing Pole##19970 |or
		'|equipped Darkwood Fishing Pole##6366 |or
		'|equipped Big Iron Fishing Pole##6367 |or
		'|equipped Nat Pagle's Extreme Angler FC-5000##19022 |or
		'|equipped Seth's Graphite Fishing Pole##25978 |or
	step
	label "Start_Farming_Furious_Crawdad"
		map Terokkar Forest/0
		path follow smart; loop off; ants curved; dist 30
		path	45.14,40.51	47.04,40.58	48.00,40.31	49.49,38.17	53.27,41.35
		path	55.55,45.31	58.31,48.49	60.07,49.77	61.32,54.09	60.24,58.34
		path	59.59,60.78	59.18,63.24	60.50,68.35	61.30,71.46	62.40,71.65
		path	63.49,73.35	63.38,75.85	63.64,78.75	64.59,82.30	66.72,83.02
		path	68.04,82.73	68.64,80.39	68.11,77.15	66.71,74.38
		cast Fishing##33095
		|tip Fish in Highland Mixed Schools.
		|tip You must have a Fishing Pole equipped to fish.
		|tip A Fishing Pole can be purchased near most Fishing profession trainers.
		|tip When flying near Stonebreaker Hold, don't get too close or you will be shot down. |only if Alliance
		|tip When flying near Allerian Stronghold, don't get too close or you will be shot down. |only if Horde
		collect Furious Crawdad##27439 |n
		'|goto 66.71,74.38 < 30 |c |noway
	step
		map Terokkar Forest/0
		path follow smart; loop off; ants curved; dist 30
		path	66.71,74.38	68.11,77.15	68.64,80.39	68.04,82.73	66.72,83.02
		path	64.59,82.30	63.64,78.75	63.38,75.85	63.49,73.35	62.40,71.65
		path	61.30,71.46	60.50,68.35	59.18,63.24	59.59,60.78	60.24,58.34
		path	61.32,54.09	60.07,49.77	58.31,48.49	55.55,45.31	53.27,41.35
		path	49.49,38.17	48.00,40.31	47.04,40.58	45.14,40.51
		cast Fishing##33095
		|tip Fish in Highland Mixed Schools.
		|tip You must have a Fishing Pole equipped to fish.
		|tip A Fishing Pole can be purchased near most Fishing profession trainers.
		|tip When flying near Stonebreaker Hold, don't get too close or you will be shot down. |only if Alliance
		|tip When flying near Allerian Stronghold, don't get too close or you will be shot down. |only if Horde
		collect Furious Crawdad##27439 |n
		'|goto 45.14,40.51 < 30 |c |noway |next "Start_Farming_Furious_Crawdad"
]])

ZygorGuidesViewer:RegisterGuide("Profession Guides\\Fishing\\Farming Guides\\Bloodfin Catfish",{
	author="support@zygorguides.com",
	condition_suggested=function() return skill('Fishing') >= 300 end,
	condition_valid=function() return skill('Fishing') >= 300 end,
	condition_valid_msg="Your Fishing skill must be at least 300 to fish Bloodfin Catfish.",
	description="Bloodfin Catfish can be fished in Deadwind Pass.",
	},[[
	step
		Equip a Fishing Pole |equipped Fishing Pole##6256
		|tip A Fishing Pole can be purchased near most Fishing profession trainers.
		'|equipped Strong Fishing Pole##6365 |or
		'|equipped Blump Family Fishing Pole##12225 |or
		'|equipped Arcanite Fishing Pole##19970 |or
		'|equipped Darkwood Fishing Pole##6366 |or
		'|equipped Big Iron Fishing Pole##6367 |or
		'|equipped Nat Pagle's Extreme Angler FC-5000##19022 |or
		'|equipped Seth's Graphite Fishing Pole##25978 |or
	step
		cast Fishing##33095
		|tip Fish in the water.
		|tip You must have a Fishing Pole equipped to fish.
		|tip A Fishing Pole can be purchased near most Fishing profession trainers.
		collect Bloodfin Catfish##33823 |goto Deadwind Pass/0 52.79,73.82 |n
		'|confirm
]])

ZygorGuidesViewer:RegisterGuide("Profession Guides\\Fishing\\Farming Guides\\Crescent-Tail Skullfish",{
	author="support@zygorguides.com",
	condition_suggested=function() return skill('Fishing') >= 300 end,
	condition_valid=function() return skill('Fishing') >= 300 end,
	condition_valid_msg="Your Fishing skill must be at least 300 to fish Crescent-Tail Skullfish.",
	description="Crescent-Tail Skullfish can be fished in Deadwind Pass.",
	},[[
	step
		Equip a Fishing Pole |equipped Fishing Pole##6256
		|tip A Fishing Pole can be purchased near most Fishing profession trainers.
		'|equipped Strong Fishing Pole##6365 |or
		'|equipped Blump Family Fishing Pole##12225 |or
		'|equipped Arcanite Fishing Pole##19970 |or
		'|equipped Darkwood Fishing Pole##6366 |or
		'|equipped Big Iron Fishing Pole##6367 |or
		'|equipped Nat Pagle's Extreme Angler FC-5000##19022 |or
		'|equipped Seth's Graphite Fishing Pole##25978 |or
	step
		cast Fishing##33095
		|tip Fish in the water.
		|tip You must have a Fishing Pole equipped to fish.
		|tip A Fishing Pole can be purchased near most Fishing profession trainers.
		collect Crescent-Tail Skullfish##33824 |goto Deadwind Pass/0 52.79,73.82 |n
		'|confirm
]])

---------------------------
---     TBC COOKING     ---
---------------------------

ZygorGuidesViewer:RegisterGuide("Profession Guides\\Cooking\\Farming Guides\\Bat Flesh",{
	author="support@zygorguides.com",
	condition_suggested=function() return skill('Cooking') >= 325 end,
	description="Bat Flesh can be farmed in Ghostlands.",
	},[[
	step
		map Ghostlands/0
		path follow smart; loop on; ants curved; dist 30
		path	40.53,66.35	40.83,70.18	40.57,72.68	38.84,72.10	37.18,69.79
		path	34.71,68.90	33.08,66.46	32.19,64.27	34.19,62.61	33.92,58.51
		path	31.76,53.44	29.94,52.32	29.11,52.58	28.13,52.99	26.72,52.73
		path	25.32,51.78	24.85,49.40	25.12,46.91	24.62,44.93	24.38,43.25
		path	24.48,41.68	24.29,39.91	25.65,39.62	27.34,38.74	27.99,39.65
		path	28.81,41.11	29.73,39.07	30.40,36.94	31.25,36.31	32.28,38.14
		path	33.83,38.87	35.33,40.52	37.74,41.01	40.04,41.51	41.88,41.97
		path	43.87,43.04	45.57,44.20	45.96,45.70	45.18,47.38	44.27,50.14
		path	44.68,51.59	43.91,55.55	43.46,58.84	43.22,62.21	42.62,65.23
		Kill Bat enemies along the path
		collect Bat Flesh##27669 |n
		'|confirm
]])

ZygorGuidesViewer:RegisterGuide("Profession Guides\\Cooking\\Farming Guides\\Bear Flank",{
	author="support@zygorguides.com",
	condition_suggested=function() return skill('Cooking') >= 325 end,
	description="Bear Flank can be farmed in Nagrand.",
	},[[
	step
		map Western Plaguelands/0
		path follow smart; loop on; ants curved; dist 30
		path	36.80,66.75	35.58,66.64	34.26,65.87	33.43,64.40	32.63,62.94
		path	31.98,62.09	30.91,61.07	30.26,59.86	30.13,58.83	30.62,57.41
		path	31.20,56.87	32.04,57.09	32.93,57.52	33.71,58.12	34.33,59.41
		path	34.32,60.78	34.13,61.80	34.90,62.71	35.63,63.27	36.53,64.01
		path	37.07,64.94	37.16,66.00	36.78,67.39	36.27,67.25	35.42,66.33
		Kill Black Bear enemies around this area
		collect Bear Flank##35562 |n
		'|confirm
]])

ZygorGuidesViewer:RegisterGuide("Profession Guides\\Cooking\\Farming Guides\\Buzzard Meat",{
	author="support@zygorguides.com",
	condition_suggested=function() return skill('Cooking') >= 325 end,
	description="Buzzard Meat can be farmed in Nagrand.",
	},[[
	step
		Kill Bonestripper enemies around this area
		collect Buzzard Meat##27671 |goto Hellfire Peninsula/0 61.91,67.95 |n
		You can find more around:
		[29.16,54.47]
		[20.70,52.31]
		[24.86,45.43]
		[31.72,35.43]
		'|confirm
]])

ZygorGuidesViewer:RegisterGuide("Profession Guides\\Cooking\\Farming Guides\\Chunk o' Basilisk",{
	author="support@zygorguides.com",
	condition_suggested=function() return skill('Cooking') >= 325 end,
	description="Chunk o' Basilisk can be farmed in Zangarmarsh.",
	},[[
	step
	label "Start_Farming_Chunk_o_Basilisk"
		map Zangarmarsh/0
		path follow smart; loop on; ants curved; dist 30
		path	74.34,28.90	76.41,29.92	78.43,29.84	80.62,29.39	82.47,28.94
		path	84.11,28.57	85.76,28.36	87.19,27.88	87.92,29.78	87.92,33.15
		path	88.03,36.74
		Kill Marshrock enemies around this area
		collect Chunk o' Basilisk##27677 |n
		'|goto 88.03,36.74 < 30 |c |noway
	step
		map Zangarmarsh/0
		path follow smart; loop on; ants curved; dist 30
		path	88.03,36.74	87.92,33.15	87.92,29.78	87.19,27.88	85.76,28.36
		path	84.11,28.57	82.47,28.94	80.62,29.39	78.43,29.84	76.41,29.92
		path	74.34,28.90
		Kill Marshrock enemies around this area
		collect Chunk o' Basilisk##27677 |n
		'|goto 74.34,28.90 < 30 |c |noway |next "Start_Farming_Chunk_o_Basilisk"
]])

ZygorGuidesViewer:RegisterGuide("Profession Guides\\Cooking\\Farming Guides\\Clefthoof Meat",{
	author="support@zygorguides.com",
	condition_suggested=function() return skill('Cooking') >= 325 end,
	description="Clefthoof Meat can be farmed in Nagrand.",
	},[[
	step
		map Nagrand/0
		path follow smart; loop on; ants curved; dist 30
		path	58.45,67.47	59.46,65.82	59.28,64.08	58.44,62.74	58.67,61.45
		path	59.38,59.90	60.48,59.79	62.75,57.86	61.61,56.14	61.66,52.97
		path	60.11,50.39	60.05,49.15	60.95,47.36	62.22,43.24	62.00,41.81
		path	61.69,39.46	64.80,41.04	66.76,40.95	68.57,40.24	70.65,40.99
		path	71.34,41.19	72.39,41.99	72.38,43.99	71.76,44.60	71.09,45.01
		path	70.33,46.05	70.04,47.30	69.80,48.58	69.83,49.92	69.28,51.30
		path	69.39,53.83	69.19,55.50	69.64,57.19	70.39,58.90	70.22,61.14
		path	69.42,62.04	68.09,61.87	66.96,62.66	66.80,63.77	67.01,64.56
		path	67.27,67.06	67.34,69.40	67.04,70.88	66.79,72.54	66.80,73.78
		path	66.50,75.31	65.60,75.46	64.52,75.39	63.35,74.82	62.19,74.59
		path	61.40,74.21	60.51,72.36	59.17,71.67	58.46,69.38
		Kill Clefthoof enemies around this area
		collect Clefthoof Meat##27678 |n
		'|confirm
]])

ZygorGuidesViewer:RegisterGuide("Profession Guides\\Cooking\\Farming Guides\\Jaggal Clam Meat",{
	author="support@zygorguides.com",
	condition_suggested=function() return skill('Cooking') >= 325 end,
	description="Jaggal Clam Meat can be farmed in Zangarmarsh.",
	},[[
	step
		Kill Bloodscale enemies around this area
		collect Jaggal Clam##24476 |n
		|tip The best place for these is farming The Slave Pens dungeon.
		use Jaggal Clam##24476
		collect Jaggal Clam Meat##24477 |goto Zangarmarsh/0 26.92,39.35 |n
		'|confirm
]])

ZygorGuidesViewer:RegisterGuide("Profession Guides\\Cooking\\Farming Guides\\Raptor Ribs",{
	author="support@zygorguides.com",
	condition_suggested=function() return skill('Cooking') >= 325 end,
	description="Raptor Ribs can be farmed in Blade's Edge Mountains.",
	},[[
	step
	label "Start_Farming_Raptor_Ribs"
		map Blade's Edge Mountains/0
		path follow smart; loop off; ants curved; dist 30
		path	75.24,23.15	73.88,24.99	73.46,26.32	72.65,27.28	71.85,29.01
		path	71.31,31.09	71.04,33.60	71.15,35.63	71.35,37.49	71.18,40.71
		path	70.78,43.76	69.47,45.25	68.05,47.25	67.84,47.58	66.49,49.20
		path	64.96,50.60	63.68,51.31	63.78,52.45	64.64,54.36	65.43,55.15
		path	66.46,56.39	67.08,57.74	67.78,59.22	68.25,61.91	68.35,63.37
		path	68.81,64.87	68.53,65.95	68.51,69.49
		Kill Daggermaw and Lashtail enemies around this area
		collect Raptor Ribs##31670 |n
		'|goto Blade's Edge Mountains/0 68.51,69.49 < 30 |c |noway
	step
		map Blade's Edge Mountains/0
		path follow smart; loop off; ants curved; dist 30
		path	68.51,69.49	68.53,65.95	68.81,64.87	68.35,63.37	68.25,61.91
		path	67.78,59.22	67.08,57.74	66.46,56.39	65.43,55.15	64.64,54.36
		path	63.78,52.45	63.68,51.31	64.96,50.60	66.49,49.20	67.84,47.58
		path	68.05,47.25	69.47,45.25	70.78,43.76	71.18,40.71	71.35,37.49
		path	71.15,35.63	71.04,33.60	71.31,31.09	71.85,29.01	72.65,27.28
		path	73.46,26.32	73.88,24.99	75.24,23.15
		Kill Daggermaw and Lashtail enemies around this area
		collect Raptor Ribs##31670 |n
		'|goto Blade's Edge Mountains/0 75.24,23.15 < 30 |c |noway |next "Start_Farming_Raptor_Ribs"
]])

ZygorGuidesViewer:RegisterGuide("Profession Guides\\Cooking\\Farming Guides\\Serpent Flesh",{
	author="support@zygorguides.com",
	condition_suggested=function() return skill('Cooking') >= 325 end,
	description="Serpent Flesh can be farmed in Blade's Edge Mountains.",
	},[[
	step
	label "Start_Farming_Serpent_Flesh"
		map Blade's Edge Mountains/0
		path follow smart; loop off; ants curved; dist 30
		path	75.24,23.15	73.88,24.99	73.46,26.32	72.65,27.28	71.85,29.01
		path	71.31,31.09	71.04,33.60	71.15,35.63	71.35,37.49	71.18,40.71
		path	70.78,43.76	69.47,45.25	68.05,47.25	67.84,47.58	66.49,49.20
		path	64.96,50.60	63.68,51.31	63.78,52.45	64.64,54.36	65.43,55.15
		path	66.46,56.39	67.08,57.74	67.78,59.22	68.25,61.91	68.35,63.37
		path	68.81,64.87	68.53,65.95	68.51,69.49
		Kill Scalewing enemies around this area
		collect Serpent Flesh##31671 |n
		'|goto Blade's Edge Mountains/0 68.51,69.49 < 30 |c |noway
	step
		map Blade's Edge Mountains/0
		path follow smart; loop off; ants curved; dist 30
		path	68.51,69.49	68.53,65.95	68.81,64.87	68.35,63.37	68.25,61.91
		path	67.78,59.22	67.08,57.74	66.46,56.39	65.43,55.15	64.64,54.36
		path	63.78,52.45	63.68,51.31	64.96,50.60	66.49,49.20	67.84,47.58
		path	68.05,47.25	69.47,45.25	70.78,43.76	71.18,40.71	71.35,37.49
		path	71.15,35.63	71.04,33.60	71.31,31.09	71.85,29.01	72.65,27.28
		path	73.46,26.32	73.88,24.99	75.24,23.15
		Kill Scalewing enemies around this area
		collect Serpent Flesh##31671 |n
		'|goto Blade's Edge Mountains/0 75.24,23.15 < 30 |c |noway |next "Start_Farming_Serpent_Flesh"
]])

ZygorGuidesViewer:RegisterGuide("Profession Guides\\Cooking\\Farming Guides\\Strange Spores",{
	author="support@zygorguides.com",
	condition_suggested=function() return skill('Cooking') >= 325 end,
	description="Strange Spores can be farmed in Zangarmarsh.",
	},[[
	step
		map Zangarmarsh/0
		path follow smart; loop on; ants curved; dist 30
		path	24.68,19.60	24.27,21.11	24.58,22.87	23.82,24.56	23.41,25.90
		path	22.15,26.32	21.60,27.69	21.15,29.84	20.42,31.99	19.76,33.52
		path	19.05,35.92	17.80,37.43	17.03,38.40	16.25,39.71	15.61,41.17
		path	15.83,43.73	16.50,45.80	17.54,47.38	17.92,48.48	19.37,50.63
		path	20.86,52.30	21.67,53.32	22.26,54.62	21.88,56.22	20.80,57.68
		path	19.55,58.15	18.02,57.33	17.39,57.71	16.31,57.45	14.44,57.45
		path	12.19,57.04	11.76,56.66	10.82,54.91	9.79,52.11	10.09,48.34
		path	11.30,44.83	13.25,42.72	13.96,39.92	15.16,38.32	16.23,35.68
		path	16.43,33.10	16.46,30.82	16.45,29.63	17.28,28.04	17.15,26.34
		path	15.87,26.15	15.41,24.00	15.80,21.84	16.06,19.31	16.88,17.10
		path	18.57,17.31
		kill Greater Sporebat##18129+
		kill Marsh Walker##18135+
		collect Strange Spores##27676 |n
		'|confirm
]])

ZygorGuidesViewer:RegisterGuide("Profession Guides\\Cooking\\Farming Guides\\Talbuk Venison",{
	author="support@zygorguides.com",
	condition_suggested=function() return skill('Cooking') >= 325 end,
	description="Talbuk Venison can be farmed in Nagrand.",
	},[[
	step
		map Nagrand/0
		path follow smart; loop on; ants curved; dist 30
		path	58.45,67.47	59.46,65.82	59.28,64.08	58.44,62.74	58.67,61.45
		path	59.38,59.90	60.48,59.79	62.75,57.86	61.61,56.14	61.66,52.97
		path	60.11,50.39	60.05,49.15	60.95,47.36	62.22,43.24	62.00,41.81
		path	61.69,39.46	64.80,41.04	66.76,40.95	68.57,40.24	70.65,40.99
		path	71.34,41.19	72.39,41.99	72.38,43.99	71.76,44.60	71.09,45.01
		path	70.33,46.05	70.04,47.30	69.80,48.58	69.83,49.92	69.28,51.30
		path	69.39,53.83	69.19,55.50	69.64,57.19	70.39,58.90	70.22,61.14
		path	69.42,62.04	68.09,61.87	66.96,62.66	66.80,63.77	67.01,64.56
		path	67.27,67.06	67.34,69.40	67.04,70.88	66.79,72.54	66.80,73.78
		path	66.50,75.31	65.60,75.46	64.52,75.39	63.35,74.82	62.19,74.59
		path	61.40,74.21	60.51,72.36	59.17,71.67	58.46,69.38
		Kill Talbuk enemies around this area
		collect Talbuk Venison##27682 |n
		'|confirm
]])

ZygorGuidesViewer:RegisterGuide("Profession Guides\\Cooking\\Farming Guides\\Warped Flesh",{
	author="support@zygorguides.com",
	condition_suggested=function() return skill('Cooking') >= 325 end,
	description="Warped Flesh can be farmed in Terokkar Forest.",
	},[[
	step
		map Terokkar Forest/0
		path follow smart; loop on; ants curved; dist 30
		path	59.59,49.54	59.65,48.37	59.41,47.25	58.99,46.28	58.50,45.39
		path	57.90,44.76	57.18,43.95	56.84,43.13	56.14,42.55	55.56,41.51
		path	55.48,40.53	55.57,39.33	55.32,38.38	55.25,37.11	55.19,35.86
		path	55.41,34.98	55.94,34.37	56.30,33.13	57.61,32.39	58.54,31.61
		path	59.68,31.15	60.97,30.39	62.24,30.51	63.31,31.03	64.49,31.48
		path	65.61,32.16	66.88,32.68	68.19,33.22	68.50,34.23	68.02,35.84
		path	66.65,35.82	65.98,36.47	64.64,35.75	62.90,35.26	62.08,35.51
		path	61.30,36.73	60.98,38.58	60.84,40.23	61.19,41.87	61.17,43.04
		path	60.95,45.16	60.68,46.73	59.72,48.94
		kill Warp Stalker##18464+
		collect Warped Flesh##27681 |n
		'|confirm
]])

ZygorGuidesViewer:RegisterGuide("Profession Guides\\Cooking\\Farming Guides\\Crunchy Spider Leg",{
	author="support@zygorguides.com",
	condition_suggested=function() return skill('Cooking') >= 325 end,
	description="Crunchy Spider Legs can be farmed in Ghostlands.",
	},[[
	step
		map Ghostlands/0
		path follow smart; loop on; ants curved; dist 30
		path	40.53,66.35	40.83,70.18	40.57,72.68	38.84,72.10	37.18,69.79
		path	34.71,68.90	33.08,66.46	32.19,64.27	34.19,62.61	33.92,58.51
		path	31.76,53.44	29.94,52.32	29.11,52.58	28.13,52.99	26.72,52.73
		path	25.32,51.78	24.85,49.40	25.12,46.91	24.62,44.93	24.38,43.25
		path	24.48,41.68	24.29,39.91	25.65,39.62	27.34,38.74	27.99,39.65
		path	28.81,41.11	29.73,39.07	30.40,36.94	31.25,36.31	32.28,38.14
		path	33.83,38.87	35.33,40.52	37.74,41.01	40.04,41.51	41.88,41.97
		path	43.87,43.04	45.57,44.20	45.96,45.70	45.18,47.38	44.27,50.14
		path	44.68,51.59	43.91,55.55	43.46,58.84	43.22,62.21	42.62,65.23
		Kill Spindleweb enemies along the path
		collect Crunchy Spider Leg##22644 |n
		'|confirm
]])

ZygorGuidesViewer:RegisterGuide("Profession Guides\\Cooking\\Farming Guides\\Lynx Meat",{
	author="support@zygorguides.com",
	condition_suggested=function() return skill('Cooking') >= 325 end,
	description="Lynx Meat can be farmed in Nagrand.",
	},[[
	step
		map Eversong Woods/0
		path follow smart; loop on; ants curved; dist 30
		path	42.67,69.53	41.06,70.55	39.80,71.87	39.25,73.69	38.26,74.58
		path	37.21,73.96	36.11,73.59	34.88,74.11	33.88,74.18	32.70,72.35
		path	31.06,72.01	28.80,70.59	27.27,67.95	26.86,63.75	27.18,59.79
		path	28.22,57.16	29.35,55.95	30.26,54.48	31.44,53.09	32.81,54.10
		path	34.06,55.12	35.19,55.45	36.83,56.78	37.47,58.98	36.31,61.65
		path	37.08,63.47	38.40,63.76	39.78,63.68	41.04,62.25	42.82,61.82
		path	44.44,62.83	45.33,62.77	45.90,62.43	46.67,63.06	46.37,64.50
		path	46.20,66.14	46.46,67.55	45.63,68.10	44.47,67.36	43.92,69.23
		kill Springpaw Stalker##15651+
		collect Lynx Meat##27668 |n
		'|confirm
]])

ZygorGuidesViewer:RegisterGuide("Profession Guides\\Cooking\\Farming Guides\\Moongraze Stag Tenderloin",{
	author="support@zygorguides.com",
	condition_suggested=function() return skill('Cooking') >= 325 end,
	description="Moongraze Stag Tenderloins can be farmed on Azuremyst Isle.",
	},[[
	step
		map Azuremyst Isle/0
		path follow smart; loop on; ants curved; dist 30
		path	55.31,50.08	55.15,51.44	56.78,55.40	57.55,57.15	57.91,59.56
		path	56.39,61.11	54.11,62.47	52.98,63.99	52.13,62.82	51.40,61.14
		path	50.34,59.58	48.99,59.01	47.55,57.68	46.61,56.91	45.43,56.92
		path	45.54,58.37	45.73,60.95	45.82,62.01	45.59,63.99	45.22,65.99
		path	44.26,66.95	42.74,67.69	41.90,69.19	40.50,70.23	40.38,67.23
		path	40.28,63.98	40.34,60.36	40.63,58.14	39.31,56.95	37.83,56.34
		path	36.83,56.83	35.68,58.36	34.57,58.61	34.40,59.69	32.85,60.18
		path	31.55,60.50	28.63,59.88	28.19,56.95	29.24,54.16	29.98,52.40
		path	31.14,50.56	32.71,50.63	33.49,53.02	34.03,55.80	34.94,56.58
		path	36.39,55.04	37.08,54.22	38.74,53.14	38.95,52.25	39.83,50.04
		path	41.10,48.48	42.19,46.43	43.86,44.15	44.39,41.75	45.66,39.56
		path	47.40,38.46	49.32,35.97	50.40,35.47	53.31,36.27	55.86,38.52
		path	57.82,39.79	58.17,42.94	56.97,45.43	56.65,48.29
		Kill Moongraze enemies along the path
		collect Moongraze Stag Tenderloin##23676 |n
		'|confirm
]])

---------------------------------
---     TBC JEWELCRAFTING     ---
---------------------------------

ZygorGuidesViewer:RegisterGuide("Profession Guides\\Cooking\\Farming Guides\\Jaggal Clam Meat",{
	author="support@zygorguides.com",
	condition_suggested=function() return skill('Cooking') >= 325 end,
	description="Jaggal Clam Meat can be farmed in Zangarmarsh.",
	},[[
	step
		Kill Bloodscale enemies around this area
		collect Jaggal Clam##24476 |n
		|tip The best place for these is farming The Slave Pens dungeon.
		use Jaggal Clam##24476
		collect Jaggal Clam Meat##24477 |goto Zangarmarsh/0 26.92,39.35 |n
		'|confirm
]])

ZygorGuidesViewer:RegisterGuide("Profession Guides\\Jewelcrafting\\Farming Guides\\Jaggal Pearl",{
	author="support@zygorguides.com",
	condition_suggested=function() return skill('Jewelcrafting') >= 325 end,
	description="Jaggal Pearls can be farmed in Nagrand.",
	},[[
	step
		Kill Bloodscale enemies around this area
		collect Jaggal Clam##24476 |n
		|tip The best place for these is farming The Slave Pens dungeon.
		use Jaggal Clam##24476
		collect Jaggal Pearl##24478 |goto Zangarmarsh/0 26.92,39.35 |n
		|tip They have a chance to drop from each clam.
		'|confirm
]])



-----------------------------
---     WOTLK COOKING     ---
-----------------------------

ZygorGuidesViewer:RegisterGuide("Profession Guides\\Cooking\\Farming Guides\\Chilled Meat",{
	author="support@zygorguides.com",
	},[[
	step
		map Sholazar Basin/0
		path follow smart; loop on; ants curved; dist 30
		path	57.48,73.45	58.98,70.90	60.60,70.78	63.07,71.59	65.68,70.68
		path	67.78,69.72	70.17,69.54	71.94,70.61	70.25,72.47	67.58,73.52
		path	66.01,75.76	66.54,78.64	66.01,80.77	64.47,79.46	63.81,74.39
		path	62.61,73.65	59.73,74.19	58.47,75.31	57.14,77.70	56.50,79.34
		path	55.75,77.61	55.35,75.24
		Kill Hardknuckle enemies along the path
		|tip BEWARE of wandering Frenzyheart NPCs that will attack you close to Frenzyheart Hill! |only if rep("Frenzyheart Tribe") <= Hostile
		collect Chilled Meat##43013 |n
		'|confirm
]])

ZygorGuidesViewer:RegisterGuide("Profession Guides\\Cooking\\Farming Guides\\Chunk o' Mammoth",{
	author="support@zygorguides.com",
	},[[
	step
		map Sholazar Basin/0
		path follow smart; loop on; ants curved; dist 30
		path	52.01,42.69	48.49,43.70	41.11,36.19	41.12,31.53	44.15,31.22
		path	47.11,32.61	51.04,28.97	51.03,24.02	53.57,26.29	54.73,31.56
		path	55.72,34.79	57.18,36.62	54.39,39.80	53.34,41.89
		Kill Shattertusk enemies along the path
		collect Chunk o' Mammoth##34736 |n
		'|confirm
]])

ZygorGuidesViewer:RegisterGuide("Profession Guides\\Cooking\\Farming Guides\\Northern Egg",{
	author="support@zygorguides.com",
	},[[
	step
		kill Goretalon Roc##28004+
		collect Northern Egg##43501 |goto Sholazar Basin/0 59.27,28.23 |n
		You can find more around [55.88,27.03]
		'|confirm
]])

ZygorGuidesViewer:RegisterGuide("Profession Guides\\Cooking\\Farming Guides\\Rhino Meat",{
	author="support@zygorguides.com",
	},[[
	step
	label "Begin_Farming_Rhino_Meat"
		map Borean Tundra/0
		path follow smart; loop on; ants curved; dist 30
		path	47.21,48.30	44.24,47.61	41.18,46.20	40.98,44.66	41.46,41.47
		path	42.96,40.00	43.64,40.96	45.77,41.70	46.85,43.10	47.89,46.20
		Kill Wooly Rhino enemies along the path
		collect Rhino Meat##43012 |n
		'|goto 47.89,46.20 < 30 |c |noway
	step
		map Borean Tundra/0
		path follow smart; loop on; ants curved; dist 30
		path	50.60,68.96	49.51,72.06	47.53,73.94	44.84,74.30	42.65,74.76
		path	40.52,72.87	41.06,70.43	43.42,70.41	45.00,70.40	47.12,70.14
		path	48.70,69.55	50.08,66.87
		Kill Wooly Rhino enemies along the path
		collect Rhino Meat##43012 |n
		'|goto 50.08,66.87 < 30 |c |noway |next "Begin_Farming_Rhino_Meat"
]])

ZygorGuidesViewer:RegisterGuide("Profession Guides\\Cooking\\Farming Guides\\Shoveltusk Flank",{
	author="support@zygorguides.com",
	},[[
	step
		map Howling Fjord/0
		path follow smart; loop on; ants curved; dist 30
		path	34.90,46.44	36.69,45.38	38.75,45.22	39.87,42.83	40.74,41.80
		path	42.16,42.62	42.55,43.76	43.82,45.16	44.82,46.83	45.87,49.40
		path	46.76,53.18	47.28,58.47	47.93,59.65	48.88,60.49	52.58,59.89
		path	53.93,61.16	54.68,63.69	56.11,66.88	56.04,68.76	54.61,71.25
		path	52.55,72.84	50.98,72.03	49.26,72.48	48.24,68.29	47.87,64.10
		path	46.89,62.00	44.36,64.01	42.75,61.72	41.87,58.64	39.14,55.16
		path	36.33,53.43	34.55,51.05	33.84,48.71
		Kill Shoveltusk enemies along the path
		collect Shoveltusk Flank##43009 |n
		'|confirm
]])

ZygorGuidesViewer:RegisterGuide("Profession Guides\\Cooking\\Farming Guides\\Succulent Clam Meat",{
	author="support@zygorguides.com",
	},[[
	step
		Kill Winterfin enemies around this area
		|tip You can find more inside the cave.
		collect Succulent Clam Meat##36782 |goto Borean Tundra/0 39.88,17.98 |n
		'|confirm
]])

ZygorGuidesViewer:RegisterGuide("Profession Guides\\Cooking\\Farming Guides\\Worg Haunch",{
	author="support@zygorguides.com",
	},[[
	step
		map Grizzly Hills/0
		path follow strictbounce; loop off; ants curved; dist 30
		path	25.59,68.23	24.10,71.14	21.98,71.95	19.21,72.32	18.91,67.93
		path	17.74,64.40	18.00,59.21	20.81,58.94	22.51,58.35	25.66,55.07
		path	24.39,49.58
		kill Graymist Hunter##26592+
		collect Worg Haunch##43011 |n
		'|confirm
]])

ZygorGuidesViewer:RegisterGuide("Profession Guides\\Cooking\\Farming Guides\\Worm Meat",{
	author="support@zygorguides.com",
	},[[
	step
		Enter the cave |goto The Storm Peaks/0 46.95,55.02 < 30 |walk
		kill Infesting Jormungar##30148+
		|tip Inside the cave.
		collect Worm Meat##43010 |goto 48.45,51.68 |n
		'|confirm
]])

------------------------------
---     WOTLK ETERNALS     ---
------------------------------

ZygorGuidesViewer:RegisterGuide("Profession Guides\\Elements\\Farming Guides\\Crystallized Air",{
	author="support@zygorguides.com",
	},[[
	step
		kill Scion of Storm##30184+
		|tip Inside the cave.
		collect Crystallized Air##37700 |goto The Storm Peaks/0 67.73,41.55 |n
		'|confirm
]])

ZygorGuidesViewer:RegisterGuide("Profession Guides\\Elements\\Farming Guides\\Crystallized Earth",{
	author="support@zygorguides.com",
	},[[
	step
		map Sholazar Basin/0
		path follow smart; loop on; ants curved; dist 30
		path	69.56,57.80	70.04,60.18	72.14,60.08	72.84,57.52	74.78,55.78
		path	72.60,54.62	69.13,55.36
		kill Lifeblood Elemental##29124+
		collect Crystallized Earth##37701 |n
		|tip You can also farm them from Mining nodes with Northrend Mining guides.
		'|confirm
]])

ZygorGuidesViewer:RegisterGuide("Profession Guides\\Elements\\Farming Guides\\Crystallized Fire",{
	author="support@zygorguides.com",
	},[[
	step
		Enter the cave |goto The Storm Peaks/0 62.48,41.49 < 20 |walk
		kill Wailing Winds##30450+
		|tip Inside the cave.
		collect Crystallized Fire##37702 |goto 61.43,39.48 |n
		'|confirm
]])

ZygorGuidesViewer:RegisterGuide("Profession Guides\\Elements\\Farming Guides\\Crystallized Life",{
	author="support@zygorguides.com",
	},[[
	step
		kill Thornvine Creeper##23874+
		collect Crystallized Life##37704 |goto Howling Fjord/0 53.60,16.64 |n
		'|confirm
]])

ZygorGuidesViewer:RegisterGuide("Profession Guides\\Elements\\Farming Guides\\Crystallized Shadow",{
	author="support@zygorguides.com",
	},[[
	step
		Enter the cave |goto Dragonblight/0 74.24,23.64 < 30 |walk
		kill Deathbringer Revenant##27382+
		|tip Inside the cave.
		collect Crystallized Shadow##37703 |goto 75.02,21.11 |n
		'|confirm
]])

ZygorGuidesViewer:RegisterGuide("Profession Guides\\Elements\\Farming Guides\\Crystallized Water",{
	author="support@zygorguides.com",
	},[[
	step
		kill Boiling Spirit##25419+
		collect Crystallized Water##37705 |goto Borean Tundra/0 46.94,13.40 |n
		'|confirm
]])

-----------------------------
---     WOTLK FISHING     ---
-----------------------------

ZygorGuidesViewer:RegisterGuide("Profession Guides\\Fishing\\Farming Guides\\Barrelhead Goby",{
	author="support@zygorguides.com",
	condition_suggested=function() return skill('Fishing') >= 525 end,
	condition_valid=function() return skill('Fishing') >= 430 end,
	condition_valid_msg="Your Fishing skill must be at least 430 to fish Barrelhead Goby.",
	description="Barrelhead Goby can be fished in Sholazar Basin with a skill of at least 430. "..
		    "525 skill is required to avoid them getting away.",
	},[[
	step
		Equip a Fishing Pole |equipped Fishing Pole##6256 |only if default |or
		|tip A Fishing Pole can be purchased near most Fishing profession trainers. |only if default |or
		Equip an Arcanite Fishing Pole |equipped Arcanite Fishing Pole##19970 |only if itemcount(19970) >= 1 |or
		Equip a Big Iron Fishing Pole |equipped Big Iron Fishing Pole##6367 |only if itemcount(6367) >= 1 |or
		Equip a Blump Family Fishing Pole |equipped Blump Family Fishing Pole##12225 |only if itemcount(12225) >= 1 |or
		Equip a Bone Fishing Pole |equipped Bone Fishing Pole##45991 |only if itemcount(45991) >= 1 |or
		Equip a Darkwood Fishing Pole |equipped Darkwood Fishing Pole##6366 |only if itemcount(6366) >= 1 |or
		Equip a Jeweled Fishing Pole |equipped Jeweled Fishing Pole##45992 |only if itemcount(45992) >= 1 |or
		Equip a Mastercraft Kalu'ak Fishing Pole |equipped Mastercraft Kalu'ak Fishing Pole##44050 |only if itemcount(44050) >= 1 |or
		Equip Nat Pagle's Extreme Angler FC-5000 |equipped Nat Pagle's Extreme Angler FC-5000##19022 |only if itemcount(19022) >= 1 |or
		Equip a Nat's Lucky Fishing Pole |equipped Nat's Lucky Fishing Pole##45858 |only if itemcount(45858) >= 1 |or
		Equip Seth's Graphite Fishing Pole |equipped Seth's Graphite Fishing Pole##25978 |only if itemcount(25978) >= 1 |or
		Equip a Strong Fishing Pole |equipped Strong Fishing Pole##6365 |only if itemcount(6365) >= 1 |or
	step
		cast Fishing##33095
		|tip Fish in the water.
		|tip You must have a Fishing Pole equipped to fish.
		|tip A Fishing Pole can be purchased near most Fishing profession trainers.
		collect Barrelhead Goby##41812 |goto Sholazar Basin/0 49.66,63.81 |n
		'|confirm
]])

ZygorGuidesViewer:RegisterGuide("Profession Guides\\Fishing\\Farming Guides\\Bonescale Snapper",{
	author="support@zygorguides.com",
	condition_suggested=function() return skill('Fishing') >= 475 end,
	condition_valid=function() return skill('Fishing') >= 380 end,
	condition_valid_msg="Your Fishing skill must be at least 380 to fish Bonescale Snapper.",
	description="Bonescale Snapper can be fished frequently in Howling Fjord and Borean Tundra with a skill of at least 380. "..
		    "475 skill is required to avoid them getting away.",
	},[[
	step
		Equip a Fishing Pole |equipped Fishing Pole##6256 |only if default |or
		|tip A Fishing Pole can be purchased near most Fishing profession trainers. |only if default |or
		Equip an Arcanite Fishing Pole |equipped Arcanite Fishing Pole##19970 |only if itemcount(19970) >= 1 |or
		Equip a Big Iron Fishing Pole |equipped Big Iron Fishing Pole##6367 |only if itemcount(6367) >= 1 |or
		Equip a Blump Family Fishing Pole |equipped Blump Family Fishing Pole##12225 |only if itemcount(12225) >= 1 |or
		Equip a Bone Fishing Pole |equipped Bone Fishing Pole##45991 |only if itemcount(45991) >= 1 |or
		Equip a Darkwood Fishing Pole |equipped Darkwood Fishing Pole##6366 |only if itemcount(6366) >= 1 |or
		Equip a Jeweled Fishing Pole |equipped Jeweled Fishing Pole##45992 |only if itemcount(45992) >= 1 |or
		Equip a Mastercraft Kalu'ak Fishing Pole |equipped Mastercraft Kalu'ak Fishing Pole##44050 |only if itemcount(44050) >= 1 |or
		Equip Nat Pagle's Extreme Angler FC-5000 |equipped Nat Pagle's Extreme Angler FC-5000##19022 |only if itemcount(19022) >= 1 |or
		Equip a Nat's Lucky Fishing Pole |equipped Nat's Lucky Fishing Pole##45858 |only if itemcount(45858) >= 1 |or
		Equip Seth's Graphite Fishing Pole |equipped Seth's Graphite Fishing Pole##25978 |only if itemcount(25978) >= 1 |or
		Equip a Strong Fishing Pole |equipped Strong Fishing Pole##6365 |only if itemcount(6365) >= 1 |or
	step
		cast Fishing##33095
		|tip Fish in the water.
		|tip You must have a Fishing Pole equipped to fish.
		|tip A Fishing Pole can be purchased near most Fishing profession trainers.
		collect Bonescale Snapper##41808 |goto Grizzly Hills/0 28.34,66.18 |n
		|tip This fish is a random open-water fish.
		'|confirm
]])

ZygorGuidesViewer:RegisterGuide("Profession Guides\\Fishing\\Farming Guides\\Borean Man O' War",{
	author="support@zygorguides.com",
	condition_suggested=function() return skill('Fishing') >= 475 end,
	condition_valid=function() return skill('Fishing') >= 380 end,
	condition_valid_msg="Your Fishing skill must be at least 380 to fish Borean Man O' War.",
	description="Borean Man O' War can be fished in Borean Tundra with a skill of at least 380. "..
		    "475 skill is required to avoid them getting away.",
	},[[
	step
		Equip a Fishing Pole |equipped Fishing Pole##6256 |only if default |or
		|tip A Fishing Pole can be purchased near most Fishing profession trainers. |only if default |or
		Equip an Arcanite Fishing Pole |equipped Arcanite Fishing Pole##19970 |only if itemcount(19970) >= 1 |or
		Equip a Big Iron Fishing Pole |equipped Big Iron Fishing Pole##6367 |only if itemcount(6367) >= 1 |or
		Equip a Blump Family Fishing Pole |equipped Blump Family Fishing Pole##12225 |only if itemcount(12225) >= 1 |or
		Equip a Bone Fishing Pole |equipped Bone Fishing Pole##45991 |only if itemcount(45991) >= 1 |or
		Equip a Darkwood Fishing Pole |equipped Darkwood Fishing Pole##6366 |only if itemcount(6366) >= 1 |or
		Equip a Jeweled Fishing Pole |equipped Jeweled Fishing Pole##45992 |only if itemcount(45992) >= 1 |or
		Equip a Mastercraft Kalu'ak Fishing Pole |equipped Mastercraft Kalu'ak Fishing Pole##44050 |only if itemcount(44050) >= 1 |or
		Equip Nat Pagle's Extreme Angler FC-5000 |equipped Nat Pagle's Extreme Angler FC-5000##19022 |only if itemcount(19022) >= 1 |or
		Equip a Nat's Lucky Fishing Pole |equipped Nat's Lucky Fishing Pole##45858 |only if itemcount(45858) >= 1 |or
		Equip Seth's Graphite Fishing Pole |equipped Seth's Graphite Fishing Pole##25978 |only if itemcount(25978) >= 1 |or
		Equip a Strong Fishing Pole |equipped Strong Fishing Pole##6365 |only if itemcount(6365) >= 1 |or
	step
		map Borean Tundra/0
		path follow strictbounce; loop off; ants curved; dist 30
		path	87.29,47.33	78.43,53.17	73.57,54.56	69.14,50.26	66.15,49.57
		path	65.03,53.30	63.51,60.03	59.28,72.66	55.20,75.26	51.69,78.18
		path	47.50,81.08	43.76,80.44	40.66,77.20	36.88,75.93	32.67,68.49
		path	29.31,62.48	28.18,54.14	40.85,34.52	44.96,23.48	42.28,16.53
		path	40.45,11.35
		cast Fishing##33095
		|tip Follow the path, fishing in Borean Man O' War Schools along the way.
		|tip Enable fish tracking with "Find Fish" if you have it.
		|tip You must have a Fishing Pole equipped to fish.
		|tip A Fishing Pole can be purchased near most Fishing profession trainers.
		collect Borean Man O' War##41805 |n
		'|confirm
]])

ZygorGuidesViewer:RegisterGuide("Profession Guides\\Fishing\\Farming Guides\\Deep Sea Monsterbelly",{--Check Closely
	author="support@zygorguides.com",
	condition_suggested=function() return skill('Fishing') >= 575 end,
	condition_valid=function() return skill('Fishing') >= 480 end,
	condition_valid_msg="Your Fishing skill must be at least 480 to fish Deep Sea Monsterbelly.",
	description="Deep Sea Monsterbelly can be fished in Borean Tundra with a skill of at least 480. "..
		    "575 skill is required to avoid them getting away.",
	},[[
	step
		Equip a Fishing Pole |equipped Fishing Pole##6256 |only if default |or
		|tip A Fishing Pole can be purchased near most Fishing profession trainers. |only if default |or
		Equip an Arcanite Fishing Pole |equipped Arcanite Fishing Pole##19970 |only if itemcount(19970) >= 1 |or
		Equip a Big Iron Fishing Pole |equipped Big Iron Fishing Pole##6367 |only if itemcount(6367) >= 1 |or
		Equip a Blump Family Fishing Pole |equipped Blump Family Fishing Pole##12225 |only if itemcount(12225) >= 1 |or
		Equip a Bone Fishing Pole |equipped Bone Fishing Pole##45991 |only if itemcount(45991) >= 1 |or
		Equip a Darkwood Fishing Pole |equipped Darkwood Fishing Pole##6366 |only if itemcount(6366) >= 1 |or
		Equip a Jeweled Fishing Pole |equipped Jeweled Fishing Pole##45992 |only if itemcount(45992) >= 1 |or
		Equip a Mastercraft Kalu'ak Fishing Pole |equipped Mastercraft Kalu'ak Fishing Pole##44050 |only if itemcount(44050) >= 1 |or
		Equip Nat Pagle's Extreme Angler FC-5000 |equipped Nat Pagle's Extreme Angler FC-5000##19022 |only if itemcount(19022) >= 1 |or
		Equip a Nat's Lucky Fishing Pole |equipped Nat's Lucky Fishing Pole##45858 |only if itemcount(45858) >= 1 |or
		Equip Seth's Graphite Fishing Pole |equipped Seth's Graphite Fishing Pole##25978 |only if itemcount(25978) >= 1 |or
		Equip a Strong Fishing Pole |equipped Strong Fishing Pole##6365 |only if itemcount(6365) >= 1 |or
	step
		map Northrend/0
		path follow strictbounce; loop off; ants curved; dist 45
		path	30.30,67.10	30.97,67.50	31.84,67.43	32.91,66.97	33.81,66.56
		path	35.07,66.05
		cast Fishing##33095
		|tip Follow the path, fishing in Deep Sea Monsterbelly Schools along the way.
		|tip Enable fish tracking with "Find Fish" if you have it.
		|tip You must have a Fishing Pole equipped to fish.
		|tip A Fishing Pole can be purchased near most Fishing profession trainers.
		collect Deep Sea Monsterbelly##41800 |n
		'|confirm
]])

ZygorGuidesViewer:RegisterGuide("Profession Guides\\Fishing\\Farming Guides\\Dragonfin Angelfish",{
	author="support@zygorguides.com",
	condition_suggested=function() return skill('Fishing') >= 475 end,
	condition_valid=function() return skill('Fishing') >= 380 end,
	condition_valid_msg="Your Fishing skill must be at least 380 to fish Dragonfin Angelfish.",
	description="Dragonfin Angelfish can be fished in Dragonblight with a skill of at least 380. "..
		    "475 skill is required to avoid them getting away.",
	},[[
	step
		Equip a Fishing Pole |equipped Fishing Pole##6256 |only if default |or
		|tip A Fishing Pole can be purchased near most Fishing profession trainers. |only if default |or
		Equip an Arcanite Fishing Pole |equipped Arcanite Fishing Pole##19970 |only if itemcount(19970) >= 1 |or
		Equip a Big Iron Fishing Pole |equipped Big Iron Fishing Pole##6367 |only if itemcount(6367) >= 1 |or
		Equip a Blump Family Fishing Pole |equipped Blump Family Fishing Pole##12225 |only if itemcount(12225) >= 1 |or
		Equip a Bone Fishing Pole |equipped Bone Fishing Pole##45991 |only if itemcount(45991) >= 1 |or
		Equip a Darkwood Fishing Pole |equipped Darkwood Fishing Pole##6366 |only if itemcount(6366) >= 1 |or
		Equip a Jeweled Fishing Pole |equipped Jeweled Fishing Pole##45992 |only if itemcount(45992) >= 1 |or
		Equip a Mastercraft Kalu'ak Fishing Pole |equipped Mastercraft Kalu'ak Fishing Pole##44050 |only if itemcount(44050) >= 1 |or
		Equip Nat Pagle's Extreme Angler FC-5000 |equipped Nat Pagle's Extreme Angler FC-5000##19022 |only if itemcount(19022) >= 1 |or
		Equip a Nat's Lucky Fishing Pole |equipped Nat's Lucky Fishing Pole##45858 |only if itemcount(45858) >= 1 |or
		Equip Seth's Graphite Fishing Pole |equipped Seth's Graphite Fishing Pole##25978 |only if itemcount(25978) >= 1 |or
		Equip a Strong Fishing Pole |equipped Strong Fishing Pole##6365 |only if itemcount(6365) >= 1 |or
	step
		cast Fishing##33095
		|tip Fish in Dragonfin Angelfish Schools.
		|tip Enable fish tracking with "Find Fish" if you have it.
		|tip You must have a Fishing Pole equipped to fish.
		|tip A Fishing Pole can be purchased near most Fishing profession trainers.
		collect Dragonfin Angelfish##41807 |goto Dragonblight/0 40.27,67.80 |n
		'|confirm
]])

ZygorGuidesViewer:RegisterGuide("Profession Guides\\Fishing\\Farming Guides\\Fangtooth Herring",{
	author="support@zygorguides.com",
	condition_suggested=function() return skill('Fishing') >= 475 end,
	condition_valid=function() return skill('Fishing') >= 380 end,
	condition_valid_msg="Your Fishing skill must be at least 380 to fish Fangtooth Herring.",
	description="Fangtooth Herring can be fished in Howling Fjord and Grizzly Hills with a skill of at least 380. "..
		    "475 skill is required to avoid them getting away.",
	},[[
	step
		Equip a Fishing Pole |equipped Fishing Pole##6256 |only if default |or
		|tip A Fishing Pole can be purchased near most Fishing profession trainers. |only if default |or
		Equip an Arcanite Fishing Pole |equipped Arcanite Fishing Pole##19970 |only if itemcount(19970) >= 1 |or
		Equip a Big Iron Fishing Pole |equipped Big Iron Fishing Pole##6367 |only if itemcount(6367) >= 1 |or
		Equip a Blump Family Fishing Pole |equipped Blump Family Fishing Pole##12225 |only if itemcount(12225) >= 1 |or
		Equip a Bone Fishing Pole |equipped Bone Fishing Pole##45991 |only if itemcount(45991) >= 1 |or
		Equip a Darkwood Fishing Pole |equipped Darkwood Fishing Pole##6366 |only if itemcount(6366) >= 1 |or
		Equip a Jeweled Fishing Pole |equipped Jeweled Fishing Pole##45992 |only if itemcount(45992) >= 1 |or
		Equip a Mastercraft Kalu'ak Fishing Pole |equipped Mastercraft Kalu'ak Fishing Pole##44050 |only if itemcount(44050) >= 1 |or
		Equip Nat Pagle's Extreme Angler FC-5000 |equipped Nat Pagle's Extreme Angler FC-5000##19022 |only if itemcount(19022) >= 1 |or
		Equip a Nat's Lucky Fishing Pole |equipped Nat's Lucky Fishing Pole##45858 |only if itemcount(45858) >= 1 |or
		Equip Seth's Graphite Fishing Pole |equipped Seth's Graphite Fishing Pole##25978 |only if itemcount(25978) >= 1 |or
		Equip a Strong Fishing Pole |equipped Strong Fishing Pole##6365 |only if itemcount(6365) >= 1 |or
	step
		map Howling Fjord/0
		path follow smar; loop on; ants curved; dist 30
		path	62.46,63.99	60.39,58.82	56.97,57.79	53.88,57.88	53.20,53.29
		path	53.70,47.44	54.68,43.74	55.61,39.93	53.37,38.45	49.91,39.35
		path	45.34,40.42	42.14,38.03	42.45,31.73	42.06,24.24	39.86,20.56
		path	40.11,18.07	43.01,17.53	46.10,19.60	45.08,22.34	47.08,26.57
		path	48.75,28.32	51.22,31.76	53.35,33.93	56.53,33.66	58.65,33.85
		path	59.93,31.66	61.73,26.93	63.26,22.04	60.63,18.92	64.32,17.81
		path	68.41,19.96	65.90,23.01	64.63,29.24	62.39,34.66	60.90,37.47
		path	60.80,43.92	61.87,51.74	62.30,55.50	64.21,61.86	62.74,64.77
		cast Fishing##33095
		|tip Follow the path, fishing in Fangtooth Herring Schools along the way.
		|tip Enable fish tracking with "Find Fish" if you have it.
		|tip You must have a Fishing Pole equipped to fish.
		|tip A Fishing Pole can be purchased near most Fishing profession trainers.
		collect Fangtooth Herring##41810 |n
		'|confirm
]])

ZygorGuidesViewer:RegisterGuide("Profession Guides\\Fishing\\Farming Guides\\Glacial Salmon",{
	author="support@zygorguides.com",
	condition_suggested=function() return skill('Fishing') >= 475 end,
	condition_valid=function() return skill('Fishing') >= 380 end,
	condition_valid_msg="Your Fishing skill must be at least 380 to fish Glacial Salmon.",
	description="Glacial Salmon can be fished in Wingergrasp, Grizzly Hills, and Howling Fjord with a skill of at least 380. "..
		    "475 skill is required to avoid them getting away.",
	},[[
	step
		Equip a Fishing Pole |equipped Fishing Pole##6256 |only if default |or
		|tip A Fishing Pole can be purchased near most Fishing profession trainers. |only if default |or
		Equip an Arcanite Fishing Pole |equipped Arcanite Fishing Pole##19970 |only if itemcount(19970) >= 1 |or
		Equip a Big Iron Fishing Pole |equipped Big Iron Fishing Pole##6367 |only if itemcount(6367) >= 1 |or
		Equip a Blump Family Fishing Pole |equipped Blump Family Fishing Pole##12225 |only if itemcount(12225) >= 1 |or
		Equip a Bone Fishing Pole |equipped Bone Fishing Pole##45991 |only if itemcount(45991) >= 1 |or
		Equip a Darkwood Fishing Pole |equipped Darkwood Fishing Pole##6366 |only if itemcount(6366) >= 1 |or
		Equip a Jeweled Fishing Pole |equipped Jeweled Fishing Pole##45992 |only if itemcount(45992) >= 1 |or
		Equip a Mastercraft Kalu'ak Fishing Pole |equipped Mastercraft Kalu'ak Fishing Pole##44050 |only if itemcount(44050) >= 1 |or
		Equip Nat Pagle's Extreme Angler FC-5000 |equipped Nat Pagle's Extreme Angler FC-5000##19022 |only if itemcount(19022) >= 1 |or
		Equip a Nat's Lucky Fishing Pole |equipped Nat's Lucky Fishing Pole##45858 |only if itemcount(45858) >= 1 |or
		Equip Seth's Graphite Fishing Pole |equipped Seth's Graphite Fishing Pole##25978 |only if itemcount(25978) >= 1 |or
		Equip a Strong Fishing Pole |equipped Strong Fishing Pole##6365 |only if itemcount(6365) >= 1 |or
	step
		map Grizzly Hills/0
		path follow strictbounce; loop off; ants curved; dist 30
		path	23.08,78.09	26.86,70.17	28.07,63.36	29.18,58.01	29.51,52.55
		path	30.78,46.42	32.71,44.62	36.27,41.64	37.71,38.17	40.16,33.96
		path	36.39,32.91	35.31,34.91	33.26,38.36	30.71,39.20	28.76,41.03
		path	25.08,40.15	23.56,41.59	21.20,41.08	18.38,41.15	13.56,39.83
		cast Fishing##33095
		|tip Follow the path, fishing in Glacial Salmon Schools along the way.
		|tip Enable fish tracking with "Find Fish" if you have it.
		|tip You must have a Fishing Pole equipped to fish.
		|tip A Fishing Pole can be purchased near most Fishing profession trainers.
		collect Glacial Salmon##41809 |n
		'|confirm
]])

ZygorGuidesViewer:RegisterGuide("Profession Guides\\Fishing\\Farming Guides\\Glassfin Minnow",{
	author="support@zygorguides.com",
	condition_suggested=function() return skill('Fishing') >= 500 end,
	condition_valid=function() return skill('Fishing') >= 405 end,
	condition_valid_msg="Your Fishing skill must be at least 405 to fish Glassfin Minnows.",
	description="Glassfin Minnows can be fished in Crystalsong Forest with a skill of at least 405. "..
		    "500 skill is required to avoid them getting away.",
	},[[
	step
		Equip a Fishing Pole |equipped Fishing Pole##6256 |only if default |or
		|tip A Fishing Pole can be purchased near most Fishing profession trainers. |only if default |or
		Equip an Arcanite Fishing Pole |equipped Arcanite Fishing Pole##19970 |only if itemcount(19970) >= 1 |or
		Equip a Big Iron Fishing Pole |equipped Big Iron Fishing Pole##6367 |only if itemcount(6367) >= 1 |or
		Equip a Blump Family Fishing Pole |equipped Blump Family Fishing Pole##12225 |only if itemcount(12225) >= 1 |or
		Equip a Bone Fishing Pole |equipped Bone Fishing Pole##45991 |only if itemcount(45991) >= 1 |or
		Equip a Darkwood Fishing Pole |equipped Darkwood Fishing Pole##6366 |only if itemcount(6366) >= 1 |or
		Equip a Jeweled Fishing Pole |equipped Jeweled Fishing Pole##45992 |only if itemcount(45992) >= 1 |or
		Equip a Mastercraft Kalu'ak Fishing Pole |equipped Mastercraft Kalu'ak Fishing Pole##44050 |only if itemcount(44050) >= 1 |or
		Equip Nat Pagle's Extreme Angler FC-5000 |equipped Nat Pagle's Extreme Angler FC-5000##19022 |only if itemcount(19022) >= 1 |or
		Equip a Nat's Lucky Fishing Pole |equipped Nat's Lucky Fishing Pole##45858 |only if itemcount(45858) >= 1 |or
		Equip Seth's Graphite Fishing Pole |equipped Seth's Graphite Fishing Pole##25978 |only if itemcount(25978) >= 1 |or
		Equip a Strong Fishing Pole |equipped Strong Fishing Pole##6365 |only if itemcount(6365) >= 1 |or
	step
		map Crystalsong Forest/0
		path follow strictbounce; loop off; ants curved; dist 30
		path	49.38,56.90	43.56,55.74	39.51,54.33	33.68,46.38	27.06,44.09
		path	25.07,41.19	21.56,31.31	19.15,26.33	17.63,19.69	18.20,13.41
		cast Fishing##33095
		|tip Follow the path, fishing in Glassfin Minnow Schools along the way.
		|tip Enable fish tracking with "Find Fish" if you have it.
		|tip You must have a Fishing Pole equipped to fish.
		|tip A Fishing Pole can be purchased near most Fishing profession trainers.
		collect Glassfin Minnow##41814 |n
		'|confirm
]])

ZygorGuidesViewer:RegisterGuide("Profession Guides\\Fishing\\Farming Guides\\Imperial Manta Ray",{
	author="support@zygorguides.com",
	condition_suggested=function() return skill('Fishing') >= 475 end,
	condition_valid=function() return skill('Fishing') >= 380 end,
	condition_valid_msg="Your Fishing skill must be at least 380 to fish Imperial Manta Rays.",
	description="Imperial Manta Rays can be fished in Borean Tundra and Howling Fjord with a skill of at least 380. "..
		    "475 skill is required to avoid them getting away.",
	},[[
	step
		Equip a Fishing Pole |equipped Fishing Pole##6256 |only if default |or
		|tip A Fishing Pole can be purchased near most Fishing profession trainers. |only if default |or
		Equip an Arcanite Fishing Pole |equipped Arcanite Fishing Pole##19970 |only if itemcount(19970) >= 1 |or
		Equip a Big Iron Fishing Pole |equipped Big Iron Fishing Pole##6367 |only if itemcount(6367) >= 1 |or
		Equip a Blump Family Fishing Pole |equipped Blump Family Fishing Pole##12225 |only if itemcount(12225) >= 1 |or
		Equip a Bone Fishing Pole |equipped Bone Fishing Pole##45991 |only if itemcount(45991) >= 1 |or
		Equip a Darkwood Fishing Pole |equipped Darkwood Fishing Pole##6366 |only if itemcount(6366) >= 1 |or
		Equip a Jeweled Fishing Pole |equipped Jeweled Fishing Pole##45992 |only if itemcount(45992) >= 1 |or
		Equip a Mastercraft Kalu'ak Fishing Pole |equipped Mastercraft Kalu'ak Fishing Pole##44050 |only if itemcount(44050) >= 1 |or
		Equip Nat Pagle's Extreme Angler FC-5000 |equipped Nat Pagle's Extreme Angler FC-5000##19022 |only if itemcount(19022) >= 1 |or
		Equip a Nat's Lucky Fishing Pole |equipped Nat's Lucky Fishing Pole##45858 |only if itemcount(45858) >= 1 |or
		Equip Seth's Graphite Fishing Pole |equipped Seth's Graphite Fishing Pole##25978 |only if itemcount(25978) >= 1 |or
		Equip a Strong Fishing Pole |equipped Strong Fishing Pole##6365 |only if itemcount(6365) >= 1 |or
	step
		map Borean Tundra/0
		path follow strictbounce; loop off; ants curved; dist 30
		path	87.29,47.33	78.43,53.17	73.57,54.56	69.14,50.26	66.15,49.57
		path	65.03,53.30	63.51,60.03	59.28,72.66	55.20,75.26	51.69,78.18
		path	47.50,81.08	43.76,80.44	40.66,77.20	36.88,75.93	32.67,68.49
		path	29.31,62.48	28.18,54.14	40.85,34.52	44.96,23.48	42.28,16.53
		path	40.45,11.35
		cast Fishing##33095
		|tip Follow the path, fishing in Imperial Manta Ray Schools along the way.
		|tip Enable fish tracking with "Find Fish" if you have it.
		|tip You must have a Fishing Pole equipped to fish.
		|tip A Fishing Pole can be purchased near most Fishing profession trainers.
		collect Imperial Manta Ray##41802 |n
		'|confirm
]])

ZygorGuidesViewer:RegisterGuide("Profession Guides\\Fishing\\Farming Guides\\Magic Eater",{
	author="support@zygorguides.com",
	condition_suggested=function() return skill('Fishing') >= 525 end,
	condition_valid=function() return skill('Fishing') >= 430 end,
	condition_valid_msg="Your Fishing skill must be at least 430 to fish Magic Eaters.",
	description="Magic Eaters can be fished in The Underbelly of Dalaran with a skill of at least 430. "..
		    "525 skill is required to avoid them getting away.",
	},[[
	step
		Equip a Fishing Pole |equipped Fishing Pole##6256 |only if default |or
		|tip A Fishing Pole can be purchased near most Fishing profession trainers. |only if default |or
		Equip an Arcanite Fishing Pole |equipped Arcanite Fishing Pole##19970 |only if itemcount(19970) >= 1 |or
		Equip a Big Iron Fishing Pole |equipped Big Iron Fishing Pole##6367 |only if itemcount(6367) >= 1 |or
		Equip a Blump Family Fishing Pole |equipped Blump Family Fishing Pole##12225 |only if itemcount(12225) >= 1 |or
		Equip a Bone Fishing Pole |equipped Bone Fishing Pole##45991 |only if itemcount(45991) >= 1 |or
		Equip a Darkwood Fishing Pole |equipped Darkwood Fishing Pole##6366 |only if itemcount(6366) >= 1 |or
		Equip a Jeweled Fishing Pole |equipped Jeweled Fishing Pole##45992 |only if itemcount(45992) >= 1 |or
		Equip a Mastercraft Kalu'ak Fishing Pole |equipped Mastercraft Kalu'ak Fishing Pole##44050 |only if itemcount(44050) >= 1 |or
		Equip Nat Pagle's Extreme Angler FC-5000 |equipped Nat Pagle's Extreme Angler FC-5000##19022 |only if itemcount(19022) >= 1 |or
		Equip a Nat's Lucky Fishing Pole |equipped Nat's Lucky Fishing Pole##45858 |only if itemcount(45858) >= 1 |or
		Equip Seth's Graphite Fishing Pole |equipped Seth's Graphite Fishing Pole##25978 |only if itemcount(25978) >= 1 |or
		Equip a Strong Fishing Pole |equipped Strong Fishing Pole##6365 |only if itemcount(6365) >= 1 |or
	step
		cast Fishing##33095
		|tip Fish in the water in the Dalran Underbelly.
		|tip You must have a Fishing Pole equipped to fish.
		|tip A Fishing Pole can be purchased near most Fishing profession trainers.
		collect Magic Eater##43572 |goto Dalaran/1 61.78,15.32 |n
		'|confirm
]])

ZygorGuidesViewer:RegisterGuide("Profession Guides\\Fishing\\Farming Guides\\Moonglow Cuttlefish",{
	author="support@zygorguides.com",
	condition_suggested=function() return skill('Fishing') >= 575 end,
	condition_valid=function() return skill('Fishing') >= 480 end,
	condition_valid_msg="Your Fishing skill must be at least 480 to fish Moonglow Cuttlefish.",
	description="Moonglow Cuttlefish can be fished in Borean Tundra with a skill of at least 480. "..
		    "575 skill is required to avoid them getting away.",
	},[[
	step
		Equip a Fishing Pole |equipped Fishing Pole##6256 |only if default |or
		|tip A Fishing Pole can be purchased near most Fishing profession trainers. |only if default |or
		Equip an Arcanite Fishing Pole |equipped Arcanite Fishing Pole##19970 |only if itemcount(19970) >= 1 |or
		Equip a Big Iron Fishing Pole |equipped Big Iron Fishing Pole##6367 |only if itemcount(6367) >= 1 |or
		Equip a Blump Family Fishing Pole |equipped Blump Family Fishing Pole##12225 |only if itemcount(12225) >= 1 |or
		Equip a Bone Fishing Pole |equipped Bone Fishing Pole##45991 |only if itemcount(45991) >= 1 |or
		Equip a Darkwood Fishing Pole |equipped Darkwood Fishing Pole##6366 |only if itemcount(6366) >= 1 |or
		Equip a Jeweled Fishing Pole |equipped Jeweled Fishing Pole##45992 |only if itemcount(45992) >= 1 |or
		Equip a Mastercraft Kalu'ak Fishing Pole |equipped Mastercraft Kalu'ak Fishing Pole##44050 |only if itemcount(44050) >= 1 |or
		Equip Nat Pagle's Extreme Angler FC-5000 |equipped Nat Pagle's Extreme Angler FC-5000##19022 |only if itemcount(19022) >= 1 |or
		Equip a Nat's Lucky Fishing Pole |equipped Nat's Lucky Fishing Pole##45858 |only if itemcount(45858) >= 1 |or
		Equip Seth's Graphite Fishing Pole |equipped Seth's Graphite Fishing Pole##25978 |only if itemcount(25978) >= 1 |or
		Equip a Strong Fishing Pole |equipped Strong Fishing Pole##6365 |only if itemcount(6365) >= 1 |or
	step
		map Northrend/0
		path follow strictbounce; loop off; ants curved; dist 45
		path	30.30,67.10	30.97,67.50	31.84,67.43	32.91,66.97	33.81,66.56
		path	35.07,66.05
		cast Fishing##33095
		|tip Follow the path, fishing in Moonglow Cuttlefish Schools along the way.
		|tip Enable fish tracking with "Find Fish" if you have it.
		|tip You must have a Fishing Pole equipped to fish.
		|tip A Fishing Pole can be purchased near most Fishing profession trainers.
		collect Moonglow Cuttlefish##41801 |n
		'|confirm
]])

ZygorGuidesViewer:RegisterGuide("Profession Guides\\Fishing\\Farming Guides\\Musselback Sculpin",{
	author="support@zygorguides.com",
	condition_suggested=function() return skill('Fishing') >= 475 end,
	condition_valid=function() return skill('Fishing') >= 380 end,
	condition_valid_msg="Your Fishing skill must be at least 380 to fish Musselback Sculpin.",
	description="Musselback Sculpin can be fished in Borean Tundra and Dragonblight with a skill of at least 380. "..
		    "475 skill is required to avoid them getting away.",
	},[[
	step
		Equip a Fishing Pole |equipped Fishing Pole##6256 |only if default |or
		|tip A Fishing Pole can be purchased near most Fishing profession trainers. |only if default |or
		Equip an Arcanite Fishing Pole |equipped Arcanite Fishing Pole##19970 |only if itemcount(19970) >= 1 |or
		Equip a Big Iron Fishing Pole |equipped Big Iron Fishing Pole##6367 |only if itemcount(6367) >= 1 |or
		Equip a Blump Family Fishing Pole |equipped Blump Family Fishing Pole##12225 |only if itemcount(12225) >= 1 |or
		Equip a Bone Fishing Pole |equipped Bone Fishing Pole##45991 |only if itemcount(45991) >= 1 |or
		Equip a Darkwood Fishing Pole |equipped Darkwood Fishing Pole##6366 |only if itemcount(6366) >= 1 |or
		Equip a Jeweled Fishing Pole |equipped Jeweled Fishing Pole##45992 |only if itemcount(45992) >= 1 |or
		Equip a Mastercraft Kalu'ak Fishing Pole |equipped Mastercraft Kalu'ak Fishing Pole##44050 |only if itemcount(44050) >= 1 |or
		Equip Nat Pagle's Extreme Angler FC-5000 |equipped Nat Pagle's Extreme Angler FC-5000##19022 |only if itemcount(19022) >= 1 |or
		Equip a Nat's Lucky Fishing Pole |equipped Nat's Lucky Fishing Pole##45858 |only if itemcount(45858) >= 1 |or
		Equip Seth's Graphite Fishing Pole |equipped Seth's Graphite Fishing Pole##25978 |only if itemcount(25978) >= 1 |or
		Equip a Strong Fishing Pole |equipped Strong Fishing Pole##6365 |only if itemcount(6365) >= 1 |or
	step
		cast Fishing##33095
		|tip Fish in Musselback Sculpin Schools.
		|tip Enable fish tracking with "Find Fish" if you have it.
		|tip You must have a Fishing Pole equipped to fish.
		|tip A Fishing Pole can be purchased near most Fishing profession trainers.
		collect Musselback Sculpin##41806 |goto Borean Tundra/0 51.58,44.72 |n
		'|confirm
]])

ZygorGuidesViewer:RegisterGuide("Profession Guides\\Fishing\\Farming Guides\\Nettlefish",{
	author="support@zygorguides.com",
	condition_suggested=function() return skill('Fishing') >= 525 end,
	condition_valid=function() return skill('Fishing') >= 430 end,
	condition_valid_msg="Your Fishing skill must be at least 430 to fish Nettlefish.",
	description="Nettlefish can be fished in Sholazar Basin with a skill of at least 430. "..
		    "525 skill is required to avoid them getting away.",
	},[[
	step
		Equip a Fishing Pole |equipped Fishing Pole##6256 |only if default |or
		|tip A Fishing Pole can be purchased near most Fishing profession trainers. |only if default |or
		Equip an Arcanite Fishing Pole |equipped Arcanite Fishing Pole##19970 |only if itemcount(19970) >= 1 |or
		Equip a Big Iron Fishing Pole |equipped Big Iron Fishing Pole##6367 |only if itemcount(6367) >= 1 |or
		Equip a Blump Family Fishing Pole |equipped Blump Family Fishing Pole##12225 |only if itemcount(12225) >= 1 |or
		Equip a Bone Fishing Pole |equipped Bone Fishing Pole##45991 |only if itemcount(45991) >= 1 |or
		Equip a Darkwood Fishing Pole |equipped Darkwood Fishing Pole##6366 |only if itemcount(6366) >= 1 |or
		Equip a Jeweled Fishing Pole |equipped Jeweled Fishing Pole##45992 |only if itemcount(45992) >= 1 |or
		Equip a Mastercraft Kalu'ak Fishing Pole |equipped Mastercraft Kalu'ak Fishing Pole##44050 |only if itemcount(44050) >= 1 |or
		Equip Nat Pagle's Extreme Angler FC-5000 |equipped Nat Pagle's Extreme Angler FC-5000##19022 |only if itemcount(19022) >= 1 |or
		Equip a Nat's Lucky Fishing Pole |equipped Nat's Lucky Fishing Pole##45858 |only if itemcount(45858) >= 1 |or
		Equip Seth's Graphite Fishing Pole |equipped Seth's Graphite Fishing Pole##25978 |only if itemcount(25978) >= 1 |or
		Equip a Strong Fishing Pole |equipped Strong Fishing Pole##6365 |only if itemcount(6365) >= 1 |or
	step
	label "Start_Farming_Nettlefish"
		map Sholazar Basin/0
		path follow strictbounce; loop off; ants curved; dist 30
		path    50.26,62.43    52.27,63.09    55.27,62.43    57.30,57.24    58.19,53.02
		path    60.04,51.52    62.45,50.24    64.82,49.14    68.06,43.74    72.95,64.85
		path    69.56,66.73    66.15,67.03    61.91,67.76
		cast Fishing##33095
		|tip Follow the path, fishing in Nettlefish Schools along the way.
		|tip Enable fish tracking with "Find Fish" if you have it.
		|tip You must have a Fishing Pole equipped to fish.
		|tip A Fishing Pole can be purchased near most Fishing profession trainers.
		collect Nettlefish##41813 |n
		'|goto 61.91,67.76 < 30 |c |noway |or
		'|confirm
	step
		map Sholazar Basin/0
		path follow strictbounce; loop off; ants curved; dist 30
		path	57.95,84.52	55.23,86.14	51.43,85.78	48.51,83.05	44.64,79.95
		path	45.88,74.62	48.88,70.19	48.66,66.26	48.53,61.89	49.75,57.94
		path	49.50,55.43	48.71,50.87	45.42,50.09	45.57,44.94	42.93,43.41
		path	40.75,40.87	37.20,38.33	33.74,40.76	27.73,47.87	24.31,54.13
		path	22.69,58.80	22.04,61.10	24.25,60.21	26.83,61.46	29.89,61.97
		path	31.85,61.91	35.45,62.75	38.22,62.90	42.43,61.47	45.05,61.75
		path	48.98,61.70
		cast Fishing##33095
		|tip Follow the path, fishing in Nettlefish Schools along the way.
		|tip Enable fish tracking with "Find Fish" if you have it.
		|tip You must have a Fishing Pole equipped to fish.
		|tip A Fishing Pole can be purchased near most Fishing profession trainers.
		collect Nettlefish##41813 |n
		'|goto 48.98,61.70 < 30 |c |noway |next "Start_Farming_Nettlefish" |or
		'|confirm
]])

ZygorGuidesViewer:RegisterGuide("Profession Guides\\Fishing\\Farming Guides\\Rockfin Grouper",{
	author="support@zygorguides.com",
	condition_suggested=function() return skill('Fishing') >= 475 end,
	condition_valid=function() return skill('Fishing') >= 380 end,
	condition_valid_msg="Your Fishing skill must be at least 380 to fish Rockfin Grouper.",
	description="Rockfin Grouper can be fished in Borean Tundra with a skill of at least 380. "..
		    "475 skill is required to avoid them getting away.",
	},[[
	step
		Equip a Fishing Pole |equipped Fishing Pole##6256 |only if default |or
		|tip A Fishing Pole can be purchased near most Fishing profession trainers. |only if default |or
		Equip an Arcanite Fishing Pole |equipped Arcanite Fishing Pole##19970 |only if itemcount(19970) >= 1 |or
		Equip a Big Iron Fishing Pole |equipped Big Iron Fishing Pole##6367 |only if itemcount(6367) >= 1 |or
		Equip a Blump Family Fishing Pole |equipped Blump Family Fishing Pole##12225 |only if itemcount(12225) >= 1 |or
		Equip a Bone Fishing Pole |equipped Bone Fishing Pole##45991 |only if itemcount(45991) >= 1 |or
		Equip a Darkwood Fishing Pole |equipped Darkwood Fishing Pole##6366 |only if itemcount(6366) >= 1 |or
		Equip a Jeweled Fishing Pole |equipped Jeweled Fishing Pole##45992 |only if itemcount(45992) >= 1 |or
		Equip a Mastercraft Kalu'ak Fishing Pole |equipped Mastercraft Kalu'ak Fishing Pole##44050 |only if itemcount(44050) >= 1 |or
		Equip Nat Pagle's Extreme Angler FC-5000 |equipped Nat Pagle's Extreme Angler FC-5000##19022 |only if itemcount(19022) >= 1 |or
		Equip a Nat's Lucky Fishing Pole |equipped Nat's Lucky Fishing Pole##45858 |only if itemcount(45858) >= 1 |or
		Equip Seth's Graphite Fishing Pole |equipped Seth's Graphite Fishing Pole##25978 |only if itemcount(25978) >= 1 |or
		Equip a Strong Fishing Pole |equipped Strong Fishing Pole##6365 |only if itemcount(6365) >= 1 |or
	step
		cast Fishing##33095
		|tip Fish in the open water.
		|tip You must have a Fishing Pole equipped to fish.
		|tip A Fishing Pole can be purchased near most Fishing profession trainers.
		collect Rockfin Grouper##41803 |goto Northrend/0 31.10,67.37 |n
		'|confirm
]])

ZygorGuidesViewer:RegisterGuide("Profession Guides\\Fishing\\Farming Guides\\Sewer Carp",{
	author="support@zygorguides.com",
	condition_suggested=function() return skill('Fishing') >= 525 end,
	condition_valid=function() return skill('Fishing') >= 430 end,
	condition_valid_msg="Your Fishing skill must be at least 430 to fish Sewer Carp.",
	description="Sewer Carp can be fished in The Underbelly in Dalaran with a skill of at least 430. "..
		    "525 skill is required to avoid them getting away.",
	},[[
	step
		Equip a Fishing Pole |equipped Fishing Pole##6256 |only if default |or
		|tip A Fishing Pole can be purchased near most Fishing profession trainers. |only if default |or
		Equip an Arcanite Fishing Pole |equipped Arcanite Fishing Pole##19970 |only if itemcount(19970) >= 1 |or
		Equip a Big Iron Fishing Pole |equipped Big Iron Fishing Pole##6367 |only if itemcount(6367) >= 1 |or
		Equip a Blump Family Fishing Pole |equipped Blump Family Fishing Pole##12225 |only if itemcount(12225) >= 1 |or
		Equip a Bone Fishing Pole |equipped Bone Fishing Pole##45991 |only if itemcount(45991) >= 1 |or
		Equip a Darkwood Fishing Pole |equipped Darkwood Fishing Pole##6366 |only if itemcount(6366) >= 1 |or
		Equip a Jeweled Fishing Pole |equipped Jeweled Fishing Pole##45992 |only if itemcount(45992) >= 1 |or
		Equip a Mastercraft Kalu'ak Fishing Pole |equipped Mastercraft Kalu'ak Fishing Pole##44050 |only if itemcount(44050) >= 1 |or
		Equip Nat Pagle's Extreme Angler FC-5000 |equipped Nat Pagle's Extreme Angler FC-5000##19022 |only if itemcount(19022) >= 1 |or
		Equip a Nat's Lucky Fishing Pole |equipped Nat's Lucky Fishing Pole##45858 |only if itemcount(45858) >= 1 |or
		Equip Seth's Graphite Fishing Pole |equipped Seth's Graphite Fishing Pole##25978 |only if itemcount(25978) >= 1 |or
		Equip a Strong Fishing Pole |equipped Strong Fishing Pole##6365 |only if itemcount(6365) >= 1 |or
	step
		cast Fishing##33095
		|tip Fish in the water.
		|tip You must have a Fishing Pole equipped to fish.
		|tip A Fishing Pole can be purchased near most Fishing profession trainers.
		collect Sewer Carp##43571 |n
		'|confirm
]])

-------------------------------
---     WOTLK HERBALISM     ---
-------------------------------

--@@TRIALGUIDE
ZygorGuidesViewer:RegisterGuide("Profession Guides\\Herbalism\\Farming Guides\\Adder's Tongue",{
	author="support@zygorguides.com",
	},[[
	step
		map Sholazar Basin/0
		path follow smart; loop on; ants curved; dist 30
		path	24.23,56.13	27.03,55.88	28.77,58.22	30.23,54.96	29.81,49.57
		path	30.16,47.28	33.16,47.05	35.35,48.39	37.38,50.81	38.86,53.62
		path	40.12,57.19	38.28,58.88	35.54,59.62	33.29,60.96	33.97,63.13
		path	36.14,64.74	38.39,66.80	40.60,66.19	41.59,67.02	42.33,70.20
		path	43.23,74.84	43.38,79.66	43.24,82.82	40.64,84.76	37.93,83.94
		path	36.78,82.55	35.42,82.23	33.77,83.66	32.50,84.16	30.86,84.19
		path	28.98,83.64	28.84,80.96	29.94,78.24	29.66,74.84	30.05,71.44
		path	29.72,69.53	28.01,66.13	26.96,64.47	25.20,65.29	22.71,63.99
		path	21.97,60.65	22.37,57.35
		click Adder's Tongue##191019+
		|tip They look like bushy green plants on the ground.
		|tip Track them on your minimap with "Find Herbs".
		collect Adder's Tongue##36903 |n
		'|confirm
]])

ZygorGuidesViewer:RegisterGuide("Profession Guides\\Herbalism\\Farming Guides\\Deadnettle",{
	author="support@zygorguides.com",
	},[[
	step
		map Grizzly Hills/0
		path follow smart; loop on; ants curved; dist 30
		path	33.60,58.17	36.73,58.03	40.04,57.32	44.72,56.61	47.84,54.58
		path	49.81,54.05	54.38,54.30	58.84,55.09	61.72,55.01	64.82,54.36
		path	67.56,53.51	69.48,52.86	71.51,50.73	73.75,50.67	76.35,51.72
		path	78.33,53.39	79.69,55.25	80.88,53.66	80.34,49.90	80.03,45.95
		path	79.35,43.82	77.25,42.64	76.79,41.22	76.18,40.15	75.90,38.34
		path	74.65,37.57	72.81,36.20	72.32,33.61	72.24,30.71	73.13,27.76
		path	73.37,24.33	72.23,22.72	70.75,22.30	69.43,22.95	68.63,25.69
		path	66.08,27.92	63.75,26.91	62.03,28.43	60.18,30.64	58.52,32.86
		path	56.99,34.12	56.16,34.41	54.76,32.26	52.78,28.95	51.02,27.53
		path	48.13,28.53	46.37,29.45	44.18,30.41	41.83,30.63	37.72,31.11
		path	35.93,31.48	33.88,34.64	32.49,36.10	30.70,37.06	28.89,38.03
		path	26.96,37.87	25.61,36.39	24.73,34.12	23.73,31.33	23.47,28.76
		path	22.53,26.99	19.82,27.91	17.62,29.55	14.61,30.69	12.77,33.55
		path	12.00,36.91	12.50,40.99	12.99,43.47	14.55,45.14	16.66,47.58
		path	15.92,50.34	15.24,53.54	15.01,59.35	14.77,62.65	13.32,65.87
		path	12.65,72.26	13.95,73.25	16.82,72.05	18.71,68.56	18.80,64.10
		path	20.52,60.79	25.85,54.57	29.85,56.37	32.97,57.20
		Click herbs as you follow the path around this area
		|tip Deadnettle drops from Tiger Lily, Frost Lotus, Goldclover, and Talandra's Rose.
		|tip Track them on your minimap with "Find Herbs".
		collect Deadnettle##37921 |n
		'|confirm
]])

ZygorGuidesViewer:RegisterGuide("Profession Guides\\Herbalism\\Farming Guides\\Goldclover",{
	author="support@zygorguides.com",
	},[[
	step
		map Grizzly Hills/0
		path follow smart; loop on; ants curved; dist 30
		path	33.60,58.17	36.73,58.03	40.04,57.32	44.72,56.61	47.84,54.58
		path	49.81,54.05	54.38,54.30	58.84,55.09	61.72,55.01	64.82,54.36
		path	67.56,53.51	69.48,52.86	71.51,50.73	73.75,50.67	76.35,51.72
		path	78.33,53.39	79.69,55.25	80.88,53.66	80.34,49.90	80.03,45.95
		path	79.35,43.82	77.25,42.64	76.79,41.22	76.18,40.15	75.90,38.34
		path	74.65,37.57	72.81,36.20	72.32,33.61	72.24,30.71	73.13,27.76
		path	73.37,24.33	72.23,22.72	70.75,22.30	69.43,22.95	68.63,25.69
		path	66.08,27.92	63.75,26.91	62.03,28.43	60.18,30.64	58.52,32.86
		path	56.99,34.12	56.16,34.41	54.76,32.26	52.78,28.95	51.02,27.53
		path	48.13,28.53	46.37,29.45	44.18,30.41	41.83,30.63	37.72,31.11
		path	35.93,31.48	33.88,34.64	32.49,36.10	30.70,37.06	28.89,38.03
		path	26.96,37.87	25.61,36.39	24.73,34.12	23.73,31.33	23.47,28.76
		path	22.53,26.99	19.82,27.91	17.62,29.55	14.61,30.69	12.77,33.55
		path	12.00,36.91	12.50,40.99	12.99,43.47	14.55,45.14	16.66,47.58
		path	15.92,50.34	15.24,53.54	15.01,59.35	14.77,62.65	13.32,65.87
		path	12.65,72.26	13.95,73.25	16.82,72.05	18.71,68.56	18.80,64.10
		path	20.52,60.79	25.85,54.57	29.85,56.37	32.97,57.20
		click Goldclover##189973+
		|tip They look like clusters of yellow clovers on the ground.
		|tip Track them on your minimap with "Find Herbs".
		collect Goldclover##36901 |n
		'|confirm
]])

ZygorGuidesViewer:RegisterGuide("Profession Guides\\Herbalism\\Farming Guides\\Icethorn",{
	author="support@zygorguides.com",
	},[[
	step
		map The Storm Peaks/0
		path follow smart; loop on; ants curved; dist 30
		path	40.48,84.72	38.66,87.17	37.60,88.31	36.46,88.65	35.02,88.40
		path	33.04,87.96	32.36,87.32	31.15,86.01	31.26,83.85	32.88,82.55
		path	34.41,82.23	37.43,81.32	38.61,80.09	38.42,77.89	38.35,76.11
		path	38.74,73.99	37.68,73.22	36.73,71.76	36.68,69.14	36.32,67.06
		path	34.88,65.94	30.85,65.94	29.52,67.06	29.48,69.42	29.23,70.90
		path	27.57,72.50	26.02,72.85	25.60,71.51	26.75,67.96	27.06,65.35
		path	26.93,62.88	26.18,62.34	24.08,61.56	23.06,60.72	21.86,57.73
		path	22.87,55.34	24.36,56.14	27.01,56.95	27.90,55.75	28.61,53.06
		path	29.83,51.20	31.85,50.00	32.80,49.22	33.11,48.06	33.67,45.40
		path	34.61,43.60	35.58,42.52	36.26,43.24	37.45,45.62	39.00,47.32
		path	39.40,48.12	39.25,49.56	38.64,51.52	37.74,54.90	37.82,57.96
		path	37.92,61.22	37.98,63.22	38.43,63.67	39.29,63.34	41.71,62.19
		path	43.54,59.60	43.96,56.47	43.76,55.08	45.37,54.72	46.71,56.45
		path	48.25,58.99	48.84,60.33	48.86,63.66	49.78,64.45	51.20,64.42
		path	52.87,65.09	54.07,66.91	54.51,68.66	52.51,70.07	50.76,72.23
		path	49.99,73.68	49.17,77.80	46.82,77.95	44.64,78.02	41.03,78.62
		path	41.08,81.81
		click Icethorn##190172+
		|tip They look like white and blue thorns growing out of the ground.
		|tip Track them on your minimap with "Find Herbs".
		collect Icethorn##36906 |n
		'|confirm
]])

ZygorGuidesViewer:RegisterGuide("Profession Guides\\Herbalism\\Farming Guides\\Lichbloom",{
	author="support@zygorguides.com",
	},[[
	step
		map The Storm Peaks/0
		path follow smart; loop on; ants curved; dist 30
		path	40.48,84.72	38.66,87.17	37.60,88.31	36.46,88.65	35.02,88.40
		path	33.04,87.96	32.36,87.32	31.15,86.01	31.26,83.85	32.88,82.55
		path	34.41,82.23	37.43,81.32	38.61,80.09	38.42,77.89	38.35,76.11
		path	38.74,73.99	37.68,73.22	36.73,71.76	36.68,69.14	36.32,67.06
		path	34.88,65.94	30.85,65.94	29.52,67.06	29.48,69.42	29.23,70.90
		path	27.57,72.50	26.02,72.85	25.60,71.51	26.75,67.96	27.06,65.35
		path	26.93,62.88	26.18,62.34	24.08,61.56	23.06,60.72	21.86,57.73
		path	22.87,55.34	24.36,56.14	27.01,56.95	27.90,55.75	28.61,53.06
		path	29.83,51.20	31.85,50.00	32.80,49.22	33.11,48.06	33.67,45.40
		path	34.61,43.60	35.58,42.52	36.26,43.24	37.45,45.62	39.00,47.32
		path	39.40,48.12	39.25,49.56	38.64,51.52	37.74,54.90	37.82,57.96
		path	37.92,61.22	37.98,63.22	38.43,63.67	39.29,63.34	41.71,62.19
		path	43.54,59.60	43.96,56.47	43.76,55.08	45.37,54.72	46.71,56.45
		path	48.25,58.99	48.84,60.33	48.86,63.66	49.78,64.45	51.20,64.42
		path	52.87,65.09	54.07,66.91	54.51,68.66	52.51,70.07	50.76,72.23
		path	49.99,73.68	49.17,77.80	46.82,77.95	44.64,78.02	41.03,78.62
		path	41.08,81.81
		click Lichbloom##190171+
		|tip They look like curling purple and blue plants on the ground.
		|tip Track them on your minimap with "Find Herbs".
		collect Lichbloom##36905 |n
		'|confirm
]])

ZygorGuidesViewer:RegisterGuide("Profession Guides\\Herbalism\\Farming Guides\\Talandra's Rose",{
	author="support@zygorguides.com",
	},[[
	step
		map Zul'Drak/0
		path follow smart; loop on; ants curved; dist 30
		path	30.73,71.40	25.40,79.65	25.69,82.59	28.19,83.79	30.34,84.28
		path	33.89,87.85	37.49,87.33	39.15,86.41	38.96,80.98	37.83,76.32
		path	36.21,70.92	34.35,67.41	34.28,65.19	35.61,62.86	37.93,60.71
		path	38.86,59.78	39.78,61.44	41.55,62.24	43.04,61.33	43.35,55.94
		path	43.58,51.98	43.97,46.40	44.49,43.06	44.04,41.71	42.45,42.35
		path	40.87,42.51	39.72,43.88	37.35,43.41	36.27,41.67	34.89,42.02
		path	33.40,45.88	33.03,48.26	31.58,44.80	30.13,42.80	28.47,42.98
		path	25.80,47.81	23.38,49.56	24.60,51.79	27.64,55.17	30.12,56.24
		path	30.81,63.95
		click Talandra's Rose##190170+
		|tip They look like leafy pink and red flowers on the ground.
		|tip Track them on your minimap with "Find Herbs".
		collect Talandra's Rose##36907 |n
		'|confirm
]])

ZygorGuidesViewer:RegisterGuide("Profession Guides\\Herbalism\\Farming Guides\\Tiger Lily",{
	author="support@zygorguides.com",
	},[[
	step
		map Grizzly Hills/0
		path follow smart; loop on; ants curved; dist 30
		path	27.83,63.12	28.20,60.55	30.23,56.16	29.74,52.24	30.47,48.98
		path	31.42,44.66	33.84,43.45	35.65,41.84	37.60,40.16	38.51,37.53
		path	38.74,36.28	41.48,35.95	41.77,33.64	39.88,32.55	38.27,32.31
		path	35.71,33.31	33.82,36.90	32.03,39.41	30.47,41.22	27.87,41.31
		path	25.61,40.68	23.99,41.60	22.09,41.60	19.52,40.88	17.64,40.59
		path	14.02,40.64	8.38,37.90	8.27,40.87	8.80,41.42	11.29,42.78
		path	13.83,45.75	16.93,49.10	16.20,51.25	14.61,53.39	13.18,59.23
		path	13.33,62.34	15.63,63.79	17.95,66.09	21.27,67.48	23.13,68.61
		path	24.89,68.85	26.26,70.55	27.32,68.67	27.81,65.33
		click Tiger Lily##190169+
		|tip They look like red flowers with bright green stems on the ground.
		|tip Track them on your minimap with "Find Herbs".
		collect Tiger Lily##36904 |n
		'|confirm
]])

----------------------------
---     WOTLK MINING     ---
----------------------------

--@@TRIALGUIDE
ZygorGuidesViewer:RegisterGuide("Profession Guides\\Mining\\Farming Guides\\Cobalt Ore",{
	author="support@zygorguides.com",
	},[[
	step
		map Howling Fjord/0
		path follow smart; loop on; ants curved; dist 30
		path	55.65,17.60	53.52,15.00	51.43,15.71	49.20,14.74	47.56,15.38
		path	45.05,13.89	43.14,13.19	41.34,13.29	40.23,14.59	38.60,14.93
		path	37.64,16.63	36.43,16.99	35.40,15.49	32.38,11.59	30.00,10.92
		path	26.87,11.45	23.99,12.75	23.01,13.71	23.35,16.35	23.44,18.65
		path	21.16,22.18	20.25,24.48	21.23,26.31	22.95,26.56	24.19,25.71
		path	25.40,23.02	26.71,22.98	27.79,25.04	27.53,28.00	27.68,29.99
		path	30.40,30.52	32.46,30.72	33.34,29.71	34.89,28.56	36.68,28.46
		path	38.80,27.56	39.48,29.21	40.90,30.52	44.05,31.72	45.86,31.80
		path	47.02,34.07	48.36,35.08	50.93,33.85	52.89,34.14	55.30,35.21
		path	57.83,37.08	60.42,38.26	62.79,40.38	64.35,42.45	65.48,48.32
		path	65.93,51.73	67.05,53.90	67.80,56.08	68.47,59.74	66.95,63.80
		path	65.01,66.28	64.47,69.52	64.82,71.76	65.94,72.50	68.40,73.31
		path	70.29,73.66	71.48,70.48	72.00,69.07	73.67,68.26	76.42,67.33
		path	77.11,65.13	76.75,62.91	73.39,60.77	73.92,57.74	75.91,52.76
		path	76.90,51.02	78.76,48.21	79.67,45.76	78.27,44.92	75.77,44.46
		path	73.89,43.50	74.69,39.29	71.07,38.60	69.75,33.99	70.56,32.18
		path	69.18,30.96	68.13,28.96	70.46,26.26	73.37,22.20	73.03,19.18
		path	71.72,13.55	71.53,11.86	70.13,11.18	68.47,10.35	66.46,13.07
		path	65.17,16.95	63.95,20.60	60.91,22.40	60.52,24.71	58.88,24.52
		path	57.84,21.39	57.56,17.79	56.26,16.77
		click Cobalt Deposit##189978+
		click Rich Cobalt Deposit##189979+
		|tip They look like large blue clusters of rock and crystals.
		|tip Track them on your minimap with "Find Minerals".
		collect Cobalt Ore##36909 |n
		'|confirm
]])

ZygorGuidesViewer:RegisterGuide("Profession Guides\\Mining\\Farming Guides\\Saronite Ore",{
	author="support@zygorguides.com",
	},[[
	step
		map Icecrown/0
		path follow smart; loop on; ants curved; dist 30
		path	79.27,65.32	80.51,63.45	80.55,60.91	80.11,58.43	79.71,55.90
		path	78.57,54.98	76.16,53.63	74.31,53.72	72.37,52.46	70.19,51.19
		path	68.54,50.18	68.10,49.16	68.42,47.09	71.54,42.33	71.77,41.02
		path	70.80,39.72	69.17,39.54	66.84,39.75	65.22,39.43	63.46,37.28
		path	62.15,34.64	60.96,31.35	58.97,32.07	56.70,33.49	55.46,34.36
		path	53.15,36.55	51.51,36.91	49.18,36.87	46.07,35.95	44.29,39.29
		path	40.80,40.94	40.12,42.66	39.54,44.03	38.93,44.94	38.07,48.02
		path	38.18,49.57	37.68,51.43	36.63,51.07	35.74,50.18	34.32,48.74
		path	32.65,48.37	32.04,50.86	32.76,53.74	31.75,57.06	31.27,59.57
		path	30.57,62.54	31.30,66.34	32.34,69.72	34.25,69.54	36.01,70.86
		path	37.83,69.46	38.62,68.21	40.71,66.06	42.62,65.37	47.84,65.25
		path	49.03,63.72	49.25,62.37	47.89,57.80	48.08,53.78	48.13,50.05
		path	48.61,47.04	51.44,45.25	55.15,43.88	57.87,43.96	59.59,46.21
		path	61.20,47.93	62.33,50.75	62.58,54.26	64.21,56.39	65.31,59.10
		path	66.48,61.81	66.37,64.78	67.17,70.17	67.87,70.86	69.35,69.71
		path	72.29,67.71	72.82,64.27	73.82,61.06	76.10,61.31	77.53,63.76
		click Saronite Deposit##189980+
		click Rich Saronite Deposit##189981+
		|tip They look like large green clusters of rock and crystals.
		|tip Track them on your minimap with "Find Minerals".
		collect Saronite Ore##36912 |n
		'|confirm
]])

ZygorGuidesViewer:RegisterGuide("Profession Guides\\Mining\\Farming Guides\\Titanium Ore",{
	author="support@zygorguides.com",
	},[[
	step
		map Icecrown/0
		path follow smart; loop on; ants curved; dist 30
		path	79.27,65.32	80.51,63.45	80.55,60.91	80.11,58.43	79.71,55.90
		path	78.57,54.98	76.16,53.63	74.31,53.72	72.37,52.46	70.19,51.19
		path	68.54,50.18	68.10,49.16	68.42,47.09	71.54,42.33	71.77,41.02
		path	70.80,39.72	69.17,39.54	66.84,39.75	65.22,39.43	63.46,37.28
		path	62.15,34.64	60.96,31.35	58.97,32.07	56.70,33.49	55.46,34.36
		path	53.15,36.55	51.51,36.91	49.18,36.87	46.07,35.95	44.29,39.29
		path	40.80,40.94	40.12,42.66	39.54,44.03	38.93,44.94	38.07,48.02
		path	38.18,49.57	37.68,51.43	36.63,51.07	35.74,50.18	34.32,48.74
		path	32.65,48.37	32.04,50.86	32.76,53.74	31.75,57.06	31.27,59.57
		path	30.57,62.54	31.30,66.34	32.34,69.72	34.25,69.54	36.01,70.86
		path	37.83,69.46	38.62,68.21	40.71,66.06	42.62,65.37	47.84,65.25
		path	49.03,63.72	49.25,62.37	47.89,57.80	48.08,53.78	48.13,50.05
		path	48.61,47.04	51.44,45.25	55.15,43.88	57.87,43.96	59.59,46.21
		path	61.20,47.93	62.33,50.75	62.58,54.26	64.21,56.39	65.31,59.10
		path	66.48,61.81	66.37,64.78	67.17,70.17	67.87,70.86	69.35,69.71
		path	72.29,67.71	72.82,64.27	73.82,61.06	76.10,61.31	77.53,63.76
		click Titanium Vein##191133+
		|tip They look like large blue clusters of rock and crystals.
		|tip Track them on your minimap with "Find Minerals".
		|tip They share spawns with Saronite Deposits, so gather those as well.
		collect Titanium Ore##36910 |n
		'|confirm
]])

------------------------------
---     WOTLK SKINNING     ---
------------------------------

ZygorGuidesViewer:RegisterGuide("Profession Guides\\Skinning\\Farming Guides\\Borean Leather",{
	author="support@zygorguides.com",
	},[[
	step
	label "Begin_Farming_Borean_Leather"
		map Borean Tundra/0
		path follow smart; loop on; ants curved; dist 30
		path	47.21,48.30	44.24,47.61	41.18,46.20	40.98,44.66	41.46,41.47
		path	42.96,40.00	43.64,40.96	45.77,41.70	46.85,43.10	47.89,46.20
		Kill Wooly Rhino enemies around along the path
		|tip Skin their corpses.
		|tip You will need 345 Skinning skill minimum to skin all of these mobs.
		collect Borean Leather##33568 |n
		'|goto 47.89,46.20 < 30 |c |noway
	step
		map Borean Tundra/0
		path follow smart; loop on; ants curved; dist 30
		path	50.60,68.96	49.51,72.06	47.53,73.94	44.84,74.30	42.65,74.76
		path	40.52,72.87	41.06,70.43	43.42,70.41	45.00,70.40	47.12,70.14
		path	48.70,69.55	50.08,66.87
		Kill Wooly Rhino enemies around along the path
		|tip Skin their corpses.
		|tip You will need 345 Skinning skill minimum to skin all of these mobs.
		collect Borean Leather##33568 |n
		'|goto 50.08,66.87 < 30 |c |noway |next "Begin_Farming_Borean_Leather"
]])

-------------------------------
---     WOTLK TAILORING     ---
-------------------------------

ZygorGuidesViewer:RegisterGuide("Profession Guides\\Tailoring\\Farming Guides\\Frostweave Cloth",{
	author="support@zygorguides.com",
	},[[
	step
		kill Mjordin Combatant##30037+
		|tip They will continuously respawn when you deplete their numbers.
		collect Frostweave Cloth##2589 |goto Icecrown/0 37.29,23.72 |n
		'|confirm
]])