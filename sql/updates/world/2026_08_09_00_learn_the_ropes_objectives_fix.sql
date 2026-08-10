-- BFA-HavenCore

-- Clean up existing entries to prevent duplicate key errors
DELETE FROM `quest_objectives` WHERE `ID` IN (268800, 268808, 268804, 268799, 268810, 268812, 268809, 268803, 268811, 268805, 268806);

-- GoldShire
INSERT INTO `quest_objectives` (`ID`, `QuestID`, `Type`, `Order`, `StorageIndex`, `ObjectID`, `Amount`, `Flags`, `Flags2`, `ProgressBarWeight`, `Description`, `VerifiedBuild`) VALUES
(268800, 31308, 0, 0, 0, 65355, 1, 0, 0, 0, 'Win a Pet Battle', 35662);
-- Eversong Woods
INSERT INTO `quest_objectives` (`ID`, `QuestID`, `Type`, `Order`, `StorageIndex`, `ObjectID`, `Amount`, `Flags`, `Flags2`, `ProgressBarWeight`, `Description`, `VerifiedBuild`) VALUES
(268808, 31579, 0, 0, 0, 65355, 1, 0, 0, 0, 'Win a Pet Battle', 35662);
-- Teldrassil
INSERT INTO `quest_objectives` (`ID`, `QuestID`, `Type`, `Order`, `StorageIndex`, `ObjectID`, `Amount`, `Flags`, `Flags2`, `ProgressBarWeight`, `Description`, `VerifiedBuild`) VALUES
(268804, 31552, 0, 0, 0, 65355, 1, 0, 0, 0, 'Win a Pet Battle', 35662);
-- Stormwind City
INSERT INTO `quest_objectives` (`ID`, `QuestID`, `Type`, `Order`, `StorageIndex`, `ObjectID`, `Amount`, `Flags`, `Flags2`, `ProgressBarWeight`, `Description`, `VerifiedBuild`) VALUES
(268799, 31591, 0, 0, 0, 65355, 1, 0, 0, 0, 'Win a Pet Battle', 35662);
-- Dun Morogh
INSERT INTO `quest_objectives` (`ID`, `QuestID`, `Type`, `Order`, `StorageIndex`, `ObjectID`, `Amount`, `Flags`, `Flags2`, `ProgressBarWeight`, `Description`, `VerifiedBuild`) VALUES
(268810, 31548, 0, 0, 0, 65355, 1, 0, 0, 0, 'Win a Pet Battle', 35662);
-- Azuremyst Isle
INSERT INTO `quest_objectives` (`ID`, `QuestID`, `Type`, `Order`, `StorageIndex`, `ObjectID`, `Amount`, `Flags`, `Flags2`, `ProgressBarWeight`, `Description`, `VerifiedBuild`) VALUES
(268812, 31556, 0, 0, 0, 65355, 1, 0, 0, 0, 'Win a Pet Battle', 35662);
-- Durotar
INSERT INTO `quest_objectives` (`ID`, `QuestID`, `Type`, `Order`, `StorageIndex`, `ObjectID`, `Amount`, `Flags`, `Flags2`, `ProgressBarWeight`, `Description`, `VerifiedBuild`) VALUES
(268809, 31571, 0, 0, 0, 65355, 1, 0, 0, 0, 'Win a Pet Battle', 35662);
-- Tirisfal Glades
INSERT INTO `quest_objectives` (`ID`, `QuestID`, `Type`, `Order`, `StorageIndex`, `ObjectID`, `Amount`, `Flags`, `Flags2`, `ProgressBarWeight`, `Description`, `VerifiedBuild`) VALUES
(268803, 31576, 0, 0, 0, 65355, 1, 0, 0, 0, 'Win a Pet Battle', 35662);
-- Darkshore
INSERT INTO `quest_objectives` (`ID`, `QuestID`, `Type`, `Order`, `StorageIndex`, `ObjectID`, `Amount`, `Flags`, `Flags2`, `ProgressBarWeight`, `Description`, `VerifiedBuild`) VALUES
(268811, 31582, 0, 0, 0, 65355, 1, 0, 0, 0, 'Win a Pet Battle', 35662);
-- Orgrimmar
INSERT INTO `quest_objectives` (`ID`, `QuestID`, `Type`, `Order`, `StorageIndex`, `ObjectID`, `Amount`, `Flags`, `Flags2`, `ProgressBarWeight`, `Description`, `VerifiedBuild`) VALUES
(268805, 31585, 0, 0, 0, 65355, 1, 0, 0, 0, 'Win a Pet Battle', 35662);
-- Orgrimmar #2
INSERT INTO `quest_objectives` (`ID`, `QuestID`, `Type`, `Order`, `StorageIndex`, `ObjectID`, `Amount`, `Flags`, `Flags2`, `ProgressBarWeight`, `Description`, `VerifiedBuild`) VALUES
(268806, 31588, 0, 0, 0, 65355, 1, 0, 0, 0, 'Win a Pet Battle', 35662);