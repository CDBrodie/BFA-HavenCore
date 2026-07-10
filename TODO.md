# TODO / Pendientes

Checklist de contenido pendiente o mejoras conocidas en BFA-HavenCore. Formato:
`- [ ] pendiente` / `- [x] hecho`. Agregar items nuevos abajo de la seccion que
corresponda (crear una seccion nueva si no encaja en ninguna). No borrar items
completados, solo tildarlos - sirven de historial de que se reviso.

## Quest 39684 "Beam Me Up" (Glazer / Vault of the Wardens)

- [ ] El stun de Glazer y el kill credit se aplican apenas el jugador
      interactua con el espejo (`go_244449::OnGossipHello`), de forma
      instantanea. En retail el rayo viaja visualmente desde Glazer, rebota
      en el espejo, y recien ahi lo golpea. Falta encadenar la secuencia
      visual antes de aplicar el stun: `go->CastSpell(glazer,
      SPELL_GLAZER_BEAM_VIS_3)` (rayo pasando por el espejo) -> esperar a
      que termine su duracion/viaje -> recien ahi `glazer->AI()->DoAction
      (ACTION_GLAZER_SHIELD_BROKEN)` + `SetControlled(true,
      UNIT_STATE_STUNNED)`. Ver
      `src/server/scripts/BrokenIsles/DemonHunterZones/zone_vault_of_wardens.cpp`
      (`npc_96680` / `go_244449`). Referencia de la secuencia completa con
      lentes intermedios: `src/server/scripts/BrokenIsles/VaultOfTheWardens/boss_glazer.cpp`
      (`npc_glazer_lensAI::SearchBeamTarget`, `SpellHit` case
      `SPELL_BEAM_VIS_4`).
- [ ] Evaluar si vale la pena agregar los orbes de energia "bouncing"
      literales (creature en movimiento) en vez de reusar `SPELL_PULSE_AT`
      cast en el jugador mas cercano - mas fiel a retail pero requiere una
      fila nueva en `creature_template` (ver skill `quest-enemy-behavior`).
