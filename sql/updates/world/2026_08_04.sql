-- ---------------------------------------------------------------------------
-- 2026_08_04.sql
-- Fix Quest 26391 - Extinguishing Hope
-- Prevent duplicate quest credit from Northshire Vineyards Fire Trigger (42940)
-- ---------------------------------------------------------------------------

UPDATE smart_scripts
SET action_type = 0
WHERE entryorguid = 42940
  AND source_type = 0
  AND action_type = 33;