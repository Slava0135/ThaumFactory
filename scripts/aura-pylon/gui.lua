local util = require("__core__.lualib.util")
local area = require("area")

local function on_60th_tick()
  for _, surface in pairs(game.surfaces) do
    for _, pylon in pairs(surface.find_entities_filtered { name = "thaumfactory-aura-pylon" }) do
      local pylon_area = area:pylon(pylon.position)
      local storage_area = area:storage(pylon.position)
      rendering.draw_rectangle {
        surface = surface,
        filled = false,
        left_top = pylon_area.left_top,
        right_bottom = pylon_area.right_bottom,
        time_to_live = 60,
        draw_on_ground = false,
        only_in_alt_mode = true,
        color = util.color("#800080"),
      }
      rendering.draw_rectangle {
        surface = surface,
        filled = false,
        left_top = storage_area.left_top,
        right_bottom = storage_area.right_bottom,
        time_to_live = 60,
        draw_on_ground = false,
        only_in_alt_mode = true,
        color = util.color("#faa838"),
      }
    end
  end
end

local pylon_gui = {}

pylon_gui.on_nth_tick = {
  [60] = on_60th_tick
}

return pylon_gui
