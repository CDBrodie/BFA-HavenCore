-- 
-- 26393 A Swift Message - has quest_objective
--  

DELETE FROM quest_poi
WHERE QuestID = 26393;

DELETE FROM quest_poi_points
WHERE QuestID = 26393;

INSERT INTO `quest_poi` (`QuestID`, `BlobIndex`, `Idx1`, `ObjectiveIndex`, `QuestObjectiveID`, `QuestObjectID`, `MapID`, `UiMapID`, `Priority`, `Flags`, `WorldEffectID`, `PlayerConditionID`, `SpawnTrackingID`, `AlwaysAllowMergingBlobs`, `VerifiedBuild`) VALUES (26393, 0, 0, -1, 0, 0, 0, 37, 0, 1, 0, 0, 0, 0, 35662);
INSERT INTO `quest_poi` (`QuestID`, `BlobIndex`, `Idx1`, `ObjectiveIndex`, `QuestObjectiveID`, `QuestObjectID`, `MapID`, `UiMapID`, `Priority`, `Flags`, `WorldEffectID`, `PlayerConditionID`, `SpawnTrackingID`, `AlwaysAllowMergingBlobs`, `VerifiedBuild`) VALUES (26393, 0, 1, 0, 265992, 0, 0, 37, 0, 1, 0, 0, 13073, 0, 35662);
INSERT INTO `quest_poi` (`QuestID`, `BlobIndex`, `Idx1`, `ObjectiveIndex`, `QuestObjectiveID`, `QuestObjectID`, `MapID`, `UiMapID`, `Priority`, `Flags`, `WorldEffectID`, `PlayerConditionID`, `SpawnTrackingID`, `AlwaysAllowMergingBlobs`, `VerifiedBuild`) VALUES (26393, 0, 2, 32, 0, 0, 0, 37, 0, 0, 0, 0, 13073, 0, 35662);

INSERT INTO `quest_poi_points` (`QuestID`, `Idx1`, `Idx2`, `X`, `Y`, `VerifiedBuild`) VALUES (26393, 0, 0, -9435, 88, 35662);
INSERT INTO `quest_poi_points` (`QuestID`, `Idx1`, `Idx2`, `X`, `Y`, `VerifiedBuild`) VALUES (26393, 1, 0, -9435, 88, 35662);


-- 
-- 28819 The Rear is Clear - Simple turn in quest with no quest_objective
-- 

DELETE FROM quest_poi
WHERE QuestID = 28819;

DELETE FROM quest_poi_points
WHERE QuestID = 28819;

INSERT INTO `quest_poi` (`QuestID`, `BlobIndex`, `Idx1`, `ObjectiveIndex`, `QuestObjectiveID`, `QuestObjectID`, `MapID`, `UiMapID`, `Priority`, `Flags`, `WorldEffectID`, `PlayerConditionID`, `SpawnTrackingID`, `AlwaysAllowMergingBlobs`, `VerifiedBuild`) VALUES (28819, 0, 0, -1, 0, 0, 0, 425, 0, 1, 0, 0, 0, 0, 35662);

-- Quest giver
INSERT INTO `quest_poi_points` (`QuestID`, `Idx1`, `Idx2`, `X`, `Y`, `VerifiedBuild`) VALUES (28819, 1, 0, -8827, -158, 35662);
-- Quest turn in
INSERT INTO `quest_poi_points` (`QuestID`, `Idx1`, `Idx2`, `X`, `Y`, `VerifiedBuild`) VALUES (28819, 0, 0, -8913, -137, 35662);


-- 
-- 54 Report to Goldshire
-- 

DELETE FROM quest_poi
WHERE QuestID = 54;

DELETE FROM quest_poi_points
WHERE QuestID = 54;

