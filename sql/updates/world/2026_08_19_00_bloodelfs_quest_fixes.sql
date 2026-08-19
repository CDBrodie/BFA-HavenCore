-- Disable quest 8345 entirely
DELETE FROM `disables` WHERE `entry` = 8345 AND `sourceType` = 1;
INSERT INTO `disables` (`entry`, `sourceType`, `flags`, `params_0`, `params_1`, `comment`) VALUES
(8345, 1, 0, 0, 0, 'Disabled - The Shrine of Dath`Remar');

-- Restrict quest 37442 visibility to Blood Elves only
UPDATE `quest_template` 
SET `AllowableRaces` = 512 
WHERE `ID` = 37442;

-- Update quest 8346 objective description
UPDATE `quest_objectives` 
SET `Description` = 'Arcane Torrent unleashed' 
WHERE `QuestID` = 8346;