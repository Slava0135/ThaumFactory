local durability = require("durability")

local restore_handler_id, restore_handler = durability:register_event_handler("order")

-- regeneration
-- 2 per second
-- player health is 250
-- 125 seconds to full health
local function on_30th_tick()
  for _, player in pairs(game.players) do
    if player.controller_type == defines.controllers.character then
      local rune = player.get_main_inventory().find_item_stack("thaumfactory-order-rune-stone")
      if rune and rune.durability > 1 and player.character and player.character.get_health_ratio() < 1 then
        player.character.damage(-1, "player")
        rune.drain_durability(1)
      end
    end
  end
end

local order_rune = {}

order_rune.events = {
  [restore_handler_id] = restore_handler
}

order_rune.on_nth_tick = {
  [30] = on_30th_tick
}

return order_rune
