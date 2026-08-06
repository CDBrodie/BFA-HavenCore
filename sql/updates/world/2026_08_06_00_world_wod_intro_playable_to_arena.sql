-- Blasted Lands terrain and WoD intro route, verified playable through the
-- pre-arena quest chain. Later Tanaan choreography remains incomplete.

DELETE FROM `terrain_swap_defaults`
WHERE `MapId` = 0 AND `TerrainSwapMap` = 545;

-- Board quest and Khadgar's direct alternative must not coexist.
DELETE FROM `creature_queststarter`
WHERE `id` = 78423 AND `quest` = 34398;

DELETE FROM `conditions`
WHERE `SourceTypeOrReferenceId` = 19
  AND `SourceGroup` = 0
  AND `SourceEntry` IN (34398, 36881)
  AND `ConditionTypeOrReference` = 14
  AND `ConditionValue1` IN (34398, 36881);

INSERT INTO `conditions`
(`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`,
 `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`,
 `ConditionValue3`, `NegativeCondition`, `ErrorType`, `ErrorTextId`, `ScriptName`, `Comment`)
VALUES
(19, 0, 34398, 0, 0, 14, 0, 36881, 0, 0, 0, 0, 0, '',
 'Offer board Dark Portal quest only while direct Khadgar alternative was never taken'),
(19, 0, 36881, 0, 0, 14, 0, 34398, 0, 0, 0, 0, 0, '',
 'Offer direct Khadgar Dark Portal quest only while board alternative was never taken');

-- Restore Azeroth's Last Stand, but keep the following Onslaught's End
-- acceptance NPC-driven rather than opening it from the player automatically.
UPDATE `quest_template`
SET `RewardNextQuest` = 35933
WHERE `ID` IN (34398, 36881);

UPDATE `quest_template_addon`
SET `NextQuestID` = 35933
WHERE `ID` IN (34398, 36881);

UPDATE `quest_template`
SET `RewardNextQuest` = 0
WHERE `ID` = 35933;

UPDATE `quest_template_addon`
SET `PrevQuestID` = 0,
    `NextQuestID` = 0
WHERE `ID` = 35933;

UPDATE `quest_template_addon`
SET `PrevQuestID` = 35933
WHERE `ID` = 34392;

DELETE FROM `conditions`
WHERE `SourceTypeOrReferenceId` = 19
  AND `SourceEntry` = 35933;

INSERT INTO `conditions`
    (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`,
     `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`,
     `ConditionValue3`, `NegativeCondition`, `ErrorType`, `ErrorTextId`, `ScriptName`, `Comment`)
VALUES
    (19, 0, 35933, 0, 1, 47, 0, 34398, 66, 0, 0, 0, 0, '',
     'Offer Azeroth''s Last Stand after board Dark Portal quest'),
    (19, 0, 35933, 0, 2, 47, 0, 36881, 66, 0, 0, 0, 0, '',
     'Offer Azeroth''s Last Stand after direct Dark Portal quest');

-- Scope a legacy Worgen condition that otherwise suppresses reused phase 170.
UPDATE `conditions`
SET `SourceEntry` = 4755,
    `Comment` = 'Set Worgen phase 170 after quest 14091 is complete'
WHERE `SourceTypeOrReferenceId` = 26
  AND `SourceGroup` = 170
  AND `SourceEntry` = 0
  AND `ConditionTypeOrReference` = 28
  AND `ConditionValue1` = 14091;

-- Remove the overlapping portal-with-debris WMO, preserving the intact portal.
DELETE FROM `gameobject`
WHERE `guid` = 1250112
  AND `id` = 237667
  AND `map` = 1265;

UPDATE `gameobject_template_addon`
SET `flags` = `flags` | 0x10
WHERE `entry` = 237670;

DELETE FROM `gossip_menu_option_box`
WHERE `MenuId` = 60000 AND `OptionIndex` = 1;

INSERT INTO `gossip_menu_option_box`
    (`MenuId`, `OptionIndex`, `BoxCoded`, `BoxMoney`, `BoxText`, `BoxBroadcastTextId`)
VALUES
    (60000, 1, 0, 0,
     'You are about to embark on a dangerous mission, and you may not be able to return immediately. Are you sure?',
     0);

-- Restore Alliance/Horde city travel helpers and compact command boards.
UPDATE `creature`
SET `PhaseId` = 0
WHERE `guid` = 3400000000002036 AND `id` = 149626 AND `map` = 0;

UPDATE `creature_template`
SET `AIName` = '', `ScriptName` = 'npc_vanguard_battlemage_wod'
WHERE `entry` = 149626;

UPDATE `creature`
SET `modelid` = 56857
WHERE `guid` = 3400000000002036 AND `id` = 149626 AND `map` = 0;

UPDATE `creature`
SET `modelid` = 35498
WHERE `guid` = 300005811 AND `id` = 149626 AND `map` = 1;

UPDATE `gameobject_template`
SET `ScriptName` = 'go_stormwind_heros_call_board'
WHERE `entry` IN (206109, 206111, 206116, 206294, 207320, 207323);

UPDATE `gameobject_template`
SET `name` = 'Hero''s Call Board'
WHERE `entry` = 206111 AND (`name` IS NULL OR `name` = '');

-- Replace internal credit-creature fallback labels shown as "slain".
UPDATE `quest_objectives`
SET `Description` = 'Speak with Archmage Khadgar'
WHERE `ID` IN (272640, 275352) AND `ObjectID` = 78419;

UPDATE `quest_objectives` SET `Description` = 'Bleeding Hollow huts destroyed'
WHERE `ID` = 273635 AND `QuestID` = 34422;
UPDATE `quest_objectives` SET `Description` = 'Speak with Ariok'
WHERE `ID` = 273075 AND `QuestID` = 34423;
UPDATE `quest_objectives` SET `Description` = 'Reach the Bleeding Altar with Ariok'
WHERE `ID` = 273677 AND `QuestID` = 34423;
UPDATE `quest_objectives` SET `Description` = 'Blood Ritual Orbs destroyed'
WHERE `ID` = 273678 AND `QuestID` = 34423;
UPDATE `quest_objectives` SET `Description` = 'Regroup with Khadgar'
WHERE `ID` = 274409 AND `QuestID` = 34423;
UPDATE `quest_objectives` SET `Description` = 'Follow Khadgar'
WHERE `ID` = 273737 AND `QuestID` = 34425;
UPDATE `quest_objectives` SET `Description` = 'Farseer Drek''Thar freed'
WHERE `ID` = 272869 AND `QuestID` = 34427;
UPDATE `quest_objectives` SET `Description` = 'Exarch Maladaar freed'
WHERE `ID` = 272833 AND `QuestID` = 34478;
