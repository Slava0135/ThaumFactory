local area = require("area")
local math2d = require("__core__.lualib.math2d")

local function on_60th_tick()
  local aspect_per_use = 12
  for _, unit_number in pairs(storage.aura_pylons) do
    local pylon = game.get_entity_by_unit_number(unit_number)
    if pylon and pylon.valid then
      if (pylon.get_fluid_count("thaumfactory-aspect-plant") or 0) >= aspect_per_use then
        local pylon_area = area:pylon(pylon.position)
        local all_trees = prototypes.get_entity_filtered { { filter = "type", type = "tree" } }
        local all_tree_names = {}
        for name, _ in pairs(all_trees) do
          if not string.find(name, "dead") and not string.find(name, "dry") then
            table.insert(all_tree_names, name)
          end
        end
        local tree_name = all_tree_names[math.random(1, #all_tree_names)]
        local position = pylon.surface.find_non_colliding_position_in_box(tree_name, pylon_area, 3, true)
        if position then
          if pylon.surface.create_entity {
                name = tree_name,
                position = position,
                force = "neutral",
                preserve_ghosts_and_corpses = true,
                spawn_decorations = true,
                register_plant = true,
                snap_to_grid = true,
                create_build_effect_smoke = true,
              } then
            pylon.remove_fluid { name = "thaumfactory-aspect-plant", amount = aspect_per_use }
            local vector = math2d.position.subtract(position, pylon.position)
            local direction = math2d.position.get_normalised(vector)
            local length = math2d.vector.length(vector)
            local particle_position = pylon.position
            local offset = math2d.position.divide_scalar(math2d.position.rotate_vector(direction, 90), 4)
            local density = 3
            local steps = density * length + 1
            for i = 0, steps do
              pylon.surface.create_particle {
                name = "leaf-particle",
                position = particle_position,
                movement = { 0, 0 },
                height = i / steps,
                vertical_speed = -0.01,
                frame_speed = 1,
              }
              pylon.surface.create_particle {
                name = "leaf-particle",
                position = math2d.position.add(particle_position, offset),
                movement = { 0, 0 },
                height = i / steps,
                vertical_speed = -0.01,
                frame_speed = 1,
              }
              pylon.surface.create_particle {
                name = "leaf-particle",
                position = math2d.position.add(particle_position, math2d.position.multiply_scalar(offset, -1)),
                movement = { 0, 0 },
                height = i / steps,
                vertical_speed = -0.01,
                frame_speed = 1,
              }
              particle_position = math2d.position.add(particle_position,
                math2d.position.multiply_scalar(direction, 1 / density))
            end
          end
        end
      end
    end
  end
end

local plant_aura = {}

plant_aura.on_nth_tick = {
  [60] = on_60th_tick
}

return plant_aura
