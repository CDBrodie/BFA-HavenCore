DELETE FROM `quest_poi` WHERE `QuestID` = 39049 AND `Idx1` = 0;
INSERT INTO `quest_poi` 
(`QuestID`, `BlobIndex`, `Idx1`, `ObjectiveIndex`, `QuestObjectiveID`, `QuestObjectID`, `MapID`, `UiMapID`, `Priority`, `Flags`, `WorldEffectID`, `PlayerConditionID`, `SpawnTrackingID`, `AlwaysAllowMergingBlobs`)
VALUES 
(39049, 0, 0, 0, 279707, 105946, 1481, 672, 0, 0, 0, 0, 0, 0);

DELETE FROM `quest_poi_points` WHERE `QuestID` = 39049 AND `Idx1` = 0 AND `Idx2` = 0;
INSERT INTO `quest_poi_points` 
(`QuestID`, `Idx1`, `Idx2`, `X`, `Y`)
VALUES 
(39049, 0, 0, 593, 2433);