local area = require("area")

local function on_60th_tick()
  local aspect_per_use = 12
  for _, surface in pairs(game.surfaces) do
    for _, pylon in pairs(surface.find_entities_filtered { name = "thaumfactory-aura-pylon" }) do
      if (pylon.get_fluid_count("thaumfactory-aspect-plant") or 0) > aspect_per_use then
        local pylon_area = area:pylon(pylon.position)
        local all_trees = prototypes.get_entity_filtered { { filter = "type", type = "tree" } }
        local all_tree_names = {}
        for name, _ in pairs(all_trees) do
          if not string.find(name, "dead") and not string.find(name, "dry") then
            table.insert(all_tree_names, name)
          end
        end
        local tree_name = all_tree_names[math.random(1, #all_tree_names)]
        local position = surface.find_non_colliding_position_in_box(tree_name, pylon_area, 3, true)
        if position then
          if surface.create_entity {
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
