-- BFA-HavenCore
-- Guard gossip menu fixes
-- Corrects confirmed broken guard navigation for Darnassus Sentinels
-- and Darkspear Headhunters.
--
-- Tested in-game:
--   Darnassus:
--     Class Trainer
--     Profession Trainer
--   Darkspear Headhunter:
--     Auction House
--     Bank
--     Class Trainer
--     Inn
--     Mailbox
--     Profession Trainer
--     Stable Master
--     Vendor

-- ------------------------------------------------------------
-- Darnassus Sentinel
-- Main gossip menu: 2352
-- ------------------------------------------------------------

DELETE FROM `gossip_menu_option_action`
WHERE `MenuId` = 2352
  AND `OptionIndex` IN (9, 10);

INSERT INTO `gossip_menu_option_action`
    (`MenuId`, `OptionIndex`, `ActionMenuId`, `ActionPoiId`)
VALUES
    (2352, 9, 2343, 0),  -- Class Trainer
    (2352, 10, 2351, 0); -- Profession Trainer


-- ------------------------------------------------------------
-- Darkspear Headhunter
-- Main gossip menu: 11969
-- ------------------------------------------------------------

DELETE FROM `gossip_menu_option_action`
WHERE `MenuId` = 11969
  AND `OptionIndex` BETWEEN 0 AND 7;

INSERT INTO `gossip_menu_option_action`
    (`MenuId`, `OptionIndex`, `ActionMenuId`, `ActionPoiId`)
VALUES
    (11969, 0, 11973, 10347), -- Auction House
    (11969, 1, 11974, 10267), -- Bank
    (11969, 2, 11976, 0),     -- Class Trainer
    (11969, 3, 11970, 12512), -- Inn
    (11969, 4, 11975, 10180), -- Mailbox
    (11969, 5, 11977, 0),     -- Profession Trainer
    (11969, 6, 11980, 10848), -- Stable Master
    (11969, 7, 11978, 0);     -- Vendor
