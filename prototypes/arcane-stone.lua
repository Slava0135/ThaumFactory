local item_sounds = require("__base__.prototypes.item_sounds")

data:extend({
  {
    type = "item",
    name = "thaumfactory-arcane-stone-brick",
    icon = "__base__/graphics/icons/stone-brick.png",
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
  },
})
