local durability = require("durability")

local restore_handler_id, restore_handler = durability:register_event_handler("thaumfactory-fire-rune-stone",
  "thaumfactory-fire-crystal")

-- spawn fire
local function on_player_changed_position(event)
  local player = game.get_player(event.player_index)
  if player.controller_type == defines.controllers.character then
    local rune = player.get_main_inventory().find_item_stack("thaumfactory-fire-rune-stone")
    if rune and rune.durability > 1 then
      player.surface.create_entity { name = "fire-flame", position = player.position, force = "player" }
      storage.fire_distance[player.index] = (storage.fire_distance[player.index] or 0) + 1
      -- drain durability every 12 tiles
      if storage.fire_distance[player.index] >= 12 then
        storage.fire_distance[player.index] = 0
        rune.drain_durability(1)
      end
    end
  end
end

-- fire resistance
local function on_entity_damaged(event)
  local inventory = event.entity.get_main_inventory()
  if inventory and event.damage_type.valid and event.damage_type.name == "fire" then
    if inventory.get_item_count("thaumfactory-fire-rune-stone") >= 1 then
      event.entity.damage(-event.final_damage_amount, "player")
    end
  end
end

local fire_rune = {}

fire_rune.on_init = function()
  storage.fire_distance = {}
end

fire_rune.events = {
  [defines.events.on_player_changed_position] = on_player_changed_position,
  [defines.events.on_entity_damaged] = on_entity_damaged,
  [restore_handler_id] = restore_handler,
}

return fire_rune
