local area = require("area")
local particle = require("particle")

local function on_60th_tick()
  -- min fluid step is 2^24 = 16 777 216
  -- one coal is 1 fire aspect, keep the ratio
  local aspect_per_j = 1 / 4000000
  for _, unit_number in pairs(storage.aura_pylons) do
    local pylon = game.get_entity_by_unit_number(unit_number)
    if pylon and pylon.valid then
      local pylon_area = area:pylon(pylon.position)
      local entities = pylon.surface.find_entities_filtered { area = pylon_area, force = "player" }
      for _, entity in pairs(entities) do
        if entity.burner and entity.burner.currently_burning then
          local fuel_value = entity.burner.currently_burning.name.fuel_value
          local delta_j = fuel_value - entity.burner.remaining_burning_fuel
          local amount = delta_j * aspect_per_j
          if delta_j > 0 and (pylon.get_fluid_count("thaumfactory-aspect-fire") or 0) >= amount then
            entity.burner.remaining_burning_fuel = fuel_value
            pylon.remove_fluid { name = "thaumfactory-aspect-fire", amount = amount }
            particle:smoke_trail { name = "smoke-fast", from = pylon.position, to = entity.position, surface = entity.surface, density = 1 }
          end
        end
      end
    end
  end
end

local fire_aura = {}

fire_aura.on_nth_tick = {
  [60] = on_60th_tick
}

return fire_aura
