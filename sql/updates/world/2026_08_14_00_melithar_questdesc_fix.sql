-- Adding the missing description.
DELETE FROM `quest_offer_reward` WHERE `ID` = 28734;
INSERT INTO `quest_offer_reward` (`ID`, `RewardText`, `VerifiedBuild`) 
VALUES (28734, 'Ilthalaine sent you? He was wise to do so. I am indeed in need of help.', 0);