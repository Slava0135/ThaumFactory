local mod_data = require("prototypes.mod-data"):get()

local function arcane_stone_brick_recipe(element)
  data:extend({
    {
      type = "recipe",
      name = "thaumfactory-arcane-stone-brick-" .. element,
      enabled = true, -- TODO
      ingredients =
      {
        { type = "item", name = "stone-brick",                          amount = 1 },
        { type = "item", name = "thaumfactory-" .. element .. "-shard", amount = 1 }
      },
      results = { { type = "item", name = "thaumfactory-arcane-stone-brick", amount = 1 } },
      order = "t-arcane-stone-brick-" .. mod_data.aspects[element].order,
    }
  })
end

arcane_stone_brick_recipe("air")
arcane_stone_brick_recipe("fire")
arcane_stone_brick_recipe("water")
arcane_stone_brick_recipe("earth")
arcane_stone_brick_recipe("order")
arcane_stone_brick_recipe("entropy")

data:extend({
  {
    type = "recipe",
    name = "thaumfactory-alchemical-furnace",
    ingredients = {
      { type = "item", name = "iron-plate",                      amount = 6 },
      { type = "item", name = "thaumfactory-arcane-stone-brick", amount = 10 },
      { type = "item", name = "pipe",                            amount = 12 }
    },
    results = { { type = "item", name = "thaumfactory-alchemical-furnace", amount = 1 } },
    enabled = true -- TODO
  },
  {
    type = "recipe",
    name = "thaumfactory-alchemical-centrifuge",
    ingredients = {
      -- TODO
      { type = "item", name = "thaumfactory-arcane-stone-brick", amount = 1 },
    },
    results = { { type = "item", name = "thaumfactory-alchemical-centrifuge", amount = 1 } },
    enabled = true -- TODO
  },
  {
    type = "recipe",
    name = "thaumfactory-arcane-fabricator",
    ingredients = {
      -- TODO
      { type = "item", name = "thaumfactory-arcane-stone-brick", amount = 1 },
    },
    results = { { type = "item", name = "thaumfactory-arcane-fabricator", amount = 1 } },
    enabled = true -- TODO
  },
  {
    type = "recipe",
    name = "thaumfactory-fire-firearm-magazine-shard",
    ingredients = {
      { type = "item", name = "firearm-magazine",        amount = 1 },
      { type = "item", name = "thaumfactory-fire-shard", amount = 1 },
    },
    results = { { type = "item", name = "thaumfactory-fire-firearm-magazine", amount = 1 } },
    enabled = true -- TODO
  },
  {
    type = "recipe",
    name = "thaumfactory-fire-firearm-magazine-aspect",
    category = "thaumfactory-fabricate",
    ingredients = {
      { type = "item",  name = "firearm-magazine",         amount = 1 },
      { type = "fluid", name = "thaumfactory-aspect-fire", amount = 1 },
    },
    results = { { type = "item", name = "thaumfactory-fire-firearm-magazine", amount = 1 } },
    enabled = true -- TODO
  },
  {
    type = "recipe",
    name = "thaumfactory-air-firearm-magazine-shard",
    ingredients = {
      { type = "item", name = "firearm-magazine",       amount = 1 },
      { type = "item", name = "thaumfactory-air-shard", amount = 1 },
    },
    results = { { type = "item", name = "thaumfactory-air-firearm-magazine", amount = 1 } },
    enabled = true -- TODO
  },
  {
    type = "recipe",
    name = "thaumfactory-air-firearm-magazine-aspect",
    category = "thaumfactory-fabricate",
    ingredients = {
      { type = "item",  name = "firearm-magazine",        amount = 1 },
      { type = "fluid", name = "thaumfactory-aspect-air", amount = 1 },
    },
    results = { { type = "item", name = "thaumfactory-air-firearm-magazine", amount = 1 } },
    enabled = true -- TODO
  },
  {
    type = "recipe",
    name = "thaumfactory-alumentum",
    category = "thaumfactory-fabricate",
    ingredients = {
      { type = "item",  name = "coal",                        amount = 1 },
      { type = "fluid", name = "thaumfactory-aspect-fire",    amount = 3 },
      { type = "fluid", name = "thaumfactory-aspect-entropy", amount = 3 },
      { type = "fluid", name = "thaumfactory-aspect-energy",  amount = 3 },
    },
    results = { { type = "item", name = "thaumfactory-alumentum", amount = 1 } },
    enabled = true -- TODO
  },
  {
    type = "recipe",
    name = "thaumfactory-native-iron-cluster",
    category = "thaumfactory-fabricate",
    ingredients = {
      { type = "item",  name = "iron-ore",                  amount = 1 },
      { type = "fluid", name = "thaumfactory-aspect-metal", amount = 1 },
      { type = "fluid", name = "thaumfactory-aspect-order", amount = 1 },
    },
    results = { { type = "item", name = "thaumfactory-native-iron-cluster", amount = 1 } },
    enabled = true -- TODO
  },
  {
    type = "recipe",
    name = "thaumfactory-native-iron-cluster-smelt",
    category = "smelting",
    auto_recycle = false,
    energy_required = 3.2,
    ingredients = { { type = "item", name = "thaumfactory-native-iron-cluster", amount = 1 } },
    results = { { type = "item", name = "iron-plate", amount = 2 } },
    allow_productivity = true,
    enabled = true -- TODO
  },
  {
    type = "recipe",
    name = "thaumfactory-native-copper-cluster",
    category = "thaumfactory-fabricate",
    ingredients = {
      { type = "item",  name = "copper-ore",                amount = 1 },
      { type = "fluid", name = "thaumfactory-aspect-metal", amount = 1 },
      { type = "fluid", name = "thaumfactory-aspect-order", amount = 1 },
    },
    results = { { type = "item", name = "thaumfactory-native-copper-cluster", amount = 1 } },
    enabled = true -- TODO
  },
  {
    type = "recipe",
    name = "thaumfactory-native-copper-cluster-smelt",
    category = "smelting",
    auto_recycle = false,
    energy_required = 3.2,
    ingredients = { { type = "item", name = "thaumfactory-native-copper-cluster", amount = 1 } },
    results = { { type = "item", name = "copper-plate", amount = 2 } },
    allow_productivity = true,
    enabled = true -- TODO
  },
  {
    type = "recipe",
    name = "thaumfactory-native-uranium-cluster",
    category = "thaumfactory-fabricate",
    ingredients = {
      { type = "item",  name = "uranium-ore",                amount = 1 },
      { type = "fluid", name = "thaumfactory-aspect-energy", amount = 3 },
      { type = "fluid", name = "thaumfactory-aspect-light",  amount = 1 },
      { type = "fluid", name = "thaumfactory-aspect-order",  amount = 1 },
    },
    results = { { type = "item", name = "thaumfactory-native-uranium-cluster", amount = 1 } },
    enabled = true -- TODO
  },
  {
    type = "recipe",
    name = "thaumfactory-native-uranium-processing",
    energy_required = 12,
    auto_recycle = false,
    category = "centrifuging",
    ingredients = { { type = "item", name = "thaumfactory-native-uranium-cluster", amount = 10 } },
    icon = "__base__/graphics/icons/uranium-processing.png",
    subgroup = "uranium-processing",
    order = "a[uranium-processing]-a[uranium-processing]-native",
    results =
    {
      {
        type = "item",
        name = "uranium-235",
        probability = 0.007,
        amount = 2
      },
      {
        type = "item",
        name = "uranium-238",
        probability = 0.993,
        amount = 2
      }
    },
    allow_productivity = true,
    enabled = true -- TODO
  },
})
