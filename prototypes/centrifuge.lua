local sounds = require("__base__.prototypes.entity.sounds")
local hit_effects = require("__base__.prototypes.entity.hit-effects")
local item_sounds = require("__base__.prototypes.item_sounds")

data:extend({
  {
    type = "item",
    name = "thaumfactory-alchemical-centrifuge",
    icon = "__base__/graphics/icons/centrifuge.png",
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
    icon = "__base__/graphics/icons/centrifuge.png",
    flags = { "placeable-neutral", "placeable-player", "player-creation" },
    minable = { mining_time = 0.1, result = "thaumfactory-alchemical-centrifuge" },
    -- fast_replaceable_group = "centrifuge",
    max_health = 350,
    corpse = "centrifuge-remnants",
    dying_explosion = "centrifuge-explosion",
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
      always_draw_idle_animation = true,
      idle_animation =
      {
        layers =
        {
          -- Centrifuge A
          {
            filename = "__base__/graphics/entity/centrifuge/centrifuge-C.png",
            priority = "high",
            scale = 0.5,
            line_length = 8,
            width = 237,
            height = 214,
            frame_count = 64,
            shift = util.by_pixel(-0.25, -26.5)
          },
          {
            filename = "__base__/graphics/entity/centrifuge/centrifuge-C-shadow.png",
            draw_as_shadow = true,
            priority = "high",
            scale = 0.5,
            line_length = 8,
            width = 279,
            height = 152,
            frame_count = 64,
            shift = util.by_pixel(16.75, -10)
          },
          -- Centrifuge B
          {
            filename = "__base__/graphics/entity/centrifuge/centrifuge-B.png",
            priority = "high",
            scale = 0.5,
            line_length = 8,
            width = 156,
            height = 234,
            frame_count = 64,
            shift = util.by_pixel(23, 6.5)
          },
          {
            filename = "__base__/graphics/entity/centrifuge/centrifuge-B-shadow.png",
            draw_as_shadow = true,
            priority = "high",
            scale = 0.5,
            line_length = 8,
            width = 251,
            height = 149,
            frame_count = 64,
            shift = util.by_pixel(63.25, 15.25)
          },
          -- Centrifuge A
          {
            filename = "__base__/graphics/entity/centrifuge/centrifuge-A.png",
            priority = "high",
            scale = 0.5,
            line_length = 8,
            width = 139,
            height = 246,
            frame_count = 64,
            shift = util.by_pixel(-26.25, 3.5)
          },
          {
            filename = "__base__/graphics/entity/centrifuge/centrifuge-A-shadow.png",
            priority = "high",
            draw_as_shadow = true,
            scale = 0.5,
            line_length = 8,
            width = 230,
            height = 124,
            frame_count = 64,
            shift = util.by_pixel(8.5, 23.5)
          }
        }
      },

      working_visualisations =
      {
        {
          effect = "uranium-glow",
          fadeout = true,
          light = { intensity = 0.2, size = 9.9, shift = { 0, 0 }, color = { 0, 1, 0 } }
        },
        {
          effect = "uranium-glow",
          fadeout = true,
          animation =
          {
            layers =
            {
              -- Centrifuge C
              {
                filename = "__base__/graphics/entity/centrifuge/centrifuge-C-light.png",
                priority = "high",
                scale = 0.5,
                blend_mode = "additive", -- centrifuge
                line_length = 8,
                width = 190,
                height = 207,
                frame_count = 64,
                draw_as_glow = true,
                shift = util.by_pixel(0, -27.25)
              },
              -- Centrifuge B
              {
                filename = "__base__/graphics/entity/centrifuge/centrifuge-B-light.png",
                priority = "high",
                scale = 0.5,
                blend_mode = "additive", -- centrifuge
                line_length = 8,
                width = 131,
                height = 206,
                frame_count = 64,
                draw_as_glow = true,
                shift = util.by_pixel(16.75, 0.5)
              },
              -- Centrifuge A
              {
                filename = "__base__/graphics/entity/centrifuge/centrifuge-A-light.png",
                priority = "high",
                scale = 0.5,
                blend_mode = "additive", -- centrifuge
                line_length = 8,
                width = 108,
                height = 197,
                frame_count = 64,
                draw_as_glow = true,
                shift = util.by_pixel(-23.5, -1.75)
              }
            }
          }
        }
      }
    },
    open_sound = sounds.machine_open,
    close_sound = sounds.machine_close,
    impact_category = "metal-large",
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
    water_reflection =
    {
      pictures =
      {
        filename = "__base__/graphics/entity/centrifuge/centrifuge-reflection.png",
        priority = "extra-high",
        width = 28,
        height = 32,
        shift = util.by_pixel(0, 65),
        variation_count = 1,
        scale = 5
      },
      rotate = false,
      orientation_to_variation = false
    }
  },
})
