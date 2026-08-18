-- Slain Outrunner (17849) - Fixes the issue where she would show as alive while she should be dead.
UPDATE `creature_template` 
SET `unit_flags3` = 8192 
WHERE (`entry` = 17849);


-- Impaled Blackrock Ork (ID 43150) - Fixes a few issues.
-- 1) Would be hostile towards player(s)
-- 2) Feign death flag removed.
-- 3) Showen as alive, when it should show as dead.
-- 4) Shows correct animation, not death animation.
UPDATE `creature_template` 
SET `unit_flags` = 768, `unit_flags2` = 2048, `unit_flags3` = 8192, `dynamicflags` = 0 
WHERE (`entry` = 43150);