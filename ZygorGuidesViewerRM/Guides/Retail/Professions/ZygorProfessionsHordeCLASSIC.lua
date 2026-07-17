local ZygorGuidesViewer=ZygorGuidesViewer
if not ZygorGuidesViewer then return end
if UnitFactionGroup("player")~="Horde" then return end
ZGV.BETASTART()
ZGV.BETAEND()
ZygorGuidesViewer.GuideMenuTier = "CLA"
ZygorGuidesViewer:RegisterGuide("Profession Guides\\Alchemy\\Alchemy (1-375)",{
author="support@zygorguides.com",
condition_suggested=function() return skill("Alchemy") > 0 and skill("Alchemy") < 375 end,
description="This guide will walk you through leveling your Alchemy skill from 1-375.",
},[[
step
Reach Level 5 |ding 5
|tip You must be at least level 5 to train Apprentice professions.
|tip Use the leveling guides to accomplish this.
step
Enter the building |goto Orgrimmar/0 56.48,35.25 < 7 |walk
talk Yelmak##3347
|tip Inside the building.
Train Apprentice Alchemy |skillmax Alchemy,75 |goto Orgrimmar/0 56.84,33.03
step
Click Here if You Would Like to Collect All Materials First |confirm |next |or
_Or_
Click Here to Collect Materials as You Level or Resume Leveling Alchemy |confirm |next "Begin_Profession_Leveling" |or
'|complete skill("Alchemy") >= 375 |or |next "Begin_Profession_Leveling"
stickystart "Collect_Silverleaf_Total"
stickystart "Collect_Briarthorn_Total"
stickystart "Collect_Bruiseweed_Total"
stickystart "Collect_Mageroyal_Total"
stickystart "Collect_Stranglekelp_Total"
stickystart "Collect_Liferoot_Total"
stickystart "Collect_Kingsblood_Total"
stickystart "Collect_Goldthorn_Total"
stickystart "Collect_Wild_Steelbloom_Total"
step
map Tirisfal Glades
path follow smart; loop on; ants curved; dist 20
path	51.54,54.24	50.24,56.05	47.60,53.12	45.65,51.89	46.96,47.83
path	44.74,46.19	42.79,42.59	41.45,40.79	39.11,40.30	38.92,43.20
path	38.50,46.14	36.48,47.41	34.54,48.14	32.02,48.17	31.72,50.34
path	33.92,51.19	37.36,51.84	38.60,52.08	39.77,54.03	40.68,58.21
path	40.92,60.80	41.92,63.49	44.02,65.29	46.57,66.37	49.11,67.48
path	50.44,66.83	51.57,64.64	54.10,62.49	56.28,59.15	56.53,55.12
path	53.81,53.15	52.04,54.99
Click herbs as you follow the path around this area
|tip Track them on your minimap with "Find Herbs".
collect 65 Peacebloom##2447 |or
|tip Farm them with Herbalism or purchase them from the auction house.
|tip These totals are approximate.
|tip You may need more or less than the indicated amount.
'|complete skill("Alchemy") >= 60 |or
step
label "Collect_Silverleaf_Total"
map Tirisfal Glades
path follow smart; loop on; ants curved; dist 20
path	51.54,54.24	50.24,56.05	47.60,53.12	45.65,51.89	46.96,47.83
path	44.74,46.19	42.79,42.59	41.45,40.79	39.11,40.30	38.92,43.20
path	38.50,46.14	36.48,47.41	34.54,48.14	32.02,48.17	31.72,50.34
path	33.92,51.19	37.36,51.84	38.60,52.08	39.77,54.03	40.68,58.21
path	40.92,60.80	41.92,63.49	44.02,65.29	46.57,66.37	49.11,67.48
path	50.44,66.83	51.57,64.64	54.10,62.49	56.28,59.15	56.53,55.12
path	53.81,53.15	52.04,54.99
Click herbs as you follow the path around this area
|tip Track them on your minimap with "Find Herbs".
collect 65 Silverleaf##765 |or
|tip Farm them with Herbalism or purchase them from the auction house. |notinsticky
|tip These totals are approximate. |notinsticky
|tip You may need more or less than the indicated amount. |notinsticky
'|complete skill("Alchemy") >= 60 |or
step
label "Collect_Briarthorn_Total"
map Silverpine Forest
path follow smart; loop off; dist 20
path	49.04,32.38	49.42,35.61	49.42,37.96	49.76,40.18	50.52,43.34
path	52.66,43.16	54.51,44.07	52.79,45.65	51.98,49.91	52.04,52.85
path	51.86,56.81	52.43,59.23	51.75,62.42	54.26,63.98	55.27,61.88
path	56.68,60.37	58.05,62.07	56.16,64.50	54.77,66.89	54.34,71.81
path	54.65,74.35	56.82,76.43	59.65,77.20	61.93,77.46	64.26,78.75
path	66.96,79.79
Click herbs as you follow the path around this area
|tip Briarthorn can share a spawn with other herbs in the area, so pick them all.
|tip Track them on your minimap with "Find Herbs".
|tip You will need level 70 Herbalism to collect these.
collect 100 Briarthorn##2450 |or
|tip Farm them with Herbalism or purchase them from the auction house. |notinsticky
|tip These totals are approximate. |notinsticky
|tip You may need more or less than the indicated amount. |notinsticky
'|complete skill("Alchemy") >= 140 |or
'|goto 66.96,79.79 < 20 |noway |c |or
step
map Silverpine Forest
path follow smart; loop off; dist 20
path	66.96,79.79	64.26,78.75	61.93,77.46	59.65,77.20	56.82,76.43
path	54.65,74.35	54.34,71.81	54.77,66.89	56.16,64.50	58.05,62.07
path	56.68,60.37	55.27,61.88	54.26,63.98	51.75,62.42	52.43,59.23
path	51.86,56.81	52.04,52.85	51.98,49.91	52.79,45.65	54.51,44.07
path	52.66,43.16	50.52,43.34	49.76,40.18	49.42,37.96	49.42,35.61
path	49.04,32.38
Click herbs as you follow the path around this area
|tip Briarthorn can share a spawn with other herbs in the area, so pick them all.
|tip Track them on your minimap with "Find Herbs".
|tip You will need level 70 Herbalism to collect these.
collect 100 Briarthorn##2450 |or
|tip Farm them with Herbalism or purchase them from the auction house. |notinsticky
|tip These totals are approximate. |notinsticky
|tip You may need more or less than the indicated amount. |notinsticky
'|complete skill("Alchemy") >= 140 |or
'|goto 49.04,32.38 < 20 |noway |c |next "Collect_Briarthorn_Total" |or
step
label "Collect_Bruiseweed_Total"
map Ashenvale
path follow smart; loop off; dist 20
path	30.47,44.71	27.77,48.81	25.72,50.64	28.38,54.47	34.66,54.20
path	35.41,56.86	34.85,58.62	32.71,59.66	34.71,59.96	38.06,62.62
path	40.48,61.75	39.97,65.16	41.82,64.95	43.85,63.15	47.09,61.20
path	48.42,60.26	49.98,59.22	54.29,60.93	56.36,63.51	57.82,64.38
path	59.14,70.90	60.56,73.42	69.78,74.49	71.98,73.86	74.94,73.92
Click herbs as you follow the path around this area
|tip Track them on your minimap with "Find Herbs".
|tip You will need level 100 Herbalism to collect these.
collect 35 Bruiseweed##2453 |or
|tip Farm them with Herbalism or purchase them from the auction house. |notinsticky
|tip These totals are approximate. |notinsticky
|tip You may need more or less than the indicated amount. |notinsticky
'|complete skill("Alchemy") >= 140 |or
'|goto 74.94,73.92 < 20 |noway |c |or
step
map Ashenvale
path follow smart; loop off; dist 20
path	74.94,73.92	71.98,73.86	69.78,74.49	60.56,73.42	59.14,70.90
path	57.82,64.38	56.36,63.51	54.29,60.93	49.98,59.22	48.42,60.26
path	47.09,61.20	43.85,63.15	41.82,64.95	39.97,65.16	40.48,61.75
path	38.06,62.62	34.71,59.96	32.71,59.66	34.85,58.62	35.41,56.86
path	34.66,54.20	28.38,54.47	25.72,50.64	27.77,48.81	30.47,44.71
Click herbs as you follow the path around this area
|tip Track them on your minimap with "Find Herbs".
|tip You will need level 100 Herbalism to collect these.
collect 35 Bruiseweed##2453 |or
|tip Farm them with Herbalism or purchase them from the auction house. |notinsticky
|tip These totals are approximate. |notinsticky
|tip You may need more or less than the indicated amount. |notinsticky
'|complete skill("Alchemy") >= 140 |or
'|goto 30.47,44.71 < 20 |noway |c |next "Collect_Bruiseweed_Total" |or
step
label "Collect_Mageroyal_Total"
map The Barrens
path follow smart; loop on; ants curved; dist 20
path	59.15,37.73	58.67,39.28	59.28,40.67	61.05,41.62	61.87,41.98
path	61.83,43.50	61.73,44.93	62.46,45.59	62.55,47.02	61.37,48.53
path	61.16,49.91	60.17,50.20	58.92,50.02	56.90,50.43	56.86,47.77
path	56.42,45.86	55.99,45.25	56.38,43.40	56.07,41.87	55.04,41.51
path	54.83,42.75	54.03,43.67	53.18,45.13	52.20,45.76	48.47,46.84
path	46.80,43.94	43.45,40.70	43.61,38.41	41.90,37.41	42.70,35.52
path	42.16,33.03	39.72,31.26	39.93,29.78	40.90,27.82	42.44,25.74
path	45.14,25.67	46.02,24.49	45.83,22.32	45.17,21.63	44.47,21.60
path	43.39,20.61	41.18,19.63	40.38,15.78	43.73,15.53	48.89,13.63
path	53.28,14.18	55.37,9.81	57.33,9.22	58.34,7.44	60.18,7.56
path	62.69,8.90	62.42,11.56	62.31,16.47	61.10,19.72	59.62,20.88
path	58.10,21.14	57.12,23.28	58.85,25.07	60.26,28.59	60.58,31.18
path	60.20,34.14	59.26,36.84
Click herbs as you follow the path around this area
|tip Track them on your minimap with "Find Herbs".
|tip You will need level 50 Herbalism to collect these.
collect 20 Mageroyal##785 |or
|tip Farm them with Herbalism or purchase them from the auction house. |notinsticky
|tip These totals are approximate. |notinsticky
|tip You may need more or less than the indicated amount. |notinsticky
'|complete skill("Alchemy") >= 155 |or
step
label "Collect_Stranglekelp_Total"
map Stranglethorn Vale
path follow smart; loop off; dist 20
path	27.56,22.38	28.55,26.38	30.37,30.98	33.88,33.36	30.36,35.99
path	27.70,38.32	26.24,42.31	26.20,47.90	22.96,47.20	21.86,51.72
path	22.04,55.91	25.74,57.13	23.90,60.72	23.70,64.65	26.18,68.29
path	23.58,75.22	24.21,79.36	25.98,84.41	31.39,83.70	33.23,80.90
path	34.46,76.56	37.38,68.78	38.81,62.94
Click herbs as you follow the path around this area
|tip Track them on your minimap with "Find Herbs".
|tip They are underwater along the path.
|tip Bring Water Walking Potions.
|tip You will need level 85 Herbalism to collect these.
collect 50 Stranglekelp##3820 |or
|tip Farm them with Herbalism or purchase them from the auction house. |notinsticky
|tip These totals are approximate. |notinsticky
|tip You may need more or less than the indicated amount. |notinsticky
'|complete skill("Alchemy") >= 210 |or
'|goto 38.81,62.94 < 20 |noway |c |or
step
map Stranglethorn Vale
path follow smart; loop off; dist 20
path	38.81,62.94	37.38,68.78	34.46,76.56	33.23,80.90	31.39,83.70
path	25.98,84.41	24.21,79.36	23.58,75.22	26.18,68.29	23.70,64.65
path	23.90,60.72	25.74,57.13	22.04,55.91	21.86,51.72	22.96,47.20
path	26.20,47.90	26.24,42.31	27.70,38.32	30.36,35.99	33.88,33.36
path	30.37,30.98	28.55,26.38	27.56,22.38
Click herbs as you follow the path around this area
|tip Track them on your minimap with "Find Herbs".
|tip They are underwater along the path.
|tip Bring Water Walking Potions.
|tip You will need level 85 Herbalism to collect these.
collect 50 Stranglekelp##3820 |or
|tip Farm them with Herbalism or purchase them from the auction house. |notinsticky
|tip These totals are approximate. |notinsticky
|tip You may need more or less than the indicated amount. |notinsticky
'|complete skill("Alchemy") >= 210 |or
'|goto 27.56,22.38 < 20 |noway |c |next "Collect_Stranglekelp_Total" |or
step
label "Collect_Liferoot_Total"
map Wetlands
path follow smart; loop off; dist 20
path	39.88,29.56	42.39,32.16	44.42,36.02	50.85,37.60	53.92,41.52
path	55.96,45.32	59.97,50.83	61.97,56.83	64.42,68.06	63.29,74.88
Click herbs as you follow the path around this area
|tip Track them on your minimap with "Find Herbs".
|tip You will need level 150 Herbalism to collect these.
collect 35 Liferoot##3357 |or
|tip Farm them with Herbalism or purchase them from the auction house. |notinsticky
|tip These totals are approximate. |notinsticky
|tip You may need more or less than the indicated amount. |notinsticky
'|complete skill("Alchemy") >= 185 |or
'|goto 63.29,74.88 < 20 |noway |c |or
step
map Wetlands
path follow smart; loop off; dist 20
path	63.29,74.88	64.42,68.06	61.97,56.83	59.97,50.83	55.96,45.32
path	53.92,41.52	50.85,37.60	44.42,36.02	42.39,32.16	39.88,29.56
Click herbs as you follow the path around this area
|tip Track them on your minimap with "Find Herbs".
|tip You will need level 150 Herbalism to collect these.
collect 35 Liferoot##3357 |or
|tip Farm them with Herbalism or purchase them from the auction house. |notinsticky
|tip These totals are approximate. |notinsticky
|tip You may need more or less than the indicated amount. |notinsticky
'|complete skill("Alchemy") >= 185 |or
'|goto 39.88,29.56 < 20 |noway |c |next "Collect_Liferoot_Total" |or
step
label "Collect_Kingsblood_Total"
map Wetlands
path follow smart; loop on; ants curved; dist 20
path	46.75,25.55	51.58,29.02	56.21,30.36	59.67,33.23	62.46,34.02
path	61.92,38.94	58.55,43.68	56.51,48.27	44.88,34.82	41.25,33.98
path	35.44,31.57	31.52,36.24	26.99,34.94	18.37,36.35	13.78,37.41
path	14.84,33.80	18.22,32.79	19.10,26.35	21.55,27.19	24.28,28.73
path	27.93,30.36	32.61,27.99	35.45,24.60	38.43,23.41	40.84,24.23
Click herbs as you follow the path around this area
|tip Track them on your minimap with "Find Herbs".
|tip You will need level 125 Herbalism to collect these.
collect 35 Kingsblood##3356 |or
|tip Farm them with Herbalism or purchase them from the auction house. |notinsticky
|tip These totals are approximate. |notinsticky
|tip You may need more or less than the indicated amount. |notinsticky
'|complete skill("Alchemy") >= 185 |or
step
label "Collect_Goldthorn_Total"
map Stranglethorn Vale
path follow smart; loop off; dist 20
path	30.73,67.93	31.34,65.94	31.29,63.30	33.47,59.16	34.72,58.50
path	35.99,56.40	34.16,54.11	33.67,52.84	34.22,50.55	35.98,48.96
path	36.98,48.70	39.98,44.91	40.43,43.96	40.36,42.07	41.34,40.39
path	43.07,37.30	43.31,39.18	43.52,40.25	44.37,39.85	44.49,41.37
path	44.53,43.67	45.58,43.90	46.54,43.36	47.13,43.87	47.84,42.42
path	47.79,40.43	49.03,37.60	48.82,36.22	49.70,31.42	49.45,29.64
path	50.03,27.63	50.56,26.44	49.98,23.97	47.47,22.67	46.33,24.57
path	44.74,25.50	43.42,26.50	40.87,28.82	40.14,32.21	38.73,33.10
path	36.97,34.22	36.66,38.10	36.42,41.03	34.95,40.76	33.81,39.53
path	31.73,42.03	30.29,43.54	28.79,44.84	28.04,47.89	27.69,50.35
path	29.34,52.92	29.92,54.14	31.79,52.55
Click herbs as you follow the path around this area
|tip Track them on your minimap with "Find Herbs".
|tip You will need level 170 Herbalism to collect these.
collect 60 Goldthorn##3821 |or
|tip Farm them with Herbalism or purchase them from the auction house. |notinsticky
|tip These totals are approximate. |notinsticky
|tip You may need more or less than the indicated amount. |notinsticky
'|complete skill("Alchemy") >= 265 |or
'|goto 31.79,52.55 < 30 |noway |c |or
step
map Stranglethorn Vale
path follow smart; loop off; dist 20
path	33.43,55.29	33.15,56.95	31.66,58.87	31.13,61.25	30.56,63.99
path	30.40,67.21
Click herbs as you follow the path around this area
|tip Track them on your minimap with "Find Herbs".
|tip You will need level 170 Herbalism to collect these.
collect 60 Goldthorn##3821 |or
|tip Farm them with Herbalism or purchase them from the auction house. |notinsticky
|tip These totals are approximate. |notinsticky
|tip You may need more or less than the indicated amount. |notinsticky
'|complete skill("Alchemy") >= 265 |or
'|goto 30.40,67.21 < 30 |noway |c |next "Collect_Goldthorn_Total" |or
step
label "Collect_Wild_Steelbloom_Total"
map Stranglethorn Vale
path follow smart; loop on; ants curved; dist 20
path	35.19,24.89	34.15,16.96	32.35,17.29	29.81,16.22	28.04,17.47
path	25.80,17.04	23.47,14.43	23.84,13.79	26.85,13.53	26.47,10.74
path	26.96,10.08	26.83,8.41	28.93,7.53	31.07,9.11	33.66,7.50
path	35.36,6.91	37.47,8.17	40.26,7.17	42.31,8.80	43.43,9.07
path	44.02,6.96	46.87,7.20	49.23,10.26	46.15,12.93	46.18,15.78
path	48.55,20.93	49.87,26.32	48.46,42.77	46.45,44.95	42.29,44.37
path	39.61,44.79	38.13,35.79
Click herbs as you follow the path around this area
|tip Track them on your minimap with "Find Herbs".
|tip You will need level 115 Herbalism to collect these.
collect 5 Wild Steelbloom##3355 |or
|tip Farm them with Herbalism or purchase them from the auction house. |notinsticky
|tip These totals are approximate. |notinsticky
|tip You may need more or less than the indicated amount. |notinsticky
'|complete skill("Alchemy") >= 215 |or
stickystart "Collect_Khadgar's_Whisker_Total"
stickystart "Collect_Arthas'_Tears_Total"
stickystart "Collect_Blindweed_Total"
stickystart "Collect_Golden_Sansam_Total"
stickystart "Collect_Mountain_Silversage_Total"
stickystart "Collect_Felweed_Total"
stickystart "Collect_Dreaming_Glory_Total"
stickystart "Collect_Terocone_Total"
stickystart "Collect_Netherbloom_Total"
stickystart "Collect_Nightmare_Vine_Total"
step
map Blasted Lands
path follow smart; loop on; ants curved; dist 20
path	59.95,26.91	63.87,32.24	62.52,37.16	61.93,40.77	63.59,47.87
path	60.16,47.06	56.61,47.07	52.58,50.11	48.61,51.34	45.83,49.50
path	46.56,43.37	45.38,37.03	44.55,26.43	45.95,23.01	49.76,23.71
path	51.28,26.22	52.49,31.62	51.40,36.19	53.41,38.07	55.97,36.24
path	57.46,32.43	58.67,28.99
Click herbs as you follow the path around this area
|tip Track them on your minimap with "Find Herbs".
|tip You will need level 230 Herbalism to collect these.
collect 90 Sungrass##8838 |or
|tip Farm them with Herbalism or purchase them from the auction house.
|tip These totals are approximate.
|tip You may need more or less than the indicated amount.
'|complete skill("Alchemy") >= 285 |or
step
label "Collect_Khadgar's_Whisker_Total"
map Stranglethorn Vale
path follow smart; loop off; dist 20
path	30.73,67.93	31.34,65.94	31.29,63.30	33.47,59.16	34.72,58.50
path	35.99,56.40	34.16,54.11	33.67,52.84	34.22,50.55	35.98,48.96
path	36.98,48.70	39.98,44.91	40.43,43.96	40.36,42.07	41.34,40.39
path	43.07,37.30	43.31,39.18	43.52,40.25	44.37,39.85	44.49,41.37
path	44.53,43.67	45.58,43.90	46.54,43.36	47.13,43.87	47.84,42.42
path	47.79,40.43	49.03,37.60	48.82,36.22	49.70,31.42	49.45,29.64
path	50.03,27.63	50.56,26.44	49.98,23.97	47.47,22.67	46.33,24.57
path	44.74,25.50	43.42,26.50	40.87,28.82	40.14,32.21	38.73,33.10
path	36.97,34.22	36.66,38.10	36.42,41.03	34.95,40.76	33.81,39.53
path	31.73,42.03	30.29,43.54	28.79,44.84	28.04,47.89	27.69,50.35
path	29.34,52.92	29.92,54.14	31.79,52.55
Click herbs as you follow the path around this area
|tip Track them on your minimap with "Find Herbs".
|tip You will need level 185 Herbalism to collect these.
collect 15 Khadgar's Whisker##3358 |or
|tip Farm them with Herbalism or purchase them from the auction house. |notinsticky
|tip These totals are approximate. |notinsticky
|tip You may need more or less than the indicated amount. |notinsticky
'|complete skill("Alchemy") >= 230 |or
'|goto 31.79,52.55 < 30 |noway |c |or
step
map Stranglethorn Vale
path follow smart; loop off; dist 20
path	33.43,55.29	33.15,56.95	31.66,58.87	31.13,61.25	30.56,63.99
path	30.40,67.21
Click herbs as you follow the path around this area
|tip Track them on your minimap with "Find Herbs".
|tip You will need level 185 Herbalism to collect these.
collect 15 Khadgar's Whisker##3358 |or
|tip Farm them with Herbalism or purchase them from the auction house. |notinsticky
|tip These totals are approximate. |notinsticky
|tip You may need more or less than the indicated amount. |notinsticky
'|complete skill("Alchemy") >= 230 |or
'|goto 30.40,67.21 < 30 |noway |c |next "Collect_Khadgar's_Whisker_Total" |or
step
label "Collect_Arthas'_Tears_Total"
map Western Plaguelands
path follow smart; loop on; ants curved; dist 20
path	38.46,71.59	40.21,70.25	41.92,68.36	43.65,67.66	43.55,64.99
path	42.58,61.73	44.99,61.15	45.83,59.71	47.54,60.16	48.88,62.22
path	50.20,63.25	51.12,65.36	51.20,68.70	52.77,69.69	54.81,66.60
path	55.29,62.85	56.78,59.81	58.67,58.12	58.67,58.12	61.36,51.95
path	59.63,51.59	56.24,51.02	55.02,49.73	53.44,46.46	51.12,44.12
path	49.07,42.44	46.93,39.92	46.45,37.04	47.66,35.14	49.62,33.23
path	48.75,31.25	48.00,31.04	46.53,31.70	44.60,32.62	43.64,35.30
path	44.60,37.79	45.12,41.59	45.73,46.00	45.79,47.79	43.94,50.26
path	40.48,52.81	39.18,52.53	38.68,53.52	35.80,54.28	34.28,55.75
path	33.16,57.76	33.14,59.71	32.83,61.21	33.06,63.79	34.28,66.60
path	36.12,68.62	37.31,71.53
Click herbs as you follow the path around this area
|tip Track them on your minimap with "Find Herbs".
|tip You will need level 220 Herbalism to collect these.
collect 25 Arthas' Tears##8836 |or
|tip Farm them with Herbalism or purchase them from the auction house. |notinsticky
|tip These totals are approximate. |notinsticky
|tip You may need more or less than the indicated amount. |notinsticky
'|complete skill("Alchemy") >= 250 |or
step
label "Collect_Blindweed_Total"
map Swamp of Sorrows
path follow smart; loop on; ants curved; dist 20
path	23.34,47.48	26.00,39.24	28.21,37.10	31.38,35.00	36.11,36.48
path	38.30,35.54	40.98,35.26	42.49,39.06	44.13,40.53	46.07,41.10
path	46.56,38.70	49.85,36.00	52.70,36.48	54.71,36.25	57.38,33.20
path	58.78,30.30	62.57,29.33	66.36,28.36	68.29,25.21	69.20,20.52
path	69.38,15.92	72.73,13.20	76.51,14.32	78.04,18.24	81.03,21.94
path	82.49,25.63	82.43,31.77	82.80,37.29	86.93,38.06	88.09,44.02
path	88.14,49.77	85.09,53.96	86.43,57.71	84.56,62.68	84.28,67.90
path	81.40,71.41	78.10,69.78	76.69,64.12	78.72,58.47	80.88,55.22
path	81.42,48.27	81.70,43.61	79.06,40.69	77.48,38.74	76.64,34.28
path	73.75,33.11	70.93,33.86	68.69,31.71	65.67,35.50	61.30,37.56
path	58.02,38.46	54.71,41.87	53.10,42.33	49.93,42.29	47.27,43.26
path	44.52,45.19	42.66,47.65	39.83,49.22	36.79,51.04	33.83,51.96
path	29.04,54.25
Click herbs as you follow the path around this area
|tip Track them on your minimap with "Find Herbs".
|tip You will need level 235 Herbalism to collect these.
collect 50 Blindweed##8839 |or
|tip Farm them with Herbalism or purchase them from the auction house. |notinsticky
|tip These totals are approximate. |notinsticky
|tip You may need more or less than the indicated amount. |notinsticky
'|complete skill("Alchemy") >= 285 |or
step
label "Collect_Golden_Sansam_Total"
map Azshara
path follow smart; loop on; ants curved; dist 20
path	44.97,34.08	45.34,30.56	45.01,27.72	44.00,22.97	44.61,20.55
path	45.91,19.60	48.17,18.74	50.79,18.10	52.77,19.45	53.43,20.10
path	54.10,20.23	56.85,20.66	59.23,18.80	61.89,16.89	64.79,17.01
path	66.41,15.27	69.57,16.37	71.70,16.63	73.96,18.69	75.86,21.19
path	76.87,24.70	79.46,24.05	79.40,26.62	77.14,28.54	74.71,29.28
path	71.72,29.19	69.51,28.09	67.74,26.09	64.29,23.93	61.47,23.67
path	59.32,24.37	56.53,25.81	54.31,28.58	52.61,32.17	49.37,31.47
path	46.94,31.71
Click herbs as you follow the path around this area
|tip Track them on your minimap with "Find Herbs".
|tip You will need level 260 Herbalism to collect these.
collect 50 Golden Sansam##13464 |or
|tip Farm them with Herbalism or purchase them from the auction house. |notinsticky
|tip These totals are approximate. |notinsticky
|tip You may need more or less than the indicated amount. |notinsticky
'|complete skill("Alchemy") >= 330 |or
step
label "Collect_Mountain_Silversage_Total"
map Un'Goro Crater
path follow smart; loop on; ants curved; dist 20
path	69.50,80.51	66.73,78.96	62.06,80.45	60.17,83.38	57.90,84.92
path	56.43,85.63	52.59,86.79	50.45,85.64	47.59,86.84	44.06,85.48
path	40.43,83.69	37.58,82.20	36.74,80.02	34.35,78.80	30.60,79.47
path	29.81,78.29	29.45,73.80	29.51,71.95	30.47,70.66	30.12,68.78
path	26.87,68.47	26.22,63.87	24.35,55.86	24.60,51.19	24.66,49.08
path	24.29,47.04	24.87,40.95	26.12,37.25	26.47,32.27	28.16,29.95
path	29.28,30.78	30.53,29.41	29.59,24.96	30.56,20.83	33.11,20.72
path	34.48,21.20	36.41,20.34	38.57,16.60	42.23,16.10	44.74,14.15
path	48.26,13.20	49.78,17.80	51.76,16.54	52.14,13.12	54.40,13.42
path	56.79,14.48	59.79,16.53	62.08,16.53	63.95,19.36	65.85,21.43
path	66.83,23.10	67.79,22.98	68.24,20.16	70.91,20.97	71.45,25.67
path	71.86,28.59	74.60,32.13	74.81,36.14	76.10,40.85	76.77,46.27
path	76.23,50.57	76.85,54.91	75.63,60.70	74.66,64.47	74.30,69.24
path	71.82,70.72	70.92,71.71	71.15,74.12	70.59,75.37	70.92,79.06
Click herbs as you follow the path around this area
|tip Track them on your minimap with "Find Herbs".
|tip You will need level 280 Herbalism to collect these.
collect 25 Mountain Silversage##13465 |or
|tip Farm them with Herbalism or purchase them from the auction house. |notinsticky
|tip These totals are approximate. |notinsticky
|tip You may need more or less than the indicated amount. |notinsticky
'|complete skill("Alchemy") >= 315 |or
step
label "Collect_Felweed_Total"
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
collect 45 Felweed##22785 |or
|tip Farm them with Herbalism or purchase them from the auction house. |notinsticky
|tip These totals are approximate. |notinsticky
|tip You may need more or less than the indicated amount. |notinsticky
'|complete skill("Alchemy") >= 355 |or
step
label "Collect_Dreaming_Glory_Total"
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
collect 105 Dreaming Glory##22786 |or
|tip Farm them with Herbalism or purchase them from the auction house. |notinsticky
|tip These totals are approximate. |notinsticky
|tip You may need more or less than the indicated amount. |notinsticky
'|complete skill("Alchemy") >= 375 |or
step
label "Collect_Terocone_Total"
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
collect 5 Terocone##22789 |or
|tip Farm them with Herbalism or purchase them from the auction house. |notinsticky
|tip These totals are approximate. |notinsticky
|tip You may need more or less than the indicated amount. |notinsticky
'|complete skill("Alchemy") >= 335 |or
step
label "Collect_Netherbloom_Total"
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
collect 10 Netherbloom##22791 |or
|tip Farm them with Herbalism or purchase them from the auction house. |notinsticky
|tip These totals are approximate. |notinsticky
|tip You may need more or less than the indicated amount. |notinsticky
'|complete skill("Alchemy") >= 340 |or
step
label "Collect_Nightmare_Vine_Total"
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
collect 50 Nightmare Vine##22792 |or
|tip Farm them with Herbalism or purchase them from the auction house. |notinsticky
|tip These totals are approximate. |notinsticky
|tip You may need more or less than the indicated amount. |notinsticky
'|complete skill("Alchemy") >= 375 |or
step
talk Kor'geld##3348
|tip Inside the building.
buy 85 Empty Vial##3371 |goto Orgrimmar/0 56.05,34.12 |or 3
buy 105 Leaded Vial##3372 |goto Orgrimmar/0 56.05,34.12 |or 3
buy 115 Crystal Vial##8925 |goto Orgrimmar/0 56.05,34.12 |or 3
'|complete skill("Alchemy") >= 375 |or
stickystart "Collect_Silverleaf_60"
step
label "Begin_Profession_Leveling"
map Tirisfal Glades
path follow smart; loop on; ants curved; dist 20
path	51.54,54.24	50.24,56.05	47.60,53.12	45.65,51.89	46.96,47.83
path	44.74,46.19	42.79,42.59	41.45,40.79	39.11,40.30	38.92,43.20
path	38.50,46.14	36.48,47.41	34.54,48.14	32.02,48.17	31.72,50.34
path	33.92,51.19	37.36,51.84	38.60,52.08	39.77,54.03	40.68,58.21
path	40.92,60.80	41.92,63.49	44.02,65.29	46.57,66.37	49.11,67.48
path	50.44,66.83	51.57,64.64	54.10,62.49	56.28,59.15	56.53,55.12
path	53.81,53.15	52.04,54.99
Click herbs as you follow the path around this area
|tip Track them on your minimap with "Find Herbs".
collect 65 Peacebloom##2447 |or
|tip Farm them with Herbalism or purchase them from the auction house.
'|complete skill("Alchemy") >= 60 |or
step
label "Collect_Silverleaf_60"
map Tirisfal Glades
path follow smart; loop on; ants curved; dist 20
path	51.54,54.24	50.24,56.05	47.60,53.12	45.65,51.89	46.96,47.83
path	44.74,46.19	42.79,42.59	41.45,40.79	39.11,40.30	38.92,43.20
path	38.50,46.14	36.48,47.41	34.54,48.14	32.02,48.17	31.72,50.34
path	33.92,51.19	37.36,51.84	38.60,52.08	39.77,54.03	40.68,58.21
path	40.92,60.80	41.92,63.49	44.02,65.29	46.57,66.37	49.11,67.48
path	50.44,66.83	51.57,64.64	54.10,62.49	56.28,59.15	56.53,55.12
path	53.81,53.15	52.04,54.99
Click herbs as you follow the path around this area
|tip Track them on your minimap with "Find Herbs".
collect 65 Silverleaf##765 |or
|tip Farm them with Herbalism or purchase them from the auction house.
'|complete skill("Alchemy") >= 60 |or
step
talk Kor'geld##3348
|tip Inside the building.
buy 65 Empty Vial##3371 |goto Orgrimmar/0 56.05,34.12 |or
'|complete skill("Alchemy") >= 60 |or
step
create 65 Minor Healing Potion##2330,Alchemy,65 total |or
|tip Save these, you will need them later.
'|complete skill("Alchemy") >= 60 |or
step
create 1 Minor Healing Potion##2330,Alchemy,60
|tip You may need to create more of these.
|tip Save 65 of these, you will need them later.
|tip Each additional one requires one Peacebloom, one Silverleaf, and one Empty Vial.
step
Reach Level 10 |ding 10
|tip You must be at least level 10 to train Journeyman professions.
|tip Use the leveling guides to accomplish this.
step
talk Yelmak##3347
|tip Inside the building.
Train Journeyman Alchemy |skillmax Alchemy,150 |goto Orgrimmar/0 56.84,33.03
step
talk Yelmak##3347
|tip Inside the building.
Train Lesser Healing Potion |learn Lesser Healing Potion##2337 |goto Orgrimmar/0 56.84,33.03
step
label "Collect_Briarthorn_110"
map Silverpine Forest
path follow smart; loop off; dist 20
path	49.04,32.38	49.42,35.61	49.42,37.96	49.76,40.18	50.52,43.34
path	52.66,43.16	54.51,44.07	52.79,45.65	51.98,49.91	52.04,52.85
path	51.86,56.81	52.43,59.23	51.75,62.42	54.26,63.98	55.27,61.88
path	56.68,60.37	58.05,62.07	56.16,64.50	54.77,66.89	54.34,71.81
path	54.65,74.35	56.82,76.43	59.65,77.20	61.93,77.46	64.26,78.75
path	66.96,79.79
Click herbs as you follow the path around this area
|tip Briarthorn can share a spawn with other herbs in the area, so pick them all.
|tip Track them on your minimap with "Find Herbs".
|tip You will need level 70 Herbalism to collect these.
collect 65 Briarthorn##2450 |or
|tip Farm them with Herbalism or purchase them from the auction house.
'|complete skill("Alchemy") >= 110 |or
'|goto 66.96,79.79 < 20 |noway |c |or
step
map Silverpine Forest
path follow smart; loop off; dist 20
path	66.96,79.79	64.26,78.75	61.93,77.46	59.65,77.20	56.82,76.43
path	54.65,74.35	54.34,71.81	54.77,66.89	56.16,64.50	58.05,62.07
path	56.68,60.37	55.27,61.88	54.26,63.98	51.75,62.42	52.43,59.23
path	51.86,56.81	52.04,52.85	51.98,49.91	52.79,45.65	54.51,44.07
path	52.66,43.16	50.52,43.34	49.76,40.18	49.42,37.96	49.42,35.61
path	49.04,32.38
Click herbs as you follow the path around this area
|tip Briarthorn can share a spawn with other herbs in the area, so pick them all.
|tip Track them on your minimap with "Find Herbs".
|tip You will need level 70 Herbalism to collect these.
collect 65 Briarthorn##2450 |or
|tip Farm them with Herbalism or purchase them from the auction house.
'|complete skill("Alchemy") >= 110 |or
'|goto 49.04,32.38 < 20 |noway |c |next "Collect_Briarthorn_110" |or
step
create 65 Lesser Healing Potion##2337,Alchemy,110
|tip You may need to create more or less of these.
step
talk Yelmak##3347
|tip Inside the building.
Train Healing Potion |learn Healing Potion##3447 |goto Orgrimmar/0 56.84,33.03
stickystart "Collect_Bruiseweed_140"
step
label "Collect_Briarthorn_140"
map Silverpine Forest
path follow smart; loop off; dist 20
path	49.04,32.38	49.42,35.61	49.42,37.96	49.76,40.18	50.52,43.34
path	52.66,43.16	54.51,44.07	52.79,45.65	51.98,49.91	52.04,52.85
path	51.86,56.81	52.43,59.23	51.75,62.42	54.26,63.98	55.27,61.88
path	56.68,60.37	58.05,62.07	56.16,64.50	54.77,66.89	54.34,71.81
path	54.65,74.35	56.82,76.43	59.65,77.20	61.93,77.46	64.26,78.75
path	66.96,79.79
Click herbs as you follow the path around this area
|tip Briarthorn can share a spawn with other herbs in the area, so pick them all.
|tip Track them on your minimap with "Find Herbs".
|tip You will need level 70 Herbalism to collect these.
collect 35 Briarthorn##2450 |or
|tip Farm them with Herbalism or purchase them from the auction house.
'|complete skill("Alchemy") >= 140 |or
'|goto 66.96,79.79 < 20 |noway |c |or
step
map Silverpine Forest
path follow smart; loop off; dist 20
path	66.96,79.79	64.26,78.75	61.93,77.46	59.65,77.20	56.82,76.43
path	54.65,74.35	54.34,71.81	54.77,66.89	56.16,64.50	58.05,62.07
path	56.68,60.37	55.27,61.88	54.26,63.98	51.75,62.42	52.43,59.23
path	51.86,56.81	52.04,52.85	51.98,49.91	52.79,45.65	54.51,44.07
path	52.66,43.16	50.52,43.34	49.76,40.18	49.42,37.96	49.42,35.61
path	49.04,32.38
Click herbs as you follow the path around this area
|tip Briarthorn can share a spawn with other herbs in the area, so pick them all.
|tip Track them on your minimap with "Find Herbs".
|tip You will need level 70 Herbalism to collect these.
collect 35 Briarthorn##2450 |or
|tip Farm them with Herbalism or purchase them from the auction house.
'|complete skill("Alchemy") >= 140 |or
'|goto 49.04,32.38 < 20 |noway |c |next "Collect_Briarthorn_140" |or
step
label "Collect_Bruiseweed_140"
map Ashenvale
path follow smart; loop off; dist 20
path	30.47,44.71	27.77,48.81	25.72,50.64	28.38,54.47	34.66,54.20
path	35.41,56.86	34.85,58.62	32.71,59.66	34.71,59.96	38.06,62.62
path	40.48,61.75	39.97,65.16	41.82,64.95	43.85,63.15	47.09,61.20
path	48.42,60.26	49.98,59.22	54.29,60.93	56.36,63.51	57.82,64.38
path	59.14,70.90	60.56,73.42	69.78,74.49	71.98,73.86	74.94,73.92
Click herbs as you follow the path around this area
|tip Track them on your minimap with "Find Herbs".
|tip You will need level 100 Herbalism to collect these.
collect 35 Bruiseweed##2453 |or
|tip Farm them with Herbalism or purchase them from the auction house.
'|complete skill("Alchemy") >= 140 |or
'|goto 74.94,73.92 < 20 |noway |c |or
step
map Ashenvale
path follow smart; loop off; dist 20
path	74.94,73.92	71.98,73.86	69.78,74.49	60.56,73.42	59.14,70.90
path	57.82,64.38	56.36,63.51	54.29,60.93	49.98,59.22	48.42,60.26
path	47.09,61.20	43.85,63.15	41.82,64.95	39.97,65.16	40.48,61.75
path	38.06,62.62	34.71,59.96	32.71,59.66	34.85,58.62	35.41,56.86
path	34.66,54.20	28.38,54.47	25.72,50.64	27.77,48.81	30.47,44.71
Click herbs as you follow the path around this area
|tip Track them on your minimap with "Find Herbs".
|tip You will need level 100 Herbalism to collect these.
collect 35 Bruiseweed##2453 |or
|tip Farm them with Herbalism or purchase them from the auction house.
'|complete skill("Alchemy") >= 140 |or
'|goto 30.47,44.71 < 20 |noway |c |next "Collect_Bruiseweed_140" |or
step
talk Kor'geld##3348
|tip Inside the building.
buy 35 Leaded Vial##3372 |goto Orgrimmar/0 56.05,34.12 |or
'|complete skill("Alchemy") >= 140 |or
step
create 35 Healing Potion##3447,Alchemy,140
|tip You may need to create more or less of these.
step
Reach Level 20 |ding 20
|tip You must be at least level 20 to train Expert professions.
|tip Use the leveling guides to accomplish this.
step
talk Yelmak##3347
|tip Inside the building.
Train Expert Alchemy |skillmax Alchemy,225 |goto Orgrimmar/0 56.84,33.03
step
talk Yelmak##3347
|tip Inside the building.
Train Lesser Mana Potion |learn Lesser Mana Potion##3173 |goto Orgrimmar/0 56.84,33.03
stickystart "Collect_Stranglekelp_155"
step
map The Barrens
path follow smart; loop on; ants curved; dist 20
path	59.15,37.73	58.67,39.28	59.28,40.67	61.05,41.62	61.87,41.98
path	61.83,43.50	61.73,44.93	62.46,45.59	62.55,47.02	61.37,48.53
path	61.16,49.91	60.17,50.20	58.92,50.02	56.90,50.43	56.86,47.77
path	56.42,45.86	55.99,45.25	56.38,43.40	56.07,41.87	55.04,41.51
path	54.83,42.75	54.03,43.67	53.18,45.13	52.20,45.76	48.47,46.84
path	46.80,43.94	43.45,40.70	43.61,38.41	41.90,37.41	42.70,35.52
path	42.16,33.03	39.72,31.26	39.93,29.78	40.90,27.82	42.44,25.74
path	45.14,25.67	46.02,24.49	45.83,22.32	45.17,21.63	44.47,21.60
path	43.39,20.61	41.18,19.63	40.38,15.78	43.73,15.53	48.89,13.63
path	53.28,14.18	55.37,9.81	57.33,9.22	58.34,7.44	60.18,7.56
path	62.69,8.90	62.42,11.56	62.31,16.47	61.10,19.72	59.62,20.88
path	58.10,21.14	57.12,23.28	58.85,25.07	60.26,28.59	60.58,31.18
path	60.20,34.14	59.26,36.84
Click herbs as you follow the path around this area
|tip Track them on your minimap with "Find Herbs".
|tip You will need level 50 Herbalism to collect these.
collect 20 Mageroyal##785 |or
|tip Farm them with Herbalism or purchase them from the auction house.
'|complete skill("Alchemy") >= 155 |or
step
label "Collect_Stranglekelp_155"
map Stranglethorn Vale
path follow smart; loop off; dist 20
path	27.56,22.38	28.55,26.38	30.37,30.98	33.88,33.36	30.36,35.99
path	27.70,38.32	26.24,42.31	26.20,47.90	22.96,47.20	21.86,51.72
path	22.04,55.91	25.74,57.13	23.90,60.72	23.70,64.65	26.18,68.29
path	23.58,75.22	24.21,79.36	25.98,84.41	31.39,83.70	33.23,80.90
path	34.46,76.56	37.38,68.78	38.81,62.94
Click herbs as you follow the path around this area
|tip Track them on your minimap with "Find Herbs".
|tip They are underwater along the path.
|tip Bring Water Walking Potions.
|tip You will need level 85 Herbalism to collect these.
collect 20 Stranglekelp##3820 |or
|tip Farm them with Herbalism or purchase them from the auction house.
'|complete skill("Alchemy") >= 155 |or
'|goto 38.81,62.94 < 20 |noway |c |or
step
map Stranglethorn Vale
path follow smart; loop off; dist 20
path	38.81,62.94	37.38,68.78	34.46,76.56	33.23,80.90	31.39,83.70
path	25.98,84.41	24.21,79.36	23.58,75.22	26.18,68.29	23.70,64.65
path	23.90,60.72	25.74,57.13	22.04,55.91	21.86,51.72	22.96,47.20
path	26.20,47.90	26.24,42.31	27.70,38.32	30.36,35.99	33.88,33.36
path	30.37,30.98	28.55,26.38	27.56,22.38
Click herbs as you follow the path around this area
|tip Track them on your minimap with "Find Herbs".
|tip They are underwater along the path.
|tip Bring Water Walking Potions.
|tip You will need level 85 Herbalism to collect these.
collect 20 Stranglekelp##3820 |or
|tip Farm them with Herbalism or purchase them from the auction house.
'|complete skill("Alchemy") >= 155 |or
'|goto 27.56,22.38 < 20 |noway |c |next "Collect_Stranglekelp_155" |or
step
talk Kor'geld##3348
|tip Inside the building.
buy 20 Empty Vial##3371 |goto Orgrimmar/0 56.05,34.12 |or
'|complete skill("Alchemy") >= 155 |or
step
create 20 Lesser Mana Potion##3173,Alchemy,155
|tip You may need to create more or less of these.
step
talk Yelmak##3347
|tip Inside the building.
Train Greater Healing Potion |learn Greater Healing Potion##7181 |goto Orgrimmar/0 56.84,33.03
stickystart "Collect_Kingsblood_185"
step
label "Collect_Liferoot_185"
map Wetlands
path follow smart; loop off; dist 20
path	39.88,29.56	42.39,32.16	44.42,36.02	50.85,37.60	53.92,41.52
path	55.96,45.32	59.97,50.83	61.97,56.83	64.42,68.06	63.29,74.88
Click herbs as you follow the path around this area
|tip Track them on your minimap with "Find Herbs".
|tip You will need level 150 Herbalism to collect these.
collect 35 Liferoot##3357 |or
|tip Farm them with Herbalism or purchase them from the auction house.
'|complete skill("Alchemy") >= 185 |or
'|goto 63.29,74.88 < 20 |noway |c |or
step
map Wetlands
path follow smart; loop off; dist 20
path	63.29,74.88	64.42,68.06	61.97,56.83	59.97,50.83	55.96,45.32
path	53.92,41.52	50.85,37.60	44.42,36.02	42.39,32.16	39.88,29.56
Click herbs as you follow the path around this area
|tip Track them on your minimap with "Find Herbs".
|tip You will need level 150 Herbalism to collect these.
collect 35 Liferoot##3357 |or
|tip Farm them with Herbalism or purchase them from the auction house.
'|complete skill("Alchemy") >= 185 |or
'|goto 39.88,29.56 < 20 |noway |c |next "Collect_Liferoot_185" |or
step
label "Collect_Kingsblood_185"
map Wetlands
path follow smart; loop on; ants curved; dist 20
path	46.75,25.55	51.58,29.02	56.21,30.36	59.67,33.23	62.46,34.02
path	61.92,38.94	58.55,43.68	56.51,48.27	44.88,34.82	41.25,33.98
path	35.44,31.57	31.52,36.24	26.99,34.94	18.37,36.35	13.78,37.41
path	14.84,33.80	18.22,32.79	19.10,26.35	21.55,27.19	24.28,28.73
path	27.93,30.36	32.61,27.99	35.45,24.60	38.43,23.41	40.84,24.23
Click herbs as you follow the path around this area
|tip Track them on your minimap with "Find Herbs".
|tip You will need level 125 Herbalism to collect these.
collect 35 Kingsblood##3356 |or
|tip Farm them with Herbalism or purchase them from the auction house.
'|complete skill("Alchemy") >= 185 |or
step
talk Kor'geld##3348
|tip Inside the building.
buy 35 Leaded Vial##3372 |goto Orgrimmar/0 56.05,34.12 |or
'|complete skill("Alchemy") >= 185 |or
step
create 35 Greater Healing Potion##7181,Alchemy,185
|tip You may need to create more or less of these.
step
talk Yelmak##3347
|tip Inside the building.
Train Elixir of Agility |learn Elixir of Agility##11449 |goto Orgrimmar/0 56.84,33.03
step
label "Collect_Goldthorn_210"
map Stranglethorn Vale
path follow smart; loop off; dist 20
path	30.73,67.93	31.34,65.94	31.29,63.30	33.47,59.16	34.72,58.50
path	35.99,56.40	34.16,54.11	33.67,52.84	34.22,50.55	35.98,48.96
path	36.98,48.70	39.98,44.91	40.43,43.96	40.36,42.07	41.34,40.39
path	43.07,37.30	43.31,39.18	43.52,40.25	44.37,39.85	44.49,41.37
path	44.53,43.67	45.58,43.90	46.54,43.36	47.13,43.87	47.84,42.42
path	47.79,40.43	49.03,37.60	48.82,36.22	49.70,31.42	49.45,29.64
path	50.03,27.63	50.56,26.44	49.98,23.97	47.47,22.67	46.33,24.57
path	44.74,25.50	43.42,26.50	40.87,28.82	40.14,32.21	38.73,33.10
path	36.97,34.22	36.66,38.10	36.42,41.03	34.95,40.76	33.81,39.53
path	31.73,42.03	30.29,43.54	28.79,44.84	28.04,47.89	27.69,50.35
path	29.34,52.92	29.92,54.14	31.79,52.55
Click herbs as you follow the path around this area
|tip Track them on your minimap with "Find Herbs".
|tip You will need level 170 Herbalism to collect these.
collect 30 Goldthorn##3821 |or
|tip Farm them with Herbalism or purchase them from the auction house.
'|complete skill("Alchemy") >= 210 |or
'|goto 31.79,52.55 < 30 |noway |c |or
step
map Stranglethorn Vale
path follow smart; loop off; dist 20
path	33.43,55.29	33.15,56.95	31.66,58.87	31.13,61.25	30.56,63.99
path	30.40,67.21
Click herbs as you follow the path around this area
|tip Track them on your minimap with "Find Herbs".
|tip You will need level 170 Herbalism to collect these.
collect 30 Goldthorn##3821 |or
|tip Farm them with Herbalism or purchase them from the auction house.
'|complete skill("Alchemy") >= 210 |or
'|goto 30.40,67.21 < 30 |noway |c |next "Collect_Goldthorn_210"
step
label "Collect_Stranglekelp_210"
map Stranglethorn Vale
path follow smart; loop off; dist 20
path	27.56,22.38	28.55,26.38	30.37,30.98	33.88,33.36	30.36,35.99
path	27.70,38.32	26.24,42.31	26.20,47.90	22.96,47.20	21.86,51.72
path	22.04,55.91	25.74,57.13	23.90,60.72	23.70,64.65	26.18,68.29
path	23.58,75.22	24.21,79.36	25.98,84.41	31.39,83.70	33.23,80.90
path	34.46,76.56	37.38,68.78	38.81,62.94
Click herbs as you follow the path around this area
|tip Track them on your minimap with "Find Herbs".
|tip They are underwater along the path.
|tip Bring Water Walking Potions.
|tip You will need level 85 Herbalism to collect these.
collect 30 Stranglekelp##3820 |or
|tip Farm them with Herbalism or purchase them from the auction house.
'|complete skill("Alchemy") >= 210 |or
'|goto 38.81,62.94 < 20 |noway |c |or
step
map Stranglethorn Vale
path follow smart; loop off; dist 20
path	38.81,62.94	37.38,68.78	34.46,76.56	33.23,80.90	31.39,83.70
path	25.98,84.41	24.21,79.36	23.58,75.22	26.18,68.29	23.70,64.65
path	23.90,60.72	25.74,57.13	22.04,55.91	21.86,51.72	22.96,47.20
path	26.20,47.90	26.24,42.31	27.70,38.32	30.36,35.99	33.88,33.36
path	30.37,30.98	28.55,26.38	27.56,22.38
Click herbs as you follow the path around this area
|tip Track them on your minimap with "Find Herbs".
|tip They are underwater along the path.
|tip Bring Water Walking Potions.
|tip You will need level 85 Herbalism to collect these.
collect 30 Stranglekelp##3820 |or
|tip Farm them with Herbalism or purchase them from the auction house.
'|complete skill("Alchemy") >= 210 |or
'|goto 27.56,22.38 < 20 |noway |c |next "Collect_Stranglekelp_210"
step
talk Kor'geld##3348
|tip Inside the building.
buy 30 Leaded Vial##3372 |goto Orgrimmar/0 56.05,34.12 |or
'|complete skill("Alchemy") >= 210 |or
step
create 30 Elixir of Agility##11449,skill Alchemy,210
|tip You may need to create more or less of these.
step
talk Yelmak##3347
|tip Inside the building.
Train Elixir of Greater Defense |learn Elixir of Greater Defense##11450 |goto Orgrimmar/0 56.84,33.03
stickystart "Collect_Goldthorn_215"
step
map Stranglethorn Vale
path follow smart; loop on; ants curved; dist 20
path	35.19,24.89	34.15,16.96	32.35,17.29	29.81,16.22	28.04,17.47
path	25.80,17.04	23.47,14.43	23.84,13.79	26.85,13.53	26.47,10.74
path	26.96,10.08	26.83,8.41	28.93,7.53	31.07,9.11	33.66,7.50
path	35.36,6.91	37.47,8.17	40.26,7.17	42.31,8.80	43.43,9.07
path	44.02,6.96	46.87,7.20	49.23,10.26	46.15,12.93	46.18,15.78
path	48.55,20.93	49.87,26.32	48.46,42.77	46.45,44.95	42.29,44.37
path	39.61,44.79	38.13,35.79
Click herbs as you follow the path around this area
|tip Track them on your minimap with "Find Herbs".
|tip You will need level 115 Herbalism to collect these.
collect 5 Wild Steelbloom##3355 |or
|tip Farm them with Herbalism or purchase them from the auction house.
'|complete skill("Alchemy") >= 215 |or
step
label "Collect_Goldthorn_215"
map Stranglethorn Vale
path follow smart; loop off; dist 20
path	30.73,67.93	31.34,65.94	31.29,63.30	33.47,59.16	34.72,58.50
path	35.99,56.40	34.16,54.11	33.67,52.84	34.22,50.55	35.98,48.96
path	36.98,48.70	39.98,44.91	40.43,43.96	40.36,42.07	41.34,40.39
path	43.07,37.30	43.31,39.18	43.52,40.25	44.37,39.85	44.49,41.37
path	44.53,43.67	45.58,43.90	46.54,43.36	47.13,43.87	47.84,42.42
path	47.79,40.43	49.03,37.60	48.82,36.22	49.70,31.42	49.45,29.64
path	50.03,27.63	50.56,26.44	49.98,23.97	47.47,22.67	46.33,24.57
path	44.74,25.50	43.42,26.50	40.87,28.82	40.14,32.21	38.73,33.10
path	36.97,34.22	36.66,38.10	36.42,41.03	34.95,40.76	33.81,39.53
path	31.73,42.03	30.29,43.54	28.79,44.84	28.04,47.89	27.69,50.35
path	29.34,52.92	29.92,54.14	31.79,52.55
Click herbs as you follow the path around this area
|tip Track them on your minimap with "Find Herbs".
|tip You will need level 170 Herbalism to collect these.
collect 5 Goldthorn##3821 |or
|tip Farm them with Herbalism or purchase them from the auction house.
'|complete skill("Alchemy") >= 215 |or
'|goto 31.79,52.55 < 30 |noway |c
step
map Stranglethorn Vale
path follow smart; loop off; dist 20
path	33.43,55.29	33.15,56.95	31.66,58.87	31.13,61.25	30.56,63.99
path	30.40,67.21
Click herbs as you follow the path around this area
|tip Track them on your minimap with "Find Herbs".
|tip You will need level 170 Herbalism to collect these.
collect 5 Goldthorn##3821 |or
|tip Farm them with Herbalism or purchase them from the auction house.
'|complete skill("Alchemy") >= 215 |or
'|goto 30.40,67.21 < 30 |noway |c |next "Collect_Goldthorn_215" |or
step
talk Kor'geld##3348
|tip Inside the building.
buy 5 Leaded Vial##3372 |goto Orgrimmar/0 56.05,34.12 |or
'|complete skill("Alchemy") >= 215 |or
step
create 5 Elixir of Greater Defense##11450,Alchemy,215
step
Reach Level 35 |ding 35
|tip You must be at least level 35 to train Artisan professions.
|tip Use the leveling guides to accomplish this.
step
talk Yelmak##3347
|tip Inside the building.
Train Artisan Alchemy |skillmax Alchemy,300 |goto Orgrimmar/0 56.84,33.03
step
talk Yelmak##3347
|tip Inside the building.
Train Superior Healing Potion |learn Superior Healing Potion##11457 |goto Orgrimmar/0 56.84,33.03
stickystart "Collect_Khadgar's_Whisker_230"
step
map Blasted Lands
path follow smart; loop on; ants curved; dist 20
path	59.95,26.91	63.87,32.24	62.52,37.16	61.93,40.77	63.59,47.87
path	60.16,47.06	56.61,47.07	52.58,50.11	48.61,51.34	45.83,49.50
path	46.56,43.37	45.38,37.03	44.55,26.43	45.95,23.01	49.76,23.71
path	51.28,26.22	52.49,31.62	51.40,36.19	53.41,38.07	55.97,36.24
path	57.46,32.43	58.67,28.99
Click herbs as you follow the path around this area
|tip Track them on your minimap with "Find Herbs".
|tip You will need level 230 Herbalism to collect these.
collect 15 Sungrass##8838 |or
|tip Farm them with Herbalism or purchase them from the auction house.
'|complete skill("Alchemy") >= 230 |or
step
label "Collect_Khadgar's_Whisker_230"
map Stranglethorn Vale
path follow smart; loop off; dist 20
path	30.73,67.93	31.34,65.94	31.29,63.30	33.47,59.16	34.72,58.50
path	35.99,56.40	34.16,54.11	33.67,52.84	34.22,50.55	35.98,48.96
path	36.98,48.70	39.98,44.91	40.43,43.96	40.36,42.07	41.34,40.39
path	43.07,37.30	43.31,39.18	43.52,40.25	44.37,39.85	44.49,41.37
path	44.53,43.67	45.58,43.90	46.54,43.36	47.13,43.87	47.84,42.42
path	47.79,40.43	49.03,37.60	48.82,36.22	49.70,31.42	49.45,29.64
path	50.03,27.63	50.56,26.44	49.98,23.97	47.47,22.67	46.33,24.57
path	44.74,25.50	43.42,26.50	40.87,28.82	40.14,32.21	38.73,33.10
path	36.97,34.22	36.66,38.10	36.42,41.03	34.95,40.76	33.81,39.53
path	31.73,42.03	30.29,43.54	28.79,44.84	28.04,47.89	27.69,50.35
path	29.34,52.92	29.92,54.14	31.79,52.55
Click herbs as you follow the path around this area
|tip Track them on your minimap with "Find Herbs".
|tip You will need level 185 Herbalism to collect these.
collect 15 Khadgar's Whisker##3358 |or
|tip Farm them with Herbalism or purchase them from the auction house.
'|goto 31.79,52.55 < 30 |noway |c |or
'|complete skill("Alchemy") >= 230 |or
step
map Stranglethorn Vale
path follow smart; loop off; dist 20
path	33.43,55.29	33.15,56.95	31.66,58.87	31.13,61.25	30.56,63.99
path	30.40,67.21
Click herbs as you follow the path around this area
|tip Track them on your minimap with "Find Herbs".
|tip You will need level 185 Herbalism to collect these.
collect 15 Khadgar's Whisker##3358 |or
'|goto 30.40,67.21 < 30 |noway |c |next "Collect_Khadgar's_Whisker_230" |or
'|complete skill("Alchemy") >= 230 |or
step
talk Kor'geld##3348
|tip Inside the building.
buy 15 Crystal Vial##8925 |goto Orgrimmar/0 56.05,34.12 |or
'|complete skill("Alchemy") >= 230 |or
step
create 15 Superior Healing Potion##11457,Alchemy,230
step
talk Yelmak##3347
|tip Inside the building.
Train Elixir of Detect Undead |learn Elixir of Detect Undead##11460 |goto Orgrimmar/0 56.84,33.03
step
map Western Plaguelands
path follow smart; loop on; ants curved; dist 20
path	38.46,71.59	40.21,70.25	41.92,68.36	43.65,67.66	43.55,64.99
path	42.58,61.73	44.99,61.15	45.83,59.71	47.54,60.16	48.88,62.22
path	50.20,63.25	51.12,65.36	51.20,68.70	52.77,69.69	54.81,66.60
path	55.29,62.85	56.78,59.81	58.67,58.12	58.67,58.12	61.36,51.95
path	59.63,51.59	56.24,51.02	55.02,49.73	53.44,46.46	51.12,44.12
path	49.07,42.44	46.93,39.92	46.45,37.04	47.66,35.14	49.62,33.23
path	48.75,31.25	48.00,31.04	46.53,31.70	44.60,32.62	43.64,35.30
path	44.60,37.79	45.12,41.59	45.73,46.00	45.79,47.79	43.94,50.26
path	40.48,52.81	39.18,52.53	38.68,53.52	35.80,54.28	34.28,55.75
path	33.16,57.76	33.14,59.71	32.83,61.21	33.06,63.79	34.28,66.60
path	36.12,68.62	37.31,71.53
Click herbs as you follow the path around this area
|tip Track them on your minimap with "Find Herbs".
|tip You will need level 220 Herbalism to collect these.
collect 25 Arthas' Tears##8836 |or
|tip Farm them with Herbalism or purchase them from the auction house.
'|complete skill("Alchemy") >= 250 |or
step
talk Kor'geld##3348
|tip Inside the building.
buy 25 Crystal Vial##8925 |goto Orgrimmar/0 56.05,34.12 |or
'|complete skill("Alchemy") >= 250 |or
step
create 25 Elixir of Detect Undead##11460,Alchemy,250
|tip You may need to create more or less of these.
step
talk Yelmak##3347
|tip Inside the building.
Train Elixir of Greater Agility |learn Elixir of Greater Agility##11467 |goto Orgrimmar/0 56.84,33.03
stickystart "Collect_Goldthorn_265"
step
map Blasted Lands
path follow smart; loop on; ants curved; dist 20
path	59.95,26.91	63.87,32.24	62.52,37.16	61.93,40.77	63.59,47.87
path	60.16,47.06	56.61,47.07	52.58,50.11	48.61,51.34	45.83,49.50
path	46.56,43.37	45.38,37.03	44.55,26.43	45.95,23.01	49.76,23.71
path	51.28,26.22	52.49,31.62	51.40,36.19	53.41,38.07	55.97,36.24
path	57.46,32.43	58.67,28.99
Click herbs as you follow the path around this area
|tip Track them on your minimap with "Find Herbs".
|tip You will need level 230 Herbalism to collect these.
collect 25 Sungrass##8838 |or
|tip Farm them with Herbalism or purchase them from the auction house.
'|complete skill("Alchemy") >= 265 |or
step
label "Collect_Goldthorn_265"
map Stranglethorn Vale
path follow smart; loop off; dist 20
path	30.73,67.93	31.34,65.94	31.29,63.30	33.47,59.16	34.72,58.50
path	35.99,56.40	34.16,54.11	33.67,52.84	34.22,50.55	35.98,48.96
path	36.98,48.70	39.98,44.91	40.43,43.96	40.36,42.07	41.34,40.39
path	43.07,37.30	43.31,39.18	43.52,40.25	44.37,39.85	44.49,41.37
path	44.53,43.67	45.58,43.90	46.54,43.36	47.13,43.87	47.84,42.42
path	47.79,40.43	49.03,37.60	48.82,36.22	49.70,31.42	49.45,29.64
path	50.03,27.63	50.56,26.44	49.98,23.97	47.47,22.67	46.33,24.57
path	44.74,25.50	43.42,26.50	40.87,28.82	40.14,32.21	38.73,33.10
path	36.97,34.22	36.66,38.10	36.42,41.03	34.95,40.76	33.81,39.53
path	31.73,42.03	30.29,43.54	28.79,44.84	28.04,47.89	27.69,50.35
path	29.34,52.92	29.92,54.14	31.79,52.55
Click herbs as you follow the path around this area
|tip Track them on your minimap with "Find Herbs".
|tip You will need level 170 Herbalism to collect these.
collect 25 Goldthorn##3821 |or
|tip Farm them with Herbalism or purchase them from the auction house.
'|complete skill("Alchemy") >= 265 |or
'|goto 31.79,52.55 < 30 |noway |c |or
step
map Stranglethorn Vale
path follow smart; loop off; dist 20
path	33.43,55.29	33.15,56.95	31.66,58.87	31.13,61.25	30.56,63.99
path	30.40,67.21
Click herbs as you follow the path around this area
|tip Track them on your minimap with "Find Herbs".
|tip You will need level 170 Herbalism to collect these.
collect 25 Goldthorn##3821 |or
|tip Farm them with Herbalism or purchase them from the auction house.
'|complete skill("Alchemy") >= 265 |or
'|goto 30.40,67.21 < 30 |noway |c |next "Collect_Goldthorn_265" |or
step
talk Kor'geld##3348
|tip Inside the building.
buy 25 Crystal Vial##8925 |goto Orgrimmar/0 56.05,34.12 |or
'|complete skill("Alchemy") >= 265 |or
step
create 25 Elixir of Greater Agility##11467,Alchemy,265
|tip You may need to create more or less of these.
step
talk Yelmak##3347
|tip Inside the building.
Train Superior Mana Potion |learn Superior Mana Potion##17553 |goto Orgrimmar/0 56.84,33.03
stickystart "Collect_Blindweed_285"
step
map Blasted Lands
path follow smart; loop on; ants curved; dist 20
path	59.95,26.91	63.87,32.24	62.52,37.16	61.93,40.77	63.59,47.87
path	60.16,47.06	56.61,47.07	52.58,50.11	48.61,51.34	45.83,49.50
path	46.56,43.37	45.38,37.03	44.55,26.43	45.95,23.01	49.76,23.71
path	51.28,26.22	52.49,31.62	51.40,36.19	53.41,38.07	55.97,36.24
path	57.46,32.43	58.67,28.99
Click herbs as you follow the path around this area
|tip Track them on your minimap with "Find Herbs".
|tip You will need level 230 Herbalism to collect these.
collect 50 Sungrass##8838 |or
|tip Farm them with Herbalism or purchase them from the auction house.
'|complete skill("Alchemy") >= 285 |or
step
label "Collect_Blindweed_285"
map Swamp of Sorrows
path follow smart; loop on; ants curved; dist 20
path	23.34,47.48	26.00,39.24	28.21,37.10	31.38,35.00	36.11,36.48
path	38.30,35.54	40.98,35.26	42.49,39.06	44.13,40.53	46.07,41.10
path	46.56,38.70	49.85,36.00	52.70,36.48	54.71,36.25	57.38,33.20
path	58.78,30.30	62.57,29.33	66.36,28.36	68.29,25.21	69.20,20.52
path	69.38,15.92	72.73,13.20	76.51,14.32	78.04,18.24	81.03,21.94
path	82.49,25.63	82.43,31.77	82.80,37.29	86.93,38.06	88.09,44.02
path	88.14,49.77	85.09,53.96	86.43,57.71	84.56,62.68	84.28,67.90
path	81.40,71.41	78.10,69.78	76.69,64.12	78.72,58.47	80.88,55.22
path	81.42,48.27	81.70,43.61	79.06,40.69	77.48,38.74	76.64,34.28
path	73.75,33.11	70.93,33.86	68.69,31.71	65.67,35.50	61.30,37.56
path	58.02,38.46	54.71,41.87	53.10,42.33	49.93,42.29	47.27,43.26
path	44.52,45.19	42.66,47.65	39.83,49.22	36.79,51.04	33.83,51.96
path	29.04,54.25
Click herbs as you follow the path around this area
|tip Track them on your minimap with "Find Herbs".
|tip You will need level 235 Herbalism to collect these.
collect 50 Blindweed##8839 |or
|tip Farm them with Herbalism or purchase them from the auction house.
'|complete skill("Alchemy") >= 285 |or
step
talk Kor'geld##3348
|tip Inside the building.
buy 25 Crystal Vial##8925 |goto Orgrimmar/0 56.05,34.12 |or
'|complete skill("Alchemy") >= 285 |or
step
create 25 Superior Mana Potion##17553,Alchemy,285
|tip You may need to create more or less of these.
step
talk Kor'geld##3348
|tip Inside the building.
buy 25 Crystal Vial##8925 |goto Orgrimmar/0 56.05,34.12 |or
'|complete skill("Alchemy") >= 300 |or
step
talk Yelmak##3347
|tip Inside the building.
Train Major Healing Potion |learn Major Healing Potion##17556 |goto Orgrimmar/0 56.84,33.03
stickystart "Collect_Mountain_Silversage_300"
step
map Azshara
path follow smart; loop on; ants curved; dist 20
path	44.97,34.08	45.34,30.56	45.01,27.72	44.00,22.97	44.61,20.55
path	45.91,19.60	48.17,18.74	50.79,18.10	52.77,19.45	53.43,20.10
path	54.10,20.23	56.85,20.66	59.23,18.80	61.89,16.89	64.79,17.01
path	66.41,15.27	69.57,16.37	71.70,16.63	73.96,18.69	75.86,21.19
path	76.87,24.70	79.46,24.05	79.40,26.62	77.14,28.54	74.71,29.28
path	71.72,29.19	69.51,28.09	67.74,26.09	64.29,23.93	61.47,23.67
path	59.32,24.37	56.53,25.81	54.31,28.58	52.61,32.17	49.37,31.47
path	46.94,31.71
Click herbs as you follow the path around this area
|tip Track them on your minimap with "Find Herbs".
|tip You will need level 260 Herbalism to collect these.
collect 50 Golden Sansam##13464 |or
|tip Farm them with Herbalism or purchase them from the auction house.
'|complete skill("Alchemy") >= 300 |or
step
label "Collect_Mountain_Silversage_300"
map Un'Goro Crater
path follow smart; loop on; ants curved; dist 20
path	69.50,80.51	66.73,78.96	62.06,80.45	60.17,83.38	57.90,84.92
path	56.43,85.63	52.59,86.79	50.45,85.64	47.59,86.84	44.06,85.48
path	40.43,83.69	37.58,82.20	36.74,80.02	34.35,78.80	30.60,79.47
path	29.81,78.29	29.45,73.80	29.51,71.95	30.47,70.66	30.12,68.78
path	26.87,68.47	26.22,63.87	24.35,55.86	24.60,51.19	24.66,49.08
path	24.29,47.04	24.87,40.95	26.12,37.25	26.47,32.27	28.16,29.95
path	29.28,30.78	30.53,29.41	29.59,24.96	30.56,20.83	33.11,20.72
path	34.48,21.20	36.41,20.34	38.57,16.60	42.23,16.10	44.74,14.15
path	48.26,13.20	49.78,17.80	51.76,16.54	52.14,13.12	54.40,13.42
path	56.79,14.48	59.79,16.53	62.08,16.53	63.95,19.36	65.85,21.43
path	66.83,23.10	67.79,22.98	68.24,20.16	70.91,20.97	71.45,25.67
path	71.86,28.59	74.60,32.13	74.81,36.14	76.10,40.85	76.77,46.27
path	76.23,50.57	76.85,54.91	75.63,60.70	74.66,64.47	74.30,69.24
path	71.82,70.72	70.92,71.71	71.15,74.12	70.59,75.37	70.92,79.06
Click herbs as you follow the path around this area
|tip Track them on your minimap with "Find Herbs".
|tip You will need level 280 Herbalism to collect these.
collect 25 Mountain Silversage##13465 |or
|tip Farm them with Herbalism or purchase them from the auction house.
'|complete skill("Alchemy") >= 300 |or
step
create 25 Major Healing Potion##17556,Alchemy,300
|tip You may need to create more or less of these.
step
Reach Level 50 |ding 50
|tip You must be at least level 50 to train Master professions.
|tip Use the leveling guides to accomplish this.
step
talk Apothecary Antonivich##16588
|tip Inside the building.
Train Master Alchemy |skillmax Alchemy,375 |goto Hellfire Peninsula/0 52.28,36.46
step
talk Apothecary Antonivich##16588
|tip Inside the building.
Train Onslaught Elixir |learn Onslaught Elixir##33738 |goto 52.28,36.46
stickystart "Collect_Felweed_315"
step
map Un'Goro Crater
path follow smart; loop on; ants curved; dist 20
path	69.50,80.51	66.73,78.96	62.06,80.45	60.17,83.38	57.90,84.92
path	56.43,85.63	52.59,86.79	50.45,85.64	47.59,86.84	44.06,85.48
path	40.43,83.69	37.58,82.20	36.74,80.02	34.35,78.80	30.60,79.47
path	29.81,78.29	29.45,73.80	29.51,71.95	30.47,70.66	30.12,68.78
path	26.87,68.47	26.22,63.87	24.35,55.86	24.60,51.19	24.66,49.08
path	24.29,47.04	24.87,40.95	26.12,37.25	26.47,32.27	28.16,29.95
path	29.28,30.78	30.53,29.41	29.59,24.96	30.56,20.83	33.11,20.72
path	34.48,21.20	36.41,20.34	38.57,16.60	42.23,16.10	44.74,14.15
path	48.26,13.20	49.78,17.80	51.76,16.54	52.14,13.12	54.40,13.42
path	56.79,14.48	59.79,16.53	62.08,16.53	63.95,19.36	65.85,21.43
path	66.83,23.10	67.79,22.98	68.24,20.16	70.91,20.97	71.45,25.67
path	71.86,28.59	74.60,32.13	74.81,36.14	76.10,40.85	76.77,46.27
path	76.23,50.57	76.85,54.91	75.63,60.70	74.66,64.47	74.30,69.24
path	71.82,70.72	70.92,71.71	71.15,74.12	70.59,75.37	70.92,79.06
Click herbs as you follow the path around this area
|tip Track them on your minimap with "Find Herbs".
|tip You will need level 280 Herbalism to collect these.
collect 20 Mountain Silversage##13465 |or
|tip Farm them with Herbalism or purchase them from the auction house.
'|complete skill("Alchemy") >= 315 |or
step
label "Collect_Felweed_315"
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
collect 20 Felweed##22785 |or
|tip Farm them with Herbalism or purchase them from the auction house.
'|complete skill("Alchemy") >= 315 |or
step
talk Apothecary Antonivich##16588
|tip Inside the building.
buy 20 Imbued Vial##18256 |goto Hellfire Peninsula/0 52.28,36.46 |or
'|complete skill("Alchemy") >= 315 |or
step
create 15 Onslaught Elixir##33738,Alchemy,315
step
talk Apothecary Antonivich##16588
|tip Inside the building.
Train Elixir of Healing Power |learn Elixir of Healing Power##28545 |goto Hellfire Peninsula/0 52.28,36.46
step
talk Apothecary Antonivich##16588
|tip Inside the building.
buy 25 Imbued Vial##18256 |goto Hellfire Peninsula/0 52.28,36.46 |or
'|complete skill("Alchemy") >= 330 |or
stickystart "Collect_Dreaming_Glory_330"
step
map Azshara
path follow smart; loop on; ants curved; dist 20
path	44.97,34.08	45.34,30.56	45.01,27.72	44.00,22.97	44.61,20.55
path	45.91,19.60	48.17,18.74	50.79,18.10	52.77,19.45	53.43,20.10
path	54.10,20.23	56.85,20.66	59.23,18.80	61.89,16.89	64.79,17.01
path	66.41,15.27	69.57,16.37	71.70,16.63	73.96,18.69	75.86,21.19
path	76.87,24.70	79.46,24.05	79.40,26.62	77.14,28.54	74.71,29.28
path	71.72,29.19	69.51,28.09	67.74,26.09	64.29,23.93	61.47,23.67
path	59.32,24.37	56.53,25.81	54.31,28.58	52.61,32.17	49.37,31.47
path	46.94,31.71
Click herbs as you follow the path around this area
|tip Track them on your minimap with "Find Herbs".
|tip You will need level 260 Herbalism to collect these.
collect 25 Golden Sansam##13464 |or
|tip Farm them with Herbalism or purchase them from the auction house.
'|complete skill("Alchemy") >= 330 |or
step
label "Collect_Dreaming_Glory_330"
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
collect 25 Dreaming Glory##22786 |or
|tip Farm them with Herbalism or purchase them from the auction house.
'|complete skill("Alchemy") >= 330 |or
step
create 25 Elixir of Healing Power##28545,Alchemy,330
|tip You may need to create more or less of these.
|tip Each one requires another Golden Sansam and Dreaming Glory.
step
talk Apothecary Antonivich##16588
|tip Inside the building.
Train Elixir of Draenic Wisdom |learn Elixir of Draenic Wisdom##39638 |goto Hellfire Peninsula/0 52.28,36.46
step
talk Apothecary Antonivich##16588
|tip Inside the building.
buy 5 Imbued Vial##18256 |goto Hellfire Peninsula/0 52.28,36.46 |or
'|complete skill("Alchemy") >= 335 |or
stickystart "Collect_Felweed_335"
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
collect 5 Terocone##22789 |or
|tip Farm them with Herbalism or purchase them from the auction house.
'|complete skill("Alchemy") >= 335 |or
step
label "Collect_Felweed_335"
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
collect 5 Felweed##22785 |or
|tip Farm them with Herbalism or purchase them from the auction house.
'|complete skill("Alchemy") >= 335 |or
step
create 5 Elixir of Draenic Wisdom##39638,Alchemy,335
step
talk Apothecary Antonivich##16588
|tip Inside the building.
Train Super Healing Potion |learn Super Healing Potion##28551 |goto Hellfire Peninsula/0 52.28,36.46
step
talk Apothecary Antonivich##16588
|tip Inside the building.
buy 70 Imbued Vial##18256 |goto Hellfire Peninsula/0 52.28,36.46 |or
|tip Save these, you will need them later.
'|complete skill("Alchemy") >= 375 |or
stickystart "Collect_Felweed_340"
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
collect 10 Netherbloom##22791 |or
|tip Farm them with Herbalism or purchase them from the auction house.
'|complete skill("Alchemy") >= 340 |or
step
label "Collect_Felweed_340"
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
collect 5 Felweed##22785 |or
|tip Farm them with Herbalism or purchase them from the auction house.
'|complete skill("Alchemy") >= 340 |or
step
create 5 Super Healing Potion##28551,Alchemy,340
step
talk Daga Ramba##19837
|tip Inside the building.
buy Recipe: Super Mana Potion##22907 |goto Blade's Edge Mountains/0 51.0,57.8 |or 2
buy Recipe: Major Dreamless Sleep Potion##22911 |goto Blade's Edge Mountains/0 51.0,57.8 |or 2
'|complete skill("Alchemy") >= 375 |or
step
use the Recipe: Super Mana Potion##22907
Learn Super Mana Potion |learn Super Mana Potion##28555
stickystart "Collect_Felweed_355"
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
collect 30 Dreaming Glory##22786 |or
|tip Farm them with Herbalism or purchase them from the auction house.
'|complete skill("Alchemy") >= 355 |or
step
label "Collect_Felweed_355"
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
collect 15 Felweed##22785 |or
|tip Farm them with Herbalism or purchase them from the auction house.
'|complete skill("Alchemy") >= 355 |or
step
create 15 Super Mana Potion##28555,Alchemy,355
step
use the Recipe: Major Dreamless Sleep Potion##22911
Learn Major Dreamless Sleep Potion |learn Major Dreamless Sleep Potion##28562
stickystart "Collect_Nightmare_Vine_375"
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
collect 50 Dreaming Glory##22786 |or
|tip Farm them with Herbalism or purchase them from the auction house.
'|complete skill("Alchemy") >= 375 |or
step
label "Collect_Nightmare_Vine_375"
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
collect 50 Nightmare Vine##22792 |or
|tip Farm them with Herbalism or purchase them from the auction house.
'|complete skill("Alchemy") >= 375 |or
step
create 50 Major Dreamless Sleep Potion##28562,Alchemy,375
|tip You may need to create more or less of these.
|tip Each one requires another Nightmare Vine and Dreaming Glory.
step
_Congratulations!_
You Reached Skill 375 in Alchemy.
]])
ZygorGuidesViewer:RegisterGuide("Profession Guides\\Blacksmithing\\Blacksmithing (1-375)",{
author="support@zygorguides.com",
condition_suggested=function() return skill("Blacksmithing") > 0 and skill("Blacksmithing") < 375 end,
description="This guide will walk you through leveling your Blacksmithing skill from 1-375.",
},[[
step
Reach Level 5 |ding 5
|tip You must be at least level 5 to train Apprentice professions.
|tip Use the leveling guides to accomplish this.
step
Enter the building |goto Orgrimmar/0 81.56,22.74 < 7 |walk
talk Saru Steelfury##3355
|tip Inside the building.
Train Apprentice Blacksmithing |skillmax Blacksmithing,75 |goto Orgrimmar/0 82.35,22.98
step
Click Here if You Would Like to Collect All Materials First |confirm |next |or
_Or_
Click Here to Collect Materials as You Level or Resume Leveling Blacksmithing |confirm |next "Begin_Profession_Leveling" |or
'|complete skill("Blacksmithing") >= 300 |or |next "Begin_Profession_Leveling"
stickystart "Collect_Coarse_Stone_Total"
stickystart "Collect_Copper_Bar_Total"
stickystart "Collect_Silver_Bar_Total"
stickystart "Collect_Bronze_Bar_Total"
stickystart "Collect_Heavy_Stone_Total"
stickystart "Collect_Gold_Bar_Total"
step
map Durotar
path follow smart; loop on; ants curved; dist 20
path	50.96,17.00	52.99,18.09	54.60,19.05	55.40,21.06	55.71,23.38
path	56.28,25.33	55.89,27.78	54.64,27.62	55.10,30.09	58.12,29.94
path	55.62,32.75	55.97,36.63	55.71,40.53	57.32,42.00	59.26,41.50
path	57.59,43.98	55.27,48.14	50.81,48.20	48.51,43.33	47.83,39.78
path	46.87,34.69	45.55,32.24	45.61,27.19	46.52,23.35	48.07,21.59
path	49.70,21.37	49.54,18.59
Click ore as you follow the path around this area
|tip Track them on your minimap with "Find Minerals".
collect 150 Rough Stone##2835 |or
|tip Farm them with Mining or purchase them from the auction house.
|tip These totals are approximate.
|tip You may need more or less than the indicated amount.
'|complete skill("Blacksmithing") >= 65 |or
step
label "Collect_Coarse_Stone_Total"
map The Barrens
path follow smart; loop on; ants curved; dist 20
path	59.10,40.30	60.19,40.99	61.84,40.54	62.14,43.04	62.65,46.75
path	61.30,50.02	60.46,50.11	58.76,50.43	56.82,51.16	55.42,52.22
path	53.50,52.61	53.16,56.18	51.94,57.54	50.38,58.57	49.34,61.86
path	47.74,65.34	49.23,69.53	48.13,71.47	48.25,74.69	49.98,75.97
path	49.97,78.84	48.59,80.24	48.26,82.33	46.66,83.76	46.10,86.08
path	44.27,84.64	42.70,82.63	41.20,79.51	44.09,78.36	43.80,75.03
path	43.88,73.08	42.35,72.24	41.90,68.97	43.39,69.35	45.54,68.99
path	45.03,65.70	43.83,62.98	43.15,60.77	43.09,56.64	43.61,52.80
path	41.37,48.89	42.58,47.61	41.37,44.96	43.42,44.79	43.15,42.53
path	43.28,39.61	42.28,38.89	41.58,37.21	42.55,35.50	42.04,33.21
path	45.13,32.85	46.58,30.52	46.71,28.37	48.20,28.72	49.48,31.40
path	50.44,34.37	52.43,34.60	56.90,37.50	58.56,39.33
Click ore as you follow the path around this area
|tip Track them on your minimap with "Find Minerals".
|tip You will need level 65 Mining to collect these.
collect 85 Coarse Stone##2836 |or
|tip Farm them with Mining or purchase them from the auction house. |notinsticky
|tip These totals are approximate. |notinsticky
|tip You may need more or less than the indicated amount. |notinsticky
'|complete skill("Blacksmithing") >= 100 |or
step
label "Collect_Copper_Bar_Total"
map Durotar
path follow smart; loop on; ants curved; dist 20
path	50.96,17.00	52.99,18.09	54.60,19.05	55.40,21.06	55.71,23.38
path	56.28,25.33	55.89,27.78	54.64,27.62	55.10,30.09	58.12,29.94
path	55.62,32.75	55.97,36.63	55.71,40.53	57.32,42.00	59.26,41.50
path	57.59,43.98	55.27,48.14	50.81,48.20	48.51,43.33	47.83,39.78
path	46.87,34.69	45.55,32.24	45.61,27.19	46.52,23.35	48.07,21.59
path	49.70,21.37	49.54,18.59
Click ore as you follow the path around this area
|tip Track them on your minimap with "Find Minerals".
collect 150 Copper Ore##2770 |n
|tip Smelt the ore at a forge.
collect 150 Copper Bar##2840 |or
|tip Create them with Mining or purchase them from the auction house. |notinsticky
|tip These totals are approximate. |notinsticky
|tip You may need more or less than the indicated amount. |notinsticky
'|complete skill("Blacksmithing") >= 110 |or
step
label "Collect_Silver_Bar_Total"
map The Barrens
path follow smart; loop on; ants curved; dist 20
path	59.10,40.30	60.19,40.99	61.84,40.54	62.14,43.04	62.65,46.75
path	61.30,50.02	60.46,50.11	58.76,50.43	56.82,51.16	55.42,52.22
path	53.50,52.61	53.16,56.18	51.94,57.54	50.38,58.57	49.34,61.86
path	47.74,65.34	49.23,69.53	48.13,71.47	48.25,74.69	49.98,75.97
path	49.97,78.84	48.59,80.24	48.26,82.33	46.66,83.76	46.10,86.08
path	44.27,84.64	42.70,82.63	41.20,79.51	44.09,78.36	43.80,75.03
path	43.88,73.08	42.35,72.24	41.90,68.97	43.39,69.35	45.54,68.99
path	45.03,65.70	43.83,62.98	43.15,60.77	43.09,56.64	43.61,52.80
path	41.37,48.89	42.58,47.61	41.37,44.96	43.42,44.79	43.15,42.53
path	43.28,39.61	42.28,38.89	41.58,37.21	42.55,35.50	42.04,33.21
path	45.13,32.85	46.58,30.52	46.71,28.37	48.20,28.72	49.48,31.40
path	50.44,34.37	52.43,34.60	56.90,37.50	58.56,39.33
Click ore as you follow the path around this area
|tip Track them on your minimap with "Find Minerals".
|tip You will need level 75 Mining to collect these.
collect 5 Silver Ore##2775 |n
|tip Smelt the ore at a forge.
collect 5 Silver Bar##2842 |or
|tip Create them with Mining or purchase them from the auction house. |notinsticky
|tip These totals are approximate. |notinsticky
|tip You may need more or less than the indicated amount. |notinsticky
'|complete skill("Blacksmithing") >= 105 |or
step
label "Collect_Bronze_Bar_Total"
map Durotar
path follow smart; loop on; ants curved; dist 20
path	50.96,17.00	52.99,18.09	54.60,19.05	55.40,21.06	55.71,23.38
path	56.28,25.33	55.89,27.78	54.64,27.62	55.10,30.09	58.12,29.94
path	55.62,32.75	55.97,36.63	55.71,40.53	57.32,42.00	59.26,41.50
path	57.59,43.98	55.27,48.14	50.81,48.20	48.51,43.33	47.83,39.78
path	46.87,34.69	45.55,32.24	45.61,27.19	46.52,23.35	48.07,21.59
path	49.70,21.37	49.54,18.59
Click ore as you follow the path around this area
|tip Track them on your minimap with "Find Minerals".
collect 70 Copper Ore##2770 |or
|tip Save the ore for the next step.
collect 140 Bronze Bar##2841 |or
|tip Create them with Mining or purchase them from the auction house. |notinsticky
|tip These totals are approximate. |notinsticky
|tip You may need more or less than the indicated amount. |notinsticky
'|complete skill("Blacksmithing") >= 150 |or
step
map The Barrens
path follow smart; loop on; ants curved; dist 20
path	59.10,40.30	60.19,40.99	61.84,40.54	62.14,43.04	62.65,46.75
path	61.30,50.02	60.46,50.11	58.76,50.43	56.82,51.16	55.42,52.22
path	53.50,52.61	53.16,56.18	51.94,57.54	50.38,58.57	49.34,61.86
path	47.74,65.34	49.23,69.53	48.13,71.47	48.25,74.69	49.98,75.97
path	49.97,78.84	48.59,80.24	48.26,82.33	46.66,83.76	46.10,86.08
path	44.27,84.64	42.70,82.63	41.20,79.51	44.09,78.36	43.80,75.03
path	43.88,73.08	42.35,72.24	41.90,68.97	43.39,69.35	45.54,68.99
path	45.03,65.70	43.83,62.98	43.15,60.77	43.09,56.64	43.61,52.80
path	41.37,48.89	42.58,47.61	41.37,44.96	43.42,44.79	43.15,42.53
path	43.28,39.61	42.28,38.89	41.58,37.21	42.55,35.50	42.04,33.21
path	45.13,32.85	46.58,30.52	46.71,28.37	48.20,28.72	49.48,31.40
path	50.44,34.37	52.43,34.60	56.90,37.50	58.56,39.33
Click ore as you follow the path around this area
|tip Track them on your minimap with "Find Minerals".
|tip You will need level 65 Mining to collect these.
collect 70 Tin Ore##2771 |n
|tip Smelt the Copper and Tin Ore into Bronze Bars at a forge.
collect 140 Bronze Bar##2841 |or
|tip Create them with Mining or purchase them from the auction house. |notinsticky
|tip These totals are approximate. |notinsticky
|tip You may need more or less than the indicated amount. |notinsticky
'|complete skill("Blacksmithing") >= 150 |or
step
label "Collect_Heavy_Stone_Total"
map Arathi Highlands
path follow smart; loop on; ants curved; dist 20
path	78.66,36.13	77.36,41.29	75.00,44.93	72.65,48.07	70.58,55.05
path	69.99,58.40	72.92,59.03	72.28,63.63	72.78,66.86	71.75,66.15
path	69.15,72.54	67.17,70.90	63.52,73.55	59.48,74.71	59.32,70.74
path	56.16,71.89	50.82,78.41	47.96,82.44	42.53,80.75	43.02,77.16
path	40.39,71.86	37.95,67.63	38.52,68.50	33.94,66.02	34.59,61.64
path	33.70,56.77	33.45,53.94	33.65,50.19	35.00,47.28	32.96,46.68
path	31.68,45.41	32.34,42.64	31.42,41.24	25.23,43.10	20.94,39.12
path	20.02,35.80	19.12,33.36	22.43,31.28	23.48,24.90	26.93,20.65
path	28.65,14.18	28.96,16.96	31.62,18.63	30.96,20.36	33.19,21.23
path	36.35,24.61	39.97,25.62	40.21,28.79	43.97,30.51	45.70,33.02
path	48.08,33.60	49.78,36.76	52.14,36.11	52.75,31.99	54.80,33.13
path	58.19,32.50	58.02,34.22	59.94,35.97	62.25,32.06	64.69,35.58
path	64.49,26.56	66.77,27.64	70.39,27.07	70.47,30.74	72.89,30.09
path	76.73,29.48	76.70,33.68	79.56,35.45
Click ore as you follow the path around this area
|tip Track them on your minimap with "Find Minerals".
|tip You will need level 125 Mining to collect these.
collect 90 Heavy Stone##2838 |or
|tip Farm them with Mining or purchase them from the auction house. |notinsticky
|tip These totals are approximate. |notinsticky
|tip You may need more or less than the indicated amount. |notinsticky
'|complete skill("Blacksmithing") >= 140 |or
step
label "Collect_Gold_Bar_Total"
map Arathi Highlands
path follow smart; loop on; ants curved; dist 20
path	78.66,36.13	77.36,41.29	75.00,44.93	72.65,48.07	70.58,55.05
path	69.99,58.40	72.92,59.03	72.28,63.63	72.78,66.86	71.75,66.15
path	69.15,72.54	67.17,70.90	63.52,73.55	59.48,74.71	59.32,70.74
path	56.16,71.89	50.82,78.41	47.96,82.44	42.53,80.75	43.02,77.16
path	40.39,71.86	37.95,67.63	38.52,68.50	33.94,66.02	34.59,61.64
path	33.70,56.77	33.45,53.94	33.65,50.19	35.00,47.28	32.96,46.68
path	31.68,45.41	32.34,42.64	31.42,41.24	25.23,43.10	20.94,39.12
path	20.02,35.80	19.12,33.36	22.43,31.28	23.48,24.90	26.93,20.65
path	28.65,14.18	28.96,16.96	31.62,18.63	30.96,20.36	33.19,21.23
path	36.35,24.61	39.97,25.62	40.21,28.79	43.97,30.51	45.70,33.02
path	48.08,33.60	49.78,36.76	52.14,36.11	52.75,31.99	54.80,33.13
path	58.19,32.50	58.02,34.22	59.94,35.97	62.25,32.06	64.69,35.58
path	64.49,26.56	66.77,27.64	70.39,27.07	70.47,30.74	72.89,30.09
path	76.73,29.48	76.70,33.68	79.56,35.45
Click ore as you follow the path around this area
|tip Track them on your minimap with "Find Minerals".
|tip You will need level 155 Mining to collect these.
collect 5 Gold Ore##2776 |n
|tip Smelt the ore at a forge.
collect 5 Gold Bar##3577 |or
|tip Create them with Mining or purchase them from the auction house. |notinsticky
|tip These totals are approximate. |notinsticky
|tip You may need more or less than the indicated amount. |notinsticky
'|complete skill("Blacksmithing") >= 155 |or
stickystart "Collect_Steel_Bar_Total"
stickystart "Collect_Solid_Stone_Total"
stickystart "Collect_Mithril_Bar_Total"
stickystart "Collect_Mageweave_Cloth_Total"
stickystart "Collect_Dense_Stone_Total"
stickystart "Collect_Thorium_Bar_Total"
step
map Arathi Highlands
path follow smart; loop on; ants curved; dist 20
path	78.66,36.13	77.36,41.29	75.00,44.93	72.65,48.07	70.58,55.05
path	69.99,58.40	72.92,59.03	72.28,63.63	72.78,66.86	71.75,66.15
path	69.15,72.54	67.17,70.90	63.52,73.55	59.48,74.71	59.32,70.74
path	56.16,71.89	50.82,78.41	47.96,82.44	42.53,80.75	43.02,77.16
path	40.39,71.86	37.95,67.63	38.52,68.50	33.94,66.02	34.59,61.64
path	33.70,56.77	33.45,53.94	33.65,50.19	35.00,47.28	32.96,46.68
path	31.68,45.41	32.34,42.64	31.42,41.24	25.23,43.10	20.94,39.12
path	20.02,35.80	19.12,33.36	22.43,31.28	23.48,24.90	26.93,20.65
path	28.65,14.18	28.96,16.96	31.62,18.63	30.96,20.36	33.19,21.23
path	36.35,24.61	39.97,25.62	40.21,28.79	43.97,30.51	45.70,33.02
path	48.08,33.60	49.78,36.76	52.14,36.11	52.75,31.99	54.80,33.13
path	58.19,32.50	58.02,34.22	59.94,35.97	62.25,32.06	64.69,35.58
path	64.49,26.56	66.77,27.64	70.39,27.07	70.47,30.74	72.89,30.09
path	76.73,29.48	76.70,33.68	79.56,35.45
Click ore as you follow the path around this area
|tip Track them on your minimap with "Find Minerals".
|tip You will need level 125 Mining to collect these.
collect 420 Iron Ore##2772 |n
|tip Smelt the ore at a forge.
collect 230 Iron Bar##3575 |or
|tip Create them with Mining or purchase them from the auction house. |notinsticky
|tip These totals are approximate. |notinsticky
|tip You may need more or less than the indicated amount. |notinsticky
'|complete skill("Blacksmithing") >= 190 |or
step
label "Collect_Steel_Bar_Total"
map Arathi Highlands
path follow smart; loop on; ants curved; dist 20
path	78.66,36.13	77.36,41.29	75.00,44.93	72.65,48.07	70.58,55.05
path	69.99,58.40	72.92,59.03	72.28,63.63	72.78,66.86	71.75,66.15
path	69.15,72.54	67.17,70.90	63.52,73.55	59.48,74.71	59.32,70.74
path	56.16,71.89	50.82,78.41	47.96,82.44	42.53,80.75	43.02,77.16
path	40.39,71.86	37.95,67.63	38.52,68.50	33.94,66.02	34.59,61.64
path	33.70,56.77	33.45,53.94	33.65,50.19	35.00,47.28	32.96,46.68
path	31.68,45.41	32.34,42.64	31.42,41.24	25.23,43.10	20.94,39.12
path	20.02,35.80	19.12,33.36	22.43,31.28	23.48,24.90	26.93,20.65
path	28.65,14.18	28.96,16.96	31.62,18.63	30.96,20.36	33.19,21.23
path	36.35,24.61	39.97,25.62	40.21,28.79	43.97,30.51	45.70,33.02
path	48.08,33.60	49.78,36.76	52.14,36.11	52.75,31.99	54.80,33.13
path	58.19,32.50	58.02,34.22	59.94,35.97	62.25,32.06	64.69,35.58
path	64.49,26.56	66.77,27.64	70.39,27.07	70.47,30.74	72.89,30.09
path	76.73,29.48	76.70,33.68	79.56,35.45
Click ore as you follow the path around this area
|tip Track them on your minimap with "Find Minerals".
|tip You will need level 125 Mining to collect these.
collect 190 Iron Ore##2772 |n
|tip Buy 190 Coal from the Trade Supplier near the forge.
|tip Smelt the ore at a forge.
collect 190 Steel Bar##3859 |or
|tip Create them with Mining or purchase them from the auction house.
|tip These totals are approximate.
|tip You may need more or less than the indicated amount.
'|complete skill("Blacksmithing") >= 235 |or
step
label "Collect_Solid_Stone_Total"
map Badlands
path follow smart; loop on; ants curved; dist 20
path	26.84,74.76	25.28,78.53	19.71,81.32	14.75,83.82	12.50,85.54
path	7.98,80.56	6.30,74.40	8.68,67.97	17.19,68.54	15.13,72.43
path	17.19,77.39	21.25,75.06	25.11,72.08
Click ore as you follow the path around this area
|tip Track them on your minimap with "Find Minerals".
|tip You will need level 175 Mining to collect these.
collect 520 Solid Stone##7912 |or
|tip Farm them with Mining or purchase them from the auction house. |notinsticky
|tip These totals are approximate. |notinsticky
|tip You may need more or less than the indicated amount. |notinsticky
'|complete skill("Blacksmithing") >= 210 |or
step
label "Collect_Mithril_Bar_Total"
map Badlands
path follow smart; loop on; ants curved; dist 20
path	26.84,74.76	25.28,78.53	19.71,81.32	14.75,83.82	12.50,85.54
path	7.98,80.56	6.30,74.40	8.68,67.97	17.19,68.54	15.13,72.43
path	17.19,77.39	21.25,75.06	25.11,72.08
Click ore as you follow the path around this area
|tip Track them on your minimap with "Find Minerals".
|tip You will need level 175 Mining to collect these.
collect 250 Mithril Ore##3858 |n
|tip Smelt the ore at a forge.
collect 250 Mithril Bar##3860 |or
|tip Create them with Mining or purchase them from the auction house. |notinsticky
|tip These totals are approximate. |notinsticky
|tip You may need more or less than the indicated amount. |notinsticky
'|complete skill("Blacksmithing") >= 270 |or
step
label "Collect_Mageweave_Cloth_Total"
Kill Dunemaul enemies around this area
collect 60 Mageweave Cloth##4338 |or |goto Tanaris/0 40.50,55.50
|tip Farm them from humanoid mobs or purchase them from the auction house.
|tip These totals are approximate. |notinsticky
|tip You may need more or less than the indicated amount. |notinsticky
'|complete skill("Blacksmithing") >= 225 |or
step
label "Collect_Dense_Stone_Total"
map Un'Goro Crater
path follow smart; loop on; ants curved; dist 20
path	66.46,78.95	64.56,79.71	61.79,84.21	59.34,84.18	57.63,86.04
path	54.50,86.69	51.13,86.82	48.27,87.30	45.98,86.58	42.89,85.00
path	40.79,83.52	37.91,83.14	36.77,80.17	33.58,79.05	30.40,79.61
path	28.89,76.98	28.97,71.52	26.00,67.67	25.93,63.53	24.59,58.51
path	23.95,53.04	24.40,48.21	23.89,44.76	24.71,41.12	26.26,36.59
path	26.62,31.21	28.29,29.47	29.59,25.66	29.89,20.92	33.32,20.67
path	36.29,20.47	38.67,16.00	41.73,15.77	43.32,14.12	46.94,13.03
path	49.79,13.83	52.84,12.88	56.31,14.04	59.61,16.58	62.25,16.02
path	64.19,19.90	65.99,21.01	68.51,20.26	71.19,20.89	71.21,23.75
path	71.75,28.19	74.76,32.46	75.06,37.15	76.32,43.15	76.67,48.32
path	77.05,53.09	76.56,57.02	75.35,61.97	74.66,68.05	72.92,70.46
path	71.39,73.80	71.00,79.21	68.32,79.90
Click ore as you follow the path around this area
|tip Track them on your minimap with "Find Minerals".
|tip You will need level 245 Mining to collect these.
collect 20 Dense Stone##12365 |or
|tip Farm them with Mining or purchase them from the auction house. |notinsticky
|tip These totals are approximate. |notinsticky
|tip You may need more or less than the indicated amount. |notinsticky
'|complete skill("Blacksmithing") >= 260 |or
step
label "Collect_Thorium_Bar_Total"
map Un'Goro Crater
path follow smart; loop on; ants curved; dist 20
path	66.46,78.95	64.56,79.71	61.79,84.21	59.34,84.18	57.63,86.04
path	54.50,86.69	51.13,86.82	48.27,87.30	45.98,86.58	42.89,85.00
path	40.79,83.52	37.91,83.14	36.77,80.17	33.58,79.05	30.40,79.61
path	28.89,76.98	28.97,71.52	26.00,67.67	25.93,63.53	24.59,58.51
path	23.95,53.04	24.40,48.21	23.89,44.76	24.71,41.12	26.26,36.59
path	26.62,31.21	28.29,29.47	29.59,25.66	29.89,20.92	33.32,20.67
path	36.29,20.47	38.67,16.00	41.73,15.77	43.32,14.12	46.94,13.03
path	49.79,13.83	52.84,12.88	56.31,14.04	59.61,16.58	62.25,16.02
path	64.19,19.90	65.99,21.01	68.51,20.26	71.19,20.89	71.21,23.75
path	71.75,28.19	74.76,32.46	75.06,37.15	76.32,43.15	76.67,48.32
path	77.05,53.09	76.56,57.02	75.35,61.97	74.66,68.05	72.92,70.46
path	71.39,73.80	71.00,79.21	68.32,79.90
Click ore as you follow the path around this area
|tip Track them on your minimap with "Find Minerals".
|tip You will need level 245 Mining to collect these.
collect 432 Thorium Ore##10620 |n
|tip Smelt the ore at a forge.
collect 432 Thorium Bar##12359 |or
|tip Create them with Mining or purchase them from the auction house. |notinsticky
|tip These totals are approximate. |notinsticky
|tip You may need more or less than the indicated amount. |notinsticky
'|complete skill("Blacksmithing") >= 300 |or
step
talk Tamar##3366
|tip Inside the building.
buy 35 Green Dye##2605 |goto Orgrimmar/0 63.05,45.53 |or
'|complete skill("Blacksmithing") >= 165 |or
step
label "Begin_Profession_Leveling"
talk Sumi##3356
|tip Inside the building.
buy Blacksmith Hammer##5956 |goto 82.59,23.95 |or
|tip Save this, you will need it later.
'|complete skill("Blacksmithing") >= 375 |or
step
map Durotar
path follow smart; loop on; ants curved; dist 20
path	50.96,17.00	52.99,18.09	54.60,19.05	55.40,21.06	55.71,23.38
path	56.28,25.33	55.89,27.78	54.64,27.62	55.10,30.09	58.12,29.94
path	55.62,32.75	55.97,36.63	55.71,40.53	57.32,42.00	59.26,41.50
path	57.59,43.98	55.27,48.14	50.81,48.20	48.51,43.33	47.83,39.78
path	46.87,34.69	45.55,32.24	45.61,27.19	46.52,23.35	48.07,21.59
path	49.70,21.37	49.54,18.59
Click ore as you follow the path around this area
|tip Track them on your minimap with "Find Minerals".
collect 40 Rough Stone##2835 |or
|tip Farm them with Mining or purchase them from the auction house.
'|complete skill("Blacksmithing") >= 30 |or
step
create 40 Rough Sharpening Stone##2660,Blacksmithing,30
|tip You may need to create more or less of these.
|tip Each additional Rough Sharpening Stone requires one Rough Stone.
step
talk Saru Steelfury##3355
|tip Inside the building.
Train Rough Grinding Stone |learn Rough Grinding Stone##3320 |goto Orgrimmar/0 82.35,22.98
step
map Durotar
path follow smart; loop on; ants curved; dist 20
path	50.96,17.00	52.99,18.09	54.60,19.05	55.40,21.06	55.71,23.38
path	56.28,25.33	55.89,27.78	54.64,27.62	55.10,30.09	58.12,29.94
path	55.62,32.75	55.97,36.63	55.71,40.53	57.32,42.00	59.26,41.50
path	57.59,43.98	55.27,48.14	50.81,48.20	48.51,43.33	47.83,39.78
path	46.87,34.69	45.55,32.24	45.61,27.19	46.52,23.35	48.07,21.59
path	49.70,21.37	49.54,18.59
Click ore as you follow the path around this area
|tip Track them on your minimap with "Find Minerals".
collect 110 Rough Stone##2835 |or
|tip Farm them with Mining or purchase them from the auction house.
'|complete skill("Blacksmithing") >= 65 |or
step
create 55 Rough Grinding Stone##3320,Blacksmithing,65
|tip You may need to create more or less of these.
|tip Each additional Rough Grinding Stone requires two Rough Stone.
|tip Save 10 of these, you will need them later.
step
talk Saru Steelfury##3355
|tip Inside the building.
Train Coarse Sharpening Stone |learn Coarse Sharpening Stone##2665 |goto Orgrimmar/0 82.35,22.98
step
map The Barrens
path follow smart; loop on; ants curved; dist 20
path	59.10,40.30	60.19,40.99	61.84,40.54	62.14,43.04	62.65,46.75
path	61.30,50.02	60.46,50.11	58.76,50.43	56.82,51.16	55.42,52.22
path	53.50,52.61	53.16,56.18	51.94,57.54	50.38,58.57	49.34,61.86
path	47.74,65.34	49.23,69.53	48.13,71.47	48.25,74.69	49.98,75.97
path	49.97,78.84	48.59,80.24	48.26,82.33	46.66,83.76	46.10,86.08
path	44.27,84.64	42.70,82.63	41.20,79.51	44.09,78.36	43.80,75.03
path	43.88,73.08	42.35,72.24	41.90,68.97	43.39,69.35	45.54,68.99
path	45.03,65.70	43.83,62.98	43.15,60.77	43.09,56.64	43.61,52.80
path	41.37,48.89	42.58,47.61	41.37,44.96	43.42,44.79	43.15,42.53
path	43.28,39.61	42.28,38.89	41.58,37.21	42.55,35.50	42.04,33.21
path	45.13,32.85	46.58,30.52	46.71,28.37	48.20,28.72	49.48,31.40
path	50.44,34.37	52.43,34.60	56.90,37.50	58.56,39.33
Click ore as you follow the path around this area
|tip Track them on your minimap with "Find Minerals".
|tip You will need level 65 Mining to collect these.
collect 25 Coarse Stone##2836 |or
|tip Farm them with Mining or purchase them from the auction house.
'|complete skill("Blacksmithing") >= 75 |or
step
create 25 Coarse Sharpening Stone##2665,Blacksmithing,75
|tip You may need to create more or less of these.
|tip Each additional Coarse Sharpening Stone requires one Coarse Stone.
step
Reach Level 10 |ding 10
|tip You must be at least level 10 to train Journeyman professions.
|tip Use the leveling guides to accomplish this.
step
talk Saru Steelfury##3355
|tip Inside the building.
Train Journeyman Blacksmithing |skillmax Blacksmithing,150 |goto Orgrimmar/0 82.35,22.98
step
talk Saru Steelfury##3355
|tip Inside the building.
Train Coarse Grinding Stone |learn Coarse Grinding Stone##3326 |goto Orgrimmar/0 82.35,22.98
step
map The Barrens
path follow smart; loop on; ants curved; dist 20
path	59.10,40.30	60.19,40.99	61.84,40.54	62.14,43.04	62.65,46.75
path	61.30,50.02	60.46,50.11	58.76,50.43	56.82,51.16	55.42,52.22
path	53.50,52.61	53.16,56.18	51.94,57.54	50.38,58.57	49.34,61.86
path	47.74,65.34	49.23,69.53	48.13,71.47	48.25,74.69	49.98,75.97
path	49.97,78.84	48.59,80.24	48.26,82.33	46.66,83.76	46.10,86.08
path	44.27,84.64	42.70,82.63	41.20,79.51	44.09,78.36	43.80,75.03
path	43.88,73.08	42.35,72.24	41.90,68.97	43.39,69.35	45.54,68.99
path	45.03,65.70	43.83,62.98	43.15,60.77	43.09,56.64	43.61,52.80
path	41.37,48.89	42.58,47.61	41.37,44.96	43.42,44.79	43.15,42.53
path	43.28,39.61	42.28,38.89	41.58,37.21	42.55,35.50	42.04,33.21
path	45.13,32.85	46.58,30.52	46.71,28.37	48.20,28.72	49.48,31.40
path	50.44,34.37	52.43,34.60	56.90,37.50	58.56,39.33
Click ore as you follow the path around this area
|tip Track them on your minimap with "Find Minerals".
|tip You will need level 65 Mining to collect these.
collect 60 Coarse Stone##2836 |or
|tip Farm them with Mining or purchase them from the auction house.
'|complete skill("Blacksmithing") >= 90 |or
step
create 30 Coarse Grinding Stone##3326,Blacksmithing,30 total |or
'|complete skill("Blacksmithing") >= 90 |or
step
create 1 Coarse Grinding Stone##3326,Blacksmithing,90
|tip You may need to create more of these.
|tip Each additional Coarse Grinding Stone requires two Coarse Stone.
|tip Save 30 of these, you will need them later.
step
talk Saru Steelfury##3355
|tip Inside the building.
Train Runed Copper Belt |learn Runed Copper Belt##2666 |goto Orgrimmar/0 82.35,22.98
step
map Durotar
path follow smart; loop on; ants curved; dist 20
path	50.96,17.00	52.99,18.09	54.60,19.05	55.40,21.06	55.71,23.38
path	56.28,25.33	55.89,27.78	54.64,27.62	55.10,30.09	58.12,29.94
path	55.62,32.75	55.97,36.63	55.71,40.53	57.32,42.00	59.26,41.50
path	57.59,43.98	55.27,48.14	50.81,48.20	48.51,43.33	47.83,39.78
path	46.87,34.69	45.55,32.24	45.61,27.19	46.52,23.35	48.07,21.59
path	49.70,21.37	49.54,18.59
Click ore as you follow the path around this area
|tip Track them on your minimap with "Find Minerals".
collect 100 Copper Ore##2770 |n
|tip Smelt the ore at a forge.
collect 100 Copper Bar##2840 |or
|tip Create them with Mining or purchase them from the auction house.
'|complete skill("Blacksmithing") >= 100 |or
step
create 10 Runed Copper Belt##2666,Blacksmithing,100 |goto 82.35,22.98
|tip Stand next to an anvil.
|tip Inside the building.
step
talk Saru Steelfury##3355
|tip Inside the building.
Train Silver Rod |learn Silver Rod##7818 |goto Orgrimmar/0 82.35,22.98
stickystart "Collect_Rough_Grinding_Stone_105"
step
map The Barrens
path follow smart; loop on; ants curved; dist 20
path	59.10,40.30	60.19,40.99	61.84,40.54	62.14,43.04	62.65,46.75
path	61.30,50.02	60.46,50.11	58.76,50.43	56.82,51.16	55.42,52.22
path	53.50,52.61	53.16,56.18	51.94,57.54	50.38,58.57	49.34,61.86
path	47.74,65.34	49.23,69.53	48.13,71.47	48.25,74.69	49.98,75.97
path	49.97,78.84	48.59,80.24	48.26,82.33	46.66,83.76	46.10,86.08
path	44.27,84.64	42.70,82.63	41.20,79.51	44.09,78.36	43.80,75.03
path	43.88,73.08	42.35,72.24	41.90,68.97	43.39,69.35	45.54,68.99
path	45.03,65.70	43.83,62.98	43.15,60.77	43.09,56.64	43.61,52.80
path	41.37,48.89	42.58,47.61	41.37,44.96	43.42,44.79	43.15,42.53
path	43.28,39.61	42.28,38.89	41.58,37.21	42.55,35.50	42.04,33.21
path	45.13,32.85	46.58,30.52	46.71,28.37	48.20,28.72	49.48,31.40
path	50.44,34.37	52.43,34.60	56.90,37.50	58.56,39.33
Click ore as you follow the path around this area
|tip Track them on your minimap with "Find Minerals".
|tip You will need level 75 Mining to collect these.
collect Silver Ore##2775 |n
|tip Smelt the ore at a forge.
collect 5 Silver Bar##2842 |or
|tip Create them with Mining or purchase them from the auction house.
'|complete skill("Blacksmithing") >= 105 |or
step
label "Collect_Rough_Grinding_Stone_105"
collect 10 Rough Grinding Stone##3470 |or
|tip You created these in a previous step.
'|complete skill("Blacksmithing") >= 105 |or
step
create 5 Silver Rod##7818,Blacksmithing,105 |goto 82.35,22.98
|tip Stand next to an anvil.
|tip Inside the building.
step
map Durotar
path follow smart; loop on; ants curved; dist 20
path	50.96,17.00	52.99,18.09	54.60,19.05	55.40,21.06	55.71,23.38
path	56.28,25.33	55.89,27.78	54.64,27.62	55.10,30.09	58.12,29.94
path	55.62,32.75	55.97,36.63	55.71,40.53	57.32,42.00	59.26,41.50
path	57.59,43.98	55.27,48.14	50.81,48.20	48.51,43.33	47.83,39.78
path	46.87,34.69	45.55,32.24	45.61,27.19	46.52,23.35	48.07,21.59
path	49.70,21.37	49.54,18.59
Click ore as you follow the path around this area
|tip Track them on your minimap with "Find Minerals".
collect Copper Ore##2770 |n
|tip Smelt the ore at a forge.
collect 50 Copper Bar##2840 |or
|tip Farm them with Mining or purchase them from the auction house.
'|complete skill("Blacksmithing") >= 110 |or
step
Enter the building |goto Orgrimmar/0 81.62,22.79 < 7 |walk
create 5 Runed Copper Belt##2666,Blacksmithing,110 |goto 82.35,22.98
|tip Stand next to an anvil.
|tip Inside the building.
step
talk Saru Steelfury##3355
|tip Inside the building.
Train Rough Bronze Leggings |learn Rough Bronze Leggings##2668 |goto Orgrimmar/0 82.35,22.98
step
map Durotar
path follow smart; loop on; ants curved; dist 20
path	50.96,17.00	52.99,18.09	54.60,19.05	55.40,21.06	55.71,23.38
path	56.28,25.33	55.89,27.78	54.64,27.62	55.10,30.09	58.12,29.94
path	55.62,32.75	55.97,36.63	55.71,40.53	57.32,42.00	59.26,41.50
path	57.59,43.98	55.27,48.14	50.81,48.20	48.51,43.33	47.83,39.78
path	46.87,34.69	45.55,32.24	45.61,27.19	46.52,23.35	48.07,21.59
path	49.70,21.37	49.54,18.59
Click ore as you follow the path around this area
|tip Track them on your minimap with "Find Minerals".
collect 45 Copper Ore##2770 |or
|tip Save the ore for the next step.
collect 90 Bronze Bar##2841 |or
|tip Create them with Mining or purchase them from the auction house.
'|complete skill("Blacksmithing") >= 125 |or
step
map The Barrens
path follow smart; loop on; ants curved; dist 20
path	59.10,40.30	60.19,40.99	61.84,40.54	62.14,43.04	62.65,46.75
path	61.30,50.02	60.46,50.11	58.76,50.43	56.82,51.16	55.42,52.22
path	53.50,52.61	53.16,56.18	51.94,57.54	50.38,58.57	49.34,61.86
path	47.74,65.34	49.23,69.53	48.13,71.47	48.25,74.69	49.98,75.97
path	49.97,78.84	48.59,80.24	48.26,82.33	46.66,83.76	46.10,86.08
path	44.27,84.64	42.70,82.63	41.20,79.51	44.09,78.36	43.80,75.03
path	43.88,73.08	42.35,72.24	41.90,68.97	43.39,69.35	45.54,68.99
path	45.03,65.70	43.83,62.98	43.15,60.77	43.09,56.64	43.61,52.80
path	41.37,48.89	42.58,47.61	41.37,44.96	43.42,44.79	43.15,42.53
path	43.28,39.61	42.28,38.89	41.58,37.21	42.55,35.50	42.04,33.21
path	45.13,32.85	46.58,30.52	46.71,28.37	48.20,28.72	49.48,31.40
path	50.44,34.37	52.43,34.60	56.90,37.50	58.56,39.33
Click ore as you follow the path around this area
|tip Track them on your minimap with "Find Minerals".
|tip You will need level 65 Mining to collect these.
collect 45 Tin Ore##2771 |n
|tip Smelt the Bronze Bars at a forge.
collect 90 Bronze Bar##2841 |or
|tip Create them with Mining or purchase them from the auction house.
'|complete skill("Blacksmithing") >= 125 |or
step
create 15 Rough Bronze Leggings##2668,Blacksmithing,125 |goto Orgrimmar/0 82.35,22.98
|tip Stand next to an anvil.
|tip Inside the building.
step
talk Saru Steelfury##3355
|tip Inside the building.
Train Heavy Grinding Stone |learn Heavy Grinding Stone##3337 |goto Orgrimmar/0 82.35,22.98
step
map Arathi Highlands
path follow smart; loop on; ants curved; dist 20
path	78.66,36.13	77.36,41.29	75.00,44.93	72.65,48.07	70.58,55.05
path	69.99,58.40	72.92,59.03	72.28,63.63	72.78,66.86	71.75,66.15
path	69.15,72.54	67.17,70.90	63.52,73.55	59.48,74.71	59.32,70.74
path	56.16,71.89	50.82,78.41	47.96,82.44	42.53,80.75	43.02,77.16
path	40.39,71.86	37.95,67.63	38.52,68.50	33.94,66.02	34.59,61.64
path	33.70,56.77	33.45,53.94	33.65,50.19	35.00,47.28	32.96,46.68
path	31.68,45.41	32.34,42.64	31.42,41.24	25.23,43.10	20.94,39.12
path	20.02,35.80	19.12,33.36	22.43,31.28	23.48,24.90	26.93,20.65
path	28.65,14.18	28.96,16.96	31.62,18.63	30.96,20.36	33.19,21.23
path	36.35,24.61	39.97,25.62	40.21,28.79	43.97,30.51	45.70,33.02
path	48.08,33.60	49.78,36.76	52.14,36.11	52.75,31.99	54.80,33.13
path	58.19,32.50	58.02,34.22	59.94,35.97	62.25,32.06	64.69,35.58
path	64.49,26.56	66.77,27.64	70.39,27.07	70.47,30.74	72.89,30.09
path	76.73,29.48	76.70,33.68	79.56,35.45
Click ore as you follow the path around this area
|tip Track them on your minimap with "Find Minerals".
|tip You will need level 125 Mining to collect these.
collect 90 Heavy Stone##2838 |or
|tip Farm them with Mining or purchase them from the auction house.
'|complete skill("Blacksmithing") >= 140 |or
step
create 30 Heavy Grinding Stone##3337,Blacksmithing,30 total |or
'|complete skill("Blacksmithing") >= 140 |or
step
create 1 Heavy Grinding Stone##3337,Blacksmithing,140
|tip You may need to create more of these.
|tip Each additional Heavy Grinding Stone requires three Heavy Stone.
|tip Save 30 of these, you will need them later.
step
talk Saru Steelfury##3355
|tip Inside the building.
Train Patterned Bronze Bracers |learn Patterned Bronze Bracers##2672 |goto Orgrimmar/0 82.35,22.98
stickystart "Collect_Coarse_Grinding_Stone_150"
step
map Durotar
path follow smart; loop on; ants curved; dist 20
path	50.96,17.00	52.99,18.09	54.60,19.05	55.40,21.06	55.71,23.38
path	56.28,25.33	55.89,27.78	54.64,27.62	55.10,30.09	58.12,29.94
path	55.62,32.75	55.97,36.63	55.71,40.53	57.32,42.00	59.26,41.50
path	57.59,43.98	55.27,48.14	50.81,48.20	48.51,43.33	47.83,39.78
path	46.87,34.69	45.55,32.24	45.61,27.19	46.52,23.35	48.07,21.59
path	49.70,21.37	49.54,18.59
Click ore as you follow the path around this area
|tip Track them on your minimap with "Find Minerals".
collect 25 Copper Ore##2770 |or
|tip Save the ore for the next step.
collect 50 Bronze Bar##2841 |or
|tip Create them with Mining or purchase them from the auction house.
'|complete skill("Blacksmithing") >= 150 |or
step
map The Barrens
path follow smart; loop on; ants curved; dist 20
path	59.10,40.30	60.19,40.99	61.84,40.54	62.14,43.04	62.65,46.75
path	61.30,50.02	60.46,50.11	58.76,50.43	56.82,51.16	55.42,52.22
path	53.50,52.61	53.16,56.18	51.94,57.54	50.38,58.57	49.34,61.86
path	47.74,65.34	49.23,69.53	48.13,71.47	48.25,74.69	49.98,75.97
path	49.97,78.84	48.59,80.24	48.26,82.33	46.66,83.76	46.10,86.08
path	44.27,84.64	42.70,82.63	41.20,79.51	44.09,78.36	43.80,75.03
path	43.88,73.08	42.35,72.24	41.90,68.97	43.39,69.35	45.54,68.99
path	45.03,65.70	43.83,62.98	43.15,60.77	43.09,56.64	43.61,52.80
path	41.37,48.89	42.58,47.61	41.37,44.96	43.42,44.79	43.15,42.53
path	43.28,39.61	42.28,38.89	41.58,37.21	42.55,35.50	42.04,33.21
path	45.13,32.85	46.58,30.52	46.71,28.37	48.20,28.72	49.48,31.40
path	50.44,34.37	52.43,34.60	56.90,37.50	58.56,39.33
Click ore as you follow the path around this area
|tip Track them on your minimap with "Find Minerals".
|tip You will need level 65 Mining to collect these.
collect 25 Tin Ore##2771 |n
|tip Smelt the Bronze Bars at a forge.
collect 50 Bronze Bar##2841 |or
|tip Create them with Mining or purchase them from the auction house.
'|complete skill("Blacksmithing") >= 150 |or
step
label "Collect_Coarse_Grinding_Stone_150"
collect 20 Coarse Grinding Stone##3478 |or
|tip You created these in a previous step.
'|complete skill("Blacksmithing") >= 150 |or
step
create 10 Patterned Bronze Bracers##2672,Blacksmithing,150 |goto Orgrimmar/0 82.35,22.98
|tip Stand next to an anvil.
|tip Inside the building.
step
Reach Level 20 |ding 20
|tip You must be at least level 20 to train Expert professions.
|tip Use the leveling guides to accomplish this.
step
talk Saru Steelfury##3355
|tip Inside the building.
Train Expert Blacksmithing |skillmax Blacksmithing,225 |goto Orgrimmar/0 82.35,22.98
step
talk Saru Steelfury##3355
|tip Inside the building.
Train Golden Rod |learn Golden Rod##14379 |goto Orgrimmar/0 82.35,22.98
stickystart "Collect_Coarse_Grinding_Stone_155"
step
map Arathi Highlands
path follow smart; loop on; ants curved; dist 20
path	78.66,36.13	77.36,41.29	75.00,44.93	72.65,48.07	70.58,55.05
path	69.99,58.40	72.92,59.03	72.28,63.63	72.78,66.86	71.75,66.15
path	69.15,72.54	67.17,70.90	63.52,73.55	59.48,74.71	59.32,70.74
path	56.16,71.89	50.82,78.41	47.96,82.44	42.53,80.75	43.02,77.16
path	40.39,71.86	37.95,67.63	38.52,68.50	33.94,66.02	34.59,61.64
path	33.70,56.77	33.45,53.94	33.65,50.19	35.00,47.28	32.96,46.68
path	31.68,45.41	32.34,42.64	31.42,41.24	25.23,43.10	20.94,39.12
path	20.02,35.80	19.12,33.36	22.43,31.28	23.48,24.90	26.93,20.65
path	28.65,14.18	28.96,16.96	31.62,18.63	30.96,20.36	33.19,21.23
path	36.35,24.61	39.97,25.62	40.21,28.79	43.97,30.51	45.70,33.02
path	48.08,33.60	49.78,36.76	52.14,36.11	52.75,31.99	54.80,33.13
path	58.19,32.50	58.02,34.22	59.94,35.97	62.25,32.06	64.69,35.58
path	64.49,26.56	66.77,27.64	70.39,27.07	70.47,30.74	72.89,30.09
path	76.73,29.48	76.70,33.68	79.56,35.45
Click ore as you follow the path around this area
|tip Track them on your minimap with "Find Minerals".
|tip You will need level 155 Mining to collect these.
collect 5 Gold Ore##2776 |n
|tip Smelt the ore at a forge.
collect 5 Gold Bar##3577 |or
|tip Create them with Mining or purchase them from the auction house.
'|complete skill("Blacksmithing") >= 155 |or
step
label "Collect_Coarse_Grinding_Stone_155"
collect 10 Coarse Grinding Stone##3478 |or
|tip You created these in a previous step.
'|complete skill("Blacksmithing") >= 155 |or
step
create 5 Golden Rod##14379,Blacksmithing,155 |goto Orgrimmar/0 82.35,22.98
|tip Stand next to an anvil.
|tip Inside the building.
step
talk Saru Steelfury##3355
|tip Inside the building.
Train Green Iron Leggings |learn Green Iron Leggings##3506 |goto Orgrimmar/0 82.35,22.98
stickystart "Collect_Heavy_Grinding_Stone_165"
step
map Arathi Highlands
path follow smart; loop on; ants curved; dist 20
path	78.66,36.13	77.36,41.29	75.00,44.93	72.65,48.07	70.58,55.05
path	69.99,58.40	72.92,59.03	72.28,63.63	72.78,66.86	71.75,66.15
path	69.15,72.54	67.17,70.90	63.52,73.55	59.48,74.71	59.32,70.74
path	56.16,71.89	50.82,78.41	47.96,82.44	42.53,80.75	43.02,77.16
path	40.39,71.86	37.95,67.63	38.52,68.50	33.94,66.02	34.59,61.64
path	33.70,56.77	33.45,53.94	33.65,50.19	35.00,47.28	32.96,46.68
path	31.68,45.41	32.34,42.64	31.42,41.24	25.23,43.10	20.94,39.12
path	20.02,35.80	19.12,33.36	22.43,31.28	23.48,24.90	26.93,20.65
path	28.65,14.18	28.96,16.96	31.62,18.63	30.96,20.36	33.19,21.23
path	36.35,24.61	39.97,25.62	40.21,28.79	43.97,30.51	45.70,33.02
path	48.08,33.60	49.78,36.76	52.14,36.11	52.75,31.99	54.80,33.13
path	58.19,32.50	58.02,34.22	59.94,35.97	62.25,32.06	64.69,35.58
path	64.49,26.56	66.77,27.64	70.39,27.07	70.47,30.74	72.89,30.09
path	76.73,29.48	76.70,33.68	79.56,35.45
Click ore as you follow the path around this area
|tip Track them on your minimap with "Find Minerals".
|tip You will need level 125 Mining to collect these.
collect 80 Iron Ore##2772 |n
|tip Smelt the ore at a forge.
collect 80 Iron Bar##3575 |or
|tip Create them with Mining or purchase them from the auction house.
'|complete skill("Blacksmithing") >= 165 |or
step
label "Collect_Heavy_Grinding_Stone_165"
collect 10 Heavy Grinding Stone##3486 |or
|tip You created these in a previous step.
'|complete skill("Blacksmithing") >= 165 |or
step
talk Tamar##3366
|tip Inside the building.
buy 35 Green Dye##2605 |goto 63.05,45.53 |or
'|complete skill("Blacksmithing") >= 165 |or
step
create 10 Green Iron Leggings##3506,Blacksmithing,165 |goto Orgrimmar/0 82.35,22.98
|tip Stand next to an anvil.
|tip Inside the building.
step
talk Saru Steelfury##3355
|tip Inside the building.
Train Green Iron Bracers |learn Green Iron Bracers##3501 |goto Orgrimmar/0 82.35,22.98
stickystart "Collect_Green_Dye_190"
step
map Arathi Highlands
path follow smart; loop on; ants curved; dist 20
path	78.66,36.13	77.36,41.29	75.00,44.93	72.65,48.07	70.58,55.05
path	69.99,58.40	72.92,59.03	72.28,63.63	72.78,66.86	71.75,66.15
path	69.15,72.54	67.17,70.90	63.52,73.55	59.48,74.71	59.32,70.74
path	56.16,71.89	50.82,78.41	47.96,82.44	42.53,80.75	43.02,77.16
path	40.39,71.86	37.95,67.63	38.52,68.50	33.94,66.02	34.59,61.64
path	33.70,56.77	33.45,53.94	33.65,50.19	35.00,47.28	32.96,46.68
path	31.68,45.41	32.34,42.64	31.42,41.24	25.23,43.10	20.94,39.12
path	20.02,35.80	19.12,33.36	22.43,31.28	23.48,24.90	26.93,20.65
path	28.65,14.18	28.96,16.96	31.62,18.63	30.96,20.36	33.19,21.23
path	36.35,24.61	39.97,25.62	40.21,28.79	43.97,30.51	45.70,33.02
path	48.08,33.60	49.78,36.76	52.14,36.11	52.75,31.99	54.80,33.13
path	58.19,32.50	58.02,34.22	59.94,35.97	62.25,32.06	64.69,35.58
path	64.49,26.56	66.77,27.64	70.39,27.07	70.47,30.74	72.89,30.09
path	76.73,29.48	76.70,33.68	79.56,35.45
Click ore as you follow the path around this area
|tip Track them on your minimap with "Find Minerals".
|tip You will need level 125 Mining to collect these.
collect 150 Iron Ore##2772 |n
|tip Smelt the ore at a forge.
collect 150 Iron Bar##3575 |or
|tip Create them with Mining or purchase them from the auction house.
'|complete skill("Blacksmithing") >= 190 |or
step
label "Collect_Green_Dye_190"
collect 25 Green Dye##2605 |or
|tip You purchased these in a previous step.
'|complete skill("Blacksmithing") >= 190 |or
step
create 25 Green Iron Bracers##3501,Blacksmithing,190 |goto Orgrimmar/0 82.35,22.98
|tip Stand next to an anvil.
|tip Inside the building.
step
talk Saru Steelfury##3355
|tip Inside the building.
Train Golden Scale Bracers |learn Golden Scale Bracers##7223 |goto Orgrimmar/0 82.35,22.98
stickystart "Collect_Heavy_Grinding_Stone_200"
step
map Arathi Highlands
path follow smart; loop on; ants curved; dist 20
path	78.66,36.13	77.36,41.29	75.00,44.93	72.65,48.07	70.58,55.05
path	69.99,58.40	72.92,59.03	72.28,63.63	72.78,66.86	71.75,66.15
path	69.15,72.54	67.17,70.90	63.52,73.55	59.48,74.71	59.32,70.74
path	56.16,71.89	50.82,78.41	47.96,82.44	42.53,80.75	43.02,77.16
path	40.39,71.86	37.95,67.63	38.52,68.50	33.94,66.02	34.59,61.64
path	33.70,56.77	33.45,53.94	33.65,50.19	35.00,47.28	32.96,46.68
path	31.68,45.41	32.34,42.64	31.42,41.24	25.23,43.10	20.94,39.12
path	20.02,35.80	19.12,33.36	22.43,31.28	23.48,24.90	26.93,20.65
path	28.65,14.18	28.96,16.96	31.62,18.63	30.96,20.36	33.19,21.23
path	36.35,24.61	39.97,25.62	40.21,28.79	43.97,30.51	45.70,33.02
path	48.08,33.60	49.78,36.76	52.14,36.11	52.75,31.99	54.80,33.13
path	58.19,32.50	58.02,34.22	59.94,35.97	62.25,32.06	64.69,35.58
path	64.49,26.56	66.77,27.64	70.39,27.07	70.47,30.74	72.89,30.09
path	76.73,29.48	76.70,33.68	79.56,35.45
Click ore as you follow the path around this area
|tip Track them on your minimap with "Find Minerals".
|tip You will need level 125 Mining to collect these.
collect 50 Iron Ore##2772 |n
|tip Buy 50 Coal from the Trade Supplier near the forge.
|tip Smelt the ore at a forge.
collect 50 Steel Bar##3859 |or
|tip Create them with Mining or purchase them from the auction house.
'|complete skill("Blacksmithing") >= 200 |or
step
label "Collect_Heavy_Grinding_Stone_200"
collect 20 Heavy Grinding Stone##3486 |or
|tip You created these in a previous step.
'|complete skill("Blacksmithing") >= 200 |or
step
create 10 Golden Scale Bracers##7223,Blacksmithing,200 |goto Orgrimmar/0 82.35,22.98
|tip Stand next to an anvil.
|tip Inside the building.
|tip If you intend to choose the Armorsmith specialization, keep 6 of these.
step
talk Saru Steelfury##3355
|tip Inside the building.
Train Solid Grinding Stone |learn Solid Grinding Stone##9920 |goto Orgrimmar/0 82.35,22.98
step
map Badlands
path follow smart; loop on; ants curved; dist 20
path	26.84,74.76	25.28,78.53	19.71,81.32	14.75,83.82	12.50,85.54
path	7.98,80.56	6.30,74.40	8.68,67.97	17.19,68.54	15.13,72.43
path	17.19,77.39	21.25,75.06	25.11,72.08
Click ore as you follow the path around this area
|tip Track them on your minimap with "Find Minerals".
|tip You will need level 175 Mining to collect these.
collect 520 Solid Stone##7912 |or
|tip Farm them with Mining or purchase them from the auction house.
'|complete skill("Blacksmithing") >= 210 |or
step
create 130 Solid Grinding Stone##9920,Blacksmithing,130 total |or
|tip Save these, you will need them later.
'|complete skill("Blacksmithing") >= 210 |or
step
create 1 Solid Grinding Stone##9920,Blacksmithing,210
|tip You may need to make a few more of these.
|tip Each additional Solid Grinding Stone requires four Solid Stone.
|tip Save 130 of these, you will need them later.
step
talk Saru Steelfury##3355
|tip Inside the building.
Train Heavy Mithril Gauntlet |learn Heavy Mithril Gauntlet##9928 |goto Orgrimmar/0 82.35,22.98
stickystart "Collect_Mageweave_Cloth_225"
step
map Badlands
path follow smart; loop on; ants curved; dist 20
path	26.84,74.76	25.28,78.53	19.71,81.32	14.75,83.82	12.50,85.54
path	7.98,80.56	6.30,74.40	8.68,67.97	17.19,68.54	15.13,72.43
path	17.19,77.39	21.25,75.06	25.11,72.08
Click ore as you follow the path around this area
|tip Track them on your minimap with "Find Minerals".
|tip You will need level 175 Mining to collect these.
collect Mithril Ore##3858 |n
|tip Smelt the ore at a forge.
collect 90 Mithril Bar##3860 |or
|tip Farm them with Mining or purchase them from the auction house.
'|complete skill("Blacksmithing") >= 225 |or
step
label "Collect_Mageweave_Cloth_225"
Kill Dunemaul enemies around this area
collect 60 Mageweave Cloth##4338 |or |goto Tanaris/0 40.50,55.50
|tip Farm them from humanoid mobs or purchase them from the auction house.
'|complete skill("Blacksmithing") >= 225 |or
step
create 15 Heavy Mithril Gauntlet##9928,Blacksmithing,225 |goto Orgrimmar/0 82.35,22.98
|tip Stand next to an anvil.
|tip Inside the building.
step
Reach Level 35 |ding 35
|tip You must be at least level 35 to train Artisan professions.
|tip Use the leveling guides to accomplish this.
step
talk Saru Steelfury##3355
|tip Inside the building.
Train Artisan Blacksmithing |skillmax Blacksmithing,300 |goto Orgrimmar/0 82.35,22.98
step
talk Saru Steelfury##3355
|tip Inside the building.
Train Steel Plate Helm |learn Steel Plate Helm##9935 |goto Orgrimmar/0 82.35,22.98
stickystart "Collect_Solid_Grinding_Stone_235"
step
map Arathi Highlands
path follow smart; loop on; ants curved; dist 20
path	78.66,36.13	77.36,41.29	75.00,44.93	72.65,48.07	70.58,55.05
path	69.99,58.40	72.92,59.03	72.28,63.63	72.78,66.86	71.75,66.15
path	69.15,72.54	67.17,70.90	63.52,73.55	59.48,74.71	59.32,70.74
path	56.16,71.89	50.82,78.41	47.96,82.44	42.53,80.75	43.02,77.16
path	40.39,71.86	37.95,67.63	38.52,68.50	33.94,66.02	34.59,61.64
path	33.70,56.77	33.45,53.94	33.65,50.19	35.00,47.28	32.96,46.68
path	31.68,45.41	32.34,42.64	31.42,41.24	25.23,43.10	20.94,39.12
path	20.02,35.80	19.12,33.36	22.43,31.28	23.48,24.90	26.93,20.65
path	28.65,14.18	28.96,16.96	31.62,18.63	30.96,20.36	33.19,21.23
path	36.35,24.61	39.97,25.62	40.21,28.79	43.97,30.51	45.70,33.02
path	48.08,33.60	49.78,36.76	52.14,36.11	52.75,31.99	54.80,33.13
path	58.19,32.50	58.02,34.22	59.94,35.97	62.25,32.06	64.69,35.58
path	64.49,26.56	66.77,27.64	70.39,27.07	70.47,30.74	72.89,30.09
path	76.73,29.48	76.70,33.68	79.56,35.45
Click ore as you follow the path around this area
|tip Track them on your minimap with "Find Minerals".
|tip You will need level 125 Mining to collect these.
collect 140 Iron Ore##2772 |n
|tip Buy 140 Coal from the Trade Supplier near the forge.
|tip Smelt the ore at a forge.
collect 140 Steel Bar##3859 |or
|tip Create them with Mining or purchase them from the auction house.
'|complete skill("Blacksmithing") >= 235 |or
step
label "Collect_Solid_Grinding_Stone_235"
collect 10 Solid Grinding Stone##7966 |or
|tip You created these in a previous step.
'|complete skill("Blacksmithing") >= 235 |or
step
create 10 Steel Plate Helm##9935,Blacksmithing,235 |goto Orgrimmar/0 82.35,22.98
|tip Stand next to an anvil.
|tip Inside the building.
|tip If you intend to choose the Armorsmith specialization, keep 4 of these.
step
collect Plans: Mithril Spurs##7989 |or
|tip Purchase this from the auction house.
|tip You can also make 15 Mithril Coifs.
|tip This will require more materials at 150 Mithril Bars and 90 Mageweave Cloth.
'|complete skill("Blacksmithing") >= 255 |or
step
use the Plans: Mithril Spurs##7989
Learn Mithril Spurs |learn Mithril Spurs##9964
|tip You can also make 15 Mithril Coifs.
|tip This will require more materials at 150 Mithril Bars and 90 Mageweave Cloth.
stickystart "Collect_Solid_Grinding_Stone_250"
step
map Badlands
path follow smart; loop on; ants curved; dist 20
path	26.84,74.76	25.28,78.53	19.71,81.32	14.75,83.82	12.50,85.54
path	7.98,80.56	6.30,74.40	8.68,67.97	17.19,68.54	15.13,72.43
path	17.19,77.39	21.25,75.06	25.11,72.08
Click ore as you follow the path around this area
|tip Track them on your minimap with "Find Minerals".
|tip You will need level 175 Mining to collect these.
collect 80 Mithril Ore##3858 |n
|tip Smelt the ore at a forge.
collect 80 Mithril Bar##3860 |or
|tip Create them with Mining or purchase them from the auction house.
|tip You can also make 15 Mithril Coifs.
|tip This will require more materials at 150 Mithril Bars and 90 Mageweave Cloth.
'|complete skill("Blacksmithing") >= 250 |or
step
label "Collect_Solid_Grinding_Stone_250"
collect 60 Solid Grinding Stone##7966 |or
|tip You created these in a previous step.
|tip You do not need these if you make Mithril Coifs instead.
'|complete skill("Blacksmithing") >= 250 |or
step
create 20 Mithril Spurs##9964,Blacksmithing,250 |goto Orgrimmar/0 82.35,22.98
|tip Stand next to an anvil.
|tip You may need to create more or less of these.
|tip Each addtional Mithril Spur requires four Mithril Bars and three Solid Grinding Stones.
|tip Solid Grinding Stones require four Solid Stone.
|tip You can also make 15 Mithril Coifs.
|tip This will require more materials at 150 Mithril Bars and 90 Mageweave Cloth.
step
talk Saru Steelfury##3355
|tip Inside the building.
Train Dense Sharpening Stone |learn Dense Sharpening Stone##16641 |goto Orgrimmar/0 82.35,22.98
step
map Un'Goro Crater
path follow smart; loop on; ants curved; dist 20
path	66.46,78.95	64.56,79.71	61.79,84.21	59.34,84.18	57.63,86.04
path	54.50,86.69	51.13,86.82	48.27,87.30	45.98,86.58	42.89,85.00
path	40.79,83.52	37.91,83.14	36.77,80.17	33.58,79.05	30.40,79.61
path	28.89,76.98	28.97,71.52	26.00,67.67	25.93,63.53	24.59,58.51
path	23.95,53.04	24.40,48.21	23.89,44.76	24.71,41.12	26.26,36.59
path	26.62,31.21	28.29,29.47	29.59,25.66	29.89,20.92	33.32,20.67
path	36.29,20.47	38.67,16.00	41.73,15.77	43.32,14.12	46.94,13.03
path	49.79,13.83	52.84,12.88	56.31,14.04	59.61,16.58	62.25,16.02
path	64.19,19.90	65.99,21.01	68.51,20.26	71.19,20.89	71.21,23.75
path	71.75,28.19	74.76,32.46	75.06,37.15	76.32,43.15	76.67,48.32
path	77.05,53.09	76.56,57.02	75.35,61.97	74.66,68.05	72.92,70.46
path	71.39,73.80	71.00,79.21	68.32,79.90
Click ore as you follow the path around this area
|tip Track them on your minimap with "Find Minerals".
|tip You will need level 245 Mining to collect these.
collect 20 Dense Stone##12365 |or
|tip Farm them with Mining or purchase them from the auction house.
'|complete skill("Blacksmithing") >= 260 |or
step
create 20 Dense Sharpening Stone##16641,Blacksmithing,260
|tip You may need to create more or less of these.
|tip Each addtional Dense Sharpening Stone requires one Dense Stone.
stickystart "Collect_Solid_Grinding_Stone_270"
step
map Badlands
path follow smart; loop on; ants curved; dist 20
path	26.84,74.76	25.28,78.53	19.71,81.32	14.75,83.82	12.50,85.54
path	7.98,80.56	6.30,74.40	8.68,67.97	17.19,68.54	15.13,72.43
path	17.19,77.39	21.25,75.06	25.11,72.08
Click ore as you follow the path around this area
|tip Track them on your minimap with "Find Minerals".
|tip You will need level 175 Mining to collect these.
collect 80 Mithril Ore##3858 |n
|tip Smelt the ore at a forge.
collect 80 Mithril Bar##3860 |or
|tip Create them with Mining or purchase them from the auction house.
'|complete skill("Blacksmithing") >= 270 |or
step
label "Collect_Solid_Grinding_Stone_270"
collect 60 Solid Grinding Stone##7966 |or
|tip You created these in a previous step.
'|complete skill("Blacksmithing") >= 270 |or
step
create 20 Mithril Spurs##9964,Blacksmithing,270 |goto Orgrimmar/0 82.35,22.98
|tip Stand next to an anvil.
|tip You may need to create more or less of these.
|tip Each addtional Mithril Spur requires four Mithril Bars and three Solid Grinding Stones.
|tip Solid Grinding Stones require four Solid Stone.
step
Reach Level 50 |ding 50
|tip You must be at least this level before you can accept the next quests.
|tip Use the leveling guides to accomplish this.
step
map Un'Goro Crater
path follow smart; loop on; ants curved; dist 20
path	66.46,78.95	64.56,79.71	61.79,84.21	59.34,84.18	57.63,86.04
path	54.50,86.69	51.13,86.82	48.27,87.30	45.98,86.58	42.89,85.00
path	40.79,83.52	37.91,83.14	36.77,80.17	33.58,79.05	30.40,79.61
path	28.89,76.98	28.97,71.52	26.00,67.67	25.93,63.53	24.59,58.51
path	23.95,53.04	24.40,48.21	23.89,44.76	24.71,41.12	26.26,36.59
path	26.62,31.21	28.29,29.47	29.59,25.66	29.89,20.92	33.32,20.67
path	36.29,20.47	38.67,16.00	41.73,15.77	43.32,14.12	46.94,13.03
path	49.79,13.83	52.84,12.88	56.31,14.04	59.61,16.58	62.25,16.02
path	64.19,19.90	65.99,21.01	68.51,20.26	71.19,20.89	71.21,23.75
path	71.75,28.19	74.76,32.46	75.06,37.15	76.32,43.15	76.67,48.32
path	77.05,53.09	76.56,57.02	75.35,61.97	74.66,68.05	72.92,70.46
path	71.39,73.80	71.00,79.21	68.32,79.90
Click ore as you follow the path around this area
|tip Track them on your minimap with "Find Minerals".
|tip You will need level 245 Mining to collect these.
collect 322 Thorium Ore##10620 |n
|tip Smelt the ore at a forge.
collect 322 Thorium Bar##12359 |or
|tip Create them with Mining or purchase them from the auction house.
|tip You will need 10 for a quest, and at least 312 for the the next recipe.
'|complete skill("Blacksmithing") >= 295 |or
step
talk Derotain Mudsipper##14567
accept A Blue Light Bargain##7652 |goto Tanaris/0 51.38,28.67
step
talk Derotain Mudsipper##14567
accept Imperial Plate Bracer##7655 |goto 51.38,28.67
step
collect 10 Thorium Bar##12359 |q 7655/1
|tip You collected these in a previous step.
step
talk Derotain Mudsipper##14567
turnin Imperial Plate Bracer##7655 |goto 51.38,28.67
step
use the Plans: Imperial Plate Bracers##12690
Learn Imperial Plate Bracers |learn Imperial Plate Bracers##16649
step
collect 312 Thorium Bar##12359 |or
|tip You collected these in a previous step.
'|complete skill("Blacksmithing") >= 295 |or
step
create 26 Imperial Plate Bracers##16649,Blacksmithing,295 |goto 51.39,28.71
|tip Stand next to an anvil.
|tip You may need to create more or less of these.
|tip Each additional Imperial Plate Bracer requires twelve Thorium Bars.
step
map Un'Goro Crater
path follow smart; loop on; ants curved; dist 20
path	66.46,78.95	64.56,79.71	61.79,84.21	59.34,84.18	57.63,86.04
path	54.50,86.69	51.13,86.82	48.27,87.30	45.98,86.58	42.89,85.00
path	40.79,83.52	37.91,83.14	36.77,80.17	33.58,79.05	30.40,79.61
path	28.89,76.98	28.97,71.52	26.00,67.67	25.93,63.53	24.59,58.51
path	23.95,53.04	24.40,48.21	23.89,44.76	24.71,41.12	26.26,36.59
path	26.62,31.21	28.29,29.47	29.59,25.66	29.89,20.92	33.32,20.67
path	36.29,20.47	38.67,16.00	41.73,15.77	43.32,14.12	46.94,13.03
path	49.79,13.83	52.84,12.88	56.31,14.04	59.61,16.58	62.25,16.02
path	64.19,19.90	65.99,21.01	68.51,20.26	71.19,20.89	71.21,23.75
path	71.75,28.19	74.76,32.46	75.06,37.15	76.32,43.15	76.67,48.32
path	77.05,53.09	76.56,57.02	75.35,61.97	74.66,68.05	72.92,70.46
path	71.39,73.80	71.00,79.21	68.32,79.90
Click ore as you follow the path around this area
|tip Track them on your minimap with "Find Minerals".
|tip You will need level 245 Mining to collect these.
collect 140 Thorium Ore##10620 |n
|tip Smelt the ore at a forge.
collect 140 Thorium Bar##12359 |or
|tip Create them with Mining or purchase them from the auction house.
|tip You will need 50 for quests, and at least 90 for the the next recipe.
'|complete skill("Blacksmithing") >= 300 |or
step
talk Derotain Mudsipper##14567
accept Imperial Plate Boots##7654 |goto Tanaris/0 51.38,28.67
accept Imperial Plate Chest##7656 |goto 51.38,28.67
stickystart "Collect_Thorium_Bar_7656"
step
collect 20 Thorium Bar##12359 |q 7654/1
|tip You collected these in a previous step.
step
label "Collect_Thorium_Bar_7656"
collect 30 Thorium Bar##12359 |q 7656/1
|tip You collected these in a previous step.
step
talk Derotain Mudsipper##14567
turnin Imperial Plate Boots##7654 |goto 51.38,28.67
turnin Imperial Plate Chest##7656 |goto 51.38,28.67
step
use the Plans: Imperial Plate Boots##12700
Learn Imperial Plate Boots |learn Imperial Plate Boots##16657
step
map Un'Goro Crater
path follow smart; loop on; ants curved; dist 20
path	66.46,78.95	64.56,79.71	61.79,84.21	59.34,84.18	57.63,86.04
path	54.50,86.69	51.13,86.82	48.27,87.30	45.98,86.58	42.89,85.00
path	40.79,83.52	37.91,83.14	36.77,80.17	33.58,79.05	30.40,79.61
path	28.89,76.98	28.97,71.52	26.00,67.67	25.93,63.53	24.59,58.51
path	23.95,53.04	24.40,48.21	23.89,44.76	24.71,41.12	26.26,36.59
path	26.62,31.21	28.29,29.47	29.59,25.66	29.89,20.92	33.32,20.67
path	36.29,20.47	38.67,16.00	41.73,15.77	43.32,14.12	46.94,13.03
path	49.79,13.83	52.84,12.88	56.31,14.04	59.61,16.58	62.25,16.02
path	64.19,19.90	65.99,21.01	68.51,20.26	71.19,20.89	71.21,23.75
path	71.75,28.19	74.76,32.46	75.06,37.15	76.32,43.15	76.67,48.32
path	77.05,53.09	76.56,57.02	75.35,61.97	74.66,68.05	72.92,70.46
path	71.39,73.80	71.00,79.21	68.32,79.90
Click ore as you follow the path around this area
|tip Track them on your minimap with "Find Minerals".
|tip You will need level 245 Mining to collect these.
collect 90 Thorium Ore##10620 |n
|tip Smelt the ore at a forge.
collect 90 Thorium Bar##12359 |or
|tip You collected these in a previous step.
'|complete skill("Blacksmithing") >= 300 |or
step
create 5 Imperial Plate Boots##16657,Blacksmithing,300 |goto 51.39,28.71
|tip Stand next to an anvil.
|tip You may need to create more or less of these.
|tip Each additional Imperial Plate Boots requires eighteen Thorium Bars.
step
use the Plans: Imperial Plate Chest##12705
Learn Imperial Plate Chest |learn Imperial Plate Chest##16663
step
Reach Level 50 |ding 50
|tip You must be at least level 50 to train Master professions.
|tip Use the leveling guides to accomplish this.
step
talk Rohok##16583
Train Master Blacksmithing |skillmax Blacksmithing,375 |goto Hellfire Peninsula/0 53.13,38.15
step
talk Rohok##16583
Train Fel Weightstone |learn Fel Weightstone##34607 |goto 53.13,38.15
step
Click Here to Start with Thorium Bars |confirm |or
|tip You will need 588 Thorium Bars.
_Or_
Click Here to Start with Fel Iron Bars |confirm |next "Start_with_Fel_Iron_Bars" |or
|tip You will need 100 extra Fel Iron Bars.
'|complete skill("Blacksmithing") >= 316 |next "Start_with_Fel_Iron_Bars" |or
step
map Un'Goro Crater
path follow smart; loop on; ants curved; dist 20
path	66.46,78.95	64.56,79.71	61.79,84.21	59.34,84.18	57.63,86.04
path	54.50,86.69	51.13,86.82	48.27,87.30	45.98,86.58	42.89,85.00
path	40.79,83.52	37.91,83.14	36.77,80.17	33.58,79.05	30.40,79.61
path	28.89,76.98	28.97,71.52	26.00,67.67	25.93,63.53	24.59,58.51
path	23.95,53.04	24.40,48.21	23.89,44.76	24.71,41.12	26.26,36.59
path	26.62,31.21	28.29,29.47	29.59,25.66	29.89,20.92	33.32,20.67
path	36.29,20.47	38.67,16.00	41.73,15.77	43.32,14.12	46.94,13.03
path	49.79,13.83	52.84,12.88	56.31,14.04	59.61,16.58	62.25,16.02
path	64.19,19.90	65.99,21.01	68.51,20.26	71.19,20.89	71.21,23.75
path	71.75,28.19	74.76,32.46	75.06,37.15	76.32,43.15	76.67,48.32
path	77.05,53.09	76.56,57.02	75.35,61.97	74.66,68.05	72.92,70.46
path	71.39,73.80	71.00,79.21	68.32,79.90
Click ore as you follow the path around this area
|tip Track them on your minimap with "Find Minerals".
|tip You will need level 245 Mining to collect these.
collect 588 Thorium Ore##10620 |n
|tip Smelt the ore at a forge.
collect 588 Thorium Bar##12359 |or
|tip Create them with Mining or purchase them from the auction house.
'|complete skill("Blacksmithing") >= 325 |or
step
create 16 Imperial Plate Boots##16657,Blacksmithing,316 |goto Hellfire Peninsula/0 53.07,38.05
|tip Stand next to an anvil.
step
create 15 Imperial Plate Chest##16663,Blacksmithing,325 |goto 53.07,38.05
|tip Stand next to an anvil.
|tip You may need to create more or less of these.
|tip Each additional Imperial Plate Chest requires twenty Thorium Bars.
stickystart "Collect_Netherweave_Cloth_305"
step
label "Start_with_Fel_Iron_Bars"
map Hellfire Peninsula/0
path	65.97,48.02	69.02,46.87	70.80,50.94	70.25,54.41	70.27,59.32
path	72.23,60.13	74.08,63.37	76.97,62.92	78.97,66.32	78.85,70.21
path	79.70,74.48	80.75,77.99	77.91,75.80	77.13,73.33	76.82,69.54
path	75.53,67.17	71.66,67.33	69.41,67.29	68.38,60.74	65.36,60.83
path	65.69,64.45	63.25,69.06	62.72,72.99	62.49,79.96	58.89,76.64
path	57.05,73.97	57.06,81.30	56.40,82.14	55.54,83.79	52.24,83.83
path	49.82,83.52	46.85,84.82	42.98,79.36	42.26,76.62	44.54,73.42
path	47.44,71.34	50.85,69.85	47.41,66.63	44.75,68.48	45.62,61.55
path	47.89,59.49	49.89,56.45	49.95,61.42	51.38,61.68	52.93,58.38
path	55.41,56.25	56.22,53.50	58.62,52.98	62.69,50.44
click Fel Iron Deposit##181555+
|tip They look like green mineral clusters around this path.
|tip Enter caves along the path.
|tip Make sure you enable "Find Minerals" in the tracking menu on the minimap.
collect 14 Fel Iron Ore##23424 |n
|tip Smelt the ore at a forge.
collect 7 Fel Iron Bar##23445 |or
|tip Create them with Mining or purchase them from the auction house.
'|complete skill("Blacksmithing") >= 305 |or
step
label "Collect_Netherweave_Cloth_305"
map Shadowmoon Valley/0
path follow smart; loop on; ants curved; dist 20
path	51.1,58.8	53.0,59.3	53.2,60.5	52.8,63.2	52.8,65.4
path	52.9,69.0	52.5,71.8	47.3,71.1	45.8,71.3	45.2,69.2
path	45.6,66.1	48.0,67.2
Kill enemies around this area
collect 7 Netherweave Cloth##21877 |or
|tip Farm them from humanoid mobs in Outland or purchase them from the auction house.
'|complete skill("Blacksmithing") >= 305 |or
step
create 7 Fel Weightstone##34607,Blacksmithing,305 |goto Hellfire Peninsula/0 53.07,38.05
|tip Stand next to an anvil.
|tip You may need to create more or less of these.
|tip Each additional Fel Weightstone requires one Fel Iron Bar and one Netherweave Cloth.
step
talk Rohok##16583
Train Fel Iron Plate Belt |learn Fel Iron Plate Belt##29547 |goto 53.13,38.15
step
map Hellfire Peninsula/0
path	65.97,48.02	69.02,46.87	70.80,50.94	70.25,54.41	70.27,59.32
path	72.23,60.13	74.08,63.37	76.97,62.92	78.97,66.32	78.85,70.21
path	79.70,74.48	80.75,77.99	77.91,75.80	77.13,73.33	76.82,69.54
path	75.53,67.17	71.66,67.33	69.41,67.29	68.38,60.74	65.36,60.83
path	65.69,64.45	63.25,69.06	62.72,72.99	62.49,79.96	58.89,76.64
path	57.05,73.97	57.06,81.30	56.40,82.14	55.54,83.79	52.24,83.83
path	49.82,83.52	46.85,84.82	42.98,79.36	42.26,76.62	44.54,73.42
path	47.44,71.34	50.85,69.85	47.41,66.63	44.75,68.48	45.62,61.55
path	47.89,59.49	49.89,56.45	49.95,61.42	51.38,61.68	52.93,58.38
path	55.41,56.25	56.22,53.50	58.62,52.98	62.69,50.44
click Fel Iron Deposit##181555+
|tip They look like green mineral clusters around this path.
|tip Enter caves along the path.
|tip Make sure you enable "Find Minerals" in the tracking menu on the minimap.
collect 88 Fel Iron Ore##23424 |n
|tip Smelt the ore at the forge.
collect 44 Fel Iron Bar##23445 |or
|tip Create them with Mining or purchase them from the auction house.
'|complete skill("Blacksmithing") >= 316 |or
step
create 11 Fel Iron Plate Belt##29547,Blacksmithing,316 |goto 53.07,38.05
|tip Stand next to an anvil.
step
talk Rohok##16583
Train Fel Iron Chain Gloves |learn Fel Iron Chain Gloves##29552 |goto 53.13,38.15
step
map Hellfire Peninsula/0
path	65.97,48.02	69.02,46.87	70.80,50.94	70.25,54.41	70.27,59.32
path	72.23,60.13	74.08,63.37	76.97,62.92	78.97,66.32	78.85,70.21
path	79.70,74.48	80.75,77.99	77.91,75.80	77.13,73.33	76.82,69.54
path	75.53,67.17	71.66,67.33	69.41,67.29	68.38,60.74	65.36,60.83
path	65.69,64.45	63.25,69.06	62.72,72.99	62.49,79.96	58.89,76.64
path	57.05,73.97	57.06,81.30	56.40,82.14	55.54,83.79	52.24,83.83
path	49.82,83.52	46.85,84.82	42.98,79.36	42.26,76.62	44.54,73.42
path	47.44,71.34	50.85,69.85	47.41,66.63	44.75,68.48	45.62,61.55
path	47.89,59.49	49.89,56.45	49.95,61.42	51.38,61.68	52.93,58.38
path	55.41,56.25	56.22,53.50	58.62,52.98	62.69,50.44
click Fel Iron Deposit##181555+
|tip They look like green mineral clusters around this path.
|tip Enter caves along the path.
|tip Make sure you enable "Find Minerals" in the tracking menu on the minimap.
collect 50 Fel Iron Ore##23424 |n
|tip Smelt the ore at a forge.
collect 25 Fel Iron Bar##23445 |or
|tip Create them with Mining or purchase them from the auction house.
'|complete skill("Blacksmithing") >= 321 |or
step
create 5 Fel Iron Chain Gloves##29552,Blacksmithing,321 |goto 53.07,38.05
|tip Stand next to an anvil.
step
talk Rohok##16583
Train Fel Iron Plate Boots |learn Fel Iron Plate Boots##29548 |goto 53.13,38.15
step
map Hellfire Peninsula/0
path	65.97,48.02	69.02,46.87	70.80,50.94	70.25,54.41	70.27,59.32
path	72.23,60.13	74.08,63.37	76.97,62.92	78.97,66.32	78.85,70.21
path	79.70,74.48	80.75,77.99	77.91,75.80	77.13,73.33	76.82,69.54
path	75.53,67.17	71.66,67.33	69.41,67.29	68.38,60.74	65.36,60.83
path	65.69,64.45	63.25,69.06	62.72,72.99	62.49,79.96	58.89,76.64
path	57.05,73.97	57.06,81.30	56.40,82.14	55.54,83.79	52.24,83.83
path	49.82,83.52	46.85,84.82	42.98,79.36	42.26,76.62	44.54,73.42
path	47.44,71.34	50.85,69.85	47.41,66.63	44.75,68.48	45.62,61.55
path	47.89,59.49	49.89,56.45	49.95,61.42	51.38,61.68	52.93,58.38
path	55.41,56.25	56.22,53.50	58.62,52.98	62.69,50.44
click Fel Iron Deposit##181555+
|tip They look like green mineral clusters around this path.
|tip Enter caves along the path.
|tip Make sure you enable "Find Minerals" in the tracking menu on the minimap.
collect 48 Fel Iron Ore##23424 |n
|tip Smelt the ore at a forge.
collect 24 Fel Iron Bar##23445 |or
|tip Create them with Mining or purchase them from the auction house.
'|complete skill("Blacksmithing") >= 325 |or
step
create 5 Fel Iron Plate Boots##29548,Blacksmithing,325 |goto 53.07,38.05
|tip Stand next to an anvil.
step
talk Rohok##16583
Train Lesser Rune of Warding |learn Lesser Rune of Warding##32284 |goto 53.13,38.15
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
collect 50 Adamantite Ore##23425 |n
|tip Smelt the ore at a forge.
collect 25 Adamantite Bar##23446 |or
|tip Create them with Mining or purchase them from the auction house.
'|complete skill("Blacksmithing") >= 335 |or
step
create 25 Lesser Rune of Warding##32284,Blacksmithing,335
|tip You may need to create more or less of these.
|tip Each additional Rune of Warding requires one Adamantite Bar.
step
talk Rohok##16583
Train Fel Iron Chain Tunic |learn Fel Iron Chain Tunic##29556 |goto Hellfire Peninsula/0 53.13,38.15
step
map Hellfire Peninsula/0
path	65.97,48.02	69.02,46.87	70.80,50.94	70.25,54.41	70.27,59.32
path	72.23,60.13	74.08,63.37	76.97,62.92	78.97,66.32	78.85,70.21
path	79.70,74.48	80.75,77.99	77.91,75.80	77.13,73.33	76.82,69.54
path	75.53,67.17	71.66,67.33	69.41,67.29	68.38,60.74	65.36,60.83
path	65.69,64.45	63.25,69.06	62.72,72.99	62.49,79.96	58.89,76.64
path	57.05,73.97	57.06,81.30	56.40,82.14	55.54,83.79	52.24,83.83
path	49.82,83.52	46.85,84.82	42.98,79.36	42.26,76.62	44.54,73.42
path	47.44,71.34	50.85,69.85	47.41,66.63	44.75,68.48	45.62,61.55
path	47.89,59.49	49.89,56.45	49.95,61.42	51.38,61.68	52.93,58.38
path	55.41,56.25	56.22,53.50	58.62,52.98	62.69,50.44
click Fel Iron Deposit##181555+
|tip They look like green mineral clusters around this path.
|tip Enter caves along the path.
|tip Make sure you enable "Find Minerals" in the tracking menu on the minimap.
collect 126 Fel Iron Ore##23424 |n
|tip Smelt the ore at a forge.
collect 63 Fel Iron Bar##23445 |or
|tip Farm them with Mining or purchase them from the auction house.
'|complete skill("Blacksmithing") >= 340 |or
step
create 7 Fel Iron Chain Tunic##29556,Blacksmithing,340 |goto 53.07,38.05
|tip Stand next to an anvil.
|tip You may need to create more or less of these.
|tip Each additional Fel Iron Chain Tunic requires nine Fel Iron Bars.
step
talk Rohok##16583
buy 1 Plans: Lesser Ward of Shielding##23638 |goto 53.13,38.15 |or
|tip This is a limited supply item that can also be purchased from the auction house.
|tip If it is sold out it should restock in about 15-60 minutes.
'|complete skill("Blacksmithing") >= 350 |or
step
use the Plans: Lesser Ward of Shielding##23638
Learn Lesser Ward of Shielding |learn Lesser Ward of Shielding##29728
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
collect 50 Adamantite Ore##23425 |n
|tip Smelt the ore at a forge.
collect 25 Adamantite Bar##23446 |or
|tip Farm them with Mining or purchase them from the auction house.
'|complete skill("Blacksmithing") >= 350 |or
step
create 25 Lesser Ward of Shielding##29728,Blacksmithing,350 |goto Hellfire Peninsula/0 53.07,38.05
|tip Stand next to an anvil.
|tip You may need to create more or less of these.
|tip Each additional Lesser Ward of Shielding requires one Adamantite Bar.
step
talk Fedryen Swiftspear##17904
buy 1 Plans: Adamantite Weightstone##28632 |goto Zangarmarsh/0 79.26,63.68 |or
'|complete skill("Blacksmithing") >= 360 |or
step
use the Plans: Adamantite Weightstone##28632
Learn Adamantite Weightstone |learn Adamantite Weightstone##34608
stickystart "Collect_Netherweave_Cloth_360"
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
collect 50 Adamantite Ore##23425 |n
|tip Smelt the ore at a forge.
collect 25 Adamantite Bar##23446 |or
|tip Farm them with Mining or purchase them from the auction house.
'|complete skill("Blacksmithing") >= 360 |or
step
label "Collect_Netherweave_Cloth_360"
map Shadowmoon Valley/0
path follow smart; loop on; ants curved; dist 20
path	51.1,58.8	53.0,59.3	53.2,60.5	52.8,63.2	52.8,65.4
path	52.9,69.0	52.5,71.8	47.3,71.1	45.8,71.3	45.2,69.2
path	45.6,66.1	48.0,67.2
Kill enemies around this area
collect 50 Netherweave Cloth##21877 |or
|tip Farm them from humanoid mobs in Outland or purchase them from the auction house.
'|complete skill("Blacksmithing") >= 360 |or
step
create 25 Adamantite Weightstone##34608,Blacksmithing,360 |goto Hellfire Peninsula/0 53.07,38.05
|tip Stand next to an anvil.
|tip You may need to create more or less of these.
|tip Each additional Adamantite Weightstone requires one Adamantite Bar and two Netherweave Cloth.
step
How would you like to finish?
Click Here to Finish with a Dungeon Recipe |confirm |next "Level_with_Felsteel_Gloves" |or
|tip This requires farming "Plans: Felsteel Gloves" from Auchenai Monks in Auchenai Crypts.
|tip This has a respectable drop rate and shouldn't be too difficult to acquire.
|tip This recipe requires approximately 102 Felsteel Bars to reach 375.
_Or_
Click Here to Finish with Aldor or Scryers Reputation |confirm |or
|tip Scryers is usually considered to be cheaper, but it varies from server to server.
|tip Honored reputation is required for Aldor, while Friendly is required for Scryers.
|tip Scryers requires approximately 34 Hardened Adamantite Bars, 136 Arcane Dust, and 34 Prismatic Shards.
|tip Aldor requires approximately 136 Fel Iron Bars, 68 Primal Water, and 68 Primal Fire.
'|complete skill("Blacksmithing") >= 375 |next "Level_with_Felsteel_Gloves" |or
step
talk Haggard War Veteran##19684
accept A'dal##10210 |goto Shattrath City/0 59.67,41.44 |or
'|complete skill("Blacksmithing") >= 375 |or
step
talk A'dal##18481
|tip Inside the building.
turnin A'dal##10210 |goto 53.98,44.71 |or
'|complete skill("Blacksmithing") >= 375 |or
step
talk Archmage Khadgar##18166
|tip Inside the building.
accept City of Light##10211 |goto 54.73,44.32 |or
'|complete skill("Blacksmithing") >= 375 |or
step
Watch the dialogue
|tip Follow Khadgar's Servant as he walks.
|tip Stay very close to it or you will fail the quest.
|tip He eventually walks to this location.
|tip This escort quest takes 8-10 minutes.
Tour the City of Light |q 10211/1 |goto 50.36,42.98 |or
'|complete skill("Blacksmithing") >= 375 |or
step
talk Archmage Khadgar##18166
|tip Inside the building.
turnin City of Light##10211 |goto 54.73,44.32 |or
'|complete skill("Blacksmithing") >= 375 |or
step
talk Archmage Khadgar##18166
Pledge Allegiance to the Aldor |complete rep ("The Aldor") >= Neutral |next "Aldor_Allegiance" |goto 54.76,44.32 |or
|tip Accept the "Allegiance to the Aldor" quest.
|tip You will become aligned with the Aldor faction by completing this quest.
_Or_
Pledge Allegiance to the Scryers |condition rep ("The Scryers") >= Neutral |next "Scryers_Allegiance" |goto 54.76,44.32 |or
|tip Accept the "Allegiance to the Scryers" quest.
|tip You will become aligned with the Scryers faction by completing this quest.
'|complete skill("Blacksmithing") >= 375 |next "Level_with_Felsteel_Gloves" |or
stickystart "Collect_Aldor_Reputation_Items"
stickystart "Reach_Honored_With_Aldor"
step
label "Aldor_Allegiance"
talk Adyen the Lightwarden##18537
accept Single Mark of Sargeras##10655 |goto 30.75,34.61 |only if itemcount(30809) < 10
accept Marks of Sargeras##10653 |goto 30.75,34.61 |only if itemcount(30809) >= 10 and not completedq(10653)
accept More Marks of Sargeras##10654 |goto 30.75,34.61 |repeatable |only if completedq(10653)
|tip
Click Here to Turn in Fel Armaments |confirm |or
'|complete rep('The Aldor') >= Honored or skill("Blacksmithing") >= 375 |or
|only if rep ("The Aldor") >= Neutral
step
talk Ishanah##18538
|tip Inside the building.
accept Fel Armaments##10421 |goto 23.96,29.72 |repeatable
|tip
Click Here to Turn in Marks of Sargeras |confirm |next "Aldor_Allegiance" |or
'|complete rep('The Aldor') >= Honored or skill("Blacksmithing") >= 375 |or
|only if rep ("The Aldor") >= Neutral
step
label "Collect_Aldor_Reputation_Items"
collect Mark of Sargeras##30809 |n
|tip Farm these from demon enemies in Outland zones and dungeons.
|tip Death's Door in Blade's Edge Mountains is a good farming spot.
|tip Ten are required to exchange for 250 Aldor reputation.
collect Fel Armament##29740 |n
|tip Farm these from demon enemies in Outland zones and dungeons.
|tip Legion Hold in Shadowmoon Valley and the Shadow Labyrinth dungeon are good farming spots.
|tip Ten are required to exchange for 350 Aldor reputation.
'|complete rep("The Aldor") >= Honored or skill("Blacksmithing") >= 375
|only if rep ("The Aldor") >= Neutral
step
label "Reach_Honored_With_Aldor"
Reach Honored Reputation with The Aldor |complete rep("The Aldor") >= Honored or skill("Blacksmithing") >= 375 |goto 30.75,34.61
|only if rep ("The Aldor") >= Neutral
step
Enter the building |goto 49.37,30.74 < 10 |walk
talk Quartermaster Endarin##19321
|tip Inside the building.
buy 1 Plans: Flamebane Gloves##23603 |goto 47.69,25.72 |or
'|complete skill("Blacksmithing") >= 375 |or
|only if rep ("The Aldor") >= Neutral
step
use the Plans: Flamebane Gloves##23603
Learn Flamebane Gloves |learn Flamebane Gloves##29616 |or
'|complete skill("Blacksmithing") >= 375 |or
|only if rep ("The Aldor") >= Neutral
stickystart "Collect_Primal_Water_375"
stickystart "Collect_Primal_Fire_375"
step
map Hellfire Peninsula/0
path	65.97,48.02	69.02,46.87	70.80,50.94	70.25,54.41	70.27,59.32
path	72.23,60.13	74.08,63.37	76.97,62.92	78.97,66.32	78.85,70.21
path	79.70,74.48	80.75,77.99	77.91,75.80	77.13,73.33	76.82,69.54
path	75.53,67.17	71.66,67.33	69.41,67.29	68.38,60.74	65.36,60.83
path	65.69,64.45	63.25,69.06	62.72,72.99	62.49,79.96	58.89,76.64
path	57.05,73.97	57.06,81.30	56.40,82.14	55.54,83.79	52.24,83.83
path	49.82,83.52	46.85,84.82	42.98,79.36	42.26,76.62	44.54,73.42
path	47.44,71.34	50.85,69.85	47.41,66.63	44.75,68.48	45.62,61.55
path	47.89,59.49	49.89,56.45	49.95,61.42	51.38,61.68	52.93,58.38
path	55.41,56.25	56.22,53.50	58.62,52.98	62.69,50.44
click Fel Iron Deposit##181555+
|tip They look like green mineral clusters around this path.
|tip Enter caves along the path.
|tip Make sure you enable "Find Minerals" in the tracking menu on the minimap.
collect 272 Fel Iron Ore##23424 |n
|tip Smelt the ore at a forge.
collect 136 Fel Iron Bar##23445 |or
|tip Create them with Mining or purchase them from the auction house.
'|complete skill("Blacksmithing") >= 375 |or
|only if rep ("The Aldor") >= Neutral
step
label "Collect_Primal_Water_375"
map Nagrand/0
path	loop on; dist 25
path	64.09,18.97	62.65,16.17	60.84,15.07	59.37,14.55
kill Crashing Wave-Spirit##22309+
use the Mote of Water##22578
|tip Combine 10 Motes of Water into 1 Primal Water.
|tip If you have fishing, you can also gather them from the "Pure Water" pools that spawn around here.
collect 68 Primal Water##21885 |or
|tip Farm them with Mining, from Outland water elementals, or purchase them from the auction house.
'|complete skill("Blacksmithing") >= 375 |or
|only if rep ("The Aldor") >= Neutral
step
label "Collect_Primal_Fire_375"
map Shadowmoon Valley/0
path	loop off; ants curved; dist 25
path	44.47,46.46	46.81,48.88	48.83,51.69	51.70,52.00
kill Enraged Fire Spirit##21061+
use the Mote of Fire##22574
|tip Combine 10 Motes of Fire into 1 Primal Fire.
collect 68 Primal Fire##21884 |or
|tip Farm them with Mining, from Outland fire elementals, or purchase them from the auction house.
'|complete skill("Blacksmithing") >= 375 |or
'|goto 51.70,52.00 |noway |c |or
|only if rep ("The Aldor") >= Neutral
step
kill Enraged Fire Spirit##21061
map Shadowmoon Valley/0
path	loop off; ants curved; dist 25
path	48.34,46.75	47.93,42.37	49.03,37.97	51.34,36.12	49.04,34.47
kill Enraged Fire Spirit##21061+
use the Mote of Fire##22574
|tip Combine 10 Motes of Fire into 1 Primal Fire.
collect 68 Primal Fire##21884 |or
|tip Farm them with Mining, from Outland fire elementals, or purchase them from the auction house.
'|complete skill("Blacksmithing") >= 375 |or
'|goto 49.04,34.47 |noway |c |next "Collect_Primal_Fire_375" |or
|only if rep ("The Aldor") >= Neutral
stickystart "Collect_Scryers_Reputation_Items"
stickystart "Reach_Friendly_With_Scryers"
step
label "Scryers_Allegiance"
talk Magistrix Fyalenn##18531
accept Single Sunfury Signet##10659 |goto Shattrath City/0 45.19,81.45 |only if itemcount(30810) < 10
accept Sunfury Signets##10656 |goto 45.19,81.45 |only if itemcount(30810) >= 10 and not completedq(10656)
accept More Sunfury Signets##10658 |goto 45.19,81.45 |repeatable |only if completedq(10656)
|tip
Click Here to Turn in Arcane Tomes |confirm |or
'|complete rep('The Scryers') >= Friendly or skill("Blacksmithing") >= 375 |or
|only if rep ("The Scryers") >= Neutral
step
talk Voren'thal the Seer##18530
|tip Upstairs inside the building.
accept Arcane Tomes##10419 |goto 42.79,91.72 |repeatable
|tip
Click here to turn in Sunfury Signets |confirm |next "Scryers_Allegiance" |or
'|complete rep('The Scryers') >= Friendly or skill("Blacksmithing") >= 375 |or
|only if rep ("The Scryers") >= Neutral
step
label "Collect_Scryers_Reputation_Items"
collect Sunfury Signet##30810 |n
|tip Farm these from Outland Elf enemies in Outland zones and dungeons.
|tip Eclipse Point in Shadowmoon Valley is a good farming spot.
|tip Ten are required to exchange for 250 Scryers reputation.
collect Arcane Tome##29739 |n
|tip Farm these from Outland Elf in Outland zones and dungeons.
|tip Eclipse Point in Shadowmoon Valley is a good farming spot.
|tip Ten are required to exchange for 350 Scryers reputation.
'|complete rep("The Scryers") >= Friendly or skill("Blacksmithing") >= 375
|only if rep ("The Scryers") >= Neutral
step
label "Reach_Friendly_With_Scryers"
Reach Friendly Reputation with The Scryers |complete rep("The Scryers") >= Friendly or skill("Blacksmithing") >= 375 |goto 45.19,81.45
|only if rep ("The Scryers") >= Neutral
step
Enter the building |goto 58.90,59.55 < 10 |walk
talk Quartermaster Enuril##19331
|tip Inside the building.
buy 1 Plans: Enchanted Adamantite Belt##23597 |goto 60.51,64.35 |or
'|complete skill("Blacksmithing") >= 375 |or
|only if rep ("The Scryers") >= Neutral
step
use the Plans: Enchanted Adamantite Belt##23597
Learn Enchanted Adamantite Belt |learn Enchanted Adamantite Belt##29608
|only if rep ("The Scryers") >= Neutral
stickystart "Collect_Arcane_Dust_375"
stickystart "Collect_Arcane_Dust_375"
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
collect 680 Adamantite Ore##23425 |n
|tip Smelt the ore into bars, then into Hardened Adamantite Bars at a forge.
collect 34 Hardened Adamantite Bar##23573 |or
|tip Create them with Mining or purchase them from the auction house.
'|complete skill("Blacksmithing") >= 375 |or
|only if rep ("The Scryers") >= Neutral
step
label "Collect_Arcane_Dust_375"
Disenchant item level 60 or higher green armor and weapons
|tip You can disenchant old gear or buy some off the Auction House.
|tip You may sometimes get Greater or Lesser Planar Essence instead of Arcane Dust.
collect 136 Arcane Dust##22445 |or
|tip Disenchant them from Outland uncommon (green) items with Enchanting or purchase them from the auction house.
'|complete skill("Blacksmithing") >= 375 |or
|only if rep ("The Scryers") >= Neutral
step
label "Collect_Large_Prismatic_Shard_375"
Disenchant item level 67 or higher blue armor and weapons
|tip You can disenchant old gear or buy some off the Auction House.
collect 34 Large Prismatic Shard##22449 |or
|tip Disenchant them from Outland rare (blue) items with Enchanting or purchase them from the auction house.
'|complete skill("Blacksmithing") >= 375 |or
|only if rep ("The Scryers") >= Neutral
step
create 17 Flamebane Gloves##29616,Blacksmithing,375 |goto Shattrath City/0 69.35,42.90 |only if rep ("The Aldor") >= Neutral
create 17 Enchanted Adamantite Belt##29608,,Blacksmithing,375 |goto 69.35,42.90 |only if rep ("The Scryers") >= Neutral
|tip Stand next to an anvil.
|tip You may need to make a few more or less of these.
|tip Each additional Flamebane Glove requires eight Fel Iron Bars, four Primal Water, and four Primal Fire. |only if rep ("The Aldor") >= Neutral
|tip Each additional Enchanted Adamantite Belt requires two Hardened Adamantite Bars, eight Arcane Dust, and two Large Prismatic Shards. |only if rep ("The Scryers") >= Neutral
step
label "Level_with_Felsteel_Gloves"
kill Auchenai Monk##18497+
|tip Inside the Auchenai Crypts dungeon.
collect Plans: Felsteel Gloves##23605 |or
|tip This will not drop unless there is a Blacksmith in the group.
|tip It is Bind on Pickup and cannot be traded.
'|complete skill("Blacksmithing") >= 375 |or
step
use the Plans: Felsteel Gloves##23605
Learn Felsteel Gloves |learn Felsteel Gloves##29619 |or
'|complete skill("Blacksmithing") >= 375 |or
step
map Hellfire Peninsula/0
path	65.97,48.02	69.02,46.87	70.80,50.94	70.25,54.41	70.27,59.32
path	72.23,60.13	74.08,63.37	76.97,62.92	78.97,66.32	78.85,70.21
path	79.70,74.48	80.75,77.99	77.91,75.80	77.13,73.33	76.82,69.54
path	75.53,67.17	71.66,67.33	69.41,67.29	68.38,60.74	65.36,60.83
path	65.69,64.45	63.25,69.06	62.72,72.99	62.49,79.96	58.89,76.64
path	57.05,73.97	57.06,81.30	56.40,82.14	55.54,83.79	52.24,83.83
path	49.82,83.52	46.85,84.82	42.98,79.36	42.26,76.62	44.54,73.42
path	47.44,71.34	50.85,69.85	47.41,66.63	44.75,68.48	45.62,61.55
path	47.89,59.49	49.89,56.45	49.95,61.42	51.38,61.68	52.93,58.38
path	55.41,56.25	56.22,53.50	58.62,52.98	62.69,50.44
click Fel Iron Deposit##181555+
|tip They look like green mineral clusters around this path.
|tip Enter caves along the path.
|tip Make sure you enable "Find Minerals" in the tracking menu on the minimap.
collect 612 Fel Iron Ore##23424 |or
|tip Save the ore for the next step if you are gathering.
collect 102 Felsteel Bar##23448 |or
|tip Create them with Mining or purchase them from the auction house.
'|complete skill("Blacksmithing") >= 375 |or
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
collect 408 Eternium Ore##23427 |n
|tip Smelt these into Eternium Bars, then combine the Fel Iron Bars and Eternium Bars.
collect 102 Felsteel Bar##23448 |or
|tip Create them with Mining or purchase them from the auction house.
'|complete skill("Blacksmithing") >= 375 |or
step
create 17 Felsteel Gloves##29619,Blacksmithing,375 |goto Shattrath City/0 69.35,42.90
|tip Stand next to an anvil.
|tip You may need to make a few more or less of these.
|tip Each additional Felsteel Gloves requires six Felsteel Bars.
step
_Congratulations!_
You Reached Skill 375 in Blacksmithing.
]])
ZygorGuidesViewer:RegisterGuide("Profession Guides\\Cooking\\Cooking (1-375)",{
author="support@zygorguides.com",
condition_suggested=function() return skill("Cooking") > 0 and skill("Cooking") < 375 end,
description="This guide will walk you through leveling your Cooking skill from 1-375.",
},[[
step
Reach Level 5 |ding 5
|tip You must be at least level 5 before you can learn professions.
|tip Use the leveling guides to accomplish this.
step
Run up the stairs |goto Orgrimmar/0 56.34,56.91 < 7 |only if walking
Enter the building |goto Orgrimmar/0 58.14,53.56 < 7 |walk
talk Zamja##3399
|tip Inside the building.
Train Apprentice Cooking |skillmax Cooking,75 |goto Orgrimmar/0 57.40,53.96
step
map Durotar
path follow smart; loop on; ants curved; dist 20
path	46.24,14.08	48.40,14.33	50.51,15.71	52.85,17.40	54.84,19.11
path	55.64,21.23	56.27,24.65	56.55,26.49	56.33,30.28	54.76,33.37
path	53.53,36.24	54.76,39.35	52.82,40.55	51.94,42.55	50.48,43.99
path	48.46,44.47	47.22,43.35	45.66,40.85	45.03,36.20	43.31,33.15
path	41.31,32.48	39.48,33.32	37.75,32.49	36.98,29.96	37.26,26.34
path	37.94,23.38	40.00,20.80	40.35,17.61	42.55,17.05	44.72,17.22
path	45.61,15.87
Kill Boar enemies around this area
collect 55 Chunk of Boar Meat##769 |or
|tip Search the guide menu for the item(s) to use the farming guides.
|tip You can also purchase them from the Auction House.
'|complete skill("Cooking") >= 50 |or
step
Run up the stairs |goto Orgrimmar/0 56.34,56.91 < 7 |only if walking
Enter the building |goto Orgrimmar/0 58.14,53.56 < 7 |walk
create 55 Roasted Boar Meat##2540,Cooking,50 |goto Orgrimmar/0 57.20,53.32
|tip Stand next to the Mighty Blaze.
|tip Inside the building.
step
Reach Level 10 |ding 10
|tip You must be at least level 10 to train Journeyman professions.
|tip Use the leveling guides to accomplish this.
step
Run up the stairs |goto Orgrimmar/0 56.34,56.91 < 7 |only if walking
Enter the building |goto Orgrimmar/0 58.14,53.56 < 7 |walk
talk Zamja##3399
|tip Inside the building.
Train Journeyman Cooking |skillmax Cooking,150 |goto Orgrimmar/0 57.40,53.96
step
Run down the stairs |goto Silverpine Forest 43.09,41.39 < 5 |walk
talk Andrew Hilbert##3556
|tip Downstairs inside the crypt.
buy Recipe: Smoked Bear Meat##6892 |n
use the Recipe: Smoked Bear Meat##6892
Train Smoked Bear Meat |learn Smoked Bear Meat##8607 |goto Silverpine Forest 43.22,40.66
step
map Darkshore
path follow smart; loop on; ants curved; dist 20
path	45.52,35.10	46.86,35.15	47.88,33.99	48.82,34.11	49.47,33.15
path	49.81,31.71	49.00,30.97	48.64,29.50	49.29,27.40	48.64,27.07
path	48.40,25.88	48.18,24.49	47.62,23.22	46.59,22.69	45.54,23.42
path	44.37,23.40	44.27,24.98	43.83,26.43	44.32,27.91	43.94,29.27
path	44.78,30.11	45.40,31.46	44.78,32.44	43.97,32.76	42.43,32.68
path	41.39,33.60	41.66,35.17	42.07,37.43	42.42,39.82	43.17,41.92
path	44.41,42.90	45.25,43.21	45.48,41.84
Kill Bear enemies along this path
collect 30 Bear Meat##3173 |or
|tip Search the guide menu for the item(s) to use the farming guides.
|tip You can also purchase them from the Auction House.
'|complete skill("Cooking") >= 80 |or
step
Run up the stairs |goto Orgrimmar/0 56.34,56.91 < 7 |only if walking
Enter the building |goto Orgrimmar/0 58.14,53.56 < 7 |walk
|tip Stand next to the Mighty Blaze.
|tip Inside the building.
create 30 Smoked Bear Meat##8607,Cooking,80 |goto Orgrimmar/0 57.20,53.32
step
talk Zamja##3399
|tip Inside the building.
Train Boiled Clams |learn Boiled Clams##6499 |goto 57.40,53.96
step
Kill enemies around this area
collect Small Barnacled Clam##5523 |n
use the Small Barnacled Clam##5523
collect 40 Clam Meat##5503 |goto Ashenvale 11.51,28.67 |or
|tip You can also purchase them from the Auction House.
You can find more around here [13.09,25.61]
'|complete skill("Cooking") >= 110 |or
step
Run up the stairs |goto Orgrimmar/0 56.34,56.91 < 7 |only if walking
Enter the building |goto Orgrimmar/0 58.14,53.56 < 7 |walk
talk Xen'to##3400
|tip Inside the building.
buy 40 Refreshing Spring Water##159 |goto Orgrimmar/0 57.57,52.90 |or
'|complete skill("Cooking") >= 110 |or
step
create 40 Boiled Clams##6499,Cooking,110 |goto Orgrimmar/0 57.20,53.32
|tip Stand next to the Mighty Blaze.
|tip Inside the building.
step
talk Zamja##3399
|tip Inside the building.
Train Crab Cake |learn Crab Cake##2544 |goto 57.40,53.96
step
label "Collect_Crawler_Meat_130"
map Darkshore
path follow smart; loop off; dist 20
path	35.96,73.13	35.83,71.48	36.59,68.95	36.82,66.80	36.11,65.18
path	36.51,62.47	36.74,60.50	36.04,59.12	36.82,57.15	36.79,54.53
path	36.54,51.15	36.02,48.06	35.72,45.49	35.81,42.27	36.81,38.70
path	36.70,37.48	37.20,36.08	37.26,34.68	40.29,31.37	41.98,32.18
path	42.41,30.58	42.19,28.01	41.82,24.43	42.48,21.08	43.39,21.15
path	44.84,21.63	45.89,20.38	47.44,20.79	48.98,21.11	50.35,21.96
path	52.16,20.84
Kill Crawler enemies along this path
collect 30 Crawler Meat##2674 |or
|tip You can also purchase them from the Auction House.
'|goto 52.16,20.84 < 20 |noway |c |or
'|complete skill("Cooking") >= 130 |or
step
map Darkshore
path follow smart; loop off; dist 20
path	52.16,20.84	50.35,21.96	48.98,21.11	47.44,20.79	45.89,20.38
path	44.84,21.63	43.39,21.15	42.48,21.08	41.82,24.43	42.19,28.01
path	42.41,30.58	41.98,32.18	40.29,31.37	37.26,34.68	37.20,36.08
path	36.70,37.48	36.81,38.70	35.81,42.27	35.72,45.49	36.02,48.06
path	36.54,51.15	36.79,54.53	36.82,57.15	36.04,59.12	36.74,60.50
path	36.51,62.47	36.11,65.18	36.82,66.80	36.59,68.95	35.83,71.48
path	35.96,73.13
Kill Crawler enemies along this path
collect 30 Crawler Meat##2674 |or
|tip You can also purchase them from the Auction House.
'|goto 35.96,73.13 < 20 |noway |c |next "Collect_Crawler_Meat_130"
step
Run up the stairs |goto Orgrimmar/0 56.34,56.91 < 7 |only if walking
Enter the building |goto Orgrimmar/0 58.14,53.56 < 7 |walk
talk Xen'to##3400
|tip Inside the building.
buy 30 Mild Spice##2678 |goto Orgrimmar/0 57.57,52.90 |or
'|complete skill("Cooking") >= 130 |or
step
create 30 Crab Cake##2544,Cooking,130 |goto 57.20,53.32
|tip Stand next to the Mighty Blaze.
|tip Inside the building.
step
Reach Level 20 |ding 20
|tip You must be at least level 20 to train Expert professions.
|tip Use the leveling guides to accomplish this.
step
talk Wulan##12033
|tip Upstairs inside the building.
buy Expert Cookbook##16072 |n
use the Expert Cookbook##16072
Train Expert Cook |skillmax Cooking,225 |goto Desolace 26.17,69.65
step
talk Nerrist##1148
buy Recipe: Curiously Tasty Omelet##3682 |n
use the Recipe: Curiously Tasty Omelet##3682
Train Curiously Tasty Omelet |learn Curiously Tasty Omelet##3376 |goto Stranglethorn Vale 32.70,29.23
step
label "Collect_Raptor_Egg_175"
map Stranglethorn Vale
path follow smart; loop off; dist 20
path	30.64,25.20	30.40,23.48	31.45,23.06	31.36,21.37	30.71,18.47
path	29.83,16.33	28.80,16.28	27.47,16.45	26.82,17.50	26.75,15.82
path	25.58,15.93	23.70,15.50
Kill Raptor enemies around this area
collect 50 Raptor Egg##3685 |or
|tip You can also purchase them from the Auction House.
'|goto 23.70,15.50 < 20 |noway |c |or
'|complete skill("Cooking") >= 175 |or
step
map Stranglethorn Vale
path follow smart; loop off; dist 20
path	23.70,15.50	25.58,15.93	26.75,15.82	26.82,17.50	27.47,16.45
path	28.80,16.28	29.83,16.33	30.71,18.47	31.36,21.37	31.45,23.06
path	30.40,23.48	30.64,25.20
Kill Raptor enemies around this area
collect 50 Raptor Egg##3685 |or
|tip You can also purchase them from the Auction House.
'|goto 30.64,25.20 < 20 |noway |c |next "Collect_Raptor_Egg_175" |or
'|complete skill("Cooking") >= 175 |or
step
Run up the stairs |goto Orgrimmar/0 56.34,56.91 < 7 |only if walking
Enter the building |goto Orgrimmar/0 58.14,53.56 < 7 |walk
talk Xen'to##3400
|tip Inside the building.
buy 50 Hot Spices##2692 |goto Orgrimmar/0 57.57,52.90 |or
'|complete skill("Cooking") >= 175 |or
step
create 50 Curiously Tasty Omelet##3376,Cooking,175 |goto 57.20,53.32
|tip Stand next to the Mighty Blaze.
|tip Inside the building.
step
talk Nerrist##1148
buy Recipe: Roast Raptor##12228 |n
use the Recipe: Roast Raptor##12228
Train Roast Raptor |learn Roast Raptor##15855 |goto Stranglethorn Vale 32.70,29.23
step
label "Collect_Raptor_Flesh_225"
map Stranglethorn Vale
path follow smart; loop off; dist 20
path	30.64,25.20	30.40,23.48	31.45,23.06	31.36,21.37	30.71,18.47
path	29.83,16.33	28.80,16.28	27.47,16.45	26.82,17.50	26.75,15.82
path	25.58,15.93	23.70,15.50
Kill Raptor enemies around this area
collect 60 Raptor Flesh##12184 |or
|tip Search the guide menu for the item(s) to use the farming guides.
|tip You can also purchase them from the Auction House.
'|goto 23.70,15.50 < 20 |noway |c |or
'|complete skill("Cooking") >= 225 |or
step
map Stranglethorn Vale
path follow smart; loop off; dist 20
path	23.70,15.50	25.58,15.93	26.75,15.82	26.82,17.50	27.47,16.45
path	28.80,16.28	29.83,16.33	30.71,18.47	31.36,21.37	31.45,23.06
path	30.40,23.48	30.64,25.20
Kill Raptor enemies around this area
collect 60 Raptor Flesh##12184 |or
|tip Search the guide menu for the item(s) to use the farming guides.
|tip You can also purchase them from the Auction House.
'|goto 30.64,25.20 < 20 |noway |c |next "Collect_Raptor_Flesh_225"
'|complete skill("Cooking") >= 225 |or
step
Run up the stairs |goto Orgrimmar/0 56.34,56.91 < 7 |only if walking
Enter the building |goto Orgrimmar/0 58.14,53.56 < 7 |walk
talk Xen'to##3400
|tip Inside the building.
buy 60 Hot Spices##2692 |goto Orgrimmar/0 57.57,52.90 |or
'|complete skill("Cooking") >= 225 |or
step
create 60 Roast Raptor##15855,Cooking,225 |goto 57.20,53.32
|tip Stand next to the Mighty Blaze.
|tip Inside the building.
step
Reach Level 35 |ding 35
|tip You must be at least level 35 to train Artisan professions.
|tip Use the leveling guides to accomplish this.
step
Run up the stairs |goto Orgrimmar/0 56.34,56.91 < 7 |only if walking
Enter the building |goto Orgrimmar/0 58.14,53.56 < 7 |walk
talk Zamja##3399
|tip Inside the building.
accept To Gadgetzan You Go!##6611 |goto Orgrimmar/0 57.40,53.96
step
Enter the building |goto Thousand Needles 45.94,51.07 < 7 |walk
talk Innkeeper Abeqwa##11116
|tip Inside the building.
buy 20 Alterac Swiss##8932 |goto 46.07,51.52 |q 6610 |future |or
|tip It may be cheaper on the Auction House.
step
Enter the building |goto Tanaris/0 52.38,27.91 < 5 |walk
talk Dirge Quikcleave##8125
|tip Inside the building.
turnin To Gadgetzan You Go!##6611 |goto Tanaris/0 52.63,28.11
accept Clamlette Surprise##6610 |goto Tanaris/0 52.63,28.11
stickystart "Collect_12_Giant_Eggs"
step
kill Steeljaw Snapper##14123+
|tip They look like turtles.
collect Big-mouth Clam##7973+ |n
use the Big-mouth Clam##7973+
collect 10 Zesty Clam Meat##7974 |q 6610/2 |goto 67.75,22.96 |or
|tip You can also purchase them from the Auction House.
You can find more around:
[67.09,18.71]
[67.51,26.30]
[67.68,29.49]
step
label "Collect_12_Giant_Eggs"
map The Hinterlands
path	follow smart;	loop on;	ants curved;	dist 30
path	44.80,59.32	47.13,56.54	50.76,57.53	55.91,52.30	59.36,53.56
path	62.11,54.23	61.51,46.51	57.53,46.76	51.91,41.76	47.07,45.83
path	41.96,47.60	44.40,54.54
Kill Owlbeast enemies
|tip Follow the path and kill them as you find them.
collect 12 Giant Egg##12207 |q 6610/1 |or
|tip You can also purchase them from the Auction House.
step
Enter the building |goto Tanaris/0 52.38,27.91 < 5 |walk
talk Dirge Quikcleave##8125
|tip Inside the building.
turnin Clamlette Surprise##6610 |goto 52.63,28.11
Train Artisan Cook |skillmax Cooking,300 |goto 52.63,28.11
step
Enter the building |goto Winterspring 61.32,38.72 < 5 |walk
talk Himmik##11187
|tip Inside the building.
buy Recipe: Monster Omelet##16110 |n
use the Recipe: Monster Omelet##16110
Train Monster Omelet |learn Monster Omelet##15933 |goto Winterspring 61.33,39.16
step
Leave the building |goto 61.32,38.72 < 5 |walk
Enter the building |goto 61.33,37.36 < 5 |walk
talk Qia##11189
|tip Inside the building.
buy 120 Soothing Spices##3713 |goto 61.20,37.21 |or
'|complete skill("Cooking") >= 275 |or
step
map The Hinterlands
path	follow smart;	loop on;	ants curved;	dist 30
path	44.80,59.32	47.13,56.54	50.76,57.53	55.91,52.30	59.36,53.56
path	62.11,54.23	61.51,46.51	57.53,46.76	51.91,41.76	47.07,45.83
path	41.96,47.60	44.40,54.54
Kill Owlbeast enemies along this path
collect 60 Giant Egg##12207 |or
|tip You can also purchase them from the Auction House.
'|complete skill("Cooking") >= 275 |or
step
Run up the stairs |goto Orgrimmar/0 56.34,56.91 < 7 |only if walking
Enter the building |goto Orgrimmar/0 58.14,53.56 < 7 |walk
|tip Stand next to the Mighty Blaze.
|tip Inside the building.
create 60 Monster Omelet##15933,Cooking,275 |goto Orgrimmar/0 57.20,53.32
step
Follow the path |goto Tanaris/0 61.03,26.14 < 50 |only if walking
Enter the building |goto Tanaris/0 66.66,22.20 < 5 |walk
talk Gikkix##8137
|tip Inside the building.
buy Recipe: Poached Sunscale Salmon##13946 |n
use the Recipe: Poached Sunscale Salmon##13946
Train Poached Sunscale Salmon |learn Poached Sunscale Salmon##18244 |goto Tanaris/0 66.64,22.08
step
Fish in the Open Water
collect 35 Raw Sunscale Salmon##13760 |or |goto Feralas 75.58,44.52
|tip You will need level 205 Fishing to catch these.
|tip This fish can only be caught during the day; they cannot be caught between midnight and 6 AM server time.
|tip You can also purchase them from the Auction House.
'|complete skill("Cooking") >= 300 |or
step
Run up the stairs |goto Orgrimmar/0 56.34,56.91 < 7 |only if walking
Enter the building |goto Orgrimmar/0 58.14,53.56 < 7 |walk
|tip Stand next to the Mighty Blaze.
|tip Inside the building.
create 35 Poached Sunscale Salmon##18244,Cooking,300 |goto Orgrimmar/0 57.20,53.32
step
talk Baxter##18988
|tip Inside the building.
buy Master Cookbook##27736 |n
use the Master Cookbook##27736
Train Master Cooking |skillmax Cooking,375 |goto Hellfire Peninsula/0 56.8,37.4
step
talk Cookie One-Eye##16585
buy Recipe: Ravager Dog##27688 |n
use Recipe: Ravager Dog##27688
Train Ravager Dog |learn Ravager Dog##33284 |goto 54.6,41.0
step
Kill Thornfang enemies around this area
|tip They spawn on both sides of the road.
collect 30 Ravager Flesh##27674 |or |goto Hellfire Peninsula/0 10.26,51.72
|tip You can also purchase them from the Auction House.
'|complete skill("Cooking") >= 325 |or
step
create 30 Ravager Dog##33284,Cooking,325
step
talk Nula the Butcher##20097
buy Recipe: Talbuk Steak##27693 |n
use Recipe: Talbuk Steak##27693
Train Talbuk Steak |learn Talbuk Steak##33289 |goto Nagrand/0 58.0,35.6
step
map Nagrand/0
path loop on; follow strict; dist 40
path	53.83,31.31	52.92,29.15	51.38,26.84	48.38,27.04	47.30,30.27
path	48.26,33.27	49.13,37.97	50.13,39.28	51.37,38.48	50.58,36.74
path	52.29,33.21
kill Talbuk Thorngrazer##17131+
collect 40 Talbuk Venison##27682 |or
|tip You can also purchase them from the Auction House.
'|complete skill("Cooking") >= 355 |or
step
create 30 Talbuk Steak##33289,Cooking,355
step
talk Xerintha Ravenoak##20916
buy Recipe: Mok'Nathal Shortribs##31675 |n
|tip This is a limited supply recipe.
|tip You can also complete the quest "Mok'Nathal Treats" from Matron Varah.
use Recipe: Mok'Nathal Shortribs##31675
Train Mok'Nathal Shortribs |learn Mok'Nathal Shortribs##38867 |goto Blade's Edge Mountains/0 62.4,40.2
step
map Blade's Edge Mountains/0
path loop on; follow strict; dist 40
path	62.00,55.54	65.96,57.01	66.51,59.83	66.37,63.86	67.39,66.46
path	67.69,71.59	69.27,71.36	68.95,65.95	68.53,63.09	68.54,60.21
path	68.26,57.12	67.14,53.92	68.20,49.52
kill Daggermaw Lashtail##20751+
collect 60 Raptor Ribs##31670 |or
|tip You can also purchase them from the Auction House.
'|complete skill("Cooking") >= 375 |or
step
create 20 Mok'Nathal Shortribs##38867,Cooking,375
step
_Congratulations!_
You Reached 375 Cooking Skill.
]])
ZygorGuidesViewer:RegisterGuide("Profession Guides\\Cooking\\Farming Guides\\Chunk of Boar Meat",{
author="support@zygorguides.com",
},[[
step
map Durotar
path follow smart; loop on; ants curved; dist 20
path	46.24,14.08	48.40,14.33	50.51,15.71	52.85,17.40	54.84,19.11
path	55.64,21.23	56.27,24.65	56.55,26.49	56.33,30.28	54.76,33.37
path	53.53,36.24	54.76,39.35	52.82,40.55	51.94,42.55	50.48,43.99
path	48.46,44.47	47.22,43.35	45.66,40.85	45.03,36.20	43.31,33.15
path	41.31,32.48	39.48,33.32	37.75,32.49	36.98,29.96	37.26,26.34
path	37.94,23.38	40.00,20.80	40.35,17.61	42.55,17.05	44.72,17.22
path	45.61,15.87
Kill Boar enemies around this area
collect Chunk of Boar Meat##769 |n
]])
ZygorGuidesViewer:RegisterGuide("Profession Guides\\Cooking\\Farming Guides\\Small Egg",{
author="support@zygorguides.com",
},[[
step
map Mulgore
path follow smart; loop on; ants curved; dist 20
path	57.2,68.0	58.6,64.2	60.0,59.8	56.6,57.8	57.6,55.0
path	58.4,52.8	57.6,48.6	56.6,45.4	53.8,45.8	51.4,43.0
path	51.0,40.4	52.4,38.2	52.2,34.4	49.2,36.2	47.2,41.6
path	45.4,42.8	42.4,39.6	42.4,43.4	38.0,41.4	35.0,41.4
path	36.6,45.8	41.6,48.6	42.8,53.0	43.6,49.6	46.6,50.2
path	48.09,53.39	51.19,58.92	53.62,62.28
Kill Swoop enemies along this path
collect Small Egg##6889 |n
]])
ZygorGuidesViewer:RegisterGuide("Profession Guides\\Cooking\\Farming Guides\\Stringy Wolf Meat",{
author="support@zygorguides.com",
},[[
step
map Silverpine Forest
path follow smart; loop on; ants curved; dist 20
path	64.90,7.27	63.14,8.68	61.24,9.07	59.01,9.39	56.46,12.40
path	55.03,13.55	55.37,15.22	54.37,17.49	52.98,20.62	54.78,20.98
path	55.66,17.34	57.17,15.48	58.55,14.33	60.27,13.04	61.93,11.75
path	64.00,11.52	65.79,10.72	67.99,8.47	69.34,5.89	68.36,5.26
path	66.45,5.26
Kill Worg enemies along this path
collect Stringy Wolf Meat##2672 |n
]])
ZygorGuidesViewer:RegisterGuide("Profession Guides\\Cooking\\Farming Guides\\Meaty Bat Wing",{
author="support@zygorguides.com",
},[[
step
map Tirisfal Glades
path follow smart; loop on; ants curved; dist 20
path	64.52,58.29	68.11,58.97	70.15,60.79	71.25,63.52	72.94,65.59
path	74.00,67.56	75.53,71.12	77.00,71.91	78.54,72.64	80.23,70.82
path	80.86,69.37	81.43,67.07	80.77,64.43	79.73,62.26	78.26,61.18
path	77.34,58.92	75.89,58.68	74.47,58.56	73.14,59.41	72.26,58.06
path	71.57,55.68	71.47,53.36	71.31,50.97	71.66,48.19	72.37,45.90
path	73.28,43.98	72.95,41.87	72.59,39.15	73.34,37.59	73.67,35.63
path	73.64,33.78	71.70,33.07	69.78,33.42	68.94,35.29	66.23,38.84
path	64.99,41.00	63.82,44.53	63.73,47.67	63.23,49.86	63.49,52.65
path	63.93,55.31
Kill Bat enemies along this path
collect Meaty Bat Wing##12223 |n
]])
ZygorGuidesViewer:RegisterGuide("Profession Guides\\Cooking\\Farming Guides\\Scorpid Stinger",{
author="support@zygorguides.com",
},[[
step
map Durotar
path follow smart; loop on; ants curved; dist 20
path	55.71,43.99	57.16,43.98	58.12,44.91	58.09,48.54	58.89,50.96
path	56.22,51.84	54.48,53.49	54.37,56.23	54.31,59.37	54.36,61.46
path	54.51,63.85	54.66,66.01	55.50,68.23	56.41,69.98	57.97,72.01
path	57.45,74.19	56.73,76.45	55.27,77.20	53.46,74.65	52.13,74.16
path	52.68,71.08	51.40,67.70	51.79,65.36	51.61,61.69	52.62,60.65
path	52.78,58.81	52.26,56.13	51.76,53.68	52.33,52.11	51.49,48.96
path	52.65,45.64	53.80,45.65
Kill Scorpid enemies along this path
collect Scorpid Stinger##5466 |n
]])
ZygorGuidesViewer:RegisterGuide("Profession Guides\\Cooking\\Farming Guides\\Coyote Meat",{
author="support@zygorguides.com",
},[[
step
label "Path_One"
map Westfall
path follow smart; loop off; dist 20
path	62.45,42.12	61.05,38.49	59.20,30.20	58.69,26.18	58.85,22.18
path	55.99,22.99	53.72,26.55	51.15,26.31	48.14,25.64	47.04,19.68
path	44.81,17.52	42.78,19.23	41.83,24.14	41.27,26.78	42.70,31.93
path	39.81,33.77	36.63,30.63	34.38,34.44	33.43,38.91	35.02,42.09
path	38.49,42.87
Kill Coyote enemies along this path
collect Coyote Meat##2673 |n
'|goto 38.49,42.87 < 20 |noway |c
step
map Westfall
path follow smart; loop off; dist 20
path	38.49,42.87	35.02,42.09	33.43,38.91	34.38,34.44	36.63,30.63
path	39.81,33.77	42.70,31.93	41.27,26.78	41.83,24.14	42.78,19.23
path	44.81,17.52	47.04,19.68	48.14,25.64	51.15,26.31	53.72,26.55
path	55.99,22.99	58.85,22.18	58.69,26.18	59.20,30.20	61.05,38.49
path	62.45,42.12
Kill Coyote enemies along this path
collect Coyote Meat##2673 |n
'|goto 62.45,42.12 < 20 |noway |c |next "Path_One"
]])
ZygorGuidesViewer:RegisterGuide("Profession Guides\\Cooking\\Farming Guides\\Strider Meat",{
author="support@zygorguides.com",
},[[
step
map The Barrens
path follow smart; loop on; ants curved; dist 20
path	50.96,33.84	50.83,35.21	51.97,35.71	52.46,36.54	53.32,35.09
path	54.26,32.99	54.44,31.66	53.72,30.07	53.77,28.08	53.65,25.69
path	54.61,23.90	55.67,22.62	56.41,22.14	57.27,22.41	59.45,22.00
path	59.26,20.30	57.93,20.24	56.88,20.58	55.55,20.63	53.98,21.25
path	53.33,18.82	52.45,17.05	52.24,15.14	51.72,13.33	50.04,13.39
path	48.57,13.22	47.25,14.30	48.85,14.14	50.65,16.09	51.04,17.22
path	51.13,19.62	51.56,21.35	51.27,22.82	50.14,22.90	49.10,23.29
path	48.26,24.37	47.22,25.47	46.18,27.62	45.98,30.46	45.05,32.14
path	44.23,34.84	44.88,36.86	44.87,38.28	44.26,39.76	45.05,41.47
path	46.55,43.95	47.19,42.91	49.21,41.46	49.88,39.03	50.32,36.85
Kill Strider enemies along this path
collect Strider Meat##5469 |n
]])
ZygorGuidesViewer:RegisterGuide("Profession Guides\\Cooking\\Farming Guides\\Kodo Meat",{
author="support@zygorguides.com",
},[[
step
map The Barrens
path follow smart; loop on; ants curved; dist 20
path	46.73,67.35	46.61,69.24	46.70,71.56	46.79,75.01	46.84,79.96
path	45.00,78.85	44.87,75.78	45.31,72.93	45.54,70.61	45.76,68.23
path	45.93,66.82
Kill Kodo enemies along this path
collect Kodo Meat##5467 |n
|tip Thunderheads will not drop this item.
]])
ZygorGuidesViewer:RegisterGuide("Profession Guides\\Cooking\\Farming Guides\\Bear Meat",{
author="support@zygorguides.com",
},[[
step
map Darkshore
path follow smart; loop on; ants curved; dist 20
path	45.52,35.10	46.86,35.15	47.88,33.99	48.82,34.11	49.47,33.15
path	49.81,31.71	49.00,30.97	48.64,29.50	49.29,27.40	48.64,27.07
path	48.40,25.88	48.18,24.49	47.62,23.22	46.59,22.69	45.54,23.42
path	44.37,23.40	44.27,24.98	43.83,26.43	44.32,27.91	43.94,29.27
path	44.78,30.11	45.40,31.46	44.78,32.44	43.97,32.76	42.43,32.68
path	41.39,33.60	41.66,35.17	42.07,37.43	42.42,39.82	43.17,41.92
path	44.41,42.90	45.25,43.21	45.48,41.84
Kill Bear enemies along this path
collect Bear Meat##3173 |n
]])
ZygorGuidesViewer:RegisterGuide("Profession Guides\\Cooking\\Farming Guides\\Crawler Meat",{
author="support@zygorguides.com",
},[[
step
label "Path_One"
map Darkshore
path follow smart; loop off; dist 20
path	35.96,73.13	35.83,71.48	36.59,68.95	36.82,66.80	36.11,65.18
path	36.51,62.47	36.74,60.50	36.04,59.12	36.82,57.15	36.79,54.53
path	36.54,51.15	36.02,48.06	35.72,45.49	35.81,42.27	36.81,38.70
path	36.70,37.48	37.20,36.08	37.26,34.68	40.29,31.37	41.98,32.18
path	42.41,30.58	42.19,28.01	41.82,24.43	42.48,21.08	43.39,21.15
path	44.84,21.63	45.89,20.38	47.44,20.79	48.98,21.11	50.35,21.96
path	52.16,20.84
Kill Crawler enemies along this path
collect Crawler Meat##2674 |n
'|goto 52.16,20.84 < 20 |noway |c
step
map Darkshore
path follow smart; loop off; dist 20
path	52.16,20.84	50.35,21.96	48.98,21.11	47.44,20.79	45.89,20.38
path	44.84,21.63	43.39,21.15	42.48,21.08	41.82,24.43	42.19,28.01
path	42.41,30.58	41.98,32.18	40.29,31.37	37.26,34.68	37.20,36.08
path	36.70,37.48	36.81,38.70	35.81,42.27	35.72,45.49	36.02,48.06
path	36.54,51.15	36.79,54.53	36.82,57.15	36.04,59.12	36.74,60.50
path	36.51,62.47	36.11,65.18	36.82,66.80	36.59,68.95	35.83,71.48
path	35.96,73.13
Kill Crawler enemies along this path
collect Crawler Meat##2674 |n
'|goto 35.96,73.13 < 20 |noway |c |next "Path_One"
]])
ZygorGuidesViewer:RegisterGuide("Profession Guides\\Cooking\\Farming Guides\\Crawler Claw",{
author="support@zygorguides.com",
},[[
step
label "Path_One"
map Darkshore
path follow smart; loop off; dist 20
path	35.96,73.13	35.83,71.48	36.59,68.95	36.82,66.80	36.11,65.18
path	36.51,62.47	36.74,60.50	36.04,59.12	36.82,57.15	36.79,54.53
path	36.54,51.15	36.02,48.06	35.72,45.49	35.81,42.27	36.81,38.70
path	36.70,37.48	37.20,36.08	37.26,34.68	40.29,31.37	41.98,32.18
path	42.41,30.58	42.19,28.01	41.82,24.43	42.48,21.08	43.39,21.15
path	44.84,21.63	45.89,20.38	47.44,20.79	48.98,21.11	50.35,21.96
path	52.16,20.84
Kill Crawler enemies along this path
collect Crawler Claw##2675 |n
'|goto 52.16,20.84 < 20 |noway |c
step
map Darkshore
path follow smart; loop off; dist 20
path	52.16,20.84	50.35,21.96	48.98,21.11	47.44,20.79	45.89,20.38
path	44.84,21.63	43.39,21.15	42.48,21.08	41.82,24.43	42.19,28.01
path	42.41,30.58	41.98,32.18	40.29,31.37	37.26,34.68	37.20,36.08
path	36.70,37.48	36.81,38.70	35.81,42.27	35.72,45.49	36.02,48.06
path	36.54,51.15	36.79,54.53	36.82,57.15	36.04,59.12	36.74,60.50
path	36.51,62.47	36.11,65.18	36.82,66.80	36.59,68.95	35.83,71.48
path	35.96,73.13
Kill Crawler enemies along this path
collect Crawler Claw##2675 |n
'|goto 35.96,73.13 < 20 |noway |c |next "Path_One"
]])
ZygorGuidesViewer:RegisterGuide("Profession Guides\\Cooking\\Farming Guides\\Clam Meat",{
author="support@zygorguides.com",
},[[
step
Kill enemies around this area
collect Small Barnacled Clam##5523 |n
use the Small Barnacled Clam##5523
collect Clam Meat##5503 |n |goto Ashenvale 11.51,28.67
You can find more around here [13.09,25.61]
]])
ZygorGuidesViewer:RegisterGuide("Profession Guides\\Cooking\\Farming Guides\\Murloc Fin",{
author="support@zygorguides.com",
},[[
step
map Ashenvale
path follow smart; loop on; ants curved; dist 20
path	20.90,40.21	21.33,41.92	21.06,43.30	20.66,44.48	19.75,43.65
path	19.08,42.84	18.81,41.34	18.96,40.20	19.58,41.07
Kill Saltspittle enemies around this area
collect Murloc Fin##1468 |n
]])
ZygorGuidesViewer:RegisterGuide("Profession Guides\\Cooking\\Farming Guides\\Big Bear Meat",{
author="support@zygorguides.com",
},[[
step
map Ashenvale
path follow smart; loop on; ants curved; dist 20
path	67.73,62.23	68.83,60.63	69.27,58.70
path	69.88,56.41	71.18,53.99	72.63,51.81	74.28,49.70	74.97,48.67
path	74.99,48.18	73.68,47.08	72.40,48.18	71.65,49.37	70.31,50.39
path	69.21,51.00	67.86,50.22	66.80,48.23	66.33,46.31	65.37,44.10
path	64.04,43.77	62.76,44.57	63.03,46.48	64.54,48.42	63.80,53.72
path	64.12,55.74	64.34,58.42	65.19,59.98	66.42,61.67	65.60,63.39
Kill Bear enemies around this area
collect Big Bear Meat##3730 |n
]])
ZygorGuidesViewer:RegisterGuide("Profession Guides\\Cooking\\Farming Guides\\Raptor Egg",{
author="support@zygorguides.com",
},[[
step
label "Path_One"
map Stranglethorn Vale
path follow smart; loop off; dist 20
path	30.64,25.20	30.40,23.48	31.45,23.06	31.36,21.37	30.71,18.47
path	29.83,16.33	28.80,16.28	27.47,16.45	26.82,17.50	26.75,15.82
path	25.58,15.93	23.70,15.50
Kill Raptor enemies around this area
collect Raptor Egg##3685 |n
'|goto 23.70,15.50 < 20 |noway |c
step
map Stranglethorn Vale
path follow smart; loop off; dist 20
path	23.70,15.50	25.58,15.93	26.75,15.82	26.82,17.50	27.47,16.45
path	28.80,16.28	29.83,16.33	30.71,18.47	31.36,21.37	31.45,23.06
path	30.40,23.48	30.64,25.20
Kill Raptor enemies around this area
collect Raptor Egg##3685 |n
'|goto 30.64,25.20 < 20 |noway |c |next "Path_One"
]])
ZygorGuidesViewer:RegisterGuide("Profession Guides\\Cooking\\Farming Guides\\Thunder Lizard Tail",{
author="support@zygorguides.com",
},[[
step
map The Barrens
path follow smart; loop on; ants curved; dist 20
path	46.58,56.30	48.58,57.05	48.69,58.20	48.80,59.11	48.24,60.56
path	48.43,62.12	48.27,63.65	47.64,65.24	46.80,67.81	46.67,68.85
path	46.58,71.45	47.01,73.09	46.67,74.29	47.26,75.11	47.86,75.81
path	48.51,76.74	49.30,77.70	48.91,78.77	47.66,80.13	46.53,79.48
path	44.91,79.17	44.65,78.42	44.58,76.68	44.47,75.54	44.75,74.17
path	45.56,72.50	45.56,70.73	45.79,69.01	46.03,66.53	45.23,64.79
path	45.30,63.46	46.25,61.69	46.94,60.01	47.00,58.41
Kill Thunderhead enemies around this area
collect Thunder Lizard Tail##5470 |n
]])
ZygorGuidesViewer:RegisterGuide("Profession Guides\\Cooking\\Farming Guides\\Tangy Clam Meat",{
author="support@zygorguides.com",
},[[
step
label "Path_One"
map Hillsbrad Foothills
path follow smart; loop off; dist 20
path	23.74,64.84	24.78,66.48	25.16,70.22	27.62,72.13	29.97,72.75
path	32.48,72.00	34.29,68.67	36.49,68.49	39.57,68.88	42.36,68.25
path	44.91,66.23	46.75,64.48	49.03,64.21	51.79,63.89	53.48,64.06
path	54.48,61.39	55.38,62.11	55.73,64.18	57.86,68.24	59.21,72.14
path	61.40,75.49	64.60,77.38	65.64,80.33	66.91,85.51
Kill enemies along this path
collect Thick-shelled Clam##5524 |n
use the Thick-shelled Clam##5524
collect Tangy Clam Meat##5504 |n
'|goto 66.91,85.51 < 20 |noway |c
step
map Hillsbrad Foothills
path follow smart; loop off; dist 20
path	66.91,85.51	65.64,80.33	64.60,77.38	61.40,75.49	59.21,72.14
path	57.86,68.24	55.73,64.18	55.38,62.11	54.48,61.39	53.48,64.06
path	51.79,63.89	49.03,64.21	46.75,64.48	44.91,66.23	42.36,68.25
path	39.57,68.88	36.49,68.49	34.29,68.67	32.48,72.00	29.97,72.75
path	27.62,72.13	25.16,70.22	24.78,66.48	23.74,64.84
Kill enemies along this path
collect Thick-shelled Clam##5524 |n
use the Thick-shelled Clam##5524
collect Tangy Clam Meat##5504 |n
'|goto 23.74,64.84 < 20 |noway |c |next "Path_One"
]])
ZygorGuidesViewer:RegisterGuide("Profession Guides\\Cooking\\Farming Guides\\Tender Crocolisk Meat",{
author="support@zygorguides.com",
},[[
step
label "Path_One"
map Dustwallow Marsh
path follow smart; loop off; dist 20
path	42.01,28.23	41.27,30.48	40.81,32.17	39.51,33.86	38.27,35.06
path	39.30,36.33	40.52,36.90	41.08,38.12	42.23,39.13	42.29,41.27
path	40.44,41.83	39.76,43.93	39.29,45.36	38.51,45.82	37.54,46.50
path	36.53,47.94	35.50,49.39	36.60,52.40	38.28,53.98	40.81,54.72
path	41.62,55.99	40.68,58.48	40.53,61.02
Kill Drywallow enemies along this path
collect Tender Crocolisk Meat##3667 |n
'|goto 40.53,61.02 < 20 |noway |c
step
map Dustwallow Marsh
path follow smart; loop off; dist 20
path	40.53,61.02	40.68,58.48	41.62,55.99	40.81,54.72	38.28,53.98
path	36.60,52.40	35.50,49.39	36.53,47.94	37.54,46.50	38.51,45.82
path	39.29,45.36	39.76,43.93	40.44,41.83	42.29,41.27	42.23,39.13
path	41.08,38.12	40.52,36.90	39.30,36.33	38.27,35.06	39.51,33.86
path	40.81,32.17	41.27,30.48	42.01,28.23
Kill Drywallow enemies along this path
collect Tender Crocolisk Meat##3667 |n
'|goto 42.01,28.23 < 20 |noway |c |next "Path_One"
]])
ZygorGuidesViewer:RegisterGuide("Profession Guides\\Cooking\\Farming Guides\\Lion Meat",{
author="support@zygorguides.com",
},[[
step
map Hillsbrad Foothills
path follow smart; loop on; ants curved; dist 20
path	53.45,35.50	54.82,31.40	50.85,30.94	48.73,31.20	47.14,34.19
path	44.82,36.37	42.94,35.61	40.84,34.75	37.39,30.82	38.60,37.24
path	39.02,42.97	41.37,42.61	42.89,40.98	44.43,45.21	47.44,44.25
path	50.74,47.10	53.15,47.46	55.37,44.48	54.69,42.88	56.10,41.00
path	56.82,37.61
kill Starving Mountain Lion##2384+
collect Lion Meat##3731 |n
]])
ZygorGuidesViewer:RegisterGuide("Profession Guides\\Cooking\\Farming Guides\\Stag Meat",{
author="support@zygorguides.com",
},[[
step
label "Path_One"
map Stonetalon Mountains
path follow smart; loop off; dist 20
path	50.21,36.84	49.75,34.63	48.15,33.61	46.91,32.12	46.84,28.49
path	46.38,25.94	45.77,24.36	44.95,22.28	44.66,19.95	44.13,17.21
path	43.26,16.08	41.50,15.94	40.17,15.24	39.42,12.31	39.94,10.54
path	40.29,8.62	40.73,6.34	39.49,6.04
Kill Courser enemies along this path
collect Stag Meat##5471 |n
'|goto 39.49,6.04 < 20 |noway |c
step
map Stonetalon Mountains
path follow smart; loop off; dist 20
path	39.49,6.04	40.73,6.34	40.29,8.62	39.94,10.54	39.42,12.31
path	40.17,15.24	41.50,15.94	43.26,16.08	44.13,17.21	44.66,19.95
path	44.95,22.28	45.77,24.36	46.38,25.94	46.84,28.49	46.91,32.12
path	48.15,33.61	49.75,34.63	50.21,36.84
Kill Courser enemies along this path
collect Stag Meat##5471 |n
'|goto 50.21,36.84 < 20 |noway |c |next "Path_One"
]])
ZygorGuidesViewer:RegisterGuide("Profession Guides\\Cooking\\Farming Guides\\Gooey Spider Leg",{
author="support@zygorguides.com",
},[[
step
map Ashenvale
path follow smart; loop on; ants curved; dist 20
path	31.27,48.10	31.83,50.03	32.77,52.46	34.17,53.58	35.11,55.05
path	35.48,56.68	34.99,58.60	33.81,59.29	32.26,59.26	30.39,58.91
path	29.06,57.28	29.40,55.20	28.00,55.67	27.45,53.31	26.08,51.85
path	24.96,50.29	25.87,46.65	26.74,48.07	28.74,48.35
kill Wildthorn Stalker##3819+
collect Gooey Spider Leg##2251 |n
]])
ZygorGuidesViewer:RegisterGuide("Profession Guides\\Cooking\\Farming Guides\\Mystery Meat",{
author="support@zygorguides.com",
},[[
step
map Desolace
path follow smart; loop on; ants curved; dist 20
path	51.29,44.72	53.48,47.10	55.33,46.17	57.48,48.07	58.96,47.63
path	60.75,46.43	62.24,44.62	63.57,45.94	63.27,49.13	61.69,55.00
path	61.88,58.44	62.94,65.32	61.88,68.70	62.74,70.12	63.61,72.54
path	61.39,75.80	59.53,76.20	60.04,79.61	59.47,82.26	56.81,86.32
path	54.85,86.07	52.40,86.59	50.42,87.94	48.11,87.57	44.00,86.02
path	41.14,82.82	42.54,77.20	43.81,73.09	42.57,70.49	41.77,66.08
path	42.23,61.68	42.51,57.62	43.63,55.03	43.45,50.95	41.83,49.60
path	41.89,45.46	45.18,40.98	45.64,38.42	48.07,39.13	50.82,41.52
Kill enemies around this area
collect Mystery Meat##12037 |n
]])
ZygorGuidesViewer:RegisterGuide("Profession Guides\\Cooking\\Farming Guides\\Red Wolf Meat",{
author="support@zygorguides.com",
},[[
step
map The Hinterlands
path follow smart; loop on; ants curved; dist 20
path	16.99,49.54	14.76,51.94	16.34,54.97	19.20,54.81	21.00,55.69
path	22.67,53.75	24.13,52.68	22.29,51.46	20.61,50.68	19.10,49.49
kill Mangy Silvermane##2923+
collect Red Wolf Meat##12203 |n
]])
ZygorGuidesViewer:RegisterGuide("Profession Guides\\Cooking\\Farming Guides\\Turtle Meat",{
author="support@zygorguides.com",
},[[
step
label "Path_One"
map Hillsbrad Foothills
path follow smart; loop off; dist 20
path	55.45,57.43	56.82,50.74	58.10,47.76	59.58,47.03	61.27,45.60
path	61.69,42.44	63.66,39.71	66.35,38.58	67.91,34.65	68.11,31.05
path	68.53,27.79	68.76,23.80	68.71,17.57	69.11,12.97	71.53,8.15
map Alterac Mountains
path	73.57,66.04	77.21,62.35	79.49,58.40	81.26,54.60	84.17,52.70
path	87.28,49.70	90.76,47.21
kill Snapjaw##2408+
collect Turtle Meat##3712 |n
'|goto 90.76,47.21 < 20 |noway |c
step
map Alterac Mountains
path follow smart; loop off; dist 20
path	90.76,47.21	87.28,49.70	84.17,52.70	81.26,54.60	79.49,58.40
path	77.21,62.35	73.57,66.04
map Hillsbrad Foothills
path	71.53,8.15	69.11,12.97	68.71,17.57	68.76,23.80	68.53,27.79
path	68.11,31.05	67.91,34.65	66.35,38.58	63.66,39.71	61.69,42.44
path	61.27,45.60	59.58,47.03	58.10,47.76	56.82,50.74	55.45,57.43
kill Snapjaw##2408+
collect Turtle Meat##3712 |n
'|goto 55.45,57.43 < 20 |noway |c |next "Path_One"
]])
ZygorGuidesViewer:RegisterGuide("Profession Guides\\Cooking\\Farming Guides\\Tiger Meat",{
author="support@zygorguides.com",
},[[
step
map Stranglethorn Vale
path follow smart; loop on; ants curved; dist 20
path	37.17,11.59	36.03,11.59	35.04,11.61	33.93,9.90	32.59,9.49
path	31.34,8.40	31.71,9.95	32.62,10.51	33.06,11.72	33.88,12.60
path	34.58,13.61	35.43,12.75	36.60,13.36	37.41,14.77	38.14,14.47
path	38.22,13.67	38.39,12.20	39.14,10.33	39.08,9.00	37.71,9.37
Kill Tiger enemies around this area
collect Tiger Meat##12202 |n
]])
ZygorGuidesViewer:RegisterGuide("Profession Guides\\Cooking\\Farming Guides\\Raptor Flesh",{
author="support@zygorguides.com",
},[[
step
label "Path_One"
map Stranglethorn Vale
path follow smart; loop off; dist 20
path	30.64,25.20	30.40,23.48	31.45,23.06	31.36,21.37	30.71,18.47
path	29.83,16.33	28.80,16.28	27.47,16.45	26.82,17.50	26.75,15.82
path	25.58,15.93	23.70,15.50
Kill Raptor enemies around this area
collect Raptor Flesh##12184 |n
'|goto 23.70,15.50 < 20 |noway |c
step
map Stranglethorn Vale
path follow smart; loop off; dist 20
path	23.70,15.50	25.58,15.93	26.75,15.82	26.82,17.50	27.47,16.45
path	28.80,16.28	29.83,16.33	30.71,18.47	31.36,21.37	31.45,23.06
path	30.40,23.48	30.64,25.20
Kill Raptor enemies around this area
collect Raptor Flesh##12184 |n
'|goto 30.64,25.20 < 20 |noway |c |next "Path_One"
]])
ZygorGuidesViewer:RegisterGuide("Profession Guides\\Cooking\\Farming Guides\\Buzzard Wing",{
author="support@zygorguides.com",
},[[
step
map Desolace
path follow smart; loop on; ants curved; dist 20
path	51.29,44.72	53.48,47.10	55.33,46.17	57.48,48.07	58.96,47.63
path	60.75,46.43	62.24,44.62	63.57,45.94	63.27,49.13	61.69,55.00
path	61.88,58.44	62.94,65.32	61.88,68.70	62.74,70.12	63.61,72.54
path	61.39,75.80	59.53,76.20	60.04,79.61	59.47,82.26	56.81,86.32
path	54.85,86.07	52.40,86.59	50.42,87.94	48.11,87.57	44.00,86.02
path	41.14,82.82	42.54,77.20	43.81,73.09	42.57,70.49	41.77,66.08
path	42.23,61.68	42.51,57.62	43.63,55.03	43.45,50.95	41.83,49.60
path	41.89,45.46	45.18,40.98	45.64,38.42	48.07,39.13	50.82,41.52
Kill Dread enemies around this area
collect Buzzard Wing##3404 |n
]])
ZygorGuidesViewer:RegisterGuide("Profession Guides\\Cooking\\Farming Guides\\Giant Clam Meat",{
author="support@zygorguides.com",
},[[
step
click Giant Clam##2744+
|tip They look like large shells underwater around this area.
|tip Elixirs of Water Breathing are very helpful while farming these.
collect Giant Clam Meat##4655 |n |goto Stranglethorn Vale 26.75,26.88
]])
ZygorGuidesViewer:RegisterGuide("Profession Guides\\Elements\\Farming Guides\\Essence of Water",{
author="support@zygorguides.com",
},[[
step
Kill enemies around this area
|tip Only Plague Ravagers and Blighted Surges will drop this item.
collect Essence of Water##7080 |n |goto Eastern Plaguelands 61.65,81.13
|tip These have a low drop rate.
]])
ZygorGuidesViewer:RegisterGuide("Profession Guides\\Elements\\Farming Guides\\Living Essence",{
author="support@zygorguides.com",
},[[
step
Kill Tar enemies around this area
collect Living Essence##12803 |n |goto Un'Goro Crater 46.46,17.23
|tip These have a low drop rate.
]])
ZygorGuidesViewer:RegisterGuide("Profession Guides\\Elements\\Farming Guides\\Essence of Fire",{
author="support@zygorguides.com",
},[[
step
Follow the path up |goto Un'Goro Crater 52.06,42.40 < 10 |only if walking
Kill enemies around this area
collect Essence of Fire##7078 |n |goto 49.32,48.31
|tip These have a low drop rate.
]])
ZygorGuidesViewer:RegisterGuide("Profession Guides\\Elements\\Farming Guides\\Essence of Air",{
author="support@zygorguides.com",
},[[
step
kill Dust Stormer##11744+
collect Essence of Air##7082 |n |goto Silithus/0 31.69,18.15
|tip These have a low drop rate.
You can find more around [21.34,29.92]
]])
ZygorGuidesViewer:RegisterGuide("Profession Guides\\Elements\\Farming Guides\\Essence of Earth",{
author="support@zygorguides.com",
},[[
step
kill Desert Rumbler##11746+
collect Essence of Earth##7076 |n |goto Silithus/0 22.37,11.12
|tip These have a low drop rate.
]])
ZygorGuidesViewer:RegisterGuide("Profession Guides\\Elements\\Farming Guides\\Essence of Undeath",{
author="support@zygorguides.com",
},[[
step
Follow the path |goto Western Plaguelands 56.61,78.55 < 10 |only if walking
Continue following the path |goto 68.58,80.14 < 10 |only if walking
Run up the stairs |goto 69.94,74.00 < 7 |only if walking
Enter the building |goto Eastern Kingdoms 52.79,26.43 < 7 |walk
click Scholomance Door |goto 52.75,26.41 < 5 |walk
Enter the Scholomance dungeon |goto 52.70,26.38 < 5 |c
step
Kill enemies throughout the dungeon
collect Essence of Undeath##12808 |n
|tip These have a low drop rate.
]])
ZygorGuidesViewer:RegisterGuide("Profession Guides\\Elements\\Farming Guides\\Heart of the Wild",{
author="support@zygorguides.com",
},[[
step
Enter the cave |goto Western Plaguelands 64.78,38.69 < 5 |walk
Kill enemies around this area
|tip Inside the cave.
|tip Rotting Behemoths and Decaying Horrors can drop Heart of the Wild.
|tip The enemies share spawn points, so killing the oozes will spawn more elemental enemies.
collect Heart of the Wild##10286 |n |goto 61.43,36.20
|tip These have a low drop rate.
]])
ZygorGuidesViewer:RegisterGuide("Profession Guides\\Elements\\Farming Guides\\Ichor of Undeath",{
author="support@zygorguides.com",
},[[
step
Kill Highborne enemies around this area
collect Ichor of Undeath##7972 |n |goto Winterspring 52.59,40.68
|tip These have a low drop rate.
You can find more around: |notinsticky
[53.62,42.09]
[56.02,44.24]
]])
ZygorGuidesViewer:RegisterGuide("Profession Guides\\Elements\\Farming Guides\\Heart of Fire",{
author="support@zygorguides.com",
},[[
step
Kill Entropic enemies around this area
collect Heart of Fire##7077 |n |goto Felwood 40.92,40.34
|tip These have a low drop rate.
You can find more around [42.51,37.87]
]])
ZygorGuidesViewer:RegisterGuide("Profession Guides\\Elements\\Farming Guides\\Globe of Water",{
author="support@zygorguides.com",
},[[
step
kill Toxic Horror##7132+
collect Globe of Water##7079 |n |goto Felwood 49.48,23.46
|tip These have a low drop rate.
]])
ZygorGuidesViewer:RegisterGuide("Profession Guides\\Elements\\Farming Guides\\Core of Earth",{
author="support@zygorguides.com",
},[[
step
kill Desert Rumbler##11746+
collect Core of Earth##7075 |n |goto Silithus/0 22.94,12.29
|tip These have a low drop rate.
]])
ZygorGuidesViewer:RegisterGuide("Profession Guides\\Elements\\Farming Guides\\Breath of Wind",{
author="support@zygorguides.com",
},[[
step
kill Dust Stormer##11744+
collect Breath of Wind##7081 |n |goto Silithus/0 31.69,18.15
|tip These have a low drop rate.
You can find more around [21.34,29.92]
]])
ZygorGuidesViewer:RegisterGuide("Profession Guides\\Elements\\Farming Guides\\Elemental Fire",{
author="support@zygorguides.com",
},[[
step
kill Burning Exile##2760+
collect Elemental Fire##7068 |n |goto Arathi Highlands 24.80,29.95
|tip These have a low drop rate.
]])
ZygorGuidesViewer:RegisterGuide("Profession Guides\\Elements\\Farming Guides\\Elemental Earth",{
author="support@zygorguides.com",
},[[
step
Follow the path up |goto Badlands 46.37,77.20
kill Rock Elemental##92+
collect Elemental Earth##7067 |n |goto 43.30,84.24
|tip These have a low drop rate.
]])
ZygorGuidesViewer:RegisterGuide("Profession Guides\\Elements\\Farming Guides\\Elemental Water",{
author="support@zygorguides.com",
},[[
step
kill Cresting Exile##2761+
collect Elemental Water##7070 |n |goto Arathi Highlands 66.70,29.91
|tip These have a low drop rate.
]])
ZygorGuidesViewer:RegisterGuide("Profession Guides\\Elements\\Farming Guides\\Elemental Air",{
author="support@zygorguides.com",
},[[
step
kill Thundering Exile##2762+
collect Elemental Air##7069 |n |goto Arathi Highlands 52.03,50.77
|tip These have a low drop rate.
]])
ZygorGuidesViewer:RegisterGuide("Profession Guides\\Enchanting\\Enchanting (1-375)",{
author="support@zygorguides.com",
condition_suggested=function() return skill("Enchanting") > 0 and skill("Enchanting") < 375 end,
description="This guide will walk you through leveling your Enchanting skill from 1-375.",
},[[
step
Reach Level 5 |ding 5
|tip You must be at least level 5 to train Apprentice professions.
|tip Use the leveling guides to accomplish this.
step
Enter the building |goto Orgrimmar/0 53.42,36.92 < 7 |walk
talk Godan##3345
|tip Inside the building.
Train Apprentice Enchanting |skillmax Enchanting,75 |goto Orgrimmar/0 53.89,38.66
step
Click Here if You Would Like to Collect All Materials First |confirm |next |or
_Or_
Click Here to Collect Materials as You Level or Resume Leveling Enchanting |confirm |next "Begin_Profession_Leveling" |or
'|complete skill("Enchanting") >= 375 |next "Begin_Profession_Leveling" |only if default |or
'|complete skill("Enchanting") >= 385 |next "Begin_Profession_Leveling" |only if BloodElf |or
stickystart "Collect_Soul_Dust_Total"
stickystart "Collect_Vision_Dust_Total"
stickystart "Collect_Dream_Dust_Total"
stickystart "Collect_Illusion_Dust_Total"
step
cast Disenchant##13262
collect 157 Strange Dust##10940 |or
|tip Disenchant level 5-25 uncommon (green) items with Enchanting or purchase them from the auction house.
|tip These totals are approximate.
|tip You may need more or less than the indicated amount.
'|complete skill("Enchanting") >= 101 |only if default |or
'|complete skill("Enchanting") >= 111 |only if BloodElf |or
step
label "Collect_Soul_Dust_Total"
cast Disenchant##13262 |notinsticky
collect 60 Soul Dust##11083 |or
|tip Disenchant level 26-35 uncommon (green) items with Enchanting or purchase them from the auction house.
|tip These totals are approximate. |notinsticky
|tip You may need more or less than the indicated amount. |notinsticky
'|complete skill("Enchanting") >= 165 |only if default |or
'|complete skill("Enchanting") >= 175 |only if BloodElf |or
step
label "Collect_Vision_Dust_Total"
cast Disenchant##13262 |notinsticky
collect 278 Vision Dust##11137 |or
|tip Disenchant level 36-45 uncommon (green) items with Enchanting or purchase them from the auction house.
|tip These totals are approximate. |notinsticky
|tip You may need more or less than the indicated amount. |notinsticky
'|complete skill("Enchanting") >= 250 |only if default |or
'|complete skill("Enchanting") >= 260 |only if BloodElf |or
step
label "Collect_Dream_Dust_Total"
cast Disenchant##13262 |notinsticky
collect 440 Dream Dust##11176 |or
|tip Disenchant level 46-55 uncommon (green) items with Enchanting or purchase them from the auction house.
|tip These totals are approximate. |notinsticky
|tip You may need more or less than the indicated amount. |notinsticky
'|complete skill("Enchanting") >= 294 |only if default |or
'|complete skill("Enchanting") >= 304 |only if BloodElf |or
step
label "Collect_Illusion_Dust_Total"
cast Disenchant##13262 |notinsticky
collect 50 Illusion Dust##16204 |or
|tip Disenchant level 56-60 uncommon (green) items with Enchanting or purchase them from the auction house.
|tip These totals are approximate. |notinsticky
|tip You may need more or less than the indicated amount. |notinsticky
'|complete skill("Enchanting") >= 300 |only if default |or
'|complete skill("Enchanting") >= 310 |only if BloodElf |or
stickystart "Collect_Lesser_Astral_Essence_Total"
stickystart "Collect_Greater_Astral_Essence_Total"
stickystart "Collect_Lesser_Mystic_Essence_Total"
stickystart "Collect_Greater_Mystic_Essence_Total"
stickystart "Collect_Greater_Eternal_Essence_Total"
step
cast Disenchant##13262
collect 12 Greater Magic Essence##10939 |or
|tip Disenchant level 9-15 uncommon (green) armor and level 9-25 uncommon (green) weapons with Enchanting or purchase them from the auction house.
|tip You can combine 3 Lesser Magic Essences to create 1 Greater Magic Essence.
|tip These totals are approximate.
|tip You may need more or less than the indicated amount.
'|complete skill("Enchanting") >= 110 |only if default |or
'|complete skill("Enchanting") >= 120 |only if BloodElf |or
step
label "Collect_Lesser_Astral_Essence_Total"
cast Disenchant##13262 |notinsticky
collect 25 Lesser Astral Essence##10998 |or
|tip Disenchant level 21-25 uncommon (green) items with Enchanting or purchase them from the auction house.
|tip These totals are approximate. |notinsticky
|tip You may need more or less than the indicated amount. |notinsticky
'|complete skill("Enchanting") >= 135 |only if default |or
'|complete skill("Enchanting") >= 145 |only if BloodElf |or
step
label "Collect_Greater_Astral_Essence_Total"
cast Disenchant##13262 |notinsticky
collect 2 Greater Astral Essence##11082 |or
|tip Disenchant level 26-30 uncommon (green) items with Enchanting or purchase them from the auction house.
|tip These totals are approximate. |notinsticky
|tip You may need more or less than the indicated amount. |notinsticky
'|complete skill("Enchanting") >= 151 |only if default |or
'|complete skill("Enchanting") >= 161 |only if BloodElf |or
step
label "Collect_Lesser_Mystic_Essence_Total"
cast Disenchant##13262 |notinsticky
collect 20 Lesser Mystic Essence##11134 |or
|tip Disenchant level 31-35 uncommon (green) items with Enchanting or purchase them from the auction house.
|tip These totals are approximate. |notinsticky
|tip You may need more or less than the indicated amount. |notinsticky
'|complete skill("Enchanting") >= 185 |only if default |or
'|complete skill("Enchanting") >= 195 |only if BloodElf |or
step
label "Collect_Greater_Mystic_Essence_Total"
cast Disenchant##13262 |notinsticky
collect 2 Greater Mystic Essence##11135 |or
|tip Disenchant level 36-40 uncommon (green) items with Enchanting or purchase them from the auction house.
|tip These totals are approximate. |notinsticky
|tip You may need more or less than the indicated amount. |notinsticky
'|complete skill("Enchanting") >= 201 |only if default |or
'|complete skill("Enchanting") >= 211 |only if BloodElf |or
step
label "Collect_Greater_Eternal_Essence_Total"
cast Disenchant##13262 |notinsticky
collect 8 Greater Eternal Essence##16203 |or
|tip Disenchant level 51-56 uncommon (green) items with Enchanting or purchase them from the auction house.
|tip These totals are approximate. |notinsticky
|tip You may need more or less than the indicated amount. |notinsticky
'|complete skill("Enchanting") >= 301 |only if default |or
'|complete skill("Enchanting") >= 311 |only if BloodElf |or
stickystart "Collect_Golden_Rod_Total"
stickystart "Collect_Truesilver_Rod_Total"
stickystart "Collect_Arcanite_Rod_Total"
step
collect 1 Silver Rod##6338 |or
|tip Create it with Blacksmithing or purchase it from the auction house.
|tip It requires 1 Silver bar and 2 Rough Grinding Stones to craft.
'|complete skill("Enchanting") >= 101 |only if default |or
'|complete skill("Enchanting") >= 111 |only if BloodElf |or
step
label "Collect_Golden_Rod_Total"
collect 1 Golden Rod##11128 |or
|tip Create it with Blacksmithing or purchase it from the auction house.
|tip It requires 1 Gold Bar and 2 Coarse Grinding Stones to craft.
'|complete skill("Enchanting") >= 156 |only if default |or
'|complete skill("Enchanting") >= 166 |only if BloodElf |or
step
label "Collect_Truesilver_Rod_Total"
collect 1 Truesilver Rod##11144 |or
|tip Create it with Blacksmithing or purchase it from the auction house.
|tip It requires 1 Truesilver Bar and 1 Heavy Grinding Stones to craft.
'|complete skill("Enchanting") >= 201 |only if default |or
'|complete skill("Enchanting") >= 211 |only if BloodElf |or
step
label "Collect_Arcanite_Rod_Total"
collect 1 Arcanite Rod##16206 |or
|tip Create it with Blacksmithing or purchase it from the auction house.
|tip It requires 3 Arcanite Bars and 1 Dense Grinding Stone to craft.
'|complete skill("Enchanting") >= 295 |only if default |or
'|complete skill("Enchanting") >= 305 |only if BloodElf |or
stickystart "Collect_Iridescent_Pearl_Total"
stickystart "Collect_Black_Pearl_Total"
stickystart "Collect_Golden_Pearl_Total"
stickystart "Collect_Purple_Lotus_Total"
stickystart "Collect_Large_Brilliant_Shard_Total"
step
collect 1 Shadowgem##1210 |or
|tip Farm it with Mining or purchase it from the auction house.
'|complete skill("Enchanting") >= 101 |only if default |or
'|complete skill("Enchanting") >= 111 |only if BloodElf |or
step
label "Collect_Iridescent_Pearl_Total"
collect 1 Iridescent Pearl##5500 |or
|tip Farm it using the "Iridescent Pearl" farming guide or purchase it from the Auction House.
'|complete skill("Enchanting") >= 156 |only if default |or
'|complete skill("Enchanting") >= 166 |only if BloodElf |or
step
label "Collect_Black_Pearl_Total"
collect 1 Black Pearl##7971 |or
|tip Farm it using the "Black Pearl" farming guide or purchase it from the Auction House.
'|complete skill("Enchanting") >= 201 |only if default |or
'|complete skill("Enchanting") >= 211 |only if BloodElf |or
step
label "Collect_Golden_Pearl_Total"
collect 1 Golden Pearl##13926 |or
|tip Farm it using the "Golden Pearl" farming guide or purchase it from the Auction House.
'|complete skill("Enchanting") >= 295 |only if default |or
'|complete skill("Enchanting") >= 305 |only if BloodElf |or
step
label "Collect_Purple_Lotus_Total"
collect 40 Purple Lotus##8831 |or
|tip Farm them with Herbalism or purchase them from the auction house.
|tip These totals are approximate. |notinsticky
|tip You may need more or less than the indicated amount. |notinsticky
'|complete skill("Enchanting") >= 265 |only if default |or
'|complete skill("Enchanting") >= 275 |only if BloodElf |or
step
label "Collect_Large_Brilliant_Shard_Total"
collect 8 Large Brilliant Shard##14344 |or
|tip Disenchant level 51-60 rare (blue) items with Enchanting or purchase them from the auction house.
|tip These totals are approximate. |notinsticky
|tip You may need more or less than the indicated amount. |notinsticky
'|complete skill("Enchanting") >= 301 |only if default |or
'|complete skill("Enchanting") >= 311 |only if BloodElf |or
stickystart "Collect_Adamantite_Rod_Total"
stickystart "Collect_Greater_Planar_Essence_Total"
stickystart "Collect_Arcane_Dust_Total"
stickystart "Collect_Nightmare_Vine_Total"
stickystart "Collect_Primal_Might_Total"
stickystart "Collect_Large_Prismatic_Shard_Total"
step
collect 1 Fel Iron Rod##25843 |or
|tip Create it with Blacksmithing or purchase it from the auction house.
|tip It requires 6 Fel Iron Bars to craft.
'|complete skill("Enchanting") >= 301 |only if default |or
'|complete skill("Enchanting") >= 311 |only if BloodElf |or
step
label "Collect_Adamantite_Rod_Total"
collect 1 Adamantite Rod##25844 |or
|tip Create it with Blacksmithing or purchase it from the auction house.
|tip It requires 10 Adamantite Bars to craft.
'|complete skill("Enchanting") >= 366 |only if default |or
'|complete skill("Enchanting") >= 376 |only if BloodElf |or
step
label "Collect_Greater_Planar_Essence_Total"
cast Disenchant##13262
collect 48 Greater Planar Essence##22446 |or
|tip Disenchant Outland uncommon (green) items with Enchanting or purchase them from the auction house.
|tip These totals are approximate.
|tip You may need more or less than the indicated amount.
'|complete skill("Enchanting") >= 375 |only if default |or
'|complete skill("Enchanting") >= 385 |only if BloodElf |or
step
label "Collect_Arcane_Dust_Total"
cast Disenchant##13262 |notinsticky
collect 718 Arcane Dust##22445 |only if default |or
collect 592 Arcane Dust##22445 |only if BloodElf |or
|tip Disenchant Outland uncommon (green) items with Enchanting or purchase them from the auction house. |notinsticky
|tip These totals are approximate. |notinsticky
|tip You may need more or less than the indicated amount. |notinsticky
'|complete skill("Enchanting") >= 365 |only if default |or
'|complete skill("Enchanting") >= 375 |only if BloodElf |or
step
label "Collect_Nightmare_Vine_Total"
collect 14 Nightmare Vine##22792 |only if default |or
collect 7 Nightmare Vine##22792 |only if BloodElf |or
|tip Farm them with Herbalism or purchase them from the auction house.
|tip These totals are approximate. |notinsticky
|tip You may need more or less than the indicated amount. |notinsticky
'|complete skill("Enchanting") >= 350 |only if default |or
'|complete skill("Enchanting") >= 360 |only if BloodElf |or
step
label "Collect_Primal_Might_Total"
collect 1 Primal Might##23571 |or
|tip Create it with Alchemy or purchase it from the auction house.
|tip It requires 1 Primal Earth, 1 Primal Water, 1 Primal Air, 1 Primal Fire and 1 Primal Mana to craft.
'|complete skill("Enchanting") >= 366 |only if default |or
'|complete skill("Enchanting") >= 376 |only if BloodElf |or
step
label "Collect_Large_Prismatic_Shard_Total"
cast Disenchant##13262 |notinsticky
collect 26 Large Prismatic Shard##22449 |only if default |or
collect 27 Large Prismatic Shard##22449 |only if BloodElf |or
|tip Disenchant Outland rare (blue) items with Enchanting or purchase them from the auction house.
|tip These totals are approximate. |notinsticky
|tip You may need more or less than the indicated amount. |notinsticky
'|complete skill("Enchanting") >= 375 |only if default |or
'|complete skill("Enchanting") >= 385 |only if BloodElf |or
step
label "Begin_Profession_Leveling"
talk Kithas##3346
|tip Inside the building.
buy Copper Rod##6217 |goto 53.87,38.02 |or 3
buy Strange Dust##10940 |goto 53.87,38.02 |or 3
buy Lesser Magic Essence##10938 |goto 53.87,38.02 |or 3
|tip These are limited supply items that can also be purchased from the auction house.
'|complete skill("Enchanting") >= 2 |only if default |or
'|complete skill("Enchanting") >= 12 |only if BloodElf |or
step
create 1 Runed Copper Rod##7421,Enchanting,2 |only if default |or
create 1 Runed Copper Rod##7421,Enchanting,12 |only if BloodElf |or
|tip Save this, you will need it later.
step
cast Disenchant##13262
collect 75 Strange Dust##10940 |or
|tip Disenchant level 5-25 uncommon (green) items with Enchanting or purchase them from the auction house.
'|complete skill("Enchanting") >= 75 |only if default |or
'|complete skill("Enchanting") >= 85 |only if BloodElf |or
step
create 75 Enchant Bracer - Minor Health##7418,Enchanting,75 |only if default |or
create 75 Enchant Bracer - Minor Health##7418,Enchanting,85 |only if BloodElf |or
|tip Place then enchant on a bracer slot item, either equipped or in your inventory.
|tip You may be able to use it on other players' bracers to make some profit while increasing your skill level.
|tip You may need to make a few more or less of these.
|tip Each additional Minor Health enchant requires one Strange Dust.
step
Reach Level 10 |ding 10
|tip You must be at least level 10 to train Journeyman professions.
|tip Use the leveling guides to accomplish this.
step
talk Godan##3345
|tip Inside the building.
Train Journeyman Enchanting |skillmax Enchanting,150 |goto Orgrimmar/0 53.89,38.66
step
talk Godan##3345
|tip Inside the building.
Train Enchant Bracer - Minor Stamina |learn Enchant Bracer - Minor Stamina##7457 |goto Orgrimmar/0 53.89,38.66
step
create 20 Enchant Bracer - Minor Health##7418,Enchanting,90 |only if default |or
create 20 Enchant Bracer - Minor Health##7418,Enchanting,100 |only if BloodElf |or
|tip Place then enchant on a bracer slot item, either equipped or in your inventory.
|tip You may be able to use it on other players' bracers to make some profit while increasing your skill level.
|tip You may need to make a few more or less of these.
|tip Each additional Minor Health enchant requires one Strange Dust.
step
cast Disenchant##13262
collect 30 Strange Dust##10940 |or
|tip Disenchant level 5-25 uncommon (green) items with Enchanting or purchase them from the auction house.
'|complete skill("Enchanting") >= 90 |only if default |or
'|complete skill("Enchanting") >= 90 |or
step
create 10 Enchant Bracer - Minor Stamina##7457,Enchanting,100 |only if default |or
create 10 Enchant Bracer - Minor Stamina##7457,Enchanting,110 |only if BloodElf |or
|tip Place then enchant on a bracer slot item, either equipped or in your inventory.
|tip You may be able to use it on other players' bracers to make some profit while increasing your skill level.
step
talk Godan##3345
|tip Inside the building.
Train Runed Silver Rod |learn Runed Silver Rod##7795 |goto Orgrimmar/0 53.89,38.66
stickystart "Collect_Greater_Magic_Essence_101"
stickystart "Collect_Silver_Rod_101"
stickystart "Collect_Shadowgem_101"
step
cast Disenchant##13262
collect 6 Strange Dust##10940 |or
|tip Disenchant level 5-25 uncommon (green) items with Enchanting or purchase them from the auction house.
'|complete skill("Enchanting") >= 101 |only if default |or
'|complete skill("Enchanting") >= 111 |only if BloodElf |or
step
label "Collect_Greater_Magic_Essence_101"
cast Disenchant##13262 |notinsticky
collect 3 Greater Magic Essence##10939 |or
|tip Disenchant level 9-15 uncommon (green) armor and level 9-25 uncommon (green) weapons with Enchanting or purchase them from the auction house.
|tip You can combine 3 Lesser Magic Essences to create 1 Greater Magic Essence.
'|complete skill("Enchanting") >= 101 |only if default |or
'|complete skill("Enchanting") >= 111 |only if BloodElf |or
step
label "Collect_Silver_Rod_101"
collect 1 Silver Rod##6338 |or
|tip Create it with Blacksmithing or purchase it from the auction house.
|tip It requires 1 Silver bar and 2 Rough Grinding Stones to craft.
'|complete skill("Enchanting") >= 101 |only if default |or
'|complete skill("Enchanting") >= 111 |only if BloodElf |or
step
label "Collect_Shadowgem_101"
collect 1 Shadowgem##1210 |or
|tip Farm it with Mining or purchase it from the auction house.
'|complete skill("Enchanting") >= 101 |only if default |or
'|complete skill("Enchanting") >= 111 |only if BloodElf |or
step
create 1 Runed Silver Rod##7795,Enchanting,101 |only if default |or
create 1 Runed Silver Rod##7795,Enchanting,111 |only if BloodElf |or
|tip Save this, you will need it later.
step
talk Godan##3345
|tip Inside the building.
Train Greater Magic Wand |learn Greater Magic Wand##14807 |goto Orgrimmar/0 53.89,38.66
step
cast Disenchant##13262
collect 9 Greater Magic Essence##10939 |or
|tip Disenchant level 9-15 uncommon (green) armor and level 9-25 uncommon (green) weapons with Enchanting or purchase them from the auction house.
|tip You can combine 3 Lesser Magic Essences to create 1 Greater Magic Essence.
'|complete skill("Enchanting") >= 110 |only if default |or
'|complete skill("Enchanting") >= 120 |only if BloodElf |or
step
Enter the building |goto Orgrimmar 53.42,36.92 < 7 |walk
talk Kithas##3346
|tip Inside the building.
buy 9 Simple Wood##4470 |goto Orgrimmar 53.87,38.02 |or
'|complete skill("Enchanting") >= 110 |only if default |or
'|complete skill("Enchanting") >= 120 |only if BloodElf |or
step
create 9 Greater Magic Wand##14807,Enchanting,110 |only if default |or
create 9 Greater Magic Wand##14807,Enchanting,120 |only if BloodElf |or
step
talk Kulwia##12043
buy Formula: Enchant Cloak - Minor Agility##11039 |goto Stonetalon Mountains 45.39,59.33 |or 2
buy Formula: Enchant Bracer - Lesser Strength##11101 |goto Stonetalon Mountains 45.39,59.33 |or 2
|tip These are limited supply items that can also be purchased from the auction house.
'|complete skill("Enchanting") >= 165 |only if default |or
'|complete skill("Enchanting") >= 175 |only if BloodElf |or
step
use the Formula: Enchant Cloak - Minor Agility##11039
Train Enchant Cloak - Minor Agility |learn Enchant Cloak - Minor Agility##13419
step
cast Disenchant##13262
collect 25 Lesser Astral Essence##10998 |or
|tip Disenchant level 21-25 uncommon (green) items with Enchanting or purchase them from the auction house.
'|complete skill("Enchanting") >= 135 |only if default |or
'|complete skill("Enchanting") >= 145 |only if BloodElf |or
step
create 25 Enchant Cloak - Minor Agility##13419,Enchanting,135 |only if default |or
create 25 Enchant Cloak - Minor Agility##13419,Enchanting,145 |only if BloodElf |or
|tip Place then enchant on a cloak slot item, either equipped or in your inventory.
|tip You may be able to use it on other players' cloak to make some profit while increasing your skill level.
step
Reach Level 20 |ding 20
|tip You must be at least level 20 to train Expert professions.
|tip Use the leveling guides to accomplish this.
step
talk Godan##3345
|tip Inside the building.
Train Expert Enchanting |skillmax Enchanting,225 |goto Orgrimmar/0 53.89,38.66
step
talk Godan##3345
|tip Inside the building.
Train Enchant Bracer - Lesser Stamina |learn Enchant Bracer - Lesser Stamina##13501 |goto Orgrimmar/0 53.89,38.66
step
cast Disenchant##13262
collect 40 Soul Dust##11083 |or
|tip Disenchant level 26-35 uncommon (green) items with Enchanting or purchase them from the auction house.
'|complete skill("Enchanting") >= 155 |only if default |or
'|complete skill("Enchanting") >= 165 |only if BloodElf |or
step
create 20 Enchant Bracer - Lesser Stamina##13501,Enchanting,155 |only if default |or
create 20 Enchant Bracer - Lesser Stamina##13501,Enchanting,165 |only if BloodElf |or
|tip Place then enchant on a bracer slot item, either equipped or in your inventory.
|tip You may be able to use it on other players' bracers to make some profit while increasing your skill level.
step
use the Formula: Enchant Bracer - Lesser Strength##11101
|tip You purchased this in a previous step.
Train Enchant Bracer - Lesser Strength |learn Enchant Bracer - Lesser Strength##13536
step
talk Godan##3345
|tip Inside the building.
Train Runed Golden Rod |learn Runed Golden Rod##13628 |goto Orgrimmar/0 53.89,38.66
stickystart "Collect_Soul_Dust_151"
stickystart "Collect_Golden_Rod_151"
stickystart "Collect_Iridescent_Pearl_151"
step
cast Disenchant##13262
collect 2 Greater Astral Essence##11082 |or
|tip Disenchant level 26-30 uncommon (green) items with Enchanting or purchase them from the auction house.
'|complete skill("Enchanting") >= 156 |only if default |or
'|complete skill("Enchanting") >= 166 |only if BloodElf |or
step
label "Collect_Soul_Dust_151"
cast Disenchant##13262 |notinsticky
collect 2 Soul Dust##11083 |or
|tip Disenchant level 26-35 uncommon (green) items with Enchanting or purchase them from the auction house.
'|complete skill("Enchanting") >= 156 |only if default |or
'|complete skill("Enchanting") >= 166 |only if BloodElf |or
step
label "Collect_Golden_Rod_151"
collect 1 Golden Rod##11128 |or
|tip Create it with Blacksmithing or purchase it from the auction house.
|tip It requires 1 Gold Bar and 2 Coarse Grinding Stones to craft.
'|complete skill("Enchanting") >= 156 |only if default |or
'|complete skill("Enchanting") >= 166 |only if BloodElf |or
step
label "Collect_Iridescent_Pearl_151"
collect 1 Iridescent Pearl##5500 |or
|tip Farm it using the "Iridescent Pearl" farming guide or purchase it from the Auction House.
'|complete skill("Enchanting") >= 156 |only if default |or
'|complete skill("Enchanting") >= 166 |only if BloodElf |or
step
create 1 Runed Golden Rod##13628,Enchanting,156 |only if default |or
create 1 Runed Golden Rod##13628,Enchanting,166 |only if BloodElf |or
|tip Save this, you will need it later.
step
cast Disenchant##13262
collect 18 Soul Dust##11083 |or
|tip Disenchant level 26-35 uncommon (green) items with Enchanting or purchase them from the auction house.
'|complete skill("Enchanting") >= 165 |only if default |or
'|complete skill("Enchanting") >= 175 |only if BloodElf |or
step
create 9 Enchant Bracer - Lesser Strength##13536,Enchanting,165 |only if default |or
create 9 Enchant Bracer - Lesser Strength##13536,Enchanting,175 |only if BloodElf |or
|tip Place then enchant on a bracer slot item, either equipped or in your inventory.
|tip You may be able to use it on other players' bracers to make some profit while increasing your skill level.
step
talk Godan##3345
|tip Inside the building.
Train Enchant Bracer - Spirit |learn Enchant Bracer - Spirit##13642 |goto Orgrimmar/0 53.89,38.66
step
cast Disenchant##13262
collect 20 Lesser Mystic Essence##11134 |or
|tip Disenchant level 31-35 uncommon (green) items with Enchanting or purchase them from the auction house.
'|complete skill("Enchanting") >= 185 |only if default |or
'|complete skill("Enchanting") >= 195 |only if BloodElf |or
step
create 20 Enchant Bracer - Spirit##13642,Enchanting,185 |only if default |or
create 20 Enchant Bracer - Spirit##13642,Enchanting,195 |only if BloodElf |or
|tip Place then enchant on a bracer slot item, either equipped or in your inventory.
|tip You may be able to use it on other players' bracers to make some profit while increasing your skill level.
step
talk Godan##3345
|tip Inside the building.
Train Enchant Bracer - Strength |learn Enchant Bracer - Strength##13661 |goto Orgrimmar/0 53.89,38.66
step
cast Disenchant##13262
collect 15 Vision Dust##11137 |or
|tip Disenchant level 36-45 uncommon (green) items with Enchanting or purchase them from the auction house.
'|complete skill("Enchanting") >= 200 |only if default |or
'|complete skill("Enchanting") >= 210 |only if BloodElf |or
step
create 15 Enchant Bracer - Strength##13661,Enchanting,200 |only if default |or
create 15 Enchant Bracer - Strength##13661,Enchanting,210 |only if BloodElf |or
|tip Place then enchant on a bracer slot item, either equipped or in your inventory.
|tip You may be able to use it on other players' bracers to make some profit while increasing your skill level.
step
talk Godan##3345
|tip Inside the building.
Train Runed Truesilver Rod |learn Runed Truesilver Rod##13702 |goto Orgrimmar/0 53.89,38.66
stickystart "Collect_Greater_Mystic_Essence_201"
stickystart "Collect_Truesilver_Rod_201"
stickystart "Collect_Black_Pearl_201"
step
cast Disenchant##13262
collect 2 Vision Dust##11137 |or
|tip Disenchant level 36-45 uncommon (green) items with Enchanting or purchase them from the auction house.
'|complete skill("Enchanting") >= 201 |only if default |or
'|complete skill("Enchanting") >= 211 |only if BloodElf |or
step
label "Collect_Greater_Mystic_Essence_201"
cast Disenchant##13262 |notinsticky
collect 2 Greater Mystic Essence##11135 |or
|tip Disenchant level 36-40 uncommon (green) items with Enchanting or purchase them from the auction house.
'|complete skill("Enchanting") >= 201 |only if default |or
'|complete skill("Enchanting") >= 211 |only if BloodElf |or
step
label "Collect_Truesilver_Rod_201"
collect 1 Truesilver Rod##11144 |or
|tip Create it with Blacksmithing or purchase it from the auction house.
|tip It requires 1 Truesilver Bar and 1 Heavy Grinding Stones to craft.
'|complete skill("Enchanting") >= 201 |only if default |or
'|complete skill("Enchanting") >= 211 |only if BloodElf |or
step
label "Collect_Black_Pearl_201"
collect 1 Black Pearl##7971 |or
|tip Farm it using the "Black Pearl" farming guide or purchase it from the Auction House.
'|complete skill("Enchanting") >= 201 |only if default |or
'|complete skill("Enchanting") >= 211 |only if BloodElf |or
step
create 1 Runed Truesilver Rod##13702,Enchanting,201 |only if default |or
create 1 Runed Truesilver Rod##13702,Enchanting,211 |only if BloodElf |or
|tip Save this, you will need it later.
step
cast Disenchant##13262
collect 35 Vision Dust##11137 |or
|tip Disenchant level 36-45 uncommon (green) items with Enchanting or purchase them from the auction house.
'|complete skill("Enchanting") >= 220 |only if default |or
'|complete skill("Enchanting") >= 230 |only if BloodElf |or
step
create 35 Enchant Bracer - Strength##13661,Enchanting,220 |only if default |or
create 35 Enchant Bracer - Strength##13661,Enchanting,230 |only if BloodElf |or
|tip Place then enchant on a bracer slot item, either equipped or in your inventory.
|tip You may be able to use it on other players' bracers to make some profit while increasing your skill level.
|tip You may need to make a few more or less of these.
|tip Each additional Strength enchant requires one Vision Dust.
step
talk Godan##3345
|tip Inside the building.
Train Enchant Cloak - Greater Defense |learn Enchant Cloak - Greater Defense##13746 |goto Orgrimmar/0 53.89,38.66
step
cast Disenchant##13262
collect 15 Vision Dust##11137 |or
|tip Disenchant level 36-45 uncommon (green) items with Enchanting or purchase them from the auction house.
'|complete skill("Enchanting") >= 225 |only if default |or
'|complete skill("Enchanting") >= 235 |only if BloodElf |or
step
create 5 Enchant Cloak - Greater Defense##13746,Enchanting,225 |only if default |or
create 5 Enchant Cloak - Greater Defense##13746,Enchanting,235 |only if BloodElf |or
|tip Place then enchant on a cloak slot item, either equipped or in your inventory.
|tip You may be able to use it on other players' cloak to make some profit while increasing your skill level.
step
Reach Level 35 |ding 35
|tip You must be at least level 35 to train Artisan professions.
|tip Use the leveling guides to accomplish this.
step
talk Godan##3345
|tip Inside the building.
Train Artisan Enchanting |skillmax Enchanting,300 |goto Orgrimmar/0 53.89,38.66
step
cast Disenchant##13262
collect 36 Vision Dust##11137 |or
|tip Disenchant level 36-45 uncommon (green) items with Enchanting or purchase them from the auction house.
'|complete skill("Enchanting") >= 230 |only if default |or
'|complete skill("Enchanting") >= 240 |only if BloodElf |or
step
create 12 Enchant Cloak - Greater Defense##13746,Enchanting,230 |only if default |or
create 12 Enchant Cloak - Greater Defense##13746,Enchanting,240 |only if BloodElf |or
|tip Place then enchant on a cloak slot item, either equipped or in your inventory.
|tip You may be able to use it on other players' cloak to make some profit while increasing your skill level.
|tip You may need to make a few more or less of these.
|tip Each additional Greater Defense enchant requires three Vision Dust.
step
talk Godan##3345
|tip Inside the building.
Train Enchant Boots - Stamina |learn Enchant Boots - Stamina##13836 |goto Orgrimmar/0 53.89,38.66
step
cast Disenchant##13262
collect 25 Vision Dust##11137 |or
|tip Disenchant level 36-45 uncommon (green) items with Enchanting or purchase them from the auction house.
'|complete skill("Enchanting") >= 235 |only if default |or
'|complete skill("Enchanting") >= 245 |only if BloodElf |or
step
create 5 Enchant Boots - Stamina##13836,Enchanting,235 |only if default |or
create 5 Enchant Boots - Stamina##13836,Enchanting,245 |only if BloodElf |or
|tip Place then enchant on a boot slot item, either equipped or in your inventory.
|tip You may be able to use it on other players' boots to make some profit while increasing your skill level.
step
talk Godan##3345
|tip Inside the building.
Train Enchant Chest - Superior Health |learn Enchant Chest - Superior Health##13858 |goto Orgrimmar/0 53.89,38.66
step
cast Disenchant##13262
collect 150 Vision Dust##11137 |or
|tip Disenchant level 36-45 uncommon (green) items with Enchanting or purchase them from the auction house.
'|complete skill("Enchanting") >= 250 |only if default |or
'|complete skill("Enchanting") >= 260 |only if BloodElf |or
step
create 25 Enchant Chest - Superior Health##13858,Enchanting,250 |only if default |or
create 25 Enchant Chest - Superior Health##13858,Enchanting,260 |only if BloodElf |or
|tip Place then enchant on a chest slot item, either equipped or in your inventory.
|tip You may be able to use it on other players' chest to make some profit while increasing your skill level.
|tip You may need to make a few more or less of these.
|tip Each additional Superior Health enchant requires six Vision Dust.
step
talk Kania##15419
|tip Upstairs inside the building.
buy Formula: Lesser Mana Oil##20754 |goto Silithus 52.0,39.6 |or
'|complete skill("Enchanting") >= 265 |only if default |or
'|complete skill("Enchanting") >= 275 |only if BloodElf |or
step
use the Formula: Lesser Mana Oil##20754
Learn Lesser Mana Oil |learn Lesser Mana Oil##25135
stickystart "Collect_Purple_Lotus_265"
step
cast Disenchant##13262
collect 60 Dream Dust##11176 |or
|tip Disenchant level 46-55 uncommon (green) items with Enchanting or purchase them from the auction house.
'|complete skill("Enchanting") >= 265 |only if default |or
'|complete skill("Enchanting") >= 275 |only if BloodElf |or
step
label "Collect_Purple_Lotus_265"
collect 40 Purple Lotus##8831 |or
|tip Farm them with Herbalism or purchase them from the auction house.
'|complete skill("Enchanting") >= 265 |only if default |or
'|complete skill("Enchanting") >= 275 |only if BloodElf |or
step
talk Daniel Bartlett##4561
buy 20 Crystal Vial##8925 |goto Undercity 64.05,37.37 |or
'|complete skill("Enchanting") >= 265 |only if default |or
'|complete skill("Enchanting") >= 275 |only if BloodElf |or
step
create 20 Lesser Mana Oil##25135,Enchanting,265 |only if default |or
create 20 Lesser Mana Oil##25135,Enchanting,275 |only if BloodElf |or
|tip You may need to make a few more or less of these.
|tip Each additional Lesser Mana Oil requires three Dream Dust, two Purple Lotus, and one Crystal Vial.
step
talk Daniel Bartlett##4561
buy Formula: Enchant Shield - Greater Stamina##16217 |goto 64.05,37.37 |or
|tip This is a limited supply item that cannot be purchased from the auction house.
|tip If he doesn't have it for sale, you will have to wait.
'|complete skill("Enchanting") >= 294 |only if default |or
'|complete skill("Enchanting") >= 304 |only if BloodElf |or
step
use the Formula: Enchant Shield - Greater Stamina##16217
Learn Enchant Shield - Greater Stamina |learn Enchant Shield - Greater Stamina##20017
step
cast Disenchant##13262
collect 380 Dream Dust##11176 |or
|tip Disenchant level 46-55 uncommon (green) items with Enchanting or purchase them from the auction house.
'|complete skill("Enchanting") >= 294 |only if default |or
'|complete skill("Enchanting") >= 304 |only if BloodElf |or
step
create 30 Enchant Shield - Greater Stamina##20017,Enchanting,294 |only if default |or
create 30 Enchant Shield - Greater Stamina##20017,Enchanting,304 |only if BloodElf |or
|tip Place then enchant on a shield slot item, either equipped or in your inventory.
|tip You may be able to use it on other players' shield to make some profit while increasing your skill level.
|tip You may need to make a few more or less of these.
|tip Each additional Greater Stamina enchant requires ten Dream Dust.
step
Follow the road |goto Moonglade 40.25,37.05 < 30 |only if walking
talk Lorelae Wintersong##12022
|tip Inside the building.
buy Formula: Enchant Cloak - Superior Defense##16224 |goto Moonglade 48.24,40.14 |or 2
buy Formula: Runed Arcanite Rod##16243 |goto Moonglade 48.24,40.14 |or 2
|tip These are limited supply items that can also be purchased from the auction house.
'|complete skill("Enchanting") >= 300 |only if default |or
'|complete skill("Enchanting") >= 310 |only if BloodElf |or
step
use the Formula: Enchant Cloak - Superior Defense##16224
Learn Enchant Cloak - Superior Defense |learn Enchant Cloak - Superior Defense##20015
step
use the Formula: Runed Arcanite Rod##16243
Learn Runed Arcanite Rod |learn Runed Arcanite Rod##20051
stickystart "Collect_Greater_Eternal_Essence_295"
stickystart "Collect_Large_Brilliant_Shard_295"
stickystart "Collect_Arcanite_Rod_295"
stickystart "Collect_Golden_Pearl_295"
step
cast Disenchant##13262
collect 10 Illusion Dust##16204 |or
|tip Disenchant level 56-60 uncommon (green) items with Enchanting or purchase them from the auction house.
'|complete skill("Enchanting") >= 295 |only if default |or
'|complete skill("Enchanting") >= 305 |only if BloodElf |or
step
label "Collect_Greater_Eternal_Essence_295"
cast Disenchant##13262 |notinsticky
collect 4 Greater Eternal Essence##16203 |or
|tip Disenchant level 51-56 uncommon (green) items with Enchanting or purchase them from the auction house.
'|complete skill("Enchanting") >= 295 |only if default |or
'|complete skill("Enchanting") >= 305 |only if BloodElf |or
step
label "Collect_Large_Brilliant_Shard_295"
cast Disenchant##13262 |notinsticky
collect 2 Large Brilliant Shard##14344 |or
|tip Disenchant level 51-60 rare (blue) items with Enchanting or purchase them from the auction house.
'|complete skill("Enchanting") >= 295 |only if default |or
'|complete skill("Enchanting") >= 305 |only if BloodElf |or
step
label "Collect_Arcanite_Rod_295"
collect 1 Arcanite Rod##16206 |or
|tip Create it with Blacksmithing or purchase it from the auction house.
|tip It requires 3 Arcanite Bars and 1 Dense Grinding Stone to craft.
'|complete skill("Enchanting") >= 295 |only if default |or
'|complete skill("Enchanting") >= 305 |only if BloodElf |or
step
label "Collect_Golden_Pearl_295"
collect 1 Golden Pearl##13926 |or
|tip Farm it using the "Golden Pearl" farming guide or purchase it from the Auction House.
'|complete skill("Enchanting") >= 295 |only if default |or
'|complete skill("Enchanting") >= 305 |only if BloodElf |or
step
create 1 Runed Arcanite Rod##20051,Enchanting,295 |only if default |or
create 1 Runed Arcanite Rod##20051,Enchanting,305 |only if BloodElf |or
|tip Save this, you will need it later.
step
cast Disenchant##13262
collect 40 Illusion Dust##16204 |or
|tip Disenchant level 56-60 uncommon (green) items with Enchanting or purchase them from the auction house.
'|complete skill("Enchanting") >= 300 |only if default |or
'|complete skill("Enchanting") >= 310 |only if BloodElf |or
step
create 5 Enchant Cloak - Superior Defense##20015,Enchanting,300 |only if default |or
create 5 Enchant Cloak - Superior Defense##20015,Enchanting,310 |only if BloodElf |or
|tip Place then enchant on a cloak slot item, either equipped or in your inventory.
|tip You may be able to use it on other players' cloak to make some profit while increasing your skill level.
step
Reach Level 50 |ding 50
|tip You must be at least level 50 to train Master professions.
|tip Use the leveling guides to accomplish this.
step
talk Felannia##18753
|tip Inside the building.
Train Master Enchanting |skillmax Enchanting,375 |goto Hellfire Peninsula/0 52.2,36.0
step
talk Felannia##18753
|tip Inside the building.
Train Runed Fel Iron Rod |learn Runed Fel Iron Rod##32664 |goto 52.2,36.0
step
talk Felannia##18753
|tip Inside the building.
Train Enchant Bracer - Assault |learn Enchant Bracer - Assault##34002 |goto 52.2,36.0
stickystart "Collect_Greater_Eternal_Essence_301"
stickystart "Collect_Large_Brilliant_Shard_301"
step
collect 1 Fel Iron Rod##25843 |or
|tip Create it with Blacksmithing or purchase it from the auction house.
|tip It requires 6 Fel Iron Bars to craft.
'|complete skill("Enchanting") >= 301 |only if default |or
'|complete skill("Enchanting") >= 311 |only if BloodElf |or
step
label "Collect_Greater_Eternal_Essence_301"
cast Disenchant##13262 |notinsticky
collect 4 Greater Eternal Essence##16203 |or
|tip Disenchant level 51-56 uncommon (green) items with Enchanting or purchase them from the auction house.
'|complete skill("Enchanting") >= 301 |only if default |or
'|complete skill("Enchanting") >= 311 |only if BloodElf |or
step
label "Collect_Large_Brilliant_Shard_301"
cast Disenchant##13262 |notinsticky
collect 6 Large Brilliant Shard##14344 |or
|tip Disenchant level 51-60 rare (blue) items with Enchanting or purchase them from the auction house.
'|complete skill("Enchanting") >= 301 |only if default |or
'|complete skill("Enchanting") >= 311 |only if BloodElf |or
step
create 1 Runed Fel Iron Rod##32664,Enchanting,301 |only if default
create 1 Runed Fel Iron Rod##32664,Enchanting,311 |only if BloodElf
|tip Save this, you will need it for future steps.
step
cast Disenchant##13262
collect 54 Arcane Dust##22445 |or
|tip Disenchant Outland uncommon (green) items with Enchanting or purchase them from the auction house.
'|complete skill("Enchanting") >= 301 |only if default |or
'|complete skill("Enchanting") >= 311 |only if BloodElf |or
step
create 9 Enchant Bracer - Assault##34002,Enchanting,310 |only if default
create 9 Enchant Bracer - Assault##34002,Enchanting,320 |only if BloodElf
|tip Place then enchant on a bracer slot item, either equipped or in your inventory.
|tip You may be able to use it on other players' bracers to make some profit while increasing your skill level.
step
talk Felannia##18753
|tip Inside the building.
Train Enchant Bracer - Brawn |learn Enchant Bracer - Brawn##27899 |goto 52.2,36.0
step
cast Disenchant##13262
collect 48 Arcane Dust##22445 |or
|tip Disenchant Outland uncommon (green) items with Enchanting or purchase them from the auction house.
'|complete skill("Enchanting") >= 316 |only if default |or
'|complete skill("Enchanting") >= 326 |only if BloodElf |or
step
create 8 Enchant Bracer - Brawn##27899,Enchanting,316 |only if default
create 8 Enchant Bracer - Brawn##27899,Enchanting,326 |only if BloodElf
|tip Place then enchant on a bracer slot item, either equipped or in your inventory.
|tip You may be able to use it on other players' bracers to make some profit while increasing your skill level.
|tip You may need to create more or less of these.
|tip Each additional Brawn enchant requires 6 Arcane Dust.
step
talk Felannia##18753
|tip Inside the building.
Train Enchant Gloves - Assault |learn Enchant Gloves - Assault##33996 |goto 52.2,36.0
step
cast Disenchant##13262
collect 128 Arcane Dust##22445 |only if default |or
collect 80 Arcane Dust##22445 |only if BloodElf |or
|tip Disenchant Outland uncommon (green) items with Enchanting or purchase them from the auction house.
'|complete skill("Enchanting") >= 330 |only if default |or
'|complete skill("Enchanting") >= 335 |only if BloodElf |or
step
create 16 Enchant Gloves - Assault##33996,Enchanting,330 |only if default
create 10 Enchant Gloves - Assault##33996,Enchanting,335 |only if BloodElf
|tip Place then enchant on a glove slot item, either equipped or in your inventory.
|tip You may be able to use it on other players' glove to make some profit while increasing your skill level.
|tip You may need to create more or less of these.
|tip Each additional Assault enchant requires 8 Arcane Dust.
step
talk Madame Ruby##19663
buy Formula: Enchant Shield - Major Stamina##28282 |goto Shattrath City/0 63.2,70.6 |or 2
buy Formula: Superior Wizard Oil##22563 |goto Shattrath City/0 63.2,70.6 |or 2
'|complete skill("Enchanting") >= 350 |or
|only if not BloodElf
step
talk Madame Ruby##19663
buy Formula: Enchant Shield - Major Stamina##28282 |goto Shattrath City/0 63.2,70.6 |or 3
buy Formula: Large Prismatic Shard##22565 |goto Shattrath City/0 63.2,70.6 |or 3
buy Formula: Superior Wizard Oil##22563 |goto Shattrath City/0 63.2,70.6 |or 3
'|complete skill("Enchanting") >= 360 |or
|only if BloodElf
step
use the Formula: Enchant Shield - Major Stamina##28282
|tip You purchased this in a previous step.
Learn Enchant Shield - Major Stamina |learn Enchant Shield - Major Stamina##34009
step
cast Disenchant##13262
collect 180 Arcane Dust##22445 |or
|tip Disenchant Outland uncommon (green) items with Enchanting or purchase them from the auction house.
'|complete skill("Enchanting") >= 340 |or
|only if not BloodElf
step
create 12 Enchant Shield - Major Stamina##34009,Enchanting,340
|tip Place then enchant on a shield slot item, either equipped or in your inventory.
|tip You may be able to use it on other players' shield to make some profit while increasing your skill level.
|tip You may need to create more or less of these.
|tip Each additional Major Stamina enchant requires 15 Arcane Dust.
|only if not BloodElf
step
talk Felannia##18753
|tip Inside the building.
Train Small Prismatic Shard |learn Small Prismatic Shard##42615 |goto Hellfire Peninsula/0 52.2,36.0
|only if BloodElf
step
use the Formula: Large Prismatic Shard##22565
|tip You purchased this in a previous step.
Learn Large Prismatic Shard |learn Large Prismatic Shard##28022
|only if BloodElf
step
cast Disenchant##13262
collect 1 Large Prismatic Shard##22449 |or
|tip Disenchant Outland rare (blue) items with Enchanting or purchase it from the auction house.
_Or_
collect 3 Small Prismatic Shard##22448 |or
|tip Disenchant Outland rare (blue) items with Enchanting or purchase them from the auction house.
|tip You will be converting these back and forth, so it doesn't matter which one you have.
'|complete skill("Enchanting") >= 345 |or
|only if BloodElf
step
create 1 Small Prismatic Shard##42615,Enchanting,345
create 1 Large Prismatic Shard##28022,Enchanting,345
|tip Convert the shard(s) you have back and forth between Large and Small.
|tip This may take a while, but it will save you some gold.
|only if BloodElf
step
cast Disenchant##13262
collect 105 Arcane Dust##22445 |or
|tip Disenchant Outland uncommon (green) items with Enchanting or purchase them from the auction house.
'|complete skill("Enchanting") >= 350 |or
|only if BloodElf
step
create 7 Enchant Shield - Major Stamina##34009,Enchanting,350
|tip Place then enchant on a shield slot item, either equipped or in your inventory.
|tip You may be able to use it on other players' shield to make some profit while increasing your skill level.
|tip You may need to create more or less of these.
|tip Each additional Major Stamina enchant requires 15 Arcane Dust.
|only if BloodElf
step
use Formula: Superior Wizard Oil##22563
|tip You purchased this in a previous step.
Train Superior Wizard Oil |learn Superior Wizard Oil##22522
stickystart "Collect_Nightmare_Vine_350"
step
cast Disenchant##13262
collect 42 Arcane Dust##22445 |or
|tip Disenchant Outland uncommon (green) items with Enchanting or purchase them from the auction house.
'|complete skill("Enchanting") >= 350 |only if default |or
'|complete skill("Enchanting") >= 360 |only if BloodElf |or
step
label "Collect_Nightmare_Vine_350"
cast Disenchant##13262 |notinsticky
collect 14 Nightmare Vine##22792 |or
|tip Farm them with Herbalism or purchase them from the auction house.
'|complete skill("Enchanting") >= 350 |only if default |or
'|complete skill("Enchanting") >= 360 |only if BloodElf |or
step
talk Ernie Packwell##19194
buy 14 Imbued Vial##18256 |goto Shattrath City/0 66.6,65.0 |or
'|complete skill("Enchanting") >= 350 |only if default |or
'|complete skill("Enchanting") >= 360 |only if BloodElf |or
step
create 14 Superior Wizard Oil##22522,Enchanting,350 |only if default
create 14 Superior Wizard Oil##22522,Enchanting,360 |only if BloodElf
|tip You may need to create more or less of these.
|tip Each additional Superior Wizard Oil requires 3 Arcane Dust, 1 Nightmare Vine, and 1 Imbued Vial.
step
talk Felannia##18753
|tip Inside the building.
Train Enchant Gloves - Major Strength |learn Enchant Gloves - Major Strength##33995 |goto Hellfire Peninsula/0 52.2,36.0
stickystart "Collect_Greater_Planar_Essence_365"
step
cast Disenchant##13262
collect 264 Arcane Dust##22445 |or
|tip Disenchant Outland uncommon (green) items with Enchanting or purchase them from the auction house.
'|complete skill("Enchanting") >= 365 |only if default |or
'|complete skill("Enchanting") >= 375 |only if BloodElf |or
step
label "Collect_Greater_Planar_Essence_365"
cast Disenchant##13262 |notinsticky
collect 22 Greater Planar Essence##22446 |or
|tip Disenchant Outland uncommon (green) items with Enchanting or purchase them from the auction house.
'|complete skill("Enchanting") >= 365 |only if default |or
'|complete skill("Enchanting") >= 375 |only if BloodElf |or
step
create 22 Enchant Gloves - Major Strength##33995,Enchanting,365 |only if default
create 22 Enchant Gloves - Major Strength##33995,Enchanting,375 |only if BloodElf
|tip Place then enchant on a glove slot item, either equipped or in your inventory.
|tip You may be able to use it on other players' glove to make some profit while increasing your skill level.
|tip You may need to create more or less of these.
|tip Each additional Major Strength enchant requires 12 Arcane Dust and 1 Greater Planar Essence.
step
talk Rungor##18960
buy Formula: Runed Adamantite Rod##25848 |goto Terokkar Forest/0 48.8,46.0 |or
'|complete skill("Enchanting") >= 366 |only if default |or
'|complete skill("Enchanting") >= 376 |only if BloodElf |or
step
use the Formula: Runed Adamantite Rod##25848
|tip You purchased this in a previous step.
Train Runed Adamantite Rod |learn Runed Adamantite Rod##32665
stickystart "Collect_Primal_Might_366"
stickystart "Collect_Greater_Planar_Essence_366"
stickystart "Collect_Large_Prismatic_Shard_366"
step
cast Disenchant##13262
collect 1 Adamantite Rod##25844 |or
|tip Create it with Blacksmithing or purchase it from the auction house.
|tip It requires 10 Adamantite Bars to craft.
'|complete skill("Enchanting") >= 366 |only if default |or
'|complete skill("Enchanting") >= 376 |only if BloodElf |or
step
label "Collect_Primal_Might_366"
cast Disenchant##13262 |notinsticky
collect 1 Primal Might##23571 |or
|tip Create it with Alchemy or purchase it from the auction house.
|tip It requires 1 Primal Earth, 1 Primal Water, 1 Primal Air, 1 Primal Fire and 1 Primal Mana to craft.
'|complete skill("Enchanting") >= 366 |only if default |or
'|complete skill("Enchanting") >= 376 |only if BloodElf |or
step
label "Collect_Greater_Planar_Essence_366"
cast Disenchant##13262 |notinsticky
collect 8 Greater Planar Essence##22446 |or
|tip Disenchant Outland uncommon (green) items with Enchanting or purchase them from the auction house.
'|complete skill("Enchanting") >= 366 |only if default |or
'|complete skill("Enchanting") >= 376 |only if BloodElf |or
step
label "Collect_Large_Prismatic_Shard_366"
cast Disenchant##13262 |notinsticky
collect 8 Large Prismatic Shard##22449 |or
|tip Disenchant Outland rare (blue) items with Enchanting or purchase them from the auction house.
'|complete skill("Enchanting") >= 366 |only if default |or
'|complete skill("Enchanting") >= 376 |only if BloodElf |or
step
create 1 Runed Adamantite Rod##32665,Enchanting,366 |only if default
create 1 Runed Adamantite Rod##32665,Enchanting,376 |only if BloodElf
step
Reach Honored Reputation with the Keepers of Time |complete rep('Keepers of Time') >= Honored
|tip Refer to the "Keepers of Time" reputation guide to accomplish this.
step
talk Alurmi##21643
buy Formula: Enchant Ring - Spellpower##22536 |goto Tanaris/0 63.58,57.64 |or
'|complete skill("Enchanting") >= 375 |only if default |or
'|complete skill("Enchanting") >= 385 |only if BloodElf |or
step
use the Formula: Enchant Ring - Spellpower##22536
|tip You purchased this in a previous step.
Learn Enchant Ring - Spellpower |learn Enchant Ring - Spellpower##27924
stickystart "Collect_Greater_Planar_Essence_375"
step
cast Disenchant##13262
collect 18 Large Prismatic Shard##22449 |or
|tip Disenchant Outland rare (blue) items with Enchanting or purchase them from the auction house.
'|complete skill("Enchanting") >= 375 |only if default |or
'|complete skill("Enchanting") >= 385 |only if BloodElf |or
step
label "Collect_Greater_Planar_Essence_375"
cast Disenchant##13262 |notinsticky
collect 18 Greater Planar Essence##22446 |or
|tip Disenchant Outland uncommon (green) items with Enchanting or purchase them from the auction house.
'|complete skill("Enchanting") >= 375 |only if default |or
'|complete skill("Enchanting") >= 385 |only if BloodElf |or
step
create 9 Enchant Ring - Spellpower##27924,Enchanting,375 |only if default
create 9 Enchant Ring - Spellpower##27924,Enchanting,385 |only if BloodElf
|tip Place then enchant on a ring slot item, either equipped or in your inventory.
|tip You may be able to use it on other players' ring to make some profit while increasing your skill level.
|tip You may need to create more or less of these.
|tip Each additional Spellpower enchant requires 1 Large Prismatic Shard and 1 Greater Planar Essence.
step
_Congratulations!_
You Reached 375 Enchanting Skill. |only if default
You Reached 385 Enchanting Skill. |only if BloodElf
]])
ZygorGuidesViewer:RegisterGuide("Profession Guides\\Enchanting\\Farming Guides\\Strange Dust",{
author="support@zygorguides.com",
},[[
step
Disenchant level 5-20 green weapons and armor
|tip You can disenchant old gear or buy some off the Auction House.
|tip You may sometimes get Small Glimmering Shards instead of Strange Dust.
collect Strange Dust##10940 |n
]])
ZygorGuidesViewer:RegisterGuide("Profession Guides\\Enchanting\\Farming Guides\\Lesser Magic Essence",{
author="support@zygorguides.com",
},[[
step
Disenchant level 3-12 green weapons and armor
|tip You can disenchant old gear or buy some off the Auction House.
|tip You may sometimes get Strange Dust instead of Lesser Magic Essence.
collect Lesser Magic Essence##10938 |n
]])
ZygorGuidesViewer:RegisterGuide("Profession Guides\\Enchanting\\Farming Guides\\Greater Magic Essence",{
author="support@zygorguides.com",
},[[
step
Disenchant level 9-21 green weapons and armor
|tip You can disenchant old gear or buy some off the Auction House.
|tip You may sometimes get Strange Dust instead of Greater Magic Essence.
|tip You can turn 3 Lesser Magic Essences into a Greater Magic Essence.
collect Greater Magic Essence##10939 |n
]])
ZygorGuidesViewer:RegisterGuide("Profession Guides\\Enchanting\\Farming Guides\\Lesser Eternal Essence",{
author="support@zygorguides.com",
},[[
step
Disenchant level 40-50 green weapons and armor
|tip You can disenchant old gear or buy some off the Auction House.
|tip You may sometimes get Dream Dust instead of Lesser Eternal Essence.
collect Lesser Eternal Essence##16202 |n
]])
ZygorGuidesViewer:RegisterGuide("Profession Guides\\Enchanting\\Farming Guides\\Greater Eternal Essence",{
author="support@zygorguides.com",
},[[
step
Disenchant level 45-60 green weapons and armor
|tip You can disenchant old gear or buy some off the Auction House.
|tip You may sometimes get Illusion Dust instead of Greater Eternal Essence.
|tip You can turn 3 Lesser Eternal Essences into a Greater Eternal Essence.
collect Greater Eternal Essence##16203 |n
]])
ZygorGuidesViewer:RegisterGuide("Profession Guides\\Enchanting\\Farming Guides\\Small Brilliant Shard",{
author="support@zygorguides.com",
},[[
step
Disenchant level 38-50 blue and green weapons and armor
|tip You can disenchant old gear or buy some off the Auction House.
|tip You may sometimes get Dream Dust instead of Small Brilliant Shards.
collect Small Brilliant Shard##14343 |n
]])
ZygorGuidesViewer:RegisterGuide("Profession Guides\\Enchanting\\Farming Guides\\Large Brilliant Shard",{
author="support@zygorguides.com",
},[[
step
Disenchant level 50-58 blue weapons and armor
|tip You can disenchant old gear or buy some off the Auction House.
|tip You may very rarely get Nexus Crystals instead of Large Brilliant Shards.
collect Large Brilliant Shard##14344 |n
]])
ZygorGuidesViewer:RegisterGuide("Profession Guides\\Enchanting\\Farming Guides\\Illusion Dust",{
author="support@zygorguides.com",
},[[
step
Disenchant level 45-60 green weapons and armor
|tip You can disenchant old gear or buy some off the Auction House.
|tip You may sometimes get Greater Eternal Essence instead of Illusion Dust.
collect Illusion Dust##16204 |n
]])
ZygorGuidesViewer:RegisterGuide("Profession Guides\\Enchanting\\Farming Guides\\Lesser Astral Essence",{
author="support@zygorguides.com",
},[[
step
Disenchant level 20-25 green weapons and armor
|tip You can disenchant old gear or buy some off the Auction House.
collect Lesser Astral Essence##10998 |n
]])
ZygorGuidesViewer:RegisterGuide("Profession Guides\\Enchanting\\Farming Guides\\Greater Astral Essence",{
author="support@zygorguides.com",
},[[
step
Disenchant level 20-30 green weapons and armor
|tip You can disenchant old gear or buy some off the Auction House.
collect Greater Astral Essence##11082 |n
]])
ZygorGuidesViewer:RegisterGuide("Profession Guides\\Enchanting\\Farming Guides\\Soul Dust",{
author="support@zygorguides.com",
},[[
step
Disenchant level 25-35 green weapons and armor
|tip You can disenchant old gear or buy some off the Auction House.
collect Soul Dust##11083 |n
]])
ZygorGuidesViewer:RegisterGuide("Profession Guides\\Enchanting\\Farming Guides\\Lesser Mystic Essence",{
author="support@zygorguides.com",
},[[
step
Disenchant level 30-35 green weapons and armor
|tip You can disenchant old gear or buy some off the Auction House.
collect Lesser Mystic Essence##11134 |n
]])
ZygorGuidesViewer:RegisterGuide("Profession Guides\\Enchanting\\Farming Guides\\Greater Mystic Essence",{
author="support@zygorguides.com",
},[[
step
Disenchant level 35-40 green weapons and armor
|tip You can disenchant old gear or buy some off the Auction House.
collect Greater Mystic Essence##11135 |n
]])
ZygorGuidesViewer:RegisterGuide("Profession Guides\\Enchanting\\Farming Guides\\Vision Dust",{
author="support@zygorguides.com",
},[[
step
Disenchant level 35-45 green weapons and armor
|tip You can disenchant old gear or buy some off the Auction House.
collect Vision Dust##11137 |n
]])
ZygorGuidesViewer:RegisterGuide("Profession Guides\\Enchanting\\Farming Guides\\Dream Dust",{
author="support@zygorguides.com",
},[[
step
Disenchant level 45-55 green weapons and armor
|tip You can disenchant old gear or buy some off the Auction House.
collect Dream Dust##11176 |n
]])
ZygorGuidesViewer:RegisterGuide("Profession Guides\\Enchanting\\Farming Guides\\Greater Nether Essence",{
author="support@zygorguides.com",
},[[
step
Disenchant level 45-50 green weapons and armor
|tip You can disenchant old gear or buy some off the Auction House.
collect Greater Nether Essence##11175 |n
]])
ZygorGuidesViewer:RegisterGuide("Profession Guides\\Enchanting\\Farming Guides\\Lesser Nether Essence",{
author="support@zygorguides.com",
},[[
step
Disenchant level 40-45 green weapons and armor
|tip You can disenchant old gear or buy some off the Auction House.
collect Lesser Nether Essence##11174 |n
]])
ZygorGuidesViewer:RegisterGuide("Profession Guides\\Engineering\\Engineering (1-375)",{
author="support@zygorguides.com",
condition_suggested=function() return skill("Engineering") > 0 and skill("Engineering") < 375 end,
description="This guide will walk you through leveling your Engineering skill from 1-375.",
},[[
step
Reach Level 5 |ding 5
|tip You must be at least level 5 to train Apprentice professions.
|tip Use the leveling guides to accomplish this.
step
Enter the building |goto Orgrimmar/0 75.19,24.59 < 5 |walk
talk Roxxik##11017
|tip Inside the building.
Train Apprentice Engineering |skillmax Engineering,75 |goto Orgrimmar/0 76.18,25.18
step
Click Here if You Would Like to Collect All Materials First |confirm |next |or
_Or_
Click Here to Collect Materials as You Level or Resume Leveling Engineering |confirm |next "Begin_Profession_Leveling" |or
'|complete skill("Engineering") >= 375 |or |next "Begin_Profession_Leveling"
stickystart "Collect_Coarse_Stone_Total"
stickystart "Collect_Heavy_Stone_Total"
stickystart "Collect_Dense_Stone_Total"
stickystart "Collect_Moss_Agate_Total"
stickystart "Collect_Medium_Leather_Total"
step
map Durotar
path follow smart; loop on; ants curved; dist 20
path	50.96,17.00	52.99,18.09	54.60,19.05	55.40,21.06	55.71,23.38
path	56.28,25.33	55.89,27.78	54.64,27.62	55.10,30.09	58.12,29.94
path	55.62,32.75	55.97,36.63	55.71,40.53	57.32,42.00	59.26,41.50
path	57.59,43.98	55.27,48.14	50.81,48.20	48.51,43.33	47.83,39.78
path	46.87,34.69	45.55,32.24	45.61,27.19	46.52,23.35	48.07,21.59
path	49.70,21.37	49.54,18.59
Click ore as you follow the path around this area
|tip Track them on your minimap with "Find Minerals".
collect 60 Rough Stone##2835 |or
|tip Farm them with Mining or purchase them from the auction house.
|tip These totals are approximate.
|tip You may need more or less than the indicated amount.
'|complete skill("Engineering") >= 30 |or
step
label "Collect_Coarse_Stone_Total"
map The Barrens
path follow smart; loop on; ants curved; dist 20
path	59.10,40.30	60.19,40.99	61.84,40.54	62.14,43.04	62.65,46.75
path	61.30,50.02	60.46,50.11	58.76,50.43	56.82,51.16	55.42,52.22
path	53.50,52.61	53.16,56.18	51.94,57.54	50.38,58.57	49.34,61.86
path	47.74,65.34	49.23,69.53	48.13,71.47	48.25,74.69	49.98,75.97
path	49.97,78.84	48.59,80.24	48.26,82.33	46.66,83.76	46.10,86.08
path	44.27,84.64	42.70,82.63	41.20,79.51	44.09,78.36	43.80,75.03
path	43.88,73.08	42.35,72.24	41.90,68.97	43.39,69.35	45.54,68.99
path	45.03,65.70	43.83,62.98	43.15,60.77	43.09,56.64	43.61,52.80
path	41.37,48.89	42.58,47.61	41.37,44.96	43.42,44.79	43.15,42.53
path	43.28,39.61	42.28,38.89	41.58,37.21	42.55,35.50	42.04,33.21
path	45.13,32.85	46.58,30.52	46.71,28.37	48.20,28.72	49.48,31.40
path	50.44,34.37	52.43,34.60	56.90,37.50	58.56,39.33
Click ore as you follow the path around this area
|tip Track them on your minimap with "Find Minerals".
|tip You will need level 65 Mining to collect these.
collect 60 Coarse Stone##2836 |or
|tip Farm them with Mining or purchase them from the auction house. |notinsticky
|tip These totals are approximate. |notinsticky
|tip You may need more or less than the indicated amount. |notinsticky
'|complete skill("Engineering") >= 95 |or
step
label "Collect_Heavy_Stone_Total"
map Arathi Highlands
path follow smart; loop on; ants curved; dist 20
path	78.66,36.13	77.36,41.29	75.00,44.93	72.65,48.07	70.58,55.05
path	69.99,58.40	72.92,59.03	72.28,63.63	72.78,66.86	71.75,66.15
path	69.15,72.54	67.17,70.90	63.52,73.55	59.48,74.71	59.32,70.74
path	56.16,71.89	50.82,78.41	47.96,82.44	42.53,80.75	43.02,77.16
path	40.39,71.86	37.95,67.63	38.52,68.50	33.94,66.02	34.59,61.64
path	33.70,56.77	33.45,53.94	33.65,50.19	35.00,47.28	32.96,46.68
path	31.68,45.41	32.34,42.64	31.42,41.24	25.23,43.10	20.94,39.12
path	20.02,35.80	19.12,33.36	22.43,31.28	23.48,24.90	26.93,20.65
path	28.65,14.18	28.96,16.96	31.62,18.63	30.96,20.36	33.19,21.23
path	36.35,24.61	39.97,25.62	40.21,28.79	43.97,30.51	45.70,33.02
path	48.08,33.60	49.78,36.76	52.14,36.11	52.75,31.99	54.80,33.13
path	58.19,32.50	58.02,34.22	59.94,35.97	62.25,32.06	64.69,35.58
path	64.49,26.56	66.77,27.64	70.39,27.07	70.47,30.74	72.89,30.09
path	76.73,29.48	76.70,33.68	79.56,35.45
Click ore as you follow the path around this area
|tip Track them on your minimap with "Find Minerals".
|tip You will need level 125 Mining to collect these.
collect 30 Heavy Stone##2838 |or
|tip Farm them with Mining or purchase them from the auction house. |notinsticky
|tip These totals are approximate. |notinsticky
|tip You may need more or less than the indicated amount. |notinsticky
'|complete skill("Engineering") >= 146 |or
step
label "Collect_Solid_Stone_Total"
map Badlands
path follow smart; loop on; ants curved; dist 20
path	26.84,74.76	25.28,78.53	19.71,81.32	14.75,83.82	12.50,85.54
path	7.98,80.56	6.30,74.40	8.68,67.97	17.19,68.54	15.13,72.43
path	17.19,77.39	21.25,75.06	25.11,72.08
Click ore as you follow the path around this area
|tip Track them on your minimap with "Find Minerals".
|tip You will need level 175 Mining to collect these.
collect 120 Solid Stone##7912 |or
|tip Farm them with Mining or purchase them from the auction house. |notinsticky
|tip These totals are approximate. |notinsticky
|tip You may need more or less than the indicated amount. |notinsticky
'|complete skill("Engineering") >= 195 |or
step
label "Collect_Dense_Stone_Total"
map Un'Goro Crater
path follow smart; loop on; ants curved; dist 20
path	66.46,78.95	64.56,79.71	61.79,84.21	59.34,84.18	57.63,86.04
path	54.50,86.69	51.13,86.82	48.27,87.30	45.98,86.58	42.89,85.00
path	40.79,83.52	37.91,83.14	36.77,80.17	33.58,79.05	30.40,79.61
path	28.89,76.98	28.97,71.52	26.00,67.67	25.93,63.53	24.59,58.51
path	23.95,53.04	24.40,48.21	23.89,44.76	24.71,41.12	26.26,36.59
path	26.62,31.21	28.29,29.47	29.59,25.66	29.89,20.92	33.32,20.67
path	36.29,20.47	38.67,16.00	41.73,15.77	43.32,14.12	46.94,13.03
path	49.79,13.83	52.84,12.88	56.31,14.04	59.61,16.58	62.25,16.02
path	64.19,19.90	65.99,21.01	68.51,20.26	71.19,20.89	71.21,23.75
path	71.75,28.19	74.76,32.46	75.06,37.15	76.32,43.15	76.67,48.32
path	77.05,53.09	76.56,57.02	75.35,61.97	74.66,68.05	72.92,70.46
path	71.39,73.80	71.00,79.21	68.32,79.90
Click ore as you follow the path around this area
|tip Track them on your minimap with "Find Minerals".
|tip You will need level 245 Mining to collect these.
collect 70 Dense Stone##12365 |or
|tip Farm them with Mining or purchase them from the auction house. |notinsticky
|tip These totals are approximate. |notinsticky
|tip You may need more or less than the indicated amount. |notinsticky
'|complete skill("Engineering") >= 260 |or
step
label "Collect_Moss_Agate_Total"
map The Barrens
path follow smart; loop on; ants curved; dist 20
path	59.10,40.30	60.19,40.99	61.84,40.54	62.14,43.04	62.65,46.75
path	61.30,50.02	60.46,50.11	58.76,50.43	56.82,51.16	55.42,52.22
path	53.50,52.61	53.16,56.18	51.94,57.54	50.38,58.57	49.34,61.86
path	47.74,65.34	49.23,69.53	48.13,71.47	48.25,74.69	49.98,75.97
path	49.97,78.84	48.59,80.24	48.26,82.33	46.66,83.76	46.10,86.08
path	44.27,84.64	42.70,82.63	41.20,79.51	44.09,78.36	43.80,75.03
path	43.88,73.08	42.35,72.24	41.90,68.97	43.39,69.35	45.54,68.99
path	45.03,65.70	43.83,62.98	43.15,60.77	43.09,56.64	43.61,52.80
path	41.37,48.89	42.58,47.61	41.37,44.96	43.42,44.79	43.15,42.53
path	43.28,39.61	42.28,38.89	41.58,37.21	42.55,35.50	42.04,33.21
path	45.13,32.85	46.58,30.52	46.71,28.37	48.20,28.72	49.48,31.40
path	50.44,34.37	52.43,34.60	56.90,37.50	58.56,39.33
Click ore as you follow the path around this area
|tip Track them on your minimap with "Find Minerals".
|tip You will need level 65 Mining to collect Tin Ore nodes and 75 to collect Silver Ore nodes.
collect 10 Moss Agate##1206 |or
|tip Farm them with Mining or purchase them from the auction house. |notinsticky
|tip These totals are approximate. |notinsticky
|tip You may need more or less than the indicated amount. |notinsticky
'|complete skill("Engineering") >= 135 |or
step
label "Collect_Medium_Leather_Total"
Kill Yeti enemies around this area
|tip Skin their corpses.
|tip You can find more inside the cave.
|tip You will need level 155 Skinning to collect these.
collect 15 Medium Leather##2319 |goto Hillsbrad Foothills 46.12,31.76 |or
|tip Farm them with Skinning or purchase them from the auction house.
|tip These totals are approximate. |notinsticky
|tip You may need more or less than the indicated amount. |notinsticky
'|complete skill("Engineering") >= 160 |or
stickystart "Collect_Silver_Bar_Total"
stickystart "Collect_Bronze_Bar_Total"
stickystart "Collect_Steel_Bar_Total"
stickystart "Collect_Mithril_Bar_Total"
stickystart "Collect_Thorium_Bar_Total"
step
map Durotar
path follow smart; loop on; ants curved; dist 20
path	50.96,17.00	52.99,18.09	54.60,19.05	55.40,21.06	55.71,23.38
path	56.28,25.33	55.89,27.78	54.64,27.62	55.10,30.09	58.12,29.94
path	55.62,32.75	55.97,36.63	55.71,40.53	57.32,42.00	59.26,41.50
path	57.59,43.98	55.27,48.14	50.81,48.20	48.51,43.33	47.83,39.78
path	46.87,34.69	45.55,32.24	45.61,27.19	46.52,23.35	48.07,21.59
path	49.70,21.37	49.54,18.59
Click ore as you follow the path around this area
|tip Track them on your minimap with "Find Minerals".
collect 66 Copper Ore##2770 |n
|tip Smelt the ore at a forge.
collect 66 Copper Bar##2840 |or
|tip Create them with Mining or purchase them from the auction house.
|tip These totals are approximate.
|tip You may need more or less than the indicated amount.
'|complete skill("Engineering") >= 75 |or
step
label "Collect_Silver_Bar_Total"
map The Barrens
path follow smart; loop on; ants curved; dist 20
path	59.10,40.30	60.19,40.99	61.84,40.54	62.14,43.04	62.65,46.75
path	61.30,50.02	60.46,50.11	58.76,50.43	56.82,51.16	55.42,52.22
path	53.50,52.61	53.16,56.18	51.94,57.54	50.38,58.57	49.34,61.86
path	47.74,65.34	49.23,69.53	48.13,71.47	48.25,74.69	49.98,75.97
path	49.97,78.84	48.59,80.24	48.26,82.33	46.66,83.76	46.10,86.08
path	44.27,84.64	42.70,82.63	41.20,79.51	44.09,78.36	43.80,75.03
path	43.88,73.08	42.35,72.24	41.90,68.97	43.39,69.35	45.54,68.99
path	45.03,65.70	43.83,62.98	43.15,60.77	43.09,56.64	43.61,52.80
path	41.37,48.89	42.58,47.61	41.37,44.96	43.42,44.79	43.15,42.53
path	43.28,39.61	42.28,38.89	41.58,37.21	42.55,35.50	42.04,33.21
path	45.13,32.85	46.58,30.52	46.71,28.37	48.20,28.72	49.48,31.40
path	50.44,34.37	52.43,34.60	56.90,37.50	58.56,39.33
Click ore as you follow the path around this area
|tip Track them on your minimap with "Find Minerals".
|tip You will need level 75 Mining to collect these.
collect Silver Ore##2775 |n
|tip Smelt the ore at a forge.
collect 5 Silver Bar##2842 |or
|tip Create them with Mining or purchase them from the auction house. |notinsticky
|tip These totals are approximate. |notinsticky
|tip You may need more or less than the indicated amount. |notinsticky
'|complete skill("Engineering") >= 105 |or
step
label "Collect_Bronze_Bar_Total"
map Durotar
path follow smart; loop on; ants curved; dist 20
path	50.96,17.00	52.99,18.09	54.60,19.05	55.40,21.06	55.71,23.38
path	56.28,25.33	55.89,27.78	54.64,27.62	55.10,30.09	58.12,29.94
path	55.62,32.75	55.97,36.63	55.71,40.53	57.32,42.00	59.26,41.50
path	57.59,43.98	55.27,48.14	50.81,48.20	48.51,43.33	47.83,39.78
path	46.87,34.69	45.55,32.24	45.61,27.19	46.52,23.35	48.07,21.59
path	49.70,21.37	49.54,18.59
Click ore as you follow the path around this area
|tip Track them on your minimap with "Find Minerals".
collect 60 Copper Ore##2770 |or
|tip Save these for later.
collect 120 Bronze Bar##2841 |or
|tip Create them with Mining or purchase them from the auction house. |notinsticky
|tip These totals are approximate. |notinsticky
|tip You may need more or less than the indicated amount. |notinsticky
'|complete skill("Engineering") >= 175 |or
step
map The Barrens
path follow smart; loop on; ants curved; dist 20
path	59.10,40.30	60.19,40.99	61.84,40.54	62.14,43.04	62.65,46.75
path	61.30,50.02	60.46,50.11	58.76,50.43	56.82,51.16	55.42,52.22
path	53.50,52.61	53.16,56.18	51.94,57.54	50.38,58.57	49.34,61.86
path	47.74,65.34	49.23,69.53	48.13,71.47	48.25,74.69	49.98,75.97
path	49.97,78.84	48.59,80.24	48.26,82.33	46.66,83.76	46.10,86.08
path	44.27,84.64	42.70,82.63	41.20,79.51	44.09,78.36	43.80,75.03
path	43.88,73.08	42.35,72.24	41.90,68.97	43.39,69.35	45.54,68.99
path	45.03,65.70	43.83,62.98	43.15,60.77	43.09,56.64	43.61,52.80
path	41.37,48.89	42.58,47.61	41.37,44.96	43.42,44.79	43.15,42.53
path	43.28,39.61	42.28,38.89	41.58,37.21	42.55,35.50	42.04,33.21
path	45.13,32.85	46.58,30.52	46.71,28.37	48.20,28.72	49.48,31.40
path	50.44,34.37	52.43,34.60	56.90,37.50	58.56,39.33
Click ore as you follow the path around this area
|tip Track them on your minimap with "Find Minerals".
|tip You will need level 65 Mining to collect these.
collect 60 Tin Ore##2771 |n
|tip Smelt the ore at a forge.
collect 120 Bronze Bar##2841 |or
|tip Create them with Mining or purchase them from the auction house. |notinsticky
|tip These totals are approximate. |notinsticky
|tip You may need more or less than the indicated amount. |notinsticky
'|complete skill("Engineering") >= 175 |or
step
label "Collect_Steel_Bar_Total"
map Arathi Highlands
path follow smart; loop on; ants curved; dist 20
path	78.66,36.13	77.36,41.29	75.00,44.93	72.65,48.07	70.58,55.05
path	69.99,58.40	72.92,59.03	72.28,63.63	72.78,66.86	71.75,66.15
path	69.15,72.54	67.17,70.90	63.52,73.55	59.48,74.71	59.32,70.74
path	56.16,71.89	50.82,78.41	47.96,82.44	42.53,80.75	43.02,77.16
path	40.39,71.86	37.95,67.63	38.52,68.50	33.94,66.02	34.59,61.64
path	33.70,56.77	33.45,53.94	33.65,50.19	35.00,47.28	32.96,46.68
path	31.68,45.41	32.34,42.64	31.42,41.24	25.23,43.10	20.94,39.12
path	20.02,35.80	19.12,33.36	22.43,31.28	23.48,24.90	26.93,20.65
path	28.65,14.18	28.96,16.96	31.62,18.63	30.96,20.36	33.19,21.23
path	36.35,24.61	39.97,25.62	40.21,28.79	43.97,30.51	45.70,33.02
path	48.08,33.60	49.78,36.76	52.14,36.11	52.75,31.99	54.80,33.13
path	58.19,32.50	58.02,34.22	59.94,35.97	62.25,32.06	64.69,35.58
path	64.49,26.56	66.77,27.64	70.39,27.07	70.47,30.74	72.89,30.09
path	76.73,29.48	76.70,33.68	79.56,35.45
Click ore as you follow the path around this area
|tip Track them on your minimap with "Find Minerals".
|tip You will need level 125 Mining to collect these.
collect 4 Iron Ore##2772 |n
|tip Buy 4 Coal from a nearby supplier.
|tip Smelt the ore at a forge.
collect 4 Steel Bar##3859 |or
|tip Create them with Mining or purchase them from the auction house. |notinsticky
|tip These totals are approximate. |notinsticky
|tip You may need more or less than the indicated amount. |notinsticky
'|complete skill("Engineering") >= 300 or itemcount(10498) >= 1 |or
step
label "Collect_Mithril_Bar_Total"
map Badlands
path follow smart; loop on; ants curved; dist 20
path	26.84,74.76	25.28,78.53	19.71,81.32	14.75,83.82	12.50,85.54
path	7.98,80.56	6.30,74.40	8.68,67.97	17.19,68.54	15.13,72.43
path	17.19,77.39	21.25,75.06	25.11,72.08
Click ore as you follow the path around this area
|tip Track them on your minimap with "Find Minerals".
|tip You will need level 175 Mining to collect these.
collect 161 Mithril Ore##3858 |n
|tip Smelt the ore at a forge.
collect 161 Mithril Bar##3860 |or
|tip Create them with Mining or purchase them from the auction house. |notinsticky
|tip These totals are approximate. |notinsticky
|tip You may need more or less than the indicated amount. |notinsticky
'|complete skill("Engineering") >= 238 |or
step
label "Collect_Thorium_Bar_Total"
map Un'Goro Crater
path follow smart; loop on; ants curved; dist 20
path	66.46,78.95	64.56,79.71	61.79,84.21	59.34,84.18	57.63,86.04
path	54.50,86.69	51.13,86.82	48.27,87.30	45.98,86.58	42.89,85.00
path	40.79,83.52	37.91,83.14	36.77,80.17	33.58,79.05	30.40,79.61
path	28.89,76.98	28.97,71.52	26.00,67.67	25.93,63.53	24.59,58.51
path	23.95,53.04	24.40,48.21	23.89,44.76	24.71,41.12	26.26,36.59
path	26.62,31.21	28.29,29.47	29.59,25.66	29.89,20.92	33.32,20.67
path	36.29,20.47	38.67,16.00	41.73,15.77	43.32,14.12	46.94,13.03
path	49.79,13.83	52.84,12.88	56.31,14.04	59.61,16.58	62.25,16.02
path	64.19,19.90	65.99,21.01	68.51,20.26	71.19,20.89	71.21,23.75
path	71.75,28.19	74.76,32.46	75.06,37.15	76.32,43.15	76.67,48.32
path	77.05,53.09	76.56,57.02	75.35,61.97	74.66,68.05	72.92,70.46
path	71.39,73.80	71.00,79.21	68.32,79.90
Click ore as you follow the path around this area
|tip Track them on your minimap with "Find Minerals".
|tip You will need level 245 Mining to collect these.
collect 135 Thorium Ore##10620 |n
|tip Smelt the ore at a forge.
collect 135 Thorium Bar##12359 |or
|tip Create them with Mining or purchase them from the auction house. |notinsticky
|tip These totals are approximate. |notinsticky
|tip You may need more or less than the indicated amount. |notinsticky
'|complete skill("Engineering") >= 300 |or
stickystart "Collect_Wool_Cloth_Total"
stickystart "Collect_Mageweave_Cloth_Total"
stickystart "Collect_Runecloth_Total"
step
collect 50 Linen Cloth##2589 |or
|tip Farm them from level 5-20 humanoid mobs or purchase them from the auction house.
|tip These totals are approximate.
|tip You may need more or less than the indicated amount.
'|complete skill("Engineering") >= 100 |or
step
label "Collect_Wool_Cloth_Total"
Follow the path up |goto The Barrens 62.21,7.28 < 15 |only if walking
Kill Venture Co. enemies around this area
|tip You can find more inside the mine.
collect 60 Wool Cloth##2592 |or |goto 60.91,3.82
|tip Farm them from level 16-30 humanoid mobs or purchase them from the auction house.
|tip These totals are approximate. |notinsticky
|tip You may need more or less than the indicated amount. |notinsticky
'|complete skill("Engineering") >= 175 |or
step
label "Collect_Mageweave_Cloth_Total"
Kill Dunemaul enemies around this area
collect 20 Mageweave Cloth##4338 |or |goto Tanaris/0 40.50,55.50
|tip Farm them from level 38-50 humanoid mobs or purchase them from the auction house.
|tip These totals are approximate. |notinsticky
|tip You may need more or less than the indicated amount. |notinsticky
'|complete skill("Engineering") >= 216 |or
step
label "Collect_Runecloth_Total"
Kill Blackrock enemies around this area
|tip You can find more inside the building.
collect 35 Runecloth###14047 |or |goto Burning Steppes 42.17,35.64
|tip Farm them from level 50+ humanoid mobs or purchase them from the auction house.
|tip These totals are approximate. |notinsticky
|tip You may need more or less than the indicated amount. |notinsticky
'|complete skill("Engineering") >= 285 |or
stickystart "Collect_Adamantite_Bar_Total"
stickystart "Collect_Khorium_Bar_Total"
stickystart "Collect_Mote_of_Earth_Total"
stickystart "Collect_Mote_of_Fire_Total"
stickystart "Collect_Primal_Fire_Total"
stickystart "Collect_Primal_Earth_Total"
stickystart "Collect_Netherweave_Cloth_Total"
step
map Hellfire Peninsula/0
path	65.97,48.02	69.02,46.87	70.80,50.94	70.25,54.41	70.27,59.32
path	72.23,60.13	74.08,63.37	76.97,62.92	78.97,66.32	78.85,70.21
path	79.70,74.48	80.75,77.99	77.91,75.80	77.13,73.33	76.82,69.54
path	75.53,67.17	71.66,67.33	69.41,67.29	68.38,60.74	65.36,60.83
path	65.69,64.45	63.25,69.06	62.72,72.99	62.49,79.96	58.89,76.64
path	57.05,73.97	57.06,81.30	56.40,82.14	55.54,83.79	52.24,83.83
path	49.82,83.52	46.85,84.82	42.98,79.36	42.26,76.62	44.54,73.42
path	47.44,71.34	50.85,69.85	47.41,66.63	44.75,68.48	45.62,61.55
path	47.89,59.49	49.89,56.45	49.95,61.42	51.38,61.68	52.93,58.38
path	55.41,56.25	56.22,53.50	58.62,52.98	62.69,50.44
click Fel Iron Deposit##181555+
|tip They look like green mineral clusters around this path.
|tip Enter caves along the path.
|tip Make sure you enable "Find Minerals" in the tracking menu on the minimap.
collect 540 Fel Iron Ore##23424 |n
|tip Smelt the ore at a forge.
collect 270 Fel Iron Bar##23445 |or
|tip Create them with Mining or purchase them from the auction house.
'|complete skill("Engineering") >= 321 |or
step
label "Collect_Adamantite_Bar_Total"
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
collect 320 Adamantite Ore##23425 |n
|tip Smelt the ore at a forge.
collect 160 Adamantite Bar##23446 |or
|tip Create them with Mining or purchase them from the auction house.
'|complete skill("Engineering") >= 336 |or
step
label "Collect_Khorium_Bar_Total"
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
|tip Make sure you enable "Find Minerals" in the tracking menu on the minimap.
collect 30 Khorium Ore##23426 |n
|tip Smelt the ore at a forge.
collect 15 Khorium Bar##23449 |or
|tip Create them with Mining or purchase them from the auction house.
'|complete skill("Engineering") >= 360 |or
step
label "Collect_Mote_of_Earth_Total"
map Nagrand/0
path follow smart; loop off; ants curved; dist 30
path	46.19,77.20	41.98,78.72	40.31,82.83	32.13,80.25	29.34,79.24
path	28.40,73.85	28.94,66.76	28.17,63.58
kill Shattered Rumbler##17157+
|tip Follow the path, killing any that you see.
collect 40 Mote of Earth##22573 |or
|tip Farm them with Mining or purchase them from the auction house.
'|goto Nagrand/0 28.17,63.58 < 30 |c |noway |or
'|complete skill("Engineering") >= 321 |or
step
map Nagrand/0
path follow smart; loop off; ants curved; dist 30
path	28.17,63.58	28.94,66.76	28.40,73.85	29.34,79.24	32.13,80.25
path	40.31,82.83	41.98,78.72	46.19,77.20
kill Shattered Rumbler##17157+
|tip Follow the path, killing any that you see.
collect 40 Mote of Earth##22573 |or
|tip Farm them with Mining or purchase them from the auction house.
'|goto Nagrand/0 46.19,77.20 < 30 |c |noway |next "Collect_Mote_of_Earth_Total" |or
'|complete skill("Engineering") >= 321 |or
step
label "Collect_Mote_of_Fire_Total"
map Shadowmoon Valley/0
path	loop off; ants curved; dist 25
path	44.47,46.46	46.81,48.88	48.83,51.69	51.70,52.00
kill Enraged Fire Spirit##21061+
|tip Follow the path, killing any that you see.
collect 20 Mote of Fire##22574 |or
|tip Farm them with Mining or purchase them from the auction house.
'|goto 51.70,52.00 |noway |c |or
'|complete skill("Engineering") >= 321 |or
step
kill Enraged Fire Spirit##21061
map Shadowmoon Valley/0
path	loop off; ants curved; dist 25
path	48.34,46.75	47.93,42.37	49.03,37.97	51.34,36.12	49.04,34.47
kill Enraged Fire Spirit##21061+
|tip Follow the path, killing any that you see.
collect 20 Mote of Fire##22574 |or
|tip Farm them with Mining or purchase them from the auction house.
'|goto 49.04,34.47 |noway |c |next "Collect_Mote_of_Fire_Total" |or
'|complete skill("Engineering") >= 321 |or
step
label "Collect_Primal_Fire_Total"
map Shadowmoon Valley/0
path	loop off; ants curved; dist 25
path	44.47,46.46	46.81,48.88	48.83,51.69	51.70,52.00
kill Enraged Fire Spirit##21061+
|tip Follow the path, killing any that you see.
use the Mote of Fire##22574
|tip Combine 10 Motes of Fire into 1 Primal Fire.
collect 5 Primal Fire##21884 |or
|tip Farm them with Mining or purchase them from the auction house.
'|goto 51.70,52.00 |noway |c |or
'|complete skill("Engineering") >= 336 |or
step
kill Enraged Fire Spirit##21061
map Shadowmoon Valley/0
path	loop off; ants curved; dist 25
path	48.34,46.75	47.93,42.37	49.03,37.97	51.34,36.12	49.04,34.47
kill Enraged Fire Spirit##21061+
|tip Follow the path, killing any that you see.
use the Mote of Fire##22574
|tip Combine 10 Motes of Fire into 1 Primal Fire.
collect 5 Primal Fire##21884 |or
|tip Farm them with Mining or purchase them from the auction house.
'|goto 49.04,34.47 |noway |c |next "Collect_Primal_Fire_Total" |or
'|complete skill("Engineering") >= 336 |or
step
label "Collect_Primal_Earth_Total"
map Nagrand/0
path follow smart; loop off; ants curved; dist 30
path	46.19,77.20	41.98,78.72	40.31,82.83	32.13,80.25	29.34,79.24
path	28.40,73.85	28.94,66.76	28.17,63.58
kill Shattered Rumbler##17157+
|tip Follow the path, killing any that you see.
use the Mote of Earth##22573
|tip Combine 10 Motes of Earth into 1 Primal Earth.
collect 30 Primal Earth##22452 |or
|tip Farm them with Mining or purchase them from the auction house.
'|goto Nagrand/0 28.17,63.58 < 30 |c |noway |or
'|complete skill("Engineering") >= 336 |or
step
map Nagrand/0
path follow smart; loop off; ants curved; dist 30
path	28.17,63.58	28.94,66.76	28.40,73.85	29.34,79.24	32.13,80.25
path	40.31,82.83	41.98,78.72	46.19,77.20
kill Shattered Rumbler##17157+
|tip Follow the path, killing any that you see.
use the Mote of Earth##22573
|tip Combine 10 Motes of Earth into 1 Primal Earth.
collect 30 Primal Earth##22452 |or
|tip Farm them with Mining or purchase them from the auction house.
'|goto Nagrand/0 46.19,77.20 < 30 |c |noway |next "Collect_Primal_Earth_Total" |or
'|complete skill("Engineering") >= 336 |or
step
label "Collect_Netherweave_Cloth_Total"
map Shadowmoon Valley/0
path follow smart; loop on; ants curved; dist 20
path	51.1,58.8	53.0,59.3	53.2,60.5	52.8,63.2	52.8,65.4
path	52.9,69.0	52.5,71.8	47.3,71.1	45.8,71.3	45.2,69.2
path	45.6,66.1	48.0,67.2
Kill enemies around this area
collect 70 Netherweave Cloth##21877 |or
|tip Farm them from humanoid mobs in Outland or purchase them from the auction house.
'|complete skill("Engineering") >= 355 |or
step
label "Begin_Profession_Leveling"
talk Sovik##3413
|tip Inside the building.
buy Blacksmith Hammer##5956 |goto Orgrimmar/0 75.49,25.36 |or
|tip Save this, you will need it for future steps.
'|complete skill("Engineering") >= 300 |or
step
map Durotar
path follow smart; loop on; ants curved; dist 20
path	50.96,17.00	52.99,18.09	54.60,19.05	55.40,21.06	55.71,23.38
path	56.28,25.33	55.89,27.78	54.64,27.62	55.10,30.09	58.12,29.94
path	55.62,32.75	55.97,36.63	55.71,40.53	57.32,42.00	59.26,41.50
path	57.59,43.98	55.27,48.14	50.81,48.20	48.51,43.33	47.83,39.78
path	46.87,34.69	45.55,32.24	45.61,27.19	46.52,23.35	48.07,21.59
path	49.70,21.37	49.54,18.59
Click ore as you follow the path around this area
|tip Track them on your minimap with "Find Minerals".
collect 60 Rough Stone##2835 |or
|tip Farm them with Mining or purchase them from the auction house.
'|complete skill("Engineering") >= 30 |or
step
create 60 Rough Blasting Powder##3918,Engineering,60 total |or
'|complete skill("Engineering") >= 75 |or
step
create 1 Rough Blasting Powder##3918,Engineering,30
|tip Save at least 60 of these; you will need them for future steps.
step
talk Roxxik##11017
|tip Inside the building.
Train Handful of Copper Bolts |learn Handful of Copper Bolts##3922 |goto Orgrimmar/0 76.18,25.18
step
map Durotar
path follow smart; loop on; ants curved; dist 20
path	50.96,17.00	52.99,18.09	54.60,19.05	55.40,21.06	55.71,23.38
path	56.28,25.33	55.89,27.78	54.64,27.62	55.10,30.09	58.12,29.94
path	55.62,32.75	55.97,36.63	55.71,40.53	57.32,42.00	59.26,41.50
path	57.59,43.98	55.27,48.14	50.81,48.20	48.51,43.33	47.83,39.78
path	46.87,34.69	45.55,32.24	45.61,27.19	46.52,23.35	48.07,21.59
path	49.70,21.37	49.54,18.59
Click ore as you follow the path around this area
|tip Track them on your minimap with "Find Minerals".
collect 30 Copper Ore##2770 |n
|tip Smelt the ore at a forge.
collect 30 Copper Bar##2840 |or
|tip Create them with Mining or purchase them from the auction house.
'|complete skill("Engineering") >= 50 |or
step
create 30 Handful of Copper Bolts##3922,Engineering,30 total |goto Orgrimmar/0 79.61,22.95 |or
|tip Stand next to an anvil.
|tip Save these, you will need them for future steps.
'|complete skill("Engineering") >= 75 |or
step
create 30 Handful of Copper Bolts##3922,Engineering,50 |goto Orgrimmar/0 79.61,22.95
|tip Stand next to an anvil.
|tip Save at least 30 of these; you will need them for future steps.
|tip You may need to make a few more of these.
|tip Each additional Handful of Copper Bolts requires 1 copper bar.
step
Enter the building |goto Orgrimmar/0 75.19,24.59 < 5 |walk
talk Roxxik##11017
|tip Inside the building.
Train Arclight Spanner |learn Arclight Spanner##7430 |goto Orgrimmar/0 76.18,25.18
step
map Durotar
path follow smart; loop on; ants curved; dist 20
path	50.96,17.00	52.99,18.09	54.60,19.05	55.40,21.06	55.71,23.38
path	56.28,25.33	55.89,27.78	54.64,27.62	55.10,30.09	58.12,29.94
path	55.62,32.75	55.97,36.63	55.71,40.53	57.32,42.00	59.26,41.50
path	57.59,43.98	55.27,48.14	50.81,48.20	48.51,43.33	47.83,39.78
path	46.87,34.69	45.55,32.24	45.61,27.19	46.52,23.35	48.07,21.59
path	49.70,21.37	49.54,18.59
Click ore as you follow the path around this area
|tip Track them on your minimap with "Find Minerals".
collect 6 Copper Ore##2770 |n
|tip Smelt the ore at a forge.
collect 6 Copper Bar##2840 |or
|tip Create them with Mining or purchase them from the auction house.
'|complete skill("Engineering") >= 51 or itemcount(6219) < 1 |or
step
create 1 Arclight Spanner##7430,Engineering,51 |goto Orgrimmar/0 79.61,22.95
|tip Stand next to an anvil.
|tip Save this, you will need it for future steps.
step
Enter the building |goto Orgrimmar/0 75.19,24.59 < 5 |walk
talk Roxxik##11017
|tip Inside the building.
Train Rough Copper Bomb |learn Rough Copper Bomb##3923 |goto Orgrimmar/0 76.18,25.18
stickystart "Collect_Handful_of_Copper_Bolts_75"
stickystart "Collect_Copper_Bar_75"
stickystart "Collect_Linen_Cloth_75"
step
collect 60 Rough Blasting Powder##4357 |or
|tip You created these in a previous step.
'|complete skill("Engineering") >= 75 |or
step
label "Collect_Handful_of_Copper_Bolts_75"
collect 30 Handful of Copper Bolts##4359 |or
|tip You created these in a previous step.
'|complete skill("Engineering") >= 75 |or
step
label "Collect_Copper_Bar_75"
map Durotar
path follow smart; loop on; ants curved; dist 20
path	50.96,17.00	52.99,18.09	54.60,19.05	55.40,21.06	55.71,23.38
path	56.28,25.33	55.89,27.78	54.64,27.62	55.10,30.09	58.12,29.94
path	55.62,32.75	55.97,36.63	55.71,40.53	57.32,42.00	59.26,41.50
path	57.59,43.98	55.27,48.14	50.81,48.20	48.51,43.33	47.83,39.78
path	46.87,34.69	45.55,32.24	45.61,27.19	46.52,23.35	48.07,21.59
path	49.70,21.37	49.54,18.59
Click ore as you follow the path around this area
|tip Track them on your minimap with "Find Minerals".
collect 30 Copper Ore##2770 |n
|tip Smelt the ore at a forge.
collect 30 Copper Bar##2840 |or
|tip Create them with Mining or purchase them from the auction house.
'|complete skill("Engineering") >= 75 |or
step
label "Collect_Linen_Cloth_75"
collect 30 Linen Cloth##2589 |or
|tip Farm them from level 5-20 humanoid mobs or purchase them from the auction house.
'|complete skill("Engineering") >= 75 |or
step
create 30 Rough Copper Bomb##3923,Engineering,75 |goto Orgrimmar/0 79.61,22.95
|tip Stand next to an anvil.
|tip You may need to create more or less of these.
|tip Each additional Rough Copper Bomb requires 2 Rough Blasting Powder, 1 Handful of Copper Bolts, 1 Copper Bar, and 1 Linen Cloth.
step
Reach Level 10 |ding 10
|tip You must be at least level 10 to train Journeyman professions.
|tip Use the leveling guides to accomplish this.
step
Enter the building |goto Orgrimmar/0 75.19,24.59 < 5 |walk
talk Roxxik##11017
|tip Inside the building.
Train Journeyman Engineering |skillmax Engineering,150 |goto Orgrimmar/0 76.18,25.18
step
talk Roxxik##11017
|tip Inside the building.
Train Coarse Blasting Powder |learn Coarse Blasting Powder##3929 |goto Orgrimmar/0 76.18,25.18
step
map The Barrens
path follow smart; loop on; ants curved; dist 20
path	59.10,40.30	60.19,40.99	61.84,40.54	62.14,43.04	62.65,46.75
path	61.30,50.02	60.46,50.11	58.76,50.43	56.82,51.16	55.42,52.22
path	53.50,52.61	53.16,56.18	51.94,57.54	50.38,58.57	49.34,61.86
path	47.74,65.34	49.23,69.53	48.13,71.47	48.25,74.69	49.98,75.97
path	49.97,78.84	48.59,80.24	48.26,82.33	46.66,83.76	46.10,86.08
path	44.27,84.64	42.70,82.63	41.20,79.51	44.09,78.36	43.80,75.03
path	43.88,73.08	42.35,72.24	41.90,68.97	43.39,69.35	45.54,68.99
path	45.03,65.70	43.83,62.98	43.15,60.77	43.09,56.64	43.61,52.80
path	41.37,48.89	42.58,47.61	41.37,44.96	43.42,44.79	43.15,42.53
path	43.28,39.61	42.28,38.89	41.58,37.21	42.55,35.50	42.04,33.21
path	45.13,32.85	46.58,30.52	46.71,28.37	48.20,28.72	49.48,31.40
path	50.44,34.37	52.43,34.60	56.90,37.50	58.56,39.33
Click ore as you follow the path around this area
|tip Track them on your minimap with "Find Minerals".
|tip You will need level 65 Mining to collect these.
collect 60 Coarse Stone##2836 |or
|tip Farm them with Mining or purchase them from the auction house.
'|complete skill("Engineering") >= 95 |or
step
create 60 Coarse Blasting Powder##3929,Engineering,60 total |or
|tip Save these, you will need them for future steps.
'|complete skill("Engineering") >= 100 |or
step
create 1 Coarse Blasting Powder##3929,Engineering,95
|tip Save 60 of these, they will be used in a later schematic.
step
Enter the building |goto Orgrimmar/0 75.19,24.59 < 5 |walk
talk Roxxik##11017
|tip Inside the building.
Train Coarse Dynamite |learn Coarse Dynamite##3931 |goto Orgrimmar/0 76.18,25.18
stickystart "Collect_Linen_Cloth_100"
step
collect 60 Coarse Blasting Powder##4364 |or
|tip You created these in a previous step.
'|complete skill("Engineering") >= 100 |or
step
label "Collect_Linen_Cloth_100"
collect 20 Linen Cloth##2589 |or
|tip Farm them from level 5-20 humanoid mobs or purchase them from the auction house.
'|complete skill("Engineering") >= 100 |or
step
create 20 Coarse Dynamite##3931,Engineering,100
|tip You may need to create more or less of these.
|tip Each additional Coarse Dynamite requires 3 Coarse Blasting Powder and 1 Linen Cloth.
step
Enter the building |goto Orgrimmar/0 75.19,24.59 < 5 |walk
talk Roxxik##11017
|tip Inside the building.
Train Silver Contact |learn Silver Contact##3973 |goto Orgrimmar/0 76.18,25.18
step
map The Barrens
path follow smart; loop on; ants curved; dist 20
path	59.10,40.30	60.19,40.99	61.84,40.54	62.14,43.04	62.65,46.75
path	61.30,50.02	60.46,50.11	58.76,50.43	56.82,51.16	55.42,52.22
path	53.50,52.61	53.16,56.18	51.94,57.54	50.38,58.57	49.34,61.86
path	47.74,65.34	49.23,69.53	48.13,71.47	48.25,74.69	49.98,75.97
path	49.97,78.84	48.59,80.24	48.26,82.33	46.66,83.76	46.10,86.08
path	44.27,84.64	42.70,82.63	41.20,79.51	44.09,78.36	43.80,75.03
path	43.88,73.08	42.35,72.24	41.90,68.97	43.39,69.35	45.54,68.99
path	45.03,65.70	43.83,62.98	43.15,60.77	43.09,56.64	43.61,52.80
path	41.37,48.89	42.58,47.61	41.37,44.96	43.42,44.79	43.15,42.53
path	43.28,39.61	42.28,38.89	41.58,37.21	42.55,35.50	42.04,33.21
path	45.13,32.85	46.58,30.52	46.71,28.37	48.20,28.72	49.48,31.40
path	50.44,34.37	52.43,34.60	56.90,37.50	58.56,39.33
Click ore as you follow the path around this area
|tip Track them on your minimap with "Find Minerals".
|tip You will need level 75 Mining to collect these.
collect 5 Silver Ore##2775 |n
|tip Smelt the ore at a forge.
collect 5 Silver Bar##2842 |or
|tip Create them with Mining or purchase them from the auction house.
'|complete skill("Engineering") >= 105 |or
step
create 5 Silver Contact##3973,Engineering,105
step
talk Roxxik##11017
|tip Inside the building.
Train Bronze Tube |learn Bronze Tube##3938 |goto Orgrimmar/0 76.18,25.18
step
label "Collect_Bronze_Bars_125"
map Durotar
path follow smart; loop on; ants curved; dist 20
path	50.96,17.00	52.99,18.09	54.60,19.05	55.40,21.06	55.71,23.38
path	56.28,25.33	55.89,27.78	54.64,27.62	55.10,30.09	58.12,29.94
path	55.62,32.75	55.97,36.63	55.71,40.53	57.32,42.00	59.26,41.50
path	57.59,43.98	55.27,48.14	50.81,48.20	48.51,43.33	47.83,39.78
path	46.87,34.69	45.55,32.24	45.61,27.19	46.52,23.35	48.07,21.59
path	49.70,21.37	49.54,18.59
Click ore as you follow the path around this area
|tip Track them on your minimap with "Find Minerals".
collect 25 Copper Ore##2770 |or
|tip Save these for later.
collect 50 Bronze Bar##2841 |or
|tip Create them with Mining or purchase them from the auction house.
'|complete skill("Engineering") >= 125 |or
step
map The Barrens
path follow smart; loop on; ants curved; dist 20
path	59.10,40.30	60.19,40.99	61.84,40.54	62.14,43.04	62.65,46.75
path	61.30,50.02	60.46,50.11	58.76,50.43	56.82,51.16	55.42,52.22
path	53.50,52.61	53.16,56.18	51.94,57.54	50.38,58.57	49.34,61.86
path	47.74,65.34	49.23,69.53	48.13,71.47	48.25,74.69	49.98,75.97
path	49.97,78.84	48.59,80.24	48.26,82.33	46.66,83.76	46.10,86.08
path	44.27,84.64	42.70,82.63	41.20,79.51	44.09,78.36	43.80,75.03
path	43.88,73.08	42.35,72.24	41.90,68.97	43.39,69.35	45.54,68.99
path	45.03,65.70	43.83,62.98	43.15,60.77	43.09,56.64	43.61,52.80
path	41.37,48.89	42.58,47.61	41.37,44.96	43.42,44.79	43.15,42.53
path	43.28,39.61	42.28,38.89	41.58,37.21	42.55,35.50	42.04,33.21
path	45.13,32.85	46.58,30.52	46.71,28.37	48.20,28.72	49.48,31.40
path	50.44,34.37	52.43,34.60	56.90,37.50	58.56,39.33
Click ore as you follow the path around this area
|tip Track them on your minimap with "Find Minerals".
|tip You will need level 65 Mining to collect these.
collect 25 Tin Ore##2771 |n
|tip Smelt the ore at a forge.
collect 50 Bronze Bar##2841 |or
|tip Create them with Mining or purchase them from the auction house.
'|complete skill("Engineering") >= 125 |or
step
talk Sovik##3413
|tip Inside the building.
buy 25 Weak Flux##2880 |goto Orgrimmar/0 75.49,25.36 |or
'|complete skill("Engineering") >= 125 |or
step
create 10 Bronze Tube##3938,Engineering,10 total |goto 79.61,22.95 |or
|tip Stand next to an anvil.
|tip Save these, you will need them for future steps.
'|complete skill("Engineering") >= 135 |or
step
create 15 Bronze Tube##3938,Engineering,125 |goto 79.61,22.95
|tip Stand next to an anvil.
|tip Save at least 10 of these; you will need them for future steps.
|tip You may need to create more or less of these.
|tip Each additional Bronze Tube requires 2 Bronze Bars and 1 Weak Flux.
step
talk Roxxik##11017
|tip Inside the building.
Train Standard Scope |learn Standard Scope##3978 |goto Orgrimmar/0 76.18,25.18
stickystart "Collect_Moss_Agate_135"
step
collect 10 Bronze Tube##4371 |or
|tip You created these in a previous step.
'|complete skill("Engineering") >= 135 |or
step
label "Collect_Moss_Agate_135"
map The Barrens
path follow smart; loop on; ants curved; dist 20
path	59.10,40.30	60.19,40.99	61.84,40.54	62.14,43.04	62.65,46.75
path	61.30,50.02	60.46,50.11	58.76,50.43	56.82,51.16	55.42,52.22
path	53.50,52.61	53.16,56.18	51.94,57.54	50.38,58.57	49.34,61.86
path	47.74,65.34	49.23,69.53	48.13,71.47	48.25,74.69	49.98,75.97
path	49.97,78.84	48.59,80.24	48.26,82.33	46.66,83.76	46.10,86.08
path	44.27,84.64	42.70,82.63	41.20,79.51	44.09,78.36	43.80,75.03
path	43.88,73.08	42.35,72.24	41.90,68.97	43.39,69.35	45.54,68.99
path	45.03,65.70	43.83,62.98	43.15,60.77	43.09,56.64	43.61,52.80
path	41.37,48.89	42.58,47.61	41.37,44.96	43.42,44.79	43.15,42.53
path	43.28,39.61	42.28,38.89	41.58,37.21	42.55,35.50	42.04,33.21
path	45.13,32.85	46.58,30.52	46.71,28.37	48.20,28.72	49.48,31.40
path	50.44,34.37	52.43,34.60	56.90,37.50	58.56,39.33
Click ore as you follow the path around this area
|tip Track them on your minimap with "Find Minerals".
|tip You will need level 65 Mining to collect Tin Ore nodes and 75 to collect Silver Ore nodes.
collect 10 Moss Agate##1206 |or
|tip Farm them with Mining or purchase them from the auction house.
'|complete skill("Engineering") >= 135 |or
step
create 10 Standard Scope##3978,Engineering,135
step
Reach Level 20 |ding 20
|tip You must be at least level 20 to train Expert professions.
|tip Use the leveling guides to accomplish this.
step
talk Roxxik##11017
|tip Inside the building.
Train Expert Engineering |skillmax Engineering,225 |goto Orgrimmar/0 76.18,25.18
step
talk Roxxik##11017
|tip Inside the building.
Train Heavy Blasting Powder |learn Heavy Blasting Powder##3945 |goto Orgrimmar/0 76.18,25.18
step
talk Roxxik##11017
|tip Inside the building.
Train Whirring Bronze Gizmo |learn Whirring Bronze Gizmo##3942 |goto Orgrimmar/0 76.18,25.18
step
map Arathi Highlands
path follow smart; loop on; ants curved; dist 20
path	78.66,36.13	77.36,41.29	75.00,44.93	72.65,48.07	70.58,55.05
path	69.99,58.40	72.92,59.03	72.28,63.63	72.78,66.86	71.75,66.15
path	69.15,72.54	67.17,70.90	63.52,73.55	59.48,74.71	59.32,70.74
path	56.16,71.89	50.82,78.41	47.96,82.44	42.53,80.75	43.02,77.16
path	40.39,71.86	37.95,67.63	38.52,68.50	33.94,66.02	34.59,61.64
path	33.70,56.77	33.45,53.94	33.65,50.19	35.00,47.28	32.96,46.68
path	31.68,45.41	32.34,42.64	31.42,41.24	25.23,43.10	20.94,39.12
path	20.02,35.80	19.12,33.36	22.43,31.28	23.48,24.90	26.93,20.65
path	28.65,14.18	28.96,16.96	31.62,18.63	30.96,20.36	33.19,21.23
path	36.35,24.61	39.97,25.62	40.21,28.79	43.97,30.51	45.70,33.02
path	48.08,33.60	49.78,36.76	52.14,36.11	52.75,31.99	54.80,33.13
path	58.19,32.50	58.02,34.22	59.94,35.97	62.25,32.06	64.69,35.58
path	64.49,26.56	66.77,27.64	70.39,27.07	70.47,30.74	72.89,30.09
path	76.73,29.48	76.70,33.68	79.56,35.45
Click ore as you follow the path around this area
|tip Track them on your minimap with "Find Minerals".
|tip You will need level 125 Mining to collect these.
collect 30 Heavy Stone##2838 |or
|tip Farm them with Mining or purchase them from the auction house.
'|complete skill("Engineering") >= 146 |or
step
create 30 Heavy Blasting Powder##3945,Engineering,30 total |or
|tip Save these, you will need them for future steps.
'|complete skill("Engineering") >= 146 |or
stickystart "Collect_Wool_Cloth_Gizmo"
step
label "Collect_Bronze_Bars_175"
map Durotar
path follow smart; loop on; ants curved; dist 20
path	50.96,17.00	52.99,18.09	54.60,19.05	55.40,21.06	55.71,23.38
path	56.28,25.33	55.89,27.78	54.64,27.62	55.10,30.09	58.12,29.94
path	55.62,32.75	55.97,36.63	55.71,40.53	57.32,42.00	59.26,41.50
path	57.59,43.98	55.27,48.14	50.81,48.20	48.51,43.33	47.83,39.78
path	46.87,34.69	45.55,32.24	45.61,27.19	46.52,23.35	48.07,21.59
path	49.70,21.37	49.54,18.59
Click ore as you follow the path around this area
|tip Track them on your minimap with "Find Minerals".
collect 15 Copper Ore##2770 |or
|tip Save these for later.
collect 30 Bronze Bar##2841 |or
|tip Create them with Mining or purchase them from the auction house.
'|complete skill("Engineering") >= 175 |or
step
map The Barrens
path follow smart; loop on; ants curved; dist 20
path	59.10,40.30	60.19,40.99	61.84,40.54	62.14,43.04	62.65,46.75
path	61.30,50.02	60.46,50.11	58.76,50.43	56.82,51.16	55.42,52.22
path	53.50,52.61	53.16,56.18	51.94,57.54	50.38,58.57	49.34,61.86
path	47.74,65.34	49.23,69.53	48.13,71.47	48.25,74.69	49.98,75.97
path	49.97,78.84	48.59,80.24	48.26,82.33	46.66,83.76	46.10,86.08
path	44.27,84.64	42.70,82.63	41.20,79.51	44.09,78.36	43.80,75.03
path	43.88,73.08	42.35,72.24	41.90,68.97	43.39,69.35	45.54,68.99
path	45.03,65.70	43.83,62.98	43.15,60.77	43.09,56.64	43.61,52.80
path	41.37,48.89	42.58,47.61	41.37,44.96	43.42,44.79	43.15,42.53
path	43.28,39.61	42.28,38.89	41.58,37.21	42.55,35.50	42.04,33.21
path	45.13,32.85	46.58,30.52	46.71,28.37	48.20,28.72	49.48,31.40
path	50.44,34.37	52.43,34.60	56.90,37.50	58.56,39.33
Click ore as you follow the path around this area
|tip Track them on your minimap with "Find Minerals".
|tip You will need level 65 Mining to collect these.
collect 15 Tin Ore##2771 |n
|tip Smelt the ore at a forge.
collect 30 Bronze Bar##2841 |or
|tip Create them with Mining or purchase them from the auction house.
'|complete skill("Engineering") >= 175 |or
step
label "Collect_Wool_Cloth_Gizmo"
Follow the path up |goto The Barrens 62.21,7.28 < 15 |only if walking
Kill Venture Co. enemies around this area
|tip You can find more inside the mine.
collect 15 Wool Cloth##2592 |or |goto 60.91,3.82
|tip Farm them from level 16-30 humanoid mobs or purchase them from the auction house.
'|complete skill("Engineering") >= 175 |or
step
create 15 Whirring Bronze Gizmo##3942,Engineering,15 total |goto 79.61,22.95 |or
|tip Stand next to an anvil.
|tip Save these, you will need them for future steps.
'|complete skill("Engineering") >= 175 |or
step
create 15 Whirring Bronze Gizmo##3942,Engineering,150
|tip Stand next to an anvil.
|tip Save at least 15 of these; you will need them for future steps.
|tip You may need to create more or less of these.
|tip Each additional Whirring Bronze Gizmo requires 2 Bronze Bars and 1 Wool Cloth.
step
talk Roxxik##11017
|tip Inside the building.
Train Bronze Framework |learn Bronze Framework##3953 |goto Orgrimmar/0 76.18,25.18
stickystart "Collect_Medium_Leather_Framework"
stickystart "Collect_Wool_Cloth_Framework"
step
map Durotar
path follow smart; loop on; ants curved; dist 20
path	50.96,17.00	52.99,18.09	54.60,19.05	55.40,21.06	55.71,23.38
path	56.28,25.33	55.89,27.78	54.64,27.62	55.10,30.09	58.12,29.94
path	55.62,32.75	55.97,36.63	55.71,40.53	57.32,42.00	59.26,41.50
path	57.59,43.98	55.27,48.14	50.81,48.20	48.51,43.33	47.83,39.78
path	46.87,34.69	45.55,32.24	45.61,27.19	46.52,23.35	48.07,21.59
path	49.70,21.37	49.54,18.59
Click ore as you follow the path around this area
|tip Track them on your minimap with "Find Minerals".
collect 15 Copper Ore##2770 |or
|tip Save these for later.
collect 30 Bronze Bar##2841 |or
|tip Create them with Mining or purchase them from the auction house.
'|complete skill("Engineering") >= 175 |or
step
map The Barrens
path follow smart; loop on; ants curved; dist 20
path	59.10,40.30	60.19,40.99	61.84,40.54	62.14,43.04	62.65,46.75
path	61.30,50.02	60.46,50.11	58.76,50.43	56.82,51.16	55.42,52.22
path	53.50,52.61	53.16,56.18	51.94,57.54	50.38,58.57	49.34,61.86
path	47.74,65.34	49.23,69.53	48.13,71.47	48.25,74.69	49.98,75.97
path	49.97,78.84	48.59,80.24	48.26,82.33	46.66,83.76	46.10,86.08
path	44.27,84.64	42.70,82.63	41.20,79.51	44.09,78.36	43.80,75.03
path	43.88,73.08	42.35,72.24	41.90,68.97	43.39,69.35	45.54,68.99
path	45.03,65.70	43.83,62.98	43.15,60.77	43.09,56.64	43.61,52.80
path	41.37,48.89	42.58,47.61	41.37,44.96	43.42,44.79	43.15,42.53
path	43.28,39.61	42.28,38.89	41.58,37.21	42.55,35.50	42.04,33.21
path	45.13,32.85	46.58,30.52	46.71,28.37	48.20,28.72	49.48,31.40
path	50.44,34.37	52.43,34.60	56.90,37.50	58.56,39.33
Click ore as you follow the path around this area
|tip Track them on your minimap with "Find Minerals".
|tip You will need level 65 Mining to collect these.
collect 15 Tin Ore##2771 |n
|tip Smelt the ore at a forge.
collect 30 Bronze Bar##2841 |or
|tip Create them with Mining or purchase them from the auction house.
'|complete skill("Engineering") >= 175 |or
step
label "Collect_Medium_Leather_Framework"
Kill Yeti enemies around this area
|tip Skin their corpses.
|tip You can find more inside the cave.
|tip You will need level 155 Skinning to collect these.
collect 15 Medium Leather##2319 |or |goto Hillsbrad Foothills 46.12,31.76
|tip Farm them with Skinning or purchase them from the auction house.
'|complete skill("Engineering") >= 160 |or
step
label "Collect_Wool_Cloth_Framework"
Follow the path up |goto The Barrens 62.21,7.28 < 15 |only if walking
Kill Venture Co. enemies around this area
|tip You can find more inside the mine.
collect 15 Wool Cloth##2592 |or |goto 60.91,3.82
|tip Farm them from level 16-30 humanoid mobs or purchase them from the auction house.
'|complete skill("Engineering") >= 160 |or
step
create 15 Bronze Framework##3953,Engineering,15 total |or
|tip Save these, you will need them for future steps.
'|complete skill("Engineering") >= 175 |or
step
create 1 Bronze Framework##3953,Engineering,160
|tip Save at least 15 of these; you will need them for future steps.
step
talk Roxxik##11017
|tip Inside the building.
Train Explosive Sheep |learn Explosive Sheep##3955 |goto Orgrimmar/0 76.18,25.18
stickystart "Collect_Whirring_Bronze_Gizmo_175"
stickystart "Collect_Bronze_Framework_175"
stickystart "Collect_Wool_Cloth_175"
step
collect 30 Heavy Blasting Powder##4377 |or
|tip You created these in a previous step.
'|complete skill("Engineering") >= 175 |or
step
label "Collect_Whirring_Bronze_Gizmo_175"
collect 15 Whirring Bronze Gizmo##4375 |or
|tip You created these in a previous step.
'|complete skill("Engineering") >= 175 |or
step
label "Collect_Bronze_Framework_175"
collect 15 Bronze Framework##4382 |or
|tip You created these in a previous step.
'|complete skill("Engineering") >= 175 |or
step
label "Collect_Wool_Cloth_175"
Follow the path up |goto The Barrens 62.21,7.28 < 15 |only if walking
Kill Venture Co. enemies around this area
|tip You can find more inside the mine.
collect 30 Wool Cloth##2592 |or |goto 60.91,3.82
|tip Farm them from level 16-30 humanoid mobs or purchase them from the auction house.
'|complete skill("Engineering") >= 175 |or
step
create 15 Explosive Sheep##3955,Engineering,175 |goto 79.61,22.95
|tip Stand next to an anvil.
|tip Save 5 of these if you intend to specialize in Goblin Engineering later.
step
talk Roxxik##11017
|tip Inside the building.
Train Gyromatic Micro-Adjustor |learn Gyromatic Micro-Adjustor##12590 |goto Orgrimmar/0 76.18,25.18
step
map Arathi Highlands
path follow smart; loop on; ants curved; dist 20
path	78.66,36.13	77.36,41.29	75.00,44.93	72.65,48.07	70.58,55.05
path	69.99,58.40	72.92,59.03	72.28,63.63	72.78,66.86	71.75,66.15
path	69.15,72.54	67.17,70.90	63.52,73.55	59.48,74.71	59.32,70.74
path	56.16,71.89	50.82,78.41	47.96,82.44	42.53,80.75	43.02,77.16
path	40.39,71.86	37.95,67.63	38.52,68.50	33.94,66.02	34.59,61.64
path	33.70,56.77	33.45,53.94	33.65,50.19	35.00,47.28	32.96,46.68
path	31.68,45.41	32.34,42.64	31.42,41.24	25.23,43.10	20.94,39.12
path	20.02,35.80	19.12,33.36	22.43,31.28	23.48,24.90	26.93,20.65
path	28.65,14.18	28.96,16.96	31.62,18.63	30.96,20.36	33.19,21.23
path	36.35,24.61	39.97,25.62	40.21,28.79	43.97,30.51	45.70,33.02
path	48.08,33.60	49.78,36.76	52.14,36.11	52.75,31.99	54.80,33.13
path	58.19,32.50	58.02,34.22	59.94,35.97	62.25,32.06	64.69,35.58
path	64.49,26.56	66.77,27.64	70.39,27.07	70.47,30.74	72.89,30.09
path	76.73,29.48	76.70,33.68	79.56,35.45
Click ore as you follow the path around this area
|tip Track them on your minimap with "Find Minerals".
|tip You will need level 125 Mining to collect these.
collect 4 Iron Ore##2772 |n
|tip Buy 4 Coal from a nearby supplier.
|tip Smelt the ore at a forge.
collect 4 Steel Bar##3859 |or
|tip Create them with Mining or purchase them from the auction house.
'|complete skill("Engineering") >= 300 or itemcount(10498) >= 1 |or
step
create 1 Gyromatic Micro-Adjustor##12590,Engineering,1 total |goto 79.61,22.95 |or
|tip Stand next to an anvil.
|tip Save this, you will need it for future steps.
'|complete skill("Engineering") >= 300 |or
step
talk Roxxik##11017
|tip Inside the building.
Train Solid Blasting Powder |learn Solid Blasting Powder##12585 |goto Orgrimmar/0 76.18,25.18
step
map Badlands
path follow smart; loop on; ants curved; dist 20
path	26.84,74.76	25.28,78.53	19.71,81.32	14.75,83.82	12.50,85.54
path	7.98,80.56	6.30,74.40	8.68,67.97	17.19,68.54	15.13,72.43
path	17.19,77.39	21.25,75.06	25.11,72.08
Click ore as you follow the path around this area
|tip Track them on your minimap with "Find Minerals".
|tip You will need level 175 Mining to collect these.
collect 120 Solid Stone##7912 |or
|tip Farm them with Mining or purchase them from the auction house.
'|complete skill("Engineering") >= 195 |or
step
create 60 Solid Blasting Powder##12585,Engineering,60 total |or
|tip Save these, you will need them for future steps.
'|complete skill("Engineering") >= 250 |or
step
create 1 Solid Blasting Powder##12585,Engineering,195
|tip Save at least 60 of these; you will need them for future steps.
|tip You may need to create more of these.
|tip Each additional Solid Blasting Powder requires 2 Solid Stone.
step
talk Roxxik##11017
|tip Inside the building.
Train Mithril Tube |learn Mithril Tube##12589 |goto Orgrimmar/0 76.18,25.18
step
map Badlands
path follow smart; loop on; ants curved; dist 20
path	26.84,74.76	25.28,78.53	19.71,81.32	14.75,83.82	12.50,85.54
path	7.98,80.56	6.30,74.40	8.68,67.97	17.19,68.54	15.13,72.43
path	17.19,77.39	21.25,75.06	25.11,72.08
Click ore as you follow the path around this area
|tip Track them on your minimap with "Find Minerals".
|tip You will need level 175 Mining to collect these.
collect 21 Mithril Ore##3858 |n
|tip Smelt the ore at a forge.
collect 21 Mithril Bar##3860 |or
|tip Create them with Mining or purchase them from the auction house.
'|complete skill("Engineering") >= 200 |or
step
create 7 Mithril Tube##12589,Engineering,200 |goto 79.61,22.95
|tip Stand next to an anvil.
|tip You  may need to create more or less of these.
|tip Each additional Mithril Tube requires 3 Mithril Bars.
|tip Save 6 of these if you intend to specialize in Gnomish Engineering later.
step
talk Roxxik##11017
|tip Inside the building.
Train Unstable Trigger |learn Unstable Trigger##12591 |goto Orgrimmar/0 76.18,25.18
stickystart "Collect_Mithril_Bar_216"
stickystart "Collect_Mageweave_Cloth_216"
step
collect 20 Solid Blasting Powder##10505 |or
|tip You created these in a previous step.
'|complete skill("Engineering") >= 216 |or
step
label "Collect_Mithril_Bar_216"
collect 20 Mithril Bar##3860 |or
|tip Create them with Mining or purchase them from the auction house.
'|complete skill("Engineering") >= 216 |or
step
label "Collect_Mageweave_Cloth_216"
Kill Dunemaul enemies around this area
collect 20 Mageweave Cloth##4338 |or |goto Tanaris/0 40.50,55.50
|tip Farm them from level 38-50 humanoid mobs or purchase them from the auction house.
'|complete skill("Engineering") >= 216 |or
step
create 20 Unstable Trigger##12591,Engineering,20 total |goto 79.61,22.95 |or
|tip Stand next to an anvil.
|tip Save these, you will need them for future steps.
'|complete skill("Engineering") >= 250 |or
step
create 20 Unstable Trigger##12591,Engineering,216 |goto 79.61,22.95
|tip Stand next to an anvil.
|tip Save at least 20 of these; you will need them for future steps.
|tip You may need to create more or less of these.
|tip Each additional Unstable Trigger requires 1 Solid Blasting Powder, 1 Mithril Bar, and 1 Mageweave Cloth.
step
Reach Level 35 |ding 35
|tip You must be at least level 35 to train Artisan professions.
|tip Use the leveling guides to accomplish this.
step
talk Roxxik##11017
|tip Inside the building.
Train Artisan Engineering |skillmax Engineering,300 |goto Orgrimmar/0 76.18,25.18
step
talk Roxxik##11017
|tip Inside the building.
Train Mithril Casing |learn Mithril Casing##12599 |goto Orgrimmar/0 76.18,25.18
step
map Badlands
path follow smart; loop on; ants curved; dist 20
path	26.84,74.76	25.28,78.53	19.71,81.32	14.75,83.82	12.50,85.54
path	7.98,80.56	6.30,74.40	8.68,67.97	17.19,68.54	15.13,72.43
path	17.19,77.39	21.25,75.06	25.11,72.08
Click ore as you follow the path around this area
|tip Track them on your minimap with "Find Minerals".
|tip You will need level 175 Mining to collect these.
collect 120 Mithril Ore##3858 |n
|tip Smelt the ore at a forge.
collect 120 Mithril Bar##3860 |or
|tip Create them with Mining or purchase them from the auction house.
'|complete skill("Engineering") >= 238 |or
step
create 40 Mithril Casing##12599,Engineering,40 total |goto Orgrimmar/0 79.61,22.95 |or
|tip Stand next to an anvil.
|tip Save these, you will need them for future steps.
'|complete skill("Engineering") >= 250 |or
step
create 40 Mithril Casing##12599,Engineering,238 |goto Orgrimmar/0 79.61,22.95
|tip Stand next to an anvil.
|tip Save at least 40 of these; you will need them for future steps.
|tip You may need to create more or less of these.
|tip Each additional Mithril Casing requires 3 Mithril Bars.
step
talk Roxxik##11017
|tip Inside the building.
Train Hi-Explosive Bomb |learn Hi-Explosive Bomb##12619 |goto Orgrimmar/0 76.18,25.18
stickystart "Collect_Unstable_Trigger_250"
stickystart "Collect_Mithril_Casing_250"
step
collect 40 Solid Blasting Powder##10505 |or
|tip You created these in a previous step.
'|complete skill("Engineering") >= 250 |or
step
label "Collect_Unstable_Trigger_250"
collect 20 Unstable Trigger##10560 |or
|tip You created these in a previous step.
'|complete skill("Engineering") >= 250 |or
step
label "Collect_Mithril_Casing_250"
collect 40 Mithril Casing##10561 |or
|tip You created these in a previous step.
'|complete skill("Engineering") >= 250 |or
step
create 20 Hi-Explosive Bomb##12619,Engineering,250 |goto Orgrimmar/0 79.61,22.95
|tip Stand next to an anvil.
|tip You may need to create more or less of these.
|tip Each additional Hi-Explosive Bomb requires 2 Solid Blasting Powders, 1 Unstable Trigger, and 1 Mithril Casing.
step
talk Roxxik##11017
|tip Inside the building.
Train Dense Blasting Powder |learn Dense Blasting Powder##19788 |goto Orgrimmar/0 76.18,25.18
step
map Un'Goro Crater
path follow smart; loop on; ants curved; dist 20
path	66.46,78.95	64.56,79.71	61.79,84.21	59.34,84.18	57.63,86.04
path	54.50,86.69	51.13,86.82	48.27,87.30	45.98,86.58	42.89,85.00
path	40.79,83.52	37.91,83.14	36.77,80.17	33.58,79.05	30.40,79.61
path	28.89,76.98	28.97,71.52	26.00,67.67	25.93,63.53	24.59,58.51
path	23.95,53.04	24.40,48.21	23.89,44.76	24.71,41.12	26.26,36.59
path	26.62,31.21	28.29,29.47	29.59,25.66	29.89,20.92	33.32,20.67
path	36.29,20.47	38.67,16.00	41.73,15.77	43.32,14.12	46.94,13.03
path	49.79,13.83	52.84,12.88	56.31,14.04	59.61,16.58	62.25,16.02
path	64.19,19.90	65.99,21.01	68.51,20.26	71.19,20.89	71.21,23.75
path	71.75,28.19	74.76,32.46	75.06,37.15	76.32,43.15	76.67,48.32
path	77.05,53.09	76.56,57.02	75.35,61.97	74.66,68.05	72.92,70.46
path	71.39,73.80	71.00,79.21	68.32,79.90
Click ore as you follow the path around this area
|tip Track them on your minimap with "Find Minerals".
|tip You will need level 245 Mining to collect these.
collect 70 Dense Stone##12365 |or
|tip Farm them with Mining or purchase them from the auction house.
'|complete skill("Engineering") >= 260 |or
step
create 35 Dense Blasting Powder##19788,Engineering,260
|tip You may need to create more or less of these.
|tip Each additional Dense Blasting Powder requires 2 Dense Stone.
|tip Save these for a later step.
step
talk Roxxik##11017
|tip Inside the building.
Train Thorium Widget |learn Thorium Widget##19791 |goto Orgrimmar/0 76.18,25.18
stickystart "Collect_Runecloth_285"
step
map Un'Goro Crater
path follow smart; loop on; ants curved; dist 20
path	66.46,78.95	64.56,79.71	61.79,84.21	59.34,84.18	57.63,86.04
path	54.50,86.69	51.13,86.82	48.27,87.30	45.98,86.58	42.89,85.00
path	40.79,83.52	37.91,83.14	36.77,80.17	33.58,79.05	30.40,79.61
path	28.89,76.98	28.97,71.52	26.00,67.67	25.93,63.53	24.59,58.51
path	23.95,53.04	24.40,48.21	23.89,44.76	24.71,41.12	26.26,36.59
path	26.62,31.21	28.29,29.47	29.59,25.66	29.89,20.92	33.32,20.67
path	36.29,20.47	38.67,16.00	41.73,15.77	43.32,14.12	46.94,13.03
path	49.79,13.83	52.84,12.88	56.31,14.04	59.61,16.58	62.25,16.02
path	64.19,19.90	65.99,21.01	68.51,20.26	71.19,20.89	71.21,23.75
path	71.75,28.19	74.76,32.46	75.06,37.15	76.32,43.15	76.67,48.32
path	77.05,53.09	76.56,57.02	75.35,61.97	74.66,68.05	72.92,70.46
path	71.39,73.80	71.00,79.21	68.32,79.90
Click ore as you follow the path around this area
|tip Track them on your minimap with "Find Minerals".
|tip You will need level 245 Mining to collect these.
collect 105 Thorium Ore##10620 |n
|tip Smelt the ore at a forge.
collect 105 Thorium Bar##12359 |or
|tip Create them with Mining or purchase them from the auction house.
'|complete skill("Engineering") >= 285 |or
step
label "Collect_Runecloth_285"
Kill Blackrock enemies around this area
|tip You can find more inside the building.
collect 35 Runecloth###14047 |or |goto Burning Steppes 42.17,35.64
|tip Farm them from level 50+ humanoid mobs or purchase them from the auction house.
'|complete skill("Engineering") >= 285 |or
step
create 35 Thorium Widget##19791,Engineering,285 |goto Orgrimmar/0 79.61,22.95
|tip Stand next to an anvil.
|tip You may need to create more or less of these.
|tip Each additional Thorium Widget requires 3 Thorium Bar and 2 Runecloth.
step
talk Roxxik##11017
|tip Inside the building.
Train Thorium Shells |learn Thorium Shells##19800 |goto Orgrimmar/0 76.18,25.18
step
map Un'Goro Crater
path follow smart; loop on; ants curved; dist 20
path	66.46,78.95	64.56,79.71	61.79,84.21	59.34,84.18	57.63,86.04
path	54.50,86.69	51.13,86.82	48.27,87.30	45.98,86.58	42.89,85.00
path	40.79,83.52	37.91,83.14	36.77,80.17	33.58,79.05	30.40,79.61
path	28.89,76.98	28.97,71.52	26.00,67.67	25.93,63.53	24.59,58.51
path	23.95,53.04	24.40,48.21	23.89,44.76	24.71,41.12	26.26,36.59
path	26.62,31.21	28.29,29.47	29.59,25.66	29.89,20.92	33.32,20.67
path	36.29,20.47	38.67,16.00	41.73,15.77	43.32,14.12	46.94,13.03
path	49.79,13.83	52.84,12.88	56.31,14.04	59.61,16.58	62.25,16.02
path	64.19,19.90	65.99,21.01	68.51,20.26	71.19,20.89	71.21,23.75
path	71.75,28.19	74.76,32.46	75.06,37.15	76.32,43.15	76.67,48.32
path	77.05,53.09	76.56,57.02	75.35,61.97	74.66,68.05	72.92,70.46
path	71.39,73.80	71.00,79.21	68.32,79.90
Click ore as you follow the path around this area
|tip Track them on your minimap with "Find Minerals".
|tip You will need level 245 Mining to collect these.
collect 30 Thorium Ore##10620 |n
|tip Smelt the ore at a forge.
collect 30 Thorium Bar##12359 |or
|tip Create them with Mining or purchase them from the auction house.
'|complete skill("Engineering") >= 300 |or
step
collect 15 Dense Blasting Powder##15992 |or
|tip You created these in a previous step.
'|complete skill("Engineering") >= 300 |or
step
create 15 Thorium Shells##19800,Engineering,300 |goto Orgrimmar/0 79.61,22.95
|tip Stand next to an anvil.
|tip You may need to create more of these.
|tip Each additional Thorium Shells requires 2 Thorium Bar and 1 Dense Blasting Powder.
step
Reach Level 50 |ding 50
|tip You must be at least level 50 to train Master professions.
|tip Use the leveling guides to accomplish this.
step
talk Zebig##18752
Learn Master Engineering |skillmax Engineering,375 |goto Hellfire Peninsula/0 54.78,38.51
step
talk Zebig##18752
Train Handful of Fel Iron Bolts |learn Handful of Fel Iron Bolts##30305 |goto Hellfire Peninsula/0 54.78,38.51
step
talk Zebig##18752
Train Elemental Blasting Powder |learn Elemental Blasting Powder##30303 |goto Hellfire Peninsula/0 54.78,38.51
step
talk Zebig##18752
Train Fel Iron Casing |learn Fel Iron Casing##30304 |goto Hellfire Peninsula/0 54.78,38.51
step
map Hellfire Peninsula/0
path	65.97,48.02	69.02,46.87	70.80,50.94	70.25,54.41	70.27,59.32
path	72.23,60.13	74.08,63.37	76.97,62.92	78.97,66.32	78.85,70.21
path	79.70,74.48	80.75,77.99	77.91,75.80	77.13,73.33	76.82,69.54
path	75.53,67.17	71.66,67.33	69.41,67.29	68.38,60.74	65.36,60.83
path	65.69,64.45	63.25,69.06	62.72,72.99	62.49,79.96	58.89,76.64
path	57.05,73.97	57.06,81.30	56.40,82.14	55.54,83.79	52.24,83.83
path	49.82,83.52	46.85,84.82	42.98,79.36	42.26,76.62	44.54,73.42
path	47.44,71.34	50.85,69.85	47.41,66.63	44.75,68.48	45.62,61.55
path	47.89,59.49	49.89,56.45	49.95,61.42	51.38,61.68	52.93,58.38
path	55.41,56.25	56.22,53.50	58.62,52.98	62.69,50.44
click Fel Iron Deposit##181555+
|tip They look like green mineral clusters around this path.
|tip Enter caves along the path.
|tip Make sure you enable "Find Minerals" in the tracking menu on the minimap.
collect 228 Fel Iron Ore##23424 |n
|tip Smelt the ore at a forge.
collect 114 Fel Iron Bar##23445 |or
|tip Create them with Mining or purchase them from the auction house.
'|complete skill("Engineering") >= 320 |or
step
create 114 Handful of Fel Iron Bolts##30305,Engineering,114 total |goto 53.07,38.04 |or
|tip Stand next to an anvil.
|tip Save these, you will need them for future steps.
'|complete skill("Engineering") >= 320 |or
step
map Hellfire Peninsula/0
path	65.97,48.02	69.02,46.87	70.80,50.94	70.25,54.41	70.27,59.32
path	72.23,60.13	74.08,63.37	76.97,62.92	78.97,66.32	78.85,70.21
path	79.70,74.48	80.75,77.99	77.91,75.80	77.13,73.33	76.82,69.54
path	75.53,67.17	71.66,67.33	69.41,67.29	68.38,60.74	65.36,60.83
path	65.69,64.45	63.25,69.06	62.72,72.99	62.49,79.96	58.89,76.64
path	57.05,73.97	57.06,81.30	56.40,82.14	55.54,83.79	52.24,83.83
path	49.82,83.52	46.85,84.82	42.98,79.36	42.26,76.62	44.54,73.42
path	47.44,71.34	50.85,69.85	47.41,66.63	44.75,68.48	45.62,61.55
path	47.89,59.49	49.89,56.45	49.95,61.42	51.38,61.68	52.93,58.38
path	55.41,56.25	56.22,53.50	58.62,52.98	62.69,50.44
click Fel Iron Deposit##181555+
|tip They look like green mineral clusters around this path.
|tip Enter caves along the path.
|tip Make sure you enable "Find Minerals" in the tracking menu on the minimap.
collect 312 Fel Iron Ore##23424 |n
|tip Smelt the ore at a forge.
collect 156 Fel Iron Bar##23445 |or
|tip Create them with Mining or purchase them from the auction house.
'|complete skill("Engineering") >= 321 |or
step
create 52 Fel Iron Casing##30304,Engineering,52 total |goto 53.07,38.04 |or
|tip Stand next to an anvil.
|tip Save these, you will need them for future steps.
'|complete skill("Engineering") >= 321 |or
stickystart "Collect_Mote_of_Fire_320"
step
label "Collect_Motes_of_Earth_321"
map Nagrand/0
path follow smart; loop off; ants curved; dist 30
path	46.19,77.20	41.98,78.72	40.31,82.83	32.13,80.25	29.34,79.24
path	28.40,73.85	28.94,66.76	28.17,63.58
kill Shattered Rumbler##17157+
|tip Follow the path, killing any that you see.
collect 40 Mote of Earth##22573 |or
|tip Farm them with Mining or purchase them from the auction house.
'|goto Nagrand/0 28.17,63.58 < 30 |c |noway |or
'|complete skill("Engineering") >= 321 |or
step
map Nagrand/0
path follow smart; loop off; ants curved; dist 30
path	28.17,63.58	28.94,66.76	28.40,73.85	29.34,79.24	32.13,80.25
path	40.31,82.83	41.98,78.72	46.19,77.20
kill Shattered Rumbler##17157+
|tip Follow the path, killing any that you see.
collect 40 Mote of Earth##22573 |or
|tip Farm them with Mining or purchase them from the auction house.
'|goto Nagrand/0 46.19,77.20 < 30 |c |noway |next "Collect_Motes_of_Earth_321" |or
|tip Farm them with Mining or purchase them from the auction house.
'|complete skill("Engineering") >= 321 |or
step
label "Collect_Mote_of_Fire_320"
map Shadowmoon Valley/0
path	loop off; ants curved; dist 25
path	44.47,46.46	46.81,48.88	48.83,51.69	51.70,52.00
kill Enraged Fire Spirit##21061+
collect 20 Mote of Fire##22574 |or
|tip Farm them with Mining or purchase them from the auction house.
'|goto 51.70,52.00 |noway |c |or
|tip Farm them with Mining or purchase them from the auction house.
'|complete skill("Engineering") >= 321 |or
step
kill Enraged Fire Spirit##21061
map Shadowmoon Valley/0
path	loop off; ants curved; dist 25
path	48.34,46.75	47.93,42.37	49.03,37.97	51.34,36.12	49.04,34.47
kill Enraged Fire Spirit##21061+
collect 20 Mote of Fire##22574 |or
|tip Farm them with Mining or purchase them from the auction house.
'|goto 49.04,34.47 |noway |c |next "Collect_Mote_of_Fire_Total" |or
|tip Farm them with Mining or purchase them from the auction house.
'|complete skill("Engineering") >= 321 |or
step
|tip Stand next to an anvil.
|tip Save these, you will need them for future steps.
create 20 Elemental Blasting Powder##30303,Engineering,20 total |goto Hellfire Peninsula/0 53.07,38.04 |or
'|complete skill("Engineering") >= 321 |or
step
create Fel Iron Casing##30304,Engineering,320 |goto 53.07,38.04
|tip Stand next to an anvil.
|tip You may need to create more of these.
|tip Each additional Fel Iron Casing requires 3 Fel Iron Bars.
step
talk Zebig##18752
Train Fel Iron Bomb |learn Fel Iron Bomb##30310 |goto 54.78,38.51
stickystart "Collect_Fel_Iron_Casing_325"
stickystart "Collect_Elemental_Blasting_Powder_325"
step
collect 14 Handful of Fel Iron Bolts##23783 |or
|tip You created these in a previous step.
'|complete skill("Engineering") >= 325 |or
step
label "Collect_Fel_Iron_Casing_325"
collect 7 Fel Iron Casing##23782 |or
|tip You created these in a previous step.
'|complete skill("Engineering") >= 325 |or
step
label "Collect_Elemental_Blasting_Powder_325"
collect 7 Elemental Blasting Powder##23781 |or
|tip You created these in a previous step.
'|complete skill("Engineering") >= 325 |or
step
create 7 Fel Iron Bomb##30310,Engineering,325 |goto 53.07,38.04
|tip Stand next to an anvil.
|tip You may need to make more or less of these.
step
talk Zebig##18752
Train Adamantite Frame |learn Adamantite Frame##30306 |goto 54.78,38.51
stickystart "Collect_Primal_Earth_336"
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
collect 240 Adamantite Ore##23425 |n
|tip Smelt the ore at a forge.
collect 120 Adamantite Bar##23446 |or
|tip Create them with Mining or purchase them from the auction house.
'|complete skill("Engineering") >= 336 |or
step
label "Collect_Primal_Earth_336"
map Shadowmoon Valley/0
path	loop off; ants curved; dist 25
path	44.47,46.46	46.81,48.88	48.83,51.69	51.70,52.00
kill Enraged Fire Spirit##21061+
collect 30 Primal Earth##22452 |or
|tip Combine 10 Motes of Fire into 1 Primal Earth.
|tip Farm them with Mining or purchase them from the auction house.
'|goto 51.70,52.00 |noway |c |or
'|complete skill("Engineering") >= 336 |or
step
kill Enraged Fire Spirit##21061
map Shadowmoon Valley/0
path	loop off; ants curved; dist 25
path	48.34,46.75	47.93,42.37	49.03,37.97	51.34,36.12	49.04,34.47
kill Enraged Fire Spirit##21061+
use the Mote of Earth##22574
|tip Combine 10 Motes of Earth into 1 Primal Earth.
collect 30 Primal Earth##22452 |or
|tip Farm them with Mining or purchase them from the auction house.
'|goto 49.04,34.47 |noway |c |next "Collect_Primal_Earth_336" |or
'|complete skill("Engineering") >= 336 |or
step
create 30 Adamantite Frame##30306,Engineering,30 total |goto Hellfire Peninsula/0 53.07,38.04 |or
|tip Stand next to an anvil.
|tip Save these, you will need them for future steps.
'|complete skill("Engineering") >= 336 |or
step
create 50 Adamantite Frame##30306,Engineering,335 |goto 53.07,38.04
|tip Stand next to an anvil.
|tip Save these, you will need them for future steps.
|tip You may need to make a few more of these.
|tip Each additional Adamantite Frame requires 4 Adamantite Bars and 1 Primal Earth.
step
talk Wind Trader Lathrai##18484
buy 1 Schematic: White Smoke Flare##23811 |goto Shattrath City/0 72.23,30.74 |or
|tip This is a limited supply item that can also be purchased from the auction house.
'|complete skill("Engineering") >= 355 |or
step
use the Schematic: White Smoke Flare##23811
Train White Smoke Flare |learn White Smoke Flare##30341
stickystart "Collect_Elemental_Blasting_Powder_325"
step
map Shadowmoon Valley/0
path follow smart; loop on; ants curved; dist 20
path	51.1,58.8	53.0,59.3	53.2,60.5	52.8,63.2	52.8,65.4
path	52.9,69.0	52.5,71.8	47.3,71.1	45.8,71.3	45.2,69.2
path	45.6,66.1	48.0,67.2
Kill enemies around this area
collect 70 Netherweave Cloth##21877 |or
|tip Farm them from humanoid mobs in Outland or purchase them from the auction house.
'|complete skill("Engineering") >= 355 |or
step
label "Collect_Elemental_Blasting_Powder_325"
collect 70 Elemental Blasting Powder##23781 |or
|tip You created these in a previous step.
'|complete skill("Engineering") >= 355 |or
step
create 70 White Smoke Flare##30341,Engineering,355 |goto Shattrath City/0 69.35,42.89
|tip Stand next to an anvil.
|tip You may need to make more or less of these.
|tip Each additional White Smoke Flare requires 1 Netherweave Cloth and 1 Elemental Blasting Powder.
step
talk Viggz Shinesparked##19661
buy 1 Schematic: Adamantite Rifle##23799 |goto 64.95,69.67 |or
'|complete skill("Engineering") >= 370 |or
step
talk Zebig##18752
Train Khorium Power Core |learn Khorium Power Core##30308 |goto Hellfire Peninsula/0 54.78,38.51
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
|tip Make sure you enable "Find Minerals" in the tracking menu on the minimap.
collect 30 Khorium Ore##23426 |n
|tip Smelt the ore at a forge.
collect 15 Khorium Bar##23449 |or
|tip Create them with Mining or purchase them from the auction house.
'|complete skill("Engineering") >= 360 |or
step
label "Collect_Primal_Fire_360"
map Shadowmoon Valley/0
path	loop off; ants curved; dist 25
path	44.47,46.46	46.81,48.88	48.83,51.69	51.70,52.00
kill Enraged Fire Spirit##21061+
|tip Follow the path, killing any that you see.
use the Mote of Fire##22574
|tip Combine 10 Motes of Fire into 1 Primal Fire.
collect 5 Primal Fire##21884 |or
|tip Farm them with Mining or purchase them from the auction house.
'|goto 51.70,52.00 |noway |c |or
'|complete skill("Engineering") >= 360 |or
step
kill Enraged Fire Spirit##21061
map Shadowmoon Valley/0
path	loop off; ants curved; dist 25
path	48.34,46.75	47.93,42.37	49.03,37.97	51.34,36.12	49.04,34.47
kill Enraged Fire Spirit##21061+
|tip Follow the path, killing any that you see.
use the Mote of Fire##22574
|tip Combine 10 Motes of Fire into 1 Primal Fire.
collect 5 Primal Fire##21884 |or
|tip Farm them with Mining or purchase them from the auction house.
'|goto 49.04,34.47 |noway |c |next "Collect_Primal_Fire_360" |or
'|complete skill("Engineering") >= 360 |or
step
create 5 Khorium Power Core##30308,Engineering,360 |goto Shattrath City/0 69.35,42.89
|tip Stand next to an anvil.
|tip Save these, you will need them for future steps.
step
use the Schematic: Adamantite Rifle##23799
Train Adamantite Rifle |learn Adamantite Rifle##30313
stickystart "Collect_Fel_Iron_Casing_370"
stickystart "Collect_Adamantite_Frame_370"
step
collect 60 Handful of Fel Iron Bolts##23783 |or
|tip You created these in a previous step.
'|complete skill("Engineering") >= 370 |or
step
label "Collect_Fel_Iron_Casing_370"
collect 45 Fel Iron Casing##23782 |or
|tip You created these in a previous step.
'|complete skill("Engineering") >= 370 |or
step
label "Collect_Adamantite_Frame_370"
collect 30 Adamantite Frame##23784 |or
|tip You created these in a previous step.
'|complete skill("Engineering") >= 370 |or
step
create 15 Adamantite Rifle##30313,Engineering,370 |goto 69.35,42.89
|tip Stand next to an anvil.
|tip You may need to make more or less of these.
|tip Each additional Adamantite Rifle requires 3 Fel Iron Casings, 2 Adamantite Frames, and 4 Handfuls of Fel Iron Bolts.
step
kill Gan'arg Analyzer##23386+
collect Schematic: Field Repair Bot 110G##34114 |goto Blade's Edge Mountains/0 27.74,68.36 |or
You can find more around:
[31.74,63.97]
[33.29,51.80]
[28.88,46.60]
'|learn Field Repair Bot 110G##44391 |or
step
use the Schematic: Field Repair Bot 110G##34114
Learn Field Repair Bot 110G |learn Field Repair Bot 110G##44391
stickystart "Collect_Adamantite_Bars_375"
stickystart "Collect_Khorium_Power_Core_375"
step
collect 40 Handful of Fel Iron Bolts##23783 |or
|tip You created these in a previous step.
'|complete skill("Engineering") >= 375 |or
step
label "Collect_Adamantite_Bars_375"
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
collect 80 Adamantite Ore##23425 |n
|tip Smelt the ore at a forge.
collect 40 Adamantite Bar##23446 |or
|tip Create them with Mining or purchase them from the auction house.
'|complete skill("Engineering") >= 375 |or
step
label "Collect_Khorium_Power_Core_375"
collect 5 Khorium Power Core##23786 |or
|tip You created these in a previous step.
'|complete skill("Engineering") >= 375 |or
step
create Adamantite Rifle##44391,Engineering,375 |goto 69.35,42.89
|tip Stand next to an anvil.
|tip This is generaly the cheapest recipe to max level.
|tip Each additional Field Repair Bot 110G requires 8 Handfuls of Fel Iron Bolts, 8 Adamantite Bars, and 1 Khorium Power Core.
step
_Congratulations!_
You Reached Skill 375 in Engineering.
]])
ZygorGuidesViewer:RegisterGuide("Profession Guides\\First Aid\\First Aid (1-375)",{
author="support@zygorguides.com",
condition_suggested=function() return skill("First Aid") > 0 and skill("First Aid") < 375 end,
description="This guide will walk you through leveling your First Aid skill from 1-375.",
},[[
step
talk Arnok##3373
|tip Inside the building.
Train Apprentice First Aid |skillmax First Aid,75 |goto Orgrimmar/0 34.18,84.58
step
Inside Ragefire Chasm:
Kill Ragefire enemies throughout the dungeon
collect 50 Linen Cloth##2589 |or
|tip You can also purchase them from the Auction House.
'|complete skill("First Aid") >= 40 |or
step
create 50 Linen Bandage##3275,First Aid,40
step
talk Arnok##3373
|tip Inside the building.
Train Heavy Linen Bandage |learn Heavy Linen Bandage##3276 |goto Orgrimmar/0 34.18,84.58
step
Inside Ragefire Chasm:
Kill Ragefire enemies throughout the dungeon
collect 80 Linen Cloth##2589 |or
|tip You can also purchase them from the Auction House.
'|complete skill("First Aid") >= 70 |or
step
create 40 Heavy Linen Bandage##3276,First Aid,70
step
talk Arnok##3373
|tip Inside the building.
Train Journeyman First Aid |skillmax First Aid,150 |goto Orgrimmar/0 34.18,84.58
step
Inside Ragefire Chasm:
Kill Ragefire enemies throughout the dungeon
collect 50 Linen Cloth##2589 |or
|tip You can also purchase them from the Auction House.
'|complete skill("First Aid") >= 80 |or
step
create 25 Heavy Linen Bandage##3276,First Aid,80
step
talk Arnok##3373
|tip Inside the building.
Train Wool Bandage |learn Wool Bandage##3277 |goto Orgrimmar/0 34.18,84.58
step
Follow the path up |goto The Barrens 62.21,7.28 < 15 |only if walking
Kill Venture Co. enemies around this area
|tip You can find more inside the mine.
collect 60 Wool Cloth##2592 |or |goto 60.91,3.82
|tip You can also purchase them from the Auction House.
'|complete skill("First Aid") >= 115 |or
step
create 60 Wool Bandage##3277,First Aid,115
step
talk Arnok##3373
|tip Inside the building.
Train Heavy Wool Bandage |learn Heavy Wool Bandage##3278 |goto Orgrimmar/0 34.18,84.58
step
Follow the path up |goto The Barrens 62.21,7.28 < 15 |only if walking
Kill Venture Co. enemies around this area
|tip You can find more inside the mine.
collect 110 Wool Cloth##2592 |or |goto 60.91,3.82
|tip You can also purchase them from the Auction House.
'|complete skill("First Aid") >= 150 |or
step
create 55 Heavy Wool Bandage##3278,First Aid,150
step
talk Arnok##3373
|tip Inside the building.
Train Silk Bandage |learn Silk Bandage##7928 |goto Orgrimmar/0 34.18,84.58
step
talk Balai Lok'Wein##13476
buy Expert First Aid - Under Wraps##16084 |n
use the Expert First Aid - Under Wraps##16084
Train Expert First Aid |skillmax First Aid,225 |goto Dustwallow Marsh 36.49,30.36
step
talk Balai Lok'Wein##13476
buy Manual: Heavy Silk Bandage##16112 |goto 36.49,30.36
buy Manual: Mageweave Bandage##16113 |goto 36.49,30.36
|tip Save these for later.
step
Kill Galak enemies around this area
|tip You can find more inside the cave.
collect 50 Silk Cloth##4306 |or |goto Thousand Needles 44.01,37.41
|tip You can also purchase them from the Auction House.
'|complete skill("First Aid") >= 180 |or
step
create 50 Silk Bandage##7928,First Aid,180
step
use Manual: Heavy Silk Bandage##16112
Train Heavy Silk Bandage |learn Heavy Silk Bandage##7929
step
Kill Galak enemies around this area
|tip You can find more inside the cave.
collect 90 Silk Cloth##4306 |or |goto Thousand Needles 44.01,37.41
|tip You can also purchase them from the Auction House.
'|complete skill("First Aid") >= 210 |or
step
create 45 Heavy Silk Bandage##7929,First Aid,210
step
use Manual: Mageweave Bandage##16113
Train Mageweave Bandage |learn Mageweave Bandage##10840
step
Kill Dunemaul enemies around this area
collect 30 Mageweave Cloth##4338 |or |goto Tanaris/0 40.50,55.50
|tip You can also purchase them from the Auction House.
'|complete skill("First Aid") >= 225 |or
step
create 30 Mageweave Bandage##10840,First Aid,225
step
Reach Level 35 |ding 35
|tip You must be at least level 35 to train Artisan professions.
|tip Use the leveling guides to accomplish this.
step
Kill Dunemaul enemies around this area
collect 96 Mageweave Cloth##4338 |or |goto Tanaris/0 40.50,55.50
|tip You can also purchase them from the Auction House.
'|complete skill("First Aid") >= 260 |or
step
label "Collect_Runecloth_"
Kill Blackrock enemies around this area
|tip You can find more inside the building.
collect 85 Runecloth###14047 |or |goto Burning Steppes 42.17,35.64
'|complete skill("First Aid") >= 300 |or
'|complete skill("First Aid") >= 300 |or
step
Enter the building |goto Arathi Highlands 73.42,36.65 < 5 |walk
talk Doctor Gregory Victor##12920
|tip Inside the building.
accept Triage##6622 |goto Arathi Highlands 73.41,36.89
step
use the Triage Bandage##16991
|tip Use it on the injured NPC's on the rugs nearby inside the building.
|tip You must use the Triage Bandage to heal them before they die.
|tip If too many die you will fail the quest.
|tip Press "Ctrl+V" to show their health bars to make it easier.
|tip Try to heal them by priority, in this order:
|tip Critically Injured
|tip Badly Injured
|tip Injured Patients
Save #15# Patients |q 6624/1 |goto 73.03,36.84
|tip If you fail, just abandon the quest and try again.
step
talk Doctor Gregory Victor##12920
|tip Inside the building.
turnin Triage##6624 |goto 73.41,36.89
Train Artisan First Aid |skillmax First Aid,300 |goto 73.41,36.89
|tip You will learn this automatically.
step
create 30 Mageweave Bandage##10840,First Aid,240
step
talk Doctor Gregory Victor##12920
|tip Inside the building.
Tell him _"Teach me how to create and apply a Heavy Mageweave Bandage, Doctor."_
Train Heavy Mageweave Bandage |learn Heavy Mageweave Bandage##10841 |goto 73.41,36.89
step
create 33 Heavy Mageweave Bandage##10841,First Aid,260
step
talk Doctor Gregory Victor##12920
|tip Inside the building.
Tell him _"Teach me how to create and apply a Runecloth Bandage, Doctor."_
Train Runecloth Bandage |learn Runecloth Bandage##18629 |goto 73.41,36.89
step
create 45 Runecloth Bandage##18629,First Aid,290
step
talk Doctor Gregory Victor##12920
|tip Inside the building.
Tell him _"Teach me how to create and apply a Heavy Runecloth Bandage, Doctor."_
Train Heavy Runecloth Bandage |learn Heavy Runecloth Bandage##18630 |goto 73.41,36.89
step
create 20 Heavy Runecloth Bandage##18630,First Aid,300
step
Reach Level 58 |ding 58
|tip You must be at least level 58 to train enter Outland.
|tip Use the leveling guides to accomplish this.
step
talk Aresella##18991
|tip Inside the building.
Train Master First Aid |skillmax First Aid,375 |goto Hellfire Peninsula/0 26.2,62.0
step
talk Aresella##18991
|tip Inside the building.
buy Manual: Netherweave Bandage##21992 |goto Hellfire Peninsula/0 26.2,62.0
buy Manual: Heavy Netherweave Bandage##21993 |goto Hellfire Peninsula/0 26.2,62.0
step
Kill Blackrock enemies around this area
|tip You can find more inside the building.
collect 140 Runecloth###14047 |or |goto Burning Steppes 42.17,35.64
|tip You can also purchase them from the Auction House.
'|complete skill("First Aid") >= 330 |or
step
create 70 Heavy Runecloth Bandage##18630,First Aid,330
step
use Manual: Netherweave Bandage##21992
Train Netherweave Bandage |learn Netherweave Bandage##27032
step
map Shadowmoon Valley/0
path follow smart; loop on; ants curved; dist 20
path	51.1,58.8	53.0,59.3	53.2,60.5	52.8,63.2	52.8,65.4
path	52.9,69.0	52.5,71.8	47.3,71.1	45.8,71.3	45.2,69.2
path	45.6,66.1	48.0,67.2
Kill enemies around this area
collect 90 Netherweave Cloth##21877 |or
|tip You can also purchase them from the Auction House.
'|complete skill("First Aid") >= 360 |or
step
create 40 Netherweave Bandage##27032,First Aid,360
step
use Manual: Heavy Netherweave Bandage##21993
Train Heavy Netherweave Bandage |learn Heavy Netherweave Bandage##27033
step
create 20 Heavy Netherweave Bandage##27033,First Aid,375
step
_Congratulations!_
You Reached 375 First Aid Skill.
]])
ZygorGuidesViewer:RegisterGuide("Profession Guides\\Fishing\\Fishing (1-300)",{
author="support@zygorguides.com",
condition_suggested=function() return skill("Fishing") > 0 and skill("Fishing") < 300 end,
description="This guide will walk you through leveling your Fishing skill from 1-300.",
},[[
step
Reach Level 5 |ding 5
|tip You must be at least level 5 to train Apprentice professions.
|tip Use the leveling guides to accomplish this.
step
talk Lumak##3332
Train Apprentice Fishing |skillmax Fishing,75 |goto Orgrimmar/0 69.80,29.21
step
talk Shankys##3333
buy Fishing Pole##6256 |goto 69.99,29.77 |or
|tip You need to be able to equip a fishing pole in order to fish.
'|complete skill("Fishing") >= 300 |or
step
talk Shankys##3333
buy 10 Shiny Bauble##6529 |goto 69.99,29.77 |or
|tip These will allow you to catch fish easier.
'|complete skill("Fishing") >= 55 |or
step
Fish in the Water
|tip Use the "Fishing" skill in your spell book.
|tip Equip the Fishing Pole in your bags.
use the Shiny Bauble##6529+
|tip Use it on your Fishing Pole.
|tip These will allow you to catch fish easier.
|tip Try to keep one of these active whenever you are fishing.
Reach Skill 55 in Fishing |skill Fishing,55 |goto Durotar 41.65,15.66
step
talk Shankys##3333
buy Strong Fishing Pole##6365 |goto Orgrimmar/0 69.99,29.77
|tip This is a limited supply item.
|tip If she doesn't have it for sale, check the Auction House.
|tip If you can't get one, you can skip this step.
step
Fish in the Water
|tip Equip the "Strong Fishing Pole", if you were able to get one.
use the Shiny Bauble##6529+
|tip Use it on your Fishing Pole.
|tip These will allow you to catch fish easier.
|tip Try to keep one of these active whenever you are fishing.
Reach Skill 75 in Fishing |skill Fishing,75 |goto 69.76,30.11
step
talk Lumak##3332
Train Journeyman Fishing |skillmax Fishing,150 |goto 69.80,29.21
step
talk Shankys##3333
buy 10 Nightcrawlers##6530 |goto 69.99,29.77 |or
|tip These will allow you to catch fish easier.
'|complete skill("Fishing") >= 150 |or
step
Fish in the Water
use the Nightcrawlers##6530+
|tip Use it on your Fishing Pole.
|tip These will allow you to catch fish easier.
|tip Try to keep one of these active whenever you are fishing.
Reach Skill 150 in Fishing |skill Fishing,150 |goto Stonetalon Mountains/0 46.33,61.29
step
Run down the ramp |goto Stranglethorn Vale 28.04,76.53 < 7 |only if walking
Enter the building |goto Stranglethorn Vale 27.47,77.09 < 5 |walk
talk Old Man Heming##2626
|tip Inside the building.
buy Expert Fishing - The Bass and You##16083 |n
use Expert Fishing - The Bass and You##16083
Train Expert Fishing |skillmax Fishing,225 |goto Stranglethorn Vale 27.42,77.16
step
talk Old Man Heming##2626
|tip Inside the building.
buy 20 Bright Baubles##6532 |goto 27.42,77.16 |or
'|complete skill("Fishing") >= 225 |or
step
Fish in the Water
use the Bright Baubles##6532+
|tip Use it on your Fishing Pole.
|tip These will allow you to catch fish easier.
|tip Try to keep one of these active whenever you are fishing.
Reach Skill 225 in Fishing |skill Fishing,225 |goto 27.64,76.67
step
Reach Level 35 |ding 35
|tip You must be at least this level before you can accept the quest in the next step.
|tip Use the leveling guides to accomplish this.
step
Follow the path down |goto Dustwallow Marsh 52.55,62.35 < 15 |only if walking
talk Nat Pagle##12919
|tip On a small island in the water.
accept Nat Pagle, Angler Extreme##6607 |goto Dustwallow Marsh 58.55,60.21
step
Fish in the Water
use the Bright Baubles##6532+
|tip Use it on your Fishing Pole.
|tip These will allow you to catch fish easier.
|tip Try to keep one of these active whenever you are fishing.
collect Feralas Ahi##16967 |q 6607/1 |goto Feralas 62.38,52.50 |or
|tip You will eventually catch one.
step
Fish in the Water
use the Bright Baubles##6532+
|tip Use it on your Fishing Pole.
|tip These will allow you to catch fish easier.
|tip Try to keep one of these active whenever you are fishing.
collect Sar'theris Striker##16968 |q 6607/3 |goto Desolace 26.19,75.50 |or
|tip You will eventually catch one.
step
Fish in the Water
use the Bright Baubles##6532+
|tip Use it on your Fishing Pole.
|tip These will allow you to catch fish easier.
|tip Try to keep one of these active whenever you are fishing.
collect Misty Reed Mahi Mahi##16970 |q 6607/2 |goto Swamp of Sorrows 90.45,73.47 |or
|tip You will eventually catch one.
step
Fish in the Water
use the Bright Baubles##6532+
|tip Use it on your Fishing Pole.
|tip These will allow you to catch fish easier.
|tip Try to keep one of these active whenever you are fishing.
collect Savage Coast Blue Sailfin##16969 |q 6607/4 |goto Stranglethorn Vale/0 29.41,27.26 |or
|tip You will eventually catch one.
step
Follow the path down |goto Dustwallow Marsh 52.55,62.35 < 15 |only if walking
talk Nat Pagle##12919
|tip On a small island in the water.
turnin Nat Pagle, Angler Extreme##6607 |goto Dustwallow Marsh 58.55,60.21
Train Artisan Fishing |skillmax Fishing,300 |goto Dustwallow Marsh 58.55,60.21
|tip You will learn this automatically.
step
talk Shankys##3333
buy 20 Bright Baubles##6532 |goto 69.99,29.77 |or
|tip These will allow you to catch fish easier.
'|complete skill("Fishing") >= 300 |or
step
Fish in the Water
use the Bright Baubles##6532+
|tip Use it on your Fishing Pole.
|tip These will allow you to catch fish easier.
|tip Try to keep one of these active whenever you are fishing.
Reach Skill 300 in Fishing |skill Fishing,300 |goto The Hinterlands 81.66,82.38
]])
ZygorGuidesViewer:RegisterGuide("Profession Guides\\Fishing\\Farming Guides\\Golden Darter",{
author="support@zygorguides.com",
condition_suggested=function() return skill('Fishing') >= 355 end,
condition_valid=function() return skill('Fishing') >= 355 end,
condition_valid_msg="Your Fishing skill must be at least 355 to fish Golden Darter.",
description="Golden Darter can be fished in Terokkar Forest.",
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
collect Golden Darter##27438 |goto Terokkar Forest/0 51.32,41.91 |n
'|confirm
]])
ZygorGuidesViewer:RegisterGuide("Profession Guides\\Fishing\\Farming Guides\\Figluster's Mudfish",{
author="support@zygorguides.com",
condition_suggested=function() return skill('Fishing') >= 355 end,
condition_valid=function() return skill('Fishing') >= 355 end,
condition_valid_msg="Your Fishing skill must be at least 355 to fish Figluster's Mudfish.",
description="Figluster's Mudfish can be fished in Nagrand.",
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
collect Figluster's Mudfish##27435 |goto Nagrand/0 57.97,32.98 |n
'|confirm
]])
ZygorGuidesViewer:RegisterGuide("Profession Guides\\Fishing\\Farming Guides\\Icefin Bluefish",{
author="support@zygorguides.com",
condition_suggested=function() return skill('Fishing') >= 355 end,
condition_valid=function() return skill('Fishing') >= 355 end,
condition_valid_msg="Your Fishing skill must be at least 355 to fish Icefin Bluefish.",
description="Icefin Bluefish can be fished in Nagrand.",
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
collect Icefin Bluefish##27437 |goto Nagrand/0 57.97,32.98 |n
'|confirm
]])
ZygorGuidesViewer:RegisterGuide("Profession Guides\\Fishing\\Farming Guides\\Raw Brilliant Smallfish",{
author="support@zygorguides.com",
},[[
step
Fish in the open water
collect Raw Brilliant Smallfish##6291 |n |goto Mulgore 48.60,52.66
]])
ZygorGuidesViewer:RegisterGuide("Profession Guides\\Fishing\\Farming Guides\\Raw Slitherskin Mackerel",{
author="support@zygorguides.com",
},[[
step
Fish in the open water
collect Raw Slitherskin Mackerel##6303 |n |goto Durotar 56.41,10.85
]])
ZygorGuidesViewer:RegisterGuide("Profession Guides\\Fishing\\Farming Guides\\Raw Rainbow Fin Albacore",{
author="support@zygorguides.com",
},[[
step
Fish in the Open Water
collect Raw Rainbow Fin Albacore##6361 |n |goto The Barrens 63.19,38.19
]])
ZygorGuidesViewer:RegisterGuide("Profession Guides\\Fishing\\Farming Guides\\Raw Longjaw Mud Snapper",{
author="support@zygorguides.com",
},[[
step
Fish in the Open Water
collect Raw Longjaw Mud Snapper##6289 |n |goto Orgrimmar/0 69.75,30.12
]])
ZygorGuidesViewer:RegisterGuide("Profession Guides\\Fishing\\Farming Guides\\Raw Sagefish",{
author="support@zygorguides.com",
},[[
step
Fish from Sagefish Schools in the water around this area
collect Raw Sagefish##21071 |n |goto Hillsbrad Foothills 62.51,43.06
|tip Follow the river north for more schools.
|tip You will need level 100 Fishing to catch these.
You can find more around [69.87,13.66]
]])
ZygorGuidesViewer:RegisterGuide("Profession Guides\\Fishing\\Farming Guides\\Raw Bristle Whisker Catfish",{
author="support@zygorguides.com",
},[[
step
Fish in the Open Water
collect Raw Bristle Whisker Catfish##6308 |n |goto Orgrimmar/0 69.75,30.12
]])
ZygorGuidesViewer:RegisterGuide("Profession Guides\\Fishing\\Farming Guides\\Raw Mithril Head Trout",{
author="support@zygorguides.com",
},[[
step
Fish in the Open Water
collect Raw Mithril Head Trout##8365 |n |goto Desolace 21.47,74.18
|tip You will need level 130 Fishing to catch these.
]])
ZygorGuidesViewer:RegisterGuide("Profession Guides\\Fishing\\Farming Guides\\Raw Rockscale Cod",{
author="support@zygorguides.com",
},[[
step
Fish in the Open Water
collect Raw Rockscale Cod##6362 |n |goto Stranglethorn Vale 26.22,73.57
|tip You will need level 130 Fishing to catch these.
]])
ZygorGuidesViewer:RegisterGuide("Profession Guides\\Fishing\\Farming Guides\\Raw Sunscale Salmon",{
author="support@zygorguides.com",
},[[
step
Fish in the Open Water
collect Raw Sunscale Salmon##13760 |n |goto Feralas 75.58,44.52
|tip You will need level 205 Fishing to catch these.
|tip This fish can only be caught during the day; they cannot be caught between midnight and 6 AM server time.
]])
ZygorGuidesViewer:RegisterGuide("Profession Guides\\Herbalism\\Herbalism (1-375)",{
author="support@zygorguides.com",
condition_suggested=function() return skill("Herbalism") > 0 and skill("Herbalism") < 375 end,
description="This guide will walk you through leveling your Herbalism skill from 1-375.",
},[[
step
Reach Level 5 |ding 5
|tip You must be at least level 5 before you can learn professions.
|tip Use the leveling guides to accomplish this.
step
Run up the stairs |goto Orgrimmar/0 56.43,56.78 < 7 |only if walking
Enter the building |goto Orgrimmar/0 54.75,40.57 < 7 |walk
talk Jandi##3404
|tip Inside the building.
Train Apprentice Herbalism |skillmax Herbalism,75 |goto Orgrimmar/0 55.62,39.46
step
map Durotar
path	follow smart;	loop on;	ants curved;	dist 30
path	53.29,45.77	55.68,46.14	56.16,50.10	55.24,54.58	55.03,60.41
path	54.89,63.15	54.79,65.91	54.21,71.92	54.98,76.20	52.08,77.83
path	50.18,74.99	49.93,69.47	51.36,67.29	51.81,64.25	51.58,58.68
path	51.88,55.18	50.35,51.24	50.49,48.42
Reach Skill 75 in Herbalism |skill Herbalism,75
|tip Click herbs as you follow the path around this area.
|tip Track them on your minimap with "Find Herbs".
step
Reach Level 10 |ding 10
|tip You must be at least level 10 to train Journeyman professions.
|tip Use the leveling guides to accomplish this.
step
Run up the stairs |goto Orgrimmar/0 56.43,56.78 < 7 |only if walking
Enter the building |goto Orgrimmar/0 54.75,40.57 < 7 |walk
talk Jandi##3404
|tip Inside the building.
Train Journeyman Herbalism |skillmax Herbalism,150 |goto Orgrimmar/0 55.62,39.46
step
map The Barrens
path	follow smart;	loop on;	ants curved;	dist 30
path	59.10,40.30	60.19,40.99	61.84,40.54	62.14,43.04	62.65,46.75
path	61.30,50.02	60.46,50.11	58.76,50.43	56.82,51.16	55.42,52.22
path	53.50,52.61	53.16,56.18	51.94,57.54	50.38,58.57	43.15,60.77
path	43.09,56.64	43.61,52.80	41.37,48.89	42.58,47.61	41.37,44.96
path	43.42,44.79	43.15,42.53	43.28,39.61	42.28,38.89	41.58,37.21
path	42.55,35.50	42.04,33.21	40.69,29.92	40.86,26.76	40.85,25.65
path	41.14,22.86	40.75,20.98	43.41,19.48	45.37,20.92	46.02,22.67
path	47.72,24.15	50.85,22.99	53.51,23.60	58.76,25.08	60.04,27.81
path	60.07,30.45	59.29,36.79	58.73,39.32
Reach Skill 100 in Herbalism |skill Herbalism,100
|tip Click herbs as you follow the path around this area.
|tip Track them on your minimap with "Find Herbs".
step
map The Barrens
path	follow smart;	loop on;	ants curved;	dist 30
path	49.34,61.86	47.74,65.34	49.23,69.53	48.13,71.47	48.25,74.69
path	49.98,75.97	49.97,78.84	48.59,80.24	48.26,82.33	46.66,83.76
path	46.10,86.08	44.27,84.64	42.70,82.63	41.20,79.51	44.09,78.36
path	43.80,75.03	43.88,73.08	42.35,72.24	41.90,68.97	43.39,69.35
path	45.54,68.99	45.03,65.70	43.83,62.98
Reach Skill 125 in Herbalism |skill Herbalism,125
|tip Click herbs as you follow the path around this area.
|tip Track them on your minimap with "Find Herbs".
step
Reach Level 20 |ding 20
|tip You must be at least level 20 to train Expert professions.
|tip Use the leveling guides to accomplish this.
step
Run up the stairs |goto Orgrimmar/0 56.43,56.78 < 7 |only if walking
Enter the building |goto Orgrimmar/0 54.75,40.57 < 7 |walk
talk Jandi##3404
|tip Inside the building.
Train Expert Herbalism |skillmax Herbalism,225 |goto Orgrimmar/0 55.62,39.46
step
map Wetlands
path	follow smart;	loop on;	ants curved;	dist 30
path	13.6,37.2	15.1,33.5	18.5,32.8	19.2,26.5	21.8,27.2
path	24.6,28.8	28.2,30.5	32.9,27.9	35.5,24.6	38.6,23.2
path	41.1,24.4	46.5,25.4	51.5,29.0	56.5,30.5	59.3,32.9
path	62.7,34.1	61.8,39.2	58.3,44.0	56.4,48.5	44.7,34.5
path	41.0,34.0	35.2,31.8	31.5,36.3	26.9,34.9	18.3,36.6
Reach Skill 170 in Herbalism |skill Herbalism,170
|tip Click herbs as you follow the path around this area.
|tip Track them on your minimap with "Find Herbs".
step
map Swamp of Sorrows
path	follow smart;	loop on;	ants curved;	dist 30
path	20.50,54.53	16.62,58.22	15.71,65.71	12.68,68.05	10.73,63.62
path	12.41,55.83	15.50,47.83	18.39,45.92	22.07,39.95	28.92,38.70
path	33.28,38.90	38.62,34.97	47.12,33.93	51.82,34.91	51.62,41.06
path	44.78,45.30	37.49,50.34	33.07,52.19	27.05,54.68	22.47,57.13
Reach Skill 205 in Herbalism |skill Herbalism,205
|tip Click herbs as you follow the path around this area.
|tip Track them on your minimap with "Find Herbs".
step
Reach Level 35 |ding 35
|tip You must be at least level 35 to train Artisan professions.
|tip Use the leveling guides to accomplish this.
step
Run up the stairs |goto Orgrimmar/0 56.43,56.78 < 7 |only if walking
Enter the building |goto Orgrimmar/0 54.75,40.57 < 7 |walk
talk Jandi##3404
|tip Inside the building.
Train Artisan Herbalism |skillmax Herbalism,300 |goto Orgrimmar/0 55.62,39.46
step
map Blasted Lands
path	follow smart;	loop on;	ants curved;	dist 30
path	59.95,26.91	63.87,32.24	62.52,37.16	61.93,40.77	63.59,47.87
path	60.16,47.06	56.61,47.07	52.58,50.11	48.61,51.34	45.83,49.50
path	46.56,43.37	45.38,37.03	44.55,26.43	45.95,23.01	49.76,23.71
path	51.28,26.22	52.49,31.62	51.40,36.19	53.41,38.07	55.97,36.24
path	57.46,32.43	58.67,28.99
Reach Skill 275 in Herbalism |skill Herbalism,275
|tip Click herbs as you follow the path around this area.
|tip Track them on your minimap with "Find Herbs".
|tip You won't be able to gather Sungrass until level 230 Herbalism.
|tip You Won't be able to gather Gromsblood until level 250 Herbalism.
step
map Azshara
path	follow smart;	loop on;	ants curved;	dist 30
path	44.24,35.76	44.97,34.08	45.34,30.56	45.01,27.72	44.00,22.97
path	44.61,20.55	45.91,19.60	48.17,18.74	50.79,18.10	52.77,19.45
path	53.43,20.10	54.10,20.23	56.85,20.66	59.23,18.80	61.89,16.89
path	64.79,17.01	66.41,15.27	69.57,16.37	71.70,16.63	73.96,18.69
path	75.86,21.19	76.87,24.70	79.46,24.05	79.40,26.62	77.14,28.54
path	74.71,29.28	71.72,29.19	69.51,28.09	67.74,26.09	64.29,23.93
path	61.47,23.67	59.32,24.37	56.53,25.81	54.31,28.58	52.61,32.17
path	49.37,31.47	46.94,31.71
Reach Skill 285 in Herbalism |skill Herbalism,285
|tip Click herbs as you follow the path around this area.
|tip Track them on your minimap with "Find Herbs".
step
map Eastern Plaguelands
path	follow smart;	loop on;	ants curved;	dist 30
path	63.32,54.67	67.59,55.28	72.06,54.50	75.06,53.69	77.43,53.29
path	78.36,55.80	79.17,59.16	80.07,63.69	80.31,67.80	78.88,71.68
path	76.88,73.45	75.52,74.46	74.76,76.67	72.94,78.41	68.81,75.52
path	66.81,76.30	65.03,73.91	64.71,69.43	63.81,66.25	63.25,64.01
path	63.98,59.07
Reach Skill 300 in Herbalism |skill Herbalism,300
|tip Click herbs as you follow the path around this area.
|tip Track them on your minimap with "Find Herbs".
step
talk Ruak Stronghorn##18748
|tip Inside the building.
Train Master Herbalism |skillmax Herbalism,375 |goto Hellfire Peninsula/0 52.23,36.26
step
map Hellfire Peninsula/0
path follow smart; loop on; ants curved; dist 30
path	60.48,46.42	56.45,46.34	51.59,45.14	46.16,44.25	47.26,40.40
path	48.66,37.90	46.93,33.18	50.86,27.89	52.60,26.35	55.98,32.01
path	59.46,30.91	60.89,32.93	62.41,35.51	63.10,30.75	64.79,28.93
path	67.56,26.55	67.08,34.46	67.82,41.32	69.93,43.63	73.76,45.37
path	74.05,51.53	73.38,54.75	69.93,51.24	66.39,52.87	64.98,56.77
path	64.45,60.71	68.39,61.09	70.61,64.28	70.90,68.25	69.27,73.00
path	65.86,73.67	62.75,72.98	59.24,71.17	58.69,79.02	54.99,78.66
path	51.52,81.65	47.16,83.39	43.01,85.25	38.48,89.45	36.04,89.63
path	40.44,84.48	43.09,80.03	42.76,72.41	44.24,68.24	43.01,62.36
path	45.67,60.07	50.43,56.10	54.23,55.83	56.18,53.40	59.22,53.80
path	62.31,52.22
Click herbs as you follow the path around this area.
|tip Track them on your minimap with "Find Herbs".
Reach Skill 315 in Herbalism |skill Herbalism,315
step
map Nagrand/0
path follow smart; loop on; ants curved; dist 30
path	67.10,38.81	62.46,38.67	59.97,41.63	58.98,45.23	61.74,46.95
path	65.25,47.54	65.35,50.75	62.28,54.16	58.85,53.68	57.61,58.56
path	60.54,63.88	56.40,62.65	53.45,59.34	50.15,56.01	47.12,49.88
path	51.65,45.59	50.05,35.03	52.31,30.84	53.64,25.93	56.98,21.62
path	53.38,21.33	49.37,22.38	45.75,23.81	45.80,29.52	36.92,38.06
path	35.56,36.51	35.74,31.03	33.32,25.86	29.99,21.30	26.84,20.95
path	25.22,24.74	24.17,28.55	26.15,31.67	27.99,35.03	25.80,38.54
path	26.11,40.98	28.93,43.10	30.66,47.71	25.77,48.26	21.24,47.19
path	20.69,52.52	25.56,54.53	27.29,58.31	29.14,63.57	30.45,60.45
path	33.13,57.55	35.33,58.21	34.14,66.09	31.36,70.02	28.68,73.00
path	30.96,77.10	34.57,78.41	40.33,78.38	44.84,77.07	50.46,79.56
path	55.70,80.41	58.17,79.10	58.93,75.16	61.38,73.78	64.22,73.59
path	68.08,79.78	71.62,79.24	73.84,72.52	73.47,63.32	74.36,56.18
path	72.64,45.66
Click herbs as you follow the path around this area.
|tip Track them on your minimap with "Find Herbs".
Reach Skill 325 in Herbalism |skill Herbalism,325
step
map Terokkar Forest/0
path follow smart; loop on; ants curved; dist 30
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
Click herbs as you follow the path around this area.
|tip Track them on your minimap with "Find Herbs".
Reach Skill 350 in Herbalism |skill Herbalism,350
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
Click herbs as you follow the path around this area.
|tip Track them on your minimap with "Find Herbs".
Reach Skill 375 in Herbalism |skill Herbalism,375
step
_Congratulations!_
You Reached 375 Herbalism Skill.
]])
ZygorGuidesViewer:RegisterGuide("Profession Guides\\Herbalism\\Farming Guides\\Silverleaf",{
author="support@zygorguides.com",
},[[
step
map Tirisfal Glades
path follow smart; loop on; ants curved; dist 20
path	51.54,54.24	50.24,56.05	47.60,53.12	45.65,51.89	46.96,47.83
path	44.74,46.19	42.79,42.59	41.45,40.79	39.11,40.30	38.92,43.20
path	38.50,46.14	36.48,47.41	34.54,48.14	32.02,48.17	31.72,50.34
path	33.92,51.19	37.36,51.84	38.60,52.08	39.77,54.03	40.68,58.21
path	40.92,60.80	41.92,63.49	44.02,65.29	46.57,66.37	49.11,67.48
path	50.44,66.83	51.57,64.64	54.10,62.49	56.28,59.15	56.53,55.12
path	53.81,53.15	52.04,54.99
Click herbs as you follow the path around this area
|tip Track them on your minimap with "Find Herbs".
collect Silverleaf##765 |n
]])
ZygorGuidesViewer:RegisterGuide("Profession Guides\\Herbalism\\Farming Guides\\Peacebloom",{
author="support@zygorguides.com",
},[[
step
map Tirisfal Glades
path follow smart; loop on; ants curved; dist 20
path	51.54,54.24	50.24,56.05	47.60,53.12	45.65,51.89	46.96,47.83
path	44.74,46.19	42.79,42.59	41.45,40.79	39.11,40.30	38.92,43.20
path	38.50,46.14	36.48,47.41	34.54,48.14	32.02,48.17	31.72,50.34
path	33.92,51.19	37.36,51.84	38.60,52.08	39.77,54.03	40.68,58.21
path	40.92,60.80	41.92,63.49	44.02,65.29	46.57,66.37	49.11,67.48
path	50.44,66.83	51.57,64.64	54.10,62.49	56.28,59.15	56.53,55.12
path	53.81,53.15	52.04,54.99
Click herbs as you follow the path around this area
|tip Track them on your minimap with "Find Herbs".
collect Peacebloom##2447 |n
]])
ZygorGuidesViewer:RegisterGuide("Profession Guides\\Herbalism\\Farming Guides\\Earthroot",{
author="support@zygorguides.com",
},[[
step
map Mulgore
path follow smart; loop on; ants curved; dist 20
path	35.22,70.19	34.72,69.90	34.64,69.25	35.05,67.37	35.10,65.67
path	35.38,64.19	34.56,61.98	34.63,60.89	35.38,59.65	35.01,57.60
path	35.05,55.60	34.60,54.40	35.32,52.91	35.58,51.19	34.88,50.64
path	33.77,49.73	32.70,49.04	32.14,48.91	31.52,50.19	31.00,49.69
path	31.08,48.09	32.13,47.39	33.51,47.41	34.36,46.94	35.20,44.68
path	34.43,43.11	33.13,43.15	31.31,42.10	31.75,40.60	32.81,40.41
path	33.40,40.69	34.14,40.11	34.71,38.48	34.60,36.52	34.37,34.32
path	33.86,32.15	32.88,30.48	31.85,28.84	29.70,27.05	29.25,25.10
path	29.00,23.41	29.26,20.35	31.05,19.76	31.99,19.31
map Thunder Bluff
path	23.68,3.44
map Mulgore
path	35.83,16.33	37.25,14.62	37.67,13.01	36.13,11.11	36.32,9.79
path	37.09,9.17	37.49,8.53	38.02,6.70	38.55,5.62	40.57,7.25
path	41.31,8.18	43.97,8.03	45.51,7.75	46.82,7.87	49.28,7.68
path	51.05,7.59	51.78,6.21	52.70,5.77	53.38,6.31	53.54,8.26
path	53.54,9.93	54.76,10.71	55.59,11.47	56.19,13.30	56.21,15.43
path	56.29,17.33	56.79,17.57	58.54,19.03	61.01,20.23	61.68,22.64
path	61.70,24.57	61.59,26.52	59.66,28.70	58.69,29.74	57.38,32.58
path	56.76,35.28	56.29,38.79	55.97,41.45	56.40,44.45	57.81,45.95
path	59.46,47.55	60.18,48.65	61.45,49.77	62.52,50.79	62.84,53.00
path	62.45,55.44	64.26,58.39	65.89,62.05	67.11,65.93	66.53,67.72
path	65.00,69.39	62.70,70.68	60.50,70.76	59.01,71.17	57.31,73.31
path	56.02,74.71	55.63,74.45	54.91,73.38	53.42,73.82	52.01,71.26
path	51.02,70.96	49.19,72.26	47.46,72.23	45.51,71.36	44.21,71.55
path	41.73,73.67	39.26,74.40	37.01,73.52
Click herbs as you follow the path around this area
|tip Track them on your minimap with "Find Herbs".
|tip You will need at least 15 Herbalism skill to gather these.
collect Earthroot##2449 |n
]])
ZygorGuidesViewer:RegisterGuide("Profession Guides\\Herbalism\\Farming Guides\\Mageroyal",{
author="support@zygorguides.com",
},[[
step
map The Barrens
path follow smart; loop on; ants curved; dist 20
path	59.15,37.73	58.67,39.28	59.28,40.67	61.05,41.62	61.87,41.98
path	61.83,43.50	61.73,44.93	62.46,45.59	62.55,47.02	61.37,48.53
path	61.16,49.91	60.17,50.20	58.92,50.02	56.90,50.43	56.86,47.77
path	56.42,45.86	55.99,45.25	56.38,43.40	56.07,41.87	55.04,41.51
path	54.83,42.75	54.03,43.67	53.18,45.13	52.20,45.76	48.47,46.84
path	46.80,43.94	43.45,40.70	43.61,38.41	41.90,37.41	42.70,35.52
path	42.16,33.03	39.72,31.26	39.93,29.78	40.90,27.82	42.44,25.74
path	45.14,25.67	46.02,24.49	45.83,22.32	45.17,21.63	44.47,21.60
path	43.39,20.61	41.18,19.63	40.38,15.78	43.73,15.53	48.89,13.63
path	53.28,14.18	55.37,9.81	57.33,9.22	58.34,7.44	60.18,7.56
path	62.69,8.90	62.42,11.56	62.31,16.47	61.10,19.72	59.62,20.88
path	58.10,21.14	57.12,23.28	58.85,25.07	60.26,28.59	60.58,31.18
path	60.20,34.14	59.26,36.84
Click herbs as you follow the path around this area
|tip Track them on your minimap with "Find Herbs".
|tip You will need at least 50 Herbalism skill to gather these.
collect Mageroyal##785 |n
]])
ZygorGuidesViewer:RegisterGuide("Profession Guides\\Herbalism\\Farming Guides\\Stranglekelp",{
author="support@zygorguides.com",
},[[
step
label "Path_One"
map Stranglethorn Vale
path follow smart; loop off; dist 20
path	27.56,22.38	28.55,26.38	30.37,30.98	33.88,33.36	30.36,35.99
path	27.70,38.32	26.24,42.31	26.20,47.90	22.96,47.20	21.86,51.72
path	22.04,55.91	25.74,57.13	23.90,60.72	23.70,64.65	26.18,68.29
path	23.58,75.22	24.21,79.36	25.98,84.41	31.39,83.70	33.23,80.90
path	34.46,76.56	37.38,68.78	38.81,62.94
Click herbs as you follow the path around this area
|tip Track them on your minimap with "Find Herbs".
|tip They are underwater along the path.
|tip Bring Water Walking Potions.
|tip You will need at least 85 Herbalism skill to gather these.
collect Stranglekelp##3820 |n
'|goto 38.81,62.94 < 20 |noway |c
step
map Stranglethorn Vale
path follow smart; loop off; dist 20
path	38.81,62.94	37.38,68.78	34.46,76.56	33.23,80.90	31.39,83.70
path	25.98,84.41	24.21,79.36	23.58,75.22	26.18,68.29	23.70,64.65
path	23.90,60.72	25.74,57.13	22.04,55.91	21.86,51.72	22.96,47.20
path	26.20,47.90	26.24,42.31	27.70,38.32	30.36,35.99	33.88,33.36
path	30.37,30.98	28.55,26.38	27.56,22.38
Click herbs as you follow the path around this area
|tip Track them on your minimap with "Find Herbs".
|tip They are underwater along the path.
|tip Bring Water Walking Potions.
|tip You will need at least 85 Herbalism skill to gather these.
collect Stranglekelp##3820 |n
'|goto 27.56,22.38 < 20 |noway |c |next "Path_One"
]])
ZygorGuidesViewer:RegisterGuide("Profession Guides\\Herbalism\\Farming Guides\\Briarthorn",{
author="support@zygorguides.com",
},[[
step
label "Path_One"
map Silverpine Forest
path follow smart; loop off; dist 20
path	49.04,32.38	49.42,35.61	49.42,37.96	49.76,40.18	50.52,43.34
path	52.66,43.16	54.51,44.07	52.79,45.65	51.98,49.91	52.04,52.85
path	51.86,56.81	52.43,59.23	51.75,62.42	54.26,63.98	55.27,61.88
path	56.68,60.37	58.05,62.07	56.16,64.50	54.77,66.89	54.34,71.81
path	54.65,74.35	56.82,76.43	59.65,77.20	61.93,77.46	64.26,78.75
path	66.96,79.79
Click herbs as you follow the path around this area
|tip Briarthorn can share a spawn with other herbs in the area, so pick them all.
|tip Track them on your minimap with "Find Herbs".
|tip You will need at least 70 Herbalism skill to gather these.
collect Briarthorn##2450 |n
'|goto 66.96,79.79 < 20 |noway |c
step
map Silverpine Forest
path follow smart; loop off; dist 20
path	66.96,79.79	64.26,78.75	61.93,77.46	59.65,77.20	56.82,76.43
path	54.65,74.35	54.34,71.81	54.77,66.89	56.16,64.50	58.05,62.07
path	56.68,60.37	55.27,61.88	54.26,63.98	51.75,62.42	52.43,59.23
path	51.86,56.81	52.04,52.85	51.98,49.91	52.79,45.65	54.51,44.07
path	52.66,43.16	50.52,43.34	49.76,40.18	49.42,37.96	49.42,35.61
path	49.04,32.38
Click herbs as you follow the path around this area
|tip Briarthorn can share a spawn with other herbs in the area, so pick them all.
|tip Track them on your minimap with "Find Herbs".
|tip You will need at least 70 Herbalism skill to gather these.
collect Briarthorn##2450 |n
'|goto 49.04,32.38 < 20 |noway |c |next "Path_One"
]])
ZygorGuidesViewer:RegisterGuide("Profession Guides\\Herbalism\\Farming Guides\\Swiftthistle",{
author="support@zygorguides.com",
},[[
step
label "Path_One"
map Silverpine Forest
path follow smart; loop off; dist 20
path	49.04,32.38	49.42,35.61	49.42,37.96	49.76,40.18	50.52,43.34
path	52.66,43.16	54.51,44.07	52.79,45.65	51.98,49.91	52.04,52.85
path	51.86,56.81	52.43,59.23	51.75,62.42	54.26,63.98	55.27,61.88
path	56.68,60.37	58.05,62.07	56.16,64.50	54.77,66.89	54.34,71.81
path	54.65,74.35	56.82,76.43	59.65,77.20	61.93,77.46	64.26,78.75
path	66.96,79.79
Click herbs as you follow the path around this area
|tip Briarthorn can share a spawn with other herbs in the area, so pick them all.
|tip Swiftthistle has a chance to be gathered from Briarthorn and Mageroyal.
|tip Track them on your minimap with "Find Herbs".
|tip You will need at least 70 Herbalism skill to gather these.
collect Swiftthistle##2452 |n
'|goto 66.96,79.79 < 20 |noway |c
step
map Silverpine Forest
path follow smart; loop off; dist 20
path	66.96,79.79	64.26,78.75	61.93,77.46	59.65,77.20	56.82,76.43
path	54.65,74.35	54.34,71.81	54.77,66.89	56.16,64.50	58.05,62.07
path	56.68,60.37	55.27,61.88	54.26,63.98	51.75,62.42	52.43,59.23
path	51.86,56.81	52.04,52.85	51.98,49.91	52.79,45.65	54.51,44.07
path	52.66,43.16	50.52,43.34	49.76,40.18	49.42,37.96	49.42,35.61
path	49.04,32.38
Click herbs as you follow the path around this area
|tip Briarthorn can share a spawn with other herbs in the area, so pick them all.
|tip Swiftthistle has a chance to be gathered from Briarthorn and Mageroyal.
|tip Track them on your minimap with "Find Herbs".
|tip You will need at least 70 Herbalism skill to gather these.
collect Swiftthistle##2452 |n
'|goto 49.04,32.38 < 20 |noway |c |next "Path_One"
]])
ZygorGuidesViewer:RegisterGuide("Profession Guides\\Herbalism\\Farming Guides\\Bruiseweed",{
author="support@zygorguides.com",
},[[
step
label "Bruiseweed_1"
map Ashenvale
path follow smart; loop off; dist 20
path	30.47,44.71	27.77,48.81	25.72,50.64	28.38,54.47	34.66,54.20
path	35.41,56.86	34.85,58.62	32.71,59.66	34.71,59.96	38.06,62.62
path	40.48,61.75	39.97,65.16	41.82,64.95	43.85,63.15	47.09,61.20
path	48.42,60.26	49.98,59.22	54.29,60.93	56.36,63.51	57.82,64.38
path	59.14,70.90	60.56,73.42	69.78,74.49	71.98,73.86	74.94,73.92
Click herbs as you follow the path around this area
|tip Track them on your minimap with "Find Herbs".
|tip You will need at least 100 Herbalism skill to gather these.
collect Bruiseweed##2453 |n
'|goto 74.94,73.92 < 20 |noway |c
step
map Ashenvale
path follow smart; loop off; dist 20
path	74.94,73.92	71.98,73.86	69.78,74.49	60.56,73.42	59.14,70.90
path	57.82,64.38	56.36,63.51	54.29,60.93	49.98,59.22	48.42,60.26
path	47.09,61.20	43.85,63.15	41.82,64.95	39.97,65.16	40.48,61.75
path	38.06,62.62	34.71,59.96	32.71,59.66	34.85,58.62	35.41,56.86
path	34.66,54.20	28.38,54.47	25.72,50.64	27.77,48.81	30.47,44.71
Click herbs as you follow the path around this area
|tip Track them on your minimap with "Find Herbs".
|tip You will need at least 100 Herbalism skill to gather these.
collect Bruiseweed##2453 |n
'|goto 30.47,44.71 < 20 |noway |c |next "Bruiseweed_1"
]])
ZygorGuidesViewer:RegisterGuide("Profession Guides\\Herbalism\\Farming Guides\\Wild Steelbloom",{
author="support@zygorguides.com",
},[[
step
map Stranglethorn Vale
path follow smart; loop on; ants curved; dist 20
path	35.19,24.89	34.15,16.96	32.35,17.29	29.81,16.22	28.04,17.47
path	25.80,17.04	23.47,14.43	23.84,13.79	26.85,13.53	26.47,10.74
path	26.96,10.08	26.83,8.41	28.93,7.53	31.07,9.11	33.66,7.50
path	35.36,6.91	37.47,8.17	40.26,7.17	42.31,8.80	43.43,9.07
path	44.02,6.96	46.87,7.20	49.23,10.26	46.15,12.93	46.18,15.78
path	48.55,20.93	49.87,26.32	48.46,42.77	46.45,44.95	42.29,44.37
path	39.61,44.79	38.13,35.79
Click herbs as you follow the path around this area
|tip Track them on your minimap with "Find Herbs".
|tip You will need at least 115 Herbalism skill to gather these.
collect Wild Steelbloom##3355 |n
]])
ZygorGuidesViewer:RegisterGuide("Profession Guides\\Herbalism\\Farming Guides\\Grave Moss",{
author="support@zygorguides.com",
},[[
step
Click herbs around this area |goto Desolace 54.10,61.43
|tip Track them on your minimap with "Find Herbs".
|tip They spawn in this small area.
|tip You will need at least 120 Herbalism skill to gather these.
collect Grave Moss##3369 |n |goto Desolace 54.10,61.43
You can find more around this area [50.23,57.64]
]])
ZygorGuidesViewer:RegisterGuide("Profession Guides\\Herbalism\\Farming Guides\\Kingsblood",{
author="support@zygorguides.com",
},[[
step
map Wetlands
path follow smart; loop on; ants curved; dist 20
path	46.75,25.55	51.58,29.02	56.21,30.36	59.67,33.23	62.46,34.02
path	61.92,38.94	58.55,43.68	56.51,48.27	44.88,34.82	41.25,33.98
path	35.44,31.57	31.52,36.24	26.99,34.94	18.37,36.35	13.78,37.41
path	14.84,33.80	18.22,32.79	19.10,26.35	21.55,27.19	24.28,28.73
path	27.93,30.36	32.61,27.99	35.45,24.60	38.43,23.41	40.84,24.23
Click herbs as you follow the path around this area
|tip Track them on your minimap with "Find Herbs".
|tip You will need at least 125 Herbalism skill to gather these.
collect Kingsblood##3356 |n
]])
ZygorGuidesViewer:RegisterGuide("Profession Guides\\Herbalism\\Farming Guides\\Liferoot",{
author="support@zygorguides.com",
},[[
step
label "Path_One"
map Wetlands
path follow smart; loop off; dist 20
path	39.88,29.56	42.39,32.16	44.42,36.02	50.85,37.60	53.92,41.52
path	55.96,45.32	59.97,50.83	61.97,56.83	64.42,68.06	63.29,74.88
Click herbs as you follow the path around this area
|tip Track them on your minimap with "Find Herbs".
|tip You will need at least 150 Herbalism skill to gather these.
collect Liferoot##3357 |n
'|goto 63.29,74.88 < 20 |noway |c
step
map Wetlands
path follow smart; loop off; dist 20
path	63.29,74.88	64.42,68.06	61.97,56.83	59.97,50.83	55.96,45.32
path	53.92,41.52	50.85,37.60	44.42,36.02	42.39,32.16	39.88,29.56
Click herbs as you follow the path around this area
|tip Track them on your minimap with "Find Herbs".
|tip You will need at least 150 Herbalism skill to gather these.
collect Liferoot##3357 |n
'|goto 39.88,29.56 < 20 |noway |c |next "Path_One"
]])
ZygorGuidesViewer:RegisterGuide("Profession Guides\\Herbalism\\Farming Guides\\Fadeleaf",{
author="support@zygorguides.com",
},[[
step
map Swamp of Sorrows
path follow smart; loop on; ants curved; dist 20
path	20.50,54.53	16.62,58.22	15.71,65.71	12.68,68.05	10.73,63.62
path	12.41,55.83	15.50,47.83	18.39,45.92	22.07,39.95	28.92,38.70
path	33.28,38.90	38.62,34.97	47.12,33.93	51.82,34.91	51.62,41.06
path	44.78,45.30	37.49,50.34	33.07,52.19	27.05,54.68	22.47,57.13
Click herbs as you follow the path around this area
|tip Track them on your minimap with "Find Herbs".
|tip Watch out for horde guards along the main road.
|tip You will need at least 160 Herbalism skill to gather these.
collect Fadeleaf##3818 |n
]])
ZygorGuidesViewer:RegisterGuide("Profession Guides\\Herbalism\\Farming Guides\\Goldthorn",{
author="support@zygorguides.com",
},[[
step
label "Path_One"
map Stranglethorn Vale
path follow smart; loop off; dist 20
path	30.73,67.93	31.34,65.94	31.29,63.30	33.47,59.16	34.72,58.50
path	35.99,56.40	34.16,54.11	33.67,52.84	34.22,50.55	35.98,48.96
path	36.98,48.70	39.98,44.91	40.43,43.96	40.36,42.07	41.34,40.39
path	43.07,37.30	43.31,39.18	43.52,40.25	44.37,39.85	44.49,41.37
path	44.53,43.67	45.58,43.90	46.54,43.36	47.13,43.87	47.84,42.42
path	47.79,40.43	49.03,37.60	48.82,36.22	49.70,31.42	49.45,29.64
path	50.03,27.63	50.56,26.44	49.98,23.97	47.47,22.67	46.33,24.57
path	44.74,25.50	43.42,26.50	40.87,28.82	40.14,32.21	38.73,33.10
path	36.97,34.22	36.66,38.10	36.42,41.03	34.95,40.76	33.81,39.53
path	31.73,42.03	30.29,43.54	28.79,44.84	28.04,47.89	27.69,50.35
path	29.34,52.92	29.92,54.14	31.79,52.55
Click herbs as you follow the path around this area
|tip Track them on your minimap with "Find Herbs".
|tip You will need at least 170 Herbalism skill to gather these.
collect Goldthorn##3821 |n
'|goto 31.79,52.55 < 30 |noway |c
step
map Stranglethorn Vale
path follow smart; loop off; dist 20
path	33.43,55.29	33.15,56.95	31.66,58.87	31.13,61.25	30.56,63.99
path	30.40,67.21
Click herbs as you follow the path around this area
|tip Track them on your minimap with "Find Herbs".
|tip You will need at least 170 Herbalism skill to gather these.
collect Goldthorn##3821 |n
'|goto 30.40,67.21 < 30 |noway |c |next "Path_One"
]])
ZygorGuidesViewer:RegisterGuide("Profession Guides\\Herbalism\\Farming Guides\\Khadgar's Whisker",{
author="support@zygorguides.com",
},[[
step
label "Path_One"
map Stranglethorn Vale
path follow smart; loop off; dist 20
path	30.73,67.93	31.34,65.94	31.29,63.30	33.47,59.16	34.72,58.50
path	35.99,56.40	34.16,54.11	33.67,52.84	34.22,50.55	35.98,48.96
path	36.98,48.70	39.98,44.91	40.43,43.96	40.36,42.07	41.34,40.39
path	43.07,37.30	43.31,39.18	43.52,40.25	44.37,39.85	44.49,41.37
path	44.53,43.67	45.58,43.90	46.54,43.36	47.13,43.87	47.84,42.42
path	47.79,40.43	49.03,37.60	48.82,36.22	49.70,31.42	49.45,29.64
path	50.03,27.63	50.56,26.44	49.98,23.97	47.47,22.67	46.33,24.57
path	44.74,25.50	43.42,26.50	40.87,28.82	40.14,32.21	38.73,33.10
path	36.97,34.22	36.66,38.10	36.42,41.03	34.95,40.76	33.81,39.53
path	31.73,42.03	30.29,43.54	28.79,44.84	28.04,47.89	27.69,50.35
path	29.34,52.92	29.92,54.14	31.79,52.55
Click herbs as you follow the path around this area
|tip Track them on your minimap with "Find Herbs".
|tip You will need at least 185 Herbalism skill to gather these.
collect Khadgar's Whisker##3358 |n
'|goto 31.79,52.55 < 30 |noway |c
step
map Stranglethorn Vale
path follow smart; loop off; dist 20
path	33.43,55.29	33.15,56.95	31.66,58.87	31.13,61.25	30.56,63.99
path	30.40,67.21
Click herbs as you follow the path around this area
|tip Track them on your minimap with "Find Herbs".
|tip You will need at least 185 Herbalism skill to gather these.
collect Khadgar's Whisker##3358 |n
'|goto 30.40,67.21 < 30 |noway |c |next "Path_One"
]])
ZygorGuidesViewer:RegisterGuide("Profession Guides\\Herbalism\\Farming Guides\\Wintersbite",{
author="support@zygorguides.com",
},[[
step
label "Path_One"
map Alterac Mountains
path follow smart; loop off; dist 20
path	36.21,70.12	38.50,71.59	42.34,67.24	40.46,63.73	45.07,62.49
path	49.57,60.07	50.10,56.20	49.14,51.29	45.91,45.67	47.02,42.14
path	46.73,38.06	44.90,32.01
Click herbs as you follow the path around this area
|tip Track them on your minimap with "Find Herbs".
|tip You will need at least 195 Herbalism skill to gather these.
collect Wintersbite##3819 |n
'|goto 44.90,32.01 < 20 |noway |c
step
map Alterac Mountains
path follow smart; loop off; dist 20
path	44.90,32.01	46.73,38.06	47.02,42.14	45.91,45.67	49.14,51.29
path	50.10,56.20	49.57,60.07	45.07,62.49	40.46,63.73	42.34,67.24
path	38.50,71.59	36.21,70.12
Click herbs as you follow the path around this area
|tip Track them on your minimap with "Find Herbs".
|tip You will need at least 195 Herbalism skill to gather these.
collect Wintersbite##3819 |n
'|goto 36.21,70.12 < 20 |noway |c |next "Path_One"
]])
ZygorGuidesViewer:RegisterGuide("Profession Guides\\Herbalism\\Farming Guides\\Wildvine",{
author="support@zygorguides.com",
},[[
step
Kill Vilebranch Enemies around this area
collect Wildvine##8153 |n |goto The Hinterlands 47.57,66.46
|tip They have a 10% chance to be gathered from Purple Lotus around the Altar.
|tip Track them on your minimap with "Find Herbs".
|tip You will need at least 210 Herbalism skill to gather these.
]])
ZygorGuidesViewer:RegisterGuide("Profession Guides\\Herbalism\\Farming Guides\\Firebloom",{
author="support@zygorguides.com",
},[[
step
map Blasted Lands
path follow smart; loop on; ants curved; dist 20
path	59.95,26.91	63.87,32.24	62.52,37.16	61.93,40.77	63.59,47.87
path	60.16,47.06	56.61,47.07	52.58,50.11	48.61,51.34	45.83,49.50
path	46.56,43.37	45.38,37.03	44.55,26.43	45.95,23.01	49.76,23.71
path	51.28,26.22	52.49,31.62	51.40,36.19	53.41,38.07	55.97,36.24
path	57.46,32.43	58.67,28.99
Click herbs as you follow the path around this area
|tip Track them on your minimap with "Find Herbs".
|tip You will need at least 205 Herbalism skill to gather these.
collect Firebloom##4625 |n
]])
ZygorGuidesViewer:RegisterGuide("Profession Guides\\Herbalism\\Farming Guides\\Purple Lotus",{
author="support@zygorguides.com",
},[[
step
map Azshara
path follow smart; loop on; ants curved; dist 20
path	13.44,76.03	13.49,73.41	13.96,72.13	15.04,72.61	16.67,72.10
path	18.11,69.50	19.30,63.70	19.72,61.12	21.39,60.74	24.79,58.76
path	25.63,56.77	25.97,53.77	24.66,50.64	25.95,49.40	27.49,50.93
path	29.47,52.59	30.30,54.30	32.31,55.35	32.55,57.96	31.89,60.78
path	34.71,61.62	35.79,60.81	36.20,59.43	36.50,57.60	38.27,56.97
path	38.93,60.17	38.62,62.10	37.62,63.76	37.16,67.40	36.65,71.52
path	36.55,73.48	35.12,76.04	32.98,79.88	31.50,80.61	28.68,80.41
path	25.35,79.42	24.06,79.46	19.93,77.32	18.50,79.02	16.39,79.69
path	14.67,79.40
Click herbs as you follow the path around this area
|tip Track them on your minimap with "Find Herbs".
|tip You will need at least 210 Herbalism skill to gather these.
collect Purple Lotus##8831 |n
]])
ZygorGuidesViewer:RegisterGuide("Profession Guides\\Herbalism\\Farming Guides\\Arthas' Tears",{
author="support@zygorguides.com",
},[[
step
map Western Plaguelands
path follow smart; loop on; ants curved; dist 20
path	38.46,71.59	40.21,70.25	41.92,68.36	43.65,67.66	43.55,64.99
path	42.58,61.73	44.99,61.15	45.83,59.71	47.54,60.16	48.88,62.22
path	50.20,63.25	51.12,65.36	51.20,68.70	52.77,69.69	54.81,66.60
path	55.29,62.85	56.78,59.81	58.67,58.12	58.67,58.12	61.36,51.95
path	59.63,51.59	56.24,51.02	55.02,49.73	53.44,46.46	51.12,44.12
path	49.07,42.44	46.93,39.92	46.45,37.04	47.66,35.14	49.62,33.23
path	48.75,31.25	48.00,31.04	46.53,31.70	44.60,32.62	43.64,35.30
path	44.60,37.79	45.12,41.59	45.73,46.00	45.79,47.79	43.94,50.26
path	40.48,52.81	39.18,52.53	38.68,53.52	35.80,54.28	34.28,55.75
path	33.16,57.76	33.14,59.71	32.83,61.21	33.06,63.79	34.28,66.60
path	36.12,68.62	37.31,71.53
Click herbs as you follow the path around this area
|tip Track them on your minimap with "Find Herbs".
|tip You will need at least 220 Herbalism skill to gather these.
collect Arthas' Tears##8836 |n
]])
ZygorGuidesViewer:RegisterGuide("Profession Guides\\Herbalism\\Farming Guides\\Sungrass",{
author="support@zygorguides.com",
},[[
step
map Blasted Lands
path follow smart; loop on; ants curved; dist 20
path	59.95,26.91	63.87,32.24	62.52,37.16	61.93,40.77	63.59,47.87
path	60.16,47.06	56.61,47.07	52.58,50.11	48.61,51.34	45.83,49.50
path	46.56,43.37	45.38,37.03	44.55,26.43	45.95,23.01	49.76,23.71
path	51.28,26.22	52.49,31.62	51.40,36.19	53.41,38.07	55.97,36.24
path	57.46,32.43	58.67,28.99
Click herbs as you follow the path around this area
|tip Track them on your minimap with "Find Herbs".
|tip You will need at least 230 Herbalism skill to gather these.
collect Sungrass##8838 |n
]])
ZygorGuidesViewer:RegisterGuide("Profession Guides\\Herbalism\\Farming Guides\\Blindweed",{
author="support@zygorguides.com",
},[[
step
map Swamp of Sorrows
path follow smart; loop on; ants curved; dist 20
path	23.34,47.48	26.00,39.24	28.21,37.10	31.38,35.00	36.11,36.48
path	38.30,35.54	40.98,35.26	42.49,39.06	44.13,40.53	46.07,41.10
path	46.56,38.70	49.85,36.00	52.70,36.48	54.71,36.25	57.38,33.20
path	58.78,30.30	62.57,29.33	66.36,28.36	68.29,25.21	69.20,20.52
path	69.38,15.92	72.73,13.20	76.51,14.32	78.04,18.24	81.03,21.94
path	82.49,25.63	82.43,31.77	82.80,37.29	86.93,38.06	88.09,44.02
path	88.14,49.77	85.09,53.96	86.43,57.71	84.56,62.68	84.28,67.90
path	81.40,71.41	78.10,69.78	76.69,64.12	78.72,58.47	80.88,55.22
path	81.42,48.27	81.70,43.61	79.06,40.69	77.48,38.74	76.64,34.28
path	73.75,33.11	70.93,33.86	68.69,31.71	65.67,35.50	61.30,37.56
path	58.02,38.46	54.71,41.87	53.10,42.33	49.93,42.29	47.27,43.26
path	44.52,45.19	42.66,47.65	39.83,49.22	36.79,51.04	33.83,51.96
path	29.04,54.25
Click herbs as you follow the path around this area
|tip Track them on your minimap with "Find Herbs".
|tip You will need at least 235 Herbalism skill to gather these.
collect Blindweed##8839 |n
]])
ZygorGuidesViewer:RegisterGuide("Profession Guides\\Herbalism\\Farming Guides\\Ghost Mushroom",{
author="support@zygorguides.com",
},[[
step
map The Hinterlands
path follow smart; loop on; ants curved; dist 20
path	57.75,46.26	59.21,44.51	59.83,40.90	57.54,38.67	55.82,38.52
path	54.48,40.89	54.34,43.82	55.65,46.02
Click herbs as you follow the path around this area
|tip Track them on your minimap with "Find Herbs".
|tip You will need at least 245 Herbalism skill to gather these.
|tip They spawn inside of the cave along this path as well as outside of it.
collect Ghost Mushroom##8845 |n
]])
ZygorGuidesViewer:RegisterGuide("Profession Guides\\Herbalism\\Farming Guides\\Gromsblood",{
author="support@zygorguides.com",
},[[
step
map Blasted Lands
path follow smart; loop on; ants curved; dist 20
path	59.95,26.91	63.87,32.24	62.52,37.16	61.93,40.77	63.59,47.87
path	60.16,47.06	56.61,47.07	52.58,50.11	48.61,51.34	45.83,49.50
path	46.56,43.37	45.38,37.03	44.55,26.43	45.95,23.01	49.76,23.71
path	51.28,26.22	52.49,31.62	51.40,36.19	53.41,38.07	55.97,36.24
path	57.46,32.43	58.67,28.99
Click herbs as you follow the path around this area
|tip Track them on your minimap with "Find Herbs".
|tip You will need at least 250 Herbalism skill to gather these.
collect Gromsblood##8846 |n
]])
ZygorGuidesViewer:RegisterGuide("Profession Guides\\Herbalism\\Farming Guides\\Golden Sansam",{
author="support@zygorguides.com",
},[[
step
map Azshara
path follow smart; loop on; ants curved; dist 20
path	44.97,34.08	45.34,30.56	45.01,27.72	44.00,22.97	44.61,20.55
path	45.91,19.60	48.17,18.74	50.79,18.10	52.77,19.45	53.43,20.10
path	54.10,20.23	56.85,20.66	59.23,18.80	61.89,16.89	64.79,17.01
path	66.41,15.27	69.57,16.37	71.70,16.63	73.96,18.69	75.86,21.19
path	76.87,24.70	79.46,24.05	79.40,26.62	77.14,28.54	74.71,29.28
path	71.72,29.19	69.51,28.09	67.74,26.09	64.29,23.93	61.47,23.67
path	59.32,24.37	56.53,25.81	54.31,28.58	52.61,32.17	49.37,31.47
path	46.94,31.71
Click herbs as you follow the path around this area
|tip Track them on your minimap with "Find Herbs".
|tip You will need at least 260 Herbalism skill to gather these.
collect Golden Sansam##13464 |n
]])
ZygorGuidesViewer:RegisterGuide("Profession Guides\\Herbalism\\Farming Guides\\Dreamfoil",{
author="support@zygorguides.com",
},[[
step
map Azshara
path follow smart; loop on; ants curved; dist 20
path	44.97,34.08	45.34,30.56	45.01,27.72	44.00,22.97	44.61,20.55
path	45.91,19.60	48.17,18.74	50.79,18.10	52.77,19.45	53.43,20.10
path	54.10,20.23	56.85,20.66	59.23,18.80	61.89,16.89	64.79,17.01
path	66.41,15.27	69.57,16.37	71.70,16.63	73.96,18.69	75.86,21.19
path	76.87,24.70	79.46,24.05	79.40,26.62	77.14,28.54	74.71,29.28
path	71.72,29.19	69.51,28.09	67.74,26.09	64.29,23.93	61.47,23.67
path	59.32,24.37	56.53,25.81	54.31,28.58	52.61,32.17	49.37,31.47
path	46.94,31.71
Click herbs as you follow the path around this area
|tip Track them on your minimap with "Find Herbs".
|tip You will need at least 270 Herbalism skill to gather these.
collect Dreamfoil##13463 |n
]])
ZygorGuidesViewer:RegisterGuide("Profession Guides\\Herbalism\\Farming Guides\\Mountain Silversage",{
author="support@zygorguides.com",
},[[
step
map Un'Goro Crater
path follow smart; loop on; ants curved; dist 20
path	69.50,80.51	66.73,78.96	62.06,80.45	60.17,83.38	57.90,84.92
path	56.43,85.63	52.59,86.79	50.45,85.64	47.59,86.84	44.06,85.48
path	40.43,83.69	37.58,82.20	36.74,80.02	34.35,78.80	30.60,79.47
path	29.81,78.29	29.45,73.80	29.51,71.95	30.47,70.66	30.12,68.78
path	26.87,68.47	26.22,63.87	24.35,55.86	24.60,51.19	24.66,49.08
path	24.29,47.04	24.87,40.95	26.12,37.25	26.47,32.27	28.16,29.95
path	29.28,30.78	30.53,29.41	29.59,24.96	30.56,20.83	33.11,20.72
path	34.48,21.20	36.41,20.34	38.57,16.60	42.23,16.10	44.74,14.15
path	48.26,13.20	49.78,17.80	51.76,16.54	52.14,13.12	54.40,13.42
path	56.79,14.48	59.79,16.53	62.08,16.53	63.95,19.36	65.85,21.43
path	66.83,23.10	67.79,22.98	68.24,20.16	70.91,20.97	71.45,25.67
path	71.86,28.59	74.60,32.13	74.81,36.14	76.10,40.85	76.77,46.27
path	76.23,50.57	76.85,54.91	75.63,60.70	74.66,64.47	74.30,69.24
path	71.82,70.72	70.92,71.71	71.15,74.12	70.59,75.37	70.92,79.06
Click herbs as you follow the path around this area
|tip Track them on your minimap with "Find Herbs".
|tip You will need at least 280 Herbalism skill to gather these.
collect Mountain Silversage##13465 |n
]])
ZygorGuidesViewer:RegisterGuide("Profession Guides\\Herbalism\\Farming Guides\\Plaguebloom",{
author="support@zygorguides.com",
},[[
step
map Eastern Plaguelands
path follow smart; loop on; ants curved; dist 20
path	63.32,54.67	67.59,55.28	72.06,54.50	75.06,53.69	77.43,53.29
path	78.36,55.80	79.17,59.16	80.07,63.69	80.31,67.80	78.88,71.68
path	76.88,73.45	75.52,74.46	74.76,76.67	72.94,78.41	68.81,75.52
path	66.81,76.30	65.03,73.91	64.71,69.43	63.81,66.25	63.25,64.01
path	63.98,59.07
Click herbs as you follow the path around this area
|tip Track them on your minimap with "Find Herbs".
|tip You will need at least 285 Herbalism skill to gather these.
collect Plaguebloom##13466 |n
]])
ZygorGuidesViewer:RegisterGuide("Profession Guides\\Herbalism\\Farming Guides\\Icecap",{
author="support@zygorguides.com",
},[[
step
map Winterspring
path follow smart; loop on; ants curved; dist 20
path	51.15,36.38	49.02,37.97	47.29,38.82	46.26,37.85	44.98,36.98
path	43.34,37.35	42.00,36.66	40.04,36.95	37.55,36.29	37.03,38.50
path	37.04,40.67	36.22,41.42	34.89,40.49	32.81,37.93	31.53,36.07
path	29.97,36.02	29.97,39.23	29.90,42.23	30.63,44.36	31.61,44.78
path	32.31,44.29	34.16,43.86	34.79,42.97	35.73,43.41	36.55,44.20
path	37.95,44.18	40.05,43.83	41.97,43.60	43.29,44.09	44.44,42.87
path	45.25,41.37	45.82,40.53	46.38,39.95	47.29,40.48	48.43,42.60
path	49.89,44.73	50.67,45.63	52.44,46.41	53.08,44.56	53.42,43.72
path	55.09,43.38	56.62,42.13	57.86,40.63	58.81,39.07	58.04,36.73
path	56.38,36.22	54.08,33.77
Click herbs as you follow the path around this area
|tip Track them on your minimap with "Find Herbs".
|tip You will need at least 290 Herbalism skill to gather these.
collect Icecap##13467 |n
]])
ZygorGuidesViewer:RegisterGuide("Profession Guides\\Herbalism\\Farming Guides\\Black Lotus",{
author="support@zygorguides.com",
},[[
step
label "Path_One"
map Burning Steppes
path follow smart; loop off; dist 20
path	75.56,48.10	67.51,44.35	65.55,42.14	64.07,37.82	63.48,37.82
path	60.30,40.06	49.65,36.46	46.29,34.47	43.06,33.76	41.88,37.36
path	41.46,40.03	42.68,42.14	42.11,43.86	39.76,44.39	35.84,48.89
path	33.34,55.11	31.73,57.80	27.13,61.16	25.14,54.29	22.87,50.09
path	18.10,44.02	15.47,40.51	15.42,34.23	15.35,30.51
Click herbs as you follow the path around this area
|tip Track them on your minimap with "Find Herbs".
|tip You will need at least 300 Herbalism skill to gather these.
collect Black Lotus##13468 |n
|tip These are extremely rare.
|tip Pick other herbs on the path to have a chance to spawn them.
'|goto 15.35,30.51 < 20 |noway |c
step
map Burning Steppes
path follow smart; loop off; dist 20
path	15.35,30.51	15.42,34.23	15.47,40.51	18.10,44.02	22.87,50.09
path	25.14,54.29	27.13,61.16	31.73,57.80	33.34,55.11	35.84,48.89
path	39.76,44.39	42.11,43.86	42.68,42.14	41.46,40.03	41.88,37.36
path	43.06,33.76	46.29,34.47	49.65,36.46	60.30,40.06	63.48,37.82
path	64.07,37.82	65.55,42.14	67.51,44.35	75.56,48.10
Click herbs as you follow the path around this area
|tip Track them on your minimap with "Find Herbs".
|tip You will need at least 300 Herbalism skill to gather these.
collect Black Lotus##13468 |n
|tip These are extremely rare.
|tip Pick other herbs on the path to have a chance to spawn them.
'|goto 75.56,48.10 < 20 |noway |c |next "Path_One"
]])
ZygorGuidesViewer:RegisterGuide("Profession Guides\\Inscription\\Inscription (1-350)",{
author="support@zygorguides.com",
condition_suggested=function() return skill("Inscription") > 0 and skill("Inscription") < 350 end,
description="This guide will walk you through leveling your Inscription skill from 1-350.",
},[[
step
Reach Level 5 |ding 5
|tip You must be at least level 5 to train Apprentice professions.
|tip Use the leveling guides to accomplish this.
step
talk Jo'mah##30706
|tip Inside the building.
Train Apprentice Inscription |skillmax Inscription,75 |goto Orgrimmar/0 56.0,46.2
step
Click Here if You Would Like to Collect All Materials First |confirm |next |or
|tip This will have you collect all Classic-level materials before beginning.
_Or_
Click Here to Collect Materials as You Level or Resume Leveling Inscription |confirm |next "Begin_Profession_Leveling_Classic" |or
'|complete skill("Inscription") >= 300 |or |next "Begin_Profession_Leveling_Classic"
step
map Tirisfal Glades
path follow smart; loop on; ants curved; dist 20
path	51.54,54.24	50.24,56.05	47.60,53.12	45.65,51.89	46.96,47.83
path	44.74,46.19	42.79,42.59	41.45,40.79	39.11,40.30	38.92,43.20
path	38.50,46.14	36.48,47.41	34.54,48.14	32.02,48.17	31.72,50.34
path	33.92,51.19	37.36,51.84	38.60,52.08	39.77,54.03	40.68,58.21
path	40.92,60.80	41.92,63.49	44.02,65.29	46.57,66.37	49.11,67.48
path	50.44,66.83	51.57,64.64	54.10,62.49	56.28,59.15	56.53,55.12
path	53.81,53.15	52.04,54.99
click Peacebloom##1618+
|tip They look like small white flowers on the ground along the path.
click Silverleaf##1617+ |notinsticky
|tip They look like bushy blue and green plants on the ground along the path.
|tip Track them on your minimap with "Find Herbs".
collect 62 Alabaster Pigment##39151 |or
|tip Mill them from herbs with Inscription or purchase them from the auction house.
|tip Alabaster Pigment can be Milled from Earthroot, Peacebloom, and Silverleaf.
|tip These totals are approximate.
|tip You may need more or less than the indicated amount.
'|complete skill("Inscription") >= 53 |or
step
label "Collect_Dusky_Pigment_Total"
map The Barrens
path follow smart; loop on; ants curved; dist 20
path	59.15,37.73	58.67,39.28	59.28,40.67	61.05,41.62	61.87,41.98
path	61.83,43.50	61.73,44.93	62.46,45.59	62.55,47.02	61.37,48.53
path	61.16,49.91	60.17,50.20	58.92,50.02	56.90,50.43	56.86,47.77
path	56.42,45.86	55.99,45.25	56.38,43.40	56.07,41.87	55.04,41.51
path	54.83,42.75	54.03,43.67	53.18,45.13	52.20,45.76	48.47,46.84
path	46.80,43.94	43.45,40.70	43.61,38.41	41.90,37.41	42.70,35.52
path	42.16,33.03	39.72,31.26	39.93,29.78	40.90,27.82	42.44,25.74
path	45.14,25.67	46.02,24.49	45.83,22.32	45.17,21.63	44.47,21.60
path	43.39,20.61	41.18,19.63	40.38,15.78	43.73,15.53	48.89,13.63
path	53.28,14.18	55.37,9.81	57.33,9.22	58.34,7.44	60.18,7.56
path	62.69,8.90	62.42,11.56	62.31,16.47	61.10,19.72	59.62,20.88
path	58.10,21.14	57.12,23.28	58.85,25.07	60.26,28.59	60.58,31.18
path	60.20,34.14	59.26,36.84
click Mageroyal##1620+ |notinsticky
|tip They look like bushy pink flowers on the ground along the path. |notinsticky
|tip Track them on your minimap with "Find Herbs". |notinsticky
collect 42 Dusky Pigment##39334 |or
|tip Mill them from herbs with Inscription or purchase them from the auction house. |notinsticky
|tip Dusky Pigment can be Milled from Briarthorn, Bruiseweed, Mageroyal, Stranglekelp, and Swiftthistle.
|tip These totals are approximate. |notinsticky
|tip You may need more or less than the indicated amount. |notinsticky
'|complete skill("Inscription") >= 80 |or
step
label "Collect_Golden_Pigment_Total"
map Wetlands
path follow smart; loop on; ants curved; dist 20
path	46.75,25.55	51.58,29.02	56.21,30.36	59.67,33.23	62.46,34.02
path	61.92,38.94	58.55,43.68	56.51,48.27	44.88,34.82	41.25,33.98
path	35.44,31.57	31.52,36.24	26.99,34.94	18.37,36.35	13.78,37.41
path	14.84,33.80	18.22,32.79	19.10,26.35	21.55,27.19	24.28,28.73
path	27.93,30.36	32.61,27.99	35.45,24.60	38.43,23.41	40.84,24.23
click Kingsblood##1624+ |notinsticky
|tip They look like bushy purple, pink, and green plants on the ground along the path. |notinsticky
|tip Track them on your minimap with "Find Herbs". |notinsticky
collect 80 Golden Pigment##39338 |or
|tip Mill them from herbs with Inscription or purchase them from the auction house. |notinsticky
|tip Golden Pigment can be Milled from Grave Moss, Kingsblood, Liferoot, and Wild Steelbloom.
|tip These totals are approximate. |notinsticky
|tip You may need more or less than the indicated amount. |notinsticky
'|complete skill("Inscription") >= 105 |or
step
label "Collect_Emerald_Pigment_Total"
map Stranglethorn Vale
path follow smart; loop off; dist 20
path	30.73,67.93	31.34,65.94	31.29,63.30	33.47,59.16	34.72,58.50
path	35.99,56.40	34.16,54.11	33.67,52.84	34.22,50.55	35.98,48.96
path	36.98,48.70	39.98,44.91	40.43,43.96	40.36,42.07	41.34,40.39
path	43.07,37.30	43.31,39.18	43.52,40.25	44.37,39.85	44.49,41.37
path	44.53,43.67	45.58,43.90	46.54,43.36	47.13,43.87	47.84,42.42
path	47.79,40.43	49.03,37.60	48.82,36.22	49.70,31.42	49.45,29.64
path	50.03,27.63	50.56,26.44	49.98,23.97	47.47,22.67	46.33,24.57
path	44.74,25.50	43.42,26.50	40.87,28.82	40.14,32.21	38.73,33.10
path	36.97,34.22	36.66,38.10	36.42,41.03	34.95,40.76	33.81,39.53
path	31.73,42.03	30.29,43.54	28.79,44.84	28.04,47.89	27.69,50.35
path	29.34,52.92	29.92,54.14	31.79,52.55
click Khadgar's Whisker##2043+ |notinsticky
|tip They look like clumps of gold and green grass on the ground along the path. |notinsticky
|tip Track them on your minimap with "Find Herbs". |notinsticky
collect 94 Emerald Pigment##39339 |or
|tip Mill them from herbs with Inscription or purchase them from the auction house. |notinsticky
|tip Emerald Pigment can be Milled from Fadeleaf, Goldthorn, Khadgar's Whisker, and Wintersbite.
|tip These totals are approximate. |notinsticky
|tip You may need more or less than the indicated amount. |notinsticky
'|complete skill("Inscription") >= 155 |or
'|goto 31.79,52.55 < 20 |noway |c |or
step
map Stranglethorn Vale
path follow smart; loop off; dist 20
path	33.43,55.29	33.15,56.95	31.66,58.87	31.13,61.25	30.56,63.99
path	30.40,67.21
click Khadgar's Whisker##2043+ |notinsticky
|tip They look like clumps of gold and green grass on the ground along the path. |notinsticky
|tip Track them on your minimap with "Find Herbs". |notinsticky
collect 94 Emerald Pigment##39339 |or
|tip Mill them from herbs with Inscription or purchase them from the auction house. |notinsticky
|tip Emerald Pigment can be Milled from Fadeleaf, Goldthorn, Khadgar's Whisker, and Wintersbite.
|tip These totals are approximate. |notinsticky
|tip You may need more or less than the indicated amount. |notinsticky
'|complete skill("Inscription") >= 155 |or
'|goto 30.40,67.21 < 20 |noway |c |next "Collect_Emerald_Pigment_Total" |or
step
label "Collect_Violet_Pigment_Total"
map Blasted Lands
path follow smart; loop on; ants curved; dist 20
path	59.95,26.91	63.87,32.24	62.52,37.16	61.93,40.77	63.59,47.87
path	60.16,47.06	56.61,47.07	52.58,50.11	48.61,51.34	45.83,49.50
path	46.56,43.37	45.38,37.03	44.55,26.43	45.95,23.01	49.76,23.71
path	51.28,26.22	52.49,31.62	51.40,36.19	53.41,38.07	55.97,36.24
path	57.46,32.43	58.67,28.99
click Gromsblood##142145+ |notinsticky
|tip They look like purple and green weeds on the ground along the path. |notinsticky
|tip Track them on your minimap with "Find Herbs". |notinsticky
|tip You will need level 250 Herbalism to gather these. |notinsticky
collect 110 Violet Pigment##39340 |or
|tip Mill them from herbs with Inscription or purchase them from the auction house. |notinsticky
|tip Violet Pigment can be Milled from Arthas' Tears, Blindweed, Firebloom, Ghost Mushroom, Gromsblood, Purple Lotus, and Sungrass. |notinsticky
|tip These totals are approximate. |notinsticky
|tip You may need more or less than the indicated amount. |notinsticky
'|complete skill("Inscription") >= 205 |or
step
label "Collect_Silvery_Pigment_Total"
map Winterspring
path follow smart; loop on; ants curved; dist 20
path	51.15,36.38	49.02,37.97	47.29,38.82	46.26,37.85	44.98,36.98
path	43.34,37.35	42.00,36.66	40.04,36.95	37.55,36.29	37.03,38.50
path	37.04,40.67	36.22,41.42	34.89,40.49	32.81,37.93	31.53,36.07
path	29.97,36.02	29.97,39.23	29.90,42.23	30.63,44.36	31.61,44.78
path	32.31,44.29	34.16,43.86	34.79,42.97	35.73,43.41	36.55,44.20
path	37.95,44.18	40.05,43.83	41.97,43.60	43.29,44.09	44.44,42.87
path	45.25,41.37	45.82,40.53	46.38,39.95	47.29,40.48	48.43,42.60
path	49.89,44.73	50.67,45.63	52.44,46.41	53.08,44.56	53.42,43.72
path	55.09,43.38	56.62,42.13	57.86,40.63	58.81,39.07	58.04,36.73
path	56.38,36.22	54.08,33.77
click Icecap##176588+ |notinsticky
|tip They look like plants topped with white balls on the ground along the path. |notinsticky
|tip Track them on your minimap with "Find Herbs". |notinsticky
|tip You will need level 290 Herbalism to gather these. |notinsticky
collect 120 Silvery Pigment##39341 |or
|tip Mill them from herbs with Inscription or purchase them from the auction house. |notinsticky
|tip Silvery Pigment can be Milled from Dreamfoil, Golden Sansam, Icecap, Mountain Silversage, and Plaguebloom. |notinsticky
|tip These totals are approximate. |notinsticky
|tip You may need more or less than the indicated amount. |notinsticky
|tip If you receive Sapphire Pigment from Milling, you will need less of these. |notinsticky
'|complete skill("Inscription") >= 255 |or
step
label "Begin_Profession_Leveling_Classic"
map Tirisfal Glades
path follow smart; loop on; ants curved; dist 20
path	51.54,54.24	50.24,56.05	47.60,53.12	45.65,51.89	46.96,47.83
path	44.74,46.19	42.79,42.59	41.45,40.79	39.11,40.30	38.92,43.20
path	38.50,46.14	36.48,47.41	34.54,48.14	32.02,48.17	31.72,50.34
path	33.92,51.19	37.36,51.84	38.60,52.08	39.77,54.03	40.68,58.21
path	40.92,60.80	41.92,63.49	44.02,65.29	46.57,66.37	49.11,67.48
path	50.44,66.83	51.57,64.64	54.10,62.49	56.28,59.15	56.53,55.12
path	53.81,53.15	52.04,54.99
click Peacebloom##1618+
|tip They look like small white flowers on the ground along the path.
click Silverleaf##1617+ |notinsticky
|tip They look like bushy blue and green plants on the ground along the path.
|tip Track them on your minimap with "Find Herbs".
collect 62 Alabaster Pigment##39151 |or
|tip Mill them from herbs with Inscription or purchase them from the auction house.
|tip Alabaster Pigment can be Milled from Earthroot, Peacebloom, and Silverleaf.
|tip These totals are approximate.
|tip You may need more or less than the indicated amount.
'|complete skill("Inscription") >= 19 |or
step
talk Xantili##30723
|tip Inside the building.
buy 1 Virtuoso Inking Set##39505 |goto Orgrimmar/0 56.0,46.2 |or
'|complete skill("Inscription") >= 19 |or
step
talk Jo'mah##30706
|tip Inside the building.
Train Ivory Ink |learn Ivory Ink##3173 |goto Orgrimmar/0 56.0,46.2
step
create 18 Ivory Ink##52738,Inscription,18 total |or
|tip Save these, you will need them for future steps.
'|complete skill("Inscription") >= 19 |or
step
create 1 Ivory Ink##52738,Inscription,19
|tip Save at least 18 of these; you will need them for future steps.
step
collect 16 Ivory Ink##37101 |or
|tip You created these in a previous step.
'|complete skill("Inscription") >= 35 |or
step
talk Xantili##30723
buy 16 Light Parchment##39354 |goto Orgrimmar/0 56.0,46.2 |or
'|complete skill("Inscription") >= 35 |or
step
talk Jo'mah##30706
|tip Inside the building.
Train Scroll of Stamina |learn Scroll of Stamina##45382 |goto Orgrimmar/0 56.0,46.2
step
create 16 Scroll of Stamina##45382,Inscription,35
|tip You may need to create more or less of these.
|tip Each additional Scroll of Stamina requires 1 Ivory Ink and 1 Light Parchment.
step
collect 44 Alabaster Pigment##39151 |or
|tip You collected these in a previous step.
'|complete skill("Inscription") >= 53 |or
step
talk Jo'mah##30706
|tip Inside the building.
Train Moonglow Ink |learn Moonglow Ink##52843 |goto Orgrimmar/0 56.0,46.2
step
create 22 Moonglow Ink##52843,Inscription,22 total
|tip Save these, you will need them for future steps.
step
create 1 Moonglow Ink##52843,Inscription,53
|tip Save at least 22 of these; you will need them for future steps.
step
collect 22 Moonglow Ink##39469 |or
|tip You collected these in a previous step.
'|complete skill("Inscription") >= 75 |or
step
talk Xantili##30723
buy 44 Light Parchment##39354 |goto Orgrimmar/0 56.0,46.2 |or
'|complete skill("Inscription") >= 75 |or
step
talk Jo'mah##30706
|tip Inside the building.
Train Armor Vellum |learn Armor Vellum##52739 |goto Orgrimmar/0 56.0,46.2
step
create 22 Armor Vellum##52739,Inscription,75
|tip You may need to create more or less of these.
|tip Each additional Armor Vellum requires 1 Moonglow Ink and 2 Light Parchment.
|tip Save these and place high-value enchants on them.
step
Reach Level 10 |ding 10
|tip You must be at least level 10 to train Journeyman professions.
|tip Use the leveling guides to accomplish this.
step
talk Jo'mah##30706
|tip Inside the building.
Train Journeyman Inscription |skillmax Inscription,150 |goto Orgrimmar/0 56.0,46.2
step
talk Jo'mah##30706
|tip Inside the building.
Train Midnight Ink |learn Midnight Ink##53462 |goto Orgrimmar/0 56.0,46.2
step
map The Barrens
path follow smart; loop on; ants curved; dist 20
path	59.15,37.73	58.67,39.28	59.28,40.67	61.05,41.62	61.87,41.98
path	61.83,43.50	61.73,44.93	62.46,45.59	62.55,47.02	61.37,48.53
path	61.16,49.91	60.17,50.20	58.92,50.02	56.90,50.43	56.86,47.77
path	56.42,45.86	55.99,45.25	56.38,43.40	56.07,41.87	55.04,41.51
path	54.83,42.75	54.03,43.67	53.18,45.13	52.20,45.76	48.47,46.84
path	46.80,43.94	43.45,40.70	43.61,38.41	41.90,37.41	42.70,35.52
path	42.16,33.03	39.72,31.26	39.93,29.78	40.90,27.82	42.44,25.74
path	45.14,25.67	46.02,24.49	45.83,22.32	45.17,21.63	44.47,21.60
path	43.39,20.61	41.18,19.63	40.38,15.78	43.73,15.53	48.89,13.63
path	53.28,14.18	55.37,9.81	57.33,9.22	58.34,7.44	60.18,7.56
path	62.69,8.90	62.42,11.56	62.31,16.47	61.10,19.72	59.62,20.88
path	58.10,21.14	57.12,23.28	58.85,25.07	60.26,28.59	60.58,31.18
path	60.20,34.14	59.26,36.84
click Mageroyal##1620+
|tip They look like bushy pink flowers on the ground along the path.
|tip Track them on your minimap with "Find Herbs".
collect 42 Dusky Pigment##39334 |or
|tip Mill them from herbs with Inscription or purchase them from the auction house.
|tip Dusky Pigment can be Milled from Briarthorn, Bruiseweed, Mageroyal, Stranglekelp, and Swiftthistle.
|tip These totals are approximate.
|tip You may need more or less than the indicated amount.
'|complete skill("Inscription") >= 80 |or
step
create 21 Midnight Ink##53462,Inscription,21 total
|tip Save at least 20 of these; you will need them for future steps.
step
create 1 Midnight Ink##53462,Inscription,80
|tip You may need to create more or less of these.
|tip Each additional Midnight Ink requires 2 Dusky Pigment.
step
collect 20 Midnight Ink##53462 |or
|tip You collected these in a previous step.
'|complete skill("Inscription") >= 100 |or
step
talk Xantili##30723
buy 20 Light Parchment##39354 |goto Orgrimmar/0 56.0,46.2 |or
'|complete skill("Inscription") >= 100 |or
step
_<Create any orange-difficulty glyphs>_
|tip Train the glyphs of your choosing from the trainer.
|tip For the next 20 points, continue training new orange-difficulty glyphs as you gain points.
|tip Open your Inscription panel and create any trained glyph of your choice that is orange.
Reach 100 Inscription Skill |skill Inscription,100
step
map Wetlands
path follow smart; loop on; ants curved; dist 20
path	46.75,25.55	51.58,29.02	56.21,30.36	59.67,33.23	62.46,34.02
path	61.92,38.94	58.55,43.68	56.51,48.27	44.88,34.82	41.25,33.98
path	35.44,31.57	31.52,36.24	26.99,34.94	18.37,36.35	13.78,37.41
path	14.84,33.80	18.22,32.79	19.10,26.35	21.55,27.19	24.28,28.73
path	27.93,30.36	32.61,27.99	35.45,24.60	38.43,23.41	40.84,24.23
click Kingsblood##1624+
|tip They look like bushy purple, pink, and green plants on the ground along the path.
|tip Track them on your minimap with "Find Herbs".
collect 80 Golden Pigment##39338 |or
|tip Mill them from herbs with Inscription or purchase them from the auction house.
|tip Golden Pigment can be Milled from Grave Moss, Kingsblood, Liferoot, and Wild Steelbloom.
|tip These totals are approximate.
|tip You may need more or less than the indicated amount.
'|complete skill("Inscription") >= 105 |or
step
talk Jo'mah##30706
|tip Inside the building.
Train Lion's Ink |learn Lion's Ink##57704 |goto Orgrimmar/0 56.0,46.2
step
create 40 Lion's Ink##57704,Inscription,40 total
|tip Save these, you will need them for future steps.
step
create 1 Lion's Ink##57704,Inscription,105
|tip You may need to create more or less of these.
|tip Each additional Lion's Ink requires 2 Dusky Pigment.
step
collect 20 Lion's Ink##43116 |or
|tip You collected these in a previous step.
'|complete skill("Inscription") >= 125 |or
step
talk Xantili##30723
buy 20 Common Parchment##10648 |goto Orgrimmar/0 56.0,46.2 |or
'|complete skill("Inscription") >= 125 |or
step
_<Create any orange-difficulty glyphs>_
|tip Train the glyphs of your choosing from the trainer.
|tip For the next 20 points, continue training new orange-difficulty glyphs as you gain points.
|tip Open your Inscription panel and create any trained glyph of your choice that is orange.
Reach 125 Inscription Skill |skill Inscription,125
step
Reach Level 20 |ding 20
|tip You must be at least level 20 to train Expert professions.
|tip Use the leveling guides to accomplish this.
step
talk Jo'mah##30706
|tip Inside the building.
Train Expert Inscription |skillmax Inscription,225 |goto Orgrimmar/0 56.0,46.2
|tip Also train any orange-difficulty glyphs you would like to make.
step
_<Create any orange-difficulty glyphs>_
|tip Train the glyphs of your choosing from the trainer.
|tip For the next 20 points, continue training new orange-difficulty glyphs as you gain points.
|tip Open your Inscription panel and create any trained glyph of your choice that is orange.
Reach 130 Inscription Skill |skill Inscription,130
|tip If you have any Burnt Pigment, you can turn it into Dawnstar Ink for points first.
step
collect 17 Lion's Ink##43116 |or
|tip You collected these in a previous step.
'|complete skill("Inscription") >= 147 |or
step
talk Xantili##30723
buy 17 Common Parchment##10648 |goto Orgrimmar/0 56.0,46.2 |or
'|complete skill("Inscription") >= 147 |or
step
_<Create any orange-difficulty glyphs>_
|tip Train the glyphs of your choosing from the trainer.
|tip For the next 17 points, continue training new orange-difficulty glyphs as you gain points.
|tip Open your Inscription panel and create any trained glyph of your choice that is orange.
Reach 147 Inscription Skill |skill Inscription,147
step
_<Create any orange-difficulty glyphs>_
|tip Train the glyphs of your choosing from the trainer.
|tip For the next 17 points, continue training new orange-difficulty glyphs as you gain points.
|tip Open your Inscription panel and create any trained glyph of your choice that is orange.
Reach 150 Inscription Skill |skill Inscription,150
|tip If you made Dawnstar Ink, make Strange Tarot cards instead.
step
label "Collect_Emerald_Pigment_155"
map Stranglethorn Vale
path follow smart; loop off; dist 20
path	30.73,67.93	31.34,65.94	31.29,63.30	33.47,59.16	34.72,58.50
path	35.99,56.40	34.16,54.11	33.67,52.84	34.22,50.55	35.98,48.96
path	36.98,48.70	39.98,44.91	40.43,43.96	40.36,42.07	41.34,40.39
path	43.07,37.30	43.31,39.18	43.52,40.25	44.37,39.85	44.49,41.37
path	44.53,43.67	45.58,43.90	46.54,43.36	47.13,43.87	47.84,42.42
path	47.79,40.43	49.03,37.60	48.82,36.22	49.70,31.42	49.45,29.64
path	50.03,27.63	50.56,26.44	49.98,23.97	47.47,22.67	46.33,24.57
path	44.74,25.50	43.42,26.50	40.87,28.82	40.14,32.21	38.73,33.10
path	36.97,34.22	36.66,38.10	36.42,41.03	34.95,40.76	33.81,39.53
path	31.73,42.03	30.29,43.54	28.79,44.84	28.04,47.89	27.69,50.35
path	29.34,52.92	29.92,54.14	31.79,52.55
click Khadgar's Whisker##2043+
|tip They look like clumps of gold and green grass on the ground along the path.
|tip Track them on your minimap with "Find Herbs".
collect 94 Emerald Pigment##39339 |or
|tip Mill them from herbs with Inscription or purchase them from the auction house.
|tip Emerald Pigment can be Milled from Fadeleaf, Goldthorn, Khadgar's Whisker, and Wintersbite.
|tip These totals are approximate.
|tip You may need more or less than the indicated amount.
'|complete skill("Inscription") >= 155 |or
'|goto 31.79,52.55 < 20 |noway |c |or
step
map Stranglethorn Vale
path follow smart; loop off; dist 20
path	33.43,55.29	33.15,56.95	31.66,58.87	31.13,61.25	30.56,63.99
path	30.40,67.21
click Khadgar's Whisker##2043+
|tip They look like clumps of gold and green grass on the ground along the path.
|tip Track them on your minimap with "Find Herbs".
collect 94 Emerald Pigment##39339 |or
|tip Mill them from herbs with Inscription or purchase them from the auction house.
|tip Emerald Pigment can be Milled from Fadeleaf, Goldthorn, Khadgar's Whisker, and Wintersbite.
|tip These totals are approximate.
|tip You may need more or less than the indicated amount.
'|complete skill("Inscription") >= 155 |or
'|goto 30.40,67.21 < 20 |noway |c |next "Collect_Emerald_Pigment_155" |or
step
talk Jo'mah##30706
|tip Inside the building.
Train Jadefire Ink |learn Jadefire Ink##57707 |goto Orgrimmar/0 56.0,46.2
step
create 47 Jadefire Ink##57707,Inscription,47 total
|tip Save these, you will need them for future steps.
step
create 1 Jadefire Ink##57707,Inscription,155
|tip You may need to create more or less of these.
|tip Each additional Jadefire Ink requires 2 Emerald Pigment.
step
collect 40 Jadefire Ink##43118 |or
|tip You collected these in a previous step.
'|complete skill("Inscription") >= 195 |or
step
talk Xantili##30723
buy 40 Common Parchment##10648 |goto Orgrimmar/0 56.0,46.2 |or
'|complete skill("Inscription") >= 195 |or
step
_<Create any orange-difficulty glyphs>_
|tip Train the glyphs of your choosing from the trainer.
|tip For the next 40 points, continue training new orange-difficulty glyphs as you gain points.
|tip Open your Inscription panel and create any trained glyph of your choice that is orange.
Reach 195 Inscription Skill |skill Inscription,195
|tip At skill 175, stop and convert Indigo Pigment into Royal Ink if you have any.
step
_<Create any yellow-difficulty glyphs>_
|tip Train the glyphs of your choosing from the trainer.
|tip For the next 5 points, continue creating yellow-difficulty glyphs to gain points.
|tip Open your Inscription panel and create any trained glyph of your choice that is yellow.
Reach 200 Inscription Skill |skill Inscription,200
|tip If you made Indigo Pigment, make Arcane Tarot cards instead.
step
Reach Level 35 |ding 35
|tip You must be at least level 35 to train Artisan professions.
|tip Use the leveling guides to accomplish this.
step
talk Jo'mah##30706
|tip Inside the building.
Train Artisan Inscription |skillmax Inscription,300 |goto Orgrimmar/0 56.0,46.2
step
talk Jo'mah##30706
|tip Inside the building.
Train Celestial Ink |learn Celestial Ink##57709 |goto Orgrimmar/0 56.0,46.2
step
map Blasted Lands
path follow smart; loop on; ants curved; dist 20
path	59.95,26.91	63.87,32.24	62.52,37.16	61.93,40.77	63.59,47.87
path	60.16,47.06	56.61,47.07	52.58,50.11	48.61,51.34	45.83,49.50
path	46.56,43.37	45.38,37.03	44.55,26.43	45.95,23.01	49.76,23.71
path	51.28,26.22	52.49,31.62	51.40,36.19	53.41,38.07	55.97,36.24
path	57.46,32.43	58.67,28.99
click Gromsblood##142145+
|tip They look like purple and green weeds on the ground along the path.
|tip Track them on your minimap with "Find Herbs".
|tip You will need level 250 Herbalism to gather these.
collect 110 Violet Pigment##39340 |or
|tip Mill them from herbs with Inscription or purchase them from the auction house.
|tip Violet Pigment can be Milled from Arthas' Tears, Blindweed, Firebloom, Ghost Mushroom, Gromsblood, Purple Lotus, and Sungrass.
|tip These totals are approximate.
|tip You may need more or less than the indicated amount.
'|complete skill("Inscription") >= 205 |or
step
create 55 Celestial Ink##57709,Inscription,55 total
|tip Save these, you will need them for future steps.
step
create 1 Celestial Ink##57709,Inscription,205
|tip You may need to create more or less of these.
|tip Each additional Celestial Ink requires 2 Violet Pigment.
step
collect 40 Celestial Ink##43120 |or
|tip You collected these in a previous step.
'|complete skill("Inscription") >= 245 |or
step
talk Xantili##30723
buy 40 Heavy Parchment##39501 |goto Orgrimmar/0 56.0,46.2 |or
'|complete skill("Inscription") >= 245 |or
step
_<Create any orange-difficulty glyphs>_
|tip Train the glyphs of your choosing from the trainer.
|tip For the next 40 points, continue training new orange-difficulty glyphs as you gain points.
|tip Open your Inscription panel and create any trained glyph of your choice that is orange.
Reach 245 Inscription Skill |skill Inscription,245
|tip At skill 225, stop and convert Ruby Pigment into Fiery Ink if you have any.
step
_<Create any yellow-difficulty glyphs>_
|tip Train the glyphs of your choosing from the trainer.
|tip For the next 5 points, continue creating yellow-difficulty glyphs to gain points.
|tip Open your Inscription panel and create any trained glyph of your choice that is yellow.
Reach 250 Inscription Skill |skill Inscription,250
|tip If you made Ruby Pigment, make Weapon Vellum II instead.
step
map Winterspring
path follow smart; loop on; ants curved; dist 20
path	51.15,36.38	49.02,37.97	47.29,38.82	46.26,37.85	44.98,36.98
path	43.34,37.35	42.00,36.66	40.04,36.95	37.55,36.29	37.03,38.50
path	37.04,40.67	36.22,41.42	34.89,40.49	32.81,37.93	31.53,36.07
path	29.97,36.02	29.97,39.23	29.90,42.23	30.63,44.36	31.61,44.78
path	32.31,44.29	34.16,43.86	34.79,42.97	35.73,43.41	36.55,44.20
path	37.95,44.18	40.05,43.83	41.97,43.60	43.29,44.09	44.44,42.87
path	45.25,41.37	45.82,40.53	46.38,39.95	47.29,40.48	48.43,42.60
path	49.89,44.73	50.67,45.63	52.44,46.41	53.08,44.56	53.42,43.72
path	55.09,43.38	56.62,42.13	57.86,40.63	58.81,39.07	58.04,36.73
path	56.38,36.22	54.08,33.77
click Icecap##176588+
|tip They look like plants topped with white balls on the ground along the path.
|tip Track them on your minimap with "Find Herbs".
|tip You will need level 290 Herbalism to gather these.
collect 130 Silvery Pigment##39341 |or
|tip Mill them from herbs with Inscription or purchase them from the auction house.
|tip Silvery Pigment can be Milled from Dreamfoil, Golden Sansam, Icecap, Mountain Silversage, and Plaguebloom.
|tip These totals are approximate.
|tip You may need more or less than the indicated amount.
|tip If you receive Sapphire Pigment from Milling, you will around 30 fewer.
'|complete skill("Inscription") >= 255 |or
step
talk Jo'mah##30706
|tip Inside the building.
Train Shimmering Ink |learn Shimmering Ink##57711 |goto Orgrimmar/0 56.0,46.2
step
create 65 Shimmering Ink##57711,Inscription,65 total
|tip Save these, you will need them for future steps.
|tip If you receive Sapphire Pigment from Milling, you will around 15 fewer.
step
create 1 Shimmering Ink##57711,Inscription,255
|tip You may need to create more or less of these.
|tip Each additional Shimmering Ink requires 2 Violet Pigment.
|tip If you receive Sapphire Pigment from Milling, you will around 15 fewer.
step
collect 5 Shimmering Ink##43122 |or
|tip You collected these in a previous step.
'|complete skill("Inscription") >= 260 |or
step
talk Xantili##30723
buy 10 Heavy Parchment##39501 |goto Orgrimmar/0 56.0,46.2 |or
'|complete skill("Inscription") >= 260 |or
step
talk Jo'mah##30706
|tip Inside the building.
Train Scroll of Spirit V |learn Scroll of Spirit V##50608 |goto Orgrimmar/0 56.0,46.2
step
create 5 Scroll of Spirit V##50608,Inscription,265
step
collect 60 Shimmering Ink##43122 |or
|tip You collected these in a previous step.
|tip If you receive Sapphire Pigment from Milling, you will around 15 fewer.
'|complete skill("Inscription") >= 290 |or
step
talk Xantili##30723
buy 60 Heavy Parchment##39501 |goto Orgrimmar/0 56.0,46.2 |or
|tip If you receive Sapphire Pigment from Milling, you will around 15 fewer.
'|complete skill("Inscription") >= 290 |or
step
_<Create any orange-difficulty glyphs>_
|tip Train the glyphs of your choosing from the trainer.
|tip For the next 25 points, continue training new orange-difficulty glyphs as you gain points.
|tip Open your Inscription panel and create any trained glyph of your choice that is orange.
Reach 290 Inscription Skill |skill Inscription,290
|tip At skill 275, stop and convert Sapphire Pigment into Ink of the Sky if you have any.
step
Reach Level 58 |ding 58
|tip You must be at least level 58 to train Master professions in Outland.
|tip Use the leveling guides to accomplish this.
step
talk Neferatti##30722
|tip Inside the building.
Train Master Inscription |skillmax Inscription,375 |goto Hellfire Peninsula/0 52.2,36.0
step
talk Neferatti##30722
|tip Inside the building.
Train Ethereal Ink |learn Ethereal Ink##57713 |goto Hellfire Peninsula/0 52.2,36.0
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
|tip They look like small white flowers on the ground along the path.
|tip You will need level 300 Herbalism to gather these.
click Dreaming Glory##181271+
|tip They look like bushy blue and green plants on the ground along the path.
|tip You will need level 315 Herbalism to gather these.
|tip Track them on your minimap with "Find Herbs".
collect 90 Nether Pigment##39342 |or
|tip Mill them from herbs with Inscription or purchase them from the auction house.
|tip Nether Pigment can be Milled from any Outland herb.
|tip These totals are approximate.
|tip You may need more or less than the indicated amount.
'|complete skill("Inscription") >= 305 |or
step
create 45 Ethereal Ink##57713,Inscription,45 total
|tip Save these, you will need them for future steps.
step
create 1 Ethereal Ink##57713,Inscription,305
|tip You may need to create more or less of these.
|tip Each additional Ethereal Ink requires 2 Nether Pigment.
step
collect 45 Ethereal Ink##43124 |or
|tip You collected these in a previous step.
'|complete skill("Inscription") >= 350 |or
step
talk Kul Inkspiller##30735
|tip Inside the building.
buy 45 Resilient Parchment##39502 |goto Hellfire Peninsula/0 52.4,36.0 |or
'|complete skill("Inscription") >= 350 |or
step
_<Create any orange-difficulty glyphs>_
|tip Train the glyphs of your choosing from the trainer.
|tip For the next 45 points, continue training new orange-difficulty glyphs as you gain points.
|tip Open your Inscription panel and create any trained glyph of your choice that is orange.
Reach 350 Inscription Skill |skill Inscription,350
step
_Congratulations!_
You Reached Skill 450 in Inscription.
|tip Leveling Inscription further is very expensive without Northrend materials.
|tip Waiting until the Wrath of the Lich King launch will greatly reduce the time and gold required to progress further.
]])
ZygorGuidesViewer:RegisterGuide("Profession Guides\\Jewelcrafting\\Jewelcrafting (1-375)",{
author="support@zygorguides.com",
condition_suggested=function() return skill("Jewelcrafting") > 0 and skill("Jewelcrafting") < 375 end,
description="This guide will walk you through leveling your Jewelcrafting skill from 1-375.",
},[[
step
Reach Level 5 |ding 5
|tip You must be at least level 5 to train Apprentice professions.
|tip Use the leveling guides to accomplish this.
step
Click Here if You Would Like to Collect All Materials First |confirm |next |or
_Or_
Click Here to Collect Materials as You Level or Resume Leveling Jewelcrafting |confirm |next "Begin_Profession_Leveling" |or
'|complete skill("Jewelcrafting") >= 375 |next "Begin_Profession_Leveling" |or
stickystart "Collect_Bronze_Bar_Total"
stickystart "Collect_Mithril_Bar_Total"
stickystart "Collect_Truesilver_Bar_Total"
stickystart "Collect_Thorium_Bar_Total"
stickystart "Collect_Adamantite_Bar_Total"
step
map Durotar
path follow smart; loop on; ants curved; dist 20
path	50.96,17.00	52.99,18.09	54.60,19.05	55.40,21.06	55.71,23.38
path	56.28,25.33	55.89,27.78	54.64,27.62	55.10,30.09	58.12,29.94
path	55.62,32.75	55.97,36.63	55.71,40.53	57.32,42.00	59.26,41.50
path	57.59,43.98	55.27,48.14	50.81,48.20	48.51,43.33	47.83,39.78
path	46.87,34.69	45.55,32.24	45.61,27.19	46.52,23.35	48.07,21.59
path	49.70,21.37	49.54,18.59
Click ore as you follow the path around this area
|tip Track them on your minimap with "Find Minerals".
collect 110 Copper Ore##2770 |n
|tip Smelt the ore at a forge.
collect 110 Copper Bar##2840 |or
|tip Farm them with Mining or purchase them from the auction house.
|tip These totals are approximate.
|tip You may need more or less than the indicated amount.
'|complete skill("Jewelcrafting") >= 35 |or
step
label "Collect_Bronze_Bar_Total"
map Durotar
path follow smart; loop on; ants curved; dist 20
path	50.96,17.00	52.99,18.09	54.60,19.05	55.40,21.06	55.71,23.38
path	56.28,25.33	55.89,27.78	54.64,27.62	55.10,30.09	58.12,29.94
path	55.62,32.75	55.97,36.63	55.71,40.53	57.32,42.00	59.26,41.50
path	57.59,43.98	55.27,48.14	50.81,48.20	48.51,43.33	47.83,39.78
path	46.87,34.69	45.55,32.24	45.61,27.19	46.52,23.35	48.07,21.59
path	49.70,21.37	49.54,18.59
Click ore as you follow the path around this area
|tip Track them on your minimap with "Find Minerals".
collect 60 Copper Ore##2770 |or
|tip Save the ore for the next step.
collect 120 Bronze Bar##2841 |or
|tip Farm them with Mining or purchase them from the auction house. |notinsticky
|tip These totals are approximate. |notinsticky
|tip You may need more or less than the indicated amount. |notinsticky
'|complete skill("Jewelcrafting") >= 110 |or
step
map The Barrens
path follow smart; loop on; ants curved; dist 20
path	59.10,40.30	60.19,40.99	61.84,40.54	62.14,43.04	62.65,46.75
path	61.30,50.02	60.46,50.11	58.76,50.43	56.82,51.16	55.42,52.22
path	53.50,52.61	53.16,56.18	51.94,57.54	50.38,58.57	49.34,61.86
path	47.74,65.34	49.23,69.53	48.13,71.47	48.25,74.69	49.98,75.97
path	49.97,78.84	48.59,80.24	48.26,82.33	46.66,83.76	46.10,86.08
path	44.27,84.64	42.70,82.63	41.20,79.51	44.09,78.36	43.80,75.03
path	43.88,73.08	42.35,72.24	41.90,68.97	43.39,69.35	45.54,68.99
path	45.03,65.70	43.83,62.98	43.15,60.77	43.09,56.64	43.61,52.80
path	41.37,48.89	42.58,47.61	41.37,44.96	43.42,44.79	43.15,42.53
path	43.28,39.61	42.28,38.89	41.58,37.21	42.55,35.50	42.04,33.21
path	45.13,32.85	46.58,30.52	46.71,28.37	48.20,28.72	49.48,31.40
path	50.44,34.37	52.43,34.60	56.90,37.50	58.56,39.33
Click ore as you follow the path around this area
|tip Track them on your minimap with "Find Minerals".
|tip You will need level 65 Mining to collect these.
collect 60 Tin Ore##2771 |n
|tip Smelt the ore at a forge.
collect 120 Bronze Bar##2841 |or
|tip Farm them with Mining or purchase them from the auction house. |notinsticky
|tip These totals are approximate. |notinsticky
|tip You may need more or less than the indicated amount. |notinsticky
'|complete skill("Jewelcrafting") >= 110 |or
step
label "Collect_Mithril_Bar_Total"
map Badlands
path follow smart; loop on; ants curved; dist 20
path	26.84,74.76	25.28,78.53	19.71,81.32	14.75,83.82	12.50,85.54
path	7.98,80.56	6.30,74.40	8.68,67.97	17.19,68.54	15.13,72.43
path	17.19,77.39	21.25,75.06	25.11,72.08
Click ore as you follow the path around this area
|tip Track them on your minimap with "Find Minerals".
|tip You will need level 175 Mining to collect these.
collect 142 Mithril Ore##3858 |n
|tip Smelt the ore at a forge.
collect 142 Mithril Bar##3860 |or
|tip Create them with Mining or purchase them from the auction house. |notinsticky
|tip These totals are approximate. |notinsticky
|tip You may need more or less than the indicated amount. |notinsticky
'|complete skill("Jewelcrafting") >= 180 |or
step
label "Collect_Truesilver_Bar_Total"
map Badlands
path follow smart; loop on; ants curved; dist 20
path	26.84,74.76	25.28,78.53	19.71,81.32	14.75,83.82	12.50,85.54
path	7.98,80.56	6.30,74.40	8.68,67.97	17.19,68.54	15.13,72.43
path	17.19,77.39	21.25,75.06	25.11,72.08
Click ore as you follow the path around this area
|tip Track them on your minimap with "Find Minerals".
|tip You will need level 230 Mining to collect these.
collect Truesilver Ore##7911 |n
collect 28 Truesilver Bar##6037 |or
|tip Farm them with Mining or purchase them from the auction house. |notinsticky
|tip These totals are approximate. |notinsticky
|tip You may need more or less than the indicated amount. |notinsticky
'|complete skill("Jewelcrafting") >= 210 |or
step
label "Collect_Thorium_Bar_Total"
map Un'Goro Crater
path follow smart; loop on; ants curved; dist 20
path	66.46,78.95	64.56,79.71	61.79,84.21	59.34,84.18	57.63,86.04
path	54.50,86.69	51.13,86.82	48.27,87.30	45.98,86.58	42.89,85.00
path	40.79,83.52	37.91,83.14	36.77,80.17	33.58,79.05	30.40,79.61
path	28.89,76.98	28.97,71.52	26.00,67.67	25.93,63.53	24.59,58.51
path	23.95,53.04	24.40,48.21	23.89,44.76	24.71,41.12	26.26,36.59
path	26.62,31.21	28.29,29.47	29.59,25.66	29.89,20.92	33.32,20.67
path	36.29,20.47	38.67,16.00	41.73,15.77	43.32,14.12	46.94,13.03
path	49.79,13.83	52.84,12.88	56.31,14.04	59.61,16.58	62.25,16.02
path	64.19,19.90	65.99,21.01	68.51,20.26	71.19,20.89	71.21,23.75
path	71.75,28.19	74.76,32.46	75.06,37.15	76.32,43.15	76.67,48.32
path	77.05,53.09	76.56,57.02	75.35,61.97	74.66,68.05	72.92,70.46
path	71.39,73.80	71.00,79.21	68.32,79.90
Click ore as you follow the path around this area
|tip Track them on your minimap with "Find Minerals".
|tip You will need level 245 Mining to collect these.
collect 56 Thorium Ore##10620 |n
|tip Smelt the ore at a forge.
collect 56 Thorium Bar##12359 |or
|tip Create them with Mining or purchase them from the auction house. |notinsticky
|tip These totals are approximate. |notinsticky
|tip You may need more or less than the indicated amount. |notinsticky
'|complete skill("Jewelcrafting") >= 250 |or
step
label "Collect_Adamantite_Bar_Total"
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
collect 20 Adamantite Ore##23425 |n
|tip Smelt the ore at a forge.
collect 10 Adamantite Bar##23446 |or
|tip Farm them with Mining or purchase them from the auction house.
'|complete skill("Jewelcrafting") >= 350 |or
stickystart "Collect_Shadowgem_Total"
stickystart "Collect_Moss_Agate_Total"
stickystart "Collect_Aquamarine_Total"
stickystart "Collect_Heavy_Stone_Total"
stickystart "Collect_Solid_Stone_Total"
step
map Durotar
path follow smart; loop on; ants curved; dist 20
path	50.96,17.00	52.99,18.09	54.60,19.05	55.40,21.06	55.71,23.38
path	56.28,25.33	55.89,27.78	54.64,27.62	55.10,30.09	58.12,29.94
path	55.62,32.75	55.97,36.63	55.71,40.53	57.32,42.00	59.26,41.50
path	57.59,43.98	55.27,48.14	50.81,48.20	48.51,43.33	47.83,39.78
path	46.87,34.69	45.55,32.24	45.61,27.19	46.52,23.35	48.07,21.59
path	49.70,21.37	49.54,18.59
Click ore as you follow the path around this area
|tip Track them on your minimap with "Find Minerals".
collect Copper Ore##2770 |n
collect 15 Tigerseye##818 |or
|tip Farm them with Mining or purchase them from the auction house.
|tip They can be Prospected from Copper Ore with Jewelcrafting.
|tip These totals are approximate.
|tip You may need more or less than the indicated amount.
'|complete skill("Jewelcrafting") >= 50 |or
step
label "Collect_Shadowgem_Total"
map Durotar
path follow smart; loop on; ants curved; dist 20
path	50.96,17.00	52.99,18.09	54.60,19.05	55.40,21.06	55.71,23.38
path	56.28,25.33	55.89,27.78	54.64,27.62	55.10,30.09	58.12,29.94
path	55.62,32.75	55.97,36.63	55.71,40.53	57.32,42.00	59.26,41.50
path	57.59,43.98	55.27,48.14	50.81,48.20	48.51,43.33	47.83,39.78
path	46.87,34.69	45.55,32.24	45.61,27.19	46.52,23.35	48.07,21.59
path	49.70,21.37	49.54,18.59
Click ore as you follow the path around this area
|tip Track them on your minimap with "Find Minerals".
collect Copper Ore##2770 |n
collect 60 Shadowgem##1210 |or
|tip Farm them with Mining or purchase them from the auction house. |notinsticky
|tip They can be Prospected from Copper Ore and Tin Ore with Jewelcrafting.
|tip These totals are approximate. |notinsticky
|tip You may need more or less than the indicated amount. |notinsticky
'|complete skill("Jewelcrafting") >= 110 |or
step
label "Collect_Moss_Agate_Total"
map The Barrens
path follow smart; loop on; ants curved; dist 20
path	59.10,40.30	60.19,40.99	61.84,40.54	62.14,43.04	62.65,46.75
path	61.30,50.02	60.46,50.11	58.76,50.43	56.82,51.16	55.42,52.22
path	53.50,52.61	53.16,56.18	51.94,57.54	50.38,58.57	49.34,61.86
path	47.74,65.34	49.23,69.53	48.13,71.47	48.25,74.69	49.98,75.97
path	49.97,78.84	48.59,80.24	48.26,82.33	46.66,83.76	46.10,86.08
path	44.27,84.64	42.70,82.63	41.20,79.51	44.09,78.36	43.80,75.03
path	43.88,73.08	42.35,72.24	41.90,68.97	43.39,69.35	45.54,68.99
path	45.03,65.70	43.83,62.98	43.15,60.77	43.09,56.64	43.61,52.80
path	41.37,48.89	42.58,47.61	41.37,44.96	43.42,44.79	43.15,42.53
path	43.28,39.61	42.28,38.89	41.58,37.21	42.55,35.50	42.04,33.21
path	45.13,32.85	46.58,30.52	46.71,28.37	48.20,28.72	49.48,31.40
path	50.44,34.37	52.43,34.60	56.90,37.50	58.56,39.33
Click ore as you follow the path around this area
|tip Track them on your minimap with "Find Minerals".
|tip You will need level 65 Mining to collect these.
collect Tin Ore##2771 |n
collect 30 Moss Agate##1206 |or
|tip Farm them with Mining or purchase them from the auction house. |notinsticky
|tip They can be Prospected from Tin Ore with Jewelcrafting.
|tip These totals are approximate. |notinsticky
|tip You may need more or less than the indicated amount. |notinsticky
'|complete skill("Jewelcrafting") >= 150 |or
step
label "Collect_Aquamarine_Total"
map Badlands
path follow smart; loop on; ants curved; dist 20
path	26.84,74.76	25.28,78.53	19.71,81.32	14.75,83.82	12.50,85.54
path	7.98,80.56	6.30,74.40	8.68,67.97	17.19,68.54	15.13,72.43
path	17.19,77.39	21.25,75.06	25.11,72.08
Click ore as you follow the path around this area
|tip Track them on your minimap with "Find Minerals".
|tip You will need level 175 Mining to collect these.
collect Mithril Ore##3858 |n
collect 35 Aquamarine##7909 |or
|tip Farm them with Mining or purchase them from the auction house. |notinsticky
|tip They can be Prospected from Tin Ore, Iron Ore, and Mithril Ore with Jewelcrafting.
|tip These totals are approximate. |notinsticky
|tip You may need more or less than the indicated amount. |notinsticky
'|complete skill("Jewelcrafting") >= 225 |or
step
label "Collect_Heavy_Stone_Total"
map Arathi Highlands
path follow smart; loop on; ants curved; dist 20
path	78.66,36.13	77.36,41.29	75.00,44.93	72.65,48.07	70.58,55.05
path	69.99,58.40	72.92,59.03	72.28,63.63	72.78,66.86	71.75,66.15
path	69.15,72.54	67.17,70.90	63.52,73.55	59.48,74.71	59.32,70.74
path	56.16,71.89	50.82,78.41	47.96,82.44	42.53,80.75	43.02,77.16
path	40.39,71.86	37.95,67.63	38.52,68.50	33.94,66.02	34.59,61.64
path	33.70,56.77	33.45,53.94	33.65,50.19	35.00,47.28	32.96,46.68
path	31.68,45.41	32.34,42.64	31.42,41.24	25.23,43.10	20.94,39.12
path	20.02,35.80	19.12,33.36	22.43,31.28	23.48,24.90	26.93,20.65
path	28.65,14.18	28.96,16.96	31.62,18.63	30.96,20.36	33.19,21.23
path	36.35,24.61	39.97,25.62	40.21,28.79	43.97,30.51	45.70,33.02
path	48.08,33.60	49.78,36.76	52.14,36.11	52.75,31.99	54.80,33.13
path	58.19,32.50	58.02,34.22	59.94,35.97	62.25,32.06	64.69,35.58
path	64.49,26.56	66.77,27.64	70.39,27.07	70.47,30.74	72.89,30.09
path	76.73,29.48	76.70,33.68	79.56,35.45
Click ore as you follow the path around this area
|tip Track them on your minimap with "Find Minerals".
|tip You will need level 125 Mining to collect these.
collect 80 Heavy Stone##2838 |or
|tip Farm them with Mining or purchase them from the auction house.
|tip These totals are approximate. |notinsticky
|tip You may need more or less than the indicated amount. |notinsticky
'|complete skill("Jewelcrafting") >= 120 |or
step
label "Collect_Solid_Stone_Total"
map Badlands
path follow smart; loop on; ants curved; dist 20
path	26.84,74.76	25.28,78.53	19.71,81.32	14.75,83.82	12.50,85.54
path	7.98,80.56	6.30,74.40	8.68,67.97	17.19,68.54	15.13,72.43
path	17.19,77.39	21.25,75.06	25.11,72.08
Click ore as you follow the path around this area
|tip Track them on your minimap with "Find Minerals".
|tip You will need level 175 Mining to collect these.
collect 90 Solid Stone##7912 |or
|tip Farm them with Mining or purchase them from the auction house. |notinsticky
|tip These totals are approximate. |notinsticky
|tip You may need more or less than the indicated amount. |notinsticky
'|complete skill("Jewelcrafting") >= 185 |or
stickystart "Collect_Large_Opal_Total"
stickystart "Collect_Azerothian_Diamond_Total"
stickystart "Collect_Huge_Emerald_Total"
step
map Badlands
path follow smart; loop on; ants curved; dist 20
path	26.84,74.76	25.28,78.53	19.71,81.32	14.75,83.82	12.50,85.54
path	7.98,80.56	6.30,74.40	8.68,67.97	17.19,68.54	15.13,72.43
path	17.19,77.39	21.25,75.06	25.11,72.08
Click ore as you follow the path around this area
|tip Track them on your minimap with "Find Minerals".
|tip You will need level 175 Mining to collect these.
collect 10 Star Ruby##7910 |or
|tip Farm them with Mining or purchase them from the auction house.
|tip They can be Prospected from Iron Ore, Mithril Ore, and Thorium Ore with Jewelcrafting.
|tip These totals are approximate.
|tip You may need more or less than the indicated amount.
'|complete skill("Jewelcrafting") >= 260 |or
step
label "Collect_Large_Opal_Total"
map Badlands
path follow smart; loop on; ants curved; dist 20
path	26.84,74.76	25.28,78.53	19.71,81.32	14.75,83.82	12.50,85.54
path	7.98,80.56	6.30,74.40	8.68,67.97	17.19,68.54	15.13,72.43
path	17.19,77.39	21.25,75.06	25.11,72.08
Click ore as you follow the path around this area
|tip Track them on your minimap with "Find Minerals".
|tip You will need level 175 Mining to collect these.
collect 21 Large Opal##12799 |or
|tip Farm them with Mining or purchase them from the auction house. |notinsticky
|tip They can be Prospected from Mithril Ore, and Thorium Ore with Jewelcrafting.
|tip These totals are approximate. |notinsticky
|tip You may need more or less than the indicated amount. |notinsticky
'|complete skill("Jewelcrafting") >= 281 |or
step
label "Collect_Azerothian_Diamond_Total"
map Un'Goro Crater
path follow smart; loop on; ants curved; dist 20
path	66.46,78.95	64.56,79.71	61.79,84.21	59.34,84.18	57.63,86.04
path	54.50,86.69	51.13,86.82	48.27,87.30	45.98,86.58	42.89,85.00
path	40.79,83.52	37.91,83.14	36.77,80.17	33.58,79.05	30.40,79.61
path	28.89,76.98	28.97,71.52	26.00,67.67	25.93,63.53	24.59,58.51
path	23.95,53.04	24.40,48.21	23.89,44.76	24.71,41.12	26.26,36.59
path	26.62,31.21	28.29,29.47	29.59,25.66	29.89,20.92	33.32,20.67
path	36.29,20.47	38.67,16.00	41.73,15.77	43.32,14.12	46.94,13.03
path	49.79,13.83	52.84,12.88	56.31,14.04	59.61,16.58	62.25,16.02
path	64.19,19.90	65.99,21.01	68.51,20.26	71.19,20.89	71.21,23.75
path	71.75,28.19	74.76,32.46	75.06,37.15	76.32,43.15	76.67,48.32
path	77.05,53.09	76.56,57.02	75.35,61.97	74.66,68.05	72.92,70.46
path	71.39,73.80	71.00,79.21	68.32,79.90
Click ore as you follow the path around this area
|tip Track them on your minimap with "Find Minerals".
|tip You will need level 245 Mining to collect these.
collect Thorium Ore##10620 |n
collect 20 Azerothian Diamond##12800 |or
|tip Farm them with Mining or purchase them from the auction house. |notinsticky
|tip They can be Prospected from Mithril Ore, and Thorium Ore with Jewelcrafting.
|tip These totals are approximate. |notinsticky
|tip You may need more or less than the indicated amount. |notinsticky
'|complete skill("Jewelcrafting") >= 295 |or
step
label "Collect_Huge_Emerald_Total"
map Un'Goro Crater
path follow smart; loop on; ants curved; dist 20
path	66.46,78.95	64.56,79.71	61.79,84.21	59.34,84.18	57.63,86.04
path	54.50,86.69	51.13,86.82	48.27,87.30	45.98,86.58	42.89,85.00
path	40.79,83.52	37.91,83.14	36.77,80.17	33.58,79.05	30.40,79.61
path	28.89,76.98	28.97,71.52	26.00,67.67	25.93,63.53	24.59,58.51
path	23.95,53.04	24.40,48.21	23.89,44.76	24.71,41.12	26.26,36.59
path	26.62,31.21	28.29,29.47	29.59,25.66	29.89,20.92	33.32,20.67
path	36.29,20.47	38.67,16.00	41.73,15.77	43.32,14.12	46.94,13.03
path	49.79,13.83	52.84,12.88	56.31,14.04	59.61,16.58	62.25,16.02
path	64.19,19.90	65.99,21.01	68.51,20.26	71.19,20.89	71.21,23.75
path	71.75,28.19	74.76,32.46	75.06,37.15	76.32,43.15	76.67,48.32
path	77.05,53.09	76.56,57.02	75.35,61.97	74.66,68.05	72.92,70.46
path	71.39,73.80	71.00,79.21	68.32,79.90
Click ore as you follow the path around this area
|tip Track them on your minimap with "Find Minerals".
|tip You will need level 245 Mining to collect these.
collect Thorium Ore##10620 |n
collect 10 Huge Emerald##12364 |or
|tip Farm them with Mining or purchase them from the auction house. |notinsticky
|tip They can be Prospected from Mithril Ore, and Thorium Ore with Jewelcrafting.
|tip These totals are approximate. |notinsticky
|tip You may need more or less than the indicated amount. |notinsticky
'|complete skill("Jewelcrafting") >= 300 |or
stickystart "Collect_Flame_Spessarite_Total"
stickystart "Collect_Shadow_Draenite_Total"
stickystart "Collect_Primal_Earth_Total"
stickystart "Collect_Adamantite_Powder_Total"
stickystart "Collect_Mercurial_Stone_Total"
step
map Hellfire Peninsula/0
path	65.97,48.02	69.02,46.87	70.80,50.94	70.25,54.41	70.27,59.32
path	72.23,60.13	74.08,63.37	76.97,62.92	78.97,66.32	78.85,70.21
path	79.70,74.48	80.75,77.99	77.91,75.80	77.13,73.33	76.82,69.54
path	75.53,67.17	71.66,67.33	69.41,67.29	68.38,60.74	65.36,60.83
path	65.69,64.45	63.25,69.06	62.72,72.99	62.49,79.96	58.89,76.64
path	57.05,73.97	57.06,81.30	56.40,82.14	55.54,83.79	52.24,83.83
path	49.82,83.52	46.85,84.82	42.98,79.36	42.26,76.62	44.54,73.42
path	47.44,71.34	50.85,69.85	47.41,66.63	44.75,68.48	45.62,61.55
path	47.89,59.49	49.89,56.45	49.95,61.42	51.38,61.68	52.93,58.38
path	55.41,56.25	56.22,53.50	58.62,52.98	62.69,50.44
click Fel Iron Deposit##181555+
|tip They look like green mineral clusters around this path.
|tip Enter caves along the path.
|tip Make sure you enable "Find Minerals" in the tracking menu on the minimap.
collect Fel Iron Ore##23424 |n
collect 30 Golden Draenite##23112 |or
|tip Farm them with Mining or purchase them from the auction house.
|tip They can be Prospected from Thorium Ore, Fel Iron Ore, and Adamantite Ore with Jewelcrafting.
|tip You can cut any low level gem for points.
'|complete skill("Jewelcrafting") >= 320 |or
step
label "Collect_Flame_Spessarite_Total"
map Hellfire Peninsula/0
path	65.97,48.02	69.02,46.87	70.80,50.94	70.25,54.41	70.27,59.32
path	72.23,60.13	74.08,63.37	76.97,62.92	78.97,66.32	78.85,70.21
path	79.70,74.48	80.75,77.99	77.91,75.80	77.13,73.33	76.82,69.54
path	75.53,67.17	71.66,67.33	69.41,67.29	68.38,60.74	65.36,60.83
path	65.69,64.45	63.25,69.06	62.72,72.99	62.49,79.96	58.89,76.64
path	57.05,73.97	57.06,81.30	56.40,82.14	55.54,83.79	52.24,83.83
path	49.82,83.52	46.85,84.82	42.98,79.36	42.26,76.62	44.54,73.42
path	47.44,71.34	50.85,69.85	47.41,66.63	44.75,68.48	45.62,61.55
path	47.89,59.49	49.89,56.45	49.95,61.42	51.38,61.68	52.93,58.38
path	55.41,56.25	56.22,53.50	58.62,52.98	62.69,50.44
click Fel Iron Deposit##181555+
|tip They look like green mineral clusters around this path.
|tip Enter caves along the path.
|tip Make sure you enable "Find Minerals" in the tracking menu on the minimap.
collect Fel Iron Ore##23424 |n
collect 7 Flame Spessarite##21929 |or
|tip Farm them with Mining or purchase them from the auction house.
|tip They can be Prospected from Thorium Ore, Fel Iron Ore, and Adamantite Ore with Jewelcrafting.
|tip You can cut Flame Spessarite, Blood Garnet, Deep Peridot, and Azure Moonstone for points.
'|complete skill("Jewelcrafting") >= 325 |or
step
label "Collect_Shadow_Draenite_Total"
map Hellfire Peninsula/0
path	65.97,48.02	69.02,46.87	70.80,50.94	70.25,54.41	70.27,59.32
path	72.23,60.13	74.08,63.37	76.97,62.92	78.97,66.32	78.85,70.21
path	79.70,74.48	80.75,77.99	77.91,75.80	77.13,73.33	76.82,69.54
path	75.53,67.17	71.66,67.33	69.41,67.29	68.38,60.74	65.36,60.83
path	65.69,64.45	63.25,69.06	62.72,72.99	62.49,79.96	58.89,76.64
path	57.05,73.97	57.06,81.30	56.40,82.14	55.54,83.79	52.24,83.83
path	49.82,83.52	46.85,84.82	42.98,79.36	42.26,76.62	44.54,73.42
path	47.44,71.34	50.85,69.85	47.41,66.63	44.75,68.48	45.62,61.55
path	47.89,59.49	49.89,56.45	49.95,61.42	51.38,61.68	52.93,58.38
path	55.41,56.25	56.22,53.50	58.62,52.98	62.69,50.44
click Fel Iron Deposit##181555+
|tip They look like green mineral clusters around this path.
|tip Enter caves along the path.
|tip Make sure you enable "Find Minerals" in the tracking menu on the minimap.
collect Fel Iron Ore##23424 |n
collect 7 Shadow Draenite##23107 |or
|tip Farm them with Mining or purchase them from the auction house.
|tip They can be Prospected from Thorium Ore, Fel Iron Ore, and Adamantite Ore with Jewelcrafting.
|tip You can cut Flame Spessarite, Shadow Draenite, and Golden Draenite for points.
'|complete skill("Jewelcrafting") >= 340 |or
step
label "Collect_Primal_Earth_Total"
map Nagrand/0
path follow smart; loop off; ants curved; dist 30
path	46.19,77.20	41.98,78.72	40.31,82.83	32.13,80.25	29.34,79.24
path	28.40,73.85	28.94,66.76	28.17,63.58
kill Shattered Rumbler##17157+
|tip Follow the path, killing any that you see.
collect Mote of Earth##22573 |n
|tip Combine 10 Motes of Earth into 1 Primal Earth.
collect 10 Primal Earth##22452 |or
|tip Farm them with Mining or purchase them from the auction house.
'|goto Nagrand/0 28.17,63.58 < 30 |c |noway
'|complete skill("Jewelcrafting") >= 335 |or
step
map Nagrand/0
path follow smart; loop off; ants curved; dist 30
path	28.17,63.58	28.94,66.76	28.40,73.85	29.34,79.24	32.13,80.25
path	40.31,82.83	41.98,78.72	46.19,77.20
kill Shattered Rumbler##17157+
|tip Follow the path, killing any that you see.
collect Mote of Earth##22573 |n
|tip Combine 10 Motes of Earth into 1 Primal Earth.
collect 10 Primal Earth##22452 |or
|tip Farm them with Mining or purchase them from the auction house.
'|goto Nagrand/0 46.19,77.20 < 30 |c |noway "Collect_Primal_Earth_Total"
'|complete skill("Jewelcrafting") >= 335 |or
step
label "Collect_Adamantite_Powder_Total"
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
collect 40 Adamantite Powder##24243 |or
|tip Farm them with Mining or purchase them from the auction house.
|tip They can also be Prospected from Adamantite Ore with Jewelcrafting.
'|complete skill("Jewelcrafting") >= 335 |or
step
label "Collect_Mercurial_Stone_Total"
collect Mercurial Stone##31080 |or
|tip These are created by Alchemists and required to be present in your inventory to transmute Mercurial Adamantite. |notinsticky
|tip Crafting one requires 1 Primal Earth, 1 Primal Life, and 1 Primal Water.
|tip Have an Alchemist craft one for you or purchase one from the auction house.
'|complete skill("Jewelcrafting") >= 335 |or
step
label "Begin_Profession_Leveling"
talk Gelanthis##16624
|tip Inside the building.
buy 1 Jeweler's Kit##20815 |goto Silvermoon City/0 90.91,73.35 |or 2
buy 1 Simple Grinder##20824 |goto 90.91,73.35 |or 2
|tip Save these, you will need them for future steps.
'|complete skill("Jewelcrafting") >= 375 |or
step
talk Kalinda##19775
|tip Inside the building.
Train Apprentice Jewelcrafting |skillmax Jewelcrafting,75 |goto 90.33,73.83
step
map Durotar
path follow smart; loop on; ants curved; dist 20
path	50.96,17.00	52.99,18.09	54.60,19.05	55.40,21.06	55.71,23.38
path	56.28,25.33	55.89,27.78	54.64,27.62	55.10,30.09	58.12,29.94
path	55.62,32.75	55.97,36.63	55.71,40.53	57.32,42.00	59.26,41.50
path	57.59,43.98	55.27,48.14	50.81,48.20	48.51,43.33	47.83,39.78
path	46.87,34.69	45.55,32.24	45.61,27.19	46.52,23.35	48.07,21.59
path	49.70,21.37	49.54,18.59
Click ore as you follow the path around this area
|tip Track them on your minimap with "Find Minerals".
collect 110 Copper Ore##2770 |n
|tip Smelt the ore at a forge.
collect 110 Copper Bar##2840 |or
|tip Farm them with Mining or purchase them from the auction house.
'|complete skill("Jewelcrafting") >= 35 |or
step
create 55 Delicate Copper Wire##25255,Jewelcrafting,55 total |or
|tip Save these, you will need them for future steps.
'|complete skill("Jewelcrafting") >= 51 |or
step
create 1 Delicate Copper Wire##25255,Jewelcrafting,Jewelcrafting,35
|tip Save these, you will need them for future steps.
|tip You may need to make a few more of these.
|tip Each additional Delicate Copper Wire requires 2 Copper Bars.
step
talk Kalinda##19775
|tip Inside the building.
Train Tigerseye Band |learn Tigerseye Band##32179 |goto Silvermoon City/0 90.33,73.83
stickystart "Collect_Delicate_Copper_Wire_50"
step
map Durotar
path follow smart; loop on; ants curved; dist 20
path	50.96,17.00	52.99,18.09	54.60,19.05	55.40,21.06	55.71,23.38
path	56.28,25.33	55.89,27.78	54.64,27.62	55.10,30.09	58.12,29.94
path	55.62,32.75	55.97,36.63	55.71,40.53	57.32,42.00	59.26,41.50
path	57.59,43.98	55.27,48.14	50.81,48.20	48.51,43.33	47.83,39.78
path	46.87,34.69	45.55,32.24	45.61,27.19	46.52,23.35	48.07,21.59
path	49.70,21.37	49.54,18.59
Click ore as you follow the path around this area
|tip Track them on your minimap with "Find Minerals".
collect Copper Ore##2770 |n
collect 15 Tigerseye##818 |or
|tip Farm them with Mining or purchase them from the auction house.
|tip They can be Prospected from Copper Ore with Jewelcrafting.
'|complete skill("Jewelcrafting") >= 50 |or
step
label "Collect_Delicate_Copper_Wire_50"
collect 15 Delicate Copper Wire##20816 |or
|tip You created these in a previous step.
'|complete skill("Jewelcrafting") >= 50 |or
step
create 15 Tigerseye Band##32179,Jewelcrafting,50
step
Reach Level 10 |ding 10
|tip You must be at least level 10 to train Journeyman professions.
|tip Use the leveling guides to accomplish this.
step
talk Kalinda##19775
|tip Inside the building.
Train Journeyman Jewelcrafting |skillmax Jewelcrafting,150 |goto Silvermoon City/0 90.33,73.83
step
talk Kalinda##19775
|tip Inside the building.
Train Bronze Setting |learn Bronze Setting##25278 |goto 90.33,73.83
step
map Durotar
path follow smart; loop on; ants curved; dist 20
path	50.96,17.00	52.99,18.09	54.60,19.05	55.40,21.06	55.71,23.38
path	56.28,25.33	55.89,27.78	54.64,27.62	55.10,30.09	58.12,29.94
path	55.62,32.75	55.97,36.63	55.71,40.53	57.32,42.00	59.26,41.50
path	57.59,43.98	55.27,48.14	50.81,48.20	48.51,43.33	47.83,39.78
path	46.87,34.69	45.55,32.24	45.61,27.19	46.52,23.35	48.07,21.59
path	49.70,21.37	49.54,18.59
Click ore as you follow the path around this area
|tip Track them on your minimap with "Find Minerals".
collect 50 Copper Ore##2770 |or
|tip Save the ore if you're farming.
collect 100 Bronze Bar##2841 |or
|tip Farm them with Mining or purchase them from the auction house.
'|complete skill("Jewelcrafting") >= 80
step
map The Barrens
path follow smart; loop on; ants curved; dist 20
path	59.10,40.30	60.19,40.99	61.84,40.54	62.14,43.04	62.65,46.75
path	61.30,50.02	60.46,50.11	58.76,50.43	56.82,51.16	55.42,52.22
path	53.50,52.61	53.16,56.18	51.94,57.54	50.38,58.57	49.34,61.86
path	47.74,65.34	49.23,69.53	48.13,71.47	48.25,74.69	49.98,75.97
path	49.97,78.84	48.59,80.24	48.26,82.33	46.66,83.76	46.10,86.08
path	44.27,84.64	42.70,82.63	41.20,79.51	44.09,78.36	43.80,75.03
path	43.88,73.08	42.35,72.24	41.90,68.97	43.39,69.35	45.54,68.99
path	45.03,65.70	43.83,62.98	43.15,60.77	43.09,56.64	43.61,52.80
path	41.37,48.89	42.58,47.61	41.37,44.96	43.42,44.79	43.15,42.53
path	43.28,39.61	42.28,38.89	41.58,37.21	42.55,35.50	42.04,33.21
path	45.13,32.85	46.58,30.52	46.71,28.37	48.20,28.72	49.48,31.40
path	50.44,34.37	52.43,34.60	56.90,37.50	58.56,39.33
Click ore as you follow the path around this area
|tip Track them on your minimap with "Find Minerals".
|tip You will need level 65 Mining to collect these.
collect 50 Tin Ore##2771 |n
|tip Smelt the ore at a forge.
collect 100 Bronze Bar##2841 |or
|tip Farm them with Mining or purchase them from the auction house.
'|complete skill("Jewelcrafting") >= 80 |or
step
create 50 Bronze Setting##25278,Jewelcrafting,50 total |or
|tip Save these, you will need them for future steps.
'|complete skill("Jewelcrafting") >= 150 |or
step
create 1 Bronze Setting##25278,Jewelcrafting,80
|tip Save these, you will need them for future steps.
step
talk Kalinda##19775
|tip Inside the building.
Train Gloom Band |learn Gloom Band##25287 |goto Silvermoon City/0 90.33,73.83
stickystart "Collect_Bronze_Setting_100"
stickystart "Collect_Delicate_Copper_Wire_100"
step
map The Barrens
path follow smart; loop on; ants curved; dist 20
path	59.10,40.30	60.19,40.99	61.84,40.54	62.14,43.04	62.65,46.75
path	61.30,50.02	60.46,50.11	58.76,50.43	56.82,51.16	55.42,52.22
path	53.50,52.61	53.16,56.18	51.94,57.54	50.38,58.57	49.34,61.86
path	47.74,65.34	49.23,69.53	48.13,71.47	48.25,74.69	49.98,75.97
path	49.97,78.84	48.59,80.24	48.26,82.33	46.66,83.76	46.10,86.08
path	44.27,84.64	42.70,82.63	41.20,79.51	44.09,78.36	43.80,75.03
path	43.88,73.08	42.35,72.24	41.90,68.97	43.39,69.35	45.54,68.99
path	45.03,65.70	43.83,62.98	43.15,60.77	43.09,56.64	43.61,52.80
path	41.37,48.89	42.58,47.61	41.37,44.96	43.42,44.79	43.15,42.53
path	43.28,39.61	42.28,38.89	41.58,37.21	42.55,35.50	42.04,33.21
path	45.13,32.85	46.58,30.52	46.71,28.37	48.20,28.72	49.48,31.40
path	50.44,34.37	52.43,34.60	56.90,37.50	58.56,39.33
Click ore as you follow the path around this area
|tip Track them on your minimap with "Find Minerals".
|tip You will need level 65 Mining to collect these.
collect 40 Shadowgem##1210 |or
|tip Farm them with Mining or purchase them from the auction house.
|tip They can be Prospected from Copper Ore and Tin Ore with Jewelcrafting.
'|complete skill("Jewelcrafting") >= 100 |or
step
label "Collect_Bronze_Setting_100"
collect 20 Bronze Setting##20817 |or
|tip You created these in a previous step.
'|complete skill("Jewelcrafting") >= 100 |or
step
label "Collect_Delicate_Copper_Wire_100"
collect 40 Delicate Copper Wire##20816 |or
|tip You created these in a previous step.
'|complete skill("Jewelcrafting") >= 100 |or
step
create 20 Gloom Band##25287,Jewelcrafting,100
|tip You may need to create more or less of these.
|tip Each additional Gloom Band requires 2 Shadowgems and 1 Delicate Copper Wire.
step
talk Kalinda##19775
|tip Inside the building.
Train Ring of Twilight Shadows |learn Ring of Twilight Shadows##25318 |goto Silvermoon City/0 90.33,73.83
stickystart "Collect_Shadowgem_110"
step
map Durotar
path follow smart; loop on; ants curved; dist 20
path	50.96,17.00	52.99,18.09	54.60,19.05	55.40,21.06	55.71,23.38
path	56.28,25.33	55.89,27.78	54.64,27.62	55.10,30.09	58.12,29.94
path	55.62,32.75	55.97,36.63	55.71,40.53	57.32,42.00	59.26,41.50
path	57.59,43.98	55.27,48.14	50.81,48.20	48.51,43.33	47.83,39.78
path	46.87,34.69	45.55,32.24	45.61,27.19	46.52,23.35	48.07,21.59
path	49.70,21.37	49.54,18.59
Click ore as you follow the path around this area
|tip Track them on your minimap with "Find Minerals".
collect 10 Copper Ore##2770 |n
|tip Save the ore if you're gathering.
collect 20 Bronze Bar##2841 |or
|tip Create them with Mining or purchase them from the auction house.
'|complete skill("Jewelcrafting") >= 110 |or
step
map The Barrens
path follow smart; loop on; ants curved; dist 20
path	59.10,40.30	60.19,40.99	61.84,40.54	62.14,43.04	62.65,46.75
path	61.30,50.02	60.46,50.11	58.76,50.43	56.82,51.16	55.42,52.22
path	53.50,52.61	53.16,56.18	51.94,57.54	50.38,58.57	49.34,61.86
path	47.74,65.34	49.23,69.53	48.13,71.47	48.25,74.69	49.98,75.97
path	49.97,78.84	48.59,80.24	48.26,82.33	46.66,83.76	46.10,86.08
path	44.27,84.64	42.70,82.63	41.20,79.51	44.09,78.36	43.80,75.03
path	43.88,73.08	42.35,72.24	41.90,68.97	43.39,69.35	45.54,68.99
path	45.03,65.70	43.83,62.98	43.15,60.77	43.09,56.64	43.61,52.80
path	41.37,48.89	42.58,47.61	41.37,44.96	43.42,44.79	43.15,42.53
path	43.28,39.61	42.28,38.89	41.58,37.21	42.55,35.50	42.04,33.21
path	45.13,32.85	46.58,30.52	46.71,28.37	48.20,28.72	49.48,31.40
path	50.44,34.37	52.43,34.60	56.90,37.50	58.56,39.33
Click ore as you follow the path around this area
|tip Track them on your minimap with "Find Minerals".
|tip You will need level 65 Mining to collect these.
collect 10 Tin Ore##2771 |n
|tip Smelt the ore at a forge.
collect 20 Bronze Bar##2841 |or
|tip Create them with Mining or purchase them from the auction house.
'|complete skill("Jewelcrafting") >= 110 |or
step
label "Collect_Shadowgem_110"
map The Barrens
path follow smart; loop on; ants curved; dist 20
path	59.10,40.30	60.19,40.99	61.84,40.54	62.14,43.04	62.65,46.75
path	61.30,50.02	60.46,50.11	58.76,50.43	56.82,51.16	55.42,52.22
path	53.50,52.61	53.16,56.18	51.94,57.54	50.38,58.57	49.34,61.86
path	47.74,65.34	49.23,69.53	48.13,71.47	48.25,74.69	49.98,75.97
path	49.97,78.84	48.59,80.24	48.26,82.33	46.66,83.76	46.10,86.08
path	44.27,84.64	42.70,82.63	41.20,79.51	44.09,78.36	43.80,75.03
path	43.88,73.08	42.35,72.24	41.90,68.97	43.39,69.35	45.54,68.99
path	45.03,65.70	43.83,62.98	43.15,60.77	43.09,56.64	43.61,52.80
path	41.37,48.89	42.58,47.61	41.37,44.96	43.42,44.79	43.15,42.53
path	43.28,39.61	42.28,38.89	41.58,37.21	42.55,35.50	42.04,33.21
path	45.13,32.85	46.58,30.52	46.71,28.37	48.20,28.72	49.48,31.40
path	50.44,34.37	52.43,34.60	56.90,37.50	58.56,39.33
Click ore as you follow the path around this area
|tip Track them on your minimap with "Find Minerals".
|tip You will need level 65 Mining to collect these.
collect 20 Shadowgem##1210 |or
|tip Farm them with Mining or purchase them from the auction house.
|tip They can be Prospected from Copper Ore and Tin Ore with Jewelcrafting.
'|complete skill("Jewelcrafting") >= 110 |or
step
create 10 Ring of Twilight Shadows##25318,Jewelcrafting,110
step
talk Kalinda##19775
|tip Inside the building.
Train Heavy Stone Statue |learn Heavy Stone Statue##32807 |goto Silvermoon City/0 90.33,73.83
step
map Arathi Highlands
path follow smart; loop on; ants curved; dist 20
path	78.66,36.13	77.36,41.29	75.00,44.93	72.65,48.07	70.58,55.05
path	69.99,58.40	72.92,59.03	72.28,63.63	72.78,66.86	71.75,66.15
path	69.15,72.54	67.17,70.90	63.52,73.55	59.48,74.71	59.32,70.74
path	56.16,71.89	50.82,78.41	47.96,82.44	42.53,80.75	43.02,77.16
path	40.39,71.86	37.95,67.63	38.52,68.50	33.94,66.02	34.59,61.64
path	33.70,56.77	33.45,53.94	33.65,50.19	35.00,47.28	32.96,46.68
path	31.68,45.41	32.34,42.64	31.42,41.24	25.23,43.10	20.94,39.12
path	20.02,35.80	19.12,33.36	22.43,31.28	23.48,24.90	26.93,20.65
path	28.65,14.18	28.96,16.96	31.62,18.63	30.96,20.36	33.19,21.23
path	36.35,24.61	39.97,25.62	40.21,28.79	43.97,30.51	45.70,33.02
path	48.08,33.60	49.78,36.76	52.14,36.11	52.75,31.99	54.80,33.13
path	58.19,32.50	58.02,34.22	59.94,35.97	62.25,32.06	64.69,35.58
path	64.49,26.56	66.77,27.64	70.39,27.07	70.47,30.74	72.89,30.09
path	76.73,29.48	76.70,33.68	79.56,35.45
Click ore as you follow the path around this area
|tip Track them on your minimap with "Find Minerals".
|tip You will need level 125 Mining to collect these.
collect 80 Heavy Stone##2838 |or
|tip Farm them with Mining or purchase them from the auction house.
'|complete skill("Jewelcrafting") >= 120 |or
step
create 10 Heavy Stone Statue##32807,Jewelcrafting,120
step
talk Jandia##4877
|tip Inside the building.
buy 1 Design: Pendant of the Agate Shield##20970 |goto Thousand Needles/0 46.0,51.6 |or
'|complete skill("Jewelcrafting") >= 150 |or
step
use the Design: Pendant of the Agate Shield##20970
Train Pendant of the Agate Shield |learn Pendant of the Agate Shield##25610
stickystart "Collect_Bronze_Setting_150"
step
map The Barrens
path follow smart; loop on; ants curved; dist 20
path	59.10,40.30	60.19,40.99	61.84,40.54	62.14,43.04	62.65,46.75
path	61.30,50.02	60.46,50.11	58.76,50.43	56.82,51.16	55.42,52.22
path	53.50,52.61	53.16,56.18	51.94,57.54	50.38,58.57	49.34,61.86
path	47.74,65.34	49.23,69.53	48.13,71.47	48.25,74.69	49.98,75.97
path	49.97,78.84	48.59,80.24	48.26,82.33	46.66,83.76	46.10,86.08
path	44.27,84.64	42.70,82.63	41.20,79.51	44.09,78.36	43.80,75.03
path	43.88,73.08	42.35,72.24	41.90,68.97	43.39,69.35	45.54,68.99
path	45.03,65.70	43.83,62.98	43.15,60.77	43.09,56.64	43.61,52.80
path	41.37,48.89	42.58,47.61	41.37,44.96	43.42,44.79	43.15,42.53
path	43.28,39.61	42.28,38.89	41.58,37.21	42.55,35.50	42.04,33.21
path	45.13,32.85	46.58,30.52	46.71,28.37	48.20,28.72	49.48,31.40
path	50.44,34.37	52.43,34.60	56.90,37.50	58.56,39.33
Click ore as you follow the path around this area
|tip Track them on your minimap with "Find Minerals".
|tip You will need level 65 Mining to collect these.
collect 30 Moss Agate##1206 |or
|tip Farm them with Mining or purchase them from the auction house.
|tip They can be Prospected from Tin Ore with Jewelcrafting.
'|complete skill("Jewelcrafting") >= 150 |or
step
label "Collect_Bronze_Setting_150"
collect 30 Bronze Setting##20817 |or
|tip You created these in a previous step.
'|complete skill("Jewelcrafting") >= 150 |or
step
create 30 Pendant of the Agate Shield##25610,Jewelcrafting,150
step
Reach Level 20 |ding 20
|tip You must be at least level 20 to train Expert professions.
|tip Use the leveling guides to accomplish this.
step
talk Kalinda##19775
|tip Inside the building.
Train Expert Jewelcrafting |skillmax Jewelcrafting,225 |goto Silvermoon City/0 90.33,73.83
step
talk Kalinda##19775
|tip Inside the building.
Train Mithril Filigree |learn Mithril Filigree##25615 |goto 90.33,73.83
step
map Badlands
path follow smart; loop on; ants curved; dist 20
path	26.84,74.76	25.28,78.53	19.71,81.32	14.75,83.82	12.50,85.54
path	7.98,80.56	6.30,74.40	8.68,67.97	17.19,68.54	15.13,72.43
path	17.19,77.39	21.25,75.06	25.11,72.08
Click ore as you follow the path around this area
|tip Track them on your minimap with "Find Minerals".
|tip You will need level 175 Mining to collect these.
collect 142 Mithril Ore##3858 |n
|tip Smelt the ore at a forge.
collect 142 Mithril Bar##3860 |or
|tip Create them with Mining or purchase them from the auction house.
'|complete skill("Jewelcrafting") >= 180 |or
step
create 71 Mithril Filigree##25615,Jewelcrafting,71 total |or
|tip Save these, you will need them for future steps.
'|complete skill("Jewelcrafting") >= 180 |or
step
create 1 Mithril Filigree##25615,Jewelcrafting,180
|tip Save at least 71 of these; you will need them for future steps.
|tip You may need to create more of these.
|tip Each additional Mithril Filigree requires 2 Mithril Bars.
step
talk Kalinda##19775
|tip Inside the building.
Train Solid Stone Statue |learn Solid Stone Statue##32808 |goto Silvermoon City/0 90.33,73.83
step
map Badlands
path follow smart; loop on; ants curved; dist 20
path	26.84,74.76	25.28,78.53	19.71,81.32	14.75,83.82	12.50,85.54
path	7.98,80.56	6.30,74.40	8.68,67.97	17.19,68.54	15.13,72.43
path	17.19,77.39	21.25,75.06	25.11,72.08
Click ore as you follow the path around this area
|tip Track them on your minimap with "Find Minerals".
|tip You will need level 175 Mining to collect these.
collect 90 Solid Stone##7912 |or
|tip Farm them with Mining or purchase them from the auction house.
'|complete skill("Jewelcrafting") >= 185 |or
step
create 9 Solid Stone Statue##32808,Jewelcrafting,185
|tip You may need to create more or less of these.
|tip Each additional Solid Stone Statue requires 10 Solid Stone.
step
talk Kalinda##19775
|tip Inside the building.
Train Engraved Truesilver Ring |learn Engraved Truesilver Ring##25620 |goto Silvermoon City/0 90.33,73.83
stickystart "Collect_Mithril_Filigree_210"
step
map Badlands
path follow smart; loop on; ants curved; dist 20
path	26.84,74.76	25.28,78.53	19.71,81.32	14.75,83.82	12.50,85.54
path	7.98,80.56	6.30,74.40	8.68,67.97	17.19,68.54	15.13,72.43
path	17.19,77.39	21.25,75.06	25.11,72.08
Click ore as you follow the path around this area
|tip Track them on your minimap with "Find Minerals".
|tip You will need level 230 Mining to collect these.
collect 28 Truesilver Ore##7911 |n
|tip Smelt the ore at a forge.
collect 28 Truesilver Bar##6037 |or
|tip Farm them with Mining or purchase them from the auction house.
'|complete skill("Jewelcrafting") >= 210 |or
step
label "Collect_Mithril_Filigree_210"
collect 56 Mithril Filigree##20963 |or
|tip You created these in a previous step.
'|complete skill("Jewelcrafting") >= 210 |or
step
create 28 Engraved Truesilver Ring##25620,Jewelcrafting,210
|tip You may need to create more or less of these.
|tip Each additional Engraved Truesilver Ring requires 1 Truesilver Bars and 2 Mithril Filigrees.
step
talk Kalinda##19775
|tip Inside the building.
Train Aquamarine Signet |learn Aquamarine Signet##26874 |goto Silvermoon City/0 90.33,73.83
stickystart "Collect_Flask_of_Mojo_220"
step
map Arathi Highlands
path follow smart; loop on; ants curved; dist 20
path	78.66,36.13	77.36,41.29	75.00,44.93	72.65,48.07	70.58,55.05
path	69.99,58.40	72.92,59.03	72.28,63.63	72.78,66.86	71.75,66.15
path	69.15,72.54	67.17,70.90	63.52,73.55	59.48,74.71	59.32,70.74
path	56.16,71.89	50.82,78.41	47.96,82.44	42.53,80.75	43.02,77.16
path	40.39,71.86	37.95,67.63	38.52,68.50	33.94,66.02	34.59,61.64
path	33.70,56.77	33.45,53.94	33.65,50.19	35.00,47.28	32.96,46.68
path	31.68,45.41	32.34,42.64	31.42,41.24	25.23,43.10	20.94,39.12
path	20.02,35.80	19.12,33.36	22.43,31.28	23.48,24.90	26.93,20.65
path	28.65,14.18	28.96,16.96	31.62,18.63	30.96,20.36	33.19,21.23
path	36.35,24.61	39.97,25.62	40.21,28.79	43.97,30.51	45.70,33.02
path	48.08,33.60	49.78,36.76	52.14,36.11	52.75,31.99	54.80,33.13
path	58.19,32.50	58.02,34.22	59.94,35.97	62.25,32.06	64.69,35.58
path	64.49,26.56	66.77,27.64	70.39,27.07	70.47,30.74	72.89,30.09
path	76.73,29.48	76.70,33.68	79.56,35.45
Click ore as you follow the path around this area
|tip Track them on your minimap with "Find Minerals".
|tip You will need level 125 Mining to collect these.
collect Iron Ore##2772 |n
collect 30 Aquamarine##7909 |or
|tip Farm them with Mining or purchase them from the auction house.
|tip They can be Prospected from Tin Ore, Iron Ore, and Mithril Ore with Jewelcrafting.
'|complete skill("Jewelcrafting") >= 220 |or
step
label "Collect_Flask_of_Mojo_220"
Kill Skullsplitter enemies around this area
collect 40 Flask of Mojo##8151 |or |goto Stranglethorn Vale/0 46.6,44.6
|tip Farm them with Mining or purchase them from the auction house.
'|complete skill("Jewelcrafting") >= 220 |or
step
create 10 Aquamarine Signet##26874,Jewelcrafting,220
step
talk Kalinda##19775
|tip Inside the building.
Train Aquamarine Pendant of the Warrior |learn Aquamarine Pendant of the Warrior##26876 |goto Silvermoon City/0 90.33,73.83
stickystart "Collect_Mithril_Filigree_225"
step
map Arathi Highlands
path follow smart; loop on; ants curved; dist 20
path	78.66,36.13	77.36,41.29	75.00,44.93	72.65,48.07	70.58,55.05
path	69.99,58.40	72.92,59.03	72.28,63.63	72.78,66.86	71.75,66.15
path	69.15,72.54	67.17,70.90	63.52,73.55	59.48,74.71	59.32,70.74
path	56.16,71.89	50.82,78.41	47.96,82.44	42.53,80.75	43.02,77.16
path	40.39,71.86	37.95,67.63	38.52,68.50	33.94,66.02	34.59,61.64
path	33.70,56.77	33.45,53.94	33.65,50.19	35.00,47.28	32.96,46.68
path	31.68,45.41	32.34,42.64	31.42,41.24	25.23,43.10	20.94,39.12
path	20.02,35.80	19.12,33.36	22.43,31.28	23.48,24.90	26.93,20.65
path	28.65,14.18	28.96,16.96	31.62,18.63	30.96,20.36	33.19,21.23
path	36.35,24.61	39.97,25.62	40.21,28.79	43.97,30.51	45.70,33.02
path	48.08,33.60	49.78,36.76	52.14,36.11	52.75,31.99	54.80,33.13
path	58.19,32.50	58.02,34.22	59.94,35.97	62.25,32.06	64.69,35.58
path	64.49,26.56	66.77,27.64	70.39,27.07	70.47,30.74	72.89,30.09
path	76.73,29.48	76.70,33.68	79.56,35.45
Click ore as you follow the path around this area
|tip Track them on your minimap with "Find Minerals".
|tip You will need level 125 Mining to collect these.
collect Iron Ore##2772 |n
collect 5 Aquamarine##7909 |or
|tip Farm them with Mining or purchase them from the auction house.
|tip They can be Prospected from Tin Ore, Iron Ore, and Mithril Ore with Jewelcrafting.
'|complete skill("Jewelcrafting") >= 225 |or
step
label "Collect_Mithril_Filigree_225"
collect 15 Mithril Filigree##20963 |or
|tip You created these in a previous step.
'|complete skill("Jewelcrafting") >= 225 |or
step
create 5 Aquamarine Pendant of the Warrior##26876,Jewelcrafting,225
step
Reach Level 35 |ding 35
|tip You must be at least level 35 to train Artisan professions.
|tip Use the leveling guides to accomplish this.
step
talk Kalinda##19775
|tip Inside the building.
Train Artisan Jewelcrafting |skillmax Jewelcrafting,300 |goto Silvermoon City/0 90.33,73.83
step
talk Kalinda##19775
|tip Inside the building.
Train Thorium Setting |learn Thorium Setting##26880 |goto 90.33,73.83
step
map Un'Goro Crater
path follow smart; loop on; ants curved; dist 20
path	66.46,78.95	64.56,79.71	61.79,84.21	59.34,84.18	57.63,86.04
path	54.50,86.69	51.13,86.82	48.27,87.30	45.98,86.58	42.89,85.00
path	40.79,83.52	37.91,83.14	36.77,80.17	33.58,79.05	30.40,79.61
path	28.89,76.98	28.97,71.52	26.00,67.67	25.93,63.53	24.59,58.51
path	23.95,53.04	24.40,48.21	23.89,44.76	24.71,41.12	26.26,36.59
path	26.62,31.21	28.29,29.47	29.59,25.66	29.89,20.92	33.32,20.67
path	36.29,20.47	38.67,16.00	41.73,15.77	43.32,14.12	46.94,13.03
path	49.79,13.83	52.84,12.88	56.31,14.04	59.61,16.58	62.25,16.02
path	64.19,19.90	65.99,21.01	68.51,20.26	71.19,20.89	71.21,23.75
path	71.75,28.19	74.76,32.46	75.06,37.15	76.32,43.15	76.67,48.32
path	77.05,53.09	76.56,57.02	75.35,61.97	74.66,68.05	72.92,70.46
path	71.39,73.80	71.00,79.21	68.32,79.90
Click ore as you follow the path around this area
|tip Track them on your minimap with "Find Minerals".
|tip You will need level 245 Mining to collect these.
collect 56 Thorium Ore##10620 |n
|tip Smelt the ore at a forge.
collect 56 Thorium Bar##12359 |or
|tip Create them with Mining or purchase them from the auction house.
'|complete skill("Jewelcrafting") >= 250 |or
step
create 56 Thorium Setting##26880,Jewelcrafting,56 total |or
|tip Save these, you will need them for future steps.
'|complete skill("Jewelcrafting") >= 250 |or
step
create 1 Thorium Setting##26880,Jewelcrafting,250
|tip Save these, you will need them for future steps.
|tip You may need to create more of these.
|tip Each additional Thorium Setting requires 1 Thorium Bar.
step
talk Kalinda##19775
|tip Inside the building.
Train Ruby Pendant of Fire |learn Ruby Pendant of Fire##26883 |goto Silvermoon City/0 90.33,73.83
stickystart "Collect_Thorium_Setting_260"
step
map Badlands
path follow smart; loop on; ants curved; dist 20
path	26.84,74.76	25.28,78.53	19.71,81.32	14.75,83.82	12.50,85.54
path	7.98,80.56	6.30,74.40	8.68,67.97	17.19,68.54	15.13,72.43
path	17.19,77.39	21.25,75.06	25.11,72.08
Click ore as you follow the path around this area
|tip Track them on your minimap with "Find Minerals".
|tip You will need level 175 Mining to collect these.
collect Mithril Ore##3858 |n
collect 10 Star Ruby##7910 |or
|tip Farm them with Mining or purchase them from the auction house.
|tip They can be Prospected from Iron Ore, Mithril Ore, and Thorium Ore with Jewelcrafting.
'|complete skill("Jewelcrafting") >= 260 |or
step
label "Collect_Thorium_Setting_260"
collect 10 Thorium Setting##21752 |or
|tip You created these in a previous step.
'|complete skill("Jewelcrafting") >= 260 |or
step
create 10 Ruby Pendant of Fire##26883,Jewelcrafting,260
step
talk Kalinda##19775
|tip Inside the building.
Train Simple Opal Ring |learn Simple Opal Ring##26902 |goto Silvermoon City/0 90.33,73.83
stickystart "Collect_Thorium_Setting_281"
step
map Un'Goro Crater
path follow smart; loop on; ants curved; dist 20
path	66.46,78.95	64.56,79.71	61.79,84.21	59.34,84.18	57.63,86.04
path	54.50,86.69	51.13,86.82	48.27,87.30	45.98,86.58	42.89,85.00
path	40.79,83.52	37.91,83.14	36.77,80.17	33.58,79.05	30.40,79.61
path	28.89,76.98	28.97,71.52	26.00,67.67	25.93,63.53	24.59,58.51
path	23.95,53.04	24.40,48.21	23.89,44.76	24.71,41.12	26.26,36.59
path	26.62,31.21	28.29,29.47	29.59,25.66	29.89,20.92	33.32,20.67
path	36.29,20.47	38.67,16.00	41.73,15.77	43.32,14.12	46.94,13.03
path	49.79,13.83	52.84,12.88	56.31,14.04	59.61,16.58	62.25,16.02
path	64.19,19.90	65.99,21.01	68.51,20.26	71.19,20.89	71.21,23.75
path	71.75,28.19	74.76,32.46	75.06,37.15	76.32,43.15	76.67,48.32
path	77.05,53.09	76.56,57.02	75.35,61.97	74.66,68.05	72.92,70.46
path	71.39,73.80	71.00,79.21	68.32,79.90
Click ore as you follow the path around this area
|tip Track them on your minimap with "Find Minerals".
|tip You will need level 245 Mining to collect these.
collect Thorium Ore##10620 |n
collect 21 Large Opal##12799 |or
|tip Farm them with Mining or purchase them from the auction house.
|tip They can be Prospected from Mithril Ore, and Thorium Ore with Jewelcrafting.
'|complete skill("Jewelcrafting") >= 281 |or
step
label "Collect_Thorium_Setting_281"
collect 21 Thorium Setting##21752 |or
|tip You created these in a previous step.
'|complete skill("Jewelcrafting") >= 281 |or
step
create 21 Simple Opal Ring##26902,Jewelcrafting,281
|tip You may need to create more or less of these.
|tip Each additional Simple Opal Ring requires 1 Large Opal and 1 Thorium Setting.
step
talk Kalinda##19775
|tip Inside the building.
Train Diamond Focus Ring |learn Diamond Focus Ring##36526 |goto Silvermoon City/0 90.33,73.83
stickystart "Collect_Thorium_Setting_295"
step
map Un'Goro Crater
path follow smart; loop on; ants curved; dist 20
path	66.46,78.95	64.56,79.71	61.79,84.21	59.34,84.18	57.63,86.04
path	54.50,86.69	51.13,86.82	48.27,87.30	45.98,86.58	42.89,85.00
path	40.79,83.52	37.91,83.14	36.77,80.17	33.58,79.05	30.40,79.61
path	28.89,76.98	28.97,71.52	26.00,67.67	25.93,63.53	24.59,58.51
path	23.95,53.04	24.40,48.21	23.89,44.76	24.71,41.12	26.26,36.59
path	26.62,31.21	28.29,29.47	29.59,25.66	29.89,20.92	33.32,20.67
path	36.29,20.47	38.67,16.00	41.73,15.77	43.32,14.12	46.94,13.03
path	49.79,13.83	52.84,12.88	56.31,14.04	59.61,16.58	62.25,16.02
path	64.19,19.90	65.99,21.01	68.51,20.26	71.19,20.89	71.21,23.75
path	71.75,28.19	74.76,32.46	75.06,37.15	76.32,43.15	76.67,48.32
path	77.05,53.09	76.56,57.02	75.35,61.97	74.66,68.05	72.92,70.46
path	71.39,73.80	71.00,79.21	68.32,79.90
Click ore as you follow the path around this area
|tip Track them on your minimap with "Find Minerals".
|tip You will need level 245 Mining to collect these.
collect Thorium Ore##10620 |n
collect 20 Azerothian Diamond##12800 |or
|tip Farm them with Mining or purchase them from the auction house.
|tip They can be Prospected from Mithril Ore, and Thorium Ore with Jewelcrafting.
'|complete skill("Jewelcrafting") >= 295 |or
step
label "Collect_Thorium_Setting_295"
collect 20 Thorium Setting##21752 |or
|tip You created these in a previous step.
'|complete skill("Jewelcrafting") >= 295 |or
step
create 20 Diamond Focus Ring##36526,Jewelcrafting,295
|tip You may need to create more or less of these.
|tip Each additional Diamond Focus Ring requires 1 Azerothian Diamond and 1 Thorium Setting.
step
talk Kalinda##19775
|tip Inside the building.
Train Emerald Lion Ring |learn Emerald Lion Ring##34961 |goto Silvermoon City/0 90.33,73.83
stickystart "Collect_Thorium_Setting_300"
step
map Un'Goro Crater
path follow smart; loop on; ants curved; dist 20
path	66.46,78.95	64.56,79.71	61.79,84.21	59.34,84.18	57.63,86.04
path	54.50,86.69	51.13,86.82	48.27,87.30	45.98,86.58	42.89,85.00
path	40.79,83.52	37.91,83.14	36.77,80.17	33.58,79.05	30.40,79.61
path	28.89,76.98	28.97,71.52	26.00,67.67	25.93,63.53	24.59,58.51
path	23.95,53.04	24.40,48.21	23.89,44.76	24.71,41.12	26.26,36.59
path	26.62,31.21	28.29,29.47	29.59,25.66	29.89,20.92	33.32,20.67
path	36.29,20.47	38.67,16.00	41.73,15.77	43.32,14.12	46.94,13.03
path	49.79,13.83	52.84,12.88	56.31,14.04	59.61,16.58	62.25,16.02
path	64.19,19.90	65.99,21.01	68.51,20.26	71.19,20.89	71.21,23.75
path	71.75,28.19	74.76,32.46	75.06,37.15	76.32,43.15	76.67,48.32
path	77.05,53.09	76.56,57.02	75.35,61.97	74.66,68.05	72.92,70.46
path	71.39,73.80	71.00,79.21	68.32,79.90
Click ore as you follow the path around this area
|tip Track them on your minimap with "Find Minerals".
|tip You will need level 245 Mining to collect these.
collect Thorium Ore##10620 |n
collect 10 Huge Emerald##12364 |or
|tip Farm them with Mining or purchase them from the auction house.
|tip They can be Prospected from Mithril Ore, and Thorium Ore with Jewelcrafting.
'|complete skill("Jewelcrafting") >= 300 |or
step
label "Collect_Thorium_Setting_300"
collect 5 Thorium Setting##21752 |or
|tip You created these in a previous step.
'|complete skill("Jewelcrafting") >= 300 |or
step
create 5 Emerald Lion Ring##34961,Jewelcrafting,300
step
Reach Level 50 |ding 50
|tip You must be at least level 50 to train Master professions.
|tip Use the leveling guides to accomplish this.
step
Enter the building |goto Hellfire Peninsula/0 56.41,37.79 < 7 |walk
talk Kalaen##18751
|tip Inside the building.
Learn Master Jewelcrafting |skillmax Jewelcrafting,375 |goto 56.78,37.79
step
talk Kalaen##18751
|tip Inside the building.
buy 1 Design: Brilliant Golden Draenite##23148 |goto 56.78,37.79 |or
|tip You can cut any low level gem for points.
'|complete skill("Jewelcrafting") >= 320 |or
step
use the Design: Brilliant Golden Draenite##23148
Train Brilliant Golden Draenite |learn Brilliant Golden Draenite##28938
step
map Hellfire Peninsula/0
path	65.97,48.02	69.02,46.87	70.80,50.94	70.25,54.41	70.27,59.32
path	72.23,60.13	74.08,63.37	76.97,62.92	78.97,66.32	78.85,70.21
path	79.70,74.48	80.75,77.99	77.91,75.80	77.13,73.33	76.82,69.54
path	75.53,67.17	71.66,67.33	69.41,67.29	68.38,60.74	65.36,60.83
path	65.69,64.45	63.25,69.06	62.72,72.99	62.49,79.96	58.89,76.64
path	57.05,73.97	57.06,81.30	56.40,82.14	55.54,83.79	52.24,83.83
path	49.82,83.52	46.85,84.82	42.98,79.36	42.26,76.62	44.54,73.42
path	47.44,71.34	50.85,69.85	47.41,66.63	44.75,68.48	45.62,61.55
path	47.89,59.49	49.89,56.45	49.95,61.42	51.38,61.68	52.93,58.38
path	55.41,56.25	56.22,53.50	58.62,52.98	62.69,50.44
click Fel Iron Deposit##181555+
|tip They look like green mineral clusters around this path.
|tip Enter caves along the path.
|tip Make sure you enable "Find Minerals" in the tracking menu on the minimap.
collect 30 Golden Draenite##23112 |or
|tip Farm them with Mining or purchase them from the auction house.
|tip They can be Prospected from Thorium Ore, Fel Iron Ore, and Adamantite Ore with Jewelcrafting.
|tip You can cut any low level gem for points.
'|complete skill("Jewelcrafting") >= 320 |or
step
create 30 Brilliant Golden Draenite##28938,Jewelcrafting,320
|tip You can cut any low level gem for points.
step
talk Kalaen##18751
|tip Inside the building.
buy 1 Design: Glinting Flame Spessarite##23137 |goto 56.78,37.79 |or
'|complete skill("Jewelcrafting") >= 325 |or
step
use the Design: Glinting Flame Spessarite##23137
Train Glinting Flame Spessarite |learn Glinting Flame Spessarite##28914
step
collect 7 Flame Spessarite##21929 |or
|tip Farm them with Mining or purchase them from the auction house.
|tip They can be Prospected from Thorium Ore, Fel Iron Ore, and Adamantite Ore with Jewelcrafting.
|tip You can cut Flame Spessarite, Blood Garnet, Deep Peridot, and Azure Moonstone for points.
'|complete skill("Jewelcrafting") >= 325 |or
step
create 7 Glinting Flame Spessarite##28914,Jewelcrafting,325
|tip You can cut Flame Spessarite, Blood Garnet, Deep Peridot, and Azure Moonstone for points.
step
talk Kalaen##18751
|tip Inside the building.
Train Mercurial Adamantite |learn Mercurial Adamantite##38068 |goto 56.78,37.79
stickystart "Collect_Adamantite_Powder_335"
stickystart "Collect_Mercurial_Stone"
step
label "Collect_Primal_Earth_335"
map Nagrand/0
path follow smart; loop off; ants curved; dist 30
path	46.19,77.20	41.98,78.72	40.31,82.83	32.13,80.25	29.34,79.24
path	28.40,73.85	28.94,66.76	28.17,63.58
kill Shattered Rumbler##17157+
|tip Follow the path, killing any that you see.
collect Mote of Earth##22573 |n
|tip Combine 10 Motes of Earth into 1 Primal Earth.
collect 10 Primal Earth##22452 |or
|tip Farm them with Mining or purchase them from the auction house.
'|goto Nagrand/0 28.17,63.58 < 30 |c |noway
'|complete skill("Jewelcrafting") >= 335 |or
step
map Nagrand/0
path follow smart; loop off; ants curved; dist 30
path	28.17,63.58	28.94,66.76	28.40,73.85	29.34,79.24	32.13,80.25
path	40.31,82.83	41.98,78.72	46.19,77.20
kill Shattered Rumbler##17157+
|tip Follow the path, killing any that you see.
collect Mote of Earth##22573 |n
|tip Combine 10 Motes of Earth into 1 Primal Earth.
collect 10 Primal Earth##22452 |or
|tip Farm them with Mining or purchase them from the auction house.
'|goto Nagrand/0 46.19,77.20 < 30 |c |noway |next "Collect_Primal_Earth_335"
'|complete skill("Jewelcrafting") >= 335 |or
step
label "Collect_Adamantite_Powder_335"
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
collect 40 Adamantite Powder##24243 |or
|tip Farm them with Mining or purchase them from the auction house.
|tip They can also be Prospected from Adamantite Ore with Jewelcrafting.
'|complete skill("Jewelcrafting") >= 335 |or
step
label "Collect_Mercurial_Stone"
collect Mercurial Stone##31080 |or
|tip These are created by Alchemists and required to be present in your inventory to transmute Mercurial Adamantite.
|tip Crafting one requires 1 Primal Earth, 1 Primal Life, and 1 Primal Water.
|tip Have an Alchemist craft one for you or purchase one from the auction house.
'|complete skill("Jewelcrafting") >= 335 |or
step
create 10 Mercurial Adamantite##38068,Jewelcrafting,335
|tip Save these, you will need them for future steps.
step
talk Kalaen##18751
|tip Inside the building.
buy 1 Design: Sovereign Shadow Draenite##23147 |goto Hellfire Peninsula/0 56.78,37.79 |or
'|complete skill("Jewelcrafting") >= 340 |or
step
use the Design: Sovereign Shadow Draenite##23147
Train Sovereign Shadow Draenite |learn Sovereign Shadow Draenite##28936
step
map Hellfire Peninsula/0
path	65.97,48.02	69.02,46.87	70.80,50.94	70.25,54.41	70.27,59.32
path	72.23,60.13	74.08,63.37	76.97,62.92	78.97,66.32	78.85,70.21
path	79.70,74.48	80.75,77.99	77.91,75.80	77.13,73.33	76.82,69.54
path	75.53,67.17	71.66,67.33	69.41,67.29	68.38,60.74	65.36,60.83
path	65.69,64.45	63.25,69.06	62.72,72.99	62.49,79.96	58.89,76.64
path	57.05,73.97	57.06,81.30	56.40,82.14	55.54,83.79	52.24,83.83
path	49.82,83.52	46.85,84.82	42.98,79.36	42.26,76.62	44.54,73.42
path	47.44,71.34	50.85,69.85	47.41,66.63	44.75,68.48	45.62,61.55
path	47.89,59.49	49.89,56.45	49.95,61.42	51.38,61.68	52.93,58.38
path	55.41,56.25	56.22,53.50	58.62,52.98	62.69,50.44
click Fel Iron Deposit##181555+
|tip They look like green mineral clusters around this path.
|tip Enter caves along the path.
|tip Make sure you enable "Find Minerals" in the tracking menu on the minimap.
collect Fel Iron Ore##23424 |n
collect 7 Shadow Draenite##23107 |or
|tip Farm them with Mining or purchase them from the auction house.
|tip They can be Prospected from Thorium Ore, Fel Iron Ore, and Adamantite Ore with Jewelcrafting.
|tip You can cut Flame Spessarite, Shadow Draenite, and Golden Draenite for points.
'|complete skill("Jewelcrafting") >= 340 |or
step
create 7 Sovereign Shadow Draenite##28936,Jewelcrafting,340
|tip You can cut Flame Spessarite, Shadow Draenite, and Golden Draenite for points.
step
talk Kalaen##18751
|tip Inside the building.
Train Heavy Adamantite Ring |learn Heavy Adamantite Ring##31052 |goto 56.78,37.79
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
collect 20 Adamantite Ore##23425 |n
|tip Smelt the ore at a forge.
collect 10 Adamantite Bar##23446 |or
|tip Farm them with Mining or purchase them from the auction house.
'|complete skill("Jewelcrafting") >= 350 |or
step
create 10 Heavy Adamantite Ring##31052,Jewelcrafting,350
step
Reach Skill 365 in Jewelcrafting |skill Jewelcrafting,365
|tip From this point, you will have to make what you can find from Designs.
|tip Check the auction house for Designs and cut gems for skill points.
step
Reach Skill 375 in Jewelcrafting |skill Jewelcrafting,375
|tip From this point, it's best to cut Earthstorm and Skyfire Diamonds.
|tip Purchase a design based upon your reputation status and what you can use or sell.
|tip Insightful Earthstorm Diamond can be purchased from Almaador in Shattrath City if Friendly with The Sha'tar.
|tip Bracing Earthstorm Diamond can be purchased from Ythyar in Karazhan if Revered with the Consortium.
|tip Powerful Earthstorm Diamond can be purchased from Ythyar in Karazhan if Honored with the Consortium.
|tip Swift Skyfire Diamond can be purchased from Paulsta'ats in Nagrand if Honored with the Consortium.
|tip Enigmatic Skyfire Diamond can be purchased from Alurmi in the Caverns of Time if Honored with the Keepers of Time.
step
_Congratulations!_
You Reached Skill 375 in Jewelcrafting.
]])
ZygorGuidesViewer:RegisterGuide("Profession Guides\\Leatherworking\\Leatherworking (1-375)",{
author="support@zygorguides.com",
condition_suggested=function() return skill("Leatherworking") > 0 and skill("Leatherworking") < 375 end,
description="This guide will walk you through leveling your Leatherworking skill from 1-375.",
},[[
step
Reach Level 5 |ding 5
|tip You must be at least level 5 to train Apprentice professions.
|tip Use the leveling guides to accomplish this.
step
Enter the building |goto Orgrimmar/0 62.22,45.65 < 5 |walk
talk Karolek##3365
|tip Inside the building.
Train Apprentice Leatherworking |skillmax Leatherworking,75 |goto Orgrimmar/0 62.80,44.15
step
Click Here if You Would Like to Collect All Materials First |confirm |next |or
_Or_
Click Here to Collect Materials as You Level or Resume Leveling Leatherworking |confirm |next "Begin_Profession_Leveling" |or
'|complete skill("Leatherworking") >= 375 |or |next "Begin_Profession_Leveling"
stickystart "Collect_Light_Leather_Total"
stickystart "Collect_Medium_Leather_Total"
stickystart "Collect_Heavy_Hide_Total"
stickystart "Collect_Heavy_Leather_Total"
stickystart "Collect_Thick_Leather_Total"
stickystart "Collect_Rugged_Leather_Total"
step
Kill enemies around this area
|tip Skin their corpses.
collect 57 Ruined Leather Scraps##2934 |or |goto Durotar 43.89,17.49
|tip Farm them with Skinning or purchase them from the auction house.
|tip These totals are approximate.
|tip You may need more or less than the indicated amount.
You can find more around [39.47,17.22]
'|complete skill("Leatherworking") >= 20 |or
step
label "Collect_Light_Leather_Total"
Kill enemies around this area
|tip Skin their corpses.
collect 375 Ruined Leather Scraps##2934 |or |goto Durotar 43.89,17.49
|tip Farm them with Skinning or purchase them from the auction house. |notinsticky
|tip These totals are approximate. |notinsticky
|tip You may need more or less than the indicated amount. |notinsticky
You can find more around [39.47,17.22]
'|complete skill("Leatherworking") >= 125 |or
step
label "Collect_Medium_Leather_Total"
Kill Yeti enemies around this area
|tip Skin their corpses.
|tip You can find more inside the cave.
|tip You will need level 155 Skinning to collect these.
collect 352 Medium Leather##2319 |or |goto Hillsbrad Foothills 46.12,31.76
|tip Farm them with Skinning or purchase them from the auction house. |notinsticky
|tip These totals are approximate. |notinsticky
|tip You may need more or less than the indicated amount. |notinsticky
'|complete skill("Leatherworking") >= 155 |or
step
label "Collect_Heavy_Hide_Total"
Kill enemies around this area
|tip Skin their corpses.
|tip You will need level 205 Skinning to collect these.
collect 20 Heavy Hide##4235 |or |goto The Hinterlands 16.19,50.97
|tip Farm them with Skinning or purchase them from the auction house. |notinsticky
|tip These totals are approximate. |notinsticky
|tip You may need more or less than the indicated amount. |notinsticky
'|complete skill("Leatherworking") >= 171 |or
step
label "Collect_Heavy_Leather_Total"
Kill enemies around this area
|tip Only beast enemies will be skinnable.
|tip Skin their corpses.
|tip You will need level 185 Skinning to collect these.
collect 215 Heavy Leather##4234 |or |goto Dustwallow Marsh 40.73,58.37
|tip Farm them with Skinning or purchase them from the auction house. |notinsticky
|tip These totals are approximate. |notinsticky
|tip You may need more or less than the indicated amount. |notinsticky
You can find more around: |notinsticky
[43.35,50.06]
[40.42,41.57]
'|complete skill("Leatherworking") >= 200 |or
step
label "Collect_Thick_Leather_Total"
Kill Ravasaur enemies around this area
|tip Skin their corpses.
|tip You will need level 250 Skinning to collect these.
collect 739 Thick Leather##4304 |or|goto Un'Goro Crater 67.37,72.59
|tip Farm them with Skinning or purchase them from the auction house. |notinsticky
|tip These totals are approximate. |notinsticky
|tip You may need more or less than the indicated amount. |notinsticky
You can find more around: |notinsticky
[65.75,64.16]
[70.21,55.33]
'|complete skill("Leatherworking") >= 260 |or
step
label "Collect_Rugged_Leather_Total"
Kill Ice Thistle enemies around this area
|tip You can find more inside the cave.
|tip Skin their corpses.
|tip You will need level 275 Skinning to collect these.
collect 344 Rugged Leather##8170 |or |goto Winterspring 66.43,44.38
|tip Farm them with Skinning or purchase them from the auction house. |notinsticky
|tip These totals are approximate. |notinsticky
|tip You may need more or less than the indicated amount. |notinsticky
You can find more inside the cave at [67.67,41.72]
'|complete skill("Leatherworking") >= 300 |or
stickystart "Collect_Thick_Clefthoof_Leather_Total"
stickystart "Collect_Fel_Hide_Total"
step
map Netherstorm/0
path follow smart; loop on; ants curved; dist 30
path	43.61,57.06	45.22,57.65	47.41,56.58	48.25,54.31	48.18,51.86
path	46.52,51.17	45.58,49.75	43.63,50.57	43.29,52.27	43.66,54.99
path	44.85,56.21
Kill enemies around this area
|tip Only Beast enemies will be skinnable.
|tip Skin their corpses.
collect 1355 Knothide Leather##21887 |or
|tip Farm them with Skinning or purchase them from the auction house.
|tip These totals are approximate.
|tip You may need more or less than the indicated amount.
'|complete skill("Leatherworking") >= 336 |or
step
label "Collect_Thick_Clefthoof_Leather_Total"
path follow smart; loop on; ants curved; dist 30
path	44.28,26.55	43.25,29.59	45.88,33.29	47.54,38.47	50.14,51.61
path	52.51,54.52	54.09,50.75	54.25,48.06	55.98,45.01	51.01,39.01
path	50.63,31.76	46.12,27.60
Kill Clefthoof enemies around this area
|tip Skin their corpses.
collect 24 Thick Clefthoof Leather##25708 |or
|tip Farm them with Skinning or purchase them from the auction house. |notinsticky
|tip These totals are approximate. |notinsticky
|tip You may need more or less than the indicated amount. |notinsticky
'|complete skill("Leatherworking") >= 370 |or
step
label "Collect_Fel_Hide_Total"
map Netherstorm/0
path follow smart; loop on; ants curved; dist 30
path	55.33,60.50	58.09,60.46	58.98,58.47	61.66,59.15	63.22,59.54
path	65.48,61.63	66.93,63.05	63.63,64.45	61.98,62.72
kill Warp Chaser##18884+
|tip Skin their corpses.
collect 24 Fel Hide##25707 |or
|tip Farm them with Skinning or purchase them from the auction house. |notinsticky
|tip These totals are approximate. |notinsticky
|tip You may need more or less than the indicated amount. |notinsticky
'|complete skill("Leatherworking") >= 375 |or
step
label "Begin_Profession_Leveling"
Kill enemies around this area
|tip Skin their corpses.
collect 57 Ruined Leather Scraps##2934 |or |goto Durotar 43.89,17.49
|tip Farm them with Skinning or purchase them from the auction house.
|tip You can also use 20 Light Leather to make 20 Light Armor Kits.
You can find more around [39.47,17.22]
'|complete skill("Leatherworking") >= 20 |or
step
create 19 Light Leather##2881,19 total |or
|tip Save these, you will need them for future steps.
|tip You can also use 20 Light Leather to make 20 Light Armor Kits.
'|complete skill("Leatherworking") >= 20 |or
step
create 1 Light Leather##2881,Leatherworking,20
|tip Save at least 19 of these; you will need them for future steps.
|tip You can also use 20 Light Leather to make 20 Light Armor Kits.
step
Kill enemies around this area
|tip Skin their corpses.
collect 40 Light Leather##2318 |or |goto Durotar 43.89,17.49
|tip Farm them with Skinning or purchase them from the auction house.
You can find more around [39.47,17.22]
'|complete skill("Leatherworking") >= 45 |or
step
create 40 Light Armor Kit##2152,Leatherworking,45
|tip You may need to create more or less of these.
|tip Each additional Light Armor Kit requires 1 Light Leather.
step
Kill enemies around this area
|tip Skin their corpses.
collect 42 Light Leather##2318 |or |goto Durotar 43.89,17.49
|tip Farm them with Skinning or purchase them from the auction house.
You can find more around [39.47,17.22]
'|complete skill("Leatherworking") >= 55 |or
step
talk Tamar##3366
|tip Inside the building.
buy 21 Coarse Thread##2320 |goto Orgrimmar/0 63.05,45.53 |or
'|complete skill("Leatherworking") >= 55 |or
step
create 21 Handstitched Leather Cloak##9058,Leatherworking,55
|tip You may need to create more or less of these.
|tip Each additional Handstitched Leather Cloak requires 2 Light Leather and 1 Coarse Thread.
step
Reach Level 10 |ding 10
|tip You must be at least level 10 to train Journeyman professions.
|tip Use the leveling guides to accomplish this.
step
talk Karolek##3365
|tip Inside the building.
Train Journeyman Leatherworking |skillmax Leatherworking,150 |goto Orgrimmar/0 62.80,44.15
step
talk Karolek##3365
|tip Inside the building.
Train Embossed Leather Gloves |learn Embossed Leather Gloves##3756 |goto Orgrimmar/0 62.80,44.15
step
Kill enemies around this area
|tip Skin their corpses.
collect 165 Light Leather##2318 |or |goto Durotar 43.89,17.49
|tip Farm them with Skinning or purchase them from the auction house.
You can find more around [39.47,17.22]
'|complete skill("Leatherworking") >= 100 |or
step
talk Tamar##3366
|tip Inside the building.
buy 180 Coarse Thread##2320 |goto Orgrimmar/0 63.05,45.53 |or
|tip Save these, you will need them for future steps.
'|complete skill("Leatherworking") >= 100 |or
step
create 55 Embossed Leather Gloves##3756,Leatherworking,100
|tip You may need to create more or less of these.
|tip Each additional Embossed Leather Glove requires 3 Light Leather and 2 Coarse Thread.
step
talk Karolek##3365
|tip Inside the building.
Train Fine Leather Belt |learn Fine Leather Belt##3763 |goto Orgrimmar/0 62.80,44.15
step
Kill enemies around this area
|tip Skin their corpses.
collect 210 Light Leather##2318 |or |goto Durotar 43.89,17.49
|tip Farm them with Skinning or purchase them from the auction house.
You can find more around [39.47,17.22]
|tip Farm them with Skinning or purchase them from the auction house.
'|complete skill("Leatherworking") >= 125 |or
step
talk Tamar##3366
|tip Inside the building.
buy 70 Coarse Thread##2320 |goto Orgrimmar/0 63.05,45.53 |or
|tip You bought these in a previous step.
'|complete skill("Leatherworking") >= 125 |or
step
create 35 Fine Leather Belt##3763,Leatherworking,125
|tip You may need to create more or less of these.
|tip Each additional Fine Leather Belt requires 6 Light Leather and 2 Coarse Thread.
step
talk Karolek##3365
|tip Inside the building.
Train Dark Leather Boots |learn Dark Leather Boots##2167 |goto Orgrimmar/0 62.80,44.15
step
Kill Yeti enemies around this area
|tip Skin their corpses.
|tip You can find more inside the cave.
|tip You will need level 155 Skinning to collect these.
collect 72 Medium Leather##2319 |or |goto Hillsbrad Foothills 46.12,31.76
|tip Farm them with Skinning or purchase them from the auction house.
'|complete skill("Leatherworking") >= 137 |or
step
talk Tamar##3366
|tip Inside the building.
buy 36 Fine Thread##2321 |goto Orgrimmar/0 63.05,45.53 |or 2
buy 18 Gray Dye##4340 |goto Orgrimmar/0 63.05,45.53 |or 2
'|complete skill("Leatherworking") >= 137 |or
step
create 18 Dark Leather Boots##2167,Leatherworking,137
|tip You may need to create more or less of these.
|tip Each additional Dark Leather Boot requires 4 Medium Leather, 2 Fine Thread, and 1 Gray Dye.
step
Reach Level 20 |ding 20
|tip You must be at least level 20 to train Expert professions.
|tip Use the leveling guides to accomplish this.
step
talk Karolek##3365
|tip Inside the building.
Train Expert Leatherworking |skillmax Leatherworking,225 |goto Orgrimmar/0 62.80,44.15
step
talk Karolek##3365
|tip Inside the building.
Train Dark Leather Pants |learn Dark Leather Pants##7135 |goto Orgrimmar/0 62.80,44.15
step
Kill Yeti enemies around this area
|tip Skin their corpses.
|tip You can find more inside the cave.
|tip You will need level 155 Skinning to collect these.
collect 240 Medium Leather##2319 |or |goto Hillsbrad Foothills 46.12,31.76
|tip Farm them with Skinning or purchase them from the auction house.
'|complete skill("Leatherworking") >= 150 |or
step
talk Tamar##3366
|tip Inside the building.
buy 20 Fine Thread##2321 |goto Orgrimmar/0 63.05,45.53 |or 2
buy 20 Gray Dye##4340 |goto Orgrimmar/0 63.05,45.53 |or 2
'|complete skill("Leatherworking") >= 150 |or
step
create 20 Dark Leather Pants##7135,Leatherworking,150
|tip You may need to create more or less of these.
|tip Each additional Dark Leather Pant requires 12 Medium Leather, 1 Fine Thread, and 1 Gray Dye.
step
talk Karolek##3365
|tip Inside the building.
Train Heavy Leather |learn Heavy Leather##20649 |goto Orgrimmar/0 62.80,44.15
step
Kill Yeti enemies around this area
|tip Skin their corpses.
|tip You can find more inside the cave.
|tip You will need level 155 Skinning to collect these.
collect 40 Medium Leather##2319 |or |goto Hillsbrad Foothills 46.12,31.76
|tip Farm them with Skinning or purchase them from the auction house.
'|complete skill("Leatherworking") >= 155 |or
step
create 8 Heavy Leather##20649,Leatherworking,155
|tip You may need to create more or less of these.
|tip Each additional Heavy Leather requires 5 Medium Leather.
step
talk Karolek##3365
|tip Inside the building.
Train Cured Heavy Hide |learn Cured Heavy Hide##3818 |goto Orgrimmar/0 62.80,44.15
step
Kill enemies around this area
|tip Skin their corpses.
|tip You will need level 205 Skinning to collect these.
collect 20 Heavy Hide##4235 |or |goto The Hinterlands 16.19,50.97
|tip Farm them with Skinning or purchase them from the auction house.
'|complete skill("Leatherworking") >= 171 |or
step
talk Tamar##3366
|tip Inside the building.
buy 60 Salt##4289 |goto Orgrimmar/0 63.05,45.53 |or
'|complete skill("Leatherworking") >= 171 |or
step
create 20 Cured Heavy Hide##3818,Leatherworking,20 total |or
|tip Save these, you will need them for future steps.
'|complete skill("Leatherworking") >= 171 |or
step
create 1 Cured Heavy Hide##3818,Leatherworking,165
|tip Save at least 20 of these; you will need them for future steps.
|tip You may need to create more of these.
|tip Each additional Cured Heavy Hide requires 1 Heavy Hide and 3 Salt.
step
talk Karolek##3365
|tip Inside the building.
Train Heavy Armor Kit |learn Heavy Armor Kit##3780 |goto Orgrimmar/0 62.80,44.15
step
Kill enemies around this area
|tip Only beast enemies will be skinnable.
|tip Skin their corpses.
|tip You will need level 185 Skinning to collect these.
collect 95 Heavy Leather##4234 |or |goto Dustwallow Marsh 40.73,58.37
|tip Farm them with Skinning or purchase them from the auction house.
You can find more around: |notinsticky
[43.35,50.06]
[40.42,41.57]
'|complete skill("Leatherworking") >= 180 |or
step
talk Tamar##3366
|tip Inside the building.
buy 39 Fine Thread##2321 |goto Orgrimmar/0 63.05,45.53 |or
|tip Save these, you will need them for future steps.
'|complete skill("Leatherworking") >= 180 |or
step
create 19 Heavy Armor Kit##3780,Leatherworking,180
|tip You may need to create more of these.
|tip Each additional Heavy Armor Kit requires 5 Heavy Leather and 1 Fine Thread.
step
talk Karolek##3365
|tip Inside the building.
Train Barbaric Shoulders |learn Barbaric Shoulders##7151 |goto Orgrimmar/0 62.80,44.15
stickystart "Collect_Cured_Heavy_Hide_190"
step
Kill enemies around this area
|tip Only beast enemies will be skinnable.
|tip Skin their corpses.
|tip You will need level 185 Skinning to collect these.
collect 80 Heavy Leather##4234 |or |goto Dustwallow Marsh 40.73,58.37
|tip Farm them with Skinning or purchase them from the auction house.
You can find more around: |notinsticky
[43.35,50.06]
[40.42,41.57]
'|complete skill("Leatherworking") >= 190 |or
step
label "Collect_Cured_Heavy_Hide_190"
collect 10 Cured Heavy Hide##4236 |or
|tip You created these in a previous step.
'|complete skill("Leatherworking") >= 190 |or
step
talk Tamar##3366
|tip Inside the building.
buy 20 Fine Thread##2321 |goto Orgrimmar/0 63.05,45.53 |or
|tip You purchased these in a previous step.
'|complete skill("Leatherworking") >= 190 |or
step
create 10 Barbaric Shoulders##7151,Leatherworking,190
step
talk Karolek##3365
|tip Inside the building.
Train Guardian Gloves |learn Guardian Gloves##7156 |goto Orgrimmar/0 62.80,44.15
stickystart "Collect_Cured_Heavy_Hide_200"
step
Kill enemies around this area
|tip Only beast enemies will be skinnable.
|tip Skin their corpses.
|tip You will need level 185 Skinning to collect these.
collect 40 Heavy Leather##4234 |or |goto Dustwallow Marsh 40.73,58.37
|tip Farm them with Skinning or purchase them from the auction house.
You can find more around: |notinsticky
[43.35,50.06]
[40.42,41.57]
'|complete skill("Leatherworking") >= 200 |or
step
label "Collect_Cured_Heavy_Hide_200"
collect 10 Cured Heavy Hide##4236 |or
|tip You created these in a previous step.
'|complete skill("Leatherworking") >= 200 |or
step
talk Tamar##3366
|tip Inside the building.
buy 15 Silken Thread##4291 |goto Orgrimmar/0 63.05,45.53 |or
|tip Save these, you will need them for future steps.
'|complete skill("Leatherworking") >= 200 |or
step
create 10 Guardian Gloves##7156,Leatherworking,200
step
talk Karolek##3365
|tip Inside the building.
Train Thick Armor Kit |learn Thick Armor Kit##10487 |goto Orgrimmar/0 62.80,44.15
step
Kill Ravasaur enemies around this area
|tip Skin their corpses.
|tip You will need level 250 Skinning to collect these.
collect 25 Thick Leather##4304 |or |goto Un'Goro Crater 67.37,72.59
|tip Farm them with Skinning or purchase them from the auction house.
You can find more around: |notinsticky
[65.75,64.16]
[70.21,55.33]
'|complete skill("Leatherworking") >= 205 |or
step
talk Tamar##3366
|tip Inside the building.
buy 5 Silken Thread##4291 |goto Orgrimmar/0 63.05,45.53 |or
|tip You purchased these in a previous step.
'|complete skill("Leatherworking") >= 205 |or
step
create 5 Thick Armor Kit##10487,Leatherworking,205
step
Reach Level 35 |ding 35
|tip You must be at least this level before you can learn the next rank of this profession.
|tip Use the leveling guides to accomplish this.
step
talk Karolek##3365
|tip Inside the building.
Train Artisan Leatherworking |skillmax Leatherworking,300 |goto Orgrimmar/0 62.80,44.15
step
talk Karolek##3365
|tip Inside the building.
Train Nightscape Headband |learn Nightscape Headband##10507 |goto Orgrimmar/0 62.80,44.15
step
Kill Ravasaur enemies around this area
|tip Skin their corpses.
|tip You will need level 250 Skinning to collect these.
collect 200 Thick Leather##4304 |or |goto Un'Goro Crater 67.37,72.59
|tip Farm them with Skinning or purchase them from the auction house.
You can find more around: |notinsticky
[65.75,64.16]
[70.21,55.33]
'|complete skill("Leatherworking") >= 235 |or
step
talk Tamar##3366
|tip Inside the building.
buy 166 Silken Thread##4291 |goto Orgrimmar/0 63.05,45.53 |or
|tip Save these, you will need them for future steps.
'|complete skill("Leatherworking") >= 235 |or
step
create 40 Nightscape Headband##10507,Leatherworking,235
|tip You may need to make more or less of these.
|tip Each additional Nightscape Headband requires 5 Thick Leather and 2 Silken Thread.
step
talk Karolek##3365
|tip Inside the building.
Train Nightscape Pants |learn Nightscape Pants##10548 |goto Orgrimmar/0 62.80,44.15
step
Kill Ravasaur enemies around this area
|tip Skin their corpses.
|tip You will need level 250 Skinning to collect these.
collect 210 Thick Leather##4304 |or |goto Un'Goro Crater 67.37,72.59
|tip Farm them with Skinning or purchase them from the auction house.
You can find more around: |notinsticky
[65.75,64.16]
[70.21,55.33]
'|complete skill("Leatherworking") >= 250 |or
step
talk Tamar##3366
|tip Inside the building.
buy 60 Silken Thread##4291 |goto Orgrimmar/0 63.05,45.53 |or
|tip You purchased these in a previous step.
'|complete skill("Leatherworking") >= 250 |or
step
create 15 Nightscape Pants##10548,Leatherworking,250
step
talk Karolek##3365
|tip Inside the building.
Train Nightscape Boots |learn Nightscape Boots##10558 |goto Orgrimmar/0 62.80,44.15
step
Kill Ravasaur enemies around this area
|tip Skin their corpses.
|tip You will need level 250 Skinning to collect these.
collect 304 Thick Leather##4304 |or |goto Un'Goro Crater 67.37,72.59
|tip Farm them with Skinning or purchase them from the auction house.
You can find more around: |notinsticky
[65.75,64.16]
[70.21,55.33]
'|complete skill("Leatherworking") >= 260 |or
step
talk Tamar##3366
|tip Inside the building.
buy 38 Heavy Silken Thread##8343 |goto Orgrimmar/0 63.05,45.53 |or
|tip You purchased these in a previous step.
'|complete skill("Leatherworking") >= 260 |or
step
create 19 Nightscape Boots##10558,Leatherworking,265
|tip You may need to make more or less of these.
|tip Each additional Nightscape Boot requires 16 Thick Leather and 2 Silken Thread.
step
talk Karolek##3365
|tip Inside the building.
Train Wicked Leather Bracers |learn Wicked Leather Bracers##15084 |goto Orgrimmar/0 62.80,44.15
step
talk Tamar##3366
|tip Inside the building.
buy 28 Black Dye##2325 |goto Orgrimmar/0 63.05,45.53 |or 2
buy 28 Rune Thread##14341 |goto Orgrimmar/0 63.05,45.53 |or 2
'|complete skill("Leatherworking") >= 290 |or
step
Kill Ice Thistle enemies around this area
|tip You can find more inside the cave.
|tip Skin their corpses.
|tip You will need level 275 Skinning to collect these.
collect 264 Rugged Leather##8170 |or |goto Winterspring 66.43,44.38
|tip Farm them with Skinning or purchase them from the auction house.
You can find more inside the cave at [67.67,41.72]
'|complete skill("Leatherworking") >= 290 |or
step
create 28 Wicked Leather Bracers##15084,Leatherworking,290
|tip You may need to make more or less of these.
|tip Each additional Wicked Leather Bracer requires 8 Rugged Leather, 1 Black Dye, and 1 Rune Thread.
step
talk Karolek##3365
|tip Inside the building.
Train Wicked Leather Headband |learn Wicked Leather Headband##19071 |goto Orgrimmar/0 62.80,44.15
step
Kill Ice Thistle enemies around this area
|tip You can find more inside the cave.
|tip Skin their corpses.
|tip You will need level 275 Skinning to collect these.
collect 120 Rugged Leather##8170 |or |goto Winterspring 66.43,44.38
|tip Farm them with Skinning or purchase them from the auction house.
You can find more inside the cave at [67.67,41.72]
'|complete skill("Leatherworking") >= 300 |or
step
talk Tamar##3366
|tip Inside the building.
buy 10 Black Dye##2325 |goto Orgrimmar/0 63.05,45.53 |or 2
buy 10 Rune Thread##14341 |goto Orgrimmar/0 63.05,45.53 |or 2
'|complete skill("Leatherworking") >= 300 |or
step
create 10 Wicked Leather Headband##19071,Leatherworking,300
step
Reach Level 50 |ding 50
|tip You must be at least level 50 to train Master professions.
|tip Use the leveling guides to accomplish this.
step
talk Barim Spilthoof##18754
Learn Master Leatherworking |skillmax Leatherworking,375 |goto Hellfire Peninsula/0 56.22,38.70
step
talk Barim Spilthoof##18754
Train Knothide Armor Kit |learn Knothide Armor Kit##32456 |goto 56.22,38.70
step
map Netherstorm/0
path follow smart; loop on; ants curved; dist 30
path	43.61,57.06	45.22,57.65	47.41,56.58	48.25,54.31	48.18,51.86
path	46.52,51.17	45.58,49.75	43.63,50.57	43.29,52.27	43.66,54.99
path	44.85,56.21
Kill enemies around this area
|tip Only Beast enemies will be skinnable.
|tip Skin their corpses.
collect 140 Knothide Leather##21887 |or
|tip Farm them with Skinning or purchase them from the auction house.
|tip You can also make Wicked Leather Belts to 325.
|tip Each Wicked Leather Belt requires 14 Rugged Leather, 2 Black Dye, and 2 Rune Thread.
'|complete skill("Leatherworking") >= 325 |or
step
create 35 Knothide Armor Kit##32456,Leatherworking,325
|tip You may need to create more or less of these.
|tip Each additional Knothide Armor Kit requires 4 Knothide Leather.
|tip You can also make Wicked Leather Belts to 325.
|tip Each Wicked Leather Belt requires 14 Rugged Leather, 2 Black Dye, and 2 Rune Thread.
step
talk Cro Threadstrong##19196
buy 1 Pattern: Heavy Knothide Leather##25720 |goto Shattrath City/0 67.31,67.85 |or
|tip This is a limited supply item that can also be purchased from the auction house.
'|complete skill("Leatherworking") >= 335 |or
step
use the Pattern: Heavy Knothide Leather##25720
Train Heavy Knothide Leather |learn Heavy Knothide Leather##32455
step
map Netherstorm/0
path follow smart; loop on; ants curved; dist 30
path	43.61,57.06	45.22,57.65	47.41,56.58	48.25,54.31	48.18,51.86
path	46.52,51.17	45.58,49.75	43.63,50.57	43.29,52.27	43.66,54.99
path	44.85,56.21
Kill enemies around this area
|tip Only Beast enemies will be skinnable.
|tip Skin their corpses.
collect 835 Knothide Leather##21887 |or
|tip Farm them with Skinning or purchase them from the auction house.
'|complete skill("Leatherworking") >= 335 |or
step
create 167 Heavy Knothide Leather##32455,Leatherworking,167 total |or
|tip Save these, you will need them for future steps.
'|complete skill("Leatherworking") >= 336 |or
step
create 1 Heavy Knothide Leather##32455,Leatherworking,335
|tip Save at least 167 of these; you will need them for future steps.
|tip You may need to create more or less of these.
|tip Each additional Heavy Knothide Leather requires 5 Knothide Leather.
step
talk Barim Spilthoof##18754
Train Thick Draenic Vest |learn Thick Draenic Vest##32473 |goto Hellfire Peninsula/0 56.22,38.70
step
map Netherstorm/0
path follow smart; loop on; ants curved; dist 30
path	43.61,57.06	45.22,57.65	47.41,56.58	48.25,54.31	48.18,51.86
path	46.52,51.17	45.58,49.75	43.63,50.57	43.29,52.27	43.66,54.99
path	44.85,56.21
Kill enemies around this area
|tip Only Beast enemies will be skinnable.
|tip Skin their corpses.
collect 280 Knothide Leather##21887 |or
|tip Farm them with Skinning or purchase them from the auction house.
'|complete skill("Leatherworking") >= 350 |or
step
talk Barim Spilthoof##18754
buy 60 Rune Thread##14341 |goto Hellfire Peninsula/0 56.22,38.70 |or
'|complete skill("Leatherworking") >= 350 |or
step
create 20 Thick Draenic Vest##32473,Leatherworking,350
|tip You may need to create more or less of these.
|tip Each additional Thick Draenic Vest requires 14 Knothide Leather and 3 Rune Thread.
step
talk Barim Spilthoof##18754
Train Heavy Knothide Armor Kit |learn Heavy Knothide Armor Kit##44970 |goto 56.22,38.70
step
collect 90 Heavy Knothide Leather##23793 |or
|tip You created these in a previous step.
'|complete skill("Leatherworking") >= 365 |or
step
create 40 Heavy Knothide Armor Kit##44970,Leatherworking,365
|tip You may need to create more or less of these.
|tip Each additional Heavy Knothide Armor Kit requires 3 Heavy Knothide Leather.
step
Reach Honored Reputation with The Sha'tar |complete rep("The Sha'tar") >= Honored or skill("Leatherworking") >= 370
step
talk Almaador##21432
buy 1 Pattern: Drums of Battle##29717 |goto Shattrath City/0 50.99,41.71 |or
'|complete skill("Leatherworking") >= 370 |or
step
use the Pattern: Drums of Battle##29717
Learn Drums of Battle |learn Drums of Battle##35543
stickystart "Collect_Thick_Clefthoof_Leather_370"
step
collect 36 Heavy Knothide Leather##23793 |or
|tip You created these in a previous step.
'|complete skill("Leatherworking") >= 370 |or
step
label "Collect_Thick_Clefthoof_Leather_370"
map Nagrand/0
path follow smart; loop on; ants curved; dist 30
path	44.28,26.55	43.25,29.59	45.88,33.29	47.54,38.47	50.14,51.61
path	52.51,54.52	54.09,50.75	54.25,48.06	55.98,45.01	51.01,39.01
path	50.63,31.76	46.12,27.60
Kill Clefthoof enemies around this area
|tip Skin their corpses.
collect 24 Thick Clefthoof Leather##25708 |or
|tip Farm them with Skinning or purchase them from the auction house.
'|complete skill("Leatherworking") >= 370 |or
step
create 6 Drums of Battle##35543,Leatherworking,370
|tip You may need to create more or less of these.
|tip Each additional Drums of Battle requires 6 Heavy Knothide Leather and 4 Thick Clefthoof Leather.
step
Reach Honored Reputation with the Keepers of Time |complete rep("Keepers of Time") >= Honored or skill("Leatherworking") >= 375
step
Enter the Caverns of Time |goto Tanaris/0 65.51,49.97 < 15 |walk
talk Alurmi##21643
|tip Inside the Caverns of Time.
buy 1 Pattern: Drums of Panic##29713 |goto 63.58,57.64 |or
'|complete skill("Leatherworking") >= 375 |or
step
use the Pattern: Drums of Panic##29713
Learn Drums of Panic |learn Drums of Panic##35538
stickystart "Collect_Fel_Hide_375"
step
collect 36 Heavy Knothide Leather##23793 |or
|tip You created these in a previous step.
'|complete skill("Leatherworking") >= 375 |or
step
label "Collect_Fel_Hide_375"
map Netherstorm/0
path follow smart; loop on; ants curved; dist 30
path	55.33,60.50	58.09,60.46	58.98,58.47	61.66,59.15	63.22,59.54
path	65.48,61.63	66.93,63.05	63.63,64.45	61.98,62.72
kill Warp Chaser##18884+
|tip Skin their corpses.
collect 24 Fel Hide##25707 |or
|tip Farm them with Skinning or purchase them from the auction house.
'|complete skill("Leatherworking") >= 375 |or
step
create 6 Drums of Panic##35538,Leatherworking,375
|tip You may need to create more or less of these.
|tip Each additional Drums of Panic requires 6 Heavy Knothide Leather and 4 Fel Hide.
step
_Congratulations!_
You Reached Skill 375 in Leatherworking.
]])
ZygorGuidesViewer:RegisterGuide("Profession Guides\\Lockpicking\\Lockpicking (1-300)",{
author="support@zygorguides.com",
condition_suggested=function() return skill("Lockpicking") > 0 and skill("Lockpicking") < 300 end,
description="This guide will walk you through leveling your Lockpicking skill from 1-300.",
},[[
step
Reach Level 20 |ding 20
|tip You must be at least level 16 before you can learn Lockpicking.
|tip You are able to gain 5 levels of Lockpicking for each level your character gains.
|tip You need to be at least level 20 to reach level 100 Lockpicking in a few steps.
|tip Use the leveling guides to accomplish this.
step
talk Ormok##3328
|tip Inside the Cleft of Shadow.
Train Pick Lock |learn Pick Lock##1804 |goto Orgrimmar/0 43.90,54.63
step
talk Shenthul##3401
|tip Inside the hut, inside the Cleft of Shadow.
accept Zando'zan##2379 |goto 43.05,53.74
step
talk Zando'zan##3402
|tip Inside the hut, inside the Cleft of Shadow.
turnin Zando'zan##2379 |goto 42.73,52.95
accept Wrenix of Ratchet##2382 |goto 42.73,52.95
step
talk Wrenix the Wretched##7161
turnin Wrenix of Ratchet##2382 |goto The Barrens 63.07,36.32
accept Plundering the Plunderers##2381 |goto The Barrens 63.07,36.32
step
talk Wrenix's Gizmotronic Apparatus##7166
Tell it _"Give me what I need stupid machine!"_
collect Thieves' Tools##5060 |goto 63.12,36.32 |q 2381 |or
|tip Save the Thieves' Tools you get.
|tip You must keep Thieves' Tools in your bags to be able to pick locks.
collect E.C.A.C.##7970 |goto 63.12,36.32 |q 2381 |or
step
Follow the path |goto 62.08,38.81 < 10 |only if walking
Continue following the path |goto 62.75,39.86 < 15 |only if walking
Jump onto the front of the ship |goto 64.18,45.49 < 7 |only if walking
click Buccaneer's Strongbox##123330+
|tip They look like small grey metal chests on the ground around this area.
|tip Downstairs inside the ship, on the middle level.
Reach Skill 100 in Lockpicking |skill Lockpicking,100 |goto 65.06,45.43
step
click The Jewel of the Southsea##123462
|tip Downstairs inside the ship, on the bottom level.
|tip Polly, a high level parrot will appear and attack you.
use E.C.A.C.##7970
|tip Use it on Polly.
|tip It will become weaker.
kill Polly##7167
collect Southsea Treasure##7968 |q 2381/1 |goto 64.95,45.44 |or
step
Follow the path |goto 63.21,42.64 < 20 |only if walking
talk Wrenix the Wretched##7161
turnin Plundering the Plunderers##2381 |goto 63.07,36.32
step
Reach Level 30 |ding 30
|tip You are able to gain 5 levels of Lockpicking for each level your character gains.
|tip You need to be at least level 30 to reach level 150 Lockpicking in a few steps.
|tip Use the leveling guides to accomplish this.
step
map Ashenvale
path	follow smart;	loop on;	ants curved;	dist 30
path	11.90,30.15	12.87,31.05	13.79,30.52	15.42,28.31	15.15,25.13
path	15.82,19.58	15.51,16.55	13.56,14.91	11.15,13.42	12.00,15.83
path	13.22,16.26	14.17,16.22	15.09,17.10	14.04,19.81	14.75,21.67
path	14.41,23.32	13.04,24.29	12.29,25.73	11.68,25.84	11.48,26.97
path	11.75,28.81
click Waterlogged Footlocker##179487+
|tip They look like small yellow and brown wooden chests on the ground around this area.
Reach Skill 150 in Lockpicking |skill Lockpicking,150
step
Reach Level 40 |ding 40
|tip You are able to gain 5 levels of Lockpicking for each level your character gains.
|tip You need to be at least level 40 to reach level 200 Lockpicking in a few steps.
|tip Use the leveling guides to accomplish this.
step
Enter the building |goto Badlands 43.03,30.08 < 20 |walk
Run up the stairs |goto Badlands 39.62,27.22 < 5 |c
'|complete skill("Lockpicking") >= 200 |or
step
click Battered Footlocker##179490+
|tip They look like small wooden chests upstairs inside the building.
Reach Skill 175 in Lockpicking |skill Lockpicking,175 |goto 40.49,28.01
You can find more at: |notinsticky
[41.29,29.31]
[41.44,29.95]
[41.37,26.17]
step
Jump down and follow the path |goto 42.29,27.96 < 5 |walk
Run down the stairs |goto 42.17,26.73 < 5 |c |walk
'|complete skill("Lockpicking") >= 200 |or
step
click Dented Footlocker##179492+
|tip They look like small wooden chests downstairs inside the building.
Reach Skill 200 in Lockpicking |skill Lockpicking,200 |goto 41.08,27.42
You can find more at: |notinsticky
[40.73,28.07]
[40.81,28.68]
[42.30,28.40]
step
Reach Level 50 |ding 50
|tip You are able to gain 5 levels of Lockpicking for each level your character gains.
|tip You need to be at least level 50 to reach level 250 Lockpicking in a few steps.
|tip Use the leveling guides to accomplish this.
step
Follow the path down |goto Searing Gorge 63.41,38.52 < 10 |only if walking
Run up the ramp |goto Searing Gorge 46.75,53.52 < 15 |only if walking
Enter the cave |goto Searing Gorge 41.38,53.89 < 7 |c
'|complete skill("Lockpicking") >= 250 |or
step
click Dented Footlocker##179492+
|tip They look like small wooden chests on the ground around this area inside the cave, in the lower section.
|tip You can also try to pickpocket enemies around this area to get Sturdy Junkboxes to unlock.
Reach Skill 225 in Lockpicking |skill Lockpicking,225 |goto Searing Gorge 38.44,50.83
You can find more at: |notinsticky
[Searing Gorge 38.00,45.87]
Through the Quarry Gate at [Searing Gorge 37.82,44.31]
[Searing Gorge 40.40,38.18]
[Searing Gorge 40.73,31.16]
[Searing Gorge 42.28,29.47]
[Searing Gorge 39.07,24.44]
step
Run up the ramp |goto 44.22,24.36 < 7 |walk
Follow the path |goto 42.47,30.78 < 7 |c
'|complete skill("Lockpicking") >= 250 |or
step
click Dented Footlocker##179492+
|tip They look like small wooden chests on the ground around this area inside the cave, in the upper section.
|tip You can also try to pickpocket enemies around this area to get Sturdy Junkboxes to unlock.
Reach Skill 250 in Lockpicking |skill Lockpicking,250 |goto 42.90,31.18
You can find more around: |notinsticky
[43.93,30.88]
[45.77,28.35]
[46.88,25.68]
step
Reach Level 60 |ding 60
|tip You are able to gain 5 levels of Lockpicking for each level your character gains.
|tip You need to be at least level 60 to reach level 300 Lockpicking in a few steps.
|tip Use the leveling guides to accomplish this.
step
Follow the path up |goto Searing Gorge 33.53,75.22 < 20 |only if walking
Enter Blackrock Mountain |goto Searing Gorge 34.76,83.98
|tip The waypoint arrow will stop working after you enter the doors.
|tip Once you enter through the huge doors, take the first left you come to.
|tip Walk up onto the large chain and follow it to the island in the middle of the lava.
|tip Run down the stairs and follow the path to another large chain.
|tip Walk across the large chain and follow the path into the Grinding Quarry.
|tip Once in the Grinding Quarry, follow the path northwest through the tunnel to find the dungeon portal entrance.
Click Here After Entering the Blackrock Depths Dungeon |confirm
'|complete skill("Lockpicking") >= 300 |or
step
_Inside the Blackrock Depths Dungeon:_
|tip Pick the following locks inside the dungon.
|tip You can also pickpocket enemies inside the dungeon to get Strong Junkboxes and Heavy Junkboxes to unlock.
|tip
|tip Lock #1: Once inside the dungeon, immediately turn left, pick the locked door and walk through it.
|tip Lock #2: Up ahead, on the right, pick the locked door and walk through it.
|tip Lock #3: Up ahead, on the left, pick the locked door and walk through it.
|tip Lock #4: Straight ahead, under the huge gear, pick the Shadowforge Lock.
|tip
|tip After you pick these 4 locks, leave the dungeon the way you came.
|tip Outside the dungeon portal, right-click your player portrait.
|tip Select "Reset all instances" and re-enter the dungeon to repeat this process.
Reach Skill 300 in Lockpicking |skill Lockpicking,300
]])
ZygorGuidesViewer:RegisterGuide("Profession Guides\\Mining\\Mining (1-375)",{
author="support@zygorguides.com",
condition_suggested=function() return skill("Mining") > 0 and skill("Mining") < 375 end,
description="This guide will walk you through leveling your Mining skill from 1-375.",
},[[
step
Reach Level 5 |ding 5
|tip You must be at least level 5 before you can learn professions.
|tip Use the leveling guides to accomplish this.
step
Enter the building |goto Orgrimmar/0 72.94,27.48 < 7 |walk
talk Makaru##3357
|tip Inside the building.
Train Apprentice Miner |skillmax Mining,75 |goto Orgrimmar/0 73.12,26.08
step
talk Gorina##3358
|tip Inside the building.
buy Mining Pick##2901 |goto 73.31,26.60
|tip You must have a Mining Pick in your bags to be able to gather ore.
step
map Durotar
path	follow smart;	loop on;	ants curved;	dist 30
path	50.96,17.00	52.99,18.09	54.60,19.05	55.40,21.06	55.71,23.38
path	56.28,25.33	55.89,27.78	54.64,27.62	55.10,30.09	58.12,29.94
path	55.62,32.75	55.97,36.63	55.71,40.53	57.32,42.00	59.26,41.50
path	57.59,43.98	55.27,48.14	50.81,48.20	48.51,43.33	47.83,39.78
path	46.87,34.69	45.55,32.24	45.61,27.19	46.52,23.35	48.07,21.59
path	49.70,21.37	49.54,18.59
Reach Skill 65 in Mining |skill Mining,65
|tip Click ore as you follow the path around this area.
|tip Track them on your minimap with "Find Minerals".
|tip You can smelt Copper Ore from skill level 1-47 for additional points.
step
Reach Level 10 |ding 10
|tip You must be at least level 10 to train Journeyman professions.
|tip Use the leveling guides to accomplish this.
step
Enter the building |goto Orgrimmar/0 72.94,27.48 < 7 |walk
talk Makaru##3357
|tip Inside the building.
Train Journeyman Miner |skillmax Mining,150 |goto Orgrimmar/0 73.12,26.08
step
map The Barrens
path	follow smart;	loop on;	ants curved;	dist 30
path	59.10,40.30	60.19,40.99	61.84,40.54	62.14,43.04	62.65,46.75
path	61.30,50.02	60.46,50.11	58.76,50.43	56.82,51.16	55.42,52.22
path	53.50,52.61	53.16,56.18	51.94,57.54	50.38,58.57	49.34,61.86
path	47.74,65.34	49.23,69.53	48.13,71.47	48.25,74.69	49.98,75.97
path	49.97,78.84	48.59,80.24	48.26,82.33	46.66,83.76	46.10,86.08
path	44.27,84.64	42.70,82.63	41.20,79.51	44.09,78.36	43.80,75.03
path	43.88,73.08	42.35,72.24	41.90,68.97	43.39,69.35	45.54,68.99
path	45.03,65.70	43.83,62.98	43.15,60.77	43.09,56.64	43.61,52.80
path	41.37,48.89	42.58,47.61	41.37,44.96	43.42,44.79	43.15,42.53
path	43.28,39.61	42.28,38.89	41.58,37.21	42.55,35.50	42.04,33.21
path	45.13,32.85	46.58,30.52	46.71,28.37	48.20,28.72	49.48,31.40
path	50.44,34.37	52.43,34.60	56.90,37.50	58.56,39.33
Reach Skill 125 in Mining |skill Mining,125
|tip Click ore as you follow the path around this area.
|tip Track them on your minimap with "Find Minerals".
|tip You can smelt Bronze Bars with leftover Tin and Copper Bars from skill level 65-90 for additional points.
|tip You can smelt Silver Ore from skill level 75-112 for additional points.
step
Reach Level 20 |ding 20
|tip You must be at least level 20 to train Expert professions.
|tip Use the leveling guides to accomplish this.
step
Enter the building |goto Orgrimmar/0 72.94,27.48 < 7 |walk
talk Makaru##3357
|tip Inside the building.
Train Expert Miner |skillmax Mining,225 |goto Orgrimmar/0 73.12,26.08
step
map Arathi Highlands
path	follow smart;	loop on;	ants curved;	dist 30
path	78.66,36.13	77.36,41.29	75.00,44.93	72.65,48.07	70.58,55.05
path	69.99,58.40	72.92,59.03	72.28,63.63	72.78,66.86	71.75,66.15
path	69.15,72.54	67.17,70.90	63.52,73.55	59.48,74.71	59.32,70.74
path	56.16,71.89	50.82,78.41	47.96,82.44	42.53,80.75	43.02,77.16
path	40.39,71.86	37.95,67.63	38.52,68.50	33.94,66.02	34.59,61.64
path	33.70,56.77	33.45,53.94	33.65,50.19	35.00,47.28	32.96,46.68
path	31.68,45.41	32.34,42.64	31.42,41.24	25.23,43.10	20.94,39.12
path	20.02,35.80	19.12,33.36	22.43,31.28	23.48,24.90	26.93,20.65
path	28.65,14.18	28.96,16.96	31.62,18.63	30.96,20.36	33.19,21.23
path	36.35,24.61	39.97,25.62	40.21,28.79	43.97,30.51	45.70,33.02
path	48.08,33.60	49.78,36.76	52.14,36.11	52.75,31.99	54.80,33.13
path	58.19,32.50	58.02,34.22	59.94,35.97	62.25,32.06	64.69,35.58
path	64.49,26.56	66.77,27.64	70.39,27.07	70.47,30.74	72.89,30.09
path	76.73,29.48	76.70,33.68	79.56,35.45
Reach Skill 175 in Mining |skill Mining,175
|tip Click ore as you follow the path around this area.
|tip Track them on your minimap with "Find Minerals".
|tip You can smelt Iron Ore from skill level 125-135 for additional points.
|tip You can smelt Gold Ore from skill level 155-184 for additional points.
step
map Badlands
path	follow smart;	loop on;	ants curved;	dist 30
path	26.84,74.76	25.28,78.53	19.71,81.32	14.75,83.82	12.50,85.54
path	7.98,80.56	6.30,74.40	8.68,67.97	17.19,68.54	15.13,72.43
path	17.19,77.39	21.25,75.06	25.11,72.08
Reach Skill 200 in Mining |skill Mining,200
|tip Click ore as you follow the path around this area.
|tip Track them on your minimap with "Find Minerals".
|tip You can smelt Gold Ore from skill level 155-184 for additional points.
step
Reach Level 35 |ding 35
|tip You must be at least level 35 to train Artisan professions.
|tip Use the leveling guides to accomplish this.
step
Enter the building |goto Orgrimmar/0 72.94,27.48 < 7 |walk
talk Makaru##3357
|tip Inside the building.
Train Artisan Miner |skillmax Mining,300 |goto Orgrimmar/0 73.12,26.08
step
map Badlands
path	follow smart;	loop on;	ants curved;	dist 30
path	26.84,74.76	25.28,78.53	19.71,81.32	14.75,83.82	12.50,85.54
path	7.98,80.56	6.30,74.40	8.68,67.97	17.19,68.54	15.13,72.43
path	17.19,77.39	21.25,75.06	25.11,72.08
Reach Skill 250 in Mining |skill Mining,250
|tip Click ore as you follow the path around this area.
|tip Track them on your minimap with "Find Minerals".
step
map Un'Goro Crater
path	follow smart;	loop on;	ants curved;	dist 30
path	66.46,78.95	64.56,79.71	61.79,84.21	59.34,84.18	57.63,86.04
path	54.50,86.69	51.13,86.82	48.27,87.30	45.98,86.58	42.89,85.00
path	40.79,83.52	37.91,83.14	36.77,80.17	33.58,79.05	30.40,79.61
path	28.89,76.98	28.97,71.52	26.00,67.67	25.93,63.53	24.59,58.51
path	23.95,53.04	24.40,48.21	23.89,44.76	24.71,41.12	26.26,36.59
path	26.62,31.21	28.29,29.47	29.59,25.66	29.89,20.92	33.32,20.67
path	36.29,20.47	38.67,16.00	41.73,15.77	43.32,14.12	46.94,13.03
path	49.79,13.83	52.84,12.88	56.31,14.04	59.61,16.58	62.25,16.02
path	64.19,19.90	65.99,21.01	68.51,20.26	71.19,20.89	71.21,23.75
path	71.75,28.19	74.76,32.46	75.06,37.15	76.32,43.15	76.67,48.32
path	77.05,53.09	76.56,57.02	75.35,61.97	74.66,68.05	72.92,70.46
path	71.39,73.80	71.00,79.21	68.32,79.90
Reach Skill 300 in Mining |skill Mining,300
|tip Click ore as you follow the path around this area.
|tip Track them on your minimap with "Find Minerals".
step
Reach Level 50 |ding 50
|tip You must be at least level 50 to train Master professions.
|tip Use the leveling guides to accomplish this.
step
Enter the building |goto Orgrimmar/0 72.94,27.48 < 7 |walk
talk Gorina##3358
|tip Inside the building.
buy Mining Pick##2901 |goto 73.31,26.60
|tip You must have a Mining Pick in your bags to be able to gather ore.
step
talk Krugosh##18747
Learn Master Mining |skillmax Mining,375 |goto Hellfire Peninsula/0 55.44,37.59
step
map Hellfire Peninsula/0
path follow smart; loop on; ants curved; dist 30
path	65.97,48.02	69.02,46.87	70.80,50.94	70.25,54.41	70.27,59.32
path	72.23,60.13	74.08,63.37	76.97,62.92	78.97,66.32	78.85,70.21
path	79.70,74.48	80.75,77.99	77.91,75.80	77.13,73.33	76.82,69.54
path	75.53,67.17	71.66,67.33	69.41,67.29	68.38,60.74	65.36,60.83
path	65.69,64.45	63.25,69.06	62.72,72.99	62.49,79.96	58.89,76.64
path	57.05,73.97	57.06,81.30	56.40,82.14	55.54,83.79	52.24,83.83
path	49.82,83.52	46.85,84.82	42.98,79.36	42.26,76.62	44.54,73.42
path	47.44,71.34	50.85,69.85	47.41,66.63	44.75,68.48	45.62,61.55
path	47.89,59.49	49.89,56.45	49.95,61.42	51.38,61.68	52.93,58.38
path	55.41,56.25	56.22,53.50	58.62,52.98	62.69,50.44
Reach Skill 325 in Mining |skill Mining,325
|tip Click ore as you follow the path around this area.
|tip Track them on your minimap with "Find Minerals".
step
map Terokkar Forest/0
path follow smart; loop on; ants curved; dist 30
path	35.40,32.74	33.58,34.03	29.99,37.04	30.47,39.42	32.84,42.87
path	30.44,45.85	29.70,48.78	28.72,50.90	26.87,53.21	25.26,54.90
path	22.49,56.46	19.34,61.21	18.69,64.00	16.44,70.63	17.61,76.00
path	18.15,78.38	22.26,77.14	25.28,77.55	26.12,74.18	26.50,71.57
path	25.34,67.90	26.92,64.72	29.12,65.04	30.87,68.34	29.75,76.55
path	31.88,79.19	34.91,78.98	39.83,81.85	44.04,81.54	46.83,80.38
path	49.20,79.14	53.35,76.87	54.01,72.24	54.28,68.65	55.01,65.28
path	55.48,59.55	53.36,55.57	50.80,57.73	45.51,49.16	42.88,47.33
path	40.15,46.05	38.17,43.37	36.85,41.76	36.79,39.20	38.01,36.66
path	41.76,36.07	44.39,34.92	46.83,35.38	49.86,36.73	53.65,33.89
path	57.14,33.39	55.14,40.09	56.82,44.38	58.56,48.62	59.64,51.65
path	61.28,51.80	62.93,51.53	68.24,52.26	70.55,50.49	72.12,46.95
path	71.97,42.17	73.79,38.31	74.41,36.29	74.10,34.91	73.22,32.72
path	70.82,30.89	67.47,30.75	65.28,30.03	62.62,26.46	60.72,23.08
path	57.70,22.89	55.83,24.97	53.00,24.89	51.03,23.50	50.19,20.50
path	51.97,16.80	50.62,15.37	47.54,12.14	45.79,11.52	42.95,8.83
path	42.59,15.18	43.28,17.66	41.87,20.90	42.92,23.48	37.45,31.00
Reach Skill 350 in Mining |skill Mining,350
|tip Click ore as you follow the path around this area.
|tip Track them on your minimap with "Find Minerals".
step
map Nagrand/0
path follow smart; loop on; ants curved; dist 30
path	23.03,54.38	25.66,56.17	27.78,59.66	28.97,63.86	29.39,68.96
path	28.60,72.26	28.38,76.04	29.37,79.52	31.84,80.64	35.76,81.91
path	38.66,82.53	41.39,82.08	42.32,78.93	44.21,77.72	46.77,77.25
path	48.80,77.89	50.60,79.08	52.79,80.43	55.35,80.45	57.66,79.43
path	59.67,79.87	61.78,80.22	63.10,78.04	61.50,74.24	60.07,71.40
path	58.21,67.30	56.38,66.12	55.81,62.92	55.80,59.35	55.91,56.41
path	53.97,55.67	51.60,54.83	49.35,54.70	48.34,56.31	46.31,52.84
path	44.76,48.93	44.93,44.85	44.17,41.32	42.03,37.80	40.94,34.11
path	40.52,29.96	38.57,27.00	35.52,23.03	31.65,21.23	28.90,20.10
path	26.95,20.42	25.43,24.53	24.85,26.68	23.88,30.30	21.46,32.74
path	18.92,33.25	16.50,34.01	14.02,35.11	11.60,37.40	9.18,39.21
path	7.43,41.55	7.97,45.14	9.64,44.27	12.78,42.19	13.85,43.23
Reach Skill 375 in Mining |skill Mining,375
|tip Click ore as you follow the path around this area.
|tip Track them on your minimap with "Find Minerals".
]])
ZygorGuidesViewer:RegisterGuide("Profession Guides\\Mining\\Farming Guides\\Copper Ore",{
author="support@zygorguides.com",
},[[
step
map Durotar
path follow smart; loop on; ants curved; dist 20
path	50.96,17.00	52.99,18.09	54.60,19.05	55.40,21.06	55.71,23.38
path	56.28,25.33	55.89,27.78	54.64,27.62	55.10,30.09	58.12,29.94
path	55.62,32.75	55.97,36.63	55.71,40.53	57.32,42.00	59.26,41.50
path	57.59,43.98	55.27,48.14	50.81,48.20	48.51,43.33	47.83,39.78
path	46.87,34.69	45.55,32.24	45.61,27.19	46.52,23.35	48.07,21.59
path	49.70,21.37	49.54,18.59
Click ore as you follow the path around this area
|tip Track them on your minimap with "Find Minerals".
collect Copper Ore##2770 |n
]])
ZygorGuidesViewer:RegisterGuide("Profession Guides\\Mining\\Farming Guides\\Rough Stone",{
author="support@zygorguides.com",
},[[
step
map Durotar
path follow smart; loop on; ants curved; dist 20
path	50.96,17.00	52.99,18.09	54.60,19.05	55.40,21.06	55.71,23.38
path	56.28,25.33	55.89,27.78	54.64,27.62	55.10,30.09	58.12,29.94
path	55.62,32.75	55.97,36.63	55.71,40.53	57.32,42.00	59.26,41.50
path	57.59,43.98	55.27,48.14	50.81,48.20	48.51,43.33	47.83,39.78
path	46.87,34.69	45.55,32.24	45.61,27.19	46.52,23.35	48.07,21.59
path	49.70,21.37	49.54,18.59
Click ore as you follow the path around this area
|tip Track them on your minimap with "Find Minerals".
collect Rough Stone##2835 |n
]])
ZygorGuidesViewer:RegisterGuide("Profession Guides\\Mining\\Farming Guides\\Tin Ore",{
author="support@zygorguides.com",
},[[
step
map The Barrens
path follow smart; loop on; ants curved; dist 20
path	59.10,40.30	60.19,40.99	61.84,40.54	62.14,43.04	62.65,46.75
path	61.30,50.02	60.46,50.11	58.76,50.43	56.82,51.16	55.42,52.22
path	53.50,52.61	53.16,56.18	51.94,57.54	50.38,58.57	49.34,61.86
path	47.74,65.34	49.23,69.53	48.13,71.47	48.25,74.69	49.98,75.97
path	49.97,78.84	48.59,80.24	48.26,82.33	46.66,83.76	46.10,86.08
path	44.27,84.64	42.70,82.63	41.20,79.51	44.09,78.36	43.80,75.03
path	43.88,73.08	42.35,72.24	41.90,68.97	43.39,69.35	45.54,68.99
path	45.03,65.70	43.83,62.98	43.15,60.77	43.09,56.64	43.61,52.80
path	41.37,48.89	42.58,47.61	41.37,44.96	43.42,44.79	43.15,42.53
path	43.28,39.61	42.28,38.89	41.58,37.21	42.55,35.50	42.04,33.21
path	45.13,32.85	46.58,30.52	46.71,28.37	48.20,28.72	49.48,31.40
path	50.44,34.37	52.43,34.60	56.90,37.50	58.56,39.33
Click ore as you follow the path around this area
|tip Track them on your minimap with "Find Minerals".
|tip You will need level 65 Mining to collect these.
collect Tin Ore##2771 |n
]])
ZygorGuidesViewer:RegisterGuide("Profession Guides\\Mining\\Farming Guides\\Coarse Stone",{
author="support@zygorguides.com",
},[[
step
map The Barrens
path follow smart; loop on; ants curved; dist 20
path	59.10,40.30	60.19,40.99	61.84,40.54	62.14,43.04	62.65,46.75
path	61.30,50.02	60.46,50.11	58.76,50.43	56.82,51.16	55.42,52.22
path	53.50,52.61	53.16,56.18	51.94,57.54	50.38,58.57	49.34,61.86
path	47.74,65.34	49.23,69.53	48.13,71.47	48.25,74.69	49.98,75.97
path	49.97,78.84	48.59,80.24	48.26,82.33	46.66,83.76	46.10,86.08
path	44.27,84.64	42.70,82.63	41.20,79.51	44.09,78.36	43.80,75.03
path	43.88,73.08	42.35,72.24	41.90,68.97	43.39,69.35	45.54,68.99
path	45.03,65.70	43.83,62.98	43.15,60.77	43.09,56.64	43.61,52.80
path	41.37,48.89	42.58,47.61	41.37,44.96	43.42,44.79	43.15,42.53
path	43.28,39.61	42.28,38.89	41.58,37.21	42.55,35.50	42.04,33.21
path	45.13,32.85	46.58,30.52	46.71,28.37	48.20,28.72	49.48,31.40
path	50.44,34.37	52.43,34.60	56.90,37.50	58.56,39.33
Click ore as you follow the path around this area
|tip Track them on your minimap with "Find Minerals".
|tip You will need level 65 Mining to collect these.
collect Coarse Stone##2836 |n
]])
ZygorGuidesViewer:RegisterGuide("Profession Guides\\Mining\\Farming Guides\\Silver Ore",{
author="support@zygorguides.com",
},[[
step
map The Barrens
path follow smart; loop on; ants curved; dist 20
path	59.10,40.30	60.19,40.99	61.84,40.54	62.14,43.04	62.65,46.75
path	61.30,50.02	60.46,50.11	58.76,50.43	56.82,51.16	55.42,52.22
path	53.50,52.61	53.16,56.18	51.94,57.54	50.38,58.57	49.34,61.86
path	47.74,65.34	49.23,69.53	48.13,71.47	48.25,74.69	49.98,75.97
path	49.97,78.84	48.59,80.24	48.26,82.33	46.66,83.76	46.10,86.08
path	44.27,84.64	42.70,82.63	41.20,79.51	44.09,78.36	43.80,75.03
path	43.88,73.08	42.35,72.24	41.90,68.97	43.39,69.35	45.54,68.99
path	45.03,65.70	43.83,62.98	43.15,60.77	43.09,56.64	43.61,52.80
path	41.37,48.89	42.58,47.61	41.37,44.96	43.42,44.79	43.15,42.53
path	43.28,39.61	42.28,38.89	41.58,37.21	42.55,35.50	42.04,33.21
path	45.13,32.85	46.58,30.52	46.71,28.37	48.20,28.72	49.48,31.40
path	50.44,34.37	52.43,34.60	56.90,37.50	58.56,39.33
Click ore as you follow the path around this area
|tip Track them on your minimap with "Find Minerals".
|tip You will need level 75 Mining to collect these.
collect Silver Ore##2775 |n
]])
ZygorGuidesViewer:RegisterGuide("Profession Guides\\Mining\\Farming Guides\\Moss Agate",{
author="support@zygorguides.com",
},[[
step
map The Barrens
path follow smart; loop on; ants curved; dist 20
path	59.10,40.30	60.19,40.99	61.84,40.54	62.14,43.04	62.65,46.75
path	61.30,50.02	60.46,50.11	58.76,50.43	56.82,51.16	55.42,52.22
path	53.50,52.61	53.16,56.18	51.94,57.54	50.38,58.57	49.34,61.86
path	47.74,65.34	49.23,69.53	48.13,71.47	48.25,74.69	49.98,75.97
path	49.97,78.84	48.59,80.24	48.26,82.33	46.66,83.76	46.10,86.08
path	44.27,84.64	42.70,82.63	41.20,79.51	44.09,78.36	43.80,75.03
path	43.88,73.08	42.35,72.24	41.90,68.97	43.39,69.35	45.54,68.99
path	45.03,65.70	43.83,62.98	43.15,60.77	43.09,56.64	43.61,52.80
path	41.37,48.89	42.58,47.61	41.37,44.96	43.42,44.79	43.15,42.53
path	43.28,39.61	42.28,38.89	41.58,37.21	42.55,35.50	42.04,33.21
path	45.13,32.85	46.58,30.52	46.71,28.37	48.20,28.72	49.48,31.40
path	50.44,34.37	52.43,34.60	56.90,37.50	58.56,39.33
Click ore as you follow the path around this area
|tip Track them on your minimap with "Find Minerals".
|tip You will need level 65 Mining to collect Tin Ore nodes and 75 to collect Silver Ore nodes.
collect Moss Agate##1206 |n
|tip These are a rare drop from Tin and Silver Ore nodes.
]])
ZygorGuidesViewer:RegisterGuide("Profession Guides\\Mining\\Farming Guides\\Iron Ore",{
author="support@zygorguides.com",
},[[
step
map Arathi Highlands
path follow smart; loop on; ants curved; dist 20
path	78.66,36.13	77.36,41.29	75.00,44.93	72.65,48.07	70.58,55.05
path	69.99,58.40	72.92,59.03	72.28,63.63	72.78,66.86	71.75,66.15
path	69.15,72.54	67.17,70.90	63.52,73.55	59.48,74.71	59.32,70.74
path	56.16,71.89	50.82,78.41	47.96,82.44	42.53,80.75	43.02,77.16
path	40.39,71.86	37.95,67.63	38.52,68.50	33.94,66.02	34.59,61.64
path	33.70,56.77	33.45,53.94	33.65,50.19	35.00,47.28	32.96,46.68
path	31.68,45.41	32.34,42.64	31.42,41.24	25.23,43.10	20.94,39.12
path	20.02,35.80	19.12,33.36	22.43,31.28	23.48,24.90	26.93,20.65
path	28.65,14.18	28.96,16.96	31.62,18.63	30.96,20.36	33.19,21.23
path	36.35,24.61	39.97,25.62	40.21,28.79	43.97,30.51	45.70,33.02
path	48.08,33.60	49.78,36.76	52.14,36.11	52.75,31.99	54.80,33.13
path	58.19,32.50	58.02,34.22	59.94,35.97	62.25,32.06	64.69,35.58
path	64.49,26.56	66.77,27.64	70.39,27.07	70.47,30.74	72.89,30.09
path	76.73,29.48	76.70,33.68	79.56,35.45
Click ore as you follow the path around this area
|tip Track them on your minimap with "Find Minerals".
|tip You will need level 125 Mining to collect these.
collect Iron Ore##2772 |n
]])
ZygorGuidesViewer:RegisterGuide("Profession Guides\\Mining\\Farming Guides\\Heavy Stone",{
author="support@zygorguides.com",
},[[
step
map Arathi Highlands
path follow smart; loop on; ants curved; dist 20
path	78.66,36.13	77.36,41.29	75.00,44.93	72.65,48.07	70.58,55.05
path	69.99,58.40	72.92,59.03	72.28,63.63	72.78,66.86	71.75,66.15
path	69.15,72.54	67.17,70.90	63.52,73.55	59.48,74.71	59.32,70.74
path	56.16,71.89	50.82,78.41	47.96,82.44	42.53,80.75	43.02,77.16
path	40.39,71.86	37.95,67.63	38.52,68.50	33.94,66.02	34.59,61.64
path	33.70,56.77	33.45,53.94	33.65,50.19	35.00,47.28	32.96,46.68
path	31.68,45.41	32.34,42.64	31.42,41.24	25.23,43.10	20.94,39.12
path	20.02,35.80	19.12,33.36	22.43,31.28	23.48,24.90	26.93,20.65
path	28.65,14.18	28.96,16.96	31.62,18.63	30.96,20.36	33.19,21.23
path	36.35,24.61	39.97,25.62	40.21,28.79	43.97,30.51	45.70,33.02
path	48.08,33.60	49.78,36.76	52.14,36.11	52.75,31.99	54.80,33.13
path	58.19,32.50	58.02,34.22	59.94,35.97	62.25,32.06	64.69,35.58
path	64.49,26.56	66.77,27.64	70.39,27.07	70.47,30.74	72.89,30.09
path	76.73,29.48	76.70,33.68	79.56,35.45
Click ore as you follow the path around this area
|tip Track them on your minimap with "Find Minerals".
|tip You will need level 125 Mining to collect these.
collect Heavy Stone##2838 |n
]])
ZygorGuidesViewer:RegisterGuide("Profession Guides\\Mining\\Farming Guides\\Gold Ore",{
author="support@zygorguides.com",
},[[
step
map Arathi Highlands
path follow smart; loop on; ants curved; dist 20
path	78.66,36.13	77.36,41.29	75.00,44.93	72.65,48.07	70.58,55.05
path	69.99,58.40	72.92,59.03	72.28,63.63	72.78,66.86	71.75,66.15
path	69.15,72.54	67.17,70.90	63.52,73.55	59.48,74.71	59.32,70.74
path	56.16,71.89	50.82,78.41	47.96,82.44	42.53,80.75	43.02,77.16
path	40.39,71.86	37.95,67.63	38.52,68.50	33.94,66.02	34.59,61.64
path	33.70,56.77	33.45,53.94	33.65,50.19	35.00,47.28	32.96,46.68
path	31.68,45.41	32.34,42.64	31.42,41.24	25.23,43.10	20.94,39.12
path	20.02,35.80	19.12,33.36	22.43,31.28	23.48,24.90	26.93,20.65
path	28.65,14.18	28.96,16.96	31.62,18.63	30.96,20.36	33.19,21.23
path	36.35,24.61	39.97,25.62	40.21,28.79	43.97,30.51	45.70,33.02
path	48.08,33.60	49.78,36.76	52.14,36.11	52.75,31.99	54.80,33.13
path	58.19,32.50	58.02,34.22	59.94,35.97	62.25,32.06	64.69,35.58
path	64.49,26.56	66.77,27.64	70.39,27.07	70.47,30.74	72.89,30.09
path	76.73,29.48	76.70,33.68	79.56,35.45
Click ore as you follow the path around this area
|tip Track them on your minimap with "Find Minerals".
|tip You will need level 155 Mining to collect these.
collect Gold Ore##2776 |n
]])
ZygorGuidesViewer:RegisterGuide("Profession Guides\\Mining\\Farming Guides\\Mithril Ore",{
author="support@zygorguides.com",
},[[
step
label "Begin_Farming_Mithril_Ore"
map The Hinterlands/0
path follow smart; loop off; ants curved; dist 30
path	22.32,54.98	23.55,51.83	26.37,53.38	28.56,52.55	31.62,51.82
path	32.90,49.43	32.52,45.27	33.35,42.82	37.00,44.27	38.68,49.34
path	40.06,46.12	41.79,45.36	43.39,45.31	45.26,44.46	48.22,42.83
path	50.09,45.81	52.30,43.80	54.20,41.70	55.89,38.55	57.58,38.26
path	59.27,40.29	61.27,40.65	64.16,42.61	64.42,45.56	65.99,50.86
path	67.14,51.59	68.90,51.63	71.46,50.92	77.39,49.20	78.12,50.19
path	77.31,51.56	75.77,54.07	74.39,56.04	72.26,60.38	72.06,64.08
path	71.87,65.66	70.00,63.83	67.35,62.94	64.88,62.27	63.77,62.36
path	63.02,60.36	62.46,58.05	60.95,56.00	59.95,54.56	58.25,51.61
path	57.52,50.17	56.53,51.66	55.04,53.13	53.74,54.42	53.21,56.28
path	52.25,58.96	51.38,63.60	51.49,67.71	49.89,70.12	48.81,71.36
path	47.41,70.20	44.61,70.37	43.56,68.65	42.90,67.26	42.47,62.95
path	41.38,61.30	40.46,62.25	38.34,63.41	35.95,62.96	35.91,65.38
path	36.03,67.84	35.26,70.66	35.50,72.88	35.79,74.04	33.83,74.25
path	32.47,73.37	30.82,71.94	31.27,70.10	32.37,70.01	33.90,68.55
click Mithril Deposit##2040+
|tip They look like gray rocks with large white crystals along the path.
|tip Track them on your minimap with "Find Minerals".
|tip You will need level 175 Mining to collect these.
collect Mithril Ore##3858 |n
'|goto 33.90,68.55 < 30 |c |noway
step
map The Hinterlands/0
path follow smart; loop off; ants curved; dist 30
path	35.45,66.69	35.69,63.65	33.97,60.80	33.10,57.98	31.77,55.79
path	30.30,55.75	29.53,55.60	28.77,56.41	27.40,58.19	27.70,60.14
path	27.42,68.06	26.09,66.01	25.62,63.37	24.61,58.76	23.02,56.86
path	21.44,56.49
click Mithril Deposit##2040+
|tip They look like gray rocks with large white crystals along the path.
|tip Track them on your minimap with "Find Minerals".
|tip You will need level 175 Mining to collect these.
collect Mithril Ore##3858 |n
'|goto 21.44,56.49 < 30 |c |noway |next "Begin_Farming_Mithril_Ore"
]])
ZygorGuidesViewer:RegisterGuide("Profession Guides\\Mining\\Farming Guides\\Solid Stone",{
author="support@zygorguides.com",
},[[
step
map Badlands
path follow smart; loop on; ants curved; dist 20
path	26.84,74.76	25.28,78.53	19.71,81.32	14.75,83.82	12.50,85.54
path	7.98,80.56	6.30,74.40	8.68,67.97	17.19,68.54	15.13,72.43
path	17.19,77.39	21.25,75.06	25.11,72.08
Click ore as you follow the path around this area
|tip Track them on your minimap with "Find Minerals".
|tip You will need level 175 Mining to collect these.
collect Solid Stone##7912 |n
]])
ZygorGuidesViewer:RegisterGuide("Profession Guides\\Mining\\Farming Guides\\Truesilver Ore",{
author="support@zygorguides.com",
},[[
step
map Badlands
path follow smart; loop on; ants curved; dist 20
path	26.84,74.76	25.28,78.53	19.71,81.32	14.75,83.82	12.50,85.54
path	7.98,80.56	6.30,74.40	8.68,67.97	17.19,68.54	15.13,72.43
path	17.19,77.39	21.25,75.06	25.11,72.08
Click ore as you follow the path around this area
|tip Track them on your minimap with "Find Minerals".
|tip You will need level 230 Mining to collect these.
collect Truesilver Ore##7911 |n
]])
ZygorGuidesViewer:RegisterGuide("Profession Guides\\Mining\\Farming Guides\\Dark Iron Ore",{
author="support@zygorguides.com",
},[[
step
map Burning Steppes
path follow smart; loop on; ants curved; dist 20
path	47.24,33.58	57.79,36.68	60.09,40.49	60.24,30.28	62.87,24.54
path	64.47,23.32	65.45,24.20	64.95,33.28	71.55,39.13	79.50,25.16
path	93.16,52.72	85.24,62.18	74.63,61.27	74.12,55.90	68.15,59.00
path	64.92,57.85	62.02,54.94	47.51,59.50	43.25,60.21
Click ore as you follow the path around this area
|tip Track them on your minimap with "Find Minerals".
|tip You will need level 230 Mining to collect these.
|tip These are a rare spawn.
|tip However, they can be found more consistently inside the Blackrock Depths dungeon and Molten Core raid.
collect Dark Iron Ore##11370 |n
]])
ZygorGuidesViewer:RegisterGuide("Profession Guides\\Mining\\Farming Guides\\Thorium Ore",{
author="support@zygorguides.com",
},[[
step
map Un'Goro Crater
path follow smart; loop on; ants curved; dist 20
path	66.46,78.95	64.56,79.71	61.79,84.21	59.34,84.18	57.63,86.04
path	54.50,86.69	51.13,86.82	48.27,87.30	45.98,86.58	42.89,85.00
path	40.79,83.52	37.91,83.14	36.77,80.17	33.58,79.05	30.40,79.61
path	28.89,76.98	28.97,71.52	26.00,67.67	25.93,63.53	24.59,58.51
path	23.95,53.04	24.40,48.21	23.89,44.76	24.71,41.12	26.26,36.59
path	26.62,31.21	28.29,29.47	29.59,25.66	29.89,20.92	33.32,20.67
path	36.29,20.47	38.67,16.00	41.73,15.77	43.32,14.12	46.94,13.03
path	49.79,13.83	52.84,12.88	56.31,14.04	59.61,16.58	62.25,16.02
path	64.19,19.90	65.99,21.01	68.51,20.26	71.19,20.89	71.21,23.75
path	71.75,28.19	74.76,32.46	75.06,37.15	76.32,43.15	76.67,48.32
path	77.05,53.09	76.56,57.02	75.35,61.97	74.66,68.05	72.92,70.46
path	71.39,73.80	71.00,79.21	68.32,79.90
Click ore as you follow the path around this area
|tip Track them on your minimap with "Find Minerals".
|tip You will need level 245 Mining to collect these.
collect Thorium Ore##10620 |n
]])
ZygorGuidesViewer:RegisterGuide("Profession Guides\\Mining\\Farming Guides\\Dense Stone",{
author="support@zygorguides.com",
},[[
step
map Un'Goro Crater
path follow smart; loop on; ants curved; dist 20
path	66.46,78.95	64.56,79.71	61.79,84.21	59.34,84.18	57.63,86.04
path	54.50,86.69	51.13,86.82	48.27,87.30	45.98,86.58	42.89,85.00
path	40.79,83.52	37.91,83.14	36.77,80.17	33.58,79.05	30.40,79.61
path	28.89,76.98	28.97,71.52	26.00,67.67	25.93,63.53	24.59,58.51
path	23.95,53.04	24.40,48.21	23.89,44.76	24.71,41.12	26.26,36.59
path	26.62,31.21	28.29,29.47	29.59,25.66	29.89,20.92	33.32,20.67
path	36.29,20.47	38.67,16.00	41.73,15.77	43.32,14.12	46.94,13.03
path	49.79,13.83	52.84,12.88	56.31,14.04	59.61,16.58	62.25,16.02
path	64.19,19.90	65.99,21.01	68.51,20.26	71.19,20.89	71.21,23.75
path	71.75,28.19	74.76,32.46	75.06,37.15	76.32,43.15	76.67,48.32
path	77.05,53.09	76.56,57.02	75.35,61.97	74.66,68.05	72.92,70.46
path	71.39,73.80	71.00,79.21	68.32,79.90
Click ore as you follow the path around this area
|tip Track them on your minimap with "Find Minerals".
|tip You will need level 245 Mining to collect these.
collect Dense Stone##12365 |n
]])
ZygorGuidesViewer:RegisterGuide("Profession Guides\\Mining\\Farming Guides\\Guardian Stone",{
author="support@zygorguides.com",
},[[
step
map Un'Goro Crater
path follow smart; loop on; ants curved; dist 20
path	40.24,18.78	37.48,20.20	33.48,23.57	40.40,25.92	43.96,29.92
path	44.56,36.72	43.43,40.74	44.16,43.79	48.24,41.64	51.27,39.78
path	56.65,39.87	54.16,36.20	55.85,31.39	57.79,26.10	56.20,21.10
path	56.97,14.88	53.59,13.78	51.39,17.24	48.13,13.45
Kill Stone Guardians as you follow the path around this area
|tip These are level 60-61 Elite enemies.
collect Guardian Stone##12809 |n
]])
ZygorGuidesViewer:RegisterGuide("Profession Guides\\Mining\\Farming Guides\\Elementium Ore",{
author="support@zygorguides.com",
},[[
step
Follow the path up |goto Searing Gorge 33.53,75.22 < 20 |only if walking
Enter Blackrock Mountain |goto Searing Gorge 34.76,83.98 < 7 |walk
Run up the chain |goto Eastern Kingdoms 48.73,63.79 < 5 |walk
Jump down here |goto 48.77,63.67 < 5 |walk
Follow the path up |goto 48.83,63.66 < 5 |walk
Enter the building |goto 48.91,63.92 < 5 |walk
click Orb of Command##179879 |goto 48.92,64.47
Teleport to Blackwing Lair |goto Blackwing Lair 0.00,0.00 < 1000 |noway |c
|tip You must be attuned to enter the raid.
step
Inside the Blackwing Lair Raid:
kill Blackwing Technician##13996+
collect Elementium Ore##18562 |n
|tip These have a low drop rate.
]])
ZygorGuidesViewer:RegisterGuide("Profession Guides\\Skinning\\Skinning (1-375)",{
author="support@zygorguides.com",
condition_suggested=function() return skill("Skinning") > 0 and skill("Skinning") < 375 end,
description="This guide will walk you through leveling your Skinning skill from 1-375.",
},[[
step
Reach Level 5 |ding 5
|tip You must be at least level 5 before you can learn professions.
|tip Use the leveling guides to accomplish this.
step
Enter the building |goto Orgrimmar/0 62.23,45.64 < 7 |walk
talk Thuwd##7088
|tip Inside the building.
Train Apprentice Skinning |skillmax Skinning,75 |goto Orgrimmar/0 63.36,45.41
step
talk Tamar##3366
|tip Inside the building.
buy Skinning Knife##7005 |goto 63.04,45.53
|tip You must have a Skinning Knife in your bags to be able to skin enemies.
step
Kill enemies around this area
|tip Only beast enemies, or certain humanoid enemies such as yetis or worgen, will be skinnable.
|tip Skin their corpses.
Reach Skill 75 in Skinning |skill Skinning,75 |goto Durotar 44.13,18.79
You can find more around: |notinsticky
[Durotar 39.38,18.92]
[Durotar 36.57,24.98]
[Durotar 38.33,35.20]
[Durotar 53.64,14.77]
step
Reach Level 10 |ding 10
|tip You must be at least level 10 to become a Journeyman in a profession.
|tip Use the leveling guides to accomplish this.
step
Enter the building |goto Orgrimmar/0 62.23,45.64 < 7 |walk
talk Thuwd##7088
|tip Inside the building.
Train Journeyman Skinning |skillmax Skinning,150 |goto Orgrimmar/0 63.36,45.41
step
Kill enemies around this area
|tip Only beast enemies will be skinnable.
|tip Skin their corpses.
Reach Skill 90 in Skinning |skill Skinning,90 |goto The Barrens 53.93,30.27
You can find more around: |notinsticky
[The Barrens 53.44,33.96]
[The Barrens 50.98,33.32]
[The Barrens 49.67,29.89]
step
Kill enemies around this area
|tip Skin their corpses.
Reach Skill 130 in Skinning |skill Skinning,130 |goto 45.77,56.23
You can find more around: |notinsticky
[46.67,50.16]
[49.90,53.28]
[48.92,58.67]
step
Reach Level 20 |ding 20
|tip You must be at least level 20 to train Expert professions.
|tip Use the leveling guides to accomplish this.
step
talk Dranh##6387
Train Expert Skinning |skillmax Skinning,225 |goto 45.07,59.09
step
Kill enemies around this area
|tip Skin their corpses.
Reach Skill 165 in Skinning |skill Skinning,165 |goto 44.89,75.35
You can find more around: |notinsticky
[48.02,75.51]
[49.18,79.05]
[47.17,78.38]
[47.02,81.85]
step
Kill enemies around this area
|tip All around in the Shimmering Flats.
|tip Skin their corpses.
Reach Skill 220 in Skinning |skill Skinning,220 |goto Thousand Needles 78.97,69.34
step
Reach Level 35 |ding 35
|tip You must be at least level 35 to train Artisan professions.
|tip Use the leveling guides to accomplish this.
step
Enter the building |goto Feralas 74.69,42.99 < 7 |walk
talk Kulleg Stonehorn##8144
|tip Inside the building.
Train Artisan Skinning |skillmax Skinning,300 |goto Feralas 74.47,43.04
step
Kill Feral Scar enemies around this area
|tip They look like yetis.
|tip Skin their corpses.
|tip You can find more through the tunnel.
Reach Skill 270 in Skinning |skill Skinning,270 |goto 55.24,56.36
step
Kill enemies around this area
|tip Skin their corpses.
Reach Skill 300 in Skinning |skill Skinning,300 |goto 48.69,37.24
You can find more around: |notinsticky
[49.97,33.40]
[49.69,28.62]
[46.69,24.68]
[44.94,22.35]
step
Reach Level 50 |ding 50
|tip You must be at least level 50 to train Master professions.
|tip Use the leveling guides to accomplish this.
step
Enter the building |goto Orgrimmar/0 62.23,45.64 < 7 |walk
talk Tamar##3366
|tip Inside the building.
buy Skinning Knife##7005 |goto 63.04,45.53
|tip You must have a Skinning Knife in your bags to be able to skin enemies.
step
talk Moorutu##18755
Learn Master Skinning |skillmax Skinning,375 |goto Hellfire Peninsula/0 56.27,38.61
step
map Hellfire Peninsula/0
path follow smart; loop on; ants curved; dist 50
path	63.89,60.78	67.80,62.83	66.95,65.60	63.75,70.51	61.99,78.54
path	60.09,74.93
kill Starving Helboar##16879+
|tip Skin their corpses.
Reach Skill 305 in Skinning |skill Skinning,305
step
map Hellfire Peninsula/0
path follow smart; loop on; ants curved; dist 50
path	55.72,74.52	51.36,74.35	50.76,78.01	48.49,78.57	48.25,75.04
path	50.82,72.62	49.69,69.88	49.97,65.38	53.06,69.81
kill Deranged Helboar##16863+
|tip Skin their corpses.
Reach Skill 310 in Skinning |skill Skinning,310
step
Kill Razorfang enemies around this area
|tip Skin their corpses.
Reach Skill 330 in Skinning |skill Skinning,330 |goto 41.77,84.92
You can find more around: |notinsticky
[40.38,84.56]
[38.76,88.89]
[38.30,86.75]
[37.28,88.74]
step
map Nagrand/0
path follow smart; loop on; ants curved; dist 50
path	60.75,43.71	59.25,44.53	56.92,44.58	54.45,45.44	51.82,46.79
path	50.71,48.26	49.12,44.34	47.50,42.69	47.51,39.86	47.01,32.36
path	45.31,29.62	42.57,26.46	39.19,24.94	37.43,24.89	36.56,22.78
path	38.29,20.50	40.08,23.20	44.14,24.17	45.65,26.29	47.47,27.03
path	51.00,27.02	52.61,28.30	52.01,30.18	50.33,36.50	51.84,40.10
path	53.29,42.34	55.18,43.70	58.05,43.78	59.76,42.02
Kill Talbuk and Clefthoof enemies around this area
|tip Skin their corpses.
Reach Skill 375 in Skinning |skill Skinning,375
]])
ZygorGuidesViewer:RegisterGuide("Profession Guides\\Skinning\\Farming Guides\\Green Whelp Scale",{
author="support@zygorguides.com",
},[[
step
Kill Whelp enemies around this area
|tip Skin their corpses.
|tip You will need level 170 Skinning to collect these.
collect Green Whelp Scale##7392 |n |goto Swamp of Sorrows 13.29,64.20
|tip These have a low drop rate.
]])
ZygorGuidesViewer:RegisterGuide("Profession Guides\\Skinning\\Farming Guides\\Black Whelp Scale",{
author="support@zygorguides.com",
},[[
step
kill Black Dragon Whelp##441+
|tip Skin their corpses.
|tip You will need level 70 Skinning to collect these.
collect Black Whelp Scale##7286 |n |goto Redridge Mountains 34.85,69.67
You can find more around: |notinsticky
[29.64,74.26]
[46.74,77.01]
[57.29,75.08]
[66.62,76.17]
]])
ZygorGuidesViewer:RegisterGuide("Profession Guides\\Skinning\\Farming Guides\\Ruined Leather Scraps",{
author="support@zygorguides.com",
},[[
step
Kill enemies around this area
|tip Skin their corpses.
collect Ruined Leather Scraps##2934 |n |goto Durotar 43.89,17.49
You can find more around [39.47,17.22]
]])
ZygorGuidesViewer:RegisterGuide("Profession Guides\\Skinning\\Farming Guides\\Light Leather",{
author="support@zygorguides.com",
},[[
step
Kill enemies around this area
|tip Skin their corpses.
collect Light Leather##2318 |n |goto Durotar 43.89,17.49
You can find more around [39.47,17.22]
]])
ZygorGuidesViewer:RegisterGuide("Profession Guides\\Skinning\\Farming Guides\\Thin Kodo Leather",{
author="support@zygorguides.com",
},[[
step
map Mulgore
path follow smart; loop on; ants curved; dist 20
path	36.83,37.11	40.70,41.79	47.76,36.77	51.48,25.17	49.44,17.26
path	43.79,16.61	35.19,17.28	31.28,20.42	34.20,31.05
Kill Kodo enemies as you follow the path around this area
collect Thin Kodo Leather##5082 |n
]])
ZygorGuidesViewer:RegisterGuide("Profession Guides\\Skinning\\Farming Guides\\Light Hide",{
author="support@zygorguides.com",
},[[
step
map The Barrens
path follow smart; loop on; ants curved; dist 20
path	48.32,63.77	46.77,67.86	47.33,72.51	48.23,76.23	48.03,80.88
path	44.76,80.45	44.63,73.81	45.67,69.12	45.20,64.63	46.23,61.11
Kill enemies as you follow the path around this area
|tip Only beast enemies will be skinnable.
|tip Skin their corpses.
|tip You will need level 100 Skinning to collect these.
collect Light Hide##783 |n
|tip These have a low drop rate.
]])
ZygorGuidesViewer:RegisterGuide("Profession Guides\\Skinning\\Farming Guides\\Slimy Murloc Scale",{
author="support@zygorguides.com",
},[[
step
Kill Vile Fin enemies around this area
collect Slimy Murloc Scale##5784 |n |goto Silverpine Forest 78.30,30.76
You can find more around: |notinsticky
[80.06,28.45]
[73.54,17.09]
]])
ZygorGuidesViewer:RegisterGuide("Profession Guides\\Skinning\\Farming Guides\\Medium Leather",{
author="support@zygorguides.com",
},[[
step
Kill Yeti enemies around this area
|tip Skin their corpses.
|tip You can find more inside the cave.
|tip You will need level 155 Skinning to collect these.
collect Medium Leather##2319 |n |goto Hillsbrad Foothills 46.12,31.76
]])
ZygorGuidesViewer:RegisterGuide("Profession Guides\\Skinning\\Farming Guides\\Medium Hide",{
author="support@zygorguides.com",
},[[
step
kill Blackened Basilisk##4044+
|tip Skin their corpses.
|tip You will need level 115 Skinning to collect these.
collect Medium Hide##4232 |n |goto Stonetalon Mountains/0 44.88,41.82
|tip These have a low drop rate.
You can find more around [36.49,48.50]
]])
ZygorGuidesViewer:RegisterGuide("Profession Guides\\Skinning\\Farming Guides\\Heavy Leather",{
author="support@zygorguides.com",
},[[
step
Kill enemies around this area
|tip Only beast enemies will be skinnable.
|tip You cannot skin the spiders.
|tip Skin their corpses.
|tip You will need level 185 Skinning to collect these.
collect Heavy Leather##4234 |n |goto Dustwallow Marsh 40.73,58.37
You can find more around: |notinsticky
[43.35,50.06]
[40.42,41.57]
]])
ZygorGuidesViewer:RegisterGuide("Profession Guides\\Skinning\\Farming Guides\\Raptor Hide",{
author="support@zygorguides.com",
},[[
step
Kill Highland enemies around this area
collect Raptor Hide##4461 |n |goto Arathi Highlands 52.39,67.61
You can find more around [47.28,78.85]
]])
ZygorGuidesViewer:RegisterGuide("Profession Guides\\Skinning\\Farming Guides\\Heavy Hide",{
author="support@zygorguides.com",
},[[
step
Kill enemies around this area
|tip Skin their corpses.
|tip You will need level 205 Skinning to collect these.
collect Heavy Hide##4235 |n |goto The Hinterlands 16.19,50.97
|tip These have a low drop rate.
]])
ZygorGuidesViewer:RegisterGuide("Profession Guides\\Skinning\\Farming Guides\\Turtle Scale",{
author="support@zygorguides.com",
},[[
step
kill Steeljaw Snapper##14123+
|tip Skin their corpses.
|tip You will need level 210 Skinning to collect these.
collect Turtle Scale##8167 |n |goto Tanaris/0 67.22,25.77
You can find more around: |notinsticky
[67.57,28.82]
[67.85,35.25]
[68.10,39.75]
]])
ZygorGuidesViewer:RegisterGuide("Profession Guides\\Skinning\\Farming Guides\\Thick Murloc Scale",{
author="support@zygorguides.com",
},[[
step
Kill Mirefin enemies around this area
collect Thick Murloc Scale##5785 |n |goto Dustwallow Marsh 58.78,9.45
]])
ZygorGuidesViewer:RegisterGuide("Profession Guides\\Skinning\\Farming Guides\\Thick Leather",{
author="support@zygorguides.com",
},[[
step
Kill Ravasaur enemies around this area
|tip Skin their corpses.
|tip You will need level 250 Skinning to collect these.
collect Thick Leather##4304 |n |goto Un'Goro Crater 67.37,72.59
You can find more around: |notinsticky
[65.75,64.16]
[70.21,55.33]
]])
ZygorGuidesViewer:RegisterGuide("Profession Guides\\Skinning\\Farming Guides\\Thick Hide",{
author="support@zygorguides.com",
},[[
step
Kill enemies around this area
|tip Only beast enemies will be skinnable.
|tip Skin their corpses.
|tip You will need level 245 Skinning to collect these.
collect Thick Hide##8169 |n |goto Un'Goro Crater 67.37,72.59
|tip These have a low drop rate.
You can find more around: |notinsticky
[65.75,64.16]
[70.21,55.33]
]])
ZygorGuidesViewer:RegisterGuide("Profession Guides\\Skinning\\Farming Guides\\Worn Dragonscale",{
author="support@zygorguides.com",
},[[
step
Kill enemies around this area
|tip Skin their corpses.
|tip You will need level 205 Skinning to collect these.
collect Worn Dragonscale##8165 |n |goto Dustwallow Marsh 44.75,66.19
|tip These have a low drop rate.
You can find more around [44.71,74.76]
]])
ZygorGuidesViewer:RegisterGuide("Profession Guides\\Skinning\\Farming Guides\\Scorpid Scale",{
author="support@zygorguides.com",
},[[
step
Kill Scorpid enemies around this area
|tip Skin their corpses.
|tip You will need level 215 Skinning to collect these.
collect Scorpid Scale##8154 |n |goto Tanaris/0 50.93,42.32
You can find more around: |notinsticky
[50.33,48.18]
[44.99,44.85]
[39.08,34.58]
]])
ZygorGuidesViewer:RegisterGuide("Profession Guides\\Skinning\\Farming Guides\\Devilsaur Leather",{
author="support@zygorguides.com",
},[[
step
Kill Devilsaur enemies around this area
|tip Skin their corpses.
|tip These are level 54-56 Elite enemies.
|tip It is recommended you clear the area of other enemies before fighting the Devilsaur.
|tip You will need level 270 Skinning to collect these.
collect Devilsaur Leather##15417 |n |goto Un'Goro Crater 34.25,38.82
You can find more around: |notinsticky
[40.02,62.25]
[57.66,70.17]
[71.30,51.78]
[68.80,26.05]
[31.30,25.52]
]])
ZygorGuidesViewer:RegisterGuide("Profession Guides\\Skinning\\Farming Guides\\Rugged Leather",{
author="support@zygorguides.com",
},[[
step
Kill Ice Thistle enemies around this area
|tip You can find more inside the cave.
|tip Skin their corpses.
|tip You will need level 275 Skinning to collect these.
collect Rugged Leather##8170 |n |goto Winterspring 66.43,44.38
You can find more inside the cave at [67.67,41.72]
]])
ZygorGuidesViewer:RegisterGuide("Profession Guides\\Skinning\\Farming Guides\\Warbear Leather",{
author="support@zygorguides.com",
},[[
step
kill Diseased Grizzly##1816+
|tip Skin their corpses.
|tip You will need level 275 Skinning to collect these.
collect Warbear Leather##15419 |n |goto Western Plaguelands 56.81,63.63
|tip These have a low drop rate.
You can find more around: |notinsticky
[58.69,58.24]
[57.20,52.78]
[61.55,52.23]
]])
ZygorGuidesViewer:RegisterGuide("Profession Guides\\Skinning\\Farming Guides\\Green Dragonscale",{
author="support@zygorguides.com",
},[[
step
map Swamp of Sorrows
path follow smart; loop on; ants curved; dist 20
path	62.18,45.70	59.82,53.60	60.80,60.65	64.62,64.44	68.89,66.20
path	74.52,68.02	79.17,61.93	80.05,53.73	76.69,40.89	70.03,38.01
path	63.28,40.82
Kill Dragonkin enemies around this area as you follow the path
|tip Any Scalebane, Wyrmkin, Green or Dragonkin enemy.
|tip Skin their corpses.
|tip You will need level 205 Skinning to collect these.
collect Green Dragonscale##15412 |n
|tip These have a low drop rate.
]])
ZygorGuidesViewer:RegisterGuide("Profession Guides\\Skinning\\Farming Guides\\Blue Dragonscale",{
author="support@zygorguides.com",
},[[
step
Kill enemies around this area
|tip Any Draconic or Blue enemy.
|tip These are level 50-54 Elite enemies.
|tip Skin their corpses.
|tip You will need level 250 Skinning to collect these.
collect Blue Dragonscale##15415 |n |goto Azshara 36.21,75.55
|tip These have a low drop rate.
You can find more around: |notinsticky
[41.63,77.37]
[42.89,82.91]
[39.79,83.98]
[37.50,80.60]
]])
ZygorGuidesViewer:RegisterGuide("Profession Guides\\Skinning\\Farming Guides\\Rugged Hide",{
author="support@zygorguides.com",
},[[
step
Kill Ice Thistle enemies around this area
|tip You can find more inside the cave.
|tip Skin their corpses.
|tip You will need level 275 Skinning to collect these.
collect Rugged Hide##8171 |n |goto Winterspring 66.43,44.38
|tip These have a low drop rate.
You can find more inside the cave at [67.67,41.72]
]])
ZygorGuidesViewer:RegisterGuide("Profession Guides\\Skinning\\Farming Guides\\Black Dragonscale",{
author="support@zygorguides.com",
},[[
step
Kill enemies around this area
|tip Most of the enemies around this area are Elite.
|tip Skin their corpses.
|tip You will need level 260 Skinning to collect these.
collect Black Dragonscale##15416 |n |goto Burning Steppes 91.30,35.07
|tip These have a low drop rate.
You can find more around [90.73,53.59]
]])
ZygorGuidesViewer:RegisterGuide("Profession Guides\\Skinning\\Farming Guides\\Heavy Scorpid Scale",{
author="support@zygorguides.com",
},[[
step
Kill Stonelash enemies around this area
|tip Skin their corpses.
|tip You will need level 270 Skinning to collect these.
collect Heavy Scorpid Scale##15408 |n |goto Silithus/0 31.40,38.23
You can find more around: |notinsticky
[26.71,43.66]
[34.12,45.88]
[39.13,52.28]
[42.85,58.57]
[47.97,61.32]
[46.67,70.30]
[45.02,83.62]
[40.32,81.44]
]])
ZygorGuidesViewer:RegisterGuide("Profession Guides\\Skinning\\Farming Guides\\Core Leather",{
author="support@zygorguides.com",
},[[
step
Enter the Molten Core Raid:
Kill Ancient Core Hounds and Magmadar
|tip They are trash mobs found throughout the raid and the second raid boss.
|tip Skin their corpses.
|tip Level 61's require 305 Skinning, level 62's require 310 Skinning, and bosses require 315 Skinning.
collect Core Leather##17012 |n
]])
ZygorGuidesViewer:RegisterGuide("Profession Guides\\Skinning\\Farming Guides\\Scale of Onyxia",{
author="support@zygorguides.com",
},[[
step
Enter the Onyxia's Lair Raid:
kill Onyxia##10184
|tip Skin its corpse.
|tip You will need level 315 Skinning to collect these.
collect Scale of Onyxia##15410 |n
]])
ZygorGuidesViewer:RegisterGuide("Profession Guides\\Skinning\\Farming Guides\\Red Dragonscale",{
author="support@zygorguides.com",
},[[
step
Follow the path up |goto Wetlands 74.18,47.32 < 20 |only if walking
Kill Dragonkin enemies around this area
|tip These are level 57-62 Elite enemies.
|tip Skin their corpses.
|tip You will need level 300 Skinning to collect these.
|tip Level 61's require 305 Skinning and level 62's require 310 Skinning.
collect Red Dragonscale##15414 |n |goto 86.54,51.83
|tip These have a low drop rate.
You can find more around: |notinsticky
[87.95,64.81]
[82.51,70.50]
]])
ZygorGuidesViewer:RegisterGuide("Profession Guides\\Skinning\\Farming Guides\\Primal Bat Leather",{
author="support@zygorguides.com",
},[[
step
Primal Bat Leather is currently unobtainable in Classic
It is dropped from High Priestess Jeklik in the Zul'Gurub raid
Zul'Gurub will not be added to Classic until Phase 4
]])
ZygorGuidesViewer:RegisterGuide("Profession Guides\\Skinning\\Farming Guides\\Primal Tiger Leather",{
author="support@zygorguides.com",
},[[
step
Primal Tiger Leather is currently unobtainable in Classic
It is dropped from High Priest Thekal in the Zul'Gurub raid
Zul'Gurub will not be added to Classic until Phase 4
]])
ZygorGuidesViewer:RegisterGuide("Profession Guides\\Skinning\\Farming Guides\\Dreamscale",{
author="support@zygorguides.com",
},[[
step
Dreamscale is currently unobtainable in Classic
They are dropped from the four Green Dragon world bosses
They will not be added to Classic until Phase 4
]])
ZygorGuidesViewer:RegisterGuide("Profession Guides\\Tailoring\\Tailoring (1-375)",{
author="support@zygorguides.com",
condition_suggested=function() return skill("Tailoring") > 0 and skill("Tailoring") < 375 end,
description="This guide will walk you through leveling your Tailoring skill from 1-375.",
},[[
step
Reach Level 5 |ding 5
|tip You must be at least level 5 to train professions.
|tip Use the leveling guides to accomplish this.
step
Enter the building |goto Orgrimmar/0 61.38,50.37 < 7 |walk
talk Magar##3363
|tip Inside the building.
Train Apprentice Tailoring |skillmax Tailoring,75 |goto Orgrimmar/0 63.65,49.93
step
Click Here if You Would Like to Collect All Materials First |confirm |next |or
_Or_
Click Here to Collect Materials as You Level or Resume Leveling Tailoring |confirm |next "Begin_Profession_Leveling" |or
'|complete skill("Tailoring") >= 375 |or |next "Begin_Profession_Leveling"
stickystart "Collect_Wool_Cloth_Total"
stickystart "Collect_Silk_Cloth_Total"
stickystart "Collect_Mageweave_Cloth_Total"
stickystart "Collect_Runecloth_Total"
stickystart "Collect_Rugged_Leather_Total"
step
Inside Ragefire Chasm:
Kill Ragefire enemies throughout the dungeon
collect 204 Linen Cloth##2589 |or
|tip Farm them from level 5-20 humanoid mobs or purchase them from the auction house.
|tip These totals are approximate.
|tip You may need more or less than the indicated amount.
'|complete skill("Tailoring") >= 50 |or
step
label "Collect_Wool_Cloth_Total"
Follow the path up |goto The Barrens 62.21,7.28 < 15 |only if walking
Kill Venture Co. enemies around this area
|tip You can find more inside the mine.
collect 135 Wool Cloth##2592 |or |goto 60.91,3.82
|tip Farm them from level 16-30 humanoid mobs or purchase them from the auction house.
|tip These totals are approximate. |notinsticky
|tip You may need more or less than the indicated amount. |notinsticky
'|complete skill("Tailoring") >= 100 |or
step
label "Collect_Silk_Cloth_Total"
Kill Galak enemies around this area
|tip You can find more inside the cave.
collect 804 Silk Cloth##4306 |or |goto Thousand Needles 44.01,37.41
|tip Farm them from level 28-40 humanoid mobs or purchase them from the auction house.
|tip These totals are approximate. |notinsticky
|tip You may need more or less than the indicated amount. |notinsticky
'|complete skill("Tailoring") >= 146 |or
step
label "Collect_Mageweave_Cloth_Total"
Kill Dunemaul enemies around this area
collect 500 Mageweave Cloth##4338 |or |goto Tanaris/0 40.50,55.50
|tip Farm them from level 38-50 humanoid mobs or purchase them from the auction house.
|tip These totals are approximate. |notinsticky
|tip You may need more or less than the indicated amount. |notinsticky
'|complete skill("Tailoring") >= 185 |or
step
label "Collect_Runecloth_Total"
Kill Blackrock enemies around this area
|tip You can find more inside the building.
collect 1235 Runecloth###14047 |or |goto Burning Steppes 42.17,35.64
|tip Farm them from level 50+ humanoid mobs or purchase them from the auction house.
|tip These totals are approximate. |notinsticky
|tip You may need more or less than the indicated amount. |notinsticky
'|complete skill("Tailoring") >= 260 |or
step
label "Collect_Rugged_Leather_Total"
Kill Ice Thistle enemies around this area
|tip You can find more inside the cave.
|tip Skin their corpses.
|tip You will need level 275 Skinning to collect these.
collect 110 Rugged Leather##8170 |or |goto Winterspring 66.43,44.38
You can find more inside the cave at [67.67,41.72]
|tip Farm them with Skinning or purchase them from the auction house.
|tip These totals are approximate. |notinsticky
|tip You may need more or less than the indicated amount. |notinsticky
'|complete skill("Tailoring") >= 300 |or
stickystart "Collect_Arcane_Dust_Total"
stickystart "Collect_Knothide_Leather_Total"
stickystart "Collect_Netherweb_Spider_Silk_Total"
step
map Shadowmoon Valley/0
path follow smart; loop on; ants curved; dist 20
path	51.1,58.8	53.0,59.3	53.2,60.5	52.8,63.2	52.8,65.4
path	52.9,69.0	52.5,71.8	47.3,71.1	45.8,71.3	45.2,69.2
path	45.6,66.1	48.0,67.2
Kill enemies around this area
collect 2760 Netherweave Cloth##21877 |or
|tip Farm them from Outland humanoid mobs or purchase them from the auction house.
|tip These totals are approximate. |notinsticky
|tip You may need more or less than the indicated amount. |notinsticky
'|complete skill("Tailoring") >= 326 |or
step
label "Collect_Arcane_Dust_Total"
collect 180 Arcane Dust##22445 |or
|tip Disenchant them from Outland uncommon (green) items with Enchanting or purchase them from the auction house.
|tip These totals are approximate. |notinsticky
|tip You may need more or less than the indicated amount. |notinsticky
'|complete skill("Tailoring") >= 341 |or
step
label "Collect_Knothide_Leather_Total"
map Netherstorm/0
path follow smart; loop on; ants curved; dist 30
path	43.61,57.06	45.22,57.65	47.41,56.58	48.25,54.31	48.18,51.86
path	46.52,51.17	45.58,49.75	43.63,50.57	43.29,52.27	43.66,54.99
path	44.85,56.21
Kill enemies around this area
|tip Only Beast enemies will be skinnable.
|tip Skin their corpses.
collect 10 Knothide Leather##21887 |or
|tip Farm them with Skinning or purchase them from the auction house.
|tip These totals are approximate. |notinsticky
|tip You may need more or less than the indicated amount. |notinsticky
'|complete skill("Tailoring") >= 345 |or
step
label "Collect_Netherweb_Spider_Silk_Total"
Kill Dreadfang enemies around this area
collect 30 Netherweb Spider Silk##21881 |or |goto Terokkar Forest/0 53.64,57.86
You can find more around here [52.22,78.65]
|tip Farm them from Dreadfang Spiders in Terokkar Forest or purchase them from the auction house.
|tip These totals are approximate. |notinsticky
|tip You may need more or less than the indicated amount. |notinsticky
'|complete skill("Tailoring") >= 375 |or
step
label "Begin_Profession_Leveling"
Inside Ragefire Chasm:
Kill Ragefire enemies throughout the dungeon
collect 204 Linen Cloth##2589 |or
|tip Farm them from level 5-20 humanoid mobs or purchase them from the auction house.
'|complete skill("Tailoring") >= 50 |or
step
create 102 Bolt of Linen Cloth##2963,Tailoring,102 total |or
|tip Save these, you will need them for future steps.
'|complete skill("Tailoring") >= 51 |or
step
create 1 Bolt of Linen Cloth##2963,Tailoring,45
|tip Save at least 102 of these; you will need them for future steps.
|tip You may need to make a few more of these.
|tip Each additional Bolt of Linen Cloth requires 2 Linen Cloth.
step
talk Magar##3363
|tip Inside the building.
Train Linen Belt |learn Linen Belt##8776 |goto Orgrimmar/0 63.65,49.93
step
collect 40 Bolt of Linen Cloth##2996 |or
|tip You created these in a previous step.
'|complete skill("Tailoring") >= 70 |or
step
talk Borya##3364
|tip Inside the building.
buy 55 Coarse Thread##2320 |goto Orgrimmar/0 63.08,51.45 |or
|tip Save these, you will need them for future steps.
'|complete skill("Tailoring") >= 70 |or
step
create 40 Linen Belt##8776,Tailoring,70
|tip You may need to make a few more of these.
|tip Each additional Linen Belt requires 1 Bolt of Linen Cloth and 1 Coarse Thread.
step
talk Magar##3363
|tip Inside the building.
Train Reinforced Linen Cape |learn Reinforced Linen Cape##2397 |goto Orgrimmar/0 63.65,49.93
step
collect 10 Bolt of Linen Cloth##2996 |or
|tip You created these in a previous step.
'|complete skill("Tailoring") >= 75 |or
step
talk Borya##3364
|tip Inside the building.
buy 15 Coarse Thread##2320 |goto Orgrimmar/0 63.08,51.45 |or
|tip You purchased these in a previous step.
'|complete skill("Tailoring") >= 75 |or
step
create 5 Reinforced Linen Cape##2397,Tailoring,75
step
Reach Level 10 |ding 10
|tip You must be at least level 10 to train Journeyman professions.
|tip Use the leveling guides to accomplish this.
step
talk Magar##3363
|tip Inside the building.
Train Journeyman Tailoring |skillmax Tailoring,150 |goto Orgrimmar/0 63.65,49.93
step
talk Magar##3363
|tip Inside the building.
Train Bolt of Woolen Cloth |learn Bolt of Woolen Cloth##2964 |goto Orgrimmar/0 63.65,49.93
step
Follow the path up |goto The Barrens 62.21,7.28 < 15 |only if walking
Kill Venture Co. enemies around this area
|tip You can find more inside the mine.
collect 135 Wool Cloth##2592 |or |goto 60.91,3.82
|tip Farm them from level 16-30 humanoid mobs or purchase them from the auction house.
'|complete skill("Tailoring") >= 100 |or
step
create 45 Bolt of Woolen Cloth##2964,Tailoring,45 total |or
|tip Save these, you will need them for future steps.
'|complete skill("Tailoring") >= 106 |or
step
create 1 Bolt of Woolen Cloth##2964,Tailoring,100
|tip Save at least 45 of these; you will need them for future steps.
|tip You may need to make a few more of these.
|tip Each additional Bolt of Woolen Cloth requires 3 Wool Cloth.
step
talk Magar##3363
|tip Inside the building.
Train Simple Kilt |learn Simple Kilt##12046 |goto Orgrimmar/0 63.65,49.93
step
collect 52 Bolt of Linen Cloth##2996 |or
|tip You created these in a previous step.
'|complete skill("Tailoring") >= 110 |or
step
talk Borya##3364
|tip Inside the building.
buy 43 Fine Thread##2321 |goto Orgrimmar/0 63.08,51.45 |or
|tip Save these, you will need them for future steps.
'|complete skill("Tailoring") >= 110 |or
step
create 13 Simple Kilt##12046,Tailoring,110
|tip You may need to make a few more of these.
|tip Each additional Simple Kilt requires 4 Bolts of Linen Cloth and 1 Fine Thread.
step
talk Magar##3363
|tip Inside the building.
Train Double-stitched Woolen Shoulders |learn Double-stitched Woolen Shoulders##3848 |goto Orgrimmar/0 63.65,49.93
step
collect 45 Bolt of Woolen Cloth##2997 |or
|tip You created these in a previous step.
'|complete skill("Tailoring") >= 125 |or
step
talk Borya##3364
|tip Inside the building.
buy 30 Fine Thread##2321 |goto Orgrimmar/0 63.08,51.45 |or
|tip You purchased these in a previous step.
'|complete skill("Tailoring") >= 125 |or
step
create 15 Double-stitched Woolen Shoulders##3848,Tailoring,125
step
Reach Level 20 |ding 20
|tip You must be at least level 20 to train Expert professions.
|tip Use the leveling guides to accomplish this.
step
talk Magar##3363
|tip Inside the building.
Train Expert Tailoring |skillmax Tailoring,225 |goto Orgrimmar/0 63.65,49.93
step
talk Magar##3363
|tip Inside the building.
Train Bolt of Silk Cloth |learn Bolt of Silk Cloth##3839 |goto Orgrimmar/0 63.65,49.93
step
Kill Galak enemies around this area
|tip You can find more inside the cave.
collect 804 Silk Cloth##4306 |or |goto Thousand Needles 44.01,37.41
|tip Farm them from level 28-40 humanoid mobs or purchase them from the auction house.
'|complete skill("Tailoring") >= 146 |or
step
create 201 Bolt of Silk Cloth##3839,Tailoring,201 total |or
|tip Save these, you will need them for future steps.
'|complete skill("Tailoring") >= 146 |or
step
create 1 Bolt of Silk Cloth##3839,Tailoring,145
|tip Save at least 201 of these; you will need them for future steps.
step
talk Magar##3363
|tip Inside the building.
Train Azure Silk Hood |learn Azure Silk Hood##8760 |goto Orgrimmar/0 63.65,49.93
step
collect 36 Bolt of Silk Cloth##4305 |or
|tip You created these in a previous step.
'|complete skill("Tailoring") >= 160 |or
step
talk Borya##3364
|tip Inside the building.
buy 18 Fine Thread##2321 |goto Orgrimmar/0 63.08,51.45 |or 2
buy 36 Blue Dye##6260 |goto Orgrimmar/0 63.08,51.45 |or 2
'|complete skill("Tailoring") >= 160 |or
step
create 18 Azure Silk Hood##8760,Tailoring,160
|tip You may need to create a few mor or less of these.
|tip Each additional Azure Silk Hood requires 2 Bolts of Silk Cloth, 2 Blue Dye, and 1 Fine Thread.
step
talk Magar##3363
|tip Inside the building.
Train Silk Headband |learn Silk Headband##8762 |goto Orgrimmar/0 63.65,49.93
step
collect 30 Bolt of Silk Cloth##4305 |or
|tip You created these in a previous step.
'|complete skill("Tailoring") >= 170 |or
step
talk Borya##3364
|tip Inside the building.
buy 20 Fine Thread##2321 |goto Orgrimmar/0 63.08,51.45 |or
'|complete skill("Tailoring") >= 170 |or
step
create 10 Silk Headband##8762,Tailoring,170
step
talk Magar##3363
|tip Inside the building.
Train Formal White Shirt |learn Formal White Shirt##3871 |goto Orgrimmar/0 63.65,49.93
step
collect 15 Bolt of Silk Cloth##4305 |or
|tip You created these in a previous step.
'|complete skill("Tailoring") >= 175 |or
step
talk Borya##3364
|tip Inside the building.
buy 10 Bleach##2324 |goto Orgrimmar/0 63.08,51.45 |or 2
buy 5 Fine Thread##2321 |goto Orgrimmar/0 63.08,51.45 |or 2
'|complete skill("Tailoring") >= 175 |or
step
create 5 Formal White Shirt##3871,Tailoring,175
step
talk Magar##3363
|tip Inside the building.
Train Bolt of Mageweave |learn Bolt of Mageweave##3865 |goto Orgrimmar/0 63.65,49.93
step
Kill Dunemaul enemies around this area
collect 500 Mageweave Cloth##4338 |or |goto Tanaris/0 40.50,55.50
|tip Farm them from level 38-50 humanoid mobs or purchase them from the auction house.
'|complete skill("Tailoring") >= 185 |or
step
create 100 Bolt of Mageweave##3865,Tailoring,100 total |or
|tip Save these, you will need them for future steps.
'|complete skill("Tailoring") >= 186 |or
step
create 1 Bolt of Mageweave##3865,Tailoring,185
|tip Save at least 100 of these; you will need them for future steps.
step
talk Magar##3363
|tip Inside the building.
Train Crimson Silk Vest |learn Crimson Silk Vest##8791 |goto Orgrimmar/0 63.65,49.93
step
collect 80 Bolt of Silk Cloth##4305 |or
|tip You created these in a previous step.
'|complete skill("Tailoring") >= 205 |or
step
talk Borya##3364
|tip Inside the building.
buy 40 Fine Thread##2321 |goto Orgrimmar/0 63.08,51.45 |or 2
buy 40 Red Dye##2604 |goto Orgrimmar/0 63.08,51.45 |or 2
'|complete skill("Tailoring") >= 205 |or
step
create 20 Crimson Silk Vest##8791,Tailoring,205
step
Reach Level 35 |ding 35
|tip You must be at least level 35 to train Artisan professions.
|tip Use the leveling guides to accomplish this.
step
talk Magar##3363
|tip Inside the building.
Train Artisan Tailoring |skillmax Tailoring,300 |goto Orgrimmar/0 63.65,49.93
step
talk Magar##3363
|tip Inside the building.
Train Crimson Silk Pantaloons |learn Crimson Silk Pantaloons##8799 |goto Orgrimmar/0 63.65,49.93
step
collect 40 Bolt of Silk Cloth##4305 |or
|tip You created these in a previous step.
'|complete skill("Tailoring") >= 215 |or
step
talk Borya##3364
|tip Inside the building.
buy 20 Red Dye##2604 |goto Orgrimmar/0 63.08,51.45 |or 2
buy 20 Silken Thread##4291 |goto Orgrimmar/0 63.08,51.45 |or 2
'|complete skill("Tailoring") >= 215 |or
step
create 10 Crimson Silk Pantaloons##8799,Tailoring,215
step
talk Magar##3363
|tip Inside the building.
Train Orange Mageweave Shirt |learn Orange Mageweave Shirt##12061 |goto Orgrimmar/0 63.65,49.93
step
collect 5 Bolt of Mageweave##4339 |or
|tip You created these in a previous step.
'|complete skill("Tailoring") >= 220 |or
step
talk Borya##3364
|tip Inside the building.
buy 5 Orange Dye##6261 |goto Orgrimmar/0 63.08,51.45 |or 2
buy 5 Heavy Silken Thread##8343 |goto Orgrimmar/0 63.08,51.45 |or 2
'|complete skill("Tailoring") >= 220 |or
step
create 5 Orange Mageweave Shirt##12061,Tailoring,220
step
talk Magar##3363
|tip Inside the building.
Train Black Mageweave Gloves |learn Black Mageweave Gloves##12053 |goto Orgrimmar/0 63.65,49.93
step
collect 20 Bolt of Mageweave##4339 |or
|tip You created these in a previous step.
'|complete skill("Tailoring") >= 230 |or
step
talk Borya##3364
|tip Inside the building.
buy 20 Heavy Silken Thread##8343 |goto Orgrimmar/0 63.08,51.45 |or
'|complete skill("Tailoring") >= 230 |or
step
create 10 Black Mageweave Gloves##12053,Tailoring,230
step
talk Magar##3363
|tip Inside the building.
Train Black Mageweave Headband |learn Black Mageweave Headband##12072 |goto Orgrimmar/0 63.65,49.93
step
collect 75 Bolt of Mageweave##4339 |or
|tip You created these in a previous step.
'|complete skill("Tailoring") >= 250 |or
step
talk Borya##3364
|tip Inside the building.
buy 50 Heavy Silken Thread##8343 |goto Orgrimmar/0 63.08,51.45 |or
'|complete skill("Tailoring") >= 250 |or
step
create 25 Black Mageweave Headband##12072,Tailoring,250
|tip You may need to create more or less of these.
|tip Each additional Black Mageweave Headband requires 3 Bolts of Mageweave and 2 Heavy Silken Thread.
step
talk Magar##3363
|tip Inside the building.
Train Bolt of Runecloth |learn Bolt of Runecloth##18401 |goto Orgrimmar/0 63.65,49.93
step
Kill Blackrock enemies around this area
|tip You can find more inside the building.
collect 1235 Runecloth###14047 |or |goto Burning Steppes 42.17,35.64
|tip Farm them from level 50+ humanoid mobs or purchase them from the auction house.
'|complete skill("Tailoring") >= 260 |or
step
create 247 Bolt of Runecloth##18401,Tailoring,247 total |or
|tip Save these, you will need them for future steps.
'|complete skill("Tailoring") >= 261 |or
step
create 1 Bolt of Runecloth##18401,Tailoring,260
|tip Save at least 247 of these; you will need them for future steps.
step
talk Magar##3363
|tip Inside the building.
Train Runecloth Belt |learn Runecloth Belt##18402 |goto Orgrimmar/0 63.65,49.93
step
collect 75 Bolt of Runecloth##14048 |or
|tip You created these in a previous step.
'|complete skill("Tailoring") >= 280 |or
step
talk Borya##3364
|tip Inside the building.
buy 63 Rune Thread##14341 |goto Orgrimmar/0 63.08,51.45 |or
|tip Save these, you will need them for future steps.
'|complete skill("Tailoring") >= 280 |or
step
create 25 Runecloth Belt##18402,Tailoring,280
|tip You may need to create more or less of these.
|tip Each additional Runecloth Belt requires 3 Bolts of Runecloth and 1 Rune Thread.
step
Enter the building |goto Winterspring 61.33,37.35 < 5 |walk
talk Qia##11189
|tip Inside the building.
buy Pattern: Runecloth Bag##14468 |goto 61.20,37.21 |or
|tip These is a limited supply item that can also be purchased from the auction house.
|tip It may take around 30 minutes to respawn.
'|complete skill("Tailoring") >= 300 or knowsrecipe(18405) |or
step
use the Pattern: Runecloth Bag##14468
Learn Runecloth Bag |learn Runecloth Bag##18405
stickystart "Collect_Rugged_Leather_290"
step
collect 90 Bolt of Runecloth##14048 |or
|tip You created these in a previous step.
'|complete skill("Tailoring") >= 290 |or
step
label "Collect_Rugged_Leather_290"
Kill Ice Thistle enemies around this area
|tip You can find more inside the cave.
|tip Skin their corpses.
|tip You will need level 275 Skinning to collect these.
collect 36 Rugged Leather##8170 |or |goto Winterspring 66.43,44.38
You can find more inside the cave at [67.67,41.72]
|tip Farm them with Skinning or purchase them from the auction house.
'|complete skill("Tailoring") >= 290 |or
step
talk Borya##3364
|tip Inside the building.
buy 18 Rune Thread##14341 |goto Orgrimmar/0 63.08,51.45 |or
|tip You purchased these in a previous step.
'|complete skill("Tailoring") >= 290 |or
step
create 18 Runecloth Bag##18405,Tailoring,290
|tip You may need to create more or less of these.
|tip Each additional Runecloth Bag requires 5 Bolts of Runecloth, 2 Rugged Leather, and 1 Rune Thread.
step
talk Magar##3363
|tip Inside the building.
Train Runecloth Gloves |learn Runecloth Gloves##18417 |goto Orgrimmar/0 63.65,49.93
stickystart "Collect_Rugged_Leather_300"
step
collect 80 Bolt of Runecloth##14048 |or
|tip You created these in a previous step.
'|complete skill("Tailoring") >= 300 |or
step
label "Collect_Rugged_Leather_300"
Kill Ice Thistle enemies around this area
|tip You can find more inside the cave.
|tip Skin their corpses.
|tip You will need level 275 Skinning to collect these.
collect 74 Rugged Leather##8170 |or |goto Winterspring 66.43,44.38
You can find more inside the cave at [67.67,41.72]
|tip Farm them with Skinning or purchase them from the auction house.
'|complete skill("Tailoring") >= 300 |or
step
talk Borya##3364
|tip Inside the building.
buy 18 Rune Thread##14341 |goto Orgrimmar/0 63.08,51.45 |or
|tip You purchased these in a previous step.
'|complete skill("Tailoring") >= 300 |or
step
create 20 Runecloth Gloves##18417,Tailoring,300
|tip You may need to create more or less of these.
|tip Each additional Runecloth Glove requires 4 Bolts of Runecloth, 4 Rugged Leather, and 1 Rune Thread.
step
Reach Level 50 |ding 50
|tip You must be at least level 50 to train Master professions.
|tip Use the leveling guides to accomplish this.
step
talk Dalinna##18749
|tip Inside the building.
Train Master Tailoring |skillmax Tailoring,375 |goto Hellfire Peninsula/0 56.6,37.2
step
talk Dalinna##18749
|tip Inside the building.
Train Bolt of Netherweave |learn Bolt of Netherweave##26745 |goto Hellfire Peninsula/0 56.6,37.2
step
map Shadowmoon Valley/0
path follow smart; loop on; ants curved; dist 20
path	51.1,58.8	53.0,59.3	53.2,60.5	52.8,63.2	52.8,65.4
path	52.9,69.0	52.5,71.8	47.3,71.1	45.8,71.3	45.2,69.2
path	45.6,66.1	48.0,67.2
Kill enemies around this area
collect 2760 Netherweave Cloth##21877 |or
|tip Farm them from Outland humanoid mobs or purchase them from the auction house.
'|complete skill("Tailoring") >= 326 |or
step
create 460 Bolt of Netherweave##26745,Tailoring,460 total |or
|tip Save these, you will need them for future steps.
'|complete skill("Tailoring") >= 326 |or
step
create 1 Bolt of Netherweave##26745,Tailoring,325
|tip Save at least 460 of these; you will need them for future steps.
step
talk Eiin##19213
buy Pattern: Bolt of Imbued Netherweave##21892 |goto Shattrath City/0 66.2,68.6 |or
'|complete skill("Tailoring") >= 340 or knowsrecipe(26747) |or
step
use the Pattern: Bolt of Imbued Netherweave##21892
Train Bolt of Imbued Netherweave |learn Bolt of Imbued Netherweave##26747
stickystart "Collect_Arcane_Dust_341"
step
collect 270 Bolt of Netherweave##21840 |or
|tip You created these in a previous step.
'|complete skill("Tailoring") >= 341 |or
step
label "Collect_Arcane_Dust_341"
collect 180 Arcane Dust##22445 |or
|tip Disenchant them from Outland uncommon (green) items with Enchanting or purchase them from the auction house.
'|complete skill("Tailoring") >= 341 |or
step
create 90 Bolt of Imbued Netherweave##26747,Tailoring,90 total |goto Shattrath City/0 66.50,68.73 |or
|tip You must be standing at the Mana Loom in Shattrath City to craft these.
|tip Save these, you will need them for future steps.
'|complete skill("Tailoring") >= 341 |or
step
create 90 Bolt of Imbued Netherweave##26747,Tailoring,340 |goto Shattrath City/0 66.50,68.73
|tip You must be standing at the Mana Loom in Shattrath City to craft these.
|tip Save at least 90 of these; you will need them for future steps.
step
talk Dalinna##18749
|tip Inside the building.
Train Netherweave Boots |learn Netherweave Boots##26772 |goto Hellfire Peninsula/0 56.6,37.2
stickystart "Collect_Knothide_Leather_345"
step
collect 30 Bolt of Netherweave##21840 |or
|tip You created these in a previous step.
'|complete skill("Tailoring") >= 345 |or
step
label "Collect_Knothide_Leather_345"
map Netherstorm/0
path follow smart; loop on; ants curved; dist 30
path	43.61,57.06	45.22,57.65	47.41,56.58	48.25,54.31	48.18,51.86
path	46.52,51.17	45.58,49.75	43.63,50.57	43.29,52.27	43.66,54.99
path	44.85,56.21
Kill enemies around this area
|tip Only Beast enemies will be skinnable.
|tip Skin their corpses.
collect 10 Knothide Leather##21887 |or
|tip Farm them with Skinning or purchase them from the auction house.
'|complete skill("Tailoring") >= 345 |or
step
talk Dalinna##18749
|tip Inside the building.
buy 5 Rune Thread##14341 |goto Hellfire Peninsula/0 56.6,37.2 |or
'|complete skill("Tailoring") >= 345 |or
step
create 5 Netherweave Boots##26772,Tailoring,345
step
talk Eiin##19213
buy 1 Pattern: Netherweave Tunic##21897 |goto Shattrath City/0 66.26,68.91
step
use the Pattern: Netherweave Tunic##21897
Learn Netherweave Tunic |learn Netherweave Tunic##26774
step
collect 160 Bolt of Netherweave##21840 |or
|tip You created these in a previous step.
'|complete skill("Tailoring") >= 360 |or
step
talk Dalinna##18749
|tip Inside the building.
buy 40 Rune Thread##14341 |goto Hellfire Peninsula/0 56.6,37.2 |or
'|complete skill("Tailoring") >= 360 |or
step
create 20 Netherweave Tunic##26774,Tailoring,360
|tip You may need to create more or less of these.
|tip Each additional Netherweave Tunic requires 8 Bolts of Netherweave and 2 Rune Thread.
step
talk Arrond##19521
buy Pattern: Imbued Netherweave Tunic##21901 |goto Shadowmoon Valley/0 55.8,58.2 |or
|tip This pattern requires neutral reputation with the Scryers to purchase.
|tip You can complete the "City of Light" quest in Shattrath City and choose Allegiance to the Scryers to join them.
|tip You can also have another player with this reputation purchase the pattern for you, or you can purchase it from the auction house.
'|complete skill("Tailoring") >= 375 or knowsrecipe(26778) |or
step
use Pattern: Imbued Netherweave Tunic##21901
Train Imbued Netherweave Tunic |learn Imbued Netherweave Tunic##26778
stickystart "Collect_Netherweb_Spider_Silk_375"
step
collect 90 Bolt of Imbued Netherweave##21842 |or
|tip You created these in a previous step.
'|complete skill("Tailoring") >= 375 |or
step
label "Collect_Netherweb_Spider_Silk_375"
Kill Dreadfang enemies around this area
collect 30 Netherweb Spider Silk##21881 |or |goto Terokkar Forest/0 53.64,57.86
You can find more around here [52.22,78.65]
|tip Farm them from Dreadfang Spiders in Terokkar Forest or purchase them from the auction house.
'|complete skill("Tailoring") >= 375 |or
step
talk Dalinna##18749
|tip Inside the building.
buy 15 Rune Thread##14341 |goto Hellfire Peninsula/0 56.6,37.2 |or
'|complete skill("Tailoring") >= 375 |or
step
create 15 Imbued Netherweave Tunic##26778,Tailoring,375
|tip You may need to create more or less of these.
|tip Each additional Imbued Netherweave Tunic requires 6 Bolts of Imbued Netherweave, 2 Netherweb Spider Silk, and 1 Rune Thread.
step
_Congratulations!_
You Reached Skill 375 in Tailoring.
]])
ZygorGuidesViewer:RegisterGuide("Profession Guides\\Tailoring\\Farming Guides\\Linen Cloth",{
author="support@zygorguides.com",
},[[
step
Follow the path |goto Orgrimmar/0 52.00,57.84 < 15 |only if walking
Follow the path down |goto 56.07,41.08 < 10 |only if walking
Enter the Ragefire Chasm dungeon |goto 52.75,48.86 < 7 |c
|tip You may need a group for this.
step
Kill Ragefire enemies throughout the dungeon
collect Linen Cloth##2589 |n
]])
ZygorGuidesViewer:RegisterGuide("Profession Guides\\Tailoring\\Farming Guides\\Wool Cloth",{
author="support@zygorguides.com",
},[[
step
Follow the path up |goto The Barrens 62.21,7.28 < 15 |only if walking
Kill Venture Co. enemies around this area
|tip You can find more inside the mine.
collect Wool Cloth##2592 |n |goto 60.91,3.82
]])
ZygorGuidesViewer:RegisterGuide("Profession Guides\\Tailoring\\Farming Guides\\Silk Cloth",{
author="support@zygorguides.com",
},[[
step
Kill Galak enemies around this area
|tip You can find more inside the cave.
collect Silk Cloth##4306 |n |goto Thousand Needles 44.01,37.41
]])
ZygorGuidesViewer:RegisterGuide("Profession Guides\\Tailoring\\Farming Guides\\Mageweave Cloth",{
author="support@zygorguides.com",
},[[
step
Kill Dunemaul enemies around this area
collect Mageweave Cloth##4338 |n |goto Tanaris/0 40.50,55.50
]])
ZygorGuidesViewer:RegisterGuide("Profession Guides\\Tailoring\\Farming Guides\\Runecloth",{
author="support@zygorguides.com",
},[[
step
Kill Blackrock enemies around this area
|tip You can find more inside the building.
collect Runecloth###14047 |n |goto Burning Steppes 42.17,35.64
]])
ZygorGuidesViewer:RegisterGuide("Profession Guides\\Tailoring\\Farming Guides\\Felcloth",{
author="support@zygorguides.com",
},[[
step
Kill Jadefire enemies around this area
collect Felcloth##14256 |n |goto Felwood 37.17,67.00
You can find more around [32.71,66.66]
]])
ZygorGuidesViewer:RegisterGuide("Profession Guides\\Tailoring\\Farming Guides\\Mooncloth",{
author="support@zygorguides.com",
},[[
step
label "Farm_Felcloth"
Kill Jadefire enemies around this area
collect Felcloth##14256 |n |goto Felwood 37.17,67.00
Click here to transmute Felcloth into Mooncloth |confirm
|tip It only takes 2 Felcloth to make a Mooncloth, but it requires a rare Tailoring pattern and has a 4 day cooldown.
step
collect Mooncloth##14342 |n |goto Ashenvale 60.19,72.90
|tip This spell has a 4 day cooldown.
Click here to farm more Felcloth |confirm |next "Farm_Felcloth"
]])
ZygorGuidesViewer:RegisterGuide("Profession Guides\\Tailoring\\Farming Guides\\Spider's Silk",{
author="support@zygorguides.com",
},[[
step
Enter the cave |goto Wetlands 52.79,62.90 < 20 |walk
Kill enemies around this area
|tip Inside the cave.
collect Spider's Silk##3182 |n |goto 48.51,60.67
|tip These have a low drop rate.
]])
ZygorGuidesViewer:RegisterGuide("Profession Guides\\Tailoring\\Farming Guides\\Thick Spider's Silk",{
author="support@zygorguides.com",
},[[
step
Follow the path up |goto Eastern Plaguelands 77.56,47.20 < 10 |only if walking
Kill Crypt enemies around this area
|tip You can find more inside the nearby crypt buildings.
collect Thick Spider's Silk##4337 |n |goto 83.60,42.07
|tip These have a low drop rate.
]])
ZygorGuidesViewer:RegisterGuide("Profession Guides\\Tailoring\\Farming Guides\\Shadow Silk",{
author="support@zygorguides.com",
},[[
step
kill Deathstrike Tarantula##769+
collect Shadow Silk##10285 |n |goto Swamp of Sorrows 58.74,62.39
|tip These have a low drop rate.
You can find more around [66.70,68.65]
]])
ZygorGuidesViewer:RegisterGuide("Profession Guides\\Tailoring\\Farming Guides\\Ironweb Spider Silk",{
author="support@zygorguides.com",
},[[
step
kill Sand Skitterer##11738+
collect Ironweb Spider Silk##14227 |n |goto Silithus/0 56.25,26.22
|tip These have a low drop rate.
You can find more around: |notinsticky
[54.15,18.47]
[63.01,18.18]
[64.31,29.61]
[38.69,34.85]
[35.71,30.35]
[35.29,20.57]
]])
ZygorGuidesViewer:RegisterGuide("Profession Guides\\Tailoring\\Farming Guides\\Flask of Mojo",{
author="support@zygorguides.com",
},[[
step
Kill Skullsplitter enemies around this area
collect Flask of Mojo##8151 |n |goto Stranglethorn Vale/0 46.6,44.6
]])
ZygorGuidesViewer:RegisterGuide("Profession Guides\\Dropped\\Farming Guides\\Righteous Orb",{
author="support@zygorguides.com",
},[[
step
Enter the Stratholme Dungeon
|tip You will need to join and form a group for this.
Click Here Once You Have Entered the Dungeon |confirm
step
Make your way to the Crusaders' Square
|tip It will be to the left of the rat gate.
Kill Crimson enemies around this area
|tip All Crimson enemies in The Scarlet Bastion have a chance to drop the orb.
collect Righteous Orb##12811 |n
]])
ZygorGuidesViewer:RegisterGuide("Profession Guides\\Dropped\\Farming Guides\\Demonic Rune",{
author="support@zygorguides.com",
},[[
step
Follow the path up |goto Felwood 38.44,59.39 < 20 |only if walking
Continue following the path |goto 37.63,60.96 < 20 |only if walking
Continue following the path |goto 36.04,61.32 < 20 |only if walking
Enter the building |goto 35.39,58.61 < 20 |walk
Kill Jaedenar enemies around this area
collect Demonic Rune##12662 |n |goto 37.61,54.67
|tip These have a low drop rate.
]])
ZygorGuidesViewer:RegisterGuide("Profession Guides\\Dropped\\Farming Guides\\Dark Rune",{
author="support@zygorguides.com",
},[[
step
Enter the Scholomance Dungeon
|tip You will need to join and form a group for this.
Click Here Once You Have Entered the Dungeon |confirm
step
Kill enemies around this area
|tip Scholomance Necromancers and Scholomance Dark Summoners are the only enemies besides bosses that will drop them.
collect Dark Rune##20520 |n
|tip These have a low drop rate.
]])
ZygorGuidesViewer:RegisterGuide("Profession Guides\\Dropped\\Farming Guides\\Sharp Claw",{
author="support@zygorguides.com",
},[[
step
map Stonetalon Mountains
path follow smart; loop on; ants curved; dist 20
path	30.53,61.76	29.56,62.49	28.35,65.01	28.28,68.00	28.78,71.03
path	29.83,73.09	31.72,73.02	33.54,71.99	35.31,71.79	35.63,68.95
path	36.03,66.45	36.02,64.80	34.83,62.63	33.70,60.85	32.02,60.86
Kill enemies around this area
collect Sharp Claw##5635 |n
|tip These have a low drop rate.
]])
ZygorGuidesViewer:RegisterGuide("Profession Guides\\Dropped\\Farming Guides\\Ogre Tannin",{
author="support@zygorguides.com",
},[[
step
Enter the Dire Maul West Dungeon Entrance
|tip You will need to join and form a group for this.
Click Here Once You Have Entered the Dungeon |confirm
step
click Ogre Tannin Basket##179499
|tip It will be up the ramp past the broken trap.
|tip Once up the first ramp, it will be in the far northwest corner of the room.
|tip Only one person will be able to loot it.
collect Ogre Tannin##18240 |n
]])
ZygorGuidesViewer:RegisterGuide("Profession Guides\\Dropped\\Farming Guides\\Small Venom Sac",{
author="support@zygorguides.com",
},[[
step
Enter the mine |goto Silverpine Forest 35.64,13.54 < 20 |walk
Kill enemies around this area
|tip Inside the mine.
|tip You can find more outside the mine.
collect Small Venom Sac##1475 |n |goto 35.38,8.06
|tip These have a low drop rate.
]])
ZygorGuidesViewer:RegisterGuide("Profession Guides\\Dropped\\Farming Guides\\Huge Venom Sac",{
author="support@zygorguides.com",
},[[
step
map Silithus
path follow smart; loop on; ants curved; dist 20
path	54.03,30.39	56.79,33.30	59.06,30.91	61.29,30.65	63.54,31.68
path	66.19,30.35	65.86,26.61	64.78,22.29	63.17,18.92	61.66,15.66
path	60.22,13.51	58.24,13.36	56.02,11.72	54.46,13.22	52.99,12.72
path	51.43,13.97	49.68,16.23	51.34,19.02	51.78,22.20	52.37,25.34
path	52.30,29.17	52.30,29.17
Kill enemies around this area
collect Huge Venom Sac##19441 |n
|tip These have a low drop rate.
]])
ZygorGuidesViewer:RegisterGuide("Profession Guides\\Dropped\\Farming Guides\\Iridescent Pearl",{
author="support@zygorguides.com",
},[[
step
label "Path_One"
map Hillsbrad Foothills
path follow smart; loop off; ants curved; dist 20
path	23.74,64.84	24.78,66.48	25.16,70.22	27.62,72.13	29.97,72.75
path	32.48,72.00	34.29,68.67	36.49,68.49	39.57,68.88	42.36,68.25
path	44.91,66.23	46.75,64.48	49.03,64.21	51.79,63.89	53.48,64.06
path	54.48,61.39	55.38,62.11	55.73,64.18	57.86,68.24	59.21,72.14
path	61.40,75.49	64.60,77.38	65.64,80.33	66.91,85.51
Kill enemies along this path
collect Thick-shelled Clam##5524 |n
use the Thick-shelled Clam##5524
collect Iridescent Pearl##5500 |n
|tip These have a low drop rate.
'|goto 66.91,85.51 < 20 |noway |c
step
map Hillsbrad Foothills
path follow smart; loop off; ants curved; dist 20
path	66.91,85.51	65.64,80.33	64.60,77.38	61.40,75.49	59.21,72.14
path	57.86,68.24	55.73,64.18	55.38,62.11	54.48,61.39	53.48,64.06
path	51.79,63.89	49.03,64.21	46.75,64.48	44.91,66.23	42.36,68.25
path	39.57,68.88	36.49,68.49	34.29,68.67	32.48,72.00	29.97,72.75
path	27.62,72.13	25.16,70.22	24.78,66.48	23.74,64.84
Kill enemies along this path
collect Thick-shelled Clam##5524 |n
use the Thick-shelled Clam##5524
collect Iridescent Pearl##5500 |n
|tip These have a low drop rate.
'|goto 23.74,64.84 < 20 |noway |c |next "Path_One"
]])
ZygorGuidesViewer:RegisterGuide("Profession Guides\\Dropped\\Farming Guides\\Black Pearl",{
author="support@zygorguides.com",
},[[
step
map The Hinterlands
path follow smart; loop on; ants curved; dist 20
path	77.17,61.30	76.67,63.69	75.25,66.52	74.76,70.67	76.93,70.62
path	78.28,68.54	78.37,65.51	79.09,61.95	80.38,59.45	81.70,56.06
path	81.78,52.32	80.30,55.82	79.00,57.73
Kill Snapjaw enemies around this area
collect Big-mouth Clam##7973 |n
use the Big-mouth Clam##7973
collect Black Pearl##7971 |n
|tip These have a low drop rate.
]])
ZygorGuidesViewer:RegisterGuide("Profession Guides\\Dropped\\Farming Guides\\Golden Pearl",{
author="support@zygorguides.com",
},[[
step
map The Hinterlands
path follow smart; loop on; ants curved; dist 20
path	77.17,61.30	76.67,63.69	75.25,66.52	74.76,70.67	76.93,70.62
path	78.28,68.54	78.37,65.51	79.09,61.95	80.38,59.45	81.70,56.06
path	81.78,52.32	80.30,55.82	79.00,57.73
Kill Snapjaw enemies around this area
collect Big-mouth Clam##7973 |n
use the Big-mouth Clam##7973
collect Golden Pearl##13926 |n
|tip These have a low drop rate.
]])
ZygorGuidesViewer:RegisterGuide("Profession Guides\\Dropped\\Farming Guides\\Giant Egg",{
author="support@zygorguides.com",
},[[
step
Kill Roc enemies around this area
|tip They are found all around the zone.
collect Giant Egg##12207 |n |goto Tanaris/0 49.30,36.17
You can find more around: |notinsticky
[45.55,38.57]
[44.01,40.45]
[47.27,46.81]
]])
ZygorGuidesViewer:RegisterGuide("Profession Guides\\Dropped\\Farming Guides\\Zesty Clam Meat",{
author="support@zygorguides.com",
},[[
step
map The Hinterlands
path follow smart; loop on; ants curved; dist 20
path	77.17,61.30	76.67,63.69	75.25,66.52	74.76,70.67	76.93,70.62
path	78.28,68.54	78.37,65.51	79.09,61.95	80.38,59.45	81.70,56.06
path	81.78,52.32	80.30,55.82	79.00,57.73
Kill Snapjaw enemies around this area
collect Big-mouth Clam##7973 |n
use the Big-mouth Clam##7973
collect Zesty Clam Meat##7974 |n
]])
ZygorGuidesViewer:RegisterGuide("Profession Guides\\Blacksmithing\\Specialization\\Armorsmith\\Armorsmith Questline",{
author="support@zygorguides.com",
condition_suggested=function() return skill('Blacksmithing') >= 200 end,
description="This guide will walk you through completing the Armorsmith questline for the Blacksmithing profession.",
},[[
step
_NOTE ABOUT BLACKSMITHING SPECIALIZATION:_
|tip You can only have one Blacksmithing specialization.
|tip Additionally, you cannot change your specialization without unlearning the Blacksmithing profession, and leveling it up again.
|tip We recommend looking into the different options for Armorsmith and Weaponsmith Blacksmithing before you choose which to pursue, depending on your personal play style and the specific items you want to create.
|tip Most of the items you can create with the specializations are BoE, so you could also buy them from the AH or other players, but some of them are BoP and you would need to craft them to use them.
|tip If you change specializations, you will still be able to use the items you create.
Click Here to Continue |confirm
step
Reach Level 40 |ding 40
|tip You must be at least this level before you can begin this questline.
|tip Use the leveling guides to accomplish this.
step
Reach Level 245 Blacksmithing |skill Blacksmithing,245
|tip You must be at least this level with your Blacksmithing profession before you can create some of the item needed in this questline.
|tip Use the "Blacksmithing (1-300)" guide to accomplish this.
step
talk Okothos Ironrager##11177
accept The Art of the Armorsmith##5301 |goto Orgrimmar/0 79.81,24.05
step
Enter the building |goto 81.61,22.77 < 5 |walk
talk Saru Steelfury##3355
|tip Inside the building.
learn Heavy Grinding Stone##3337 |goto 82.34,22.97
learn Solid Grinding Stone##9920 |goto 82.34,22.97
learn Steel Breastplate##9916 |goto 82.34,22.97
learn Steel Plate Helm##9935 |goto 82.34,22.97
step
_Collect These Items:_
|tip If you have the Mining profession, you can gather these.
|tip Search the guide menu for the item(s) to use the farming guides.
|tip You can also purchase them from the Auction House.
collect 120 Steel Bar##3859 |q 2756 |future
collect 36 Heavy Stone##2838 |q 2756 |future
collect 16 Solid Stone##7912 |q 2756 |future
step
collect 12 Heavy Grinding Stone##3486 |q 2756 |future
step
collect 4 Solid Grinding Stone##7966 |q 2756 |future
step
collect 4 Steel Breastplate##7963 |goto Orgrimmar/0 79.76,22.99 |q 2756 |future
|tip Stand next to the anvil.
step
collect 4 Steel Plate Helm##7922 |goto 79.76,22.99 |q 2756 |future
|tip Stand next to the anvil.
step
talk Aturk the Anvil##7792
accept The Old Ways##2756 |goto 80.94,23.32
step
talk Aturk the Anvil##7792
turnin The Old Ways##2756 |goto 80.94,23.32
learn Orcish War Leggings##9957 |goto 80.94,23.32
|tip You will learn this automatically.
step
talk Ox##7793
accept Booty Bay or Bust!##2757 |goto 80.45,23.50
step
Run up the ramp |goto Stranglethorn Vale 27.85,76.75 < 7 |only if walking
Follow the path |goto Stranglethorn Vale 28.40,75.77 < 7 |only if walking
talk McGavan##7794
turnin Booty Bay or Bust!##2757 |goto Stranglethorn Vale 28.87,75.42
accept The Mithril Order##2760 |goto Stranglethorn Vale 28.87,75.42
step
Enter the building |goto 28.95,75.34 < 5 |walk
talk Brikk Keencraft##2836
|tip Inside the building.
learn Heavy Mithril Breastplate##9959 |goto 28.99,75.55
learn Mithril Coif##9961 |goto 28.99,75.55
learn Heavy Mithril Boots##9968 |goto 28.99,75.55
step
_Collect These Items:_
|tip If you have the Mining profession, you can gather these.
|tip Search the guide menu for the item(s) to use the farming guides.
|tip You can also purchase them from the Auction House.
collect 40 Iron Bar##3575 |q 2761 |future
collect 120 Mithril Bar##3860 |q 2763 |future
collect 5 Truesilver Bar##6037 |q 2762 |future
collect 4 Citrine##3864 |q 2763 |future
step
Enter the tunnel |goto 27.95,73.61 < 10 |only if walking
Leave the tunnel |goto 29.59,72.46 < 10 |only if walking
Follow the road |goto 30.96,71.70 < 30 |only if walking
Continue following the road |goto 33.46,55.53 < 30 |only if walking
Continue following the road |goto 36.15,48.91 < 30 |only if walking
Follow the path |goto 44.00,26.14 < 30 |only if walking
Follow the path up |goto 47.03,22.84 < 15 |only if walking
talk Galvan the Ancient##7802
turnin The Mithril Order##2760 |goto 50.62,20.48
accept Smelt On, Smelt Off##2761 |goto 50.62,20.48
accept The Great Silver Deceiver##2762 |goto 50.62,20.48
accept The Art of the Imbue##2763 |goto 50.62,20.48
step
talk Galvan the Ancient##7802
turnin Smelt On, Smelt Off##2761 |goto 50.62,20.48
turnin The Great Silver Deceiver##2762 |goto 50.62,20.48
turnin The Art of the Imbue##2763 |goto 50.62,20.48
accept Expert Blacksmith!##2765 |goto 50.62,20.48
step
Watch the dialogue
Watch Galvan Work |q 2765/1 |goto 50.57,20.37
step
talk Galvan the Ancient##7802
turnin Expert Blacksmith!##2765 |goto 50.57,20.37
accept Galvan's Finest Pupil##2764 |goto 50.57,20.37
step
use the Plans: Ornate Mithril Pants##7983
learn Ornate Mithril Pants##9945
step
use the Plans: Ornate Mithril Gloves##7984
learn Ornate Mithril Gloves##9950
step
use the Plans: Ornate Mithril Shoulder##7985
learn Ornate Mithril Shoulders##9952
step
_Collect These Items:_
|tip If you have the Mining profession, you can gather these.
|tip Search the guide menu for the item(s) to use the farming guides.
|tip You can also purchase them from the Auction House.
collect 114 Mithril Bar##3860 |q 2773 |future
collect 3 Truesilver Bar##6037 |q 2773 |future
collect Aquamarine##7909 |q 2772 |future
collect 8 Solid Stone##7912 |q 2773 |future
collect 14 Thick Leather##4304 |q 2772 |future
|tip If you have the Skinning profession, you can gather this.
collect 18 Mageweave Cloth##4338 |q 2773 |future
step
talk Trenton Lighthammer##7804
turnin Galvan's Finest Pupil##2764 |goto Tanaris/0 51.42,28.75
accept A Good Head On Your Shoulders##2771 |goto Tanaris/0 51.42,28.75
accept The World At Your Feet##2772 |goto Tanaris/0 51.42,28.75
accept The Mithril Kid##2773 |goto Tanaris/0 51.42,28.75
step
collect 2 Solid Grinding Stone##7966 |q 2773
step
collect 2 Mithril Coif##7931 |q 2771/1 |goto 51.42,28.75
|tip Stand next to the anvil.
step
collect Mithril Coif##7931 |q 2771/2 |goto 51.42,28.75
|tip Stand next to the anvil.
step
talk Trenton Lighthammer##7804
turnin A Good Head On Your Shoulders##2771 |goto 51.42,28.75
learn Ornate Mithril Helm##9980 |goto 51.42,28.75
|tip You will learn this automatically.
step
collect 2 Heavy Mithril Boots##7933 |q 2772/1 |goto 51.42,28.75
|tip Stand next to the anvil.
step
collect Ornate Mithril Pants##7926 |q 2771/2 |goto 51.42,28.75
|tip Stand next to the anvil.
step
talk Trenton Lighthammer##7804
turnin The World At Your Feet##2772 |goto 51.42,28.75
learn Ornate Mithril Boots##9979 |goto 51.42,28.75
|tip You will learn this automatically.
step
collect 2 Heavy Mithril Breastplate##7930 |q 2773/1 |goto 51.42,28.75
|tip Stand next to the anvil.
step
collect Ornate Mithril Gloves##7927 |q 2773/2 |goto 51.42,28.75
|tip Stand next to the anvil.
step
talk Trenton Lighthammer##7804
turnin The Mithril Kid##2773 |goto 51.42,28.75
learn Ornate Mithril Breastplate##9972 |goto 51.42,28.75
|tip You will learn this automatically.
step
talk Trenton Lighthammer##7804
accept Did You Lose This?##3321 |goto 51.42,28.75
step
Watch the dialogue
Watch Trenton Work |q 3321/1 |goto 51.42,28.76
step
talk Trenton Lighthammer##7804
turnin Did You Lose This?##3321 |goto 51.42,28.76
step
_Collect These Items:_
|tip If you have the Mining profession, you can gather most these.
|tip Search the guide menu for the item(s) to use the farming guides.
|tip You can also purchase them from the Auction House.
collect 108 Mithril Bar##3860 |q 5301
collect 18 Truesilver Bar##6037 |q 5301
collect 2 Aquamarine##7909 |q 5301
collect 28 Solid Stone##7912 |q 5301
collect 4 Black Pearl##7971 |q 5301
collect Heart of Fire##7077 |q 5301
collect 8 Thick Leather##4304 |q 5301
|tip If you have the Skinning profession, you can gather this.
step
collect 7 Solid Grinding Stone##7966 |q 5301
step
collect 4 Ornate Mithril Helm##7937 |q 5301/1 |goto Orgrimmar/0 79.76,22.99
|tip Stand next to the anvil.
step
collect 2 Ornate Mithril Boots##7936 |q 5301/2 |goto 79.76,22.99
|tip Stand next to the anvil.
step
collect Ornate Mithril Breastplate##7935 |q 5301/3 |goto 79.76,22.99
|tip Stand next to the anvil.
step
talk Okothos Ironrager##11177
turnin The Art of the Armorsmith##5283 |goto 79.81,24.05
learn Armorsmith##9788 |goto 79.81,24.05
|tip You will learn this automatically.
step
_Congratulations!_
|tip You have become an Blacksmithing Armorsmith.
Learn Plans From Okothos Ironrager at [Orgrimmar 79.81,24.05]
]])
ZygorGuidesViewer:RegisterGuide("Profession Guides\\Blacksmithing\\Specialization\\Weaponsmith\\Weaponsmith Questline",{
author="support@zygorguides.com",
condition_suggested=function() return skill('Blacksmithing') >= 200 end,
description="This guide will walk you through completing the Weaponsmith questline for the Blacksmithing profession.",
},[[
step
_NOTE ABOUT BLACKSMITHING SPECIALIZATION:_
|tip You can only have one Blacksmithing specialization.
|tip Additionally, you cannot change your specialization without unlearning the Blacksmithing profession, and leveling it up again.
|tip We recommend looking into the different options for Armorsmith and Weaponsmith Blacksmithing before you choose which to pursue, depending on your personal play style and the specific items you want to create.
|tip Most of the items you can create with the specializations are BoE, so you could also buy them from the AH or other players, but some of them are BoP and you would need to craft them to use them.
|tip If you change specializations, you will still be able to use the items you create.
Click Here to Continue |confirm
step
Reach Level 40 |ding 40
|tip You must be at least this level before you can begin this questline.
|tip Use the leveling guides to accomplish this.
step
Reach Level 230 Blacksmithing |skill Blacksmithing,230
|tip You must be at least this level with your Blacksmithing profession before you can create some of the item needed in this questline.
|tip Use the "Blacksmithing (1-300)" guide to accomplish this.
step
talk Borgosh Corebender##11178
accept The Way of the Weaponsmith##5302 |goto Orgrimmar/0 79.42,23.73
step
Run up the ramp |goto Stranglethorn Vale 27.85,76.75 < 7 |only if walking
Follow the path |goto Stranglethorn Vale 28.40,75.77 < 7 |only if walking
Enter the building |goto Stranglethorn Vale 28.95,75.34 < 5 |walk
talk Brikk Keencraft##2836
|tip Inside the building.
learn Heavy Grinding Stone##3337 |goto Stranglethorn Vale 28.99,75.55
learn Solid Grinding Stone##9920 |goto Stranglethorn Vale 28.99,75.55
learn Heavy Mithril Axe##9993 |goto Stranglethorn Vale 28.99,75.55
learn Big Black Mace##10001 |goto Stranglethorn Vale 28.99,75.55
step
Leave the building |goto 28.95,75.34 < 5 |walk
Jump down and enter the building |goto 28.48,75.57 < 5 |walk
talk Zarena Cromwind##2482
|tip Inside the building.
buy Plans: Moonsteel Broadsword##12163 |n
|tip This is a limited supply item.
|tip If she doesn't have it for sale, check the Auction House.
use the Plans: Moonsteel Broadsword##12163
learn Moonsteel Broadsword##3496 |goto 28.33,75.47
step
talk Vharr##1146
buy Plans: Massive Iron Axe##12164 |n
|tip This is a limited supply item.
|tip If she doesn't have it for sale, check the Auction House.
use the Plans: Massive Iron Axe##12164
learn Massive Iron Axe##3498 |goto 32.36,27.95
Also check Jaquilina Dramet located at [Stranglethorn Vale 35.75,10.66]
step
_Collect These Items:_
|tip If you have the Mining profession, you can gather these.
|tip Search the guide menu for the item(s) to use the farming guides.
|tip You can also purchase them from the Auction House.
collect 32 Steel Bar##3859 |q 5302
collect 56 Mithril Bar##3860 |q 5302
collect 56 Iron Bar##3575 |q 5302
collect 16 Gold Bar##3577 |q 5302
collect 48 Heavy Stone##2838 |q 5302
collect 16 Solid Stone##7912 |q 5302
collect 4 Citrine##3864 |q 5302
collect 2 Black Pearl##7971 |q 5302
collect 8 Shadowgem##1210 |q 5302
collect 12 Lesser Moonstone##1705 |q 5302
collect 28 Heavy Leather##4234 |q 5302
|tip If you have the Skinning profession, you can gather this.
collect 4 Thick Leather##4304 |q 5302
|tip If you have the Skinning profession, you can gather this.
step
Enter the building |goto Orgrimmar/0 81.60,22.77 < 5 |walk
talk Sumi##3356
|tip Inside the building.
buy 16 Strong Flux##3466 |goto Orgrimmar/0 82.60,23.96 |q 5302
step
collect 4 Solid Grinding Stone##7966 |q 5302
step
collect 16 Heavy Grinding Stone##3486 |q 5302
step
collect 4 Moonsteel Broadsword##3853 |q 5302/1 |goto 79.76,22.99
|tip Stand next to the anvil.
step
collect 4 Massive Iron Axe##3855 |q 5302/2 |goto 79.76,22.99
|tip Stand next to the anvil.
step
collect 2 Heavy Mithril Axe##7941 |q 5302/3 |goto 79.76,22.99
|tip Stand next to the anvil.
step
collect 2 Big Black Mace##7945 |q 5302/4 |goto 79.76,22.99
|tip Stand next to the anvil.
step
talk Borgosh Corebender##11178
turnin The Way of the Weaponsmith##5302 |goto 79.42,23.73
learn Weaponsmith##9787 |goto 79.42,23.73
|tip You will learn this automatically.
step
_Congratulations!_
|tip You have become an Blacksmithing Weaponsmith.
Learn Plans From Borgosh Corebender at [Orgrimmar 79.42,23.73]
|tip You can continue your specialization by choosing from 3 paths:
|tip Master Axesmith
|tip Master Hammersmith
|tip Master Swordsmith
|tip Search the guide menu for the title above to find the questline guide associated with it.
]])
ZygorGuidesViewer:RegisterGuide("Profession Guides\\Blacksmithing\\Specialization\\Weaponsmith\\Master Axesmith Questline",{
author="support@zygorguides.com",
description="This guide will walk you through completing the Master Axesmith questline to continue Weaponsmith specialization for the Blacksmithing profession.",
},[[
step
_NOTE ABOUT BLACKSMITHING SPECIALIZATION:_
|tip You can only have one Blacksmithing specialization.
|tip Additionally, you cannot change your specialization without unlearning the Blacksmithing profession, and leveling it up again.
|tip We recommend looking into the different options for Armorsmith and Weaponsmith Blacksmithing before you choose which to pursue, depending on your personal play style and the specific items you want to create.
|tip Most of the items you can create with the specializations are BoE, so you could also buy them from the AH or other players, but some of them are BoP and you would need to craft them to use them.
|tip If you change specializations, you will still be able to use the items you create.
Click Here to Continue |confirm
step
learn Weaponsmith##9787
|tip You must become a Weaponsmith before you can begin this questline.
|tip Use the "Weaponsmith Questline" guide to accomplish this.
step
Reach Level 50 |ding 50
|tip You must be at least this level before you can begin this questline.
|tip Use the leveling guides to accomplish this.
step
Reach Level 250 Blacksmithing |skill Blacksmithing,250
|tip You must be at least this level with your Blacksmithing profession before you can begin this questline.
|tip Use the "Blacksmithing (1-300)" guide to accomplish this.
step
Follow the path |goto Winterspring 60.56,38.20 < 7 |only if walking
Enter the building |goto Winterspring 61.33,37.36 < 7 |walk
talk Kilram##11192
|tip Inside the building.
accept Snakestone of the Shadow Huntress##5306 |goto Winterspring 61.30,37.07
step
kill Shadow Hunter Vosh'gajin##9236
|tip She is a boss inside the Lower Blackrock Spire dungeon.
|tip Use the "Lower Blackrock Spire" dungeon guide to accomplish this.
collect Vosh'gajin's Snakestone##13352 |q 5306/1
step
Follow the path |goto Winterspring 60.56,38.20 < 7 |only if walking
Enter the building |goto Winterspring 61.33,37.36 < 7 |walk
talk Kilram##11192
|tip Inside the building.
turnin Snakestone of the Shadow Huntress##5306 |goto Winterspring 61.30,37.07
step
talk Kilram##11192
|tip Inside the building.
Tell him _"Please teach me how to become an axesmith, Kilram."_
learn Master Axesmith##17041 |goto 61.30,37.07
step
Reach Level 275 Blacksmithing |skill Blacksmithing,275
|tip You must be at least this level with your Blacksmithing profession before you can learn the plans in the next step.
|tip Use the "Blacksmithing (1-300)" guide to accomplish this.
step
use the Plans: Dawn's Edge##12821
learn Dawn's Edge##16970
step
_Congratulations!_
|tip You have become a Master Axesmith.
]])
ZygorGuidesViewer:RegisterGuide("Profession Guides\\Blacksmithing\\Specialization\\Weaponsmith\\Master Hammersmith Questline",{
author="support@zygorguides.com",
description="This guide will walk you through completing the Master Hammersmith questline to continue Weaponsmith specialization for the Blacksmithing profession.",
},[[
step
_NOTE ABOUT BLACKSMITHING SPECIALIZATION:_
|tip You can only have one Blacksmithing specialization.
|tip Additionally, you cannot change your specialization without unlearning the Blacksmithing profession, and leveling it up again.
|tip We recommend looking into the different options for Armorsmith and Weaponsmith Blacksmithing before you choose which to pursue, depending on your personal play style and the specific items you want to create.
|tip Most of the items you can create with the specializations are BoE, so you could also buy them from the AH or other players, but some of them are BoP and you would need to craft them to use them.
|tip If you change specializations, you will still be able to use the items you create.
Click Here to Continue |confirm
step
learn Weaponsmith##9787
|tip You must become a Weaponsmith before you can begin this questline.
|tip Use the "Weaponsmith Questline" guide to accomplish this.
step
Reach Level 50 |ding 50
|tip You must be at least this level before you can begin this questline.
|tip Use the leveling guides to accomplish this.
step
Reach Level 250 Blacksmithing |skill Blacksmithing,250
|tip You must be at least this level with your Blacksmithing profession before you can begin this questline.
|tip Use the "Blacksmithing (1-300)" guide to accomplish this.
step
Follow the path |goto Winterspring 60.56,38.20 < 7 |only if walking
Enter the building |goto Winterspring 61.33,37.36 < 7 |walk
talk Lilith the Lithe##11191
|tip Inside the building.
accept Sweet Serenity##5305 |goto Winterspring 61.33,37.13
step
kill Crimson Hammersmith##11120
|tip He is a boss inside the Main Gate section of the Stratholme dungeon.
|tip Use the "Stratholme" dungeon guide to accomplish this.
collect Crimson Hammersmith's Apron##13351 |q 5305/1
step
Follow the path |goto Winterspring 60.56,38.20 < 7 |only if walking
Enter the building |goto Winterspring 61.33,37.36 < 7 |walk
talk Lilith the Lithe##11191
|tip Inside the building.
turnin Sweet Serenity##5305 |goto Winterspring 61.33,37.13
step
talk Lilith the Lithe##11191
|tip Inside the building.
Tell him _"Please teach me how to become a hammersmith, Lilith."_
learn Master Hammersmith##17040 |goto 61.33,37.13
step
Reach Level 280 Blacksmithing |skill Blacksmithing,280
|tip You must be at least this level with your Blacksmithing profession before you can learn the plans in the next step.
|tip Use the "Blacksmithing (1-300)" guide to accomplish this.
step
use the Plans: Enchanted Battlehammer##12824
learn Enchanted Battlehammer##16973
step
_Congratulations!_
|tip You have become a Master Hammersmith.
]])
ZygorGuidesViewer:RegisterGuide("Profession Guides\\Blacksmithing\\Specialization\\Weaponsmith\\Master Swordsmith Questline",{
author="support@zygorguides.com",
description="This guide will walk you through completing the Master Swordsmith questline to continue Weaponsmith specialization for the Blacksmithing profession.",
},[[
step
_NOTE ABOUT BLACKSMITHING SPECIALIZATION:_
|tip You can only have one Blacksmithing specialization.
|tip Additionally, you cannot change your specialization without unlearning the Blacksmithing profession, and leveling it up again.
|tip We recommend looking into the different options for Armorsmith and Weaponsmith Blacksmithing before you choose which to pursue, depending on your personal play style and the specific items you want to create.
|tip Most of the items you can create with the specializations are BoE, so you could also buy them from the AH or other players, but some of them are BoP and you would need to craft them to use them.
|tip If you change specializations, you will still be able to use the items you create.
Click Here to Continue |confirm
step
learn Weaponsmith##9787
|tip You must become a Weaponsmith before you can begin this questline.
|tip Use the "Weaponsmith Questline" guide to accomplish this.
step
Reach Level 50 |ding 50
|tip You must be at least this level before you can begin this questline.
|tip Use the leveling guides to accomplish this.
step
Reach Level 250 Blacksmithing |skill Blacksmithing,250
|tip You must be at least this level with your Blacksmithing profession before you can begin this questline.
|tip Use the "Blacksmithing (1-300)" guide to accomplish this.
step
Follow the path |goto Winterspring 60.56,38.20 < 7 |only if walking
Enter the building |goto Winterspring 61.33,37.36 < 7 |walk
talk Seril Scourgebane##11193
|tip Inside the building.
accept Corruption##5307 |goto Winterspring 61.33,37.19
step
kill Black Guard Swordsmith##11121
|tip He is a boss inside the Service Gate section of the Stratholme dungeon.
|tip Use the "Stratholme" dungeon guide to accomplish this.
collect Insignia of the Black Guard##13350 |q 5307/1
step
Follow the path |goto Winterspring 60.56,38.20 < 7 |only if walking
Enter the building |goto Winterspring 61.33,37.36 < 7 |walk
talk Seril Scourgebane##11193
|tip Inside the building.
turnin Corruption##5307 |goto Winterspring 61.33,37.19
step
talk Seril Scourgebane##11193
|tip Inside the building.
Tell him _"Please teach me how to become a swordsmith, Seril."_
learn Master Swordsmith##17039 |goto 61.33,37.19
step
Reach Level 280 Blacksmithing |skill Blacksmithing,280
|tip You must be at least this level with your Blacksmithing profession before you can learn the plans in the next step.
|tip Use the "Blacksmithing (1-300)" guide to accomplish this.
step
use the Plans: Blazing Rapier##12825
learn Blazing Rapier##16978
step
_Congratulations!_
|tip You have become a Master Swordsmith.
]])
ZygorGuidesViewer:RegisterGuide("Profession Guides\\Blacksmithing\\Specialization\\How to Change Blacksmithing Specialization",{
author="support@zygorguides.com",
description="This guide will walk you through changing your Blacksmithing profession specialization.",
},[[
step
_NOTE:_
|tip You MUST fully complete the questline for either Armorsmith or Weaponsmith before you can switch specializations.
Click Here to Continue |confirm
step
Unlearn Blacksmithing |condition skill("Blacksmithing") == 0
|tip Press "K" to open your Skills tab.
|tip You must completely unlearn the Blacksmithing profession to be able to switch your specialization.
step
Reach Level 40 |ding 40
|tip Use the leveling guides to accomplish this.
|tip You must be at least level 30 to be able to start the questlines to choose an Blacksmithing specialization.
step
Reach Level 200 Blacksmithing |condition skill("Blacksmithing") >= 200
|tip Use the "Blacksmithing (1-300)" guide to accomplish this.
|tip You must be at least level 200 Blacksmithing to be able to start the questlines to choose an Blacksmithing specialization.
step
Follow the path |goto Tanaris/0 64.90,22.54 < 30 |only if walking
Enter the building |goto Tanaris/0 65.41,18.56 < 7 |walk
click Book "Soothsaying for Dummies"
|tip Inside the building.
|tip Choose the dialogue option that matches what you want to do.
]])
ZygorGuidesViewer:RegisterGuide("Profession Guides\\Engineering\\Specialization\\Gnomish Engineering\\Gnomish Engineering Questline",{
author="support@zygorguides.com",
condition_suggested=function() return skill('Engineering') >= 200 end,
description="This guide will walk you through completing the Gnomish Engineering questline for the Engineering profession.",
},[[
step
_NOTE ABOUT GNOMISH ENGINEERING:_
|tip You cannot specialize in both Gnomish and Goblin Engineering.
|tip Additionally, you cannot change your specialization without unlearning the Engineering profession, and leveling it up again.
|tip We recommend looking into the differences between Gnomish and Goblin Engineering before you choose which to pursue, depending on your personal play style and the specific items you want to create.
|tip You can create some of the most desirable Bind On Pickup trinkets for a specialization, unlearn Engineering to level it up again to learn the other specialization.
|tip If you change specializations, you will still be able to use the items you create, unless they specifically require Gnomish Engineering to use it.
Click Here to Continue |confirm
step
Reach Level 30 |ding 30
|tip You must be at least this level before you can begin this questline.
|tip Use the leveling guides to accomplish this.
step
Reach Level 200 Engineering |skill Engineering,200
|tip You must be at least level 200 with your Engineering profession before you can begin this questline.
|tip Use the "Engineering (1-300)" guide to accomplish this.
step
Enter the building |goto The Barrens 62.89,36.52 < 7 |walk
talk Tinkerwiz##3494
|tip Inside the building.
accept Gnome Engineering##3637 |goto The Barrens 62.67,36.31
step
Leave the building |goto 62.89,36.52 < 7 |walk
Run up the ramp |goto Stranglethorn Vale 26.92,73.62 < 7 |only if walking
Follow the path |goto Stranglethorn Vale 28.10,73.96 < 7 |only if walking
Enter the building |goto Stranglethorn Vale 28.29,76.16 < 5 |walk
talk Oglethorpe Obnoticus##7406
|tip Inside the building.
turnin Gnome Engineering##3637 |goto Stranglethorn Vale 28.36,76.35
accept The Pledge of Secrecy##3642 |goto Stranglethorn Vale 28.36,76.35
step
use Oglethorpe's Pledge of Secrecy##10794
collect Oglethorpe's Signed Pledge##11282 |q 3642/1
step
talk Oglethorpe Obnoticus##7406
|tip Inside the building.
turnin The Pledge of Secrecy##3642 |goto 28.36,76.35
accept Show Your Work##3643 |goto 28.36,76.35
step
Enter the building |goto 28.11,74.99 < 7 |walk
talk Mazk Snipeshot##2685
|tip Inside the building.
buy Schematic: Accurate Scope##13310
|tip This is a limited supply item.
|tip If he doesn't have it for sale, check the Auction House.
use the Schematic: Accurate Scope##13310
learn Accurate Scope##3979 |goto 28.50,75.12
step
Enter the building |goto Orgrimmar/0 75.23,24.61 < 5 |walk
talk Roxxik##11017
|tip Inside the building.
learn Bronze Framework##3953 |goto Orgrimmar/0 76.17,25.17
learn Gold Power Core##12584 |goto Orgrimmar/0 76.17,25.17
learn Iron Strut##3958 |goto Orgrimmar/0 76.17,25.17
learn Gyrochronatom##3961 |goto Orgrimmar/0 76.17,25.17
learn Advanced Target Dummy##3965 |goto Orgrimmar/0 76.17,25.17
step
talk Sovik##3413
|tip Inside the building.
buy Weak Flux##2880 |goto 75.48,25.36
step
_Collect These Items:_
|tip If you have the Mining profession, you can gather these.
|tip Search the guide menu for the item(s) to use the farming guides.
|tip You can also purchase them from the Auction House.
collect 18 Mithril Bar##3860 |q 3643
collect 6 Bronze Bar##2841 |q 3643
collect Jade##1529 |q 3643
collect Citrine##3864 |q 3643
collect 6 Iron Bar##3575 |q 3643
collect Gold Bar##3577 |q 3643
collect 2 Medium Leather##2319 |q 3643
|tip If you have the Skinning profession, you can gather this.
collect 8 Heavy Leather##4234 |q 3643
|tip If you have the Skinning profession, you can gather this.
collect 2 Wool Cloth##2592 |q 3643
step
Run up the ramp |goto Stranglethorn Vale 26.92,73.62 < 7 |only if walking
Follow the path |goto Stranglethorn Vale 28.10,73.96 < 7 |only if walking
Enter the building |goto Stranglethorn Vale 28.95,75.33 < 5 |walk
|tip Stand next to the anvil.
|tip Inside the building.
collect 6 Mithril Tube##10559 |q 3643/1 |goto Stranglethorn Vale 28.95,75.48
step
collect Bronze Tube##4371 |goto 28.95,75.48 |q 3643
|tip Stand next to the anvil.
|tip Inside the building.
step
collect Accurate Scope##4407 |q 3643/2
step
collect 2 Iron Strut##4387 |goto 28.95,75.48 |q 3643
|tip Stand next to the anvil.
|tip Inside the building.
step
collect 2 Bronze Framework##4382 |q 3643
step
collect 2 Gold Power Core##10558 |goto 28.95,75.48 |q 3643
|tip Stand next to the anvil.
|tip Inside the building.
|tip This schematic will give you 3 of these.
step
collect 2 Gyrochronatom##4389 |goto 28.95,75.48 |q 3643
|tip Stand next to the anvil.
|tip Inside the building.
step
collect 2 Advanced Target Dummy##4392 |q 3643/3 |goto 28.95,75.48
|tip Stand next to the anvil.
|tip Inside the building.
step
Leave the building |goto 28.95,75.33 < 5 |walk
Enter the building |goto 28.29,76.16 < 5 |walk
talk Oglethorpe Obnoticus##7406
|tip Inside the building.
turnin Show Your Work##3643 |goto 28.36,76.35
step
_Congratulations!_
|tip You have earned your Gnome Engineer Membership Card.
|tip This card allows you to learn Gnomish Engineering schematics from Oglethorpe Obnoticus.
|tip This item will last for 14 days of in-game play time.
|tip The time will not count down when you are logged out, so it will last a long time.
|tip You can only learn Gnomish Engineering schematics while you have this item in your bags.
|tip When the time runs out, you can renew the card, if you need to.
|tip Use the "Gnomish Engineering Card Renewal" guide to renew the card.
Learn Schematics From Oglethorpe Obnoticus at [Stranglethorn Vale 28.36,76.35]
|tip On the upper dock, inside the building.
]])
ZygorGuidesViewer:RegisterGuide("Profession Guides\\Engineering\\Specialization\\Gnomish Engineering\\Gnome Engineer Membership Card Renewal",{
author="support@zygorguides.com",
description="This guide will walk you through renewing your Gnome Engineer Membership Card, as well as using the Gnome Engineer's Renewal Gifts to collect rare schematics.",
},[[
step
Enter the building |goto Stranglethorn Vale 28.29,76.16 < 5 |walk
talk Oglethorpe Obnoticus##7406
|tip Inside the building.
accept Membership Card Renewal##3645 |goto Stranglethorn Vale 28.36,76.35
|tip You must have the Gnomish Engineering specialization to be able to complete this quest.
|tip This quest requires 2 gold to complete.
|tip This will keep your Gnome Engineer Membership Card active for another 14 days of played time.
step
collect Gnome Engineer's Renewal Gift##11423 |n
|tip You will receive one of these in your mailbo 24 hours after renewing your membership card.
|tip You can destroy and renew your membership card repeatedly, if you want more of them to open.
|tip You don't need to wait for the card to expire on its own.
use the Gnome Engineer's Renewal Gift##11423
|tip These will contain some Engineer crafting supplies.
|tip The rare schematic for the "Lil' Smoky" pet also has a chance to be inside.
]])
ZygorGuidesViewer:RegisterGuide("Profession Guides\\Engineering\\Specialization\\Goblin Engineering\\Goblin Engineering Questline",{
author="support@zygorguides.com",
condition_suggested=function() return skill('Engineering') >= 200 end,
description="This guide will walk you through completing the Goblin Engineering questline for the Engineering profession.",
},[[
step
_NOTE ABOUT GOBLIN ENGINEERING:_
|tip You cannot specialize in both Gnomish and Goblin Engineering.
|tip Additionally, you cannot change your specialization without unlearning the Engineering profession, and leveling it up again.
|tip We recommend looking into the differences between Gnomish and Goblin Engineering before you choose which to pursue, depending on your personal play style and the specific items you want to create.
|tip You can create some of the most desirable Bind On Pickup trinkets for a specialization, unlearn Engineering to level it up again to learn the other specialization.
|tip If you change specializations, you will still be able to use the items you create, unless they specifically require Goblin Engineering to use it.
Click Here to Continue |confirm
step
Reach Level 30 |ding 30
|tip You must be at least this level before you can begin this questline.
|tip Use the leveling guides to accomplish this.
step
Reach Level 200 Engineering |skill Engineering,200
|tip You must be at least level 200 with your Engineering profession before you can begin this questline.
|tip Use the "Engineering (1-300)" guide to accomplish this.
step
Enter the building |goto The Barrens 62.89,36.52 < 7 |walk
talk Tinkerwiz##3494
|tip Inside the building.
accept Goblin Engineering##3633 |goto The Barrens 62.67,36.31
step
Leave the building |goto 62.89,36.52 < 7 |walk
Enter the building |goto Tanaris/0 52.39,27.30 < 5 |walk
talk Nixx Sprocketspring##8126
|tip Inside the building.
turnin Goblin Engineering##3633 |goto Tanaris/0 52.48,27.33
accept The Pledge of Secrecy##3638 |goto Tanaris/0 52.48,27.33
step
use Nixx's Pledge of Secrecy##10792
collect Nixx's Signed Pledge##11270 |q 3638/1
step
talk Nixx Sprocketspring##8126
|tip Inside the building.
turnin The Pledge of Secrecy##3638 |goto 52.48,27.33
accept Show Your Work##3639 |goto 52.48,27.33
step
_Collect These Items:_
|tip If you have the Mining profession, you can gather these.
|tip Search the guide menu for the item(s) to use the farming guides.
|tip You can also purchase them from the Auction House.
collect 30 Iron Bar##3575 |q 3639
collect 40 Heavy Stone##2838 |q 3639
collect 2 Silver Bar##2842 |q 3639
collect 20 Solid Stone##7912 |q 3639
collect 10 Silk Cloth##4306 |q 3639
collect 20 Bronze Bar##2841 |q 3639
collect 5 Medium Leather##2319 |q 3639
|tip If you have the Skinning profession, you can gather this.
collect 20 Wool Cloth##2592 |q 3639
step
talk Buzzek Bracketswing##8736
learn Big Iron Bomb##3967 |goto Tanaris/0 52.34,27.72
learn Solid Dynamite##12586 |goto 52.34,27.72
learn Explosive Sheep##3955 |goto 52.34,27.72
learn Solid Blasting Powder##12585 |goto 52.34,27.72
learn Bronze Framework##3953 |goto 52.34,27.72
learn Heavy Blasting Powder##3945 |goto 52.34,27.72
learn Whirring Bronze Gizmo##3942 |goto 52.34,27.72
learn Silver Contact##3973 |goto 52.34,27.72
step
collect 40 Heavy Blasting Powder##4377 |q 3639
step
collect 10 Silver Contact##4404 |q 3639
|tip This schematic will give you 5 of these.
step
collect 20 Big Iron Bomb##4394 |q 3639/1 |goto 51.40,28.72
|tip Stand next to the anvil.
|tip This schematic will give you 2 of these.
step
collect 10 Solid Blasting Powder##10505 |q 3639
step
collect 20 Solid Dynamite##10507 |q 3639/2 |goto 51.40,28.72
|tip Stand next to the anvil.
|tip This schematic will give you 2 of these.
step
collect 5 Bronze Framework##4382 |q 3639
step
collect 5 Whirring Bronze Gizmo##4375 |goto 51.40,28.72 |q 3639
|tip Stand next to the anvil.
step
collect 5 Explosive Sheep##4384 |q 3639/3 |goto 51.40,28.72
|tip Stand next to the anvil.
step
Enter the building |goto Tanaris/0 52.39,27.30 < 5 |walk
talk Nixx Sprocketspring##8126
|tip Inside the building.
turnin Show Your Work##3639 |goto Tanaris/0 52.48,27.33
step
_Congratulations!_
|tip You have earned your Goblin Engineer Membership Card.
|tip This card allows you to learn Goblin Engineering schematics from Nixx Sprocketspring.
|tip This item will last for 14 days of in-game play time.
|tip The time will not count down when you are logged out, so it will last a long time.
|tip You can only learn Goblin Engineering schematics while you have this item in your bags.
|tip When the time runs out, you can renew the card, if you need to.
|tip Use the "Goblin Engineering Card Renewal" guide to renew the card.
Learn Schematics From Nixx Sprocketspring at [Tanaris 52.48,27.33]
|tip Inside the building.
]])
ZygorGuidesViewer:RegisterGuide("Profession Guides\\Engineering\\Specialization\\Goblin Engineering\\Goblin Engineer Membership Card Renewal",{
author="support@zygorguides.com",
description="This guide will walk you through renewing your Goblin Engineer Membership Card, as well as using the Goblin Engineer's Renewal Gifts to collect rare schematics.",
},[[
step
Enter the building |goto Tanaris/0 52.39,27.30 < 5 |walk
talk Nixx Sprocketspring##8126
|tip Inside the building.
accept Membership Card Renewal##3644 |goto Tanaris/0 52.48,27.33
|tip You must have the Goblin Engineering specialization to be able to complete this quest.
|tip This quest requires 2 gold to complete.
|tip This will keep your Goblin Engineer Membership Card active for another 14 days of played time.
step
collect Goblin Engineer's Renewal Gift##11422 |n
|tip You will receive one of these in your mailbo 24 hours after renewing your membership card.
|tip You can destroy and renew your membership card repeatedly, if you want more of them to open.
|tip You don't need to wait for the card to expire on its own.
use the Goblin Engineer's Renewal Gift##11422
|tip These will contain some Engineer crafting supplies.
|tip The rare schematic for the "Pet Bombling" pet also has a chance to be inside.
]])
ZygorGuidesViewer:RegisterGuide("Profession Guides\\Engineering\\Specialization\\How to Change Engineering Specialization",{
author="support@zygorguides.com",
description="This guide will walk you through changing your Engineering profession specialization.",
},[[
step
_NOTE:_
|tip You MUST fully complete the questline for either Gnomish Engineering or Goblin engineering before you can switch specializations.
|tip You must have obtained either the Gnome Engineer Membership Card or Goblin Engineer Membership Card, or it won't let you switch.
Click Here to Continue |confirm
step
Unlearn Engineering |condition skill("Engineering") == 0
|tip Press "K" to open your Skills tab.
|tip You must completely unlearn the Engineering profession to be able to switch your specialization.
step
Reach Level 30 |ding 30
|tip Use the leveling guides to accomplish this.
|tip You must be at least level 30 to be able to start the questlines to choose an Engineering specialization.
step
Reach Level 200 Engineering |condition skill("Engineering") >= 200
|tip Use the "Engineering (1-300)" guide to accomplish this.
|tip You must be at least level 200 Engineering to be able to start the questlines to choose an Engineering specialization.
step
Follow the path |goto Tanaris/0 64.90,22.54 < 30 |only if walking
Enter the building |goto Tanaris/0 65.41,18.56 < 7 |walk
click Book "Soothsaying for Dummies"
|tip Inside the building.
|tip Choose the dialogue option that matches what you want to do.
]])
ZygorGuidesViewer:RegisterGuide("Profession Guides\\Leatherworking\\Specialization\\Dragonscale Leatherworking\\Dragonscale Leatherworking Questline",{
author="support@zygorguides.com",
condition_suggested=function() return skill('Leatherworking') >= 225 end,
description="This guide will walk you through completing the Dragonscale Leatherworking questline for the Leatherworking profession.",
},[[
step
_NOTE ABOUT LEATHERWORKING SPECIALIZATION:_
|tip You can only have one Leatherworking specialization.
|tip Additionally, you cannot change your specialization without unlearning the Leatherworking profession, and leveling it up again.
|tip We recommend looking into the different options for Dragonscale, Elemental, and Tribal Leatherworking before you choose which to pursue, depending on your personal play style and the specific items you want to create.
Click Here to Continue |confirm
step
Reach Level 40 |ding 40
|tip You must be at least this level before you can begin this questline.
|tip Use the leveling guides to accomplish this.
step
Reach Level 225 Leatherworking |skill Leatherworking,225
|tip You must be at least this level with your Leatherworking profession before you can begin this questline.
|tip Use the "Leatherworking (1-300)" guide to accomplish this.
stickystart "Learn_Tough_Scorpid_Gloves"
step
kill Wastewander Bandit##5618+
collect Pattern: Tough Scorpid Breastplate##8395 |n
|tip You can also purchase this from the Auction House, if you don't want to grind for it.
use the Pattern: Tough Scorpid Breastplate##8395
learn Tough Scorpid Breastplate##10525 |goto Tanaris/0 60.30,24.02
You can find more Wastewander Bandits around:
[Tanaris 63.62,31.49]
step
label "Learn_Tough_Scorpid_Gloves"
kill Wastewander Thief##5616+
collect Pattern: Tough Scorpid Gloves##8398 |n
|tip You can also purchase this from the Auction House, if you don't want to grind for it.
use the Pattern: Tough Scorpid Gloves##8398
learn Tough Scorpid Gloves##10542 |goto Tanaris/0 60.30,24.02
You can find more Wastewander Thieves around:
[Tanaris 63.62,31.49]
step
_Collect These Items:_
|tip If you have the Skinning profession, you can gather these.
|tip Search the guide menu for the item(s) to use the farming guides.
|tip You can also purchase them from the Auction House.
collect 36 Thick Leather##4304 |q 5145 |future
collect 40 Scorpid Scale##8154 |q 5145 |future
collect 10 Worn Dragonscale##8165 |q 5145 |future
|tip These are skinned from Dragonkin enemies and bosses inside the Temple of Atal'Hakkar (Sunken Temple) dungeon.
step
talk Nerrist##1148
buy 12 Silken Thread##4291 |goto Stranglethorn Vale 32.70,29.23 |q 5145 |future
step
collect 2 Tough Scorpid Gloves##8204 |q 5145 |future
step
collect 2 Tough Scorpid Breastplate##8203 |q 5145 |future
step
talk Thorkaf Dragoneye##7867
accept Dragonscale Leatherworking##5145 |goto Badlands 62.70,57.40
step
talk Thorkaf Dragoneye##7867
turnin Dragonscale Leatherworking##5145 |goto 62.70,57.40
learn Dragonscale Leatherworking##10656 |goto 62.70,57.40
|tip You will learn this automatically.
step
_Congratulations!_
|tip You have become a Dragonscale Leatherworker.
Learn Patterns From Thorkaf Dragoneye at [Badlands 62.70,57.40]
]])
ZygorGuidesViewer:RegisterGuide("Profession Guides\\Leatherworking\\Specialization\\Elemental Leatherworking\\Elemental Leatherworking Questline",{
author="support@zygorguides.com",
condition_suggested=function() return skill('Leatherworking') >= 225 end,
description="This guide will walk you through completing the Elemental Leatherworking questline for the Leatherworking profession.",
},[[
step
_NOTE ABOUT LEATHERWORKING SPECIALIZATION:_
|tip You can only have one Leatherworking specialization.
|tip Additionally, you cannot change your specialization without unlearning the Leatherworking profession, and leveling it up again.
|tip We recommend looking into the different options for Dragonscale, Elemental, and Tribal Leatherworking before you choose which to pursue, depending on your personal play style and the specific items you want to create.
Click Here to Continue |confirm
step
Reach Level 40 |ding 40
|tip You must be at least this level before you can begin this questline.
|tip Use the leveling guides to accomplish this.
step
Reach Level 225 Leatherworking |skill Leatherworking,225
|tip You must be at least this level with your Leatherworking profession before you can begin this questline.
|tip Use the "Leatherworking (1-300)" guide to accomplish this.
step
_Collect These Items:_
|tip Search the guide menu for the item(s) to use the farming guides.
|tip You can also purchase them from the Auction House.
collect 2 Heart of Fire##7077 |q 5146 |future
collect 2 Globe of Water##7079 |q 5146 |future
collect 2 Core of Earth##7075 |q 5146 |future
collect 2 Breath of Wind##7081 |q 5146 |future
step
talk Brumn Winterhoof##7869
accept Elemental Leatherworking##5146 |goto Arathi Highlands 28.27,45.09
step
talk Brumn Winterhoof##7869
turnin Elemental Leatherworking##5146 |goto 28.27,45.09
step
_Congratulations!_
|tip You have become an Elemental Leatherworker.
Learn Patterns From Brumn Winterhoof at [Arathi Highlands 28.27,45.09]
]])
ZygorGuidesViewer:RegisterGuide("Profession Guides\\Leatherworking\\Specialization\\Tribal Leatherworking\\Tribal Leatherworking Questline",{
author="support@zygorguides.com",
condition_suggested=function() return skill('Leatherworking') >= 225 end,
description="This guide will walk you through completing the Tribal Leatherworking questline for the Leatherworking profession.",
},[[
step
_NOTE ABOUT LEATHERWORKING SPECIALIZATION:_
|tip You can only have one Leatherworking specialization.
|tip Additionally, you cannot change your specialization without unlearning the Leatherworking profession, and leveling it up again.
|tip We recommend looking into the different options for Dragonscale, Elemental, and Tribal Leatherworking before you choose which to pursue, depending on your personal play style and the specific items you want to create.
Click Here to Continue |confirm
step
Reach Level 40 |ding 40
|tip You must be at least this level before you can begin this questline.
|tip Use the leveling guides to accomplish this.
step
Reach Level 235 Leatherworking |skill Leatherworking,235
|tip You must be at least this level with your Leatherworking profession before you can creature some of the patterns needed for this questline.
|tip Use the "Leatherworking (1-300)" guide to accomplish this.
step
_Collect These Items:_
|tip If you have the Skinning profession, you can gather these.
|tip Search the guide menu for the item(s) to use the farming guides.
|tip You can also purchase them from the Auction House.
collect 214 Thick Leather##4304 |q 2858 |future
collect 112 Turtle Scale##8167 |q 2859 |future
collect 11 Wildvine##8153 |q 5148 |future
|tip If you have the Herbalism profession, you can gather these.
collect 2 Cured Thick Hide##8172 |q 5148 |future
step
Enter the building |goto Feralas 74.68,42.99 < 5 |walk
talk Hahrana Ironhide##11098
|tip Inside the building.
learn Cured Thick Hide##10482 |goto Feralas 74.36,43.12
learn Thick Armor Kit##10487 |goto Feralas 74.36,43.12
learn Nightscape Headband##10507 |goto Feralas 74.36,43.12
learn Nightscape Tunic##10499 |goto Feralas 74.36,43.12
learn Turtle Scale Bracers##10518 |goto Feralas 74.36,43.12
learn Turtle Scale Breastplate##10511 |goto Feralas 74.36,43.12
learn Turtle Scale Helm##10552 |goto Feralas 74.36,43.12
learn Nightscape Boots##10558 |goto Feralas 74.36,43.12
learn Nightscape Pants##10548 |goto Feralas 74.36,43.12
step
talk Jangdor Swiftstrider##7854
|tip Inside the building.
buy Pattern: Turtle Scale Gloves##8385 |n
|tip This is a limited supply item.
|tip If he doesn't have it for sale, check the Auction House.
use the Pattern: Turtle Scale Gloves##8385
learn Turtle Scale Gloves##10509 |goto 74.43,42.91
step
talk Jangdor Swiftstrider##7854
|tip Inside the building.
accept Wild Leather Armor##2854 |goto 74.43,42.91
step
talk Jangdor Swiftstrider##7854
|tip Inside the building.
turnin Wild Leather Armor##2854 |goto 74.43,42.91
accept Wild Leather Shoulders##2855 |goto 74.43,42.91
accept Wild Leather Vest##2856 |goto 74.43,42.91
accept Wild Leather Helmet##2857 |goto 74.43,42.91
accept Wild Leather Boots##2858 |goto 74.43,42.91
accept Wild Leather Leggings##2859 |goto 74.43,42.91
step
talk Jangdor Swiftstrider##7854
|tip Inside the building.
buy 22 Silken Thread##4291 |goto 74.43,42.91 |q 2859
buy 12 Heavy Silken Thread##8343 |goto 74.43,42.91 |q 2859
step
collect 6 Thick Armor Kit##8173 |q 2855/1
step
talk Jangdor Swiftstrider##7854
|tip Inside the building.
turnin Wild Leather Shoulders##2855 |goto 74.43,42.91
step
use the Pattern: Wild Leather Shoulders##8403
learn Wild Leather Shoulders##10529
step
collect 2 Turtle Scale Breastplate##8189 |q 2856/1
step
collect 2 Turtle Scale Gloves##8187 |q 2856/2
step
talk Jangdor Swiftstrider##7854
|tip Inside the building.
turnin Wild Leather Vest##2856 |goto 74.43,42.91
step
use the Pattern: Wild Leather Vest##8404
learn Wild Leather Vest##10544
step
collect 2 Nightscape Tunic##8175 |q 2857/1
step
collect 2 Nightscape Headband##8176 |q 2857/2
step
talk Jangdor Swiftstrider##7854
|tip Inside the building.
turnin Wild Leather Helmet##2857 |goto 74.43,42.91
step
use the Pattern: Wild Leather Helmet##8405
learn Wild Leather Helmet##10546
step
collect 2 Nightscape Pants##8193 |q 2858/1
step
collect 2 Nightscape Boots##8197 |q 2858/2
step
talk Jangdor Swiftstrider##7854
|tip Inside the building.
turnin Wild Leather Boots##2858 |goto 74.43,42.91
step
use the Pattern: Wild Leather Boots##8406
learn Wild Leather Boots##10566
step
collect 2 Turtle Scale Helm##8191 |q 2859/1
step
collect 2 Turtle Scale Bracers##8198 |q 2859/2
step
talk Jangdor Swiftstrider##7854
|tip Inside the building.
turnin Wild Leather Leggings##2859 |goto 74.43,42.91
step
use the Pattern: Wild Leather Leggings##8407
learn Wild Leather Leggings##10572
step
talk Jangdor Swiftstrider##7854
|tip Inside the building.
accept Master of the Wild Leather##2860 |goto 74.43,42.91
step
Enter the building |goto Thunder Bluff 43.76,42.44 < 5 |walk
talk Una##3007
|tip Inside the building.
turnin Master of the Wild Leather##2860 |goto Thunder Bluff 41.51,42.57
step
use the Pattern: Wild Leather Cloak##8408
learn Wild Leather Cloak##10574
step
collect Wild Leather Vest##8211 |q 5148 |future
step
collect Wild Leather Helmet##8214 |q 5148 |future
step
Follow the path |goto Stranglethorn Vale 32.79,28.75 < 10 |only if walking
Continue following the path |goto Stranglethorn Vale 35.28,35.56 < 20 |only if walking
talk Se'Jib##7871
|tip Inside the hut.
accept Tribal Leatherworking##5143 |goto Stranglethorn Vale 36.55,34.09
step
talk Se'Jib##7871
|tip Inside the hut.
turnin Tribal Leatherworking##5143 |goto 36.55,34.09
step
_Congratulations!_
|tip You have become a Tribal Leatherworker.
Learn Patterns From Se'Jib at [Stranglethorn Vale 36.55,34.09]
]])