INSERT INTO `quest_poi` (`QuestID`, `BlobIndex`, `Idx1`, `ObjectiveIndex`, `QuestObjectiveID`, `QuestObjectID`, `MapID`, `UiMapID`, `Priority`, `Flags`, `WorldEffectID`, `PlayerConditionID`, `SpawnTrackingID`, `AlwaysAllowMergingBlobs`, `VerifiedBuild`) VALUES (54, 0, 0, -1, 0, 0, 0, 37, 0, 1, 0, 0, 0, 0, 35662);
INSERT INTO `quest_poi` (`QuestID`, `BlobIndex`, `Idx1`, `ObjectiveIndex`, `QuestObjectiveID`, `QuestObjectID`, `MapID`, `UiMapID`, `Priority`, `Flags`, `WorldEffectID`, `PlayerConditionID`, `SpawnTrackingID`, `AlwaysAllowMergingBlobs`, `VerifiedBuild`) VALUES (54, 0, 1, 0, 252181, 0, 0, 37, 0, 1, 0, 0, 0, 0, 35662);
INSERT INTO `quest_poi` (`QuestID`, `BlobIndex`, `Idx1`, `ObjectiveIndex`, `QuestObjectiveID`, `QuestObjectID`, `MapID`, `UiMapID`, `Priority`, `Flags`, `WorldEffectID`, `PlayerConditionID`, `SpawnTrackingID`, `AlwaysAllowMergingBlobs`, `VerifiedBuild`) VALUES (54, 0, 2, 32, 0, 0, 0, 37, 0, 0, 0, 0, 0, 0, 35662);

-- POI on login/relog
INSERT INTO `quest_poi_points` (`QuestID`, `Idx1`, `Idx2`, `X`, `Y`, `VerifiedBuild`) VALUES (54, 0, 0, -9465, 74, 35662);
-- POI on accept quest
INSERT INTO `quest_poi_points` (`QuestID`, `Idx1`, `Idx2`, `X`, `Y`, `VerifiedBuild`) VALUES (54, 1, 0, -9465, 74, 35662);


-- 
-- 8325 Reclaiming Sunstrider Isle
-- 

DELETE FROM quest_poi
WHERE QuestID = 8325;

-- POI UiMapID incorrect
INSERT INTO `quest_poi` (`QuestID`, `BlobIndex`, `Idx1`, `ObjectiveIndex`, `QuestObjectiveID`, `QuestObjectID`, `MapID`, `UiMapID`, `Priority`, `Flags`, `WorldEffectID`, `PlayerConditionID`, `SpawnTrackingID`, `AlwaysAllowMergingBlobs`, `VerifiedBuild`) VALUES (8325, 0, 0, -1, 0, 0, 530, 467, 0, 1, 0, 0, 0, 0, 35662);
INSERT INTO `quest_poi` (`QuestID`, `BlobIndex`, `Idx1`, `ObjectiveIndex`, `QuestObjectiveID`, `QuestObjectID`, `MapID`, `UiMapID`, `Priority`, `Flags`, `WorldEffectID`, `PlayerConditionID`, `SpawnTrackingID`, `AlwaysAllowMergingBlobs`, `VerifiedBuild`) VALUES (8325, 0, 1, 0, 256221, 15274, 530, 467, 0, 1, 0, 0, 0, 0, 35662);
INSERT INTO `quest_poi` (`QuestID`, `BlobIndex`, `Idx1`, `ObjectiveIndex`, `QuestObjectiveID`, `QuestObjectID`, `MapID`, `UiMapID`, `Priority`, `Flags`, `WorldEffectID`, `PlayerConditionID`, `SpawnTrackingID`, `AlwaysAllowMergingBlobs`, `VerifiedBuild`) VALUES (8325, 0, 2, 32, 0, 0, 530, 467, 0, 0, 0, 0, 120146, 0, 35662);


--  
-- 8326 Unfortunate Measures
-- 

DELETE FROM quest_poi
WHERE QuestID = 8326;

DELETE FROM quest_poi_points
WHERE QuestID = 8326;

INSERT INTO 
`quest_poi` (`QuestID`, `BlobIndex`, `Idx1`, `ObjectiveIndex`, `QuestObjectiveID`, `QuestObjectID`, `MapID`, `UiMapID`, `Priority`, `Flags`, `WorldEffectID`, `PlayerConditionID`, `SpawnTrackingID`, `AlwaysAllowMergingBlobs`, `VerifiedBuild`)
VALUES
(8326, 0, 0, -1, 0, 0, 530, 467, 0, 1, 0, 0, 0, 0, 35662),
(8326, 0, 1, 0, 256445, 0, 530, 467, 0, 1, 0, 0, 0, 0, 35662),
(8326, 0, 2, 32, 0, 0, 530, 467, 0, 0, 0, 0, 0, 0, 35662);

