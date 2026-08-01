-- Fix: Restore Maztha (44919) as Riding Trainer (follow-up to 2026_07_10_07.sql)
-- Restores TRAINER/TRAINER_PROFESSION bits to npcflag (8275) and adds riding trainer data
-- (Id 944919) for Apprentice through Master Riding (Skill 762) with a "Train me." gossip option.

UPDATE `creature_template` SET `npcflag` = 8275, `gossip_menu_id` = 944919 WHERE `entry` = 44919;

DELETE FROM `gossip_menu` WHERE `MenuId` = 944919;
INSERT INTO `gossip_menu` (`MenuId`, `TextId`, `VerifiedBuild`) VALUES (944919, 0, 0);

DELETE FROM `gossip_menu_option` WHERE `MenuId` = 944919;
INSERT INTO `gossip_menu_option`
(`MenuId`, `OptionIndex`, `OptionIcon`, `OptionText`, `OptionBroadcastTextId`, `OptionType`, `OptionNpcFlag`, `VerifiedBuild`)
VALUES (944919, 0, 3, 'Train me.', 3266, 5, 16, 0);

DELETE FROM `trainer` WHERE `Id` = 944919;
INSERT INTO `trainer` (`Id`, `Type`, `Greeting`, `VerifiedBuild`)
VALUES (944919, 2, 'I can teach you to ride, if you have the coin and the courage.', 0);

DELETE FROM `trainer_spell` WHERE `TrainerId` = 944919;
INSERT INTO `trainer_spell` (`TrainerId`, `SpellId`, `MoneyCost`, `ReqSkillLine`, `ReqSkillRank`, `ReqAbility1`, `ReqAbility2`, `ReqAbility3`, `ReqLevel`, `VerifiedBuild`) VALUES
(944919, 33388, 40000,    762, 0,   0, 0, 0, 0, 0),  -- Apprentice Riding - 4g
(944919, 33391, 500000,   762, 75,  0, 0, 0, 0, 0),  -- Journeyman Riding - 50g
(944919, 34090, 2500000,  762, 150, 0, 0, 0, 0, 0),  -- Expert Riding - 250g
(944919, 34091, 50000000, 762, 225, 0, 0, 0, 0, 0),  -- Artisan Riding - 5000g
(944919, 90265, 50000000, 762, 300, 0, 0, 0, 0, 0);  -- Master Riding - 5000g

DELETE FROM `creature_trainer` WHERE `CreatureId` = 44919;
INSERT INTO `creature_trainer` (`CreatureId`, `TrainerId`, `MenuId`, `OptionIndex`) VALUES (44919, 944919, 944919, 0);