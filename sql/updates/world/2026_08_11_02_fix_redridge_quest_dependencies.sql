-- BFA-HavenCore

UPDATE quest_template_addon
SET NextQuestID = 26668
WHERE ID = 26651;

UPDATE quest_template_addon
SET PrevQuestID = 26651, NextQuestID = 26693
WHERE ID = 26668;

UPDATE quest_template_addon
SET PrevQuestID = 26668
WHERE ID = 26693;

UPDATE quest_template_addon
SET PrevQuestID = 26693, NextQuestID = 26708
WHERE ID = 26694;

UPDATE quest_template_addon
SET PrevQuestID = 26694
WHERE ID = 26708;