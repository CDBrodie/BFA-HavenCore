-- BFA-HavenCore
-- Westfall Fixes!!! PART 1

INSERT IGNORE INTO `phase_area` (`AreaId`, `PhaseId`, `Comment`) VALUES (40, 169, 'Westfall - Default Phase');

UPDATE `creature`
SET `PhaseId` = 0, `PhaseUseFlags` = 0, `PhaseGroup` = 0
WHERE `guid` IN (214380, 214381);
