-- Adder 3300 - Level Scaling was off, unit_flags wrong, and HealthModifier was 0,01, now 0,05
UPDATE `creature_template_scaling`
SET `LevelScalingMin` = 1, `LevelScalingMax` = 1
WHERE `entry` = 3300;

UPDATE `creature_template`
SET `unit_flags` = 512, `HealthModifier` = 0.05
WHERE `entry` = 3300;
-- ----------------------------------------


-- Hare 5951 - Fixed HealthModifier, was 0,2 (6 HP), now 0,27 (8 HP as its supposed to be)
UPDATE `creature_template`
SET `HealthModifier` = 0.27
WHERE `entry` = 5951;
-- ----------------------------------------


-- Dung Beetle 49743 - Level Scaling was off, unit_flags wrong, and HealthModifier was 0,01, now 0,05
UPDATE `creature_template_scaling`
SET `LevelScalingMin` = 1, `LevelScalingMax` = 1
WHERE `entry` = 49743;

UPDATE `creature_template`
SET `unit_flags` = 512, `HealthModifier` = 0.27
WHERE `entry` = 49743;
-- ----------------------------------------


-- Swine 10685 - Level was off, and HealthModifier was 0,2, now 0,18
UPDATE `creature_template`
SET `minlevel` = 1, `maxlevel` = 1, `unit_flags` = 512, `HealthModifier` = 0.18
WHERE `entry` = 10685;
-- ----------------------------------------