local durability = require("durability")

local restore_handler_id, restore_handler = durability:register_event_handler("craft")

-- not using `on_tick` because you can't have multiple events in same file
local function on_2th_tick()
  for _, player in pairs(game.players) do
    if player.controller_type == defines.controllers.character then
      local rune = player.get_main_inventory().find_item_stack("thaumfactory-craft-rune-stone")
      -- refresh modifiers
      if rune then
        if not storage.active_craft_modifiers[player.index] then
          if rune.durability >= 1 then
            -- case 1: player has inactive (valid) rune - track item number and modify speed
            storage.active_craft_modifiers[player.index] = { item_number = rune.item_number, crafted = 0, repaired = 0 }
            player.character_crafting_speed_modifier = 0.6
          end
        else
          if rune.durability >= 1 then
            -- case 2: player has active (valid) rune - change the active rune
            storage.active_craft_modifiers[player.index].item_number = rune.item_number
          else
            -- case 3: player has active (invalid) rune - reset
            storage.active_craft_modifiers[player.index] = nil
            player.character_crafting_speed_modifier = 0
          end
        end
      else
        -- case 4: player doesn't have rune - reset
        storage.active_craft_modifiers[player.index] = nil
        player.character_crafting_speed_modifier = 0
      end
    end
  end
end

-- repair
-- 5 per second
local function on_12th_tick()
  for _, player in pairs(game.players) do
    if player.controller_type == defines.controllers.character then
      local rune = player.get_main_inventory().find_item_stack("thaumfactory-craft-rune-stone")
      local craft = storage.active_craft_modifiers[player.index]
      if rune and rune.durability > 1 and craft and craft.item_number == rune.item_number then
        local entities = player.surface.find_entities_filtered { position = player.position, radius = 10, force = "player" }
        for _, entity in pairs(entities) do
          if entity.unit_number and not entity.has_flag("not-repairable") and (entity.get_health_ratio() or 666) < 1 then
            entity.damage(-1, "player")
            craft.repaired = craft.repaired + 1
            -- drain durability every 12 hp repaired
            if craft.repaired >= 12 then
              craft.repaired = 0
              rune.drain_durability(1)
            end
          end
        end
      end
    end
  end
end

local function on_player_crafted_item(event)
  local player = game.get_player(event.player_index)
  if player.controller_type == defines.controllers.character then
    local rune = player.get_main_inventory().find_item_stack("thaumfactory-craft-rune-stone")
    local craft = storage.active_craft_modifiers[player.index]
    if rune and rune.durability > 1 and craft and craft.item_number == rune.item_number then
      craft.crafted = craft.crafted + 1
      -- drain durability every 6 items crafted
      if craft.crafted >= 6 then
        craft.crafted = 0
        rune.drain_durability(1)
      end
    end
  end
end

local craft_rune = {}

craft_rune.events = {
  [defines.events.on_player_crafted_item] = on_player_crafted_item,
  [restore_handler_id] = restore_handler,
}

craft_rune.on_nth_tick = {
  [2] = on_2th_tick,
  [12] = on_12th_tick,
}

craft_rune.on_init = function()
  storage.active_craft_modifiers = {}
end

return craft_rune
