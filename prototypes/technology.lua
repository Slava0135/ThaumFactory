local STUB = "__base__/graphics/technology/automation-science-pack.png"

local function element_tech(element)
  local tech = "thaumfactory-aspect-" .. element
  data:extend({
    {
      type = "technology",
      name = tech,
      icon = STUB,
      icon_size = 256,
      effects =
      {
        {
          type = "unlock-recipe",
          recipe = "thaumfactory-arcane-stone-brick-" .. element,
        },
      },
      research_trigger =
      {
        type = "mine-entity",
        entity = "thaumfactory-" .. element .. "-infused-stone",
      }
    },
  })
  return tech
end

local air_tech = element_tech("air")
local fire_tech = element_tech("fire")
local water_tech = element_tech("water")
local earth_tech = element_tech("earth")
local order_tech = element_tech("order")
local entropy_tech = element_tech("entropy")

data:extend({
  {
    type = "technology",
    name = "thaumfactory-arcane-lab",
    icon = STUB,
    icon_size = 256,
    effects =
    {
      {
        type = "unlock-recipe",
        recipe = "thaumfactory-arcane-lab"
      },
    },
    prerequisites = { air_tech, fire_tech, water_tech, earth_tech, order_tech, entropy_tech, "steam-power", "electronics" },
    research_trigger =
    {
      type = "craft-item",
      item = "thaumfactory-arcane-stone-brick",
      count = 10
    }
  },
  {
    type = "technology",
    name = "thaumfactory-arcane-fabricator",
    icon = STUB,
    icon_size = 256,
    effects =
    {
      {
        type = "unlock-recipe",
        recipe = "thaumfactory-arcane-fabricator"
      },
    },
    prerequisites = { "thaumfactory-arcane-lab" },
    unit =
    {
      count = 24,
      ingredients =
      {
        { "thaumfactory-air-shard",     1 },
        { "thaumfactory-fire-shard",    1 },
        { "thaumfactory-water-shard",   1 },
        { "thaumfactory-earth-shard",   1 },
        { "thaumfactory-entropy-shard", 1 },
        { "thaumfactory-order-shard",   1 },
      },
      time = 5
    },
  },
  {
    type = "technology",
    name = "thaumfactory-crystallization",
    icon = STUB,
    icon_size = 256,
    effects = {}, -- final-fixes
    prerequisites = { "thaumfactory-arcane-fabricator", "thaumfactory-alchemical-furnace" },
    unit =
    {
      count = 120,
      ingredients =
      {
        { "thaumfactory-air-shard",     1 },
        { "thaumfactory-fire-shard",    1 },
        { "thaumfactory-water-shard",   1 },
        { "thaumfactory-earth-shard",   1 },
        { "thaumfactory-entropy-shard", 1 },
        { "thaumfactory-order-shard",   1 },
      },
      time = 5
    },
  },
  {
    type = "technology",
    name = "thaumfactory-alchemical-furnace",
    icon = STUB,
    icon_size = 256,
    effects =
    {
      {
        type = "unlock-recipe",
        recipe = "thaumfactory-alchemical-furnace"
      },
    },
    prerequisites = { "thaumfactory-arcane-lab" },
    unit =
    {
      count = 40,
      ingredients =
      {
        { "thaumfactory-earth-shard", 1 },
        { "thaumfactory-fire-shard",  1 },
        { "thaumfactory-water-shard", 1 },
      },
      time = 5
    },
  },
  {
    type = "technology",
    name = "thaumfactory-alchemical-centrifuge",
    icon = STUB,
    icon_size = 256,
    effects =
    {
      {
        type = "unlock-recipe",
        recipe = "thaumfactory-alchemical-centrifuge"
      },
    },
    prerequisites = { "thaumfactory-crystallization" },
    unit =
    {
      count = 720,
      ingredients =
      {
        { "thaumfactory-order-crystal",   2 },
        { "thaumfactory-water-crystal",   4 },
        { "thaumfactory-entropy-crystal", 2 },
      },
      time = 5
    },
  },
  {
    type = "technology",
    name = "thaumfactory-aura-pylon",
    icon = STUB,
    icon_size = 256,
    effects =
    {
      {
        type = "unlock-recipe",
        recipe = "thaumfactory-aura-pylon"
      },
    },
    prerequisites = { "thaumfactory-crystallization" },
    unit =
    {
      count = 1680,
      ingredients =
      {
        { "thaumfactory-water-crystal",    2 },
        { "thaumfactory-exchange-crystal", 1 },
        { "thaumfactory-machine-crystal",  1 },
      },
      time = 5
    },
  },
  {
    type = "technology",
    name = "thaumfactory-aura-pylon-fire",
    icon = STUB,
    icon_size = 256,
    effects = {},
    prerequisites = { "thaumfactory-aura-pylon" },
    unit =
    {
      count = 1,
      ingredients = {},
      time = 1,
    },
  },
  {
    type = "technology",
    name = "thaumfactory-aura-pylon-craft",
    icon = STUB,
    icon_size = 256,
    effects = {},
    prerequisites = { "thaumfactory-aura-pylon" },
    unit =
    {
      count = 1,
      ingredients = {},
      time = 1,
    },
  },
  {
    type = "technology",
    name = "thaumfactory-aura-pylon-plant",
    icon = STUB,
    icon_size = 256,
    effects = {},
    prerequisites = { "thaumfactory-aura-pylon" },
    unit =
    {
      count = 1,
      ingredients = {},
      time = 1,
    },
  },
  {
    type = "technology",
    name = "thaumfactory-aura-pylon-energy",
    icon = STUB,
    icon_size = 256,
    effects = {},
    prerequisites = { "thaumfactory-aura-pylon" },
    unit =
    {
      count = 1,
      ingredients = {},
      time = 1,
    },
  },
  {
    type = "technology",
    name = "thaumfactory-aura-pylon-mine",
    icon = STUB,
    icon_size = 256,
    effects = {},
    prerequisites = { "thaumfactory-aura-pylon" },
    unit =
    {
      count = 1,
      ingredients = {},
      time = 1,
    },
  },
  {
    type = "technology",
    name = "thaumfactory-aura-pylon-earth",
    icon = STUB,
    icon_size = 256,
    effects = {},
    prerequisites = { "thaumfactory-aura-pylon" },
    unit =
    {
      count = 1,
      ingredients = {},
      time = 1,
    },
  },
  {
    type = "technology",
    name = "thaumfactory-arcane-stone-wall",
    icon = STUB,
    icon_size = 256,
    effects =
    {
      {
        type = "unlock-recipe",
        recipe = "thaumfactory-arcane-stone-wall"
      },
    },
    prerequisites = { "thaumfactory-arcane-lab", "stone-wall" },
    unit =
    {
      count = 24,
      ingredients =
      {
        { "thaumfactory-air-shard",     1 },
        { "thaumfactory-fire-shard",    1 },
        { "thaumfactory-water-shard",   1 },
        { "thaumfactory-earth-shard",   1 },
        { "thaumfactory-entropy-shard", 1 },
        { "thaumfactory-order-shard",   1 },
      },
      time = 5
    },
  },
  {
    type = "technology",
    name = "thaumfactory-fire-firearm-magazine",
    icon = STUB,
    icon_size = 256,
    effects =
    {
      {
        type = "unlock-recipe",
        recipe = "thaumfactory-fire-firearm-magazine"
      },
    },
    prerequisites = { "thaumfactory-arcane-lab", "military" },
    unit =
    {
      count = 120,
      ingredients =
      {
        { "thaumfactory-fire-shard", 1 },
      },
      time = 5
    },
  },
  {
    type = "technology",
    name = "thaumfactory-air-firearm-magazine",
    icon = STUB,
    icon_size = 256,
    effects =
    {
      {
        type = "unlock-recipe",
        recipe = "thaumfactory-air-firearm-magazine"
      },
    },
    prerequisites = { "thaumfactory-arcane-lab", "military" },
    unit =
    {
      count = 120,
      ingredients =
      {
        { "thaumfactory-air-shard", 1 },
      },
      time = 5
    },
  },
  {
    type = "technology",
    name = "thaumfactory-alumentum",
    icon = STUB,
    icon_size = 256,
    effects =
    {
      {
        type = "unlock-recipe",
        recipe = "thaumfactory-alumentum"
      },
    },
    prerequisites = { "thaumfactory-crystallization" },
    unit =
    {
      count = 720,
      ingredients =
      {
        { "thaumfactory-fire-crystal",    1 },
        { "thaumfactory-entropy-crystal", 1 },
        { "thaumfactory-energy-crystal",  1 },
      },
      time = 5
    },
  },
  {
    type = "technology",
    name = "thaumfactory-native-iron-cluster",
    icon = STUB,
    icon_size = 256,
    effects =
    {
      {
        type = "unlock-recipe",
        recipe = "thaumfactory-native-iron-cluster"
      },
      {
        type = "unlock-recipe",
        recipe = "thaumfactory-native-iron-cluster-smelt"
      },
    },
    prerequisites = { "thaumfactory-crystallization" },
    unit =
    {
      count = 720,
      ingredients =
      {
        { "thaumfactory-metal-crystal", 1 },
        { "thaumfactory-order-crystal", 1 },
      },
      time = 5
    },
  },
  {
    type = "technology",
    name = "thaumfactory-native-copper-cluster",
    icon = STUB,
    icon_size = 256,
    effects =
    {
      {
        type = "unlock-recipe",
        recipe = "thaumfactory-native-copper-cluster"
      },
      {
        type = "unlock-recipe",
        recipe = "thaumfactory-native-copper-cluster-smelt"
      },
    },
    prerequisites = { "thaumfactory-crystallization" },
    unit =
    {
      count = 720,
      ingredients =
      {
        { "thaumfactory-metal-crystal", 1 },
        { "thaumfactory-order-crystal", 1 },
      },
      time = 5
    },
  },
  {
    type = "technology",
    name = "thaumfactory-native-uranium-cluster",
    icon = STUB,
    icon_size = 256,
    effects =
    {
      {
        type = "unlock-recipe",
        recipe = "thaumfactory-native-uranium-cluster"
      },
      {
        type = "unlock-recipe",
        recipe = "thaumfactory-native-uranium-processing"
      },
    },
    prerequisites = { "thaumfactory-crystallization", "uranium-processing" },
    unit =
    {
      count = 1680,
      ingredients =
      {
        { "thaumfactory-energy-crystal", 3 },
        { "thaumfactory-light-crystal",  1 },
        { "thaumfactory-order-crystal",  1 },
      },
      time = 5
    },
  },
  {
    type = "technology",
    name = "thaumfactory-runes",
    icon = STUB,
    icon_size = 256,
    effects = {},
    prerequisites = { "thaumfactory-crystallization" },
    unit =
    {
      count = 720,
      ingredients =
      {
        { "thaumfactory-magic-crystal", 1 },
      },
      time = 5
    },
  },
  {
    type = "technology",
    name = "thaumfactory-fire-rune-stone",
    icon = STUB,
    icon_size = 256,
    effects =
    {
      {
        type = "unlock-recipe",
        recipe = "thaumfactory-fire-rune-stone"
      },
    },
    prerequisites = { "thaumfactory-runes" },
    unit =
    {
      count = 5040,
      ingredients =
      {
        { "thaumfactory-fire-crystal", 1 },
      },
      time = 5
    },
  },
  {
    type = "technology",
    name = "thaumfactory-life-rune-stone",
    icon = STUB,
    icon_size = 256,
    effects =
    {
      {
        type = "unlock-recipe",
        recipe = "thaumfactory-life-rune-stone"
      },
    },
    prerequisites = { "thaumfactory-runes" },
    unit =
    {
      count = 5040,
      ingredients =
      {
        { "thaumfactory-life-crystal", 1 },
      },
      time = 5
    },
  },
  {
    type = "technology",
    name = "thaumfactory-motion-rune-stone",
    icon = STUB,
    icon_size = 256,
    effects =
    {
      {
        type = "unlock-recipe",
        recipe = "thaumfactory-motion-rune-stone"
      },
    },
    prerequisites = { "thaumfactory-runes" },
    unit =
    {
      count = 5040,
      ingredients =
      {
        { "thaumfactory-motion-crystal", 1 },
      },
      time = 5
    },
  },
  {
    type = "technology",
    name = "thaumfactory-order-rune-stone",
    icon = STUB,
    icon_size = 256,
    effects =
    {
      {
        type = "unlock-recipe",
        recipe = "thaumfactory-order-rune-stone"
      },
    },
    prerequisites = { "thaumfactory-runes" },
    unit =
    {
      count = 5040,
      ingredients =
      {
        { "thaumfactory-order-crystal", 1 },
      },
      time = 5
    },
  },
  {
    type = "technology",
    name = "thaumfactory-light-rune-stone",
    icon = STUB,
    icon_size = 256,
    effects =
    {
      {
        type = "unlock-recipe",
        recipe = "thaumfactory-light-rune-stone"
      },
    },
    prerequisites = { "thaumfactory-runes" },
    unit =
    {
      count = 5040,
      ingredients =
      {
        { "thaumfactory-light-crystal", 1 },
      },
      time = 5
    },
  },
  {
    type = "technology",
    name = "thaumfactory-mine-rune-stone",
    icon = STUB,
    icon_size = 256,
    effects =
    {
      {
        type = "unlock-recipe",
        recipe = "thaumfactory-mine-rune-stone"
      },
    },
    prerequisites = { "thaumfactory-runes" },
    unit =
    {
      count = 5040,
      ingredients =
      {
        { "thaumfactory-mine-crystal", 1 },
      },
      time = 5
    },
  },
  {
    type = "technology",
    name = "thaumfactory-tool-rune-stone",
    icon = STUB,
    icon_size = 256,
    effects =
    {
      {
        type = "unlock-recipe",
        recipe = "thaumfactory-tool-rune-stone"
      },
    },
    prerequisites = { "thaumfactory-runes" },
    unit =
    {
      count = 5040,
      ingredients =
      {
        { "thaumfactory-tool-crystal", 1 },
      },
      time = 5
    },
  },
  {
    type = "technology",
    name = "thaumfactory-craft-rune-stone",
    icon = STUB,
    icon_size = 256,
    effects =
    {
      {
        type = "unlock-recipe",
        recipe = "thaumfactory-craft-rune-stone"
      },
    },
    prerequisites = { "thaumfactory-runes" },
    unit =
    {
      count = 5040,
      ingredients =
      {
        { "thaumfactory-craft-crystal", 1 },
      },
      time = 5
    },
  },
})
