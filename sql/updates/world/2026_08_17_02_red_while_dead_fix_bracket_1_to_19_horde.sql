-- // All fixes in this file, fixes the issue with mobs showing as red while dead //
-- // This is for Horde bracket 1 - 19 leveling zones fixed. 
-- // If other things is fixed on them too, I will leave a note on the end of the Name and ID //

-- Durotar --
-- ---------------------------

-- Sarkoth (ID 3281)
UPDATE `creature_template`
SET `unit_flags` = 0
WHERE `entry` = 3281;

-- Dreadmaw Crocolisk (ID 3110)
UPDATE `creature_template`
SET `unit_flags` = 71335936
WHERE `entry` = 3110;

-- Dire Mottled Boar (ID 3099) - Added "IMMUNE_TO_NPC", because it should show as yellow, not red like before. 
UPDATE `creature_template`
SET `unit_flags` = 67109376
WHERE `entry` = 3099;

-- Clattering Scorpid (ID 3125)
UPDATE `creature_template`
SET `unit_flags` = 67108864
WHERE `entry` = 3125;

-- Armored Scorpid (ID 3126)
UPDATE `creature_template`
SET `unit_flags` = 67108880
WHERE `entry` = 3126;

-- Venomtail Scorpid (ID 3127)
UPDATE `creature_template`
SET `unit_flags` = 67108864
WHERE `entry` = 3127;

-- Bloodtalon Taillasher (ID 3122)
UPDATE `creature_template`
SET `unit_flags` = 67108864
WHERE `entry` = 3122;

-- Dreadmaw Toothgnasher (ID 39452)
UPDATE `creature_template`
SET `unit_flags` = 67141632
WHERE `entry` = 39452;

-- Screamslash (ID 39385)
UPDATE `creature_template`
SET `unit_flags` = 0
WHERE `entry` = 39385;

-- Bloodtalon Scythemaw (ID 3123)
UPDATE `creature_template`
SET `unit_flags` = 67371008
WHERE `entry` = 3123;

-- ---------------------------




-- Echo Isles --
-- ---------------------------

-- Wildmane Cat (ID 38046) - Added "IMMUNE_TO_NPC", because it should show as yellow, not red like before. 
UPDATE `creature_template`
SET `unit_flags` = 33280
WHERE `entry` = 38046;

-- Bloodtalon Raptor (ID 37956) - Added "IMMUNE_TO_NPC", because it should show as yellow, not red like before. 
UPDATE `creature_template`
SET `unit_flags` = 33280
WHERE `entry` = 37956;

-- Pygmy Surf Crawler (ID 39004) - Added "IMMUNE_TO_NPC", because it should show as yellow, not red like before. 
UPDATE `creature_template`
SET `unit_flags` = 512
WHERE `entry` = 39004;

-- Corrupted Bloodtalon (ID 37961)
UPDATE `creature_template`
SET `unit_flags` = 32768
WHERE `entry` = 37961;

-- ---------------------------




-- Northern Barrens --
-- ---------------------------

-- Fleeting Plainstrider (ID 3246) - Added "IMMUNE_TO_NPC", because it should show as yellow, not red like before.
UPDATE `creature_template`
SET `unit_flags` = 67108864
WHERE `entry` = 3246;

-- Sunscale Screecher (ID 3255)
UPDATE `creature_template`
SET `unit_flags` = 67108864
WHERE `entry` = 3255;

-- Savannah Prowler (ID 3425)
UPDATE `creature_template`
SET `unit_flags` = 67108864
WHERE `entry` = 3425;

-- Savannah Huntress (ID 3415)
UPDATE `creature_template`
SET `unit_flags` = 75497472
WHERE `entry` = 3415;

-- Savannah Patriarch (ID 3241)
UPDATE `creature_template`
SET `unit_flags` = 0
WHERE `entry` = 3241;

-- Takk the Leaper (ID 5842)
UPDATE `creature_template`
SET `unit_flags` = 64
WHERE `entry` = 5842;

-- Ornery Plainstrider (ID 3245) - Added "IMMUNE_TO_NPC", because it should show as yellow, not red like before.
UPDATE `creature_template`
SET `unit_flags` = 512
WHERE `entry` = 3245;

-- Sunscale Scytheclaw (ID 3256)
UPDATE `creature_template`
SET `unit_flags` = 67108864
WHERE `entry` = 3256;

-- Hecklefang Hyena (ID 4127)
UPDATE `creature_template`
SET `unit_flags` = 67108864
WHERE `entry` = 4127;

