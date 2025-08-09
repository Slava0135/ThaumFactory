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
})
