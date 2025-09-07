local area = require("area")
local particle = require("particle")

local function on_60th_tick()
  local aspect_per_use = 90
  for _, unit_number in pairs(storage.aura_pylons) do
    local pylon = game.get_entity_by_unit_number(unit_number)
    if pylon and pylon.valid then
      if (pylon.get_fluid_count("thaumfactory-aspect-earth") or 0) >= aspect_per_use then
        local pylon_area = area:pylon(pylon.position)
        local all_rock_names = { "huge-rock", "big-rock", "big-sand-rock" }
        local rock_name = all_rock_names[math.random(1, #all_rock_names)]
        local position = pylon.surface.find_non_colliding_position_in_box(rock_name, pylon_area, 3, true)
        if position then
          local entity = pylon.surface.create_entity {
            name = rock_name,
            position = position,
            force = "neutral",
            preserve_ghosts_and_corpses = true,
            spawn_decorations = true,
            snap_to_grid = true,
            create_build_effect_smoke = true,
          }
          if entity then
            pylon.remove_fluid { name = "thaumfactory-aspect-earth", amount = aspect_per_use }
            particle:trail { from = pylon.position, to = position, name = "huge-rock-stone-particle-small", surface = pylon.surface, density = 3, wide = true }
            pylon.surface.play_sound({ path = "thaumfactory-sound-magic", position = position })
            local sound = "entity-build/" .. entity.prototype.name
            if helpers.is_valid_sound_path(sound) then
              pylon.surface.play_sound({ path = sound, position = entity.position })
            end
          end
        end
      end
    end
  end
end

local earth_aura = {}

earth_aura.on_nth_tick = {
  [60] = on_60th_tick
}

return earth_aura