INSERT INTO `quest_poi_points` (`QuestID`, `Idx1`, `Idx2`, `X`, `Y`, `VerifiedBuild`) VALUES (8326, 1, 0, 10439, -6405, 35662);
INSERT INTO `quest_poi_points` (`QuestID`, `Idx1`, `Idx2`, `X`, `Y`, `VerifiedBuild`) VALUES (8326, 1, 1, 10480, -6382, 35662);
INSERT INTO `quest_poi_points` (`QuestID`, `Idx1`, `Idx2`, `X`, `Y`, `VerifiedBuild`) VALUES (8326, 1, 2, 10409, -6388, 35662);
INSERT INTO `quest_poi_points` (`QuestID`, `Idx1`, `Idx2`, `X`, `Y`, `VerifiedBuild`) VALUES (8326, 1, 3, 10530, -6425, 35662);
INSERT INTO `quest_poi_points` (`QuestID`, `Idx1`, `Idx2`, `X`, `Y`, `VerifiedBuild`) VALUES (8326, 1, 4, 10496, -6478, 35662);
INSERT INTO `quest_poi_points` (`QuestID`, `Idx1`, `Idx2`, `X`, `Y`, `VerifiedBuild`) VALUES (8326, 1, 5, 10444, -6495, 35662);
INSERT INTO `quest_poi_points` (`QuestID`, `Idx1`, `Idx2`, `X`, `Y`, `VerifiedBuild`) VALUES (8326, 1, 6, 10357, -6499, 35662);


--  
-- 8895 Delivery to the North Sanctum
--

DELETE FROM quest_poi
WHERE QuestID = 8895;

DELETE FROM quest_poi_points
WHERE QuestID = 8895;

INSERT INTO `quest_poi` (`QuestID`, `BlobIndex`, `Idx1`, `ObjectiveIndex`, `QuestObjectiveID`, `QuestObjectID`, `MapID`, `UiMapID`, `Priority`, `Flags`, `WorldEffectID`, `PlayerConditionID`, `SpawnTrackingID`, `AlwaysAllowMergingBlobs`, `VerifiedBuild`) VALUES (8895, 0, 0, -1, 0, 0, 530, 94, 0, 1, 0, 0, 0, 0, 35662);
INSERT INTO `quest_poi` (`QuestID`, `BlobIndex`, `Idx1`, `ObjectiveIndex`, `QuestObjectiveID`, `QuestObjectID`, `MapID`, `UiMapID`, `Priority`, `Flags`, `WorldEffectID`, `PlayerConditionID`, `SpawnTrackingID`, `AlwaysAllowMergingBlobs`, `VerifiedBuild`) VALUES (8895, 0, 1, 0, 259937, 0, 530, 94, 0, 1, 0, 0, 0, 0, 35662);
INSERT INTO `quest_poi` (`QuestID`, `BlobIndex`, `Idx1`, `ObjectiveIndex`, `QuestObjectiveID`, `QuestObjectID`, `MapID`, `UiMapID`, `Priority`, `Flags`, `WorldEffectID`, `PlayerConditionID`, `SpawnTrackingID`, `AlwaysAllowMergingBlobs`, `VerifiedBuild`) VALUES (8895, 0, 2, 32, 0, 0, 530, 94, 0, 0, 0, 0, 122183, 0, 35662);

INSERT INTO `quest_poi_points` (`QuestID`, `Idx1`, `Idx2`, `X`, `Y`, `VerifiedBuild`) VALUES (8895, 0, 0, 9297, -6682, 35662);
INSERT INTO `quest_poi_points` (`QuestID`, `Idx1`, `Idx2`, `X`, `Y`, `VerifiedBuild`) VALUES (8895, 1, 0, 9521, -6815, 35662);

--  
-- 9705 Package Recovery
--

DELETE FROM quest_poi
WHERE QuestID = 9705;

DELETE FROM quest_poi_points
WHERE QuestID = 9705;

