local sounds = require("__base__.prototypes.entity.sounds")
local hit_effects = require("__base__.prototypes.entity.hit-effects")
local item_sounds = require("__base__.prototypes.item_sounds")

data:extend({
  {
    type = "item",
    name = "thaumfactory-alchemical-centrifuge",
    icon = "__thaumfactory__/graphics/icons/alchemical-centrifuge.png",
    subgroup = "thaumfactory-alchemy",
    order = "t-alchemical-centrifuge",
    inventory_move_sound = item_sounds.mechanical_inventory_move,
    pick_sound = item_sounds.mechanical_inventory_pickup,
    drop_sound = item_sounds.mechanical_inventory_move,
    place_result = "thaumfactory-alchemical-centrifuge",
    stack_size = 50,
    random_tint_color = item_tints.iron_rust
  },
  {
    type = "assembling-machine",
    name = "thaumfactory-alchemical-centrifuge",
    icon = "__thaumfactory__/graphics/icons/alchemical-centrifuge.png",
    flags = { "placeable-neutral", "placeable-player", "player-creation" },
    minable = { mining_time = 0.1, result = "thaumfactory-alchemical-centrifuge" },
    -- fast_replaceable_group = "centrifuge",
    max_health = 350,
    corpse = "medium-remnants",
    dying_explosion = "medium-explosion",
    icon_draw_specification = { shift = { 0, -0.3 } },
    circuit_wire_max_distance = assembling_machine_circuit_wire_max_distance,
    circuit_connector = circuit_connector_definitions["centrifuge"],
    resistances =
    {
      {
        type = "fire",
        percent = 70
      }
    },
    collision_box = { { -1.2, -1.2 }, { 1.2, 1.2 } },
    selection_box = { { -1.5, -1.5 }, { 1.5, 1.5 } },
    damaged_trigger_effect = hit_effects.entity(),
    drawing_box_vertical_extension = 0.7,
    fluid_boxes =
    {
      {
        production_type = "input",
        pipe_covers = pipecoverspictures(),
        volume = 100,
        pipe_connections =
        {
          {
            flow_direction = "input",
            direction = defines.direction.north,
            position = { 0, -1 }
          }
        }
      },
      {
        production_type = "output",
        pipe_covers = pipecoverspictures(),
        volume = 100,
        pipe_connections =
        {
          {
            flow_direction = "output",
            direction = defines.direction.west,
            position = { -1, 0 }
          }
        }
      },
      {
        production_type = "output",
        pipe_covers = pipecoverspictures(),
        volume = 100,
        pipe_connections =
        {
          {
            flow_direction = "output",
            direction = defines.direction.east,
            position = { 1, 0 }
          }
        }
      }
    },

    graphics_set =
    {
      animation =
      {
        layers =
        {
          {
            filename = "__thaumfactory__/graphics/entities/alchemical-centrifuge.png",
            priority = "high",
            width = 200,
            height = 240,
            frame_count = 10,
            animation_speed = 0.7,
            shift = util.by_pixel(0, -6),
            scale = 0.5
          },
          {
            filename = "__thaumfactory__/graphics/entities/alchemical-centrifuge-shadow.png",
            priority = "high",
            width = 420,
            height = 192,
            line_length = 1,
            repeat_count = 10,
            draw_as_shadow = true,
            shift = util.by_pixel(52, 8),
            scale = 0.5
          },
          {
            filename = "__thaumfactory__/graphics/entities/alchemical-centrifuge-light.png",
            priority = "high",
            width = 200,
            height = 240,
            frame_count = 10,
            animation_speed = 0.7,
            shift = util.by_pixel(0, -6),
            scale = 0.5
          },
        }
      },
    },
    open_sound = sounds.machine_open,
    close_sound = sounds.machine_close,
    impact_category = "metal",
    working_sound =
    {
      sound = sound_variations("__base__/sound/centrifuge", 3, 0.3, volume_multiplier("main-menu", 1.5)),
      fade_in_ticks = 4,
      fade_out_ticks = 20
    },
    crafting_speed = 1,
    crafting_categories = { "thaumfactory-alchemistry-break" },
    energy_source =
    {
      type = "electric",
      usage_priority = "secondary-input",
      emissions_per_minute = { pollution = 4 }
    },
    energy_usage = "350kW",
    allowed_effects = { "consumption", "speed", "productivity", "pollution", "quality" },
  },
})
