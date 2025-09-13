local sounds = require("__base__.prototypes.entity.sounds")
local hit_effects = require("__base__.prototypes.entity.hit-effects")
local item_sounds = require("__base__.prototypes.item_sounds")

data:extend({
  {
    type = "item",
    name = "thaumfactory-alchemical-furnace",
    icon = "__thaumfactory__/graphics/icons/alchemical-furnace.png",
    subgroup = "thaumfactory-alchemy",
    order = "t-alchemical-furnace",
    inventory_move_sound = item_sounds.brick_inventory_move,
    pick_sound = item_sounds.brick_inventory_pickup,
    drop_sound = item_sounds.brick_inventory_move,
    place_result = "thaumfactory-alchemical-furnace",
    stack_size = 50
  },
  {
    type = "furnace",
    name = "thaumfactory-alchemical-furnace",
    icon = "__thaumfactory__/graphics/icons/alchemical-furnace.png",
    flags = { "placeable-neutral", "placeable-player", "player-creation" },
    minable = { mining_time = 0.2, result = "thaumfactory-alchemical-furnace" },
    -- fast_replaceable_group = "furnace",
    -- next_upgrade = "steel-furnace",
    circuit_wire_max_distance = furnace_circuit_wire_max_distance,
    circuit_connector = circuit_connector_definitions["stone-furnace"],
    max_health = 200,
    corpse = "medium-small-remnants",
    dying_explosion = "medium-explosion",
    repair_sound = sounds.manual_repair,
    mined_sound = sounds.deconstruct_bricks(0.8),
    open_sound = sounds.machine_open,
    close_sound = sounds.machine_close,
    allowed_effects = { "speed", "consumption", "pollution" },
    effect_receiver = { uses_module_effects = false, uses_beacon_effects = false, uses_surface_effects = true },
    impact_category = "stone",
    icon_draw_specification = { scale = 0.66, shift = { 0, -0.1 } },
    working_sound =
    {
      sound =
      {
        filename = "__base__/sound/furnace.ogg",
        volume = 0.6,
        modifiers = { volume_multiplier("main-menu", 1.5), volume_multiplier("tips-and-tricks", 1.4) },
        audible_distance_modifier = 0.4
      },
      fade_in_ticks = 4,
      fade_out_ticks = 20,
    },
    resistances =
    {
      {
        type = "fire",
        percent = 90
      },
      {
        type = "explosion",
        percent = 30
      },
      {
        type = "impact",
        percent = 30
      }
    },
    collision_box = { { -0.7, -0.7 }, { 0.7, 0.7 } },
    selection_box = { { -0.8, -1 }, { 0.8, 1 } },
    damaged_trigger_effect = hit_effects.rock(),
    crafting_categories = { "thaumfactory-alchemistry-smelt" },
    result_inventory_size = 0,
    energy_usage = "90kW",
    crafting_speed = 1,
    source_inventory_size = 1,
    energy_source =
    {
      type = "burner",
      fuel_categories = { "chemical" },
      effectivity = 1,
      fuel_inventory_size = 1,
      emissions_per_minute = { pollution = 2 },
      light_flicker =
      {
        color = { 128, 0, 128 },
        minimum_intensity = 0.6,
        maximum_intensity = 0.95
      },
      smoke =
      {
        {
          name = "thaumcraft-magic-smoke",
          deviation = { 0.1, 0.1 },
          frequency = 1.1,
          position = { -0.7, -0.8 },
          starting_vertical_speed = 0.08,
          starting_frame_deviation = 60
        },
        {
          name = "thaumcraft-magic-smoke",
          deviation = { 0.1, 0.1 },
          frequency = 1.2,
          position = { 0.7, -0.8 },
          starting_vertical_speed = 0.08,
          starting_frame_deviation = 60
        },
        {
          name = "thaumcraft-magic-smoke",
          deviation = { 0.1, 0.1 },
          frequency = 1.3,
          position = { -0.7, -1.8 },
          starting_vertical_speed = 0.08,
          starting_frame_deviation = 60
        },
        {
          name = "thaumcraft-magic-smoke",
          deviation = { 0.1, 0.1 },
          frequency = 1.4,
          position = { 0.7, -1.8 },
          starting_vertical_speed = 0.08,
          starting_frame_deviation = 60
        }
      }
    },
    -- clockwise
    fluid_boxes =
    {
      {
        production_type = "output",
        pipe_covers = pipecoverspictures(),
        volume = 1000,
        pipe_connections =
        {
          {
            flow_direction = "output",
            direction = defines.direction.west,
            position = { -0.5, 0.5 }
          }
        }
      },
      {
        production_type = "output",
        pipe_covers = pipecoverspictures(),
        volume = 1000,
        pipe_connections =
        {
          {
            flow_direction = "output",
            direction = defines.direction.west,
            position = { -0.5, -0.5 }
          }
        }
      },
      {
        production_type = "output",
        pipe_covers = pipecoverspictures(),
        volume = 1000,
        pipe_connections =
        {
          {
            flow_direction = "output",
            direction = defines.direction.north,
            position = { -0.5, -0.5 }
          }
        }
      },
      {
        production_type = "output",
        pipe_covers = pipecoverspictures(),
        volume = 1000,
        pipe_connections =
        {
          {
            flow_direction = "output",
            direction = defines.direction.north,
            position = { 0.5, -0.5 }
          }
        }
      },
      {
        production_type = "output",
        pipe_covers = pipecoverspictures(),
        volume = 1000,
        pipe_connections =
        {
          {
            flow_direction = "output",
            direction = defines.direction.east,
            position = { 0.5, -0.5 }
          }
        }
      },
      {
        production_type = "output",
        pipe_covers = pipecoverspictures(),
        volume = 1000,
        pipe_connections =
        {
          {
            flow_direction = "output",
            direction = defines.direction.east,
            position = { 0.5, 0.5 }
          }
        }
      },
    },
    graphics_set =
    {
      animation =
      {
        layers =
        {
          {
            filename = "__thaumfactory__/graphics/entities/alchemical-furnace.png",
            priority = "extra-high",
            width = 128,
            height = 180,
            shift = util.by_pixel(0, -15),
            scale = 0.5
          },
          {
            filename = "__thaumfactory__/graphics/entities/alchemical-furnace-shadow.png",
            priority = "high",
            width = 238,
            height = 100,
            draw_as_shadow = true,
            shift = util.by_pixel(30, 8),
            scale = 0.5
          }
        }
      },
    }
  },
})
