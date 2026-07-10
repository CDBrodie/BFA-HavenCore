---
name: quest-enemy-behavior
description: Use when implementing or fixing an NPC/gameobject behavior for a quest in this TrinityCore-based core (BFA-HavenCore) - a boss/mob does nothing (empty SmartAI, TODO stub), needs a new mechanic (hazards, a puzzle, a stun-on-interact), or "does nothing at all" / "looks stunned from spawn" even though a script was just added. Covers how to find reusable verified spell IDs instead of inventing them, how ScriptName wiring actually works (AIName vs ScriptName precedence), the creature_addon "auras" preloaded-stun gotcha, and the DoAction pattern for GameObject-to-Creature signaling. Based on implementing the Glazer/Reflective Mirror encounter for quest 39684 "Beam Me Up".
---

# Implementar/arreglar comportamiento de enemigos de quest (TrinityCore / BFA-HavenCore)

Esta skill resume lo aprendido armando la mecanica de Glazer + espejo para la
quest 39684 "Beam Me Up" (`src/server/scripts/BrokenIsles/DemonHunterZones/zone_vault_of_wardens.cpp`,
`npc_96680` / `go_244449`), un caso tipico de "TODO nunca implementado" en
este fork: el NPC tenia `AIName=SmartAI` con la tabla `smart_scripts` vacia,
es decir, no hacia literalmente nada.

## 1. Antes de escribir una linea: investigar el mecanismo real

No inventes la mecanica a ciegas. Primero:

1. `grep -rn "<entry o nombre>" src/server/scripts/` - confirmar que
   realmente no hay script (tabla `smart_scripts` vacia + `AIName=SmartAI` +
   `ScriptName` en blanco = nunca se ejecuta nada).
