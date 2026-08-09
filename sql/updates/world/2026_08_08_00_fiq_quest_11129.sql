-- =========================================================================
-- FIX FOR QUEST ITEM DROP - QUEST 11129 (Kyle's Gone Missing!)
-- ========================================================================= 

-- 1. Clean up broken and incorrect loot bindings for the meat (ID 33009)
DELETE FROM item_loot_template WHERE Entry = 33009;
DELETE FROM creature_loot_template WHERE Item = 33009;
DELETE FROM creature_questitem WHERE ItemId = 33009; 

-- 2. Grant official quest loot permission for actual Mulgore birds
-- Using UPSERT construction to prevent PRIMARY KEY conflicts (Duplicate entry)
INSERT INTO creature_questitem (CreatureEntry, Idx, ItemId, VerifiedBuild) VALUES
(2955, 0, 33009, 35662), -- Plainstrider
(2956, 0, 33009, 35662), -- Adult Plainstrider
(2957, 0, 33009, 35662)  -- Elder Plainstrider
ON DUPLICATE KEY UPDATE ItemId = 33009; 

-- 3. Assign guaranteed meat drop directly to the creature loot tables
-- QuestRequired = 1 field hides the item from players without the quest
INSERT INTO creature_loot_template
(Entry, Item, Reference, Chance, QuestRequired, LootMode, GroupId, MinCount, MaxCount, Comment)
VALUES
(2955, 33009, 0, 100, 1, 1, 0, 1, 1, 'Plainstrider - Tender Strider Meat (Quest 11129)'),
(2956, 33009, 0, 100, 1, 1, 0, 1, 1, 'Adult Plainstrider - Tender Strider Meat (Quest 11129)'),
(2957, 33009, 0, 100, 1, 1, 0, 1, 1, 'Elder Plainstrider - Tender Strider Meat (Quest 11129)');
