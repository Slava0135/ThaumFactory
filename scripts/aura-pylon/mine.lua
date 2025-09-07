local area = require("area")

local function on_60th_tick()
  local aspect_per_use = 1
  local resource_use_modifier = 1 / 16
  for _, surface in pairs(game.surfaces) do
    for _, pylon in pairs(surface.find_entities_filtered { name = "thaumfactory-aura-pylon" }) do
      local fluid = (pylon.get_fluid_count("thaumfactory-aspect-mine") or 0)
      if fluid >= aspect_per_use then
        local pylon_area = area:pylon(pylon.position)
        local storage_area = area:storage(pylon.position)
        local storage_entities = surface.find_entities_filtered { area = storage_area, type = "container" }
        if #storage_entities == 0 then
          goto next
        end
        local inventory = storage_entities[1].get_inventory(defines.inventory.chest)
        if not inventory then
          goto next
        end
        local resources = surface.find_entities_filtered { area = pylon_area, type = "resource" }
        for _, entity in pairs(resources) do
          local minable = prototypes.entity[entity.name].mineable_properties
          local amount = aspect_per_use * resource_use_modifier * minable.mining_time
          if not minable.required_fluid and fluid >= amount then
            entity.mine { inventory = inventory }
            pylon.remove_fluid { name = "thaumfactory-aspect-mine", amount = amount }
            goto next
          end
        end
        local entities = surface.find_entities_filtered { area = pylon_area }
        for _, entity in pairs(entities) do
          if entity.minable and not entity.unit_number then
            entity.mine { inventory = inventory }
            pylon.remove_fluid { name = "thaumfactory-aspect-mine", amount = aspect_per_use }
            goto next
          end
        end
      end
      ::next::
    end
  end
end

local mine_aura = {}

mine_aura.on_nth_tick = {
  [60] = on_60th_tick
}

return mine_aura
