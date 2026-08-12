-- Stonetusk Boar 113 - Family changed to Boar (was wolf), Changed type to Beast (was NONE)
-- Random note: Nothing fixed the showing as hostile, removing the "PLAYER_CONTROLLED" fixed it!
UPDATE `creature_template`
SET `family` = 5, `type` = 1, `faction` = 7, `unit_flags` = 67108864
WHERE `entry` = 113;