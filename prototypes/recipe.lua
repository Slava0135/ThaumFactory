local mod_data = require("prototypes.mod-data"):get()

local function arcane_stone_brick_recipe(element)
  data:extend({
    {
      type = "recipe",
      name = "thaumfactory-arcane-stone-brick-" .. element,
      energy_required = 1,
      ingredients =
      {
        { type = "item", name = "stone-brick",                          amount = 1 },
        { type = "item", name = "thaumfactory-" .. element .. "-shard", amount = 1 }
      },
      results = { { type = "item", name = "thaumfactory-arcane-stone-brick", amount = 1 } },
      allow_productivity = true,
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

-- not using steel in recipes because it has worse magic properties than iron, very important :)
data:extend({
  {
    type = "recipe",
    name = "thaumfactory-alchemical-furnace",
    energy_required = 3,
    -- same ingredients as furnace + some pipes
    ingredients = {
      { type = "item", name = "iron-plate",                      amount = 6 },
      { type = "item", name = "thaumfactory-arcane-stone-brick", amount = 10 },
      { type = "item", name = "pipe",                            amount = 12 }
    },
    results = { { type = "item", name = "thaumfactory-alchemical-furnace", amount = 1 } },
  },
  {
    type = "recipe",
    name = "thaumfactory-alchemical-centrifuge",
    category = "thaumfactory-fabricate",
    energy_required = 3,
    ingredients = {
      { type = "item",  name = "iron-plate",                      amount = 24 },
      { type = "item",  name = "thaumfactory-arcane-stone-brick", amount = 10 },
      { type = "item",  name = "pipe",                            amount = 12 },
      { type = "fluid", name = "thaumfactory-aspect-order",       amount = 6 },
      { type = "fluid", name = "thaumfactory-aspect-water",       amount = 6 },
      { type = "fluid", name = "thaumfactory-aspect-entropy",     amount = 6 },
    },
    results = { { type = "item", name = "thaumfactory-alchemical-centrifuge", amount = 1 } },
  },
  {
    type = "recipe",
    name = "thaumfactory-arcane-fabricator",
    energy_required = 0.5,
    ingredients = {
      { type = "item", name = "iron-plate",                      amount = 15 },
      { type = "item", name = "thaumfactory-arcane-stone-brick", amount = 15 },
      { type = "item", name = "pipe",                            amount = 24 },
      { type = "item", name = "iron-gear-wheel",                 amount = 5 },
    },
    results = { { type = "item", name = "thaumfactory-arcane-fabricator", amount = 1 } },
  },
  {
    type = "recipe",
    name = "thaumfactory-aura-pylon",
    category = "thaumfactory-fabricate",
    energy_required = 15,
    ingredients = {
      { type = "item",  name = "iron-plate",                      amount = 20 },
      { type = "item",  name = "thaumfactory-arcane-stone-brick", amount = 10 },
      { type = "item",  name = "pipe",                            amount = 4 },
      { type = "item",  name = "iron-stick",                      amount = 10 },
      { type = "fluid", name = "thaumfactory-aspect-water",       amount = 40 },
      { type = "fluid", name = "thaumfactory-aspect-exchange",    amount = 40 },
      { type = "fluid", name = "thaumfactory-aspect-machine",     amount = 40 },
    },
    results = { { type = "item", name = "thaumfactory-aura-pylon", amount = 1 } },
  },
  {
    type = "recipe",
    name = "thaumfactory-arcane-lab",
    energy_required = 2,
    ingredients =
    {
      { type = "item", name = "iron-plate",                      amount = 10 },
      { type = "item", name = "thaumfactory-arcane-stone-brick", amount = 10 },
      { type = "item", name = "iron-gear-wheel",                 amount = 4 },
    },
    results = { { type = "item", name = "thaumfactory-arcane-lab", amount = 1 } },
  },
  {
    type = "recipe",
    name = "thaumfactory-arcane-stone-wall",
    ingredients =
    {
      { type = "item", name = "thaumfactory-arcane-stone-brick", amount = 5 },
    },
    results = { { type = "item", name = "thaumfactory-arcane-stone-wall", amount = 1 } },
  },
  {
    type = "recipe",
    name = "thaumfactory-fire-firearm-magazine",
    energy_required = 1,
    ingredients = {
      { type = "item", name = "firearm-magazine",        amount = 1 },
      { type = "item", name = "thaumfactory-fire-shard", amount = 1 },
    },
    results = { { type = "item", name = "thaumfactory-fire-firearm-magazine", amount = 1 } },
  },
  {
    type = "recipe",
    name = "thaumfactory-air-firearm-magazine",
    energy_required = 1,
    ingredients = {
      { type = "item", name = "firearm-magazine",       amount = 1 },
      { type = "item", name = "thaumfactory-air-shard", amount = 1 },
    },
    results = { { type = "item", name = "thaumfactory-air-firearm-magazine", amount = 1 } },
  },
  {
    type = "recipe",
    name = "thaumfactory-alumentum",
    category = "thaumfactory-fabricate",
    energy_required = 1,
    ingredients = {
      { type = "item",  name = "coal",                        amount = 1 },
      { type = "fluid", name = "thaumfactory-aspect-fire",    amount = 3 },
      { type = "fluid", name = "thaumfactory-aspect-entropy", amount = 3 },
      { type = "fluid", name = "thaumfactory-aspect-energy",  amount = 3 },
    },
    results = { { type = "item", name = "thaumfactory-alumentum", amount = 1 } },
  },
  {
    type = "recipe",
    name = "thaumfactory-native-iron-cluster",
    category = "thaumfactory-fabricate",
    energy_required = 1,
    ingredients = {
      { type = "item",  name = "iron-ore",                  amount = 1 },
      { type = "fluid", name = "thaumfactory-aspect-metal", amount = 1 },
      { type = "fluid", name = "thaumfactory-aspect-order", amount = 1 },
    },
    results = { { type = "item", name = "thaumfactory-native-iron-cluster", amount = 1 } },
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
  },
  {
    type = "recipe",
    name = "thaumfactory-native-copper-cluster",
    category = "thaumfactory-fabricate",
    energy_required = 1,
    ingredients = {
      { type = "item",  name = "copper-ore",                amount = 1 },
      { type = "fluid", name = "thaumfactory-aspect-metal", amount = 1 },
      { type = "fluid", name = "thaumfactory-aspect-order", amount = 1 },
    },
    results = { { type = "item", name = "thaumfactory-native-copper-cluster", amount = 1 } },
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
  },
  {
    type = "recipe",
    name = "thaumfactory-native-uranium-cluster",
    category = "thaumfactory-fabricate",
    energy_required = 1,
    ingredients = {
      { type = "item",  name = "uranium-ore",                amount = 1 },
      { type = "fluid", name = "thaumfactory-aspect-energy", amount = 3 },
      { type = "fluid", name = "thaumfactory-aspect-light",  amount = 1 },
      { type = "fluid", name = "thaumfactory-aspect-order",  amount = 1 },
    },
    results = { { type = "item", name = "thaumfactory-native-uranium-cluster", amount = 1 } },
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
  },
  {
    type = "recipe",
    name = "thaumfactory-fire-rune-stone",
    category = "thaumfactory-fabricate",
    enabled = true, -- TODO
    energy_required = 60,
    ingredients =
    {
      { type = "item",  name = "thaumfactory-arcane-stone-brick", amount = 1 },
      { type = "fluid", name = "thaumfactory-aspect-fire",        amount = 720 },
    },
    results = { { type = "item", name = "thaumfactory-fire-rune-stone", amount = 1 } },
  },
  {
    type = "recipe",
    name = "thaumfactory-life-rune-stone",
    category = "thaumfactory-fabricate",
    enabled = true, -- TODO
    energy_required = 60,
    ingredients =
    {
      { type = "item",  name = "thaumfactory-arcane-stone-brick", amount = 1 },
      { type = "fluid", name = "thaumfactory-aspect-life",        amount = 720 },
    },
    results = { { type = "item", name = "thaumfactory-life-rune-stone", amount = 1 } },
  },
  {
    type = "recipe",
    name = "thaumfactory-motion-rune-stone",
    category = "thaumfactory-fabricate",
    enabled = true, -- TODO
    energy_required = 60,
    ingredients =
    {
      { type = "item",  name = "thaumfactory-arcane-stone-brick", amount = 1 },
      { type = "fluid", name = "thaumfactory-aspect-motion",      amount = 720 },
    },
    results = { { type = "item", name = "thaumfactory-motion-rune-stone", amount = 1 } },
  },
  {
    type = "recipe",
    name = "thaumfactory-order-rune-stone",
    category = "thaumfactory-fabricate",
    enabled = true, -- TODO
    energy_required = 60,
    ingredients =
    {
      { type = "item",  name = "thaumfactory-arcane-stone-brick", amount = 1 },
      { type = "fluid", name = "thaumfactory-aspect-order",       amount = 720 },
    },
    results = { { type = "item", name = "thaumfactory-order-rune-stone", amount = 1 } },
  },
  {
    type = "recipe",
    name = "thaumfactory-light-rune-stone",
    category = "thaumfactory-fabricate",
    enabled = true, -- TODO
    energy_required = 60,
    ingredients =
    {
      { type = "item",  name = "thaumfactory-arcane-stone-brick", amount = 1 },
      { type = "fluid", name = "thaumfactory-aspect-light",       amount = 720 },
    },
    results = { { type = "item", name = "thaumfactory-light-rune-stone", amount = 1 } },
  },
  {
    type = "recipe",
    name = "thaumfactory-mine-rune-stone",
    category = "thaumfactory-fabricate",
    enabled = true, -- TODO
    energy_required = 60,
    ingredients =
    {
      { type = "item",  name = "thaumfactory-arcane-stone-brick", amount = 1 },
      { type = "fluid", name = "thaumfactory-aspect-mine",        amount = 720 },
    },
    results = { { type = "item", name = "thaumfactory-mine-rune-stone", amount = 1 } },
  },
  {
    type = "recipe",
    name = "thaumfactory-tool-rune-stone",
    category = "thaumfactory-fabricate",
    enabled = true, -- TODO
    energy_required = 60,
    ingredients =
    {
      { type = "item",  name = "thaumfactory-arcane-stone-brick", amount = 1 },
      { type = "fluid", name = "thaumfactory-aspect-tool",        amount = 720 },
    },
    results = { { type = "item", name = "thaumfactory-tool-rune-stone", amount = 1 } },
  },
  {
    type = "recipe",
    name = "thaumfactory-craft-rune-stone",
    category = "thaumfactory-fabricate",
    enabled = true, -- TODO
    energy_required = 60,
    ingredients =
    {
      { type = "item",  name = "thaumfactory-arcane-stone-brick", amount = 1 },
      { type = "fluid", name = "thaumfactory-aspect-craft",       amount = 720 },
    },
    results = { { type = "item", name = "thaumfactory-craft-rune-stone", amount = 1 } },
  },
})
