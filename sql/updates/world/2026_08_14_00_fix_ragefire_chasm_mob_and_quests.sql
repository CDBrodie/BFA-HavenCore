-- Fixes one creature, and 2 quest objective texts.

-- Slain Trogg (61659) - Set "type_flags" to 0 (Was 4096).
-- This removes the flag "CAN_ASSIST", before it would look dead, but keep following mobs.
UPDATE `creature_template`
SET `type_flags` = 0
WHERE `entry` = 61659;

-- No Man Left Behind (30995)
UPDATE `quest_objectives`
SET `Description` = 'SI:7 Rangers rescued'
WHERE `QuestID` = 30995 AND `ObjectID` = 61788;

-- No Orc Left Behind (30984)
UPDATE `quest_objectives`
SET `Description` = 'Kor''kron Scouts rescued'
WHERE `QuestID` = 30984 AND `ObjectID` = 61680;