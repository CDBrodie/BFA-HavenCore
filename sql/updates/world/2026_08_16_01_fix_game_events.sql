-- BFA-HavenCore

-- These dates assume the server is running in 2026.

UPDATE game_event SET start_time = '2027-06-21 10:00:00', end_time = '2030-12-31 17:00:00', occurence = 525600, length = 20160 WHERE eventEntry = 1;   -- Midsummer Fire Festival
UPDATE game_event SET start_time = '2026-12-15 11:00:00', end_time = '2030-12-31 17:00:00', occurence = 525600, length = 25920 WHERE eventEntry = 2;   -- Winter Veil
UPDATE game_event SET start_time = '2026-09-06 10:01:00', end_time = '2030-12-31 17:00:00', occurence = 43200,  length = 10080 WHERE eventEntry = 3;   -- Darkmoon Faire
UPDATE game_event SET start_time = '2026-08-18 00:00:00', end_time = '2030-12-31 17:00:00', occurence = 60,     length = 5     WHERE eventEntry = 69;  -- AT Event Trigger (Alliance Event)
UPDATE game_event SET start_time = '2027-01-01 18:00:00', end_time = '2030-12-31 17:00:00', occurence = 525600, length = 120   WHERE eventEntry = 6;   -- New Year's Eve
UPDATE game_event SET start_time = '2027-02-10 12:00:00', end_time = '2030-12-31 17:00:00', occurence = 525600, length = 20160 WHERE eventEntry = 8;   -- Love is in the Air
UPDATE game_event SET start_time = '2027-04-20 10:00:00', end_time = '2030-12-31 17:00:00', occurence = 524160, length = 10080 WHERE eventEntry = 9;   -- Noblegarden
UPDATE game_event SET start_time = '2027-04-28 11:01:00', end_time = '2030-12-31 17:00:00', occurence = 525600, length = 10080 WHERE eventEntry = 10;  -- Children's Week
UPDATE game_event SET start_time = '2026-09-02 10:00:00', end_time = '2030-12-31 17:00:00', occurence = 525600, length = 10080 WHERE eventEntry = 11;  -- Harvest Festival
UPDATE game_event SET start_time = '2026-10-18 10:00:00', end_time = '2030-12-31 17:00:00', occurence = 525600, length = 20160 WHERE eventEntry = 12;  -- Hallow's End
UPDATE game_event SET start_time = '2026-08-23 12:00:00', end_time = '2030-12-31 17:00:00', occurence = 10079,  length = 1440  WHERE eventEntry = 14;  -- Stranglethorn Fishing Extravaganza
UPDATE game_event SET start_time = '2026-08-24 02:00:00', end_time = '2030-12-31 17:00:00', occurence = 10079,  length = 120   WHERE eventEntry = 15;  -- Stranglethorn Fishing Extravaganza
UPDATE game_event SET start_time = '2026-08-18 15:00:00', end_time = '2030-12-31 17:00:00', occurence = 180,    length = 120   WHERE eventEntry = 16;  -- Gurubashi Arena Booty Run
UPDATE game_event SET start_time = '2026-09-23 18:00:00', end_time = '2030-12-31 17:00:00', occurence = 60480,  length = 6240  WHERE eventEntry = 18;  -- Call to Arms: Alterac Valley!
UPDATE game_event SET start_time = '2026-08-19 18:00:00', end_time = '2030-12-31 17:00:00', occurence = 60480,  length = 6240  WHERE eventEntry = 19;  -- Call to Arms: Warsong Gulch!
UPDATE game_event SET start_time = '2026-09-09 18:00:00', end_time = '2030-12-31 17:00:00', occurence = 60480,  length = 6240  WHERE eventEntry = 20;  -- Call to Arms: Arathi Basin!
UPDATE game_event SET start_time = '2026-09-16 18:00:00', end_time = '2030-12-31 17:00:00', occurence = 60480,  length = 6240  WHERE eventEntry = 21;  -- Call to Arms: Eye of the Storm!
UPDATE game_event SET start_time = '2026-09-04 10:01:00', end_time = '2030-12-31 17:00:00', occurence = 43200,  length = 4320  WHERE eventEntry = 23;  -- Darkmoon Faire Building
UPDATE game_event SET start_time = '2026-09-20 10:00:00', end_time = '2030-12-31 17:00:00', occurence = 525600, length = 21600 WHERE eventEntry = 24;  -- Brewfest
UPDATE game_event SET start_time = '2026-11-01 12:00:00', end_time = '2030-12-31 17:00:00', occurence = 525600, length = 2820  WHERE eventEntry = 51;  -- Day of the Dead
UPDATE game_event SET start_time = '2026-12-15 17:00:00', end_time = '2030-12-31 17:00:00', occurence = 525600, length = 11700 WHERE eventEntry = 52;  -- Winter Veil: Gifts
UPDATE game_event SET start_time = '2026-09-20 18:00:00', end_time = '2030-12-31 21:00:00', occurence = 60480,  length = 6240  WHERE eventEntry = 53;  -- Call to Arms: Strand of the Ancients
UPDATE game_event SET start_time = '2026-09-02 18:00:00', end_time = '2030-12-31 21:00:00', occurence = 60480,  length = 6240  WHERE eventEntry = 54;  -- Call to Arms: Isle of Conquest
UPDATE game_event SET start_time = '2026-09-19 11:01:00', end_time = '2030-12-31 16:00:00', occurence = 525600, length = 1440  WHERE eventEntry = 50;  -- Pirates' Day

-- Notes:
--   * 525600 minutes = 365 days
--   * 524160 minutes = 364 days (used by Noblegarden)
--   * 43200 minutes  = 30 days (Darkmoon window)