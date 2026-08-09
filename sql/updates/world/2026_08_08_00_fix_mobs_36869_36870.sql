-- =========================================================================
-- FIX FOR DECORATIVE CORPSES AT BAEL'DUN DIGSITE (SOUTHERN BARRENS)
-- 36869 — Bael'dun Digger Corpse
-- 36870 — Bael'dun Appraiser Corpse
-- ========================================================================= 

UPDATE creature_template SET
unit_flags = 33587712,      -- UNIT_FLAG_NOT_SELECTABLE (removes target frame, makes unclickable)
dynamicflags = 32,          -- UNIT_DYNFLAG_DEAD (forces the model to lie dead on the ground)
flags_extra = 2,            -- CREATURE_FLAG_EXTRA_TRIGGER (disables core-level AI)
AIName = '',                -- Disables SmartAI to prevent creatures from "coming alive"
ScriptName = ''
WHERE entry IN (36869, 36870);
