-- BFA-HavenCore
-- Westfall Fixes!!! PART 2

-- FIX 1

DELETE FROM `conditions`
WHERE `SourceTypeOrReferenceId` = 26
  AND `SourceGroup` = 169
  AND `SourceEntry` = 40;

INSERT INTO `conditions`
    (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`,
     `ConditionTypeOrReference`, `ConditionTarget`,
     `ConditionValue1`, `ConditionValue2`, `ConditionValue3`,
     `NegativeCondition`, `Comment`)
VALUES
(26, 169, 40, 0, 0, 47, 0, 26232, 66, 0, 1,
 'Westfall Phase 169 - Apply only when quest 26232 (Lou''s Parting Thoughts) is not yet rewarded');

-- FIX 2

UPDATE `creature`
SET `PhaseId` = 169, `PhaseUseFlags` = 0, `PhaseGroup` = 0
WHERE `guid` IN (
    214427,  -- Two-Shoed Lou                      (NPC 42405)
    214362,  -- Lieutenant Horatio Laine pre-quest (NPC 42308)
    214354,  -- Stormwind Investigator 1           (NPC 42309)
    214357,  -- Stormwind Investigator 2           (NPC 42309)
    214359   -- Verna Furlbrow                     (NPC 238  )
);

-- FIX 3

UPDATE `creature`
SET `PhaseId` = 169, `PhaseUseFlags` = 0, `PhaseGroup` = 0
WHERE `id` IN (42383, 42384, 42385, 42386)
  AND `map` = 0
  AND `PhaseId` = 0
  AND `position_y` BETWEEN 1270 AND 1340
  AND `position_x` BETWEEN -9900 AND -9820;

-- FIX 4

UPDATE `creature`
SET `PhaseUseFlags` = 1, `PhaseId` = 0, `PhaseGroup` = 0
WHERE `guid` IN (214380, 214381);

-- FIX 5

UPDATE `creature`
SET `PhaseUseFlags` = 0
WHERE `guid` IN (10678110, 10678111, 10678112);

UPDATE `creature`
SET `PhaseUseFlags` = 0
WHERE `id` IN (42383, 42384, 42385, 42386)
  AND `map` = 0
  AND `PhaseId` != 0
  AND `PhaseUseFlags` = 1;

-- FIX 6: 

UPDATE `creature_template`
SET `ScriptName` = 'npc_westfall_two_shoed_lou'
WHERE `entry` = 42405;
