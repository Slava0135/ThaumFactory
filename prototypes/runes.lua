local item_sounds = require("__base__.prototypes.item_sounds")
local mod_data = require("prototypes.mod-data"):get()

local function rune(element)
  local order = mod_data.aspects[element].order
  local tier = mod_data.aspects[element].tier
  data:extend({
    {
      type = "tool",
      name = "thaumfactory-" .. element .. "-rune-stone",
      icons = {
        {
          icon = "__thaumfactory__/graphics/icons/rune.png",
        },
        {
          icon = "__thaumfactory__/graphics/icons/" .. element .. ".png",
          icon_size = 64,
          scale = 0.25,
        }
      },
      subgroup = "thaumfactory-runes",
      order = "t-" .. tier .. "-" .. order .. "-rune-stone",
      inventory_move_sound = item_sounds.brick_inventory_move,
      pick_sound = item_sounds.brick_inventory_pickup,
      drop_sound = item_sounds.brick_inventory_move,
      stack_size = 1,
      durability = 720,
    }
  })
end

rune("fire")
rune("life")
rune("order")
rune("motion")
rune("light")
rune("mine")
rune("craft")
rune("tool")
