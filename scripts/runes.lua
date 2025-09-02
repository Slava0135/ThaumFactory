script.on_event(defines.events.on_player_changed_position,
  function(event)
    local player = game.get_player(event.player_index)
    if player.controller_type == defines.controllers.character then
      if player.get_inventory(defines.inventory.character_main).get_item_count("thaumfactory-fire-rune-stone") >= 1 then
        player.surface.create_entity { name = "fire-flame", position = player.position, force = "player" }
      end
    end
  end
)
