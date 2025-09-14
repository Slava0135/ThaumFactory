local durability = require("durability")

local restore_handler_id, restore_handler = durability:register_event_handler("light")

-- spawn light around player
local function on_60th_tick()
  for _, player in pairs(game.players) do
    if player.controller_type == defines.controllers.character then
      local rune = player.get_main_inventory().find_item_stack("thaumfactory-light-rune-stone")
      if rune and rune.durability > 1 and player.surface.darkness > 0 then
        rendering.draw_light {
          sprite = "utility.light_medium",
          target = player.character,
          surface = player.surface,
          time_to_live = 60,
          scale = 8,
        }
        rune.drain_durability(1)
      end
    end
  end
end

local light_rune = {}

light_rune.events = {
  [restore_handler_id] = restore_handler,
}

light_rune.on_nth_tick = {
  [60] = on_60th_tick
}

return light_rune
