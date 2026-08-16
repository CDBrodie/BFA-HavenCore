-- // All fixes in this file, fixes the issue with mobs showing as red while dead //
-- // This is for Alliance bracket 1 - 19 leveling zones fixed. 
-- // If other things is fixed on them too, I will leave a note on the end of the Name and ID //

-- Teidrassil --
-- ---------------------------

-- Nightsaber (ID 2042)
UPDATE `creature_template`
SET `unit_flags` = 67108864
WHERE `entry` = 2042;

-- Feral Nightsaber (ID 2034)
UPDATE `creature_template`
SET `unit_flags` = 0
WHERE `entry` = 2034;

-- Nightsaber Stalker (ID 2043)
UPDATE `creature_template`
SET `unit_flags` = 67108880
WHERE `entry` = 2043;

-- Webwood Venomfang (ID 1999)
UPDATE `creature_template`
SET `unit_flags` = 0
WHERE `entry` = 1999;

-- Webwood Lurker (ID 1998)
UPDATE `creature_template`
SET `unit_flags` = 16
WHERE `entry` = 1998;

-- Webwood Silkspinner (ID 2000)
UPDATE `creature_template`
SET `unit_flags` = 16
WHERE `entry` = 2000;

-- ---------------------------




-- Elwynn Forest --
-- ---------------------------

-- Young Forest Bear (ID 822)
UPDATE `creature_template`
SET `unit_flags` = 67108864
WHERE `entry` = 822;

-- Gray Forest Wolf (ID 1922)
UPDATE `creature_template`
SET `unit_flags` = 67108880
WHERE `entry` = 1922;

-- Prowler (ID 118)
UPDATE `creature_template`
SET `unit_flags` = 67108880
WHERE `entry` = 118;

-- ---------------------------




-- West Fall --
-- ---------------------------

-- Coyote (ID 834)
UPDATE `creature_template`
SET `unit_flags` = 67108880
WHERE `entry` = 834;

-- Young Fleshripper (ID 199)
UPDATE `creature_template`
SET `unit_flags` = 16
WHERE `entry` = 199;

-- Coyote Packleader (ID 833)
UPDATE `creature_template`
SET `unit_flags` = 67108864
WHERE `entry` = 833;

-- Greater Fleshripper (ID 154)
UPDATE `creature_template`
SET `unit_flags` = 0
WHERE `entry` = 154;

-- Vultros (ID 462)
UPDATE `creature_template`
SET `unit_flags` = 64
WHERE `entry` = 462;

-- ---------------------------




-- Redridge Mountains --
-- ---------------------------

-- Tarantula (ID 442)
UPDATE `creature_template`
SET `unit_flags` = 0
WHERE `entry` = 442;

-- Greater Tarantula (ID 505)
UPDATE `creature_template`
SET `unit_flags` = 0
WHERE `entry` = 505;

-- Chatter (ID 616)
UPDATE `creature_template`
SET `unit_flags` = 64
WHERE `entry` = 616;

-- Dire Condor (ID 428)
UPDATE `creature_template`
SET `unit_flags` = 16
WHERE `entry` = 428;

-- Blackrock Battle Worg (ID 43340)
UPDATE `creature_template`
SET `unit_flags` = 33280
WHERE `entry` = 43340;

-- Bellygrub (ID 345)
UPDATE `creature_template`
SET `unit_flags` = 0
WHERE `entry` = 345;

-- ---------------------------




-- Dun Morogh (Includes New Tinkertown) --
-- ---------------------------

-- Ragged Young Wolf (ID 705)
UPDATE `creature_template`
SET `unit_flags` = 0
WHERE `entry` = 705;

-- Crag Boar (ID 1125) - Added "IMMUNE_TO_NPC", because it should show as yellow, not red like before.
UPDATE `creature_template`
SET `unit_flags` = 67109376
WHERE `entry` = 1125;

-- Snow Tracker Wolf (ID 41478)
UPDATE `creature_template`
SET `unit_flags` = 67108880
WHERE `entry` = 41478;

-- Ice Claw Bear (ID 1196)
UPDATE `creature_template`
SET `unit_flags` = 67108864
WHERE `entry` = 1196;

-- Snow Leopard (ID 42170)
UPDATE `creature_template`
SET `unit_flags` = 67108880
WHERE `entry` = 42170;

-- Young Snow Leopard (ID 42286)
UPDATE `creature_template`
SET `unit_flags` = 262656
WHERE `entry` = 42286;

-- Timber (ID 1132)
UPDATE `creature_template`
SET `unit_flags` = 67108928
WHERE `entry` = 1132;

-- ---------------------------