2. Buscar el TODO/comentario del propio archivo - en este fork es comun que
   el trabajo pendiente ya este documentado en un bloque `/* TODO ... */` al
   inicio del `.cpp` (ver lineas 19-38 de `zone_vault_of_wardens.cpp`).
   Leelo, a veces ya dice exactamente que falta y por que ("cannot be used
   for 1 player!", etc.).
3. Investigar como se ve/comporta en retail (Wowhead, Wowpedia, un video)
   antes de dise~nar la mecanica - evita inventar un puzzle que no se parece
   en nada al original y ahorra iteraciones.
4. **Buscar si ya existe una version "hermana" scripteada de la misma
   criatura/mecanica en este mismo repo.** Es comun que la mazmorra/raid real
   tenga un boss completamente implementado con OTRO `entry`, y la version
   "solo/quest" (personal phase) sea la que quedo vacia. Ejemplo real: la
   mazmorra Vault of the Wardens tiene `boss_glazer.cpp` (npc 95887)
   totalmente funcional con toda la mecanica de rayo+espejos+lentes; la quest
   de introduccion usa un NPC "hermano" (96680) que nunca se scripteo. Usa
   `grep -rn "<flavor keyword>" src/server/scripts/` (ej. "Glazer", "beam",
   "mirror") para encontrarlo.

## 2. Reusar spell IDs verificados en vez de inventar

Este server no tiene un extractor de DB2 a mano (`client-data/dbc/*.db2` son
binarios WDB6, no greppeables) y la tabla `bfa_hotfixes.spell_name` en SQL
esta practicamente vacia (~100 filas, no es la lista completa de hechizos
del cliente). **No inventes IDs de spell nuevos** - si un ID no existe en los
DB2 del cliente, el cast falla en silencio o no tiene visual.

En cambio, reusa IDs de una fuente ya comprobada:

- El script "hermano" real (paso 1.4) es la mejor fuente: sus spells estan
  garantizado que existen y funcionan, porque ese encuentro ya esta vivo en
  el server.
- Un `Agent` de investigacion (general-purpose) puede ser mas eficiente que
  vos mismo grepeando archivo por archivo si el patron no es obvio - pedile
  que busque "bouncing orb", "slow field", "beam visual", "stun on
  interact" etc. en `src/server/scripts/` y te devuelva IDs con archivo:linea,
  no que adivine.
- Si necesitas una criatura nueva para un hazard (ej. un orbe que se mueve),
  **necesitas una fila real en `creature_template`** - no se puede
  `SummonCreature` un entry que no existe en la DB. Si no queres/podes
  agregar contenido nuevo a la DB, resolvelo re-casteando un spell "at"
  (area-trigger) ya verificado desde la criatura existente en vez de
  spawnear una entidad nueva (mas simple, cero riesgo de modelo/DB2 roto).

## 3. Como se conecta un script a una fila de la DB (ScriptName vs AIName)

`CreatureAISelector` (`src/server/game/AI/CreatureAISelector.cpp`) prueba
`sScriptMgr->GetCreatureAI(creature)` (basado en `ScriptName`) **primero**,
y solo si devuelve `nullptr` cae al factory de `AIName` (SmartAI, etc.). Por
eso una fila puede tener `AIName='SmartAI'` Y `ScriptName='npc_96680'` a la
vez, y tu `CreatureScript::GetAI()` gana igual - **no hace falta limpiar
`AIName`** para que tu `GetAI()` se ejecute, solo que `ScriptName` apunte a
tu clase. Mismo mecanismo para `GameObjectScript` con
`GetGameObjectAI`/`ScriptName` de `gameobject_template`.

Si tu script nuevo no se ejecuta nunca, lo primero a chequear:

```sql
SELECT entry, ScriptName, AIName FROM creature_template WHERE entry = <id>;
SELECT entry, ScriptName FROM gameobject_template WHERE entry = <id>;
```

Si `ScriptName` esta vacio, tu clase C++ nunca se instancia por mas que
compile bien - hay que hacer el `UPDATE ... SET ScriptName = '...'`
(persistilo en `sql/updates/db_world/`, ver mas abajo).

## 4. Gotcha - `creature_addon.auras` puede aplicar un stun REAL que bloquea todo casteo

Si un NPC "no hace nada" (no castea, no se mueve) a pesar de que tu
`UpdateAI`/`EventMap` esta bien armado, y ademas se ve "aturdido" desde que
aparece (antes de que tu logica lo ponga asi), sospechá de un aura
precargada:

```sql
SELECT guid, auras FROM creature_addon WHERE guid = <spawn guid>;
```

`creature_addon.auras` aplica esos spells automaticamente al cargar el
spawn, **independiente de tu script**. Si alguno de esos IDs es un stun de
verdad (`SPELL_AURA_MOD_STUN`), el NPC va a tener `UNIT_FLAG_STUNNED` puesto
de entrada, y **`Spell::CheckCasterAuras`
(`src/server/game/Spells/Spell.cpp` ~linea 6100) rechaza CUALQUIER cast del
propio NPC con `SPELL_FAILED_STUNNED`**, salvo que el spell tenga el
atributo `usableWhileStunned` o cancele el stun explicitamente. Esto pasa en
silencio: no hay error de compilacion ni de log, el `DoCast` simplemente no
tiene efecto.

Si encontras esto y tu diseño necesita que el NPC SI pueda castear (hazards,
dialogo con casteos, etc.), limpia el aura (`UPDATE creature_addon SET
auras = NULL WHERE guid = ...`) y maneja el "look" de aturdido/preso a mano
con **`Unit::SetControlled(true, UNIT_STATE_ROOT)` + `AddUnitFlag
(UNIT_FLAG_IMMUNE_TO_PC)`** en vez de un stun real - ninguno de los dos
bloquea el casteo de spells (confirmalo comparando con el patron de un boss
real ya andando, ej. `boss_glazer.cpp` usa `SetControlled(_, UNIT_STATE_ROOT)`
para su version en combate, nunca `UNIT_STATE_STUNNED`, precisamente para
poder seguir casteando mientras esta "inmovilizado").

## 5. No uses `HasUnitState`/auras genericas para distinguir "fases" de tu propia logica

Si necesitas un flag de "ya paso tal cosa" (ej. "el jugador ya rompio el
escudo, dejar de tirar hazards"), **no reuses `HasUnitState(UNIT_STATE_X)`**
como señal - podes chocar con un estado que ya esta siendo usado para otra
cosa (ver gotcha anterior: el "stun" persistente del punto 4 hubiera hecho
que este chequeo fuera `true` desde el arranque, rompiendo la logica antes
de siquiera llegar al punto 4). Usa un **bool propio en la struct del AI**,
seteado via el patron estandar de TrinityCore para que otro script (un
`GameObjectScript`, por ejemplo) le avise algo a un `CreatureAI` sin acceder
a sus miembros privados:

```cpp
// en el CreatureAI:
enum Actions { ACTION_SHIELD_BROKEN = 1 };

void DoAction(int32 action) override
{
    if (action == ACTION_SHIELD_BROKEN && !_shieldBroken)
    {
        _shieldBroken = true;
        // ... logica de la transicion, una sola vez ...
    }
}

// en el GameObjectScript que dispara el evento:
if (Creature* npc = go->FindNearestCreature(entry, range, true))
    npc->AI()->DoAction(ACTION_SHIELD_BROKEN);
```

`DoAction` es idempotente si vos lo haces idempotente (chequeando tu propio
bool adentro) - asi podes llamarlo sin miedo mas de una vez desde afuera
(ej. cada vez que el jugador interactua con un gameobject) sin re-disparar
la transicion.

## 6. Hazards periodicos para un NPC que nunca entra en combate real

Si el NPC es no-atacable (`REACT_PASSIVE` + `UNIT_FLAG_IMMUNE_TO_PC`), no
uses `SelectTarget(SELECT_TARGET_RANDOM, ...)` para elegir a quien
castearle algo - ese metodo lee la **threat list**, que va a estar
permanentemente vacia si nunca hay combate real. Usa
`Creature::GetPlayerListInGrid(list, range)` + filtrar por
`GetQuestStatus(questId) == QUEST_STATUS_INCOMPLETE` (para no tirar hazards
a jugadores ajenos a la quest o a una sala vacia), y elegi uno al azar con
`urand()`. Programa la cadencia con un `EventMap` normal dentro de
`UpdateAI`, sin depender de `UpdateVictim()` (que tambien requiere combate).

## Checklist rapido

1. `grep` el entry/nombre en `src/server/scripts/` - ¿esta realmente vacio?
   ¿hay un TODO que ya describe la mecanica?
2. ¿Existe una version "hermana" (mazmorra/raid) ya scripteada de la misma
   criatura/mecanica? Reusa sus spell IDs, no inventes.
3. `SELECT ScriptName, AIName FROM creature_template/gameobject_template` -
   ¿esta conectado tu `ScriptName`? Si no, `UPDATE` + persistir en
   `sql/updates/db_world/YYYY_MM_DD_NN.sql`.
4. `SELECT auras FROM creature_addon WHERE guid = ...` - ¿hay un stun
   preexistente que va a bloquear tus casteos en silencio?
5. Para "fases"/transiciones propias, usa un bool + `DoAction`, no
   `HasUnitState` ni auras que puedan chocar con otra cosa.
6. Para hazards fuera de combate, `GetPlayerListInGrid` + filtro de quest,
   no `SelectTarget`/`UpdateVictim`.
7. Compilar, redesplegar, probar en el juego. Si algo "no pasa nada" o
   aparece en un estado raro desde el inicio, segui la metodologia de
   `quest-loot-debug` (TC_LOG_INFO temporal + `Logger.scripts` a nivel 3)
   antes de asumir donde esta el bug.
