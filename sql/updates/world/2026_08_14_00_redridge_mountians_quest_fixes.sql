-- Parkers Report (26505) - Fixed both reward + request text + emotes, they were missing in the DB, hence the insert.
INSERT IGNORE INTO `quest_offer_reward` (`ID`, `Emote1`, `Emote2`, `Emote3`, `Emote4`, `EmoteDelay1`, `EmoteDelay2`, `EmoteDelay3`, `EmoteDelay4`, `RewardText`, `VerifiedBuild`) VALUES (26505, 1, 0, 0, 0, 0, 0, 0, 0, '<Magistrate Solomon puts on his monocle.>$B$BOh, you\'re not Conacher. What have you got there?$B$B<Magistrate Solomon takes Parker\'s report from you.>$B$BOh for pity\'s sake. Yowler? AGAIN?', 0);
INSERT IGNORE INTO `quest_request_items` (`ID`, `EmoteOnComplete`, `EmoteOnIncomplete`, `EmoteOnCompleteDelay`, `EmoteOnIncompleteDelay`, `CompletionText`, `VerifiedBuild`) VALUES (26505, 5, 0, 0, 0, 'Where did I put my monocle?! Conacher is that you?', 0);


-- John J. Keeshan (26567) - Fixed reward text, were missing in the DB, hence the insert.
INSERT IGNORE INTO `quest_offer_reward` (`ID`, `Emote1`, `Emote2`, `Emote3`, `Emote4`, `EmoteDelay1`, `EmoteDelay2`, `EmoteDelay3`, `EmoteDelay4`, `RewardText`, `VerifiedBuild`) VALUES (26567, 0, 0, 0, 0, 0, 0, 0, 0, 'Help you? Help these people? These people that would rather spit on me than crack a smile?', 0);


-- This Ain't My War (26568) - Fixed reward text, were missing in the DB, hence the insert.
INSERT IGNORE INTO `quest_offer_reward` (`ID`, `Emote1`, `Emote2`, `Emote3`, `Emote4`, `EmoteDelay1`, `EmoteDelay2`, `EmoteDelay3`, `EmoteDelay4`, `RewardText`, `VerifiedBuild`) VALUES (26568, 1, 0, 0, 0, 0, 0, 0, 0, '<Troteman sighs.>$B$BI\'m not giving up on him, $n, and I\'m not giving up on Redridge. We need to boost his spirits... Rouse the slumbering monster within him!', 0);
