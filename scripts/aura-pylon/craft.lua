local area = require("area")

local function on_60th_tick()
  local aspect_per_use = 1 / 8
  for _, unit_number in pairs(storage.aura_pylons) do
    local pylon = game.get_entity_by_unit_number(unit_number)
    if pylon and pylon.valid then
      local pylon_area = area:pylon(pylon.position)
      local entities = pylon.surface.find_entities_filtered { area = pylon_area, force = "player" }
      for _, entity in pairs(entities) do
        if (pylon.get_fluid_count("thaumfactory-aspect-craft") or 0) < aspect_per_use then
          goto next
        end
        if entity.unit_number and not entity.has_flag("not-repairable") and (entity.get_health_ratio() or 666) < 1 then
          entity.damage(-1, "player")
          pylon.remove_fluid { name = "thaumfactory-aspect-craft", amount = aspect_per_use }
          entity.surface.play_sound({ path = "utility/default_manual_repair", entity.position, volume_modifier = 0.1 })
        end
      end
    end
    ::next::
  end
end

local craft_aura = {}

craft_aura.on_nth_tick = {
  [60] = on_60th_tick
}

return craft_aura
