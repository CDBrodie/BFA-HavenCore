-- Cow 2442 - Few changes to this creature, listed below.
-- Changes the "Unit_Flags" to 512 (IMMUNE_TO_NPC - disables combat/assistance with NonPlayerCharacters (NPC)) - Players can now deal damage to it again.
-- Changes the "Flags_Extra" to 2 (CIVILIAN - not aggro (ignore faction/reputation hostility))
-- Changes the "Type" to 8 (This is because otherwise you would earn XP from killing it.)
UPDATE `creature_template`
SET `unit_flags` = 512, `flags_extra` = 66
WHERE `entry` = 2442;
-- ----------------------------------------


-- Sheep 1933 - Change HealthModifier, level scaling, unit_flags (512)
-- ----------------------------------------
UPDATE `creature_template`
SET `unit_flags` = 512
WHERE `entry` = 1933;

UPDATE `creature_template_scaling`
SET `LevelScalingMin` = 3, `LevelScalingMax` = 3 
WHERE `entry` = 1933;
-- ----------------------------------------


-- Rabbit 721 - Change HealthModifier and level scaling.
-- ----------------------------------------
UPDATE `creature_template`
SET `unit_flags` = 512
WHERE `entry` = 721;

-- Reason we dont check for difficulty is because both should be min 1 and max 1 (Based on WoWhead.)
UPDATE `creature_template_scaling`
SET `LevelScalingMin` = 1, `LevelScalingMax` = 1 
WHERE `entry` = 721;
-- ----------------------------------------


-- Small Frog 70495 - Change to critter type.
-- Faction changed from Friendly to Prey (Like most other critters)
-- ----------------------------------------
UPDATE `creature_template`
SET `unit_flags2` = 2048, `unit_flags` = 512, `faction` = 31
WHERE `entry` = 70495;
-- ----------------------------------------

-- Small Frog 13321 - Change unit_flags to 512
-- ----------------------------------------
UPDATE `creature_template`
SET `unit_flags` = 512, `type` = 8
WHERE `entry` = 13321;
-- ----------------------------------------