local ZygorGuidesViewer=ZygorGuidesViewer
if not ZygorGuidesViewer then return end
if UnitFactionGroup("player")~="Alliance" then return end
ZygorGuidesViewer.GuideMenuTier = "CLA"
ZygorGuidesViewer:RegisterGuide("Dungeon Guides\\Classic\\Wailing Caverns (15-25)",{
author="support@zygorguides.com",
image=ZGV.IMAGESDIR.."Wailing Caverns",
description="This guide will walk you through the Wailing Caverns dungeon.",
lfgid=718,
},[[
step
Enter the cave |goto The Barrens 45.96,36.33 < 7 |walk
Follow the path |goto Kalimdor 51.92,55.37 < 7 |only if walking
Continue following the path |goto 51.98,55.21 < 7 |only if walking
Continue following the path |goto 51.94,54.98 < 7 |only if walking
Continue following the path |goto 52.27,54.63 < 7 |only if walking
Enter the Wailing Caverns dungeon with your group |goto 52.40,55.21 < 7 |c
step
kill Kresh##3653
|tip Kresh has no abilities, it is a simple tank and spank fight.
Click Here to Continue |confirm
step
kill Lady Anacondra##3671
|tip Interrupt her "Sleep" ability.
Click Here to Continue |confirm
step
kill Lord Cobrahn##3669
|tip After pulling, immediately kill the three Deviate Pythons before switching to Lord Cobrahn.
|tip Interrupt his "Sleep" ability.
Click Here to Continue |confirm
step
kill Deviate Faerie Dragon##5912
|tip It's located in the Winding Chasm before Lord Pythas.
|tip This is a rare mob that may not be available.
Click Here to Continue |confirm
step
kill Lord Pythas##3670
|tip Interrupt his "Sleep" ability.
|tip After pulling, CC the Druid of the Fang and kill the other add before switching to Pythas.
Click Here to Continue |confirm
step
kill Skum##3674
|tip "Chained Bolt" does damage to players near each other so melee DPS should spread out around the boss to avoid damage.
Click Here to Continue |confirm
step
kill Lord Serpentis##3673
|tip Interrupt his "Sleep" ability.
Click Here to Continue |confirm
step
kill Verdan the Everliving##5775
|tip "Grasping Vines" roots all players within 10 yards, knocks them down and does damage so the healer should try to keep the group's health topped off as much as possible.
Click Here to Continue |confirm
step
kill Mutanus the Devourer##3654
|tip Mutanus is spawned during an optional dungeon event that can occur if the four Lords of the Fang bosses have been defeated.
|tip These four bosses include Lady Anacondra, Lord Cobrahn, Lord Pythas and Lord Serpentis.
|tip The event is started by escorting the Disciple of Naralex through the dungeon.
|tip The Disciple of Naralex is found at the start of the dungeon.
|tip Once the Disciple reaches the ritual stone where Naralex sleeps, you will be attacked by waves of enemies.
|tip Mutanus' "Thunderclap" ability does high damage to the tank and any nearby melee DPS so ranged DPS is better for this fight.
|tip He also has two abilities, "Terrify" and "Naralex's Nightmare" that both stun/sleep players so the healer should try to keep the group's health topped off as much as possible.
]])
ZygorGuidesViewer:RegisterGuide("Dungeon Guides\\Classic\\The Deadmines (17-26)",{
author="support@zygorguides.com",
image=ZGV.IMAGESDIR.."Deadmines",
description="This guide will walk you through the Deadmines dungeon.",
lfgid=1581,
},[[
step
Enter the building |goto Westfall 42.56,71.74 < 5 |walk
Run up the stairs |goto 43.38,71.92 < 5 |walk
Follow the path |goto 42.90,72.68 < 5 |walk
Run down the ramp |goto 43.42,72.79 < 7 |c
step
Jump down here |goto 43.28,74.14 < 5 |walk
Follow the path |goto 42.18,75.97 < 10 |walk
Follow the path up |goto 41.27,76.15 < 10 |walk
Continue following the path |goto Eastern Kingdoms 41.04,79.66 < 10 |walk
Follow the path |goto 40.99,79.79 < 10 |walk
Jump down here |goto 40.85,79.62 < 10 |walk
Enter the Deadmines dungeon with your group |goto 40.69,79.58 < 7 |c
step
kill Rhahk'Zor##644
|tip Before the encounter, you can pull the 2 Defias Watchman without drawing aggro from the boss.
|tip If you cannot do this, use CC on one archer.
|tip If you can't CC, kill the adds before the boss.
|tip Be careful of patrolling elites.
Click Here to Continue |confirm
step
kill Miner Johnson##3586
|tip This is a rare mob that may not be available.
|tip He will be surrounded by Defias Miners that aren't elite.
|tip Try picking them off before engaging Miner Johnson.
|tip Click the line below if the rare spawn isn't available.
Click Here to Continue |confirm
step
kill Sneed's Shredder##642
|tip Clear the entire room before engaging Sneed's Shredder.
|tip It uses an ability called "Terrify" that will cause you to run in fear.
|tip Once the Shredder is killed, Sneed will hop out and the tank will need to pick it up quickly.
|tip It will disarm the tank so give them time to get aggro.
Click Here to Continue |confirm
step
kill Gilnid##1763
|tip A Goblin Engineer will pull when you engage him.
|tip CC the engineer, or it will summing a Remote Controlled Golem, which is immune to most abilities.
|tip If the Golem is summoned focus on the engineer.
Click Here to Continue |confirm
step
kill Mr. Smite##646
|tip When you approach the plank, he will automatically engage your group.
|tip There will be two Defias Blackguard that are stealthed.
|tip They need to die before you begin damaging Mr. Smite.
|tip At 66% and 33% he will stun the group for nearly 10 seconds.
|tip At 33% he will gain the ability to stun your tank.
|tip It will be important to keep your tank healed up.
Click Here to Continue |confirm
step
kill Captain Greenskin##647
|tip CC adds next to Captain Greenskin before pulling.
|tip Start the encounter by killing the adds, CCing as many as possible.
Click Here to Continue |confirm
step
kill Edwin VanCleef##639
|tip When you begin the encounter, there will be two Defias Blackguard that break stealth.
|tip CC and kill them before attacking Edwin VanCleef.
|tip At 50% he will summon two more adds.
|tip Repeat the process from before, killing the adds.
|tip Finish the encounter after.
Click Here to Continue |confirm
step
kill Cookie##645
|tip This is a bonus boss, on a little island below.
|tip If you want to be safe, you can clear the adds below before jumping down.
|tip Interrupt "Cookie's Cooking" spell or it heals him.
]])
ZygorGuidesViewer:RegisterGuide("Dungeon Guides\\Classic\\Shadowfang Keep (22-30)",{
author="support@zygorguides.com",
image=ZGV.IMAGESDIR.."Shadowfang Keep",
description="This guide will walk you through the Shadowfang Keep dungeon.",
lfgid=209,
},[[
step
Follow the path up |goto Silverpine Forest 47.12,69.56 < 15 |only if walking
Continue up the path |goto 47.44,67.07 < 15 |only if walking
Cross the bridge |goto 45.63,68.32 < 15 |only if walking
Enter the Shadowfang Keep dungeon with your group |goto 44.80,67.84 < 10 |c
step
kill Rethilgore##3914
|tip This is a straight forward encounter, with his only ability being "Soul Drain"
|tip It will immobilize the target and gain health while casting it.
Click Here to Continue |confirm
step
kill Shadow Charger##3865
|tip Pulling one of the 3 horses in the stable will pull all 3.
|tip Use CC on at least one of the horses if possible as they deal high damage.
|tip Focus them down one at a time.
|tip Make sure your healer is prepared for the enounter before starting.
Click Here to Continue |confirm
step
kill Razorclaw the Butcher##3886
|tip Clear the room before starting the encounter.
|tip The fight itself is a simple enough.
Click Here to Continue |confirm
step
kill Baron Silverlaine##3887
|tip Healers will need to watch for the "Veil of Shadow" ability when it is cast.
|tip If you have a hybrid class in your group, support the healer when this ability goes off.
|tip Veil of Shadows will reduce incoming healing by 75%.
Click Here to Continue |confirm
step
kill Commander Springvale##4278
|tip This encounter starts with two adds.
|tip Start by focus DPSing the Haunted Servitor.
|tip You can either kill the Wailing Guardsman next, or have a Warlock or Hunter pet Off-tank it.
Click Here to Continue |confirm
step
kill Odo the Blindwatcher##4279
|tip This encounter starts with two adds.
|tip They have the "Disarm" and "Cleave" abilities, so be sure to keep them away from the group as a tank.
|tip You can use CC or focus DPS them down quickly.
Click Here to Continue |confirm
step
kill Deathsworn Captain##3872
|tip This is a rare mob that may not be available.
|tip The tank should keep this boss 10 yards away from the group to avoid the AoE Silence it uses.
Click Here to Continue |confirm
step
kill Fenrus the Devourer##4274
|tip This boss has a dot ability and is otherwise simple.
Click Here to Continue |confirm
step
kill Wolf Master Nados##3927
|tip In the he room where this encounter takes place, there are 4 adds that should be killed beforehand.
|tip During the fight, he will summon additional Worg that should be killed.
Click Here to Continue |confirm
step
kill Archmage Arugal##4275
|tip For this encounter, you will want to have ranged DPS and Healers stand at the platform you entered the room in.
|tip As the encounter progresses, Arugal will teleport around the room.
|tip His standard attack, "Shadow Bolt" hits very hard.
Click Here to Continue |confirm
]])
ZygorGuidesViewer:RegisterGuide("Dungeon Guides\\Classic\\The Stockade (22-30)",{
author="support@zygorguides.com",
image=ZGV.IMAGESDIR.."The Stockade",
description="This guide will walk you through The Stockade dungeon.",
lfgid=717,
},[[
step
Enter the building |goto Stormwind City 52.36,69.99 < 10 |walk
Enter The Stockade dungeon with your group |complete subzone("Stormwind Stockade") |goto 50.39,66.29
step
kill Targorr the Dread##1696
|tip There will be Defias enemies surrounding him in the room.
|tip Use CC on the Defias before the encounter.
|tip DPS should focus on the adds before engaging Targorr the Dread.
|tip Finish off the CC'd adds after killing the boss.
Click Here to Continue |confirm
step
kill Kam Deepfury##1666
|tip There will be Defias enemies surrounding him in the room.
|tip Use CC on the Defias before the encounter.
|tip DPS should focus on the adds before engaging Kam Deepfury.
|tip Finish off the CC'd adds after killing the boss.
Click Here to Continue |confirm
step
kill Hamhock##1717
|tip There will be two Defias enemies along side Hamhock.
|tip Use CC on them if possible before starting the enounter.
|tip All DPS should focus on killing a single add at a time before switching to Hamhock.
|tip Hamhock will cast "Chain Lightning" which will deal heavy damage to bunched up allies, so spread out as best as possible.
Click Here to Continue |confirm
step
kill Bazil Thredd##1716
|tip It will be important to keep the tank topped off during this encounter.
|tip His "Smoke Bomb" ability will stun the group for 4 seconds upon use.
|tip Bazil Thredd deals high amounts of single target damage.
Click Here to Continue |confirm
step
kill Dextren Ward##1663
|tip His "Intimidating Shout" ability will cause your group to run in fear.
|tip It is important to clear any area around him before engaging.
|tip If you pull extra adds during the fear, be sure to use CC abilities on them as best you can.
|tip DPS should focus down Dextren Ward as soon as possible.
Click Here to Continue |confirm
step
kill Bruegal Ironknuckle##1720
|tip This is a rare mob that may not be available.
|tip Clear adds before engaging him and kill the boss.
Click Here to Continue |confirm
]])
ZygorGuidesViewer:RegisterGuide("Dungeon Guides\\Classic\\Blackfathom Deeps (24-32)",{
author="support@zygorguides.com",
image=ZGV.IMAGESDIR.."Blackfathom Deeps",
description="This guide will walk you through the Blackfathom Deeps dungeon.",
lfgid=719,
},[[
step
Follow the path |goto Ashenvale 14.11,14.87 < 15 |only if walking
Jump down into the water |goto Kalimdor 43.97,35.37 < 20 |walk
Enter the underwater cave |goto 43.94,35.27 < 7 |walk
Follow the path |goto 43.82,35.14 < 7 |walk
Continue following the path |goto 43.94,34.87 < 7 |walk
Continue following the path |goto 43.90,34.59 < 7 |walk
Follow the path |goto 44.00,34.56 < 7 |c
step
Follow the path up |goto 44.09,34.77 < 7 |walk
Continue following the path |goto 44.35,34.96 < 7 |walk
Enter the Blackfathom Deeps dungeon with your group |goto 44.35,34.86 < 5 |c
step
kill Ghamoo-ra##4887
|tip Ghamoo-ra has high armor so melee damage will be significantly reduced.
|tip Spread out as best as possible to avoid taking damage from "Trample".
Click Here to Continue |confirm
step
kill Lady Sarevess##4831
|tip Lady Sarevess will be patrolling a cave with 2 other Naga.
|tip It's recommended that you kill them before engaging her.
|tip Use CC abilities on her two bodyguards that accompany her.
|tip Kill the adds before starting DPS on her.
Click Here to Continue |confirm
step
kill Gelihast##6243
|tip Before starting the encounter, clear the room of the Murlocs.
|tip Be careful not to pull them with the boss while clearing them out.
|tip Once the room is clear of adds, kill Gelihast.
Click Here to Continue |confirm
step
kill Twilight Lord Kelris##4832
|tip Kelris will cast the "Sleep" ability on a random party member.
|tip The healer should keep the tank topped off in case they get slept.
|tip If there is a hybrid class in the group and the healer is slept, you may need to assist.
Click Here to Continue |confirm
step
kill Old Serra'kis##4830
|tip To unlock the door, click each brazier one at a time and defeat the wave of enemies that spawn from them.
|tip This is an optional encounter.
|tip It takes place underwater.
|tip Keep your eye out for air vents underwater.
Click Here to Continue |confirm
step
kill Aku'mai##4829
|tip Aku'mai deals high damage to a single target during "Frenzied Rage".
|tip This ability lasts for 15 seconds.
|tip High healing will be required for these phases.
Click Here to Continue |confirm
]])
ZygorGuidesViewer:RegisterGuide("Dungeon Guides\\Classic\\Gnomeregan (29-38)",{
author="support@zygorguides.com",
image=ZGV.IMAGESDIR.."Gnomeregan",
description="This guide will walk you through the Gnomeregan dungeon.",
lfgid=721,
},[[
step
Enter the building |goto Dun Morogh 24.35,39.78 < 7 |walk
Run down the ramp |goto Eastern Kingdoms 43.45,53.80 < 7 |walk
Go down the elevator |goto 43.61,53.82 < 7 |c
step
Run up the ramp |goto 43.40,53.73 < 7 |only if walking
Follow the path |goto 43.20,53.37 < 15 |only if walking
Enter the Gnomeregan dungeon with your group |goto 42.81,53.82 < 5 |c
step
kill Grubbis##7361
|tip This boss spawns from an event started by "Blastmaster Emi Shortfuse".
|tip She will trigger an explosive tha twill cause mobs to spawn from a cave.
|tip Grubbis will eventually spawn.
Click Here to Continue |confirm
step
kill Viscous Fallout##7079
|tip Before engaging in this encounter, it is recommended that you clear the trash in the room.
|tip After that, the fight itself is simple.
Click Here to Continue |confirm
step
kill Electrocutioner 6000##6235
|tip This encounter is standard.
|tip DPS the boss down and move on.
Click Here to Continue |confirm
step
kill Crowd Pummeler 9-60##6229
|tip For this encounter, place the groups back against the wall to avoid being knocked off the ledge.
Click Here to Continue |confirm
step
kill Dark Iron Ambassador##6228
|tip This is a rare mob that may not be available.
|tip Click the line below to continue.
Click Here to Continue |confirm
step
kill Mekgineer Thermaplugg##7800
|tip For this encounter, the DPS in the group should focus down "Walking Bombs" as they close in on the group.
|tip Other than that, kill Thermaplugg in between them.
Click Here to Continue |confirm
]])
ZygorGuidesViewer:RegisterGuide("Dungeon Guides\\Classic\\Razorfen Kraul (30-40)",{
author="support@zygorguides.com",
image=ZGV.IMAGESDIR.."Razorfen Kraul",
description="This guide will walk you through the Razorfen Kraul dungeon.",
lfgid=491,
},[[
step
Follow the path |goto The Barrens 43.87,90.11 < 15 |only if walking
Enter the Razorfen Kraul dungeon with your group |goto 50.90,70.36 < 10 |c
step
kill Roogug##6168
|tip Clear the area before engaging Roogug.
|tip If you have a warlock in your group, Banish the elemental at his side..
Click Here to Continue |confirm
step
kill Aggem Thorncurse##4424
|tip During the encounter, he will summon a boar.
|tip DPS should focus target the boar down then switch back to the boss.
Click Here to Continue |confirm
step
kill Death Speaker Jargba##4428
|tip For this encounter, he will be assisted by two caster allies.
|tip It is important to use CC abilities on them before starting the encounter.
|tip DPS should focus down the adds before switching to the boss.
|tip Death Speaker Jargba will use the "Dominate Mind" ability which will Mind Control a party member.
|tip Save all cooldowns for the boss.
Click Here to Continue |confirm
step
kill Overlord Ramtusk##4420
|tip Overlord Ramtusk deals high single target damage.
|tip He has two allies that should be CC'd.
|tip CC should be focused on the Spearhides if possible.
|tip Kill Ramtusk then the adds after.
Click Here to Continue |confirm
step
kill Agathelos the Raging##4422
|tip Agathelos the Raging deals massive single target damage.
|tip You might need back up heals if the healer can't keep up.
Click Here to Continue |confirm
step
kill Blind Hunter##4425
|tip This is a rare mob that may not be available.
|tip Have the casters stop casting when Blind Hunter is using it's "Sonic Boom" ability.
|tip Click the line below if the boss isn't there.
Click Here to Continue |confirm
step
kill Earthcaller Halmgar##4842
|tip Clear the platform before engaging then pull the boss.
|tip Kill the totem he summons as soon as they appear.
|tip If you have a Warlock, you can banish the elemental.
Click Here to Continue |confirm
step
kill Charlga Razorflank##4421
|tip Charlga Razorflank deals high damage.
|tip Pull them down fromt he hut and tank them at the platform below.
|tip The group should spread out if possible.
|tip Interrupt the "Chain Bolt" ability whenever it's being cast.
Click Here to Continue |confirm
]])
ZygorGuidesViewer:RegisterGuide("Dungeon Guides\\Classic\\Scarlet Monastery (Graveyard) (29-35)",{
author="support@zygorguides.com",
image=ZGV.IMAGESDIR.."Scarlet Monastery",
description="This guide will walk you through the Scarlet Monastery (Graveyard) dungeon.",
lfgid=798,
},[[
step
Follow the path up |goto Tirisfal Glades 81.39,41.13 < 15 |only if walking
Follow the path |goto 81.39,39.57 < 15 |only if walking
Continue following the path |goto 82.28,37.86 < 15 |only if walking
Enter the building |goto Scarlet Monastery 47.43,19.74 < 10 |c
step
Run up the stairs |goto Scarlet Monastery 47.45,19.69 < 10 |walk
Follow the path |goto 74.88,23.51 < 10 |walk
Enter the Scarlet Monastery - Graveyard dungeon with your group |goto 74.95,23.41 < 5 |c
step
kill Interrogator Vishas##3983
|tip Clear the area before engaging Interrogator Vishas.
|tip He will use "Immolate" throughout the fight, so be ready for extra healing.
Click Here to Continue |confirm
step
kill Bloodmage Thalnos##4543
|tip For this encounter, ranged DPS should spread out to avoid taking damage from AoE attacks.
Click Here to Continue |confirm
step
kill Azshir the Sleepless##6490
|tip This is a rare mob that may not be available.
|tip If you see an "Unfettered Spirit", you will be able to spawn this boss.
|tip There are 6 different spawn points across the Graveyard that appear in intervals of 10 to 15 minutes.
|tip Every 10 to 15 minutes, instead of an Unfettered Spirit, Azshir the Sleepless has a chance to spawn.
|tip It will use the "Terrify" ability which will fear the group.
|tip It will also use an ability called "Call of the Grave" which will damage an ally even after the boss is dead.
Click Here to Continue |confirm
step
kill Fallen Champion##6488
|tip This is a rare mob that may not be available.
|tip If you see an "Unfettered Spirit", you will be able to spawn this boss.
|tip There are 6 different spawn points across the Graveyard that appear in intervals of 10 to 15 minutes.
|tip Every 10 to 15 minutes, instead of an Unfettered Spirit, Azshir the Sleepless has a chance to spawn.
|tip The Fallen Champion only uses melee abilities, including "Cleave" so spread out when possible.
Click Here to Continue |confirm
step
kill Ironspine##6489
|tip This is a rare mob that may not be available.
|tip If you see an "Unfettered Spirit", you will be able to spawn this boss.
|tip There are 6 different spawn points across the Graveyard that appear in intervals of 10 to 15 minutes.
|tip Every 10 to 15 minutes, instead of an Unfettered Spirit, Azshir the Sleepless has a chance to spawn.
|tip Ironspine will use the ability "Poison Cloud" so spread out to avoid it.
Click Here to Continue |confirm
]])
ZygorGuidesViewer:RegisterGuide("Dungeon Guides\\Classic\\Scarlet Monastery (Library) (31-37)",{
author="support@zygorguides.com",
image=ZGV.IMAGESDIR.."Scarlet Monastery",
description="This guide will walk you through the Scarlet Monastery (Library) dungeon.",
lfgid=799,
},[[
step
Follow the path up |goto Tirisfal Glades 81.39,41.13 < 15 |only if walking
Follow the path |goto 81.39,39.57 < 15 |only if walking
Continue following the path |goto 82.28,37.86 < 15 |only if walking
Enter the building |goto Scarlet Monastery 47.43,19.74 < 10 |c
step
Run up the stairs |goto Scarlet Monastery 47.45,19.69 < 10 |walk
Follow the path |goto 74.89,23.58 < 10 |walk
Enter the Scarlet Monastery - Library dungeon with your group |goto 75.00,23.58 < 5 |c
step
kill Houndmaster Loksey##3974
|tip For this encounter, Loksey will be accompanied by 3 elite Scarlet Tracking Hounds.
|tip They will need to either be CC'd or killed immidiately.
|tip Once the hounds are dealt with, kill Houndmaster Loksey.
Click Here to Continue |confirm
step
kill Arcanist Doan##6487
|tip For this encounter, he will cast "Detonation" which will damage the entire group.
|tip When he does this, use the pillars to line of sight the ability.
|tip This fight is very healing intensive, so if you have a hybrid class, additional healing may be required.
|tip He will also cast "Silence" on casters.
Click Here to Continue |confirm
]])
ZygorGuidesViewer:RegisterGuide("Dungeon Guides\\Classic\\Scarlet Monastery (Armory) (35-40)",{
author="support@zygorguides.com",
image=ZGV.IMAGESDIR.."Scarlet Monastery",
description="This guide will walk you through the Scarlet Monastery (Armory) dungeon.",
lfgid=796,
},[[
step
Follow the path up |goto Tirisfal Glades 81.39,41.13 < 15 |only if walking
Follow the path |goto 81.39,39.57 < 15 |only if walking
Continue following the path |goto 82.28,37.86 < 15 |only if walking
Enter the building |goto Scarlet Monastery 47.43,19.74 < 10 |c
step
Run up the stairs |goto Scarlet Monastery 47.45,19.69 < 10 |walk
Follow the path |goto 74.89,23.58 < 10 |walk
click Armory Door
|tip You will need to collect "The Scarlet Key" from the Scarlet Monastery - Library dungeon to open this.
|tip Additionally, a rogue with leveled "Lockpicking" skill can open the door.
Enter the doorway |goto 75.01,23.51 < 5 |walk
Enter the Scarlet Monastery - Armory dungeon with your group |goto 75.03,23.52 < 5 |c
step
kill Herod##3975
|tip The tank should keep Herod at the center of the room.
|tip He will use the "Whirlwind" ability, he will become immune to magic damage.
|tip Anyone at the center of the room should move from it to avoid getting hit by it, including the tank.
|tip Casters should stay on the ledge above at all times.
|tip When Herod dies, a group of non-elites will rush the room.
Click Here to Continue |confirm
]])
ZygorGuidesViewer:RegisterGuide("Dungeon Guides\\Classic\\Scarlet Monastery (Cathedral) (36-42)",{
author="support@zygorguides.com",
image=ZGV.IMAGESDIR.."Scarlet Monastery",
description="This guide will walk you through the Scarlet Monastery (Cathedral) dungeon.",
lfgid=797,
},[[
step
Follow the path up |goto Tirisfal Glades 81.39,41.13 < 15 |only if walking
Follow the path |goto 81.39,39.57 < 15 |only if walking
Continue following the path |goto 82.28,37.86 < 15 |only if walking
Enter the building |goto Scarlet Monastery 47.43,19.74 < 10 |c
step
Run up the stairs |goto Scarlet Monastery 47.45,19.69 < 10 |walk
Follow the path |goto 74.88,23.51 < 10 |walk
click Cathedral Door
|tip You will need to collect "The Scarlet Key" from the Scarlet Monastery - Library dungeon to open this.
|tip Additionally, a rogue with leveled "Lockpicking" skill can open the door.
Enter the doorway |goto 74.99,23.44 < 5 |walk
Enter the Scarlet Monastery - Cathedral dungeon with your group |goto 75.00,23.41 < 5 |c
step
kill Scarlet Commander Mograine##3976
|tip Clear the Cathedral before starting this encounter.
|tip He will use the ability "Hammer of Justice" which will stun the target for 3 seconds.
|tip He will use the "Divine Shield" ability, which will make him invulnerable to all damage.
Click Here to Continue |confirm
step
kill High Inquisitor Whitemane##3977
|tip She will primarily cast "Holy Smite", dealing magic damage to the tank.
|tip When she is near death, she will sleep the entire party and revive Mograine.
|tip Both of their health bars will return to full adn the tank will need to pick up Mograine immidiately.
|tip DPS should focus on Whitemane, then Mograine.
Click Here to Continue |confirm
step
kill High Inquisitor Fairbanks##4542
|tip He will cast "Curse of Blood" on a party member, which can be dispelled by a mage or a druid.
|tip He will also use "Fear" and "Sleep" on random party members.
Click Here to Continue |confirm
]])
ZygorGuidesViewer:RegisterGuide("Dungeon Guides\\Classic\\Razorfen Downs (37-43)",{
author="support@zygorguides.com",
image=ZGV.IMAGESDIR.."Razorfen Downs",
description="This guide will walk you through the Razorfen Downs dungeon.",
lfgid=722,
},[[
step
Follow the path |goto The Barrens 44.92,88.93 < 15 |only if walking
Continue following the path |goto 46.56,91.38 < 15 |only if walking
Continue following the path |goto The Barrens 47.41,92.89 < 15 |only if walking
Enter the tunnel |goto The Barrens 48.97,93.83 < 10 |only if walking
Follow the path |goto Razorfen Downs 52.89,71.03 < 10 |only if walking
Enter the Razorfen Downs dungeon with your group |goto Razorfen Downs 53.25,71.17 |only if walking
step
kill Tuten'kash##7355
|tip Clear the room and ring the gong to begin the encounter.
|tip After each wave, you will need to ring the gong again until the boss appears.
|tip The tank should face the boss away from the group when it spawns.
|tip It's "Web Spray" ability will immobilize any ally in front of it.
Click Here to Continue |confirm
step
kill Mordresh Fire Eye##7357
|tip Before engaging, clear the enemies around Mordresh.
|tip The last pack of skeletons will draw the aggro of the boss.
|tip This boss is vulnerable to melee damage.
|tip Be sure to interrupt the "Fireball" ability.
Click Here to Continue |confirm
step
kill Glutton##8567
|tip Have the tank move out of it's "Disease Cloud" ability.
|tip Heavy heals will be needed when Glutton enrages.
Click Here to Continue |confirm
step
kill Ragglesnout##7354
|tip This is a rare mob that may not be available.
|tip He will use "Dominate Mind" on a random group member, including the tank or healer.
|tip It'll be important to have a back up healer or tank in case this happens.
|tip Interrupt his "Heal" ability when possible.
Click Here to Continue |confirm
step
kill Amnennar the Coldbringer##7358
|tip The tank should tank him facing the tent where he's at.
|tip The group should then stack on top of the tank to reduce damage from "Frost Nova".
|tip He will summon "Frost Spectres".
|tip As soon as one appears, the damage should switch and kill it quickly.
Click Here to Continue |confirm
step
kill Plaguemaw the Rotting##7356
|tip This is an optional fight.
|tip Speak with Belnistrasz to start the event.
|tip Waves of enemies will spawn and may require additional off tanks.
|tip When Belnistrasz is finished channeling, Plaguemaw the Rotting will spawn.
Click Here to Continue |confirm
]])
ZygorGuidesViewer:RegisterGuide("Dungeon Guides\\Classic\\Uldaman (42-52)",{
author="support@zygorguides.com",
image=ZGV.IMAGESDIR.."Uldaman",
description="This guide will walk you through the Uldaman dungeon.",
lfgid=1337,
},[[
step
Enter the Uldaman Dungeon with your group
Click Here to Continue |confirm
step
kill Revelosh##6910
|tip Use Crowd Control abilities on the 2 Stonevault Rockcheres if possible.
|tip If you have no Crowd Control, burn them down before the boss.
|tip Interrupt his "Chain Lightning" ability when possible.
Click Here to Continue |confirm
step
kill Ironaya##7228
|tip She is immune to Damage Over Time effects.
|tip The tank should face her away from the rest of the group to avoid them being hit with "Arcing Smash".
|tip Range spread out.
Click Here to Continue |confirm
step
kill Obsidian Sentinel##7023
|tip This boss is immunity to Damage Over Time abilities.
|tip At 66% and 33% Health, it will spawn two Obsidian Shards.
|tip DPS should switch to killing these before going back to the boss.
Click Here to Continue |confirm
step
kill Ancient Stone Keeper##7206
|tip This boss has immunity to Damage Over Time abilities.
|tip It also casts the ability "Sand Storms", which will cast Slow and Silence on those caught in it.
|tip Range spread out.
Click Here to Continue |confirm
step
kill Galgann Firehammer##7291
|tip He will be accompanied by Shadowforge Geologists.
|tip Heavy AoE damage will be inflicted upon your group.
|tip The Tank should pick up Galgann Firehammer and move him away from the Shadowforge Geologist.
|tip Keep him faced away from the group.
|tip Use Crowd Control abilities on one Shadowforge Geologist, then kill the other.
|tip After, then kill the last Shadowforge Geologist.
|tip Then, switch to Galgann and kill him.
Click Here to Continue |confirm
step
kill Grimlok##4854
|tip He is accompanied by a Stonevault Geomancer, Stonevault Brawler and a Jadespine Basilisk.
|tip Use a Crowd Control ability on one of the adds.
|tip Then, use all cooldowns and burn down Grimlok as fast as possible.
|tip After, deal with the adds.
Click Here to Continue |confirm
step
kill Archaedas##2748
|tip He will summon adds through the encounter.
|tip When they appear, all DPS should kill them as soon as possible.
|tip The fight is long, so healers should conserve mana when possible.
Click Here to Continue |confirm
]])
ZygorGuidesViewer:RegisterGuide("Dungeon Guides\\Classic\\Zul'Farrak (44-49)",{
author="support@zygorguides.com",
image=ZGV.IMAGESDIR.."Zul'Farrak",
description="This guide will walk you through the Zul'Farrak dungeon.",
lfgid=1176,
},[[
step
Follow the path |goto Tanaris 39.02,20.95 < 10 |only if walking
Enter the Zul'Farrak dungeon with your group |goto Tanaris 38.73,19.97 < 5 |c
stickystart "Kill_Zerillis"
step
kill Antu'sul##8127
|tip During the encounter, he will summon "Sul'lithuz Broodlings" and "Servants of Antu'sul".
|tip When they appear, all DPS should switch to the adds and kill them.
|tip He will summon various totems that should be destroyed as soon as they appear.
Click Here to Continue |confirm
step
kill Theka the Martyr##7272
|tip This is a mini boss found in the dungeon.
|tip He will cast "Fevered Plague" on group members, dealing damage over time.
|tip When he reaches 30% health, he will become immune to physical and shadow damage.
Click Here to Continue |confirm
step
kill Witch Doctor Zum'rah##7271
|tip Zum'rah will cast "Shadow Bolt Volley" which will need to be interrupted.
|tip He will also summon zombies from nearby graves that will attack you.
|tip All DPS should switch to the zombies before moving back to the boss.
|tip Whenever he summons a totem, you should also focus on those.
Click Here to Continue |confirm
step
kill Nekrum Gutchewer##7796
kill Shadowpriest Sezz'ziz##7275
|tip He will be accompanied by Shadowpriest Sezz'ziz.
|tip Have DPS burn down Nekrum Gutchewer before burning down Sezz'ziz.
|tip Be sure to interrupt Sezz'ziz' "Heal" ability throughout the encounter.
|tip After Nekrum has been defeated, quickly burn down Sezz'ziz.
Click Here to Continue |confirm
step
kill Sergeant Bly##7604
|tip He will be accompanied by a group of other elites.
|tip DPS should prioritize killing Murta Grimgut and Oro Eyegouge before all else.
Click Here to Continue |confirm
step
kill Chief Ukorz Sandscalp##7267
|tip Make sure the tank faces the bosses away from the group.
|tip Melee allies should damage him from behind to avoid its "Cleave" ability.
|tip Kill Ruuzlu, then Ukorz.
Click Here to Continue |confirm
step
kill Hydromancer Velratha##7795
|tip She patrols around a room filled with elite enemies.
|tip Clear as many as you can without pulling her.
|tip Once you've cleared a safe spot, pull Velratha into the hallway from where you fought Sergeant Bly.
Click Here to Continue |confirm
step
kill Gahz'rilla##7273
|tip To summon Gahz'rilla, you will need the "Sacred Mallet" that drops from Qiaga the Keeper in the Hinterlands.
|tip You will then need to use the mallet at the altar in Jintha'Alor, also found in the Hinterlands.
|tip Clear the entire room before ringing the gong with the "Mallet of Zul'Farrak".
|tip When engaging, the tank should face him away from the group.
|tip If you don't, the group will be tossed up in the air.
Click Here to Continue |confirm
step
label "Kill_Zerillis"
kill Zerillis##10082
|tip This is a rare mob that may not be available.
|tip He wanders all over the first half of the dungeon.
|tip Line of sight him into melee range as soon as possible.
|tip Afterwards, the fight is straight forward.
Click Here to Continue |confirm |notinsticky
]])
ZygorGuidesViewer:RegisterGuide("Dungeon Guides\\Classic\\Maraudon (Wicked Grotto - Purple) (45-53)",{
author="support@zygorguides.com",
image=ZGV.IMAGESDIR.."Maraudon",
description="This guide will walk you through the Maraudon (Wicked Grotto - Purple) dungeon.",
lfgid=2100,
},[[
step
click Stone Door
Enter the building |goto Desolace 38.43,57.98 < 5 |walk
Jump down here |goto Desolace 38.33,58.00 < 10 |walk
Jump down here |goto 38.30,58.18 < 10 |c
step
Jump down here |goto 38.27,58.00 < 10 |walk
Follow the path down |goto 38.43,57.86 < 10 |walk
Cross the bridge |goto 38.53,57.80 < 10 |walk
Follow the path |goto 38.64,57.68 < 10 |walk
Continue following the path |goto 38.42,57.42 < 10 |walk
Enter the Maraudon - Purple dungeon with your group |goto Kalimdor 38.57,57.00 < 10 |c
step
kill Lord Vyletongue##12236
|tip Have the entire group stack on top of each other to avoid the bosses ranged abilities.
|tip He will occasionally use his "Blink" ability, causing him to move away from the group.
|tip Be sure to stack in melee range of the boss as soon as possible whenever this happens.
|tip If you have a Warlock, you can banish the one of the two adds that appear.
|tip Defeat the boss, then finish the adds.
Click Here to Continue |confirm
]])
ZygorGuidesViewer:RegisterGuide("Dungeon Guides\\Classic\\Maraudon (Foulspore Cavern - Orange) (45-53)",{
author="support@zygorguides.com",
image=ZGV.IMAGESDIR.."Maraudon",
description="This guide will walk you through the Maraudon (Foulspore Cavern - Orange) dungeon.",
lfgid=2101,
},[[
step
Follow the path up |goto Desolace 38.49,61.12 < 15 |only if walking
Run up the stairs |goto 29.84,62.50 < 10 |only if walking
click Stone Door
Enter the building |goto Kalimdor 38.43,57.97 < 7 |c
step
Follow the path |goto 38.34,58.12 < 10 |only if walking
Run down the stairs |goto 38.25,57.99 < 10 |only if walking
Continue following the path |goto 38.45,58.14 < 10 |only if walking
Run up the stairs |goto 38.69,58.16 < 10 |only if walking
Follow the path |goto 38.84,58.34 < 10 |only if walking
Continue following the path |goto 39.10,57.99 < 7 |only if walking
Enter the Maraudon (Foulspore Cavern - Orange) dungeon with your group |goto 39.27,58.19 < 5 |c
step
kill Noxxion##13282
|tip Noxxion will use "Toxic Volley" which will deal damage to the entire group.
|tip During the fight, he will split into tiny versions of himself which need to be killed before you can resume damaging him again.
Click Here to Continue |confirm
step
kill Razorlash##
|tip Razorlash uses the "Cleave" ability, so ranged sould stand at max range to avoid additional damage to the group.
|tip It will also use the "Puncture" ability which will deal heavy damage to its target.
Click Here to Continue |confirm
]])
ZygorGuidesViewer:RegisterGuide("Dungeon Guides\\Classic\\Maraudon (Poison Falls - Inner) (48-57)",{
author="support@zygorguides.com",
image=ZGV.IMAGESDIR.."Maraudon",
description="This guide will walk you through the Maraudon (Poison Falls - Inner) dungeon.",
},[[
step
click Stone Door
Enter the building |goto Desolace 38.43,57.98 < 5 |walk
Jump down here |goto Desolace 38.33,58.00 < 10 |walk
Jump down here |goto 38.30,58.18 < 10 |c
step
Jump down here |goto 38.27,58.00 < 10 |walk
Follow the path down |goto 38.43,57.86 < 10 |walk
Cross the bridge |goto 38.53,57.80 < 10 |walk
Follow the path |goto 38.64,57.68 < 10 |walk
Continue following the path |goto 38.42,57.42 < 10 |walk
Enter the Maraudon - Purple dungeon with your group |goto Kalimdor 38.57,57.00 < 10 |c
step
kill Meshlok the Harvester##12237
|tip Meshlock patrols the waters near the start.
|tip This is a rare mob that may not be available.
|tip Ranged should stay spread out and it should be tanked away from the group.
|tip Earth Shock can interrupt spellcasting.
Click Here to Continue |confirm
step
kill Celebras the Cursed##12225
|tip The tank should pick up Corrupt Forces of Nature whenever they spawn.
|tip Focus on killing Celebras first.
|tip Interrupt Wrath whenever possible.
Click Here to Continue |confirm
]])
ZygorGuidesViewer:RegisterGuide("Dungeon Guides\\Classic\\Maraudon (Earth Song Falls - Inner) (48-57)",{
author="support@zygorguides.com",
image=ZGV.IMAGESDIR.."Maraudon",
description="This guide will walk you through the Maraudon (Earth Song Falls - Inner) dungeon.",
lfgid=2102,
},[[
step
Follow the path up |goto Desolace 38.49,61.12 < 15 |only if walking
Run up the stairs |goto 29.84,62.50 < 10 |only if walking
click Stone Door
Enter the building |goto Kalimdor 38.43,57.97 < 7 |c
step
Follow the path |goto 38.34,58.12 < 10 |only if walking
Run down the stairs |goto 38.25,57.99 < 10 |only if walking
Continue following the path |goto 38.47,57.96 < 7 |only if walking
Continue following the path |goto 38.49,57.73 < 7 |only if walking
use Scepter of Celebras##17191
|tip This is a reward from a short quest chain given by Cavindra outside the Foulspore Cavern - Orange dungeon.
click Portal to Inner Maraudon |goto 38.45,57.81
Enter the Maraudon (Earth Song Falls - Inner) dungeon with your group |goto Maraudon 0.00,0.00 < 1000 |noway |c
step
kill Landslide##12203
|tip The tank should keep him where he spawns.
|tip The tank should also keep their back to the wall when possible.
|tip Ranged stay at a distance.
|tip Ranged will also need to avoid the "Theradrim Shardling" that spawns, which will disappear once the boss dies.
Click Here to Continue |confirm
step
kill Princess Theradras##12201
|tip She has the ability "Repulsive Gaze" which will fear the entire group.
|tip Use "Fear Ward" on the tank if possible.
|tip Warriors ability "Berserker Rage" can negate the fear.
|tip Also, use "Tremor Totem" if possible.
|tip Ranged group members should stay at max range to avoid being knocked back by "Dust Field".
Click Here to Continue |confirm
step
kill Rotgrip##13596
|tip Jump down into the water.
|tip Rotgrip deals high damage, so the fight will be very heal intensive.
|tip You may need support heals.
|tip Its ability "Puncture" will deal damage over time increasing this damage.
Click Here to Continue |confirm
step
kill Tinkerer Gizlock##13601
|tip The tank should face him away from the group to avoid taking damage from "Gobling Dragon Gun".
|tip After, the group should stack in close melee rang to prevent Gizlock from using his "Bomb" and "Shoot" abilities.
Click Here to Continue |confirm
]])
ZygorGuidesViewer:RegisterGuide("Dungeon Guides\\Classic\\The Temple of Atal'Hakkar (50-60)",{
author="support@zygorguides.com",
image=ZGV.IMAGESDIR.."The Temple of Atal'Hakkar",
description="This guide will walk you through The Temple of Atal'Hakkar dungeon.",
lfgid=1477,
},[[
step
Run up the stairs |goto Swamp of Sorrows 56.28,76.52 < 10 |only if walking
Enter the building |goto 56.33,76.26 < 10 |c
step
Follow the path down |goto 56.30,76.17 < 10 |walk
Swim through the water |goto 56.35,76.16 < 10 |walk
Run up the stairs |goto 56.45,75.80 < 10 |walk
Follow the path |goto 56.42,75.72 < 5 |walk
Continue following the path |goto 56.46,75.55 < 5 |walk
Run down the stairs |goto 56.51,75.57 < 5 |c
step
Follow the path |goto 56.72,75.73 < 5 |walk
Continue following the path |goto 56.90,75.89 < 10 |walk
Follow the path |goto 56.87,76.00 < 5 |walk
Continue following the path |goto 57.00,76.04 < 5 |walk
Continue following the path |goto 57.08,75.58 < 5 |c
step
Run down the stairs |goto 56.90,75.51 < 5 |walk
Follow the path |goto 56.93,75.37 < 5 |walk
Continue following the path |goto 56.81,75.32 < 5 |walk
Enter The Temple of Atal'Hakkar dungeon with your group |goto 56.81,75.17 < 5 |c
step
kill Atal'alarion##8580
|tip Clear the trash in the area as you travel around the platform.
|tip Once cleared, the group will need to spread out and click each Atal'ai Statue in the numbered order indicated on the map.
|tip The Atal'ai Statue will be green if done correctly and Atal'alrion will appear at the center of the room.
|tip He has a threat clearing abilitiy, so it will be important for the tank to keep taunt available.
|tip He will also knock players into the air who will take fall damage after.
|tip Healers should focus on the member who got knocked into the air as soon as they land.
|tip Tanks should keep the boss near a wall and be prepared to kite if the group healer gets knocked into the air.
Click Here to Continue |confirm
step
Kill the Atal'ai Defenders
|tip There will be 6 sub bosses you need to kill.
|tip To start, clear the Pit of Refuse of all mobs.
|tip You'll run up the stairs and reach an area similar to the Atal'ai Statue area for the previous boss.
|tip Instead of activating the Atal'ai Statues, there will be the bosses Loro, Gasher, Mijan, Zolo, Zul'lor and Hukku.
Click Here to Continue |confirm
step
kill Jammal'an the Prophet##5710
kill Ogom the Wretched##5711
|tip After defeating the Atal'ai Defenders, the way to Jammal'an will open up.
|tip Clear the trash in the Lair of the Chosen, watching out for Atal'ai Deathwalkers "Fear" abilitiy.
|tip Ghosts will spawn when some of the enemies die here, all of which you can do is kite run away from them.
|tip Engage once all enemies are clear.
|tip Separate Jammal'an and Ogum when the fight starts, killing Ogom as soon as possible.
|tip Then, spread out as best you can.
|tip Jammal'an will use the "Hex of Jammal'an" ability, transforming a party member into a hostil Berserker.
|tip Switch damage to the "Hex of Jammal'an" then burn down the boss as quick as possible.
Click Here to Continue |confirm
step
kill Dreamscythe##5721
kill Weaver##5720
|tip The tank should keep their back to the wall and keep all drakes facing away from the party.
|tip All of their abilities hit in front of it, so this will save you needless healing.
Click Here to Continue |confirm
step
kill Hazzas##5722
kill Morphaz##5719
|tip Similar to the last encounter, the tank should keep their back to the wall and keep all drakes facing away from the party.
|tip All of their abilities hit in front of it, so this will save you needless healing.
Click Here to Continue |confirm
step
kill Shade of Eranikus##5709
|tip Clear all dragon enemies before pulling this boss or they will swarm you.
|tip All ranged should stay at max distance to avoid being stunned by its "War Stomp" ability.
|tip The abilities "Fade" for Priest, "Blessing of Salvation" for Paladin and "Feint" for Rogues should be used to mitigate threat when possible.
|tip The target with the highest threat will be the target of Eranikus' "Deep Slumber" ability, which will make you unable to act for 15 seconds.
|tip Melee never stand in front of this boss.
|tip This is a long fight so side heals might be necessary.
Click Here to Continue |confirm
step
kill Avatar of Hakkar##8443
|tip Clear trash in the Sanctum of the Fallen God.
|tip This boss can only be summoned by using the "Egg of Hakkar" which is for the quest "The God Hakkar".
|tip Players whom have completed the quest can use "Yeh'kinya's Scroll" to summon as well.
|tip Once used, kill adds that spawn.
|tip Eventually, a Hakkari Bloodkeeper spawns.
|tip Collect the "Hakkari Blood" from their corpse and extinguish the Braziers in the room.
|tip Repeat the process until all are extinguished.
|tip The Avatar of Hakkar will use "Cause Insanity" on random players.
|tip CC or Stun the player if possible until it wears off.
|tip He will also use "Shadow Word: Pain" which should be dispelled when possible.
Click Here to Continue |confirm
]])
ZygorGuidesViewer:RegisterGuide("Dungeon Guides\\Classic\\Blackrock Depths (52-60)",{
author="support@zygorguides.com",
image=ZGV.IMAGESDIR.."Blackrock Depths",
description="This guide will walk you through the Blackrock Depths dungeon.",
lfgid=1584,
},[[
step
Follow the path up |goto Searing Gorge 33.53,75.22 < 20 |only if walking
Enter Blackrock Mountain |goto Searing Gorge 34.76,83.98 < 7 |walk
Run down the chain |goto Eastern Kingdoms 48.73,63.79 < 5 |walk
Run down the stairs |goto 48.65,64.16 < 5 |walk
Continue down the stairs |goto 48.62,64.26 < 5 |c
step
Run down the stairs |goto 48.62,64.11 < 7 |walk
Follow the path down |goto 48.68,64.07 < 7 |walk
Run down the chain |goto 48.58,64.09 < 5 |walk
Enter the building |goto 48.44,63.83 < 5 |walk
Follow the path |goto 48.15,63.34 < 15 |walk
Enter the Blackrock Depths dungeon with your group |goto 48.08,62.41 < 7 |c
step
kill High Interrogator Gerstahn##9018
|tip Her most dangerous ability is "Psychic Scream" which will fear the entire group, possibly leading to adds being pulled.
|tip "Fear Ward" and "Tremor Totem" will come in very handy during this encounter.
|tip Fight her in a corner of the room to try and control where your party runs during fear.
|tip Dispel her "Shadow Word: Pain" when applicable.
|tip Interrupt her "Mana Burn" when possible also.
|tip The "Prison Cell Key" is important to loot from her before moving on.
Click Here to Continue |confirm
step
kill Lord Roccor##9025
|tip This boss can use "Earth Shock" which will interrupt any casters spells and prevent casting for 2 seconds.
|tip It also casts "Flame Shock" which will leave a dot on a party member.
Click Here to Continue |confirm
step
kill Houndmaster Grebmar##9319
|tip Before engaging him, pull and kill the two packs of hounds patrolling the room with him.
|tip Range should keep their distance to avoid being interrupted with "Pummel".
|tip Other than that, this is a pretty straight forward encounter.
Click Here to Continue |confirm
step
Defeat the Ring of the Law
|tip There are multiple bosses that can appear in this event.
|tip Gorosh the Dervish: Spread out to avoid "Whirlwind" damage and try to heal outside of "Mortal Strike".
|tip Grizzle: Range should stay at max distance to avoid "Earth Shock".
|tip Eviscerator: If applicable, have a priest use "Shadow Protection".
|tip Ok'Thor the Breaker: He will use "Polymorph" on a random player in the group, which will need to be dispelled asap.
|tip Anub'Shiah: Dispel it's "Curse of Tongues" and "Enveloping Web" abilities immidiately.
|tip Hedrum the Creeper: Dispel the it's "Paralyzing Poison" and "Baneful Poison" when possible.
Click Here to Continue |confirm
step
kill Fineous Darkvire##9056
|tip Clear all enemies along the path he patrols before engaging.
|tip This boss hits very hard, so extra healing may be required.
|tip Be sure to interrupt his "Holy Light" as to not prolong the encounter.
|tip Ranged should keep their distance as he will interrupt you otherwise.
Click Here to Continue |confirm
step
kill Lord Incendius##9017
|tip The most important thing for this encounter is to not get knocked off the platform.
|tip Avoid its "Mighty Blow" ability to ensure that.
Click Here to Continue |confirm
step
kill Pyromancer Loregrain##9024
|tip This is an optional boss and may be skipped.
|tip Destroy his totems when they are summoned.
Click Here to Continue |confirm
step
kill Bael'Gar##9016
|tip This is an optional boss and may be skipped.
|tip He will spawn adds which need to be killed quickly.
|tip The tank will need to face him away from the group to prevent damage from "Magma Splash".
Click Here to Continue |confirm
step
kill General Angerforge##9033
|tip This boss is optional.
|tip During the encounter, he will summon adds which need to be AoE'd down.
|tip Aside from the tanks picking up adds, the fight is straight forward.
Click Here to Continue |confirm
step
kill Golem Lord Argelmach##8983
|tip This boss is optional.
|tip Have the group spread out as far as possible.
Click Here to Continue |confirm
step
kill Phalanx##9502
|tip Purchase 6 Dark Iron Ale Mugs from Plugger and give them to Private Rocknot.
|tip This will enrage him and cause Phalanx to burst through the door.
|tip The group should spread out as far as possible to avoid "Thunderclap".
|tip Heavy AoE healing will be needed for the encounter.
Click Here to Continue |confirm
step
kill Ambassador Flamelash##9156
|tip During the encounter, adds will spawn.
|tip They will need to be killed before reaching Flamelash.
Click Here to Continue |confirm
step
kill Panzor the Invincible##8923
|tip This is a rare mob that may not be available.
|tip Casters need to watch out for its "Spell Reflection" ability.
Click Here to Continue |confirm
step
Defeat the Chest of the Seven Encounter
|tip They will spawn and come at you one at a time.
|tip Each possesses a couple of weakened abilities from a class.
|tip Interrupt whenever possible and burn them down quickly.
Click Here to Continue |confirm
step
kill Magmus##9938
|tip To open the door, kill Shadowforge Flame Keepers and collect two Shadowforge Torches.
|tip Use them to light the braziers that open the door to Magmus.
|tip For this encounter, the tank will need to position Magmus properly.
|tip If this doesn't happen, the group will take heavy damage from the flame vents in the room.
Click Here to Continue |confirm
step
kill Emperor Dagran Thaurissan##9019
|tip During the encounter, your group will need to decide what to do with Princess Moira Bronzebeard.
|tip Keep her CC'd if you chose to save her while keeping her away from AoE damage.
|tip If you fail to keep her controlled, have a group member dedicated to interrupting her healing abilities.
|tip Kill adds then focus on the boss.
Click Here to Continue |confirm
]])
ZygorGuidesViewer:RegisterGuide("Dungeon Guides\\Classic\\Scholomance (58-60)",{
author="support@zygorguides.com",
image=ZGV.IMAGESDIR.."Scholomance",
description="This guide will walk you through the Scholomance dungeon.",
lfgid=2057,
},[[
step
Follow the path |goto Western Plaguelands 68.60,80.11 < 15 |only if walking
Follow the path up |goto 70.39,78.17 < 15 |only if walking
Continue up the path |goto 70.72,75.45 < 15 |only if walking
Run up the stairs |goto Scholomance 52.81,26.51 < 10 |only if walking
Enter the building |goto 52.78,26.43 < 10 |walk
click Scholomance Door
|tip This requires the Skeleton Key from the quest "The Key to Scholomance".
Enter the room |goto 52.75,26.41 < 10 |walk
Enter the Scholomance dungeon with your group |goto 52.70,26.38 < 7 |c
step
kill Blood Steward of Kirtonos##14861
|tip She has 3 abilities to look out for:
|tip "Curse of Impotence" reduces magic damage output on the target and can be removed by a Mage or Druid.
|tip "Curse of Weakness" reduces the melee damage output on the target and can be removed by a Mage or Druid.
|tip "Paralyzing Poison" should be removed by a Druid, Shaman or Paladin if possible.
Click Here to Continue |confirm
step
kill Kirtonos the Herald##10506
|tip This boss is summoned by "Blood of Innocents", obtained from Blood Steward of Kirtonos, Doctor Theolen Krastinov and Jandice Barov.
|tip Use it on the porch to summon Kirtonos.
|tip The tank should keep their back to the wall to prevent knockback.
|tip While in human form, he will use various curses that can be dispelled by Mages and Druids.
|tip Once he transforms into a Gargoyle, the fight becomes very straight forward.
Click Here to Continue |confirm
step
kill Jandice Barov##10503
|tip She will use the ability "Curse of Blood" which should be dispelled by Mages and Druids.
|tip She will also summon Illusions of herself, which will need to be killed.
|tip They cannot be AoE'd so you will need to single target damage all of them.
Click Here to Continue |confirm
step
kill Rattlegore##11622
|tip Carefully clear the area around Rattlegore before engaging.
|tip He hits hard, so this fight will be healing intensive.
|tip The tank should face him away from the group.
|tip The Viewing Room Key comes from this encounter, which lets you progress further into the dungeon.
Click Here to Continue |confirm
step
kill Marduk Blackpool##10433
|tip The tank should keep Marduk stationary when possible.
|tip Range should stand far enough back to avoid being hit by Defiling Aura.
|tip When he casts "Shadow Shield", melee will take extra damage each time they hit.
Click Here to Continue |confirm
step
kill Vectus##10432
|tip Avoid standing in his "Flamestrikes" radius when cast.
Click Here to Continue |confirm
step
kill Ras Frostwhisper##10508
|tip Clear the area around him before engaging.
|tip The tank should face him away from the group.
|tip If possible, interrupt his "Fear" ability, as well as his "Frostbolt Volley".
Click Here to Continue |confirm
step
kill Instructor Malicia##10505
|tip For this encounter, it is important to interrupt her "Heal" ability.
|tip Druids and Mages should keep an eye out for "Call of the Grave" which sould be dispelled as soon as possible.
Click Here to Continue |confirm
step
kill Doctor Theolen Krastinov##11261
|tip The tank should pull Theolen and keep their back to the wall.
|tip The tank should also save defensive abilities for when the boss reaches 50% health.
|tip He will gain 50% increased attack speed at that point, making the fight healing intensive.
Click Here to Continue |confirm
step
kill Lorekeeper Polkelt##10901
|tip He should be tanked at the lower level of the room, while all ranged stay at the top level and DPS/Heal from the balcony.
|tip Anyone afflicted by "Volatile Infection" needs to move away from the rest of the party.
Click Here to Continue |confirm
step
kill The Ravenian##10507
|tip The tank should stand with their back to a wall, facing Ravenian away from the group.
|tip Melee watch out for its "Cleave" and "Sundering Cleave" ability.
Click Here to Continue |confirm
step
kill Lord Alexei Barov##10504
|tip He is accompanied by two skeleton body guards which can be CC'd with either a Priests "Shackle Undead" or a Paladins "Turn Undead".
|tip In the room, there is green liquid on the ground which the group must stay out of.
|tip The tank must bull Alexei to max range from range so they don't take damage from "Unholy Aura".
|tip Mages and Druids must dispel "Veil of Shadow" when a party member is afflicted with it.
Click Here to Continue |confirm
step
kill Lady Illucia Barov##10502
|tip She used the "Dominate Mind" ability on random party members.
|tip Use CC abilities on them when it happens.
|tip Clear the entire room to avoid pulling adds from her "Fear" ability.
|tip She also uses the "Silence" ability, which will disable nearby casters from using spells.
Click Here to Continue |confirm
step
kill Darkmaster Gandling##1853
|tip The tank should keep him where he spawns if possible, while ranged stay stay at the top of the stairs.
|tip During the encounter, he will teleport a random player to one of the rooms where previous bosses were.
|tip That player will be locked in until the kill all enemies inside.
|tip This includes the tank!
|tip If the tank is teleported, you will need to kit the boss around the room until they are out.
|tip Interrupt "Arcane Missile" on rotation.
|tip Mages and Druids should dispel "Improved Shadow Bolt" as soon as possible.
Click Here to Continue |confirm
]])
ZygorGuidesViewer:RegisterGuide("Dungeon Guides\\Classic\\Stratholme - Live (58-60)",{
author="support@zygorguides.com",
image=ZGV.IMAGESDIR.."Stratholme",
description="This guide will walk you through the Stratholme - Live dungeon.",
lfgid=2017,
},[[
step
Cross the bridge |goto Eastern Plaguelands 30.85,20.48 < 15 |only if walking
Enter the Stratholme - Live dungeon with your group |goto Eastern Kingdoms 55.12,17.36 < 5 |c
stickystart "Kill_Postmaster_Malown"
step
click Premium Siabi Tobacco
|tip It's a small wooden box on the ground.
kill Fras Siabi##11058
|tip Spread out as best you can to avoid being hit by "Flame Breath".
|tip He will use "Smoke Bomb" which will stun anybody caught by it.
Click Here to Continue |confirm
step
kill Skul##10393
|tip This is a rare mob that may not be available.
|tip There are two spots he can spawn; Just before Fras Siabi and on the east portion of the map.
|tip Interrup its spells when possible.
Click Here to Continue |confirm
step
kill Hearthsinger Forresten##10558
|tip This is a rare mob that may not be available.
|tip He can spawn after the rat gate.
|tip Spread out a little to avoid being hit with "Multi-Shot".
|tip He will randomly cast "Enchanting Lullaby" on a random player.
Click Here to Continue |confirm
step
kill The Unforgiven##10516
|tip This boss spawns as you walk through the gate at the opposite end to where Timmy the Cruel is.
|tip Be sure your health and mana are healed up before passing through the gate.
|tip He will have non elite adds along with him.
Click Here to Continue |confirm
step
label "Kill_Postmaster_Malown"
kill Postmaster Malown##11143
|tip To summon this boss, kill "Stratholme Couriers" found throughout the instance.
|tip Collect the "Market Row Postbox Keys".
|tip Next, find and open 3 of the locked Mailboxes.
|tip Each mailbox will spawn a group of hard-hitting elites.
|tip Let the tank open them if possible.
|tip On the 3rd, Malown will spawn close to where Fras Siabi was.
|tip If you haven't already, clear the area to avoid pulling adds during "Fear".
|tip Mages and Druids should dispel "Curse of Tongues" when possible.
Click Here to Continue |confirm |notinsticky
step
kill Timmy the Cruel##10808
|tip He will heal while using "Ravenous Claw", but other than that the fight is straight forward.
Click Here to Continue |confirm
step
kill Malor the Zealous##11032
|tip During the fight, he will use the "Lay on Hands" ability which will heal him significantly.
|tip The chest behind him contains the "Medallion of Faith" for the quest The Medallion of Faith.
Click Here to Continue |confirm
step
click Blacksmithing Plans
|tip They are on the floor near boxes in the room.
kill Crimson Hammersmith##11120
|tip This mob can be skipped if no one in the group needs the "Bottom Half of Advanced Armorsmithing: Volume II" for Blacksmithing.
Click Here to Continue |confirm
step
kill Cannon Master Willey##10997
|tip He has no special abilities to account for.
Click Here to Continue |confirm
step
kill Archivist Galford##10811
|tip His ability "Burning Winds" is a high damage DoT that will make this fight healing intensive.
|tip If the tank is hit with the ability, the Galford may swap targets.
Click Here to Continue |confirm
step
kill Balnazzar##10813
|tip He uses the "Domination" ability on random players in the group.
|tip Use CC on them to mitigate any damage they might do to the part.
|tip Casters should stand at max range to avoid being feared.
Click Here to Continue |confirm
]])
ZygorGuidesViewer:RegisterGuide("Dungeon Guides\\Classic\\Stratholme - Undead (58-60)",{
author="support@zygorguides.com",
image=ZGV.IMAGESDIR.."Stratholme",
description="This guide will walk you through the Stratholme dungeon.",
lfgid=2018,
},[[
step
Follow the path |goto Eastern Plaguelands 47.90,31.58 < 15 |only if walking
click Elders' Square Service Gate
|tip This requires the Key to the City, which drops from Magistrate barthilas in Stratholme - Live.
Enter the gate |goto 47.86,23.87 < 7
Enter the Stratholme - Undead dungeon with your group |goto 48.23,21.88 < 5 |c
step
kill Magistrate Barthilas##10435
|tip The tank should keep their back to the wall.
|tip He uses the "Mighty Blow" ability which will knockback the tank.
Click Here to Continue |confirm
stickystart "Kill_Stonespine"
step
kill Nerub'enkan##10437
|tip During the fight, it will summon "Crypt Scarabs" which will need to be AoE'd down.
|tip It also uses "Pierce Armor" on the tank.
|tip When this happens, the tank should use damage mitigating abilities.
Click Here to Continue |confirm
step
click Blacksmithing Plans
|tip They are near the buildings to the right of Baroness Anastari.
kill Black Guard Swordsmith##11121
|tip This mob can be skipped if no one in the group needs the "Bottom Half of Advanced Armorsmithing: Volume I" for Blacksmithing.
Click Here to Continue |confirm
step
kill Baroness Anastari##10436
|tip She will use the "Possess" ability which will mind control a random party member.
|tip To break the Possess, you will need to damage the target to 50% health.
|tip "Banshee Curse" should be dispelled by Mages and Druids.
|tip She will also use the "Silence" ability randomly throughout the encounter.
Click Here to Continue |confirm
step
label "Kill_Stonespine"
kill Stonespine##10809
|tip This is a rare mob that may not be available.
|tip It uses the "Vicious Rend" ability which will inflict heavy damage to the target.
Click Here to Continue |confirm |notinsticky
step
kill Maleki the Pallid##10438
|tip He uses the ability "Ice Tomb" which most of the time will target the tank.
|tip DPS should slow when this happen so they don't pull aggro.
Click Here to Continue |confirm
step
kill Ramstein the Gorger##10439
|tip Clear the room before engaging the boss.
|tip Tank him with your back when possible.
Click Here to Continue |confirm
step
kill Baron Rivendare##10440
|tip The tank should pull him to the right side of the room.
|tip Ranged should stand atop the bone piles located throughout the room.
|tip Melee stack up behind the boss to avoid the "Cleave" ability.
|tip When the adds spawn, dps should focus them down before going back to the boss.
Click Here to Continue |confirm
]])
ZygorGuidesViewer:RegisterGuide("Dungeon Guides\\Classic\\Dire Maul East (58-60)",{
author="support@zygorguides.com",
image=ZGV.IMAGESDIR.."Dire Maul",
description="This guide will walk you through the Dire Maul - East dungeon.",
lfgid=2557,
},[[
step
Run up the ramp |goto Feralas 59.14,45.02 < 10 |only if walking
Follow the path |goto 59.51,39.40 < 15 |only if walking
Continue following the path |goto 61.99,37.10 < 10 |only if walking
Enter the tunnel |goto 65.50,35.24 < 5 |walk
Enter the Dire Maul - East dungeon with your group |goto Kalimdor 44.27,68.40 < 5 |c
step
kill Pusillin##14354
|tip He drops the "Crescent Key" which is needed for progression in the dungeon.
|tip To start, engaging him will cause 4 Wildspawn Imps to spawn.
|tip AoE them down as quickly as possible.
|tip Interrupt his "Fireball" ability when possible.
|tip When he has the "Spirit of Runn Tum" buff, he has a 50% chance to reflect spells back to casters.
Click Here to Continue |confirm
step
kill Lethtendris##14327
|tip Interrupt her "Void Bolt" when possible.
|tip Mages and Druids should dispel "Curse of Tongues" and "Curse of Thorns" when group members are afflicted.
|tip Kill her imp, Pimgib, then her after.
Click Here to Continue |confirm
step
kill Hydrospawn##13280
|tip Kill the Hydrolings that spawn before focusing on the boss.
Click Here to Continue |confirm
step
kill Zevrim Thornhoof##11490
|tip During the encounter, he will teleport random group members to his ritual and cast "Sacrifice" on them.
|tip The target will need big heals to survive.
|tip He will also use an AoE ability "Shadow Word: Pain" which should be dispelled as quickly as possible.
Click Here to Continue |confirm
step
kill Alzzin the Wildshaper##11492
|tip Clear all mobs as you go down the ramp, or they will aggro as adds when you begin the encounter.
|tip During the encounter, Alzzin will shapeshift, dropping all established aggro.
|tip Give the tank time to establish aggro before resuming DPS.
|tip Cleanse the "Wither" spell he casts when possible.
|tip When he casts "Wither" it can also be interrupted.
Click Here to Continue |confirm
]])
ZygorGuidesViewer:RegisterGuide("Dungeon Guides\\Classic\\Dire Maul North (58-60)",{
author="support@zygorguides.com",
image=ZGV.IMAGESDIR.."Dire Maul",
description="This guide will walk you through the Dire Maul - North dungeon.",
lfgid=2558,
},[[
step
Run up the ramp |goto Feralas 59.14,45.02 < 10 |only if walking
Follow the path |goto 59.51,39.40 < 15 |only if walking
Enter the tunnel |goto 62.81,34.89 < 7 |only if walking
Run up the ramp |goto Kalimdor 43.32,66.69 < 20 |only if walking
click Door
|tip You need a Crescent Key to unlock this door.
|tip This drops from Pusillin in the "Dire Maul - East" dungeon.
Enter the tunnel |goto 43.39,66.52 < 5 |only if walking
Enter the Dire Maul - North dungeon with your group |goto 43.45,66.52 < 5 |c
step
kill Guard Mol'dar##14326
|tip Ranged should keep at a distance to avoid his "Knock Away" and "Shield Charge" abilities.
Click Here to Continue |confirm
step
kill Stomper Kreeg##14322
|tip His main ability is "Booze Spit" which will reduce the groups accuracy by 75%.
Click Here to Continue |confirm
step
kill Guard Fengus##14321
|tip Like Mol'dar, ranged should keep a distance to avoid being hit by "Knock Away" and "Shield Charge".
Click Here to Continue |confirm
step
kill Guard Slip'kik##14323
|tip Like Mol'dar, ranged should keep a distance to avoid being hit by "Knock Away" and "Shield Charge".
Click Here to Continue |confirm
step
kill Captain Kromcrush##14325
|tip He hits hard so the fight will be healing intensive.
|tip He uses the ability "Intimidating Shout" which will fear your group, so clear the room.
|tip At 50% Health he summons 2 Gordok Reavers, which should be CC'd.
|tip Casters stay at max range of the boss.
Click Here to Continue |confirm
step
kill Cho'Rush the Observer##14324
kill King Gordok##11501
|tip DPS should focus on killing Cho'Rush first.
|tip Keep an eye out for King Gordok's "Heal" ability and interrupt it when possible.
Click Here to Continue |confirm
]])
ZygorGuidesViewer:RegisterGuide("Dungeon Guides\\Classic\\Dire Maul West (58-60)",{
author="support@zygorguides.com",
image=ZGV.IMAGESDIR.."Dire Maul",
description="This guide will walk you through the Dire Maul - West dungeon.",
lfgid=2559,
},[[
step
Run up the ramp |goto Feralas 42.75,70.26 < 10 |only if walking
Follow the path |goto 42.77,69.24 < 15 |only if walking
Continue following the path |goto 43.29,69.17 < 10 |only if walking
Continue following the path |goto 43.30,68.63 < 10 |only if walking
Follow the path |goto 43.48,68.52 < 10 |c
step
Run down the ramp |goto 43.31,68.32 < 10 |only if walking
Follow the path |goto 43.14,68.10 < 10 |only if walking
Run up the ramp |goto 43.11,67.66 < 10 |only if walking
click Door
|tip This drops from Pusillin in the "Dire Maul - East" dungeon.
Enter the door |goto 42.98,67.51 < 10 |walk
Enter the Dire Maul - West dungeon with your group |goto 42.98,67.45 < 7 |c
step
kill Tendris Warpwood##11489
|tip Clear all ancients in the area before engaging Tendris.
|tip Melee should move away when it uses the "Trample" ability.
|tip Range stand at max distance to avoid being hit with "Entangle".
Click Here to Continue |confirm
step
kill Magister Kalendris##11487
|tip Dispel "Shadow Word: Pain" when an ally is afflicted by it.
|tip Interrupt his "Mind Blast" and "Mind Flay" spells when possible.
|tip Use CC abilities on group members who are afflicted by "Dominate Mind".
Click Here to Continue |confirm
step
kill Tsu'zee##11467
|tip This will be a healing intensive encounter.
|tip Dispel her "Blind" ability on allies when afflicted.
Click Here to Continue |confirm
step
kill Illyanna Ravenoak##11488
|tip The group should stand in melee range to avoid her abilities.
|tip Kill Illyanna, then Ferra after.
Click Here to Continue |confirm
step
kill Immol'thar##11496
|tip He will use the "Eye of Immol'thar" ability during the encounter, spawning eye enemies around the room.
|tip Designate a ranged attack to deal with them.
|tip At 50% health, he will enrage, increasing his attack speed by 60%.
|tip At this point, it will become a healing intensive encounter.
Click Here to Continue |confirm
step
kill Prince Tortheldrin##11486
|tip This is a healing intensive fight.
|tip The tank should face their back to the wall to avoid being knocked back by his "Arcane Blast" ability.
|tip When Arcane Blast is used, his aggro will reset, so it's best to stop DPS until the tank can establish aggro once more.
Click Here to Continue |confirm
]])
ZygorGuidesViewer:RegisterGuide("Dungeon Guides\\Classic\\Dire Maul North Tribute (58-60)",{
author="support@zygorguides.com",
image=ZGV.IMAGESDIR.."Dire Maul",
description="This guide will walk you through the Dire Maul North dungeon.",
lfgid=2558,
},[[
step
collect Frost Oil##3829
|tip An Alchemist can make this with 4 Khadgar's Whisker, 2 Wintersbite and 1 Leaded Vial.
|tip You can also purchase this from the Auction House.
step
collect Thorium Widget##15994
|tip An Engineer can make this with 3 Thorium Bars and 1 Runecloth.
|tip You can also purchase this from the Auction House.
step
Enter Dire maul - North
|tip In the Tribute run, you won't be killing any boss save for King Gordok.
Click Here to Continue |confirm
step
Avoid Guard Mol'dar
|tip To accomplish this, avoid entering the Courtyard in the first area.
|tip Run along the ledges of the room.
Click Here to Continue |confirm
step
Avoid Stomper Kreeg
|tip He has a short aggro range.
|tip By moving along the left side of the room as soon as you enter the instance you will completely avoid him.
Click Here to Continue |confirm
step
Avoid Guard Fengus
|tip Hug the right side of the room, the use the ramp up North to sneak to Fengus' Chest.
|tip He patrols around the area so keep an eye out.
click Fengus's Chest
collect Gordok Courtyard Key##18266
Click Here to Continue |confirm
step
Avoid Guard Slip'kik
|tip Clear the room of trash while watching for his patrol.
click Broken Trap
turnin A Broken Trap##1193
|tip Activate the trap, then drag Guard Slip'kik to it.
Click Here to Continue |confirm
step
For Captain Kromcrush:
use the Gordok Ogre Suit##18258
|tip Clear nearby trash without pulling him before doing this.
talk Captain Kromcrush##14325
Tell him _"Um, I'm taking some prisoners we found outside before the king for punishment."_
|tip If someone else in the group has the suit and you don't, they will need to do this.
|tip A member of the group will need the Gordok Inner Door Key from Guard Mol'dar from a previous run.
Click Here to Continue |confirm
step
kill King Gordok##11501
|tip Use CC on Cho'Rush the Observer when possible.
|tip Be sure not to kill Cho'Rush the Observer.
step
click Gordok Tribute
|tip It's at Gordok's seat just before the boss encounter.
]])
ZygorGuidesViewer:RegisterGuide("Dungeon Guides\\Classic\\Lower Blackrock Spire (55-60)",{
author="support@zygorguides.com",
image=ZGV.IMAGESDIR.."Lower Blackrock Spire",
description="This guide will walk you through the Lower Blackrock Spire dungeon.",
lfgid=1583,
},[[
step
Follow the path up |goto Searing Gorge 33.53,75.22 < 20 |only if walking
Enter Blackrock Mountain |goto Searing Gorge 34.76,83.98 < 7 |walk
Run up the chain |goto Eastern Kingdoms 48.73,63.79 < 5 |walk
Jump down here |goto 48.77,63.67 < 5 |walk
Follow the path up |goto 48.83,63.66 < 5 |walk
Enter the building |goto 48.91,63.92 < 5 |walk
Enter the Blackrock Spire dungeon with your group |goto 48.95,63.88 < 7 |c
step
kill Spirestone Butcher##9219
|tip This is a rare mob that may not be available.
Click Here to Continue |confirm
step
kill Spirestone Battle Lord##9218
|tip This is a rare mob that may not be available.
Click Here to Continue |confirm
step
kill Highlord Omokk##9196
|tip CC one of the two adds that accompany him.
|tip The tank should stand away from the group after picking up Highlord Omokk.
|tip Ranged should stand with their backs to a wall.
|tip If you can't CC more than one, kill the add, then Omokk.
|tip Omokk hits hard so the fight will be healing intensive.
Click Here to Continue |confirm
step
kill Shadow Hunter Vosh'gajin##9236
|tip She will be accompanied by 2 "Smolderthorn Shadow Priests".
|tip CC one of them.
|tip The tank should take Shadow Hunter Vosh'gajin away from the group.
|tip DPS down the Priests one at a time, then focus on Shadow Hunter Vosh'gajin.
|tip Mages and Druids should remove the "Curse of Blood" ability.
|tip Spread out as best as possible to avoid multiple group members being afflicted by "Hex".
Click Here to Continue |confirm
step
kill War Master Voone##9237
|tip Clear the rooms leading up to him before engaging.
|tip War master Voone hits hard, so this will be a healing intensive fight.
|tip Wait for the tank to establish aggro before DPS jumps in.
|tip The tank should have their back to a wall during the encounter.
|tip If Voone changes targets, all DPS should stop until the tank re establishes aggro.
Click Here to Continue |confirm
step
kill Bannok Grimaxe##9596
|tip This is a rare mob that may not be available.
|tip He can spawn in any of the packs of mobs around tents, and sometimes patrols.
Click Here to Continue |confirm
step
kill Mother Smolderweb##10596
|tip On the way to her, Druids can use the "Hibernate" ability to CC them if one is available.
|tip When you reach her, the tank should face her away from the group to avoid her "Crystallize" ability.
|tip Her "Mother's Milk" ability will temporarily stun party members.
Click Here to Continue |confirm
step
kill Crystal Fang##10376
|tip This is a rare mob that may not be available.
Click Here to Continue |confirm
step
kill Urok Doomhowl##10584
|tip Collect the Pike on the ledge just after Mother Smolderweb.
|tip Whoever picked up Omokk's Head should do this.
|tip Clear the room of ogres then combine the two to summon Urok Doomhowl.
|tip After, waves of elite ogres will spawn.
|tip Clicking the pike will insta kill one of the ogres every 30 seconds.
|tip Use CC on additional ogres to mitigate damage to the group.
|tip Eventually, Urok will spawn.
|tip Let your tank establish aggro before engaging.
Click Here to Continue |confirm
step
kill Quartermaster Zigris##9736
|tip Clear the entire room that he patrols before engaging him.
|tip Avoid him when possible, until the room is clear by waiting for him to patrol past the group.
Click Here to Continue |confirm
step
kill Halycon##10220
|tip Halycon will be accompanied by "Worg Pups" which will need to be AoE'd down.
|tip The tank should pick up Halycon while this is happening, establishing aggro.
|tip Once the adds are taken care of, DPS should move to Halycon.
|tip Replenish health and mana as soon as it dies as the next boss will be entering the room.
Click Here to Continue |confirm
step
kill Gizrul the Slavener##10268
|tip This boss hits hard, so it will be a healing intensive fight.
|tip It heals with each use of "Fatal Bite", dealing out massive damage to the tank.
|tip It will also use the "Infected Bite" ability on your tank.
|tip Let the tank establish aggro before starting DPS.
Click Here to Continue |confirm
step
kill Overlord Wyrmthalak##9568
|tip The tank needs to face Wyrmthalak away from the group.
|tip Melee be sure to stand behind him to avoid its "Cleave" ability.
|tip CC adds as the spawn and DPS Overlord Wyrmthalak as fast as possible, moving to the adds after he is dealth with.
Click Here to Continue |confirm
]])
ZygorGuidesViewer:RegisterGuide("Dungeon Guides\\Classic\\Upper Blackrock Spire (55-60)",{
author="support@zygorguides.com",
image=ZGV.IMAGESDIR.."Upper Blackrock Spire",
description="This guide will walk you through the Upper Blackrock Spire dungeon.",
lfgid=1582,
},[[
step
Follow the path up |goto Searing Gorge 33.53,75.22 < 20 |only if walking
Enter Blackrock Mountain |goto Searing Gorge 34.76,83.98 < 7 |walk
Run up the chain |goto Eastern Kingdoms 48.73,63.79 < 5 |walk
Jump down here |goto 48.77,63.67 < 5 |walk
Follow the path up |goto 48.83,63.66 < 5 |walk
Enter the building |goto 48.91,63.92 < 5 |walk
Enter the Blackrock Spire dungeon with your group |goto 48.95,63.88 < 7 |c
step
click Blackrock Altar
|tip This will start the fight.
kill Pyroguard Emberseer##9816
|tip The Tank should keep him away from the group.
|tip Melee will need extra heals during the encounter from its AoE attacks.
Click Here to Continue |confirm
step
kill Solakar Flamewreath##10264
|tip Clear all dragon spawn before starting the event.
|tip Click on father flame and take the item to start the event.
|tip DPS need to focus down "Rookery Hatchers" as quickly as possible.
|tip AoE down whelps that spawn meanwhile.
|tip Tanks pick up "Rookery Guardians" as soon as they appear.
|tip Tanks should have their backs to the wall for these.
|tip After a bit, Solakar will spawn, who will also need to be tanked with against the wall.
|tip Finish off the whelps before switching DPS to Solakar.
|tip Hug the wall after to avoid spawning additional whelps.
Click Here to Continue |confirm
step
kill Jed Runewatcher##10509
|tip This is a rare mob that may not be available.
|tip The tank should have their back to the wall.
|tip All ranged should be at max distance as well.
Click Here to Continue |confirm
step
kill Goraluk Anvilcrack##10899
|tip The tank should have their back to the wall.
|tip All ranged should be at max distance as well.
Click Here to Continue |confirm
step
kill Warchief Rend Blackhand##10429
kill Gyth##10339
|tip They will spawn after clearing the gauntlet of orcs and dragon spawn.
|tip Focus on Flame Tongues, Dragonguard, Dragon Spawn, Chromatic Dragonspawn, Chromatic Whelps then Blackhand Orcs in that order.
|tip When Gyth appears, the tank should face it away from the group.
|tip At 20%, Rend will join the fight.
|tip The Offtank should immediately grab Rend.
|tip Finish off Gyth before switching to Warchief Rend Blackhand.
|tip Melee move out of range when he casts the "Whirlwind" ability.
Click Here to Continue |confirm
step
kill The Beast##10430
|tip It's "Berserker Charge" ability targets the player with the most aggro.
|tip The tanks must ensure that they have the highest aggro at all times.
|tip All ranged should stand at max range to avoid its "Fear" ability.
|tip The final ability will be "Flamebreak".
|tip It will knockback anyone near it, so the tanks should fight The Beast with their back to the wall.
Click Here to Continue |confirm
step
kill General Drakkisath##10363
|tip To start, if you have a hunter, you can have them kite General Drakkisath into The Beasts room and feign death while the group burns down the "Chromatic Elite Guards".
|tip You can also tank all 3 where they stand, AoEing down the Elite Guards as quickly as possible.
|tip Melee should stand behind Drakkisath at all times.
|tip The Tank should have their back to the wall.
Click Here to Continue |confirm
]])
ZygorGuidesViewer:RegisterGuide("Dungeon Guides\\Classic\\Wailing Caverns Quests",{
author="support@zygorguides.com",
image=ZGV.IMAGESDIR.."Wailing Caverns",
description="This guide will walk you through completing the Wailing Caverns quests.",
condition_suggested=function() return level >= 15 and level <= 25 and not completedq(3370) end,
condition_end=function() return completedq(3370) end,
},[[
step
Reach Level 15 |ding 15
|tip Use the Leveling guides to accomplish this.
step
talk Mebok Mizzyrix##3446
accept Raptor Horns##865 |goto The Barrens 62.37,37.62
step
kill Sunscale Scytheclaw##3256+
|tip They look like purple raptors.
collect 5 Intact Raptor Horn##5055 |q 865/1 |goto 43.36,15.57
You can find more around [45.27,14.94]
step
talk Mebok Mizzyrix##3446
turnin Raptor Horns##865 |goto 62.37,37.62
accept Smart Drinks##1491 |goto 62.37,37.62
step
talk Crane Operator Bigglefuzz##3665
accept Trouble at the Docks##959 |goto 63.09,37.61
step
Follow the path up |goto 50.32,35.44 < 10 |only if walking
Continue up the path |goto 49.17,34.09 < 10 |only if walking
Follow the path |goto 48.09,32.95 < 10 |only if walking
Follow the path down |goto 47.28,33.56 < 10 |only if walking
Jump down here |goto 45.86,35.86 < 10 |only if walking
Jump down carefully here |goto 45.77,36.16 < 5 |c |q 3370 |future |or
|tip Aim for the stone.
'|condition completedq(1486) and completedq(1487)
step
Enter the cave |goto 45.85,35.95 < 5 |walk
talk Nalpak##5767
|tip Inside the cave.
accept Deviate Hides##1486 |goto 45.98,35.66
step
talk Ebru##5768
|tip Inside the cave.
accept Deviate Eradication##1487 |goto 46.01,35.74
step
Enter the cave |goto 45.97,36.33 < 10 |walk
Follow the path |goto 45.91,35.62 < 10 |walk
Continue follow the path |goto 46.26,34.98 < 10 |walk
Follow the path |goto 45.94,34.24 < 10 |walk
kill Mad Magglish##3655
|tip He is stealthed inside the cave.
collect 99-Year-Old Port##5334 |q 959/1 |goto 45.69,33.60
You can also find him around: |notinsticky
[46.84,34.63]
[46.47,35.50]
step
Follow the path |goto 46.10,34.07 < 10 |walk
Continue following the path |goto 45.92,32.78 < 10 |walk
Cross the water |goto 46.50,32.37 < 10 |walk
Follow the path |goto 47.37,32.80 < 10 |walk
Cross the bridge |goto 47.50,33.77 < 10 |walk
Enter the Wailing Caverns Dungeon with your Group |goto 47.75,34.86 < 10 |q 3370 |future
stickystart "Collect_6_Wailing_Essence"
stickystart "Collect_20_Deviate_Hide"
stickystart "Slay_7_Deviate_Ravager"
stickystart "Slay_7_Deviate_Viper"
stickystart "Slay_7_Deviate_Shambler"
stickystart "Slay_7_Deviate_Dreadfang"
step
_Inside the Wailing Caverns Dungeon:_
kill Lady Anacondra##3671
|tip She is the first boss of the dungeon.
|tip She can spawn at several locations in the Screaming Gully.
Click Here to Continue |confirm |q 3370 |future
step
_Inside the Wailing Caverns Dungeon:_
kill Lord Cobrahn##3669
|tip He is the second boss of the dungeon.
|tip Follow the water path west from the Screaming Gully into the Pit of Fangs.
|tip Follow the path up and around through the Pit of Fangs.
Click Here to Continue |confirm |q 3370 |future
step
_Inside the Wailing Caverns Dungeon:_
kill Lord Pythas##3670
|tip He is the third boss of the dungeon.
|tip Leave the Pit of Fangs and reenter the Screaming Gully.
|tip Follow the water path east to briefly enter The Wailing Caverns and then the Crag of the Everliving.
|tip Continue through the Crag of the Everliving to reach the Winding Chasm.
|tip Immediately after reaching the Winding Chasm, follow the right path northeast through the small pool of water.
|tip He is back in the northern part of the Winding Chasm.
Click Here to Continue |confirm |q 3370 |future
step
_Inside the Wailing Caverns Dungeon:_
kill Lord Serpentis##3673
|tip After killing Lord Pythas in the Winding Chasm, head southeast to enter The Wailing Caverns.
|tip Continue south a short distance and head left after reaching an area with lots of small white candles on the ground and a Druid of the Fang.
|tip You will now be back in the Winding Chasm, continue straight southeast through this cave section, passing a pool of water on your left.
|tip You will reach a fenced off area with two Druid of the Fang guards and an optional boss, Skum.
|tip Follow the path to the right of the fence and continue going southwest to reach the Crag of the Everliving.
|tip Carefully jump across the gap by the small waterfall and continue along this upper path to reach Lord Serpentis.
Click Here to Continue |confirm |q 3370 |future
step
label "Collect_6_Wailing_Essence"
_Inside the Wailing Caverns Dungeon:_ |notinsticky
Kill Ectoplasm enemies around this area
|tip They are found throughout the dungeon.
collect 6 Wailing Essence##6464 |q 1491/1
step
label "Collect_20_Deviate_Hide"
_Inside the Wailing Caverns Dungeon:_ |notinsticky
Kill Deviate enemies around this area
|tip They are found throughout the dungeon.
collect 20 Deviate Hide##6443 |q 1486/1
step
label "Slay_7_Deviate_Ravager"
_Inside the Wailing Caverns Dungeon:_ |notinsticky
kill 7 Deviate Ravager##3636 |q 1487/1
|tip They are found in the Screaming Gully.
step
label "Slay_7_Deviate_Viper"
_Inside the Wailing Caverns Dungeon:_ |notinsticky
kill 7 Deviate Viper##5755 |q 1487/2
|tip They are found in the Pit of Fangs.
step
label "Slay_7_Deviate_Shambler"
_Inside the Wailing Caverns Dungeon:_ |notinsticky
kill 7 Deviate Shambler##5761 |q 1487/3
|tip They are found in the Crag of the Everliving.
step
label "Slay_7_Deviate_Dreadfang"
_Inside the Wailing Caverns Dungeon:_ |notinsticky
kill 7 Deviate Dreadfang##5056 |q 1487/4
|tip They are found in the Winding Chasm.
step
_Inside the Wailing Caverns Dungeon:_
talk Disciple of Naralex##3678
|tip He is standing at the dungeon entrance.
Tell him _"Let the event begin!"_
|tip This will only be an available option once the previous bosses have been killed.
Escort the Disciple of Naralex
|tip Kill the enemies that spawn and attack and don't let him die.
|tip This will be easier if the Screaming Gully is already cleared of enemies.
kill Mutanus the Devourer##3654
|tip He will spawn at Dreamer's Rock, after several waves of enemies.
collect Glowing Shard##10441 |or
'|condition completedq(3366,6981) |or
step
use the Glowing Shard##10441
accept The Glowing Shard##3366 |or
'|accept The Glowing Shard##6981 |or
step
Leave the Wailing Caverns Dungeon
Click Here to Continue |confirm |q 3370 |future
step
Follow the path up |goto 47.59,34.46 < 7 |only if walking
Cross the bridge |goto 47.52,33.91 < 7 |only if walking
Continue following the path |goto 47.41,32.89 < 7 |only if walking
Cross the water |goto 46.91,32.63 < 10 |only if walking
Continue following the path |goto 45.86,33.34 < 10 |only if walking
Leave the cave |goto 45.95,36.21 < 7 |c |q 3370 |future
step
Follow the path up |goto 50.32,35.44 < 10 |only if walking
Continue up the path |goto 49.17,34.09 < 10 |only if walking
Follow the path |goto 48.09,32.95 < 10 |only if walking
Follow the path down |goto 47.28,33.56 < 10 |only if walking
Jump down here |goto 45.86,35.86 < 10 |only if walking
Jump down carefully here |goto 45.77,36.16 < 5 |c |q 3370 |future |or
|tip Aim for the stone.
'|condition completedq(1486) and completedq(1487) |or
step
Enter the cave |goto The Barrens 45.85,35.95 < 5 |walk
talk Nalpak##5767
|tip Inside the cave.
turnin Deviate Hides##1486 |goto The Barrens 45.98,35.66
step
talk Ebru##5768
|tip Inside the cave.
turnin Deviate Eradication##1487 |goto 46.01,35.74
step
talk Mebok Mizzyrix##3446
turnin Smart Drinks##1491 |goto 62.37,37.62
step
talk Crane Operator Bigglefuzz##3665
turnin Trouble at the Docks##959 |goto 63.09,37.61
step
talk Sputtervalve##3442
Tell him _"Tell me about the Glowing Shard."_
Speak with Someone in Ratchet About the Glowing Shard |q 3366/1 |goto 62.98,37.22 |only if haveq(3366) or completedq(3366)
Speak with Someone in Ratchet About the Glowing Shard |q 6981/1 |goto 62.98,37.22 |only if haveq(6981) or completedq(6981)
step
Follow the path up |goto 50.32,35.44 < 10 |only if walking
Continue up the path |goto 49.17,34.09 < 10 |only if walking
talk Falla Sagewind##8418
|tip Inside the building.
turnin The Glowing Shard##3366 |goto 48.18,32.78 |only if haveq(3366) or completedq(3366)
turnin The Glowing Shard##6981 |goto 48.18,32.78 |only if haveq(6981) or completedq(6981)
accept In Nightmares##3370 |goto 48.18,32.78
step
Enter the building |goto Darnassus 35.52,10.69 < 5 |walk
talk Mathrengyl Bearwalker##4217
|tip Upstairs inside the building.
turnin In Nightmares##3370 |goto 35.40,8.40
]])
ZygorGuidesViewer:RegisterGuide("Dungeon Guides\\Classic\\The Deadmines Quests",{
author="support@zygorguides.com",
image=ZGV.IMAGESDIR.."Deadmines",
description="This guide will walk you through completing The Deadmines quests.",
condition_suggested=function() return level >= 16 and level <= 25 and not completedq(168) end,
condition_end=function() return completedq(168) end,
},[[
step
Reach Level 16 |ding 16
|tip Use the Leveling guides to accomplish this.
step
talk Wilder Thistlenettle##656
|tip Inside the building.
accept Oh Brother...##167 |goto Stormwind City/0 70.31,40.85
accept Collecting Memories##168 |goto 70.31,40.85
step
talk Shoni the Shilent##6579
accept Underground Assault##2040 |goto 62.63,34.12
step
talk Gryan Stoutmantle##234
accept The Defias Brotherhood##65 |goto Westfall 56.33,47.52
step
Enter the building |goto Redridge Mountains 26.61,46.41 < 7 |walk
talk Wiley the Black##266
|tip Upstairs inside the building.
turnin The Defias Brotherhood##65 |goto 26.48,45.35
accept The Defias Brotherhood##132 |goto 26.48,45.35
step
talk Gryan Stoutmantle##234
turnin The Defias Brotherhood##132 |goto Westfall 56.33,47.52
accept The Defias Brotherhood##135 |goto 56.33,47.52
step
talk Master Mathias Shaw##332
|tip Upstairs inside the building.
turnin The Defias Brotherhood##135 |goto Stormwind City 78.31,70.74
accept The Defias Brotherhood##141 |goto Stormwind City 78.31,70.74
step
talk Gryan Stoutmantle##234
turnin The Defias Brotherhood##141 |goto Westfall 56.33,47.52
accept The Defias Brotherhood##142 |goto 56.33,47.52
step
map Westfall
path loop off
path	55.6,47.6	56.6,54.0	57.4,62.0	55.0,66.4	50.2,64.0
path	45.6,65.6	44.0,69.6
Check For the Defias Messenger Along This Path
kill Defias Messenger##550
|tip He walks along the road between Jangolode Mine and Moonbrook.
|tip He walks into Gold Coast Quarry before traveling to either Jangolode Mine or Moonbrook.
|tip Run on the road while looking for him.
|tip He spawns around this location, so it may be easier to kill enemies around this area while waiting for him to either spawn or walk here.
collect A Mysterious Message##1381 |q 142/1
step
talk Gryan Stoutmantle##234
turnin The Defias Brotherhood##142 |goto Westfall 56.33,47.52
step
talk The Defias Traitor##467
|tip This is an escort quest.
|tip If he's not here, someone may be escorting him.
|tip Wait until he respawns.
accept The Defias Brotherhood##155 |goto 55.68,47.50 |noautoaccept
step
Watch the dialogue
|tip Follow the Defias Traitor and protect him as he walks.
|tip He eventually walks to this location.
Escort The Defias Traitor to Discover Where VanCleef is Hiding |q 155/1 |goto 42.54,71.69
step
talk Gryan Stoutmantle##234
turnin The Defias Brotherhood##155 |goto 56.33,47.52
accept The Defias Brotherhood##166 |goto 56.33,47.52
step
Enter the building |goto Westfall 56.51,47.41 < 5 |only if walking
talk Scout Riell##820
|tip At the top of the tower.
accept Red Silk Bandanas##214 |goto 56.67,47.35
step
Enter the building |goto 42.56,71.74 < 5 |walk
Follow the path up |goto 43.38,71.95 < 5 |only if walking
Follow the path |goto 42.90,72.70 < 5 |only if walking
Run down the ramp |goto 43.40,72.82 < 5 |only if walking
Follow the path |goto 43.81,73.37 < 7 |only if walking
Jump down here |goto 43.27,74.14 < 7 |c |q 168
stickystart "Collect_Miners_Union_Cards"
step
Follow the path |goto 41.60,75.95 < 15 |only if walking
Continue following the path |goto 41.08,76.97 < 15 |only if walking
Cross the bridge |goto Eastern Kingdoms 41.12,79.68 < 10 |only if walking
Follow the path |goto 41.09,79.93 < 7 |only if walking
kill Foreman Thistlenettle##626
|tip He looks like a ghoul.
|tip He walks around this area.
collect Thistlenettle's Badge##1875 |q 167/1 |goto 41.08,80.08
step
label "Collect_Miners_Union_Cards"
Kill Undead enemies around this area
collect 4 Miners' Union Card##1894 |q 168/1 |goto 40.96,80.12
step
Cross the bridge |goto 41.15,79.73 < 10 |only if walking
Follow the path |goto 40.98,79.78 < 15 |only if walking
Enter The Deadmines Dungeon with your Group |goto 40.69,79.58 < 7 |c |q 168
stickystart "Collect_10_Red_Silk_Bandanas"
step
_Inside The Deadmines Dungeon:_
kill Sneed's Shredder##642
|tip The second boss of the dungeon.
collect Gnoam Sprecklesprocket##7365 |q 2040/1
step
_Inside The Deadmines Dungeon:_
kill Edwin Vancleef##639
|tip The last boss of the dungeon.
|tip Aboard the ship.
collect Head of VanCleef##3637 |q 166/1
step
_Inside The Deadmines Dungeon:_
kill Edwin Vancleef##639
|tip The last boss of the dungeon.
|tip Aboard the ship.
collect An Unsent Letter##2874 |q 373 |future
step
use An Unsent Letter##2874
accept The Unsent Letter##373
step
label "Collect_10_Red_Silk_Bandanas"
_Inside The Deadmines Dungeon:_ |notinsticky
Kill Defias enemies around this area
|tip They are found throughout the dungeon.
collect 10 Red Silk Bandanas##915 |q 214/1
step
Leave The Deadmines Dungeon
Click Here to Continue |confirm |q 168
step
talk Gryan Stoutmantle##234
turnin The Defias Brotherhood##166 |goto Westfall 56.33,47.52
step
Enter the building |goto 56.51,47.41 < 5 |only if walking
talk Scout Riell##820
|tip At the top of the tower.
turnin Red Silk Bandanas##214 |goto 56.67,47.35
step
talk Baros Alexston##1646
|tip Inside the building.
turnin The Unsent Letter##373 |goto 57.74,47.86
step
talk Shoni the Shilent##6579
turnin Underground Assault##2040 |goto 62.63,34.12
step
talk Wilder Thistlenettle##656
|tip Inside the building
turnin Oh Brother...##167 |goto 70.31,40.85
turnin Collecting Memories##168 |goto 70.31,40.85
]])
ZygorGuidesViewer:RegisterGuide("Dungeon Guides\\Classic\\Blackfathom Deeps Quests",{
author="support@zygorguides.com",
image=ZGV.IMAGESDIR.."Blackfathom Deeps",
description="This guide will walk you through completing the Blackfathom Deeps quests.",
condition_suggested=function() return level >= 20 and level <= 32 and not completedq(971) end,
condition_end=function() return completedq(971) end,
},[[
step
Reach Level 20 |ding 20
|tip Use the Leveling guides to accomplish this.
step
talk Argos Nightwhisper##4984
accept The Corruption Abroad##3765 |goto Stormwind City 36.23,67.61
step
Run up the stairs |goto Ironforge 51.24,9.84 < 7 |only if walking
talk Gerrig Bonegrip##2786
|tip Inside the building.
accept Knowledge in the Deeps##971 |goto 50.82,5.60
step
talk Gershala Nightwhisper##8997
turnin The Corruption Abroad##3765 |goto Darkshore 38.33,43.04
accept Researching the Corruption##1275 |goto  38.33,43.04
step
Run up the ramp |goto Darnassus 56.46,20.41 < 5 |only if walking
talk Argent Guard Manados##4784
|tip Inside the building.
accept Twilight Falls##1199 |goto 55.23,24.00
step
talk Dawnwatcher Shaedlass##4786
|tip Inside the building.
accept In Search of Thaelrid##1198 |goto 55.37,25.00
step
Follow the path |goto Ashenvale 14.11,14.87 < 15 |only if walking
Jump down into the water |goto Kalimdor 43.97,35.37 < 20 |walk
Enter the underwater cave |goto 43.94,35.27 < 7 |walk
Follow the path up |goto 44.09,34.77 < 7 |walk
Continue following the path |goto 44.35,34.96 < 7 |walk
Enter the Blackfathom Deeps Dungeon with your Group |goto 44.35,34.86 < 5 |c |q 971
stickystart "Collect_10_Twilight_Pendants"
stickystart "Collect_8_Corrupted_Brain_Stems"
step
_Inside the Blackfathom Deeps Dungeon:_
click Pitted Iron Chest
|tip Follow the path inside the dungeon to enter The Drowned Sacellum.
|tip Swim to the south side of the room and then jump across the platforms to reach the southwest path.
|tip Continue following the path to enter The Pool of Ask'ar.
|tip It is underwater to the north of Gamoo-ra.
collect Lorgalis Manuscript##5359 |q 971/1
step
_Inside the Blackfathom Deeps Dungeon:_
talk Argent Guard Thaelrid##4787
|tip Head southwest again in The Pool of Ask'ar and swim into the underwater cave.
|tip He is laying on the ground inside the underwater cave.
turnin In Search of Thaelrid##1198
accept Blackfathom Villainy##1200
step
_Inside the Blackfathom Deeps Dungeon:_
kill Twilight Lord Kelris##4832
|tip The fourth boss of the dungeon.
|tip Leave the underwater cave and reenter the main room in The Pool of Ask'ar.
|tip Swim south and follow the path to the left to reach the Moonshrine Ruins.
|tip Follow the path southeast through the Moonshrine Ruins into the Moonshrine Sanctum.
collect Head of Kelris##5881 |q 1200/1
step
label "Collect_10_Twilight_Pendants"
_Inside the Blackfathom Deeps Dungeon:_ |notinsticky
Kill Twilight enemies around this area
|tip They are found throughout the instance.
collect 10 Twilight Pendant##5879 |q 1199/1
step
label "Collect_8_Corrupted_Brain_Stems"
_Inside the Blackfathom Deeps Dungeon:_ |notinsticky
Kill Blackfathom and Fallenroot enemies around this area
|tip They are found throughout the instance.
collect 8 Corrupted Brain Stem##5952 |q 1275/1
step
Leave the Blackfathom Deeps Dungeon
Click Here to Continue |confirm |q 971
step
talk Gershala Nightwhisper##8997
turnin Researching the Corruption##1275 |goto Darkshore 38.33,43.04
step
Run up the ramp |goto Darnassus 56.46,20.41 < 5 |only if walking
talk Argent Guard Manados##4784
|tip Inside the building.
turnin Twilight Falls##1199 |goto 55.23,24.00
step
talk Dawnwatcher Selgorm##4783
|tip Inside the building.
turnin Blackfathom Villainy##1200 |goto 56.17,24.38
step
Run up the stairs |goto Ironforge 51.24,9.84 < 5 |only if walking
talk Gerrig Bonegrip##2786
|tip Inside the building.
turnin Knowledge in the Deeps##971 |goto 50.82,5.60
]])
ZygorGuidesViewer:RegisterGuide("Dungeon Guides\\Classic\\The Stockade Quests",{
author="support@zygorguides.com",
image=ZGV.IMAGESDIR.."The Stockade",
description="This guide will walk you through completing The Stockade quests.",
condition_suggested=function() return level >= 25 and level <= 30 and not completedq(378) end,
condition_end=function() return completedq(378) end,
},[[
step
Reach Level 25 |ding 25
|tip Use the Leveling guides to accomplish this.
step
talk Motley Garmason##1074
accept The Dark Iron War##303 |goto Wetlands 49.67,18.24
stickystart "Slay_Dark_Iron_Tunnelers"
stickystart "Slay_Dark_Iron_Saboteurs"
stickystart "Slay_Dark_Iron_Demolitionists"
step
kill 15 Dark Iron Dwarf##1051 |q 303/1 |goto 48.56,16.64
|tip You may need help with this.
step
label "Slay_Dark_Iron_Tunnelers"
kill 5 Dark Iron Tunneler##1053 |q 303/2 |goto 48.11,15.75
|tip You may need help with this.
You can find more around [46.80,16.26]
step
label "Slay_Dark_Iron_Saboteurs"
kill 5 Dark Iron Saboteur##1052 |q 303/3 |goto 48.56,16.64
|tip You may need help with this.
You can find more around [46.80,16.26]
step
label "Slay_Dark_Iron_Demolitionists"
kill 5 Dark Iron Demolitionist##1054 |q 303/4 |goto 47.45,15.44
|tip Inside the buildings around this area.
|tip You may need help with this.
step
talk Motley Garmason##1074
turnin The Dark Iron War##303 |goto 49.67,18.24
accept The Fury Runs Deep##378 |goto 49.67,18.24
step
talk Guard Berton##859
accept What Comes Around...##386 |goto Redridge Mountains 26.26,46.57
step
Enter the building |goto Duskwood 72.88,46.83 < 5 |walk
talk Councilman Millstipe##270
|tip He walks around inside the building.
accept Crime and Punishment##377 |goto 71.92,47.79
step
talk Nikova Raskol##1721
|tip She walks around this area.
accept The Color of Blood##388 |goto Stormwind City 76.65,60.47
step
kill Edwin Vancleef##639
|tip This is the final boss of the Deadmines dungeon.
|tip Use our Dungeon guides to accomplish this.
collect An Unsent Letter##2874 |q 373 |future
step
use An Unsent Letter##2874
accept The Unsent Letter##373
step
talk Baros Alexston##1646
|tip Inside the building.
turnin The Unsent Letter##373 |goto 57.74,47.86
accept Bazil Thredd##389 |goto 57.74,47.86
step
talk Warden Thelwater##1719
|tip Inside the building.
turnin Bazil Thredd##389 |goto 51.52,69.34
accept The Stockade Riots##391 |goto 51.52,69.34
accept Quell The Uprising##387 |goto 51.52,69.34
step
Enter The Stockade dungeon with your group |complete subzone("Stormwind Stockade") |goto 50.42,66.29 |q 378
stickystart "Kill_10_Defias_Prisoners"
stickystart "Kill_8_Defias_Convicts"
stickystart "Kill_8_Defias_Insurgents"
stickystart "Collect_10_Red_Wool_Bandanas"
step
_Inside The Stockade Dungeon:_
kill Targorr the Dread##1696
|tip He is the first boss of the dungeon.
|tip He should be in one of the side rooms at the start of the dungeon or the single room straight to the north.
collect Head of Targorr##3630 |q 386/1
step
_Inside The Stockade Dungeon:_
kill Kam Deepfury##1666
|tip He is the second boss of the dungeon.
|tip After entering, head north and follow the path east, he is in the second small room on the left.
collect Head of Deepfury##3640 |q 378/1
step
_Inside The Stockade Dungeon:_
kill Bazil Thredd##1716
|tip He is the fourth boss of the dungeon.
|tip Follow the east path all the way to the end.
collect Head of Bazil Thredd##2926 |q 391/1
step
_Inside The Stockade Dungeon:_
kill Dextren Ward##1663
|tip He is the fifth boss of the dungeon.
|tip Follow the west path all the way to the end.
collect Hand of Dextren Ward##3628 |q 377/1
step
label "Kill_10_Defias_Prisoners"
_Inside The Stockade Dungeon:_ |notinsticky
kill 10 Defias Prisoner##1706 |q 387/1
step
label "Kill_8_Defias_Convicts"
_Inside The Stockade Dungeon:_ |notinsticky
kill 8 Defias Convict##1711 |q 387/2
step
label "Kill_8_Defias_Insurgents"
_Inside The Stockade Dungeon:_ |notinsticky
kill 8 Defias Insurgent##1715 |q 387/3
step
label "Collect_10_Red_Wool_Bandanas"
_Inside The Stockade Dungeon:_ |notinsticky
Kill Defias enemies around this area
collect 10 Red Wool Bandana##2909 |q 388/1
step
talk Warden Thelwater##1719
|tip Inside the building.
turnin The Stockade Riots##391 |goto Stormwind City 51.52,69.34
turnin Quell The Uprising##387 |goto Stormwind City 51.52,69.34
step
talk Nikova Raskol##1721
|tip She walks around this area.
turnin The Color of Blood##388 |goto 76.65,60.47
step
Enter the building |goto Duskwood 72.88,46.83 < 5 |walk
talk Councilman Millstipe##270
|tip He walks around inside the building.
turnin Crime and Punishment##377 |goto 71.92,47.79
step
talk Guard Berton##859
turnin What Comes Around...##386 |goto Redridge Mountains 26.26,46.57
step
talk Motley Garmason##1074
turnin The Fury Runs Deep##378 |goto Wetlands 49.67,18.24
]])
ZygorGuidesViewer:RegisterGuide("Dungeon Guides\\Classic\\Gnomeregan Quests",{
author="support@zygorguides.com",
image=ZGV.IMAGESDIR.."Gnomeregan",
description="This guide will walk you through completing the Gnomeregan quests.",
condition_suggested=function() return level >= 25 and level <= 38 and not completedq(2928) end,
condition_end=function() return completedq(2928) end,
},[[
step
Reach Level 25 |ding 25
|tip Use the Leveling guides to accomplish this.
step
talk Brother Sarno##7917
|tip Inside the building.
accept Tinkmaster Overspark##2923 |goto Stormwind City 51.05,48.36
step
talk Shoni the Shilent##6579
accept Gyrodrillmatic Excavationators##2928 |goto 62.63,34.12
step
talk Mathiel##6142
accept Klockmort's Essentials##2925 |goto Darnassus 59.48,45.38
step
talk Klockmort Spannerspan##6169
turnin Klockmort's Essentials##2925 |goto Ironforge 67.98,46.13
accept Essential Artificials##2924  |goto 67.98,46.13
step
talk Tinkmaster Overspark##7944
turnin Tinkmaster Overspark##2923 |goto 69.56,50.32
accept Save Techbot's Brain!##2922 |goto 69.56,50.32
step
talk Gnoarn##6569
accept The Day After##2927 |goto 69.18,50.56
step
talk Master Mechanic Castpipe##7950
accept Data Rescue##2930 |goto 69.82,48.08
step
talk High Tinker Mekkatorque##7937
accept The Grand Betrayal##2929 |goto 68.76,48.96
step
Enter the building |goto Dun Morogh 45.97,48.83 < 5 |walk
talk Ozzie Togglevolt##1268
|tip Inside the building.
turnin The Day After##2927 |goto 45.88,49.38
accept Gnogaine##2926 |goto 45.88,49.38
step
Enter the building |goto 24.35,39.78 < 7 |walk
Run down the ramp |goto Eastern Kingdoms 43.45,53.80 < 7 |walk
Go down the elevator |goto 43.61,53.82 < 7 |c |q 2928
step
Kill Addled enemies around this area
collect White Punch Card##9279 |goto 43.27,52.87 |q 2930 |future
step
kill Techbot##6231
|tip You may need help with this.
collect Techbot's Memory Core##9277 |q 2922/1 |goto 43.11,52.81
step
Run up the stairs |goto 43.20,52.87 < 7 |only if walking
Cross the bridge |goto 43.38,53.01 < 10 |only if walking
click Matrix Punchograph 3005-A
Choose _"Acquire Higher Level Access Card"_
collect Yellow Punch Card##9280 |goto 43.37,52.89 |q 2930 |future
step
use the Empty Leaden Collection Phial##9283
|tip Use it on Irradiated Invaders or Irradiated Pillagers.
collect Full Leaden Collection Phial##9284 |q 2926/1 |goto 43.38,53.23
You can find more around [43.08,53.54]
step
Enter the building |goto Dun Morogh 45.97,48.83 < 5 |walk
talk Ozzie Togglevolt##1268
|tip Inside the building.
turnin Gnogaine##2926 |goto 45.88,49.38
accept The Only Cure is More Green Glow##2962 |goto 45.88,49.38
step
Enter the building |goto 24.35,39.78 < 7 |walk
Run down the ramp |goto Eastern Kingdoms 43.45,53.80 < 7 |walk
Go down the elevator |goto 43.61,53.82 < 7 |c |q 2928
step
Run up the ramp |goto 43.40,53.73 < 7 |only if walking
Follow the path |goto 43.20,53.37 < 15 |only if walking
Enter the Gnomeregan dungeon with your group |goto 42.81,53.82 < 7 |c |q 2928
stickystart "Collect_24_Robo-Mechanical_Guts"
stickystart "Collect_12_Essential_Artificial"
step
_Inside the Gnomeregan Dungeon:_
click Matrix Punchograph 3005-B
|tip Stay on the upper levels of The Hall of Gears and follow the path around to the southwest to enter The Dormitory.
|tip After entering The Dormitory, follow the path around to the left to continue to The Dormitory's lower level.
|tip It is up against the wall in the lowest level of The Dormitory area.
Choose _"Acquire Higher Level Access Card"_
collect Blue Punch Card##9282 |q 2930 |future
step
_Inside the Gnomeregan Dungeon:_
kill Viscous Fallout##7079
|tip It is the first boss of the dungeon.
|tip It is in the lower level of the Hall of Gears.
|tip Leave The Dormitory and reenter The Hall of Gears and then jump down to the lower level.
use the Heavy Leaden Collection Phial##9364
|tip Use it on Viscious Fallout's corpse.
collect High Potency Radioactive Fallout##9365 |q 2962/1
step
_Inside the Gnomeregan Dungeon:_
kill Electrocutioner 6000##6235
|tip He is the third boss of the dungeon.
|tip He is in the center of the upper level of the Launch Bay.
|tip Follow the west path from The Hall of Gears to enter the Launch Bay.
collect Workshop Key##6893 |q 2930 |future
step
_Inside the Gnomeregan Dungeon:_
click Matrix Punchograph 3005-C
|tip It's up in the Launch Bay platform, with Electrocutioner 6000.
Choose _"Acquire Higher Level Access Card"_
collect Red Punch Card##9281 |q 2930 |future
step
_Inside the Gnomeregan Dungeon:_
click Miatrix Punchograph 3005-D
|tip It is found in the lower level of the Engineering Labs, along with Crowd Pummeler 9-60.
|tip Stay on the upper level of the Launch Bay and follow the southeast path to reach the Engineering Labs.
|tip After entering the Engineering Labs, go left and follow it a short distance to ride an elevator down to the lower level.
|tip It is on the opposite side of the large structure in the center of the room after getting off the elevator.
Choose _"Acquire Higher Level Access Card"_
collect Prismatic Punch Card##9316 |q 2930/1
step
label "Collect_24_Robo-Mechanical_Guts"
_Inside the Gnomeregan Dungeon:_ |notinsticky
Kill enemies around this area
collect 24 Robo-mechanical Guts##9309 |q 2928/1
step
label "Collect_12_Essential_Artificial"
_Inside the Gnomeregan Dungeon:_ |notinsticky
click Artificial Extrapolator##142344+
|tip They look like square upright machines scattered all over the instance.
collect 12 Essential Artificial##9278 |q 2924/1
step
_Inside the Gnomeregan Dungeon:_
kill Mekgineer Thermaplugg##7800 |q 2929/1
|tip He is the last boss of the dungeon.
|tip Leave the Engineering Labs through the lower level and follow the southwest path up and out, then continue west after the path splits.
step
Leave the Gnomeregan Dungeon
Click Here to Continue |confirm |q 2928
step
talk Klockmort Spannerspan##6169
turnin Essential Artificials##2924 |goto Ironforge 67.98,46.13
step
talk Tinkmaster Overspark##7944
turnin Save Techbot's Brain!##2922 |goto 69.56,50.32
step
talk Master Mechanic Castpipe##7950
turnin Data Rescue##2930 |goto 69.82,48.08
step
talk High Tinker Mekkatorque##7937
turnin The Grand Betrayal##2929 |goto 68.76,48.96
step
Enter the building |goto Dun Morogh 45.97,48.83 < 5 |walk
talk Ozzie Togglevolt##1268
|tip Inside the building.
turnin The Only Cure is More Green Glow##2962 |goto 45.88,49.38
step
talk Shoni the Shilent##6579
turnin Gyrodrillmatic Excavationators##2928 |goto Stormwind City 62.63,34.12
]])
ZygorGuidesViewer:RegisterGuide("Dungeon Guides\\Classic\\Razorfen Kraul Quests",{
author="support@zygorguides.com",
image=ZGV.IMAGESDIR.."Razorfen Kraul",
description="This guide will walk you through completing the Razorfen Kraul quests.",
condition_suggested=function() return level >= 29 and level <= 40 and not completedq(1142) end,
condition_end=function() return completedq(1142) end,
},[[
step
Reach Level 29 |ding 29
|tip Use the Leveling guides to accomplish this.
step
talk Mebok Mizzyrix##3446
accept Blueleaf Tubers##1221 |goto The Barrens 62.37,37.62
step
click Snufflenose Command Stick##68865
collect Snufflenose Command Stick##6684 |q 1221/4|goto 62.34,37.61
step
click Snufflenose Owner's Manual##21530
collect Snufflenose Owner's Manual##5897 |q 1221/3 |goto 62.34,37.63
step
click Crate with Holes##21277
collect Crate With Holes##5880 |q 1221/2 |goto 62.33,37.63
step
click Henrig Longbrow's Journal##19861
|tip It will be in the hand of a corpse on the ground.
collect Henrig Lonebrow's Journal##5791 |q 1100 |future
step
use Henrig Lonebrow's Journal##5791
accept Longbrow's Jounral##1100 |goto Thousand Needles 30.73,24.35
step
talk Falfindel Waywarder##4048
turnin Longbrow's Jounral##1100 |goto Feralas 89.63,46.57
accept The Crone of the Kraul##1101 |goto 89.63,46.57
step
Follow the path |goto The Barrens 43.87,90.11 < 15 |only if walking
Enter the Razorfen Kraul Dungeon with your Group |goto 50.90,70.36 < 10 |c |q 1142 |future
step
_Inside the Razorfen Kraul Dungeon:_
use the Crate With Holes##5880
|tip This will summon a gopher.
use the Snufflenose Command Stick##6684
|tip This will allow you to command the gopher.
|tip Once past Overlord Ramtusk, go to the biggest hill from the area with many bridges.
collect 6 Blueleaf Tuber##5876 |q 1221/1
step
_Inside the Razorfen Kraul Dungeon:_
kill Charlga Razorflank##4421
collect Razorflank's Medallion##5792 |q 1101/1
step
_Inside the Razorfen Kraul Dungeon:_
talk Heralath Fallowbrook##4510
|tip Inside the tent.
|tip Jump down from the platform where Charlga Razorflank was and head to the tent to the left.
accept Mortality Wanes##1142
step
_Inside the Razorfen Kraul Dungeon:_
talk Willix the Importer##4508
|tip Inside the building.
|tip This is an escort quest.
accept Willix the Importer##1144
stickystart "Treshala's Pendant"
step
_Inside the Razorfen Kraul Dungeon:_
Escort Willix the Importer out of Razorfen Kraul |q 1144/1
step
_Inside the Razorfen Kraul Dungeon:_
talk Willix the Importer##4508
|tip He will be at the entrance after the completion of the escort quest.
turnin Willix the Importer##1144
step
label "Treshala's Pendant"
_Inside the Razorfen Kraul Dungeon:_ |notinsticky
Kill Razorfen enemies around this area
collect Treshala's Pendant##5825 |q 1142/1
step
talk Mebok Mizzyrix##3446
turnin Blueleaf Tubers##1221 |goto The Barrens 62.37,37.62
step
talk Falfindel Waywarder##4048
turnin The Crone of the Kraul##1101 |goto Feralas 89.63,46.57
step
Run up the ramp |goto Darnassus 67.68,61.26 < 10 |only if walking
Continue up the ramp |goto 63.69,57.75 < 10 |only if walking
Cross the bridge |goto 65.71,61.63 < 10 |only if walking
talk Treshala Fallowbrook##4521
turnin Mortality Wanes##1142 |goto 69.55,67.79
]])
ZygorGuidesViewer:RegisterGuide("Dungeon Guides\\Classic\\Scarlet Monastery Library Quests",{
author="support@zygorguides.com",
image=ZGV.IMAGESDIR.."Scarlet Monastery",
description="This guide will walk you through completing the Razorfen Kraul Quests.",
},[[
step
Reach Level 28 |ding 28
|tip Use the Leveling guides to accomplish this.
step
Enter the building |goto Stormwind City 52.98,51.10 < 10 |walk
Run down the ramp |goto 51.63,43.80 < 7 |walk
talk Brother Crowley##12336
|tip Downstairs inside the building.
accept Brother Anton##6141 |goto 52.58,43.35
step
talk Brother Anton##1182
|tip Inside the building.
turnin Brother Anton##6141 |goto Desolace 66.52,7.90
accept Down the Scarlet Path##261 |goto 66.52,7.90
step
kill 30 Undead Ravager##11561 |q 261/1 |goto 64.09,91.64
step
talk Brother Anton##1182
|tip Inside the building.
turnin Down the Scarlet Path##261 |goto 66.52,7.90
accept Down the Scarlet Path##1052 |goto 66.52,7.90
step
Enter the building |goto Hillsbrad Foothills 50.47,58.56 < 6 |walk
talk Raleigh the Devout##3980
|tip Upstairs inside the building.
turnin Down the Scarlet Path##1052 |goto 51.46,58.36
accept In the Name of the Light##1053 |goto 51.46,58.36
step
talk Librarian Mae Paledust##3979
accept Mythology of the Titans##1050 |goto Ironforge 74.97,12.46
step
Follow the path up |goto Tirisfal Glades 81.45,41.51 < 20 |only if walking
Enter the building |goto Eastern Kingdoms 47.43,19.74 < 5 |walk
Run up the stairs |goto 47.45,19.68 < 5 |walk
Enter the Scarlet Monastery - Library Dungeon with your Group |goto 47.79,19.60 < 7 |q 1053
step
Inside the Scarlet Monastery Library Dungeon:
kill Houndmaster Loksey##3974 |q 1053/4
|tip He is the first boss of the dungeon.
|tip Follow the path to enter Huntsman's Cloister, then continue south to the small room.
step
Inside the Scarlet Monastery Library Dungeon:
click Mythology of the Titans##19284
|tip Continue through Huntsman's Cloister to enter the Gallery of Treasures.
|tip Once through the Gallery of Treasures the map will change back to Scarlet Monastery.
|tip It will be on the ground on the left side of the room.
|tip It looks like a small book on the ground below a window.
collect Mythology of the Titans##5536 |q 1050/1
step
Leave the Scarlet Monastery Library Dungeon
Click Here to Continue |confirm |q 1050
step
Enter the building |goto Hillsbrad Foothills 50.47,58.56 < 6 |walk
talk Raleigh the Devout##3980
|tip Upstairs inside the building.
turnin In the Name of the Light##1053 |goto 51.46,58.36
|tip This quest requires you to kill bosses in Scarlet Monastery - Library, Armory and Cathedral.
|tip Use the Scarlet Monastery Armory Quests and Scarlet Monastery Cathedral Quests guides to accomplish this.
|tip If you haven't completed the other objectives yet, skip this for now.
step
talk Librarian Mae Paledust##3979
turnin Mythology of the Titans##1050 |goto Ironforge 74.97,12.46
]])
ZygorGuidesViewer:RegisterGuide("Dungeon Guides\\Classic\\Scarlet Monastery Armory Quests",{
author="support@zygorguides.com",
image=ZGV.IMAGESDIR.."Scarlet Monastery",
description="This guide will walk you through completing the Razorfen Kraul Quests.",
},[[
step
Reach Level 38 |ding 38
|tip Use the Leveling guides to accomplish this.
step
Enter the building |goto Stormwind City 52.98,51.10 < 10 |walk
Run down the ramp |goto 51.63,43.80 < 7 |walk
talk Brother Crowley##12336
|tip Inside the building.
accept Brother Anton##6141 |goto 52.58,43.35
step
talk Brother Anton##1182
|tip Inside the building.
turnin Brother Anton##6141 |goto Desolace 66.52,7.90
accept Down the Scarlet Path##261 |goto 66.52,7.90
step
kill 30 Undead Ravager##11561 |q 261/1 |goto 64.09,91.64
step
talk Brother Anton##1182
|tip Inside the building.
turnin Down the Scarlet Path##261 |goto 66.52,7.90
accept Down the Scarlet Path##1052 |goto 66.52,7.90
step
Enter the building |goto Hillsbrad Foothills 50.47,58.56 < 6 |walk
talk Raleigh the Devout##3980
|tip Upstairs inside the building.
turnin Down the Scarlet Path##1052 |goto 51.46,58.36
accept In the Name of the Light##1053 |goto 51.46,58.36
step
Follow the path up |goto Tirisfal Glades 81.45,41.51 < 20 |only if walking
Enter the building |goto Eastern Kingdoms 47.43,19.74 < 5 |walk
Run up the stairs |goto 47.45,19.68 < 5 |walk
click Armory Door |goto 47.80,19.52 < 5 |walk
Enter the Scarlet Monastery - Armory Dungeon with your Group |goto 47.83,19.53 < 5 |q 1053
step
Inside the Scarlet Monastery Armory Dungeon:
kill Herod##3975 |q 1053/3
|tip He is the only boss of the dungeon, found all the way at the end.
step
Leave the Scarlet Monastery Armory Dungeon
Click Here to Continue |confirm |q 1053
step
Enter the building |goto Hillsbrad Foothills 50.47,58.56 < 6 |walk
talk Raleigh the Devout##3980
|tip Upstairs inside the building.
turnin In the Name of the Light##1053 |goto 51.46,58.36
|tip This quest requires you to kill bosses in Scarlet Monastery - Library, Armory and Cathedral.
|tip Use the Scarlet Monastery Library Quests and Scarlet Monastery Cathedral Quests guides to accomplish this.
|tip If you haven't completed the other objectives yet, skip this for now.
]])
ZygorGuidesViewer:RegisterGuide("Dungeon Guides\\Classic\\Scarlet Monastery Cathedral Quests",{
author="support@zygorguides.com",
image=ZGV.IMAGESDIR.."Scarlet Monastery",
description="This guide will walk you through completing the Scarlet Monastery Cathedral Quests.",
},[[
step
Reach Level 40 |ding 40
|tip Use the Leveling guides to accomplish this.
step
Enter the building |goto Stormwind City 52.98,51.10 < 10 |walk
Run down the ramp |goto 51.63,43.80 < 7 |walk
talk Brother Crowley##12336
|tip Inside the building.
accept Brother Anton##6141 |goto 52.58,43.35
step
talk Brother Anton##1182
|tip Inside the building.
turnin Brother Anton##6141 |goto Desolace 66.52,7.90
accept Down the Scarlet Path##261 |goto 66.52,7.90
step
kill 30 Undead Ravager##11561 |q 261/1 |goto 64.09,91.64
step
talk Brother Anton##1182
|tip Inside the building.
turnin Down the Scarlet Path##261 |goto 66.52,7.90
accept Down the Scarlet Path##1052 |goto 66.52,7.90
step
Enter the building |goto Hillsbrad Foothills 50.47,58.56 < 6 |walk
talk Raleigh the Devout##3980
|tip Upstairs inside the building.
turnin Down the Scarlet Path##1052 |goto 51.46,58.36
accept In the Name of the Light##1053 |goto 51.46,58.36
step
Follow the path up |goto Tirisfal Glades 81.45,41.51 < 20 |only if walking
Enter the building |goto Eastern Kingdoms 47.43,19.74 < 5 |walk
Run up the stairs |goto 47.45,19.68 < 5 |walk
Enter the Scarlet Monastery - Library Dungeon with your Group |goto 47.79,19.60 < 7 |q 1053
step
Inside the Scarlet Monastery Library Dungeon:
kill Houndmaster Loksey##3974 |q 1053/4
|tip He is the first boss of the dungeon.
|tip Follow the path to enter Huntsman's Cloister, then continue south to the small room.
step
Inside the Scarlet Monastery Library Dungeon:
click Doan's Strongbox##103821
|tip It looks like a grey and black lockbox on the ground behind Arcanist Doan, the final boss of the dungeon.
collect The Scarlet Key##7146 |q 1053
|tip This key is required to open the doors to access the last two wings of the Scarlet Monastery Dungeon.
|tip If someone in your group already has the key you can skip this step.
step
Leave the Scarlet Monastery Library Dungeon
Click Here to Continue |confirm |q 1053
step
click Armory Door |goto 47.80,19.52 < 5 |walk
Enter the Scarlet Monastery - Armory Dungeon with your Group |goto 47.83,19.53 < 5 |q 1053
step
Inside the Scarlet Monastery Armory Dungeon:
kill Herod##3975 |q 1053/3
|tip He is the only boss of the dungeon, found all the way at the end.
step
Leave the Scarlet Monastery Armory Dungeon
Click Here to Continue |confirm |q 1053
step
click Cathedral Door |goto 47.78,19.43 < 5 |walk
Enter the Scarlet Monastery - Cathedral Dungeon with your Group |goto 47.79,19.39 < 5 |q 1053
step
Inside the Scarlet Monastery Cathedral Dungeon:
kill Scarlet Commander Mograine##3976 |q 1053/2
|tip He is the last boss of the dungeon, found all the way at the end.
step
Inside the Scarlet Monastery Cathedral Dungeon:
kill High Inquisitor Whitemane##3977 |q 1053/1
|tip She is the last boss of the dungeon, found all the way at the end.
step
Leave the Scarlet Monastery Cathedral Dungeon
Click Here to Continue |confirm |q 1053
step
Enter the building |goto Hillsbrad Foothills 50.47,58.56 < 6 |walk
talk Raleigh the Devout##3980
|tip Upstairs inside the building.
turnin In the Name of the Light##1053 |goto 51.46,58.36
]])
ZygorGuidesViewer:RegisterGuide("Dungeon Guides\\Classic\\Razorfen Downs Quests",{
author="support@zygorguides.com",
image=ZGV.IMAGESDIR.."Razorfen Downs",
description="This guide will walk you through completing the Razorfen Downs Quests.",
},[[
step
Reach Level 39 |ding 39
|tip Use the Leveling guides to accomplish this.
step
Enter the building |goto Stormwind City 52.98,51.10 < 10 |walk
talk Archbishop Benedictus##1284
|tip Inside the building.
accept Bring the Light##3636 |goto 50.31,45.51
step
Follow the path |goto The Barrens 45.30,89.28 < 20 |only if walking
Follow the path up |goto 49.10,94.49
talk Myriam Moonsinger##12866
accept A Host of Evil##6626 |goto 49.01,94.94
stickystart "Kill_8_Razorfen_Thronweavers"
stickystart "Kill_8_Death's_Head_Cultists"
step
kill 8 Razorfen Battleguard##7873 |q 6626/1 |goto 48.59,95.47
You can find more around [48.22,92.41]
step
label "Kill_8_Razorfen_Thronweavers"
kill 8 Razorfen Thornweaver##7874 |q 6626/2 |goto 48.14,92.26
step
label "Kill_8_Death's_Head_Cultists"
kill 8 Death's Head Cultist##7872 |q 6626/3 |goto 46.68,87.95
You can find more around [48.22,92.41] |notinsticky
step
Follow the path up |goto 49.10,94.49
talk Myriam Moonsinger##12866
turnin A Host of Evil##6626 |goto 49.01,94.94
step
Follow the path |goto 49.13,93.47 < 10 |only if walking
Continue following the path |goto 49.25,93.13 < 7 |only if walking
Enter the Razorfen Downs Dungeon with your Group |goto Kalimdor 53.25,71.17 < 7 |q 3636
step
Inside the Razorfen Downs Dungeon:
click Holding Pen
|tip It looks like a large wooden fence on the north side of The Murder Pens.
|tip Follow the path left along the north side of the dungeon to reach the Spiral of Thorns and eventually The Caller's Chamber.
|tip Continue through The Caller's Chamber to reach The Murder Pens and immediately go left.
|tip Be sure to clear each area of enemies as you go.
talk Belnistrasz##8516
|tip Inside the Holding Pen.
accept Scourge of the Downs##3523
step
Inside the Razorfen Downs Dungeon:
talk Belnistrasz##8516
|tip Inside the Holding Pen.
turnin Scourge of the Downs##3523
accept Extinguishing the Idol##3525
|tip This is an escort quest.
|tip Accepting this quest will automatically start the escort after a few seconds.
|tip All group members will need to accept it at the same time to avoid missing the quest.
step
Inside the Razorfen Downs Dungeon:
Follow and protect Belnistrasz
Kill the enemies that attack in waves
kill Plaguemaw the Rotting##7356
Escort Belnistrasz to the Quilboar's Idol |q 3525/1
step
Inside the Razorfen Downs Dungeon:
click Belnistrasz's Brazier
|tip It will be in the room where he was channeling.
turnin Extinguishing the Idol##3525
step
Inside the Razorfen Downs Dungeon:
kill Amnennar the Coldbringer##7358 |q 3636/1
|tip He is the last boss of the dungeon.
|tip Follow the left path out of the Belnistrasz escort room, then go right in the Spiral of Thorns and jump down.
|tip From here, go west and follow the path as it wraps up and around, eventually reaching Amnennar at the top.
step
Leave the Razorfen Downs Dungeon
Click Here to Continue |confirm |q 3636
step
Enter the building |goto Stormwind City 52.98,51.10 < 10 |walk
talk Archbishop Benedictus##1284
|tip Inside the building.
turnin Bring the Light##3636 |goto 50.31,45.51
]])
ZygorGuidesViewer:RegisterGuide("Dungeon Guides\\Classic\\Uldaman Quests",{
author="support@zygorguides.com",
image=ZGV.IMAGESDIR.."Uldaman",
description="This guide will walk you through completing the Uldaman Quests.",
},[[
step
Reach Level 38 |ding 38
|tip Use the Leveling guides to accomplish this.
step
Follow the path |goto Loch Modan 46.86,77.59 < 20 |only if walking
Kill Shadowforge enemies around this area
|tip You may need help with this.
|tip You can find more inside the cave.
collect Shattered Necklace##7666 |goto Badlands 45.10,12.01 |q 2198 |future
step
use the Shattered Necklace##7666
accept The Shattered Necklace##2198
step
talk Talvash del Kissel##6826
turnin The Shattered Necklace##2198 |goto Ironforge 36.37,3.62
accept Lore for a Price##2199 |goto 36.36,3.62
step
collect 5 Silver Bar##2842 |q 2199/1
|tip If you have the Mining profession, you can gather these.
|tip Search the guide menu for the item(s) to use the farming guides.
|tip You can also purchase them from the Auction House.
step
talk Talvash del Kissel##6826
turnin Lore for a Price##2199 |goto 36.36,3.62
accept Back to Uldaman##2200 |goto 36.36,3.62
step
talk Prospector Stormpike##1356
accept The Lost Dwarves##2398 |goto 74.62,11.79
step
Follow the path |goto Badlands 51.84,15.51 < 30 |only if walking
Follow the path |goto 51.77,33.17 < 15 |only if walking
click Crumpled Map
accept A Sign of Hope##720 |goto 53.03,33.93
step
Follow the path up |goto 50.48,37.05 < 30 |only if walking
talk Prospector Ryedol##2910
turnin A Sign of Hope##720 |goto 53.42,43.40
accept A Sign of Hope##721 |goto 53.42,43.40
step
Follow the path |goto Badlands/0 51.90,15.69 < 20 |only if walking
Enter the cave |goto Eastern Kingdoms 54.50,57.78 < 7 |walk
talk Hammertoe Grez##2909
|tip Inside the cave.
Find Hammertoe Grez in Uldaman |q 721/1 |goto 54.04,57.67
step
talk Hammertoe Grez##2909
|tip Inside the cave.
turnin A Sign of Hope##721 |goto 54.04,57.67
accept Amulet of Secrets##722 |goto 54.04,57.67
step
kill Magregan Deepshadow##2932
|tip He patrols through the tunnels before the entrance.
|tip He has a slow respawn rate.
collect Hammertoe's Amulet##4635 |q 722/1 |goto 53.85,57.95
step
talk Hammertoe Grez##2909
|tip Inside the cave.
turnin Amulet of Secrets##722 |goto 54.04,57.67
accept Prospect of Faith##723 |goto 54.04,57.67
step
Leave the cave |goto Eastern Kingdoms 54.48,57.78 < 5 |walk
talk Prospector Ryedol##2910
turnin Prospect of Faith##723 |goto Badlands 53.42,43.40
accept Prospect of Faith##724 |goto 53.42,43.40
step
talk Prospector Stormpike##1356
accept Ironband Wants You!##707 |goto Ironforge 74.70,11.72
step
talk Historian Karnik##2916
turnin Prospect of Faith##724 |goto Ironforge 77.57,11.83
accept Passing Word of a Threat##725 |goto 77.57,11.83
step
talk Advisor Belgrum##2918
turnin Passing Word of a Threat##725 |goto 77.32,9.75
accept Passing Word of a Threat##726 |goto 77.32,9.75
step
talk Historian Karnik##2916
turnin Passing Word of a Threat##726 |goto 77.57,11.83
accept An Ambassador of Evil##762 |goto 77.57,11.83
step
Enter the building |goto Loch Modan 36.64,48.53 < 7 |walk
talk Ghak Healtouch##1470
|tip Inside the building.
accept Badlands Reagent Run##2500 |goto 37.07,49.38
step
talk Prospector Ironband##1344
turnin Ironband Wants You!##707 |goto 65.94,65.62
accept Find Agmond##738 |goto 65.94,65.62
step
click Battered Dwarven Skeleton
turnin Find Agmond##738 |goto Badlands 50.89,62.40
accept Murdaloc##739 |goto 50.89,62.40
step
kill Murdaloc##2945 |q 739/1 |goto 49.63,66.27
step
kill 12 Stonevault Bonesnapper##2893 |q 739/2 |goto 51.18,68.27
step
Enter the building |goto 42.93,29.93 < 10 |walk
Follow the path |goto 43.10,28.83 < 7 |walk
Run down the stairs |goto 42.20,26.74 < 7 |walk
Continue down the stairs |goto 41.24,27.44 < 7 |walk
kill Ambassador Infernus##2745
|tip Downstairs inside the building.
|tip You may need help with this.
collect Ambassador Infernus' Bracer##4621 |q 762/1 |goto 42.10,28.90
stickystart "Collect_Buzzard_Gizzards"
stickystart "Collect_Crag_Coyote_Fangs"
step
kill Lesser Rock Elemental##2735+
collect 5 Rock Elemental Shard##7848 |q 2500/3 |goto 19.46,43.02
step
label "Collect_Buzzard_Gizzards"
Kill Buzzard enemies around this area
collect 5 Buzzard Gizzard##7847 |q 2500/1 |goto 16.82,59.84
You can find more around: |notinsticky
[12.45,69.20]
[17.43,48.90]
[25.63,62.04]
[33.36,59.65]
[28.67,72.03]
[24.51,74.45]
[18.90,77.65]
step
label "Collect_Crag_Coyote_Fangs"
Kill Coyote enemies around this area
collect 10 Crag Coyote Fang##7846 |q 2500/2 |goto 23.75,55.12
You can find more around: |notinsticky
[14.18,65.72]
[31.58,65.16]
step
talk Prospector Ironband##1344
turnin Find Agmond##738 |goto Loch Modan 65.94,65.62
accept Agmond's Fate##704 |goto 65.94,65.62
step
Enter the building |goto 36.63,48.53 < 7 |walk
talk Ghak Healtouch##1470
|tip Inside the building.
turnin Badlands Reagent Run##2500 |goto 37.07,49.38
accept Uldaman Reagent Run##2202 |goto 37.07,49.38
step
talk Advisor Belgrum##2918
turnin An Ambassador of Evil##762 |goto Ironforge 77.32,9.75
accept The Lost Tablets of Will##1139 |goto 77.32,9.75
step
Follow the path |goto Loch Modan 46.86,77.59 < 20 |only if walking
Enter the cave |goto Eastern Kingdoms 54.50,57.78 < 7 |walk
Enter the Uldaman Dungeon with Your Group |goto 53.85,57.66 < 7 |q 2279 |future
stickystart "Collect_4_Carved_Stone_Urn"
stickystart "Collect_12_Magenta_Cap_Cluster"
step
Inside the Uldaman Dungeon:
talk Remains of a Paladin##6912
|tip He's laying on the ground surrounded by enemies.
turnin Back to Uldaman##2200
accept Find the Gems##2201
step
Inside the Uldaman Dungeon:
talk Baelog##6906
|tip He is the first boss of the dungeon.
|tip Follow the path through the first corridor to enter the big open room, then follow the left corridor and enter the room to the south to reach Dig Two.
turnin The Lost Dwarves##2398
accept The Hidden Chamber##2240
step
Inside the Uldaman Dungeon:
click Baelog's Chest
|tip On the table behind Baelog.
collect Gni'kiv Medallion##7740 |q 2240 |future
step
Inside the Uldaman Dungeon:
click Conspicuous Urn
|tip It looks like a tall brown urn in the southeastern side of Dig Two, to the right of the large double doors.
collect Shattered Necklace Topaz##7671 |q 2201/3
step
Inside the Uldaman Dungeon:
kill Revelosh##6910
|tip He is the second boss of the dungeon.
|tip Leave Dig Two and go left.
collect The Shaft of Tsol##7741 |q 2240 |future
step
Inside the Uldaman Dungeon:
use The Shaft of Tsol##7741
collect Staff of Prehistoria##7733 |q 2240 |future
step
Inside the Uldaman Dungeon:
click Keystone
|tip In the Map Chamber, just after Revelosh.
|tip This will only be usable by someone with the Staff of Prehistoria.
|tip This will open the locked door, guarded by the boss Ironaya.
|tip After defeating Ironaya, enter the room she was in.
Explore the Hidden Chamber |q 2240/1
step
Inside the Uldaman Dungeon:
click Shadowforge Cache##113757
|tip Looting this will cause a few enemies to spawn.
|tip It looks like a stone chest on the northwestern side of Dig Three.
|tip Proceed north and follow the western-most path.
|tip After passing through the caves with bats you'll reach a more open area with a pit of non-elite scorpions.
|tip Go left here and immediately left again to reach Dig Three.
collect Shattered Necklace Ruby##7669 |q 2201/1
step
Inside the Uldaman Dungeon:
click Tablet of Will
|tip It is against the wall in Dig Three.
collect Tablet of Will##5824 |q 1139/1
step
Inside the Uldaman Dungeon:
kill Grimlok##4854
|tip Leave Dig Three and go left, then continue left to the end of The Stone Vault.
collect Shattered Necklace Sapphire##7670 |q 2201/2
step
Inside the Uldaman Dungeon:
use Talvash's Phial of Scrying##7667
click Talvash's Scrying Bowl##112877
turnin Find the Gems##2201
accept Restoring the Necklace##2204
step
Inside the Uldaman Dungeon:
click Altar of The Keepers
kill Archaedas##2748
|tip He is the last boss of the dungeon.
|tip Leave The Stone Vault and follow the left path to reach the Hall of the Crafters.
collect Shattered Necklace Power Source##7672 |q 2204/1
step
Inside the Uldaman Dungeon:
click The Discs of Norgannon
|tip In the room behind Archaedas.
|tip You will only be able to access this room after Archadas is defeated.
accept The Platinum Discs##2278
|only if level >=40
step
Inside the Uldaman Dungeon:
talk Lore Keeper of Norgannon##7172
Tell him _"Who are the Earthen?"_
Learn What Lore That the Stone Watcher Has to Offer |q 2278/1
|only if level >=40
step
Inside the Uldaman Dungeon:
click The Discs of Norgannon
turnin The Platinum Discs##2278
accept The Platinum Discs##2279
|only if level >=40
step
label "Collect_4_Carved_Stone_Urn"
Inside the Uldaman Dungeon: |notinsticky
click Carved Stone Urn
|tip They are scattered throughout the instance.
collect 4 Carved Stone Urn##4610 |q 704/1
step
label "Collect_12_Magenta_Cap_Cluster"
Inside the Uldaman Dungeon: |notinsticky
click Magenta Cap Cluster##126049+
|tip They look like a pair of mushrooms along the walls of the cave areas.
|tip You can find more outside of the dungeon.
collect 12 Magenta Cap Cluster##8047 |q 2202/1
step
Leave the Uldaman Dungeon
Click Here to Continue |confirm |q 1139
step
talk Prospector Ironband##1344
turnin Agmond's Fate##704 |goto Loch Modan 65.93,65.62
step
Enter the building |goto 36.63,48.52 < 5 |walk
talk Ghak Healtouch##1470
|tip Inside the building.
turnin Uldaman Reagent Run##17 |goto 37.07,49.37
step
Run up the stairs |goto Ironforge 31.94,8.36 < 5 |only if walking
Enter the building |goto 31.98,5.42 < 5 |walk
talk Tymor##8507
|tip Inside the building.
turnin Passing the Burden##3448 |goto 30.98,4.81
step
talk High Explorer Magellas##5387
turnin The Platinum Discs##2279 |goto 69.93,18.54
accept The Platinum Discs##2439 |goto 69.93,18.54
|only if level >=40
step
Enter the building |goto 34.08,62.42 < 7 |walk
talk Dinita Stonemantle##7292
|tip Inside the building.
turnin The Platinum Discs##2439 |goto 33.48,60.21
step
talk Talvash del Kissel##6826
turnin Restoring the Necklace##2204|goto 36.36,3.62
step
talk Prospector Stormpike##1356
turnin The Hidden Chamber##2240 |goto 74.66,11.73
step
talk Advisor Belgrum##2918
turnin The Lost Tablets of Will##1139 |goto 77.32,9.75
]])
ZygorGuidesViewer:RegisterGuide("Dungeon Guides\\Classic\\Zul'Farrak Quests",{
author="support@zygorguides.com",
image=ZGV.IMAGESDIR.."Zul'Farrak",
description="This guide will walk you through completing the Zul'Farrak Quests.",
},[[
step
Reach Level 40 |ding 40
|tip Use the Leveling guides to accomplish this.
step
Enter the building |goto The Hinterlands 11.00,45.68 < 7 |walk
talk Gryphon Master Talonaxe##5636
|tip Inside the building.
accept Witherbark Cages##2988 |goto 9.76,44.48
step
click First Witherbark Cage
Check the First Cage |q 2988/1 |goto 23.28,58.75
step
click Second Witherbark Cage
Check the Second Cage |q 2988/2 |goto 23.13,58.76
step
Follow the path |goto 30.53,53.53 < 30 |only if walking
Follow the path |goto 32.40,57.21 < 15 |only if walking
click Third Witherbark Cage
Check the Third Cage |q 2988/3 |goto 31.99,57.38
step
Follow the path up |goto 12.91,48.27 < 15 |only if walking
Enter the building at the top of the path |goto 11.00,45.67 < 7 |walk
talk Gryphon Master Talonaxe##5636
|tip Inside the building.
turnin Witherbark Cages##2988 |goto 9.76,44.47
accept The Altar of Zul##2989 |goto 9.76,44.47
step
Run up the stairs |goto 47.75,66.74 < 15 |only if walking
Search the Altar of Zul |q 2989/1 |goto 48.85,68.45
|tip There are elite enemies at the top of the temple.
|tip Complete the quest goal and immediately run away to safety.
step
Follow the path up |goto 12.85,48.25 < 15 |only if walking
Enter the building at the top of the path |goto 11.00,45.67 < 7 |walk
talk Gryphon Master Talonaxe##5636
|tip Inside the building.
turnin The Altar of Zul##2989 |goto 9.76,44.48
accept Thadius Grimshade##2990 |goto 9.76,44.48
step
talk Thadius Grimshade##8022
|tip Upstairs inside the building, at the top.
turnin Thadius Grimshade##2990 |goto Blasted Lands 66.90,19.47
accept Nekrum's Medallion##2991 |goto 66.90,19.47
step
Run up the stairs |goto The Hinterlands 47.74,66.60 < 10 |only if walking
kill Qiaga the Keeper##7996
|tip At the top of the Altar of Zul.
|tip You may need help with this.
collect Sacred Mallet##9241 |goto 48.66,68.25 |q 2770 |future
step
Run up the stairs |goto 66.67,66.75 < 10 |only if walking
Continue up the stairs |goto 67.91,69.04 < 10 |only if walking
Follow the path |goto 67.78,70.69 < 10 |only if walking
Run up the stairs |goto 65.07,68.93 < 10 |only if walking
Follow the path |goto 63.77,70.68 < 10 |only if walking
Continue following the path |goto 65.39,72.99 < 10 |q 2770 |future
step
Run up the stairs |goto 67.16,73.31 < 10 |only if walking
Follow the path |goto 64.54,74.99 < 10 |only if walking
Run up the stairs |goto 62.17,71.38 < 10 |only if walking
Continue up the stairs |goto 59.92,70.16 < 10 |only if walking
Follow the path |goto 59.16,74.13 < 10 |q 2770 |future
step
use the Sacred Mallet##9241
collect Mallet of Zul'Farrak##9240 |goto 59.64,77.90 |q 2770 |future
step
Enter the building |goto Dustwallow Marsh 45.88,57.22 < 5 |walk
talk Tabetha##6546
|tip Inside the building.
accept Tiara of the Deep##2846 |goto 46.06,57.09
step
talk Wizzle Brassbolts##4453
accept Gahz'rilla##2770 |goto Thousand Needles 78.14,77.11
step
talk Yeh'kinya##8579
accept Screecher Spirits##3520 |goto Tanaris 66.98,22.36
step
kill Vale Screecher##5307+
|tip These have a low spawn rate.
use Yeh'Kinya's Bramble##10699
|tip Use it on their corpse.
talk Screecher Spirit##8612+
collect 3 Screecher Spirits |q 3520/1 |goto Feralas 58.31,57.70
step
talk Yeh'kinya##8579
turnin Screecher Spirits##3520 |goto Tanaris 66.98,22.36
accept The Prophecy of Mosh'aru##3527 |goto 66.98,22.36
step
talk Chief Engineer Bilgewhizzle##7407
accept Divino-matic Rod##2768 |goto 52.46,28.51
step
talk Tran'rek##7876
accept Scarab Shells##2865 |goto 51.57,26.76
step
talk Trenton Lighthammer##7804
accept Troll Temper##3042 |goto 51.42,28.75
step
Follow the path |goto 39.02,20.95 < 10 |only if walking
Enter the Zul'Farrak Dungeon with your Group |goto 38.73,19.97 < 7 |q 2991
stickystart "Collect_5_Uncracked_Scarab_Shell"
stickystart "Collect_20_Troll_Temper"
step
Inside the Zul'Farrak Dungeon:
kill Theka the Martyr##7272
|tip He is the second boss of the dungeon.
|tip Follow the path north and then go right when the path splits.
|tip Quickly go left afterwards and then north.
collect First Mosh'aru Tablet##10660 |q 3527/1
stickystart "Collect_Divino-matic_Rod"
step
Inside the Zul'Farrak Dungeon:
Kill the enemies that attack in waves
|tip Continue following the path west and run up the stairs to reach the top of the large pyramid.
|tip Kill the Sandfury Executioner and then open the cages to start the event.
kill Nekrum Gutchewer##7796
|tip He will be killable after you release them from captivity and clear the temple event.
collect Nekrum's Medallion##9471 |q 2991/1
step
label "Collect_Divino-matic_Rod"
Inside the Zul'Farrak Dungeon: |notinsticky
kill Sergeant Bly##7604
|tip He will be killable after you release them from captivity and clear the temple event.
collect Divino-matic Rod##8548 |q 2768/1
step
Inside the Zul'Farrak Dungeon:
kill Hydromancer Velratha##7795
|tip Follow the path southeast to reach the large room with a pool in the center.
|tip She walks around this area.
collect Tiara of the Deep##9234 |q 2846/1
collect Second Mosh'aru Tablet##10661 |q 3527/2
step
Inside the Zul'Farrak Dungeon:
use the Mallet of Zul'Farrak##9240
|tip Clear the room.
|tip Use it near the gong atop the pool of water.
kill Gahz'rilla##7273
collect Gahz'rilla's Electrified Scale##8707 |q 2770/1
step
label "Collect_5_Uncracked_Scarab_Shell"
Inside the Zul'Farrak Dungeon: |notinsticky
kill Scarab##7269
|tip They are found all around the instance, but mostly in the scarab room with Theka the Martyr.
collect 5 Uncracked Scarab Shell##9238 |q 2865/1
step
label "Collect_20_Troll_Temper"
Inside the Zul'Farrak Dungeon: |notinsticky
Kill enemies around this area
|tip These drop from troll enemies inside of Zul'Farrak.
|tip It will likely take multiple runs to complete.
collect 20 Troll Temper##9523 |q 3042/1
step
Leave the Zul'Farak Dungeon
Click Here to Continue |confirm |q 2991
step
talk Yeh'kinya##8579
turnin The Prophecy of Mosh'aru##3527 |goto Tanaris 66.98,22.36
step
talk Chief Engineer Bilgewhizzle##7407
turnin Divino-matic Rod##2768 |goto 52.46,28.51
step
talk Tran'rek##7876
turnin Scarab Shells##2865 |goto 51.57,26.76
step
talk Trenton Lighthammer##7804
turnin Troll Temper##3042 |goto 51.42,28.75
step
talk Wizzle Brassbolts##4453
turnin Gahz'rilla##2770 |goto Thousand Needles 78.14,77.11
step
Enter the building |goto Dustwallow Marsh 45.88,57.22 < 5 |walk
talk Tabetha##6546
|tip Inside the building.
turnin Tiara of the Deep##2846 |goto 46.06,57.09
step
talk Thadius Grimshade##8022
|tip Upstairs inside the building, at the top.
turnin Nekrum's Medallion##2991 |goto Blasted Lands 66.90,19.47
]])
ZygorGuidesViewer:RegisterGuide("Dungeon Guides\\Classic\\Maraudon Quests",{
author="support@zygorguides.com",
image=ZGV.IMAGESDIR.."Maraudon",
description="This guide will walk you through completing the Maraudon Quests.",
},[[
step
Reach Level 45 |ding 45
|tip Use the Leveling guides to accomplish this.
step
Enter the building |goto Dustwallow Marsh 65.73,48.61 < 7 |walk
talk Archmage Tervosh##4967
|tip At the top of the tower.
accept Shadowshard Fragments##7070 |goto 66.42,49.26
step
talk Talendria##11715
|tip Upstairs inside the building.
accept Vyletongue Corruption##7041 |goto Desolace 68.50,8.87
step
Run up the ramp |goto 64.66,9.23 < 10 |only if walking
talk Keeper Marandis##13698
accept Corruption of Earth and Seed##7065 |goto 63.82,10.66
step
talk Willow##13656
|tip Inside the building.
accept Twisted Evils##7028 |goto 62.19,39.63
step
talk Centuar Pariah##13717
|tip He walks around this area.
accept The Pariah's Instructions##7067 |goto 51.47,87.41
You may also find him around: |notinsticky
[48.23,87.69]
[43.95,86.00]
step
Run up the stairs |goto 29.84,62.54 < 7 |only if walking
click Stone Door
Enter the building |goto Kalimdor 38.43,57.98 < 5 |q 7066 |future
step
kill The Nameless Prophet##13718
|tip He spawns in multiple locations outside of the Maraudon dungeon.
|tip You may need help with this.
collect Amulet of Spirits##17757 |goto 38.31,57.96 |q 7067
You may also find him at: |notinsticky
[38.32,58.18]
[38.20,58.05]
[38.39,57.96]
step
Run down the stairs |goto 38.25,57.99 < 7 |only if walking
Follow the path |goto 38.43,57.85 < 10 |only if walking
Continue following the path |goto 38.64,57.71 < 7 |only if walking
Continue following the path |goto 38.53,57.55 < 10 |only if walking
Continue following the path |goto 38.48,57.34 < 7 |q 7067
step
Continue following the path |goto Desolace 29.44,57.22 < 7 |only if walking
Jump down here |goto 28.80,56.17 < 7 |q 7067
step
Enter the cave |goto Desolace 28.71,56.20 < 5 |only if walking
use the Amulet of Spirits##17757
|tip Use it on the Spirit of Gelk.
|tip He walks around this area.
kill Gelk##13741
collect Gem of the Second Khan##17762 |goto Kalimdor 38.47,57.29 |q 7067
step
Follow the path |goto 38.46,57.08 < 5 |only if walking
Kill Shadowshard enemies around this area
collect 10 Shadowshard Fragment##17756 |q 7070/1 |goto Desolace 28.32,54.47
step
Follow the path |goto 29.58,55.54 < 7 |only if walking
Continue following the path |goto 29.46,57.25 < 7 |only if walking |q 7067
step
Jump down here |goto Kalimdor 38.53,57.60 < 5 |only if walking
use the Amulet of Spirits##17757
|tip Use it on the Spirit of Kolk.
kill Kolk##13742
collect Gem of the First Khan##17761 |goto 38.50,57.72 |q 7067
step
Follow the path |goto 38.60,57.95 < 10 |only if walking
Continue following the path |goto Kalimdor 38.44,58.13 < 7 |only if walking
Continue following the path |goto 38.49,58.22 < 7 |q 7067
step
talk Cavindra##Cavindra
accept Legend of Maraudon##7044	|goto 38.76,58.13
step
Follow the path |goto 38.82,58.31 < 7 |only if walking
use Coated Cerulean Vial##17693
collect Filled Cerulean Vial##17696 |q 7041/2 |goto 38.92,58.36
step
Follow the path |goto 39.08,58.01 < 10 |only if walking
Continue following the path |goto 39.35,58.03 < 7 |only if walking
use the Amulet of Spirits##17757
|tip Use it on the Spirit of Magra.
|tip He walks around this area.
kill Magra##13740
collect Gem of the Third Khan##17763 |goto 39.20,57.68 |q 7067
step
Follow the path |goto 39.21,57.84 < 10 |only if walking
Continue following the path |goto 39.35,58.04 < 10 |only if walking
Enter the Maraudon (Foulspore Cavern - Orange) Dungeon with your Group |goto 39.27,58.19 < 5 |q 7046 |future
stickystart "Collect_Gem_of_the_Fifth_Khan"
stickystart "Heal_Vylestem_Vines"
stickystart "Collect_15_Theradric_Crystal_Carving"
step
Inside the Maraudon Dungeon:
kill Noxxion##13282
|tip It is the first boss on the Orange side of Maraudon.
|tip After entering the dungeon, run up the stairs and follow the path to the right whenever possible.
collect Celebrian Rod##17702 |q 7044/2
step
label "Collect_Gem_of_the_Fifth_Khan"
Inside the Maraudon Dungeon: |notinsticky
use the Amulet of Spirits##17757
|tip Use it on the Spirit of Veng.
|tip He walks around the Orange side of Maraudon.
kill Veng##13738
collect Gem of the Fifth Khan##17765 |q 7067
step
label "Heal_Vylestem_Vines"
Inside the Maraudon Dungeon: |notinsticky
use the Filled Cerulean Vial##17696
|tip While in the Foulspore Cavern, or Orange side of Maraudon, there will be tree stumps with a red top.
|tip You won't be able to target them.
|tip They have five leaves growing out of them.
|tip Use the Filled Cerulean Vial near them and Noxxious Scion will spawn.
kill Noxxious Scion##13696+
Heal 8 Vylestem Vines |q 7041/1
step
Leave the Maraudon - Orange Dungeon
Click Here to Continue |confirm |q 7067
stickystop "Collect_15_Theradric_Crystal_Carving"
step
Follow the path |goto Kalimdor 39.21,58.04 < 7 |only if walking
Continue following the path |goto 39.08,58.26 < 7 |only if walking
Continue following the path |goto 38.82,58.29 < 10 |only if walking
Continue following the path |goto 38.59,58.23 < 7 |only if walking
Continue following the path |goto Desolace 29.61,64.71 < 7 |q 7067
step
Follow the path down |goto Kalimdor 38.44,57.82 < 7 |only if walking
Cross the bridge |goto 38.64,57.69 < 7 |only if walking
Follow the path |goto 38.48,57.37 < 7 |only if walking
Enter the Maraudon - Purple Dungeon with your Group |goto Desolace 30.20,54.58 < 10 |q 7066 |future
stickystart "Collect_15_Theradric_Crystal_Carving"
step
Inside the Maraudon Dungeon:
use the Amulet of Spirits##17757
|tip Use it on the Spirit of Maraudos.
|tip He walks around The Wicked Grotto in the Purple side of Maraudon.
kill Maraudos##13739
collect Gem of the Fourth Khan##17764 |q 7067
step
Inside the Maraudon Dungeon:
use the Gem of the Fifth Khan##17765
collect Amulet of Union##17758 |q 7067/1
step
Inside the Maraudon Dungeon:
kill Lord Vyletongue##12236
|tip He is Purple side of Maraudon.
|tip Proceed through The Wicked Grotto and enter the Vyletongue Seat.
|tip He is in a small room on the northern side.
collect Celebrian Diamond##17703 |q 7044/1
step
Inside the Maraudon Dungeon:
kill Celebras the Cursed##12225
|tip He is Purple side of Maraudon.
|tip Continue through the Vyletongue Seat and into the Poison Falls.
|tip Once you reach the Poison Falls, continue working your way west and then south, where he will be on a small island.
talk Celebras the Redeemed##13716
|tip He will appear after you kill Celebras the Cursed.
turnin Legend of Maraudon##7044
accept The Scepter of Celebras##7046
step
Inside the Maraudon Dungeon:
Follow Celebras the Redeemed
|tip Click the stone he leads you to.
click Incantations of Celebras
Watch the Dialogue
Create the Scepter of Celebras |q 7046/1
step
Inside the Maraudon Dungeon:
talk Celebras the Redeemed##13716
turnin The Scepter of Celebras##7046
step
Inside the Maraudon Dungeon:
kill Princess Theradras##12201 |q 7065/1
|tip She is the last boss on the Purple side of Maraudon.
|tip Continue going south and jump down the waterfall.
|tip Continue following the path south through the dungeon to reach Zaetar's Grave.
|tip Princess Theradras is found at the end of Zaetar's Grave.
step
Inside the Maraudon Dungeon:
talk Zaetar's Spirit##12238
|tip He will appear at the center of the room once Princess Theradras is killed.
accept Seed of Life##7066
step
label "Collect_15_Theradric_Crystal_Carving"
Inside the Maraudon Dungeon: |notinsticky
Kill enemies around this area
|tip These drop from enemies inside of Maraudon.
collect 15 Theradric Crystal Carving##17684 |q 7028/1
step
Leave the Maraudon Dungeon
Click Here to Continue |confirm |q 7066
step
talk Centuar Pariah##13717
|tip He walks around this area.
turnin The Pariah's Instructions##7067 |goto 51.47,87.41
You may also find him around: |notinsticky
[48.23,87.69]
[43.95,86.00]
step
talk Willow##13656
|tip Inside the building.
turnin Twisted Evils##7028 |goto 62.19,39.63
step
talk Talendria##11715
|tip Upstairs inside the building.
turnin Vyletongue Corruption##7041 |goto 68.50,8.87
step
Run up the ramp |goto 64.66,9.23 < 10 |only if walking
talk Keeper Marandis##13698
turnin Corruption of Earth and Seed##7065 |goto 63.82,10.66
step
Enter the building |goto Dustwallow Marsh 65.73,48.61 < 7 |walk
talk Archmage Tervosh##4967
|tip At the top of the tower.
turnin Shadowshard Fragments##7070 |goto 66.42,49.26
step
talk Keeper Remulos##11832
turnin Seed of Life##7066 |goto Moonglade 36.18,41.82
]])
ZygorGuidesViewer:RegisterGuide("Dungeon Guides\\Classic\\Temple of Atal'Hakkar Quests",{
author="support@zygorguides.com",
image=ZGV.IMAGESDIR.."The Temple of Atal'Hakkar",
description="This guide will walk you through completing the Temple of Atal'Hakkar Quests.",
},[[
step
Reach Level 47 |ding 47
|tip Use the Leveling guides to accomplish this.
step
talk Brohann Caskbelly##5384
accept In Search of The Temple##1448 |goto Stormwind City 69.45,40.42
step
Search for the Temple of Atal'Hakkar |q 1448/1 |goto Swamp of Sorrows 66.82,59.39
step
talk Brohann Caskbelly##5384
turnin In Search of The Temple##1448 |goto Stormwind City 69.45,40.42
accept To The Hinterlands##1449 |goto Stormwind City 69.45,40.42
step
talk Falstad Wildhammer##5635
turnin To The Hinterlands##1449 |goto The Hinterlands 11.81,46.76
accept Gryphon Master Talonaxe##1450 |goto 11.81,46.76
step
Run up the ramp |goto 11.75,46.90 < 10 |only if walking
Enter the building |goto 11.00,45.68 < 10 |walk
talk Gryphon Master Talonaxe##5636
|tip Inside the building.
turnin Gryphon Master Talonaxe##1450 |goto 9.75,44.48
accept Rhapsody Shindigger##1451 |goto 9.75,44.48
step
Follow the path up |goto The Hinterlands 21.02,47.81 < 15 |only if walking
talk Rhapsody Shindigger##5634
turnin Rhapsody Shindigger##1451 |goto 26.94,48.59
accept Rhapsody's Kalimdor Kocktail##1452 |goto 26.94,48.59
step
Kill Roc enemies around this area
collect 3 Roc Gizzard##6257 |q 1452/1 |goto Tanaris 43.48,40.36
step
Enter the building |goto Feralas 31.84,45.02 < 5 |walk
talk Angelas Moonbreeze##7900
accept The Sunken Temple##3445 |goto 31.83,45.61
step
Kill Ironfur enemies around this area
|tip They share a spawn with Groddoc enemies around this area.
collect 3 Ironfur Liver##6258 |q 1452/2 |goto Feralas 49.93,30.39
You can find more around [46.20,25.09]
step
Kill Groddoc enemies around this area
|tip They share a spawn with Ironfur enemies around this area.
collect 3 Groddoc Liver##6259 |q 1452/3 |goto 49.93,30.39
You can find more around [46.20,25.09]
step
Follow the path up |goto The Hinterlands 21.02,47.81 < 15 |only if walking
talk Rhapsody Shindigger##5634
turnin Rhapsody's Kalimdor Kocktail##1452 |goto 26.94,48.59
Watch the Dialogue
accept Rhapsody's Tale##1469 |goto 26.94,48.59
step
talk Brohann Caskbelly##5384
|tip Inside the building.
turnin Rhapsody's Tale##1469 |goto Stormwind City 69.45,40.42
accept Into The Temple of Atal'Hakkar##1475 |goto Stormwind City 69.45,40.42
step
talk Marvon Rivetseeker##7771
turnin The Sunken Temple##3445 |goto Tanaris 52.71,45.92
accept The Stone Circle##3444 |goto 52.71,45.92
step
click Marvon's Chest
collect Stone Circle##10556 |q 3444/1 |goto The Barrens 62.50,38.54
step
talk Marvon Rivetseeker##7771
turnin The Stone Circle##3444 |goto Tanaris 52.71,45.92
accept Into the Depths##3446 |goto 52.71,45.92
step
talk Yeh'kinya##8579
accept Screecher Spirits##3520 |goto 66.98,22.36
step
kill Vale Screecher##5307+
|tip These have a low spawn rate.
use Yeh'Kinya's Bramble##10699
|tip Use it on their corpse.
talk Screecher Spirit##8612+
Collect 3 Screecher Spirits |q 3520/1 |goto Feralas 58.31,57.70
step
talk Yeh'kinya##8579
turnin Screecher Spirits##3520 |goto Tanaris 66.98,22.36
accept The Prophecy of Mosh'aru##3527 |goto 66.98,22.36
step
Enter the Zul'Farrak Dungeon |goto 38.73,19.99 < 7 |q 3527 |future
|tip You may need help with this quest.
step
Inside the Zul'Farrak Dungeon:
kill Theka the Martyr##7272
|tip Follow the path north and then go right when the path splits.
|tip Quickly go left afterwards and then north.
|tip He is the second boss of the dungeon.
|tip You may need help with this.
collect First Mosh'aru Tablet##10660 |q 3527/1
step
Inside the Zul'Farrak Dungeon:
kill Hydromancer Velratha##7795
|tip Follow the path west to reach an open room with a large pyramid on the western side.
|tip Continue following the path southeast to reach the large room with a pool in the center.
|tip She walks around this area.
|tip You may need help with this.
collect Second Mosh'aru Tablet##10661 |q 3527/2
step
Leave the Zul'Farrak Dungeon
Click Here to Continue |confirm |q 3527 |future
step
talk Yeh'kinya##8579
turnin The Prophecy of Mosh'aru##3527 |goto 66.98,22.36
accept The Ancient Egg##4787 |goto 66.98,22.36
step
Follow the path |goto The Hinterlands 35.78,64.12 < 15 |only if walking
Run up the stairs |goto 33.09,73.80 < 15 |only if walking
Jump down here |goto 33.11,75.53 < 7 |only if walking
talk Atal'ai Exile##5598
accept Jammal'an the Prophet##1446 |goto 33.75,75.22
step
Follow the path |goto 35.79,64.07 < 15 |only if walking
Run up the stairs |goto 66.70,66.71 < 8 |only if walking
Follow the path |goto 66.63,68.83 < 10 |only if walking
Run up the stairs |goto 67.93,69.12 < 10 |only if walking
Follow the path |goto 67.78,70.73 < 10 |q 4787
step
Run up the stairs |goto 65.08,68.94 < 8 |only if walking
Follow the path |goto 63.69,70.44 < 10 |only if walking
Continue following the path |goto 65.38,72.92 < 10 |only if walking
Run up the stairs |goto 67.14,73.37 < 8 |only if walking
Follow the path |goto 67.15,75.46 < 10 |q 4787
step
Follow the path |goto 64.52,74.83 < 10 |only if walking
Run up the stairs |goto 62.16,71.38 < 10 |only if walking
Continue up the stairs |goto 59.96,70.17 < 10 |only if walking
Follow the path |goto 58.68,70.28 < 10 |only if walking
Continue following the path |goto 59.15,74.30 < 10 |q 4787
step
Enter the cave |goto 58.61,79.19 < 10 |walk
Follow the path down |goto 58.26,82.31 < 10 |walk
Follow the path up |goto 54.81,83.42 < 10 |walk
click Ancient Egg##175889
|tip Inside the cave.
|tip You may need help with this.
collect Ancient Egg##12402 |q 4787/1 |goto 57.52,86.78
step
talk Yeh'kinya##8579
turnin The Ancient Egg##4787 |goto Tanaris 66.98,22.36
accept The God Hakkar##3528 |goto 66.98,22.36
step
Follow the path up |goto Un'Goro Crater 45.72,13.08 < 10 |only if walking
talk Muigin##9119
accept Muigin and Larion##4141 |goto 42.94,9.65
step
label "Collect_Bloodpetals"
Kill Bloodpetal enemies around this area
|tip They look like walking plants.
collect 15 Bloodpetal##11316 |q 4141/1 |goto 71.46,38.72
|tip These have a low drop rate.
You can find more around: |notinsticky
[69.26,24.59]
[66.08,35.13]
[55.87,34.69]
[41.91,27.10]
step
Follow the path up |goto 45.72,13.08 < 10 |only if walking
talk Muigin##9119
turnin Muigin and Larion##4141 |goto 42.94,9.65
accept A Visit to Gregan##4142 |goto 42.94,9.65
step
Follow the path up |goto Feralas 47.28,44.56 < 15 |only if walking
Follow the path |goto 48.66,44.98 < 15 |only if walking
Continue following the path |goto 47.87,36.21 < 15 |only if walking
Follow the path down |goto 48.22,32.73 < 15 |only if walking
Follow the path up |goto 45.70,25.74 < 15 |only if walking
talk Gregan Brewspewer##7775
turnin A Visit to Gregan##4142 |goto 45.12,25.56
accept Haze of Evil##4143 |goto 45.12,25.56
step
Run up the stairs |goto Swamp of Sorrows 69.31,57.06 < 10 |only if walking
Enter the Temple |goto 69.99,52.99 < 7
Run down the stairs |goto 69.58,51.44 < 7 |q 3528
step
Swim through the water |goto 70.22,51.69 < 7 |walk
Run up the stairs |goto 71.74,45.81 < 5 |walk
Run down the stairs |goto 72.70,42.22 < 5 |only if walking
Follow the path |goto 75.83,44.85 < 5 |only if walking
Continue following the path |goto 76.02,45.96 < 5 |q 3528
step
Follow the path |goto Eastern Kingdoms 56.89,75.91 < 5 |only if walking
click Atal'ai Tablet##37099+
|tip They look like silver stone tablets along the walls around this area.
collect 10 Atal'ai Tablet##6288 |q 1475/1 |goto 56.76,76.01
step
Continue following the path |goto 56.88,76.00 < 5 |only if walking
Continue following the path |goto 57.08,75.59 < 5 |only if walking
Run down the stairs |goto 57.00,75.55 < 5 |only if walking
Follow the path |goto 56.91,75.36 < 5 |only if walking
Continue following the path |goto 56.79,75.39 < 5 |only if walking
Enter The Temple of Atal'Hakkar Dungeon with your Group |goto 56.81,75.17 < 5 |q 3528
stickystart "Collect_20_Fetish_of_Hakkar"
stickystart "Collect_5_Atal'ai_Haze"
step
Inside the Temple of Atal'Hakkar Dungeon:
|tip After entering the dungeon follow the left path and then go down the stairs to reach the Hall of Serpents.
|tip Run around the outside ring and clear each of the small inside rooms.
click Atal'ai Statue##148830+
|tip Click the serpent statues in the inside rooms in this order:
|tip South, north, southwest, southeast, northwest then finally the northeast altar.
|tip Atal'alarion will appear after clicking the statues in the correct order; jump down and kill him.
kill Atal'alarion##8580
click Altar of Hakkar
|tip At the top of the stairs in The Pit of Refuse.
turnin Into the Depths##3446
accept Secret of the Circle##3447
step
Inside the Temple of Atal'Hakkar Dungeon:
click Idol of Hakkar##148838
|tip In the center of the room in The Pit of Refuse.
turnin Secret of the Circle##3447
step
Inside the Temple of Atal'Hakkar Dungeon:
kill Jammal'an the Prophet##5710
|tip Follow the path up and out of The Pit of Refuse.
|tip Follow the left path again and go up three large sets of stairs, immediately go right to follow a short hallway and reach the upper level of The Pit of Sacrifice.
|tip There should be an elite enemy named Hukku channeling a spell on this balcony; kill him and then go back down the short hallway, but turn right and continue up the stairs to the Hall of the Cursed.
|tip Proceed around this room, following each set of stairs up or down to find additional balconies with named enemies channeling a spell.
|tip There are a total of six named elites that need to be killed in order to remove that barrier blocking the way to Jammal'an the Prophet.
|tip After all six balconies have been cleared, drop down from the final balcony into The Pit of Sacrifice.
|tip Follow the southeast path to reach Jammal'an the Prophet.
collect Head of Jammal'an##6212 |q 1446/1
step
Inside the Temple of Atal'Hakkar Dungeon:
kill Shade of Eranikus##5709
|tip Return to the main central room in The Pit of Sacrifice and follow the southern path.
collect Essence of Eranikus##10454 |q 3373 |future
step
Inside the Temple of Atal'Hakkar Dungeon:
use the Essence of Eranikus##10454
accept The Essence of Eranikus##3373
step
Inside the Temple of Atal'Hakkar Dungeon:
click Essence Font##148512
|tip It looks like a stone table in the northeastern corner of the room with the Shade of Eranikus.
turnin The Essence of Eranikus##3373
step
Inside the Temple of Atal'Hakkar Dungeon:
use the Egg of Hakkar##10465
|tip Use it next to the skeleton laying on the ground in the Sanctum of the Fallen God.
|tip Return to the main central room in The Pit of Sacrifice and follow the southwestern path to reach the Sanctum of the Fallen God.
Kill the enemies that spawn in waves
kill Hakkari Bloodkeeper##8438+
collect Hakkari Blood##10460 |n
|tip Use it to put out the braziers in each corner of the room.
click Eternal Flame##148420+
kill Avatar of Hakkar##8443
|tip It will spawn after the four Eternal Flames have been extinguished.
collect Essence of Hakkar##10663 |q 3528
step
Inside the Temple of Atal'Hakkar Dungeon:
use the Essence of Hakkar##10663
Fill the Egg of Hakkar |q 3528/1
step
label "Collect_20_Fetish_of_Hakkar"
Inside the Temple of Atal'Hakkar Dungeon: |notinsticky
Kill Atal'ai enemies around this area
collect 20 Fetish of Hakkar##6181 |q 1445/1
|tip These can also drop outside of the instance.
step
label "Collect_5_Atal'ai_Haze"
Inside the Temple of Atal'Hakkar Dungeon: |notinsticky
Kill enemies around this area
|tip Murk Worms, Deep Lurkers and Saturated Oozes specifically drop the quest item.
collect 5 Atal'ai Haze##11318 |q 4143/1
step
Leave the Temple of Atal'Hakkar
Click Here to Continue |confirm |q 3528
step
talk Brohann Caskbelly##5384
|tip Inside the building.
turnin Into The Temple of Atal'Hakkar##1475 |goto Stormwind City 69.45,40.42
step
Follow the path |goto The Hinterlands 35.78,64.12 < 15 |only if walking
Run up the stairs |goto 33.09,73.80 < 15 |only if walking
Jump down here |goto 33.11,75.53 < 7 |only if walking
talk Atal'ai Exile##5598
turnin Jammal'an the Prophet##1446 |goto 33.75,75.22
step
Follow the path up |goto Un'Goro Crater 45.72,13.08 < 10 |only if walking
talk Muigin##9119
turnin Haze of Evil##4143 |goto 42.94,9.65
step
talk Yeh'kinya##8579
turnin The God Hakkar##3528 |goto Tanaris 66.98,22.36
]])
ZygorGuidesViewer:RegisterGuide("Dungeon Guides\\Classic\\Blackrock Depths Quests",{
author="support@zygorguides.com",
image=ZGV.IMAGESDIR.."Blackrock Depths",
description="This guide will walk you through completing the Blackrock Depths Quests.",
},[[
step
Reach Level 52 |ding 52
|tip Use the Leveling guides to accomplish this.
step
Enter the building |goto Tanaris 66.99,23.87 < 5 |walk
talk Yorba Screwspigot##9706
|tip Inside the building.
accept Yuka Screwspigot##4324 |goto 67.04,24.01
step
Enter the building |goto Ironforge 44.12,50.01 < 8 |walk
talk Royal Historian Archesonus##8879
|tip Inside the building.
accept The Smoldering Ruins of Thaurissan##3702 |goto 38.37,55.29
step
talk Royal Historian Archesonus##8879
|tip Inside the building.
Tell her _"I am ready to listen."_
Hear the Story of Thaurissan |q 3702/1 |goto 38.37,55.29
step
talk Royal Historian Archesonus##8879
|tip Inside the building.
turnin The Smoldering Ruins of Thaurissan##3702 |goto 38.37,55.29
accept The Smoldering Ruins of Thaurissan##3701 |goto 38.37,55.29
step
talk Enohar Thunderbrew##9540
accept Ragnar Thunderbrew##4128 |goto Blasted Lands 63.64,20.63
step
talk Ragnar Thunderbrew##1267
turnin Ragnar Thunderbrew##4128 |goto Dun Morogh 46.83,52.36
accept Hurley Blackbreath##4126 |goto 46.83,52.36
step
Follow the path up |goto Burning Steppes 82.76,63.28 < 10 |only if walking
talk Oralius##9177
accept The Good Stuff##4286 |goto 84.56,68.69
step
talk Helendis Riverhorn##9562
accept Dragonkin Menace##4182 |goto 85.82,68.94
step
talk Jalinda Sprig##9561
accept Overmaster Pyron##4262 |goto 85.41,70.05
stickystart "Kill_Black_Wyrmkins"
stickystart "Kill_Black_Dragonspawns"
stickystart "Kill_Black_Broodlings"
step
kill Black Drake##7044 |q 4182/3 |goto 86.33,30.69
|tip They look like red dragons flying low to the ground around this area.
|tip If you have trouble, try to find someone to help you.
|tip It's important to get this quest completed.
Also check around: |notinsticky
[89.89,37.22]
[89.50,56.92]
[81.84,58.36]
step
label "Kill_Black_Wyrmkins"
kill 4 Black Wyrmkin##7041 |q 4182/4 |goto 84.25,27.76
|tip If you have trouble, try to find someone to help you.
|tip It's important to get this quest completed.
You can find more around: |notinsticky
[88.83,39.34]
[91.82,54.43]
step
label "Kill_Black_Dragonspawns"
kill 10 Black Dragonspawn##7040 |q 4182/2 |goto 84.25,27.76
|tip If you have trouble, try to find someone to help you.
|tip It's important to get this quest completed.
You can find more around: |notinsticky
[88.83,39.34]
[91.82,54.43]
step
label "Kill_Black_Broodlings"
kill 15 Black Broodling##7047 |q 4182/1 |goto 72.83,28.41
You can find more around: |notinsticky
[80.05,27.94]
[87.34,32.01]
[91.96,35.64]
[89.92,45.69]
[84.65,61.84]
step
click Thaurissan Relic##153556+
|tip They look like small rectangular stones on the ground around this area.
Recover #12# Pieces of Information |q 3701/1 |goto 67.17,38.19
step
talk Helendis Riverhorn##9562
turnin Dragonkin Menace##4182 |goto 85.82,68.95
step
Enter the building |goto Ironforge 44.12,50.01 < 7 |walk
talk Royal Historian Archesonus##8879
|tip Inside the building.
turnin The Smoldering Ruins of Thaurissan##3701 |goto 38.37,55.29
step
talk King Magni Bronzebeard##2784
|tip Inside the building.
accept Kharan Mighthammer###4341 |goto 39.12,56.18
step
Follow the path up |goto Burning Steppes 82.76,63.28 < 10 |only if walking
talk Marshal Maxwell##9560
accept Marshal Windsor##4241 |goto 84.74,69.01
step
talk Kalaran Windblade##8479
accept Divine Retribution##3441 |goto Searing Gorge 39.05,38.99
step
talk Kalaran Windblade##8479
Ask him _"Tell me what drives this vengeance?"_
Listen to Kalaran's Story |q 3441/1 |goto 39.05,38.99
step
talk Kalaran Windblade##8479
turnin Divine Retribution##3441 |goto 39.05,38.99
accept The Flawless Flame##3442 |goto 39.05,38.99
stickystart "Collect_Hearts_Of_Flame"
step
Kill enemies around this area
|tip Only Tempered War Golems, Heavy War Golems, and Magma Elementals will drop this quest item.
collect 4 Golem Oil##10511 |q 3442/2 |goto 48.59,38.32
You can find more around: |notinsticky
[43.27,39.20]
[36.56,40.58]
[32.26,46.19]
[25.43,53.98]
[31.52,72.23]
step
label "Collect_Hearts_Of_Flame"
Kill Elemental enemies around this area
|tip Heavy War Golems will not drop this quest item.
collect 4 Heart of Flame##10509 |q 3442/1 |goto 42.58,38.58
You can find more around: |notinsticky
[39.22,41.58]
[31.18,43.67]
[25.43,53.98]
[31.52,72.23]
step
talk Kalaran Windblade##8479
turnin The Flawless Flame##3442 |goto 39.05,38.99
accept Forging the Shaft##3443 |goto 39.05,38.99
step
Jump down here |goto 49.32,43.74 < 15 |only if walking
Enter the cave |goto 49.58,45.49 < 10 |walk
Cross the bridge |goto 47.78,42.60 < 15 |walk
Follow the path |goto 42.02,35.57 < 15 |walk
Kill Dark Iron enemies around this area
|tip Inside the cave, all throughout.
|tip You can also find some outside, near Thorium Point.
collect 8 Thorium Plated Dagger##10551 |q 3443/1 |goto 43.38,34.94
step
Follow the path |goto 50.59,38.45 < 15 |walk
Continue following the path |goto 47.21,42.94 < 15 |walk
Leave the cave |goto 47.53,46.72 < 15 |walk
Jump down carefully here |goto 48.98,46.87 < 10 |only if walking
Follow the path up |goto 58.08,41.10 < 15 |only if walking
Follow the path |goto 65.38,34.61 < 30 |only if walking
talk Kalaran Windblade##8479
turnin Forging the Shaft##3443 |goto 39.06,38.99
accept The Flame's Casing##3452 |goto 39.06,38.99
step
Follow the path down |goto 34.86,25.83 < 20 |only if walking
Follow the path |goto 31.32,33.57 < 30 |only if walking
Kill Twilight enemies around this area
|tip They are elite enemies, you will likely need help with this.
|tip Try to find someone to help you.
|tip Doing this quest unlocks more quests that give easy experience, so it's important to get it done.
collect Symbol of Ragnaros##10552 |q 3452/1 |goto 24.62,35.13
|tip This has a low drop rate.
You can find more inside the cave at [21.89,36.36]
You can find more up the path that starts at [24.23,33.12]
step
Follow the path |goto 26.48,34.56 < 30 |only if walking
talk Kalaran Windblade##8479
turnin The Flame's Casing##3452 |goto 39.05,38.99
accept The Torch of Retribution##3453 |goto 39.05,38.99
step
Watch the dialogue
Witness the Creation of the Torch |q 3453/1 |goto 39.05,38.99
step
talk Kalaran Windblade##8479
turnin The Torch of Retribution##3453 |goto 39.05,38.99
accept The Torch of Retribution##3454 |goto 39.05,38.99
step
click Torch of Retribution##149047
turnin The Torch of Retribution##3454 |goto 39.06,39.06
step
talk Kalaran Windblade##8479
accept Squire Maltrake##3462 |goto 39.05,39.00
step
talk Squire Maltrake##8509
turnin Squire Maltrake##3462 |goto 39.16,38.99
accept Set Them Ablaze!##3463 |goto 39.16,38.99
step
Follow the path |goto 33.70,49.71 < 30 |only if walking
Run up the ramp |goto 33.50,53.64 < 15 |only if walking
click Sentry Brazier##149032
|tip On the metal platform of the tower.
|tip You have to equip the Torch of Retribution.
|tip Remember to re-equip your normal weapon after.
Set the Northern Tower Ablaze |q 3463/4 |goto 33.31,54.49
step
Run up the ramp |goto 35.92,59.85 < 15 |only if walking
click Sentry Brazier##149025
|tip On the metal platform of the tower.
|tip You have to equip the Torch of Retribution.
|tip Remember to re-equip your normal weapon after.
Set the Western Tower Ablaze |q 3463/1 |goto 35.67,60.68
step
Follow the path |goto 35.00,72.13 < 30 |only if walking
Continue following the path |goto 43.33,72.09 < 30 |only if walking
Run up the ramp |goto 44.10,61.85 < 15 |only if walking
click Sentry Brazier##149030
|tip On the metal platform of the tower.
|tip You have to equip the Torch of Retribution.
|tip Remember to re-equip your normal weapon after.
Set the Southern Tower Ablaze |q 3463/2 |goto 44.03,60.91
step
Cross the hanging bridge |goto 52.48,57.95 < 15 |only if walking
Run up the ramp |goto 50.19,55.61 < 15 |only if walking
click Sentry Brazier##149031
|tip On the metal platform of the tower.
|tip You have to equip the Torch of Retribution.
|tip Remember to re-equip your normal weapon after.
Set the Eastern Tower Ablaze |q 3463/3 |goto 50.06,54.74
step
Follow the path |goto 67.99,50.25 < 30 |only if walking
Continue following the path |goto 66.79,34.56 < 30 |only if walking
talk Squire Maltrake##8509
turnin Set Them Ablaze!##3463 |goto 39.17,39.00
step
Watch the dialogue
click Hoard of the Black Dragonflight##149502
accept Trinkets...##3481 |goto 38.86,38.99
step
click Hoard of the Black Dragonflight##149502
turnin Trinkets...##3481 |goto 38.86,38.99
|tip Save the Hoard of the Black Dragonflight for later.
step
talk Maxwort Uberglint##9536
accept The Heart of the Mountain##4123 |goto Burning Steppes 65.15,23.91
step
Enter the cave |goto 65.65,22.68 < 7 |walk
talk Yuka Screwspigot##9544
|tip Inside the cave.
turnin Yuka Screwspigot##4324 |goto 66.06,21.95
accept Ribbly Screwspigot##4136 |goto 66.06,21.95
step
Enter the cave |goto 94.43,31.86 < 7 |walk
talk Cyrus Therepentous##9459
|tip Inside the cave.
accept A Taste of Flame##4022 |goto 95.07,31.56
step
use the Hoard of the Black Dragonflight##10569
collect Black Dragonflight Molt##10575 |q 4022/1
step
talk Cyrus Therepentous##9459
|tip Inside the cave.
turnin A Taste of Flame##4022 |goto 95.07,31.56
accept A Taste of Flame##4024 |goto 95.07,31.56
step
Follow the path up |goto Searing Gorge 33.53,75.22 < 20 |only if walking
Enter Blackrock Mountain |goto Searing Gorge 34.76,83.98 < 7 |walk
Jump into the lava |havebuff 132331 |goto Eastern Kingdoms 48.63,64.04 |q 3801 |future
|tip You will need to be dead to talk to the next quest giver.
step
Follow the path up |goto Searing Gorge 33.53,75.22 < 20 |only if walking |zombiewalk
Enter Blackrock Mountain |goto Searing Gorge 34.76,83.98 < 7 |walk |zombiewalk
Jump into the lava |goto Eastern Kingdoms 48.59,63.92 < 7 |only if walking |zombiewalk
Run up the chain |goto 48.50,63.91 < 5 |only if walking |zombiewalk
Enter the building |goto 48.66,64.08 < 5 |only if walking |zombiewalk
talk Franclorn Forgewright##8888
|tip You must be dead to talk to him.
accept Dark Iron Legacy##3801 |goto 48.62,64.18 |zombiewalk
step
talk Franclorn Forgewright##8888
|tip You must be dead to talk to him.
turnin Dark Iron Legacy##3801 |goto 48.62,64.18 |zombiewalk
accept Dark Iron Legacy##3802 |goto 48.62,64.18 |zombiewalk
step
Follow the path |goto 48.48,63.93 < 7 |only if walking
Enter the building |goto 48.43,63.83 < 5 |walk
Continue following the path |goto 48.13,63.33 < 20 |only if walking
kill Overmaster Pyron##9026 |q 4262/1 |goto 48.03,62.55
|tip He patrols around this area.
|tip You may need help with this.
step
Enter the Blackrock Depths Dungeon with your Group |goto 48.08,62.41 < 7 |q 4123
stickystart "Collect_Dark_Keeper_Key"
stickystart "Collect_Dark_Iron_Fanny_Packs"
step
Inside the Blackrock Depths Dungeon:
Kill Anvilrage dwarves at the beginning of the dungeon
|tip Just clear the first few rooms of the dungeon, killing all the Anvilrage dwarves and resetting the instance if needed, until you get the item drop.
collect A Crumpled Up Note##11446 |condition itemcount(11446) == 1 or haveq(4264) or completedq(4264)
step
Inside the Blackrock Depths Dungeon:
use A Crumpled Up Note##11446
accept A Crumpled Up Note##4264
step
Inside the Blackrock Depths Dungeon:
kill High Interrogator Gerstahn##9018
|tip After entering the dungeon, go straight into the Detention Block and then take the first right.
|tip Follow this path around until you can go left into a room at the back of this long hallway.
collect Prison Cell Key##11140 |q 4341 |future
step
Inside the Blackrock Depths Dungeon:
click Cell Door
|tip Leave the room with High Interrogator Gerstahn and continue left through the tunnel.
|tip While in the tunnel, open the second interactable Cell Door on the right.
talk Kharan Mighthammer##9021
|tip Inside the cell.
turnin Kharan Mighthammer##4341
accept Kharan's Tale##4342
step
Inside the Blackrock Depths Dungeon:
talk Kharan Mighthammer##9021
|tip Inside the cell.
Tell him _"All is not lost, Kharan!"_
Hear Kharan's Tale |q 4342/1
step
Inside the Blackrock Depths Dungeon:
talk Kharan Mighthammer##9021
|tip Inside the cell.
turnin Kharan's Tale##4342
accept The Bearer of Bad News##4361
step
Inside the Blackrock Depths Dungeon:
click Cell Door
|tip Leave the cell that was holding Kharan Mighthammer.
|tip Stick to the left wall.
|tip Open the door two cells down to gain access to Marshal Windsor.
talk Marshal Windsor##9023
|tip Inside the cell.
turnin Marshal Windsor##4241
turnin A Crumpled Up Note##4264
accept Abandoned Hope##4242
accept A Shred of Hope##4282
step
Inside the Blackrock Depths Dungeon:
kill Fineous Darkvire##9056
|tip Leave the tunnel and head east through the Detention Block and then turn left after reaching the Halls of the Law to start the Ring of the Law event.
|tip Complete the event and then exit through the west gate to enter the Eastern Garrison, immediately take a sharp right and go up the stairs to reach the upper level of the arena.
|tip Follow the path around the arena and go down the ramp on the other side, go left and across the bridge to The Domicile.
|tip Continue down the ramps in The Domicile to enter Shadowforge City, take the second door on the right to enter the Hall of Crafting.
|tip Fight down to the lower level of the Hall of Crafting.
|tip Fineous walks around this area.
collect Ironfel##10999 |q 3802/1
step
Inside the Blackrock Depths Dungeon:
click Monument of Franclorn Forgewright##164689
|tip Retrace your steps back through the Hall of Crafting, Shadowforge City and The Domicile to cross the bridge and reach the Shrine of Thaurissan.
|tip Continue straight until you reach the deadend with the Monument of Franclorn Forgewright sitting against the far wall.
turnin Dark Iron Legacy##3802
step
Inside the Blackrock Depths Dungeon:
kill Bael'Gar##9016
|tip Turn around and cross the bridge in Shadowforge City to once again reach The Domicile.
|tip Follow the same path as before to reach the Hall of Crafting where you killed Fineous Darkvire.
|tip Continue down through the Hall of Crafting's lower level to reach the boss Lord Incendius.
|tip Defeat him and keep going to reach the Dark Iron Highway.
|tip Bael'Gar is at the very end of the Dark Iron Highway.
use the Altered Black Dragonflight Molt##11231
|tip Use it on Bael'Gars corpse.
collect Encased Fiery Essence##11230 |q 4024/1
step
Inside the Blackrock Depths Dungeon:
kill General Angerforge##9033
|tip Run back down the Dark Iron Highway, take the first right and unlock the gate on your left.
|tip Unlock the first door on your left to enter East Garrison.
|tip In the lower part of this room, click the Shadowforge Lock, then run up the two sets of stairs and follow the hallway on the left just before the third set of stairs.
|tip Follow the path through the hallway to reach the West Garrison.
|tip When you reach a room with stairs on your left, go down them to find General Angerforge.
collect Marshal Windsor's Lost Information##11464 |q 4282/1
step
Inside the Blackrock Depths Dungeon:
kill Golem Lord Argelmach##8983
|tip Go back up the stairs next to General Angerforge and continue north to reach The Manufactory and Golem Lord Argelmach.
collect Marshal Windsor's Lost Information##11465 |q 4282/2
step
Inside the Blackrock Depths Dungeon:
talk Mistress Nagmara##9500
|tip Turn around to leave The Manufactory, but go left instead and follow the path to reach The Grim Guzzler.
|tip She walks around the Grim Guzzler.
accept The Love Potion##4201
step
Inside the Blackrock Depths Dungeon:
talk Ribbly Screwspigot##9543
|tip He's at the bottom level of the Grim Guzzler.
Tell him _"Your family says hello, Ribbly. And they want your head!"_
kill Ribbly Screwspigot##9543
collect Ribbly's Head##11313 |q 4136/1
step
Inside the Blackrock Depths Dungeon:
click Thunderbrew Lager Keg##164911+
|tip They look like wooden kegs sitting in a side room in the lower section of The Grim Guzzler.
|tip Destroy all three kegs to spawn Hurley Blackbreath.
kill Hurley Blackbreath##9537
collect Lost Thunderbrew Recipe##11312 |q 4126/1
step
label "Collect_Dark_Keeper_Key"
Inside the Blackrock Depths Dungeon: |notinsticky
Kill enemies around this area
collect 12 Relic Coffer Key##11078 |q 4123 |future
step
Inside the Blackrock Depths Dungeon:
click Relic Coffer Door
|tip Open all 12 of them inside of the Black Vault after clearing the room.
|tip Proceed back through The Domicile to reach the Shadowforge City, then take the first door on the right to enter The Black Vault.
kill Watchman Doomgrip##9476
|tip He will spawn once all 12 Relic Coffer Doors have been opened.
click Heart of the Mountain##165554
|tip It looks like a small red crystal sitting on a purple pillow against the wall underneath the Dark Coffer.
collect The Heart of the Mountain##11309 |q 4123/1
step
Inside the Blackrock Depths Dungeon:
talk Marshal Windsor##9023
|tip He is in a prison cell inside the Detention Block.
|tip After entering the dungeon enter the first room and then take the third tunnel on the right.
|tip If you enter the Halls of the Law you went too far.
turnin A Shred of Hope##4282
|tip Make sure everyone turns this quest in before anyone accepts the next one.
|tip Accepting Jail Break! will start the escort quest and other party members will not be able to interact with Marshal Windsor.
accept Jail Break!##4322
|tip He will walk around the Detention Block and Halls of the Law, so clearing these beforehand can be helpful.
step
Inside the Blackrock Depths Dungeon:
Follow and protect Marshal Windsor
|tip He will walk around the Detention Block and Halls of the Law, so clearing these beforehand can be helpful.
|tip There will be a few cells he will have you open. Sometimes you'll have to fight the prisoners or talk to a friendly NPC to free them.
|tip Eventually he will walk back to the dungeon entrance and escape.
Help Marshal Windsor Escape the Blackrock Depths |q 4322/1
step
label "Collect_Dark_Iron_Fanny_Packs"
Inside the Blackrock Depths Dungeon: |notinsticky
Kill enemies around this area
|tip Dwarf enemies drop these.
collect 20 Dark Iron Fanny Pack##11468 |q 4286/1
step
Leave the Blackrock Depths Dungeon
Click Here to Continue |confirm |q 4123
step
Follow the path up |goto Burning Steppes 82.76,63.28 < 10 |only if walking
talk Marshal Maxwell##9560
turnin Jail Break!##4322 |goto 84.75,69.02
turnin Abandoned Hope##4242 |goto 84.74,69.02
step
talk Oralius##9177
turnin The Good Stuff##4286 |goto 84.56,68.69
step
talk Jalinda Sprig##9561
turnin Overmaster Pyron##4262 |goto 85.41,70.06
accept Incendius!##4263 |goto 85.41,70.06
step
Enter the building |goto Ironforge 44.12,50.01 < 8 |walk
talk King Magni Bronzebeard##2784
|tip Inside the building.
turnin The Bearer of Bad News##4361 |goto 39.10,56.22
accept The Fate of the Kingdom##4362 |goto 39.10,56.22
step
talk Ragnar Thunderbrew##1267
turnin Hurley Blackbreath##4126 |goto Dun Morogh 46.83,52.36
step
talk Maxwort Uberglint##9536
turnin The Heart of the Mountain##4123 |goto Burning Steppes 65.15,23.91
step
Enter the cave |goto 65.65,22.68 < 7 |walk
talk Yuka Screwspigot##9544
|tip Inside the cave.
turnin Ribbly Screwspigot##4136 |goto 66.06,21.95
step
Enter the cave |goto 94.43,31.86 < 7 |walk
talk Cyrus Therepentous##9459
|tip Inside the cave.
turnin A Taste of Flame##4024 |goto 95.07,31.56
step
collect 4 Gromsblood##8846 |q 4201/1
|tip These are gathered with the Herbalism Profession.
|tip Load the "Gromsblood Farming Guide" to accomplish this.
|tip You can also buy these from the Auction House.
step
Kill Cliff enemies around this area
|tip These are elite.
|tip You may need help.
collect 10 Giant Silver Vein##11405 |q 4201/2 |goto Azshara 44.81,85.43
You Can Find More At These Locations:
[48.72,87.54]
[52.63,85.45]
[58.25,89.50]
[60.45,89.81]
[59.12,83.27]
[52.13,78.62]
step
Follow the path up |goto Un'Goro Crater 31.19,51.48 < 10 |only if walking
use Nagmara's Vial##11412
|tip You must be in the water.
collect Nagmara's Filled Vial##11413 |q 4201/3 |goto 31.99,50.01
step
Follow the path up |goto Searing Gorge 33.53,75.22 < 20 |only if walking
Enter Blackrock Mountain |goto Searing Gorge 34.76,83.98 < 7 |walk
Run down the chain |goto Eastern Kingdoms 48.73,63.79 < 5 |walk
Run down the stairs |goto 48.65,64.16 < 5 |walk
Continue down the stairs |goto 48.62,64.26 < 5 |q 4363 |future
step
Run down the stairs |goto 48.62,64.11 < 7 |walk
Follow the path down |goto 48.68,64.07 < 7 |walk
Run down the chain |goto 48.58,64.09 < 5 |walk
Enter the building |goto 48.44,63.83 < 5 |walk
Follow the path |goto 48.15,63.34 < 15 |walk
Enter the Blackrock Depths Dungeon with your Group |goto 48.08,62.41 < 7 |q 4363 |future
step
Inside the Blackrock Depths Dungeon:
kill Lord Incendius##9017 |q 4263/1
|tip After entering the dungeon, go left through the Shadowforge Gate and head north to reach the Dark Iron Highway.
|tip Continue east through the Dark Iron Highway to reach the Shadowforge City and Lord Incendius.
step
Inside the Blackrock Depths Dungeon:
talk Mistress Nagmara##9500
|tip She walks around The Grim Guzzler.
|tip Go back through the Dark Iron Highway and go left to enter the Detention Block.
|tip Go through the Shadowforge Gate and then through the East Garrison Door.
|tip In the lower part of this room, click the Shadowforge Lock, then run up the two sets of stairs and follow the hallway on the left just before the third set of stairs.
|tip Follow the path through the hallway to reach the West Garrison, then go right and down the ramp to reach The Manufactory.
|tip Take another right and follow the path to reach The Grim Guzzler.
turnin The Love Potion##4201
step
Inside the Blackrock Depths Dungeon:
kill Emperor Dagran Thaurissan##9019
|tip Don't kill Princess Moira Bronzebeard during the encounter.
|tip Interrupt her heals otherwise the encounter will be complicated.
|tip You will not be able to turn in the quest if you kill her.
|tip Leave The Grim Guzzler through the northeast door that is now open, go through the door on your first left and down the ramps.
|tip Go left again through the Chamber of Enchantment and north through the Mold Foundry.
|tip Continue through the Summoners' Tomb to reach The Lyceum.
|tip Kill the Shadowforge Flame Keepers in the center of the room and use the Shadowforge Torches that they drop to light the Shadowforge Braziers in the east side of the room in order to proceed.
|tip Proceed east through The Iron Hall, defeat Magmus and then finally enter The Imperial Seat.
Slay Emperor Dagran Thaurissan |q 4362/1
step
Inside the Blackrock Depths Dungeon:
talk Princess Moira Bronzebeard##8929
|tip She is in the room where Emperor Dagran Thaurissan was.
turnin The Fate of the Kingdom##4362
accept The Princess's Surprise##4363
step
Leave the Blackrock Depths Dungeon
Click Here to Continue |confirm |q 4363
step
Follow the path up |goto Burning Steppes 82.76,63.28 < 10 |only if walking
talk Jalinda Sprig##9561
turnin Incendius!##4263 |goto 85.41,70.06
step
Enter the building |goto Ironforge 44.12,50.01 < 7 |walk
talk King Magni Bronzebeard##2784
|tip Inside the building.
turnin The Princess's Surprise##4363 |goto 39.10,56.22
]])
ZygorGuidesViewer:RegisterGuide("Dungeon Guides\\Classic\\Dire Maul East Quests",{
author="support@zygorguides.com",
image=ZGV.IMAGESDIR.."Dire Maul",
description="This guide will walk you through completing the Dire Maul East Quests.",
},[[
step
Reach Level 56 |ding 56
|tip Use the Leveling guides to accomplish this.
step
talk Rabine Saturna##11801
|tip Inside the building.
accept A Reliquary of Purity##5527 |goto Moonglade 51.69,45.10
step
click Dusty Reliquary##179565
|tip Inside the building.
collect Reliquary of Purity##22201 |goto Silithus 63.23,55.36 |q 5527
step
talk Rabine Saturna##11801
|tip Inside the building.
turnin A Reliquary of Purity##5527 |goto Moonglade 51.69,45.10
accept Shards of the Felvine##5526 |goto 51.69,45.10
step
talk Latronicus Moonspear##7877
accept Lethtendris's Web##7488 |goto Feralas 30.38,46.18
step
talk Azj'Tordin##14355
|tip On top of the platform.
accept Pusillin and the Elder Azj'Tordin##7441 |goto 76.91,37.35
step
Run up the ramp |goto 59.14,45.02 < 10 |only if walking
Follow the path |goto 59.51,39.40 < 20 |only if walking
Continue following the path |goto 61.99,37.10 < 20 |only if walking
Enter the tunnel |goto 62.80,34.89 < 5 |walk
Enter the tunnel |goto 64.84,30.24 < 7 |walk
Enter the Dire Maul - East Dungeon with your Group |goto Kalimdor 43.84,67.41 < 5 |q 5526
step
Inside the Dire Maul East Dungeon:
talk Pusillin##14354
|tip He's in the northwest part of the Warpwood Quarter.
Ask him _"Game? Are you crazy?"_
|tip He will run off after speaking to him.
|tip If you don't do this, he will not be killable later.
Click Here to Continue |confirm |q 7441
step
Inside the Dire Maul East Dungeon:
talk Pusillin##14354
|tip He's in the southern part of the Warpwood Quarter, near the dungeon entrance.
Tell him _"Why you little..."_
|tip He will run off after speaking to him.
|tip If you don't do this, he will not be killable later.
Click Here to Continue |confirm |q 7441
step
Inside the Dire Maul East Dungeon:
talk Pusillin##14354
|tip He's in the northeastern part of the Warpwood Quarter.
Tell him _"Mark my words, I will catch you, Imp. And when I do!"_
|tip He will run off after speaking to him.
|tip If you don't do this, he will not be killable later.
Click Here to Continue |confirm |q 7441
step
Inside the Dire Maul East Dungeon:
talk Pusillin##14354
|tip Follow the northeastern path from the Warpwood Quarter to reach The Hidden Reach.
|tip Continue east down the path through The Hidden Reach to find him.
Tell him _"DIE!"_
|tip He will be in the Hidden Reach, straight through the tunnel.
|tip He will run off after speaking to him.
|tip If you don't do this, he will not be killable later.
Click Here to Continue |confirm |q 7441
step
Inside the Dire Maul East Dungeon:
talk Pusillin##14354
|tip Continue southeast and run up the ramp to the small upper platform.
Tell him _"Prepare to meet your maker."_
kill Pusillin##14354
collect Book of Incantations##18261 |q 7441/1
collect Crescent Key##18249 |q 7463 |future |only if Mage
step
Inside the Dire Maul East Dungeon:
kill Lethtendris##14327
|tip After killing Pusillin go west up the ramps back the way you came through The Hidden Reach.
|tip After going up the ramps and before reentering the Warpwood Quarter, enter the left room.
|tip Go south in this room and then run up the large ramp to reach the upper level to find Lethtendris.
collect Lethtendris's Web##18426 |q 7488/1
step
kill Zevrim Thornhoof##11490
|tip This boss must be defeated to gain access to the last boss, Alzzin the Wildshaper.
|tip After killing Lethtendris follow the southeastern path down the spiral ramp.
|tip Once in the next room go north and follow the ramp up.
Click Here to Continue |confirm |q 5526
step
Inside the Dire Maul East Dungeon:
|tip After killing Zevrim Thornhoof jump off the west side of the platform.
|tip Follow the path in the southwestern part of the room to reach The Conservatory.
|tip Go north through The Conservatory to find Ironbark the Redeemed.
talk Ironbark the Redeemed##14241
|tip He walks around this area.
Tell him _"Thank you Ironbark. We are ready for you to open the door."_
Click Here to Continue |confirm |q 5526
step
kill Alzzin the Wildshaper##11492
|tip After talking to Ironbark the Redeemed, continue north through The Conservatory.
click Felvine Shard##179559
|tip It looks like a small glowing red object sitting on the ground next to a twisted vine plant next to the boss.
collect Felvine Shard##18501 |q 5526
step
use the Reliquary of Purity##18539
|tip Use it next to the twisted vine plant next to the boss.
Seal the Reliquary of Purity |q 5526/1
step
Leave the Dire Maul East Dungeon
Click Here to Continue |confirm |q 5526
step
talk Latronicus Moonspear##7877
turnin Lethtendris's Web##7488 |goto Feralas 30.38,46.18
step
talk Azj'Tordin##14355
|tip On top of the platform.
turnin Pusillin and the Elder Azj'Tordin##7441 |goto 76.91,37.35
step
talk Rabine Saturna##11801
|tip Inside the building.
turnin Shards of the Felvine##5526 |goto Moonglade 51.69,45.10
]])
ZygorGuidesViewer:RegisterGuide("Dungeon Guides\\Classic\\Dire Maul West Quests",{
author="support@zygorguides.com",
image=ZGV.IMAGESDIR.."Dire Maul",
description="This guide will walk you through completing the Dire Maul West Quests.",
},[[
step
Reach Level 56 |ding 56
|tip Use the Leveling guides to accomplish this.
step
kill Pusillin##14354
|tip He is the first boss in the Dire Maul East dungeon.
|tip Use the Dire Maul East dungeon guide to accomplish this.
collect Crescent Key##18249 |q 7462 |future
|tip This item is required to enter Dire Maul West.
|tip If someone else in the group has it you can skip this step.
step
Run up the ramp |goto Feralas 59.14,45.02 < 10 |only if walking
Follow the path |goto 59.51,39.40 < 15 |only if walking
Continue following the path |goto 61.99,37.10 < 10 |only if walking
Continue following the path |goto 61.50,36.06 < 10 |q 7462 |future
step
Enter the tunnel |goto 61.19,34.86 < 7 |only if walking
Follow the path |goto 61.71,34.86 < 7 |only if walking
click Door |goto 60.32,30.16 < 5 |walk
|tip You will need the Crescent Key from Dire Maul East or a Rogue to open this.
Enter the Dire Maul - West Dungeon with your Group |goto Kalimdor 42.98,67.45 < 7 |q 7462 |future
step
Inside the Dire Maul West Dungeon:
Clear the First Pylon
|tip Head west a short distance in Capital Gardens and kill the enemies around the large glowing blue pylon.
|tip Kill the Arcane Aberrations and Mana Remnant.
|tip This pylon must be deactivated in order to fight Immol'thar.
Click Here to Continue |confirm |q 7462 |future
step
Inside the Dire Maul West Dungeon:
Clear the Second Pylon
|tip Pass through the archways in the northwest part of Capital Gardens to enter the Court of the Highborne.
|tip Go through the archway on the northern side of the Court of the Highborne and then go up the ramp.
|tip Proceed east to the pylon.
|tip Kill the Arcane Aberrations and Mana Remnant.
|tip This pylon must be deactivated in order to fight Immol'thar.
Click Here to Continue |confirm |q 7462 |future
step
Inside the Dire Maul West Dungeon:
talk Shen'dralar Ancient##14358
|tip She is above the platform overseeing Tendris Warpwood.
|tip Head south from the second pylon to reach the Shen'dralar Ancient.
accept The Madness Within##7461
step
Inside the Dire Maul West Dungeon:
Clear the Third Pylon
|tip Follow the path south and west.
|tip Kill the Arcane Aberrations and Mana Remnant.
|tip This pylon must be deactivated in order to fight Immol'thar.
Click Here to Continue |confirm |q 7462 |future
step
Inside the Dire Maul West Dungeon:
click Door
|tip The door is behind Tendris Warpwood.
|tip Jump down to the lower level of the Court of the Highborne.
|tip You will need the Crescent Key from Dire Maul East or a Rogue to open this.
|tip Follow the path to reach the Prison of Immol'thar.
Click Here to Continue |confirm |q 7462 |future
step
Inside the Dire Maul West Dungeon:
kill Immol'thar##11496
|tip Clear the remaining two pylons in this room in order to engage him.
Slay Immol'thar |q 7461/1
step
Inside the Dire Maul West Dungeon:
click Door
|tip Follow the tunnel in the northeastern part of the Prison of Immol'thar.
|tip You will need the Crescent Key from Dire Maul East or a Rogue to open this.
Click Here to Continue |confirm |q 7462 |future
step
Inside the Dire Maul West Dungeon:
kill Prince Tortheldrin##11486
|tip Once inside The Athenaeum, jump down.
|tip He is underneath the platform that you are on after entering the room.
Slay Prince Tortheldrin |q 7461/2
step
Inside the Dire Maul West Dungeon:
talk Shen'dralar Ancient##14358
|tip She is above the platform overseeing Tendris Warpwood.
|tip Go back up the ramp in The Athenaeum, and east through the Prison of Immol'thar.
|tip Go up the ramp in the Court of the Highborne, then north and up a second ramp, then follow the path east and south to reach her.
turnin The Madness Within##7461
accept The Treasure of the Shen'dralar##7462
step
Inside the Dire Maul West Dungeon:
click Treasure of the Shen'dralar
|tip It looks like a large stone chest underneath the ramp in The Athenaeum.
|tip Go back through the Prison of Immol'thar and reenter The Athenaeum.
turnin The Treasure of the Shen'dralar##7462
]])
ZygorGuidesViewer:RegisterGuide("Dungeon Guides\\Classic\\Dire Maul North Quests",{
author="support@zygorguides.com",
image=ZGV.IMAGESDIR.."Dire Maul",
description="This guide will walk you through completing the Dire Maul North Quests.",
},[[
step
Reach Level 56 |ding 56
|tip Use the Leveling guides to accomplish this.
step
collect 4 Bolt of Runecloth##14048 |q 5518 |future
|tip You can have a Tailor make these with 20 Runecloth.
|tip You can also purchase these from the auction house.
step
collect 8 Rugged Leather##8170 |q 5518 |future
|tip Use the Rugged Leather farming guide to accomplish this.
|tip You can also purchase these from the Auction House.
step
talk Alexandra Bolero##1347
|tip Inside the building.
buy 2 Rune Thread##14341 |goto Stormwind City 53.14,81.76 |q 5518 |future
step
talk Scholar Runethorn##14374
|tip She patrols along the road.
accept Elven Legends##7482 |goto Feralas 31.09,44.10
step
kill Pusillin##14354
|tip He is the first boss in the Dire Maul East dungeon.
|tip Use the Dire Maul East dungeon guide to accomplish this.
collect Crescent Key##18249 |q 7482
|tip This item is required to enter Dire Maul West.
|tip If someone else in the group has it you can skip this step.
step
Run up the ramp |goto 59.14,45.02 < 10 |only if walking
Follow the path |goto 59.51,39.40 < 15 |only if walking
Continue following the path |goto 61.99,37.10 < 10 |only if walking
Continue following the path |goto 61.50,36.06 < 10 |only if walking
Enter the tunnel |goto 61.19,34.86 < 7 |only if walking
Follow the path |goto 61.71,34.86 < 7 |q 7482
step
Follow the path |goto 61.05,30.14 < 20 |only if walking
Run up the ramp |goto Kalimdor 43.32,66.70 < 20 |only if walking
click Door |goto 43.39,66.52 < 5 |walk
|tip You will need the Crescent Key from Dire Maul East or a Rogue to open this.
Enter the Dire Maul - North Dungeon with your Group |goto 43.45,66.52 |q 7482
step
Inside the Dire Maul North Dungeon:
click Conservatory Door
|tip Jump down into the courtyard.
|tip Once there, head west down a ramp with the Conservatory Door.
|tip Run through the tunnel to reach The Athenaeum.
|tip You will need the Crescent Key from Dire Maul East or a Rogue to open this.
click Skeletal Remains of Kariel Winthalus##179544
|tip On the ground next to an elf and a bookcase in the north part of the room.
Find the Skeletal Remains of Master Kariel Winthalus |q 7482/1
step
Inside the Dire Maul North Dungeon:
click Fengus's Chest##179516
|tip It looks like a brown and black chest in the middle of the courtyard.
|tip Leave The Athenaeum and go back through the long tunnel to return to Dire Maul North.
|tip Head west into the second large open room.
collect Gordok Courtyard Key##18266 |q 7482
step
Inside the Dire Maul North Dungeon:
click Gordok Courtyard Door
|tip It is on the western side of the room.
Click Here to Continue |confirm |q 7482
step
Inside the Dire Maul North Dungeon:
talk Knot Thimblejack##14338
|tip Follow the tunnel to reach the Halls of Destruction.
|tip He is in the northeast corner of the Halls of Destruction.
accept The Gordok Ogre Suit##5518
step
Inside the Dire Maul North Dungeon:
click Ogre Tannin Basket##179499
|tip It is up the ramp just above where Knot Thimblejack is, in the northwest corner of the room.
|tip Only one person in your group will be able to collect this.
collect Ogre Tannin##18240 |q 5518/4
step
Inside the Dire Maul North Dungeon:
talk Knot Thimblejack##14338
|tip He is in the northeast corner of the Halls of Destruction.
turnin The Gordok Ogre Suit##5518
step
Inside the Dire Maul North Dungeon:
Kill Guard enemies around this area
|tip Guard Mol'dar, Slip'kik, Fengus and Captain Kromcrush can drop the key.
|tip The guards can be found in the Halls of Destruction and in each of the large open rooms at the beginning of the dungeon.
|tip Captain Kromcrush is found in Gordok's Seat, which is reached by going through the upper level of the Halls of Destruction.
|tip It also has a small chance to drop from Gordok trash mobs throughout the dungeon.
collect Gordok Shackle Key##18250 |q 5525 |future
step
Inside the Dire Maul North Dungeon:
talk Knot Thimblejack##14338
|tip He is in the northeast corner of the Halls of Destruction.
turnin Free Knot!##7429
step
Inside the Dire Maul North Dungeon:
talk Stomper Kreeg##14322
|tip You will only be able to speak with him after a tribute run.
|tip Use the Dire Maul North Tribute dungeon guide to accomplish this.
accept The Gordok Taste Test##5528
step
Inside the Dire Maul North Dungeon:
talk Captain Kromcrush##14325
|tip To do this, you will need to do a tribute run.
|tip Use the Dire Maul North Tribute dungeon guide to accomplish this.
accept Unfinished Gordok Business##7703
step
Inside the Dire Maul West Dungeon:
click The Prince's Chest##179545
|tip Run back to the start of the instance and enter the Library through the courtyard door.
|tip The chest will be behind where he stands.
collect Gauntlet of Gordok Might##18336 |q 7703/1
step
Inside the Dire Maul North Dungeon:
talk Captain Kromcrush##14325
|tip To do this, you will need to do a tribute run.
|tip You may need to run another Tribute Run to accomplish this.
turnin Unfinished Gordok Business##7703
step
Leave the Dire Maul North Dungeon
Click Here to Continue |confirm |q 7482
step
talk Scholar Runethorn##14374
|tip She patrols along the road.
turnin Elven Legends##7482 |goto Feralas 31.09,44.10
]])
ZygorGuidesViewer:RegisterGuide("Dungeon Guides\\Classic\\Lower Blackrock Spire Quests",{
author="support@zygorguides.com",
image=ZGV.IMAGESDIR.."Lower Blackrock Spire",
description="This guide will walk you through completing the Lower Blackrock Spire Quests.",
},[[
step
Reach Level 57 |ding 57
|tip Use the Leveling guides to accomplish this.
step
talk Yeh'kinya##8579
accept Screecher Spirits##3520 |goto Tanaris 66.98,22.36
step
kill Vale Screecher##5307
|tip These have a low spawn rate.
use Yeh'Kinya's Bramble##10699
|tip Use it on their corpse.
talk Screecher Spirit##8612
collect 3 Screecher Spirits |q 3520/1 |goto Feralas 58.31,57.70
step
talk Yeh'kinya##8579
turnin Screecher Spirits##3520 |goto Tanaris 66.98,22.36
accept The Prophecy of Mosh'aru##3527 |goto 66.98,22.36
step
Follow the path |goto 39.02,20.95 < 10 |only if walking
Enter the Zul'Farrak Dungeon with your Group |goto 38.73,19.97 < 7 |q 3527
step
Inside the Zul'Farrak Dungeon:
kill Theka the Martyr##7272
|tip He is the second boss of the dungeon.
|tip Follow the path north and then go right when the path splits.
|tip Quickly go left afterwards and then north.
collect First Mosh'aru Tablet##10660 |q 3527/1
step
Inside the Zul'Farrak Dungeon:
kill Hydromancer Velratha##7795
|tip Continue following the path west to reach the room with a large pyramid on the western side.
|tip Follow the path southeast to reach the large room with a pool in the center.
|tip She walks around this area.
collect Second Mosh'aru Tablet##10661 |q 3527/2
step
Leave the Zul'Farrak Dungeon
Click Here to Continue |confirm |q 3527
step
talk Yeh'kinya##8579
turnin The Prophecy of Mosh'aru##3527 |goto Tanaris 66.98,22.36
accept The Ancient Egg##4787 |goto 66.98,22.36
step
Follow the path |goto The Hinterlands 35.79,64.07 < 15 |only if walking
Run up the stairs |goto 66.70,66.71 < 8 |only if walking
Follow the path |goto 66.63,68.83 < 10 |only if walking
Run up the stairs |goto 67.93,69.12 < 10 |only if walking
Follow the path |goto 67.78,70.73 < 10 |q 4787 |future
step
Run up the stairs |goto 65.08,68.94 < 8 |only if walking
Follow the path |goto 63.69,70.44 < 10 |only if walking
Continue following the path |goto 65.38,72.92 < 10 |only if walking
Run up the stairs |goto 67.14,73.37 < 8 |only if walking
Follow the path |goto 67.15,75.46 < 10 |q 4787 |future
step
Follow the path |goto 64.52,74.83 < 10 |only if walking
Run up the stairs |goto 62.16,71.38 < 10 |only if walking
Continue up the stairs |goto 59.96,70.17 < 10 |only if walking
Follow the path |goto 58.68,70.28 < 10 |only if walking
Continue following the path |goto 59.15,74.30 < 10 |q 4787 |future
step
Enter the cave |goto 58.61,79.19 < 10 |walk
Follow the path down |goto 58.26,82.31 < 10 |walk
Follow the path up |goto 54.81,83.42 < 10 |walk
click Ancient Egg##175889
|tip Inside the cave.
|tip You may need help with this.
collect Ancient Egg##12402 |q 4787/1 |goto 57.52,86.78
step
talk Yeh'kinya##8579
turnin The Ancient Egg##4787 |goto Tanaris 66.98,22.36
accept The God Hakkar##3528 |goto 66.98,22.36
step
Run up the stairs |goto Swamp of Sorrows 69.31,57.06 < 10 |only if walking
Enter the Temple |goto 69.99,52.99 < 7
Run down the stairs |goto 69.58,51.44 < 7 |q 3528
step
Swim through the water |goto 70.22,51.69 < 7 |walk
Run up the stairs |goto 71.74,45.81 < 5 |walk
Run down the stairs |goto 72.70,42.22 < 5 |only if walking
Follow the path |goto 75.83,44.85 < 5 |only if walking
Continue following the path |goto 76.02,45.96 < 5 |q 3528
step
Follow the path |goto Eastern Kingdoms 56.89,75.91 < 5 |only if walking
Continue following the path |goto 56.88,76.00 < 5 |only if walking
Continue following the path |goto 57.08,75.59 < 5 |only if walking
Run down the stairs |goto 57.00,75.55 < 5 |q 3528
step
Follow the path |goto 56.91,75.36 < 5 |only if walking
Continue following the path |goto 56.79,75.39 < 5 |only if walking
Enter The Temple of Atal'Hakkar Dungeon with your Group |goto 56.81,75.17 < 5 |q 3528
step
Inside the Temple of Atal'Hakkar Dungeon:
use the Egg of Hakkar##10465
|tip Use it next to the skeleton laying on the ground in the Sanctum of the Fallen God.
|tip After entering the dungeon, follow the left path and go up three large sets of stairs, immediately go right to follow a short hallway to reach the upper level of The Pit of Sacrifice and jump down.
|tip Follow the southwestern path to reach the Sanctum of the Fallen God.
Kill the enemies that spawn in waves
kill Hakkari Bloodkeeper##8438+
collect Hakkari Blood##10460 |n
|tip Use it to put out the braziers in each corner of the room.
click Eternal Flame##148420+
kill Avatar of Hakkar##8443
|tip It will spawn after the four Eternal Flames have been extinguished.
collect Essence of Hakkar##10663 |q 3528
step
Inside the Temple of Atal'Hakkar Dungeon:
use the Essence of Hakkar##10663
Fill the Egg of Hakkar |q 3528/1
step
Leave the Temple of Atal'Hakkar Dungeon
Click Here to Continue |confirm |q 3528
step
talk Yeh'kinya##8579
turnin The God Hakkar##3528 |goto Tanaris 66.98,22.36
step
talk Prospector Ironboot##10460
accept The Lost Tablets of Mosh'aru##5065 |goto 66.89,24.03
step
Follow the path up |goto Eastern Plaguelands 64.37,21.89 < 10 |only if walking
click Fourth Mosh'aru Tablet##175488
collect Fourth Mosh'aru Tablet |q 5065/2 |goto 72.67,15.56
step
click Third Mosh'aru Tablet##175487
|tip At the top of the temple.
collect Third Mosh'aru Tablet |q 5065/1 |goto 72.35,12.92
step
talk Prospector Ironboot##10460
turnin The Lost Tablets of Mosh'aru##5065 |goto Tanaris 66.89,24.03
accept The Final Tablets##4788 |goto 66.89,24.03
step
talk Helendis Riverhorn##9562
accept Put Her Down##4701 |goto Burning Steppes 85.82,68.94
step
talk Ragged John##9563
accept Mother's Milk##4866 |goto 65.01,23.77
step
talk Kibler##10260
|tip Inside the cave.
accept Kibler's Exotic Pets##4729 |goto 65.88,21.92
accept En-Ay-Es-Tee-Why##4862 |goto 65.88,21.92
step
Follow the path up |goto Searing Gorge 33.53,75.22 < 20 |only if walking
Enter Blackrock Mountain |goto Searing Gorge 34.76,83.98 < 7 |walk
Run up the chain |goto Eastern Kingdoms 48.73,63.79 < 5 |walk
Jump down here |goto 48.77,63.67 < 5 |walk
Follow the path up |goto 48.83,63.66 < 5 |walk
Enter the building |goto 48.91,63.92 < 5 |walk
Enter the Blackrock Spire Dungeon with your Group |goto 48.95,63.88 < 7 |q 5002 |future
stickystart "Collect_Unadorned_Seal_of_Ascension"
step
Inside the Lower Blackrock Spire Dungeon:
talk Warosh##10799
|tip He patrols around Hordemar City.
|tip After entering the dungeon, follow the path right in the Hall of Blackhand to reach Hordemar City.
accept Urok Doomhowl##4867
step
Inside the Lower Blackrock Spire Dungeon:
click Roughshod Pike##175886
|tip It is standing upright in a wooden weapon rack along the left wall after crossing the second bridge in Hordemar City.
collect Roughshod Pike##12533 |q 4867 |future
|tip If someone else in your group looted it you can skip this step.
step
Inside the Lower Blackrock Spire Dungeon:
talk Bijou##10257
|tip Once you pass the second bridge, jump into the groove in the ground.
|tip Bijou will be down there.
accept Bijou's Belongings##5001
step
Inside the Lower Blackrock Spire Dungeon:
click Bijou's Belongings##175334
|tip It looks like a small wooden and metal chest on the lowest level of Hordemar City.
|tip It can be found anywhere from Hordemar to the Skitterweb Tunnels.
collect Bijou's Belongings##12345 |q 5001/1
step
Inside the Lower Blackrock Spire Dungeon:
talk Bijou##10257
|tip Bijou will be down in a groove at Hordemar City.
turnin Bijou's Belongings##5001
accept Message to Maxwell##5002
step
Leave the Blackrock Spire Dungeon
Click Here to Continue |confirm |q 5002
stickystop "Collect_Unadorned_Seal_of_Ascension"
step
Follow the path up |goto Burning Steppes 82.89,63.37 < 7 |only if walking
talk Marshal Maxwell##9560
turnin Message to Maxwell##5002 |goto 84.75,69.02
accept Maxwell's Mission##5081 |goto 84.75,69.02
step
Follow the path up |goto Searing Gorge 33.53,75.22 < 20 |only if walking
Enter Blackrock Mountain |goto Searing Gorge 34.76,83.98 < 7 |walk
Run up the chain |goto Eastern Kingdoms 48.73,63.79 < 5 |walk
Jump down here |goto 48.77,63.67 < 5 |walk
Follow the path up |goto 48.83,63.66 < 5 |walk
Enter the building |goto 48.91,63.92 < 5 |walk
Enter the Blackrock Spire Dungeon with your Group |goto 48.95,63.88 < 7 |q 4788
step
label "Collect_Unadorned_Seal_of_Ascension"
Inside the Lower Blackrock Spire Dungeon: |notinsticky
Kill enemies around this area
collect Unadorned Seal of Ascension##12219 |q 4742 |future
step
Inside the Lower Blackrock Spire Dungeon:
talk Vaelan##10296
|tip Run up the ramp near where you entered Lower Blackrock Spire.
|tip A little way closer to the entrance of the dungeon, just before the area where Warosh patrols.
Watch the Dialogue
Tell him _"As you wish, Vaelan."_
accept Seal of Ascension##4742
step
Inside the Lower Blackrock Spire Dungeon:
click Fifth Mosh'aru Tablet##175949
|tip Cross the two bridges into Hordemar City, then jump down to where Bijou is.
|tip Run down the ramp, then back up directly across.
|tip Run up the stairs to the left.
|tip On the far side of the wall in the room with Shadow Hunter Vosh'gajin.
collect Fifth Mosh'aru Tablet##12740 |q 4788/1
step
Inside the Lower Blackrock Spire Dungeon:
kill War Master Voone##9237 |q 5081/1
|tip Follow the ramps back down to the lowest level of Tazz'Alaor.
|tip Follow the path in the southwestern corner of the room.
step
Inside the Lower Blackrock Spire Dungeon:
kill War Master Voone##9237
|tip Follow the ramps back down to the lowest level of Tazz'Alaor.
|tip Follow the path in the southwestern corner of the room.
collect Gemstone of Smolderthorn##12335 |q 4742/2
|tip This isn't a 100% drop rate.
|tip You may need to roll against group members to get this.
step
Inside the Lower Blackrock Spire Dungeon:
click Sixth Mosh'aru Tablet##175950
|tip On the wall in the room with War Master Voone.
collect Sixth Mosh'aru Tablet##12741 |q 4788/2
step
Inside the Lower Blackrock Spire Dungeon:
kill Highlord Omokk##9196 |q 5081/2
|tip Return to the upper level of the dungeon again and proceed through Hordemar City.
|tip Continue past the groove in the ground where Bijou is and go west with all of the ogres to reach Mok'Doom.
|tip He is in the back of the room along the north side.
step
Inside the Lower Blackrock Spire Dungeon:
kill Highlord Omokk##9196
|tip Return to the upper level of the dungeon again and proceed through Hordemar City.
|tip Continue past the groove in the ground where Bijou is and go west with all of the ogres to reach Mok'Doom.
|tip He is in the back of the room along the north side.
collect Omokk's Head##12534 |q 4867 |future
collect Gemstone of Spirestone##12336 |q 4742/1
|tip This isn't a 100% drop rate.
|tip You may need to roll against group members to get this.
stickystart "Destroy_15_Spire_Spider_Eggs"
step
Inside the Lower Blackrock Spire Dungeon:
kill Mother Smolderweb##10596
|tip In the lower part of the dungeon, in the upper level of the Skitterweb Tunnels.
Gain the "Mother's Milk" Buff |havebuff spell:132104 |q 4866
|tip If you are able to dispel the poison, make sure you don't.
step
label "Destroy_15_Spire_Spider_Eggs"
Inside the Lower Blackrock Spire Dungeon: |notinsticky
click Spire Spider Egg##175588+
|tip In the upper level of the Skitterweb Tunnels.
collect 15 Spire Spider Egg##12530 |q 4862/1
step
Inside the Lower Blackrock Spire Dungeon:
use Omokk's Head##12534
|tip Use it near the pile of bones up the ramp past Mother Smolderweb.
|tip It looks like a large pile of skulls in Hordemar City.
kill Urok Doomhowl##10584
|tip He will appear after a wave of ogres.
collect Warosh's Mojo##12712 |q 4867/1
step
Inside the Lower Blackrock Spire Dungeon:
use the Empty Worg Pup Cage##12262
|tip Use it on a Bloodaxe Worg Pup.
|tip They are in the same room as Halycon.
|tip After killing Urok Doomhowl, follow the path southwest down the hallway past a room of scorpions on your right.
|tip Go through the doorway, up the stairs and then go right to reach Halycon's Lair.
Capture a Caged Worg Pup |q 4729/1
step
Inside the Lower Blackrock Spire Dungeon:
kill Halycon##10220 |q 4701/1
|tip Inside Halycon's Lair.
step
Inside the Lower Blackrock Spire Dungeon:
kill Overlord Wyrmthalak##9568 |q 5081/3
|tip Final boss of Lower Blackrock Spire, inside the Chamber of Battle.
|tip After killing Halycon, go up the first small set of stairs on your left in the hallway room before Halycon's Lair.
|tip Cross this room and continue up the small set of stairs on the opposite side, continue forward to reach the Chamber of Battle.
step
Inside the Lower Blackrock Spire Dungeon:
kill Overlord Wyrmthalak##9568
|tip Final boss of Lower Blackrock Spire, inside the Chamber of Battle.
|tip After killing Halycon, go up the first small set of stairs on your left in the hallway room before Halycon's Lair.
|tip Cross this room and continue up the small set of stairs on the opposite side, continue forward to reach the Chamber of Battle.
collect Gemstone of Bloodaxe##12337 |q 4742/3
|tip This isn't a 100% drop rate.
|tip You may need to roll against group members to get this.
step
Inside the Lower Blackrock Spire Dungeon:
talk Warosh##10799
|tip He patrols near the start of Lower Blackrock Spire.
turnin Urok Doomhowl##4867
step
Inside the Lower Blackrock Spire Dungeon:
talk Vaelan##10296
|tip Run up the ramp near where you entered Lower Blackrock Spire.
turnin Seal of Ascension##4742
step
Leave the Blackrock Spire Dungeon
Click Here to Continue |confirm |q 4788
step
Follow the path up |goto Burning Steppes 82.89,63.37 < 7 |only if walking
talk Marshal Maxwell##9560
turnin Maxwell's Mission##5081 |goto 84.75,69.02
step
talk Helendis Riverhorn##9562
turnin Put Her Down##4701 |goto 85.82,68.94
step
Return to Ragged John |q 4866/1 |goto 65.01,23.77
step
talk Ragged John##9563
turnin Mother's Milk##4866 |goto 65.01,23.77
step
talk Kibler##10260
|tip Inside the cave.
turnin Kibler's Exotic Pets##4729 |goto 65.88,21.92
turnin En-Ay-Es-Tee-Why##4862 |goto 65.88,21.92
step
talk Prospector Ironboot##10460
turnin The Final Tablets##4788 |goto Tanaris 66.89,24.03
]])
ZygorGuidesViewer:RegisterGuide("Dungeon Guides\\Classic\\Scholomance Quests",{
author="support@zygorguides.com",
image=ZGV.IMAGESDIR.."Scholomance",
description="This guide will walk you through completing the Scholomance Quests.",
},[[
step
Reach Level 50 |ding 50
|tip Use the Leveling guides to accomplish this.
step
map Stormwind City
path	follow strict;		loop on;	ants curved;	dist 20;	markers none
path	73.90,62.99		71.80,60.26		69.08,62.16		66.69,64.74		65.88,64.28
path	64.26,66.69		65.21,69.44		60.90,73.38		59.91,71.70		55.53,75.34
path	55.54,76.60		53.75,78.73		54.76,82.19		54.11,84.82		48.58,84.72
path	46.95,87.34		44.23,87.16		44.83,79.45		46.59,77.30		45.56,73.58
path	44.49,70.44		47.70,66.48		48.01,63.69		49.57,61.28		48.83,59.01
path	53.87,54.74		55.39,52.69		56.76,50.37		58.48,51.15		60.23,49.06
path	59.78,46.29		61.89,44.77		64.81,50.37		66.96,50.79		69.75,47.95
path	70.95,46.66		72.17,47.88		70.14,53.25		71.88,55.88		73.66,55.13
path	76.31,59.74
talk Crier Goodman##2198
|tip He's a Human that walks around in a large path around Stormwind.
accept A Call to Arms: The Plaguelands!##5091
step
talk Tinkee Steamboil##10267
accept Broodling Essence##4726 |goto Burning Steppes 65.24,24.00
step
use the Draco-Incarcinatrix 900##12284
|tip Use it on Broodling enemies around this area.
|tip They look like small flying dragons.
Kill Broodling enemies around this area
click Broodling Essence##175264+
|tip They look like red floating crystals that appear above their corpses after you kill them.
collect 8 Broodling Essence##12283 |q 4726/1 |goto 59.26,32.49
You can find more around: |notinsticky
[72.83,28.41]
[80.05,27.94]
[87.34,32.01]
[91.96,35.64]
step
Follow the path up |goto 63.92,29.88 < 15 |only if walking
talk Tinkee Steamboil##10267
turnin Broodling Essence##4726 |goto 65.23,23.99
accept Felnok Steelspring##4808 |goto 65.23,23.99
step
talk Felnok Steelspring##10468
turnin Felnok Steelspring##4808 |goto Winterspring 61.63,38.61
accept Chillwind Horns##4809 |goto 61.63,38.61
step
kill Chillwind Ravager##7449+
|tip They look like chimeras.
|tip They share spawn points with the bears, so kill them too.
collect 8 Uncracked Chillwind Horn##12444 |q 4809/1 |goto 59.97,21.54
You can find more around: |notinsticky
[54.75,22.59]
[59.18,18.02]
[60.13,12.28]
[57.99,14.79]
step
talk Felnok Steelspring##10468
turnin Chillwind Horns##4809 |goto 61.63,38.61
accept Return to Tinkee##4810 |goto 61.63,38.61
step
talk Tinkee Steamboil##10267
turnin Return to Tinkee##4810 |goto Burning Steppes 65.23,23.99
step
talk Felnok Steelspring##10468
accept Tinkee Steamboil##4907 |goto Winterspring 61.63,38.61
step
talk Tinkee Steamboil##10267
turnin Tinkee Steamboil##4907 |goto Burning Steppes 65.23,23.99
accept Egg Freezing##4734 |goto 65.23,23.99
step
Follow the path up |goto Searing Gorge 33.53,75.22 < 20 |only if walking
Enter Blackrock Mountain |goto 34.76,83.98 < 7 |walk
Run up the chain |goto Eastern Kingdoms 48.73,63.79 < 5 |walk
Jump down here |goto 48.77,63.67 < 5 |walk
Follow the path up |goto 48.83,63.66 < 5 |walk
Enter the building |goto 48.91,63.92 < 5 |walk
Enter the Blackrock Spire Dungeon with your Group |goto 48.95,63.88 < 7 |q 4734
|tip This quest requires you to progress through the Upper Blackrock Spire dungeon.
|tip You will likely need a 10 person raid group to complete the quest.
step
Inside the Upper Blackrock Spire Dungeon:
use the Eggscilloscope Prototype##12286
|tip Use it on the eggs in The Rookery, just past Pyroguard Emberseer.
|tip Don't get too close or they will hatch if they aren't frozen.
Test the Eggscilloscope Prototype |q 4734/1
step
Leave the Blackrock Spire Dungeon
Click Here to Continue |confirm |q 4734
step
talk Tinkee Steamboil##10267
turnin Egg Freezing##4734  |goto Burning Steppes 65.23,23.99
accept Egg Collection##4735 |goto 65.23,23.99
step
Follow the path up |goto Searing Gorge 33.53,75.22 < 20 |only if walking
Enter Blackrock Mountain |goto 34.76,83.98 < 7 |walk
Run up the chain |goto Eastern Kingdoms 48.73,63.79 < 5 |walk
Jump down here |goto 48.77,63.67 < 5 |walk
Follow the path up |goto 48.83,63.66 < 5 |walk
Enter the building |goto 48.91,63.92 < 5 |walk
Enter the Blackrock Spire Dungeon with your Group |goto 48.95,63.88 < 7 |q 4735
|tip This quest requires you to progress through the Upper Blackrock Spire dungeon.
|tip You will likely need a 10 person raid group to complete the quest.
step
Inside the Upper Blackrock Spire Dungeon:
use the Eggscilloscope Prototype##12286
|tip Use it on the eggs in The Rookery, just past Pyroguard Emberseer.
|tip Use it to freeze the eggs.
|tip Don't get too close or they will hatch if they aren't frozen.
use the Collectronic Module##12287
|tip Use it to collect the eggs.
collect 8 Collected Dragon Egg##12241 |q 4735/1
step
Leave the Blackrock Spire Dungeon
Click Here to Continue |confirm |q 4735
step
talk Tinkee Steamboil##10267
turnin Egg Collection##4735 |goto Burning Steppes 65.23,23.99
accept Leonid Barthalomew##5522 |goto 65.23,23.99
step
talk Leonid Barthalomew the Revered##11036
|tip Inside the building.
turnin Leonid Barthalomew##5522 |goto Eastern Plaguelands 81.73,57.83
accept Betina Bigglezink##5531 |goto 81.73,57.83
step
talk Betina Bigglezink##11035
turnin Betina Bigglezink##5531 |goto 81.47,59.65
accept Plagued Hatchlings##5529 |goto 81.47,59.65
accept Dawn's Gambit##4771 |goto 81.47,59.65
step
talk Commander Ashlam Valorfist##10838
turnin A Call to Arms: The Plaguelands!##5091 |goto Western Plaguelands 42.70,84.03
accept Clear the Way##5092 |goto 42.70,84.03
stickystart "Kill_Slavering_Ghouls"
step
kill 10 Skeletal Flayer##1783 |q 5092/1 |goto 48.51,81.13
You can find more around [50.64,77.01] |notinsticky
step
label "Kill_Slavering_Ghouls"
kill 10 Slavering Ghoul##1791 |q 5092/2 |goto 48.51,81.13
You can find more around [50.64,77.01] |notinsticky
step
talk Commander Ashlam Valorfist##10838
turnin Clear the Way##5092 |goto 42.70,84.03
accept All Along the Watchtowers##5097 |goto 42.70,84.03
step
Cross the bridge |goto 49.22,73.14 < 20 |only if walking
use the Beacon Torch##12815
|tip Use it in front of the tower entrance.
|tip Be careful, there is an elite enemy inside the tower.
|tip Avoid the doorway, making sure the elite inside can't see you.
|tip You can get closer to the tower safely, if the enemy inside can't see you.
Mark Tower Four |q 5097/4 |goto 46.70,71.10
step
use the Beacon Torch##12815
|tip Use it in front of the tower entrance.
|tip Be careful, there is an elite enemy inside the tower.
|tip Avoid the doorway, making sure the elite inside can't see you.
|tip You can get closer to the tower safely, if the enemy inside can't see you.
Mark Tower One |q 5097/1 |goto 40.13,71.52
step
use the Beacon Torch##12815
|tip Use it in front of the tower entrance.
|tip Be careful, there is an elite enemy inside the tower.
|tip Avoid the doorway, making sure the elite inside can't see you.
|tip You can get closer to the tower safely, if the enemy inside can't see you.
Mark Tower Two |q 5097/2 |goto 42.44,66.27
step
use the Beacon Torch##12815
|tip Use it in front of the tower entrance.
|tip Be careful, there is an elite enemy inside the tower.
|tip Avoid the doorway, making sure the elite inside can't see you.
|tip You can get closer to the tower safely, if the enemy inside can't see you.
Mark Tower Three |q 5097/3 |goto 44.22,63.37
step
talk Commander Ashlam Valorfist##10838
turnin All Along the Watchtowers##5097 |goto 42.70,84.03
step
Reach Level 55 |ding 55
|tip Use the Leveling guides to accomplish this.
step
talk Commander Ashlam Valorfist##10838
accept Scholomance##5533 |goto 42.70,84.03
step
talk Alchemist Arbington##11056
turnin Scholomance##5533 |goto 42.67,83.77
accept Skeletal Fragments##5537 |goto 42.67,83.77
step
Follow the path |goto 46.57,81.32 < 30 |only if walking
Kill Skeletal enemies around this area
|tip Only enemies that look like skeletons will drop the quest item.
collect 15 Skeletal Fragments##14619 |q 5537/1 |goto 50.35,78.60
You can find more inside and outside the crypt at [54.33,79.90]
step
Follow the path |goto 46.58,81.33 < 30 |only if walking
talk Alchemist Arbington##11056
turnin Skeletal Fragments##5537 |goto 42.67,83.77
accept Mold Rhymes With...##5538 |goto 42.67,83.77
step
talk Krinkle Goodsteel##5411
turnin Mold Rhymes With...##5538 |goto Tanaris 51.46,28.82
|tip Turning this quest in will cost 15 gold.
accept Fire Plume Forged##5801 |goto 51.46,28.82
step
collect 2 Thorium Bar##12359 |q 5801 |future
|tip These are made with the Mining Profession.
|tip It requires 1 Thorium Ore each.
|tip You can also purchase these from the Auction House.
step
use the Skeleton Key Mold##14644
|tip You must be in the lake of lava.
collect Unfinished Skeleton Key##14645 |q 5801/1 |goto Un'Goro Crater 48.78,47.19
step
talk Alchemist Arbington##11056
turnin Fire Plume Forged##5801 |goto Western Plaguelands 42.67,83.77
accept Araj's Scarab##5803 |goto 42.67,83.77
step
kill Araj the Summoner##1852
|tip You may need help with this.
click Araj's Phylactery##177241
collect Araj's Scarab##14610 |q 5803/1 |goto 45.27,69.21
step
talk talk 11056
turnin Araj's Scarab##5803 |goto 42.67,83.77
step
talk Commander Ashlam Valorfist##10838
accept The Key to Scholomance##5505 |goto 42.70,84.04
step
talk Weldon Barov##11023
accept Barov Family Fortune##5343 |goto 43.46,83.73
step
talk Eva Sarkhoff##11216
Ask her _"The pleasure is mine madam. Might I ask what it is that you are doing here?"_
|tip Click through the dialogue.
accept Doctor Theolen Krastinov, the Butcher##5382 |goto 70.22,73.72
step
Run up the stairs |goto 69.93,73.99 < 7 |only if walking
Enter the building |goto Eastern Kingdoms 52.79,26.44 < 5 |walk
click Scholomance Door |goto 52.75,26.41 < 5 |walk
|tip This requires the Skeleton Key from the quest "The Key to Scholomance" or a Rogue with leveled lockpicking to open.
Enter the Scholomance Dungeon with your Group |goto 52.70,26.38 < 7 |q 5343
step
Inside the Scholomance Dungeon:
click The Deed to Southshore##176486
|tip It looks like an open white scroll laying on a table in the northeastern part of The Reliquary.
|tip After entering the dungeon, follow the path forward to enter The Reliquary.
collect The Deed to Southshore##13450 |q 5343/3
stickystart "Slay_20_Plagued_Hatchlings"
step
Inside the Scholomance Dungeon:
click The Deed to Tarren Mill##176487
|tip It looks like an open white scroll laying on a table to the left as you enter The Great Ossuary.
|tip Proceed through the Iron Gate on the north side of The Reliquary to reach the Chamber of Summoning.
|tip Continue straight through the dungeon to reach The Great Ossuary.
collect The Deed to Tarren Mill##13451 |q 5343/4
step
label "Slay_20_Plagued_Hatchlings"
Inside the Scholomance Dungeon:
kill 20 Plagued Hatchling##10678 |q 5529/1
|tip They are inside The Great Ossuary.
step
Inside the Scholomance Dungeon:
kill Rattlegore##11622
|tip He is downstairs inside The Great Ossuary.
|tip Jump down into one of the holes on the sides of the room to reach the lower level.
collect Viewing Room Key##13873 |q 5343
|tip This key is required to progress further into the dungeon.
|tip If someone else in the group already has it you can skip this step.
step
Inside the Scholomance Dungeon:
use the Dawn's Gambit##12368
|tip Use it in The Viewing Room.
|tip Go back upstairs after killing Rattlegore and head north in The Great Ossuary to return to the previous room (the map will just say Scholomance).
|tip Go right through the Iron Gate, clear the room and open the Viewing Room Door using the key.
|tip Clear the room before using it.
Place the Dawn's Gmabit |q 4771/1
step
Inside the Scholomance Dungeon:
kill Vectus##10432
|tip In the Viewing room.
Slay Vectus |q 4771/2
step
Inside the Scholomance Dungeon:
click The Deed to Brill##176484
|tip It looks like an open white scroll sitting on a ledge near the boss on the southwestern part of The Laboratory.
|tip Run back up the stairs to return to The Viewing Room.
|tip Go through the Iron Gate on the south side of The Viewing Room and go down the stairs to reach The Laboratory.
collect The Deed to Brill##13471 |q 5343/1
step
Inside the Scholomance Dungeon:
click Remains of Eva Sarkhoff##176544
|tip They look like a pile of bloodied bones in the northern part of the room with Doctor Theolen Krastinov.
|tip Go through the Iron Gate on the eastern side of The Viewing Room and go down the stairs to reach the Headmaster's Study.
|tip Staying on the upper level of the Headmaster's Study, head around the outside of the room and enter the room across from the entrance on the eastern side.
Burn the Remains of Eva Sarkhoff |q 5382/2
step
Inside the Scholomance Dungeon:
click Remains of Lucien Sarkhoff##176545
|tip They look like a pile of bloodied bones in the southeastern part of the room with Doctor Theolen Krastinov.
Burn the Remains of Lucien Sarkhoff |q 5382/3
step
Inside the Scholomance Dungeon:
kill Doctor Theolen Krastinov |q 5382/1
step
Inside the Scholomance Dungeon:
click The Deed to Caer Darrow##176485
|tip It looks like an open white scroll laying on a table on the eastern side of the Barov Family Vault.
|tip Return to the Headmaster's Study and jump down, then turn around and enter the eastern room to reach the Barov Family Vault.
collect The Deed to Caer Darrow##13448 |q 5343/2
step
Leave the Scholomance Dungeon
Click Here to Continue |confirm |q 5343
step
talk Eva Sarkhoff##11216
turnin Doctor Theolen Krastinov, the Butcher##5382 |goto Western Plaguelands 70.22,73.72
accept Krastinov's Bag of Horrors##5515 |goto 70.22,73.72
step
talk Weldon Barov##11023
turnin Barov Family Fortune##5343 |goto 43.46,83.73
step
talk Betina Bigglezink##11035
turnin Plagued Hatchlings##5529 |goto Eastern Plaguelands 81.47,59.66
|tip This will unlock the next quest, which drops from inside Scholomance.
turnin Dawn's Gambit##4771 |goto 81.47,59.65
step
Run up the stairs |goto Western Plaguelands 69.93,73.99 < 7 |only if walking
Enter the building |goto Eastern Kingdoms 52.79,26.44 < 5 |walk
click Scholomance Door |goto 52.75,26.41 < 5 |walk
|tip This requires the Skeleton Key from the quest "The Key to Scholomance" or a Rogue with leveled lockpicking to open.
Enter the Scholomance Dungeon with your Group |goto 52.70,26.38 < 7 |q 5515
step
Inside the Scholomance Dungeon:
kill Jandice Barov##10503
|tip After entering the dungeon, follow the path forward to enter The Reliquary.
|tip Go left and proceed through the Iron Gate on the north side of the room to reach the Chamber of Summoning.
|tip Proceed into the next main room and then follow the path to the right and go down the stairs.
|tip Jandice is in the northeastern part of this room.
collect Krastinov's Bag of Horrors##13725 |q 5515/1
step
Inside the Scholomance Dungeon:
kill Plagued Hatchling##10678+
collect Healthy Dragon Scale##13920 |q 5582 |future
step
use the Healthy Dragon Scale##13920
accept Healthy Dragon Scale##5582
step
Leave the Scholomance Dungeon
Click Here to Continue |confirm |q 5515
step
talk Eva Sarkhoff##11216
turnin Krastinov's Bag of Horrors##5515 |goto Western Plaguelands 70.22,73.72
accept Kirtonos the Herald##5384 |goto 70.22,73.72
step
talk Betina Bigglezink##11035
turnin Healthy Dragon Scale##5582 |goto Eastern Plaguelands 81.47,59.66
step
Run up the stairs |goto Western Plaguelands 69.93,73.99 < 7 |only if walking
Enter the building |goto Eastern Kingdoms 52.79,26.44 < 5 |walk
click Scholomance Door |goto 52.75,26.41 < 5 |walk
|tip This requires the Skeleton Key from the quest "The Key to Scholomance" or a Rogue with leveled lockpicking to open.
Enter the Scholomance Dungeon with your Group |goto 52.70,26.38 < 7 |q 5384
step
Inside the Scholomance Dungeon:
click Brazier of the Herald
|tip After entering the dungeon, follow the path forward to enter The Reliquary.
|tip Go left and proceed through the Iron Gate on the north side of the room to reach the Chamber of Summoning.
|tip Follow the path out to the right to the balcony.
|tip Clear the Chamber of Summoning before doing this.
kill Kirtonos the Herald##10506 |q 5384/1
|tip Drag him back into the gate.
step
Leave the Scholomance Dungeon
Click Here to Continue |confirm |q 5384
step
talk Eva Sarkhoff##11216
turnin Kirtonos the Herald##5384 |goto Western Plaguelands 70.22,73.72
step
Reach Level 57 |ding 57
|tip Use the Leveling guides to accomplish this.
step
use the Spectral Essence##13544
Equip the Spectral Essence
talk Magistrate Marduke##11286
|tip You must have the Spectral Essence equipped to see him.
accept The Human, Ras Frostwhisper##5461 |goto 70.57,74.11
step
click Keepsake of Remembrance##176630
|tip At the top of the tower.
|tip If it's not there, check in the fireplaces of nearby buildings.
collect Keepsake of Remembrance##13585 |q 5461/1 |goto Arathi Highlands 17.91,69.41
step
use the Spectral Essence##13544
Equip the Spectral Essence
talk Magistrate Marduke##11286
|tip You must have the Spectral Essence equipped to see him.
turnin The Human, Ras Frostwhisper##5461 |goto Western Plaguelands 70.57,74.11
accept The Dying, Ras Frostwhisper##5462 |goto 70.57,74.11
step
talk Leonid Barthalomew the Revered##11036
|tip Inside the building.
turnin The Dying, Ras Frostwhisper##5462 |goto Eastern Plaguelands 81.72,57.83
accept Menethil's Gift##5463 |goto 81.72,57.83
step
click Elders' Square Service Entrance
|tip This requires the Key to the City or a Rogue with leveled lockpicking to open.
Enter the building |goto Eastern Plaguelands 47.89,23.87 < 5 |walk
Enter the Stratholme - Undead Side Dungeon with your Group |goto 48.23,21.88 < 7 |q 5464 |future
step
Inside the Stratholme - Undead Dungeon:
click Menethil's Gift##176631
|tip It looks like a large orange circular symbol on the floor in the room with Baron Rivendare.
|tip Follow the path north and then east through the two Gauntlet Gates to reach the Gauntlet.
|tip This requires the Key to the City or a Rogue with leveled lockpicking to open.
|tip Continue following the path north and then west to reach Slaughter Square.
|tip Enter the building in Slaughter Square and go downstairs.
turnin Menethil's Gift##5463
accept Menethil's Gift##5464
step
Leave the Stratholme Dungeon
Click Here to Continue |confirm |q 5464
step
talk Leonid Barthalomew the Revered##11036
|tip Inside the building.
turnin Menethil's Gift##5463 |goto Eastern Plaguelands 81.72,57.83
accept Soulbound Keepsake##5465 |goto 81.72,57.83
step
use the Spectral Essence##13544
Equip the Spectral Essence
talk Magistrate Marduke##11286
|tip You must have the Spectral Essence equipped to see him.
turnin Soulbound Keepsake##5465 |goto Western Plaguelands 70.57,74.11
accept The Lich, Ras Frostwhisper##5466 |goto 70.57,74.11
step
Run up the stairs |goto 69.93,73.99 < 7 |only if walking
Enter the building |goto Eastern Kingdoms 52.79,26.44 < 5 |walk
click Scholomance Door |goto 52.75,26.41 < 5 |walk
|tip This requires the Skeleton Key from the quest "The Key to Scholomance" or a Rogue with leveled lockpicking to open.
Enter the Scholomance Dungeon with your Group |goto 52.70,26.38 < 7 |q 5466
step
Inside the Scholomance Dungeon:
kill Rattlegore##11622
|tip After entering the dungeon, follow the path forward to enter The Reliquary.
|tip Go left and proceed through the Iron Gate on the north side of the room to reach the Chamber of Summoning.
|tip Continue straight through the dungeon to reach The Great Ossuary.
|tip Jump down into one of the holes on the sides of the room to reach the lower level with Rattlegore.
collect Viewing Room Key##13873 |q 5466
|tip This key is required to progress further into the dungeon.
|tip If someone else in the group already has it you can skip this step.
step
Inside the Scholomance Dungeon:
use the Soulbound Keepsake##13752
|tip Use it on Ras Frostwhisper.
kill Ras Frostwhisper##10508
|tip He is inside The Laboratory.
|tip Go back upstairs after killing Rattlegore and head north in The Great Ossuary to return to the previous room (the map will just say Scholomance).
|tip Go right through the Iron Gate, clear the room and open the Viewing Room Door using the key.
|tip Continue through the Iron Gate on the south side of The Viewing Room and go down the stairs to reach The Laboratory.
collect Human Head of Ras Frostwhisper##13626 |q 5466/1
step
Leave the Scholomance Dungeon
Click Here to Continue |confirm |q 5466
step
use the Spectral Essence##13544
Equip the Spectral Essence
talk Magistrate Marduke##11286
|tip You must have the Spectral Essence equipped to see him.
turnin The Lich, Ras Frostwhisper##5466 |goto Western Plaguelands 70.57,74.11
]])
ZygorGuidesViewer:RegisterGuide("Dungeon Guides\\Classic\\Stratholme - Live Side Quests",{
author="support@zygorguides.com",
image=ZGV.IMAGESDIR.."Stratholme",
description="This guide will walk you through completing the Stratholme - Live Side Quests.",
},[[
step
Reach Level 55 |ding 55
|tip Use the Leveling guides to accomplish this.
step
talk Smokey LaRue##11033
accept The Great Fras Siabi##5214 |goto Eastern Plaguelands 80.60,57.99
step
talk Duke Nicholas Zverenhoff##11039
accept The Archivist##5251 |goto 81.44,59.82
step
talk Caretaker Alen##11038
|tip He walks around this area.
accept The Restless Souls##5281 |goto 79.73,63.69
step
talk Egan##11140
|tip Inside the building.
turnin The Restless Souls##5281 |goto 14.45,33.74
accept The Restless Souls##5282 |goto 14.45,33.74
step
Enter the cave |goto 15.37,29.30 < 10 |walk
Follow the path |goto 13.73,32.07 < 15 |walk
Leave the cave |goto 7.50,40.68 < 15 |walk
talk Tirion Fordring##1855
|tip He walks around this area.
accept Demon Dogs##5542 |goto 7.56,43.70
accept Blood Tinged Skies##5543 |goto 7.56,43.70
accept Carrion Grubbage##5544 |goto 7.56,43.70
stickystart "Kill_Plaguehound_Runts"
stickystart "Collect_Slabs_Of_Carrion_Worm_Meat"
step
label "Kill_Plaguebats"
kill 30 Plaguebat##8600 |q 5543/1 |goto 43.24,82.95
You can find more around: |notinsticky
[42.24,69.81]
[35.16,74.32]
[27.42,69.07]
[19.99,68.52]
[18.56,77.87]
[33.76,82.90]
step
label "Kill_Plaguehound_Runts"
kill 20 Plaguehound Runt##8596 |q 5542/1 |goto 43.24,82.95
You can find more around: |notinsticky
[42.24,69.81]
[27.42,69.07]
[19.99,68.52]
[18.56,77.87]
[33.76,82.90]
step
label "Collect_Slabs_Of_Carrion_Worm_Meat"
kill Carrion Grub##8603+
collect 15 Slab of Carrion Worm Meat##13853 |q 5544/1 |goto 43.24,82.95
You can find more around: |notinsticky
[42.24,69.81]
[35.16,74.32]
[27.42,69.07]
[19.99,68.52]
[18.56,77.87]
[33.76,82.90]
step
kill 5 Plaguehound##8597 |q 5542/2 |goto 70.01,68.38
You can find more around: |notinsticky
[76.41,66.59]
[71.11,56.12]
step
label "Kill_Frenzied_Plaguehounds"
kill 5 Frenzied Plaguehound##8598 |q 5542/3 |goto 62.63,47.95
You can find more around: |notinsticky
[51.17,43.24]
[49.69,35.97]
step
talk Tirion Fordring##1855
|tip He walks around this area.
turnin Demon Dogs##5542 |goto 7.56,43.70
turnin Blood Tinged Skies##5543 |goto 7.56,43.70
turnin Carrion Grubbage##5544 |goto 7.56,43.70
accept Redemption##5742 |goto 7.56,43.70
step
talk Tirion Fordring##1855
|tip He walks around this area.
|tip Type "/sit" into your chat, or press X.
|tip You must be sitting for the dialogue option to appear when you talk to him.
Tell him _"I am ready to hear your tale, Tirion."_
Listen to Tirion's Tale |q 5742/1 |goto 7.56,43.70
step
talk Tirion Fordring##1855
|tip He walks around this area.
turnin Redemption##5742 |goto 7.56,43.70
accept Of Forgotten Memories##5781 |goto 7.56,43.70
step
click Loose Dirt Mound##177240
|tip Mercutio Filthgorger appears with a group of 3 guards with him.
|tip Try to kite Mercutio Filthgorger away from his guards, so you can fight him by himself.
|tip If you have trouble, try to find someone to help you.
kill Mercutio Filthgorger##11886
collect Taelan's Hammer##14613 |q 5781/1 |goto 28.31,86.88
step
Follow the path |goto 11.93,61.49 < 30 |only if walking
talk Tirion Fordring##1855
|tip He walks around this area.
turnin Of Forgotten Memories##5781 |goto 7.56,43.70
accept Of Lost Honor##5845 |goto 7.56,43.70
step
click Symbol of Lost Honor##177264
|tip Underwater.
collect Symbol of Lost Honor##14625 |q 5845/1 |goto 71.30,33.95
step
talk Tirion Fordring##1855
|tip He walks around this area.
turnin Of Lost Honor##5845 |goto 7.56,43.70
accept Of Love and Family##5846 |goto 7.56,43.70
step
talk Artist Renfray##11936
|tip Inside the building.
turnin Of Love and Family##5846 |goto Western Plaguelands 65.77,75.37
accept Of Love and Family##5848 |goto 65.77,75.37
step
Cross the bridge |goto Eastern Plaguelands 30.85,20.48 < 15 |only if walking
Enter the Stratholme - Live Dungeon with your Group |goto Eastern Kingdoms 55.12,17.36 < 5 |q 5282
stickystart "Free_15_Souls"
step
Inside the Stratholme - Live Dungeon:
click Premius Siabi Tobacco
|tip It looks like a small wooden crate on the ground.
|tip Turn left twice into King's Square.
kill Fras Siabi##11058
collect Siabi's Premium Tobacco##13172 |q 5214/1
step
Inside the Stratholme - Live Dungeon:
click The Bastion Door
|tip Go north and then west once you enter Market Row to reach Crusader's Square.
|tip This requires The Scarlet Key from the Scarlet Monastery dungeon or a Rogue with leveled lockpicking to open.
click Malor's Strongbox##176112
|tip Enter The Hall of Lights, go down the hall and enter the small room on the left.
|tip In the same room as Malor the Zealous.
|tip It looks like a small toolbox in the corner of the room.
collect Medallion of Faith##12845 |q 5122 |future
step
Inside the Stratholme - Live Dungeon:
click Hall of High Command
|tip This requires The Scarlet Key from the Scarlet Monastery dungeon or a Rogue with leveled lockpicking to open.
|tip Go across the hall from The Hall of Lights to enter The Scarlet Bastion.
kill Archivist Galford##10811
|tip He is near the end of The Scarlet Bastion across from Grand Crusader Dathrohan.
Slay Archivist Galford |q 5251/1
step
Inside the Stratholme - Live Dungeon:
click Unfinished Painting##177287
|tip In the same room as Archivist Galford.
collect Of Love and Family##14679 |q 5848/1
step
Inside the Stratholme - Live Dungeon:
click Scarlet Archive##176245
|tip It looks like a small brown book on the table in the room where Archivist Galford is.
Burn the Archive |q 5251/2
step
label "Free_15_Souls"
Inside the Stratholme - Live Dungeon:
Equip Egan's Blaster
|tip It should be in your inventory.
use Egan's Blaster##13289
|tip Use it on Spectral Citizens.
|tip This will cause Restless Spirits to spawn.
|tip Use Egan's Blaster on the Restless Spirits after.
Free 15 Souls |q 5282/1
step
Leave the Stratholme - Live Dungeon
Click Here to Continue |confirm |q 5282
step
click Elders' Square Service Entrance
|tip This requires the Key to the City or a Rogue with leveled lockpicking to open.
Enter the building |goto Eastern Plaguelands 47.89,23.87 < 5 |walk
Enter the Stratholme - Undead Side dungeon with your group |goto 48.23,21.88 < 10 |q 5122 |future
step
Inside the Stratholme - Undead Dungeon:
click Service Entrance Gate
|tip This requires the Key to the City or a Rogue with leveled lockpicking to open.
talk Aurius##10931
|tip Inside the chapel to the right as you enter.
accept The Medallion of Faith##5122
step
Leave the Stratholme - Undead Dungeon
Click Here to Continue |confirm |q 5122
step
talk Egan##11140
|tip Inside the building.
turnin The Restless Souls##5282 |goto 14.45,33.74
step
Enter the cave |goto 15.37,29.30 < 10 |walk
Follow the path |goto 13.73,32.07 < 15 |walk
Leave the cave |goto 7.50,40.68 < 15 |walk
talk Tirion Fordring##1855
|tip He walks around this area.
turnin Of Love and Family##5848 |goto Western Plaguelands 65.77,75.37
step
talk Smokey LaRue##11033
turnin The Great Fras Siabi##5214 |goto Eastern Plaguelands 80.60,57.99
step
talk Duke Nicholas Zverenhoff##11039
turnin The Archivist##5251 |goto 81.44,59.82
step
Cross the bridge |goto 30.85,20.48 < 15 |only if walking
Enter the Stratholme - Live dungeon with your group |goto Eastern Kingdoms 55.12,17.36 < 5 |q 5262 |future
step
Inside the Scholomance - Live Dungeon:
kill Balnazzar##10813
|tip He is the last boss of the Live Side of Stratholme.
|tip He is at the very end of The Scarlet Bastion, across from where Archivist Galford was.
collect Head of Balnazzar##13250 |q 5262 |future
step
use the Head of Balnazzar##13250
accept The Truth Comes Crashing Down##5262
step
Leave the Stratholme - Live Dungeon
Click Here to Continue |confirm |q 5262
step
talk Duke Nicholas Zverenhoff##11039
turnin The Truth Comes Crashing Down##5262 |goto Eastern Plaguelands 81.44,59.82
]])
ZygorGuidesViewer:RegisterGuide("Dungeon Guides\\Classic\\Stratholme - Undead Side Quests",{
author="support@zygorguides.com",
image=ZGV.IMAGESDIR.."Stratholme",
description="This guide will walk you through completing the Stratholme - Undead Side Quests.",
},[[
step
Reach Level 55 |ding 55
|tip Use the Leveling guides to accomplish this.
step
talk Eva Sarkhoff##11216
Ask her _"The pleasure is mine madam. Might I ask what it is that you are doing here?"_
|tip Click through the dialogue.
accept Doctor Theolen Krastinov, the Butcher##5382 |goto Western Plaguelands 70.22,73.72
step
Run up the stairs |goto 69.93,73.99 < 7 |only if walking
Enter the building |goto Eastern Kingdoms 52.79,26.44 < 5 |walk
click Scholomance Door |goto 52.75,26.41 < 5 |walk
|tip This requires the Skeleton Key from the quest "The Key to Scholomance" or a Rogue with leveled lockpicking to open.
Enter the Scholomance Dungeon with your Group |goto 52.70,26.38 < 7 |q 5382
step
Inside the Scholomance Dungeon:
kill Rattlegore##11622
|tip After entering the dungeon, follow the path forward to enter The Reliquary.
|tip Go left and proceed through the Iron Gate on the north side of the room to reach the Chamber of Summoning.
|tip Continue straight through the dungeon to reach The Great Ossuary.
|tip Jump down into one of the holes on the sides of the room to reach the lower level with Rattlegore.
collect Viewing Room Key##13873 |q 5382
|tip This key is required to progress further into the dungeon.
|tip If someone else in the group already has it you can skip this step.
step
Inside the Scholomance Dungeon:
click Remains of Eva Sarkhoff##176544
|tip They look like a pile of bloodied bones in the northern part of the room with Doctor Theolen Krastinov.
|tip Go back upstairs after killing Rattlegore and head north in The Great Ossuary to return to the previous room (the map will just say Scholomance).
|tip Go right through the Iron Gate, clear the room and open the Viewing Room Door using the key.
|tip Take a quick left in The Viewing Room, go through the Iron Gate and follow the stairs down to reach the Headmaster's Study.
|tip Staying on the upper level of the Headmaster's Study, head around the outside of the room and enter the room across from the entrance on the eastern side.
Burn the Remains of Eva Sarkhoff |q 5382/2
step
Inside the Scholomance Dungeon:
click Remains of Lucien Sarkhoff##176545
|tip They look like a pile of bloodied bones in the southeastern part of the room with Doctor Theolen Krastinov.
Burn the Remains of Lucien Sarkhoff |q 5382/3
step
Inside the Scholomance Dungeon:
kill Doctor Theolen Krastinov |q 5382/1
step
Leave the Scholomance Dungeon
Click Here to Continue |confirm |q 5382
step
talk Eva Sarkhoff##11216
turnin Doctor Theolen Krastinov, the Butcher##5382 |goto Western Plaguelands 70.22,73.72
accept Krastinov's Bag of Horrors##5515 |goto 70.22,73.72
step
Run up the stairs |goto 69.93,73.99 < 7 |only if walking
Enter the building |goto Eastern Kingdoms 52.79,26.44 < 5 |walk
click Scholomance Door |goto 52.75,26.41 < 5 |walk
|tip This requires the Skeleton Key from the quest "The Key to Scholomance" or a Rogue with leveled lockpicking to open.
Enter the Scholomance Dungeon with your Group |goto 52.70,26.38 < 7 |q 5515
step
Inside the Scholomance Dungeon:
kill Jandice Barov##10503
|tip After entering the dungeon, follow the path forward to enter The Reliquary.
|tip Go left and proceed through the Iron Gate on the north side of the room to reach the Chamber of Summoning.
|tip Proceed into the next main room and then follow the path to the right and go down the stairs.
|tip Jandice is in the northeastern part of this room.
collect Krastinov's Bag of Horrors##13725 |q 5515/1
step
Leave the Scholomance Dungeon
Click Here to Continue |confirm |q 5515
step
talk Eva Sarkhoff##11216
turnin Krastinov's Bag of Horrors##5515 |goto Western Plaguelands 70.22,73.72
accept Kirtonos the Herald##5384 |goto 70.22,73.72
step
Run up the stairs |goto 69.93,73.99 < 7 |only if walking
Enter the building |goto Eastern Kingdoms 52.79,26.44 < 5 |walk
click Scholomance Door |goto 52.75,26.41 < 5 |walk
|tip This requires the Skeleton Key from the quest "The Key to Scholomance" or a Rogue with leveled lockpicking to open.
Enter the Scholomance Dungeon with your Group |goto 52.70,26.38 < 7 |q 5384
step
Inside the Scholomance Dungeon:
click Brazier of the Herald
|tip After entering the dungeon, follow the path forward to enter The Reliquary.
|tip Go left and proceed through the Iron Gate on the north side of the room to reach the Chamber of Summoning.
|tip Follow the path out to the right to the balcony.
|tip Clear the Chamber of Summoning before doing this.
kill Kirtonos the Herald##10506 |q 5384/1
|tip Drag him back into the gate.
step
Leave the Scholomance Dungeon
Click Here to Continue |confirm |q 5384
step
talk Eva Sarkhoff##11216
turnin Kirtonos the Herald##5384 |goto Western Plaguelands 70.22,73.72
step
Reach Level 57 |ding 57
|tip Use the Leveling guides to accomplish this.
step
use the Spectral Essence##13544
Equip the Spectral Essence
talk Magistrate Marduke##11286
|tip You must have the Spectral Essence equipped to see him.
accept The Human, Ras Frostwhisper##5461 |goto 70.57,74.11
step
click Keepsake of Remembrance##176630
|tip It looks like a small red book at the top of the tower.
|tip If it's not there, check in the fireplaces of nearby buildings.
collect Keepsake of Remembrance##13585 |q 5461/1 |goto Arathi Highlands 17.91,69.41
step
use the Spectral Essence##13544
Equip the Spectral Essence
talk Magistrate Marduke##11286
|tip You must have the Spectral Essence equipped to see him.
turnin The Human, Ras Frostwhisper##5461 |goto Western Plaguelands 70.57,74.11
accept The Dying, Ras Frostwhisper##5462 |goto 70.57,74.11
step
talk Leonid Barthalomew the Revered##11036
|tip Inside the building.
turnin The Dying, Ras Frostwhisper##5462 |goto Eastern Plaguelands 81.72,57.83
accept Menethil's Gift##5463 |goto 81.72,57.83
step
talk Duke Nicholas Zverenhoff##11039
accept The Archivist##5251 |goto 81.44,59.82
step
Cross the bridge |goto 30.85,20.48 < 15 |only if walking
Enter the Stratholme - Live Dungeon with your Group |goto Eastern Kingdoms 55.12,17.36 < 5 |q 5251
step
Inside the Stratholme - Live Dungeon:
click The Bastion Door
|tip Go left after entering, then north and then west once you enter Market Row to reach Crusader's Square.
|tip This requires The Scarlet Key from the Scarlet Monastery dungeon or a Rogue with leveled lockpicking to open.
click Malor's Strongbox##176112
|tip Enter The Hall of Lights, go down the hall and enter the small room on the left.
|tip In the same room as Malor the Zealous.
|tip It looks like a small toolbox in the corner of the room.
collect Medallion of Faith##12845 |q 5122 |future
step
Inside the Stratholme - Live Dungeon:
click Hall of High Command
|tip This requires The Scarlet Key from the Scarlet Monastery dungeon or a Rogue with leveled lockpicking to open.
|tip Go across the hall from The Hall of Lights to enter The Scarlet Bastion.
kill Archivist Galford##10811
|tip He is near the end of The Scarlet Bastion across from Grand Crusader Dathrohan.
Slay Archivist Galford |q 5251/1
step
Inside the Stratholme - Live Dungeon:
click Scarlet Archive##176245
|tip It looks like a small brown book on the table in the room where Archivist Galford is.
Burn the Archive |q 5251/2
step
Leave the Stratholme - Live Dungeon
Click Here to Continue |confirm |q 5251
step
talk Duke Nicholas Zverenhoff##11039
turnin The Archivist##5251 |goto Eastern Plaguelands 81.44,59.82
step
Cross the bridge |goto 30.85,20.48 < 15 |only if walking
Enter the Stratholme - Live Dungeon with your Group |goto Eastern Kingdoms 55.12,17.36 < 5 |q 5262 |future
step
Inside the Scholomance - Live Dungeon:
kill Balnazzar##10813
|tip He is the last boss of the Live Side of Stratholme.
|tip He is at the very end of The Scarlet Bastion, across from where Archivist Galford was.
collect Head of Balnazzar##13250 |q 5262 |future
step
use the Head of Balnazzar##13250
accept The Truth Comes Crashing Down##5262
step
Leave the Stratholme - Live Dungeon
Click Here to Continue |confirm |q 5262
step
talk Duke Nicholas Zverenhoff##11039
turnin The Truth Comes Crashing Down##5262 |goto Eastern Plaguelands 81.44,59.82
accept Above and Beyond##5263 |goto 81.44,59.82
step
talk Betina Bigglezink##11035
accept The Flesh Does Not Lie##5212 |goto 81.47,59.65
step
talk Leonid Barthalomew the Revered##11036
|tip Inside the building.
accept Houses of the Holy##5243 |goto 81.73,57.83
step
click Elders' Square Service Entrance
|tip This requires the Key to the City or a Rogue with leveled lockpicking to open.
Enter the building |goto Eastern Plaguelands 47.89,23.87 < 5 |walk
Enter the Stratholme - Undead Side Dungeon with your Group |goto 48.23,21.88 < 7 |q 5263
stickystart "Collect_20_Plagued_Flesh_Sample"
stickystart "Collect_5_Stratholme_Holy_Water"
step
Inside the Stratholme - Undead Dungeon:
click Service Entrance Gate
|tip This requires the Key to the City or a Rogue with leveled lockpicking to open.
talk Aurius##10931
|tip Inside the chapel to the right as you enter.
accept The Medallion of Faith##5122 |q 5125 |future
step
Inside the Stratholme - Undead Dungeon:
kill Baron Rivendare##10440
|tip Enter the building in Slaughter Square and go downstairs.
collect Head of Baron Rivendare##13251 |q 5263/1
step
Inside the Stratholme - Undead Dungeon:
talk Aurius##10917
|tip On the floor in the room with Baron Rivendare.
|tip He appears if you've completed The Medallion of Faith quest.
|tip He will not appear again if you fail to kill the Baron and you will have to wait for a reset to try again.
accept Aurius' Reckoning##5125
step
Inside the Stratholme - Undead Dungeon:
click Menethil's Gift##176631
|tip It looks like a large orange circular symbol on the floor in the room with Baron Rivendare.
turnin Menethil's Gift##5463
accept Menethil's Gift##5464
step
label "Collect_20_Plagued_Flesh_Sample"
Inside the Stratholme - Undead Dungeon: |notinsticky
Kill enemies around this area
collect 20 Plagued Flesh Sample##13174 |q 5212/1
step
label "Collect_5_Stratholme_Holy_Water"
Inside the Stratholme - Undead Dungeon: |notinsticky
click Stratholme Supply Crate##181085+
|tip They look like brown boxes along the walls of the dungeon.
|tip They will sometimes spawn enemies instead.
collect 5 Stratholme Holy Water##13180 |q 5243/1
step
Leave Stratholme - Undead Dungeon
Click Here to Continue |confirm |q 5243
step
talk Duke Nicholas Zverenhoff##11039
turnin Above and Beyond##5263 |goto Eastern Plaguelands 81.44,59.82
step
talk Betina Bigglezink##11035
turnin The Flesh Does Not Lie##5212 |goto 81.47,59.65
accept The Active Agent##5213 |goto 81.47,59.65
step
talk Leonid Barthalomew the Revered##11036
|tip Inside the building.
turnin Menethil's Gift##5464 |goto 81.72,57.83
turnin Houses of the Holy##5243 |goto 81.73,57.83
step
click Elders' Square Service Entrance
|tip This requires the Key to the City or a Rogue with leveled lockpicking to open.
Enter the building |goto Eastern Plaguelands 47.89,23.87 < 5 |walk
Enter the Stratholme - Undead Side Dungeon with your Group |goto 48.23,21.88 < 7 |q 5213
step
Inside the Stratholme - Undead Dungeon:
click Scourge Data##176249
|tip It looks like a small metal box in one of the three Ziggurats in The Gauntlet area.
|tip Follow the path north and then east through the two Gauntlet Gates to reach the Gauntlet.
|tip This requires the Key to the City or a Rogue with leveled lockpicking to open.
collect Scourge Data##13176 |q 5213/1
step
Leave Stratholme - Undead Dungeon
Click Here to Continue |confirm |q 5213
step
talk Betina Bigglezink##11035
turnin The Active Agent##5213 |goto Eastern Plaguelands 81.47,59.65
]])
ZygorGuidesViewer:RegisterGuide("Dungeon Guides\\Classic\\Upper Blackrock Spire Quests",{
author="support@zygorguides.com",
image=ZGV.IMAGESDIR.."Upper Blackrock Spire",
description="This guide will walk you through completing the Upper Blackrock Quests.",
},[[
step
Reach Level 57 |ding 57
|tip Use the Leveling guides to accomplish this.
step
talk Count Remington Ridgewell##2285
|tip Inside the building.
accept Mayara Brightwing##4766 |goto Stormwind City/0 76.94,47.83
step
talk Mayara Brightwing##9565
turnin Mayara Brightwing##4766 |goto Burning Steppes 84.84,69.12
accept Doomrigger's Clasp##4764 |goto 84.84,69.12
step
talk Tinkee Steamboil##10267
accept Broodling Essence##4726 |goto 65.24,24.00
step
Follow the path up |goto 82.89,63.37 < 7 |only if walking
talk Helendis Riverhorn##9562
accept Dragonkin Menace##4182 |goto 85.82,68.95
stickystart "Slay_Black_Dragonspawns"
stickystart "Slay_Black_Drake"
stickystart "Slay_Black_Wrymkins"
stickystart "Broodling_Essence"
step
kill 15 Black Broodling##7047 |q 4182/1 |goto 89.18,53.85
You can find more around [91.51,35.35]
step
label "Slay_Black_Dragonspawns"
kill 10 Black Dragonspawn##7040 |q 4182/2 |goto 92.05,53.82
|tip These enemies are Elite, you may need a group to complete this.
You can find more around: |notinsticky
[88.72,37.56]
[84.45,27.50]
step
label "Slay_Black_Drake"
kill 1 Black Drake##7044 |q 4182/3 |goto 89.18,53.85
|tip These enemies are Elite, you may need a group to complete this.
You can find more around [91.51,35.35] |notinsticky
step
label "Slay_Black_Wrymkins"
kill 4 Black Wyrmkin##7041 |q 4182/4 |goto 92.05,53.82
|tip These enemies are Elite, you may need a group to complete this.
You can find more around: |notinsticky
[88.72,37.56]
[84.45,27.50]
step
label "Broodling_Essence"
use the Draco-Incarcinatrix 900##12284
|tip Use it on Broodling enemies around this area.
|tip They look like small flying dragons.
Kill Broodling enemies around this area
click Broodling Essence##175264+
|tip They look like red floating crystals that appear above their corpses after you kill them.
collect 8 Broodling Essence##12283 |q 4726/1 |goto 59.26,32.49
You can find more around: |notinsticky
[72.83,28.41]
[80.05,27.94]
[87.34,32.01]
[91.96,35.64]
step
Follow the path up |goto 82.89,63.37 < 7 |only if walking
talk Helendis Riverhorn##9562
turnin Dragonkin Menace##4182 |goto 85.82,68.95
step
Follow the path up |goto 82.89,63.37 < 7 |only if walking
talk Marshal Maxwell##9560
accept Marshal Windsor##4241 |goto 84.75,69.02
step
Follow the path up |goto Searing Gorge 33.53,75.22 < 20 |only if walking
Enter Blackrock Mountain |goto Searing Gorge 34.76,83.98 < 7 |walk
Run down the chain |goto Eastern Kingdoms 48.73,63.79 < 5 |walk
Run down the stairs |goto 48.65,64.16 < 5 |walk
Continue down the stairs |goto 48.62,64.26 < 5 |c |q 4241
|tip This quest requires you to progress through the Blackrock Depths dungeon.
|tip You will likely need a full group to complete the quest.
step
Run down the stairs |goto 48.62,64.11 < 7 |walk
Follow the path down |goto 48.68,64.07 < 7 |walk
Run down the chain |goto 48.58,64.09 < 5 |walk
Enter the building |goto 48.44,63.83 < 5 |walk
Follow the path |goto 48.15,63.34 < 15 |walk
Enter the Blackrock Depths Dungeon with your Group |goto 48.08,62.41 < 7 |c |q 4241
|tip This quest requires you to progress through the Blackrock Depths dungeon.
|tip You will likely need a full group to complete the quest.
step
Inside the Blackrock Depths Dungeon:
kill High Interrogator Gerstahn##9018
|tip After entering the dungeon, go straight into the Detention Block and then take the first right.
|tip Follow this path around until you can go left into a room at the back of this long hallway.
collect Prison Cell Key##11140 |q 4241
|tip You need this key to unlock Marshal Windsor's cell door.
|tip If someone else in the group already has the key you can skip this step.
|tip A Rogue can also pick the lock.
step
Inside the Blackrock Depths Dungeon:
talk Marshal Windsor##9023
|tip He is in a prison cell inside the Detention Block.
|tip Leave High Interrogator Gerstahn's room and go left, then open the first Cell Door on your right.
turnin Marshal Windsor##4241
accept Abandoned Hope##4242
step
Leave the Blackrock Depths Dungeon
Click Here to Continue |confirm |q 4242
step
Follow the path up |goto Burning Steppes/0 82.89,63.37 < 7 |only if walking
talk Marshal Maxwell##9560
turnin Abandoned Hope##4242 |goto 84.75,69.02
step
Follow the path up |goto Searing Gorge 33.53,75.22 < 20 |only if walking
Enter Blackrock Mountain |goto Searing Gorge 34.76,83.98 < 7 |walk
Run down the chain |goto Eastern Kingdoms 48.73,63.79 < 5 |walk
Run down the stairs |goto 48.65,64.16 < 5 |walk
Continue down the stairs |goto 48.62,64.26 < 5 |q 4264 |future
|tip This quest requires you to progress through the Blackrock Depths dungeon.
|tip You will likely need a full group to complete the quest.
step
Run down the stairs |goto 48.62,64.11 < 7 |walk
Follow the path down |goto 48.68,64.07 < 7 |walk
Run down the chain |goto 48.58,64.09 < 5 |walk
Enter the building |goto 48.44,63.83 < 5 |walk
Follow the path |goto 48.15,63.34 < 15 |walk
Enter the Blackrock Depths Dungeon with your Group |goto 48.08,62.41 < 7 |q 4264 |future
|tip This quest requires you to progress through the Blackrock Depths dungeon.
|tip You will likely need a full group to complete the quest.
step
Inside the Blackrock Depths Dungeon:
Kill Anvilrage dwarves at the beginning of the dungeon
|tip Just clear the first few rooms of the dungeon, killing all the Anvilrage dwarves and resetting the instance if needed, until you get the item drop.
collect A Crumpled Up Note##11446 |condition itemcount(11446) == 1 or haveq(4264) or completedq(4264)
step
Inside the Blackrock Depths Dungeon:
use A Crumpled Up Note##11446
accept A Crumpled Up Note##4264
step
Inside the Blackrock Depths Dungeon:
kill High Interrogator Gerstahn##9018
|tip After entering the dungeon, go straight into the Detention Block and then take the first right.
|tip Follow this path around until you can go left into a room at the back of this long hallway.
collect Prison Cell Key##11140 |q 4264
|tip You need this key to unlock Marshal Windsor's cell door.
|tip If someone else in the group already has the key you can skip this step.
|tip A Rogue can also pick the lock.
step
Inside the Blackrock Depths Dungeon:
talk Marshal Windsor##9023
|tip He is in a prison cell inside the Detention Block.
|tip Leave High Interrogator Gerstahn's room and go left, then open the first Cell Door on your right.
turnin A Crumpled Up Note##4264
accept A Shred of Hope##4282
step
Inside the Blackrock Depths Dungeon:
kill General Angerforge##9033
|tip Run north through the Detention Block and unlock the East Garrison Door to enter the East Garrison.
|tip In the lower part of this room, click the Shadowforge Lock, then run up the two sets of stairs and follow the hallway on the left just before the third set of stairs.
|tip Follow the path through the hallway to reach the West Garrison.
|tip When you reach a room with stairs on your left, go down them to find General Angerforge.
collect Marshal Windsor's Lost Information##11464 |q 4282/1
step
Inside the Blackrock Depths Dungeon:
kill Golem Lord Argelmach##8983
|tip Go back up the stairs next to General Angerforge and continue north to reach The Manufactory and Golem Lord Argelmach.
collect Marshal Windsor's Lost Information##11465 |q 4282/2
step
Inside the Blackrock Depths Dungeon:
talk Marshal Windsor##9023
|tip He is in a prison cell inside the Detention Block.
|tip After entering the dungeon enter the first room and then take the third tunnel on the right.
|tip If you enter the Halls of the Law you went too far.
turnin A Shred of Hope##4282
|tip Make sure everyone turns this quest in before anyone accepts the next one.
|tip Accepting Jail Break! will start the escort quest and other party members will not be able to interact with Marshal Windsor.
accept Jail Break!##4322
step
Inside the Blackrock Depths Dungeon:
Follow and protect Marshal Windsor
|tip He will walk around the Detention Block and Halls of the Law, so clearing these beforehand can be helpful.
|tip There will be a few cells he will have you open. Sometimes you'll have to fight the prisoners or talk to a friendly NPC to free them.
|tip Eventually he will walk back to the dungeon entrance and escape.
Protect Marshal Windor During your Escape |q 4322/1
step
Leave the Blackrock Depths Dungeon
Click Here to Continue |confirm |q 4322
step
Follow the path up |goto Burning Steppes/0 82.89,63.37 < 7 |only if walking
talk Marshal Maxwell##9560
turnin Jail Break!##4322 |goto 84.75,69.02
accept Stormwind Rendezvous##6402 |goto 84.75,69.02
step
talk Squire Rowe##17804 |goto Stormwind City 74.17,90.34
Tell him _"Let Marshal Windsor know that I am ready."_
|confirm |q 6402
step
talk Reginald Windsor##12580
turnin Stormwind Rendezvous##6402 |goto 73.58,91.04
accept The Great Masquerade##6403 |goto 73.58,91.04
step
Watch the dialogue
Follow Reginald Windsor through Stormwind |goto 72.27,47.65 < 10 |q 6403
step
talk Reginald Windsor##12580 |goto 72.27,47.65
Tell him _"I am ready, as are my forces. Let us end this masquerade!"_
|confirm |q 6403
step
Watch the dialogue
kill Onyxia's Elite Guard##12739+
|tip Inside the building.
Complete Reginald Windsor's March |q 6403/1 |goto 79.56,38.97
step
talk Highlord Bolvar Fordragon##1748
|tip Inside the building.
turnin The Great Masquerade##6403 |goto 79.76,38.92
accept The Dragon's Eye##6501 |goto 79.76,38.92
step
Follow the path up |goto Burning Steppes 63.92,29.88 < 15 |only if walking
talk Tinkee Steamboil##10267
turnin Broodling Essence##4726 |goto 65.23,23.99
accept Felnok Steelspring##4808 |goto 65.23,23.99
step
talk Felnok Steelspring##10468
turnin Felnok Steelspring##4808 |goto Winterspring 61.63,38.61
accept Chillwind Horns##4809 |goto 61.63,38.61
step
kill Chillwind Ravager##7449+
|tip They look like chimeras.
|tip They share spawn points with the bears, so kill them too.
collect 8 Uncracked Chillwind Horn##12444 |q 4809/1 |goto 59.97,21.54
You can find more around: |notinsticky
[54.75,22.59]
[59.18,18.02]
[60.13,12.28]
[57.99,14.79]
step
talk Felnok Steelspring##10468
turnin Chillwind Horns##4809 |goto 61.63,38.61
accept Return to Tinkee##4810 |goto 61.63,38.61
step
Follow the path up |goto Winterspring 59.30,43.21 < 10 |only if walking
Enter the cave |goto 57.15,49.93 < 7 |walk
Follow the path down |goto 54.65,49.94 < 10 |only if walking
Step onto the Blue Rune |goto 52.65,55.78
|tip Inside the cave.
Teleport to Haleh |goto 54.56,51.27 < 5 |noway |q 6501
step
talk Haleh##10929
turnin The Dragon's Eye##6501 |goto 54.55,51.20
accept Drakefire Amulet##6502 |goto 54.55,51.20
step
talk Tinkee Steamboil##10267
turnin Return to Tinkee##4810 |goto Burning Steppes 65.23,23.99
step
talk Felnok Steelspring##10468
accept Tinkee Steamboil##4907 |goto Winterspring 61.63,38.61
step
talk Tinkee Steamboil##10267
turnin Tinkee Steamboil##4907 |goto Burning Steppes 65.23,23.99
accept Egg Freezing##4734 |goto 65.23,23.99
step
talk Duke Hydraxis##13278
accept Poisoned Water##6804 |goto Azshara 79.28,73.69
accept Stormers and Rumblers##6805 |goto 79.28,73.69
stickystart "Kill_15_Desert_Rumbler"
step
kill 15 Dust Stormer##11744 |q 6805/1 |goto Silithus 19.84,22.23
You can find more around:
[22.87,13.34]
[29.37,15.01]
step
label "Kill_15_Desert_Rumbler"
kill 15 Desert Rumbler##11746 |q 6805/2 |goto 19.84,22.23
You can find more around: |notinsticky
[22.87,13.34]
[29.37,15.01]
step
use the Aspect of Neptulon##17310
|tip Use it on Plague Ravagers and Blighted Surge around this area.
kill Discordant Surge##13279+
collect 12 Discordant Bracers##17309 |q 6804/1 |goto Eastern Plaguelands 62.61,79.45
step
talk Duke Hydraxis##13278
turnin Poisoned Water##6804 |goto Azshara 79.28,73.69
turnin Stormers and Rumblers##6805 |goto 79.28,73.69
accept Eye of the Emberseer##6821 |goto 79.28,73.69
step
Follow the path up |goto Searing Gorge 33.53,75.22 < 20 |only if walking
Enter Blackrock Mountain |goto Searing Gorge 34.76,83.98 < 7 |walk
Run up the chain |goto Eastern Kingdoms 48.73,63.79 < 5 |walk
Jump down here |goto 48.77,63.67 < 5 |walk
Follow the path up |goto 48.83,63.66 < 5 |walk
Enter the building |goto 48.91,63.92 < 5 |walk
Enter the Blackrock Spire Dungeon with your Group |goto 48.95,63.88 < 7 |q 6502
|tip This quest requires you to progress through the Upper Blackrock Spire dungeon.
|tip You will likely need a 10 person raid group to complete the quest.
step
Inside the Lower Blackrock Spire Dungeon:
kill Overlord Wyrmthalak##9568
|tip After entering the dungeon, follow the path right in the Hall of Blackhand to reach Hordemar City.
|tip Proceed across the bridges through Hordemar City and jump down into the groove in the ground where Bijou is.
|tip Jump down to the west from Bijou and follow the path west around Hordemar City, eventually heading south to reach the Skitterweb Tunnels.
|tip Follow the path up and out of the Skitterweb Tunnels to reenter the upper levels of Hordemar City.
|tip Follow the path up, kill the group of ogres and then follow the path south along the western wall through the short hallway and up the small set of stairs.
|tip Turn right twice to go up another small set of stairs.
|tip Cross this room and continue up the small set of stairs on the opposite side, continue forward to reach the Chamber of Battle.
collect General Drakkisath's Command##12780 |q 5089 |future
step
use General Drakkisath's Command##12780
accept General Drakkisath's Command##5089
step
Leave the Blackrock Spire Dungeon
Click Here to Continue |confirm |q 5089
step
talk Marshal Maxwell##9560
turnin General Drakkisath's Command##5089 |goto Burning Steppes 84.75,69.01
accept General Drakkisath's Demise##5102 |goto 84.75,69.01
step
Follow the path up |goto Searing Gorge 33.53,75.22 < 20 |only if walking
Enter Blackrock Mountain |goto Searing Gorge 34.76,83.98 < 7 |walk
Run up the chain |goto Eastern Kingdoms 48.73,63.79 < 5 |walk
Jump down here |goto 48.77,63.67 < 5 |walk
Follow the path up |goto 48.83,63.66 < 5 |walk
Enter the building |goto 48.91,63.92 < 5 |walk
Enter the Blackrock Spire Dungeon with your Group |goto 48.95,63.88 < 7 |q 6502
|tip This quest requires you to progress through the Upper Blackrock Spire dungeon.
|tip You will likely need a 10 person raid group to complete the quest.
step
Inside the Upper Blackrock Spire Dungeon:
kill Pyroguard Emberseer##9816
|tip After entering the dungeon, follow the path to the left to enter the Upper Blackrock Spire.
|tip Someone in your group must have the Seal of Ascension in order to open the door.
|tip Clear the enemies in the first room to unlock the door to the next room.
|tip Kill the Blackhand Incarcerators to release Pyroguard Emberseer.
collect Eye of the Emberseer##17322 |q 6821/1
step
Inside the Upper Blackrock Spire Dungeon:
use the Eggscilloscope Prototype##12286
|tip Use it on the eggs in The Rookery, just past Pyroguard Emberseer.
|tip Don't get too close or they will hatch if they aren't frozen.
Test the Eggscilloscope Prototype |q 4734/1
step
Inside the Upper Blackrock Spire Dungeon:
click Doomrigger's Coffer##175382
|tip At the center of The Rookery, just before the ramp.
collect Doomrigger's Clasp##12352 |q 4764/1
step
Inside the Upper Blackrock Spire Dungeon:
talk Awbee##10740
|tip Proceed through the upper level of The Rookery to reach the Hall of Blackhand.
|tip Go east in the Hall of Blackhand and jump down into the Blackrock Stadium to start the encounter.
|tip Kill the enemies that attack, then finally Gyth and Warchief Rend Blackhand.
|tip Exit the stadium to the south.
|tip It's on the ledge just past the door after the Gyth and Warchief Rend Blackhand encounter.
accept The Matron Protectorate##5160
step
Inside the Upper Blackrock Spire Dungeon:
kill The Beast##10430
|tip Head east up the stairs from Awbee and go right into The Furnace, followed by a left to reach The Beast.
collect Finkle's Skinner##12709 |n
|tip This is a rare drop and may take multiple attempts to get.
|tip If you don't have Skinning or you don't want to do this you can skip this step but you will have to skip the next quest.
use Finkle's Skinner##12709
Skin The Beast
|tip This requires level 315 Skinning to accomplish.
|tip You can achieve this with the "Enchant Gloves - Skinning" along with Finkle's Skinner equipped.
|confirm |q 5047 |future
step
Inside the Upper Blackrock Spire Dungeon:
talk Finkle Einhorn##10776
|tip He will appear after skinning The Beast.
Ask him _"How the hell did you get in there to begin with?"_
accept Finkle Einhorn, At Your Service!##5047
step
Leave the Blackrock Spire Dungeon
Click Here to Continue |confirm |q 4764
step
talk Tinkee Steamboil##10267
turnin Egg Freezing##4734  |goto Burning Steppes 65.23,23.99
accept Egg Collection##4735 |goto 65.23,23.99
step
talk Mayara Brightwing##9565
turnin Doomrigger's Clasp##4764 |goto 84.84,69.12
step
talk Marshal Maxwell##9560
turnin General Drakkisath's Demise##5102 |goto 84.75,69.01
step
talk Malyfous Darkhammer##10637
turnin Finkle Einhorn, At Your Service!##5047 |goto Winterspring 60.99,38.78
step
Follow the path up |goto 59.30,43.21 < 10 |only if walking
Enter the cave |goto 57.15,49.93 < 7 |walk
Follow the path down |goto 54.65,49.94 < 10 |only if walking
Step onto the Blue Rune |goto 52.65,55.78
|tip Inside the cave.
Teleport to Haleh |goto 54.56,51.27 < 5 |noway |q 6502
step
talk Haleh##10929
turnin Drakefire Amulet##6502 |goto 54.55,51.20
|tip Completing this quest will award you with a Darkfire Amulet, which will allow you to enter the Onyxia's Lair raid.
|tip You must keep it in your inventory in order to enter the raid instance.
step
talk Jeziba##10976
|tip Upstairs inside the building.
turnin Wrath of the Blue Flight##5162 |goto Western Plaguelands 39.38,66.78
accept Catalogue of the Wayward##5164 |goto 39.38,66.78
step
click Catalogue of the Wayward##176192
|tip It looks like a blue book on the bedside table upstairs inside the building.
turnin Catalogue of the Wayward##5164 |goto 39.35,66.60
step
talk Duke Hydraxis##13278
turnin Eye of the Emberseer##6821 |goto Azshara 79.28,73.69
step
Follow the path up |goto Searing Gorge 33.53,75.22 < 20 |only if walking
Enter Blackrock Mountain |goto Searing Gorge 34.76,83.98 < 7 |walk
Run up the chain |goto Eastern Kingdoms 48.73,63.79 < 5 |walk
Jump down here |goto 48.77,63.67 < 5 |walk
Follow the path up |goto 48.83,63.66 < 5 |walk
Enter the building |goto 48.91,63.92 < 5 |walk
Enter the Blackrock Spire Dungeon with your Group |goto 48.95,63.88 < 7 |q 6502
|tip This quest requires you to progress through the Upper Blackrock Spire dungeon.
|tip You will likely need a 10 person raid group to complete the quest.
step
Inside the Upper Blackrock Spire Dungeon:
use the Eggscilloscope Prototype##12286
|tip Use it on the eggs in The Rookery, just past Pyroguard Emberseer.
|tip Use it to freeze the eggs.
|tip Don't get too close or they will hatch if they aren't frozen.
use the Collectronic Module##12287
|tip Use it to collect the eggs.
collect 8 Collected Dragon Egg##12241 |q 4735/1
step
Leave the Blackrock Spire Dungeon
Click Here to Continue |confirm |q 4735
step
talk Tinkee Steamboil##10267
turnin Egg Collection##4735 |goto Burning Steppes 65.23,23.99
]])
ZygorGuidesViewer:RegisterGuide("Dungeon Guides\\Classic\\Raid Attunements\\Blackwing Lair Attunement",{
author="support@zygorguides.com",
description="This guide will walk you through becoming attuned for the Blackwing Lair raid.",
},[[
step
Reach level 55 |ding 55
|tip Use the Leveling guides to accomplish this.
step
Follow the path up |goto Searing Gorge 33.53,75.22 < 20 |only if walking
Enter Blackrock Mountain |goto Searing Gorge 34.76,83.98 < 7 |walk
Run up the chain |goto Eastern Kingdoms 48.73,63.79 < 5 |walk
Jump down here |goto 48.77,63.67 < 5 |walk
Follow the path up |goto 48.83,63.66 < 5 |walk
Enter the building |goto 48.91,63.92 < 5 |walk
Follow the path |goto 48.95,63.93 < 5 |walk
Follow the path down |goto 49.01,64.12 < 5 |walk
kill Scarshield Quartermaster##9046
|tip He walks around this area.
collect Blackhand's Command##18987 |goto 49.12,64.10 |condition itemcount(18987) == 1 or haveq(7761) or completedq(7761)
step
use Blackhand's Command##18987
accept Blackhand's Command##7761
step
Enter the Blackrock Spire dungeon with your group |goto 48.95,63.88 < 7 |q 7761
|tip This quest requires you to progress through the Upper Blackrock Spire dungeon.
|tip You will likely need a 10 person raid group to complete the quest.
step
Inside the Upper Blackrock Spire Dungeon:
kill General Drakkisath##10363
|tip Use the Dungeon guides to accomplish this.
click Drakkisath's Brand##179880
|tip It looks like a large glowing blue totem behind General Drakkisath.
turnin Blackhand's Command##7761
|tip Turning this in will allow you to teleport directly to Blackwing Lair by clicking the Orb of Command.
|tip It is located down the southern hallway outside of the dungeon entrance.
]])
ZygorGuidesViewer:RegisterGuide("Dungeon Guides\\Classic\\Raid Attunements\\Molten Core Attunement",{
author="support@zygorguides.com",
description="This guide will walk you through becoming attuned for the Molten Core raid.",
},[[
step
Reach level 55 |ding 55
|tip Use the Leveling guides to accomplish this.
step
Follow the path up |goto Searing Gorge 33.53,75.22 < 20 |only if walking
Enter Blackrock Mountain |goto Searing Gorge 34.76,83.98 < 7 |walk
Run down the chain |goto Eastern Kingdoms 48.73,63.79 < 5 |walk
Run down the stairs |goto 48.65,64.16 < 5 |walk
Continue down the stairs |goto 48.62,64.26 < 5 |q 7848 |future
step
Run down the stairs |goto 48.62,64.11 < 7 |walk
Follow the path down |goto 48.68,64.07 < 7 |walk
Run down the chain |goto 48.58,64.09 < 5 |walk
talk Lothos Riftwaker##14387
accept Attunement to the Core##7848 |goto 48.41,63.82
step
Enter the building |goto 48.44,63.83 < 5 |walk
Follow the path |goto 48.15,63.34 < 15 |walk
Enter the Blackrock Depths dungeon with your group |goto 48.08,62.41 < 7 |q 7848
|tip This quest requires you to progress through the Blackrock Depths dungeon.
|tip You will likely need a full group to complete the quest.
step
Inside the Blackrock Depths Dungeon:
Reach the room with Lord Incendius
|tip The fastest way to reach him is to pick the locked door to the left after entering the dungeon.
|tip Continue straight through the Detention Block and into the Dark Iron Hallway.
|tip Follow the path north east through the Dark Iron Hallway and through the Shadowforge City.
|tip If you are doing a normal dungeon run you can use the Dungeon guides to accomplish this.
Jump down from Lord Incendius' platform and into the lava below
Hug the left side of the room and you'll be able to swim from the lava up onto a small section of land
Follow this left wall as far as you can, after a short while you'll have to swim through lava
You'll pass a small island with Fireguard Destroyers on it and then past them will be a bridge
Follow the path up and across the bridge, killing the addional Fireguard Destroyers
On the left side of the bridge, before the green portal is the Core Fragment
click Core Fragment##179553
collect Core Fragment##18412 |q 7848/1
step
talk Lothos Riftwaker##14387
turnin Attunement to the Core##7848 |goto 48.41,63.82
|tip Turning this in will allow you to teleport directly to Molten Core by talking to Lothos Riftwaker.
]])
ZygorGuidesViewer:RegisterGuide("Dungeon Guides\\Classic\\Raid Attunements\\Onyxia's Lair Attunement",{
author="support@zygorguides.com",
description="This guide will walk you through becoming attuned for the Onyxia's Lair raid.",
},[[
step
Reach level 48 |ding 48
|tip Use the Leveling guides to accomplish this.
step
Follow the path up |goto Burning Steppes/0 82.89,63.37 < 7 |only if walking
talk Helendis Riverhorn##9562
accept Dragonkin Menace##4182 |goto 85.82,68.95
stickystart "Slay_Black_Dragonspawns"
stickystart "Slay_Black_Drake"
stickystart "Slay_Black_Wrymkins"
step
kill 15 Black Broodling##7047 |q 4182/1 |goto 89.18,53.85
You can find more around [91.51,35.35]
step
label "Slay_Black_Dragonspawns"
kill 10 Black Dragonspawn##7040 |q 4182/2 |goto 92.05,53.82
|tip These enemies are Elite, you may need a group to complete this.
You can find more around: |notinsticky
[88.72,37.56]
[84.45,27.50]
step
label "Slay_Black_Drake"
kill 1 Black Drake##7044 |q 4182/3 |goto 89.18,53.85
|tip These enemies are Elite, you may need a group to complete this.
You can find more around [91.51,35.35]
step
label "Slay_Black_Wrymkins"
kill 4 Black Wyrmkin##7041 |q 4182/4 |goto 92.05,53.82
|tip These enemies are Elite, you may need a group to complete this.
You can find more around: |notinsticky
[88.72,37.56]
[84.45,27.50]
step
Follow the path up |goto 82.89,63.37 < 7 |only if walking
talk Helendis Riverhorn##9562
turnin Dragonkin Menace##4182 |goto 85.82,68.95
accept Marshal Windsor##4241 |goto 84.75,69.02
step
Follow the path up |goto Searing Gorge 33.53,75.22 < 20 |only if walking
Enter Blackrock Mountain |goto Searing Gorge 34.76,83.98 < 7 |walk
Run down the chain |goto Eastern Kingdoms 48.73,63.79 < 5 |walk
Run down the stairs |goto 48.65,64.16 < 5 |walk
Continue down the stairs |goto 48.62,64.26 < 5 |c |q 4241
|tip This quest requires you to progress through the Blackrock Depths dungeon.
|tip You will likely need a full group to complete the quest.
step
Run down the stairs |goto 48.62,64.11 < 7 |walk
Follow the path down |goto 48.68,64.07 < 7 |walk
Run down the chain |goto 48.58,64.09 < 5 |walk
Enter the building |goto 48.44,63.83 < 5 |walk
Follow the path |goto 48.15,63.34 < 15 |walk
Enter the Blackrock Depths dungeon with your group |goto 48.08,62.41 < 7 |c |q 4241
|tip This quest requires you to progress through the Blackrock Depths dungeon.
|tip You will likely need a full group to complete the quest.
step
Inside the Blackrock Depths Dungeon:
kill High Interrogator Gerstahn##9018
|tip She is the fourth boss in the dungeon.
|tip Use the Dungeon guides to accomplish this.
collect Prison Cell Key##11140 |q 4241
|tip You need this key to unlock Marshal Windsor's cell door.
|tip If someone else in the group already has the key you can skip this step.
|tip A Rogue can also pick the lock.
step
Inside the Blackrock Depths Dungeon:
talk Marshal Windsor##9023
|tip He is in a prison cell inside the Detention Block.
|tip After entering the dungeon enter the first room and then take the third tunnel on the right.
|tip If you enter the Halls of the Law you went too far.
turnin Marshal Windsor##4241
accept Abandoned Hope##4242
step
Follow the path up |goto Burning Steppes/0 82.89,63.37 < 7 |only if walking
talk Marshal Maxwell##9560
turnin Abandoned Hope##4242 |goto 84.75,69.02
step
Reach level 50 |ding 50
|tip Use the Leveling guides to accomplish this.
step
Follow the path up |goto Searing Gorge 33.53,75.22 < 20 |only if walking
Enter Blackrock Mountain |goto Searing Gorge 34.76,83.98 < 7 |walk
Run down the chain |goto Eastern Kingdoms 48.73,63.79 < 5 |walk
Run down the stairs |goto 48.65,64.16 < 5 |walk
Continue down the stairs |goto 48.62,64.26 < 5 |q 4264 |future
|tip This quest requires you to progress through the Blackrock Depths dungeon.
|tip You will likely need a full group to complete the quest.
step
Run down the stairs |goto 48.62,64.11 < 7 |walk
Follow the path down |goto 48.68,64.07 < 7 |walk
Run down the chain |goto 48.58,64.09 < 5 |walk
Enter the building |goto 48.44,63.83 < 5 |walk
Follow the path |goto 48.15,63.34 < 15 |walk
Enter the Blackrock Depths dungeon with your group |goto 48.08,62.41 < 7 |q 4264 |future
|tip This quest requires you to progress through the Blackrock Depths dungeon.
|tip You will likely need a full group to complete the quest.
step
Inside the Blackrock Depths Dungeon:
Kill Anvilrage dwarves at the beginning of the dungeon
|tip Just clear the first few rooms of the dungeon, killing all the Anvilrage dwarves and resetting the instance if needed, until you get the item drop.
collect A Crumpled Up Note##11446 |condition itemcount(11446) == 1 or haveq(4264) or completedq(4264)
step
use A Crumpled Up Note##11446
accept A Crumpled Up Note##4264
step
Inside the Blackrock Depths Dungeon:
kill High Interrogator Gerstahn##9018
|tip She is the fourth boss in the dungeon.
|tip Use the Dungeon guides to accomplish this.
collect Prison Cell Key##11140 |q 4264
|tip You need this key to unlock Marshal Windsor's cell door.
|tip If someone else in the group already has the key you can skip this step.
|tip A Rogue can also pick the lock.
step
Inside the Blackrock Depths Dungeon:
talk Marshal Windsor##9023
|tip He is in a prison cell inside the Detention Block.
|tip After entering the dungeon enter the first room and then take the third tunnel on the right.
|tip If you enter the Halls of the Law you went too far.
turnin A Crumpled Up Note##4264
accept A Shred of Hope##4282
step
Inside the Blackrock Depths Dungeon:
kill General Angerforge##9033
|tip Use the Dungeon guides to accomplish this.
collect Marshal Windsor's Lost Information##11464 |q 4282/1
step
Inside the Blackrock Depths Dungeon:
kill Golem Lord Argelmach##8983
|tip Use the Dungeon guides to accomplish this.
collect Marshal Windsor's Lost Information##11465 |q 4282/2
step
Inside the Blackrock Depths Dungeon:
talk Marshal Windsor##9023
|tip He is in a prison cell inside the Detention Block.
|tip After entering the dungeon enter the first room and then take the third tunnel on the right.
|tip If you enter the Halls of the Law you went too far.
turnin A Shred of Hope##4282
|tip Make sure everyone turns this quest in before anyone accepts the next one.
|tip Accepting Jail Break! will start the escort quest and other party members will not be able to interact with Marshal Windsor.
accept Jail Break!##4322
step
Inside the Blackrock Depths Dungeon:
Follow and protect Marshal Windsor
|tip He will walk around the Detention Block and Halls of the Law, so clearing these beforehand can be helpful.
|tip There will be a few cells he will have you open. Sometimes you'll have to fight the prisoners or talk to a friendly NPC to free them.
|tip Eventually he will walk back to the dungeon entrance and escape.
Jail Break! |q 4322/1
step
Follow the path up |goto Burning Steppes/0 82.89,63.37 < 7 |only if walking
talk Marshal Maxwell##9560
turnin Jail Break!##4322 |goto 84.75,69.02
accept Stormwind Rendezvous##6402 |goto 84.75,69.02
step
talk Squire Rowe##17804 |goto Stormwind City 70.52,85.07
Tell him _"Let Marshal Windsor know that I am ready."_
|confirm |q 6402
step
talk Reginald Windsor##12580
turnin Stormwind Rendezvous##6402 |goto 73.58,91.04
accept The Great Masquerade##6403 |goto 73.58,91.04
step
Watch the dialogue
Follow Reginald Windsor through Stormwind |goto 72.27,47.65 < 10 |q 6403
step
talk Reginald Windsor##12580 |goto 72.27,47.65
Tell him _"I am ready, as are my forces. Let us end this masquerade!"_
|confirm |q 6403
step
Watch the dialogue
kill Onyxia's Elite Guard##12739+
|tip Inside the building.
Complete Reginald Windsor's March |q 6403/1 |goto 79.56,38.97
step
talk Highlord Bolvar Fordragon##1748
|tip Inside the building.
turnin The Great Masquerade##6403 |goto 79.76,38.92
accept The Dragon's Eye##6501 |goto 79.76,38.92
step
Follow the path up |goto Winterspring 59.30,43.21 < 10 |only if walking
Enter the cave |goto 57.15,49.93 < 7 |walk
Follow the path down |goto 54.65,49.94 < 10 |only if walking
Step onto the Blue Rune |goto 52.65,55.78
|tip Inside the cave.
Teleport to Haleh |goto 54.56,51.27 < 5 |noway |q 6501
step
talk Haleh##10929
turnin The Dragon's Eye##6501 |goto 54.55,51.20
accept Drakefire Amulet##6502 |goto 54.55,51.20
step
Follow the path up |goto Searing Gorge 33.53,75.22 < 20 |only if walking
Enter Blackrock Mountain |goto Searing Gorge 34.76,83.98 < 7 |walk
Run up the chain |goto Eastern Kingdoms 48.73,63.79 < 5 |walk
Jump down here |goto 48.77,63.67 < 5 |walk
Follow the path up |goto 48.83,63.66 < 5 |walk
Enter the building |goto 48.91,63.92 < 5 |walk
Enter the Blackrock Spire dungeon with your group |goto 48.95,63.88 < 7 |q 6502
|tip This quest requires you to progress through the Upper Blackrock Spire dungeon.
|tip You will likely need a 10 person raid group to complete the quest.
step
Inside the Upper Blackrock Spire Dungeon:
kill General Drakkisath##10363
|tip Use the Dungeon guides to accomplish this.
collect Blood of the Black Dragon Champion##16663 |q 6502/1
step
Follow the path up |goto Winterspring 59.30,43.21 < 10 |only if walking
Enter the cave |goto 57.15,49.93 < 7 |walk
Follow the path down |goto 54.65,49.94 < 10 |only if walking
Step onto the Blue Rune |goto 52.65,55.78
|tip Inside the cave.
Teleport to Haleh |goto 54.56,51.27 < 5 |noway |q 6502
step
talk Haleh##10929
turnin Drakefire Amulet##6502 |goto 54.55,51.20
|tip Completing this quest will award you with a Darkfire Amulet, which will allow you to enter the Onyxia's Lair raid.
|tip You must keep it in your inventory in order to enter the raid instance.
]])
ZygorGuidesViewer:RegisterGuide("Dungeon Guides\\Classic\\Raid Attunements\\Naxxramas Attunement",{
author="support@zygorguides.com",
description="This guide will walk you through becoming attuned for the Naxxramas raid.",
},[[
step
Reach level 60 |ding 60
|tip Use the Leveling guides to accomplish this.
step
talk Archmage Angela Dosantos##16116
|tip Inside the building.
accept The Dread Citadel - Naxxramas##9121 |goto Eastern Plaguelands 81.53,58.28 |only if rep("Argent Dawn") < Revered or completedq(9121)
accept The Dread Citadel - Naxxramas##9122 |goto Eastern Plaguelands 81.53,58.28 |only if rep("Argent Dawn") == Revered or completedq(9122)
accept The Dread Citadel - Naxxramas##9123 |goto Eastern Plaguelands 81.53,58.28 |only if rep("Argent Dawn") == Exalted or completedq(9123)
stickystart "Collect_Nexus_Crystals"
stickystart "Collect_1_Righteous_Orb"
stickystart "Reach_Honored_Reputation"
step
collect 5 Arcane Crystal##12363 |q 9121/1 |only if haveq(9121) or completedq(9121)
collect 3 Arcane Crystal##12363 |q 9122/1 |only if haveq(9122) or completedq(9122)
|tip Farm them from Rich Thorium Veins with Mining or purchase them from the Auction House.
step
label "Collect_Nexus_Crystals"
collect 2 Nexus Crystal##20725 |q 9121/2 |only if haveq(9121) or completedq(9121)
collect 1 Nexus Crystal##20725 |q 9122/2 |only if haveq(9122) or completedq(9122)
|tip Disenchant them from epic items with Enchanting or purchase them from the Auction House.
step
label "Collect_1_Righteous_Orb"
collect 1 Righteous Orb##12811 |q 9121/3
|tip Farm it from Crimson Elites in Western Plaguelands, Crimson mobs in Stratholme Live, or purchase it from the Auction House.
|only if haveq(9121) or completedq(9121)
step
label "Reach_Honored_Reputation"
Reach Honored Reputation with the Argent Dawn |q 9121/4
|only if haveq(9121) or completedq(9121)
step
talk Archmage Angela Dosantos##16116
|tip Inside the building.
turnin The Dread Citadel - Naxxramas##9121 |goto Eastern Plaguelands 81.53,58.28 |only if haveq(9121) or completedq(9121)
turnin The Dread Citadel - Naxxramas##9122 |goto Eastern Plaguelands 81.53,58.28 |only if haveq(9122) or completedq(9122)
turnin The Dread Citadel - Naxxramas##9123 |goto Eastern Plaguelands 81.53,58.28 |only if haveq(9123) or completedq(9123)
]])
ZygorGuidesViewer:RegisterGuide("Dungeon Guides\\The Burning Crusade\\Hellfire Ramparts (60-70)",{
author="support@zygorguides.com",
description="This guide will walk you through the Hellfire Ramparts dungeon.",
},[[
step
Follow the path |goto Hellfire Peninsula/0 48.85,55.53 < 15 |only if walking
Run into the portal |goto 47.60,53.59
Enter the Hellfire Ramparts Dungeon |goto Hellfire Ramparts/0 0.00,0.00 |c |noway
step
kill Watchkeeper Gargolmar##17306
|tip Either CC the Hellfire Watchers or kill them first.
|tip Interrupt "Heal" when cast by Hellfire Watchers.
|tip Dispel "Renew" from Watchkeeper Gargolmar or Hellfire Watchers.
|tip DPS should stack behind the boss and ranged should spread out to avoid extra "Surge" damage.
|tip While "Retalliation" is active on Gargolmar, do not melee attack him from the front.
Click Here to Continue |confirm
step
kill Omor the Unscarred##17308
|tip Avoid standing near allies if afflicted by "Treacherous Aura."
|tip Kill Fiendish Hounds quickly when they spawn.
|tip Avoid using cooldowns when Omor is at low health or "Demonic Shield" with reduce your damage.
Click Here to Continue |confirm
step
kill Vazruden##17537
|tip Quickly kill Vazruden when he reaches 50% health before Nazan lands.
|tip If Nazan lands, "Vazruden's Mark" will cause the target to gain threat until Vazruden dies.
kill Nazan##17536
|tip Nazan will fly around casting fireballs on the ground until Vazruden reaches 50% health.
|tip Avoid standing in fire patches throughout the fight.
|tip DPS and the healer should avoid standing in front of Nazan.
|tip "Bellowing Roar" will fear the entire party.
Click Here to Continue |confirm
]])
ZygorGuidesViewer:RegisterGuide("Dungeon Guides\\The Burning Crusade\\The Blood Furnace (61-70)",{
author="support@zygorguides.com",
description="This guide will walk you through the The Blood Furnace dungeon.",
},[[
step
Run up the stairs |goto Hellfire Peninsula/0 46.43,59.08 < 15 |only if walking
Follow the path |goto 47.30,55.65 < 15 |only if walking
Run into the portal |goto 45.97,51.86
Enter The Blood Furnace Dungeon |goto The Blood Furnace/0 0.00,0.00 |c |noway
step
kill The Maker##17381
|tip CC players mind controlled by "Domination."
|tip The tank might get controlled, so be prepared to deal with that for 10 seconds.
|tip Ranged should stay at maximum distance and spread out in case the tank gets controlled.
Click Here to Continue |confirm
step
kill Broggok##17380
|tip Pull the lever in the center of the room to free Broggok.
|tip Kill the 4 waves of enemies that attack from the corners.
|tip Minimized party damage to save on healer mana.
|tip Face Broggok away from the group to avoid excess "Slime Spray" damage.
|tip Move Broggok frequently to avoid accumulating "Poison Cloud" on the ground.
|tip Dispel "Poison Bolt" as frequently as possible to minimize tank damage.
Click Here to Continue |confirm
step
kill Keli'dan the Breaker##17377
|tip Kill the 5 Shadowmoon Channelers to free the Breaker.
|tip Dispel "Mark of Shadow" if possible to greatly reduce shadow damage taken.
|tip Ranged players can often avoid "Shadow Bolt Volley" damage by staying a max range.
|tip When the Breaker becomes invulnerable, run away from him before "Fire Nova" hits.
|tip On Heroic difficulty, players will be pulled to the Breaker during "Burning Nova."
Click Here to Continue |confirm
]])
ZygorGuidesViewer:RegisterGuide("Dungeon Guides\\The Burning Crusade\\The Slave Pens (62-70)",{
author="support@zygorguides.com",
description="This guide will walk you through the The Slave Pens dungeon.",
},[[
step
Swim into the underwater pipe |goto Zangarmarsh/0 50.39,40.84 < 15 |walk
Swim through the pipe |goto 51.41,39.40 < 10 |walk
Exit the pipe |goto 51.91,38.19 < 10 |walk
Run into the portal |goto 48.92,35.54
Enter The Slave Pens Dungeon |goto The Slave Pens/0 0.00,0.00 |c |noway
step
kill Mennu the Betrayer##17941
|tip Interrupt Mennu's "Lightning Bolt" whenever possible.
|tip Killing totems is the top priority.
|tip Do not kill "Corrupted Nova Totem" or it will explode.
|tip It will also explode when it expires, so move away from it.
|tip The Healing Ward can quickly replenish Mennu's health.
|tip The Tainted Stoneskin Totem will reduce physical damage dealt to Mennu.
|tip The Tainted Earthgrab Totem will root party members randomly.
Click Here to Continue |confirm
step
kill Rokmar the Crackler##17991
|tip Heal the target of "Grievous Wound" to remove the debuff.
|tip "Ensnaring Moss" reduces movement and casting speed by 50% for the duration.
|tip Use cooldowns during "Enrage" to reduce stress on the healer.
|tip If the healer is afflicted with "Ensnaring Moss," use cooldowns to survive.
Click Here to Continue |confirm
step
kill Quagmirran##17942
|tip Saving the druid in the cage before Quagmirran will allow you to talk to him for a nature buff.
|tip Face Quagmirran away from the group at all times.
|tip Spread out at max range within range of the healer to minimize "Acid Spray" damage.
|tip When targeted by "Acid Spray," use an invulnerability or feign-type ability if you have one.
|tip Taunt during "Acid Spray" to take a few ticks of the damage as a tank.
|tip Cleanse poison debuffs as quickly as possible to minimize damage.
Click Here to Continue |confirm
]])
ZygorGuidesViewer:RegisterGuide("Dungeon Guides\\The Burning Crusade\\The Underbog (63-70)",{
author="support@zygorguides.com",
description="This guide will walk you through the The Underbog dungeon.",
},[[
step
Swim into the underwater pipe |goto Zangarmarsh/0 50.39,40.84 < 15 |walk
Swim through the pipe |goto 51.41,39.40 < 10 |walk
Exit the pipe |goto 51.91,38.19 < 10 |walk
Run into the portal |goto 54.31,34.41
Enter The Underbog Dungeon |goto The Underbog/0 0.00,0.00 |c |noway
step
kill Hungarfen##17770
|tip Low DPS melee players should move away from Hungarfen when he casts "Foul Spores."
|tip Avoid standing near mushrooms that spawn throughout the fight.
|tip Periodically move Hungarfen to avoid forcing DPS to stand near spawning mushrooms.
Click Here to Continue |confirm
step
kill Ghaz'an##18105
|tip The tank should position Ghaz'an so the party can stand to the sides.
|tip Healers and DPS should not stand in front or behind the boss.
|tip Heavy healing is required for the duration of this fight.
|tip During "Enrage," significant party damage is possible.
Click Here to Continue |confirm
step
kill Swamplord Musel'ek##17826
|tip If everyone stacks on the boss, Claw will not use the "Feral Charge" ability.
|tip Someone will randomly be frozen and targeted by "Aimed Shot."
|tip Everyone should quickly stack on him again to avoid his ranged abilities.
Click Here to Continue |confirm
step
kill The Black Stalker##17882
|tip Spread out to avoid chaining damage from "Static Charge" and "Chain Lightning."
|tip Skill Spore Striders quickly.
|tip The Black Stalker will randomly "Levitate" someone in the air for a short period of time.
Click Here to Continue |confirm
]])
ZygorGuidesViewer:RegisterGuide("Dungeon Guides\\The Burning Crusade\\Mana-Tombs (64-70)",{
author="support@zygorguides.com",
description="This guide will walk you through the Mana-Tombs dungeon.",
},[[
step
Enter the building |goto Terokkar Forest/0 39.63,60.10 < 20 |walk
Run into the portal |goto 39.64,57.58
Enter the Mana-Tombs Dungeon |goto Mana-Tombs/0 0.00,0.00 |c |noway
step
kill Pandemonius##18341
|tip Shadow resistance helps with this fights.
|tip During "Dark Shell," all DPS needs to stop attacking until it expires.
|tip This fight is very intense for healers.
|tip If you have a Shaman, drop "Grounding Totem" during "Void Blast" to absorb the blasts.
|tip Otherwise, during "Void Blast," put your back against something to avoid being thrown too far.
Click Here to Continue |confirm
step
kill Tavarok##18343
|tip Stay at max range unless you are melee to avoid damage from "Earthquake."
|tip Heal the target of "Crystal Prison" quickly.
|tip Watch your threat, the tank will be frequently stunned.
|tip Avoid standing in front of Tavarok unless you are the tank.
Click Here to Continue |confirm
step
kill Nexus-Prince Shaffar##18344
|tip Shaffar will periodically "Blink" to a random location and freeze players.
|tip Dispelling the tank is a priority so they can pick up Shaffar quickly after a "Blink."
|tip DPS should quickly kill Ethereal Beacons before they can transform into Ethereal Apprentices.
Click Here to Continue |confirm
]])
ZygorGuidesViewer:RegisterGuide("Dungeon Guides\\The Burning Crusade\\Auchenai Crypts (65-70)",{
author="support@zygorguides.com",
description="This guide will walk you through the Auchenai Crypts dungeon.",
},[[
step
Enter the building |goto Terokkar Forest/0 36.01,65.62 < 20 |walk
Run into the portal |goto 34.25,65.60
Enter the Auchenai Crypts Dungeon |goto Auchenai Crypts/0 0.00,0.00 |c |noway
step
kill Shirrak the Dead Watcher##18371
|tip If you are targeted by "Focus Fire," move out of it immediately or you will die.
|tip "Inhibit Magic" will slow the casting speed of anyone debuffed.
|tip It's possible to LoS the debuff so it cannot be applied.
|tip Try to tank Shirrak so the healer is out of LoS of the boss but not the tank.
|tip Kill the boss quickly before "Carnivorous Bite" can stack too high on melee players.
Click Here to Continue |confirm
step
kill Exarch Maladaar##18373
|tip Tank the boss away from ranged players.
|tip Focus down shadow images quickly as they spawn.
|tip The tank should pick up Avatar of the Martyred when it spawns.
|tip "Soul Scream" will briefly disorient anyone near Maladaar.
Click Here to Continue |confirm
]])
ZygorGuidesViewer:RegisterGuide("Dungeon Guides\\The Burning Crusade\\Sethekk Halls (67-70)",{
author="support@zygorguides.com",
description="This guide will walk you through the Sethekk Halls dungeon.",
},[[
step
Enter the building |goto Terokkar Forest/0 43.27,65.59 < 20 |walk
Run into the portal |goto 44.98,65.61
Enter the Sethekk Halls Dungeon |goto Sethekk Halls/0 0.00,0.00 |c |noway
step
kill Darkweaver Syth##18472
|tip The best way to kill Syth is to CC any adds that spawn and nuke him down quickly.
|tip If your DPS is low, kill the adds quickly as they spawn.
|tip Interrupt whenever possible.
|tip Spread out to avoid chaining damage from "Chain Lightning."
Click Here to Continue |confirm
step
kill Talon King Ikiss##18473
|tip Every 25% health, Ikiss will begin casting "Arcane Explosion."
|tip Run behind a pillar quickly to avoid taking fatal damage.
|tip Dispel "Slow" and "Polymorph" quickly throughout the fight.
|tip "Arcane Volley" will deal constant damage to the group.
|tip This fight is difficult for healers, so use cooldowns if needed.
Click Here to Continue |confirm
]])
ZygorGuidesViewer:RegisterGuide("Dungeon Guides\\The Burning Crusade\\Old Hillsbrad Foothills (66-70)",{
author="support@zygorguides.com",
description="This guide will walk you through the Old Hillsbrad Foothills dungeon.",
},[[
step
Run into the portal |goto Tanaris/0 55.54,53.22
Enter the Old Hillsbrad Foothills Dungeon |goto Old Hillsbrad Foothills/0 0.00,0.00 |c |noway
step
kill Lieutenant Drake##17848
|tip Drake can do high burst damage when several ability hit in sequence.
|tip "Exploding Shot" will deal damage and stun a player for 6 seconds.
|tip "Frightening Shout" will fear anyone within 10 yards.
|tip "Whirlwind" will deal damage to anyone nearby.
|tip "Mortal Strike" will make it more difficult to heal the tank.
Click Here to Continue |confirm
step
kill Captain Skarloc##17862
|tip Kill the Warden quickly, to eliminate its fear and heal.
|tip Kill the Veteran second.
|tip Dispel "Hammer of Justice" from the tank whenever possible.
|tip Move the boss out of "Consecration" to avoid excess group damage.
Click Here to Continue |confirm
step
kill Epoch Hunter##18096
|tip Three waves of Infinite enemies will spawn before Epoch Hunter.
|tip After killing all 3 waves, you should be able to eat and drink briefly.
|tip Tank Epoch Hunter with you back to the wall to avoid the knockback.
|tip "Magic Disruption Aura" will constantly dispel magic on the group.
|tip If you have a Paladin tank, watch your threat.
|tip Avoid facing the boss towards the group.
Click Here to Continue |confirm
]])
ZygorGuidesViewer:RegisterGuide("Dungeon Guides\\The Burning Crusade\\The Black Morass (68-70)",{
author="support@zygorguides.com",
description="This guide will walk you through the The Black Morass dungeon.",
},[[
step
Run into the portal |goto Tanaris/0 57.09,63.16
Enter The Black Morass Dungeon |goto The Black Morass/0 0.00,0.00 |c |noway
step
kill Chrono Lord Deja##17879
|tip Major cooldowns should be used for this fight.
|tip Focus on killing the boss quickly before cleaning up adds.
|tip The tank will take heavy damage during this fight.
|tip "Arcane Discharge" will deal AoE damage to melee players periodically.
Click Here to Continue |confirm
step
kill Temporus##17880
|tip Dispel "Hasten" from Temporus whenever possible.
|tip Tank the boss so you won't get knocked back too far.
|tip Casters should avoid attacking while "Spell Reflection" is active on the boss.
|tip "Mortal Wound" is a stacking debuff that reducing healing on the tank.
|tip Kill the boss quickly before "Mortal Wound" stacks too high on the tank.
Click Here to Continue |confirm
step
kill Aeonus##17881
|tip Face Aeonus away from the group at all times.
|tip Use "Tranquilizing Shot" to remove "Enrage" if you have a hunter.
|tip "Time Stop" will constantly stun the group thoughout the fight.
|tip Keep the tank topped off as much as possible.
Click Here to Continue |confirm
]])
ZygorGuidesViewer:RegisterGuide("Dungeon Guides\\The Burning Crusade\\The Mechanar (70)",{
author="support@zygorguides.com",
description="This guide will walk you through the The Mechanar dungeon.",
},[[
step
Run into the portal |goto Netherstorm/0 70.66,69.84
|tip On the floating island.
Enter The Mechanar Dungeon |goto The Mechanar/0 0.00,0.00 |c |noway
step
kill Mechano-Lord Capacitus##19219
|tip Kill the Gatewatchers before engaging Capacitus.
|tip Stay spread out and avoid Netherbombs.
|tip On Normal difficulty, melee should stop attacking during "Reflective Damage Shield."
|tip On Normal difficulty, casters should stop attacking during "Reflective Magic Shield."
|tip On Heroic difficulty, players will be affected with polarity instead.
|tip Party members should move near the same polarity and away from the opposite polarity.
Click Here to Continue |confirm
step
kill Nethermancer Sepethrea##19221
|tip On Normal difficulty, 2 Raging Flames will be summoned.
|tip On Heroic difficulty, 3 Raging Flames will be summoned.
|tip Raging flames will fixate on random players and deal AoE damage.
|tip Run away if fixated and move the boss to safe areas when needed.
|tip When "Dragon's Breath" is used, Sepethrea will ignore the tank until dispelled or it expires.
|tip "Arcane Blast" can knock you into Raging Flames.
|tip Interrupt whenever possible and keep moving.
Click Here to Continue |confirm
step
kill Pathaleon the Calculator##19220
|tip Casters should stay at max range constantly to avoid being silenced.
|tip The tank should pick up Nether Wraiths quickly.
|tip Kill the wraiths quickly if your group has low DPS.
|tip Players will be randomly mind controlled throughout the fight.
|tip Use CC on controlled players.
|tip Be prepared for the boss to "Enrage" and deal extra damage.
Click Here to Continue |confirm
]])
ZygorGuidesViewer:RegisterGuide("Dungeon Guides\\The Burning Crusade\\The Shattered Halls (70)",{
author="support@zygorguides.com",
description="This guide will walk you through the The Shattered Halls dungeon.",
},[[
step
Follow the path |goto Hellfire Peninsula/0 48.85,55.53 < 15 |only if walking
Rup up the ramp |goto 48.56,52.01 < 15 |only if walking
Run into the portal |goto 47.48,52.02
|tip You will need the Shattered Halls Key to enter this dungeon.
Enter The Shattered Halls Dungeon |goto The Shattered Halls/0 0.00,0.00 |c |noway
step
kill Grand Warlock Nethekurse##16807
|tip Move out of fissures on the ground quickly to avoid damage.
|tip Save cooldowns for the "Dark Spin" ability to reduce group damage.
|tip DPS should avoid standing in front of the boss.
Click Here to Continue |confirm
step
kill Blood Guard Porung##20923
|tip Porung is only on Heroic Difficulty.
|tip Dodge arrows while picking up mobs and killing them along the gauntlet.
|tip Face Porung away from the group.
|tip Kill or CC the 2 archers that come with him.
Click Here to Continue |confirm
step
kill Warbringer O'mrogg##16809
|tip Check the area around O'mrogg for assassins and kill the two Champions first.
|tip "Fear" will fear the entire group for 6 seconds.
|tip When O'mrogg turns red, he will reset threat and target a random player.
|tip The player should kite him until the tank can generate enough threat.
|tip Taunts to do not work.
|tip "Blast Wave" will deal fire damage to anyone nearby and slow them.
|tip Extra healing will be required during "Burning Maul."
|tip "Burning Maul" will also deal splash damage to nearby players.
Click Here to Continue |confirm
step
kill Warchief Kargath Bladefist##16808
|tip Move as a group to engage the boss.
|tip Spread out as much as possible to minimize AoE damage.
|tip CC or tank adds that spawn and keep focusing on the boss.
|tip Reaver Guards have a cleave and knockback.
|tip Sharpshooter Guards have a 4 second range disorient.
|tip Prepare for heavy group damage during "Blade Dance."
Click Here to Continue |confirm
]])
ZygorGuidesViewer:RegisterGuide("Dungeon Guides\\The Burning Crusade\\The Steamvault (70)",{
author="support@zygorguides.com",
description="This guide will walk you through the The Steamvault dungeon.",
},[[
step
Swim into the underwater pipe |goto Zangarmarsh/0 50.39,40.84 < 15 |walk
Swim through the pipe |goto 51.41,39.40 < 10 |walk
Exit the pipe |goto 51.91,38.19 < 10 |walk
Run into the portal |goto 50.28,33.32
Enter The Steamvault Dungeon |goto The Steamvault/0 0.00,0.00 |c |noway
step
kill Hydromancer Thespia##17797
|tip Move out of "Lightning Cloud" quickly.
|tip Cleanse "Lung Burst" and "Enveloping Winds" immediately when possible.
|tip "Enveloping Winds" stuns the target for up to 10 seconds.
|tip Kill water elementals first and quickly.
|tip CC one elemental first if possible.
Click Here to Continue |confirm
step
kill Mekgineer Steamrigger##17796
|tip Kill adds quickly.
|tip Damage any adds casting "Repair" immediately to interrupt it.
|tip Keep healing reduction abilities on the boss when possible.
|tip "Electrified Net" will root a player for 10 seconds and deal nature damage.
Click Here to Continue |confirm
step
kill Warlord Kalithresh##17798
|tip Tank the boss near a Naga Distiller frequently to avoid a lot of movement.
|tip Kill the distiller quickly when it activates to remove "Warlord's Rage."
|tip During "Spell Reflection," casters should stop attacking.
|tip Targets afflicted by "Impale" will bleed for 12 seconds.
Click Here to Continue |confirm
]])
ZygorGuidesViewer:RegisterGuide("Dungeon Guides\\The Burning Crusade\\Shadow Labyrinth (70)",{
author="support@zygorguides.com",
description="This guide will walk you through the Shadow Labyrinth dungeon.",
},[[
step
Enter the building |goto Terokkar Forest/0 39.64,70.98 < 20 |walk
|tip You need the Shadow Labyrinth Key to open the door.
Run into the portal |goto 39.63,73.60
Enter the Shadow Labyrinth Dungeon |goto Shadow Labyrinth/0 0.00,0.00 |c |noway
step
kill Ambassador Hellmaw##18731
|tip Face Hellmaw away from the group.
|tip Keep the tank topped off before "Fear" is cast.
Click Here to Continue |confirm
step
kill Blackheart the Inciter##18667
|tip Keep everyone topped off as much as possible for "Incite Chaos."
|tip "Incite Chaos" mind controls the entire group and makes them attack randomly.
|tip A mind control will occur after every odd "War Stomp."
|tip Stamina and PvP gear is very helpful for surviving the mind control during this fight.
|tip "War Stomp" will knock everyone back.
Click Here to Continue |confirm
step
kill Grandmaster Vorpil##18732
|tip Kill the voidwalkers that spawn during the fight before they can reach Vorpil.
|tip When Vorpil pulls everyone in, run out of the "Rain of Fire" that follows.
|tip Vorpil will randomly "Banish" a player, taking them out of the fight for 8 seconds.
|tip "Shadow Bolt Volley" deals moderate shadow damage to the entire group.
Click Here to Continue |confirm
step
kill Murmur##18708
|tip Murmur has a very very small aggro radius, so you can get really close.
|tip If someone isn't in melee range, Murmur will start dealing heavy damage to the group.
|tip When "Sonic Boom" is cast, run away from the boss unless you are the tank.
|tip Top the tank off when Murmur casts this by emoting "Murmur draws energy from the air..."
|tip "Magnetic Pull" will draw an player in close.
|tip When affected by "Murmur's Touch," move away from other players.
]])
ZygorGuidesViewer:RegisterGuide("Dungeon Guides\\The Burning Crusade\\The Arcatraz (70)",{
author="support@zygorguides.com",
description="This guide will walk you through the The Arcatraz dungeon.",
},[[
step
Run into the portal |goto Netherstorm/0 74.49,57.68
|tip On the floating island.
Enter The Arcatraz Dungeon |goto The Arcatraz/0 0.00,0.00 |c |noway
step
kill Zereketh the Unbound##20870
|tip Spread out to avoid "Seed of Corruption" AoE damage.
|tip Move out of "Void Zone" on the ground quickly.
|tip Tank with your back against the wall to avoid the "Shadow Nova" knockback.
|tip "Shadow Nova" can be outranged on Normal difficulty, but not on Heroic.
Click Here to Continue |confirm
step
kill Dalliah the Doomsayer##20885
|tip Move out of melee range during "Whirlwind."
|tip Interrupt the "Heal" that immediately follows every "Whirlwind."
|tip Avoid healing the player debuffed with "Gift of the Doomsayer."
|tip Because of this, keep the tank topped off as often as possible.
Click Here to Continue |confirm
step
kill Wrath-Scryer Soccothrates##20886
|tip Tank him away from the group with your back against a wall.
|tip After every "Knock Away," a charge will follow.
|tip A line of "Felfire" will be left on the ground in the charge line.
|tip Avoid standing in the fire.
|tip Perodic fire damage will hit the group.
Click Here to Continue |confirm
step
kill Harbinger Skyriss##20912
|tip Four prison cells must be opened and defeated first.
|tip Defeat the enemies that spawn before Skyriss, and be prepared to put a mark on him when he spawns.
|tip CC mind controlled party members whenever possible.
|tip Every 33% health Skyriss will split into 3 images.
|tip If you have good DPS you can ignore illusions and burn down Skyriss.
|tip Otherwise, kill at least one when they spawn before focusing DPS on Skyriss again.
|tip A single player taking 2 "Mind Rend" abilities at once will take significant damage.
|tip "Mana Burn" is cast occasionally throughout the fight.
Click Here to Continue |confirm
]])
ZygorGuidesViewer:RegisterGuide("Dungeon Guides\\The Burning Crusade\\The Botanica (70)",{
author="support@zygorguides.com",
description="This guide will walk you through the The Botanica dungeon.",
},[[
step
Run into the portal |goto Netherstorm/0 71.77,54.92
|tip On the floating island.
Enter The Botanica Dungeon |goto The Botanica/0 0.00,0.00 |c |noway
step
kill Commander Sarannis##17976
|tip Dispel "Arcane Resonance" from the tank whenever possible.
|tip Let the tank pick up the adds when the spawn.
|tip Interrupt the Bloodwarder Mender's heal on cooldown.
Click Here to Continue |confirm
step
kill High Botanist Freywinn##17975
|tip Kill the summoned adds quickly.
|tip If a "Tree Form" is cast, kill the 3 Frayer Protectors to remove the immunity.
|tip Interrupt "Tranquility" after removing the immunity quickly.
Click Here to Continue |confirm
step
kill Thorngrin the Tender##17978
|tip Move away from the boss during "Hellfire."
|tip Heal players afflicted by "Sacrifice" quickly.
|tip Pull the boss to an open area to avoid stacking these abilities.
Click Here to Continue |confirm
step
kill Laj##17980
|tip Dispel "Allergic Reaction" as quickly as possible.
|tip Casters should avoid using spells matching the current shield.
|tip White is the arcane shield.
|tip Red is the fire shield.
|tip Blue is the frost shield.
|tip Green is the nature shield.
|tip Black is the shadow shield.
|tip Kill the summoned adds unless you have really good DPS.
Click Here to Continue |confirm
step
kill Warp Splinter##17977
|tip Ranged players should stay at max range to avoid the damage and stun of "Stomp."
|tip "Stomp" will also increase physical damage taken.
|tip Watch your threat and try to keep the tank topped off for stuns.
|tip Keep a healing reduction ability on the boss if possible.
|tip It's best to ignore the small adds and focus on burning down the boss.
|tip "Arcane Volley" will do frequent damage to the entire group.
Click Here to Continue |confirm
]])
ZygorGuidesViewer:RegisterGuide("Dungeon Guides\\The Burning Crusade\\Magisters' Terrace (70)",{
author="support@zygorguides.com",
description="This guide will walk you through the Magisters' Terrace dungeon.",
},[[
step
Run into the portal |goto Isle of Quel'Danas/0 61.27,30.93
Enter the Magisters' Terrace Dungeon |goto Magisters' Terrace/1 0.00,0.00 |c |noway
step
kill Selin Fireheart##24723
|tip Fireheart will drain a player's health, restoring his own.
|tip Fireheart will drain mana from a player. |only if heroic_dung()
|tip Fel Explosion deals AoE fire damage and drains Selin's mana.
|tip Fel Crystal restores his mana as long as it remains alive.
|tip Kill these quickly when they activate.
Click Here to Continue |confirm
step
kill Vexallus##24744
|tip Chain Lightning deals nature damage to up to 3 targets. Spread out.
|tip At 20% health, Overload deals AoE damage and increases party damage taken.
|tip Every 15% health a Pure Energy is summoned. These will leave a DoT on all players upon death and increase damage by 50%.
|tip Two Pure Energies are summoned. |only if heroic_dung()
Click Here to Continue |confirm
step
kill Priestess Delrissa##24560
|tip Dispel Renew and Power Word: Shield from Delrissa.
|tip Interrupt Flash Heal every time.
|tip She will cast Psychic Scream, which is a 5 second melee range fear.
|tip Use CC, interrupt fears and heals.
|tip Dispel CC on party members quickly.
|tip Focus 1 target at a time.
Click Here to Continue |confirm
step
kill Kael'thas Sunstrider##24664
|tip Interrupt Fireball.
|tip Phoenix Egg spawns when a Phoenix dies and should be killed within 15 seconds.
|tip Shock Barrier makes Kael'thas immune to interrupts while in effect. |only if heroic_dung()
|tip Pyroblast deals massive damage and follows Shock Barrier. |only if heroic_dung()
|tip Burn through the barrier and interrupt this. |only if heroic_dung()
|tip At 50% health, Gravity Lapse phase begins and everyone "swims" through the air.
|tip Arcane Spheres follow random players and must be avoided.
|tip Every 30 seconds, Kael'thas takes 50% more damage for 10 seconds.
Click Here to Continue |confirm
]])
ZGV.BETASTART()
ZygorGuidesViewer:RegisterGuide("Dungeon Guides\\The Burning Crusade\\The Slave Pens Quests",{
author="support@zygorguides.com",
description="This guide will walk you through completing the quests for The Slave Pens dungeon.",
},[[
step
Reach Level 62 |ding 62
|tip Use the Leveling guides to accomplish this.
step
Swim down into the pipe |goto Zangarmarsh/0 50.37,40.92 < 7 |walk
Swim through the pipe |goto 51.26,39.56 < 10 |walk
talk Watcher Jhang##17884
accept Lost in Action##9738 |goto 52.28,35.98
step
Run into the portal |goto 48.92,35.54
Enter The Slave Pens Dungeon |goto The Slave Pens/0 0.00,0.00 |c |noway |q 9738
step
Inside The Slave Pens Dungeon:
talk Naturalist Bite##17893
|tip He is located near the beginning of the dungeon, up the large ramp after you jump down into the water.
Discover Naturalist Bite |q 9738/2
step
Inside The Slave Pens Dungeon:
talk Weeder Greenthumb##17890
|tip He is on the ground to the left side of the room with Quagmirran.
|tip Quagmirran is the last boss of the instance.
Discover Weeder Greenthumb |q 9738/3
step
Leave The Slave Pens Dungeon |goto The Slave Pens/0 0.00,0.00 > 10 |c |noway |q 9738
step
Run into the portal |goto Zangarmarsh/0 54.31,34.41
Enter The Underbog Dungeon |goto The Underbog/0 0.00,0.00 |c |noway |q 9738
step
Inside The Underbog Dungeon:
kill Ghaz'an##18105
|tip It is the second boss of the instance.
talk Earthbinder Rayge##17885
|tip He is located in a room after Ghaz'an.
|tip After defeating Ghaz'an swim across the water and jump down to the ground below.
|tip Follow the path to the left to find him stealthed up ahead.
Discover Earthbinder Rayge |q 9738/1
step
Inside The Underbog Dungeon:
kill Swamplord Musel'ek##17826
|tip He is the third boss of the instance.
talk Windcaller Claw##17894
|tip He is inside a cage near Swamplord Musel'ek.
Discover Windcaller Claw |q 9738/4
step
Leave The Underbog Dungeon |goto The Underbog/0 0.00,0.00 > 10 |c |noway |q 9738
step
Swim down into the pipe |goto Zangarmarsh/0 50.37,40.92 < 7 |walk
Swim through the pipe |goto 51.26,39.56 < 10 |walk
talk Watcher Jhang##17884
turnin Lost in Action##9738 |goto 52.28,35.98
]])
ZygorGuidesViewer:RegisterGuide("Dungeon Guides\\The Burning Crusade\\The Underbog Quests",{
author="support@zygorguides.com",
description="This guide will walk you through completing the quests for The Underbog dungeon.",
},[[
step
Reach Level 63 |ding 63
|tip Use the Leveling guides to accomplish this.
step
Reach Friendly Reputation with Sporeggar |complete rep("Sporeggar") >= Friendly
|tip Use the "Sporeggar" reputation guide to accomplish this.
step
talk Gzhun'tt##17856
accept Bring Me A Shrubbery!##9715 |goto Zangarmarsh/0 19.54,50.04
step
talk T'shu##17857
accept Oh, It's On!##9717 |goto 19.37,49.78
step
talk Khn'nix##17866
|tip Inside the building.
accept Stalk the Stalker##9719 |goto 19.65,49.70
step
Swim down into the pipe |goto 50.37,40.92 < 7 |walk
Swim through the pipe |goto 51.26,39.56 < 10 |walk
talk Watcher Jhang##17884
accept Lost in Action##9738 |goto 52.28,35.98
step
Run into the portal |goto 54.31,34.41
Enter The Underbog Dungeon |goto The Underbog/0 0.00,0.00 |c |noway |q 9738
stickystart "Collect_Sanguine_Hibiscus"
step
Inside The Underbog Dungeon:
kill Hungarfen##17770
|tip It is the first boss in the instance.
|tip After defeating him look toward the bridge and you should see a large sparkling thorny plant.
click The Underspore##182054
collect 1 Underspore Frond##24247 |q 9717/1
step
Inside The Underbog Dungeon:
kill Ghaz'an##18105
|tip It is the second boss of the instance.
talk Earthbinder Rayge##17885
|tip He is located in a room after Ghaz'an.
|tip After defeating Ghaz'an swim across the water and jump down to the ground below.
|tip Follow the path to the left to find him stealthed up ahead.
Discover Earthbinder Rayge |q 9738/1
step
Inside The Underbog Dungeon:
kill Swamplord Musel'ek##17826
|tip He is the third boss of the instance.
talk Windcaller Claw##17894
|tip He is inside a cage near Swamplord Musel'ek.
Discover Windcaller Claw |q 9738/4
step
Inside The Underbog Dungeon:
kill The Black Stalker##17882
|tip It is the last boss of the instance.
collect 1 Brain of the Black Stalker##24248 |q 9719/1
step
label "Collect_Sanguine_Hibiscus"
Inside The Underbog Dungeon:
Kill enemies throughout the dungeon
collect 5 Sanguine Hibiscus##24246 |q 9715/1
step
Leave The Underbog Dungeon |goto The Underbog/0 0.00,0.00 > 10 |c |noway |q 9738
step
talk Gzhun'tt##17856
turnin Bring Me A Shrubbery!##9715 |goto Zangarmarsh/0 19.54,50.04
step
talk T'shu##17857
turnin Oh, It's On!##9717 |goto 19.37,49.78
step
talk Khn'nix##17866
|tip Inside the building.
turnin Stalk the Stalker##9719 |goto 19.65,49.70
step
Swim into the underwater pipe |goto Zangarmarsh/0 50.39,40.84 < 15 |walk
Swim through the pipe |goto 51.41,39.40 < 10 |walk
Exit the pipe |goto 51.91,38.19 < 10 |walk
Run into the portal |goto 48.92,35.54 < 10 |walk
Enter The Slave Pens Dungeon |goto The Slave Pens/0 0.00,0.00 |c |noway |q 9738
step
Inside The Slave Pens Dungeon:
talk Naturalist Bite##17893
|tip He is located near the beginning of the dungeon, up the large ramp after you jump down into the water.
|tip Use "The Slave Pens" dungeon guide to accomplish this.
Discover Naturalist Bite |q 9738/2
step
Inside The Slave Pens Dungeon:
talk Weeder Greenthumb##17890
|tip He is on the ground to the left side of the room with Quagmirran.
|tip Quagmirran is the last boss of the instance.
|tip Use "The Slave Pens" dungeon guide to accomplish this.
Discover Weeder Greenthumb |q 9738/3
step
Leave The Slave Pens Dungeon |goto The Slave Pens/0 0.00,0.00 > 10 |c |noway |q 9738
step
Swim down into the pipe |goto Zangarmarsh/0 50.37,40.92 < 7 |walk
Swim through the pipe |goto 51.26,39.56 < 10 |walk
talk Watcher Jhang##17884
turnin Lost in Action##9738 |goto 52.29,35.98
]])
ZygorGuidesViewer:RegisterGuide("Dungeon Guides\\The Burning Crusade\\Mana-Tombs Quests",{
author="support@zygorguides.com",
description="This guide will walk you through completing the quest for the Mana-Tombs dungeon.",
},[[
step
Reach Level 64 |ding 64
|tip Use the Leveling guides to accomplish this.
step
Enter the building |goto Terokkar Forest/0 39.62,60.47 < 10 |walk
talk Artificer Morphalius##19670
|tip Inside the building on the lower level of the Ring of Observance.
accept Safety Is Job One##10216 |goto 39.42,58.51
step
talk Nexus-Prince Haramad##19674
|tip Inside the building on the lower level of the Ring of Observance.
accept Undercutting the Competition##10165 |goto 39.37,58.48
step
Run into the portal |goto 39.64,57.58 < 10 |walk
Enter the Mana-Tombs Dungeon |goto Mana-Tombs/0 0.00,0.00 |c |noway |q 10165
stickystart "Kill_Ethereal_Crypt_Raiders"
stickystart "Kill_Nexus_Stalkers"
stickystart "Kill_Ethereal Sorcerers"
stickystart "Kill_Ethereal_Spellbinders"
step
Inside the Mana-Tombs Dungeon:
kill Nexus-Prince Shaffar##18344
|tip He is the last boss of the instance.
collect 1 Shaffar's Wrappings##28490 |q 10165/1
step
Inside the Mana-Tombs Dungeon:
talk Cryo-Engineer Sha'heen##19671
accept Someone Else's Hard Work Pays Off##10218
|tip Clearing the instance of enemies before attempting this quest is recommended.
step
Inside the Mana-Tombs Dungeon:
Follow and protect Cryo-Engineer Sha'heen
|tip Clearing the instance of enemies before attempting this quest is recommended.
Escort Cryo-Engineer Sha'heen |q 10218/1
step
label "Kill_Ethereal_Crypt_Raiders"
Inside the Mana-Tombs Dungeon:
kill 10 Ethereal Crypt Raider##18311 |q 10216/1
step
label "Kill_Nexus_Stalkers"
Inside the Mana-Tombs Dungeon:
kill 5 Nexus Stalker##18314 |q 10216/2
step
label "Kill_Ethereal Sorcerers"
Inside the Mana-Tombs Dungeon:
kill 5 Ethereal Sorcerer##18313 |q 10216/3
step
label "Kill_Ethereal_Spellbinders"
Inside the Mana-Tombs Dungeon:
kill 5 Ethereal Spellbinder##18312 |q 10216/4
step
Inside the Mana-Tombs Dungeon:
|tip After killing Nexus-Prince Shaffar go backwards through the dungeon.
|tip Return left down the hallway and it will be on your left in the first circular room.
click Ethereal Transporter Control Panel##183877
|tip It looks like a floating rotating cube device.
|tip It is found in he northwestern corner the first circular room.
turnin Safety Is Job One##10216
step
Leave the Mana-Tombs Dungeon |goto Mana-Tombs/0 0.00,0.00 > 10 |c |noway |q 10165
step
talk Nexus-Prince Haramad##19674
|tip Inside the building on the lower level of the Ring of Observance.
turnin Undercutting the Competition##10165 |goto Terokkar Forest/0 39.37,58.48
turnin Someone Else's Hard Work Pays Off##10218 |goto 39.37,58.48
step
Reach Level 70 |ding 70
step
Reach Honored with The Consortium |complete rep("The Consortium") >= Honored
|tip Turn in Zaxxis Insignias at area 52 or Obsidian Warbeads in Nagrand to accomplish this.
step
talk Protectorate Advisor Rahim##22899
|tip Inside the building.
accept Seek Out Ameer##10969 |goto Netherstorm/0 45.8,36.2
step
talk Commander Ameer##20448
turnin Seek Out Ameer##10969 |goto 59.4,32.4
accept A Mission of Mercy##10970 |goto 59.4,32.4
step
Kill enemies around this area
collect Salvaged Ethereum Prison Key##31956 |q 10970/1 |goto 28.79,77.43
You can find more around here [57.2,36.8]
step
Kill Ethereum enemies around this area
kill Ethereum Gladiator##20854
|tip They will shout "Time for the pain!" when spawning.
talk Captured Protectorate Vanguard##20763
accept Escape from the Staging Grounds##10425 |goto Netherstorm/0 57.06,37.68
step
Follow the Captured Protectorate Vanguard
|tip Kill enemies that attack.
Escort the Captured Protectorate Vanguard |q 10425/1 |goto 59.4,32.4
step
talk Commander Ameer##20448
turnin A Mission of Mercy##10970 |goto 59.4,32.4
turnin Escape from the Staging Grounds##10425 |goto 59.4,32.4
accept Ethereum Secrets##10971 |goto 59.4,32.4
step
Kill enemies around this area
collect Ethereum Prison Key##29460 |n
|tip You can also get this from completing daily dungeon quests.
click Ethereum Prison
collect Ethereum Prisoner I.D. Tag##31957 |q 10971/1 |goto 54.53,40.29
|tip This is not a 100% drop rate.
You can find more around here [57.2,36.8]
step
talk Commander Ameer##20448
turnin Ethereum Secrets##10971 |goto 59.4,32.4
|tip This unlocks the repeatable quest "Ethereum Prisoner I.D. Catalogue".
step
Reach Revered with The Consortium |complete rep("The Consortium") >= Revered
|tip Turn in Zaxxis Insignias at area 52 or Obsidian Warbeads in Nagrand to accomplish this.
step
talk Commander Ameer##20448
accept A Thousand Worlds##10973 |goto 59.4,32.4
step
Kill enemies around this area
collect 5 Ethereum Prison Key##29460 |q 10973/1 |goto 28.79,77.43
|tip You can also get this from completing daily dungeon quests.
You can find more around here [57.2,36.8]
step
talk Commander Ameer##20448
turnin A Thousand Worlds##10973 |goto 59.4,32.4
accept Stasis Chambers Bash'ir##10974 |goto 59.4,32.4
step
use the Ethereum Key Tablet - Alpha##31994
kill Thuk the Defiant##22920
|tip You may need help with this.
Open the Stasis Chamber Alpha at Bash'ir's Landing |q 10974/1 |goto Blade's Edge Mountains/0 51.19,11.71
step
talk Image of Commander Ameer##22919
turnin Stasis Chambers Bash'ir##10974 |goto 52.85,14.97
accept Purging the Chambers of Bashi'ir##10975 |goto 52.85,14.97
step
Kill enemies around this area
collect 25 Ethereum Prison Key##29460 |q 10975 |future |goto Netherstorm/0 28.79,77.43
|tip You can also get this from completing daily dungeon quests.
|tip Save these for later.
You can find more around here [57.2,36.8]
step
label "Collect_5_Ethereum_Stasis_Chamber_Keys"
talk Image of Commander Ameer##22919
accept Purging the Chambers of Bashi'ir##10975 |instant |goto 52.85,14.97
step
collect 5 Ethereum Stasis Chamber Key##29750 |q 10976 |future |or
Click here to turn in more keys |confirm |next "Collect_5_Ethereum_Stasis_Chamber_Keys" |or
step
talk Image of Commander Ameer##22919
accept The Mark of the Nexus-King##10976 |goto Blade's Edge Mountains/0 52.85,14.97
step
click Ethereum Stasis Chamber
|tip This will cause elite enemies to spawn.
|tip You may need help with this.
collect Mark of the Nexus-King##31941 |q 10976/1 |goto 49.61,15.66
|tip These can be bought from the Auction House.
step
talk Image of Commander Ameer##22919
turnin The Mark of the Nexus-King##10976 |goto Blade's Edge Mountains/0 52.85,14.97
accept Stasis Chambers of the Mana-Tombs##10977 |goto Blade's Edge Mountains/0 52.85,14.97
step
Enter the building |goto Terokkar Forest/0 39.63,60.10 < 20 |walk
Run into the portal |goto 39.64,57.58
Enter the Mana-Tombs Dungeon |goto Mana-Tombs/0 0.00,0.00 |c |noway |q 10977
step
Inside the Mana-Tombs Dungeon:
|tip You must be in heroic difficulty for this quest.
|tip After Pandemonius, go left in the next room to reach the stasis.
click Mana-Tombs Stasis Chamber
Investigate the Mana-Tombs Stasis Chamber |q 10977/1
step
Leave the Mana-Tombs Dungeon |goto Mana-Tombs/0 0.00,0.00 > 10 |c |noway |q 10977
step
talk Image of Commander Ameer##22919
turnin Stasis Chambers of the Mana-Tombs##10977 |goto Blade's Edge Mountains/0 52.85,14.97
]])
ZygorGuidesViewer:RegisterGuide("Dungeon Guides\\The Burning Crusade\\Old Hillsbrad Foothills Quests",{
author="support@zygorguides.com",
description="This guide will walk you through completing the quests for the Old Hillsbrad Foothills dungeon.",
},[[
step
Reach Level 66 |ding 66
|tip Use the Leveling guides to accomplish this.
step
talk Don Carlos##28126
accept Nice Hat...##12513 |goto Tanaris/0 53.86,28.89
step
Enter the cave |goto Tanaris/0 65.51,49.97 < 15 |walk
talk Steward of Time##20142
|tip Inside the cave.
accept To The Master's Lair##10279 |goto 66.02,49.70
step
talk Andormu##20130
|tip Inside the cave.
turnin To The Master's Lair##10279 |goto 58.43,54.28
accept The Caverns of Time##10277 |goto 58.43,54.28
step
Follow the Custodian of Time as she walks
Watch the dialogue
|tip She walks around the room and will eventually return to this spot.
Explain the Caverns of Time |q 10277/1 |goto 58.95,54.33
step
talk Andormu##20130
|tip Inside the cave.
turnin The Caverns of Time##10277 |goto 58.43,54.28
accept Old Hillsbrad##10282 |goto 58.43,54.28
step
Run into the portal |goto Tanaris/0 55.54,53.22 < 15 |walk
Enter the Old Hillsbrad Foothills Dungeon |goto Old Hillsbrad Foothills/0 0.00,0.00 |c |noway |q 10285 |future
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
Click Here to Continue |confirm |q 10283
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
kill Don Carlos##28132
|tip Go for this objective after defeating Lieutenant Drake.
|tip He patrols along the road.
collect Don Carlos' Hat##38329 |q 12513/1
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
Leave the Old Hillsbrad Foothills Dungeon |goto Old Hillsbrad Foothills/0 0.00,0.00 > 10 |c |noway |q 12513
step
talk Andormu##20130
|tip Inside the cave.
turnin Return to Andormu##10285 |goto Tanaris/0 58.43,54.28
step
talk Don Carlos##28126
turnin Nice Hat...##12513 |goto 53.86,28.89
]])
ZygorGuidesViewer:RegisterGuide("Dungeon Guides\\The Burning Crusade\\The Black Morass Quests",{
author="support@zygorguides.com",
description="This guide will walk you through completing the quests for The Black Morass dungeon.",
},[[
step
Reach Level 66 |ding 66
|tip Use the Leveling guides to accomplish this.
step
Cross the bridge |goto Shattrath City/0 56.47,16.26 < 7 |only if walking
Continue across the bridge |goto 49.59,18.24 < 7 |only if walking
Run down the stairs |goto 46.19,22.52 < 7 |only if walking
talk Lorokeem##19052
accept Master of Elixirs##10902 |goto 45.62,21.49
|only if skill("Alchemy") < 0
step
Enter the cave |goto Tanaris/0 65.51,49.97 < 15 |walk
talk Steward of Time##20142
|tip Inside the cave.
accept To The Master's Lair##10279 |goto 66.02,49.70
step
talk Andormu##20130
|tip Inside the cave.
turnin To The Master's Lair##10279 |goto 58.43,54.28
accept The Caverns of Time##10277 |goto 58.43,54.28
step
Follow the Custodian of Time as she walks
Watch the dialogue
|tip She walks around the room and will eventually return to this spot.
Explain the Caverns of Time |q 10277/1 |goto 58.95,54.33
step
talk Andormu##20130
|tip Inside the cave.
turnin The Caverns of Time##10277 |goto 58.43,54.28
accept Old Hillsbrad##10282 |goto 58.43,54.28
step
Run into the portal |goto Tanaris/0 55.54,53.22 < 10 |walk
Enter the Old Hillsbrad Foothills Dungeon |goto Old Hillsbrad Foothills/0 0.00,0.00 |c |noway |q 10285 |future
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
Leave the Old Hillsbrad Foothills Dungeon |goto Old Hillsbrad Foothills/0 0.00,0.00 > 10 |c |noway |q 10296
step
Run into the portal |goto Tanaris/0 57.09,63.16 < 10 |walk
Enter The Black Morass Dungeon |goto The Black Morass/0 0.00,0.00 |c |noway |q 10297 |future
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
Kill Rift enemies around this area
collect 10 Essence of Infinity##31753 |q 10902/1
|only if skill("Alchemy") < 0
step
Inside The Black Morass Dungeon:
talk Sa'at##20201
turnin The Opening of the Dark Portal##10297
accept Hero of the Brood##10298
step
Leave The Black Morass Dungeon |goto The Black Morass/0 0.00,0.00 > 10 |c |noway |q 10298
step
talk Andormu##20130
|tip Inside the cave.
turnin Hero of the Brood##10298 |goto Tanaris/0 58.43,54.28
step
collect 5 Elixir of Major Defense##22834 |q 10902/2
collect 5 Elixir of Mastery##28104 |q 10902/3
collect 5 Elixir of Major Agility##22831 |q 10902/4
|tip These can be crafted with Alchemy.
|tip They can also be purchased from the Auction House.
|only if skill("Alchemy") < 0
step
Cross the bridge |goto Shattrath City/0 56.47,16.26 < 7 |only if walking
Continue across the bridge |goto 49.59,18.24 < 7 |only if walking
Run down the stairs |goto 46.19,22.52 < 7 |only if walking
talk Lorokeem##19052
turnin Master of Elixirs##10902 |goto 45.62,21.49
|only if skill("Alchemy") < 0
]])
ZygorGuidesViewer:RegisterGuide("Dungeon Guides\\The Burning Crusade\\The Mechanar Quests",{
author="support@zygorguides.com",
description="This guide will walk you through completing the quests for The Mechanar dungeon.",
},[[
step
Reach Level 67 |ding 67
|tip Use the Leveling guides to accomplish this.
step
kill Overseer Ripsaw##21499
|tip He walks around this area.
collect Illidari-Bane Shard##30756 |goto Shadowmoon Valley/0 23.13,35.10 |q 10621 |future
step
use the Illidari-Bane Shard##30756
accept Illidari-Bane Shard##10621
step
talk Ordinn Thunderfist##19370
turnin Illidari-Bane Shard##10621 |goto 36.82,54.89
accept Capture the Weapons##10626 |goto 36.82,54.89
step
kill Morgroron##21500
|tip He looks like a winged demon with 4 legs who walks around this area.
|tip You may need help with this.
collect Morgroron's Glaive##30785 |q 10626/2 |goto 23.31,38.05
step
kill Makazradon##21501
|tip He looks like a winged demon with 4 legs who walks around this area.
|tip You may need help with this.
collect Makazradon's Glaive##30786 |q 10626/1 |goto 22.30,35.94
step
talk Ordinn Thunderfist##19370
turnin Capture the Weapons##10626 |goto 36.82,54.89
Watch the dialogue
talk Ordinn Thunderfist##19370
accept The Hermit Smith##10662 |goto 36.82,54.89
step
talk David Wayne##21465
turnin The Hermit Smith##10662 |goto Terokkar Forest/0 77.57,38.72
accept Additional Materials##10664 |goto Terokkar Forest/0 77.57,38.72
step
collect Adamantite Frame##23784 |q 10664/1
|tip Purchase this from the Auction House.
|tip This can also be crafted by the Engineering profession.
|only if rep ('The Aldor') >= Neutral
step
collect 4 Heavy Knothide Leather##23793 |q 10664/2
|tip Purchase this from the Auction House.
|tip This can also be crafted by the Leatherworking profession.
|only if rep ('The Aldor') >= Neutral
step
collect Adamantite Frame##23784 |q 10664/1
|tip Purchase this from the Auction House.
|tip This can also be crafted by the Engineering profession.
|only if rep ('The Scryers') >= Neutral
step
collect 4 Heavy Knothide Leather##23793 |q 10664/2
|tip Purchase this from the Auction House.
|tip This can also be crafted by the Leatherworking profession.
|only if rep ('The Scryers') >= Neutral
step
talk Fantei##19678
buy Demon Warding Totem##30823 |q 10664/3 |goto 64.69,70.70
step
talk David Wayne##21465
turnin Additional Materials##10664 |goto Terokkar Forest/0 77.57,38.72
accept Fresh from the Mechanar##10665 |goto Terokkar Forest/0 77.57,38.72
step
Run into the portal |goto Netherstorm/0 70.66,69.84
|tip On the floating island.
Enter The Mechanar Dungeon |goto The Mechanar/0 0.00,0.00 |c |noway |q 10665
step
Inside The Mechanar Dungeon:
click Overcharged Manacell##185015+
|tip They look like small pink glass boxes on the ground around the area where Mechano-Lord Capacitus walks around.
|tip Use "The Mechanar" dungeon guide to accomplish this.
collect Overcharged Manacell##30824 |q 10665/1
step
Leave The Mechanar Dungeon |goto The Mechanar/0 0.00,0.00 > 10 |c |noway |q 10665
step
talk David Wayne##21465
turnin Fresh from the Mechanar##10665 |goto Terokkar Forest/0 77.57,38.72
]])
ZygorGuidesViewer:RegisterGuide("Dungeon Guides\\The Burning Crusade\\The Steamvault Quests",{
author="support@zygorguides.com",
description="This guide will walk you through the quests for The Steamvault dungeon.",
},[[
step
Reach Level 67 |ding 67
|tip Use the Leveling guides to accomplish this.
step
kill Overseer Ripsaw##21499
|tip He walks around this area.
collect Illidari-Bane Shard##30579 |n
use the Illidari-Bane Shard##30579
accept Illidari-Bane Shard##10621 |goto Shadowmoon Valley/0 23.42,35.44
step
talk Grokom Deatheye##19333
turnin Illidari-Bane Shard##10621 |goto 29.79,31.26
accept Capture the Weapons##10626 |goto 36.82,54.89
step
kill Morgroron##21500
|tip He looks like a winged demon with 4 legs who walks around this area.
|tip You may need help with this.
collect Morgroron's Glaive##30785 |q 10626/2 |goto 23.31,38.05
step
kill Makazradon##21501
|tip He looks like a winged demon with 4 legs who walks around this area.
|tip You may need help with this.
collect Makazradon's Glaive##30786 |q 10626/1 |goto 22.30,35.94
step
talk Ordinn Thunderfist##19370
turnin Capture the Weapons##10626 |goto 36.82,54.89
step
Watch the dialogue
talk Ordinn Thunderfist##19370
accept The Hermit Smith##10662 |goto 36.82,54.89
step
talk David Wayne##21465
turnin The Hermit Smith##10662  |goto Terokkar Forest/0 77.6,38.6
accept Additional Materials##10664 |goto Terokkar Forest/0 77.6,38.6
step
talk Fantei##19678
buy 1 Demon Warding Totem##30823 |q 10664/3 |goto Shattrath City/0 64.69,70.67
step
collect 1 Adamantite Frame##23784 |q 10664/1
|tip This is crafted by Engineers with 4 Adamantite Bars and 1 Primal Earth.
|tip You can also purchase this from the Auction House.
step
collect 4 Heavy Knothide Leather##23793 |q 10664/2
|tip This is crafted by Engineers with 4 Adamantite Bars and 1 Primal Earth.
|tip You can also purchase this from the Auction House.
step
talk David Wayne##21465
turnin Additional Materials##10664 |goto Terokkar Forest/0 77.58,38.72
accept The Lexicon Demonica##10666 |goto Terokkar Forest/0 77.57,38.72
step
Enter the building |goto Terokkar Forest/0 39.64,70.98 < 20 |walk
|tip You need the Shadow Labyrinth Key to open the door.
Run into the portal |goto 39.63,73.60 < 10 |walk
Enter the Shadow Labyrinth Dungeon |goto Shadow Labyrinth/0 0.00,0.00 |c |noway |q 10666
step
Inside the Shadow Labyrinth Dungeon:
kill Grandmaster Vorpil##18732
collect Lexicon Demonica##30827 |q 10666/1
step
Leave the Shadow Labyrinth Dungeon |goto Shadow Labyrinth/0 0.00,0.00 > 10 |c |noway |q 10666
step
talk David Wayne##21465
turnin The Lexicon Demonica##10666 |goto Terokkar Forest/0 77.57,38.72
accept Underworld Loam##10667 |goto Terokkar Forest/0 77.57,38.72
step
Swim down into the pipe |goto Zangarmarsh/0 50.37,40.92 < 7 |walk
Swim through the pipe |goto 51.26,39.56 < 10 |walk
talk Watcher Jhang##17884
accept The Warlord's Hideout##9763 |goto 52.29,35.98
step
Run into the portal |goto 50.28,33.32 < 10 |walk
Enter The Steamvault Dungeon |goto The Steamvault/0 0.00,0.00 |c |noway |q 9764 |future
stickystart "Accept_Orders_From_Lady_Vashj"
step
Inside The Steamvault Dungeon:
kill Hydromancer Thespia##17797
collect Vial of Underworld Loam##30828 |q 10667/1
step
Inside The Steamvault Dungeon:
kill Warlord Kalithresh##17798 |q 9763/1
|tip He is the last boss of the instance.
step
label "Accept_Orders_From_Lady_Vashj"
Inside The Steamvault Dungeon:
Kill enemies throughout the dungeon
collect Orders from Lady Vashj##24367 |n
use the Orders from Lady Vashj##24367
accept Orders from Lady Vashj##9764
step
Leave The Steamvault Dungeon |goto The Steamvault/0 0.00,0.00 > 10 |c |noway |q 9764
step
talk Watcher Jhang##17884
turnin The Warlord's Hideout##9763 |goto Zangarmarsh/0 52.29,35.98
step
talk Ysiel Windsinger##17841
turnin Orders from Lady Vashj##9764 |goto 78.4,62.0
step
Reach Level 70 |ding 70
|tip Use the Leveling guides to accomplish this.
step
talk A'dal##18481
|tip Inside the building.
accept Trial of the Naaru: Strength##10885 |goto Shattrath City/0 53.98,44.71
|tip This quest must be completed in Heroic mode.
step
Swim into the underwater pipe |goto Zangarmarsh/0 50.39,40.84 < 15 |walk
Swim through the pipe |goto 51.41,39.40 < 10 |walk
Exit the pipe |goto 51.91,38.19 < 10 |walk
Run into the portal |goto 50.28,33.32 < 10 |walk
Enter The Steamvault Dungeon |goto The Steamvault/0 0.00,0.00 |c |noway |q 10885
step
Inside The Steamvault Dungeon:
|tip This quest must be completed in Heroic mode.
kill Warlord Kalithresh##17798
collect 1 Kalithresh's Trident##31721 |q 10885/1
|tip He is the last boss of the instance.
step
Inside the Shadow Labyrinth Dungeon:
|tip This quest must be completed in Heroic mode.
kill Murmur##18708
collect 1 Murmur's Essence##31722 |q 10885/2
step
Leave The Steamvault Dungeon |goto The Steamvault/0 0.00,0.00 > 10 |c |noway |q 10885
|tip It is the last boss of the instance.
step
talk A'dal##18481
|tip Inside the building.
turnin Trial of the Naaru: Strength##10885 |goto Shattrath City/0 53.98,44.71
step
talk David Wayne##21465
turnin Underworld Loam##10667 |goto Terokkar Forest/0 77.57,38.72
]])
ZygorGuidesViewer:RegisterGuide("Dungeon Guides\\The Burning Crusade\\The Arcatraz Quests",{
author="support@zygorguides.com",
description="This guide will walk you through completing the quests for The Arcatraz dungeon.",
},[[
step
Reach Level 67 |ding 67
|tip Use the Leveling guides to accomplish this.
step
talk Nether-Stalker Khay'ji##19880
accept Consortium Crystal Collection##10265 |goto Netherstorm/0 32.44,64.21
step
kill Pentatharon##20215
collect 1 Arklon Crystal Artifact##28829 |q 10265/1 |goto 42.45,72.75
step
talk Nether-Stalker Khay'ji##19880
turnin Consortium Crystal Collection##10265 |goto 32.44,64.21
accept A Heap of Ethereals##10262 |goto 32.44,64.21
step
Kill Zaxxis enemies around this area
collect 10 Zaxxis Insignia##29209 |q 10262/1 |goto 31.07,74.84
You can find more around [28.99,79.24]
step
talk Nether-Stalker Khay'ji##19880
turnin A Heap of Ethereals##10262 |goto 32.44,64.21
accept Warp-Raider Nesaad##10205 |goto 32.44,64.21
step
kill Warp-Raider Nesaad##19641 |q 10205/1 |goto 28.27,79.61
step
talk Nether-Stalker Khay'ji##19880
turnin Warp-Raider Nesaad##10205 |goto 32.44,64.21
accept Request for Assistance##10266 |goto 32.44,64.21
step
talk Gahruj##20066
turnin Request for Assistance##10266 |goto 46.67,56.95
accept Rightful Repossession##10267 |goto 46.67,56.95
step
click Box of Surveying Equipment##184031+
|tip They look like small grey boxes on the ground and inside carts around this area.
collect 10 Box of Surveying Equipment##28913 |q 10267/1 |goto 56.94,65.73
You can find more around [59.15,63.45]
step
talk Gahruj##20066
turnin Rightful Repossession##10267 |goto 46.67,56.95
accept An Audience with the Prince##10268 |goto 46.67,56.95
step
Enter the building |goto 45.28,36.01 < 10 |walk
talk Image of Nexus-Prince Haramad##20084
|tip Inside the building.
turnin An Audience with the Prince##10268 |goto 45.86,35.97
accept Triangulation Point One##10269 |goto 45.86,35.97
step
use the Triangulation Device##28962
|tip Your character will automatically be faced in the direction you need to go.
|tip Run in the direction you become faced until the item is no longer on cooldown.
|tip After the the item completes its cooldown, the quest goal should complete.
Discover the First Triangulation Point |q 10269/1 |goto 66.81,34.82
step
talk Dealer Hazzin##20092
turnin Triangulation Point One##10269 |goto 58.35,31.26
accept Triangulation Point Two##10275 |goto 58.35,31.26
step
Cross the bridge |goto 33.62,37.77 < 20 |only if walking
Follow the path up |goto 29.58,41.34 < 15 |only if walking
use the Triangulation Device##29018
|tip Your character will automatically be faced in the direction you need to go.
|tip Run in the direction you become faced until the item is no longer on cooldown.
|tip After the the item completes its cooldown, the quest goal should complete.
Discover the Second Triangulation Point |q 10275/1 |goto 29.05,40.45
step
Cross the bridge |goto 31.66,41.38 < 20 |only if walking
talk Wind Trader Tuluman##20112
turnin Triangulation Point Two##10275 |goto 34.62,37.95
accept Full Triangle##10276 |goto 34.62,37.95
step
kill Culuthas##20138
|tip You may need help with this.
collect 1 Ata'mal Crystal##29026 |q 10276/1 |goto 53.4,21.6
step
Enter the building |goto 45.28,36.01 < 10 |walk
talk Image of Nexus-Prince Haramad##20084
|tip Inside the building.
turnin Full Triangle##10276 |goto 45.86,35.97
accept Special Delivery to Shattrath City##10280 |goto 45.86,35.97
step
talk A'dal##18481
turnin Special Delivery to Shattrath City##10280 |goto Shattrath City/0 53.98,44.73
accept How to Break Into the Arcatraz##10704 |goto 53.98,44.73
step
Enter the building |goto Shadowmoon Valley/0 56.44,59.13 < 7 |walk
talk Arcanist Thelis##21955
|tip Inside the building.
accept Tablets of Baa'ri##10683 |goto 56.25,59.60
|only if rep('The Scryers')>=Neutral
step
Follow the path up |goto 61.35,67.12 < 40 |only if walking
Follow the path |goto 62.36,62.36 < 30 |only if walking
Follow the road |goto 63.17,51.55 < 50 |only if walking
Follow the path up |goto 61.36,38.02 < 20 |only if walking
kill Ashtongue Worker##21455+
click Baar'ri Tablet Fragment##184870+
|tip They look like green glowing broken stone pieces on the ground around this area.
collect 12 Baa'ri Tablet Fragment##30596 |q 10683/1 |goto 57.49,35.62
|only if rep('The Scryers') >= Neutral
step
talk Arcanist Thelis##21955
|tip Inside the building.
turnin Tablets of Baa'ri##10683 |goto 56.25,59.60
accept Oronu the Elder##10684 |goto 56.25,59.60
|only if rep ('The Scryers') >= Neutral
step
Follow the road |goto 63.17,51.55 < 50 |only if walking
Follow the path up |goto 61.36,38.02 < 20 |only if walking
Follow the path |goto 58.65,36.55 < 30 |only if walking
Enter the building |goto 57.01,34.02 < 15 |only if walking
kill Oronu the Elder##21663
collect Orders From Akama##30649 |q 10684/1 |goto 57.19,32.87
|only if rep ('The Scryers') >= Neutral
step
Follow the road |goto 63.10,38.71 < 50 |only if walking
Continue following the road |goto 62.76,52.72 < 50 |only if walking
Enter the building |goto 56.43,59.16 < 10 |walk
talk Arcanist Thelis##21955
|tip Inside the building.
turnin Oronu the Elder##10684 |goto 56.25,59.59
accept The Ashtongue Corruptors##10685 |goto 56.25,59.59
|only if rep ('The Scryers') >= Neutral
step
kill Haalum##21711
|tip Destroy the four totems to make him vulnerable.
collect Haalum's Medallion Fragment##30691 |q 10685/2 |goto 57.0,73.6
|only if rep ('The Scryers') >= Neutral
step
kill Eykenen##21709
|tip Destroy the four totems to make him vulnerable.
collect Eykenen's Medallion Fragment##30692 |q 10685/1 |goto 51.2,52.8
|only if rep ('The Scryers') >= Neutral
step
kill Uylaru##21710
|tip Destroy the four totems to make him vulnerable.
collect Uylaru's Medallion Fragment##30694 |q 10685/4 |goto 48.6,39.4
|only if rep ('The Scryers') >= Neutral
step
kill Lakaan##21416
|tip Destroy the four totems to make him vulnerable.
collect Lakaan's Medallion Fragment##30693 |q 10685/3 |goto 49.8,23.6
|only if rep ('The Scryers') >= Neutral
step
talk Arcanist Thelis##21955
|tip Inside the building.
turnin The Ashtongue Corruptors##10685 |goto 56.25,59.59
accept The Warden's Cage##10575 |goto 56.25,59.59
|only if rep ('The Scryers') >= Neutral
step
Enter the building |goto Shadowmoon Valley/0 62.31,28.95 < 10 |walk
talk Anchorite Ceyla##21402
|tip Inside the building.
accept Tablets of Baa'ri##10568 |goto 62.58,28.38
|only if rep ('The Aldor') >= Neutral
step
Follow the path up |goto 61.36,38.02 < 20 |only if walking
kill Ashtongue Worker##21455+
click Baar'ri Tablet Fragment##184870+
|tip They look like green glowing broken stone pieces on the ground around this area.
collect 12 Baa'ri Tablet Fragment##30596 |q 10568/1 |goto 57.49,35.62
|only if rep('The Aldor') >= Neutral
step
Enter the building |goto 62.31,28.96 < 10 |walk
talk Anchorite Ceyla##21402
|tip Inside the building.
turnin Tablets of Baa'ri##10568 |goto 62.58,28.38
accept Oronu the Elder##10571 |goto 62.58,28.38
|only if rep('The Aldor') >= Neutral
step
Follow the path up |goto 61.36,38.02 < 20 |only if walking
Follow the path |goto 58.65,36.55 < 30 |only if walking
Enter the building |goto 57.01,34.02 < 15 |only if walking
kill Oronu the Elder##21663
collect Orders From Akama##30649 |q 10571/1 |goto 57.19,32.87
|only if rep ('The Aldor') >= Neutral
step
Run up the stairs |goto 61.44,30.85 < 20 |only if walking
Enter the building |goto 62.31,28.96 < 10 |walk
talk Anchorite Ceyla##21402
|tip Inside the building.
turnin Oronu the Elder##10571 |goto 62.58,28.38
accept The Ashtongue Corruptors##10574 |goto 56.25,59.59
|only if rep('The Aldor') >= Neutral
step
kill Lakaan##21416
|tip Destroy the four totems to make him vulnerable.
collect Lakaan's Medallion Fragment##30693 |q 10574/3 |goto 49.8,23.6
|only if rep('The Aldor') >= Neutral
step
kill Uylaru##21710
|tip Destroy the four totems to make him vulnerable.
collect Uylaru's Medallion Fragment##30694 |q 10574/4 |goto 48.6,39.4
|only if rep('The Aldor') >= Neutral
step
kill Eykenen##21709
|tip Destroy the four totems to make him vulnerable.
collect Eykenen's Medallion Fragment##30692 |q 10574/1 |goto 51.2,52.8
|only if rep('The Aldor') >= Neutral
step
kill Haalum##21711
|tip Destroy the four totems to make him vulnerable.
collect Haalum's Medallion Fragment##30691 |q 10574/2 |goto 57.0,73.6
|only if rep('The Aldor') >= Neutral
step
Run up the stairs |goto 61.44,30.85 < 20 |only if walking
Enter the building |goto 62.31,28.96 < 10 |walk
talk Anchorite Ceyla##21402
|tip Inside the building.
turnin The Ashtongue Corruptors##10574 |goto 62.58,28.38
accept The Warden's Cage##10575 |goto 56.25,59.59
|only if rep('The Aldor') >= Neutral
step
talk Sanoru##21826
|tip Downstairs inside the building.
turnin The Warden's Cage##10575 |goto 57.33,49.58
accept Proof of Allegiance##10622 |goto 57.33,49.58
step
kill Zandras##21827 |q 10622/1 |goto 57.98,48.95
|tip He walks along the wall.
step
talk Sanoru##21826
|tip Downstairs inside the building.
turnin Proof of Allegiance##10622|goto 57.33,49.58
accept Akama##10628 |goto 57.33,49.58
step
Swim through the tunnel |goto 57.65,47.79 < 5 |walk
talk Akama##21700
turnin Akama##10628 |goto 58.11,48.19
accept Seer Udalo##10705 |goto 58.11,48.19
step
Run into the portal |goto Netherstorm/0 74.49,57.68 < 15 |walk
|tip On the floating island.
Enter The Arcatraz Dungeon |goto The Arcatraz/0 0.00,0.00 |c |noway |q 10706 |future
step
Inside The Arcatraz Dungeon:
talk Udalo##21962
Find Seer Udalo |q 10705/1
step
Inside The Arcatraz Dungeon:
talk Udalo##21962
turnin Seer Udalo##10705
accept A Mysterious Portent##10706
step
Leave The Arcatraz Dungeon |goto The Arcatraz/0 0.00,0.00 > 10 |c |noway |q 10706
step
Run into the portal |goto Netherstorm/0 70.66,69.84 < 15 |walk
|tip On the floating island.
Enter The Mechanar Dungeon |goto The Mechanar/0 0.00,0.00 |c |noway |q 10704
step
Inside The Mechanar Dungeon:
kill Pathaleon the Calculator##19220
|tip He is the last boss of the instance.
|tip Use "The Mechanar" dungeon guide to accomplish this.
collect 1 Bottom Shard of the Arcatraz Key##31086 |q 10704/2
step
Inside The Botanica Dungeon:
kill Warp Splinter##17977
|tip It is the last boss of the instance.
|tip Use "The Botanica" dungeon guide to accomplish this.
collect 1 Top Shard of the Arcatraz Key##31085 |q 10704/1
step
Leave The Mechanar Dungeon |goto The Mechanar/0 0.00,0.00 > 10 |c |noway |q 10704
step
talk A'dal##18481
turnin How to Break Into the Arcatraz##10704 |goto Shattrath City/0 53.98,44.73
collect Key to the Arcatraz##31084 |goto 53.98,44.73
|tip This key will allow you to open the door to enter The Arcatraz dungeon.
step
Run down the ramp |goto Shadowmoon Valley/0 57.36,49.66 < 5 |walk
Swim through the tunnel |goto 57.65,47.79 < 5 |walk
talk Akama##21700
turnin A Mysterious Portent##10706 |goto 58.11,48.19
step
Reach Level 70 |ding 70
step
talk Apprentice Tasserel##23948
|tip Inside the building.
accept Archmage Alturus##11216  |goto Shattrath City/0 75.28,33.45
step
Follow the path up |goto Deadwind Pass/0 51.34,44.03 < 15 |only if walking
Follow the road |goto 44.53,52.97 < 15 |only if walking
Continue following the road |goto 53.18,57.77 < 15 |only if walking
Follow the road down |goto 55.53,78.70 < 15 |only if walking
talk Archmage Alturus##17613
turnin Archmage Alturus##11216 |goto 46.94,75.62
accept Arcane Disturbances##9824 |goto 46.92,75.63
accept Restless Activity##9825 |goto 46.92,75.63
stickystart "Collect_Ghostly_Essence"
step
Run down the stairs |goto 47.70,78.27 < 7 |walk
Continue down the path |goto 46.34,78.16 < 7 |walk
Jump down here |goto 44.28,74.27  < 10 |walk
use the Violet Scrying Crystal##24474
Read the Underground Pond |q 9824/2 |goto 43.66,77.10
step
Follow the path up |goto 44.25,75.01 < 10 |walk
Continue up the path |goto 44.94,73.87 < 10 |walk
Run up the ramp |goto 45.80,78.00 < 10 |walk
Run up the stairs |goto 47.21,78.24 < 7 |walk
Run down the stairs |goto 48.68,78.85 < 7 |walk
Follow the path |goto 54.55,82.55 < 15 |walk
use the Violet Scrying Crystal##24474
Collect the Underground Well Reading |q 9824/1 |goto 53.21,90.10
step
label "Collect_Ghostly_Essence"
Kill Enemies around this area
|tip Underground inside the cave.
collect 10 Ghostly Essence##24480 |q 9825/1 |goto 46.81,74.33
step
Follow the path up |goto Deadwind Pass/0 52.96,79.44 < 10 |walk
Run up the stairs |goto 49.14,78.92 < 10 |walk
talk Archmage Alturus##17613
turnin Arcane Disturbances##9824 |goto 46.92,75.63
turnin Restless Activity##9825 |goto 46.92,75.63
accept Contact from Dalaran##9826 |goto 46.92,75.64
step
talk Archmage Cedric##18165
turnin Contact from Dalaran##9826 |goto Alterac Mountains/0 15.60,54.58
accept Khadgar##9829 |goto 15.60,54.58
step
talk Khadgar##18166
turnin Khadgar##9829 |goto Shattrath City/0 54.75,44.32
accept Entry Into Karazhan##9831 |goto 54.75,44.32
step
Enter the building |goto Terokkar Forest/0 39.64,70.98 < 20 |walk
|tip You need the Shadow Labyrinth Key to open the door.
Run into the portal |goto 39.63,73.60 < 10 |walk
Enter the Shadow Labyrinth Dungeon |goto Shadow Labyrinth/0 0.00,0.00 |c |noway |q 9831
step
Inside the Shadow Labyrinth Dungeon:
click Arcane Container
|tip It is in the room with Murmur.
|tip You can reach it without killing Murmur but we suggest you kill him to be safe.
kill First Fragment Guardian##22890
collect First Key Fragment##24514 |q 9831/1
step
Leave the Shadow Labyrinth Dungeon |goto Shadow Labyrinth/0 0.00,0.00 > 10 |c |noway |q 9831
step
talk Khadgar##18166
turnin Entry Into Karazhan##9831 |goto Shattrath City/0 54.75,44.32
accept The Second and Third Fragments##9832 |goto 54.75,44.32
step
Swim into the underwater pipe |goto Zangarmarsh/0 50.39,40.84 < 15 |walk
Swim through the pipe |goto 51.41,39.40 < 10 |walk
Exit the pipe |goto 51.91,38.19 < 10 |walk
Run into the portal |goto 50.28,33.32 < 10 |walk
Enter The Steamvault Dungeon |goto The Steamvault/0 0.00,0.00 |c |noway |q 9832
step
Inside the Steamvault Dungeon:
click Arcane Container
|tip Before the first boss in the instance.
|tip Clear trash making your way to the first boss.
|tip Pass the tunnel that progresses further into the instance and jump into the body of water to the right.
|tip Swim to the bottom near the left wall for the container.
kill Second Fragment Guardian##22891
collect Second Key Fragment##24487 |q 9832/1
step
Leave The Steamvault Dungeon |goto The Steamvault/0 0.00,0.00 > 10 |c |noway |q 9832
step
Run into the portal |goto Netherstorm/0 74.49,57.68 < 10 |walk
|tip On the floating island.
Enter The Arcatraz Dungeon |goto The Arcatraz/0 0.00,0.00 |c |noway |q 9832
step
Inside The Arcatraz Dungeon:
click Arcane Container
|tip Run up the ramp after the first boss.
|tip Cross the bridge.
|tip As soon as you enter the next room, go to the right.
kill Third Fragment Guardian##22892
collect Third Key Fragment##24488 |q 9832/2
step
Leave The Arcatraz Dungeon |goto The Arcatraz/0 0.00,0.00 > 10 |c |noway |q 9832
step
talk Khadgar##18166
turnin The Second and Third Fragments##9832 |goto Shattrath City/0 54.75,44.32
]])
ZygorGuidesViewer:RegisterGuide("Dungeon Guides\\The Burning Crusade\\The Botanica Quests",{
author="support@zygorguides.com",
description="This guide will walk you through completing the quests for The Botanica dungeon.",
},[[
step
Reach Level 67 |ding 67
|tip Use the Leveling guides to accomplish this.
step
Enter the building |goto Netherstorm/0 57.85,86.16 < 7 |walk
talk Archmage Vargoth##19481
|tip At the top of the tower.
accept Capturing the Keystone##10257 |goto 58.34,86.40
step
Reach Level 68 |ding 68
|tip Use the Leveling guides to accomplish this.
|only if skill("Alchemy") < 0
step
talk Lauranna Thar'well##17909
accept Master of Potions##10897 |goto Zangarmarsh/0 80.32,64.17
|only if skill("Alchemy") < 0
step
talk Nether-Stalker Khay'ji##19880
accept Consortium Crystal Collection##10265 |goto Netherstorm/0 32.44,64.21
step
kill Pentatharon##20215
collect 1 Arklon Crystal Artifact##28829 |q 10265/1 |goto 42.45,72.75
step
talk Nether-Stalker Khay'ji##19880
turnin Consortium Crystal Collection##10265 |goto 32.44,64.21
accept A Heap of Ethereals##10262 |goto 32.44,64.21
step
Kill Zaxxis enemies around this area
collect 10 Zaxxis Insignia##29209 |q 10262/1 |goto 31.07,74.84
You can find more around [28.99,79.24]
step
talk Nether-Stalker Khay'ji##19880
turnin A Heap of Ethereals##10262 |goto 32.44,64.21
accept Warp-Raider Nesaad##10205 |goto 32.44,64.21
step
kill Warp-Raider Nesaad##19641 |q 10205/1 |goto 28.27,79.61
step
talk Nether-Stalker Khay'ji##19880
turnin Warp-Raider Nesaad##10205 |goto 32.44,64.21
accept Request for Assistance##10266 |goto 32.44,64.21
step
talk Gahruj##20066
turnin Request for Assistance##10266 |goto 46.67,56.95
accept Rightful Repossession##10267 |goto 46.67,56.95
step
click Box of Surveying Equipment##184031+
|tip They look like small grey boxes on the ground and inside carts around this area.
collect 10 Box of Surveying Equipment##28913 |q 10267/1 |goto 56.94,65.73
You can find more around [59.15,63.45]
step
talk Gahruj##20066
turnin Rightful Repossession##10267 |goto 46.67,56.95
accept An Audience with the Prince##10268 |goto 46.67,56.95
step
Enter the building |goto 45.28,36.01 < 10 |walk
talk Image of Nexus-Prince Haramad##20084
|tip Inside the building.
turnin An Audience with the Prince##10268 |goto 45.86,35.97
accept Triangulation Point One##10269 |goto 45.86,35.97
step
use the Triangulation Device##28962
|tip Your character will automatically be faced in the direction you need to go.
|tip Run in the direction you become faced until the item is no longer on cooldown.
|tip After the the item completes its cooldown, the quest goal should complete.
Discover the First Triangulation Point |q 10269/1 |goto 66.81,34.82
step
talk Dealer Hazzin##20092
turnin Triangulation Point One##10269 |goto 58.35,31.26
accept Triangulation Point Two##10275 |goto 58.35,31.26
step
Cross the bridge |goto 33.62,37.77 < 20 |only if walking
Follow the path up |goto 29.58,41.34 < 15 |only if walking
use the Triangulation Device##29018
|tip Your character will automatically be faced in the direction you need to go.
|tip Run in the direction you become faced until the item is no longer on cooldown.
|tip After the the item completes its cooldown, the quest goal should complete.
Discover the Second Triangulation Point |q 10275/1 |goto 29.05,40.45
step
Cross the bridge |goto 31.66,41.38 < 20 |only if walking
talk Wind Trader Tuluman##20112
turnin Triangulation Point Two##10275 |goto 34.62,37.95
accept Full Triangle##10276 |goto 34.62,37.95
step
kill Culuthas##20138
|tip You may need help with this.
collect 1 Ata'mal Crystal##29026 |q 10276/1 |goto 53.4,21.6
step
Enter the building |goto 45.28,36.01 < 10 |walk
talk Image of Nexus-Prince Haramad##20084
|tip Inside the building.
turnin Full Triangle##10276 |goto 45.86,35.97
accept Special Delivery to Shattrath City##10280 |goto 45.86,35.97
step
talk A'dal##18481
turnin Special Delivery to Shattrath City##10280 |goto Shattrath City/0 53.98,44.73
accept How to Break Into the Arcatraz##10704 |goto 53.98,44.73
step
Run into the portal |goto Netherstorm/0 70.66,69.84 < 10 |walk
|tip On the floating island.
Enter The Mechanar Dungeon |goto The Mechanar/0 0.00,0.00 |c |noway |q 10704
step
Inside The Mechanar Dungeon:
kill Pathaleon the Calculator##19220
|tip He is the last boss of the instance.
|tip Use "The Mechanar" dungeon guide to accomplish this.
collect 1 Bottom Shard of the Arcatraz Key##31086 |q 10704/2
step
Leave The Mechanar Dungeon |goto The Mechanar/0 0.00,0.00 > 10 |c |noway |q 10704
step
Run into the portal |goto Netherstorm/0 71.77,54.92 < 10 |walk
|tip On the floating island.
Enter The Botanica Dungeon |goto The Botanica/0 0.00,0.00 |c |noway |q 10257
step
Inside The Botanica Dungeon:
kill Commander Sarannis##17976
|tip She is the first boss of the instance.
|tip Use "The Botanica" dungeon guide to accomplish this.
collect 1 The Keystone##28769 |q 10257/1
step
Inside The Botanica Dungeon:
kill High Botanist Freywinn##17975
|tip He is the second boss of the instance.
|tip Use "The Botanica" dungeon guide to accomplish this.
collect 1 Botanist's Field Guide##31744 |q 10897/1
|only if skill("Alchemy") < 0
step
Inside The Botanica Dungeon:
kill Warp Splinter##17977
|tip It is the last boss of the instance.
|tip Use "The Botanica" dungeon guide to accomplish this.
collect 1 Top Shard of the Arcatraz Key##31085 |q 10704/1
step
Leave The Botanica Dungeon |goto The Botanica/0 0.00,0.00 > 10 |c |noway |q 10257
step
Enter the building |goto Netherstorm/0 57.85,86.16 < 7 |walk
talk Archmage Vargoth##19481
|tip At the top of the tower.
turnin Capturing the Keystone##10257 |goto 58.34,86.40
step
talk Lauranna Thar'well##17909
turnin Master of Potions##10897 |goto Zangarmarsh/0 80.32,64.17
|only if skill("Alchemy") < 0
step
talk A'dal##18481
turnin How to Break Into the Arcatraz##10704 |goto Shattrath City/0 53.98,44.73
collect Key to the Arcatraz##31084 |goto 53.98,44.73
|tip This key will allow you to open the door to enter The Arcatraz dungeon.
]])
ZygorGuidesViewer:RegisterGuide("Dungeon Guides\\The Burning Crusade\\Hellfire Ramparts Quests",{
author="support@zygorguides.com",
description="This guide will walk you through the Hellfire Ramparts dungeon quests.",
},[[
step
Reach Level 62 |ding 62
step
talk Lieutenant Chadwick##17557
accept Weaken the Ramparts##9575 |goto Hellfire Peninsula 56.6,66.4
step
Follow the path |goto Hellfire Peninsula/0 48.85,55.53 < 15 |only if walking
Run into the portal |goto 47.60,53.59 < 10 |walk
|tip You will need the Shattered Halls Key to enter this dungeon.
Enter the Hellfire Ramparts Dungeon |goto Hellfire Ramparts/0 0.00,0.00 |c |noway |q 9575
step
Inside the Hellfire Ramparts Dungeon:
kill Watchkeeper Gargolmar##17306
collect Gargolmar's Hand##23881 |q 9575/1
step
Inside the Hellfire Ramparts Dungeon:
kill Omor the Unscarred##17308
collect Omor's Hoof##23886 |q 9575/2
step
Inside the Hellfire Ramparts Dungeon:
kill Nazan##17536
collect Nazan's Head##23901 |q 9575/3
collect Ominous Letter##23891 |n
step
Inside the Hellfire Ramparts Dungeon:
use the Ominous Letter##23891
|tip Drops from Nazan.
accept Dark Tidings##9587
step
Leave the Hellfire Ramparts Dungeon |goto Hellfire Ramparts/0 0.00,0.00 > 10 |c |noway |q 9575
step
talk Gunny##17479
turnin Weaken the Ramparts##9575 |goto Hellfire Peninsula 56.4,66.6
step
talk Force Commander Danath Trollbane##16819
turnin Dark Tidings##9587 |goto 56.6,68.6
]])
ZygorGuidesViewer:RegisterGuide("Dungeon Guides\\The Burning Crusade\\Blood Furnace Quests",{
author="support@zygorguides.com",
description="This guide will walk you through the Blood Furnace dungeon quests.",
},[[
step
Reach Level 63 |ding 63
step
Complete the "Weaken the Ramparts" quest in the "Hellfire Ramparts Quest" guide |q 9575
step
talk Gunny##17479
|tip Inside the building.
accept Heart of Rage##9607 |goto Hellfire Peninsula 56.4,66.6
accept The Blood is Life##9589 |goto Hellfire Peninsula 56.4,66.6
step
Run up the stairs |goto Hellfire Peninsula/0 46.43,59.08 < 15 |only if walking
Follow the path |goto 47.30,55.65 < 15 |only if walking
Run into the portal |goto 45.97,51.86 < 10 |walk
Enter The Blood Furnace Dungeon |goto The Blood Furnace/0 0.00,0.00 |c |noway |q 9607
stickystart "Fel_Orc_Blood Vial"
step
Inside the Blood Furnace Dungeon:
kill Keli'dan the Breaker##17377
|tip This is the last boss of the instance.
|tip When you are close to his chambers you should have investigated.
Fully Investigate the Blood Furnace |q 9607/1
step
label "Fel_Orc_Blood Vial"
Inside the Blood Furnace Dungeon:
collect 10 Fel Orc Blood Vial##23894 |q 9589/1
step
Leave The Blood Furnace Dungeon |goto The Blood Furnace/0 0.00,0.00 > 10 |c |noway |q 9607
step
talk Gunny##17479
|tip Inside the building.
turnin The Blood is Life##9589 |goto Hellfire Peninsula 56.4,66.6
step
talk Force Commander Danath Trollbane##16819
|tip Inside the building.
turnin Heart of Rage##9607 |goto 56.6,68.6
]])
ZygorGuidesViewer:RegisterGuide("Dungeon Guides\\The Burning Crusade\\Shattered Halls Quests",{
author="support@zygorguides.com",
description="This guide will walk you through the Blood Furnace dungeon quests.",
},[[
step
Reach Level 67 |ding 67
step
talk Force Commander Danath Trollbane##16819
|tip Inside the building.
accept Turning the Tide##9492 |goto Hellfire Peninsula 56.6,68.6
step
Follow the path |goto Hellfire Peninsula/0 48.85,55.53 < 15 |only if walking
Rup up the ramp |goto 48.56,52.01 < 15 |only if walking
Run into the portal |goto 47.48,52.02 < 10 |walk
|tip You will need the Shattered Halls Key to enter this dungeon.
Enter The Shattered Halls Dungeon |goto The Shattered Halls/0 0.00,0.00 |c |noway |q 9492
step
Inside the Shattered Halls Dungeon:
kill Warchief Kargath Bladefist##16808
collect Warchief Kargath's Fist##23723 |q 9492/1
step
Leave The Shattered Halls Dungeon |goto The Shattered Halls/0 0.00,0.00 > 10 |c |noway |q 9492
step
talk Force Commander Danath Trollbane##16819
|tip Inside the building.
accept Turning the Tide##9492 |goto Hellfire Peninsula 56.6,68.6
step
Reach Level 70 |ding 70
step
Complete the "Cipher of Damnation" questline |q 10588
|tip Refer to the Cipher of Damnation guide to accomplish this.
step
talk Khadgar##18166
accept The Tempest Key##10883 |goto Shattrath City/0 54.75,44.32
step
talk A'dal##18481
turnin The Tempest Key##10883 |goto Shattrath City/0 54.0,44.6
accept Trial of the Naaru: Mercy##10884 |goto 54.0,44.6
step
Follow the path |goto Hellfire Peninsula/0 48.85,55.53 < 15 |only if walking
Rup up the ramp |goto 48.56,52.01 < 15 |only if walking
Run into the portal |goto 47.48,52.02 < 10 |walk
|tip You will need the Shattered Halls Key to enter this dungeon.
Enter The Shattered Halls Dungeon |goto The Shattered Halls/0 0.00,0.00 |c |noway |q 10884
step
Inside the (Heroic) Shattered Halls Dungeon:
kill Shattered Hand Executioner##17301
|tip Your group has 80 minutes to reach this enemy.
|tip You won't get the item for the quest if you are too slow.
collect Unused Axe of the Executioner##31716 |q 10884/1
step
Leave The Shattered Halls Dungeon |goto The Shattered Halls/0 0.00,0.00 > 10 |c |noway |q 10884
step
talk A'dal##18481
turnin Trial of the Naaru: Mercy##10884  |goto Shattrath City/0 54.0,44.6
]])
ZygorGuidesViewer:RegisterGuide("Dungeon Guides\\The Burning Crusade\\Auchenai Crypts Quests",{
author="support@zygorguides.com",
description="This guide will walk you through the Auchenai Crypts dungeon quests.",
},[[
step
Reach Level 66 |ding 66
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
talk Greatfather Aldrimus##19698
|tip Inside the building.
accept Everything Will Be Alright##10164 |goto Terokkar Forest/0 35.06,65.14
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
|tip Defend the two Boulderfist Saboteurs that spawn.
|tip They will walk around and plant bodies around this area.
Plant the Kil'sorrow Bodies |q 9932/1 |goto 46.59,24.25
step
Follow the path up |goto 73.84,68.07 < 10 |only if walking
talk Lantresor of the Blade##18261
turnin Returning the Favor##9931 |goto 73.81,62.61
turnin Body of Evidence##9932 |goto 73.81,62.61
step
Enter the building |goto Terokkar Forest/0 36.01,65.62 < 20 |walk
Run into the portal |goto 34.25,65.60 < 10 |walk
Enter the Auchenai Crypts Dungeon |goto Auchenai Crypts/0 0.00,0.00 |c |noway |q 10164
step
Inside the Auchenai Crypts Dungeon:
kill Exarch Maladaar##18373 |q 10164/1
|tip This is for the quest "Everything Will Be Alright".
step
label "Auchindoun..."
Inside the Auchenai Crypts Dungeon:
kill Exarch Maladaar##18373 |q 10167/1
|tip This is for the quest "Auchindoun...".
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
Leave the Auchenai Crypts Dungeon |goto Auchenai Crypts/0 0.00,0.00 > 10 |c |noway |q 10164
step
clicknpc Ancient Orc Ancestor##18688+
|tip They are non-aggressive ghosts that walk around this area.
|tip They can be hard to see, use the command "/tar Ancient" to help find them.
use the Soul Mirror##28283
kill 15 Darkened Spirit##19480+ |q 10168/1 |goto Nagrand/0 37.07,63.11
step
talk Mother Kashur##18687
turnin What the Soul Sees##10168 |goto 26.07,60.60
step
talk Greatfather Aldrimus##19698
|tip Inside the building.
turnin Everything Will Be Alright##10164 |goto Terokkar Forest/0 35.06,65.14
]])
ZygorGuidesViewer:RegisterGuide("Dungeon Guides\\The Burning Crusade\\Sethekk Halls Quests",{
author="support@zygorguides.com",
description="This guide will walk you through the Sethekk Halls dungeon quests.",
},[[
step
Reach Level 65 |ding 65
step
talk Oloraak##19045
accept Can't Stay Away##10180 |goto Shattrath City/0 57.99,15.20
step
talk Isfar##18933
turnin Can't Stay Away##10180 |goto Terokkar Forest/0 44.07,64.97
accept Brother Against Brother##10097 |goto Terokkar Forest/0 44.07,64.97
accept Terokk's Legacy##10098 |goto Terokkar Forest/0 44.07,64.97
step
Enter the building |goto Terokkar Forest/0 43.27,65.59 < 20 |walk
Run into the portal |goto 44.98,65.61 < 10 |walk
Enter the Sethekk Halls Dungeon |goto Sethekk Halls/0 0.00,0.00 |c |noway |q 10098
step
Inside the Sethekk Halls Dungeon:
kill Darkweaver Syth##18472 |q 10097/1
collect Terokk's Mask##27633 |q 10098/2
step
Inside the Sethekk Halls Dungeon:
click Cage
|tip You will only be able to activate it after the boss is defeated.
Free Lakka |q 10097/2
step
Inside the Sethekk Halls Dungeon:
click The Saga of Terokk
|tip In the room just before the last boss.
collect The Saga of Terokk##27634 |q 10098/1
step
Inside the Sethekk Halls Dungeon:
kill Talon King Ikiss##18473
collect Terokk's Quill##27632 |q 10098/3
step
Leave the Sethekk Halls Dungeon |goto Sethekk Halls/0 0.00,0.00 > 10 |c |noway |q 10098
step
talk Isfar##18933
turnin Brother Against Brother##10097 |goto Terokkar Forest/0 44.07,64.97
turnin Terokk's Legacy##10098 |goto Terokkar Forest/0 44.07,64.97
]])
ZygorGuidesViewer:RegisterGuide("Dungeon Guides\\The Burning Crusade\\Shadow Labyrinth Quests",{
author="support@zygorguides.com",
description="This guide will walk you through the Shadow Labyrinth dungeon quests.",
},[[
step
Reach Level 68 |ding 68
step
Complete the "City of Light" quest |q 10211 |future
|tip Refer to the Terokkar Forest leveling guide to accomplish this.
|tip You must also side with either Aldor or Scryers.
step
Enter the building |goto Shadowmoon Valley/0 56.08,58.32 < 7 |walk
talk Larissa Sunstrike##21954
|tip Inside the building.
accept Karabor Training Grounds##10687 |goto Shadowmoon Valley/0 55.73,58.17
|only if rep('The Scryers')>=Neutral
step
Kill Demon Hunter enemies around this area
collect 8 Sunfury Glaive##30679 |q 10687/1 |goto 68.51,52.68
|only if rep('The Scryers') >= Neutral
step
Enter the building |goto 56.07,58.31 < 10 |walk
talk Larissa Sunstrike##21954
|tip Inside the building.
turnin Karabor Training Grounds##10687 |goto 55.73,58.17
accept A Necessary Distraction##10688 |goto 55.73,58.17
|only if rep('The Scryers') >= Neutral
step
Kill Sunfury enemies around this area
|tip Only Sunfury Warlocks and Sunfury Summoners will drop the quest item.
collect Scroll of Demonic Unbanishing##30811 |q 10688 |goto 72.15,50.85
|only if rep ('The Scryers') >= Neutral
step
use the Scroll of Demonic Unbanishing##30811
|tip Use it on Azaloth.
|tip If the enemies around him are alive, try to get to him without killing them, if you can.
|tip They will fight Azaloth for you once you free him.
Free Azaloth |q 10688/1 |goto 69.81,51.41
|only if rep ('The Scryers') >= Neutral
step
Enter the building |goto 56.07,58.31 < 10 |walk
talk Larissa Sunstrike##21954
|tip Inside the building.
turnin A Necessary Distraction##10688 |goto 55.73,58.17
accept Altruis##10689 |goto 55.73,58.17
|only if rep('The Scryers') >= Neutral
step
talk Exarch Onaala##21860
accept Karabor Training Grounds##10587 |goto Shadowmoon Valley/0 61.20,29.24
|only if rep ('The Aldor') >= Neutral
step
Kill Demon Hunter enemies around this area
collect 8 Sunfury Glaive##30679 |q 10587/1 |goto 69.99,51.12
|only if rep ('The Aldor') >= Neutral
step
talk Exarch Onaala##21860
turnin Karabor Training Grounds##10587 |goto 61.20,29.24
accept A Necessary Distraction##10637 |goto 61.20,29.24
|only if rep ('The Aldor') >= Neutral
step
Kill Sunfury enemies around this area
|tip Only Sunfury Warlocks and Sunfury Summoners will drop the quest item.
collect Scroll of Demonic Unbanishing##30811 |q 10637 |goto 69.81,51.41
|only if rep ('The Aldor') >= Neutral
step
use the Scroll of Demonic Unbanishing##30811
|tip Use it on Azaloth.
|tip If the enemies around him are alive, try to get to him without killing them, if you can.
|tip They will fight Azaloth for you once you free him.
Free Azaloth |q 10637/1 |goto 69.81,51.41
|only if rep ('The Aldor') >= Neutral
step
talk Exarch Onaala##21860
turnin A Necessary Distraction##10637 |goto 61.20,29.24
accept Altruis##10640 |goto 61.20,29.24
|only if rep ('The Aldor') >= Neutral
step
talk Altruis the Sufferer##18417
turnin Altruis##10640 |goto Nagrand/0 27.34,43.09 |only if rep ('The Aldor') >= Neutral
turnin Altruis##10689 |goto Nagrand/0 27.34,43.09 |only if rep ('The Scryers') >= Neutral
accept Against the Legion##10641 |goto Nagrand/0 27.34,43.09
accept Against the Illidari##10668 |goto Nagrand/0 27.34,43.09
accept Against All Odds##10669 |goto Nagrand/0 27.34,43.09
step
use the Imbued Silver Spear##30853
kill Xeleth##21894 |q 10669/1 |goto Zangarmarsh/0 16.22,40.67
step
kill Wrath Priestess##18859+
collect Freshly Drawn Blood##30850 |goto Netherstorm/0 39.61,20.44 |q 10641
step
use the Freshly Drawn Blood##30850
|tip It only last 1 minute, then it disappears, so use it quickly.
kill Avatar of Sathal##21925 |q 10641/1 |goto 39.61,20.44
step
kill Lothros##21928 |q 10668/1 |goto Shadowmoon Valley/0 28.29,49.94
|tip He walks around this area.
step
talk Altruis the Sufferer##18417
turnin Against the Legion##10641 |goto Nagrand/0 27.34,43.09
turnin Against the Illidari##10668 |goto Nagrand/0 27.34,43.09
turnin Against All Odds##10669 |goto Nagrand/0 27.34,43.09
accept Illidan's Pupil##10646 |goto Nagrand/0 27.34,43.09
step
talk Altruis the Sufferer##18417
Tell him _"Tell me about the demon hunter training grounds at the Ruins of Karabor."_
Listen to Illidan's Pupil |q 10646/1 |goto 27.34,43.09
step
talk Altruis the Sufferer##18417
turnin Illidan's Pupil##10646 |goto 27.34,43.09
accept The Book of Fel Names##10649 |goto 27.34,43.09
step
kill Overseer Ripsaw##21499
|tip He walks around this area.
collect Illidari-Bane Shard##30579 |n
use the Illidari-Bane Shard##30579
accept Illidari-Bane Shard##10621 |goto Shadowmoon Valley/0 23.42,35.44
step
talk Grokom Deatheye##19333
turnin Illidari-Bane Shard##10621 |goto 29.79,31.26
accept Capture the Weapons##10626 |goto 36.82,54.89
step
kill Morgroron##21500
|tip He looks like a winged demon with 4 legs who walks around this area.
|tip You may need help with this.
collect Morgroron's Glaive##30785 |q 10626/2 |goto 23.31,38.05
step
kill Makazradon##21501
|tip He looks like a winged demon with 4 legs who walks around this area.
|tip You may need help with this.
collect Makazradon's Glaive##30786 |q 10626/1 |goto 22.30,35.94
step
talk Ordinn Thunderfist##19370
turnin Capture the Weapons##10626 |goto 36.82,54.89
step
Watch the dialogue
talk Ordinn Thunderfist##19370
accept The Hermit Smith##10662 |goto 36.82,54.89
step
talk David Wayne##21465
turnin The Hermit Smith##10662  |goto Terokkar Forest/0 77.6,38.6
accept Additional Materials##10664 |goto Terokkar Forest/0 77.6,38.6
step
talk Fantei##19678
buy 1 Demon Warding Totem##30823 |q 10664/3 |goto Shattrath City/0 64.69,70.67
step
collect 1 Adamantite Frame##23784 |q 10664/1
|tip This is crafted by Engineers with 4 Adamantite Bars and 1 Primal Earth.
|tip You can also purchase this from the Auction House.
step
collect 4 Heavy Knothide Leather##23793 |q 10664/2
|tip This is crafted by Engineers with 4 Adamantite Bars and 1 Primal Earth.
|tip You can also purchase this from the Auction House.
step
talk David Wayne##21465
turnin Additional Materials##10664 |goto Terokkar Forest/0 77.58,38.72
accept The Lexicon Demonica##10666 |goto Terokkar Forest/0 77.57,38.72
step
Reach Level 70 |ding 70
step
talk Apprentice Tasserel##23948
|tip Inside the building.
accept Archmage Alturus##11216  |goto Shattrath City/0 75.28,33.45
step
Follow the path up |goto Deadwind Pass/0 51.34,44.03 < 15 |only if walking
Follow the road |goto 44.53,52.97 < 15 |only if walking
Continue following the road |goto 53.18,57.77 < 15 |only if walking
Follow the road down |goto 55.53,78.70 < 15 |only if walking
talk Archmage Alturus##17613
turnin Archmage Alturus##11216 |goto 46.94,75.62
accept Arcane Disturbances##9824 |goto 46.92,75.63
accept Restless Activity##9825 |goto 46.92,75.63
stickystart "Collect_Ghostly_Essence"
step
Run down the stairs |goto 47.70,78.27 < 7 |walk
Continue down the path |goto 46.34,78.16 < 7 |walk
Jump down here |goto 44.28,74.27  < 10 |walk
use the Violet Scrying Crystal##24474
Read the Underground Pond |q 9824/2 |goto 43.66,77.10
step
Follow the path up |goto 44.25,75.01 < 10 |walk
Continue up the path |goto 44.94,73.87 < 10 |walk
Run up the ramp |goto 45.80,78.00 < 10 |walk
Run up the stairs |goto 47.21,78.24 < 7 |walk
Run down the stairs |goto 48.68,78.85 < 7 |walk
Follow the path |goto 54.55,82.55 < 15 |walk
use the Violet Scrying Crystal##24474
Underground Well Reading |q 9824/1 |goto 53.21,90.10
step
label "Collect_Ghostly_Essence"
Kill Enemies around this area
|tip Underground inside the cave.
collect 10 Ghostly Essence##24480 |q 9825/1 |goto 46.81,74.33
step
Follow the path up |goto 52.96,79.44 < 10 |walk
Run up the stairs |goto 49.14,78.92 < 10 |walk
talk Archmage Alturus##17613
turnin Arcane Disturbances##9824 |goto 46.92,75.63
turnin Restless Activity##9825 |goto 46.92,75.63
accept Contact from Dalaran##9826 |goto 46.92,75.64
step
talk Archmage Cedric##18165
turnin Contact from Dalaran##9826 |goto Alterac Mountains/0 15.60,54.58
accept Khadgar##9829 |goto 15.60,54.58
step
talk Khadgar##18166
turnin Khadgar##9829 |goto Shattrath City/0 54.75,44.32
accept Entry Into Karazhan##9831 |goto 54.75,44.32
step
talk Spymistress Mehlisah Highcrown##18893
accept Trouble at Auchindoun##10177 |goto Shattrath City/0 50.6,45.2
step
talk Field Commander Mahfuun##19542
turnin Trouble at Auchindoun##10177 |goto Terokkar Forest/0 40.05,72.16
accept The Codex of Blood##10094 |goto 40.05,72.16
step
talk Spy Grik'tha##19496
accept Find Spy To'gun##10178 |goto 39.94,72.27
step
Complete the "Cipher of Damnation" questline |q 10588
|tip Refer to the Cipher of Damnation guide to accomplish this.
step
talk A'dal##18481
accept Trial of the Naaru: Strength##10885 |goto Shattrath City/0 54.0,44.6
step
Swim into the underwater pipe |goto Zangarmarsh/0 50.39,40.84 < 15 |walk
Swim through the pipe |goto 51.41,39.40 < 10 |walk
Exit the pipe |goto 51.91,38.19 < 10 |walk
Run into the portal |goto 50.28,33.32 < 10 |walk
Enter The Steamvault Dungeon |goto The Steamvault/0 0.00,0.00 |c |noway
step
Inside The Steamvault Dungeon:
|tip This quest must be completed in Heroic mode.
kill Warlord Kalithresh##17798
collect 1 Kalithresh's Trident##31721 |q 10885/1
|tip He is the last boss of the instance.
|tip Use "The Steamvault" dungeon guide to accomplish this.
step
Leave The Steamvault Dungeon |goto The Steamvault/0 0.00,0.00 > 10 |c |noway
step
Enter the building |goto Terokkar Forest/0 39.64,70.98 < 20 |walk
|tip You need the Shadow Labyrinth Key to open the door.
Run into the portal |goto 39.63,73.60 < 10 |walk
Enter the Shadow Labyrinth Dungeon |goto Shadow Labyrinth/0 0.00,0.00 |c |noway |q 10649
step
Inside the Shadow Labyrinth Dungeon:
talk Spy To'gun##18891
|tip Facing the room with Blackheart the Inciter, instead clear trash to the right.
|tip Inside the cage.
turnin Find Spy To'gun##10178
accept The Soul Devices##10091
stickystart "The_Soul_Device"
step
Inside the Shadow Labyrinth Dungeon:
kill Blackheart the Inciter##18667
collect Book of Fel Names##30808 |q 10649/1
stickystart "Codex"
step
Inside the Shadow Labyrinth Dungeon:
kill Grandmaster Vorpil##18732
collect Lexicon Demonica##30827 |q 10666/1
step
label "Codex"
Inside the Shadow Labyrinth Dungeon:
clicknpc The Codex of Blood##6892
|tip Floating on the ground in front of Grandmaster Vorpil.
turnin The Codex of Blood##10094
accept Into the Heart of the Labyrinth##10095
step
Inside the Shadow Labyrinth Dungeon:
|tip This quest must be completed in Heroic mode.
kill Murmur##18708
collect 1 Murmur's Essence##31722 |q 10885/2
|tip It is the last boss of the instance.
|tip Use the "Shadow Labyrinth" dungeon guide to accomplish this.
step
Inside the Shadow Labyrinth Dungeon:
click Arcane Container
|tip It is in the room with Murmur.
|tip You can reach it without killing Murmur but we suggest you kill him to be safe.
collect First Key Fragment##24514 |q 9831/1
step
label "The_Soul_Device"
Inside the Shadow Labyrinth Dungeon:
click Soul Device
|tip They are along the walls throughout the entire instance.
collect 5 Soul Device##27480 |q 10091/1
step
Leave the Shadow Labyrinth Dungeon |goto Shadow Labyrinth/0 0.00,0.00 > 10 |c |noway |q 10649
step
talk A'dal##18481
|tip Inside the building.
turnin Trial of the Naaru: Strength##10885 |goto Shattrath City/0 53.98,44.71
step
talk David Wayne##21465
turnin The Lexicon Demonica##10666 |goto Terokkar Forest/0 77.57,38.72
step
talk Spymistress Mehlisah Highcrown##18893
turnin The Soul Devices##10091 |goto Shattrath City/0 50.6,45.2
turnin Into the Heart of the Labyrinth##10095 |goto 50.6,45.2
step
talk Khadgar##18166
turnin Entry Into Karazhan##9831 |goto Shattrath City/0 54.75,44.32
step
talk Altruis the Sufferer##18417
turnin The Book of Fel Names##10649 |goto Nagrand/0 27.34,43.09
]])
ZygorGuidesViewer:RegisterGuide("Dungeon Guides\\The Burning Crusade\\The Cipher of Damnation",{
author="support@zygorguides.com",
description="This guide will walk you through The Chiper of Damnation questline.",
},[[
step
talk Earthmender Sophurus##21937
accept The Hand of Gul'dan##10680 |goto Shadowmoon Valley/0 36.4,56.8
step
talk Earthmender Torlok##21024
turnin The Hand of Gul'dan##10680 goto 42.19,45.06
accept Enraged Spirits of Fire and Earth##10458 |goto 42.19,45.06
stickystart "Capture_Fiery_Souls"
step
use the Totem of Spirits##30094
kill Enraged Earth Spirit##21050+
|tip Kill them next to the totem you planted.
Capture #8# Earthen Souls |q 10458/1 |goto 48.97,47.60
step
label "Capture_Fiery_Souls"
use the Totem of Spirits##30094
kill Enraged Fire Spirit##21061+
|tip Kill them next to the totem you planted.
Capture #8# Fiery Souls |q 10458/2 |goto 48.97,47.60
step
talk Earthmender Torlok##21024
turnin Enraged Spirits of Fire and Earth##10458 |goto 42.19,45.06
accept Enraged Spirits of Water##10480 |goto 42.19,45.06
step
use the Totem of Spirits##30094
kill Enraged Water Spirit##21059+
|tip Kill them next to the totem you planted.
Capture #5# Watery Souls |q 10480/1 |goto 51.00,25.02
step
talk Earthmender Torlok##21024
turnin Enraged Spirits of Water##10480 |goto 42.19,45.06
accept Enraged Spirits of Air##10481 |goto 42.19,45.06
step
use the Totem of Spirits##30094
kill Enraged Air Spirit##21060+
|tip Kill them next to the totem you planted.
Capture #10# Air Souls |q 10481/1 |goto 59.39,69.39
step
talk Earthmender Torlok##21024
turnin Enraged Spirits of Air##10481 |goto 42.19,45.06
accept Oronok Torn-heart##10513 |goto 42.19,45.06
step
talk Oronok Torn-heart##21183
|tip If he or his Domesticated Felboar are being attacked, you will have to kill the Ravenous Flayers before you can talk to him.
turnin Oronok Torn-heart##10513 |goto 53.92,23.53
accept I Was A Lot Of Things...##10514 |goto 53.92,23.53
step
use Oronok's Boar Whistle##30462
|tip Use it next to Shadowmoon Tuber Mounds while a Domesticated Felboar is nearby.
|tip They look like carrots sticking out of the ground around this area.
click Shadowmoon Tuber##184691+
|tip A boar will run over and dig it up.
collect 10 Shadowmoon Tuber##30356 |q 10514/1 |goto 52.89,16.78
step
talk Oronok Torn-heart##21183
turnin I Was A Lot Of Things...##10514 |goto 53.92,23.53
accept A Lesson Learned##10515 |goto 53.92,23.53
step
click Ravenous Flayer Egg##184684+
|tip They look like brown spiked eggs on the ground around this area.
Destroy #10# Ravenous Flayer Eggs |q 10515/1 |goto 56.82,17.45
step
talk Oronok Torn-heart##21183
turnin A Lesson Learned##10515 |goto 53.92,23.53
accept The Cipher of Damnation - Truth and History##10519 |goto 53.92,23.53
step
talk Oronok Torn-heart##21183
Tell him _"I am ready to hear your story, Oronok."_
Learn About the Cipher of Damnation |q 10519/1 |goto 53.92,23.53
step
talk Oronok Torn-heart##21183
turnin The Cipher of Damnation - Truth and History##10519 |goto 53.92,23.53
accept Grom'tor, Son of Oronok##10521 |goto 53.92,23.53
accept Ar'tor, Son of Oronok##10527 |goto 53.92,23.53
accept Borak, Son of Oronok##10546 |goto 53.92,23.53
step
talk Grom'tor, Son of Oronok##21291
|tip He walks around this area.
turnin Grom'tor, Son of Oronok##10521 |goto 44.60,23.67
accept The Cipher of Damnation - Grom'tor's Charge##10522 |goto 44.60,23.67
step
Kill Coilskar enemies around this area
collect Coilskar Chest Key##30426 |n
|tip You need a key to open each chest.
click Coilskar Chest##184716+
|tip They look like big gray stone containers around this area.
collect First Fragment of the Cipher of Damnation##30428 |q 10522/1 |goto 46.59,27.86
step
talk Grom'tor, Son of Oronok##21291
|tip He walks around this area.
turnin The Cipher of Damnation - Grom'tor's Charge##10522 |goto 44.60,23.67
accept The Cipher of Damnation - The First Fragment Recovered##10523 |goto 44.60,23.67
step
talk Oronok Torn-heart##21183
turnin The Cipher of Damnation - The First Fragment Recovered##10523 |goto 53.92,23.52
step
talk Ar'tor, Son of Oronok##21292
turnin Ar'tor, Son of Oronok##10527 |goto 29.63,50.40
accept Demonic Crystal Prisons##10528 |goto 29.63,50.40
step
kill Painmistress Gabrissa##21309+
collect Crystalline Key##30442 |q 10528/1 |goto 28.01,47.58
step
talk Ar'tor, Son of Oronok##21292
turnin Demonic Crystal Prisons##10528 |goto 29.63,50.40
step
talk Spirit of Ar'tor##21318
accept Lohn'goron, Bow of the Torn-heart##10537 |goto 29.54,50.56
step
Kill Illidari enemies around this area
collect Lohn'goron, Bow of the Torn-Heart##30451 |q 10537/1 |goto 30.23,52.41
step
talk Spirit of Ar'tor##21318
turnin Lohn'goron, Bow of the Torn-heart##10537 |goto 29.54,50.56
accept The Cipher of Damnation - Ar'tor's Charge##10540 |goto 29.54,50.56
step
kill Veneratus the Many##20427
collect Second Fragment of the Cipher of Damnation##30453 |q 10540/1 |goto 30.68,58.23
step
talk Spirit of Ar'tor##21318
turnin The Cipher of Damnation - Ar'tor's Charge##10540 |goto 29.54,50.56
accept The Cipher of Damnation - The Second Fragment Recovered##10541 |goto 29.54,50.56
step
talk Borak, Son of Oronok##21293
turnin Borak, Son of Oronok##10546 |goto 47.56,57.17
accept Of Thistleheads and Eggs...##10547 |goto 47.56,57.17
step
click Rotten Arakkoa Egg##184795+
|tip They look like small pink eggs with green steam rising off of them inside nests and on the ground around this area.
collect Rotten Arakkoa Egg##30500 |q 10547/1 |goto 43.96,57.88
step
talk Oronok Torn-heart##21183
turnin The Cipher of Damnation - The Second Fragment Recovered##10541 |goto 53.92,23.52
step
talk Tobias the Filth Gorger##21411
turnin Of Thistleheads and Eggs...##10547 |goto Shattrath City/0 63.94,70.04
accept The Bundle of Bloodthistle##10550 |goto Shattrath City/0 63.94,70.04
step
talk Borak, Son of Oronok##21293
turnin The Bundle of Bloodthistle##10550 |goto Shadowmoon Valley/0 47.55,57.18
accept To Catch A Thistlehead##10570 |goto Shadowmoon Valley/0 47.55,57.18
step
use the Bundle of Bloodthistle##30616
|tip Use it and then hide and wait for him to dismiss his guard.
Watch the dialogue
kill Envoy Icarius##21409
collect Stormrage Missive##30617 |q 10570/1 |goto 48.97,57.50
step
talk Borak, Son of Oronok##21293
turnin To Catch A Thistlehead##10570 |goto 47.55,57.18
accept The Shadowmoon Shuffle##10576 |goto 47.55,57.18
step
Kill Eclipsion enemies around this area
collect 6 Eclipsion Armor##30640 |q 10576/1 |goto 48.21,65.82
step
talk Borak, Son of Oronok##21293
turnin The Shadowmoon Shuffle##10576 |goto 47.55,57.18
accept What Illidan Wants, Illidan Gets...##10577 |goto 47.55,57.18
step
use the Blood Elf Disguise##30639
Gain the Blood Elf Disguise |havebuff 133564 |goto 46.43,70.64 |q 10577
step
talk Grand Commander Ruusk##20563
Tell him _"I bring word from Lord Illidan."_
Deliver Illidan's Message |q 10577/1 |goto 46.45,71.93
step
talk Borak, Son of Oronok##21293
turnin What Illidan Wants, Illidan Gets...##10577 |goto 47.55,57.18
accept The Cipher of Damnation - Borak's Charge##10578 |goto 47.56,57.18
step
kill Ruul the Darkener##21315
|tip He looks like a Blood Elf riding a large purple drake.
|tip He walks around this area.
|tip You may need help with this.
collect Third Fragment of the Cipher of Damnation##30645 |q 10578/1 |goto 60.69,56.85
step
talk Borak, Son of Oronok##21293
turnin The Cipher of Damnation - Borak's Charge##10578 |goto 47.55,57.18
accept The Cipher of Damnation - The Third Fragment Recovered##10579 |goto 47.55,57.18
step
talk Oronok Torn-heart##21183
turnin The Cipher of Damnation - The Third Fragment Recovered##10579 |goto 53.92,23.54
accept The Cipher of Damnation##10588 |goto 53.92,23.52
step
use The Cipher of Damnation##30657
Watch the dialogue
talk Oronok Torn-heart##21685
|tip He walks around this area.
Tell him _"I am ready, Oronok. Let us destroy Cyrukh and free the elements!"_ |goto 43.03,44.87
Click Here to Proceed |confirm |q 10588
step
kill Cyrukh the Firelord##21181
|tip You may need help with this.
Slay Cyrukh the Firelord |q 10588/1 |goto 43.65,46.55
step
talk Earthmender Torlok##21024
turnin The Cipher of Damnation##10588 |goto 42.19,45.06
]])
ZGV.BETAEND()
ZygorGuidesViewer:RegisterGuide("Dungeon Guides\\The Burning Crusade\\Karazhan Attunement",{
author="support@zygorguides.com",
description="This guide will walk you through the Karazhan Attunement questline.",
condition_end=function() return completedq(9838) end,
},[[
step
Reach Level 70 |ding 70
step
talk Apprentice Tasserel##23948
|tip Inside the building.
accept Archmage Alturus##11216  |goto Shattrath City/0 75.28,33.45
step
Follow the road |goto Deadwind Pass/0 36.44,36.92 < 15 |only if walking
Continue following the road |goto 42.25,43.03 < 15 |only if walking
Cross the bridge |goto 45.86,62.93 < 15 |only if walking
Follow the road |goto 53.18,57.77 < 15 |only if walking
Follow the road down |goto 55.53,78.70 < 15 |only if walking
talk Archmage Alturus##17613
turnin Archmage Alturus##11216 |goto 46.94,75.62
accept Arcane Disturbances##9824 |goto 46.92,75.63
accept Restless Activity##9825 |goto 46.92,75.63
stickystart "Collect_Ghostly_Essence"
step
Run down the stairs |goto 47.70,78.27 < 7 |walk
Continue down the path |goto 46.34,78.16 < 7 |walk
Jump down here |goto 44.28,74.27  < 10 |walk
use the Violet Scrying Crystal##24474
Read the Underground Pond |q 9824/2 |goto 43.66,77.10
step
Follow the path up |goto 44.25,75.01 < 10 |walk
Continue up the path |goto 44.94,73.87 < 10 |walk
Run up the ramp |goto 45.80,78.00 < 10 |walk
Run up the stairs |goto 47.21,78.24 < 7 |walk
Run down the stairs |goto 48.68,78.85 < 7 |walk
Follow the path |goto 54.55,82.55 < 15 |walk
use the Violet Scrying Crystal##24474
Read the Underground Well |q 9824/1 |goto 53.21,90.10
step
label "Collect_Ghostly_Essence"
Kill enemies around this area
|tip Underground inside the cave.
collect 10 Ghostly Essence##24480 |q 9825/1 |goto 46.81,74.33
step
Follow the path up |goto Deadwind Pass/0 52.96,79.44 < 10 |walk
Run up the stairs |goto 49.14,78.92 < 10 |walk
talk Archmage Alturus##17613
turnin Arcane Disturbances##9824 |goto 46.92,75.63
turnin Restless Activity##9825 |goto 46.92,75.63
accept Contact from Dalaran##9826 |goto 46.92,75.64
step
talk Archmage Cedric##18165
turnin Contact from Dalaran##9826 |goto Alterac Mountains/0 15.60,54.58
accept Khadgar##9829 |goto 15.60,54.58
step
talk Khadgar##18166
turnin Khadgar##9829 |goto Shattrath City/0 54.75,44.32
accept Entry Into Karazhan##9831 |goto 54.75,44.32
step
Enter the building |goto Terokkar Forest/0 39.64,70.98 < 20 |walk
|tip You need the Shadow Labyrinth Key to open the door.
Run into the portal |goto 39.63,73.60
Enter the Shadow Labyrinth Dungeon |goto Shadow Labyrinth/0 0.00,0.00 |c |noway |q 9831
step
_Inside the Shadow Labyrinth Dungeon:_
click Arcane Container
|tip It is in the room with Murmur.
|tip You can reach it without killing Murmur but we suggest you kill him to be safe.
collect First Key Fragment##24514 |q 9831/1
step
talk Khadgar##18166
turnin Entry Into Karazhan##9831 |goto Shattrath City/0 54.75,44.32
accept The Second and Third Fragments##9832 |goto 54.75,44.32
step
Swim into the underwater pipe |goto Zangarmarsh/0 50.39,40.84 < 15 |walk
Swim through the pipe |goto 51.41,39.40 < 10 |walk
Exit the pipe |goto 51.91,38.19 < 10 |walk
Run into the portal |goto 50.28,33.32
Enter The Steamvault Dungeon |goto The Steamvault/0 0.00,0.00 |c |noway |q 9832
step
_Inside the Steamvault Dungeon:_
click Arcane Container
|tip Before the first boss in the instance.
|tip Clear trash making your way to the first boss.
|tip Pass the tunnel that progresses further into the instance and jump into the body of water to the right.
|tip Swim to the bottom near the left wall for the container.
collect Second Key Fragment##24487 |q 9832/1
step
Run into the portal |goto Netherstorm/0 74.49,57.68
|tip On the floating island.
Enter The Arcatraz Dungeon |goto The Arcatraz/0 0.00,0.00 |c |noway |q 9832
step
_Inside The Arcatraz Dungeon:_
collect Third Key Fragment##24488 |q 9832/2
step
talk Khadgar##18166
turnin The Second and Third Fragments##9832 |goto Shattrath City/0 54.75,44.32
accept The Master's Touch##9836 |goto 54.75,44.32
step
Run into the portal |goto Tanaris/0 57.09,63.16
Enter The Black Morass Dungeon |goto The Black Morass/0 0.00,0.00 |c |noway |q 9836
step
_Inside the Black Morass Dungeon:_
talk Medivh##15608
|tip You will be able to speak with him once you clear the instance.
turnin The Master's Touch##9836
accept Return to Khadgar##9837
step
talk Khadgar##18166
turnin Return to Khadgar##9837 |goto Shattrath City/0 54.75,44.32
accept The Violet Eye##9838 |goto 54.75,44.32
step
Follow the path up |goto Deadwind Pass/0 51.34,44.03 < 15 |only if walking
Follow the road |goto 44.53,52.97 < 15 |only if walking
Continue following the road |goto 53.18,57.77 < 15 |only if walking
Follow the road down |goto 55.53,78.70 < 15 |only if walking
talk Archmage Alturus##17613
turnin The Violet Eye##9838 |goto 46.92,75.63
]])
ZygorGuidesViewer:RegisterGuide("Dungeon Guides\\The Burning Crusade\\Hellfire Citadel Attunement",{
author="support@zygorguides.com",
description="This guide will walk you through the Hellfire Citadel Attunement questline.",
condition_end=function() return completedq(10764) end,
},[[
step
Reach Level 70 |ding 70
step
kill Smith Gorlunk##22037
collect Primed Key Mold##31239 |goto Shadowmoon Valley/0 67.6,36.4 |q 10754 |future
step
use the Primed Key Mold##31239
accept Entry Into the Citadel##10754
step
talk Force Commander Danath Trollbane##16819
turnin Entry Into the Citadel##10754 |goto Hellfire Peninsula/0 56.6,68.6
accept Grand Master Dumphry##10762
step
talk Dumphry##21209
turnin Grand Master Dumphry##10762 |goto 51.2,60.2
accept Dumphry's Request##10763 |goto 51.2,60.2
stickystart "Collect_Arcane_Dust"
stickystart "Collect_Mote_of_Fire"
step
collect 4 Fel Iron Bar##23445 |q 10763/1
|tip Create them with Mining or purchase them from the auction house.
step
label "Collect_Arcane_Dust"
collect 2 Arcane Dust##22445 |q 10763/2
|tip Disenchant them from Outland uncommon (green) items with Enchanting or purchase them from the auction house.
step
label "Collect_Mote_of_Fire"
collect 4 Mote of Fire##22574 |q 10763/3
|tip Farm them with Mining or purchase them from the auction house.
step
talk Dumphry##21209
turnin Dumphry's Request##10763 |goto 51.2,60.2
accept Hotter than Hell##10764 |goto 51.2,60.2
step
kill Fel Reaver##18733
|tip It patrols all around Hellfire Peninsula.
|tip This enemy is elite and may require a group.
use the Unfired Key Mold##31251
|tip Use it on the corpse of the Fel Reaver.
collect Charred Key Mold##31252 |q 10764/1
step
talk Dumphry##21209
turnin Hotter than Hell##10764 |goto 51.2,60.2
]])
ZygorGuidesViewer:RegisterGuide("Dungeon Guides\\The Burning Crusade\\Serpentshrine Cavern Attunement",{
author="support@zygorguides.com",
description="This guide will walk you through the Serpentshrine Cavern attunement questline.",
condition_end=function() return completedq(10901) end,
},[[
step
Reach Level 70 |ding 70
step
Complete the Karazhan Attunement Process |q 9838 |future
|tip Complete "The Violet Eye" quest.
|tip Use the "Karazhan Attunement" guide to accomplish this.
step
Swim into the underwater pipe |goto Zangarmarsh/0 50.39,40.84 < 15 |walk
Swim through the pipe |goto 51.41,39.40 < 10 |walk
Exit the pipe |goto 51.91,38.19 < 10 |walk
Run into the portal |goto 48.92,35.54
Enter The Slave Pens (Heroic) Dungeon |goto The Slave Pens/0 0.00,0.00 |c |noway |q 10901 |future
|tip You must complete this on Heroic difficulty.
step
_Inside the Slave Pens (Heroic) Dungeon:_
|tip You must complete this on Heroic difficulty.
talk Skar'this the Heretic##22421
|tip In a cage past Mennu the Betrayer after jumping into a large pool of water.
accept The Cudgel of Kar'desh##10901
step
_Inside the Gruul's Lair Raid:_
kill Gruul the Dragonkiller##19044
collect Earthen Signet##31750 |q 10901/2
step
Click Here to Proceed to Unlock Nightbane |confirm
|tip Someone needs to unlock the ability to summon Nightbane in Karazhan.
Click Here if a Group Member Can Summon Nightbane |confirm |next "Collect_Blazing_Signet" |q 10901 |or
|tip Use this option if someone can already summon Nightbane.
|tip This saves a lot of work.
step
Reach Honored Reputation with The Violet Eye |complete rep('The Violet Eye') >= Honored
step
Follow the path up |goto Deadwind Pass/0 51.34,44.03 < 15 |only if walking
Follow the road |goto 44.53,52.97 < 15 |only if walking
Continue following the road |goto 53.18,57.77 < 15 |only if walking
Follow the road down |goto 55.53,78.70 < 15 |only if walking
talk Archmage Alturus##17613
accept Medivh's Journal##9630 |goto 46.92,75.63
step
_Inside the Karazhan Raid:_
talk Wravien##16813
|tip Past The Curator in the Guardian's Library.
turnin Medivh's Journal##9630
accept In Good Hands##9638
step
_Inside the Karazhan Raid:_
talk Gradav##16814
|tip Past the Curator in the Guardian's Library.
turnin In Good Hands##9638
accept Kamsis##9639
step
_Inside the Karazhan Raid:_
talk Kamsis##16815
|tip Past the Curator in the Guardian's Library.
turnin Kamsis##9639
accept The Shade of Aran##9640
step
_Inside the Karazhan Raid:_
kill Shadow of Aran##16524
collect Medivh's Journal##23933 |q 9640/1
step
_Inside the Karazhan Raid:_
talk Kamsis##16815
|tip Past the Curator in the Guardian's Library.
turnin The Shade of Aran##9640
accept The Master's Terrace##9645
step
_Inside the Karazhan Raid:_
use Medivh's Journal##23934
Watch the Dialogue
|tip Go to the Master's Terrace.
|tip It's to the left of the back entrance to Karazhan.
Read Medivh's Journal at the Master's Terrace |q 9645/1
step
Follow the path up |goto Deadwind Pass/0 51.34,44.03 < 15 |only if walking
Follow the road |goto 44.53,52.97 < 15 |only if walking
Continue following the road |goto 53.18,57.77 < 15 |only if walking
Follow the road down |goto 55.53,78.70 < 15 |only if walking
talk Archmage Alturus##17613
turnin The Master's Terrace##9645 |goto 46.92,75.63
accept Digging Up the Past##9680 |goto 46.92,75.63
step
click Charred Bone Fragment
|tip It looks like a bone laying on the ground around this area.
collect Charred Bone Fragment##24152 |q 9680/1 |goto Deadwind Pass/0 44.07,77.91
step
talk Archmage Alturus##17613
turnin Digging Up the Past##9680 |goto 46.92,75.63
accept A Colleague's Aid##9631 |goto 46.92,75.63
step
talk Kalynna Lathred##17636
turnin A Colleague's Aid##9631 |goto Netherstorm/0 32.22,63.60
accept Kalynna's Request##9637 |goto 32.22,63.60
step
Enter the building |goto Terokkar Forest/0 43.27,65.59 < 20 |walk
Run into the portal |goto 44.98,65.61
Enter the Sethekk Halls (Heroic) Dungeon |goto Sethekk Halls/0 0.00,0.00 |c |noway |q 9637
step
_Inside the Sethekk Halls (Heroic) Dungeon:_
|tip You must complete this on Heroic difficulty.
kill Darkweaver Syth##18472
collect Book of Forgotten Names##25461 |q 9637/1
step
Follow the path |goto Hellfire Peninsula/0 48.85,55.53 < 15 |only if walking
Rup up the ramp |goto 48.56,52.01 < 15 |only if walking
Run into the portal |goto 47.48,52.02
|tip You will need the Shattered Halls Key to enter this dungeon.
Enter The Shattered Halls (Heroic) Dungeon |goto The Shattered Halls/0 0.00,0.00 |c |noway |q 9637
step
_Inside the Shattered Halls (Heroic) Dungeon:_
|tip You must complete this on Heroic difficulty.
kill Grand Warlock Nethekurse##16807
collect Tome of Dusk##25462 |q 9637/2
step
talk Kalynna Lathred##17636
turnin Kalynna's Request##9637 |goto Netherstorm/0 32.22,63.60
accept Nightbane##9644 |goto 32.22,63.60
stickystart "Collect_Blazing_Signet"
step
_Inside the Karazhan Raid:_
|tip Go to the Master's Terrace.
|tip It's to the left of the back entrance to Karazhan.
use the Blackened Urn##24140
kill Nightbane##17225
collect Faint Arcane Essence##24139 |q 9644/1
step
label "Collect_Blazing_Signet"
_Inside the Karazhan Raid:_
|tip Go to the Master's Terrace.
|tip It's to the left of the back entrance to Karazhan.
kill Nightbane##17225
collect Blazing Signet##31751 |q 10901/1
step
Follow the path up |goto Deadwind Pass/0 51.34,44.03 < 15 |only if walking
Follow the road |goto 44.53,52.97 < 15 |only if walking
Continue following the road |goto 53.18,57.77 < 15 |only if walking
Follow the road down |goto 55.53,78.70 < 15 |only if walking
talk Archmage Alturus##17613
turnin Nightbane##9644 |goto 46.92,75.63
|only if haveq(9644) or completedq(9644)
step
Swim into the underwater pipe |goto Zangarmarsh/0 50.39,40.84 < 15 |walk
Swim through the pipe |goto 51.41,39.40 < 10 |walk
Exit the pipe |goto 51.91,38.19 < 10 |walk
Run into the portal |goto 48.92,35.54
Enter The Slave Pens (Heroic) Dungeon |goto The Slave Pens/0 0.00,0.00 |c |noway |q 10901
|tip You must complete this on Heroic difficulty.
step
_Inside the Slave Pens (Heroic) Dungeon:_
|tip You must complete this on Heroic difficulty.
talk Skar'this the Heretic##22421
|tip In a cage past Mennu the Betrayer after jumping into a large pool of water.
turnin The Cudgel of Kar'desh##10901
]])
ZygorGuidesViewer:RegisterGuide("Dungeon Guides\\The Burning Crusade\\Tempest Keep Attunement",{
author="support@zygorguides.com",
description="This guide will walk you through the Tempest Keep attunement questline.",
condition_end=function() return completedq(10888) end,
},[[
step
Reach Level 70 |ding 70
step
Complete the "Cipher of Damnation" Questline |q 10588 |future
|tip Use the "Cipher of Damnation" guide to accomplish this.
step
talk Khadgar##18166
accept The Tempest Key##10883 |goto Shattrath City/0 54.75,44.32
step
talk A'dal##18481
|tip Inside the building.
turnin The Tempest Key##10883 |goto Shattrath City/0 54.0,44.6
accept Trial of the Naaru: Mercy##10884 |goto 54.0,44.6
step
Follow the path |goto Hellfire Peninsula/0 48.85,55.53 < 15 |only if walking
Rup up the ramp |goto 48.56,52.01 < 15 |only if walking
Run into the portal |goto 47.48,52.02
|tip You will need the Shattered Halls Key to enter this dungeon.
Enter The Shattered Halls (Heroic) Dungeon |goto The Shattered Halls/0 0.00,0.00 |c |noway |q 10884
|tip You must complete this on Heroic difficulty.
step
_Inside the Shattered Halls (Heroic) Dungeon:_
kill Shattered Hand Executioner##17301
|tip Just beyond Warchief Kargath Bladefist.
|tip The timer starts when you pass through Grand Warlock Nethekurse's room.
|tip The first of three prisoners is executed after 55 minutes have passed.
|tip An additional prisoner is executed every 15 minutes.
|tip At least one prisoner must remain alive to receive the quest item.
collect Unused Axe of the Executioner##31716 |q 10884/1
|tip You must complete this on Heroic difficulty.
step
talk A'dal##18481
|tip Inside the building.
turnin Trial of the Naaru: Mercy##10884  |goto Shattrath City/0 54.0,44.6
accept Trial of the Naaru: Strength##10885 |goto 54.0,44.6
step
_Inside The Steamvault (Heroic) Dungeon:_
kill Warlord Kalithresh##17798
|tip He is the last boss of the instance.
collect 1 Kalithresh's Trident##31721 |q 10885/1
|tip You must complete this on Heroic difficulty.
step
Enter the building |goto Terokkar Forest/0 39.64,70.98 < 20 |walk
|tip You need the Shadow Labyrinth Key to open the door.
Run into the portal |goto 39.63,73.60
Enter the Shadow Labyrinth (Heroic) Dungeon |goto Shadow Labyrinth/0 0.00,0.00 |c |noway |q 10885
|tip You must complete this on Heroic difficulty.
step
_Inside the Shadow Labyrinth (Heroic) Dungeon:_
kill Murmur##18708
collect 1 Murmur's Essence##31722 |q 10885/2
|tip You must complete this on Heroic difficulty.
step
talk A'dal##18481
|tip Inside the building.
turnin Trial of the Naaru: Strength##10885 |goto Shattrath City/0 54.0,44.6
accept Trial of the Naaru: Tenacity##10886 |goto 54.0,44.6
step
Run into the portal |goto Netherstorm/0 74.49,57.68
|tip On the floating island.
Enter The Arcatraz (Heroic) Dungeon |goto The Arcatraz/0 0.00,0.00 |c |noway |q 10886
|tip You must complete this on Heroic difficulty.
step
_Inside The Arcatraz (Heroic) Dungeon:_
kill Harbinger Skyriss##20912
|tip Once Millhouse Manastorm is released, make sure he doesn't die.
Rescue Millhouse Manastorm from the Arcatraz |q 10886/1
|tip You must complete this on Heroic difficulty.
step
talk A'dal##18481
|tip Inside the building.
turnin Trial of the Naaru: Tenacity##10886 |goto Shattrath City/0 54.0,44.6
accept Trial of the Naaru: Magtheridon##10888 |goto 54.0,44.6
step
_Inside the Magtheridon's Lair Raid:_
kill Magtheridon##17257 |q 10888/1
step
talk A'dal##18481
|tip Inside the building.
turnin Trial of the Naaru: Magtheridon##10888 |goto Shattrath City/0 54.0,44.6
]])
ZygorGuidesViewer:RegisterGuide("Dungeon Guides\\The Burning Crusade\\Mount Hyjal Attunement",{
author="support@zygorguides.com",
description="This guide will walk you through the Mount Hyjal attunement questline.",
},[[
step
Reach Revered Reputation with the Keepers of Time |complete rep('Keepers of Time') >= Revered
|tip Refer to the Keepers of Time reputation guide to accomplish this.
step
talk Soridormi##19935
|tip She walks around in a circle in the Caverns of Time.
accept The Vials of Eternity##10445 |goto Tanaris/0 60.22,58.65
step
_Inside the Serpentshrine Cavern Raid:_
kill Lady Vashj##21212
collect Vashj's Vial Remnant##29906 |q 10445/1
step
_Inside the Tempest Keep Raid:_
kill Kael'thas Sunstrider##19622
collect Kael's Vial Remnant##29905 |q 10445/2
step
talk Soridormi##19935
|tip She walks around in a circle in the Caverns of Time.
turnin The Vials of Eternity##10445 |goto Tanaris/0 60.22,58.65
]])
ZygorGuidesViewer:RegisterGuide("Dungeon Guides\\The Burning Crusade\\Black Temple Attunement",{
author="support@zygorguides.com",
description="This guide will walk you through the Black Temple attunement questline.",
},[[
step
Enter the building |goto Shadowmoon Valley/0 56.44,59.13 < 7 |walk
talk Arcanist Thelis##21955
|tip Inside the building.
accept Tablets of Baa'ri##10683 |goto 56.25,59.60
|only if rep('The Scryers')>=Neutral
step
Follow the path up |goto 61.35,67.12 < 40 |only if walking
Follow the path |goto 62.36,62.36 < 30 |only if walking
Follow the road |goto 63.17,51.55 < 50 |only if walking
Follow the path up |goto 61.36,38.02 < 20 |only if walking
kill Ashtongue Worker##21455+
click Baar'ri Tablet Fragment##184870+
|tip They look like green glowing broken stone pieces on the ground around this area.
collect 12 Baa'ri Tablet Fragment##30596 |q 10683/1 |goto 57.49,35.62
|only if rep('The Scryers') >= Neutral
step
talk Arcanist Thelis##21955
|tip Inside the building.
turnin Tablets of Baa'ri##10683 |goto 56.25,59.60
accept Oronu the Elder##10684 |goto 56.25,59.60
|only if rep ('The Scryers') >= Neutral
step
Follow the road |goto 63.17,51.55 < 50 |only if walking
Follow the path up |goto 61.36,38.02 < 20 |only if walking
Follow the path |goto 58.65,36.55 < 30 |only if walking
Enter the building |goto 57.01,34.02 < 15 |only if walking
kill Oronu the Elder##21663
collect Orders From Akama##30649 |q 10684/1 |goto 57.19,32.87
|only if rep ('The Scryers') >= Neutral
step
Follow the road |goto 63.10,38.71 < 50 |only if walking
Continue following the road |goto 62.76,52.72 < 50 |only if walking
Enter the building |goto 56.43,59.16 < 10 |walk
talk Arcanist Thelis##21955
|tip Inside the building.
turnin Oronu the Elder##10684 |goto 56.25,59.59
accept The Ashtongue Corruptors##10685 |goto 56.25,59.59
|only if rep ('The Scryers') >= Neutral
step
kill Haalum##21711
|tip Destroy the four totems to make him vulnerable.
collect Haalum's Medallion Fragment##30691 |q 10685/2 |goto 57.0,73.6
|only if rep ('The Scryers') >= Neutral
step
kill Eykenen##21709
|tip Destroy the four totems to make him vulnerable.
collect Eykenen's Medallion Fragment##30692 |q 10685/1 |goto 51.2,52.8
|only if rep ('The Scryers') >= Neutral
step
kill Uylaru##21710
|tip Destroy the four totems to make him vulnerable.
collect Uylaru's Medallion Fragment##30694 |q 10685/4 |goto 48.6,39.4
|only if rep ('The Scryers') >= Neutral
step
kill Lakaan##21416
|tip Destroy the four totems to make him vulnerable.
collect Lakaan's Medallion Fragment##30693 |q 10685/3 |goto 49.8,23.6
|only if rep ('The Scryers') >= Neutral
step
talk Arcanist Thelis##21955
|tip Inside the building.
turnin The Ashtongue Corruptors##10685 |goto 56.25,59.59
accept The Warden's Cage##10575 |goto 56.25,59.59
|only if rep ('The Scryers') >= Neutral
step
Enter the building |goto Shadowmoon Valley/0 62.31,28.95 < 10 |walk
talk Anchorite Ceyla##21402
|tip Inside the building.
accept Tablets of Baa'ri##10568 |goto 62.58,28.38
|only if rep ('The Aldor') >= Neutral
step
Follow the path up |goto 61.36,38.02 < 20 |only if walking
kill Ashtongue Worker##21455+
click Baar'ri Tablet Fragment##184870+
|tip They look like green glowing broken stone pieces on the ground around this area.
collect 12 Baa'ri Tablet Fragment##30596 |q 10568/1 |goto 57.49,35.62
|only if rep('The Aldor') >= Neutral
step
Enter the building |goto 62.31,28.96 < 10 |walk
talk Anchorite Ceyla##21402
|tip Inside the building.
turnin Tablets of Baa'ri##10568 |goto 62.58,28.38
accept Oronu the Elder##10571 |goto 62.58,28.38
|only if rep('The Aldor') >= Neutral
step
Follow the path up |goto 61.36,38.02 < 20 |only if walking
Follow the path |goto 58.65,36.55 < 30 |only if walking
Enter the building |goto 57.01,34.02 < 15 |only if walking
kill Oronu the Elder##21663
collect Orders From Akama##30649 |q 10571/1 |goto 57.19,32.87
|only if rep ('The Aldor') >= Neutral
step
Run up the stairs |goto 61.44,30.85 < 20 |only if walking
Enter the building |goto 62.31,28.96 < 10 |walk
talk Anchorite Ceyla##21402
|tip Inside the building.
turnin Oronu the Elder##10571 |goto 62.58,28.38
accept The Ashtongue Corruptors##10574 |goto 56.25,59.59
|only if rep('The Aldor') >= Neutral
step
kill Lakaan##21416
|tip Destroy the four totems to make him vulnerable.
collect Lakaan's Medallion Fragment##30693 |q 10574/3 |goto 49.8,23.6
|only if rep('The Aldor') >= Neutral
step
kill Uylaru##21710
|tip Destroy the four totems to make him vulnerable.
collect Uylaru's Medallion Fragment##30694 |q 10574/4 |goto 48.6,39.4
|only if rep('The Aldor') >= Neutral
step
kill Eykenen##21709
|tip Destroy the four totems to make him vulnerable.
collect Eykenen's Medallion Fragment##30692 |q 10574/1 |goto 51.2,52.8
|only if rep('The Aldor') >= Neutral
step
kill Haalum##21711
|tip Destroy the four totems to make him vulnerable.
collect Haalum's Medallion Fragment##30691 |q 10574/2 |goto 57.0,73.6
|only if rep('The Aldor') >= Neutral
step
Run up the stairs |goto 61.44,30.85 < 20 |only if walking
Enter the building |goto 62.31,28.96 < 10 |walk
talk Anchorite Ceyla##21402
|tip Inside the building.
turnin The Ashtongue Corruptors##10574 |goto 62.58,28.38
accept The Warden's Cage##10575 |goto 56.25,59.59
|only if rep('The Aldor') >= Neutral
step
talk Sanoru##21826
|tip Downstairs inside the building.
turnin The Warden's Cage##10575 |goto 57.33,49.58
accept Proof of Allegiance##10622 |goto 57.33,49.58
step
kill Zandras##21827 |q 10622/1 |goto 57.98,48.95
|tip He walks along the wall.
step
talk Sanoru##21826
|tip Downstairs inside the building.
turnin Proof of Allegiance##10622|goto 57.33,49.58
accept Akama##10628 |goto 57.33,49.58
step
Swim through the tunnel |goto 57.65,47.79 < 5 |walk
talk Akama##21700
turnin Akama##10628 |goto 58.11,48.19
accept Seer Udalo##10705 |goto 58.11,48.19
step
Inside The Arcatraz Dungeon:
talk Udalo##21962
Find Seer Udalo |q 10705/1
step
Inside The Arcatraz Dungeon:
talk Udalo##21962
turnin Seer Udalo##10705
accept A Mysterious Portent##10706
step
Run down the ramp |goto Shadowmoon Valley/0 57.36,49.66 < 5 |walk
Swim through the tunnel |goto 57.65,47.79 < 5 |walk
talk Akama##21700
turnin A Mysterious Portent##10706 |goto 58.11,48.19
accept The Ata'mal Terrace##10707 |goto 58.11,48.19
step
Kill enemies around this area
|tip Shadowlord Deathwail will appear when the area is clear.
kill Shadowlord Deathwail##22006 |goto 71.4,35.6
|tip You may need help with this.
collect Heart of Fury##31307 |q 10707/1
step
Run down the ramp |goto Shadowmoon Valley/0 57.36,49.66 < 5 |walk
Swim through the tunnel |goto 57.65,47.79 < 5 |walk
talk Akama##21700
turnin The Ata'mal Terrace##10707 |goto 58.11,48.19
accept Akama's Promise##10708 |goto 58.11,48.19
step
talk A'dal##18481
|tip Inside the building.
turnin Akama's Promise##10708 |goto Shattrath City/0 53.98,44.71
step
Inside the Serpent Shrine Cavern Raide:
kill Fathom-Lord Karathress##21214
talk Seer Olum##22820
|tip He will only offer the quest after defeating Fathom-Lord Karathress.
|tip He is available only for a certain amount of time.
accept The Secret Compromised##10944
step
Run down the ramp |goto Shadowmoon Valley/0 57.36,49.66 < 5 |walk
Swim through the tunnel |goto 57.65,47.79 < 5 |walk
talk Akama##21700
turnin The Secret Compromised##10944 |goto 58.11,48.19
accept Ruse of the Ashtongue##10946 |goto 58.11,48.19
step
Inside the Tempest Keep Raid:
use the Ashtongue Cowl##31946
|tip Use it at any point before the Al'ar encounter.
kill Al'ar##19514
Slay Al'ar while wearing the Ashtongue Cowl |q 10946/1
step
Run down the ramp |goto Shadowmoon Valley/0 57.36,49.66 < 5 |walk
Swim through the tunnel |goto 57.65,47.79 < 5 |walk
talk Akama##21700
turnin Ruse of the Ashtongue##10946 |goto 58.11,48.19
accept An Artifact From the Past##10947 |goto 58.11,48.19
step
Inside the Hyjal Summit Raid:
kill Rage Winterchill##17767
collect Time-Phased Phylactery##32459 |q 10947/1
step
Run down the ramp |goto Shadowmoon Valley/0 57.36,49.66 < 5 |walk
Swim through the tunnel |goto 57.65,47.79 < 5 |walk
talk Akama##21700
turnin An Artifact From the Past##10947 |goto 58.11,48.19
accept The Hostage Soul##10948 |goto 58.11,48.19
step
talk A'dal##18481
|tip Inside the building.
turnin The Hostage Soul##10948 |goto Shattrath City/0 53.98,44.71
accept Entry into the Black Temple##10949 |goto 53.98,44.71
step
talk Xi'ri##18528
turnin Entry into the Black Temple##10949 |goto Shadowmoon Valley 65.2,44.0
accept A Distraction for Akama##10985 |goto 65.2,44.0
step
Kill enemies around this area
|tip Akama and Maiev may not show up immediately.
|tip It can take around 5 minutes for the event to start.
|tip Watch for Akama and Maiev then follow them.
Watch the dialogue
Help Akama and Maiev enter the Black Temple |q 10985/1 |goto 71.1,46.3
step
talk Xi'ri##18528
turnin A Distraction for Akama##10985 |goto 65.2,44.0
]])
ZygorGuidesViewer:RegisterGuide("Dungeon Guides\\Wrath of the Lich King\\Utgarde Keep (69-72)",{
author="support@zygorguides.com",
description="This guide will walk you through completing Utgarde Keep.",
condition_end=function() return completedq() end,
},[[
step
kill Prince Keleseth##23953
|tip He will use "Frost Tomb" on random party members, stunning them for 20 seconds as well as dealing frost damage.
|tip Prioritize breaking players from Frost Tomb.
|tip Around 5 "Vrykul Skeletons" will spawn in at random.
|tip Group them together when they die as they will continuously get up during the fight.
|tip Group up in front of the tank so that adds are easily controlled as well as to easily manage Frost Tomb.
Click Here to Continue |confirm
step
kill Skarvald the Constructor##24200
kill Dalronn##24201
|tip He deals steady, moderate dps.
|tip During the encounter, he will randomly "Intercept" players not at the top of the threat list.
|tip It deals high damage then knocks the target down.
|tip Dalronn is highly resistant to magical damage.
|tip The goal is to have both of them die at the same time.
|tip If not, kill Dalronn first as his aggro table is more random than Skarvald when they become ghosts.
|tip If you kill Skarvald first, group together tightly so that he doesn't charge around.
Click Here to Continue |confirm
step
kill Ingvar the Plunderer##23954
|tip Melee need to stay behind him at all times.
|tip Players need to move out of the "Shadow Axe".
|tip During "Dark Smash" all players need to LoS behind pillars.
|tip Casters be on the look out for "Dreadful Roar" as it will interrupt spells.
Click Here to Continue |confirm
]])
ZygorGuidesViewer:RegisterGuide("Dungeon Guides\\Wrath of the Lich King\\Utgarde Keep Quests",{
author="support@zygorguides.com",
description="This guide will walk you through completing the quests for Utgarde Keep.",
condition_end=function() return completedq() end,
},[[
step
talk Defender Mordun##24111
accept Into Utgarde!##11252 |goto Howling Fjord 59.6,49.0
accept Disarmament##13205 |goto Howling Fjord 59.6,49.0
stickystart "Collect_Vrykul_Weapons"
step
Inside Utgarde Keep:
kill Ingvar the Plunderer##23954
|tip He's the final boss of the instance.
collect Ingvar's Head##33330 |q 11252/1
step
label "Collect_Vrykul_Weapons"
Inside Utgarde Keep:
click Vrykul Weapons##193059
|tip They look like weapon racks along the walls throughout the instance.
collect 5 Vrykul Weapon##43513 |q 13205/1
step
talk Defender Mordun##24111
turnin Disarmament##13205 |goto Howling Fjord 59.6,49.0
step
talk Vice Admiral Keller##23546
turnin Into Utgarde!##11252 |goto 60.6,61.2
]])
ZygorGuidesViewer:RegisterGuide("Dungeon Guides\\Wrath of the Lich King\\The Nexus (69-73)",{
author="support@zygorguides.com",
description="This guide will walk you through completing The Nexus.",
condition_end=function() return completedq() end,
},[[
step
kill Grand Magus Telestra##26731
|tip During the first phase, she will cast "Firebomb" which will deal AoE damage around the initial target.
|tip She will cast "Gravity Well" which will draw anyone within 60 yards towards her.
|tip Finally she will also use "Ice Nova" which will stun anyone hit by it for 3 seconds.
|tip At 50% she will split into 3 clones.
|tip Use CC on 2 of them if possible.
|tip If you have no CC, kill the Frost, Fire then Arcane Magus.
|tip Once the clones are dealt with, she will reappear, using the 3 abilities before the cloning.
|tip At 25%, she will freeze the part and cast "Fireball Volley", so make sure the group is as topped off on health as possible.
Click Here to Continue |confirm
step
kill Anomalus##26763
|tip During the encounter at 75%, 50% and 25% he will summon a "Chaotic Rift".
|tip This will summon "Crazed Mana-Wraiths" which deal ranged damage.
|tip The DPS target priority should be: Chaotic Rifts, Crazed Mana-Wraiths, Anomalus.
|tip Kill adds and burn Anomalus as fast as possible.
Click Here to Continue |confirm
step
kill Ormorok the Tree-Shaper##26794
|tip He will use "Crystal Spikes" that will spread out from him.
|tip Avoid the spikes and dps the boss down.
Click Here to Continue |confirm
step
kill Keristrasza##26723
|tip During the encounter, it is important to always jump or move to avoid the affects of "Intense Cold".
|tip Avoid being behind her due to "Tail Sweep", which deals damage and knocking you back.
|tip She will cast "Crystal Chains", which renders the target immobile.
|tip It can be removed by anything that can remove Magic.
|tip Avoid attacking from the front as she uses "Crystalfire Breath" which will deal a lot of damage and slow you.
|tip
Click Here to Continue |confirm
]])
ZygorGuidesViewer:RegisterGuide("Dungeon Guides\\Wrath of the Lich King\\The Nexus Quests",{
author="support@zygorguides.com",
description="This guide will walk you through completing the quests for The Nexus.",
condition_end=function() return completedq() end,
},[[
step
ding 71
step
talk Archmage Berinand##25314
|tip Inside the building.
accept Secrets of the Ancients##11910 |goto Borean Tundra 32.95,34.40
step
kill Glacial Ancient##25709+
|tip They look like large white and brown walking trees.
|tip You can find them all around the Coldarra area. |notinsticky
collect 3 Glacial Splinter##35483 |q 11910/1 |goto 34.13,25.70
step
kill Magic-Bound Ancient##25707+
|tip They look like large purple and white walking trees.
|tip You can find them all around the Coldarra area. |notinsticky
collect 3 Magic-Bound Splinter##35484 |q 11910/2 |goto 34.13,25.70
step
talk Archmage Berinand##25314
|tip Inside the building.
turnin Secrets of the Ancients##11910 |goto 32.95,34.40
accept Postponing the Inevitable##11905 |goto Borean Tundra 32.95,34.40
accept Quickening##11911 |goto Borean Tundra 32.95,34.40
step
talk Librarian Serrah##26110
accept Have They No Shame?##13094  |goto Borean Tundra 33.49,34.38
step
talk Raelorasz##
accept Prisoner of War##11973
step
Inside the Dungeon:
click Berinand's Research##192788
|tip It looks like a book on the floor in the Hall of Statis.
collect Berinand's Research##43095 |q 13094/1
step
Inside the Dungeon:
Use the Interdimensional Refabricator##35479
|tip At the back of the Platform with the Anomalus boss.
Stall the Interdimensional Rift |q 11905/1
step
Inside the Dungeon:
kill Keristrasza##26723 |q 11973/1
step
Inside the Dungeon:
kill Crystalline Protector##26792
|tip They are all around the Singing Grove area of the dungeon.
collect 5 Arcane Splinter##35490 |q 11911/1
step
talk Archmage Berinand##25314
|tip Inside the building.
turnin Postponing the Inevitable##11905 |goto Borean Tundra 32.95,34.40
turnin Quickening##11911 |goto Borean Tundra 32.95,34.40
]])
ZygorGuidesViewer:RegisterGuide("Dungeon Guides\\Wrath of the Lich King\\Azjol-Nerub (72-74)",{
author="support@zygorguides.com",
description="This guide will walk you through completing Azjol-Nerub.",
condition_end=function() return completedq() end,
},[[
step
kill Krik'thir the Gatewatcher##28684
|tip There will be 3 packs of enemies before the boss.
|tip Each pack has a mini-boss mixed in with two adds.
|tip Left Pack: The mini-boss deals AoE cone damage, so the tank should face it away from the party as best they can.
|tip Middle Pack: The mini-boss does an AoE cone web that disorients victims for 3 seconds.
|tip Right Pack: The mini-boss deals damage quickly.
|tip During the encounter, random party member will be webbed and need to be freed before all else.
|tip After that, focus on killing "Anub'ar Skirmishers" as they drop aggro and can't be taunted.
|tip After the 3 packs are dealt with, the boss will immediately aggro.
Click Here to Continue |confirm
step
kill Hadronox##28921
|tip When reaching the webbed funnel, engage the "Crusher" with its two elite companions pulling them to a nearby wall.
|tip Tank with your back to the wall so it mitigates the affect of the Crusher tossing you into the air.
|tip Deal with the 2 adds before the Crusher.
|tip Killing this pack will cause Hadronox to climb the web.
|tip 2 more groups similar to the first Crusher group will appear.
|tip Deal with them in a similar manner as fast as possible.
|tip After the 3 crusher groups are dealt with, wait at the round platformed that you entered the web at, with the tank waiting a little ahead.
|tip Let Hadronox finish the adds before engaging.
|tip If possible, cleanse poisons on allies.
|tip Otherwise, you will need to deal with "Leech Poison", which will heal Hadronox each time someone takes damage from it.
|tip Avoid the poison clouds on the ground and burn him down as fast as possible.
Click Here to Continue |confirm
step
kill Anub'arak##29120
|tip Before running in, ensure your group is prepared as a wall will block the arena shortly after engaging the boss.
|tip Have the tank move Anub'arak to the center of the arena and the rest of the group spread out.
|tip The tank will occasionally get stunned so mind the DPS during those times.
|tip When not submerged, adds will spawn that should quickly be killed off.
|tip He will also use "Insect Swarm" while not submerged, dealing constant AoE to the party.
|tip When he submerges, kill all adds until he resurfaces.
|tip Keep an eye out for the ground to shift beneath you, indicating the next area to be hit with Spikes.
|tip Repeat until he is defeated.
]])
ZygorGuidesViewer:RegisterGuide("Dungeon Guides\\Wrath of the Lich King\\Azjol-Nerub Quests",{
author="support@zygorguides.com",
description="This guide will walk you through completing the quests for Azjol-Nerub.",
condition_end=function() return completedq() end,
},[[
step
ding 72
step
talk Kilix the Unraveler##26653
|tip Inside the cave, on the middle floor.
accept Death to the Traitor King##13167 |goto Dragonblight 26.18,50.78
accept Don't Forget the Eggs!##13182 |goto Dragonblight 26.18,50.78
step
Inside the Dungeon:
click Nerubian Scourge Egg
Destroy #6# Nnerubian Scourge Eggs |q 13182/1
step
Inside the Dungeon:
kill Anub'arak##29120
collect Anub'arak's Broken Husk##43411 |q 13167/1
step
talk Kilix the Unraveler##26653
|tip Inside the cave, on the middle floor.
turnin Death to the Traitor King##13167 |goto Dragonblight 26.18,50.78
turnin Don't Forget the Eggs!##13182 |goto Dragonblight 26.18,50.78
]])
ZygorGuidesViewer:RegisterGuide("Dungeon Guides\\Wrath of the Lich King\\Ahn'kahet: The Old Kingdom (73-75)",{
author="support@zygorguides.com",
description="This guide will walk you through completing Ahn'kahet: The Old Kingdom.",
condition_end=function() return completedq() end,
},[[
step
kill Elder Nadox##29309
|tip He will use "Blood Plauge" dealing 1275 nature damage every 3 seconds and lasts for 30.
|tip He will occasionally summon "Ahn'kahar Swarmers" which should be AoE'd down asap so you don't get overwhelmed.
|tip Occassionally, he will also summon "Ahn'kahar Guardians" which make everything around it immune to damage.
|tip All damage should be focused on them immediately.
|tip Repeat the process until Elder Nadox is killed.
Click Here to Continue |confirm
step
kill Prince Taldaram##29308
|tip To activate him, there are two platforms that you need to cleared.
|tip There will be Crystal Orbs on each which you need to click that'll summon him to his arena.
|tip He will cast "Conjure Flame Sphere" at a player.
|tip All other players should try to avoid its path as best possible.
|tip Occasionally, he will "Vanish" and use "Embrace of the Vampyr", causing him to stun his target dealing constant heavy shadow damage until he sustains 20,000 damage himself.
|tip Heavy heals will likely be needed for each of these.
|tip Repeat the avoiding his tactics as best possible and defeat him.
Click Here to Continue |confirm
step
kill Jedoga Shadowseeker##29310
|tip AoE down the Twilight Initiates beneath her, moving up to the platform beneath her to start the encounter.
|tip Be sure to move in close to where she lands as a bunch of adds will run up surrounding the arena.
|tip When she aggros, pay attention for circles of lightning that appear on the ground beneath random players.
|tip If possible, keep at a range from her as "Cyclone Strike" deals damage to anyone near her.
|tip During the fight, she will go immune to damage and float back into the air.
|tip An add will activate from the group that came to surround you.
|tip Kill it before it reaches Jedoga or its health will be added to hers and also grant her a 200% damage buff.
|tip After the minion is gone, she will land.
|tip Repeat until she is killed.
Click Here to Continue |confirm
step
kill Herald Volazj##29311
|tip The boss has a move called "Insanity".
|tip During Insanity, players will come face to face with a reflection of themselves that they must defeat.
|tip If you are able, during Insanity casts, remove your weapon so the add that spawns deals less damage.
|tip DPS should be able to deal with their clones fast and help their fellow party members.
|tip Other than that, he will cast "Shadow Bolt Volley" hitting everyone in the arena.
|tip Spread out so that "Shiver" can't jump to other players damaging them.
|tip He will also cast "Mind Flay" on random nearby players, causign shadow damage.
Click Here to Continue |confirm
]])
ZygorGuidesViewer:RegisterGuide("Dungeon Guides\\Wrath of the Lich King\\Ahn'kahet: The Old Kingdom Quests",{
author="support@zygorguides.com",
description="This guide will walk you through completing the quests for Ahn'kahet: The Old Kingdom.",
condition_end=function() return completedq() end,
},[[
step
ding 73
step
talk Kilix the Unraveler##26653
|tip Inside the cave, on the middle floor.
accept The Faceless Ones##13187 |goto Dragonblight 26.18,50.78
step
Inside the Dungeon:
kill Savage Cave Beast##30329
|tip They are to the left of the Desecrated Altar and the Jedoga Shadowseeker boss.
collect Ooze-covered Fungus##43512 |n
use the Ooze-covered Fungus##43512
accept Funky Fungi##13204
step
Inside the Dungeon:
kill Savage Cave Beast##30329
|tip They are to the left of the Desecrated Altar and the Jedoga Shadowseeker boss.
collect 6 Grotesque Fungus##43511 |q 13204/1
step
Inside the Dungeon:
kill 3 Forgotten One##30414 |q 13187/1
|tip Only 3 appear in the room with Herald Volazj.
step
Inside the Dungeon:
kill Herald Volazj##29311 |q 13187/2
step
talk Kilix the Unraveler##26653
|tip Inside the cave, on the middle floor.
turnin The Faceless Ones##13187 |goto Dragonblight 26.18,50.78
turnin Funky Fungi##13204
]])
ZygorGuidesViewer:RegisterGuide("Dungeon Guides\\Wrath of the Lich King\\Violet Hold (75-77)",{
author="support@zygorguides.com",
description="This guide will walk you through completing the Violet Hold.",
condition_end=function() return completedq() end,
},[[
step
Important Note:
|tip There will be 3 boss encounters in the instance.
|tip They appear from the 6th and 12th portals.
|tip The first 2 will be random from a list of 6.
|tip The 3rd will always by Cyanigosa.
Click Here to Continue |confirm
step
Portal 6:
Click Here if "Erekem" Spawns |confirm
Click Here if "Moragg" Spawns |confirm |next "Moragg"
Click Here if "Ichoron" Spawns |confirm |next "Ichoron"
Click Here if "Xevozz" Spawns |confirm |next "Xevozz"
Click Here if "Lavanthor" Spawns |confirm |next "Lavanthor"
Click Here if "Zuramat the Obliterator" Spawns |confirm |next "Zuramat_the_Obliterator"
step
Inside the Dungeon:
kill Erekem##29315
|tip During the encounter, there will be 2 adds.
|tip If they are killed, Erekem will become "Eraged" and deal massive damage.
|tip With this in mind, kill Erekem before the adds.
|tip If possible, dispel "Earth Shield" from him or his allies.
|tip If he uses "Bloodlust", dispel that if/when possible.
|tip He will cast 2 spells that can be interrupted:
|tip "Chain Heal" should be interrupted when possible.
|tip "Lightning Bolt" can be interrupted as well, but only do so if you have more than one interrupt.
Click Here to Continue |confirm |next "Second_Boss"
step
label "Moragg"
Inside the Dungeon:
kill Moragg##29316
|tip This fight is relatively simple, look out for damage spikes from "Ray of Pain" on the tank.
|tip The party should stay relatively close to Moragg as "Optical Link" deals more damage the further away you are from him.
|tip "Corrosive Saliva" reduces the victims armor by 5% per stack, stacking 20 times.
Click Here to Continue |confirm |next "Second_Boss"
step
label "Ichoron"
Inside the Dungeon:
kill Ichoron##29313
|tip At the start, tank Ichoron where she spawns or with your back to the wall near the entrance.
|tip It will make dealing with the "Ichor Globules" that spawn.
|tip She starts with an ability "Protective Bubble" active, which has 35 stacks and reduces her damage taken by 99% while active.
|tip Save cooldowns for when the shield is down.
|tip Once the stack reaches 0, the bubble wilil burst knocking anyone near back and dealing 30% damage to her health.
|tip The "Ichor Globules" will spawn in, moving towards Ichoron, healing her for 3% health if they reach her.
|tip Kill as many as you can, kiting her around if necessary and repeat until she is dead.
Click Here to Continue |confirm |next "Second_Boss"
step
label "Xevozz"
Inside the Dungeon:
kill Xevozz##29266
|tip During the encounter, "Ethereal Spheres" will spawn.
|tip They have two abilities:
|tip "Arcane Explosion" will damage allies if they are near it.
|tip "Arcane Power" gives Xevozz increased melee and spell casting speed if he comes within 3 yards of the orbs for 8 seconds.
|tip Keep him away from the orbs.
|tip He casts "Arcane Buffet" which increases the arcane damage allies take and should be dispelled as it stacks 10 times.
|tip Finally, he uses "Arcane Barrage" which hits anyone within 45 yards of him.
Click Here to Continue |confirm |next "Second_Boss"
step
label "Lavanthor"
Inside the Dungeon:
kill Lavanthor##29312
|tip The tank should face him away from the group to avoid group damage from "Flame Breath".
|tip If he targets you with "Lava Burn", take a few steps back to avoid being hit by it.
|tip Finally he will use "Cauterizing Flames" which deals fire damage and debuffs players hit by it to take 35% more fire damage.
Click Here to Continue |confirm |next "Second_Boss"
step
label "Zuramat_the_Obliterator"
Inside the Dungeon:
kill Zuramat the Obliterator##29314
|tip "Void Shift" deals shadow damage over 5 seconds.
|tip At the end of the affect, the target will be "Void Shifted".
|tip Void Shifted players need to kill "Void Sentries" as fast as they can to stop group AoE damage from Shadow Bolt Volley.
|tip Zuramat uses "Shroud of Darkness" causing attacks against Zuramat reduce healing by 10% to the attacker, stacking 5 times.
|tip It can be dispelled.
Click Here to Continue |confirm
step
label "Second_Boss"
Portal 12:
Click Here if "Erekem" Spawns |confirm
Click Here if "Moragg" Spawns |confirm |next "Moragg2"
Click Here if "Ichoron" Spawns |confirm |next "Ichoron2"
Click Here if "Xevozz" Spawns |confirm |next "Xevozz2"
Click Here if "Lavanthor" Spawns |confirm |next "Lavanthor2"
Click Here if "Zuramat the Obliterator" Spawns |confirm |next "Zuramat_the_Obliterator2"
step
Inside the Dungeon:
kill Erekem##29315
|tip During the encounter, there will be 2 adds.
|tip If they are killed, Erekem will become "Eraged" and deal massive damage.
|tip With this in mind, kill Erekem before the adds.
|tip If possible, dispel "Earth Shield" from him or his allies.
|tip If he uses "Bloodlust", dispel that if/when possible.
|tip He will cast 2 spells that can be interrupted:
|tip "Chain Heal" should be interrupted when possible.
|tip "Lightning Bolt" can be interrupted as well, but only do so if you have more than one interrupt.
Click Here to Continue |confirm |next "Cyanigosa"
step
label "Moragg2"
Inside the Dungeon:
kill Moragg##29316
|tip This fight is relatively simple, look out for damage spikes from "Ray of Pain" on the tank.
|tip The party should stay relatively close to Moragg as "Optical Link" deals more damage the further away you are from him.
|tip "Corrosive Saliva" reduces the victims armor by 5% per stack, stacking 20 times.
Click Here to Continue |confirm |next "Cyanigosa"
step
label "Ichoron2"
Inside the Dungeon:
kill Ichoron##29313
|tip At the start, tank Ichoron where she spawns or with your back to the wall near the entrance.
|tip It will make dealing with the "Ichor Globules" that spawn.
|tip She starts with an ability "Protective Bubble" active, which has 35 stacks and reduces her damage taken by 99% while active.
|tip Save cooldowns for when the shield is down.
|tip Once the stack reaches 0, the bubble wilil burst knocking anyone near back and dealing 30% damage to her health.
|tip The "Ichor Globules" will spawn in, moving towards Ichoron, healing her for 3% health if they reach her.
|tip Kill as many as you can, kiting her around if necessary and repeat until she is dead.
Click Here to Continue |confirm |next "Cyanigosa"
step
label "Xevozz2"
Inside the Dungeon:
kill Xevozz##29266
|tip During the encounter, "Ethereal Spheres" will spawn.
|tip They have two abilities:
|tip "Arcane Explosion" will damage allies if they are near it.
|tip "Arcane Power" gives Xevozz increased melee and spell casting speed if he comes within 3 yards of the orbs for 8 seconds.
|tip Keep him away from the orbs.
|tip He casts "Arcane Buffet" which increases the arcane damage allies take and should be dispelled as it stacks 10 times.
|tip Finally, he uses "Arcane Barrage" which hits anyone within 45 yards of him.
Click Here to Continue |confirm |next "Cyanigosa"
step
label "Lavanthor2"
Inside the Dungeon:
kill Lavanthor##29312
|tip The tank should face him away from the group to avoid group damage from "Flame Breath".
|tip If he targets you with "Lava Burn", take a few steps back to avoid being hit by it.
|tip Finally he will use "Cauterizing Flames" which deals fire damage and debuffs players hit by it to take 35% more fire damage.
Click Here to Continue |confirm |next "Cyanigosa"
step
label "Zuramat_the_Obliterator2"
Inside the Dungeon:
kill Zuramat the Obliterator##29314
|tip "Void Shift" deals shadow damage over 5 seconds.
|tip At the end of the affect, the target will be "Void Shifted".
|tip Void Shifted players need to kill "Void Sentries" as fast as they can to stop group AoE damage from Shadow Bolt Volley.
|tip Zuramat uses "Shroud of Darkness" causing attacks against Zuramat reduce healing by 10% to the attacker, stacking 5 times.
|tip It can be dispelled.
Click Here to Continue |confirm
step
label "Cyanigosa"
Inside the Dungeon:
kill Cyanigosa##31134
|tip Avoid standing behind her as "Tail Sweep" deals damage and interrupts victims.
|tip Avoid standing in front of her as "Uncontrollable Energy" will deal arcane damage and leave a dot on victims.
|tip She will cast "Blizzard" on random players, so spread out and move out of it when it happens.
|tip Occasionally, she will teleport which wipes all aggro established.
|tip The tank should try and save taunts for when this happens.
]])
ZygorGuidesViewer:RegisterGuide("Dungeon Guides\\Wrath of the Lich King\\The Violet Hold Quests",{
author="support@zygorguides.com",
description="This guide will walk you through completing the quests for The Nexus.",
condition_end=function() return completedq() end,
},[[
step
talk Rhonin##16128
accept Discretion is Key##13158 |goto Dalaran 31.6,48.8
step
talk Warden Alturas##31080
turnin Discretion is Key##13158 |goto Dalaran 61.2,63.2
accept Containment##13159 |goto Dalaran 61.2,63.2
step
Inside the Dungeon:
kill Cyanigosa##31134 |q 13159/1
step
talk Warden Alturas##31080
turnin Containment##13159 |goto Dalaran 61.2,63.2
]])
ZygorGuidesViewer:RegisterGuide("Dungeon Guides\\Wrath of the Lich King\\Drak'Tharon Keep (74-76)",{
author="support@zygorguides.com",
description="This guide will walk you through completing Drak'Tharon Keep.",
condition_end=function() return completedq() end,
},[[
step
kill Trollgore##26630
|tip Tank him at the top of the stairs, facing the stairs.
|tip Melee DPS should be on the stairs portion while ranged and healing stand at the bottom of the stairs.
|tip "Drakkari Invaders" will appear at random and attack during the fight.
|tip Focus them down when they appear, as they will buff Trollgore if they are hit with "Consume" as well as deal shadow damage to the party.
|tip Positioning yourself this way will cause the "Corspe Explode" he uses to miss most the group.
|tip He will use "Infected Wound" on a player which increases physical damage taken and should be dispelled.
Click Here to Continue |confirm
step
kill Novos the Summoner##26631
|tip During the 1st phase, Novos will be invulnerable.
|tip Kill the undead spawning from the stairs.
|tip The phase will end once 4 Crystal handlers are defeated.
|tip Phase 2 will start and Novos will be enraged.
|tip Spread out as best possible, as he will cast "Blizzard" at random party members.
|tip He will curse the party at random with "Wrath of Misery" which deals shadow damage over 8 seconds.
|tip He will randomly "Summon Minions" throughout the encounter which should be burned quickly.
Click Here to Continue |confirm
step
kill King Dred##27483
|tip Clear trash around the area before pulling.
|tip "Grievous Bite" will inflict a DoT that deals physical damage until the target is fully healed.
|tip Use any means to fully heal the tank to remove this.
|tip He will also use "Piercing Slash" on the tank, reducing armor by 75% for 10 seconds.
|tip "Mangle Slash" increases the damage from bleeds by 75% and lasts for 15 seconds.
|tip This includes damage from Grievous Bite and Rend from Drakkari Gutrippers.
|tip He will occasional use "Bellowing Roar", fearing anyone within 35 yards.
Click Here to Continue |confirm
step
kill The Prophet Tharon'ja##26632
|tip During the 1st phase, he will use "Shadowbolt Volley" dealing shadow damage to the group.
|tip He will target areas with "Rain of Fire" which you should move out of.
|tip He will DoT players with "Curse of Life", which deals shadow damage over 3 seconds for 9 seconds.
|tip If the player drops below 50% health, the DoT is removed.
|tip At 50% health, he will use "Decay Flesh", stunning all players for 3 seconds and dealing damage over time.
|tip This will mark the start of the 2nd phase.
|tip Tanks should use "Bone Armor" on cooldown and spam "Taunt".
|tip Everyone else should spam "Slaying Strike" on cooldown.
|tip Save "Touch of Life" for when you need healing.
|tip He will cast "Poison Clouds" at the feet of players which need to be avoided.
]])
ZygorGuidesViewer:RegisterGuide("Dungeon Guides\\Wrath of the Lich King\\Drak'Tharon Keep Quests",{
author="support@zygorguides.com",
description="This guide will walk you through completing the quests for The Nexus.",
condition_end=function() return completedq() end,
},[[
step
ding 73
step
talk Sergeant Thurkin##27266
accept Good Troll Hunting##12208 |goto Grizzly Hills 22.20,64.74
step
talk Samir##26424
turnin Good Troll Hunting##12208 |goto 16.19,47.60
accept Filling the Cages##11984 |goto 16.19,47.60
step
talk Budd##26422
|tip Inside the building.
Tell him _"Come on, Budd. Time to play with the ice trolls!"_
Get Budd's Attention |havebuff spell:47014 |goto 16.37,48.26 |q 11984
step
use the Bounty Hunter's Cage##35736
|tip Use it on a troll that Budd stuns.
|tip To stun a troll, use Budd's "Tag Troll" ability on your pet bar near any Drakkari troll around this area.
|tip He will sneak up and stun a nearby troll.
Capture a Live Ice Troll |q 11984/1 |goto 13.79,58.47
step
Follow the path up to leave the Ruins of Drak'Zin |goto 14.21,57.36 < 40 |only if walking and subzone("Ruins of Drak'Zin")
talk Samir##26424
turnin Filling the Cages##11984 |goto 16.19,47.60
step
talk Drakuru##26423
accept Truce?##11989 |goto 16.42,47.81
step
click Dull Carving Knife##190208
|tip Stuck into the side of the tree stump.
collect Dull Carving Knife##38083 |goto 16.54,47.81 |q 11989
step
use the Dull Carving Knife##38083
Take the Blood Oath |havebuff Blood Oath##136168 |goto 16.43,47.81 |q 11989
step
talk Drakuru##26423
Choose _"Shake Drakuru's outstretched hand."_
Form a Blood Pact With Drakuru |q 11989/1 |goto 16.42,47.81
step
talk Drakuru##26423
turnin Truce?##11989 |goto 16.42,47.81
accept Vial of Visions##11990 |goto 16.42,47.81
step
talk Ameenah##26474
buy Imbued Vial##18256 |q 11990/1 |goto 15.96,47.79
step
click Hazewood Bush##188600+
|tip They look like small bushy plants with purple flowers on them on the ground around this area.
collect 3 Haze Leaf##37085 |q 11990/2 |goto 15.01,44.39
You can find more around: |notinsticky
[16.63,43.34]
[13.39,41.84]
step
click Waterweed##188351+
|tip They look like tall bushy green plants underwater around this area.
collect Waterweed Frond##35795 |q 11990/3 |goto 15.23,40.35
step
talk Drakuru##26423
turnin Vial of Visions##11990 |goto 16.42,47.81
accept Subject to Interpretation##11991 |goto 16.42,47.81
step
Kill Drakkari enemies around this area
|tip They look like trolls.
|tip You can find them all around in the Ruins of Drak'Zin. |notinsticky
collect 5 Frozen Mojo##35799 |goto 12.73,60.84 |q 11991
step
use Drakuru's Elixir##35797
|tip Use it next to the brazier at the top of the stairs.
talk Image of Drakuru##26500
turnin Subject to Interpretation##11991 |goto 13.27,60.86
accept Sacrifices Must be Made##12007 |goto 13.27,60.86
step
Enter the building |goto 14.51,37.30 < 15 |walk
kill Warlord Zim'bo##26544
|tip Inside the building.
collect Zim'bo's Mojo##35836 |goto 14.51,38.01 |q 12007
step
Run up the stairs |goto 16.77,36.23 < 20 |only if walking
click Seer of Zeb'Halak##188458
|tip At the top of the temple.
Choose _"Remove the Eye of the Prophets from the idol's face."_
collect Eye of the Prophets##35806 |q 12007/1 |goto 17.93,36.48
step
use Drakuru's Elixir##35797
|tip Use it next to the brazier at the top of the temple.
talk Image of Drakuru##26543
turnin Sacrifices Must be Made##12007 |goto 17.46,36.37
accept Heart of the Ancients##12042 |goto 17.46,36.37
step
Run up the ramp |goto Grizzly Hills 38.12,31.91 < 15 |only if walking
Enter the building at the top of the paltform |goto Grizzly Hills 37.01,32.58 < 10 |walk
click Heart of the Ancients##188365
|tip Inside the building.
turnin Heart of the Ancients##12042 |goto Grizzly Hills 36.95,32.35
accept My Heart is in Your Hands##12802 |goto Grizzly Hills 36.95,32.35
step
Kill Drakkari enemies around this area
|tip They look like trolls.
|tip You can find them all around the Drak'atal Passage.
collect 5 Desperate Mojo##36743 |goto 45.13,28.63 |q 12802
step
use Drakuru's Elixir##35797
|tip Use it next to the brazier at this location.
talk Image of Drakuru##26701
turnin My Heart is in Your Hands##12802 |goto 45.03,28.41
accept Voices From the Dust##12068 |goto 45.03,28.41
step
Follow the path |goto 70.13,20.02 < 10 |walk
click Drakkari Tablets##188461
|tip Inside the crypt.
collect Drakkari Tablets##36757 |q 12068/1 |goto 69.38,18.20
step
Kill Drakkari enemies around this area
|tip They look like trolls.
|tip You can find them all around the Drakil'jin Ruins area.
collect 5 Sacred Mojo##36758 |q 12068 |goto 71.51,26.99
step
use Drakuru's Elixir##35797
|tip Use it next to the brazier.
talk Image of Drakuru##26787
turnin Voices From the Dust##12068 |goto 71.72,26.14
accept Cleansing Drak'Tharon##12238
step
talk Prigmon##26519
accept Scourgekabob##12484 |goto Grizzly Hills 15.73,46.69
step
click Scourged Troll Mummy##190225
collect Scourged Troll Mummy##38149 |goto 15.70,46.86 |q 12484
step
use the Scourged Troll Mummy##38149
|tip Use it next to the burning pile of mummies.
Burn a Mummified Carcass |q 12484/1 |goto 16.78,48.22
step
talk Mack Fearsen##26604
turnin Scourgekabob##12484 |goto 16.67,48.29
step
Watch the dialogue
talk Mack Fearsen##26604
accept Seared Scourge##12029 |goto 16.67,48.29
step
use Mack's Dark Grog##35908
|tip Throw it at the trolls running around on the ground nearby.
|tip Don't let the trolls get too close to you, they'll attack you.
Burn #20# Scourge Trolls |q 12029/1 |goto 16.20,29.32
step
talk Mack Fearsen##26604
turnin Seared Scourge##12029 |goto 16.67,48.29
accept Search and Rescue##12037	|goto 16.67,48.29
accept Head Games##13129 |goto 16.67,48.29
step
Inside the Dungeon:
Kill Webbed Victims
|tip They look like giant ovals of spider web swaying back and forth.
Find Out What Become of Kurzel |q 12037/1
step
Inside the Dungeon:
kill Novos the Summoner##26631
use Kurzel's Blouse Scrap##43214
|tip Use it on the corpse.
collect Ichor-Stained Cloth##43215 |q 13129/1
step
Inside the Dungeon:
Kill Drakkari enemies around this area
|tip Drakkari Guardians, Drakkari Shaman and Drakkari Commanders are the only enemies that will drop Enduring Mojo.
collect 5 Enduring Mojo##38303 |q 12238
step
Inside the Dungeon:
use Drakuru's Elixir##35797
|tip Walk west down the steps after defeating The Prophet Tharon'ja.
Use Drakuru's Elixir at his brazier inside Drak'Tharon |q 12238/1
step
Inside the Dungeon:
talk Drakuru##28016
|tip Walk west down the steps after defeating The Prophet Tharon'ja.
|tip Be sure to choose your quest reward quickly as the summon doesn't last forever.
turnin Cleansing Drak'Tharon##12238
step
Inside the Dungeon:
talk Kurzel##26664
turnin Search and Rescue##12037
step
talk Mack Fearsen##26604
turnin Head Games##13129 |goto 16.67,48.29
]])
ZygorGuidesViewer:RegisterGuide("Dungeon Guides\\Wrath of the Lich King\\Gundrak (76-78)",{
author="support@zygorguides.com",
description="This guide will walk you through completing Gundrak.",
condition_end=function() return completedq() end,
},[[
step
kill Slad'ran##29304
|tip Slad'ran will cast "Poison Nova" which will deal nature damage to anyone within 15 yards of him as well as leave a DoT that lasts 16 seconds.
|tip Run away from this to avoid unnecessary damage.
|tip Have a player AoE down the small snakes that spawn during the fight.
|tip Extra healing may be needed for "Powerful Bite" which reduces the targets armor by 20% for 5 seconds.
Click Here to Continue |confirm
step
kill Drakkari Colossus##29307
While the Drakkari Colossus is active:
|tip It will use "Mortal Strikes" on the tank, reducing incoming healing by 50% for 3 seconds.
|tip It will use "Emerge" at 50% health, summoning a Drakkari Elemental.
While the Drakkari Elemental is active:
|tip It will cast "Mojo Volley" at 2 random players, dealing nature damage.
|tip It will use "Surge", charging forward causing anyone it hits to take additional nature damage for 45 seconds.
|tip When it reaches 50% health, it will "Merge" back with the Drakkari Colossus.
|tip Repeat the process, killing both after.
Click Here to Continue |confirm
step
kill Moorabi##29305
|tip He will occasionally cast "Ground Tremor", damaging and stunning all players within 60 yards for 2 seconds.
|tip Beware of "Mojo Frenzy" which will increase his spell casting speed based off his health.
|tip He will attempt to cast "Transformation" often.
|tip Interrupt this as much as possible.
|tip Note that with each successful interrupt, the cast speed will be substantially faster.
|tip Eventually he will transform, and Ground Tremor will be replaced with "Quake", which does the same thing but is used more frequently.
|tip In general, his damage will be boosted.
Click Here to Continue |confirm
step
kill Gal'darah##29306
|tip "Stampede" charges a player, dealing damage and knocking them 10 into the air.
|tip Watch out for "Whirling Slash", which deals physical damage and bleeds victims.
|tip It can be avoided by moving away from Gal'darah.
|tip He will use "Puncture" on random players, giving them a 2 minute DoT.
|tip After he uses Whirling Slash twice, he will tranform into The Avatar of Akali.
|tip He will start using "Impaling Charge", dealing damage and knocking players back.
|tip Tanks should pay attention for "Enrage" and use damage mitigation skills when possible.
|tip Spread out as much as possible, as "Stomp" will deal damage and knock back players within 10 yards.
]])
ZygorGuidesViewer:RegisterGuide("Dungeon Guides\\Wrath of the Lich King\\Gundrak Quests",{
author="support@zygorguides.com",
description="This guide will walk you through completing the quests for Gundrak.",
condition_end=function() return completedq() end,
},[[
step
talk Har'koa
accept Unfinished Business##13097 |goto Zul'Drak/0 63.6,70.2
She can also be found here [63.8,70.6]
step
talk Chronicler Bah'Kini##30676
accept One of a Kind##13111 |goto Zul'Drak/0 70.0,21.0
accept For Posterity##13098 |goto Zul'Drak/0 70.0,21.0
stickystart "Collect_Drakkari_History_Tablets"
step
Inside the Dungeon:
talk Tol'mar##30671
|tip Standing at he stars near the entrance.
turnin Unfinished Business##13097
accept Gal'darah Must Pay##13096
step
Inside the Dungeon:
kill Drakkari Elemental##29573
collect Drakkari Colossus Fragment##43158 |q 13111/1
step
Inside the Dungeon:
kill Gal'darah##29306 |q 13096/1
step
label "Collect_Drakkari_History_Tablets"
Inside the Dungeon:
collect 6 Drakkari History Tablet##43140 |q 13098/1
step
talk Chronicler Bah'Kini##30676
turnin One of a Kind##13111 |goto Zul'Drak/0 70.0,21.0
turnin For Posterity##13098 |goto Zul'Drak/0 70.0,21.0
]])
ZygorGuidesViewer:RegisterGuide("Dungeon Guides\\Wrath of the Lich King\\Halls of Lightning (78-80)",{
author="support@zygorguides.com",
description="This guide will walk you through completing the Halls of Lightning.",
condition_end=function() return completedq() end,
},[[
step
kill General Bjarngrim##28586
|tip He patrols the platform in the first open area.
|tip Fight him on a back platform, killing his adds first.
|tip Do no hit him if he currently has the "Temporary Electrical Charge" buff.
|tip He will shift stances during the encounter.
|tip During "Battle Stance", watch out for Mortal Strike, which will reduce incoming healing to the target by 50% for 5 seconds.
|tip He will also use "Battle Aura" granting him 25% haste.
|tip During "Berserker Stance" he wilil have Berserk Aura, which grants 25% damage.
|tip Move out of "Whirlwind" which hits anyone within 8 yards.
|tip Melee should stay behind him to avoid "Cleave".
|tip During "Defensive Stance" he will have 25% damage mitigation.
|tip He will use "Knock Away", an AoE knockback that hits anyone 10 yards close to him.
|tip Casters should look out for "Spell Reflection" so you don't blow yourself up.
Click Here to Continue |confirm
step
kill Volkhan##28587
|tip
Click Here to Continue |confirm
step
kill Ionar##28546
|tip
Click Here to Continue |confirm
step
kill Loken##28923
|tip
Click Here to Continue |confirm
]])
ZygorGuidesViewer:RegisterGuide("Dungeon Guides\\Wrath of the Lich King\\Halls of Lightning Quests",{
author="support@zygorguides.com",
description="This guide will walk you through completing the quests for Halls of Lightning.",
condition_end=function() return completedq() end,
},[[
step
Enter the building |goto The Storm Peaks/0 41.01,85.95 < 7 |walk
talk Gretchen Fizzlespark##29473
|tip Inside the building.
accept They Took Our Men!##12843 |goto 41.15,86.15
step
Kill Sifreldar enemies around this area
|tip They look like blue humans.
|tip You can find them all around the Sifreldar Village area.
collect Cold Iron Key##40641+ |n
click Rusty Cage##191544+
|tip They look like brown wooden and metal cages.
|tip They can also be inside the buildings around the lower level of the village.
Free #5# Goblin Prisoners |q 12843/1 |goto 40.78,71.57
step
talk Gretchen Fizzlespark##29473
|tip Inside the building.
turnin They Took Our Men!##12843 |goto 41.15,86.14
accept Leave No Goblin Behind##12846 |goto 41.15,86.14
step
Enter the mine |goto 42.22,69.48 < 20 |walk |only if not (subzone("The Forlorn Mine") and _G.IsIndoors())
talk Lok'lira the Crone##29481
|tip Inside the mine, on the bottom floor.
turnin Leave No Goblin Behind##12846 |goto 42.81,68.90
accept The Crone's Bargain##12841 |goto 42.81,68.90
step
map The Storm Peaks
path	follow strictbounce;	loop off;	ants curved;	dist 20;	markers none
path	45.11,71.07		44.78,71.25		44.53,70.79		44.14,70.53
path	44.03,70.03		43.51,70.10		44.10,69.78		44.13,67.89
path	44.17,67.52		44.28,67.20		44.30,66.99
kill Overseer Syra##29518
|tip She looks like a blue human that walks around this area on the middle floor inside the mine.
collect Runes of the Yrkvinn##40690 |q 12841/1
step
talk Lok'lira the Crone##29481
|tip Inside the mine, on the bottom floor.
turnin The Crone's Bargain##12841 |goto 42.81,68.90
accept Mildred the Cruel##12905 |goto 42.81,68.90
step
talk Mildred the Cruel##29885
|tip Upstairs inside the mine, on the top floor.
turnin Mildred the Cruel##12905 |goto 44.39,68.93
accept Discipline##12906 |goto 44.39,68.93
step
use the Disciplining Rod##42837
|tip Use it on Exhausted Vrykul.
|tip They look like vrykul men sitting on the ground around this area inside the mine.
|tip They are mostly in the side tunnels inside the mine, on all floors.
Discipline #6# Exhausted Vrykuls |q 12906/1 |goto 44.01,68.95
step
talk Mildred the Cruel##29885
|tip Upstairs inside the mine, on the top floor.
turnin Discipline##12906 |goto 44.39,68.93
accept Examples to be Made##12907 |goto 44.39,68.93
step
kill Garhal##30147 |q 12907/1 |goto 45.41,69.10
|tip Inside the mine, on the top floor.
step
talk Mildred the Cruel##29885
|tip Upstairs inside the mine, on the top floor.
turnin Examples to be Made##12907 |goto 44.39,68.93
accept A Certain Prisoner##12908 |goto 44.39,68.93
step
talk Lok'lira the Crone##29481
|tip Inside the mine, on the bottom floor.
turnin A Certain Prisoner##12908 |goto 42.81,68.90
accept A Change of Scenery##12921 |goto 42.81,68.90
step
Leave the mine |goto 46.95,68.44 < 20 |walk |only if subzone("The Forlorn Mine") and _G.IsIndoors()
talk Lok'lira the Crone##29975
turnin A Change of Scenery##12921 |goto 47.47,69.08
accept Is That Your Goblin?##12969 |goto 47.47,69.08
step
talk Agnetta Tyrsdottar##30154
Tell her _"Skip the warmup, sister... or are you too scared to face someone your own size?"_
kill Agnetta Tyrsdottar##30154 |q 12969/1 |goto 48.25,69.76
step
talk Lok'lira the Crone##29975
turnin Is That Your Goblin?##12969 |goto 47.47,69.08
accept The Hyldsmeet##12970 |goto 47.47,69.08
step
talk Lok'lira the Crone##29975
Tell her _"Tell me about this proposal."_
Listen to Lok'lira's Proposal |q 12970/1 |goto 47.47,69.08
step
talk Lok'lira the Crone##29975
turnin The Hyldsmeet##12970 |goto 47.47,69.08
accept Taking on All Challengers##12971 |goto 47.47,69.08
step
talk Victorious Challenger##30012+
|tip They look like blue armored women standing place.
|tip They are the ones that aren't already fighting each other.
Tell them _"Let's do this, sister."_
kill 6 Victorious Challenger##30012 |q 12971/1 |goto 48.16,70.30
You can find more around: |notinsticky
[50.38,68.02]
[51.39,66.41]
step
talk Lok'lira the Crone##29975
turnin Taking on All Challengers##12971 |goto 47.47,69.08
accept You'll Need a Bear##12972 |goto 47.47,69.08
step
talk Brijana##29592
turnin You'll Need a Bear##12972 |goto 53.14,65.72
accept Bearly Hanging On##12851 |goto 53.14,65.72
step
clicknpc Icefang##29598
Ride Icefang |invehicle |goto 53.12,65.62 |q 12851
stickystart "Burn_Frost_Giants"
step
Burn #7# Frostworgs |q 12851/1 |goto 58.30,59.85
|tip Use the "Flaming Arrow" ability on your action bar on Frostworgs.
|tip They look like large white wolves around this area.
step
label "Burn_Frost_Giants"
Burn #15# Frost Giants |q 12851/2 |goto 58.30,59.85
|tip Use the "Flaming Arrow" ability on your action bar on Frost Giants.
|tip They look like large armored dwarves around this area.
step
Return to Brijana |outvehicle |goto 53.81,65.29 |q 12851
|tip Use the "Burst of Speed" ability to travel faster.
|tip You will automatically be dropped off at this location.
step
talk Brijana##29592
turnin Bearly Hanging On##12851 |goto 53.14,65.72
accept Cold Hearted##12856 |goto 53.14,65.72
stickystart "Free_Proto_Drakes"
step
clicknpc Captive Proto-Drake##29708+
|tip The look like dragons on chains flying in the air around this area.
Rescue #9# Brunnhildar Prisoners |q 12856/1 |goto 65.00,60.45
|tip Use the ability on your action bar on Brunnhildar Prisoners.
|tip They look like blue blocks of ice on the ground around this area.
Bring the prisoners to [49.09,66.89]
|tip Wait until you have the Captive Proto-Drakes holding 3 Brunnhildar Prisoners before you go to this location.
|tip Once you leave the objective area the Captive Proto-Drakes will automatically fly back to Brunnhildar Village.
|tip You will have to do this 3 times.
step
label "Free_Proto_Drakes"
clicknpc Captive Proto-Drake##29708+ |notinsticky
|tip The look like chained up dragons flying in the air around this area. |notinsticky
Free #3# Proto-Drakes |q 12856/2 |goto 65.00,60.45
Fly the Proto-Drakes to [49.09,66.89]
step
talk Brijana##29592
turnin Cold Hearted##12856 |goto 53.14,65.72
accept Deemed Worthy##13063 |goto 53.14,65.72
step
Enter the building |goto 49.82,71.40 < 20 |walk
talk Astrid Bjornrittar##29839
|tip Inside the building.
turnin Deemed Worthy##13063 |goto 49.75,71.81
accept Making a Harness##12900 |goto 49.75,71.81
step
kill Icemane Yeti##29875+
|tip They look like large white gorillas with horns.
|tip You can find them all around the Snowblind Terrace area.
collect 3 Icemane Yeti Hide##41424 |q 12900/1 |goto 47.07,76.15
step
Enter the building |goto 49.82,71.40 < 20 |walk
talk Astrid Bjornrittar##29839
|tip Inside the building.
turnin Making a Harness##12900 |goto 49.75,71.81
accept The Last of Her Kind##12983 |goto 49.75,71.81
step
clicknpc Injured Icemaw Matriarch##29563
|tip Inside the cave.
Ride the Icemaw Matriarch |invehicle |goto 54.79,60.37 |q 12983
step
Rescue the Icemaw Matriarch |q 12983/1 |goto 49.82,71.12
|tip You will automatically be brought back to Brunnhildar Village.
step
Enter the building |goto 49.82,71.40 < 20 |walk
talk Astrid Bjornrittar##29839
|tip Inside the building.
turnin The Last of Her Kind##12983 |goto 49.75,71.81
accept The Warm-Up##12996 |goto 49.75,71.81
step
use the Reins of the Warbear Matriarch##42481
Ride a Warbear Matriarch |invehicle |goto 49.68,70.64 |q 12996
step
kill Kirgaraak##29352
|tip Use the abilities on your action bar.
Defeat Kirgaraak |q 12996/1 |goto 50.81,67.68
step
Stop Riding the Warbear Matriarch |outvehicle |q 12996
|tip Click the red arrow on your action bar.
step
Enter the building |goto 49.82,71.40 < 20 |walk
talk Astrid Bjornrittar##29839
|tip Inside the building.
turnin The Warm-Up##12996 |goto 49.75,71.81
accept Into the Pit##12997 |goto 49.75,71.81
step
use the Reins of the Warbear Matriarch##42499
Ride a Warbear Matriarch |invehicle |goto 49.19,68.72 |q 12997
step
kill 6 Hyldsmeet Warbear##30174 |q 12997/1 |goto 49.19,68.56
|tip Use the abilities on your action bar.
step
Stop Riding the Warbear Matriarch |outvehicle |q 12997
|tip Click the red arrow on your action bar.
step
Enter the building |goto 49.82,71.40 < 20 |walk
talk Astrid Bjornrittar##29839
|tip Inside the building.
turnin Into the Pit##12997 |goto 49.75,71.81
accept Prepare for Glory##13061 |goto 49.75,71.81
step
talk Lok'lira the Crone##29975
turnin Prepare for Glory##13061 |goto 47.47,69.09
accept Lok'lira's Parting Gift##13062 |goto 47.47,69.09
step
talk Gretta the Arbiter##29796
turnin Lok'lira's Parting Gift##13062 |goto 50.87,65.59
accept The Drakkensryd##12886 |goto 50.87,65.59
step
Fly to the Temple of Storms |complete subzone("Temple of Storms") |goto 33.40,61.29 |q 12886 |notravel
|tip You will fly here automatically.
step
use the Hyldnir Harpoon##41058
|tip Use it on Hyldsmeet Proto-Drakes.
|tip They look like dragons with riders on them flying around this area.
|tip You will harpoon and fly over to a new drake to fight the rider.
kill Hyldsmeet Drakerider##29694+
Defeat #10# Hyldsmeet Drakeriders |q 12886/1 |goto 33.40,61.29 |notravel
step
use the Hyldnir Harpoon##41058
|tip Use it on a Column Ornament.
|tip They look like light fixtures on the side of the stone columns around the Temple of Storms area.
Stop Riding the Proto-Drake |outvehicle |q 12886
step
talk Thorim##29445
|tip At the top of the huge column.
turnin The Drakkensryd##12886 |goto 33.42,57.95
accept Sibling Rivalry##13064 |goto 33.42,57.95
step
talk Thorim##29445
|tip At the top of the huge column.
Ask him _"Can you tell me what became of Sif?"_
Hear Thorim's History |q 13064/1 |goto 33.42,57.95
step
talk Thorim##29445
|tip At the top of the huge column.
turnin Sibling Rivalry##13064 |goto 33.42,57.95
accept Mending Fences##12915 |goto 33.42,57.95
stickystart "Collect_Furious_Sparks"
step
click Granite Boulder+
|tip They look like large grey rocks on the ground around this area.
collect Granite Boulder##41506+ |n
|tip You can only carry 1 at a time.
use Thorim's Charm of Earth##41505
|tip Use it on Stormforged Iron Giants.
|tip They look like large armored dwarves around this area.
|tip Smaller dwarves will appear and attack them.
|tip Help the dwarves kill them.
kill 5 Stormforged Iron Giant##29375 |q 12915/2 |goto 70.18,61.09
collect Slag Covered Metal##41556 |goto 70.18,61.09 |q 12922 |future
You can find more around [74.60,62.96]
step
use the Slag Covered Metal##41556
accept The Refiner's Fire##12922
step
_NOTE:_
Continue Using Boulders to Kill Giants
|tip During the next steps, continue collecting the large grey Granite Boulders from the ground.
|tip Use Thorim's Charm of Earth on the dwarf giants, and kill them.
Click Here to Continue |confirm |q 12922
step
label "Collect_Furious_Sparks"
kill Seething Revenant##29504+
|tip They look like armored fire elementals.
collect 10 Furious Spark##41558 |q 12922/1 |goto 70.18,61.09
You can find more around [74.60,62.96]
step
click Granite Boulder##191815+
|tip They look like large grey rocks on the ground around this area.
collect Granite Boulder##41506+ |n
|tip You can only carry 1 at a time.
use Thorim's Charm of Earth##41505
|tip Use it on Fjorn.
|tip He looks like a much larger dwarf with brown armor that walks around this area.
|tip Smaller dwarves will appear and attack him.
|tip Help the dwarves kill them.
kill Fjorn##29503 |q 12915/1 |goto 77.35,62.88
step
click Fjorn's Anvil##192071
|tip It looks like a huge blacksmith anvil.
turnin The Refiner's Fire##12922 |goto 77.15,62.80
accept A Spark of Hope##12956 |goto 77.15,62.80
step
talk Thorim##29445
|tip At the top of the huge column.
turnin Mending Fences##12915 |goto 33.42,57.95
turnin A Spark of Hope##12956 |goto 33.42,57.95
accept Forging an Alliance##12924 |goto 33.42,57.95
step
talk King Jokkum##30105
accept You Can't Miss Him##12966 |goto 65.43,60.15
step
talk Njormeld##30099
turnin You Can't Miss Him##12966 |goto 75.38,63.57
accept Battling the Elements##12967 |goto 75.38,63.57
step
clicknpc Snorri##30123
Accompany Snorri |invehicle |goto 75.71,63.91 |q 12967
step
kill 10 Seething Revenant##29504 |q 12967/1 |goto 76.18,63.32
|tip Use the "Gather Snow" ability on your action bar next to Snowdrifts.
|tip They look like piles of white snow on the ground around this area.
|tip Use the "Throw Snowball" ability on your action bar on Seething Revenants.
|tip They look like armored fire elementals around this area.
step
Stop Accompanying Snorri |outvehicle |q 12967
|tip Click the red arrow on your action bar.
step
talk Njormeld##30099
turnin Battling the Elements##12967 |goto 75.38,63.57
Bring Fjorn's Anvil to Dun Niffelem |q 12924/1 |goto 75.38,63.57
step
talk Njormeld##30099
turnin Battling the Elements##12967 |goto 75.38,63.57
Bring Fjorn's Anvil to Dun Niffelem |q 12924/1 |goto 75.38,63.57
step
talk Njormeld##30127
turnin Forging an Alliance##12924 |goto 63.21,63.23
accept A New Beginning##13009 |goto 63.21,63.23
step
talk Thorim##29445
turnin A New Beginning##13009 |goto 33.42,57.95
accept Veranus##13050 |goto 33.42,57.95
step
click Small Proto-Drake Egg##192536
collect 5 Small Proto-Drake Egg##42784 |q 13050/1 |goto 45.2,66.8
|tip They are in giant nests on the mountains around this area.
You can find more around here:
[43.7,67.3]
[52.4,73.4]
[52.4,75.4]
step
talk Thorim##29445
turnin Veranus##13050 |goto 33.42,57.95
accept Territorial Trespass##13051 |goto 33.42,57.95
step
use the Stolen Proto-Dragon Eggs##42797
|tip Use it at the nest.
Lure out Veranus |q 13051/1 |goto 38.7,65.6
step
talk Thorim##29445
turnin Territorial Trespass##13051 |goto 33.42,57.95
accept Krolmir, Hammer of Storms##13010 |goto 33.42,57.95
step
talk King Jokkum##30105
Ask him what has become of Krolmir
Discover Krolmir's Fate |q 13010/1 |goto 65.4,60.2
step
talk King Jokkum##30105
accept Culling Jorcuttar##13011 |goto 65.4,60.2
accept In Memoriam##12975 |goto 65.4,60.2
step
click Horn Fragment##192082
collect 8 Horn Fragment##42162 |q 12975/1 |goto 72.1,49.4
step
kill Viscous Oil##30325+
collect 5 Viscous Oil##42640|q 13006/1 |goto 55.6,63.4
Use your Everfrost Razor on Dead Icemaw Bears |use Everfrost Razor##42732
collect 1 Icemaw Bear Flank##42733 |q 13011 |goto 55.6,63.4
step
Follow the path inside the cave to this spot
Use your Icemaw Bear Flank while standing on the small frozen pond with a bunch of rocks on it |use Icemaw Bear Flank##42733
kill 1 Jorcuttar##30340 |q 13011/1 |goto 54.7,60.8
step
talk King Jokkum##30105
turnin In Memoriam##12975 |goto 65.4,60.2
accept A Monument to the Fallen##12976 |goto 65.4,60.2
step
talk Njormeld##30127
turnin A Monument to the Fallen##12976 |goto 63.2,63.2
step
talk Thorim##30390
turnin Krolmir, Hammer of Storms##13010 |goto 71.4,48.8
accept The Terrace of the Makers##13057 |goto 71.4,48.8
step
talk Thorim##30295
turnin The Terrace of the Makers##13057 |goto 56.3,51.4
accept The Earthen Oath##13005 |goto 56.3,51.4
accept Loken's Lackeys##13035 |goto 56.3,51.4
step
Use your Horn of the Peaks to summon earthen helpers |use Horn of the Peaks##42840
Fight mobs around this area
kill 7 Iron Sentinel##29984+ |q 13005/1 |goto 57.3,46.7
kill 20 Iron Dwarf Assailant##29978+ |q 13005/2 |goto 57.3,46.7
step
_Enter_ the Hall of the Shaper |goto The Storm Peaks/0 57.1,44.2 < 10
Use your Horn of the Peaks to summon earthen helpers |use Horn of the Peaks##42840
kill Eisenfaust##30341 |q 13035/1 |goto 55.3,43.3
step
Use your Horn of the Peaks to summon earthen helpers |use Horn of the Peaks##42840
kill Halefnir the Windborn##30376 |q 13035/2 |goto 48.6,45.6
step
Use your Horn of the Peaks to summon earthen helpers |use Horn of the Peaks##42840
kill Duronn the Runewrought##30353 |q 13035/3 |goto 45,38.1
step
talk Thorim##30295
turnin The Earthen Oath##13005 |goto 56.3,51.4
turnin Loken's Lackeys##13035 |goto 56.3,51.4
accept The Reckoning##13047 |goto 56.3,51.4
step
talk Thorim##30399
Tell him you are with him
Witness the Reckoning |q 13047/1 |goto 35.9,31.5
step
talk King Jokkum##30105
turnin The Reckoning##13047 |goto 65.4,60.2
accept Whatever it Takes!##13108 |goto 65.4,60.2
step
talk King Jokkum##30105
accept Diametrically Opposed##13109 |goto 65.4,60.2
step
Inside the Dungeon:
kill Volkhan##28587 |q 13109/1
step
Inside the Dungeon:
kill Loken##28923
collect Loken's Tongue##43151 |q 13108/1
step
talk King Jokkum##30105
turnin Whatever it Takes!##13108 |goto 65.4,60.2
turnin Diametrically Opposed##13109 |goto 65.4,60.2
]])
ZygorGuidesViewer:RegisterGuide("Dungeon Guides\\Wrath of the Lich King\\The Culling of Stratholme (78-80)",{
author="support@zygorguides.com",
description="This guide will walk you through completing The Culling of Stratholme.",
condition_end=function() return completedq() end,
},[[
step
kill Meathook##26529
|tip Watch out for "Constricting Chains", which stuns a player for 5 seconds and deals damage.
|tip If it hits a healer, the tank should be ready with damage mitigation abilities.
|tip For casters, look out for "Disease Expulsion" which will interrupt casting.
|tip Otherwise, this is a tank and spank fight.
Click Here to Continue |confirm
step
kill Salramm the Fleshcrafter##26530
|tip The tank should be ready to pick up adds during "Summon Ghoul".
|tip Any ghoul that appears should be burned quickkly so the boss doesn't "Corpse Explode" them.
Click Here to Continue |confirm
step
kill Chrono-Lord Epoch##26532
|tip Remove the "Curse of Exertion" curse if you are able.
|tip Healers should watch out for the target of "Time Warp".
Click Here to Continue |confirm
step
kill Mal'Ganis##26533
|tip If you aren't the tank, stay behind Mal'Ganis and spread out as much as possible.
|tip Dispel "Sleep" whenever possible.
|tip You are able to use "Ice Block" out of sleep. |only Mage
Click Here to Continue |confirm
]])
ZygorGuidesViewer:RegisterGuide("Dungeon Guides\\Wrath of the Lich King\\The Culling of Stratholme Quests",{
author="support@zygorguides.com",
description="This guide will walk you through completing the quests for Gundrak.",
condition_end=function() return completedq() end,
},[[
step
Inside the Dungeon:
talk Chromie##26527
accept Dispelling Illusions##13149
step
Inside the Dungeon:
use the Arcane Disruptor##37888
|tip Use it on a bunch of faintly glowing boxes sitting outside of a building along the road.
Dispel the Plagued Grain Crates |q 13149/1
step
Inside the Dungeon:
talk Chromie##26527
|tip Continue following the road.
|tip She will be just before the entrance to Stratholme.
turnin Dispelling Illusions##13149
accept A Royal Escort##13151
step
Inside the Dungeon:
kill Mal'Ganis##26533 |q 13151/1
step
Inside the Dungeon:
talk Chromie##26527
|tip She will appear after you defeat Mal'Ganis.
turnin A Royal Escort##13151
]])
ZygorGuidesViewer:RegisterGuide("Dungeon Guides\\Wrath of the Lich King\\The Oculus (79-80)",{
author="support@zygorguides.com",
description="This guide will walk you through completing The Oculus.",
condition_end=function() return completedq() end,
},[[
step
kill Drakos the Interrogator##27654
|tip During the fight, he will "Summon Unstable Spheres".
|tip They move constantly and should be avoided when possible.
|tip He will cast "Magic Pull" drawing the part to him, to which all casters should move away immediately.
|tip He will debuff targets with a bomb and they should move away from the group when this happens.
|tip Melee will be tossed into the air when "Thundering Stomp" is used.
Click Here to Continue |confirm
step
kill Varos Cloudstrider##27447
|tip The Tank should hold Varos at the center.
|tip The main thing to look out for will be "Energize Cores".
|tip Several orbs around the edge of the platform you're fighting on will emit a tendrils towards Varos before a blast that deals damage is released.
|tip If Varos is centered, it will cover 1/3 of the platform and should be avoided.
|tip The place where the cores will hit will constantly rotate counter-clockwise.
|tip Keep an eye out for "Call Azure Riding Captain" which will shoot a beam that tracks a specific player.
|tip You will need to avoid that as well as the attacks from the Energized Cores.
Click Here to Continue |confirm
step
kill Mage-Lord Urom##27655
|tip During the encounter, he will cast "Frostbomb" which freezes the ground beneath players.
|tip It deals damage over time and slows those caught in it, so move out of it.
|tip He will occasionally teleport to the center of the Oculus and cast "Empowered Arcane Explosion".
|tip When this happens, you will need to Line of Sight it behind one of the many pillars around the arena.
|tip Targets afflicted by "Time Bomb" will need heavy healing.
Click Here to Continue |confirm
step
kill Ley-Guardian Eregos##27656
|tip There will be 3 types of drakes to ride during the fight:
|tip The "Ruby Drake" is the tank.
|tip It'll be important to spam the "Martyr" skill in combination with "Evasive Maneuvers" as much as possible.
|tip "Searing Wrath" will be your basic attack.
|tip The "Emerald Drake" is the healer.
|tip "Leeching Poison" will stack 3 times so try and keep that up constantly.
|tip "Touch the Nightmare" will reduce the targets damage.
|tip "Dream Funnel" will act as your heal.
|tip It will damage you when you use it, which is why it's important to keep Leeching Poison active.
|tip The "Amber Drake" is the DPS.
|tip DPS will need to alternate between using "Temporal Rift" and "Shock Lance".
|tip Use Temporal Rift until your stack on the boss reaches 10, then use Shock Lance for optimal damage.
|tip "Time Stop" will generate 5 stacks of Temporal Rift on all enemies.
Click Here to Continue |confirm
]])
ZygorGuidesViewer:RegisterGuide("Dungeon Guides\\Wrath of the Lich King\\The Oculus Quests",{
author="support@zygorguides.com",
description="This guide will walk you through completing the quests for The Oculus.",
condition_end=function() return completedq() end,
},[[
step
ding 80
step
talk Raelorasz##26117
accept The Struggle Persists##13124 |goto Borean Tundra 33.31,34.53
step
Inside the Dungeon:
kill Drakos the Interrogator##27654
|tip Belgaristrasz will be freed from the cage after defeating the boss.
talk Belgaristrasz##27658
turnin The Struggle Persists##13124
accept A Unified Front##13126
step
Inside the Dungeon:
kill 10 Centrifuge Construct##27641 |q 13126/1
|tip Use the Emerald Drake to fly around to the floating islands inside the dungeon.
|tip There will be 3 Constructs on each.
step
Inside the Dungeon:
kill Varos Cloudstrider##27447 |q 13126/2
step
Inside the Dungeon:
talk Image of Belgaristrasz##28012
|tip He will appear after defeating Varos Cloudstrider.
turnin A Unified Front##13126
accept Mage-Lord Urom##13127
step
Inside the Dungeon:
kill Mage-Lord Urom##27655 |q 13127/1
step
Inside the Dungeon:
talk Image of Belgaristrasz##28012
turnin Mage-Lord Urom##13127
accept A Wing and a Prayer##13128
step
Inside the Dungeon:
kill Ley-Guardian Eregos##27656 |q 13128/1
step
talk Raelorasz##26117
turnin A Wing and a Prayer##13128 |goto Borean Tundra 33.31,34.53
]])
ZygorGuidesViewer:RegisterGuide("Dungeon Guides\\Wrath of the Lich King\\Utgarde Pinnacle (79-80)",{
author="support@zygorguides.com",
description="This guide will walk you through completing Utgarde Keep.",
condition_end=function() return completedq() end,
},[[
step
kill Svala Sorrowgrave##26668
|tip Svala will use the "Ritual of the Sword" ability, summoning a random player to an altar.
|tip When this happens, the group will have 8 seconds to kill the Ritual Channelers, or the selected player will be killed.
|tip Note that "Ice Block" can save you from this on Normal mode. |only Mage
|tip Melee DPS attacking Ritual Channelers will be afflicted with "Shadows in the Dark", which inflicts damage every 3 seconds for 21 seconds and stacks.
|tip Kill all adds as soon as they appear then focus on killing Svala Sorrowgrave.
Click Here to Continue |confirm
step
click Stasis Controller
kill Gortok Palehoof##26687
|tip Once the encounter starts, random enemies will be re-animated to fight you.
|tip Jormunger: Leaves poison on the ground that deals damage over time and summons worm adds that need to be killed.
|tip Rhino: Deals heavy AoE damage and will charge random players leaving a DoT.
|tip Furlbog: Has randomized aggro, non-interruptible Chain Lightning, AoE Fear and Enrages.
|tip Worgen: Deals heavy single target damage and also uses "Mortal Strike" on the tank, reducing healing by 50%.
|tip When Gortok spawns, the tank needs to turn him away from the group.
|tip "Arcing Smash" will hit in a cone dealing massive damage.
|tip He will also hit a random party member with a spear throw, dealing 2,000 damage every 3 seconds for 10 seconds.
|tip Finally, he will use "Withering Roar" which will reduce the parties health by 500 for each cast, stacking up to 50 times.
|tip DPS Gortok Palehoof down as soon as possible.
Click Here to Continue |confirm
step
kill Skadi the Ruthless##26693
|tip At the start of the encounter, he will ride his Proto-Drake.
|tip Your goal is to move to the opposing end of the hallway.
|tip While you are moving, the Proto-Drake will use "Freezing Cloud" which will be marked on either the right or left side of the hallway.
|tip It's important to move to the opposite side for this, as it will leave a high damage AoE on the ground that persists for 10 seconds.
|tip Keep moving as you make your way, quickly killing the groups of 5 to 6 Frost Vrykul that spawn.
|tip IMPORTANT: Make sure players are grabbing the "Harpoons" that drop from Ymirjar Harpooners.
|tip Upon reaching the end of the hallway, there will be several Harpoon Launchers.
|tip The above mechanics will continue, but now, be on the look out for "Skadi the Ruthless is within range of the harpoon launchers!"
|tip When you see this, players need to quickly use the Harpoon Launchers, which if done correctly will bring Skadi to ground.
|tip DPS him as hard as you can, repeating the process until he is defeated.
Click Here to Continue |confirm
step
kill King Ymiron##26861
|tip Ymiron hits very hard.
|tip The tank should be well above 60% health for "Dark Slash".
|tip Stop ALL DPS when Ymiron casts "Bane".
|tip Each time he is damaged durign Bane, the entire party will take massive shadow damage.
|tip The Bane phase lasts for 5 seconds.
|tip He will also cast the disease "Fetid Rot" on random players, which needs to be removed immediately.
|tip At 33% and 66% health, he will use "Screams of the Dead" which will stun the entire party.
|tip You can use "Blink" to escape the effect. |only Mage
|tip You can use "Every Man for Himself" to escape the effect. |only Human
|tip During this, he will then channel power from one of the four boats in the room.
|tip Haldor: This will give the target "Spirit Strike" which increases the targets damage taken and stacks over time.
|tip Bjorn: He will summon a Spirit Fount which deals AoE shadow damage and moves around the room slowly.
|tip Kite Ymiron away from the orb.
|tip Ranulf: He will cast "Spirit Burst" which deals around 2,000 shadow damage.
|tip Tor: He will summon adds which should be AoE'd.
Click Here to Continue |confirm
]])
ZygorGuidesViewer:RegisterGuide("Dungeon Guides\\Wrath of the Lich King\\Utgarde Pinnacle Quests",{
author="support@zygorguides.com",
description="This guide will walk you through completing the quests for Utgarde Pinnacle.",
condition_end=function() return completedq() end,
},[[
step
ding 80
step
Inside the Dungeon:
talk Brigg Smallshanks##30871
|tip Near the entrance to the dungeon.
accept Junk in My Trunk##13131
accept Vengeance Be Mine!##13132
stickystart "Collect_Untarnished_Silver_Bars"
stickystart "Collect_Shiny_Baubles"
stickystart "Collect_Golden_Goblets"
stickystart "Collect_Jade_Statue"
step
Inside the Dungeon:
kill King Ymiron##26861 |q 13132/1
step
label "Collect_Untarnished_Silver_Bars"
Inside the Dungeon:
click Untarnish Silver Bar##192941
|tip They look like single silver ingots on scattered throughout the instance.
collect 5 Untarnished Silver Bar##43238 |q 13131/1
step
label "Collect_Shiny_Baubles"
Inside the Dungeon:
click Shiny Bauble##192942
|tip They look like small red crystals scattered throughout the instance.
collect 3 Shiny Bauble##43239 |q 13131/2
step
label "Collect_Golden_Goblets"
Inside the Dungeon:
click Golden Goblet##192944
|tip They look like golden cups with gems scattered throughout the instance.
collect 2 Golden Goblet##43240 |q 13131/3
step
label "Collect_Jade_Statue"
Inside the Dungeon:
click Jade Statue##192945
|tip They look like green serpent statues scattered throughout the instance.
collect 1 Jade Statue##43241 |q 13131/4
step
Inside the Dungeon:
talk Brigg Smallshanks##30871
|tip Near the entrance to the dungeon.
turnin Junk in My Trunk##13131
turnin Vengeance Be Mine!##13132
]])