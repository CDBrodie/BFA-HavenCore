-- Please note: I have NOT deleted the quest from the DB, I have simply removed the quest from the NPC giving it.

-- Inoculated Nestlewood Owlkin (ID 16534) - removing this guy as quest starter, because he should NOT give you the quest at all.
-- Only Vindicator Aldar (ID 16535) should give this quest.
DELETE FROM `creature_queststarter` 
WHERE `id`=16534 AND `quest`=9303;

-- Vindicator Aldar (ID 16535) - removing quest from this NPC, the quest with the ID 37444 is the duplicate.
DELETE FROM `creature_queststarter` 
WHERE `id`=16535 AND `quest`=37444;

-- When you used the crystal on Nestlewood Owlkin (ID 16518), its SmartAI spawns Inoculated Nestlewood Owlkin (ID 16534).
-- Inoculated Nestlewood Owlkin (ID 16534) - gave credit if killed before despawn, setting Unit_Flags to 2 for NON_ATTACKABLE (Was 0)
UPDATE `creature_template` SET `unit_flags` = 2 WHERE (`entry` = 16534);




-- Quest Seek Redemption! (ID 489)
-- Zenn Foulhoof (ID 2150) - Transforms into frog now on quest turn-in.
DELETE FROM `smart_scripts` WHERE `entryorguid` = 2150 AND `source_type` = 0;
INSERT INTO `smart_scripts` (
  `entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`,
  `event_param1`, `event_param2`, `event_param3`, `event_param4`, `event_param5`, `event_param_string`,
  `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`,
  `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`
) VALUES
  (2150, 0, 0, 1, 20, 0, 100, 0, 489, 0, 0, 0, 0, '', 1, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Reward Quest'),
  (2150, 0, 1, 0, 61, 0, 100, 0, 0, 0, 0, 0, 0, '', 11, 3329, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Cast Frog Spell On Self');