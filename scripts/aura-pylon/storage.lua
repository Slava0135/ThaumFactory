local function on_entity_created(event)
  local entity = event.entity or event.destination
  if not entity or not entity.valid then
    return
  end
  if entity.name ~= "thaumfactory-aura-pylon" then
    return
  end
  local unit_number = entity.unit_number
  storage.aura_pylons[unit_number] = unit_number
end

local function on_entity_destroyed(event)
  local entity = event.entity or event.destination
  if not entity or not entity.valid then
    return
  end
  if entity.name ~= "thaumfactory-aura-pylon" then
    return
  end
  local unit_number = entity.unit_number
  storage.aura_pylons[unit_number] = nil
end

local function on_tick()
  local to_remove = {}
  for _, unit_number in pairs(storage.aura_pylons) do
    local pylon = game.get_entity_by_unit_number(unit_number)
    if not pylon or not pylon.valid then
      table.insert(to_remove, unit_number)
    end
  end
  for _, unit_number in pairs(to_remove) do
    storage.aura_pylons[unit_number] = nil
  end
end

local aura_pylon_storage = {}

aura_pylon_storage.events = {
  [defines.events.on_built_entity] = on_entity_created,
  [defines.events.on_entity_cloned] = on_entity_created,
  [defines.events.script_raised_built] = on_entity_created,
  [defines.events.script_raised_revive] = on_entity_created,
  [defines.events.on_robot_built_entity] = on_entity_created,
  [defines.events.on_space_platform_built_entity] = on_entity_created,

  [defines.events.on_entity_died] = on_entity_destroyed,
  [defines.events.on_player_mined_entity] = on_entity_destroyed,
  [defines.events.script_raised_destroy] = on_entity_destroyed,
  [defines.events.on_robot_mined_entity] = on_entity_destroyed,
  [defines.events.on_space_platform_mined_entity] = on_entity_destroyed,

  [defines.events.on_tick] = on_tick
}

aura_pylon_storage.on_init = function()
  storage.aura_pylons = {}
end

return aura_pylon_storage
