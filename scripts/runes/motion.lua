local durability = require("durability")

local restore_handler_id, restore_handler = durability:register_event_handler("thaumfactory-motion-rune-stone",
  "thaumfactory-motion-crystal")

local function on_player_changed_position(event)
  local player = game.get_player(event.player_index)
  if player.controller_type == defines.controllers.character then
    -- refresh modifiers
    local rune = player.get_main_inventory().find_item_stack("thaumfactory-motion-rune-stone")
    if rune then
      if not storage.active_motion_modifiers[player.index] then
        if rune.durability >= 1 then
          -- case 1: player has inactive (valid) rune - track item number and modify speed
          storage.active_motion_modifiers[player.index] = { item_number = rune.item_number, distance = 0 }
          player.character_running_speed_modifier = 0.3
        end
      else
        if rune.durability >= 1 then
          -- case 2: player has active (valid) rune - change the active rune
          storage.active_motion_modifiers[player.index].item_number = rune.item_number
        else
          -- case 3: player has active (invalid) rune - reset
          storage.active_motion_modifiers[player.index] = nil
          player.character_running_speed_modifier = 0
        end
      end
    else
      -- case 4: player doesn't have rune - reset
      storage.active_motion_modifiers[player.index] = nil
      player.character_running_speed_modifier = 0
    end
    -- update durability
    local motion = storage.active_motion_modifiers[player.index]
    if rune and rune.durability > 1 and motion and motion.item_number == rune.item_number then
      motion.distance = motion.distance + 1
      -- drain durability every 12 tiles
      if motion.distance >= 12 then
        motion.distance = 0
        rune.drain_durability(1)
      end
    end
  end
end

local motion_rune = {}

motion_rune.events = {
  [defines.events.on_player_changed_position] = on_player_changed_position,
  [restore_handler_id] = restore_handler,
}

motion_rune.on_init = function()
  storage.active_motion_modifiers = {}
end

return motion_rune
