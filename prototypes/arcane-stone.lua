local item_sounds = require("__base__.prototypes.item_sounds")
local sounds = require("__base__.prototypes.entity.sounds")
local tile_collision_masks = require("__base__/prototypes/tile/tile-collision-masks")
local tile_sounds = require("__base__/prototypes/tile/tile-sounds")
local tile_trigger_effects = require("__base__/prototypes/tile/tile-trigger-effects")

data:extend({
  {
    type = "item",
    name = "thaumfactory-arcane-stone-brick",
    icons = {
      {
        icon = "__base__/graphics/icons/stone-brick.png",
        tint = { 95, 95, 95 } -- #5F5F5F
      }
    },
    subgroup = "thaumfactory-components",
    order = "t-arcane-stone-brick",
    inventory_move_sound = item_sounds.brick_inventory_move,
    pick_sound = item_sounds.brick_inventory_pickup,
    drop_sound = item_sounds.brick_inventory_move,
    stack_size = 100,
    place_as_tile =
    {
      result = "thaumfactory-arcane-stone-path",
      condition_size = 1,
      condition = { layers = { water_tile = true } }
    }
  },
  {
    type = "tile",
    name = "thaumfactory-arcane-stone-path",
    order = "a[artificial]-a[tier-1]-a[stone-path]-t-arcane-stone-path",
    subgroup = "artificial-tiles",
    needs_correction = false,
    minable = { mining_time = 0.1, result = "thaumfactory-arcane-stone-brick" },
    mined_sound = sounds.deconstruct_bricks(0.8),
    collision_mask = tile_collision_masks.ground(),
    walking_speed_modifier = 1.4,
    layer = 11,
    layer_group = "ground-artificial",
    decorative_removal_probability = 1.0, -- looks bad with dark
    tint = { 95, 95, 95 }, -- #5F5F5F
    variants =
    {
      main =
      {
        {
          picture = "__base__/graphics/terrain/stone-path/stone-path-1.png",
          count = 16,
          size = 1,
          scale = 0.5
        },
        {
          picture = "__base__/graphics/terrain/stone-path/stone-path-2.png",
          count = 16,
          size = 2,
          probability = 0.39,
          scale = 0.5
        },
        {
          picture = "__base__/graphics/terrain/stone-path/stone-path-4.png",
          count = 16,
          size = 4,
          probability = 1,
          scale = 0.5
        }
      },
      transition =
      {
        overlay_layout =
        {
          inner_corner =
          {
            spritesheet = "__base__/graphics/terrain/stone-path/stone-path-inner-corner.png",
            count = 16,
            tile_height = 2,
            scale = 0.5
          },
          outer_corner =
          {
            spritesheet = "__base__/graphics/terrain/stone-path/stone-path-outer-corner.png",
            count = 8,
            tile_height = 2,
            scale = 0.5
          },
          side =
          {
            spritesheet = "__base__/graphics/terrain/stone-path/stone-path-side.png",
            count = 16,
            tile_height = 2,
            scale = 0.5
          },
          u_transition =
          {
            spritesheet = "__base__/graphics/terrain/stone-path/stone-path-u.png",
            count = 8,
            tile_height = 2,
            scale = 0.5
          },
          o_transition =
          {
            spritesheet = "__base__/graphics/terrain/stone-path/stone-path-o.png",
            count = 4,
            scale = 0.5
          }
        }
      }
    },
    transitions = data.raw["tile"]["stone-path"].transitions,
    transitions_between_transitions = data.raw["tile"]["stone-path"].transitions_between_transitions,

    walking_sound = tile_sounds.walking.concrete,
    driving_sound = tile_sounds.driving.stone,
    build_sound = tile_sounds.building.concrete,
    map_color = { 32, 32, 32 },
    scorch_mark_color = { r = 0.373, g = 0.307, b = 0.243, a = 1.000 },
    vehicle_friction_modifier = 1.1,

    trigger_effect = tile_trigger_effects.stone_path_trigger_effect()
  },
})
