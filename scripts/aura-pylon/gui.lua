local util = require("__core__.lualib.util")
local area = require("area")

local function on_tick()
  for _, unit_number in pairs(storage.aura_pylons) do
    local pylon = game.get_entity_by_unit_number(unit_number)
    if pylon and pylon.valid then
      local pylon_area = area:pylon(pylon.position)
      local storage_area = area:storage(pylon.position)
      rendering.draw_rectangle {
        surface = pylon.surface,
        filled = false,
        left_top = pylon_area.left_top,
        right_bottom = pylon_area.right_bottom,
        time_to_live = 1,
        draw_on_ground = false,
        only_in_alt_mode = true,
        color = util.color("#faa838"),
      }
      rendering.draw_line {
        surface = pylon.surface,
        from = pylon.position,
        to = pylon_area.left_top,
        gap_length = 0.5,
        dash_length = 0.5,
        width = 2,
        time_to_live = 1,
        draw_on_ground = false,
        only_in_alt_mode = true,
        color = util.color("#faa838"),
      }
      rendering.draw_line {
        surface = pylon.surface,
        from = pylon.position,
        to = pylon_area.right_bottom,
        gap_length = 0.5,
        dash_length = 0.5,
        width = 2,
        time_to_live = 1,
        draw_on_ground = false,
        only_in_alt_mode = true,
        color = util.color("#faa838"),
      }
      rendering.draw_rectangle {
        surface = pylon.surface,
        filled = false,
        left_top = storage_area.left_top,
        right_bottom = storage_area.right_bottom,
        time_to_live = 1,
        draw_on_ground = false,
        only_in_alt_mode = true,
        color = util.color("#800080"),
      }
    end
  end
end

local pylon_gui = {}

pylon_gui.events = {
  [defines.events.on_tick] = on_tick
}

return pylon_gui
