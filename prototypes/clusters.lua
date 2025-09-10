local item_sounds = require("__base__.prototypes.item_sounds")
local util = require("__core__.lualib.util")

data:extend({
  {
    type = "item",
    name = "thaumfactory-native-iron-cluster",
    icons = {
      {
        icon = "__thaumfactory__/graphics/icons/native-cluster.png",
        tint = util.color("#bfd8e3")
      }
    },
    subgroup = "thaumfactory-resources",
    order = "t-native-iron-cluster",
    inventory_move_sound = item_sounds.resource_inventory_move,
    pick_sound = item_sounds.resource_inventory_pickup,
    drop_sound = item_sounds.resource_inventory_move,
    stack_size = 50,
    weight = 2 * kg
  },
  {
    type = "item",
    name = "thaumfactory-native-copper-cluster",
    icons = {
      {
        icon = "__thaumfactory__/graphics/icons/native-cluster.png",
        tint = util.color("#fe9a6c")
      }
    },
    subgroup = "thaumfactory-resources",
    order = "t-native-copper-cluster",
    inventory_move_sound = item_sounds.resource_inventory_move,
    pick_sound = item_sounds.resource_inventory_pickup,
    drop_sound = item_sounds.resource_inventory_move,
    stack_size = 50,
    weight = 2 * kg
  },
  {
    type = "item",
    name = "thaumfactory-native-uranium-cluster",
    icons = {
      {
        icon = "__thaumfactory__/graphics/icons/native-cluster.png",
        tint = util.color("#3EA108")
      },
      {
        icon = "__thaumfactory__/graphics/icons/native-cluster.png",
        tint = { 31, 80, 4, 60 },
        draw_as_light = true
      }
    },
    subgroup = "thaumfactory-resources",
    order = "t-native-uranium-cluster",
    inventory_move_sound = item_sounds.resource_inventory_move,
    pick_sound = item_sounds.resource_inventory_pickup,
    drop_sound = item_sounds.resource_inventory_move,
    stack_size = 50,
    weight = 5 * kg
  },
})
