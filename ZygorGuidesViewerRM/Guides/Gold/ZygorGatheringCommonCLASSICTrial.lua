ZGV.Gold.guides_loaded=true
if ZGV:DoMutex("GoldGathC") then return end
ZygorGuidesViewer.GuideMenuTier = "TRI"
ZygorGuidesViewer:RegisterGuidePlaceholder("GOLD\\Gathering\\Barbed Gill Trout, Spotted Feltail, Zangarian Sporefish")
ZygorGuidesViewer:RegisterGuidePlaceholder("GOLD\\Gathering\\Furious Crawdad, Golden Darter")
ZygorGuidesViewer:RegisterGuidePlaceholder("GOLD\\Gathering\\Bloodfin Catfish, Crescent-Tail Skullfish")
ZygorGuidesViewer:RegisterGuidePlaceholder("GOLD\\Gathering\\Felweed")
ZygorGuidesViewer:RegisterGuidePlaceholder("GOLD\\Gathering\\Ancient Lichen")
ZygorGuidesViewer:RegisterGuidePlaceholder("GOLD\\Gathering\\Dreaming Glory")
ZygorGuidesViewer:RegisterGuidePlaceholder("GOLD\\Gathering\\Nightmare Vine, Fel Lotus")
ZygorGuidesViewer:RegisterGuidePlaceholder("GOLD\\Gathering\\Mana Thistle")
ZygorGuidesViewer:RegisterGuidePlaceholder("GOLD\\Gathering\\Netherbloom")
ZygorGuidesViewer:RegisterGuidePlaceholder("GOLD\\Gathering\\Ragveil")
ZygorGuidesViewer:RegisterGuidePlaceholder("GOLD\\Gathering\\Terocone")
ZygorGuidesViewer:RegisterGuidePlaceholder("GOLD\\Gathering\\Adamantite Ore, Eternium Ore")
ZygorGuidesViewer:RegisterGuidePlaceholder("GOLD\\Gathering\\Adamantite Ore, Eternium Ore, Khorium Ore")
ZygorGuidesViewer:RegisterGuidePlaceholder("GOLD\\Gathering\\Fel Iron Ore, Eternium Ore")
ZygorGuidesViewer:RegisterGuidePlaceholder("GOLD\\Gathering\\Knothide Leather")
ZygorGuidesViewer:RegisterGuidePlaceholder("GOLD\\Gathering\\Thick Clefthoof Leather")
ZygorGuidesViewer:RegisterGuidePlaceholder("GOLD\\Gathering\\Fel Hide")
ZygorGuidesViewer:RegisterGuidePlaceholder("GOLD\\Gathering\\Fel Scales")
ZygorGuidesViewer:RegisterGuidePlaceholder("GOLD\\Gathering\\Nether Dragonscale")
ZygorGuidesViewer:RegisterGuidePlaceholder("GOLD\\Gathering\\Wind Scales")
ZygorGuidesViewer:RegisterGuidePlaceholder("GOLD\\Gathering\\Cobra Scales")
ZygorGuidesViewer:RegisterGuidePlaceholder("GOLD\\Gathering\\Barrelhead Goby")
ZygorGuidesViewer:RegisterGuidePlaceholder("GOLD\\Gathering\\Bonescale Snapper")
ZygorGuidesViewer:RegisterGuidePlaceholder("GOLD\\Gathering\\Borean Man O' War")
ZygorGuidesViewer:RegisterGuidePlaceholder("GOLD\\Gathering\\Deep Sea Monsterbelly")
ZygorGuidesViewer:RegisterGuidePlaceholder("GOLD\\Gathering\\Dragonfin Angelfish")
ZygorGuidesViewer:RegisterGuidePlaceholder("GOLD\\Gathering\\Fangtooth Herring")
ZygorGuidesViewer:RegisterGuidePlaceholder("GOLD\\Gathering\\Glacial Salmon")
ZygorGuidesViewer:RegisterGuidePlaceholder("GOLD\\Gathering\\Glassfin Minnow")
ZygorGuidesViewer:RegisterGuidePlaceholder("GOLD\\Gathering\\Imperial Manta Ray")
ZygorGuidesViewer:RegisterGuidePlaceholder("GOLD\\Gathering\\Magic Eater")
ZygorGuidesViewer:RegisterGuidePlaceholder("GOLD\\Gathering\\Moonglow Cuttlefish")
ZygorGuidesViewer:RegisterGuidePlaceholder("GOLD\\Gathering\\Musselback Sculpin")
ZygorGuidesViewer:RegisterGuidePlaceholder("GOLD\\Gathering\\Nettlefish")
ZygorGuidesViewer:RegisterGuidePlaceholder("GOLD\\Gathering\\Rockfin Grouper")
ZygorGuidesViewer:RegisterGuidePlaceholder("GOLD\\Gathering\\Sewer Carp")
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
ZygorGuidesViewer:RegisterGuidePlaceholder("GOLD\\Gathering\\Deadnettle")
ZygorGuidesViewer:RegisterGuidePlaceholder("GOLD\\Gathering\\Goldclover")
ZygorGuidesViewer:RegisterGuidePlaceholder("GOLD\\Gathering\\Icethorn")
ZygorGuidesViewer:RegisterGuidePlaceholder("GOLD\\Gathering\\Lichbloom")
ZygorGuidesViewer:RegisterGuidePlaceholder("GOLD\\Gathering\\Talandra's Rose")
ZygorGuidesViewer:RegisterGuidePlaceholder("GOLD\\Gathering\\Tiger Lily")
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
ZygorGuidesViewer:RegisterGuidePlaceholder("GOLD\\Gathering\\Saronite Ore")
ZygorGuidesViewer:RegisterGuidePlaceholder("GOLD\\Gathering\\Titanium Ore")
ZygorGuidesViewer:RegisterGuidePlaceholder("GOLD\\Gathering\\Borean Leather")
ZygorGuidesViewer:RegisterGuidePlaceholder("GOLD\\Gathering\\Frostweave Cloth")