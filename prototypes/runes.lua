local item_sounds = require("__base__.prototypes.item_sounds")

data:extend({
  {
    type = "tool",
    name = "thaumfactory-fire-rune-stone",
    icons = {
      {
        icon = "__base__/graphics/icons/stone-brick.png",
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
})
