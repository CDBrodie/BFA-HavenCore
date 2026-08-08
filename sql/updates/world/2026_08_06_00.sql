UPDATE `creature_template_scaling`
SET 
  `LevelScalingMin` = 3,
  `LevelScalingMax` = 3
WHERE `Entry` = 1933;

UPDATE `creature_template_scaling`
SET 
  `LevelScalingMin` = 1,
  `LevelScalingMax` = 1
WHERE `Entry` = 2442;

UPDATE `creature_template_scaling`
SET 
  `LevelScalingMin` = 1,
  `LevelScalingMax` = 1
WHERE `Entry` = 13321;

-- Stormwind City Guard
UPDATE `creature_template_scaling` -- Not sure if they scale or not
SET 
  `LevelScalingMin` = 110,
  `LevelScalingMax` = 110
WHERE `Entry` = 68;