local util = require("__core__.lualib.util")
local area = require("area")

-- render area of effect boxes for selected aura pylon, if any
local function on_tick()
  for _, unit_number in pairs(storage.aura_pylons) do
    local pylon = game.get_entity_by_unit_number(unit_number)
    if pylon and pylon.valid and storage.selected_aura_pylons[unit_number] then
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

local function on_selected_entity_changed(event)
  local player = game.get_player(event.player_index)
  if player.selected and player.selected.name == "thaumfactory-aura-pylon" then
    storage.selected_aura_pylons[player.selected.unit_number] = true
  end
  if event.last_entity and event.last_entity.unit_number then
    storage.selected_aura_pylons[event.last_entity.unit_number] = nil
  end
end

local pylon_gui = {}

pylon_gui.events = {
  [defines.events.on_tick] = on_tick,
  [defines.events.on_selected_entity_changed] = on_selected_entity_changed,
}

pylon_gui.on_init = function()
  storage.selected_aura_pylons = {}
end

return pylon_gui