-- Barrens Vulture (ID 34640) - Should be hostile, that is fixed now (Change in faction with ID 73 (Faction 669 -> Beast - Carrion Bird))
UPDATE `creature_template`
SET `faction` = 73
WHERE `entry` = 34640;

-- Oasis Snapjaw (ID 3461)
UPDATE `creature_template`
SET `unit_flags` = 67141632
WHERE `entry` = 3461;

-- Sunscale Lashtail (ID 3254)
UPDATE `creature_template`
SET `unit_flags` = 67108864
WHERE `entry` = 3254;

-- ---------------------------




-- Azshara --
-- ---------------------------

-- Mistwing Cliffdweller (ID 36304)
UPDATE `creature_template`
SET `unit_flags` = 67108864
WHERE `entry` = 36304;

-- Mistwing Ravager (ID 8764)
UPDATE `creature_template`
SET `unit_flags` = 67141632
WHERE `entry` = 8764;

-- ---------------------------




-- Sunstrider Isle --
-- ---------------------------

-- Crazed Dragonhawk (ID 15650) - Added "IMMUNE_TO_NPC", because it should show as yellow, not red like before.
UPDATE `creature_template`
SET `unit_flags` = 67109376
WHERE `entry` = 15650;

-- Feral Dragonhawk Hatchling (ID 15649) - Added "IMMUNE_TO_NPC", because it should show as yellow, not red like before.
UPDATE `creature_template`
SET `unit_flags` = 67109376
WHERE `entry` = 15649;

-- Springpaw Lynx (ID 15372) - Added "IMMUNE_TO_NPC", because it should show as yellow, not red like before.
UPDATE `creature_template`
SET `unit_flags` = 512
WHERE `entry` = 15372;

-- Springpaw Stalker (ID 15651)
UPDATE `creature_template`
SET `unit_flags` = 67108880
WHERE `entry` = 15651;

-- Elder Springpaw (ID 15652)
UPDATE `creature_template`
SET `unit_flags` = 67108864
WHERE `entry` = 15652;

-- ---------------------------




-- Ghostland --
-- ---------------------------

-- Starving Ghostclaw (ID 16347)
UPDATE `creature_template`
SET `unit_flags` = 67108864
WHERE `entry` = 16347;

-- Mistbat (ID 16353)
UPDATE `creature_template`
SET `unit_flags` = 67108864
WHERE `entry` = 16353;

-- Spindleweb Lurker (ID 16351)
UPDATE `creature_template`
SET `unit_flags` = 0
WHERE `entry` = 16351;

-- Vampiric Mistbat (ID 16354)
UPDATE `creature_template`
SET `unit_flags` = 67108864
WHERE `entry` = 16354;

-- Ghostclaw Ravager (ID 16349)
UPDATE `creature_template`
SET `unit_flags` = 67108864
WHERE `entry` = 16349;

-- Greater Spindleweb (ID 16352)
UPDATE `creature_template`
SET `unit_flags` = 0
WHERE `entry` = 16352;

-- Maggot (ID 16030) - This is a critter, fixed level scaling (Was 100 - 100)
UPDATE `creature_template_scaling`
SET `LevelScalingMin` = 1, `LevelScalingMax` = 1
WHERE `entry` = 16030 AND `DifficultyID` = 0;

-- Ghostclaw Lynx (ID 16348)
UPDATE `creature_template`
SET `unit_flags` = 67108880
WHERE `entry` = 16348;

-- ---------------------------




-- Tirisfal Glades --
-- ---------------------------

-- Ragged Scavenger (ID 1509) - Added "IMMUNE_TO_NPC", because it should show as yellow, not red like before.
UPDATE `creature_template`
SET `unit_flags` = 67109376
WHERE `entry` = 1509;

-- Greater Duskbat (ID 1553) - Added "IMMUNE_TO_NPC", because it should show as yellow, not red like before.
UPDATE `creature_template`
SET `unit_flags` = 67109376
WHERE `entry` = 1553;

-- Decrepit Darkhound (ID 1547)
UPDATE `creature_template`
SET `unit_flags` = 67108864
WHERE `entry` = 1547;

-- Cursed Darkhound (ID 1548)
UPDATE `creature_template`
SET `unit_flags` = 67108864
WHERE `entry` = 1548;

-- Ravenous Darkhound (ID 1549)
UPDATE `creature_template`
SET `unit_flags` = 67108880
WHERE `entry` = 1549;

