local constants = require("constants")

local function on_60th_tick()
  local aspect_per_use = 1
  for _, surface in pairs(game.surfaces) do
    for _, pylon in pairs(surface.find_entities_filtered { name = "thaumfactory-aura-pylon" }) do
      if (pylon.get_fluid_count("thaumfactory-aspect-mine") or 0) > aspect_per_use then
        local storage_entities = surface.find_entities_filtered { position = pylon.position, radius = constants.storage_radius, type = "container" }
        if #storage_entities == 0 then
          return
        end
        local inventory = storage_entities[1].get_inventory(defines.inventory.chest)
        if not inventory then
          return
        end
        local entities = surface.find_entities_filtered { position = pylon.position, radius = constants.radius }
        for _, entity in pairs(entities) do
          if entity.minable and not entity.unit_number then
            if entity.mine { inventory = inventory } then
              pylon.remove_fluid { name = "thaumfactory-aspect-mine", amount = aspect_per_use }
              return
            end
          end
        end
      end
    end
  end
end

local mine_aura = {}

mine_aura.on_nth_tick = {
  [60] = on_60th_tick
}

return mine_aura
