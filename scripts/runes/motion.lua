local durability = require("durability")

durability:register_restore_handler("thaumfactory-motion-rune-stone", "thaumfactory-motion-crystal")

script.on_init(
  function()
    storage.active_motion_modifiers = {}
  end
)

script.on_event(defines.events.on_tick,
  function()
    for _, player in pairs(game.players) do
      if player.controller_type == defines.controllers.character then
        local rune = player.get_main_inventory().find_item_stack("thaumfactory-motion-rune-stone")
        if rune then
          if not storage.active_motion_modifiers[player.index] then
            -- case 1: player has inactive rune - track item number and modify speed
            if rune.durability >= 1 then
              storage.active_motion_modifiers[player.index] = { item_number = rune.item_number, distance = 0 }
              player.character_running_speed_modifier = 0.3
            end
          else
            -- case 2: player has active rune but no durability - reset
            if rune.durability <= 1 then
              storage.active_motion_modifiers[player.index] = nil
              player.character_running_speed_modifier = 0
            end
          end
        else
          -- case 3: player doesn't have rune - reset
          storage.active_motion_modifiers[player.index] = nil
          player.character_running_speed_modifier = 0
        end
      end
    end
  end
)

script.on_event(defines.events.on_player_changed_position,
  function(event)
    local player = game.get_player(event.player_index)
    if player.controller_type == defines.controllers.character then
      local rune = player.get_main_inventory().find_item_stack("thaumfactory-motion-rune-stone")
      local motion = storage.active_motion_modifiers[player.index]
      if rune and rune.durability > 1 and motion.item_number == rune.item_number then
        motion.distance = motion.distance + 1
        -- drain durability every 12 tiles
        if motion.distance >= 12 then
          motion.distance = 0
          rune.drain_durability(1)
        end
      end
    end
  end
)
