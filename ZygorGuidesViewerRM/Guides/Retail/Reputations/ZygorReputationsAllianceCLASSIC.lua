local ZygorGuidesViewer=ZygorGuidesViewer
if not ZygorGuidesViewer then return end
if UnitFactionGroup("player")~="Alliance" then return end
ZygorGuidesViewer.GuideMenuTier = "CLA"
ZGV.BETASTART()
ZygorGuidesViewer:RegisterGuide("Reputation Guides\\The Burning Crusade\\Honor Hold",{
author="support@zygorguides.com",
startlevel=58,
endlevel=70,
},[[
step
"Hellfire Ramparts" and "The Blood Furnace" give rep up to 5999/6000 Friendly rep.
|tip For a full clear, Hellfire Ramparts will provide 633 reputation.
|tip For a full clear, the Blood Furnace will net 750 reputation.
|tip For optimal rep gains, it may be best to grind to 5999 Friendly before starting the Hellfire Peninsula leveling guide.
Reach 5,999 Into Honored Reputation with Honor Hold
|tip If you prefer to skip this, click the line below.
Click here to continue |confirm
step
Complete the "Hellfire Ramparts Quests" guide |complete countcompletedq(9588,9572) == 2 |future
step
Complete "The Blood Furnace Quests" guide |complete countcompletedq(9590,9608) == 2 |future
step
Complete the "Hellfire Peninsula" leveling guide
|tip Refer to the guide to accomplish this.
Click here to continue |confirm
step
ding 68
step
Complete the "Shattered Halls Quests" guide |q 9495 |future
step
Clear enemies within the Shattered Halls
|tip Full clears net around 1,600 reputation.
Reach Revered Reputation with Honor Hold |condition rep("Honor Hold")>=Revered
step
Run Heroic Hellfire Citadel Dungeons for reputation.
|tip A full clear of Heroic Hellfire Rampart nets roughly 2,500 reputation.
|tip A full clear of Heroic Blood Furnace nets roughly 2,700 reputation.
|tip A full clear of Heroic Shattered Halls nets roughly 2,900 reputation.
|tip A full clear of Normal Shattered Halls nets roughly 1,600 reputation.
Reach Exalted Reputation with Honor Hold |condition rep("Honor Hold")==Exalted
]])
ZygorGuidesViewer:RegisterGuide("Reputation Guides\\The Burning Crusade\\Cenarion Expedition",{
author="support@zygorguides.com",
startlevel=58,
endlevel=70,
},[[
step
ding 62
step
Kill enemies around this area
collect 240 Unidentified Plant Parts##24401 |goto Zangarmarsh/0 71.65,76.32
|tip You can also buy them from the Auction House.
|only if rep("Cenarion Expedition") <= Honored
step
talk Lauranna Thar'well##17909
accept Plants of Zangarmarsh##9802 |goto 80.32,64.17
step
Kill enemies around this area
collect 10 Unidentified Plant Parts##24401 |q 9802/1 |goto 71.65,76.32
step
talk Lauranna Thar'well##17909
turnin Plants of Zangarmarsh##9802 |goto 80.32,64.17
step
talk Lauranna Thar'well##17909
accept Identify Plant Parts##9784 |goto 80.32,64.17 |future
|tip This quest is repeatable until Honored.
|tip You can also run the Slave Pens and Underbog for reputation up until Honored.
Reach Honored with the Cenarion Expedition |condition rep("Cenarion Expedition")>=Honored
step
use the Package of Identified Plants##24402
use the Uncatalogued Species##24407
|tip This is contained in the Package of Identified Plants.
|tip There is a low chance of obtaining this item.
accept Uncatalogued Species##9875
step
talk Lauranna Thar'well##17909
turnin Uncatalogued Species##9875 |goto 80.32,64.17
step
Complete the "Slave Pens Quests" guide |q 9738 |future
step
Complete "The Underbog Quests" guide |complete countcompletedq(9738,9717,9719,9715) == 4 |future
step
ding 70
step
Complete the "Steamvaults Quests" guide |complete countcompletedq(9763,9764,10885) == 3 |future
step
Clear enemies within the Steamvaults
|tip Full clears net around 1,600 reputation.
Reach Revered Reputation with the Cenarion Expedition |condition rep("Cenarion Expedition")>=Revered
step
Run Heroic Coilfang Resevoir Dungeons for reputation.
|tip A full clear of Heroic Slave Pens nets roughly 2,750 reputation.
|tip A full clear of Underbog nets roughly 2,600 reputation.
|tip A full clear of Heroic Steamvaults nets roughly 2,600 reputation.
|tip A full clear of Normal Steamvaults nets roughly 1,600 reputation.
Reach Exalted Reputation with the Cenarion Expedition |condition rep("Cenarion Expedition")==Exalted
]])
ZygorGuidesViewer:RegisterGuide("Reputation Guides\\The Burning Crusade\\Lower City",{
author="support@zygorguides.com",
startlevel=58,
endlevel=70,
},[[
step
ding 64
step
Kill enemies around this area
collect 1080 Arakkoa Feather##25719 |goto Terokkar Forest/0 31.08,42.28
|tip You can also buy them from the Auction House.
|tip You will only need this many if you plan to run no instances.
|tip A full clear of Auchenai Crypts nets roughly 700 reputation.
|tip A full clear of Sethekk Halls nets roughly 1000 reputation.
|tip A full clear of Shadow Labyrinth nets roughly 1750 reputation.
|only if rep("Lower City") <= Honored
step
Run up the ramp |goto Shattrath City/0 56.45,16.27 < 7 |only if walking
talk Vekax##22429
|tip He walks around this area.
|tip Up on this wooden platform.
accept The Outcast's Plight##10917 |goto 52.01,18.10
step
Kill enemies around this area
collect 30 Arakkoa Feather##25719 |goto Terokkar Forest/0 31.08,42.28
step
Run up the ramp |goto Shattrath City/0 56.45,16.27 < 7 |only if walking
talk Vekax##22429
|tip He walks around this area.
|tip Up on this wooden platform.
turnin The Outcast's Plight##10917 |goto 52.01,18.10
step
Run up the ramp |goto Shattrath City/0 56.45,16.27 < 7 |only if walking
talk Vekax##22429
|tip He walks around this area.
|tip Up on this wooden platform.
accept More Feathers##10918 |goto 52.01,18.10
|tip This quest is repeatable until Honored.
|tip You can also run Auchenai Crypts, Sethekk Halls or Shadow Labyrunth for reputation up until Honored.
Reach Honored with the Lower City |condition rep("Lower City")>=Honored
step
Complete the "Auchenai Crypts Quests" guide |complete countcompletedq(10168,10164) == 2 |future
step
Complete the "Sethekk Halls Quests" guide |complete countcompletedq(10097,10098,10180) == 3 |future
step
Complete the "Shadow Labyrinth Quests" guide |complete countcompletedq(10666,10091,10095,9831,10649) == 5 |future
step
Clear enemies within the Steamvaults
|tip Full clears net around 1,600 reputation.
Reach Revered Reputation with the Lower City |condition rep("Lower City")>=Revered
step
Run Heroic Coilfang Resevoir Dungeons for reputation.
|tip A full clear of Heroic Auchenai Crpts nets roughly 2,000 reputation.
|tip A full clear of Heroic Sethekk Halls nets roughly 2,000 reputation.
|tip A full clear of Heroic Shadow Labyrinth nets roughly 2,700 reputation.
|tip A full clear of Normal Sethekk Halls nets roughly 1,000 reputation.
|tip A full clear of Normal Shadow Labyrinth nets roughly 1,700 reputation.
Reach Exalted Reputation with the Lower City |condition rep("Lower City")==Exalted
]])
ZygorGuidesViewer:RegisterGuide("Reputation Guides\\The Burning Crusade\\The Scryers",{
author="support@zygorguides.com",
startlevel=60,
endlevel=70,
},[[
step
talk Haggard War Veteran##19684
|tip He walks along the bridge.
accept A'dal##10210 |goto Shattrath City/0 60.29,16.69
step
talk A'dal##18481
|tip Inside the building.
turnin A'dal##10210 |goto 54.00,44.71
step
talk Khadgar##18166
|tip Inside the building.
accept City of Light##10211 |goto 54.75,44.32
step
Follow Khadgar's Servant and listen to its story |q 10211/1
|tip Make sure you follow it or you will have to repeat this step.
|tip Marking it with a Raid Target Icon can help track it.
step
talk Khadgar##18166
|tip Inside the building.
turnin City of Light##10211 |goto 54.76,44.33
accept Allegiance to the Scryers##10552 |instant |goto 54.76,44.33
step
talk Khadgar##18166
accept Voren'thal the Seer##10553 |goto 54.76,44.33
step
Use the Elevator |goto 49.94,62.96 < 7 |n |only if walking
talk Magistrix Fyalenn##18531
accept Firewing Signets##10412 |goto 45.20,81.44
accept Sunfury Signets##10656 |goto 45.20,81.44
step
talk Voren'thal the Seer##18530
|tip Upstairs inside the building.
turnin Voren'thal the Seer##10553 |goto 42.79,91.71
accept Synthesis of Power##10416 |goto 42.79,91.71
step
talk Arcanist Savan##23272
accept Report to Spymaster Thalodien##11039 |goto 44.59,76.41
step
talk Spymaster Thalodien##19468
|tip Inside the building.
turnin Report to Spymaster Thalodien##11039 |goto Netherstorm/0 32.00,64.07
accept Manaforge B'naar##10189 |goto Netherstorm/0 32.00,64.07
step
kill Captain Arathyn##19635
|tip He walks around this area on a big purple bird.
collect B'naar Personnel Roster##28376 |q 10189/1 |goto 27.8,65
step
talk Spymaster Thalodien##19468
|tip Inside the building.
turnin Manaforge B'naar##10189 |goto 32.00,64.07
accept High Value Targets##10193 |goto 32.00,64.07
step
talk Magistrix Larynna##19469
|tip Inside the building.
accept Bloodgem Crystals##10204 |goto 32.05,64.00
only if rep ('The Scryers') >= Friendly
stickystart "Kill_8_Sunfury_Geologist"
stickystart "Kill_2_Sunfury_Warp-Master"
stickystart "Kill_6_Sunfury_Warp-Engineers"
stickystart "Collect_10_Sunfury_Signets"
step
kill Sunfury Magister##18855+
collect Bloodgem Shard##28452 |n
use the Bloodgem Shard##28452
|tip Use it next to the floating crystal.
Siphon the Bloodgem Crystal |q 10204/1 |goto 25.29,65.87
step
label "Kill_8_Sunfury_Geologist"
kill 8 Sunfury Geologist##19779+ |q 10193/3 |goto 28.57,70.80
step
label "Kill_2_Sunfury_Warp-Master"
kill 2 Sunfury Warp-Master##18857+ |q 10193/1 |goto 26.58,71.73
step
label "Kill_6_Sunfury_Warp-Engineers"
kill 6 Sunfury Warp-Engineer##18852+ |q 10193/2 |goto 28.62,72.08
You can find more around [26.78,72.08]
step
label "Collect_10_Sunfury_Signets"
collect 10 Sunfury Signet##30810 |q 10656/1 |goto 26.9,70.5
step
talk Spymaster Thalodien##19468
|tip Inside the building.
turnin High Value Targets##10193 |goto 32.00,64.07
accept Shutting Down Manaforge B'naar##10329 |goto 32.00,64.07
step
talk Magistrix Larynna##19469
|tip Inside the building.
turnin Bloodgem Crystals##10204 |goto 32.05,64.00
step
kill Overseer Theredis##20416
|tip Walking around inside the building.
collect B'naar Access Crystal##29366 |q 10329/2 |goto 23.85,70.62
step
click the B'naar Control Console
|tip Inside the building.
Choose  _"<Begin emergency shutdown>"_
Kill enemies around this area
|tip They will spawn in waves for 2 minutes.
Shut Down Manaforge B'naar |q 10329/1 |goto 23.19,68.10
step
talk Spymaster Thalodien##19468
|tip Inside the building.
turnin Shutting Down Manaforge B'naar##10329 |goto 32.00,64.07
accept Stealth Flight##10194 |goto 32.00,64.07
step
talk Veronia##20162
turnin Stealth Flight##10194 |goto 33.81,64.23
accept Behind Enemy Lines##10652 |goto 33.81,64.23
step
talk Veronia##20162
Tell her _"I'm as ready as i'll ever be."_
Fly to Manaforge Coruu |goto 48.0,86.0 < 5 |noway |c |q 10652
step
talk Caledis Brightdawn##19840
turnin Behind Enemy Lines##10652 |goto 48.24,86.60
accept A Convincing Disguise##10197 |goto 48.24,86.60
step
kill Sunfury Arcanists##20134+
collect Sunfury Arcanist Robes##28635 |q 10197/3 |goto 47.68,85.14
step
kill Sunfury Researcher##20136+
|tip Inside the building.
collect Sunfury Researcher Gloves##28636 |q 10197/1 |goto 49.01,81.49
step
kill Sunfury Guardsmen##18850
collect Sunfury Guardsman Medallion##28637 |q 10197/2 |goto 50.65,83.35
step
talk Caledis Brightdawn##19840
turnin A Convincing Disguise##10197 |goto 48.24,86.60
accept Information Gathering##10198 |goto 48.24,86.60
step
use the Sunfury Disguise##28607 |havebuff 133564 |q 10198
step
Inside of Manaforge Coruu:
|tip Avoid the Arcane Annihilators, they can see through the disguise.
|tip Listen to the information provided in the room full of blood elves.
Gather the Information |q 10198/1 |goto 48.20,84.08
step
talk Caledis Brightdawn##19840
turnin Information Gathering##10198 |goto 48.24,86.60
accept Shutting Down Manaforge Coruu##10330 |goto 48.24,86.60
step
Inside of Manaforge Coruu:
kill Overseer Seylanna##20397
|tip Inside the building.
collect Coruu Access Crystal##29396 |q 10330/2 |goto 49.01,81.49
step
Inside of Manaforge Coruu:
click the Coruu Control Console##183956
|tip Inside the building.
Choose _"<Begin emergency shutdown>"_
Kill enemies around this area
|tip They will spawn in waves for 2 minutes.
Shut Down Manaforge Coruu |q 10330/1 |goto 49.01,81.49
step
talk Caledis Brightdawn##19840
turnin Shutting Down Manaforge Coruu##10330 |goto 48.24,86.60
accept Return to Thalodien##10200 |goto 48.24,86.60
step
talk Spymaster Thalodien##19468
|tip Inside the building.
turnin Return to Thalodien##10200 |goto 32.00,64.07
step
talk Magistrix Larynna##19469
accept Kick Them While They're Down##10341 |goto 32.00,64.07
step
talk Spymaster Thalodien##19468
accept Shutting Down Manaforge Duro##10338 |goto 32.00,64.07
only if rep ('The Scryers') >= Neutral
stickystart "Kill_8_Sunfury_Conjurers"
stickystart "Kill_6_Sunfury_Bowmen"
stickystart "Kilil_4_Sunfury_Centurion"
step
Inside Manaforge Duro:
kill Overseer Athanel##20435
collect 1 Duro Access Crystal##29397|q 10338/2 |goto 59.99,68.48
only if rep ('The Scryers') >= Friendly
step
Inside Manaforge Duro:
click the Duro Control Console##184311
Choose _"<Begin emergency shutdown>"_
Kill enemies around this area
|tip They will spawn in waves for 2 minutes.
Shut Down Manaforge Duro |q 10338/1 |goto 59.09,66.81
only if rep ('The Scryers') >= Friendly
step
label "Kill_6_Sunfury_Bowmen"
kill 6 Sunfury Bowman##20207+ |q 10341/2 |goto 58.50,63.38
only if rep ('The Scryers') >= Friendly
step
label "Kill_8_Sunfury_Conjurers"
kill 8 Sunfury Conjurer##20139+ |q 10341/1 |goto 57.42,63.79
only if rep ('The Scryers') >= Friendly
step
label "Kilil_4_Sunfury_Centurion"
kill 4 Sunfury Centurion##20140+ |q 10341/3 |goto 56.73,65.08
only if rep ('The Scryers') >= Friendly
step
talk Spymaster Thalodien##19468
turnin Shutting Down Manaforge Duro##10338 |goto 32.00,64.07
step
talk Magistrix Larynna##19469
turnin Kick Them While They're Down##10341 |goto 32.00,64.07
accept A Defector##10202 |goto 32.00,64.07
only if rep ('The Scryers') >= Friendly
step
talk Magister Theledorn##20920
turnin A Defector##10202 |goto 26.2,41.6
accept Damning Evidence##10432 |goto 26.2,41.6
only if rep ('The Scryers') >= Friendly
step
Inside Manaforge Ara:
Kill enemies around this area
collect 8 Orders From Kael'thas##29797 |q 10432/1 |goto 27.11,39.19
only if rep ('The Scryers') >= Friendly
step
talk Spymaster Thalodien##19468
turnin Damning Evidence##10432 |goto 32.00,64.07
accept A Gift for Voren'thal##10508 |goto 32.00,64.07
only if rep ('The Scryers') >= Friendly
step
kill Forgemaster Morug##20800
|tip You may need help with this.
collect First Half of Socrethar's Stone##29624 |q 10508/1 |goto 36.83,27.87
only if rep ('The Scryers') >= Friendly
step
kill Silroth##20801
|tip You may need help with this.
collect Second Half of Socrethar's Stone##29625 |q 10508/2 |goto 40.88,19.54
only if rep ('The Scryers') >= Friendly
step
talk Spymaster Thalodien##19468
turnin A Gift for Voren'thal##10508 |goto 32.00,64.07
accept Bound for Glory##10509 |goto 32.00,64.07
step
talk Voren'thal the Seer##18530
|tip Upstairs inside the building.
turnin Bound for Glory##10509 |goto Shattrath City/0 42.77,91.72
accept Turnin Point##10507 |goto Shattrath City/0 42.77,91.72
step
use Voren'thal's Package##30260
collect 1 Socrethar's Teleportation Stone##29796 |n
collect 1 Voren'thal's Presence##30259 |n
Stand in the teleporter |goto Netherstorm/0 36.42,18.33
use Socrethar's Teleportation Stone##29796
Arrive at Socrethar's Seat |goto 30.56,17.72 < 10 |q 10507 |future |noway |c
step
use Voren'thal's Presence##30259
|tip Use it on Socrethar.
kill Socrethar##20132 |q 10507/1 |goto 29.31,13.71
step
talk Voren'thal the Seer##18530
|tip Upstairs inside the building.
turnin Turnin Point##10507 |goto Shattrath City/0 42.77,91.72
step
talk Larissa Sunstrike##21954
|tip Inside the building.
accept Karabor Training Grounds##10687 |goto Shadowmoon Valley/0 55.74,58.17
step
talk Battlemage Vyara##22211
accept Sunfury Signets##10824 |goto 56.29,58.80
step
talk Arcanist Thelis##21955
|tip Inside the building.
accept Tablets of Baa'ri##10683 |goto 56.25,59.60
step
talk Varen the Reclaimer##21953
accept The Ashtongue Broken##10807 |goto 54.73,58.20
step
Kill Eclipse enemies around this area
collect 10 Sunfury Signet##30810 |q 10824/1 |goto 51.50,59.08
You can find more around [51.67,65.83]
step
talk Battlemage Vyara##22211
turnin Sunfury Signets##10824 |goto 56.29,58.80
stickystart "Collect_Arcane_Tome"
step
Kill Demon Hunter enemies around this area
collect 8 Sunfury Glaive##30679 |q 10687/1 |goto 70.42,51.98
step
label "Collect_Arcane_Tome"
Kill Demon Hunter enemies around this area
collect 1 Arcane Tome##29739 |q 10416/1 |goto 70.42,51.98
step
talk Larissa Sunstrike##21954
|tip Inside the building
turnin Karabor Training Grounds##10687 |goto 55.74,58.17
accept A Necessary Distraction##10688 |goto 55.74,58.17
step
kill Sunfury Warlock##21503+
collect 1 Scroll of Demonic Unbanishing##30811 |n
use the Scroll of Demonic Unbanishing##30811
|tip Use it on Azaloth.
Free Azaloth |q 10688/1 |goto 70.0,51.4
step
talk Larissa Sunstrike##21954
|tip Inside the building.
turnin A Necessary Distraction##10688 |goto 55.74,58.17
accept Altruis##10689 |goto 55.74,58.17
stickystart "Kill_4_Ashtongue_Warriors"
stickystart "Kill_6_Ashtongue_Shaman"
stickystart "Collect_12_Baa'ri_Tablet_Fragments"
step
kill 3 Ashtongue Handler##21803+ |q 10807/1 |goto 56.20,36.71
step
label "Kill_4_Ashtongue_Warriors"
kill 4 Ashtongue Warrior##21454+ |q 10807/2 |goto 56.99,34.38
step
label "Kill_6_Ashtongue_Shaman"
kill 6 Ashtongue Shaman##21453+ |q 10807/3 |goto 55.72,39.22
step
label "Collect_12_Baa'ri_Tablet_Fragments"
click Baar'ri Tablet Fragment##6420
|tip On the ground around this area.
kill Ashtongue Worker##21455+
collect 12 Baa'ri Tablet Fragment##30596 |q 10683/1 |goto 59.84,36.36
step
talk Varen the Reclaimer##21953
turnin The Ashtongue Broken##10807 |goto 54.73,58.20
accept The Great Retribution##10817 |goto 54.73,58.20
step
talk Arcanist Thelis##21955
turnin Tablets of Baa'ri##10683 |goto 56.25,59.60
accept Oronu the Elder##10684 |goto 56.25,59.60
step
kill Oronu the Elder##21663
|tip Standing on the balcony.
collect Orders From Akama##30649 |q 10684/1 |goto 57.16,32.82
stickystart "Kill_8_Shadowmoon_Chosen"
stickystart "Kill_4_Shadowmoon_Darkweavers"
step
kill 8 Shadowmoon Slayer##22082+ |q 10817/1 |goto 68.65,39.55
step
label "Kill_8_Shadowmoon_Chosen"
kill 8 Shadowmoon Chosen##22084+ |q 10817/2 |goto 68.62,37.63
step
label "Kill_4_Shadowmoon_Darkweavers"
kill 4 Shadowmoon Darkweaver##22081+ |q 10817/3 |goto 68.77,35.70
You can find more around [69.62,39.62]
step
talk Arcanist Thelis##21955
turnin Oronu the Elder##10684 |goto 56.25,59.60
accept The Ashtongue Corruptors##10685 |goto 56.25,59.60
step
kill Corrupt Air Totem##21705
|tip Destroy them all to make Haalum vulnerable.
kill Haalum##21711
collect Haalum's Medallion Fragment##30691 |q 10685/2 |goto 57.08,73.64
step
kill Corrupt Earth Totem##21704
|tip Destroy them all to make Haalum vulnerable.
kill Eykenen##21709
collect Eykenen's Medallion Fragment##30692 |q 10685/1 |goto 51.18,52.83
step
kill Corrupt Fire Totem##21703
|tip Destroy them all to make Haalum vulnerable.
kill Uylaru##21710
collect Uylaru's Medallion Fragment##30694 |q 10685/4 |goto 48.29,39.56
step
kill Corrupt Water Totem##21420
|tip Destroy them all to make Haalum vulnerable.
kill Lakaan##21416
collect Lakaan's Medallion Fragment##30693 |q 10685/3 |goto 49.89,23.01
step
talk Arcanist Thelis##21955
turnin The Ashtongue Corruptors##10685 |goto 56.25,59.60
accept The Warden's Cage##10686 |goto 56.25,59.60
step
Follow the path down |goto 57.35,49.67 < 5 |walk
talk Sanoru##21826
|tip Downstairs.
turnin The Warden's Cage##10686 |goto 57.33,49.58
step
talk Altruis the Sufferer##18417
turnin Altruis##10640 |goto Nagrand/0 27.34,43.09
accept Against All Odds##10669 |goto 27.34,43.09
accept Against the Illidari##10668 |goto 27.34,43.09
accept Against the Legion##10641 |goto 27.34,43.09
step
use the Imbued Silver Spear##30853
kill Xeleth##21894 |q 10669/1 |goto Zangarmarsh/0 16.19,40.69
step
kill Wrath Priestess##18859+
|tip Walks around this area.
collect Freshly Drawn Blood##30850 |n
use the Freshly Drawn Blood##30850
|tip It only lasts for a minute.
kill Avatar of Sathal##21925 |q 10641/1 |goto Netherstorm/0 39.66,20.55
step
kill Lothros##21928 |q 10668/1 |goto Shadowmoon Valley/0 28.20,48.90
|tip He walks around this area.
|tip You may need help with this.
step
talk Altruis the Sufferer##18417
turnin Against the Legion##10641 |goto Nagrand/0 27.34,43.09
turnin Against the Illidari##10668 |goto 27.34,43.09
turnin Against All Odds##10669 |goto 27.34,43.09
accept Illidan's Pupil##10646 |goto 27.34,43.09
step
talk Altruis the Sufferer##18417
Choose _"Tell me about the demon hunter training grounds at the Ruins of Karabor."_
Listen to Illidan's Pupil |q 10646/1 |goto 27.34,43.09
step
talk Altruis the Sufferer##18417
turnin Illidan's Pupil##10646 |goto 27.34,43.09
accept The Book of Fel Names##10649 |goto 27.34,43.09
step
Inside the Shadow Labyrinth Dungeon:
kill Blackheart the Inciter##18667
collect 1 Book of Fel Names##30808|q 10649/1
step
talk Altruis the Sufferer##18417
turnin The Book of Fel Names##10649 |goto 27.34,43.09
accept Return to the Scryers##10691 |goto 27.34,43.09
step
talk Larissa Sunstrike##21954
|tip Inside the building.
turnin Return to the Scryers##10691 |goto Shadowmoon Valley/0 55.74,58.17
accept Varedis Must Be Stopped##10692 |goto 55.74,58.17
step
kill Netharel##21164 |q 10692/2 |goto 68.71,52.69
|tip He walks around this area.
|tip You may need help with this.
step
kill Alandien##21171 |q 10692/4 |goto 69.59,54.08
|tip You may need help with this.
step
kill Varedis##21178
|tip Inside the building.
|tip You may need help with this.
use the Book of Fel Names##30854
|tip Use it when Varedis is at low health.
Slay Varedis |q 10692/1 |goto 72.2,53.7
step
kill Theras##21168 |q 10692/3 |goto 72.34,48.40
|tip You may need help with this.
step
talk Larissa Sunstrike##21954
|tip Inside the building.
turnin Return to the Scryers##10692 |goto 55.74,58.17
step
talk Magistrix Fyalenn##18531
turnin Firewing Signets##10412 |goto Shattrath City/0 45.21,81.43
turnin Sunfury Signets##10656 |goto 45.21,81.43
step
talk Voren'thal the Seer##18530
|tip Upstairs inside the building.
turnin Synthesis of Power##10416 |goto 42.77,91.72
step
label "farming"
You will need to farm "Arcane Tomes" and "Sunfury Signets"
|tip Every 10 Sunfury Signets turned in nets 250 reputation.
|tip Each Arcane Tome turn in nets 350 reputation.
Click here to continue |confirm
'|complete rep('The Scryers')==Exalted |next "exalted"
step
Kill Sunfury enemies around this area
collect 1 Arcane Tome##29739 |n |goto Netherstorm/0 27.58,70.88
|tip Each Arcane Tome turn in nets 350 reputation.
collect 10 Sunfury Signet##30810 |n |goto 27.58,70.88
|tip Every 10 Sunfury Signets turned in nets 250 reputation.
You can find more around [25.23,65.72]
Click here to continue |confirm
step
talk Magistrix Fyalenn##18531
accept More Sunfury Signets##10658 |n |goto Shattrath City/0 45.21,81.43
Click here to continue |confirm
Reach Exalted reputation with The Scryers |next "exalted" |complete rep('The Scryers')==Exalted
step
talk Voren'thal the Seer##18530
|tip Upstairs inside the building.
accept Arcane Tomes##10419 |n |goto Shattrath City/0 42.77,91.72
Click here to continue |next "farming" |confirm
|tip Click the line above to continue farming.
Reach Exalted reputation with The Scryers. |next |complete rep('The Scryers')==Exalted
step
label "exalted"
_Congratulations!_
You Earned Exalted Reputation with The Scryers
]])
ZygorGuidesViewer:RegisterGuide("Reputation Guides\\The Burning Crusade\\The Aldor",{
author="support@zygorguides.com",
startlevel=60,
endlevel=70,
},[[
step
talk Haggard War Veteran##19684
|tip He walks along the bridge.
accept A'dal##10210 |goto Shattrath City/0 60.29,16.69
step
talk A'dal##18481
|tip Inside the building.
turnin A'dal##10210 |goto 54.00,44.71
step
talk Khadgar##18166
|tip Inside the building.
accept City of Light##10211 |goto 54.75,44.32
step
Follow Khadgar's Servant and listen to its story |q 10211/1
|tip Make sure you follow it or you will have to repeat this step.
|tip Marking it with a Raid Target Icon can help track it.
step
talk Khadgar##18166
|tip Inside the building.
turnin City of Light##10211 |goto 54.76,44.33
accept Allegiance to the Aldor##10551 |instant |goto 54.76,44.33
step
talk Khadgar##18166
|tip Inside the building.
accept Ishanah##10554 |goto 54.76,44.33
step
Use the elevator |goto Shattrath City/0 41.71,38.64 < 5 |only if walking
talk Vindicator Kaan##23271
accept Assist Exarch Orelis##11038 |goto 35.07,32.36
step
talk Adyen the Lightwarden##18537
accept Marks of Kil'jaeden##10325 |goto 30.81,34.60
accept Marks of Sargeras##10653 |goto 30.81,34.60
step
talk Ishanah##18538
|tip Inside the building.
turnin Ishanah##10554 |goto 23.96,29.70
accept Restoring the Light##10021 |goto 23.96,29.70
accept A Cleansing Light##10420 |goto 23.96,29.70
step
talk Sha'nir##18597
|tip Inside the building.
accept A Cure for Zahlia##10020 |goto 64.48,15.10
step
Kill Cabal enemies around this area
collect 10 Mark of Kil'jaeden##29425 |goto Terokkar Forest/0 39.67,58.73
step
click the Eastern Altar##182565
Purify the Eastern Altar |q 10021/2 |goto Terokkar Forest/0 49.24,20.31
step
click the Northern Altar##182563
Purify the Northern Altar |q 10021/1 |goto 50.67,16.54
step
click the Western Altar##182566
Purify the Western Altar |q 10021/3 |goto 48.11,14.51
step
kill Stonegazer##18648+
collect Stonegazer's Blood##25815 |q 10020/1 |goto 61.23,25.76
|tip It walks around this area.
|tip You may need help with this.
You can also find it around [goto 68.45,31.00]
step
talk Adyen the Lightwarden##18537
turnin Marks of Kil'jaeden##10325 |goto Shattrath City/0 30.81,34.60
step
talk Sha'nir##18597
turnin A Cure for Zahlia##10020 |goto 64.48,15.10
step
talk Ishanah##18538
|tip Inside the building.
turnin Restoring the Light##10021 |goto 23.96,29.70
step
talk Vindicator Kaan##23271
accept Assist Exarch Orelis##11038 |goto 35.06,32.36
step
talk Exarch Orelis##19466
|tip Inside the building.
turnin Assist Exarch Orelis##11038 |goto Netherstorm/0 32.07,64.18
accept Distraction at Manaforge B'naar##10241 |goto 32.07,64.18
stickystart "Kill_8_Sunfury_Bloodwarders"
step
kill 8 Sunfury Magister##18855+ |q 10241/1 |goto 25.34,65.49
You can find more around [26.24,68.56]
step
label "Kill_8_Sunfury_Bloodwarders"
kill 8 Sunfury Bloodwarder##18853+ |q 10241/2 |goto 27.43,65.46
You can find more around [21.22,69.44]
step
talk Exarch Orelis##19466
|tip Inside the building.
turnin Distraction at Manaforge B'naar##10241 |goto 32.07,64.18
accept Measuring Warp Energies##10313 |goto 32.07,64.18
step
talk Anchorite Karja##19467
|tip Inside the building.
accept Naaru Technology##10243 |goto 32.03,64.18
step
Next to the Northern Pipeline:
use the Warp-Attuned Orb##29324
Measure the Northern Pipeline |q 10313/1 |goto 25.71,60.62
step
Next to the Western Pipeline:
use the Warp-Attuned Orb##29324
Measure the Western Pipeline |q 10313/4 |goto 20.90,66.90
step
Next to the Southern Pipeline:
use the Warp-Attuned Orb##29324
Measure the Southern Pipeline |q 10313/3 |goto 20.71,70.70
step
Inside Manaforge B'naar:
click the B'naar Control Console
turnin Naaru Technology##10243 |goto 23.19,68.10
accept B'naar Console Transcription##10245 |goto 23.19,68.10
step
Next to the Eastern Pipeline:
use the Warp-Attuned Orb##29324
Measure the Eastern Pipeline |q 10313/2 |goto 28.98,72.70
step
talk Exarch Orelis##19466
|tip Inside the building.
turnin Measuring Warp Energies##10313 |goto 32.07,64.18
step
talk Anchorite Karja##19467
|tip Inside the building.
turnin B'naar Console Transcription##10245 |goto 32.03,64.18
accept Shutting Down Manaforge B'naar##10299 |goto 32.03,64.18
step
Inside Manaforge B'naar:
kill Overseer Theredis##20416
|tip Walking around inside the building.
collect B'naar Access Crystal##29366 |q 10299/2 |goto 23.85,70.62
step
Inside Manaforge B'naar:
click the B'naar Control Console
|tip Inside the building.
Choose  _"<Begin emergency shutdown>"_
Kill enemies around this area
|tip They will spawn in waves for 2 minutes.
Shut Down Manaforge B'naar |q 10299/1 |goto 23.19,68.10
step
talk Anchorite Karja##19467
|tip Inside the building.
turnin Shutting Down Manaforge B'naar##10299 |goto 32.03,64.18
accept Shutting Down Manaforge Coruu##10321 |goto 32.03,64.18
step
talk Exarch Orelis##19466
|tip Inside the building.
accept Attack on Manaforge Coruu##10246 |goto 32.07,64.18
step
kill 8 Sunfury Arcanist##20134+ |q 10246/2 |goto 47.68,85.14
step
Inside of Manaforge Coruu:
kill 5 Sunfury Researcher##20136+ |q 10246/1 |goto 49.01,81.49
step
Inside of Manaforge Coruu:
kill Overseer Seylanna##20397
|tip Inside the building.
collect Coruu Access Crystal##29396 |q 10321 |goto 49.01,81.49
step
Inside of Manaforge Coruu:
click the Coruu Control Console##183956
|tip Inside the building.
Choose _"<Begin emergency shutdown>"_
Kill enemies around this area
|tip They will spawn in waves for 2 minutes.
Shut Down Manaforge Coruu |q 10321/1 |goto 49.01,81.49
step
talk Anchorite Karja##19467
|tip Inside the building.
turnin Shutting Down Manaforge Coruu##10321 |goto 32.03,64.18
accept Shutting Down Manaforge Duro##10322 |goto 32.03,64.18
step
talk Exarch Orelis##19466
|tip Inside the building.
turnin Attack on Manaforge Coruu##10246 |goto 32.07,64.18
accept Sunfury Briefings##10328 |goto 32.07,64.18
step
kill Sunfury Conjurer##20139+
collect 1 Sunfury Arcane Briefing##29546|q 10328/2 |goto 57.42,63.79
step
kill Sunfury Bowman##20207+, Sunfury Centurion##20140+
collect 1 Sunfury Military Briefing##29545|q 10328/1 |goto 58.50,63.38
step
Inside Manaforge Duro:
kill Overseer Athanel##20435
collect 1 Duro Access Crystal##29397|q 10322/2 |goto 57.42,63.79
step
click the Duro Control Console##184311
Choose _"<Begin emergency shutdown>"_
Kill enemies around this area
|tip They will spawn in waves for 2 minutes.
Shut Down Manaforge Duro |q 10322/1 |goto 59.09,66.81
step
talk Exarch Orelis##19466
|tip Inside the building.
turnin Sunfury Briefings##10328 |goto 32.07,64.18
accept Outside Assistance##10431 |goto 32.07,64.18
step
talk Anchorite Karja##19467
|tip Inside the building.
turnin Shutting Down Manaforge Duro##10322 |goto 32.03,64.18
accept Shutting Down Manaforge Ara##10323 |goto 32.03,64.18
step
talk Kaylaan##20780
turnin Outside Assistance##10431 |goto 34.79,38.30
accept A Dark Pact##10380 |goto 34.79,38.30
stickystart "Kill_6_Gan'arg_Warp-Tinkerers"
stickystart "Kill_6_Mo'arg_Warp-Masters"
step
kill 3 Daughter of Destiny##18860+ |q 10380/2 |goto 30.61,39.95
You can more around [28.48,41.29]
step
label "Kill_6_Gan'arg_Warp-Tinkerers"
kill 6 Gan'arg Warp-Tinker##20285+ |q 10380/1 |goto 24.45,40.86
You can find more in the cave around [26.38,43.99]
step
label "Kill_6_Mo'arg_Warp-Masters"
kill 6 Mo'arg Warp-Master##20326+ |q 10380/3 |goto 24.45,40.86
You can find more in the cave around [26.38,43.99]
step
Inside Manaforge Ara:
kill Overseer Azarad##20685
|tip He walks around inside Manaforge Ara and stops in at this small side room.
collect Ara Access Crystal##29411 |q 10323/2 |goto 26.7,36.8
step
Inside Manaforge Ara:
click the Ara Control Console##184312
click "<Begin emergency shutdown>"
Kill enemies around this area
|tip They will spawn in waves for 2 minutes.
Shut Down Manaforge Ara |q 10323/1 |goto 26.0,38.8
step
talk Kaylaan##20780
turnin A Dark Pact##10380 |goto 34.79,38.30
accept Aldor No More##10381 |goto 34.79,38.30
step
talk Exarch Orelis##19466
|tip Inside the building.
turnin Aldor No More##10381 |goto 32.07,64.18
step
talk Anchorite Karja##19467
|tip Inside the building.
turnin Shutting Down Manaforge Ara##10323 |goto 32.03,64.18
accept Socrethar's Shadow##10407 |goto 32.03,64.18
stickystart "Collect_10_ Marks_of_Sargeras"
stickystart "Collect_1_Fel_Armament"
step
kill Forgemaster Morug##20800
|tip You may need help with this.
collect First Half of Socrethar's Stone##29624 |q 10407/1 |goto 36.84,27.86
step
kill Silroth##20801
|tip You may need help with this.
collect Second Half of Socrethar's Stone##29625 |q 10407/2 |goto 40.89,19.55
step
label "Collect_10_ Marks_of_Sargeras"
Kill enemies around this area
collect 10 Mark of Sargeras##30809+ |q 10653/1 |goto 42.08,21.78
More can be found around here:
[39.87,22.99]
[38.04,26.88]
step
label "Collect_1_Fel_Armament"
Kill enemies around this area
collect 1 Fel Armament##29740 |q 10420/1 |goto 42.08,21.78
More can be found around here:
[39.87,22.99]
[38.04,26.88]
step
talk Anchorite Karja##19467
|tip Inside the building.
turnin Socrethar's Shadow##10407 |goto 32.03,64.18
accept Ishanah's Help##10410 |goto 32.03,64.18
step
talk Adyen the Lightwarden##18537
turnin Marks of Sargeras##10653 |goto Shattrath City/0 30.81,34.60
step
talk Ishanah##18538
|tip Inside the building.
talk Ishanah##18538
turnin Ishanah's Help##10410 |goto 23.96,29.70
turnin A Cleansing Light##10420 |goto 23.96,29.70
accept Deathblow to the Legion##10409 |goto 23.96,29.70
step
use Voren'thal's Package##30260
collect 1 Socrethar's Teleportation Stone##29796 |n
collect 1 Voren'thal's Presence##30259 |n
Stand in the teleporter |goto Netherstorm/0 36.42,18.33
use Socrethar's Teleportation Stone##29796
Arrive at Socrethar's Seat |goto 30.56,17.72 < 10 |q 10409 |future |noway |c
step
use Voren'thal's Presence##30259
|tip Use it on Socrethar.
kill Socrethar##20132 |q 10409/1 |goto 29.31,13.71
step
talk Ishanah##18538
turnin Deathblow to the Legion##10409 |goto Shattrath City/0 23.96,29.70
step
talk Exarch Onaala##21860
accept Karabor Training Grounds##10587 |goto Shadowmoon Valley/0 61.19,29.23
step
talk Vindicator Aluumen##21822
accept The Ashtongue Tribe##10619 |goto 61.18,29.15
step
talk Anchorite Ceyla##21402
|tip Inside the building.
accept Tablets of Baa'ri##10568 |goto 62.58,28.37
stickystart "Kill_4_Ashtongue_Warriors"
stickystart "Kill_6_Ashtongue_Shaman"
stickystart "Collect_12_Baa'ri_Tablet_Fragments"
step
kill 3 Ashtongue Handler##21803+ |q 10619/1 |goto 56.20,36.71
step
label "Kill_4_Ashtongue_Warriors"
kill 4 Ashtongue Warrior##21454+ |q 10619/2 |goto 56.99,34.38
step
label "Kill_6_Ashtongue_Shaman"
kill 6 Ashtongue Shaman##21453+ |q 10619/3 |goto 55.72,39.22
step
label "Collect_12_Baa'ri_Tablet_Fragments"
click Baar'ri Tablet Fragment##6420
|tip On the ground around this area.
kill Ashtongue Worker##21455+
collect 12 Baa'ri Tablet Fragment##30596 |q 10568/1 |goto 59.84,36.36
step
Kill Demon Hunter enemies around this area
collect 8 Sunfury Glaive##30679 |q 10587/1 |goto 70.42,51.98
step
talk Vindicator Aluumen##21822
turnin The Ashtongue Tribe##10619 |goto 61.18,29.15
accept Reclaiming Holy Grounds##10816 |goto 61.18,29.15
step
talk Anchorite Ceyla##21402
|tip Inside the building.
turnin Tablets of Baa'ri##10568 |goto 62.58,28.37
accept Oronu the Elder##10571 |goto 62.58,28.37
step
talk Exarch Onaala##21860
turnin Karabor Training Grounds##10587 |goto Shadowmoon Valley/0 61.19,29.23
accept A Necessary Distraction##10637 |goto Shadowmoon Valley/0 61.19,29.23
step
kill Oronu the Elder##21663
|tip Standing on the balcony.
collect Orders From Akama##30649 |q 10571/1 |goto 57.16,32.82
stickystart "Kill_8_Shadowmoon_Chosen"
stickystart "Kill_4_Shadowmoon_Darkweavers"
step
kill 8 Shadowmoon Slayer##22082+ |q 10816/1 |goto 68.65,39.55
step
label "Kill_8_Shadowmoon_Chosen"
kill 8 Shadowmoon Chosen##22084+ |q 10816/2 |goto 68.62,37.63
step
label "Kill_4_Shadowmoon_Darkweavers"
kill 4 Shadowmoon Darkweaver##22081+ |q 10816/3 |goto 68.77,35.70
You can find more around [69.62,39.62]
step
kill Sunfury Warlock##21503+
collect Scroll of Demonic Unbanishing##30811 |n
use the Scroll of Demonic Unbanishing##30811
|tip Use it on Azaloth.
Free Azaloth |q 10637/1 |goto 70.0,51.4
step
talk Exarch Onaala##21860
turnin A Necessary Distraction##10637 |goto Shadowmoon Valley/0 61.19,29.23
accept Altruis##10640 |goto Shadowmoon Valley/0 61.19,29.23
step
talk Vindicator Aluumen##21822
turnin Reclaiming Holy Grounds##10816 |goto 61.18,29.15
step
talk Anchorite Ceyla##21402
|tip Inside the building.
turnin Oronu the Elder##10571 |goto 62.58,28.37
accept The Ashtongue Corruptors##10574 |goto 62.58,28.37
step
kill Corrupt Water Totem##21420
|tip Destroy them all to make Lakaan vulnerable.
kill Lakaan##21416
collect Lakaan's Medallion Fragment##30693 |q 10574/3 |goto 49.89,23.01
step
kill Corrupt Fire Totem##21703
|tip Destroy them all to make Uylaru vulnerable.
kill Uylaru##21710
collect Uylaru's Medallion Fragment##30694 |q 10574/4 |goto 48.29,39.56
step
kill Corrupt Earth Totem##21704
|tip Destroy them all to make Eykenen vulnerable.
kill Eykenen##21709
collect Eykenen's Medallion Fragment##30692 |q 10574/1 |goto 51.18,52.83
step
kill Corrupt Air Totem##21705
|tip Destroy them all to make Haalum vulnerable.
kill Haalum##21711
collect Haalum's Medallion Fragment##30691 |q 10574/2 |goto 57.08,73.64
step
talk Anchorite Ceyla##21402
|tip Inside the building.
turnin The Ashtongue Corruptors##10574 |goto 62.58,28.37
accept The Warden's Cage##10575 |goto 62.58,28.37
step
Follow the path down |goto 57.35,49.67 < 5 |walk
talk Sanoru##21826
|tip Downstairs.
turnin The Warden's Cage##10575 |goto 57.33,49.58
step
talk Altruis the Sufferer##18417
turnin Altruis##10640 |goto Nagrand/0 27.34,43.09
accept Against All Odds##10669 |goto 27.34,43.09
accept Against the Illidari##10668 |goto 27.34,43.09
accept Against the Legion##10641 |goto 27.34,43.09
step
use the Imbued Silver Spear##30853
kill Xeleth##21894 |q 10669/1 |goto Zangarmarsh/0 16.19,40.69
step
kill Wrath Priestess##18859+
|tip Walks around this area.
collect Freshly Drawn Blood##30850 |n
use the Freshly Drawn Blood##30850
|tip It only lasts for a minute.
kill Avatar of Sathal##21925 |q 10641/1 |goto Netherstorm/0 39.66,20.55
step
kill Lothros##21928 |q 10668/1 |goto Shadowmoon Valley/0 28.20,48.90
|tip He walks around this area.
|tip You may need help with this.
step
talk Altruis the Sufferer##18417
turnin Against the Legion##10641 |goto Nagrand/0 27.34,43.09
turnin Against the Illidari##10668 |goto 27.34,43.09
turnin Against All Odds##10669 |goto 27.34,43.09
accept Illidan's Pupil##10646 |goto 27.34,43.09
step
talk Altruis the Sufferer##18417
Choose _"Tell me about the demon hunter training grounds at the Ruins of Karabor."_
Listen to Illidan's Pupil |q 10646/1 |goto 27.34,43.09
step
talk Altruis the Sufferer##18417
turnin Illidan's Pupil##10646 |goto 27.34,43.09
accept The Book of Fel Names##10649 |goto 27.34,43.09
step
Inside the Shadow Labyrinth Dungeon:
kill Blackheart the Inciter##18667
collect 1 Book of Fel Names##30808|q 10649/1
step
talk Altruis the Sufferer##18417
turnin The Book of Fel Names##10649 |goto 27.34,43.09
accept Return to the Scryers##10691 |goto 27.34,43.09
step
talk Exarch Onaala##21860
turnin Return to the Aldor##10650 |goto Shadowmoon Valley/0 61.19,29.23
accept Varedis Must Be Stopped##10651 |goto 61.19,29.23
step
kill Netharel##21164 |q 10651/2 |goto 68.71,52.69
|tip He walks around this area.
|tip You may need help with this.
step
kill Alandien##21171 |q 10651/4 |goto 69.59,54.08
|tip You may need help with this.
step
kill Varedis##21178
|tip Inside the building.
|tip You may need help with this.
use the Book of Fel Names##30854
|tip Use it when Varedis is at low health.
Slay Varedis |q 10651/1 |goto 72.2,53.7
step
kill Theras##21168 |q 10651/3 |goto 72.34,48.40
|tip You may need help with this.
step
talk Exarch Onaala##21860
turnin Return to the Aldor##10650 |goto Shadowmoon Valley/0 61.19,29.23
step
label "farming"
You will need to farm "Fel Armaments" and "Mark of Sargeras"
|tip Every 10 Mark of Sargeras turned in nets 250 reputation.
|tip Each Fel Armament turn in nets 350 reputation.
Click here to continue |confirm
'|complete rep('The Aldor')==Exalted |next "exalted"
step
Kill enemies around this area
collect Fel Armament##29740 |n |goto Shadowmoon Valley 22.5,34.6
|tip Each Fel Armament turn in nets 350 reputation.
collect Mark of Sargeras###30809 |n |goto Shadowmoon Valley 22.5,34.6
|tip Every 10 Mark of Sargeras turned in nets 250 reputation.
Click here to continue |confirm
step
talk Adyen the Lightwarden##18537
accept More Marks of Sargeras##10654 |n |goto Shattrath City/0 30.81,34.60
Click here to continue |confirm
Reach Exalted reputation with The Aldor |complete rep('The Aldor')==Exalted |next "exalted"
step
talk Ishanah##18538
|tip Inside the building.
accept Fel Armaments##10421 |n |goto 23.96,29.70
Click here to continue |confirm |next "farming"
Reach Exalted reputation with The Aldor |complete rep('The Aldor')==Exalted |next
step
label "exalted"
_Congratulations!_
You Earned Exalted Reputation with The Aldor
]])
ZygorGuidesViewer:RegisterGuide("Reputation Guides\\The Burning Crusade\\Netherwing",{
author="support@zygorguides.com",
startlevel=25,
description="\nThis guide section will walk you through completing Netherwing quests from neutral to exalted.",
},[[
step
Follow the path |goto Shadowmoon Valley/0 59.27,58.68 < 30 |walk
Continue following the path |goto 61.58,59.30 < 30 |walk
Continue following the path |goto 63.14,60.28 < 30 |walk
talk Mordenai##22113
|tip He walks along this path
accept Kindness##10804 |goto 61.86,58.32
step
Kill Rocknail enemies around this area
collect Rocknail Flayer Giblets##31373 |n
use the Rocknail Flayer Giblets##31373
|tip Combine 5 giblets into a carcass.
collect 8 Rocknail Flayer Carcass##31372 |goto 62.16,55.67 |q 10804
step
use the Rocknail Flayer Carcass##31372
|tip Stand on tall rocks or crystals.
Feed #8# Netherwing Drakes |q 10804/1 |goto 61.94,57.96
step
Follow the path |goto 59.27,58.68 < 30 |walk
Continue following the path |goto 61.58,59.30 < 30 |walk
Continue following the path |goto 63.14,60.28 < 30 |walk
talk Mordenai##22113
|tip He walks along this path
turnin Kindness##10804 |goto 61.86,58.32
accept Seek Out Neltharaku##10811 |goto 61.86,58.32
step
talk Neltharaku##21657
turnin Seek Out Neltharaku##10811 |goto 68.2,60.4
accept Neltharaku's Tale##10814 |goto 68.2,60.4
step
talk Neltharaku##21657
Listen to the Tale of Neltharaku |q 10814/1 |goto 68.2,60.4
step
talk Neltharaku##21657
turnin Neltharaku's Tale##10814 |goto 68.2,60.4
accept Infiltrating Dragonmaw Fortress##10836 |goto 68.2,60.4
step
Kill Dragonmaw enemies around this area
Slay #15# Dragonmaw Orcs |q 10836/1 |goto 66.4,60.0
step
talk Neltharaku##21657
turnin Infiltrating Dragonmaw Fortress##10836 |goto 68.2,60.4
accept To Netherwing Ledge!##10837 |goto 68.2,60.4
step
click Nethervine Crystal##185182+
|tip They look like big thorns with a glowing red ball atop them on the ground around this area.
collect 12 Nethervine Crystal##31504 |q 10837/1 |goto 64.1,80.7
step
talk Neltharaku##21657
turnin To Netherwing Ledge!##10837 |goto 68.2,60.4
accept The Force of Neltharaku##10854 |goto 68.2,60.4
step
use the Enchanted Nethervine Crystal##31652
|tip Use it on Enslaved Netherwing Drakes.
|tip Kill the Dragonmaw Subjugator after you free them.
Free #5# Enslaved Netherwing Drakes |q 10854/1 |goto 67.4,59.3
step
talk Neltharaku##21657
turnin The Force of Neltharaku##10854 |goto 68.2,60.4
accept Karynaku##10858 |goto 68.2,60.4
step
talk Karynaku##22112
turnin Karynaku##10858 |goto 69.9,61.5
accept Zuluhed the Whacked##10866 |goto 69.9,61.5
step
kill Zuluhed the Whacked##11980 |q 10866/2 |goto 70.9,61.5
|tip This enemy is elite and will require a group.
|tip To avoid having to fight demons, pull Zuluhed the Whacked into one of the small buildings on either side of him when he casts a summoning portal.
collect Zuluhed's Key##31664 |q 10866 |goto 70.9,61.5
step
click Zuluhed's Chains##185156
Free Karynaku |q 10866/1 |goto 69.8,61.3
step
talk Karynaku##22112
turnin Zuluhed the Whacked##10866 |goto 69.9,61.5
accept Ally of the Netherwing##10870 |goto 69.9,61.5
step
Train Artisan Flying |complete skill("Riding") >= 225
|tip Flying is required to continue this questline.
step
talk Mordenai##22113
turnin Ally of the Netherwing##10870 |goto 62.9,59.5
accept Blood Oath of the Netherwing##11012 |goto 62.9,59.5
accept In Service of the Illidari##11013 |goto 62.9,59.5
step
talk Overlord Mor'ghor##23139
turnin In Service of the Illidari##11013 |goto 66.2,85.7
accept Enter the Taskmaster##11014 |goto 66.2,85.7
step
talk Taskmaster Varkule Dragonbreath##23140
turnin Enter the Taskmaster##11014 |goto 66.1,86.4
step
talk Yarzill the Merc##23141
accept Your Friend on the Inside##11019 |goto 66.0,86.5
accept The Great Netherwing Egg Hunt##11049 |goto 66.0,86.5
step
click Netherwing Egg
|tip They look like dark purple eggs with blue crystals on them all over Netherwing Ledge.
|tip They spawn in various places, so you will probably need to search for them.
|tip Use the "Netherwing Eggs" guide for known locations.
collect 1 Netherwing Egg##32506 |q 11049/1 |goto 68.5,61.2
step
talk Yarzill the Merc##23141
turnin The Great Netherwing Egg Hunt##11049 |goto 66.0,86.5
step
Reach Friendly with the Netherwing |complete rep("Netherwing") >= Friendly
|tip Complete daily quests using the "Netherwing Daily Quests" guide.
|tip You can also farm eggs using the "Netherwing Egg" guide.
step
talk Taskmaster Varkule Dragonbreath##23140
accept Rise, Overseer!##11053 |goto Shadowmoon Valley 66.1,86.4
step
talk Overlord Mor'ghor##23139
turnin Rise, Overseer!##11053 |goto 66.2,85.7
step
talk Taskmaster Varkule Dragonbreath##23140
accept The Netherwing Mines##11075 |goto 66.1,86.4
step
talk Chief Overseer Mudlump##23291
accept Overseeing and You: Making the Right Choices##11054 |goto 66.8,86.1
step
talk Mistress of the Mines##23149
turnin The Netherwing Mines##11075 |goto 65.4,90.2
step
Enter the cave |goto 65.32,89.86 < 5 |walk
talk Ronag the Slave Driver##23166
|tip Inside the cave.
accept Crazed and Confused##11083 |goto 71.6,87.6
stickystart "Kill_Crazed_Murkblood_Miners"
step
kill 1 Crazed Murkblood Foreman##23305 |q 11083/1 |goto 73.7,88.1
|tip Inside the cave.
step
label "Kill_Crazed_Murkblood_Miners"
kill 5 Crazed Murkblood Miner##23324+ |q 11083/2 |goto 73.7,88.1
|tip Inside the cave.
step
talk Ronag the Slave Driver##23166
|tip Inside the cave.
turnin Crazed and Confused##11083 |goto 71.6,87.6
step
kill Black Blood of Draenor##23286+
|tip Inside the cave.
collect Sludge-covered Object##32724 |n
use the Sludge-covered Object##32724
collect Murkblood Escape Plans##32726 |goto 64.8,85.6 |q 11081 |future
step
use the Murkblood Escape Plans##32726
accept The Great Murkblood Revolt##11081 |goto 64.8,85.6
step
Leave the cave |goto Shadowmoon Valley 65.3,90.2 < 10
talk Mistress of the Mines##23149
turnin The Great Murkblood Revolt##11081 |goto 65.4,90.2
accept Seeker of Truth##11082 |goto 65.4,90.2
step
Enter the cave |goto 63.17,87.77
talk Murkblood Overseer##23309
|tip Inside the cave.
Ask him _"Who speaks of me? What are you taling about, broken?"_
Gather Murkblood Information |q 11082/1 |goto 73.0,82.2
step
Watch the dialogue
|tip Inside the cave.
collect Hand of the Overseer##32734 |q 11082/2 |goto 73.0,82.2
step
Leave the cave |goto Shadowmoon Valley 65.3,90.2 < 10 |only if walking
talk Mistress of the Mines##23149
turnin Seeker of Truth##11082 |goto 65.4,90.2
step
collect 10 Knothide Leather##21887 |q 11054/1
|tip Farm them with skinning or purchase them from the auction house.
You can find mobs to skin at [60.4,45.2]
step
kill Tyrantus##20931
collect Hardened Hide of Tyrantus##32666 |q 11054/2 |goto Netherstorm 46.4,10.8
step
talk Chief Overseer Mudlump##23291
turnin Overseeing and You: Making the Right Choices##11054 |goto Shadowmoon Valley 66.8,86.1
step
Reach Honored with the Netherwing |complete rep("Netherwing") >= Honored
|tip Complete daily quests using the "Netherwing Daily Quests" guide.
|tip You can also farm eggs using the "Netherwing Egg" guide.
step
talk Taskmaster Varkule Dragonbreath##23140
accept Stand Tall, Captain!##11084 |goto Shadowmoon Valley 66.1,86.4
step
talk Overlord Mor'ghor##23139
turnin Stand Tall, Captain!##11084 |goto 66.2,85.7
step
talk Ja'y Nosliw##22433
accept Earning Your Wings...##11063 |instant |goto 65.9,87.2
step
talk Murg "Oldie" Muckjaw##23340
accept Dragonmaw Race: The Ballad of Oldie McOld##11064
step
Follow Murg "Oldie" Muckjaw as he flies
|tip Dodge the pumpkins that Murg throws at you.
|tip The easiest strategy is to fly behind and above him, so that you are looking down on him as you fly.
Defeat Murg "Oldie" Muckjaw |q 11064/1 |goto 65.2,85.7
step
talk Ja'y Nosliw##22433
turnin Dragonmaw Race: The Ballad of Oldie McOld##11064 |goto 65.9,87.2
step
talk Trope the Filth-Belcher##23342
accept Dragonmaw Race: Trope the Filth-Belcher##11067
step
Follow Trope the Filth-Belcher as he flies
|tip Dodge the green bombs that Trope the Filth-Belcher throws at you.
|tip The easiest strategy is to fly behind under him.
|tip Strafe to the sides when he throws the bombs and you can dodge them easily.
Defeat Trope the Filth-Belcher |q 11067/1 |goto 65.2,85.5
step
talk Ja'y Nosliw##22433
turnin Dragonmaw Race: Trope the Filth-Belcher##11067 |goto 65.9,87.2
step
talk Corlok the Vet##23344
accept Dragonmaw Race: Corlok the Vet##11068
step
Follow Corlok the Vet as he flies
|tip Dodge the skulls that Corlok the Vet throws at you.
|tip The easiest strategy is to fly close behind and above him while looking down.
|tip Strafe to the sides when he throws the skulls and you can dodge them easily.
Defeat Corlok the Vet |q 11068/1 |goto 65.2,85.2
step
talk Ja'y Nosliw##22433
turnin Dragonmaw Race: Corlok the Vet##11068 |goto 65.9,87.2
step
talk Wing Commander Ichman##13437
accept Dragonmaw Race: Wing Commander Ichman##11069
step
Follow Wing Commander Ichman as he flies
|tip Dodge the fireballs that Wing Commander Ichman throws at you.
|tip The easiest strategy is to fly behind and far above him while looking down.
|tip Strafe to the sides when he throws fireballs and you can dodge them easily.
|tip He does sharp turns and maneuvers, so it's easy to lose track of him if you aren't careful.
Defeat Wing Commander Ichman |q 11069/1 |goto 65.2,85.0
step
talk Ja'y Nosliw##22433
turnin Dragonmaw Race: Wing Commander Ichman##11069 |goto 65.9,87.2
step
talk Wing Commander Mulverick##13181
accept Dragonmaw Race: Wing Commander Mulverick##11070
step
Follow Wing Commander Mulverick as he flies
|tip Dodge the lightning bolts that Wing Commander Mulverick throws at you.
|tip The lightning bolts will follow you, unlike the previous race quests.
|tip The easiest strategy is to fly beside him, while strafing, and almost ahead of him.
Defeat Wing Commander Mulverick |q 11070/1 |goto 65.2,84.9
step
talk Ja'y Nosliw##22433
turnin Dragonmaw Race: Wing Commander Mulverick##11070 |goto 65.9,87.2
step
talk Captain Skyshatter##23348
accept Dragonmaw Race: Captain Skyshatter##11071
step
Follow Captain Skyshatter as he flies
|tip Dodge the meteors that fall all around you.
|tip The easiest strategy is to fly beside him while strafing and almost ahead of him.
|tip Stay close to him and the meteors will hit both of you, stopping him for a second and allowing you to catch up to him if needed.
|tip Meteors will briefly stun you rather than dismount you.
Defeat Captain Skyshatter |q 11071/1 |goto 65.5,85.3
step
talk Ja'y Nosliw##22433
turnin Dragonmaw Race: Captain Skyshatter##11071 |goto 65.9,87.2
step
Reach Revered with the Netherwing |complete rep("Netherwing") >= Revered
|tip Complete daily quests using the "Netherwing Daily Quests" guide.
|tip You can also farm eggs using the "Netherwing Egg" guide.
step
talk Taskmaster Varkule Dragonbreath##23140
accept Hail, Commander!##11092 |goto Shadowmoon Valley 66.1,86.4
step
talk Overlord Mor'ghor##23139
turnin Hail, Commander!##11092
accept Kill Them All!##11094 |goto 66.2,85.7 |only if rep("The Scryers") >= Friendly
accept Kill Them All!##11099 |goto 66.2,85.7 |only if rep("The Aldor") >= Friendly
step
kill Arvoar the Rapacious##23267+
|tip He looks like a big Flayer mob that walks in a circle in this spot.
collect Partially Digested Hand##32621 |n
Click the Partially Digested Hand in your bags |use Partially Digested Hand##32621
accept A Job Unfinished...##11041 |goto 74.5,86.3
stickystart "Kil_Overmine_Flayers"
step
kill Barash the Den Mother |q 11041/2 |goto 70.2,84.3
|tip It walks around this area.
|tip This enemy is elite and may require a group.
step
label "Kil_Overmine_Flayers"
kill 10 Overmine Flayer##23264 |q 11041/1 |goto 71.3,85.8
step
talk Overlord Mor'ghor##23139
turnin A Job Unfinished...##11041 |goto 66.2,85.7
step
talk Arcanist Thelis##21955
turnin Kill Them All!##11094 |goto 56.3,59.6
accept Commander Hobb##11095 |goto 56.3,59.6
|only if rep("The Scryers") >= Friendly
step
talk Commander Hobb##23434
turnin Commander Hobb##11095 |goto 56.5,58.7
|only if rep("The Scryers") >= Friendly
step
talk Anchorite Ceyla##21402
turnin Kill Them All!##11099 |goto 62.6,28.4
accept Commander Arcus##11100 |goto 62.6,28.4
|only if rep("The Aldor") >= Friendly
step
talk Commander Arcus##23452
turnin Commander Arcus##11100 |goto 62.4,29.3
|only if rep("The Aldor") >= Friendly
step
Reach Exalted with the Netherwing |complete rep("Netherwing") >= Exalted
|tip Complete daily quests using the "Netherwing Daily Quests" guide.
|tip You can also farm eggs using the "Netherwing Egg" guide.
step
talk Taskmaster Varkule Dragonbreath##23140
accept Bow to the Highlord##11107 |goto Shadowmoon Valley 66.1,86.4
step
talk Overlord Mor'ghor##23139
turnin Bow to the Highlord##11107 |goto 66.2,85.7
accept Lord Illidan Stormrage##11108 |goto 66.2,85.7
step
Watch the dialogue
Arrive in Shattrath City |goto Shattrath City 65.8,18.6 < 200 |noway |c |q 11108
step
talk Barthamus##23433
turnin Lord Illidan Stormrage##11108 |goto Shattrath City 66.6,16.4
step
Pick your favorite Netherdrake:
accept Voranaku the Violet Netherwing Drake##11113 |goto 66.8,17.6 |noautoaccept |or
accept Zoya the Veridian Netherwing Drake##11114 |goto 66.8,17.6 |noautoaccept |or
accept Suraku the Azure Netherwing Drake##11112 |goto 66.8,17.6 |noautoaccept |or
accept Onyxien the Onyx Netherwing Drake##11111 |goto 66.8,17.6 |noautoaccept |or
accept Malfas the Purple Netherwing Drake##11110 |goto 66.8,17.6 |noautoaccept |or
accept Jorus the Cobalt Netherwing Drake##11109 |goto 66.8,17.6 |noautoaccept |or
]])
ZygorGuidesViewer:RegisterGuide("Reputation Guides\\The Burning Crusade\\The Sha'tar",{
author="support@zygorguides.com",
description="This guide will walk you through the quests granting reputation with The Sha'tar.",
startlevel=70,
endlevel=70,
},[[
step
talk Haggard War Veteran##19684
|tip He walks along the bridge.
accept A'dal##10210 |goto Shattrath City/0 60.29,16.69
step
talk A'dal##18481
|tip Inside the building.
turnin A'dal##10210 |goto 54.00,44.71
step
talk Matron Celestine##18301
accept He Called Himself Altruis...##9983 |goto Nagrand/0 55.20,36.10
step
talk Jorin Deadeye##18106
accept The Impotent Leader##9888 |goto Nagrand/0 55.56,37.62
step
talk Kilrath##18273
turnin The Impotent Leader##9888 |goto Terokkar Forest/0 19.77,60.85
accept Don't Kill the Fat One##9889 |goto 19.77,60.85
stickystart "Slay_Boulderfist_Invaders"
step
kill Unkor the Ruthless##18262 |q 9889/2 |goto 20.06,63.23
|tip He will eventually submit.
step
label "Slay_Boulderfist_Invaders"
kill 10 Boulderfist Invader##18260 |q 9889/1 |goto 19.99,63.72
step
talk Unkor the Ruthless##18262
turnin Don't Kill the Fat One##9889 |goto 20.06,63.23
accept Success!##9890 |goto 20.06,63.23
step
talk Kilrath##18273
turnin Success!##9890 |goto 19.77,60.85
accept Because Kilrath is a Coward##9891 |goto 19.77,60.85
step
talk Jorin Deadeye##18106
turnin Because Kilrath is a Coward##9891 |goto Nagrand/0 55.56,37.62
accept Message in a Battle##9906 |goto 55.56,37.62
stickystart "Slay_Boulder_Crushers"
step
kill 15 Boulderfist Mystic##17135 |q 9906/1 |goto 73.41,70.20
step
label "Slay_Boulder_Crushers"
kill 15 Boulderfist Crusher##17134 |q 9906/2 |goto 73.41,70.20
step
talk Jorin Deadeye##18106
turnin Message in a Battle##9906 |goto 55.56,37.62
accept An Audacious Advance##9907 |goto 55.56,37.62
stickystart "Slay_Boulderfist_Mages"
step
Follow the path down |goto 40.18,27.78 < 15 |only if walking
kill 25 Boulderfist Warrior##17136 |q 9907/1 |goto 40.76,31.58
|tip You can find more inside the nearby cave.
step
label "Slay_Boulderfist_Mages"
kill 25 Boulderfist Mage##17137 |q 9907/2 |goto 40.76,31.58
|tip You can find more inside the nearby cave.
step
Kill enemies around this area
|tip The quest will show up once they are dead.
talk Mag'har Captive##18210 |goto Nagrand/0 31.33,44.12
accept The Totem of Kar'dash##9868 |goto 31.32,44.13
step
Free the Mag'har Captive |q 9868/1 |goto 31.73,38.74
step
talk Altruis the Sufferer##18417
turnin He Called Himself Altruis...##9983 |goto 27.34,43.08 |only if haveq(9983) or completedq(9983)
accept Survey the Land##9991 |goto 27.34,43.08
|tip Make sure you dismount before accepting this quest, or you will have to abandon it and pick it back up.
step
Watch the dialogue
Survey the Forge Camps |q 9991/1
step
talk Altruis the Sufferer##18417
turnin Survey the Land##9991 |goto 27.34,43.08
accept Buying Time##9999 |goto 27.34,43.08
stickystart "Slay_Moarg_Engineers"
stickystart "Slay_Ganarg_Tinkerers"
step
kill 2 Felguard Legionnaire##17152+ |q 9999/1 |goto 25.13,38.25
step
label "Slay_Moarg_Engineers"
kill 3 Mo'arg Engineer##16945+ |q 9999/2 |goto 24.36,37.44
step
label "Slay_Ganarg_Tinkerers"
kill 8 Gan'arg Tinkerer##17151+ |q 9999/3 |goto 25.07,37.72
step
talk Altruis the Sufferer##18417
turnin Buying Time##9999 |goto 27.34,43.08
accept The Master Planner##10001 |goto 27.34,43.08
step
kill Mo'arg Master Planner##18567
collect The Master Planner's Blueprints##25751 |q 10001/1 |goto 23.60,34.66
step
talk Altruis the Sufferer##18417
turnin The Master Planner##10001 |goto 27.34,43.08
accept Patience and Understanding##10004 |goto 27.34,43.08
step
Enter the building |goto Shattrath City/0 74.05,32.84 < 7 |walk
talk Sal'salabim##18584
|tip Inside the building.
Tell him _"Altruis sent me. He said that you could help me."_
kill Sal'salabim##18584
Persuade Sal'salabim |q 10004/1 |goto 77.30,34.87
step
talk Sal'salabim##18584
|tip Inside the building.
turnin Patience and Understanding##10004 |goto 77.30,34.87
accept Crackin' Some Skulls##10009 |goto 77.30,34.87
step
talk Raliq the Drunk##18585
|tip Inside the building.
Tell him _"I have been sent by Sal'salabim to collect a debt that you owe. Pay up or I'm going to have to hurt you."_
kill Raliq the Drunk##18585
collect Raliq's Debt##25767 |q 10009/1 |goto 75.01,31.41
step
talk Coosh'coosh##18586
|tip He walks around this area.
Tell him _"I have been sent by Sal'salabim to collect a debt that you owe. Pay up or I'm going to have to hurt you."_
kill Coosh'coosh##18586
collect Coosh'coosh's Debt##25768 |q 10009/2 |goto Zangarmarsh/0 80.88,91.20
step
talk Floon##18588
|tip He walks around this area.
Tell him _"I have been sent by Sal'salabim to collect a debt that you owe. Pay up or I'm going to have to hurt you."_
kill Floon##18588
collect Floon's Debt##25769 |q 10009/3 |goto Terokkar Forest/0 27.43,58.18
step
Enter the building |goto Shattrath City/0 74.05,32.84 < 7 |walk
talk Sal'salabim##18584
|tip Inside the building.
turnin Crackin' Some Skulls##10009 |goto 77.30,34.87
accept It's Just That Easy?##10010 |goto 77.30,34.87
step
talk Altruis the Sufferer##18417
turnin It's Just That Easy?##10010 |goto Nagrand/0 27.34,43.08
accept Forge Camp: Annihilated##10011 |goto 27.34,43.08
step
kill Demos Overseer of Hate##18535
collect Fel Cannon Activator##25770 |q 10011 |goto 24.98,36.09
step
use the Fel Cannon Activator##25770
Destroy Forge Camp: Hate |q 10011/1 |goto 25.04,35.89
step
kill Xirkos, Overseer of Fear##18536
collect Fel Cannon Activator##25771 |q 10011 |goto 19.60,51.12
step
use the Fel Cannon Activator##25771
Destroy Forge Camp: Fear |q 10011/2 |goto 19.34,50.86
step
talk Altruis the Sufferer##18417
turnin Forge Camp: Annihilated##10011 |goto 27.34,43.08
step
talk Jorin Deadeye##18106
turnin An Audacious Advance##9907 |goto 55.56,37.62
accept Diplomatic Measures##10107 |goto 55.56,37.62
step
talk Garrosh##18063
turnin The Totem of Kar'dash##9868 |goto 55.44,37.64
step
Follow the path up |goto 73.84,68.07 < 10 |only if walking
talk Lantresor of the Blade##18261
Tell him _"I have killed many of your ogres, Lantresor. I have no fear."_
Hear the Story of the Blademaster |q 10107/1 |goto 73.81,62.61
step
talk Lantresor of the Blade##18261
turnin Diplomatic Measures##10107 |goto 73.81,62.61
accept Armaments for Deception##9928 |goto 73.81,62.61
accept Ruthless Cunning##9927 |goto 73.81,62.61
stickystart "Collect_Kilsorrow_Armaments"
step
Kill Kil'sorrow enemies around this area
use the Warmaul Ogre Banner##25552
|tip Use it on their corpses.
Plant #20# Warmaul Ogre Banners |q 9927/1 |goto 70.09,79.41
step
label "Collect_Kilsorrow_Armaments"
click Kil'sorrow Armaments##182355+
|tip They look like flat brown boxes with a red axe logo on them on the ground around this area.
collect 20 Kil'sorrow Armaments##25554 |q 9928/1 |goto 70.26,80.00
step
Follow the path up |goto 73.84,68.07 < 10 |only if walking
talk Lantresor of the Blade##18261
turnin Armaments for Deception##9928 |goto 73.81,62.61
turnin Ruthless Cunning##9927 |goto 73.81,62.61
accept Returning the Favor##9931 |goto 73.81,62.61
accept Body of Evidence##9932 |goto 73.81,62.61
step
Kill Warmaul enemies around this area
use the Kil'sorrow Banner##25555
|tip Use it on their copses.
Plant #10# Kil'sorrow Banners |q 9931/1 |goto 46.84,23.00
step
use the Damp Woolen Blanket##25658
Defend the two Boulderfist Saboteurs that spawn
|tip They will walk around and plant bodies around this area.
Plant the Kil'sorrow Bodies |q 9932/1 |goto 46.59,24.25
step
Follow the path up |goto 73.84,68.07 < 10 |only if walking
talk Lantresor of the Blade##18261
turnin Returning the Favor##9931 |goto 73.81,62.61
turnin Body of Evidence##9932 |goto 73.81,62.61
accept Message to Garadar##9934 |goto 73.81,62.61
step
talk Garrosh##18063
turnin Message to Garadar##9934 |goto 55.44,37.64
accept A Visit With the Greatmother##10044 |goto 55.44,37.64
step
talk Greatmother Geyah##18141
|tip Inside the building.
turnin A Visit With the Greatmother##10044 |goto 56.70,34.31
accept Material Components##10045 |goto 56.70,34.31
step
click Telaari Frond##182599
|tip It looks like a green bush along the cliff wall around this area.
collect Telaari Frond##25864 |q 10045/3 |goto 59.14,55.52
step
click Olemba Root##182601
|tip It looks like a viny green plant near the base of trees around this area.
collect Olemba Root##25863 |q 10045/1 |goto Terokkar Forest/0 32.74,38.52
step
click Dragonspine##182606
|tip It looks like a red leafy plant next to the big spiky rock formations around this area.
collect Dragonspine##25865 |q 10045/4 |goto Blade's Edge Mountains/0 39.64,72.38
step
click Marshberry##182600
|tip It looks like a big red ball on the ground around this area.
collect Marshberry##25862 |q 10045/2 |goto Zangarmarsh/0 20.07,8.52
step
talk Greatmother Geyah##18141
|tip Inside the building.
turnin Material Components##10045 |goto Nagrand/0 56.70,34.31
accept To Meet Mother Kashur##10081 |goto 56.70,34.31
|tip Walks all around Oshu'Gun, you'll probably have to look around.
step
talk Mother Kashur##18687
turnin To Meet Mother Kashur##10081 |goto 26.07,60.60
accept The Agitated Ancestors##10082 |goto 26.07,60.60
step
kill 8 Agitated Orc Spirit##18043 |q 10082/1 |goto 26.51,60.10
step
talk Mother Kashur##18687
turnin The Agitated Ancestors##10082 |goto 26.07,60.60
accept A Visit With The Ancestors##10085 |goto 26.07,60.60
step
Visit Sunspring Post |q 10085/1 |goto 31.68,43.81
step
Visit the Laughing Skull Clan Ruins |q 10085/2 |goto 46.31,23.86
step
Visit Garadar |q 10085/3 |goto 54.75,36.38
step
Visit the Bleeding Hollow Clan Ruins |q 10085/4 |goto Terokkar Forest/0 19.77,61.86
step
talk Mother Kashur##18687
turnin A Visit With The Ancestors##10085 |goto Nagrand/0 26.07,60.60
accept When Spirits Speak##10101 |goto 26.07,60.60
step
Enter the cave |goto 35.83,67.76 < 10 |walk
talk K'ure##17545
|tip Inside the cave.
turnin When Spirits Speak##10101 |goto 35.48,77.84
accept A Secret Revealed##10102 |goto 35.48,77.84
step
talk A'dal##18481
turnin A Secret Revealed##10102 |goto Shattrath City/0 53.99,44.76
accept Auchindoun...##10167 |goto 53.99,44.76
step
Enter the Auchenai Crypts
Click here to continue |confirm |q 10167 |future
step
Inside the Auchenai Crypts Dungeon:
kill Exarch Maladaar##18373 |q 10167/1
step
Inside the Auchenai Crypts Dungeon:
talk D'ore##19412
|tip It looks like a big white floating NPC that appears after you kill Exarch Maladaar.
|tip Inside the Auchenai Crypts dungeon.
turnin Auchindoun...##10167
accept What the Soul Sees##10168
step
Inside the Auchenai Crypts Dungeon:
click Soul Mirror##183441
|tip It looks like a big pink floating crystal near the wall where you fight Exarch Maladaar.
|tip Inside the Auchenai Crypts dungeon.
collect Soul Mirror##28283 |q 10168/2
step
Leave the Auchenai Crypts dungeon
clicknpc Ancient Orc Ancestor##18688+
|tip They are non-aggressive ghosts that walk around this area.
|tip They can be hard to see, use the command "/tar Ancient" to help find them.
use Soul Mirror##28283
kill 15 Darkened Spirit##19480+ |q 10168/1 |goto Nagrand/0 37.07,63.11
step
talk Mother Kashur##18687
turnin What the Soul Sees##10168 |goto 26.07,60.60
step
ding 66
step
talk Ha'lei##19697
|tip Inside the building.
accept I See Dead Draenei##10227 |goto Terokkar Forest/0 35.09,65.09
step
talk Ramdor the Mad##19417
|tip Walks around this area.
turnin I See Dead Draenei##10227 |goto 35.10,66.34
accept Ezekiel##10228 |goto 35.10,66.34
step
talk Ezekiel##19715
|tip He walks around Shattrath City in a circle.
turnin Ezekiel##10228 |goto Shattrath City/0 59.70,36.29
accept What Book? I Don't See Any Book.##10231 |goto 59.70,36.29
step
talk "Dirty" Larry##19720
Tell him _"Ezekiel said that you might have a certain book... "_
Beat Down "Dirty" Larry and Get Information |q 10231/1 |goto 43.67,29.77
step
talk "Dirty" Larry##19720
turnin What Book? I Don't See Any Book.##10231 |goto 43.67,29.77
accept The Master's Grand Design?##10251 |goto 43.63,29.78
step
Enter the building |goto Nagrand/0 51.39,57.18 < 7 |walk
talk Nitrin the Learned##19844
|tip Inside the building.
turnin The Master's Grand Design?##10251 |goto Nagrand/0 51.82,56.85
accept Vision of the Dead##10252 |goto Nagrand/0 51.82,56.85
step
kill Aged Clefthoof##17133+
|tip You can find them all around this area.
collect Aged Clefthoof Blubber##28668 |q 10252/3 |goto 37.89,60.68
step
kill Mountain Gronn##19201+
collect Mountain Gronn Eyeball##28665 |q 10252/1 |goto 25.84,50.85
step
kill Greater Windroc##17129+
collect Flawless Greater Windroc Beak##28667 |q 10252/2 |goto 30.9,32.9
You can find more around:
[33.25,26.30]
[35.91,28.69]
step
Enter the building |goto 51.39,57.18 < 7 |walk
talk Nitrin the Learned##19844
|tip Inside the building.
turnin Vision of the Dead##10252 |goto 51.82,56.85
accept Levixus the Soul Caller##10253 |goto 51.82,56.85
step
kill Levixus##19847
collect The Book of the Dead##28677 |q 10253/1 |goto Terokkar Forest/0 39.62,71.23
step
talk Ramdor the Mad##19417
|tip Walks around this area.
turnin Levixus the Soul Caller##10253 |goto 35.10,66.34
step
talk Oakun##22456
accept The Dread Relic##10877 |goto Terokkar Forest/0 31.07,76.54
step
talk Scout Navrin##22364
accept Taken in the Night##10873 |goto 31.45,75.67
step
click Massive Treasure Chest
|tip After you loot it, there will be a bunch of undead that spawn around you in a circle.
collect Dread Relic##31697 |q 10877/1 |goto 43.91,76.40
step
talk Vindicator Haylen##22462
accept For the Fallen##10920 |goto 49.71,76.18
step
kill 20 Dreadfang Widow##18467+ |q 10920/1 |goto 51.03,80.46
You can find more around [54.98,60.07]
step
talk Vindicator Haylen##22462
turnin For the Fallen##10920 |goto 49.71,76.18
accept Terokkarantula##10921 |goto 49.71,76.18
step
kill Terokkarantula##20682 |q 10921/1 |goto 54.23,81.80
|tip You may need help with this.
step
talk Vindicator Haylen##22462
turnin Terokkarantula##10921 |goto 49.71,76.18
accept Return to Sha'tari Base Camp##10926 |goto 49.71,76.18
step
talk Oakun##22456
turnin The Dread Relic##10877 |goto 31.07,76.54
accept Evil Draws Near##10923 |goto 31.07,76.54
step
Kill Auchenai enemies around this area
collect 20 Doom Skull##31812 |q 10923 |goto 48.94,67.02
step
use the Dread Relic##31811
|tip Clear enemies around the area before you do.
kill Teribus the Cursed##22441 |q 10923/1 |goto 48.70,67.17
|tip You may need help with this.
step
talk Oakun##22456
turnin Evil Draws Near##10923 |goto 31.07,76.54
step
Complete the "Cipher of Damnation" questline |q 10588 |future
|tip Refer to the Cipher of Damnation guide to accomplish this.
step
talk Khadgar##18166
|tip Inside the building.
accept The Tempest Key##10883 |goto Shattrath City/0 54.76,44.33
step
talk A'dal##18481
|tip Inside the building.
turnin The Tempest Key##10883 |goto 53.97,44.75
accept Trial of the Naaru: Mercy##10884 |goto 53.97,44.75
accept Trial of the Naaru: Strength##10885 |goto 53.97,44.75
accept Trial of the Naaru: Tenacity##10886 |goto 53.97,44.75
step
Reach Revered with Thrallmar |complete rep('Thrallmar') >= Revered
|tip Refer to the Thrallmar reputation guide to accomplish this.
step
talk Quartermaster Urgronn##17585
buy Flamewrought Key##30637 |goto Hellfire Peninsula/0 54.90,37.80
step
Reach Revered with the Lower City |complete rep('Lower City') >= Revered
|tip Refer to the Lower City reputation guide to accomplish this.
step
talk Nakodu##21655
buy Auchenai Key##30633 |goto Shattrath City/0 61.99,68.84
step
Reach Revered with the Cenarion Expedition |complete rep('Cenarion Expedition') >= Revered
|tip Refer to the Cenarion Expedition reputation guide to accomplish this.
step
talk Fedryen Swiftspear##17904
buy Reservoir Key##30623 |goto Zangarmarsh/0 79.26,63.67
step
Run Tempest Keep Dungeons for reputation
|tip A full clear of the Mechanar nets roughly 1,600 reputation.
|tip A full clear of the Botanica nets roughly 2,200 reputation.
|tip A full clear of the Arcatraz nets roughly 1,800 reputation.
Reach Revered with The Sha'tar Expedition |complete rep("The Sha'tar") >=Revered
step
talk Almaador##21432
|tip Inside the building.
buy Warpforged Key##30634 |goto Shattrath City/0 51.00,41.71
step
Enter the Heroic Shattered Halls Dungeon
Click here to continue |confirm |q 10884 |future
step
Inside the Shattered Halls (Heroic) Dungeon:
kill Grand Warlock Nethekurse##16807
|tip IMPORTANT: After defeating the boss, you will have 55 minute buff.
|tip Your goal is to kill the Shattered Hand Executioner found behind the last boss of the dungeon before the timer runs out.
Gain the "Korgath's Executioner" Buff |havebuff 132338 |q 10884 |future
step
Inside the Shattered Halls (Heroic) Dungeon:
|tip REMEMBER: Your goal is to kill the Shattered Hand Executioner before the prisoners are executed.
kill Shattered Hand Executioner##17301
|tip Behind Warchief Kargath Bladefist.
collect Unused Axe of the Executioner##31716 |q 10884/1
step
Enter the Heroic Steamvault Dungeon
Click here to continue |confirm |q 10885 |future
step
Inside the Steamvalt (Heroic) Dungeon:
kill Warlord Kalithresh##17798
collect Kalithresh's Trident##31721 |q 10885/1
step
Enter the Heroic Shadow Labyrinth Dungeon
Click here to continue |confirm |q 10885 |future
step
Inside the Shadow Labyrinth (Heroic) Dungeon:
kill Murmur##18708
collect Murmur's Essence##31722 |q 10885/2
step
Enter The Arcatraz (Heroic) Dungeon
Click here to continue |confirm |q 10886 |future
step
Inside The Arcatraz (Heroic) Dungeon:
kill Harbinger Skyriss##20912
|tip Defeat Harbinger Skyriss and make sure Millhouse lives.
talk Millhouse Manastorm##20977
Rescue Millhouse Manastorm |q 10886/1
step
talk A'dal##18481
|tip Inside the building.
turnin Trial of the Naaru: Mercy##10884 |goto Shattrath City/0 53.97,44.75
turnin Trial of the Naaru: Strength##10885 |goto 53.97,44.75
turnin Trial of the Naaru: Tenacity##10886 |goto 53.97,44.75
step
talk Nether-Stalker Khay'ji##19880
accept Consortium Crystal Collection##10265 |goto Netherstorm/0 32.44,64.20
step
kill Pentatharon##20215
collect Arklon Crystal Artifact##28829 |q 10265/1 |goto 42.45,72.76
step
talk Nether-Stalker Khay'ji##19880
turnin Consortium Crystal Collection##10265 |goto 32.44,64.20
accept A Heap of Ethereals##10262 |goto 32.44,64.20
step
Kill Zaxxis enemies around this area
collect 10 Zaxxis Insignia##29209 |q 10262/1 |goto 30.34,74.98
step
talk Nether-Stalker Khay'ji##19880
turnin A Heap of Ethereals##10262 |goto 32.44,64.20
|tip "A Heap of Ethereals" becomes a daily after you turn the quest in.
accept Warp-Raider Nesaad##10205 |goto 32.44,64.20
step
kill Warp-Raider Nesaad##19641 |q 10205/1 |goto 28.27,79.60
step
talk Nether-Stalker Khay'ji##19880
turnin Warp-Raider Nesaad##10205 |goto 32.44,64.20
accept Request for Assistance##10266 |goto 32.44,64.20
step
talk Gahruj##20066
turnin Request for Assistance##10266 |goto 46.66,56.94
accept Rightful Repossession##10267 |goto 46.66,56.94
step
click Box Surveying Equipment##6881
|tip They look like grey metal boxes on the ground around this area.
collect 10 Box of Surveying Equipment##28913 |q 10267/1 |goto 57.6,63.9
step
talk Gahruj##20066
turnin Rightful Repossession##10267 |goto 46.66,56.94
accept An Audience with the Prince##10268 |goto 46.66,56.94
step
talk Image of Nexus-Prince Haramad##20084
|tip Inside the building.
turnin An Audience with the Prince##10268 |goto 45.87,35.97
accept Triangulation Point One##10269 |goto 45.87,35.97
step
use the Triangulation Device##28962
|tip A red arrow will appear and point to where you should go.
Discover the first triangulation point |q 10269/1 |goto 66.80,34.79
step
talk Dealer Hazzin##20092
turnin Triangulation Point One##10269 |ggoto Netherstorm/0 58.35,31.26
accept Triangulation Point Two##10275 |goto 58.35,31.26
step
use the Triangulation Device##29018
|tip A red arrow will appear and point to where you should go.
Discover the second triangulation point |q 10275/1 |goto 29.11,40.48
step
talk Wind Trader Tuluman##20112
turnin Triangulation Point Two##10275 |goto 34.62,37.95
accept Full Triangle##10276 |goto 34.62,37.95
step
kill Culuthas##20138
|tip You may need help with this.
collect Ata'mal Crystal##29026 |q 10276/1 |goto 53.51,21.54
step
talk Image of Nexus-Prince Haramad##20084
|tip Inside the building.
turnin Full Triangle##10276 |goto 45.87,35.97
accept Special Delivery to Shattrath City##10280 |goto 45.87,35.97
step
talk A'dal##18481
|tip Inside the building.
turnin Special Delivery to Shattrath City##10280 |goto Shattrath City/0 53.99,44.75
accept How to Break Into the Arcatraz##10704 |goto 53.99,44.75
step
Enter The Botanica (Heroic) Dungeon
Click here to continue |confirm |q 10704 |future
step
Inside The Botanica (Heroic) Dungeon:
kill Pathaleon the Calculator##19220
collect Bottom Shard of the Arcatraz Key##31086 |q 10704/2
step
Inside The Botanica (Heroic) Dungeon:
kill Warpsplinter##17977
collect Top Shard of the Arcatraz Key##31085 |q 10704/1
step
talk A'dal##18481
|tip Inside the building.
turnin How to Break Into the Arcatraz##10704 |goto Shattrath City/0 53.99,44.75
step
talk Arcanist Thelis##21955
|tip Inside the building.
accept Tablets of Baa'ri##10683 |goto Shadowmoon Valley/0 56.25,59.60
only if rep ('The Scryers') >= Neutral
step
click Baar'ri Tablet Fragment##6420
|tip On the ground around this area.
kill Ashtongue Worker##21455+
collect 12 Baa'ri Tablet Fragment##30596 |q 10683/1 |goto 59.84,36.36
only if rep ('The Scryers') >= Neutral
step
talk Arcanist Thelis##21955
|tip Inside the building.
turnin Tablets of Baa'ri##10683 |goto 56.25,59.60
accept Oronu the Elder##10684 |goto 56.25,59.60
only if rep ('The Scryers') >= Neutral
step
kill Oronu the Elder##21663
|tip Standing on the balcony.
collect Orders From Akama##30649 |q 10684/1 |goto 57.16,32.82
only if rep ('The Scryers') >= Neutral
step
talk Arcanist Thelis##21955
|tip Inside the building.
turnin Oronu the Elder##10684 |goto 56.25,59.60
accept The Ashtongue Corruptors##10685 |goto 56.25,59.60
only if rep ('The Scryers') >= Neutral
step
kill Corrupt Air Totem##21705
|tip Destroy them all to make Haalum vulnerable.
kill Haalum##21711
collect Haalum's Medallion Fragment##30691 |q 10685/2 |goto 57.08,73.64
only if rep ('The Scryers') >= Neutral
step
kill Corrupt Earth Totem##21704
|tip Destroy them all to make Eykenen vulnerable.
kill Eykenen##21709
collect Eykenen's Medallion Fragment##30692 |q 10685/1 |goto 51.18,52.83
only if rep ('The Scryers') >= Neutral
step
kill Corrupt Fire Totem##21703
|tip Destroy them all to make Uylaru vulnerable.
kill Uylaru##21710
collect Uylaru's Medallion Fragment##30694 |q 10685/4 |goto 48.29,39.56
only if rep ('The Scryers') >= Neutral
step
kill Corrupt Water Totem##21420
|tip Destroy them all to make Lakaan vulnerable.
kill Lakaan##21416
collect Lakaan's Medallion Fragment##30693 |q 10685/3 |goto 49.89,23.01
only if rep ('The Scryers') >= Neutral
step
talk Arcanist Thelis##21955
|tip Inside the building.
turnin The Ashtongue Corruptors##10685 |goto 56.3,59.6
accept The Warden's Cage##10686 |goto 56.3,59.6
only if rep ('The Scryers') >= Neutral
step
Follow the path down |goto 57.35,49.67 < 5 |walk
talk Sanoru##21826
|tip Downstairs.
turnin The Warden's Cage##10686 |goto 57.33,49.58
accept Proof of Allegiance##10622 |goto 57.33,49.58
only if rep ('The Scryers') >= Neutral
step
talk Anchorite Ceyla##21402
|tip Inside the building.
accept Tablets of Baa'ri##10568 |goto Shadowmoon Valley/0 62.58,28.37
only if rep ('The Aldor') >= Friendly
step
click Baar'ri Tablet Fragment##6420
|tip On the ground around this area.
kill Ashtongue Worker##21455+
collect 12 Baa'ri Tablet Fragment##30596 |q 10568/1 |goto 59.84,36.36
only if rep ('The Aldor') >= Friendly
step
talk Anchorite Ceyla##21402
|tip Inside the building.
turnin Tablets of Baa'ri##10568 |goto 62.58,28.37
accept Oronu the Elder##10571 |goto 62.58,28.37
only if rep ('The Aldor') >= Friendly
step
kill Oronu the Elder##21663
|tip Standing on the balcony.
collect Orders From Akama##30649 |q 10571/1 |goto 57.16,32.82
only if rep ('The Aldor') >= Friendly
step
talk Anchorite Ceyla##21402
|tip Inside the building.
turnin Oronu the Elder##10571 |goto 62.58,28.37
accept The Ashtongue Corruptors##10574 |goto 62.58,28.37
only if rep ('The Aldor') >= Friendly
step
kill Corrupt Water Totem##21420
|tip Destroy them all to make Lakaan vulnerable.
kill Lakaan##21416
collect Lakaan's Medallion Fragment##30693 |q 10574/3 |goto 49.89,23.01
only if rep ('The Aldor') >= Friendly
step
kill Corrupt Fire Totem##21703
|tip Destroy them all to make Uylaru vulnerable.
kill Uylaru##21710
collect Uylaru's Medallion Fragment##30694 |q 10574/4 |goto 48.29,39.56
only if rep ('The Aldor') >= Friendly
step
kill Corrupt Earth Totem##21704
|tip Destroy them all to make Eykenen vulnerable.
kill Eykenen##21709
collect Eykenen's Medallion Fragment##30692 |q 10574/1 |goto 51.18,52.83
only if rep ('The Aldor') >= Friendly
step
kill Corrupt Air Totem##21705
|tip Destroy them all to make Haalum vulnerable.
kill Haalum##21711
collect Haalum's Medallion Fragment##30691 |q 10574/2 |goto 57.08,73.64
only if rep ('The Aldor') >= Friendly
step
talk Anchorite Ceyla##21402
|tip Inside the building.
turnin The Ashtongue Corruptors##10574 |goto 62.58,28.37
accept The Warden's Cage##10575 |goto 62.58,28.37
only if rep ('The Aldor') >= Friendly
step
Follow the path down |goto 57.35,49.67 < 5 |walk
talk Sanoru##21826
|tip Downstairs.
turnin The Warden's Cage##10575 |goto 57.33,49.58
accept Proof of Allegiance##10622 |goto 57.33,49.58
only if rep ('The Aldor') >= Friendly
step
kill Zandras##21827 |q 10622/1 |goto 57.04,48.70
|tip he walks along the wall here.
step
Follow the path down |goto 57.35,49.67 < 5 |walk
talk Sanoru##21826
turnin Proof of Allegiance##10622 |goto 57.33,49.58
accept Akama##10628 |goto 57.33,49.58
step
Swim through the tunnel |goto 57.69,47.72 < 7
talk Akama##21700
|tip Inside the building.
turnin Akama##10628 |goto 58.11,48.19
accept Seer Udalo##10705 |goto 58.11,48.19
step
Enter The Arcatraz Dungeon
|tip It can be Normal or Heroic.
Click here to continue |confirm |q 10705 |future
step
Inside The Arcatraz Dungeon:
clicknpc Udalo##21962
|tip On the floor in the room before Harbinger Skyriss.
turnin Seer Udalo##10705
accept A Mysterious Portent##10706
step
Follow the path down |goto 57.35,49.67 < 5 |walk
Swim through the tunnel |goto 57.69,47.72 < 7
talk Akama##21700
|tip Inside the building.
turnin A Mysterious Portent##10706 |goto Shadowmoon Valley/0 58.11,48.19
accept The Ata'mal Terrace##10707 |goto 58.11,48.19
step
Swim through the tunnel |goto 57.71,48.54 < 7
kill Shadowmoon Soulstealer##22061+
|tip There will be 3 of them.
|tip Once you kill them, it will trigger an event.
|tip Kill the enemies that spawn.
|tip You may need help with this.
kill Shadowlord Deathwail##22006+
collect Heart of Fury##31307 |q 10707/1 |goto 71.60,35.51
step
Follow the path down |goto 57.35,49.67 < 5 |walk
Swim through the tunnel |goto 57.69,47.72 < 7
talk Akama##21700
|tip Inside the building.
turnin The Ata'mal Terrace##10707 |goto 58.11,48.19
accept Akama's Promise##11052 |goto 58.11,48.19
step
Swim through the tunnel |goto 57.71,48.54 < 7
kill Val'zareq the Conqueror##21979
|tip He patrols along the path of conquest with 4 adds.
|tip You may need help with this.
collect The Journal of Val'zareq##31345 |n
use The Journal of Val'zareq##31345
accept The Journal of Val'zareq: Portends of War##10793 |goto 51.05,58.85
step
click Crystal Prison##185126
turnin The Journal of Val'zareq: Portends of War##10793 |goto 51.40,72.80
accept Battle of the Crimson Watch##10781 |goto 51.40,72.80
step
Kill enemies around this area
|tip They will spawn in waves.
|tip You may need help with this.
Annihilate the Crimson Sigil Forces |q 11052/1
step
talk A'dal##18481
|tip Inside the building.
turnin Battle of the Crimson Watch##10781 |goto Shattrath City/0 53.99,44.75
turnin Akama's Promise##11052 |goto 53.99,44.75
step
Run Heroic Hellfire Citadel Dungeons for reputation.
|tip A full clear of Heroic Mechanar nets roughly 2,100 reputation.
|tip A full clear of Heroic Botanica nets roughly 3,200 reputation.
|tip A full clear of Heroic Arcatraz nets roughly 2,600 reputation.
|tip A full clear of Normal Mechanar nets roughly 1,600 reputation.
|tip A full clear of Normal Botanica nets roughly 2,200 reputation.
|tip A full clear of Normal Arcatraz nets roughly 1,800 reputation.
Reach Exalted Reputation with The Sha'tar |complete rep("The Sha'tar")==Exalted
step
label "exalted"
_Congratulations!_
You Earned Exalted Reputation with The Sha'tar
]])
ZygorGuidesViewer:RegisterGuide("Reputation Guides\\The Burning Crusade\\Keepers of Time",{
author="support@zygorguides.com",
startlevel=60,
endlevel=70,
},[[
step
talk Steward of Time##20142
accept To The Master's Lair##10279 |goto Tanaris/0 66.02,49.70
step
talk Andormu##20130
turnin To The Master's Lair##10279 |goto 58.43,54.28
accept The Caverns of Time##10277 |goto 58.43,54.28
step
Follow the Custodian
|tip You can wait at Andormu while the Custodian explains.
Listen to the Caverns of Time Explanation |q 10277/1
step
talk Andormu##20130
turnin The Caverns of Time##10277 |goto 58.43,54.28
accept Old Hillsbrad##10282 |goto 58.43,54.28
step
Enter the Old Hillsbrad Foothills Dungeon
Click here to continue |confirm |q 29599 |future
step
Inside the Old Hillsbrad Dungeon:
talk Erozion##18723
|tip He is found outside the tunnel at the beginning of the dungeon.
turnin Old Hillsbrad##10282
accept Taretha's Diversion##10283
step
Inside the Old Hillsbrad Dungeon:
talk Brazen##18725
|tip He is next to Erozion.
Tell him _"I'm ready to go to Durnholde Keep."_
Fly with Brazen
confirm |q 10283
step
Inside the Old Hillsbrad Dungeon:
|tip After landing with Brazen, run northeast through the gate into Durnholde Keep.
|tip Before crossing the bridge, jump down to the area below.
click Barrel##182589+
|tip They look like small brown barrels inside the buildings around this area.
|tip There are five you must click, one in each of the buildings.
Set the Internment Lodges Ablaze |q 10283/1
step
Inside the Old Hillsbrad Dungeon:
talk Thrall##17876
|tip He is inside a prison cell inside Durnholde Keep.
|tip Make sure everyone in the group has turned in Taretha's Diversion before accepting Escape from Durnholde.
|tip Everyone will need to accept Escape from Durnholde at the same time or they won't be able to get it.
turnin Taretha's Diversion##10283
accept Escape from Durnholde##10284
step
Inside the Old Hillsbrad Dungeon:
Follow Thrall
|tip Follow and protect Thrall as he runs.
|tip Complete the dungeon and defeat the reminaing bosses.
kill Epoch Hunter##18096
|tip It is the last boss of the instance.
|tip Use the "Old Hillsbrad Foothills" dungeon guide to accomplish this.
Fulfill Thrall's Destiny |q 10284/1
step
Inside the Old Hillsbrad Dungeon:
Watch the dialogue
talk Erozion##18723
|tip He appears at the end of the dungeon after defeating the Epoch Hunter.
turnin Escape from Durnholde##10284
accept Return to Andormu##10285
step
talk Andormu##20130
|tip Inside the cave.
turnin Return to Andormu##10285 |goto 58.43,54.28
accept The Black Morass##10296 |goto 58.43,54.28
step
Enter the Black Morass Dungeon
Click here to continue |confirm
step
Inside The Black Morass Dungeon:
talk Sa'at##20201
turnin The Black Morass##10296
accept The Opening of the Dark Portal##10297
step
Inside The Black Morass Dungeon:
Follow and protect Medivh
Kill the enemies that attack
|tip Use "The Black Morass" dungeon guide to accomplish this.
Defend Medivh |q 10297/1
step
Inside The Black Morass Dungeon:
talk Sa'at##20201
turnin The Opening of the Dark Portal##10297
accept Hero of the Brood##10298
step
talk Andormu##20130
|tip Inside the cave.
turnin Hero of the Brood##10298 |goto Tanaris/0 58.43,54.28
step
Run Caverns of Time Dungeons for reputation.
|tip A full clear of Heroic Old Hillsbrad Foothills nets roughly 2,300 reputation.
|tip A full clear of Heroic Black Morass nets roughly 1,750 reputation.
|tip A full clear of Normal Old Hillsbrad Foothills nets roughly 1,000 reputation.
|tip A full clear of Normal Black Morass nets roughly 1,100 reputation.
Reach Exalted Reputation with the Keepers of Time |complete rep('Keepers of Time')==Exalted
step
_Congratulations!_
You Earned Exalted Reputation with The Keepers of Time
]])
ZygorGuidesViewer:RegisterGuide("Reputation Guides\\The Burning Crusade\\Sporeggar",{
author="support@zygorguides.com",
startlevel=60,
endlevel=70,
},[[
step
talk Fahssn##17923
|tip He walks around this area.
accept The Sporelings' Plight##9739 |goto Zangarmarsh/0 18.96,63.45
accept Natural Enemies##9743 |goto Zangarmarsh/0 18.96,63.45
stickystart "Collect_Mature_Spore_Sacs"
step
Kill Starving enemies around this area
collect 6 Bog Lord Tendril##24291 |q 9743/1 |goto 15.90,60.51
step
label "Collect_Mature_Spore_Sacs"
click Mature Spore Sac##182069+
|tip They look like small puffy, balloon-shaped sacs on on the ground around this area.
collect 10 Mature Spore Sac##24290 |q 9739/1 |goto 15.90,60.51
step
talk Fahssn##17923
|tip He walks around this area.
turnin The Sporelings' Plight##9739 |goto 18.96,63.45
turnin Natural Enemies##9743 |goto 18.96,63.45
step
label "Collect_Spore_Sacs_Reach_Friendly"
click Mature Spore Sac##182069+
|tip They look like small puffy, balloon-shaped sacs on on the ground around this area.
collect Mature Spore Sac##24290 |n |goto 15.90,60.51
|tip Collect them in in stacks of 10.
Click here to turn them in |confirm
step
talk Fahssn##17923
|tip He walks around this area.
accept More Spore Sacs##9742 |goto 18.96,63.45 |only if rep('Sporeggar')<Friendly
Click here to continue farming |next "Collect_Spore_Sacs_Reach_Friendly" |confirm |only if rep('Sporeggar')<Friendly
Reach Friendly with Sporeggar |complete rep('Sporeggar')>=Friendly |next "Reached_Friendly_Reputation"
step
label "Reached_Friendly_Reputation"
talk Fahssn##17923
|tip He walks around this area.
accept Sporeggar##9919 |goto 18.96,63.45
step
Enter the building |goto 19.54,51.82 < 5 |walk
talk Msshi'fn##17924
|tip Inside the building.
turnin Sporeggar##9919 |goto 19.68,52.07
step
The fastest way to go reach Exalted is to farm The Underbog dungeon
|tip You can complete the dungeon once pery day on Heroic and as many times as you want on Normal.
Enter The Underbog
Click here to continue |confirm
only if rep('Sporeggar')<Exalted
step
label "Farm_Dungeon_Collect_Sanguine_Hibiscus"
Inside The Underbog Dungeon:
Kill everything in the dungeon
click Sanguine Hibiscus##183385+
|tip They look like small red flowery plants on the ground throughout the dungeon.
|tip They can also drop from creatures in the dungeon.
collect Sanguine Hibiscus##24246 |n
|tip Collect these and turn them in for more reputation after each run.
Click here to turn them in |confirm |only if rep('Sporeggar')<Exalted
step
talk Gzhun'tt##17856
accept Bring Me Another Shrubbery!##9714 |goto 31.48,65.21 |only if rep('Sporeggar')<Exalted
Click here to continue farming |next "Farm_Dungeon_Collect_Sanguine_Hibiscus" |confirm |only if rep('Sporeggar')<Exalted
|tip You can complete the dungeon once pery day on Heroic and as many times as you want on Normal.
Earn Exalted status with the Sporeggar |complete rep('Sporeggar')==Exalted
step
_Congratulations!_
You Earned Exalted with the Sporeggr
]])
ZygorGuidesViewer:RegisterGuide("Reputation Guides\\The Burning Crusade\\The Kurenai",{
author="support@zygorguides.com",
startlevel=60,
endlevel=70,
},[[
step
Run up the stairs |goto Zangarmarsh 69.76,49.29 < 15 |only if walking
Ride the elevator up |goto 70.69,49.19 < 15 |only if walking
talk Anchorite Ahuurn##18003
accept The Orebor Harborage##9776 |goto 68.20,49.38
step
talk Timothy Daniels##18019
accept Secrets of the Daggerfen##9848 |goto 41.21,28.67
step
click Wanted Poster##184945
accept Wanted: Chieftain Mummaki##10116 |goto 41.74,27.26
step
talk Ikuti##18008
turnin The Orebor Harborage##9776 |goto 41.95,27.19
accept Ango'rosh Encroachment##9835 |goto 41.95,27.19
accept Daggerfen Deviance##10115 |goto 41.95,27.19
stickystart "Kill_Angorosh_Ogres"
step
kill 5 Ango'rosh Shaman##18118 |q 9835/1 |goto 33.62,31.78
step
label "Kill_Angorosh_Ogres"
kill 10 Ango'rosh Ogre##18117 |q 9835/2 |goto 33.62,31.78
stickystart "Kill_Daggerfen_Assassins"
stickystart "Kill_Daggerfen_Muckdwellers"
step
click Daggerfen Poison Vial##182185
collect Daggerfen Poison Vial##24500 |q 9848/2 |goto 26.41,22.84
step
click Daggerfen Poison Manual##182184
|tip At the top of the tower.
|tip Be careful to avoid Chieftain Mummaki nearby.
collect Daggerfen Poison Manual##24499 |q 9848/1 |goto 24.40,27.00
step
kill Chieftain Mummaki##19174
|tip At the top of the tower.
collect Chieftain Mummaki's Totem##27943 |q 10116/1 |goto 23.78,26.75
step
label "Kill_Daggerfen_Assassins"
kill 3 Daggerfen Assassin##18116 |q 10115/1 |goto 25.41,24.35
step
label "Kill_Daggerfen_Muckdwellers"
kill 15 Daggerfen Muckdweller##18115 |q 10115/2 |goto 25.41,24.35
step
Run up the stairs |goto 39.98,27.60 < 20 |only if walking
talk Timothy Daniels##18019
turnin Secrets of the Daggerfen##9848 |goto 41.21,28.67
step
talk Ikuti##18008
turnin Ango'rosh Encroachment##9835 |goto 41.94,27.19
accept Overlord Gorefist##9839 |goto 41.94,27.19
turnin Wanted: Chieftain Mummaki##10116 |goto 41.94,27.19
turnin Daggerfen Deviance##10115 |goto 41.94,27.19
step
talk Maktu##18010
accept Natural Armor##9834 |goto 41.61,27.29
step
Enter the building |goto 41.01,28.46 < 10 |walk
talk Puluu##18009
|tip Inside the building.
accept Stinger Venom##9830 |goto 40.85,28.65
accept Lines of Communication##9833 |goto 40.85,28.65
accept The Terror of Marshlight Lake##9902 |goto 40.85,28.65
step
use the Potion of Water Breathing##25539
|tip Use it next to the lake.
Gain Greater Water Breathing |havebuff spell:22807 |goto 42.91,36.06 |q 9834
step
kill Fenclaw Thrasher##18214+
|tip Underwater around this area.
collect 8 Fenclaw Hide##24486 |q 9834/1 |goto 49.10,38.94
step
kill Terrorclaw##20477 |q 9902/1 |goto 22.33,45.86
|tip He walks around this area.
step
kill 12 Marshfang Slicer##18131 |q 9833/1 |goto 35.90,58.70
You can find more around [25.34,57.53]
step
kill Marshlight Bleeder##18133+
|tip Fenglow Stingers will also drop the quest item.
collect 6 Marshlight Bleeder Venom##24485 |q 9830/1 |goto 15.81,41.93
You can find more around [21.01,31.65]
stickystart "Kill_Angorosh_Maulers"
step
Cross the bridge |goto 17.08,13.01 < 15 |only if walking
Follow the path up |goto 17.77,9.83 < 10 |only if walking
Enter the building |goto 18.69,7.80 < 10 |walk
kill Overlord Gorefist##18160 |q 9839/1 |goto 18.40,7.79
|tip Inside the building.
step
label "Kill_Angorosh_Maulers"
kill 10 Ango'rosh Mauler##18120 |q 9839/2 |goto 19.91,5.41
step
talk Ikuti##18008
turnin Overlord Gorefist##9839 |goto 41.94,27.19
step
Run up the stairs |goto 39.98,27.57 < 20 |only if walking
Enter the building |goto 41.01,28.46 < 10 |walk
talk Puluu##18009
|tip Inside the building.
turnin Stinger Venom##9830 |goto 40.85,28.65
turnin Lines of Communication##9833 |goto 40.85,28.65
turnin The Terror of Marshlight Lake##9902 |goto 40.85,28.65
step
talk Maktu##18010
turnin Natural Armor##9834 |goto 41.61,27.29
accept Maktu's Revenge##9905 |goto 41.61,27.29
step
kill Mragesh##18286 |q 9905/1 |goto 42.21,41.43
|tip Underwater.
step
talk Maktu##18010
turnin Maktu's Revenge##9905 |goto 41.61,27.29
step
Earn Neutral status with the Kurenai |complete rep('Kurenai')>=Neutral
step
Cross the bridge |goto 51.24,71.01 < 15 |only if walking
talk Otonbu the Sage##18222
accept Stopping the Spread##9874 |goto 54.48,72.08
step
talk Poli'lukluk the Wiser##18224
accept Solving the Problem##9878 |goto 54.46,72.30
step
talk Huntress Bintook##18353
accept Do My Eyes Deceive Me##9917 |goto 55.05,70.54
step
click Telaar Bulletin Board##182393
accept Wanted: Giselda the Crone##9936 |goto 54.68,70.73
accept Wanted: Zorbo the Advisor##9940 |goto 54.68,70.73
step
talk Warden Moi'bff Jill##18408
|tip He walks around this area.
accept Fierce Enemies##10476 |goto 54.74,70.88
step
talk Nahuud##18097
turnin A Message to Telaar##9792 |goto 54.76,71.02
step
talk Huntress Kima##18416
|tip She walks around this area.
accept The Ravaged Caravan##9956 |goto 54.15,69.52
step
kill Boulderfist Hunter##18352+
collect Boulderfist Plans##25468 |q 9917/1 |goto 62.35,72.14
stickystart "Slay_Kilsorrow_Agents"
step
Follow the path up |goto 69.98,76.51 < 20 |only if walking
Enter the building |goto 70.93,81.27 < 7 |walk
kill Giselda the Crone##18391 |q 9936/1 |goto 71.16,82.35
|tip Inside the building.
step
label "Slay_Kilsorrow_Agents"
Kill Kil'sorrow enemies around this area
Slay #15# Kil'sorrow Agents |q 9936/2 |goto 70.57,79.65
step
Kill enemies around this area
|tip We are grinding a little bit now, to prevent having to grind a lot all at once later.
Reach Level 66 |ding 66 |goto 70.57,79.65
stickystart "Collect_Obsidian_Warbeads"
step
talk Corki##18369
accept HELP!##9923 |goto 72.56,70.70
step
Kill Boulderfist enemies around this area
collect Boulderfist Key##25490 |goto 73.73,70.02 |q 9923
step
click Corki's Prison##1787
Free Corki |q 9923/1 |goto 72.56,70.70
step
label "Collect_Obsidian_Warbeads"
Kill Boulderfist enemies around this area
collect 10 Obsidian Warbeads##25433 |q 10476/1 |goto 73.73,70.02
|tip Be careful not to accidentally sell these to a vendor.
You can find more around [75.30,63.65]
stickystart "Kill_Warmaul_Shamans"
stickystart "Kill_Warmaul_Reavers"
step
Follow the path up |goto 45.69,21.73 < 15 |only if walking
Enter the cave |goto 46.24,18.78 < 10 |walk
kill Zorbo the Advisor##18413 |q 9940/1 |goto 46.48,18.20
|tip Inside the cave.
step
label "Kill_Warmaul_Shamans"
kill 10 Warmaul Shaman##18064 |q 9940/2 |goto 45.37,22.12
step
label "Kill_Warmaul_Reavers"
kill 10 Warmaul Reaver##17138 |q 9940/3 |goto 45.37,22.12
step
Follow the path up |goto 29.15,31.69 < 15 |only if walking
click Telaar Supply Crate##182520+
|tip They look like grey metal boxes on the ground around this area.
collect 20 Telaar Supply Crate##25647 |q 9956/1 |goto 25.70,27.61
step
Follow the path down |goto 27.09,30.21 < 20 |only if walking
use the Torch of Liquid Fire##24560
|tip Use it next to Sunspring Villagers.
|tip They look like corpses floating underwater around this area.
Burn #10# Sunspring Villager Corpses |q 9874/1 |goto 33.58,48.00
stickystart "Kill_Murkblood_Raiders"
step
kill 20 Murkblood Scavenger##18207 |q 9878/1 |goto 32.38,42.78
step
label "Kill_Murkblood_Raiders"
kill 10 Murkblood Raider##18203 |q 9878/2 |goto 32.38,42.78
step
talk Huntress Kima##18416
|tip She walks around this area.
turnin The Ravaged Caravan##9956 |goto 54.15,69.52
step
talk Poli'lukluk the Wiser##18224
turnin Solving the Problem##9878 |goto 54.47,72.31
step
talk Otonbu the Sage##18222
turnin Stopping the Spread##9874 |goto 54.48,72.09
step
talk Warden Moi'bff Jill##18408
|tip He walks around this area.
turnin Fierce Enemies##10476 |goto 54.74,70.87
turnin Wanted: Giselda the Crone##9936 |goto 54.74,70.87
turnin Wanted: Zorbo the Advisor##9940 |goto 54.74,70.87
step
talk Huntress Bintook##18353
turnin Do My Eyes Deceive Me##9917 |goto 55.05,70.53
accept Not On My Watch!##9918 |goto 55.05,70.53
step
Enter the building |goto 54.94,69.80 < 15 |only if walking
talk Arechron##18183
turnin HELP!##9923 |goto 55.48,68.71
accept Corki's Gone Missing Again!##9924 |goto 55.48,68.71
turnin Murkblood Invaders##9871 |goto 55.48,68.71
step
kill Lump##18351
|tip He will eventually surrender.
talk Lump##18351
Tell him _"I need answers, ogre!"_
Interrogate Lump |q 9918/1 |goto 62.74,71.49
step
Cross the bridge |goto 57.07,70.24 < 15 |only if walking
talk Huntress Bintook##18353
turnin Not On My Watch!##9918 |goto 55.05,70.53
accept Mo'mor the Breaker##9920 |goto 55.05,70.53
step
talk Mo'mor the Breaker##18223
turnin Mo'mor the Breaker##9920 |goto 54.61,72.21
accept The Ruins of Burning Blade##9921 |goto 54.61,72.21
stickystart "Kill_Boulderfist_Mystics"
step
Cross the bridge |goto 55.79,71.11 < 15 |only if walking
kill 15 Boulderfist Crusher##17134 |q 9921/1 |goto 72.9,69.8
You can find more around [74.82,64.19]
step
label "Kill_Boulderfist_Mystics"
kill 15 Boulderfist Mystic##17135 |q 9921/2 |goto 72.9,69.8
You can find more around [74.82,64.19]
step
Cross the bridge |goto 57.07,70.24 < 15 |only if walking
talk Mo'mor the Breaker##18223
turnin The Ruins of Burning Blade##9921 |goto 54.61,72.21
accept The Twin Clefts of Nagrand##9922 |goto 54.61,72.21
stickystart "Kill_Boulderfist_Warriors"
stickystart "Kill_Boulderfist_Mages"
step
Follow the path down |goto 44.37,34.91 < 20 |only if walking
Follow the path |goto 41.84,36.87 < 30 |only if walking
Kill Boulderfist enemies around this area
|tip Inside and outside the cave.
collect Northwind Cleft Key##25509 |goto 40.76,31.46 |q 9924
step
Enter the cave |goto 40.76,31.44 < 10 |walk
click Corki's Prison##1787
|tip Inside the cave.
Free Corki Again |q 9924/1 |goto 39.26,27.46
step
label "Kill_Boulderfist_Warriors"
kill 25 Boulderfist Warrior##17136 |q 9922/1 |goto 40.77,31.36
|tip Inside and outside the cave. |notinsticky
step
label "Kill_Boulderfist_Mages"
kill 25 Boulderfist Mage##17137 |q 9922/2 |goto 40.77,31.36
|tip Inside and outside the cave. |notinsticky
step
kill Murkblood Brute##18211+
|tip You will only be able to interact once they are dead.
talk Kurenai Captive##18209
|tip Inside the building.
accept The Totem of Kar'dash##9879 |goto Nagrand/0 33.18,42.30
step
Kill Murkblood enemies around this area
|tip They will attack in waves.
|tip You may need help with this.
Escort the Kurenai Captive |q 9879/1 |goto 31.76,38.72
step
talk Mo'mor the Breaker##18223
turnin The Twin Clefts of Nagrand##9922 |goto 54.61,72.21
accept Diplomatic Measures##10108 |goto 54.61,72.21
step
Enter the building |goto 54.94,69.80 < 15 |only if walking
talk Arechron##18183
turnin The Totem of Kar'dash##9879
turnin Corki's Gone Missing Again!##9924 |goto 55.48,68.71
accept Corki's Ransom##9954 |goto 55.48,68.71
step
Cross the bridge |goto 55.78,71.12 < 15 |only if walking
Follow the path up |goto 73.05,69.36 < 15 |only if walking
Continue up the path |goto 74.27,67.78 < 20 |only if walking
talk Lantresor of the Blade##18261
Tell him _"I have killed many of your ogres, Lantresor. I have no fear."_
Hear the Tale of the Blademaster |q 10108/1 |goto 73.81,62.60
step
talk Lantresor of the Blade##18261
turnin Diplomatic Measures##10108 |goto 73.81,62.60
accept Armaments for Deception##9928 |goto 73.81,62.60
accept Ruthless Cunning##9927 |goto 73.81,62.60
stickystart "Collect_Kilsorrow_Armaments"
step
Follow the path down |goto 75.49,67.57 < 15 |only if walking
Follow the path |goto 69.97,76.51 < 15 |only if walking
Kill Kil'sorrow enemies around this area
use the Warmaul Ogre Banner##25552
|tip Use it near their corpses.
Plant #20# Warmaul Ogre Banners |q 9927/1 |goto 70.45,79.23
step
label "Collect_Kilsorrow_Armaments"
click Kil'sorrow Armament##182355+
|tip They look like wooden boxes with red axes on them on the ground and inside buildings around this area.
collect 20 Kil'sorrow Armaments##25554 |q 9928/1 |goto 70.45,79.23
step
Follow the path up |goto 73.05,69.36 < 15 |only if walking
Continue up the path |goto 74.27,67.78 < 20 |only if walking
talk Lantresor of the Blade##18261
turnin Armaments for Deception##9928 |goto 73.81,62.60
turnin Ruthless Cunning##9927 |goto 73.81,62.60
accept Returning the Favor##9931 |goto 73.81,62.60
accept Body of Evidence##9932 |goto 73.81,62.60
stickystart "Plant_Kilsorrow_Banners"
step
Follow the path down |goto 75.49,67.57 < 15 |only if walking
Follow the road |goto 71.34,67.97 < 50 |only if walking
Follow the path |goto 67.68,52.49 < 50 |only if walking
Continue following the path |goto 55.96,48.14 < 50 |only if walking
use the Damp Woolen Blanket##25658
|tip Use it next to the Blazing Warmaul Pyre.
|tip Two Boulderfist Saboteurs will appear nearby.
Watch the dialogue
|tip Follow and protect the two Boulderfist Saboteurs as they plant the bodies around this area.
Plant the Kil'sorrow Bodies |q 9932/1 |goto 46.66,24.32
step
label "Plant_Kilsorrow_Banners"
Kill enemies around this area
use the Kil'sorrow Banner##25555
|tip Use it near their corpses.
Plant #20# Kil'sorrow Banners |q 9931/1 |goto 46.97,23.51
step
Follow the path |goto 50.48,38.17 < 70 |only if walking
Follow the road |goto 68.51,53.29 < 50 |only if walking
Follow the path up |goto 73.05,69.36 < 15 |only if walking
Continue up the path |goto 74.27,67.78 < 20 |only if walking
talk Lantresor of the Blade##18261
turnin Returning the Favor##9931 |goto 73.81,62.60
turnin Body of Evidence##9932 |goto 73.81,62.60
accept Message to Telaar##9933 |goto 73.81,62.60
step
Follow the path down |goto 75.49,67.57 < 15 |only if walking
Cross the bridge |goto 57.02,70.27 < 15 |only if walking
Enter the building |goto 54.95,69.79 < 15 |only if walking
talk Arechron##18183
turnin Message to Telaar##9933 |goto 55.48,68.71
step
Enter the cave |goto Nagrand/0 27.03,23.69 < 5 |walk
talk Corki##18445
|tip Inside the cave.
turnin Corki's Ransom##9954 |goto 29.52,26.02
accept Cho'war the Pillager##9955 |goto 29.52,26.02
step
Enter the cave |goto 27.13,18.60 < 10
Follow the path |goto 25.90,16.54 < 10 |walk
Continue following the path |goto 27.01,13.43 < 10 |walk
Follow the path up |goto 28.40,13.53 < 10 |walk
Enter the cave |goto 27.52,11.31 < 10 |walk
Follow the path |goto 26.22,14.11 < 10 |walk
Follow the path up |goto 26.02,15.84 < 10
kill Cho'war the Pillager##18423
|tip Inside the cave.
|tip This enemy is elite and may require a group.
collect Cho'war's Key##25648 |q 9955 |goto 25.91,13.78
step
Enter the cave |goto Nagrand/0 27.03,23.69 < 5 |walk
talk Corki##18445
|tip Inside the cave.
Free Corki |q 9955/1 |goto 29.52,26.02
step
Enter the building |goto 54.94,69.80 < 15 |only if walking
talk Arechron##18183
turnin Cho'war the Pillager##9955 |goto 55.48,68.71
step
talk Warden Moi'bff Jill##18408
|tip He walks around this area.
accept Wanted: Durn the Hungerer##9938 |goto 54.74,70.88
step
map Nagrand/0
path	loop off; follow strictbounce
path	41.8,61.2	37.6,60.2	33.0,60.8	30.6,64.8	31.0,69.2
path	32.6,75.2	34.4,78.0	37.6,78.8	41.8,76.0	46.0,73.0
path	46.6,69.2	47.0,64.6	44.8,60.2
kill Durn The Hungerer##18411
|tip He patrols around Oshu'gun.
|tip This enemy is elite and may require a group.
Slay Durn The Hungerer |q 9938/1
step
talk Warden Moi'bff Jill##18408
|tip He walks around this area.
turnin Wanted: Durn the Hungerer##9938 |goto 54.74,70.88
step
label "Collect_Obsidian_Warbeads"
Kill Boulderfist enemies around this area
collect Obsidian Warbeads##25433 |n |goto 73.73,70.02
|tip Be careful not to accidentally sell these to a vendor.
You can find more around [75.30,63.65]
Click here to continue |confirm
step
talk Warden Moi'bff Jill##18408
|tip He walks around this area.
accept More Warbeads##10477 |goto 54.74,70.87
Click here to go back to Obsidian Warbead farming |next "Collect_Obsidian_Warbeads" |or
Reach Exalted with the Kurenai |complete rep('Kurenai')>=Exalted  |or
step
_Congratulations!_
You Earned Exalted with the Kurenai
]])
ZygorGuidesViewer:RegisterGuide("Reputations Guides\\The Burning Crusade\\The Consortium",{
author="support@zygorguides.com",
description="\nThis guide will walk you through becoming exalted with The Consortium faction.",
patch='30003',
},[[
step
talk Consortium Recruiter##18335
|tip Be careful to avoid the Horde guards nearby.
accept The Consortium Needs You!##9913 |goto Nagrand 51.94,34.78
step
kill Wild Elekk##18334+
|tip They look like elephants.
collect 3 Pair of Ivory Tusks##25463 |goto 71.29,47.09 |q 9914 |future
|tip Be careful not to accidentally sell these to a vendor.
You can find more around [65.37,47.19]
step
talk Shadrek##18333
accept A Head Full of Ivory##9914 |goto 31.8,56.8
step
talk Gezhe##18265
turnin The Consortium Needs You!##9913 |goto 31.4,57.8
accept Stealing from Thieves##9882 |goto 31.4,57.8
step
talk Zerid##18276
accept Gava'xi##9900 |goto 30.8,58.1
accept Matters of Security##9925 |goto 30.8,58.1
step
click Oshu'gun Crystal Fragment##182258+
|tip They look like green and white crystals on the ground around this area.
|tip These are the objective of a repeatable quest.
|tip Collect 10 at a time for turn-in purposes.
collect 10 Oshu'gun Crystal Fragment##25416 |q 9882/1 |goto 35.03,65.00
You can find more around [41.21,70.42]
|only if haveq(9882) or completedq(9882)
step
kill Voidspawn##17981+ |q 9925/1 |goto 36.2,65.5
You can find more around [37.9,66.1]
step
kill Gava'xi##18298 |q 9900/1 |goto 42.6,73.6
|tip He patrols around the area.
You can find more around [42.1,71.2]
step
talk Gezhe##18265
turnin Stealing from Thieves##9882 |goto 31.4,57.8
step
talk Zerid##18276
turnin Gava'xi##9900 |goto 30.8,58.1
turnin Matters of Security##9925 |goto 30.8,58.1
step
label "Friendly_Rep_Farm"
click Oshu'gun Crystal Fragment##182258
Kill Vir'aani enemies around this area
collect Oshu'gun Crystal Fragment##25416 |n |goto 34.0,63.4
|tip Collect them in stacks of 10.
Click here to continue |confirm
step
talk Gezhe##18265
accept More Crystal Fragments##9883 |goto 31.4,57.8 |or
Click here to continue |next "Friendly_Rep_Farm" |confirm |only if rep("The Consortium")<=Neutral
Reach "Friendly" reputation with The Consortium |complete rep('The Consortium')>=Friendly |or
step
talk Shadrek##18333
turnin A Head Full of Ivory##9914 |goto 31.8,56.8
step
talk Gezhe##18265
accept Membership Benefits##9886 |goto 31.4,57.8
accept Obsidian Warbeads##9893 |goto 31.4,57.8
step
Kill Boulderfist enemies around this area
collect 10 Obsidian Warbeads##25433 |q 9893/1 |goto 49.9,56.7
step
talk Gezhe##18265
turnin Obsidian Warbeads##9893 |goto 31.4,57.8
step
label "Collect_Obsidian_Warbeads"
Kill Boulderfist enemies around this area
collect Obsidian Warbeads##25433 |n |goto 49.9,56.7
|tip You need 10 beads per turn in.
|tip Each 10 Obsidian Warbeads will net 250 reputation.
Click here to continue |confirm
step
talk Gezhe##18265
accept More Obsidian Warbeads##9892 |goto 31.4,57.8 |or
Click here to continue farming Warbeads |next "Collect_Obsidian_Warbeads" |confirm |only if rep("The Consortium")<=Friendly
Reach "Honored" reputation with The Consortium |complete rep('The Consortium')>=Honored |or
step
talk Nether-Stalker Khay'ji##19880
accept Consortium Crystal Collection##10265 |goto Netherstorm 32.4,64.2
step
kill Pentatharon##20215
|tip Inside the broken building.
collect Arklon Crystal Artifact##28829 |q 10265/1 |goto 42.4,72.8
step
talk Nether-Stalker Khay'ji##19880
turnin Consortium Crystal Collection##10265 |goto 32.4,64.2
accept A Heap of Ethereals##10262 |goto 32.4,64.2
step
Kill Zaxxis enemies around this area
collect 10 Zaxxis Insignia##29209 |q 10262/1 |goto 30.2,75.5
step
talk Nether-Stalker Khay'ji##19880
turnin A Heap of Ethereals##10262 |goto 32.4,64.2
accept Warp-Raider Nesaad##10205 |goto 32.4,64.2
step
kill Warp-Raider Nesaad##19641 |q 10205/1 |goto 28.2,79.4
step
talk Nether-Stalker Khay'ji##19880
turnin Warp-Raider Nesaad##10205 |goto 32.4,64.2
accept Request for Assistance##10266 |goto 32.4,64.2
step
talk Gahruj##20066
turnin Request for Assistance##10266 |goto 46.7,56.9
accept Rightful Repossession##10267 |goto 46.7,56.9
accept Drijya Needs Your Help##10311 |goto 46.7,56.9
step
talk Mehrdad##20810
accept Run a Diagnostic!##10417 |goto 46.4,56.4
accept New Opportunities##10348 |goto 46.4,56.4
step
click Diagnostic Equipment##184589
|tip They look like upright tubes with purple energy flowing through them.
collect Diagnostic Results##29741 |q 10417/1 |goto 48.2,55.0
step
click Box Surveying Equipment##6881
|tip They look like small silverish boxes.
collect 10 Box of Surveying Equipment##28913 |q 10267/1 |goto 57.6,63.9
step
click Ivory Bell##184443
|tip They look like flowers with pinkish purple petals.
collect 15 Ivory Bell##29474 |q 10348/1 |goto 48.2,53.9
step
talk Mehrdad##20810
turnin New Opportunities##10348 |goto 46.4,56.4
turnin Run a Diagnostic!##10417 |goto 46.4,56.4
accept Deal With the Saboteurs##10418 |goto 46.4,56.4
step
kill 8 Barbscale Crocolisk##20773+ |q 10418/1 |goto 46.8,53.9
step
talk Mehrdad##20810
turnin Deal With the Saboteurs##10418 |goto 46.4,56.4
accept To the Stormspire##10423 |goto 46.4,56.4
step
talk Gahruj##20066
turnin Rightful Repossession##10267 |goto 46.7,56.9
accept An Audience with the Prince##10268 |goto 46.7,56.9
step
talk Drijya##20281
turnin Drijya Needs Your Help##10311 |goto 48.1,63.5
accept Sabotage the Warp-Gate!##10310 |goto 48.1,63.5
step
Escort Drijya
|tip He will stop at Warp-Gates to sabotage them multiple times.
|tip Protect him from enemies that attack.
Sabotage the Burning Legion Warp-Gates |q 10310/1
step
talk Gahruj##20066
turnin Sabotage the Warp-Gate!##10310 |goto 46.7,56.9
step
talk Ghabar##20811
turnin To the Stormspire##10423 |goto 43.5,35.1
accept Diagnosis: Critical##10424 |goto 43.5,35.1
step
talk Image of Nexus-Prince Haramad##20084
|tip Inside the building.
turnin An Audience with the Prince##10268 |goto 45.9,36.0
accept Triangulation Point One##10269 |goto 45.9,36.0
step
use the Diagnostic Device##29803
Collect the Diagnostic Results |q 10424/1 |goto 47.6,26.8
step
talk Ghabar##20811
turnin Diagnosis: Critical##10424 |goto 43.5,35.2
accept Testing the Prototype##10430 |goto 43.5,35.2
step
talk Tashar##20913
turnin Testing the Prototype##10430 |goto 44.7,14.6
accept All Clear!##10436 |goto 44.7,14.6
step
kill 12 Scythetooth Raptor##20634+ |q 10436/1 |goto 45.6,11.2
step
talk Tashar##20913
turnin All Clear!##10436 |goto 44.7,14.6
accept Success!##10440 |goto 44.7,14.6
step
talk Ghabar##20811
turnin Success!##10440 |goto 43.5,35.2
step
use the Triangulation Device##28962
|tip Follow the Red Arrow that appears.
Discover the first Triangulation Point |q 10269/1 |goto 66.8,34.8
step
talk Dealer Hazzin##20092
turnin Triangulation Point One##10269 |goto Netherstorm 58.3,31.3
accept Triangulation Point Two##10275 |goto 58.3,31.3
step
talk Wind Trader Marid##20071
accept A Not-So-Modest Proposal##10270 |goto 58.3,31.7
step
talk Flesh Handler Viridius##20450
accept Captain Tyralius##10422 |goto 59.2,32.1
step
talk Researcher Navuud##20449
accept Electro-Shock Goodness!##10411 |goto 59.2,32.6
step
talk Commander Ameer##20448
accept The Ethereum##10339 |goto 59.5,32.4
step
talk Professor Dabiri##20907
accept Recipe for Destruction##10437 |goto 60.1,31.7
stickystart "Kill_5_Ethereum_Shocktroopers"
stickystart "Kill_2_Ethereum_Researchers"
step
kill Captain Zovax##20727 |q 10339/4 |goto 57.1,36.5
|tip Walks around this area.
kill 5 Ethereum Assassin##20452+ |q 10339/1 |goto 57.1,36.5
step
label "Kill_5_Ethereum_Shocktroopers"
kill 5 Ethereum Shocktrooper##20453+ |q 10339/2 |goto 57.1,36.5
step
label "Kill_2_Ethereum_Researchers"
kill 2 Ethereum Researcher##20456+ |q 10339/3 |goto 57.1,36.5
step
Click Ethereum Transponder Zeta
talk Image of Commander Ameer##20482
turnin The Ethereum##10339 |goto 56.8,38.7
accept Ethereum Data##10384 |goto 56.8,38.7
stickystart "voidwasteglobule"
step
click Ethereum Data Cell##184560
|tip It looks like a small silver circle on the ground with green and red lights.
collect Ethereum Data Cell##29582 |q 10384/1 |goto 55.8,39.9
step
kill Warden Icoshock##20770+
collect The Warden's Key##29742 |q 10422 |goto 54.5,41.1
step
label "voidwasteglobule"
use Navuud's Concoction##29737
Gain the "Electro-Shock Therapy" Buff |havebuff spell:35685 |q 10411
|tip This buff lasts for 60 minutes.
kill 30 Void Waste Globule##20805+ |q 10411/2 |goto 55.2,42.8
step
Click Captain Tyralius's Prison
|tip It looks like a glowing pink orb.
Free Captain Tyralius |q 10422/1 |goto 53.3,41.5
step
Click the Ethereum Transponder Zeta
talk Image of Commander Ameer##20482
turnin Ethereum Data##10384 |goto 56.8,38.7
accept Potential for Brain Damage = High##10385 |goto 56.8,38.7
step
Kill Ethereum enemies around this area
collect Ethereum Essence##29482 |n
use the Ethereum Essence##29482
kill Ethereum Relay##20619+
collect 15 Ethereum Relay Data##29459 |q 10385/1 |goto 56.5,38.6
step
Click the Ethereum Transponder Zeta
talk Image of Commander Ameer##20482
turnin Potential for Brain Damage = High##10385 |goto 56.8,38.7
accept S-A-B-O-T-A-G-E##10405 |goto 56.8,38.7
step
Kill Ethereum enemies around this area
collect Prepared Ethereum Wrapping##29591 |q 10405/1 |goto 55.8,40.5
step
Click the Ethereum Transponder Zeta
talk Image of Commander Ameer##20482
turnin S-A-B-O-T-A-G-E##10405 |goto 56.8,38.7
accept Delivering the Message##10406 |goto 56.8,38.7
step
Escort the Ethereum Demolishinist
|tip He will stop to sabotage the Ethereum Conduit.
|tip Protect him from enemies that attack.
Sabotage Ethereum Conduit |q 10406/1 |goto 56.8,38.6
step
Click the Ethereum Transponder Zeta
talk Image of Commander Ameer##20482
turnin Delivering the Message##10406 |goto 56.8,38.7
step
Kill Ethereum enemies around this area
|tip This will cause the Ethereum Gladiator to spawn eventually.
kill Ethereum Gladiator##20854
|tip He will spawn at the same time as a Captured Protectorate Vanguard.
|tip You will need to kill him before the Captured Protectorate Vanguard dies.
talk Captured Protectorate Vanguard##20763
accept Escape from the Staging Grounds##10425 |goto 57.1,37.6
step
Follow the Captured Protectorate Vanguard
|tip Protect him from enemies as you follow.
Escort the Captured Protectorate Vanguard to saftey |q 10425/1
step
talk Commander Ameer##20448
turnin Escape from the Staging Grounds##10425 |goto 59.5,32.4
step
talk Flesh Handler Viridius##20450
turnin Captain Tyralius##10422 |goto 59.3,32.0
step
Kill Void enemies around this area
collect 8 Fragment of Dimensius##29822 |q 10437/1 |goto 62.5,34.7
step
use Navuud's Concoction##29737
Gain the "Electro-Shock Therapy" Buff |havebuff spell:35685 |q 10411
|tip This buff lasts for 60 minutes.
kill 30 Seeping Sludge Globule##20806+ |q 10411/1 |goto 59.5,39.9
step
talk Agent Araxes##20551
accept The Flesh Lies...##10345 |goto 59.4,45.0
stickystart "Burn_Withered_Corpses"
step
Enter the mine |goto 61.05,45.48 < 10 |walk
Follow the path |goto 60.98,44.51 < 7 |walk
Follow the down |goto 60.22,43.46 < 7 |walk
Follow the path |goto 59.75,42.56 < 7 |walk
talk Agent Ya-six##20552
|tip Inside the mine.
accept Arconus the Insatiable##10353 |goto 60.92,41.53
step
click Teleporter Power Pack##184075
|tip Inside the mine.
collect Teleporter Power Pack##28969 |q 10270/1 |goto 60.96,41.53
step
Follow the path up |goto 59.76,42.57 < 7 |walk
Continue up the path |goto 60.44,43.07 < 7 |walk
Continue up the path |goto 60.79,41.39 < 7 |walk
kill Arconus the Insatiable##20554 |q 10353/1 |goto 60.14,39.87
|tip He walks around this area.
|tip Inside the mine.
step
label "Burn_Withered_Corpses"
use the Protectorate Igniter##29473
|tip Use it on Withered Corpses.
|tip They look like dead blood elves on the ground inside the mine.
|tip If you get too close they will turn into fleshbeasts and attack you.
Burn #12# Withered Corpses |q 10345/1 |goto 60.14,39.87
step
Follow the path |goto 60.53,43.57 < 7 |walk
Leave the mine |goto 61.04,45.62 < 10 |walk
talk Agent Araxes##20551
turnin The Flesh Lies...##10345 |goto 59.42,45.04
step
talk Researcher Navuud##20449
turnin Electro-Shock Goodness!##10411 |goto 59.2,32.6
step
talk Commander Ameer##20448
turnin Arconus the Insatiable##10353 |goto 59.5,32.4
step
talk Professor Dabiri##20907
turnin Recipe for Destruction##10437 |goto 60.1,31.7
accept On Nethery Wings##10438 |goto 60.1,31.7
step
talk Protectorate Nether Drake##20903
Tell him _"I'm ready to fly! Take me up, dragon!"_
Begin Flying with the Nether Drake |ontaxi |goto 60.21,31.76 |q 10438
step
use the Phase Disruptor##29778
|tip Use it while flying around the Void Conduit.
|tip It's at the top of Manaforge Ultris.
Destroy the Void Conduit |q 10438/1 |goto 62.45,40.90 |notravel
step
Return to the Ground |offtaxi |goto 60.10,31.99 |q 10438 |notravel
step
talk Professor Dabiri##20907
turnin On Nethery Wings##10438 |goto 60.1,31.7
accept Dimensius the All-Devouring##10439 |goto 60.1,31.7
step
talk Captain Saeed##20985
Tell him "Let's go!"
Speak to Captain Saeed |q 10439/2 |goto 60.6,32.1
step
Follow Captain Saeed
talk Captain Saeed##20985
Tell him "I am ready."
kill Dimensius the All-Devouring##19554 |q 10439/1 |goto 60.8,39.3 < 10
step
talk Professor Dabiri##20907
turnin Dimensius the All-Devouring##10439 |goto 60.1,31.7
step
Click the Ethereum Transponder Zeta
talk Image of Commander Ameer##20482
accept Nexus-King Salhadaar##10408 |goto 56.8,38.7
step
use the Protectorate Disruptor##29618
kill Nexus-King Salhadaar##20454+ |q 10408/1 |goto 53.7,42.4
step
Click the Ethereum Transponder Zeta
talk Image of Commander Ameer##20482
turnin Nexus-King Salhadaar##10408 |goto 56.8,38.7
step
talk Zuben Elgenubi##20067
accept In Search of Farahlite##10290 |goto 44.1,36.1
step
click Ethereum Transponder Zeta
Choose _"Attempt to contact Wind Trader Marid."_
talk Image of Wind Trader Marid##20518
turnin A Not-So-Modest Proposal##10270 |goto 71.1,39.0
step
Ride the elevator down |goto 42.55,33.57 < 10 |only if walking
Follow the road |goto 39.09,30.79 < 70 |only if walking
Cross the bridge |goto 33.62,37.77 < 20 |only if walking
Follow the path up |goto 29.58,41.34 < 15 |only if walking
use the Triangulation Device##29018
|tip Your character will automatically be faced in the direction you need to go.
|tip Run in the direction you become faced until the item is no longer on cooldown.
|tip After the the item completes its cooldown, the quest goal should complete.
Discover the Second Triangulation Point |q 10275/1 |goto 29.05,40.45
step
talk Wind Trader Tuluman##20112
turnin Triangulation Point Two##10275 |goto 34.6,38.0
accept Full Triangle##10276 |goto 34.6,38.0
step
kill Farahlon Breaker##18886+
collect 4 Raw Farahlite##29163 |q 10290/1 |goto 44.5,21.6
step
talk Zuben Elgenubi##20067
turnin In Search of Farahlite##10290 |goto 44.0,36.0
step
kill Culuthas##20138
|tip This enemy is elite and may require a group.
collect Ata'mal Crystal##29026 |q 10276/1 |goto 53.6,21.6
step
talk Image of Nexus-Prince Haramad##20084
turnin Full Triangle##10276 |goto 45.9,36.0
step
talk Zephyrion##20470
accept Surveying the Ruins##10335 |goto 44.7,34.9
step
talk Nether-Stalker Nauthis##20471
accept The Minions of Culuthas##10336 |goto 44.7,34.9
accept Fel Reavers, No Thanks!##10855 |goto 44.7,34.9
step
kill Gan'arg Mekgineer##16949+
collect 5 Condensed Nether Gas##31653 |q 10855 |goto 39.1,28.9
step
talk Inactive Fel Reaver##22293
|tip Complete the "Nether Gas In a Fel Fire Engine" repeatable quest.
Watch the dialogue
Destroy the Inactive Fel Reaver |q 10855/1 |goto 35.86,28.84
stickystart "Kill_Hounds_Of_Culuthas"
stickystart "Kill_Eyes_Of_Culuthas"
step
Follow the road |goto 48.65,22.64 < 30 |only if walking
use the Surveying Markers##29445
Place Surveying Marker One |q 10335/1 |goto 51.66,20.49
step
Follow the road |goto 51.78,23.57 < 30 |only if walking
Continue following the road |goto 56.56,24.14 < 30 |only if walking
use the Surveying Markers##29445
Place Surveying Marker Three |q 10335/3 |goto 55.81,19.93
step
use the Surveying Markers##29445
Place Surveying Marker Two |q 10335/2 |goto 54.56,22.82
step
label "Kill_Hounds_Of_Culuthas"
kill 10 Hound of Culuthas##20141 |q 10336/1 |goto 54.56,22.82
step
label "Kill_Eyes_Of_Culuthas"
kill 5 Eye of Culuthas##20394 |q 10336/2 |goto 54.56,22.82
step
talk Zephyrion##20470
turnin Surveying the Ruins##10335 |goto 44.7,34.9
step
talk Nether-Stalker Nauthis##20471
turnin The Minions of Culuthas##10336 |goto 44.7,34.9
turnin Fel Reavers, No Thanks!##10855 |goto 44.7,34.9
accept The Best Defense##10856 |goto 44.7,34.9
step
kill 12 Wrathbringer##18858+ |q 10856/1 |goto 41.9,23.6
step
talk Nether-Stalker Nauthis##20471
turnin The Best Defense##10856 |goto 44.7,34.9
accept Teleport This!##10857 |goto 44.7,34.9
step
Ride the elevator down |goto 42.55,33.57 < 10 |only if walking
use the Mental Interference Rod##31678
|tip Use it on a Cyber-Rage Forgelord around this area.
|tip You can't have any other pet active while doing this.
Destroy the Western Teleporter |q 10857/1 |goto 39.18,20.43
|tip Use the "Detonate Teleporter" ability on your action bar near this structure.
step
use the Mental Interference Rod##31678
|tip Use it on a Cyber-Rage Forgelord around this area.
|tip You can't have any other pet active while doing this.
Destroy the Central Teleporter |q 10857/2 |goto 41.08,19.42
|tip Use the "Detonate Teleporter" ability on your action bar near this structure.
step
use the Mental Interference Rod##31678
|tip Use it on a Cyber-Rage Forgelord around this area.
|tip You can't have any other pet active while doing this.
Destroy the Eastern Teleporter |q 10857/3 |goto 42.28,21.07
|tip Use the "Detonate Teleporter" ability on your action bar near this structure.
step
talk Nether-Stalker Nauthis##20471
turnin Teleport This!##10857 |goto 44.7,34.9
step
talk Commander Ameer##20448
accept A Mission of Mercy##10970 |goto 59.5,32.4
step
Kill enemies around here
collect Salvaged Ethereum Prison Key##31956 |q 10970/1 |goto 56.6,37.7
step
talk Commander Ameer##20448
turnin A Mission of Mercy##10970 |goto 59.5,32.4
step
talk Commander Ameer##20448
turnin A Mission of Mercy##10970 |goto 59.5,32.4
accept Ethereum Secrets##10971 |goto 59.5,32.4
step
Kill Ethereum enemies around here
collect Ethereum Prison Key##29460 |goto 56.6,37.7
|tip This has a low drop rate.
step
click Ethereum Prison##7183
|tip Kill whatever attacks you.
collect Ethereum Prisoner I.D. Tag##31957 |q 10971/1 |goto Netherstorm 54.7,46.2
step
talk Commander Ameer##20448
turnin Ethereum Secrets##10971 |goto 59.5,32.4
step
label "Rep_Grind"
From here, you will need to grind for reputation
|tip You can run Heroic Mana-Tombs and kill every mob in the instance.
Click here to farm "Obsidian Warbeads" |confirm |next "Post_Quest_Warbeads"
Click here to farm "Zaxxis Insignias" |confirm |next "Zaxxis Insignia"
Click here to farm "Ethereum Prisoner I.D.'s" |confirm
Earn Exalted status with The Consortium |complete rep('The Consortium')==Exalted |next "Exalted"
step
label "Ethereum_Prisoner_ID"
talk Commander Ameer##20448
accept Ethereum Prisoner I.D. Catalogue##10972 |goto 59.5,32.4
step
Kill Ethereum enemies around this area
collect Ethereum Prison Key##29460 |goto 56.6,37.7
|tip These have a low drop rate.
|tip You can also buy them from the Auction House.
step
click Ethereum Prison##7183
|tip If an enemy appers, kill it.
collect Ethereum Prisoner I.D. Tag##31957 |q 10972/1 |goto 54.7,46.2
step
talk Commander Ameer##20448
turnin Ethereum Prisoner I.D. Catalogue##10972 |goto 59.5,32.4
step
Click here to continue farming keys |confirm |next "Ethereum_Prisoner_ID" |or
Click here to return to the grind step |confirm |next "Rep_Grind" |or
Earn Exalted status with The Consortium |complete rep('The Consortium')==Exalted |next "Exalted" |or
step
label "Zaxxis Insignia"
Kill Enemies around this area
collect Zaxxis Insignia##29209+ |n |goto Netherstorm 30.8,75.0
|tip Collect them in multiples of 10.
|tip Every 10 nets 250 rep.
Click here to continue |confirm |complete rep('The Consortium')==Exalted |next "Exalted"
step
talk Nether-Stalker Khay'ji##19880
accept Another Heap of Ethereals##10308 |goto 32.4,64.2
step
Click here to continue farming Zaxxis Insignis |confirm |next "Zaxxis Insignia" |or
Click here to return to the grind step |confirm |next "Rep_Grind" |or
Earn Exalted status with The Consortium |complete rep('The Consortium')==Exalted |next "Exalted" |or
step
label "Post_Quest_Warbeads"
Kill Boulderfist enemies around this area
collect Obsidian Warbeads##25433 |n |goto Nagrand 49.9,56.7
|tip Collect them in multiples of 10.
|tip Every 10 nets 250 rep.
Click here to continue |confirm |complete rep('The Consortium')==Exalted |next "Exalted"
step
talk Gezhe##18265
accept More Obsidian Warbeads##9892 |goto Nagrand 31.4,57.8
step
Click here to continue farming Obsidian Warbeads |confirm |next "Post_Quest_Warbeads" |or
Click here to return to the grind step |confirm |next "Rep_Grind" |or
Earn Exalted status with The Consortium |complete rep('The Consortium')==Exalted |or
step
label "Exalted"
_Congratulations!_
You Earned Exalted with The Consortium
]])
ZGV.BETAEND()
ZygorGuidesViewer:RegisterGuide("Reputation Guides\\The Burning Crusade\\Ogri'la",{
author="support@zygorguides.com",
condition_suggested=function() return level >= 70 and not completedq(11026) end,
condition_end=function() return rep("Ogri'la") == Exalted and completedq(11026) end,
},[[
step
Train Artisan Riding |complete skill("Riding") >= 225
|tip Flying is required to complete this questline.
step
talk V'eru##22497
|tip Upstairs inside the building.
accept Speak with the Ogre##10984 |goto Shattrath City 56.5,49.1
step
talk Grok##22940
turnin Speak with the Ogre##10984 |goto 64.9,68.1
accept Mog'dorg the Wizened##10983 |goto 64.9,68.1
step
talk Mog'dorg the Wizened##22941
|tip At the top of the tower.
turnin Mog'dorg the Wizened##10983 |goto Blade's Edge Mountains/0 55.48,44.86
accept Grulloc Has Two Skulls##10995 |goto 55.48,44.86
accept Maggoc's Treasure Chest##10996 |goto 55.48,44.86
accept Even Gronn Have Standards##10997 |goto 55.48,44.86
step
kill Grulloc##20216
|tip This enemy is elite and will require a group.
click Grulloc's Dragon Skull##185567
|tip It appears after Grulloc dies.
collect 1 Grulloc's Dragon Skull##32379 |q 10995/1 |goto 60.9,47.6
step
map Blade's Edge Mountains/0
path follow loose; curved; dist 30
path	59.3,64.7	59.6,56.8	65.0,54.1
path	67.5,58.5	68.4,65.8	68.4,73.7
kill Maggoc##20600
|tip This enemy is elite and will require a group.
|tip Follow the path to find Maggoc.
click Maggoc's Treasure Chest##185569
|tip It appears after Maggoc dies.
collect 1 Maggoc's Treasure Chest##32380 |q 10996/1
step
kill Slaag##22199
|tip This enemy is elite and will require a group.
click Slaag's Standard##185574
|tip It appears after Slaag dies.
collect 1 Slaag's Standard##32382 |q 10997/1 |goto Terokkar Forest/0 20.3,17.5
step
talk Mog'dorg the Wizened##22941
|tip At the top of the tower.
turnin Grulloc Has Two Skulls##10995 |goto Blade's Edge Mountains/0 55.48,44.86
turnin Maggoc's Treasure Chest##10996 |goto 55.48,44.86
turnin Even Gronn Have Standards##10997 |goto 55.48,44.86
accept Grim(oire) Business##10998 |goto 55.48,44.86
step
kill Vim'gol the Vile##22911
|tip This enemy is elite and will require a group.
|tip Stand in the fire until Vim'gol the Vile spawns.
click Vim'gol's Vile Grimoire##185562
|tip It appears after Vim'gol dies.
collect 1 Vim'gol's Vile Grimoire##32358 |q 10998/1 |goto 77.54,31.20
step
talk Mog'dorg the Wizened##22941
|tip At the top of the tower.
turnin Grim(oire) Business##10998 |goto 55.48,44.86
accept Into the Soulgrinder##11000 |goto 55.48,44.86
step
use Vim'gol's Grimoire##32467
|tip Kill adds that attack in waves, defending the Soulgrinder.
kill Skulloc Soulgrinder##22910
|tip This enemy is elite and will require a group.
click Skulloc's Soul##185577
|tip It appears after Skulloc dies.
collect 1 Skulloc's Soul##32383 |q 11000/1 |goto 60.00,24.15
step
talk Mog'dorg the Wizened##22941
|tip At the top of the tower.
turnin Into the Soulgrinder##11000 |goto 55.48,44.86
step
talk Bladespire Supplicant##23053
accept Speak with Mog'dorg##11022 |goto 55.96,45.82
step
talk Mog'dorg the Wizened##22941
|tip At the top of the tower.
turnin Speak with Mog'dorg##11022 |goto 55.48,44.86
accept Ogre Heaven##11009 |goto 55.48,44.86
step
talk Chu'a'lor##23233
turnin Ogre Heaven##11009 |goto 28.76,57.37
accept The Crystals##11025 |goto 28.76,57.37
step
kill Apexis Flayer##22175+
click Apexis Shard Formation##185911+
|tip They look like large clusters of crystals on the ground around this area.
collect 5 Apexis Shard##32569 |q 11025/1 |goto 29.85,64.49
step
talk Chu'a'lor##23233
turnin The Crystals##11025 |goto 28.76,57.37
accept An Apexis Relic##11058 |goto 28.76,57.37
step
talk Torkus##23316
accept Our Boy Wants To Be A Skyguard Ranger##11030 |goto 28.38,57.65
step
kill Apexis Flayer##22175+
click Apexis Shard Formation##185911+
|tip They look like large clusters of crystals on the ground around this area.
collect Apexis Shard##32569 |q 11058 |goto 29.85,64.49
step
click Apexis Relic
|tip It looks like a small floating crystal hovering over a white orb on the ground.
Choose: _<Insert an Apexis Shard, and begin!>_
Repeat the color patterns that are shown
|tip Ignore the floating crystal and focus on the crystals on the ground.
|tip Observe the color sequence and click the stones on the ground in the same order.
|tip It's random every time, and you'll have to repeat 8 sequences.
Attain the Apexis Vibrations |q 11058/1 |goto 32.06,63.35
|tip If you fail, you will need to farm another Apexis Shard.
You can find more around [29.85,64.49]
step
talk Chu'a'lor##23233
turnin An Apexis Relic##11058 |goto 28.76,57.37
step
kill Apexis Flayer##22175+
click Apexis Shard Formation##185911
|tip They look like large clusters of crystals on the ground around this area.
collect 10 Apexis Shard##32569 |q 11030 |goto 31.2,52.2
step
click Fel Crystalforge##7392
|tip It looks like a metal machine with green bubbles floating out of it.
Choose: _<Purchase 1 Unstable Flask of the Beast for the cost of 10 Apexis Shards>_
collect Unstable Flask of the Beast##32598 |q 11030/1 |goto 32.79,40.47
step
talk Torkus##23316
turnin Our Boy Wants To Be A Skyguard Ranger##11030 |goto 28.38,57.65
accept A Father's Duty##11061 |goto 28.38,57.65
step
talk Chu'a'lor##23233
accept The Skyguard Outpost##11062 |goto 28.76,57.37
step
talk Sky Commander Keller##23334
turnin The Skyguard Outpost##11062 |goto 27.40,52.69
step
talk Sky Sergeant Vanderlip##23120
accept Bombing Run##11010 |goto 27.57,52.91 |only if not raceclass("Druid")
accept Bombing Run##11102 |goto 27.57,52.91 |only if raceclass("Druid")
step
use the Skyguard Bombs##32456
|tip Use them on Fel Cannonball Stacks.
|tip They look like piles of gray stones on the ground around this area.
|tip They can only be used while on a flying mount.
|tip Fel Cannons will try to shoot you down while flying.
|tip Mount up on the ground near a Fel Cannonball Stack and immediately use the bombs on the stack.
|tip This will dismount you quickly before a cannon can fire at you.
Destroy #15# Fel Cannonball Stacks |q 11010/1 |goto 33.3,44.0 |only if not raceclass("Druid")
Destroy #15# Fel Cannonball Stacks |q 11102/1 |goto 33.3,44.0 |only if raceclass("Druid")
step
talk Sky Sergeant Vanderlip##23120
turnin Bombing Run##11010 |goto 27.57,52.91 |only if not raceclass("Druid")
turnin Bombing Run##11102 |goto 27.57,52.91 |only if raceclass("Druid")
step
talk Sky Commander Keller##23334
accept Assault on Bash'ir Landing!##11119 |goto 27.40,52.69
step
talk Aether-tech Apprentice##23473
turnin Assault on Bash'ir Landing!##11119 |goto 27.90,52.17
step
talk Skyguard Khatie##23335
accept Wrangle Some Aether Rays!##11065 |goto 27.95,51.45
step
kill Aether Ray##22181+
use the Wrangling Rope##32698
|tip Use it on weakened Aether Rays around this area.
|tip Reduce their health until you see a message indicating they can be wrangled.
|tip If you are well-geared, you may need to unequip some of your gear to avoid killing them.
Wrangle #5# Aether Rays |q 11065/1 |goto 31.6,56.4
step
talk Chu'a'lor##23233
accept Guardian of the Monument##11059 |goto 28.76,57.37
|tip This quest is elite and will require a group.
step
kill Apexis Flayer##22175+
click Apexis Shard Formation##185911
|tip They look like large clusters of crystals on the ground around this area.
collect 35 Apexis Shard##32569 |q 11059 |goto 31.2,52.2
step
click Apexis Monument##185944
|tip It's a huge floating crystal with alternating colors in the middle of the platform.
Choose _<Insert 35 Apexis Shards, and begin!>_
Click any of the 4 big colored buttons on the ground
|tip Only do this if you have good gear.
|tip You will get hit for 7,000 damage each time.
|tip This will make the quest mob spawn faster.
kill Apexis Guardian##22275
|tip It will eventually spawn.
|tip This enemy is elite and will require a group.
collect Apexis Guardian's Head##32697 |q 11059/1 |goto 31.8,63.8
step
talk Chu'a'lor##23233
turnin Guardian of the Monument##11059 |goto 28.76,57.37
step
talk Skyguard Khatie##23335
turnin Wrangle Some Aether Rays!##11065 |goto 27.95,51.45
step
talk Sky Commander Keller##23334
accept To Rule The Skies##11078 |goto 27.40,52.69
step
kill Apexis Flayer##22175+
click Apexis Shard Formation##185911
|tip They look like large clusters of crystals on the ground around this area.
collect 35 Apexis Shard##32569 |q 11078 |goto 31.2,52.2
step
click Rivendark's Egg##185936
Choose _Place 35 Apexis Shards near the dragon egg to crack it open._
Kill the dragon that attacks
collect Dragon Teeth##32732 |q 11078/1 |goto 27.2,64.8
step
kill Apexis Flayer##22175+
click Apexis Shard Formation##185911
|tip They look like large clusters of crystals on the ground around this area.
collect 10 Apexis Shard##32569 |q 11061 |goto 31.2,52.2
step
talk Sky Commander Keller##23334
turnin To Rule The Skies##11078 |goto 27.40,52.69
step
click the Bash'ir Crystalforge##7392
Choose _<Purchase 1 Unstable Flask of the Sorcerer for the cost of 10 Apexis Shards>_
collect Unstable Flask of the Sorcerer##32601 |q 11061/1 |goto 54.4,10.8
step
talk Torkus##23316
turnin A Father's Duty##11061 |goto 28.4,57.6
step
talk Gahk##23300
accept A Fel Whip For Gahk##11079 |goto 28.5,58.1
|tip This quest is elite and will require a group.
step
kill Apexis Flayer##22175+
click Apexis Shard Formation##185911
|tip They look like large clusters of crystals on the ground around this area.
collect 35 Apexis Shard##32569 |q 11079 |goto 31.2,52.2
step
click Fel Crystal Prism##185927
|tip It's a big green crystal floating in green smoke above 4 metal vents.
Choose _Place 35 Apexis Shards into the prism._
Kill the demon that spawns
|tip This enemy is elite and will require a group.
collect Fel Whip##32733 |q 11079/1 |goto 33.9,44.2
step
talk Gahk##23300
turnin A Fel Whip For Gahk##11079 |goto 28.5,58.1
step
Reach Friendly Reputation with Ogri'la |complete rep("Ogri'la") >= Friendly
|tip Use the "Ogri'la Daily Quests" guide to accomplish this.
step
talk Chu'a'lor##23233
accept A Special Thank You##11091 |goto 28.76,57.37
step
talk Jho'nass##23428
turnin A Special Thank You##11091 |goto 27.99,58.86
step
Reach Honored Reputation with Ogri'la |complete rep("Ogri'la") >= Honored
|tip Use the "Ogri'la Daily Quests" guide to accomplish this.
step
talk Kronk##23253
accept Banish the Demons##11026 |goto 28.89,57.92
step
use the Banishing Crystal##32696
Kill enemies around this area
|tip Kill Fear Fiends and Abyssal Flamebringers that spawn near the portal that opens.
Banish #15# Demons |q 11026/1 |goto 29.1,79.3
step
talk Kronk##23253
turnin Banish the Demons##11026 |goto 28.89,57.92
step
Reach Exalted Reputation with Ogri'la |complete rep("Ogri'la") >= Exalted
|tip Use the "Ogri'la Daily Quests" guide to accomplish this.
step
_Congratulations!_
You Earned Exalted Reputation with Ogri'la
]])
ZygorGuidesViewer:RegisterGuide("Reputation Guides\\The Burning Crusade\\Sha'tari Skyguard",{
author="support@zygorguides.com",
description="\nThis guide section will walk you through completing the Sha'tari Skyguard prerequisite quests.",
condition_end=function() return rep("Sha'tari Skyguard") == Exalted and completedq(11026) end,
},[[
step
Train Artisan Flying |complete skill("Riding") >= 225
|tip Flying is required to complete this questline.
step
talk Yuula##23449
accept Threat from Above##11096 |goto Shattrath City 64.3,42.3
step
Kill Gordunni enemies around this area
Slay #20# Gordunni Ogres |q 11096/1 |goto Terokkar Forest 21.8,16.1
You can find more around [24.4,8.9]
step
talk Yuula##23449
turnin Threat from Above##11096 |goto Shattrath City 64.3,42.3
accept To Skettis!##11098 |goto Shattrath City 64.3,42.3
step
talk Sky Sergeant Doryn##23048
turnin To Skettis!##11098 |goto Terokkar Forest 64.5,66.7
step
talk Skyguard Handler Deesak##23415
accept Hungry Nether Rays##11093 |goto 63.5,65.8
step
talk Severin##23042
accept World of Shadows##11004 |goto 64.0,66.9
step
use the Nether Ray Cage##32834
|tip Keep your Nether Ray out while killing Warp Chasers and wait until it is done eating before you kill another.
kill Blackwind Warp Chaser##23219+
Provide the Nether Ray #10# Meals |q 11093/1 |goto 61.4,81.8
You can find more around [64.5,84.4]
step
Kill Skettis enemies around this area
collect 6 Shadow Dust##32388 |q 11004/1 |goto Terokkar Forest 61.6,75.3
You can find more around:
[69.5,85.5]
[73.2,87.9]
[75.2,81.3]
[69.2,74.1]
step
talk Severin##23042
turnin World of Shadows##11004 |goto Terokkar Forest 64.0,66.9
step
talk Skyguard Handler Deesak##23415
turnin Hungry Nether Rays##11093 |goto 63.5,65.8
step
Watch the dialogue
talk Sky Commander Adaris##23038
accept Secrets of the Talonpriests##11005 |goto 64.1,66.9
step
use the Elixir of Shadows##32446
Gain the Elixir of Shadows Buff |havebuff spell:37678 |goto 69.7,74.7
step
kill Talonpriest Zellek##23068 |q 11005/3 |goto 70.1,74.5
step
kill Talonpriest Ishaal##23066 |q 11005/1 |goto 69.3,78.1
step
collect Ishaal's Almanac##32523 |goto 69.3,78.1 |q 11021 |future
|tip Loot it from Talonpriest Ishaal's corpse.
step
use Ishaal's Almanac##32523
accept Ishaal's Almanac##11021 |goto 69.3,78.1
step
kill Talonpriest Skizzik##23067+ |q 11005/2 |goto 69.8,81.8
step
talk Sky Commander Adaris##23038
turnin Secrets of the Talonpriests##11005 |goto 64.1,66.9
turnin Ishaal's Almanac##11021 |goto 64.1,66.9
accept An Ally in Lower City##11024 |goto 64.1,66.9
step
talk Rilak the Redeemed##22292
turnin An Ally in Lower City##11024 |goto Shattrath City 52.5,21.0
accept Countdown to Doom##11028 |goto 52.5,21.0
step
talk Nutral##18940
turnin Countdown to Doom##11028 |goto Terokkar Forest 64.1,66.9
step
talk Hazzik##23306
accept Hazzik's Bargain##11056 |goto 64.2,66.9
step
click Hazzik's Package##185954
|tip Inside the building.
collect Hazzik's Package##32687 |q 11056/1 |goto 74.8,80.1
step
talk Hazzik##23306
turnin Hazzik's Bargain##11056 |goto 64.3,66.9
accept A Shabby Disguise##11029 |goto 64.3,66.9
step
use the Shabby Arakkoa Disguise##32741
Wear the Shabby Arakkoa Disguise |havebuff spell:41181 |goto 66.2,77.5
step
talk Sahaak##23363
buy 1 Adversarial Bloodlines##32742 |goto 67.0,79.7 |q 11029
step
talk Hazzik##23306
turnin A Shabby Disguise##11029 |goto 64.3,66.9
accept Adversarial Blood##11885 |goto 64.3,66.9
step
Kill Skettis enemies around this area
collect 12 Shadow Dust##32388 |goto Terokkar Forest 61.6,75.3 |q 11885
You can find more around:
Location 1: |goto 69.5,85.5
Location 2: |goto 73.2,87.9
Location 3: |goto 75.2,81.3
Location 4: |goto 69.2,74.1
step
talk Severin##23042
accept More Shadow Dust##11006 |n
collect 2 Elixir of Shadows##32446 |goto 64.0,66.9 |q 11885
step
use the Elixir of Shadows##32446
Gain the Elixir of Shadows Buff |havebuff spell:37678 |q 11885
step
Kill Time-Lost Skettis enemies around this area
collect 40 Time-Lost Scroll##32620 |goto Terokkar Forest 61.6,75.3 |q 11885
|tip You can also buy them from the Auction House.
You can find more around:
[69.5,85.5]
[73.2,87.9]
[75.2,81.3]
[69.2,74.1]
step
click Skull Pile##185913
|tip This will consume 10 Time-Lost Scrolls.
Choose _<Call forth Gezzarak the Huntress.>_
kill Gezzarak the Huntress##23163 |q 11885/3 |goto 69.7,74.7
|tip This enemy is elite and may require a group.
You can find more around:
[70.1,79.5]
[73.5,80.7]
[70.2,83.3]
step
collect Gezzarak's Claws##32716
|tip Loot it from Gezzarak the Huntress' corpse.
step
click Skull Pile##185913
|tip This will consume 10 Time-Lost Scrolls.
Choose _<Call forth Darkscreecher Akkarai.>_
kill Darkscreecher Akkarai##23161 |q 11885/1 |goto 69.7,74.7
|tip This enemy is elite and may require a group.
You can find more around:
[70.1,79.5]
[73.5,80.7]
[70.2,83.3]
step
collect Akkarai's Talons##32715
|tip Loot it from Darkscreecher Akkarai's corpse.
step
click Skull Pile##185913
|tip This will consume 10 Time-Lost Scrolls.
Choose _<Call forth Karrog.>_
kill Karrog##23165 |q 11885/2 |goto 69.7,74.7
|tip This enemy is elite and may require a group.
You can find more around:
[70.1,79.5]
[73.5,80.7]
[70.2,83.3]
step
collect Karrog's Spine##32717
|tip Loot it from Karrog's corpse.
step
click Skull Pile##185913
|tip This will consume 10 Time-Lost Scrolls.
Choose _<Call forth Vakkiz the Windrager.>_
kill Vakkiz the Windrager##23204 |q 11885/4 |goto 69.7,74.7
|tip This enemy is elite and may require a group.
You can find more around:
[70.1,79.5]
[73.5,80.7]
[70.2,83.3]
step
collect Vakkiz's Scale##32718
|tip Loot it from Vakkiz the Windrager's corpse.
step
talk Hazzik##23306
turnin Adversarial Blood##11885 |goto 64.2,66.9
step
talk Hazzik##23306
accept Tokens of the Descendants##11074 |goto 64.2,66.9
step
talk Sky Commander Adaris##23038
accept Terokk's Downfall##11073 |goto 64.1,66.9
step
click Skull Pile##185913
|tip This will consume 1 Time-Lost Offering.
Choose _<Call forth Terokk.>_
kill Terokk##21838 |q 11073/1 |goto 66.2,77.5
|tip When he becomes immune, walk him over the blue smoke.
|tip A meteor will come down and break his shield.
|tip Killing Terokk will gain you 500 reputation with Ska'tari Skyguard.
step
talk Sky Commander Adaris##23038
turnin Terokk's Downfall##11073 |goto 64.1,66.9
step
talk V'eru##22497
accept Speak with the Ogre##10984 |goto Shattrath City 56.5,49.1
step
talk Grok##22940
turnin Speak with the Ogre##10984 |goto 64.9,68.1
accept Mog'dorg the Wizened##10983 |goto 64.9,68.1
step
talk Mog'dorg the Wizened##22941
|tip At the top of the tower.
turnin Mog'dorg the Wizened##10983 |goto Blade's Edge Mountains/0 55.48,44.86
accept Grulloc Has Two Skulls##10995 |goto 55.48,44.86
accept Maggoc's Treasure Chest##10996 |goto 55.48,44.86
accept Even Gronn Have Standards##10997 |goto 55.48,44.86
step
kill Grulloc##20216
|tip This enemy is elite and will require a group.
click Grulloc's Dragon Skull##185567
|tip It appears after Grulloc dies.
collect 1 Grulloc's Dragon Skull##32379 |q 10995/1 |goto 60.9,47.6
step
map Blade's Edge Mountains/0
path follow loose; curved; dist 30
path	59.3,64.7	59.6,56.8	65.0,54.1
path	67.5,58.5	68.4,65.8	68.4,73.7
kill Maggoc##20600
|tip This enemy is elite and will require a group.
|tip Follow the path to find Maggoc.
click Maggoc's Treasure Chest##185569
|tip It appears after Maggoc dies.
collect 1 Maggoc's Treasure Chest##32380 |q 10996/1
step
kill Slaag##22199
|tip This enemy is elite and will require a group.
click Slaag's Standard##185574
|tip It appears after Slaag dies.
collect 1 Slaag's Standard##32382 |q 10997/1 |goto Terokkar Forest/0 20.3,17.5
step
talk Mog'dorg the Wizened##22941
|tip At the top of the tower.
turnin Grulloc Has Two Skulls##10995 |goto Blade's Edge Mountains/0 55.48,44.86
turnin Maggoc's Treasure Chest##10996 |goto 55.48,44.86
turnin Even Gronn Have Standards##10997 |goto 55.48,44.86
accept Grim(oire) Business##10998 |goto 55.48,44.86
step
kill Vim'gol the Vile##22911
|tip This enemy is elite and will require a group.
|tip Stand in the fire until Vim'gol the Vile spawns.
click Vim'gol's Vile Grimoire##185562
|tip It appears after Vim'gol dies.
collect 1 Vim'gol's Vile Grimoire##32358 |q 10998/1 |goto 77.3,31.8
step
talk Mog'dorg the Wizened##22941
|tip At the top of the tower.
turnin Grim(oire) Business##10998 |goto 55.48,44.86
accept Into the Soulgrinder##11000 |goto 55.48,44.86
step
use Vim'gol's Grimoire##32467
|tip Kill adds that attack in waves, defending the Soulgrinder.
kill Skulloc Soulgrinder##22910
|tip This enemy is elite and will require a group.
click Skulloc's Soul##185577
|tip It appears after Skulloc dies.
collect 1 Skulloc's Soul##32383 |q 11000/1 |goto 60.0,24.1
step
talk Mog'dorg the Wizened##22941
|tip At the top of the tower.
turnin Into the Soulgrinder##11000 |goto 55.48,44.86
step
talk Bladespire Supplicant##23053
accept Speak with Mog'dorg##11022 |goto 55.96,45.82
step
talk Mog'dorg the Wizened##22941
|tip At the top of the tower.
turnin Speak with Mog'dorg##11022 |goto 55.48,44.86
accept Ogre Heaven##11009 |goto 55.48,44.86
step
talk Chu'a'lor##23233
turnin Ogre Heaven##11009 |goto 28.76,57.37
accept The Crystals##11025 |goto 28.76,57.37
step
kill Apexis Flayer##22175+
click Apexis Shard Formation##185911+
|tip They look like large clusters of crystals on the ground around this area.
collect 5 Apexis Shard##32569 |q 11025/1 |goto 29.85,64.49
step
talk Chu'a'lor##23233
turnin The Crystals##11025 |goto 28.76,57.37
accept An Apexis Relic##11058 |goto 28.76,57.37
step
talk Torkus##23316
accept Our Boy Wants To Be A Skyguard Ranger##11030 |goto 28.38,57.65
step
kill Apexis Flayer##22175+
click Apexis Shard Formation##185911+
|tip They look like large clusters of crystals on the ground around this area.
collect Apexis Shard##32569 |q 11058 |goto 29.85,64.49
step
click Apexis Relic
|tip It looks like a small floating crystal hovering over a white orb on the ground.
Choose: _<Insert an Apexis Shard, and begin!>_
Repeat the color patterns that are shown
|tip Ignore the floating crystal and focus on the crystals on the ground.
|tip Observe the color sequence and click the stones on the ground in the same order.
|tip It's random every time, and you'll have to repeat 8 sequences.
Attain the Apexis Vibrations |q 11058/1 |goto 32.06,63.35
|tip If you fail, you will need to farm another Apexis Shard.
You can find more around [29.85,64.49]
step
talk Chu'a'lor##23233
turnin An Apexis Relic##11058 |goto 28.76,57.37
step
kill Apexis Flayer##22175+
click Apexis Shard Formation##185911
|tip They look like large clusters of crystals on the ground around this area.
collect 10 Apexis Shard##32569 |q 11030 |goto 31.2,52.2
step
click Fel Crystalforge##7392
|tip It looks like a metal machine with green bubbles floating out of it.
Choose: _<Purchase 1 Unstable Flask of the Beast for the cost of 10 Apexis Shards>_
collect Unstable Flask of the Beast##32598 |q 11030/1 |goto 32.79,40.47
step
talk Torkus##23316
turnin Our Boy Wants To Be A Skyguard Ranger##11030 |goto 28.38,57.65
step
talk Chu'a'lor##23233
accept The Skyguard Outpost##11062 |goto 28.76,57.37
step
talk Sky Commander Keller##23334
turnin The Skyguard Outpost##11062 |goto 27.40,52.69
step
talk Sky Sergeant Vanderlip##23120
accept Bombing Run##11010 |goto 27.57,52.91 |only if not raceclass("Druid")
accept Bombing Run##11102 |goto 27.57,52.91 |only if raceclass("Druid")
step
use the Skyguard Bombs##32456
|tip Use them on Fel Cannonball Stacks.
|tip They look like piles of gray stones on the ground around this area.
|tip They can only be used while on a flying mount.
|tip Fel Cannons will try to shoot you down while flying.
|tip Mount up on the ground near a Fel Cannonball Stack and immediately use the bombs on the stack.
|tip This will dismount you quickly before a cannon can fire at you.
Destroy #15# Fel Cannonball Stacks |q 11010/1 |goto 33.3,44.0 |only if not raceclass("Druid")
Destroy #15# Fel Cannonball Stacks |q 11102/1 |goto 33.3,44.0 |only if raceclass("Druid")
step
talk Sky Sergeant Vanderlip##23120
turnin Bombing Run##11010 |goto 27.57,52.91 |only if not raceclass("Druid")
turnin Bombing Run##11102 |goto 27.57,52.91 |only if raceclass("Druid")
step
talk Sky Commander Keller##23334
accept Assault on Bash'ir Landing!##11119 |goto 27.40,52.69
step
talk Aether-tech Apprentice##23473
turnin Assault on Bash'ir Landing!##11119 |goto 27.90,52.17
step
talk Skyguard Khatie##23335
accept Wrangle Some Aether Rays!##11065 |goto 27.95,51.45
step
kill Aether Ray##22181+
use the Wrangling Rope##32698
|tip Use it on weakened Aether Rays around this area.
|tip Reduce their health until you see a message indicating they can be wrangled.
|tip If you are well-geared, you may need to unequip some of your gear to avoid killing them.
Wrangle #5# Aether Rays |q 11065/1 |goto 31.6,56.4
step
talk Chu'a'lor##23233
accept Guardian of the Monument##11059 |goto 28.76,57.37
|tip This quest is elite and will require a group.
step
kill Apexis Flayer##22175+
click Apexis Shard Formation##185911
|tip They look like large clusters of crystals on the ground around this area.
collect 35 Apexis Shard##32569 |q 11059 |goto 31.2,52.2
step
click Apexis Monument##185944
|tip It's a huge floating crystal with alternating colors in the middle of the platform.
Choose _<Insert 35 Apexis Shards, and begin!>_
Click any of the 4 big colored buttons on the ground
|tip Only do this if you have good gear.
|tip You will get hit for 7,000 damage each time.
|tip This will make the quest mob spawn faster.
kill Apexis Guardian##22275
|tip It will eventually spawn.
|tip This enemy is elite and will require a group.
collect Apexis Guardian's Head##32697 |q 11059/1 |goto 31.8,63.8
step
talk Chu'a'lor##23233
turnin Guardian of the Monument##11059 |goto 28.76,57.37
step
talk Skyguard Khatie##23335
turnin Wrangle Some Aether Rays!##11065 |goto 27.95,51.45
step
talk Sky Commander Keller##23334
accept To Rule The Skies##11078 |goto 27.40,52.69
step
kill Apexis Flayer##22175+
click Apexis Shard Formation##185911
|tip They look like large clusters of crystals on the ground around this area.
collect 35 Apexis Shard##32569 |q 11078 |goto 31.2,52.2
step
click Rivendark's Egg##185936
Choose _Place 35 Apexis Shards near the dragon egg to crack it open._
Kill the dragon that attacks
collect Dragon Teeth##32732 |q 11078/1 |goto 27.2,64.8
step
talk Sky Commander Keller##23334
turnin To Rule The Skies##11078 |goto 27.40,52.69
step
Reach Honored Reputation with Ogri'la |complete rep("Ogri'la") >= Honored
|tip Use the "Ogri'la Daily Quests" guide to accomplish this.
step
talk Kronk##23253
accept Banish the Demons##11026 |goto 28.89,57.92
step
use the Banishing Crystal##32696
Kill enemies around this area
|tip Kill Fear Fiends and Abyssal Flamebringers that spawn near the portal that opens.
Banish #15# Demons |q 11026/1 |goto 29.1,79.3
step
talk Kronk##23253
turnin Banish the Demons##11026 |goto 28.89,57.92
step
Reach Exalted Reputation with Sha'tari Skyguard |complete rep("Sha'tari Skyguard") >= Exalted
|tip Use the "Sha'tari Skyguard Daily Quests" guide to accomplish this.
|tip You can also form a group and use the "Sha'tari Skyguard Terokk Farming" guide to kill elites for rep.
]])
