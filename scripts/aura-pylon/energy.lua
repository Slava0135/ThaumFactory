local area = require("area")
local particle = require("particle")

local function on_60th_tick()
  -- one coal is 1 energy aspect, keep the ratio
  local aspect_per_j = 1 / 4000000
  local charge_j = 90000
  for _, unit_number in pairs(storage.aura_pylons) do
    local pylon = game.get_entity_by_unit_number(unit_number)
    if pylon and pylon.valid then
      local pylon_area = area:pylon(pylon.position)
      local entities = pylon.surface.find_entities_filtered { area = pylon_area, force = "player" }
      for _, entity in pairs(entities) do
        if (pylon.get_fluid_count("thaumfactory-aspect-energy") or 0) >= charge_j * aspect_per_j then
          local old_energy = entity.energy
          entity.energy = entity.energy + charge_j
          local delta_j = entity.energy - old_energy
          if delta_j > 0 then
            local amount = delta_j * aspect_per_j
            pylon.remove_fluid { name = "thaumfactory-aspect-energy", amount = amount }
            particle:trail { from = pylon.position, to = entity.position, name = "pole-spark-particle", surface = pylon.surface, density = 3, wide = true }
            pylon.surface.play_sound({ path = "thaumfactory-sound-zap", position = entity.position, volume_modifier = 0.03 })
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
