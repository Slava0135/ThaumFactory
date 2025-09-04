local item_sounds = require("__base__.prototypes.item_sounds")

data:extend({
  {
    type = "tool",
    name = "thaumfactory-fire-rune-stone",
    icons = {
      {
        icon = "__thaumfactory__/graphics/icons/rune.png",
      },
      {
        icon = "__thaumfactory__/graphics/icons/fire.png",
        icon_size = 64,
        scale = 0.25,
      }
    },
    subgroup = "thaumfactory-runes",
    order = "t-fire-rune-stone",
    inventory_move_sound = item_sounds.brick_inventory_move,
    pick_sound = item_sounds.brick_inventory_pickup,
    drop_sound = item_sounds.brick_inventory_move,
    stack_size = 1,
    durability = 720,
  },
  {
    type = "tool",
    name = "thaumfactory-life-rune-stone",
    icons = {
      {
        icon = "__thaumfactory__/graphics/icons/rune.png",
      },
      {
        icon = "__thaumfactory__/graphics/icons/life.png",
        icon_size = 64,
        scale = 0.25,
      }
    },
    subgroup = "thaumfactory-runes",
    order = "t-life-rune-stone",
    inventory_move_sound = item_sounds.brick_inventory_move,
    pick_sound = item_sounds.brick_inventory_pickup,
    drop_sound = item_sounds.brick_inventory_move,
    stack_size = 1,
    durability = 720,
  },
})
