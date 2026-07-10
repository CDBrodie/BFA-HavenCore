---
name: quest-duplicate-debug
description: Use when a quest appears duplicated in the player's quest log in this TrinityCore-based core (BFA-HavenCore) — same title/objective text shown twice (e.g. as entries "1" and "2") right after accepting it, or a quest gets "taken twice". Covers how to find the second quest_template row causing it, why QUEST_FLAGS_TRACKING does NOT hide a quest from the client log in this codebase (unlike upstream TrinityCore's doc comment implies), and how to safely remove the redundant AddQuest call. Based on fixing quest "Forged in Fire" (39683/40254) in zone_vault_of_wardens.cpp.
---

# Diagnosticar quests duplicadas en el log (TrinityCore / BFA-HavenCore)

Síntoma: al aceptar una quest, aparece dos veces en el log del cliente con el
mismo título y el mismo texto de objetivo (ej. "0/1 Immolanth slain & power
taken" como entradas 1 y 2). Esto pasó con la quest "Forged in Fire"
(`quest 39683` / `quest 40254` en
`src/server/scripts/BrokenIsles/DemonHunterZones/zone_vault_of_wardens.cpp`).

## 1. Confirmar que son dos filas distintas en `quest_template`

Buscá por el título exacto (¡el duplicado casi siempre es un segundo `ID` con
el mismo `LogTitle`/`LogDescription`!):

```sql
SELECT ID, LogTitle FROM quest_template WHERE LogTitle LIKE '%<texto de la quest>%';
```

Si aparecen dos (o más) IDs con el mismo `LogTitle`, comparalos:

```sql
SELECT ID, QuestID, Type, `Order`, ObjectID, Amount, Description
FROM quest_objectives WHERE QuestID IN (<id1>,<id2>) ORDER BY QuestID, `Order`;

SELECT ID, LogTitle, LogDescription, Flags, FlagsEx FROM quest_template WHERE ID IN (<id1>,<id2>);
```

Normalmente uno de los dos es la quest "real" (tiene cadena:
`quest_template_addon.PrevQuestID`/`NextQuestID` distintos de 0, y aparece en
`creature_queststarter`) y el otro es una copia "fantasma" sin cadena propia
(`PrevQuestID=0`, `NextQuestID=0`) que **no** tiene su propio `creature_queststarter`
— solo aparece en `creature_questender` junto con la real.

## 2. Encontrar quién agrega la copia fantasma

El patrón de este fork es un `OnQuestAccept` que agrega la segunda quest a
mano apenas el jugador acepta la primera:

```cpp
bool OnQuestAccept(Player* player, Creature* creature, Quest const* quest) override
{
    if (quest->GetQuestId() == <id1>)
        if (const Quest* quest = sObjectMgr->GetQuestTemplate(<id2>))
            player->AddQuest(quest, nullptr); // <- esto duplica el log
    ...
}
```

Buscalo con:

```bash
grep -rn "<id1>\|<id2>" src/server/scripts/
```

Normalmente el motivo de agregar la segunda quest es otorgar una recompensa
"de la otra especialización" (spell de desbloqueo de artefacto, etc.) — mirá
el script del NPC/boss cuya muerte da el kill credit (`JustDied`) para
confirmar el propósito real:

```cpp
// dos "quest ids" y dos "reward spells" en paralelo
QUEST1 = <id1>, QUEST2 = <id2>,
CREDIT1 = ..., CREDIT2 = ...,
REWARD_SPELL1 = ..., REWARD_SPELL2 = ...,

void JustDied(Unit* killer) override
{
    ...
    if (plr->GetQuestStatus(QUEST1) == QUEST_STATUS_INCOMPLETE ||
        plr->GetQuestStatus(QUEST2) == QUEST_STATUS_INCOMPLETE)
    {
        plr->KilledMonsterCredit(CREDIT1);
        plr->KilledMonsterCredit(CREDIT2);
        plr->CastSpell(plr, REWARD_SPELL1, true);
        plr->CastSpell(plr, REWARD_SPELL2, true);
    }
}
```

**Dato clave: el `||` significa que alcanza con que el jugador tenga SOLO la
quest real (`QUEST1`) incompleta para que se otorguen AMBAS recompensas.**
La quest fantasma (`QUEST2`) casi nunca es necesaria para que la lógica de
recompensa funcione — solo existía para que, en teoría, quedara "trackeada"
en el log también. Confirmalo grepeando el ID de la quest fantasma en TODO
`src/server/` — si no aparece en ningún otro lado más que en el
`AddQuest`/enum de arriba, no tiene ninguna otra dependencia.

## 3. Gotcha — `QUEST_FLAGS_TRACKING` NO oculta la quest del log en este codebase

Es tentador pensar que la solución es ponerle el flag `QUEST_FLAGS_TRACKING`
(`0x400`) a la quest fantasma, porque el comentario en
`src/server/game/Quests/QuestDef.h` dice literalmente *"these quests ... will
never appear in quest log client side"*. **Esto es engañoso en este fork: no
hay ningún código que filtre el log enviado al cliente según ese flag.**

Confirmalo con:

```bash
grep -rn "QUEST_FLAGS_TRACKING" src/server/game/
```

Vas a encontrar que el único uso real está en
`Player::CompleteQuest` (`Player.cpp`, ~línea 16388): cuando la quest se
completa, si tiene el flag, se llama a `RewardQuest(...)` automáticamente sin
pasar por un NPC de entrega. **Eso es todo lo que hace.** No existe lógica
que oculte el slot de quest log del jugador ni el paquete que arma el
cliente — los slots de quest log viajan como campos de actualización del
objeto jugador sin filtrar por flags. Poner el flag no arregla el duplicado
visual (ya se probó: se aplicó el flag vía SQL, se reinició el worldserver, y
la quest seguía duplicándose).

## 4. Fix correcto: no agregar la quest fantasma en absoluto

Si el paso 2 confirmó que la quest fantasma no tiene otras dependencias, la
solución simple es borrar el `player->AddQuest(quest, nullptr)` (dejar un
comentario bilingüe explicando por qué, para que no lo vuelvan a agregar
"para trackearla mejor"). La lógica de `JustDied` con el `||` ya cubre el
otorgamiento de ambas recompensas usando solo el estado de la quest real.

```cpp
// EN: Quest <id2> is a hidden duplicate of <id1> used only to grant the
// off-spec reward spell (see <NPC>::JustDied). Silently adding it to the
// player's quest log made the quest appear twice in the client UI. Not
// needed: JustDied already grants both rewards based on <id1>'s status
// alone (QUEST1||QUEST2 check), so nothing is lost by removing this.
// ES: La quest <id2> es una copia oculta de <id1> que solo servía para
// otorgar el hechizo de recompensa de la otra especialización (ver
// <NPC>::JustDied). Agregarla en silencio duplicaba la quest en el
// cliente. No hace falta: JustDied ya otorga ambas recompensas usando
// solo el estado de <id1>, asi que no se pierde nada al quitarla.
```

Recompilá con el loop rápido (`docker compose run --rm dev-builder`),
reiniciá `worldserver` (`docker restart bfacore-worldserver`, tarda
~1.5 min en recargar mapas/quests antes de aceptar conexiones), y probá
aceptar la quest de nuevo en el juego.

## 5. Si la quest fantasma SÍ tiene otras dependencias

Si el grep del paso 2 muestra que el ID de la quest fantasma se usa en otro
lado (otro script chequea `GetQuestStatus(<id2>)`, o hay una cadena
`PrevQuestID`/`NextQuestID` real), no la borres — en ese caso evaluá:

- Si de verdad necesita ocupar un slot de quest log visible distinto (dos
  quests con objetivos distintos, no un duplicado de texto), el "bug" no es
  tal: cada una debería tener su propio `LogTitle` claro, no copiar el de la
  otra.
- Si sí es una quest puramente interna que otro script necesita como
  "bandera" de estado, considerá reemplazarla por una condición sin quest
  (aura temporal, flag de personaje, o directamente el chequeo de estado de
  la quest real) en vez de un segundo quest log real.

## Checklist rápido

1. `SELECT ... WHERE LogTitle LIKE '%...%'` — ¿hay dos `ID` con el mismo
   título/descripción?
2. Comparar `quest_objectives` y `quest_template_addon` (Prev/NextQuestID) de
   ambos — el fantasma casi siempre no tiene cadena propia.
3. `grep -rn "<id_real>\|<id_fantasma>" src/server/scripts/` — encontrar el
   `OnQuestAccept` que agrega la fantasma, y el script (`JustDied` u otro)
   que la usa para recompensas.
4. `grep -rn "<id_fantasma>" src/server/` completo — si no aparece en ningún
   otro lado, es seguro borrar el `AddQuest`.
5. **No confiar en `QUEST_FLAGS_TRACKING` para ocultar del log en este
   codebase** — verificalo vos mismo con grep antes de asumir que el flag
   hace algo del lado del cliente.
6. Recompilar, reiniciar `worldserver`, confirmar en el juego que la quest
   aparece una sola vez y que las recompensas se siguen otorgando igual.
