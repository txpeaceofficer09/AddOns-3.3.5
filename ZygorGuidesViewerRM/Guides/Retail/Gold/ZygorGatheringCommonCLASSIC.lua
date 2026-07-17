ZGV.Gold.guides_loaded=true
ZygorGuidesViewer.GuideMenuTier = "CLA"
ZygorGuidesViewer:RegisterGuide("GOLD\\Gathering\\Barbed Gill Trout, Spotted Feltail, Zangarian Sporefish",{
meta={goldtype="route",skillreq={fishing=305},levelreq={60}},
items={{27422,212},{27425,44},{27429,56}},
maps={"Zangarmarsh"},
},[[
step
Equip a Fishing Pole |equipped Fishing Pole##6256 |or
|tip A Fishing Pole can be purchased near most Fishing profession trainers.
'|equipped Strong Fishing Pole##6365 |or
'|equipped Blump Family Fishing Pole##12225 |or
'|equipped Arcanite Fishing Pole##19970 |or
'|equipped Darkwood Fishing Pole##6366 |or
'|equipped Big Iron Fishing Pole##6367 |or
'|equipped Nat Pagle's Extreme Angler FC-5000##19022 |or
'|equipped Seth's Graphite Fishing Pole##25978 |or
step
label "Start_Farming_Fish"
cast Fishing##33095
|tip Fish in the water.
|tip You must have a Fishing Pole equipped to fish.
|tip A Fishing Pole can be purchased near most Fishing profession trainers.
|goldcollect Barbed Gill Trout##27422 |goto Zangarmarsh/0 78.95,71.48
|goldcollect Spotted Feltail##27425 |goto Zangarmarsh/0 78.95,71.48
|goldcollect Zangarian Sporefish##27429 |goto Zangarmarsh/0 78.95,71.48
|goldtracker
Click Here to Sell Fish |confirm
step
talk Auctioneer Thathung##8673 |goto Orgrimmar/0 55.69,62.85 |only if Horde
talk Auctioneer Redmuse##8720 |goto Ironforge/0 24.25,74.54 |only if Alliance
|tip List the items you want to sell on the Auction House.
|tip
_Want to Farm More?_
Click Here to Farm Fish |confirm |next "Start_Farming_Fish"
]])
ZygorGuidesViewer:RegisterGuide("GOLD\\Gathering\\Furious Crawdad, Golden Darter",{
meta={goldtype="route",skillreq={fishing=430},levelreq={70}},
items={{27439,92},{27438,36}},
maps={"Terokkar Forest"},
},[[
step
Equip a Fishing Pole |equipped Fishing Pole##6256 |or
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
|goldcollect Furious Crawdad##27439
|goldcollect Golden Darter##27438
|goldtracker
Click Here to Sell Furious Crawdad |confirm |next "Sell_Furious_Crawdad"
'|goto 66.71,74.38 < 30 |c |noway |or
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
|goldcollect Furious Crawdad##27439
|goldcollect Golden Darter##27438
|goldtracker
Click Here to Sell Furious Crawdad |confirm |next "Sell_Furious_Crawdad"
'|goto 45.14,40.51 < 30 |c |noway |next "Start_Farming_Furious_Crawdad" |or
step
label "Sell_Furious_Crawdad"
talk Auctioneer Thathung##8673 |goto Orgrimmar/0 55.69,62.85 |only if Horde
talk Auctioneer Redmuse##8720 |goto Ironforge/0 24.25,74.54 |only if Alliance
|tip List the items you want to sell on the Auction House.
|tip
_Want to Farm More?_
Click Here to Farm Furious Crawdad |confirm |next "Start_Farming_Furious_Crawdad"
]])
ZygorGuidesViewer:RegisterGuide("GOLD\\Gathering\\Bloodfin Catfish, Crescent-Tail Skullfish",{
meta={goldtype="route",skillreq={fishing=300},levelreq={60}},
items={{33823,68},{33824,64},{27422,132}},
maps={"Deadwind Pass"},
},[[
step
Equip a Fishing Pole |equipped Fishing Pole##6256 |or
|tip A Fishing Pole can be purchased near most Fishing profession trainers.
'|equipped Strong Fishing Pole##6365 |or
'|equipped Blump Family Fishing Pole##12225 |or
'|equipped Arcanite Fishing Pole##19970 |or
'|equipped Darkwood Fishing Pole##6366 |or
'|equipped Big Iron Fishing Pole##6367 |or
'|equipped Nat Pagle's Extreme Angler FC-5000##19022 |or
'|equipped Seth's Graphite Fishing Pole##25978 |or
step
label "Start_Farming_Bloodfin_Catfish"
cast Fishing##33095
|tip Fish in the water.
|tip You must have a Fishing Pole equipped to fish.
|tip A Fishing Pole can be purchased near most Fishing profession trainers.
|goldcollect Bloodfin Catfish##33823 |goto Deadwind Pass/0 52.79,73.82
|goldcollect Crescent-Tail Skullfish##33824 |goto Deadwind Pass/0 52.79,73.82
|goldcollect Barbed Gill Trout##27422 |goto Deadwind Pass/0 52.79,73.82
|goldtracker
Click Here to Sell Fish |confirm
step
talk Auctioneer Thathung##8673 |goto Orgrimmar/0 55.69,62.85 |only if Horde
talk Auctioneer Redmuse##8720 |goto Ironforge/0 24.25,74.54 |only if Alliance
|tip List the items you want to sell on the Auction House.
|tip
_Want to Farm More?_
Click Here to Farm Fish |confirm |next "Start_Farming_Bloodfin_Catfish"
]])
ZygorGuidesViewer:RegisterGuide("GOLD\\Gathering\\Felweed",{
meta={goldtype="route",skillreq={herbalism=300},levelreq={61}},
items={{22785,232},{13464,44},{13463,52},{13465,26},{22575,10}},
maps={"Terokkar Forest"},
},[[
step
label "Start_Farming_Felweed"
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
|goldcollect Felweed##22785
|goldcollect Golden Sansam##13464
|goldcollect Dreamfoil##13463
|goldcollect Mountain Silversage##13465
|goldcollect Mote of Life##22575
|goldtracker
Click Here to Sell Felweed |confirm
step
talk Auctioneer Thathung##8673 |goto Orgrimmar/0 55.69,62.85 |only if Horde
talk Auctioneer Redmuse##8720 |goto Ironforge/0 24.25,74.54 |only if Alliance
|tip List the items you want to sell on the Auction House.
|tip
_Want to Farm More?_
Click Here to Farm Felweed |confirm |next "Start_Farming_Felweed"
]])
ZygorGuidesViewer:RegisterGuide("GOLD\\Gathering\\Ancient Lichen",{
meta={goldtype="route",skillreq={herbalism=340},levelreq={61}},
items={{22790,32}},
maps={"Zangarmarsh"},
},[[
step
label "Start_Farming_Ancient_Lichen"
map Zangarmarsh/0
path	follow smart; ants curved; dist 20
path	82.27,44.23	79.64,39.75	79.46,36.87	81.08,33.72	83.18,34.79
path	84.92,37.43	85.23,40.76
Kill Withered enemies around this area
|tip Gather their corpses with Herbalism.
|tip These can be farmed more effectively from Slave Pens, Underbog and Steamvaults with stealth or a group.
|goldcollect Ancient Lichen##22790
|goldtracker
Click Here to Sell Ancient Lichen |confirm
step
talk Auctioneer Thathung##8673 |goto Orgrimmar/0 55.69,62.85 |only if Horde
talk Auctioneer Redmuse##8720 |goto Ironforge/0 24.25,74.54 |only if Alliance
|tip List the items you want to sell on the Auction House.
|tip
_Want to Farm More?_
Click Here to Farm Ancient Lichen |confirm |next "Start_Farming_Ancient_Lichen"
]])
ZygorGuidesViewer:RegisterGuide("GOLD\\Gathering\\Dreaming Glory",{
meta={goldtype="route",skillreq={herbalism=315},levelreq={63}},
items={{22786,142},{22785,64},{22575,41},{22793,9},{22794,3}},
maps={"Terokkar Forest"},
},[[
step
label "Start_Farming_Dreaming_Glory"
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
|goldcollect Dreaming Glory##22786
|goldcollect Felweed##22785
|goldcollect Mote of Life##22575
|goldcollect Mana Thistle##22793
|goldcollect Fel Lotus##22794
|goldtracker
Click Here to Sell Dreaming Glory |confirm
step
talk Auctioneer Thathung##8673 |goto Orgrimmar/0 55.69,62.85 |only if Horde
talk Auctioneer Redmuse##8720 |goto Ironforge/0 24.25,74.54 |only if Alliance
|tip List the items you want to sell on the Auction House.
|tip
_Want to Farm More?_
Click Here to Farm Dreaming Glory |confirm |next "Start_Farming_Dreaming_Glory"
]])
ZygorGuidesViewer:RegisterGuide("GOLD\\Gathering\\Nightmare Vine, Fel Lotus",{
meta={goldtype="route",skillreq={herbalism=365},levelreq={67}},
items={{22792,146},{22794,3},{22785,98},{22789,31},{22786,28}},
maps={"Shadowmoon Valley"},
},[[
step
label "Start_Farming_Fel_Lotus"
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
|goldcollect Nightmare Vine##22792
|goldcollect Fel Lotus##22794
|goldcollect Felweed##22785
|goldcollect Terocone##22789
|goldcollect Dreaming Glory##22786
|goldtracker
Click Here to Sell Fel Lotus |confirm
step
talk Auctioneer Thathung##8673 |goto Orgrimmar/0 55.69,62.85 |only if Horde
talk Auctioneer Redmuse##8720 |goto Ironforge/0 24.25,74.54 |only if Alliance
|tip List the items you want to sell on the Auction House.
|tip
_Want to Farm More?_
Click Here to Farm Fel Lotus |confirm |next "Start_Farming_Fel_Lotus"
]])
ZygorGuidesViewer:RegisterGuide("GOLD\\Gathering\\Mana Thistle",{
meta={goldtype="route",skillreq={herbalism=375},levelreq={63}},
items={{22793,69},{22786,78},{22575,15}},
maps={"Terokkar Forest","Shadowmoon Valley"},
},[[
step
label "Start_Farming_Mana_Thistle"
map Terokkar Forest/0
path	follow smart; loop on; ants curved; dist 20
path	27.11,10.51	22.10,6.50	20.21,14.21	23.90,10.50
click Mana Thistle##181281+
|tip Gather Mana Thistle along the path.
|tip Mana Thistle is a rare herb, so pick nearby herbs to make it possibly spawn.
|goldcollect Mana Thistle##22793
|goldcollect Dreaming Glory##22786
|goldcollect Mote of Life##22575
|goldtracker
Click Here to Sell Mana Thistle |confirm |next "Sell_Mana_Thistle"
'||goto 23.90,10.50 < 30 |noway |c |or
step
map Terokkar Forest/0
path	follow smart; loop on; ants curved; dist 20
path	62.42,73.60	65.70,79.21	68.72,85.72	72.21,88.52	74.91,87.50
path	72.31,82.01	69.31,74.60	62.41,73.60
click Mana Thistle##181281+
|tip Gather Mana Thistle along the path.
|tip Mana Thistle is a rare herb, so pick nearby herbs to make it possibly spawn.
|goldcollect Mana Thistle##22793
|goldcollect Dreaming Glory##22786
|goldcollect Mote of Life##22575
|goldtracker
Click Here to Sell Mana Thistle |confirm |next "Sell_Mana_Thistle"
'|goto 62.41,73.60 < 30 |noway |c |or
step
map Shadowmoon Valley/0
path	follow smart; loop on; ants curved; dist 20
path	65.81,80.63	70.21,79.12	74.31,80.80	79.20,87.53	77.51,88.40
path	74.32,88.92	71.12,88.31	68.33,87.51	70.21,83.92	72.02,85.91
path	74.60,86.41
click Mana Thistle##181281+
|tip Gather Mana Thistle along the path.
|tip Mana Thistle is a rare herb, so pick nearby herbs to make it possibly spawn.
|goldcollect Mana Thistle##22793
|goldcollect Dreaming Glory##22786
|goldcollect Mote of Life##22575
|goldtracker
Click Here to Sell Mana Thistle |confirm |next "Sell_Mana_Thistle"
'|goto 74.60,86.41 < 30 |noway |c |next "Start_Farming_Mana_Thistle" |or
step
label "Sell_Mana_Thistle"
talk Auctioneer Thathung##8673 |goto Orgrimmar/0 55.69,62.85 |only if Horde
talk Auctioneer Redmuse##8720 |goto Ironforge/0 24.25,74.54 |only if Alliance
|tip List the items you want to sell on the Auction House.
|tip
_Want to Farm More?_
Click Here to Farm Mana Thistle |confirm |next "Start_Farming_Mana_Thistle"
]])
ZygorGuidesViewer:RegisterGuide("GOLD\\Gathering\\Netherbloom",{
meta={goldtype="route",skillreq={herbalism=350},levelreq={65}},
items={{22791,175},{22786,62},{22576,22},{22794,5},{22575,7}},
maps={"Netherstorm"},
},[[
step
label "Start_Farming_Netherbloom"
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
|goldcollect Netherbloom##22791
|goldcollect Dreaming Glory##22786
|goldcollect Mote of Mana##22576
|goldcollect Fel Lotus##22794
|goldcollect Mote of Life##22575
|goldtracker
Click Here to Sell Netherbloom |confirm
step
talk Auctioneer Thathung##8673 |goto Orgrimmar/0 55.69,62.85 |only if Horde
talk Auctioneer Redmuse##8720 |goto Ironforge/0 24.25,74.54 |only if Alliance
|tip List the items you want to sell on the Auction House.
|tip
_Want to Farm More?_
Click Here to Farm Netherbloom |confirm |next "Start_Farming_Netherbloom"
]])
ZygorGuidesViewer:RegisterGuide("GOLD\\Gathering\\Ragveil",{
meta={goldtype="route",skillreq={herbalism=325},levelreq={61}},
items={{22787,172},{22785,35},{22786,12},{24401,41},{13464,38},{13463,42},{22575,32}},
maps={"Zangarmarsh"},
},[[
step
label "Start_Farming_Ragveil"
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
|goldcollect Ragveil##22787
|goldcollect Felweed##22785
|goldcollect Dreaming Glory##22786
|goldcollect Unidentified Plant Parts##24401
|goldcollect Golden Sansam##13464
|goldcollect Dreamfoil##13463
|goldcollect Mote of Life##22575
|goldtracker
Click Here to Sell Ragveil |confirm
step
talk Auctioneer Thathung##8673 |goto Orgrimmar/0 55.69,62.85 |only if Horde
talk Auctioneer Redmuse##8720 |goto Ironforge/0 24.25,74.54 |only if Alliance
|tip List the items you want to sell on the Auction House.
|tip
_Want to Farm More?_
Click Here to Farm Ragveil |confirm |next "Start_Farming_Ragveil"
]])
ZygorGuidesViewer:RegisterGuide("GOLD\\Gathering\\Terocone",{
meta={goldtype="route",skillreq={herbalism=325},levelreq={63}},
items={{22789,181},{22785,74},{22786,19},{22575,44}},
maps={"Terokkar Forest"},
},[[
step
label "Start_Farming_Terocone"
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
|goldcollect 200 Terocone##22789
|goldcollect 100 Felweed##22785
|goldcollect 28 Dreaming Glory##22786
|goldcollect 52 Mote of Life##22575
|goldtracker
Click Here to Sell Terocone |confirm
step
talk Auctioneer Thathung##8673 |goto Orgrimmar/0 55.69,62.85 |only if Horde
talk Auctioneer Redmuse##8720 |goto Ironforge/0 24.25,74.54 |only if Alliance
|tip List the items you want to sell on the Auction House.
|tip
_Want to Farm More?_
Click Here to Farm Terocone |confirm |next "Start_Farming_Terocone"
]])
ZygorGuidesViewer:RegisterGuide("GOLD\\Gathering\\Adamantite Ore, Eternium Ore",{
meta={goldtype="route",skillreq={Mining=325},levelreq={60}},
items={{23425,196},{23427,14},{22573,96},{22574,20}},
maps={"Nagrand"},
},[[
step
label "Start_Farming_Adamantite_Ore"
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
|goldcollect Adamantite Ore##23425
|goldcollect Eternium Ore##23427
|goldcollect Mote of Earth##22573
|goldcollect Fel Iron Ore##23424
|goldcollect Mote of Fire##22574
|goldtracker
Click Here to Sell Adamantite Ore |confirm
step
talk Auctioneer Thathung##8673 |goto Orgrimmar/0 55.69,62.85 |only if Horde
talk Auctioneer Redmuse##8720 |goto Ironforge/0 24.25,74.54 |only if Alliance
|tip List the items you want to sell on the Auction House.
|tip
_Want to Farm More?_
Click Here to Farm Adamantite Ore |confirm |next "Start_Farming_Adamantite_Ore"
]])
ZygorGuidesViewer:RegisterGuide("GOLD\\Gathering\\Adamantite Ore, Eternium Ore, Khorium Ore",{
meta={goldtype="route",skillreq={Mining=375},levelreq={60}},
items={{23425,196},{23427,16},{22573,104},{22574,24},{23426,26}},
maps={"Nagrand"},
},[[
step
label "Start_Farming_Adamantite_Ore"
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
|goldcollect Adamantite Ore##23425
|goldcollect Eternium Ore##23427
|goldcollect Mote of Earth##22573
|goldcollect Fel Iron Ore##23424
|goldcollect Mote of Fire##22574
|goldcollect Khorium Ore##23426
|goldtracker
Click Here to Sell Adamantite Ore |confirm
step
talk Auctioneer Thathung##8673 |goto Orgrimmar/0 55.69,62.85 |only if Horde
talk Auctioneer Redmuse##8720 |goto Ironforge/0 24.25,74.54 |only if Alliance
|tip List the items you want to sell on the Auction House.
|tip
_Want to Farm More?_
Click Here to Farm Adamantite Ore |confirm |next "Start_Farming_Adamantite_Ore"
]])
ZygorGuidesViewer:RegisterGuide("GOLD\\Gathering\\Fel Iron Ore, Eternium Ore",{
meta={goldtype="route",skillreq={Mining=300},levelreq={60}},
items={{23424,284},{22573,64},{22574,56},{23427,4}},
maps={"Hellfire Peninsula"},
},[[
step
label "Start_Farming_Fel_Iron_Ore"
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
|goldcollect Fel Iron Ore##23424
|goldcollect Mote of Earth##22573
|goldcollect Mote of Fire##22574
|goldcollect Eternium Ore##23427
|goldtracker
Click Here to Sell Fel Iron Ore |confirm
step
talk Auctioneer Thathung##8673 |goto Orgrimmar/0 55.69,62.85 |only if Horde
talk Auctioneer Redmuse##8720 |goto Ironforge/0 24.25,74.54 |only if Alliance
|tip List the items you want to sell on the Auction House.
|tip
_Want to Farm More?_
Click Here to Farm Fel Iron Ore |confirm |next "Start_Farming_Fel_Iron_Ore"
]])
ZygorGuidesViewer:RegisterGuide("GOLD\\Gathering\\Knothide Leather",{
meta={goldtype="route",skillreq={Skinning=335},levelreq={65}},
items={{21887,94},{25649,210}},
maps={"Netherstorm"},
},[[
step
label "Start_Farming_Knothide_Leather"
map Netherstorm/0
path follow smart; loop on; ants curved; dist 30
path	43.61,57.06	45.22,57.65	47.41,56.58	48.25,54.31	48.18,51.86
path	46.52,51.17	45.58,49.75	43.63,50.57	43.29,52.27	43.66,54.99
path	44.85,56.21
Kill enemies around this area
|tip Only non-flying Beast enemies will be skinnable.
|tip Skin their corpses.
|goldcollect Knothide Leather##21887
|goldcollect Knothide Leather Scraps##25649
|goldtracker
Click Here to Sell Knothide Leather |confirm
step
talk Auctioneer Thathung##8673 |goto Orgrimmar/0 55.69,62.85 |only if Horde
talk Auctioneer Redmuse##8720 |goto Ironforge/0 24.25,74.54 |only if Alliance
|tip List the items you want to sell on the Auction House.
|tip
_Want to Farm More?_
Click Here to Farm Knothide Leather |confirm |next "Start_Farming_Knothide_Leather"
]])
ZygorGuidesViewer:RegisterGuide("GOLD\\Gathering\\Thick Clefthoof Leather",{
meta={goldtype="route",skillreq={Skinning=310},levelreq={62}},
items={{25708,72},{21887,72},{25649,156}},
maps={"Nagrand"},
},[[
step
label "Start_Farming_Thick_Clefthoof_Leather"
map Nagrand/0
path follow smart; loop on; ants curved; dist 30
path	44.28,26.55	43.25,29.59	45.88,33.29	47.54,38.47	50.14,51.61
path	52.51,54.52	54.09,50.75	54.25,48.06	55.98,45.01	51.01,39.01
path	50.63,31.76	46.12,27.60
Kill Clefthoof enemies around this area
|tip Skin their corpses.
|goldcollect Thick Clefthoof Leather##25708
|goldcollect Knothide Leather##21887
|goldcollect Knothide Leather Scraps##25649
|goldtracker
Click Here to Sell Thick Clefthoof Leather |confirm
step
talk Auctioneer Thathung##8673 |goto Orgrimmar/0 55.69,62.85 |only if Horde
talk Auctioneer Redmuse##8720 |goto Ironforge/0 24.25,74.54 |only if Alliance
|tip List the items you want to sell on the Auction House.
|tip
_Want to Farm More?_
Click Here to Farm Thick Clefthoof Leather |confirm |next "Start_Farming_Thick_Clefthoof_Leather"
]])
ZygorGuidesViewer:RegisterGuide("GOLD\\Gathering\\Fel Hide",{
meta={goldtype="route",skillreq={Skinning=335},levelreq={65}},
items={{25707,32},{21887,60},{25649,272}},
maps={"Netherstorm"},
},[[
step
label "Start_Farming_Fel_Hide"
map Netherstorm/0
path follow smart; loop on; ants curved; dist 30
path	55.33,60.50	58.09,60.46	58.98,58.47	61.66,59.15	63.22,59.54
path	65.48,61.63	66.93,63.05	63.63,64.45	61.98,62.72
kill Warp Chaser##18884+
|tip Skin their corpses.
|goldcollect Fel Hide##25707
|goldcollect Knothide Leather##21887
|goldcollect Knothide Leather Scraps##25649
|tip They have a low drop rate.
|goldtracker
Click Here to Sell Fel Hide |confirm
step
talk Auctioneer Thathung##8673 |goto Orgrimmar/0 55.69,62.85 |only if Horde
talk Auctioneer Redmuse##8720 |goto Ironforge/0 24.25,74.54 |only if Alliance
|tip List the items you want to sell on the Auction House.
|tip
_Want to Farm More?_
Click Here to Farm Fel Hide |confirm |next "Start_Farming_Fel_Hide"
]])
ZygorGuidesViewer:RegisterGuide("GOLD\\Gathering\\Fel Scales",{
meta={goldtype="route",skillreq={Skinning=295},levelreq={58}},
items={{25700,48},{21887,90},{25649,136}},
maps={"Hellfire Peninsula"},
},[[
step
label "Start_Farming_Fel_Scales"
map Hellfire Peninsula/0
path follow smart; loop off; ants curved; dist 30
path	11.99,54.70	11.02,54.63	10.11,53.01	9.12,51.76	7.40,49.89
path	7.82,49.71	8.95,49.91	9.61,49.40	11.37,48.08	12.38,47.51
path	11.70,51.10	12.48,51.64	12.89,53.00
Kill Razorfang, Thornfang, and Quillfang enemies along the path
|tip Skin their corpses.
|goldcollect Fel Scales##25700
|tip They have a low drop rate.
|goldcollect Knothide Leather##21887
|goldcollect Knothide Leather Scraps##25649
|goldtracker
Click Here to Sell Fel Scales |confirm |next "Sell_Fel_Scales"
'|goto 12.89,53.00 < 25 |c |noway |or
step
map Hellfire Peninsula/0
path follow smart; loop off; ants curved; dist 30
path	22.12,60.36	22.60,61.73	22.21,63.14	21.82,64.65	22.25,66.44
path	22.56,67.91	22.79,69.19	24.04,69.01
Kill Razorfang, Thornfang, and Quillfang enemies along the path
|tip Skin their corpses.
|goldcollect Fel Scales##25700
|tip They have a low drop rate.
|goldcollect Knothide Leather##21887
|goldcollect Knothide Leather Scraps##25649
|goldtracker
Click Here to Sell Fel Scales |confirm |next "Sell_Fel_Scales"
'|goto 24.04,69.01 < 25 |c |noway |or
step
map Hellfire Peninsula/0
path follow smart; loop off; ants curved; dist 30
path	32.45,91.83	33.79,91.14	34.99,90.66	36.06,90.40	37.14,89.48
path	38.07,88.64	39.28,87.54	40.25,85.99	41.32,84.26	42.22,83.00
Kill Razorfang, Thornfang, and Quillfang enemies along the path
|tip Skin their corpses.
|goldcollect Fel Scales##25700
|tip They have a low drop rate.
|goldcollect Knothide Leather##21887
|goldcollect Knothide Leather Scraps##25649
|goldtracker
Click Here to Sell Fel Scales |confirm
'|goto 42.22,83.00 < 25 |c |noway |next "Start_Farming_Fel_Scales" |or
step
label "Sell_Fel_Scales"
talk Auctioneer Thathung##8673 |goto Orgrimmar/0 55.69,62.85 |only if Horde
talk Auctioneer Redmuse##8720 |goto Ironforge/0 24.25,74.54 |only if Alliance
|tip List the items you want to sell on the Auction House.
|tip
_Want to Farm More?_
Click Here to Farm Fel Scales |confirm |next "Start_Farming_Fel_Scales"
]])
ZygorGuidesViewer:RegisterGuide("GOLD\\Gathering\\Nether Dragonscale",{
meta={goldtype="route",skillreq={Skinning=330},levelreq={65}},
items={{29548,72},{21887,80},{25649,146}},
maps={"Blade's Edge Mountains"},
},[[
step
label "Start_Farming_Nether_Dragonscale"
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
|goldcollect Nether Dragonscale##29548
|tip They have a low drop rate.
|goldcollect Knothide Leather##21887
|goldcollect Knothide Leather Scraps##25649
|goldtracker
Click Here to Sell Nether Dragonscales |confirm
step
talk Auctioneer Thathung##8673 |goto Orgrimmar/0 55.69,62.85 |only if Horde
talk Auctioneer Redmuse##8720 |goto Ironforge/0 24.25,74.54 |only if Alliance
|tip List the items you want to sell on the Auction House.
|tip
_Want to Farm More?_
Click Here to Farm Nether Dragonscales |confirm |next "Start_Farming_Nether_Dragonscale"
]])
ZygorGuidesViewer:RegisterGuide("GOLD\\Gathering\\Wind Scales",{
meta={goldtype="route",skillreq={Skinning=335},levelreq={68}},
items={{29547,39},{21887,88},{25649,188}},
maps={"Shadowmoon Valley"},
},[[
step
label "Start_Farming_Wind_Scales"
map Shadowmoon Valley/0
path follow smart; loop on; ants curved; dist 30
path	51.41,60.67	50.94,61.54	50.01,62.38	49.05,64.07	48.50,65.32
path	48.15,66.69	47.98,68.01	47.43,68.53	46.59,69.02	46.56,70.31
path	45.98,71.11	45.27,70.66	44.57,70.08	44.10,69.14	44.12,67.74
path	44.36,66.30	44.94,64.50	45.93,64.34	46.68,63.83	47.50,63.16
path	48.16,62.04	48.59,61.00	50.07,59.97
kill Eclipsion Dragonhawk##20502+
|tip Skin their corpses.
|goldcollect Wind Scales##29547
|tip They have a low drop rate.
|goldcollect Knothide Leather##21887
|goldcollect Knothide Leather Scraps##25649
|goldtracker
Click Here to Sell Wind Scales |confirm
step
talk Auctioneer Thathung##8673 |goto Orgrimmar/0 55.69,62.85 |only if Horde
talk Auctioneer Redmuse##8720 |goto Ironforge/0 24.25,74.54 |only if Alliance
|tip List the items you want to sell on the Auction House.
|tip
_Want to Farm More?_
Click Here to Farm Wind Scales |confirm |next "Start_Farming_Wind_Scales"
]])
ZygorGuidesViewer:RegisterGuide("GOLD\\Gathering\\Cobra Scales",{
meta={goldtype="route",skillreq={Skinning=345},levelreq={70}},
items={{29539,12},{21887,84},{25649,141}},
maps={"Nagrand"},
},[[
step
label "Start_Farming_Cobra_Scales"
map Nagrand/0
path follow smart; loop off; ants curved; dist 30
path	18.01,38.64	19.04,37.86	19.06,36.64	19.25,35.69	20.02,35.31
path	19.99,34.69	19.56,33.70	18.80,33.09	17.97,33.44	17.51,34.01
path	15.63,34.46	14.73,34.52	14.03,35.10	13.33,35.70	12.49,36.56
path	12.49,37.51	11.91,39.12	11.00,40.08	10.15,40.92	9.39,41.92
path	8.71,42.91
kill Twilight Serpent##23026+
|tip Skin their corpses.
|tip Avoid elite enemies along the path.
|goldcollect Cobra Scales##29539
|tip They have a very low drop rate.
|goldcollect Knothide Leather##21887
|goldcollect Knothide Leather Scraps##25649
|goldtracker
Click Here to Sell Cobra Scales |confirm |next "Sell_Cobra_Scales"
'|goto 8.71,42.91 < 30 |c |noway |or
step
map Nagrand/0
path follow smart; loop off; ants curved; dist 30
path	8.71,42.91	9.39,41.92	10.15,40.92	11.00,40.08	11.91,39.12
path	12.49,37.51	12.49,36.56	13.33,35.70	14.03,35.10	14.73,34.52
path	15.63,34.46	17.51,34.01	17.97,33.44	18.80,33.09	19.56,33.70
path	19.99,34.69	20.02,35.31	19.25,35.69	19.06,36.64	19.04,37.86
path	18.01,38.64
kill Twilight Serpent##23026+
|tip Skin their corpses.
|tip Avoid elite enemies along the path.
|goldcollect Cobra Scales##29539
|tip They have a low drop rate.
|goldtracker
Click Here to Sell Cobra Scales |confirm |next "Sell_Cobra_Scales"
'|goto 18.01,38.64 < 30 |c |noway |next "Start_Farming_Cobra_Scales" |or
step
label "Sell_Cobra_Scales"
talk Auctioneer Thathung##8673 |goto Orgrimmar/0 55.69,62.85 |only if Horde
talk Auctioneer Redmuse##8720 |goto Ironforge/0 24.25,74.54 |only if Alliance
|tip List the items you want to sell on the Auction House.
|tip
_Want to Farm More?_
Click Here to Farm Cobra Scales |confirm |next "Start_Farming_Cobra_Scales"
]])
ZygorGuidesViewer:RegisterGuide("GOLD\\Gathering\\Barrelhead Goby",{
author="support@zygorguides.com",
meta={goldtype="route",skillreq={Fishing=430},levelreq={74}},
items={{41812,1}},
maps={"Sholazar Basin"},
},[[
step
label "Begin_Farming_Barrelhead_Goby"
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
goldcollect Barrelhead Goby##41812 |goto Sholazar Basin/0 49.66,63.81
Click Here to Sell Barrelhead Goby |confirm |next "Sell_Barrelhead_Goby"
step
label "Sell_Barrelhead_Goby"
talk Auctioneer Thathung##8673 |goto Orgrimmar/0 55.69,62.85 |only if Horde
talk Auctioneer Redmuse##8720 |goto Ironforge/0 24.25,74.54 |only if Alliance
|tip List the items you want to sell on the Auction House.
|tip
_Want to Farm More?_
Click Here to Farm Barrelhead Goby |confirm |next "Begin_Farming_Barrelhead_Goby"
]])
ZygorGuidesViewer:RegisterGuide("GOLD\\Gathering\\Bonescale Snapper",{
author="support@zygorguides.com",
meta={goldtype="route",skillreq={Fishing=380},levelreq={73}},
items={{41808,1}},
maps={"Grizzly Hills"},
},[[
step
label "Begin_Farming_Bonescale_Snapper"
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
goldcollect Bonescale Snapper##41808 |goto Grizzly Hills/0 28.34,66.18
|tip This fish is a random open-water fish.
Click Here to Sell Bonescale Snapper |confirm |next "Sell_Bonescale_Snapper"
step
label "Sell_Bonescale_Snapper"
talk Auctioneer Thathung##8673 |goto Orgrimmar/0 55.69,62.85 |only if Horde
talk Auctioneer Redmuse##8720 |goto Ironforge/0 24.25,74.54 |only if Alliance
|tip List the items you want to sell on the Auction House.
|tip
_Want to Farm More?_
Click Here to Farm Bonescale Snapper |confirm |next "Begin_Farming_Bonescale_Snapper"
]])
ZygorGuidesViewer:RegisterGuide("GOLD\\Gathering\\Borean Man O' War",{
author="support@zygorguides.com",
meta={goldtype="route",skillreq={Fishing=380},levelreq={68}},
items={{41805,1}},
maps={"Borean Tundra"},
},[[
step
label "Begin_Farming_Borean_Man_O_War"
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
goldcollect Borean Man O' War##41805
Click Here to Sell Borean Man O' War |confirm |next "Sell_Borean_Man_O_War"
step
label "Sell_Borean_Man_O_War"
talk Auctioneer Thathung##8673 |goto Orgrimmar/0 55.69,62.85 |only if Horde
talk Auctioneer Redmuse##8720 |goto Ironforge/0 24.25,74.54 |only if Alliance
|tip List the items you want to sell on the Auction House.
|tip
_Want to Farm More?_
Click Here to Farm Borean Man O' War |confirm |next "Begin_Farming_Borean_Man_O_War"
]])
ZygorGuidesViewer:RegisterGuide("GOLD\\Gathering\\Deep Sea Monsterbelly",{
author="support@zygorguides.com",
meta={goldtype="route",skillreq={Fishing=480},levelreq={68}},
items={{41800,1}},
maps={"Northrend"},
},[[
step
label "Begin_Farming_Deep_Sea_Monsterbelly"
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
goldcollect Deep Sea Monsterbelly##41800
Click Here to Sell Deep Sea Monsterbelly |confirm |next "Sell_Deep_Sea_Monsterbelly"
step
label "Sell_Deep_Sea_Monsterbelly"
talk Auctioneer Thathung##8673 |goto Orgrimmar/0 55.69,62.85 |only if Horde
talk Auctioneer Redmuse##8720 |goto Ironforge/0 24.25,74.54 |only if Alliance
|tip List the items you want to sell on the Auction House.
|tip
_Want to Farm More?_
Click Here to Farm Deep Sea Monsterbelly |confirm |next "Begin_Farming_Deep_Sea_Monsterbelly"
]])
ZygorGuidesViewer:RegisterGuide("GOLD\\Gathering\\Dragonfin Angelfish",{
author="support@zygorguides.com",
meta={goldtype="route",skillreq={Fishing=380},levelreq={71}},
items={{41807,1}},
maps={"Dragonblight"},
},[[
step
label "Begin_Farming_Dragonfin_Angelfish"
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
goldcollect Dragonfin Angelfish##41807 |goto Dragonblight/0 40.27,67.80
Click Here to Sell Dragonfin Angelfish |confirm |next "Sell_Dragonfin_Angelfish"
step
label "Sell_Dragonfin_Angelfish"
talk Auctioneer Thathung##8673 |goto Orgrimmar/0 55.69,62.85 |only if Horde
talk Auctioneer Redmuse##8720 |goto Ironforge/0 24.25,74.54 |only if Alliance
|tip List the items you want to sell on the Auction House.
|tip
_Want to Farm More?_
Click Here to Farm Dragonfin Angelfish |confirm |next "Begin_Farming_Dragonfin_Angelfish"
]])
ZygorGuidesViewer:RegisterGuide("GOLD\\Gathering\\Fangtooth Herring",{
author="support@zygorguides.com",
meta={goldtype="route",skillreq={Fishing=380},levelreq={68}},
items={{41810,1}},
maps={"Howling Fjord"},
},[[
step
label "Begin_Farming_Fangtooth_Herring"
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
goldcollect Fangtooth Herring##41810
Click Here to Sell Fangtooth Herring |confirm |next "Sell_Fangtooth_Herring"
step
label "Sell_Fangtooth_Herring"
talk Auctioneer Thathung##8673 |goto Orgrimmar/0 55.69,62.85 |only if Horde
talk Auctioneer Redmuse##8720 |goto Ironforge/0 24.25,74.54 |only if Alliance
|tip List the items you want to sell on the Auction House.
|tip
_Want to Farm More?_
Click Here to Farm Fangtooth Herring |confirm |next "Begin_Farming_Fangtooth_Herring"
]])
ZygorGuidesViewer:RegisterGuide("GOLD\\Gathering\\Glacial Salmon",{
author="support@zygorguides.com",
meta={goldtype="route",skillreq={Fishing=380},levelreq={73}},
items={{41809,1}},
maps={"Grizzly Hills"},
},[[
step
label "Begin_Farming_Glacial_Salmon"
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
goldcollect Glacial Salmon##41809
Click Here to Sell Glacial Salmon |confirm |next "Sell_Glacial_Salmon"
step
label "Sell_Glacial_Salmon"
talk Auctioneer Thathung##8673 |goto Orgrimmar/0 55.69,62.85 |only if Horde
talk Auctioneer Redmuse##8720 |goto Ironforge/0 24.25,74.54 |only if Alliance
|tip List the items you want to sell on the Auction House.
|tip
_Want to Farm More?_
Click Here to Farm Glacial Salmon |confirm |next "Begin_Farming_Glacial_Salmon"
]])
ZygorGuidesViewer:RegisterGuide("GOLD\\Gathering\\Glassfin Minnow",{
author="support@zygorguides.com",
meta={goldtype="route",skillreq={Fishing=405},levelreq={73}},
items={{41814,1}},
maps={"Crystalsong Forest"},
},[[
step
label "Begin_Farming_Glassfin_Minnow"
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
goldcollect Glassfin Minnow##41814
Click Here to Sell Glassfin Minnow |confirm |next "Sell_Glassfin_Minnow"
step
label "Sell_Glassfin_Minnow"
talk Auctioneer Thathung##8673 |goto Orgrimmar/0 55.69,62.85 |only if Horde
talk Auctioneer Redmuse##8720 |goto Ironforge/0 24.25,74.54 |only if Alliance
|tip List the items you want to sell on the Auction House.
|tip
_Want to Farm More?_
Click Here to Farm Glassfin Minnow |confirm |next "Begin_Farming_Glassfin_Minnow"
]])
ZygorGuidesViewer:RegisterGuide("GOLD\\Gathering\\Imperial Manta Ray",{
author="support@zygorguides.com",
meta={goldtype="route",skillreq={Fishing=380},levelreq={68}},
items={{41802,1}},
maps={"Borean Tundra"},
},[[
step
label "Begin_Farming_Imperial_Manta_Ray"
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
goldcollect Imperial Manta Ray##41802
Click Here to Sell Imperial Manta Ray |confirm |next "Sell_Imperial_Manta_Ray"
step
label "Sell_Imperial_Manta_Ray"
talk Auctioneer Thathung##8673 |goto Orgrimmar/0 55.69,62.85 |only if Horde
talk Auctioneer Redmuse##8720 |goto Ironforge/0 24.25,74.54 |only if Alliance
|tip List the items you want to sell on the Auction House.
|tip
_Want to Farm More?_
Click Here to Farm Imperial Manta Ray |confirm |next "Begin_Farming_Imperial_Manta_Ray"
]])
ZygorGuidesViewer:RegisterGuide("GOLD\\Gathering\\Magic Eater",{
author="support@zygorguides.com",
meta={goldtype="route",skillreq={Fishing=430},levelreq={68}},
items={{43572,1}},
maps={"Dalaran"},
},[[
step
label "Begin_Farming_Magic_Eater"
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
goldcollect Magic Eater##43572 |goto Dalaran/1 61.78,15.32
Click Here to Sell Magic Eater |confirm |next "Sell_Magic_Eater"
step
label "Sell_Magic_Eater"
talk Auctioneer Thathung##8673 |goto Orgrimmar/0 55.69,62.85 |only if Horde
talk Auctioneer Redmuse##8720 |goto Ironforge/0 24.25,74.54 |only if Alliance
|tip List the items you want to sell on the Auction House.
|tip
_Want to Farm More?_
Click Here to Farm Magic Eater |confirm |next "Begin_Farming_Magic_Eater"
]])
ZygorGuidesViewer:RegisterGuide("GOLD\\Gathering\\Moonglow Cuttlefish",{
author="support@zygorguides.com",
meta={goldtype="route",skillreq={Fishing=480},levelreq={68}},
items={{41801,1}},
maps={"Northrend"},
},[[
step
label "Begin_Farming_Moonglow_Cuttlefish"
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
goldcollect Moonglow Cuttlefish##41801
Click Here to Sell Moonglow Cuttlefish |confirm |next "Sell_Moonglow_Cuttlefish"
step
label "Sell_Moonglow_Cuttlefish"
talk Auctioneer Thathung##8673 |goto Orgrimmar/0 55.69,62.85 |only if Horde
talk Auctioneer Redmuse##8720 |goto Ironforge/0 24.25,74.54 |only if Alliance
|tip List the items you want to sell on the Auction House.
|tip
_Want to Farm More?_
Click Here to Farm Moonglow Cuttlefish |confirm |next "Begin_Farming_Moonglow_Cuttlefish"
]])
ZygorGuidesViewer:RegisterGuide("GOLD\\Gathering\\Musselback Sculpin",{
author="support@zygorguides.com",
meta={goldtype="route",skillreq={Fishing=380},levelreq={68}},
items={{41806,1}},
maps={"Borean Tundra"},
},[[
step
label "Begin_Farming_Musselback_Sculpin"
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
goldcollect Musselback Sculpin##41806 |goto Borean Tundra/0 51.58,44.72
Click Here to Sell Musselback Sculpin |confirm |next "Sell_Musselback_Sculpin"
step
label "Sell_Musselback_Sculpin"
talk Auctioneer Thathung##8673 |goto Orgrimmar/0 55.69,62.85 |only if Horde
talk Auctioneer Redmuse##8720 |goto Ironforge/0 24.25,74.54 |only if Alliance
|tip List the items you want to sell on the Auction House.
|tip
_Want to Farm More?_
Click Here to Farm Musselback Sculpin |confirm |next "Begin_Farming_Musselback_Sculpin"
]])
ZygorGuidesViewer:RegisterGuide("GOLD\\Gathering\\Nettlefish",{
author="support@zygorguides.com",
meta={goldtype="route",skillreq={Fishing=430},levelreq={74}},
items={{41813,1}},
maps={"Sholazar Basin"},
},[[
step
label "Begin_Farming_Nettlefish"
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
goldcollect Nettlefish##41813
|goldtracker
Click Here to Sell Nettlefish |confirm |next "Sell_Nettlefish"
'|goto 61.91,67.76 < 30 |c |noway |or
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
goldcollect Nettlefish##41813
|goldtracker
'|goto 48.98,61.70 < 30 |c |noway |next "Start_Farming_Nettlefish" |or
Click Here to Sell Nettlefish |confirm |next "Sell_Nettlefish"
step
label "Sell_Nettlefish"
talk Auctioneer Thathung##8673 |goto Orgrimmar/0 55.69,62.85 |only if Horde
talk Auctioneer Redmuse##8720 |goto Ironforge/0 24.25,74.54 |only if Alliance
|tip List the items you want to sell on the Auction House.
|tip
_Want to Farm More?_
Click Here to Farm Nettlefish |confirm |next "Begin_Farming_Nettlefish"
]])
ZygorGuidesViewer:RegisterGuide("GOLD\\Gathering\\Rockfin Grouper",{
author="support@zygorguides.com",
meta={goldtype="route",skillreq={Fishing=380},levelreq={68}},
items={{41803,1}},
maps={"Northrend"},
},[[
step
label "Begin_Farming_Rockfin_Grouper"
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
goldcollect Rockfin Grouper##41803 |goto Northrend/0 31.10,67.37
|goldtracker
Click Here to Sell Rockfin Grouper |confirm |next "Sell_Rockfin_Grouper"
step
label "Sell_Rockfin_Grouper"
talk Auctioneer Thathung##8673 |goto Orgrimmar/0 55.69,62.85 |only if Horde
talk Auctioneer Redmuse##8720 |goto Ironforge/0 24.25,74.54 |only if Alliance
|tip List the items you want to sell on the Auction House.
|tip
_Want to Farm More?_
Click Here to Farm Rockfin Grouper |confirm |next "Begin_Farming_Rockfin_Grouper"
]])
ZygorGuidesViewer:RegisterGuide("GOLD\\Gathering\\Sewer Carp",{
author="support@zygorguides.com",
meta={goldtype="route",skillreq={Fishing=430},levelreq={68}},
items={{43571,1}},
maps={"Dalaran"},
},[[
step
label "Begin_Farming_Sewer_Carp"
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
goldcollect Sewer Carp##43571
|goldtracker
Click Here to Sell Sewer Carp |confirm |next "Sell_Sewer_Carp"
step
label "Sell_Sewer_Carp"
talk Auctioneer Thathung##8673 |goto Orgrimmar/0 55.69,62.85 |only if Horde
talk Auctioneer Redmuse##8720 |goto Ironforge/0 24.25,74.54 |only if Alliance
|tip List the items you want to sell on the Auction House.
|tip
_Want to Farm More?_
Click Here to Farm Sewer Carp |confirm |next "Begin_Farming_Sewer_Carp"
]])
ZygorGuidesViewer:RegisterGuide("GOLD\\Gathering\\Adder's Tongue",{
author="support@zygorguides.com",
meta={goldtype="route",skillreq={Herbalism=400},levelreq={74}},
items={{36903,1}},
maps={"Sholazar Basin"},
},[[
step
label "Begin_Farming_Adder's_Tongue"
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
goldcollect Adder's Tongue##36903
|goldtracker
Click Here to Sell Adder's Tongue |confirm |next "Sell_Adder's_Tongue"
step
label "Sell_Adder's_Tongue"
talk Auctioneer Thathung##8673 |goto Orgrimmar/0 55.69,62.85 |only if Horde
talk Auctioneer Redmuse##8720 |goto Ironforge/0 24.25,74.54 |only if Alliance
|tip List the items you want to sell on the Auction House.
|tip
_Want to Farm More?_
Click Here to Farm Adder's Tongue |confirm |next "Begin_Farming_Adder's_Tongue"
]])
ZygorGuidesViewer:RegisterGuide("GOLD\\Gathering\\Deadnettle",{
author="support@zygorguides.com",
meta={goldtype="route",skillreq={Herbalism=350},levelreq={73}},
items={{37921,1}},
maps={"Grizzly Hills"},
},[[
step
label "Begin_Farming_Deadnettle"
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
goldcollect Deadnettle##37921
|goldtracker
Click Here to Sell Deadnettle |confirm |next "Sell_Deadnettle"
step
label "Sell_Deadnettle"
talk Auctioneer Thathung##8673 |goto Orgrimmar/0 55.69,62.85 |only if Horde
talk Auctioneer Redmuse##8720 |goto Ironforge/0 24.25,74.54 |only if Alliance
|tip List the items you want to sell on the Auction House.
|tip
_Want to Farm More?_
Click Here to Farm Deadnettle |confirm |next "Begin_Farming_Deadnettle"
]])
ZygorGuidesViewer:RegisterGuide("GOLD\\Gathering\\Goldclover",{
author="support@zygorguides.com",
meta={goldtype="route",skillreq={Herbalism=350},levelreq={73}},
items={{36901,1}},
maps={"Grizzly Hills"},
},[[
step
label "Begin_Farming_Goldclover"
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
goldcollect Goldclover##36901
|goldtracker
Click Here to Sell Goldclover |confirm |next "Sell_Goldclover"
step
label "Sell_Goldclover"
talk Auctioneer Thathung##8673 |goto Orgrimmar/0 55.69,62.85 |only if Horde
talk Auctioneer Redmuse##8720 |goto Ironforge/0 24.25,74.54 |only if Alliance
|tip List the items you want to sell on the Auction House.
|tip
_Want to Farm More?_
Click Here to Farm Goldclover |confirm |next "Begin_Farming_Goldclover"
]])
ZygorGuidesViewer:RegisterGuide("GOLD\\Gathering\\Icethorn",{
author="support@zygorguides.com",
meta={goldtype="route",skillreq={Herbalism=435},levelreq={78}},
items={{36906,1}},
maps={"The Storm Peaks"},
},[[
step
label "Begin_Farming_Icethorn"
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
goldcollect Icethorn##36906
|goldtracker
Click Here to Sell Icethorn |confirm |next "Sell_Icethorn"
step
label "Sell_Icethorn"
talk Auctioneer Thathung##8673 |goto Orgrimmar/0 55.69,62.85 |only if Horde
talk Auctioneer Redmuse##8720 |goto Ironforge/0 24.25,74.54 |only if Alliance
|tip List the items you want to sell on the Auction House.
|tip
_Want to Farm More?_
Click Here to Farm Icethorn |confirm |next "Begin_Farming_Icethorn"
]])
ZygorGuidesViewer:RegisterGuide("GOLD\\Gathering\\Lichbloom",{
author="support@zygorguides.com",
meta={goldtype="route",skillreq={Herbalism=425},levelreq={78}},
items={{36905,1}},
maps={"The Storm Peaks"},
},[[
step
label "Begin_Farming_Lichbloom"
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
goldcollect Lichbloom##36905
|goldtracker
Click Here to Sell Lichbloom |confirm |next "Sell_Lichbloom"
step
label "Sell_Lichbloom"
talk Auctioneer Thathung##8673 |goto Orgrimmar/0 55.69,62.85 |only if Horde
talk Auctioneer Redmuse##8720 |goto Ironforge/0 24.25,74.54 |only if Alliance
|tip List the items you want to sell on the Auction House.
|tip
_Want to Farm More?_
Click Here to Farm Lichbloom |confirm |next "Begin_Farming_Lichbloom"
]])
ZygorGuidesViewer:RegisterGuide("GOLD\\Gathering\\Talandra's Rose",{
author="support@zygorguides.com",
meta={goldtype="route",skillreq={Herbalism=385},levelreq={75}},
items={{36907,1}},
maps={"Zul'Drak"},
},[[
step
label "Begin_Farming_Talandra's_Rose"
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
goldcollect Talandra's Rose##36907
|goldtracker
Click Here to Sell Talandra's Rose |confirm |next "Sell_Talandra's_Rose"
step
label "Sell_Talandra's_Rose"
talk Auctioneer Thathung##8673 |goto Orgrimmar/0 55.69,62.85 |only if Horde
talk Auctioneer Redmuse##8720 |goto Ironforge/0 24.25,74.54 |only if Alliance
|tip List the items you want to sell on the Auction House.
|tip
_Want to Farm More?_
Click Here to Farm Talandra's Rose |confirm |next "Begin_Farming_Talandra's_Rose"
]])
ZygorGuidesViewer:RegisterGuide("GOLD\\Gathering\\Tiger Lily",{
author="support@zygorguides.com",
meta={goldtype="route",skillreq={Herbalism=375},levelreq={73}},
items={{36904,1}},
maps={"Grizzly Hills"},
},[[
step
label "Begin_Farming_Tiger_Lily"
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
goldcollect Tiger Lily##36904
|goldtracker
Click Here to Sell Tiger Lily |confirm |next "Sell_Tiger_Lily"
step
label "Sell_Tiger_Lily"
talk Auctioneer Thathung##8673 |goto Orgrimmar/0 55.69,62.85 |only if Horde
talk Auctioneer Redmuse##8720 |goto Ironforge/0 24.25,74.54 |only if Alliance
|tip List the items you want to sell on the Auction House.
|tip
_Want to Farm More?_
Click Here to Farm Tiger Lily |confirm |next "Begin_Farming_Tiger_Lily"
]])
ZygorGuidesViewer:RegisterGuide("GOLD\\Gathering\\Cobalt Ore",{
author="support@zygorguides.com",
meta={goldtype="route",skillreq={Mining=350},levelreq={68}},
items={{36909,1}},
maps={"Howling Fjord"},
},[[
step
label "Begin_Farming_Cobalt_Ore"
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
goldcollect Cobalt Ore##36909
|goldtracker
Click Here to Sell Cobalt Ore |confirm |next "Sell_Cobalt_Ore"
step
label "Sell_Cobalt_Ore"
talk Auctioneer Thathung##8673 |goto Orgrimmar/0 55.69,62.85 |only if Horde
talk Auctioneer Redmuse##8720 |goto Ironforge/0 24.25,74.54 |only if Alliance
|tip List the items you want to sell on the Auction House.
|tip
_Want to Farm More?_
Click Here to Farm Cobalt Ore |confirm |next "Begin_Farming_Cobalt_Ore"
]])
ZygorGuidesViewer:RegisterGuide("GOLD\\Gathering\\Saronite Ore",{
author="support@zygorguides.com",
meta={goldtype="route",skillreq={Mining=400},levelreq={78}},
items={{36912,1}},
maps={"Icecrown"},
},[[
step
label "Begin_Farming_Saronite_Ore"
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
goldcollect Saronite Ore##36912
|goldtracker
Click Here to Sell Saronite Ore |confirm |next "Sell_Saronite_Ore"
step
label "Sell_Saronite_Ore"
talk Auctioneer Thathung##8673 |goto Orgrimmar/0 55.69,62.85 |only if Horde
talk Auctioneer Redmuse##8720 |goto Ironforge/0 24.25,74.54 |only if Alliance
|tip List the items you want to sell on the Auction House.
|tip
_Want to Farm More?_
Click Here to Farm Saronite Ore |confirm |next "Begin_Farming_Saronite_Ore"
]])
ZygorGuidesViewer:RegisterGuide("GOLD\\Gathering\\Titanium Ore",{
author="support@zygorguides.com",
meta={goldtype="route",skillreq={Mining=450},levelreq={78}},
items={{36910,1}},
maps={"Icecrown"},
},[[
step
label "Begin_Farming_Titanium_Ore"
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
goldcollect Titanium Ore##36910
|goldtracker
Click Here to Sell Titanium Ore |confirm |next "Sell_Titanium_Ore"
step
label "Sell_Titanium_Ore"
talk Auctioneer Thathung##8673 |goto Orgrimmar/0 55.69,62.85 |only if Horde
talk Auctioneer Redmuse##8720 |goto Ironforge/0 24.25,74.54 |only if Alliance
|tip List the items you want to sell on the Auction House.
|tip
_Want to Farm More?_
Click Here to Farm Titanium Ore |confirm |next "Begin_Farming_Titanium_Ore"
]])
ZygorGuidesViewer:RegisterGuide("GOLD\\Gathering\\Borean Leather",{
author="support@zygorguides.com",
meta={goldtype="route",skillreq={Skinning=345},levelreq={70}},
items={{33568,1}},
maps={"Borean Tundra"},
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
goldcollect Borean Leather##33568
|goldtracker
Click Here to Sell Borean Leather |confirm |next "Sell_Borean_Leather"
'|goto 47.89,46.20 < 30 |c |noway |or
step
map Borean Tundra/0
path follow smart; loop on; ants curved; dist 30
path	50.60,68.96	49.51,72.06	47.53,73.94	44.84,74.30	42.65,74.76
path	40.52,72.87	41.06,70.43	43.42,70.41	45.00,70.40	47.12,70.14
path	48.70,69.55	50.08,66.87
Kill Wooly Rhino enemies around along the path
|tip Skin their corpses.
|tip You will need 345 Skinning skill minimum to skin all of these mobs.
goldcollect Borean Leather##33568
|goldtracker
Click Here to Sell Borean Leather |confirm |next "Sell_Borean_Leather"
'|goto 50.08,66.87 < 30 |c |noway |next "Begin_Farming_Borean_Leather" |or
step
label "Sell_Borean_Leather"
talk Auctioneer Thathung##8673 |goto Orgrimmar/0 55.69,62.85 |only if Horde
talk Auctioneer Redmuse##8720 |goto Ironforge/0 24.25,74.54 |only if Alliance
|tip List the items you want to sell on the Auction House.
|tip
_Want to Farm More?_
Click Here to Farm Borean Leather |confirm |next "Begin_Farming_Borean_Leather"
]])
ZygorGuidesViewer:RegisterGuide("GOLD\\Gathering\\Frostweave Cloth",{
author="support@zygorguides.com",
meta={goldtype="route",skillreq={Tailoring=350},levelreq={78}},
items={{2589,1}},
maps={"Icecrown"},
},[[
step
label "Begin_Farming_Frostweave_Cloth"
kill Mjordin Combatant##30037+
|tip They will continuously respawn when you deplete their numbers.
goldcollect Frostweave Cloth##2589 |goto Icecrown/0 37.29,23.72
|goldtracker
Click Here to Sell Frostweave Cloth |confirm |next "Sell_Frostweave_Cloth"
step
label "Sell_Frostweave_Cloth"
talk Auctioneer Thathung##8673 |goto Orgrimmar/0 55.69,62.85 |only if Horde
talk Auctioneer Redmuse##8720 |goto Ironforge/0 24.25,74.54 |only if Alliance
|tip List the items you want to sell on the Auction House.
|tip
_Want to Farm More?_
Click Here to Farm Frostweave Cloth |confirm |next "Begin_Farming_Frostweave_Cloth"
]])