-- Loch Modan --
-- ---------------------------

-- Black Bear (ID 1186)
UPDATE `creature_template`
SET `unit_flags` = 67108864
WHERE `entry` = 1186;

-- Forest Lurker (ID 1195)
UPDATE `creature_template`
SET `unit_flags` = 0
WHERE `entry` = 1195;

-- Loch Crocolisk (ID 1693)
UPDATE `creature_template`
SET `unit_flags` = 67141632
WHERE `entry` = 1693;

-- Bobcat (ID 44188)
UPDATE `creature_template`
SET `unit_flags` = 67108864
WHERE `entry` = 44188;

-- Golden Eagle (ID 44628) - Added "IMMUNE_TO_NPC", because it should show as yellow, not red like before.
UPDATE `creature_template`
SET `unit_flags` = 576
WHERE `entry` = 44628;

-- Hill Grizzly (ID 44638)
UPDATE `creature_template`
SET `unit_flags` = 0
WHERE `entry` = 44638;

-- Hill Fox (ID 44635) - Added "IMMUNE_TO_NPC", because it should show as yellow, not red like before.
UPDATE `creature_template`
SET `unit_flags` = 67109376
WHERE `entry` = 44635;

-- Ashtail (ID 45380) - Added "IMMUNE_TO_NPC", because it should show as yellow, not red like before.
UPDATE `creature_template`
SET `unit_flags` = 576
WHERE `entry` = 45380;

-- Marsh Wasp (ID 44620)
UPDATE `creature_template`
SET `unit_flags` = 0
WHERE `entry` = 44620;

-- Nix (ID 45402)
UPDATE `creature_template`
SET `unit_flags` = 64
WHERE `entry` = 45402;

-- Gosh-Haldir (ID 2476)
UPDATE `creature_template`
SET `unit_flags` = 32832
WHERE `entry` = 2476;
-- ---------------------------




-- Azuremyst Isle + Bloodmyst Isle --
-- ---------------------------

-- Infected Nightstalker Runt (ID 17202)
UPDATE `creature_template`
SET `unit_flags` = 67108880
WHERE `entry` = 17202;

-- Ravager Specimen (ID 17199)
UPDATE `creature_template`
SET `unit_flags` = 67108864
WHERE `entry` = 17199;

-- Nightstalker (ID 17203)
UPDATE `creature_template`
SET `unit_flags` = 67108864
WHERE `entry` = 17203;

-- Brown Bear (ID 17345)
UPDATE `creature_template`
SET `unit_flags` = 67108864
WHERE `entry` = 17345;

-- Bloodmyst Hatchling (ID 17525)
UPDATE `creature_template`
SET `unit_flags` = 67108880
WHERE `entry` = 17525;

-- Blue Flutterer (ID 17349) - Added "IMMUNE_TO_NPC", because it should show as yellow, not red like before.
UPDATE `creature_template`
SET `unit_flags` = 512
WHERE `entry` = 17349;

-- Grizzled Brown Bear (ID 17347)
UPDATE `creature_template`
SET `unit_flags` = 67108864
WHERE `entry` = 17347;

-- Enraged Ravager (ID 17527)
UPDATE `creature_template`
SET `unit_flags` = 67108864
WHERE `entry` = 17527;

-- Royal Blue Flutterer (ID 17350) - Added "IMMUNE_TO_NPC", because it should show as yellow, not red like before.
UPDATE `creature_template`
SET `unit_flags` = 528
WHERE `entry` = 17350;

-- Elder Brown Bear (ID 17348)
UPDATE `creature_template`
SET `unit_flags` = 67108864
WHERE `entry` = 17348;

-- ---------------------------




-- Darkshore --
-- ---------------------------

-- Strider Clutchmother (ID 2172)
UPDATE `creature_template`
SET `unit_flags` = 64
WHERE `entry` = 2172;

-- Consumed Thistle Bear (ID 34302)
UPDATE `creature_template`
SET `unit_flags` = 67141632
WHERE `entry` = 34302;

-- Moonstalker (ID 33127)
UPDATE `creature_template`
SET `unit_flags` = 67141632
WHERE `entry` = 33127;

-- Hungry Thistle Bear (ID 33978)
UPDATE `creature_template`
SET `unit_flags` = 67141632
WHERE `entry` = 33978;

-- Corrupted Thistle Bear (ID 33009)
UPDATE `creature_template`
SET `unit_flags` = 67141648
WHERE `entry` = 33009;
-- ---------------------------




-- Duskwood --

-- Venom Web Spider (ID 217)
UPDATE `creature_template`
SET `unit_flags` = 0
WHERE `entry` = 217;
-- ---------------------------