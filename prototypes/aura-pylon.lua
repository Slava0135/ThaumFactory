local hit_effects = require("__base__.prototypes.entity.hit-effects")
local item_sounds = require("__base__.prototypes.item_sounds")
local sounds = require("__base__.prototypes.entity.sounds")

local function sprite()
  return {
    layers = {
      {
        filename = "__thaumfactory__/graphics/entities/aura-pylon.png",
        priority = "extra-high",
        width = 128,
        height = 256,
        shift = util.by_pixel(0, -32),
        scale = 0.5
      },
      {
        filename = "__thaumfactory__/graphics/entities/aura-pylon-shadow.png",
        priority = "high",
        width = 512,
        height = 128,
        shift = util.by_pixel(92, 3),
        draw_as_shadow = true,
        scale = 0.5
      }
    }
  }
end

data:extend({
  {
    type = "item",
    name = "thaumfactory-aura-pylon",
    icon = "__thaumfactory__/graphics/icons/aura-pylon.png",
    subgroup = "thaumfactory-aura",
    order = "t-aura-pylon",
    inventory_move_sound = item_sounds.metal_large_inventory_move,
    pick_sound = item_sounds.metal_large_inventory_pickup,
    drop_sound = item_sounds.metal_large_inventory_move,
    place_result = "thaumfactory-aura-pylon",
    stack_size = 50
  },
  {
    type = "storage-tank",
    name = "thaumfactory-aura-pylon",
    icon = "__thaumfactory__/graphics/icons/aura-pylon.png",
    flags = { "placeable-player", "player-creation", "get-by-unit-number" },
    minable = { mining_time = 0.5, result = "thaumfactory-aura-pylon" },
    max_health = 500,
    corpse = "medium-small-remnants",
    dying_explosion = "medium-explosion",
    collision_box = { { -0.7, -0.7 }, { 0.7, 0.7 } },
    selection_box = { { -0.8, -1 }, { 0.8, 1 } },
    damaged_trigger_effect = hit_effects.entity(),
    icon_draw_specification = { scale = 1.5, shift = { 0, -0.3 } },
    fluid_box =
    {
      volume = 5000,
      -- TODO: pipe pictures
      pipe_covers = pipecoverspictures(),
      pipe_connections =
      {
        { direction = defines.direction.north, position = { -0.5, -0.5 } },
        { direction = defines.direction.east,  position = { 0.5, 0.5 } },
        { direction = defines.direction.south, position = { 0.5, 0.5 } },
        { direction = defines.direction.west,  position = { -0.5, -0.5 } }
      },
      hide_connection_info = true
    },
    two_direction_only = true,
    window_bounding_box = { { -0.125, 0.6875 }, { 0.1875, 1.1875 } },
    pictures =
    {
      picture =
      {
        north = sprite(),
        south = sprite(),
        east = sprite(),
        west = sprite(),
      },
    },
    flow_length_in_ticks = 360,
    impact_category = "stone",
    open_sound = sounds.metal_small_open,
    close_sound = sounds.metal_small_close,
    working_sound =
    {
      sound = { filename = "__base__/sound/storage-tank.ogg", volume = 0.6, audible_distance_modifier = 0.5 },
      match_volume_to_activity = true,
      max_sounds_per_prototype = 3
    },

    circuit_connector = circuit_connector_definitions["stone-furnace"],
    circuit_wire_max_distance = default_circuit_wire_max_distance,
  },
})
