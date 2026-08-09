-- BFA-HavenCore
-- Quest 26509 - An Unwelcome Guest

DELETE FROM `quest_poi_points`
WHERE `QuestID` = 26509;

DELETE FROM `quest_poi`
WHERE `QuestID` = 26509;

INSERT INTO `quest_poi`
(
    `QuestID`,
    `BlobIndex`,
    `Idx1`,
    `ObjectiveIndex`,
    `QuestObjectiveID`,
    `QuestObjectID`,
    `MapID`,
    `UiMapID`,
    `Priority`,
    `Flags`,
    `WorldEffectID`,
    `PlayerConditionID`,
    `SpawnTrackingID`,
    `AlwaysAllowMergingBlobs`,
    `VerifiedBuild`
)
VALUES
(
    26509,     -- An Unwelcome Guest
    0,
    0,
    0,         -- First quest objective
    252618,    -- Obtain Bellygrub's Tusk
    3631,      -- The Holy Water of Clarity
    0,         -- Eastern Kingdoms
    49,        -- Redridge
    0,
    1,
    0,
    0,
    0,
    0,
    35662
);

INSERT INTO `quest_poi_points`
(
    `QuestID`,
    `Idx1`,
    `Idx2`,
    `X`,
    `Y`,
    `VerifiedBuild`
)
VALUES
    (26509, 0, 0, -9282.86, -1927.77, 35662);