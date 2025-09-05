local durability = require("durability")

local restore_handler_id, restore_handler = durability:register_event_handler("mine")

-- not using `on_tick` because you can't have multiple events in same file
local function on_2th_tick()
  for _, player in pairs(game.players) do
    if player.controller_type == defines.controllers.character then
      local rune = player.get_main_inventory().find_item_stack("thaumfactory-mine-rune-stone")
      -- refresh modifiers
      if rune then
        if not storage.active_mine_modifiers[player.index] then
          if rune.durability >= 1 then
            -- case 1: player has inactive (valid) rune - track item number and modify speed
            storage.active_mine_modifiers[player.index] = { item_number = rune.item_number, mined = 0 }
            -- this is crazy
            player.character_mining_speed_modifier = 12
            -- default reach is 10, double it
            player.character_reach_distance_bonus = 10
            -- default reach is 3, double it
            player.character_resource_reach_distance_bonus = 3
          end
        else
          if rune.durability >= 1 then
            -- case 2: player has active (valid) rune - change the active rune
            storage.active_mine_modifiers[player.index].item_number = rune.item_number
          else
            -- case 3: player has active (invalid) rune - reset
            storage.active_mine_modifiers[player.index] = nil
            player.character_mining_speed_modifier = 0
            player.character_reach_distance_bonus = 0
            player.character_resource_reach_distance_bonus = 0
          end
        end
      else
        -- case 4: player doesn't have rune - reset
        storage.active_mine_modifiers[player.index] = nil
        player.character_mining_speed_modifier = 0
        player.character_reach_distance_bonus = 0
        player.character_resource_reach_distance_bonus = 0
      end
    end
  end
end

local function on_player_mined_item(event)
  local player = game.get_player(event.player_index)
  if player.controller_type == defines.controllers.character then
    local rune = player.get_main_inventory().find_item_stack("thaumfactory-mine-rune-stone")
    local mine = storage.active_mine_modifiers[player.index]
    if rune and rune.durability > 1 and mine and mine.item_number == rune.item_number then
      mine.mined = mine.mined + 1
      -- drain durability every 3 items
      if mine.mined >= 3 then
        mine.mined = 0
        rune.drain_durability(1)
      end
    end
  end
end

local mine_rune = {}

mine_rune.events = {
  [defines.events.on_player_mined_item] = on_player_mined_item,
  [restore_handler_id] = restore_handler,
}

mine_rune.on_nth_tick = {
  [2] = on_2th_tick
}

mine_rune.on_init = function()
  storage.active_mine_modifiers = {}
end

return mine_rune