INSERT INTO `quest_poi` (`QuestID`, `BlobIndex`, `Idx1`, `ObjectiveIndex`, `QuestObjectiveID`, `QuestObjectID`, `MapID`, `UiMapID`, `Priority`, `Flags`, `WorldEffectID`, `PlayerConditionID`, `SpawnTrackingID`, `AlwaysAllowMergingBlobs`, `VerifiedBuild`) VALUES (9705, 0, 0, -1, 0, 0, 530, 94, 0, 1, 0, 0, 0, 0, 35662);
INSERT INTO `quest_poi` (`QuestID`, `BlobIndex`, `Idx1`, `ObjectiveIndex`, `QuestObjectiveID`, `QuestObjectID`, `MapID`, `UiMapID`, `Priority`, `Flags`, `WorldEffectID`, `PlayerConditionID`, `SpawnTrackingID`, `AlwaysAllowMergingBlobs`, `VerifiedBuild`) VALUES (9705, 0, 1, 0, 260518, 0, 530, 94, 0, 1, 0, 0, 0, 0, 35662);
INSERT INTO `quest_poi` (`QuestID`, `BlobIndex`, `Idx1`, `ObjectiveIndex`, `QuestObjectiveID`, `QuestObjectID`, `MapID`, `UiMapID`, `Priority`, `Flags`, `WorldEffectID`, `PlayerConditionID`, `SpawnTrackingID`, `AlwaysAllowMergingBlobs`, `VerifiedBuild`) VALUES (9705, 0, 2, 32, 0, 0, 530, 110, 0, 0, 0, 0, 146333, 0, 35662);


INSERT INTO `quest_poi_points` (`QuestID`, `Idx1`, `Idx2`, `X`, `Y`, `VerifiedBuild`) VALUES (9705, 0, 0, 9984, -6478, 35662);
INSERT INTO `quest_poi_points` (`QuestID`, `Idx1`, `Idx2`, `X`, `Y`, `VerifiedBuild`) VALUES (9705, 1, 0, 9984, -6478, 35662);

-- Quest start and end should not be same NPC
DELETE FROM `creature_queststarter` WHERE  `id`=15301 AND `quest`=9705;


--  
-- 8350 Completing the Delivery
--

DELETE FROM quest_poi
WHERE QuestID = 8350;

DELETE FROM quest_poi_points
WHERE QuestID = 8350;

INSERT INTO `quest_poi` (`QuestID`, `BlobIndex`, `Idx1`, `ObjectiveIndex`, `QuestObjectiveID`, `QuestObjectID`, `MapID`, `UiMapID`, `Priority`, `Flags`, `WorldEffectID`, `PlayerConditionID`, `SpawnTrackingID`, `AlwaysAllowMergingBlobs`, `VerifiedBuild`) VALUES (8350, 0, 0, -1, 0, 0, 530, 94, 0, 1, 0, 0, 0, 0, 35662);
INSERT INTO `quest_poi` (`QuestID`, `BlobIndex`, `Idx1`, `ObjectiveIndex`, `QuestObjectiveID`, `QuestObjectID`, `MapID`, `UiMapID`, `Priority`, `Flags`, `WorldEffectID`, `PlayerConditionID`, `SpawnTrackingID`, `AlwaysAllowMergingBlobs`, `VerifiedBuild`) VALUES (8350, 0, 1, 0, 257507, 0, 530, 94, 0, 1, 0, 0, 121069, 0, 35662);
INSERT INTO `quest_poi` (`QuestID`, `BlobIndex`, `Idx1`, `ObjectiveIndex`, `QuestObjectiveID`, `QuestObjectID`, `MapID`, `UiMapID`, `Priority`, `Flags`, `WorldEffectID`, `PlayerConditionID`, `SpawnTrackingID`, `AlwaysAllowMergingBlobs`, `VerifiedBuild`) VALUES (8350, 0, 2, 32, 0, 0, 530, 94, 0, 0, 0, 0, 0, 0, 35662);

INSERT INTO `quest_poi_points` (`QuestID`, `Idx1`, `Idx2`, `X`, `Y`, `VerifiedBuild`) VALUES (8350, 0, 0, 9477, -6859, 35662);
INSERT INTO `quest_poi_points` (`QuestID`, `Idx1`, `Idx2`, `X`, `Y`, `VerifiedBuild`) VALUES (8350, 1, 0, 9477, -6859, 35662);