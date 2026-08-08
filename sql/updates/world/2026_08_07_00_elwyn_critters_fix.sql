UPDATE `creature_template_scaling`
SET `LevelScalingMin` = 1, `LevelScalingMax` = 1
WHERE `Entry` IN (1412, 62954);

UPDATE `creature_template`
SET `HealthModifier` = 0.03225806
WHERE `entry` = 721;