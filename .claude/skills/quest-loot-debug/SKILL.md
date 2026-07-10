---
name: quest-loot-debug
description: Use when a quest item, kill credit, or corpse loot isn't working right in this TrinityCore-based core (BFA-HavenCore) — item doesn't show up in a corpse's loot window, no loot cursor appears at all, an item vanishes silently when looted, or a "kill this monster" quest objective doesn't complete despite the NPC dying. Especially relevant for scripted multi-NPC fights (companion-assisted boss encounters) where a player's damage/tap share can be low. Covers the debugging methodology (temporary TC_LOG_INFO checkpoints through the loot pipeline) and the specific engine gotchas found while fixing the Tyranna/Sargerite Keystone quest in zone_mardum.cpp.
---

# Diagnosticar loot / quest items que no aparecen (TrinityCore / BFA-HavenCore)

Esta skill resume lo aprendido depurando por qué el ítem de una quest
(Sargerite Keystone, quest "The Keystone" / 38728, boss "Brood Queen
Tyranna" / entry 93802 en `src/server/scripts/BrokenIsles/DemonHunterZones/zone_mardum.cpp`)
no aparecía en el loot pese a que la lógica del script parecía correcta.
El síntoma cambió de forma varias veces (nada de loot → ventana vacía → ni
cursor de loot → se "loot Eaba" pero no llegaba a la mochila) y cada
cambio de síntoma correspondía a una capa distinta del pipeline del motor.
Si te encontrás con un bug parecido, este es el mapa y el método.

## Primero: ¿es un bug de contenido (falta script) o de pipeline (el script está pero algo lo bloquea)?

1. Buscá el `ScriptName`/`AIName` del NPC/quest en la base
   (`creature_template`, `quest_template`, `gossip_menu_option`,
   `creature_loot_template`) y compará contra el código C++ real
   (`grep -rn "<entry o nombre>" src/server/scripts`).
2. Si el ScriptName **no existe** en ningún `.cpp`, o el `AIName=SmartAI`
   apunta a una tabla `smart_scripts` **vacía**, es un bug de contenido:
   nunca se escribió el comportamiento. Fix: escribirlo (ver el patrón
   `class X : public CreatureScript { ... GetAI() ... }` que ya usa el
   archivo).
3. Si el script SÍ existe y hace lo que parece correcto (llama
   `KilledMonsterCredit`, `ForceCompleteQuest`, `loot.AddItem`, etc.) pero
   el resultado en el juego no refleja eso, es un bug de **pipeline**: el
   motor tiene una capa más abajo que está descartando o filtrando lo que
   el script hizo. Seguí el resto de esta skill.

## Metodología: instrumentar el pipeline con TC_LOG_INFO temporal

No adivines — el pipeline de loot tiene ~6 puntos de filtrado
independientes (ver mapa abajo) y cualquiera de ellos puede estar
bloqueando en silencio. Agregá logs temporales, compilá con el loop rápido
(`docker compose run --rm dev-builder`, ver `docker/README.md`), y mirá en
vivo con el Monitor tool mientras el usuario repite la acción en el juego.

```cpp
TC_LOG_INFO("scripts", "[DEBUG-XXX] checkpoint: campo1=%u campo2=%s", ...);
```

- Necesitás `#include "Log.h"` en el archivo si no lo tiene.
- **`Logger.scripts` en el `.conf` viene en nivel 5 (solo Error) por
  defecto** — tus `TC_LOG_INFO` (nivel 3) no van a aparecer aunque el
  código corra. Subilo a mano en el `.conf` ya generado (no hace falta
  recompilar):
  ```bash
  docker exec bfacore-worldserver sh -c "sed -i 's/^Logger.scripts.*=5,Console Server Errors/Logger.scripts         =3,Console Server Errors/' /opt/bfacore/etc/worldserver.conf"
  docker restart bfacore-worldserver
  ```
  **Acordate de revertirlo a `=5,...` al terminar** (o vas a inundar la
  consola en producción).
- Para mirar en vivo: `Monitor` con
  `docker logs -f --tail 0 <container> 2>&1 | grep --line-buffered "DEBUG-XXX"`.
- **Sacá todos los `TC_LOG_INFO` de diagnóstico antes de dar el bug por
  cerrado** — no son parte del fix final, son andamiaje.

## Mapa del pipeline (dónde puede estar bloqueado)

Para un NPC que muere y debería dejar loot/dar quest credit, en este orden:

### 1. `CreatureAI::DamageTaken(Unit* attacker, uint32& damage)`
Corre **antes** de la muerte real, con el daño letal todavía sin aplicar.
Acá `me->getThreatManager().getThreatList()` todavía es válida — es el
único lugar confiable para saber quién participó de la pelea.

### 2. Motor: `Unit::Kill()` (`src/server/game/Entities/Unit/Unit.cpp`, ~línea 11800-11960)
En este orden exacto:
1. Reward loop: `loot->FillLoot(...)` para cada `creature->GetLootRecipients()`
   (el "tap list" natural). Si el jugador nunca quedó tapeado
   correctamente (pelea con NPCs acompañantes que hacen la mayoría del
   daño → ver punto 4), este loop no genera nada para él.
2. `creature->DeleteThreatList()` — **la threat list se vacía ACÁ, antes
   de `JustDied()`**. Si tu script necesita saber quién peleó, capturalo en
   `DamageTaken` (guardalo en un `std::vector<ObjectGuid>` miembro de la
   AI) y usalo después en `JustDied`, no releas la threat list ahí.
3. `if (!creature->loot.isLooted()) AddDynamicFlag(UNIT_DYNFLAG_LOOTABLE); else AllLootRemovedFromCorpse();`
   — si el loot natural salió vacío para todos, la bandera lootable **no**
   se prende sola.
4. `creature->AI()->JustDied(this)` — tu script corre acá.

### 3. Tu script en `JustDied()`
Si necesitás forzar loot/crédito a mano (fight con atribución de
kill/tap poco confiable):
```cpp
me->AddLootRecipient(target);                       // registra tap
me->loot.AddItem(LootStoreItem(itemId, LOOT_ITEM_TYPE_ITEM, // <- OJO abajo
    0, 100.0f, /*needs_quest*/false, 1, 0, 1, 1), target);
me->AddDynamicFlag(UNIT_DYNFLAG_LOOTABLE);           // fuerza la bandera
```

**Gotcha #1 — el segundo parámetro de `LootStoreItem` (`type`) NO es
"0=item, 1=currency" como dice el comentario en `LootMgr.h`.** El enum real
(`src/server/game/Loot/Loot.h`) es:
```cpp
enum LootItemType { LOOT_ITEM_TYPE_CURRENCY = 0, LOOT_ITEM_TYPE_ITEM = 2 };
```
Pasar `0` literal crea un ítem que el motor trata como **moneda**. Con
autoloot, el "loot" se completa (se marca `is_looted=true`, se saca de la
lista) pero como `sCurrencyTypesStore.LookupEntry(itemId)` no encuentra
nada para un item ID real, no pasa nada — **el ítem desaparece en
silencio, sin error visible**. Síntoma: "se loot ea pero no aparece en la
mochila". Usá siempre `LOOT_ITEM_TYPE_ITEM` (la constante, no el número)
para un ítem normal.

**Gotcha #2 — `needs_quest=true` dispara un chequeo redundante y poco
confiable.** `LootItem::AllowedForPlayer()` (`Loot.cpp`), si `needs_quest`
es true, exige `player->HasQuestForItem(itemid)`, que recorre los
**slots del quest log del jugador** (`GetQuestSlotQuestId`), **no**
`character_queststatus`/`GetQuestStatus()`. Si vos ya filtraste elegibilidad
a mano con `GetQuestStatus(questId) == QUEST_STATUS_INCOMPLETE` (la fuente
de verdad real), este chequeo extra es redundante — y puede fallar solo
si el estado del slot está desincronizado del estado real (pasa, por
ejemplo, con quests agregadas por el comando GM `.quest add` durante
testing). Poné `needs_quest=false` si ya hiciste tu propio filtro de
elegibilidad antes de llamar `AddItem`.

**Gotcha #3 — el 50% de daño de jugador (`m_PlayerDamageReq`).** Cada
creature arranca con `m_PlayerDamageReq = GetHealth() / 2`
(`ResetPlayerDamageReq()`, `Creature.h`), y solo se descuenta con daño que
hace un **jugador** (`Creature::LowerPlayerDamageReq`, llamado desde
`Unit::DealDamage`). Si NPCs acompañantes hacen la mayoría del daño (fight
tipo "vas con 4 aliados"), este contador nunca llega a 0.
`Player::isAllowedToLoot()` exige `creature->IsDamageEnoughForLootingAndReward()`
(que mira ese contador), y —esto es lo insidioso—
`ViewerDependentValue<UF::ObjectData::DynamicFlagsTag>::GetValue()`
(`src/server/game/Entities/Object/Updates/ViewerDependentValues.h`) **saca
`UNIT_DYNFLAG_LOOTABLE` del paquete que arma para ESE jugador específico**
si `isAllowedToLoot` da false — pasa **downstream** de cualquier
`AddDynamicFlag`/`AddLootRecipient`/`loot.AddItem` que hayas hecho en tu
script, así que ningún fix del lado del script alcanza a compensarlo.
Síntoma: ni el cursor de loot aparece (el cliente nunca ve la bandera
prendida), aunque todo el estado interno del servidor esté perfecto.
Fix, en `JustDied()`, apenas entra: `me->m_PlayerDamageReq = 0;` (el campo
es público). Legítimo cuando el diseño de la pelea asume que NPCs
acompañantes hacen la mayor parte del daño.

### 4. Click derecho → `Player::SendLoot()` (`Player.cpp`)
Para creatures (no gameobject/item/corpse), en orden:
```cpp
if (!creature->HasDynamicFlag(UNIT_DYNFLAG_LOOTABLE)) { SendLootError(...DIDNT_KILL); return; }
if (!creature->GetLootRecipients().size())            { SendLootError(...DIDNT_KILL); return; }
...
permission = creature->IsTappedBy(this) ? OWNER_PERMISSION : NONE_PERMISSION;
```
`IsTappedBy` chequea `m_lootRecipients` (lo que llena `AddLootRecipient`).

### 5. `Loot::BuildLootResponse()` (`Loot.cpp`)
Arma el paquete que ve el cliente. Busca `items.find(viewer->GetGUID())` —
si tu `AddItem` no usó el `Player*` correcto, no hay nada acá. Después,
por cada ítem: `!is_looted && conditions.empty() && item.AllowedForPlayer(viewer)`
(ver Gotcha #2 arriba).

### 6. Click en el ítem → `Player::StoreLootItem()` (`Player.cpp`)
Vuelve a chequear `AllowedForPlayer` (mismo gotcha #2 aplica dos veces).
Si `item->currency` es true (ver Gotcha #1), toma el branch de moneda y
retorna sin avisar nada. Si no, `CanStoreNewItem(...)` decide si entra al
inventario (bolsa llena, item único, etc. — acá sí hay un `SendEquipError`
visible si falla).

## Checklist rápido para el próximo bug de este tipo

1. ¿El `ScriptName`/`smart_scripts` existe de verdad? (`grep` en DB y en
   `src/`).
2. ¿El fix ya compiló y se desplegó? (`docker inspect -f '{{.Image}}'` del
   contenedor corriendo vs. `docker image inspect <tag> --format '{{.Id}}'`
   — si no coinciden, estás mirando la imagen vieja).
3. Instrumentá con `TC_LOG_INFO` en cada checkpoint del mapa de arriba,
   subí `Logger.scripts` a nivel 3, mirá en vivo con Monitor.
4. Cuando encuentres el punto exacto donde se corta, buscá el código
   fuente de esa función en el motor (no asumas) — los nombres de campo y
   los valores de enum a veces no son lo que dice el comentario (ver
   Gotcha #1).
5. Sacá todo el logging de diagnóstico y `Logger.scripts` al nivel
   original antes de cerrar.
