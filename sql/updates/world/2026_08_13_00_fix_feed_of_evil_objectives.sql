-- BFA-HavenCore

DELETE FROM `quest_objectives` WHERE `ID` IN (251691, 251692, 251693);

UPDATE `quest_objectives` SET `Description` = 'First Trough' WHERE `ID` = 251691;
UPDATE `quest_objectives` SET `Description` = 'Second Trough' WHERE `ID` = 251692;
UPDATE `quest_objectives` SET `Description` = 'Third Trough' WHERE `ID` = 251693;