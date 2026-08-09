-- BFA-HavenCore

UPDATE creature_template SET faction = 35 WHERE entry = 42413;
UPDATE creature_template SET faction = 35 WHERE entry = 42385;

DELETE FROM `npc_spellclick_spells` WHERE `npc_entry` = 42260 AND `spell_id` = 46598;
INSERT INTO `npc_spellclick_spells` (`npc_entry`, `spell_id`, `cast_flags`, `user_type`) VALUES (42260, 46598, 1, 0);

UPDATE `quest_template` SET `RewardSpell` = '0' WHERE `ID` = '12619';