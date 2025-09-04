local durability = require("durability")

local restore_handler_id, restore_handler = durability:register_event_handler("thaumfactory-life-rune-stone",
  "thaumfactory-life-crystal")

-- regeneration
-- 5 per second
-- player health is 250
-- 50 seconds to full health
local function on_12th_tick()
  for _, player in pairs(game.players) do
    if player.controller_type == defines.controllers.character then
      local rune = player.get_main_inventory().find_item_stack("thaumfactory-life-rune-stone")
      if rune and rune.durability > 1 and player.character and player.character.get_health_ratio() < 1 then
        player.character.damage(-1, "player")
        rune.drain_durability(1)
      end
    end
  end
end

local life_rune = {}

life_rune.events = {
  [restore_handler_id] = restore_handler
}

life_rune.on_nth_tick = {
  [12] = on_12th_tick
}

return life_rune
