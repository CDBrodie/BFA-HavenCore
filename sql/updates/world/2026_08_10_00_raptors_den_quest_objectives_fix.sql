-- BFA-HavenCore

-- Into the Raptor's Den

DELETE FROM `quest_objectives` WHERE `QuestID` IN (905);

INSERT INTO `quest_objectives` (`ID`, `QuestID`, `Type`, `Order`, `StorageIndex`, `ObjectID`, `Amount`, `Flags`, `Flags2`, `ProgressBarWeight`, `Description`, `VerifiedBuild`) VALUES
(254499, 905, 0, 0, 0, 34964, 1, 0, 0, 0, 'Visit Red Raptor Nest', 35662);

INSERT INTO `quest_objectives` (`ID`, `QuestID`, `Type`, `Order`, `StorageIndex`, `ObjectID`, `Amount`, `Flags`, `Flags2`, `ProgressBarWeight`, `Description`, `VerifiedBuild`) VALUES
(254500, 905, 0, 1, 1, 34962, 1, 0, 0, 0, 'Visit Yellow Raptor Nest', 35662);

INSERT INTO `quest_objectives` (`ID`, `QuestID`, `Type`, `Order`, `StorageIndex`, `ObjectID`, `Amount`, `Flags`, `Flags2`, `ProgressBarWeight`, `Description`, `VerifiedBuild`) VALUES
(254501, 905, 0, 2, 2, 34963, 1, 0, 0, 0, 'Visit Blue Raptor Nest', 35662);