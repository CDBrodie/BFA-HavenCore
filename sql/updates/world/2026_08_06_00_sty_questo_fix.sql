DELETE FROM `quest_objectives` WHERE `ID` = 256278;
INSERT INTO `quest_objectives` (
    `ID`, 
    `QuestID`, 
    `Type`, 
    `Order`, 
    `StorageIndex`, 
    `ObjectID`, 
    `Amount`, 
    `Flags`, 
    `Flags2`, 
    `ProgressBarWeight`, 
    `Description`, 
    `VerifiedBuild`
) VALUES (
    256278, 
    24623, 
    0, 
    0, 
    0, 
    39157, 
    12, 
    0, 
    0, 
    0, 
    'Bloodtalon Hatchlings rescued', 
    35662
);