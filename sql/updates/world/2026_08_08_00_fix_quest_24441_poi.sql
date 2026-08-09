-- BACKPORT / FIX FOR QUEST ZONE POIs - QUEST 24441 (Thunder Horn Totem)
-- ========================================================================= 

-- 1. Clean up old experimental or corrupted POI data
DELETE FROM quest_poi WHERE QuestID = 24441;
DELETE FROM quest_poi_points WHERE QuestID = 24441; 

-- 2. Link POI to the first quest objective (ID 255536 - Prairie Stalker Claws)
-- Setting Mulgore internal UiMapID = 7, unique index Idx1 = 1, and blob merge flag Flags = 1
INSERT INTO quest_poi
(QuestID, BlobIndex, Idx1, ObjectiveIndex, QuestObjectiveID, QuestObjectID, MapID, UiMapID, Priority, Flags, WorldEffectID, PlayerConditionID, SpawnTrackingID, AlwaysAllowMergingBlobs, VerifiedBuild)
VALUES
(24441, 0, 1, 0, 255536, 0, 1, 7, 0, 1, 0, 0, 0, 0, 35662); 

-- 3. Link POI to the second quest objective (ID 255537 - Flatland Prowler Claws)
-- Setting Mulgore internal UiMapID = 7, unique index Idx1 = 2, and blob merge flag Flags = 1
INSERT INTO quest_poi
(QuestID, BlobIndex, Idx1, ObjectiveIndex, QuestObjectiveID, QuestObjectID, MapID, UiMapID, Priority, Flags, WorldEffectID, PlayerConditionID, SpawnTrackingID, AlwaysAllowMergingBlobs, VerifiedBuild)
VALUES
(24441, 1, 2, 1, 255537, 0, 1, 7, 0, 1, 0, 0, 0, 0, 35662); 

-- 4. Draw polygon vertices using actual world coordinates of creature spawns
INSERT INTO quest_poi_points (QuestID, Idx1, Idx2, X, Y, VerifiedBuild) VALUES
-- POLYGON 1: Prairie Stalkers (Northern area of the zone, linked to Idx1 = 1)
(24441, 1, 0, -1800, -100, 35662),
(24441, 1, 1, -1500, -100, 35662),
(24441, 1, 2, -1450, 150, 35662),
(24441, 1, 3, -1750, 150, 35662), 

-- POLYGON 2: Flatland Prowlers (Southeastern area of the zone, linked to Idx1 = 2)
(24441, 2, 0, -2200, -850, 35662),
(24441, 2, 1, -1800, -800, 35662),
(24441, 2, 2, -1400, -300, 35662),
(24441, 2, 3, -1900, -200, 35662);
