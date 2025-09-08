local hit_effects = require("__base__.prototypes.entity.hit-effects")
local item_sounds = require("__base__.prototypes.item_sounds")
local sounds = require("__base__.prototypes.entity.sounds")

data:extend({
  {
    type = "item",
    name = "thaumfactory-aura-pylon",
    icon = "__base__/graphics/icons/storage-tank.png",
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
    icon = "__base__/graphics/icons/storage-tank.png",
    flags = { "placeable-player", "player-creation", "get-by-unit-number" },
    minable = { mining_time = 0.5, result = "thaumfactory-aura-pylon" },
    max_health = 500,
    corpse = "storage-tank-remnants",
    dying_explosion = "storage-tank-explosion",
    collision_box = { { -1.3, -1.3 }, { 1.3, 1.3 } },
    selection_box = { { -1.5, -1.5 }, { 1.5, 1.5 } },
    damaged_trigger_effect = hit_effects.entity(),
    icon_draw_specification = { scale = 1.5, shift = { 0, -0.3 } },
    fluid_box =
    {
      volume = 5000,
      pipe_covers = pipecoverspictures(),
      pipe_connections =
      {
        { direction = defines.direction.north, position = { -1, -1 } },
        { direction = defines.direction.east,  position = { 1, 1 } },
        { direction = defines.direction.south, position = { 1, 1 } },
        { direction = defines.direction.west,  position = { -1, -1 } }
      },
      hide_connection_info = true
    },
    two_direction_only = true,
    window_bounding_box = { { -0.125, 0.6875 }, { 0.1875, 1.1875 } },
    pictures =
    {
      picture =
      {
        sheets =
        {
          {
            filename = "__base__/graphics/entity/storage-tank/storage-tank.png",
            priority = "extra-high",
            frames = 2,
            width = 219,
            height = 235,
            shift = util.by_pixel(-0.25, -1.25),
            scale = 0.5
          },
          {
            filename = "__base__/graphics/entity/storage-tank/storage-tank-shadow.png",
            priority = "extra-high",
            frames = 2,
            width = 291,
            height = 153,
            shift = util.by_pixel(29.75, 22.25),
            scale = 0.5,
            draw_as_shadow = true
          }
        }
      },
      fluid_background =
      {
        filename = "__base__/graphics/entity/storage-tank/fluid-background.png",
        priority = "extra-high",
        width = 32,
        height = 15
      },
      window_background =
      {
        filename = "__base__/graphics/entity/storage-tank/window-background.png",
        priority = "extra-high",
        width = 34,
        height = 48,
        scale = 0.5
      },
      flow_sprite =
      {
        filename = "__base__/graphics/entity/pipe/fluid-flow-low-temperature.png",
        priority = "extra-high",
        width = 160,
        height = 20
      },
      gas_flow =
      {
        filename = "__base__/graphics/entity/pipe/steam.png",
        priority = "extra-high",
        line_length = 10,
        width = 48,
        height = 30,
        frame_count = 60,
        animation_speed = 0.25,
        scale = 0.5
      }
    },
    flow_length_in_ticks = 360,
    impact_category = "metal-large",
    open_sound = sounds.metal_large_open,
    close_sound = sounds.metal_large_close,
    working_sound =
    {
      sound = { filename = "__base__/sound/storage-tank.ogg", volume = 0.6, audible_distance_modifier = 0.5 },
      match_volume_to_activity = true,
      max_sounds_per_prototype = 3
    },

    circuit_connector = circuit_connector_definitions["storage-tank"],
    circuit_wire_max_distance = default_circuit_wire_max_distance,
    water_reflection =
    {
      pictures =
      {
        filename = "__base__/graphics/entity/storage-tank/storage-tank-reflection.png",
        priority = "extra-high",
        width = 24,
        height = 24,
        shift = util.by_pixel(5, 35),
        variation_count = 1,
        scale = 5
      },
      rotate = false,
      orientation_to_variation = false
    }
  },
})
