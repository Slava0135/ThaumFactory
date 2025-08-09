local sounds = require("__base__.prototypes.entity.sounds")
local hit_effects = require("__base__.prototypes.entity.hit-effects")
local item_sounds = require("__base__.prototypes.item_sounds")

data:extend({
  {
    type = "item",
    name = "thaumfactory-arcane-fabricator",
    icon = "__base__/graphics/icons/assembling-machine-1.png",
    subgroup = "thaumfactory-production",
    order = "t-arcane-fabricator",
    inventory_move_sound = item_sounds.mechanical_inventory_move,
    pick_sound = item_sounds.mechanical_inventory_pickup,
    drop_sound = item_sounds.mechanical_inventory_move,
    place_result = "thaumfactory-arcane-fabricator",
    stack_size = 50,
    random_tint_color = item_tints.iron_rust
  },
  {
    type = "assembling-machine",
    name = "thaumfactory-arcane-fabricator",
    icon = "__base__/graphics/icons/assembling-machine-2.png",
    flags = { "placeable-neutral", "placeable-player", "player-creation" },
    minable = { mining_time = 0.2, result = "thaumfactory-arcane-fabricator" },
    max_health = 350,
    corpse = "assembling-machine-2-remnants",
    dying_explosion = "assembling-machine-2-explosion",
    icon_draw_specification = { shift = { 0, -0.3 } },
    circuit_wire_max_distance = assembling_machine_circuit_wire_max_distance,
    circuit_connector = circuit_connector_definitions["assembling-machine"],
    alert_icon_shift = util.by_pixel(0, -12),
    resistances =
    {
      {
        type = "fire",
        percent = 70
      }
    },
    fluid_boxes =
    {
      {
        production_type = "input",
        pipe_covers = pipecoverspictures(),
        pipe_picture = assembler2pipepictures(),
        volume = 1000,
        pipe_connections = { { flow_direction = "input", direction = defines.direction.west, position = { -1, 1 } } },
      },
      {
        production_type = "input",
        pipe_covers = pipecoverspictures(),
        pipe_picture = assembler2pipepictures(),
        volume = 1000,
        pipe_connections = { { flow_direction = "input", direction = defines.direction.west, position = { -1, -1 } } },
      },
      {
        production_type = "input",
        pipe_covers = pipecoverspictures(),
        pipe_picture = assembler2pipepictures(),
        volume = 1000,
        pipe_connections = { { flow_direction = "input", direction = defines.direction.north, position = { 0, -1 } } },
      },
      {
        production_type = "input",
        pipe_covers = pipecoverspictures(),
        pipe_picture = assembler2pipepictures(),
        volume = 1000,
        pipe_connections = { { flow_direction = "input", direction = defines.direction.east, position = { 1, -1 } } },
      },
      {
        production_type = "input",
        pipe_covers = pipecoverspictures(),
        pipe_picture = assembler2pipepictures(),
        volume = 1000,
        pipe_connections = { { flow_direction = "input", direction = defines.direction.east, position = { 1, 1 } } },
      },
      {
        production_type = "input",
        pipe_covers = pipecoverspictures(),
        pipe_picture = assembler2pipepictures(),
        volume = 1000,
        pipe_connections = { { flow_direction = "input", direction = defines.direction.south, position = { 0, 1 } } },
      },
    },
    collision_box = { { -1.2, -1.2 }, { 1.2, 1.2 } },
    selection_box = { { -1.5, -1.5 }, { 1.5, 1.5 } },
    damaged_trigger_effect = hit_effects.entity(),
    graphics_set =
    {
      animation =
      {
        layers =
        {
          {
            filename = "__base__/graphics/entity/assembling-machine-2/assembling-machine-2.png",
            priority = "high",
            width = 214,
            height = 218,
            frame_count = 32,
            line_length = 8,
            shift = util.by_pixel(0, 4),
            scale = 0.5
          },
          {
            filename = "__base__/graphics/entity/assembling-machine-2/assembling-machine-2-shadow.png",
            priority = "high",
            width = 196,
            height = 163,
            frame_count = 32,
            line_length = 8,
            draw_as_shadow = true,
            shift = util.by_pixel(12, 4.75),
            scale = 0.5
          }
        }
      },
    },
    open_sound = sounds.machine_open,
    close_sound = sounds.machine_close,
    impact_category = "metal",
    working_sound =
    {
      sound = { filename = "__base__/sound/assembling-machine-t2-1.ogg", volume = 0.45, audible_distance_modifier = 0.5 },
      fade_in_ticks = 4,
      fade_out_ticks = 20
    },
    crafting_categories = { "thaumfactory-fabricate" },

    crafting_speed = 1,
    energy_source =
    {
      type = "electric",
      usage_priority = "secondary-input",
      emissions_per_minute = { pollution = 3 }
    },
    energy_usage = "150kW",
    allowed_effects = { "consumption", "speed", "productivity", "pollution", "quality" }
  },
})
