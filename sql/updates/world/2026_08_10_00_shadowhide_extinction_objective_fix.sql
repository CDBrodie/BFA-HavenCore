-- BFA-HavenCore

DELETE FROM `quest_objectives` WHERE `QuestID` IN (26692);

-- Shadowhide Extinction (ID 26692)
INSERT INTO `quest_objectives` (`ID`, `QuestID`, `Type`, `Order`, `StorageIndex`, `ObjectID`, `Amount`, `Flags`, `Flags2`, `ProgressBarWeight`, `Description`, `VerifiedBuild`) VALUES
(265275, 26692, 0, 0, 0, 579, 20, 0, 0, 0, 'Shadowhide Gnoll slain', 35662);