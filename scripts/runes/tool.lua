local durability = require("durability")

local restore_handler_id, restore_handler = durability:register_event_handler("tool")

-- not using `on_tick` because you can't have multiple events in same file
local function on_2th_tick()
  for _, player in pairs(game.players) do
    if player.controller_type == defines.controllers.character then
      local rune = player.get_main_inventory().find_item_stack("thaumfactory-tool-rune-stone")
      -- refresh modifiers
      if rune then
        if not storage.active_tool_modifiers[player.index] then
          if rune.durability >= 1 then
            -- case 1: player has inactive (valid) rune - track item number and modify speed
            storage.active_tool_modifiers[player.index] = { item_number = rune.item_number, built = 0 }
            -- default reach is 10, double it
            player.character_build_distance_bonus = 10
          end
        else
          if rune.durability >= 1 then
            -- case 2: player has active (valid) rune - change the active rune
            storage.active_tool_modifiers[player.index].item_number = rune.item_number
          else
            -- case 3: player has active (invalid) rune - reset
            storage.active_tool_modifiers[player.index] = nil
            player.character_build_distance_bonus = 0
          end
        end
      else
        -- case 4: player doesn't have rune - reset
        storage.active_tool_modifiers[player.index] = nil
        player.character_build_distance_bonus = 0
      end
    end
  end
end

local function on_built_entity(event)
  local player = game.get_player(event.player_index)
  if player.controller_type == defines.controllers.character then
    local rune = player.get_main_inventory().find_item_stack("thaumfactory-tool-rune-stone")
    local tool = storage.active_tool_modifiers[player.index]
    if rune and rune.durability > 1 and tool and tool.item_number == rune.item_number then
      tool.built = tool.built + 1
      -- drain durability every 6 entities built
      if tool.built >= 6 then
        tool.built = 0
        rune.drain_durability(1)
      end
    end
  end
end

local tool_rune = {}

tool_rune.events = {
  [defines.events.on_built_entity] = on_built_entity,
  [restore_handler_id] = restore_handler,
}

tool_rune.on_nth_tick = {
  [2] = on_2th_tick
}

tool_rune.on_init = function()
  storage.active_tool_modifiers = {}
end

return tool_rune
