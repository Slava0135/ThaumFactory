local item_sounds = require("__base__.prototypes.item_sounds")
local sounds = require("__base__.prototypes.entity.sounds")
local hit_effects = require("__base__.prototypes.entity.hit-effects")

data:extend({
  {
    type = "item",
    name = "thaumfactory-arcane-lab",
    icon = "__thaumfactory__/graphics/icons/arcane-lab.png",
    subgroup = "thaumfactory-production",
    order = "t-arcane-lab",
    inventory_move_sound = item_sounds.lab_inventory_move,
    pick_sound = item_sounds.lab_inventory_pickup,
    drop_sound = item_sounds.lab_inventory_move,
    place_result = "thaumfactory-arcane-lab",
    stack_size = 10
  },
  {
    type = "lab",
    name = "thaumfactory-arcane-lab",
    icon = "__thaumfactory__/graphics/icons/arcane-lab.png",
    flags = { "placeable-player", "player-creation" },
    minable = { mining_time = 0.2, result = "lab" },
    max_health = 150,
    corpse = "medium-remnants",
    dying_explosion = "medium-explosion",
    collision_box = { { -1.2, -1.2 }, { 1.2, 1.2 } },
    selection_box = { { -1.5, -1.5 }, { 1.5, 1.5 } },
    damaged_trigger_effect = hit_effects.entity(),
    on_animation =
    {
      layers =
      {
        {
          filename = "__thaumfactory__/graphics/entities/arcane-lab.png",
          width = 192,
          height = 228,
          frame_count = 10,
          animation_speed = 1 / 3,
          shift = util.by_pixel(0, 0),
          scale = 0.5,
        },
        {
          filename = "__thaumfactory__/graphics/entities/arcane-lab-shadow.png",
          width = 440,
          height = 192,
          line_length = 1,
          repeat_count = 10,
          shift = util.by_pixel(64, 10),
          scale = 0.5,
          draw_as_shadow = true
        },
        {
          filename = "__thaumfactory__/graphics/entities/arcane-lab-light.png",
          blend_mode = "additive",
          draw_as_light = true,
          width = 192,
          height = 228,
          frame_count = 10,
          animation_speed = 1 / 3,
          shift = util.by_pixel(0, 0),
          scale = 0.5
        },
      }
    },
    off_animation =
    {
      layers =
      {
        {
          filename = "__thaumfactory__/graphics/entities/arcane-lab.png",
          width = 192,
          height = 228,
          shift = util.by_pixel(0, 0),
          scale = 0.5,
        },
        {
          filename = "__thaumfactory__/graphics/entities/arcane-lab-shadow.png",
          width = 440,
          height = 192,
          shift = util.by_pixel(60, 10),
          scale = 0.5,
          draw_as_shadow = true
        }
      }
    },
    working_sound =
    {
      sound =
      {
        filename = "__base__/sound/lab.ogg",
        volume = 0.7,
        modifiers = { volume_multiplier("main-menu", 2.2), volume_multiplier("tips-and-tricks", 0.8) },
        audible_distance_modifier = 0.7,
      },
      fade_in_ticks = 4,
      fade_out_ticks = 20
    },
    impact_category = "glass",
    open_sound = sounds.lab_open,
    close_sound = sounds.lab_close,
    energy_source =
    {
      type = "electric",
      usage_priority = "secondary-input"
    },
    energy_usage = "60kW",
    researching_speed = 1,
    inputs = {}, -- final-fixes
    module_slots = 2,
    icons_positioning =
    {
      { inventory_index = defines.inventory.lab_modules, shift = { 0, 0.9 } },
      { inventory_index = defines.inventory.lab_input,   shift = { 0, 0 },  max_icons_per_row = 4, separation_multiplier = 1 / 1.1 }
    },
  },
})
