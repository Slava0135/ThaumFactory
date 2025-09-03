script.on_event(defines.events.on_player_changed_position,
  function(event)
    local player = game.get_player(event.player_index)
    if player.controller_type == defines.controllers.character then
      local rune = player.get_main_inventory().find_item_stack("thaumfactory-fire-rune-stone")
      if rune and rune.durability > 1 then
        player.surface.create_entity { name = "fire-flame", position = player.position, force = "player" }
        rune.drain_durability(1)
      end
    end
  end
)

script.on_event(defines.events.on_entity_damaged,
  function(event)
    -- idk how to get player itself
    local inventory = event.entity.get_main_inventory()
    if inventory and event.damage_type.valid and event.damage_type.name == "fire" then
      if inventory.get_item_count("thaumfactory-fire-rune-stone") >= 1 then
        event.entity.damage(-event.final_damage_amount, "player")
      end
    end
  end
)
