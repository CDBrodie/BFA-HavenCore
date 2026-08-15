-- Gilnean Crow - Removing his XP and changing his type to Critter
UPDATE `creature_template` 
SET `ExperienceModifier` = 0, `type` = 8
WHERE `entry` = 50260;