-- Vampiric Duskbat (ID 1554)
UPDATE `creature_template`
SET `unit_flags` = 67108864
WHERE `entry` = 1554;

-- Ressan the Needler (ID 10357)
UPDATE `creature_template`
SET `unit_flags` = 64
WHERE `entry` = 10357;

-- Vicious Night Web Spider (ID 1555)
UPDATE `creature_template`
SET `unit_flags` = 0
WHERE `entry` = 1555;

-- Plagued Bruin (ID 39049)
UPDATE `creature_template`
SET `unit_flags` = 67108864
WHERE `entry` = 39049;

-- ---------------------------




-- Silverpine --
-- ---------------------------

-- Gorefang (ID 12431)
UPDATE `creature_template`
SET `unit_flags` = 67108928
WHERE `entry` = 12431;

-- Rabid Worg (ID 1766)
UPDATE `creature_template`
SET `unit_flags` = 67141632
WHERE `entry` = 1766;

-- Giant Rabid Bear (ID 1797)
UPDATE `creature_template`
SET `unit_flags` = 67108864
WHERE `entry` = 1797;

-- Worg (ID 1765)
UPDATE `creature_template`
SET `unit_flags` = 67141632
WHERE `entry` = 1765;

-- Ferocious Grizzled Bear (ID 1778)
UPDATE `creature_template`
SET `unit_flags` = 67141632
WHERE `entry` = 1778;

-- ---------------------------




-- Hillsbrad Foothills --
-- ---------------------------

-- Infested Bear (ID 47204)
UPDATE `creature_template`
SET `unit_flags` = 67108864
WHERE `entry` = 47204;

-- Creepthess (ID 14279)
UPDATE `creature_template`
SET `unit_flags` = 64
WHERE `entry` = 14279;

-- Elder Gray Bear (ID 2356)
UPDATE `creature_template`
SET `unit_flags` = 16
WHERE `entry` = 2356;

-- Forest Creeper (ID 2350)
UPDATE `creature_template`
SET `unit_flags` = 8388624
WHERE `entry` = 2350;

-- Foothill Stalker (ID 2385)
UPDATE `creature_template`
SET `unit_flags` = 67141648
WHERE `entry` = 2385;

-- Araga (ID 14222)
UPDATE `creature_template`
SET `unit_flags` = 64
WHERE `entry` = 14222;

-- Forest Creeper (ID 2350)
UPDATE `creature_template`
SET `unit_flags` = 8388624
WHERE `entry` = 2350;

-- Snapjaw (ID 2408)
UPDATE `creature_template`
SET `unit_flags` = 67141632
WHERE `entry` = 2408;

-- Big Samras (ID 14280)
UPDATE `creature_template`
SET `unit_flags` = 67371072
WHERE `entry` = 14280;

-- Vicious Black Bear (ID 49249)
UPDATE `creature_template`
SET `unit_flags` = 0
WHERE `entry` = 49249;

-- ---------------------------




-- Mulgore --
-- ---------------------------

-- Swoop (ID 2970)
UPDATE `creature_template`
SET `unit_flags` = 0
WHERE `entry` = 2970;

-- Prairie Wolf (ID 2958)
UPDATE `creature_template`
SET `unit_flags` = 67108864
WHERE `entry` = 2958;

-- Wiry Swoop (ID 2969)
UPDATE `creature_template`
SET `unit_flags` = 0
WHERE `entry` = 2969;

-- Flatland Cougar (ID 3035)
UPDATE `creature_template`
SET `unit_flags` = 67108864
WHERE `entry` = 3035;

-- Flatland Prowler (ID 3566)
UPDATE `creature_template`
SET `unit_flags` = 67108864
WHERE `entry` = 3566;

-- Mazzranache (ID 3068)
UPDATE `creature_template`
SET `unit_flags` = 64
WHERE `entry` = 3068;

-- Prairie Wolf Alpha (ID 2960)
UPDATE `creature_template`
SET `unit_flags` = 67108864
WHERE `entry` = 2960;

-- Taloned Swoop (ID 2971)
UPDATE `creature_template`
SET `unit_flags` = 0
WHERE `entry` = 2971;

-- Prairie Stalker (ID 2959)
UPDATE `creature_template`
SET `unit_flags` = 67108864
WHERE `entry` = 2959;

-- Ghost Howl (ID 3056)
UPDATE `creature_template`
SET `unit_flags` = 0
WHERE `entry` = 3056;

-- ---------------------------