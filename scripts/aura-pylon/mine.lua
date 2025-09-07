local area = require("area")
local particle = require("particle")
local shuffle = require("lib.shuffle")
local tablext = require("lib.tablext")

local function on_60th_tick()
  local aspect_per_use = 1
  local resource_use_modifier = 1 / 16
  for _, unit_number in pairs(storage.aura_pylons) do
    local pylon = game.get_entity_by_unit_number(unit_number)
    if pylon and pylon.valid then
      local fluid = (pylon.get_fluid_count("thaumfactory-aspect-mine") or 0)
      if fluid >= aspect_per_use then
        local pylon_area = area:pylon(pylon.position)
        local storage_area = area:storage(pylon.position)
        local storage_entities = pylon.surface.find_entities_filtered { area = storage_area, type = "container" }
        if #storage_entities == 0 then
          goto next
        end
        shuffle:shuffle_array(storage_entities)
        local storage = storage_entities[1]
        local inventory = storage.get_inventory(defines.inventory.chest)
        if not inventory then
          goto next
        end
        local resources = pylon.surface.find_entities_filtered { area = pylon_area, type = "resource" }
        local resources_shuffled = tablext:to_array(resources)
        shuffle:shuffle_array(resources_shuffled)
        for _, entity in pairs(resources_shuffled) do
          local minable = prototypes.entity[entity.name].mineable_properties
          local amount = aspect_per_use * resource_use_modifier * minable.mining_time
          if not minable.required_fluid and fluid >= amount then
            local position = entity.position
            local proto_name = entity.prototype.name
            entity.mine { inventory = inventory }
            pylon.remove_fluid { name = "thaumfactory-aspect-mine", amount = amount }
            particle:trail { from = position, to = storage.position, name = "huge-rock-stone-particle-small", surface = pylon.surface, density = 3, wide = false }
            pylon.surface.play_sound({ path = "thaumfactory-sound-magic", position = position })
            local sound = "entity-mined/" .. proto_name
            if helpers.is_valid_sound_path(sound) then
              pylon.surface.play_sound({ path = sound, position = position })
            end
            goto next
          end
        end
        local entities = pylon.surface.find_entities_filtered { area = pylon_area }
        local entities_shuffled = tablext:to_array(entities)
        shuffle:shuffle_array(entities_shuffled)
        for _, entity in pairs(entities_shuffled) do
          if entity.minable and not entity.unit_number then
            local position = entity.position
            local proto_name = entity.prototype.name
            entity.mine { inventory = inventory }
            pylon.remove_fluid { name = "thaumfactory-aspect-mine", amount = aspect_per_use }
            particle:trail { from = position, to = storage.position, name = "huge-rock-stone-particle-small", surface = pylon.surface, density = 3, wide = false }
            pylon.surface.play_sound({ path = "thaumfactory-sound-magic", position = position })
            local sound = "entity-mined/" .. proto_name
            if helpers.is_valid_sound_path(sound) then
              pylon.surface.play_sound({ path = sound, position = position })
            end
            goto next
          end
        end
      end
    end
    ::next::
  end
end

local mine_aura = {}

mine_aura.on_nth_tick = {
  [60] = on_60th_tick
}

return mine_aura
