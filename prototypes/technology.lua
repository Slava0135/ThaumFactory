local util = require("__core__.lualib.util")

local function element_tech(element)
  local tech = "thaumfactory-aspect-" .. element
  data:extend({
    {
      type = "technology",
      name = tech,
      icons = {
        {
          icon = "__thaumfactory__/graphics/technologies/" .. element .. ".png",
          icon_size = 256,
          tint = util.color("#800080")
        }
      },
      icon = "__thaumfactory__/graphics/technologies/" .. element .. ".png",
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
    icons = {
      {
        icon = "__thaumfactory__/graphics/technologies/arcane-lab.png",
        icon_size = 256,
        tint = util.color("#800080")
      }
    },
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
    icons = {
      {
        icon = "__thaumfactory__/graphics/technologies/arcane-fabricator.png",
        icon_size = 256,
        tint = util.color("#800080")
      }
    },
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
    icons = {
      {
        icon = "__thaumfactory__/graphics/technologies/crystallization.png",
        icon_size = 256,
        tint = util.color("#800080")
      }
    },
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
    icons = {
      {
        icon = "__thaumfactory__/graphics/technologies/alchemical-furnace.png",
        icon_size = 256,
        tint = util.color("#800080")
      }
    },
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
    icons = {
      {
        icon = "__thaumfactory__/graphics/technologies/alchemical-centrifuge.png",
        icon_size = 256,
        tint = util.color("#800080")
      }
    },
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
    icons = {
      {
        icon = "__thaumfactory__/graphics/technologies/aura-pylon.png",
        icon_size = 256,
        tint = util.color("#800080")
      }
    },
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
    icons = {
      {
        icon = "__thaumfactory__/graphics/technologies/aura-pylon.png",
        icon_size = 256,
        tint = util.color("#800080"),
        scale = 0.5,
        shift = { 128, 64 + 32 },
      },
      {
        icon = "__thaumfactory__/graphics/icons/fire.png",
        scale = 1,
        icon_size = 64,
        shift = { 128, 0 },
      }
    },
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
    icons = {
      {
        icon = "__thaumfactory__/graphics/technologies/aura-pylon.png",
        icon_size = 256,
        tint = util.color("#800080"),
        scale = 0.5,
        shift = { 128, 64 + 32 },
      },
      {
        icon = "__thaumfactory__/graphics/icons/craft.png",
        scale = 1,
        icon_size = 64,
        shift = { 128, 0 },
      }
    },
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
    icons = {
      {
        icon = "__thaumfactory__/graphics/technologies/aura-pylon.png",
        icon_size = 256,
        tint = util.color("#800080"),
        scale = 0.5,
        shift = { 128, 64 + 32 },
      },
      {
        icon = "__thaumfactory__/graphics/icons/plant.png",
        scale = 1,
        icon_size = 64,
        shift = { 128, 0 },
      }
    },
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
    icons = {
      {
        icon = "__thaumfactory__/graphics/technologies/aura-pylon.png",
        icon_size = 256,
        tint = util.color("#800080"),
        scale = 0.5,
        shift = { 128, 64 + 32 },
      },
      {
        icon = "__thaumfactory__/graphics/icons/energy.png",
        scale = 1,
        icon_size = 64,
        shift = { 128, 0 },
      }
    },
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
    icons = {
      {
        icon = "__thaumfactory__/graphics/technologies/aura-pylon.png",
        icon_size = 256,
        tint = util.color("#800080"),
        scale = 0.5,
        shift = { 128, 64 + 32 },
      },
      {
        icon = "__thaumfactory__/graphics/icons/mine.png",
        scale = 1,
        icon_size = 64,
        shift = { 128, 0 },
      }
    },
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
    icons = {
      {
        icon = "__thaumfactory__/graphics/technologies/aura-pylon.png",
        icon_size = 256,
        tint = util.color("#800080"),
        scale = 0.5,
        shift = { 128, 64 + 32 },
      },
      {
        icon = "__thaumfactory__/graphics/icons/earth.png",
        scale = 1,
        icon_size = 64,
        shift = { 128, 0 },
      }
    },
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
    icons = {
      {
        icon = "__thaumfactory__/graphics/technologies/arcane-stone-wall.png",
        icon_size = 256,
        tint = util.color("#800080")
      }
    },
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
    name = "thaumfactory-aspect-firearm-magazine",
    icons = {
      {
        icon = "__base__/graphics/technology/military.png",
        icon_size = 256,
        scale = 0.5,
        shift = { 128, 64 + 32 },
      },
      {
        icon = "__thaumfactory__/graphics/icons/magic.png",
        scale = 1,
        tint = util.color("#800080"),
        icon_size = 64,
        shift = { 128, 0 },
      }
    },
    effects =
    {
      {
        type = "unlock-recipe",
        recipe = "thaumfactory-fire-firearm-magazine"
      },
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
    name = "thaumfactory-alumentum",
    icons = {
      {
        icon = "__thaumfactory__/graphics/technologies/alumentum.png",
        icon_size = 256,
        tint = util.color("#800080")
      }
    },
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
    icons = {
      {
        icon = "__thaumfactory__/graphics/technologies/alchemical-furnace.png",
        icon_size = 256,
        tint = util.color("#800080"),
        scale = 0.5,
        shift = { 128, 64 + 32 },
      },
      {
        icon = "__base__/graphics/icons/iron-ore.png",
        icon_size = 64,
        scale = 1,
        shift = { 128, 0 },
      }
    },
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
    icons = {
      {
        icon = "__thaumfactory__/graphics/technologies/alchemical-furnace.png",
        icon_size = 256,
        tint = util.color("#800080"),
        scale = 0.5,
        shift = { 128, 64 + 32 },
      },
      {
        icon = "__base__/graphics/icons/copper-ore.png",
        icon_size = 64,
        scale = 1,
        shift = { 128, 0 },
      }
    },
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
    icons = {
      {
        icon = "__thaumfactory__/graphics/technologies/alchemical-furnace.png",
        icon_size = 256,
        tint = util.color("#800080"),
        scale = 0.5,
        shift = { 128, 64 + 32 },
      },
      {
        icon = "__base__/graphics/icons/uranium-ore.png",
        icon_size = 64,
        scale = 1,
        shift = { 128, 0 },
      }
    },
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
    icons = {
      {
        icon = "__thaumfactory__/graphics/technologies/runes.png",
        icon_size = 256,
        tint = util.color("#800080")
      }
    },
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
    icons = {
      {
        icon = "__thaumfactory__/graphics/technologies/runes.png",
        icon_size = 256,
        tint = util.color("#800080"),
        scale = 0.5,
        shift = { 128, 64 + 32 },
      },
      {
        icon = "__thaumfactory__/graphics/icons/fire.png",
        icon_size = 64,
        scale = 1,
        shift = { 128, 0 },
      }
    },
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
    icons = {
      {
        icon = "__thaumfactory__/graphics/technologies/runes.png",
        icon_size = 256,
        tint = util.color("#800080"),
        scale = 0.5,
        shift = { 128, 64 + 32 },
      },
      {
        icon = "__thaumfactory__/graphics/icons/life.png",
        icon_size = 64,
        scale = 1,
        shift = { 128, 0 },
      }
    },
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
    icons = {
      {
        icon = "__thaumfactory__/graphics/technologies/runes.png",
        icon_size = 256,
        tint = util.color("#800080"),
        scale = 0.5,
        shift = { 128, 64 + 32 },
      },
      {
        icon = "__thaumfactory__/graphics/icons/motion.png",
        icon_size = 64,
        scale = 1,
        shift = { 128, 0 },
      }
    },
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
    icons = {
      {
        icon = "__thaumfactory__/graphics/technologies/runes.png",
        icon_size = 256,
        tint = util.color("#800080"),
        scale = 0.5,
        shift = { 128, 64 + 32 },
      },
      {
        icon = "__thaumfactory__/graphics/icons/order.png",
        icon_size = 64,
        scale = 1,
        shift = { 128, 0 },
      }
    },
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
    icons = {
      {
        icon = "__thaumfactory__/graphics/technologies/runes.png",
        icon_size = 256,
        tint = util.color("#800080"),
        scale = 0.5,
        shift = { 128, 64 + 32 },
      },
      {
        icon = "__thaumfactory__/graphics/icons/light.png",
        icon_size = 64,
        scale = 1,
        shift = { 128, 0 },
      }
    },
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
    icons = {
      {
        icon = "__thaumfactory__/graphics/technologies/runes.png",
        icon_size = 256,
        tint = util.color("#800080"),
        scale = 0.5,
        shift = { 128, 64 + 32 },
      },
      {
        icon = "__thaumfactory__/graphics/icons/mine.png",
        icon_size = 64,
        scale = 1,
        shift = { 128, 0 },
      }
    },
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
    icons = {
      {
        icon = "__thaumfactory__/graphics/technologies/runes.png",
        icon_size = 256,
        tint = util.color("#800080"),
        scale = 0.5,
        shift = { 128, 64 + 32 },
      },
      {
        icon = "__thaumfactory__/graphics/icons/tool.png",
        icon_size = 64,
        scale = 1,
        shift = { 128, 0 },
      }
    },
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
    icons = {
      {
        icon = "__thaumfactory__/graphics/technologies/runes.png",
        icon_size = 256,
        tint = util.color("#800080"),
        scale = 0.5,
        shift = { 128, 64 + 32 },
      },
      {
        icon = "__thaumfactory__/graphics/icons/craft.png",
        icon_size = 64,
        scale = 1,
        shift = { 128, 0 },
      }
    },
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
