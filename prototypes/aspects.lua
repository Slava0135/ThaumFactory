local color = require("color")
local mod_data = require("prototypes.mod-data"):get()
local aspects = {}
mod_data.aspects = aspects
local item_aspects = {}
mod_data.item_aspects = item_aspects
local hash = require("hash")

local function aspect(element, color, tier, component1, component2)
  -- aspects are ordered by tier
  -- aspects are additionally ordered by hash based on their names
  -- so each one is (very) unlikely to have the same order while avoiding assigning order manually
  local order = hash:hash(element)
  aspects[element] = { color = color, tier = tier, order = order, component1 = component1, component2 = component2 }
  data:extend({
    {
      type = "fluid",
      name = "thaumfactory-aspect-" .. element,
      subgroup = "fluid",
      default_temperature = 25,
      base_color = { color.r, color.g, color.b },
      flow_color = { color.r, color.g, color.b },
      icons = {
        {
          icon = "__thaumfactory__/graphics/icons/" .. element .. ".png",
          icon_size = 64,
          tint = { color.r, color.g, color.b }
        }
      },
      auto_barrel = true,
      order = "t-" .. tier .. "-" .. order
    },
  })
  local crystal_aspects = {}
  crystal_aspects[element] = 1
  item_aspects["thaumfactory-" .. element .. "-crystal"] = crystal_aspects
  data:extend({
    {
      type = "tool",
      name = "thaumfactory-" .. element .. "-crystal",
      durability = 1,
      icons = {
        {
          icon = "__thaumfactory__/graphics/icons/pure-crystal.png",
          tint = { color.r, color.g, color.b },
        }
      },
      subgroup = "thaumfactory-resources",
      order = "t-crystal-" .. tier .. "-" .. order,
      stack_size = 100,
    },
  })
end

-- not all aspects (TC 4) are added, some of them are not used much / removed in TC 6

-- primal
aspect("air", color:hex2rgb("#FFFF7E"), 0)
aspect("fire", color:hex2rgb("#FF5A01"), 0)
aspect("water", color:hex2rgb("#3CD4FC"), 0)
aspect("earth", color:hex2rgb("#56C000"), 0)
aspect("order", color:hex2rgb("#D5D4EC"), 0)
aspect("entropy", color:hex2rgb("#404040"), 0)

-- TODO mod items

-- compound T1
aspect("ice", color:hex2rgb("#E1FFFF"), 1, "fire", "entropy")
aspect("light", color:hex2rgb("#FFF663"), 1, "air", "fire")
aspect("motion", color:hex2rgb("#CDCCF4"), 1, "air", "order")
aspect("exchange", color:hex2rgb("#578357"), 1, "order", "entropy")
aspect("energy", color:hex2rgb("#C0FFFF"), 1, "fire", "order")
aspect("void", color:hex2rgb("#0D0D0D"), 1, "air", "entropy")
aspect("poison", color:hex2rgb("#89F000"), 1, "water", "entropy")
aspect("life", color:hex2rgb("#DE0005"), 1, "water", "earth")
aspect("crystal", color:hex2rgb("#80FFFF"), 1, "order", "earth")

-- compound T2
aspect("beast", color:hex2rgb("#9F6409"), 2, "motion", "life")
aspect("hunger", color:hex2rgb("#9A0305"), 2, "void", "life")
aspect("plant", color:hex2rgb("#01AC00"), 2, "earth", "life")
aspect("travel", color:hex2rgb("#E0585B"), 2, "motion", "earth")
aspect("metal", color:hex2rgb("#B5B5CD"), 2, "earth", "crystal")
aspect("death", color:hex2rgb("#887788"), 2, "entropy", "life")
aspect("magic", color:hex2rgb("#9700C0"), 2, "energy", "void")
aspect("heal", color:hex2rgb("#FF2F34"), 2, "order", "life")
aspect("darkness", color:hex2rgb("#222222"), 2, "light", "void")
aspect("trap", color:hex2rgb("#9A8080"), 2, "motion", "entropy")
aspect("flight", color:hex2rgb("#E7E7D7"), 2, "air", "motion")

-- compound T3
aspect("alien", color:hex2rgb("#805080"), 3, "darkness", "void")
aspect("aura", color:hex2rgb("#FFC0FF"), 3, "air", "magic")
aspect("soul", color:hex2rgb("#3E3E42"), 3, "death", "life")
aspect("taint", color:hex2rgb("#800080"), 3, "entropy", "magic")

-- compound T4
aspect("mind", color:hex2rgb("#FFC2B3"), 4, "fire", "soul")
aspect("senses", color:hex2rgb("#0FD9FF"), 4, "air", "soul")

-- compound T5
aspect("human", color:hex2rgb("#FFD7C0"), 5, "beast", "mind")

-- compound T6
aspect("tool", color:hex2rgb("#4040EE"), 6, "human", "order")
aspect("greed", color:hex2rgb("#E6BE44"), 6, "hunger", "human")
aspect("mine", color:hex2rgb("#DCD2D8"), 6, "human", "earth")

-- compound T7
aspect("craft", color:hex2rgb("#809D80"), 7, "human", "tool")
aspect("machine", color:hex2rgb("#8080A0"), 7, "tool", "motion")
aspect("weapon", color:hex2rgb("#C05050"), 7, "tool", "fire")
aspect("protection", color:hex2rgb("#00C0C0"), 7, "tool", "earth")

-- assign aspects to items

-- N should be multiplication of these numbers: 1, 2, 3, 4, 5, 6, 7 (at most one of each can be used)
--
-- 1 = 1
-- 2 = 1 * 2
-- 6 = 2 * 3
-- 12 = 3 * 4
-- 24 = 4 * 6
-- 40 = 2 * 4 * 5
-- 90 = 3 * 5 * 6
-- 120 = 4 * 5 * 6
-- 720 = 1 * 2 * 3 * 4 * 5 * 6 * 7
-- ...

-- shards
item_aspects["thaumfactory-air-shard"] = { air = 3, magic = 1, crystal = 1 }
item_aspects["thaumfactory-fire-shard"] = { fire = 3, magic = 1, crystal = 1 }
item_aspects["thaumfactory-water-shard"] = { water = 3, magic = 1, crystal = 1 }
item_aspects["thaumfactory-earth-shard"] = { earth = 3, magic = 1, crystal = 1 }
item_aspects["thaumfactory-order-shard"] = { order = 3, magic = 1, crystal = 1 }
item_aspects["thaumfactory-entropy-shard"] = { entropy = 3, magic = 1, crystal = 1 }

-- resources
item_aspects["wood"] = { plant = 6 }
item_aspects["coal"] = { fire = 1, energy = 1 }
item_aspects["stone"] = { entropy = 1, earth = 1 }
item_aspects["iron-ore"] = { metal = 1, earth = 1 }
item_aspects["copper-ore"] = { metal = 1, earth = 1, exchange = 1 }
item_aspects["uranium-ore"] = { earth = 1, energy = 3, light = 1 }
item_aspects["raw-fish"] = { water = 3, life = 2, hunger = 1, heal = 1 }

-- materials
item_aspects["iron-plate"] = { metal = 3 }
item_aspects["copper-plate"] = { metal = 3, exchange = 3 }
item_aspects["steel-plate"] = { metal = 3, order = 3 }
item_aspects["solid-fuel"] = { fire = 3, energy = 3 }
item_aspects["plastic-bar"] = { order = 1 }
item_aspects["sulfur"] = { crystal = 3, poison = 2, earth = 1 }
item_aspects["battery"] = { energy = 6, exchange = 6 }
item_aspects["explosives"] = { entropy = 6, fire = 6 }

-- components
item_aspects["iron-gear-wheel"] = { metal = 3 }
item_aspects["iron-stick"] = { metal = 1 }
item_aspects["copper-cable"] = { metal = 1, exchange = 1 }
item_aspects["copper-cable"] = { metal = 1, exchange = 1 }
item_aspects["barrel"] = { metal = 1, void = 1 }
item_aspects["electronic-circuit"] = { machine = 1, order = 1, exchange = 1 }
item_aspects["advanced-circuit"] = { machine = 2, order = 2, exchange = 2 }
item_aspects["processing-unit"] = { machine = 3, order = 3, exchange = 3 }
item_aspects["engine-unit"] = { machine = 3, motion = 2, metal = 1 }
item_aspects["electric-engine-unit"] = { machine = 6, motion = 4, metal = 2 }
item_aspects["flying-robot-frame"] = { machine = 12, motion = 8, metal = 4 }
item_aspects["low-density-structure"] = { metal = 12 }
item_aspects["rocket-fuel"] = { fire = 40, energy = 40 }

-- uranium
item_aspects["uranium-235"] = { energy = 20, light = 1 }
item_aspects["uranium-238"] = { energy = 3, light = 1 }
item_aspects["uranium-fuel-cell"] = { energy = 40, metal = 3 }
item_aspects["depleted-uranium-fuel-cell"] = { exchange = 40, metal = 3 }
item_aspects["nuclear-fuel"] = { fire = 90, energy = 90 }

-- science
item_aspects["automation-science-pack"] = { mind = 1, craft = 1 }
item_aspects["logistic-science-pack"] = { mind = 2, motion = 3, travel = 1 }
item_aspects["military-science-pack"] = { mind = 3, weapon = 12, protection = 6 }
item_aspects["chemical-science-pack"] = { mind = 6, motion = 3, crystal = 12 }
item_aspects["production-science-pack"] = { mind = 24, craft = 24 }
item_aspects["utility-science-pack"] = { mind = 24, travel = 24 }
item_aspects["space-science-pack"] = { mind = 90, senses = 90, travel = 90, darkness = 90 }

-- storage
item_aspects["wooden-chest"] = { plant = 6, void = 3 }
item_aspects["iron-chest"] = { metal = 6, void = 6 }
item_aspects["steel-chest"] = { metal = 6, order = 6, void = 12 }
item_aspects["storage-tank"] = { metal = 6, order = 6, void = 12 }

-- belts
item_aspects["transport-belt"] = { machine = 1, motion = 3 }
item_aspects["fast-transport-belt"] = { machine = 2, motion = 6 }
item_aspects["express-transport-belt"] = { machine = 3, motion = 12 }
item_aspects["underground-belt"] = { machine = 1, motion = 3, earth = 1, darkness = 1 }
item_aspects["fast-underground-belt"] = { machine = 2, motion = 6, earth = 2, darkness = 2 }
item_aspects["express-underground-belt"] = { machine = 3, motion = 12, earth = 4, darkness = 4 }
item_aspects["splitter"] = { machine = 2, motion = 6 }
item_aspects["fast-splitter"] = { machine = 4, motion = 12 }
item_aspects["express-splitter"] = { machine = 8, motion = 24 }

-- inserters
item_aspects["burner-inserter"] = { machine = 1, motion = 1, exchange = 1 }
item_aspects["inserter"] = { machine = 2, motion = 2, exchange = 2 }
item_aspects["long-handed-inserter"] = { machine = 3, motion = 3, exchange = 3 }
item_aspects["fast-inserter"] = { machine = 3, motion = 3, exchange = 3 }
item_aspects["bulk-inserter"] = { machine = 6, motion = 6, exchange = 6 }

-- poles
item_aspects["small-electric-pole"] = { plant = 3, exchange = 1 }
item_aspects["medium-electric-pole"] = { metal = 3, order = 1, exchange = 3 }
item_aspects["big-electric-pole"] = { metal = 6, order = 2, exchange = 6 }
item_aspects["substation"] = { metal = 12, order = 3, exchange = 12 }

-- pipes
item_aspects["pipe"] = { metal = 1, void = 1, motion = 1 }
item_aspects["pipe-to-ground"] = { metal = 1, void = 1, motion = 1, earth = 1, darkness = 1 }
item_aspects["pump"] = { machine = 3, order = 3, motion = 3 }

-- rails
item_aspects["rail"] = { metal = 1, earth = 1, order = 1 }
item_aspects["train-stop"] = { metal = 3, earth = 3, order = 3 }
item_aspects["rail-signal"] = { metal = 1, senses = 1 }
item_aspects["rail-chain-signal"] = { metal = 1, senses = 1 }
item_aspects["locomotive"] = { machine = 24, order = 24, travel = 40 }
item_aspects["cargo-wagon"] = { machine = 12, order = 12, void = 24, travel = 40 }
item_aspects["fluid-wagon"] = { machine = 12, order = 12, void = 24, travel = 40 }
item_aspects["artillery-wagon"] = { machine = 90, order = 40, weapon = 90, travel = 40 }

-- transport
item_aspects["car"] = { machine = 12, order = 3, travel = 24, weapon = 24, void = 6 }
item_aspects["tank"] = { machine = 40, order = 12, travel = 24, weapon = 90, void = 6 }
item_aspects["spidertron"] = { machine = 120, order = 24, travel = 120, weapon = 120, void = 6 }

-- logistics
item_aspects["logistic-robot"] = { flight = 12, machine = 6, motion = 3, exchange = 3 }
item_aspects["construction-robot"] = { flight = 12, machine = 6, motion = 3, craft = 3 }
item_aspects["active-provider-chest"] = { machine = 6, order = 6, void = 12, exchange = 12 }
item_aspects["passive-provider-chest"] = { machine = 6, order = 6, void = 12, exchange = 12 }
item_aspects["storage-chest"] = { machine = 6, order = 6, void = 12, exchange = 12 }
item_aspects["buffer-chest"] = { machine = 6, order = 6, void = 12, exchange = 12 }
item_aspects["requester-chest"] = { machine = 6, order = 6, void = 12, exchange = 12 }
item_aspects["roboport"] = { machine = 40, order = 40, exchange = 40, energy = 40 }

-- circuits
item_aspects["small-lamp"] = { metal = 3, light = 3 }
item_aspects["arithmetic-combinator"] = { machine = 3, senses = 3, exchange = 3 }
item_aspects["decider-combinator"] = { machine = 3, senses = 3, exchange = 3 }
item_aspects["selector-combinator"] = { machine = 12, senses = 12, exchange = 12 }
item_aspects["constant-combinator"] = { machine = 3, senses = 3, exchange = 3 }
item_aspects["power-switch"] = { machine = 3, exchange = 3 }
item_aspects["programmable-speaker"] = { machine = 3, senses = 1 }
item_aspects["display-panel"] = { machine = 1, senses = 1 }

-- terrain
item_aspects["stone-brick"] = { earth = 1, fire = 1 }
item_aspects["concrete"] = { earth = 3, fire = 3, water = 3, metal = 1 }
item_aspects["hazard-concrete"] = { earth = 3, fire = 3, water = 3, metal = 1 }
item_aspects["refined-concrete"] = { earth = 6, fire = 6, water = 6, metal = 3, order = 1 }
item_aspects["refined-hazard-concrete"] = { earth = 6, fire = 6, water = 6, metal = 3, order = 1 }
item_aspects["landfill"] = { earth = 12 }
item_aspects["cliff-explosives"] = { entropy = 24, fire = 24 }

-- repair
item_aspects["repair-pack"] = { metal = 3, craft = 3, tool = 3 }

-- electricity
item_aspects["boiler"] = { fire = 3, metal = 3 }
item_aspects["steam-engine"] = { machine = 6, motion = 3, energy = 3, exchange = 1 }
item_aspects["solar-panel"] = { metal = 3, energy = 3, exchange = 6, order = 1 }
item_aspects["accumulator"] = { energy = 24, exchange = 24 }
item_aspects["nuclear-reactor"] = { energy = 720, exchange = 720, machine = 720, entropy = 720, order = 720 }
item_aspects["heat-pipe"] = { metal = 6, exchange = 6, order = 3 }
item_aspects["heat-exchanger"] = { metal = 24, exchange = 24, order = 6 }
item_aspects["steam-turbine"] = { machine = 40, motion = 24, energy = 24, exchange = 6 }

-- excavation
item_aspects["burner-mining-drill"] = { fire = 3, metal = 3, mine = 3 }
item_aspects["electric-mining-drill"] = { machine = 6, mine = 6 }
item_aspects["offshore-pump"] = { machine = 3, motion = 3 }
item_aspects["pumpjack"] = { machine = 6, mine = 6, motion = 3, order = 1 }

-- furnaces
item_aspects["stone-furnace"] = { fire = 3, earth = 3 }
item_aspects["steel-furnace"] = { fire = 6, earth = 6, order = 1 }
item_aspects["electric-furnace"] = { fire = 12, earth = 6, order = 3 }

-- production
item_aspects["assembling-machine-1"] = { machine = 3, craft = 3 }
item_aspects["assembling-machine-2"] = { machine = 6, craft = 6, order = 1 }
item_aspects["assembling-machine-3"] = { machine = 12, craft = 12, order = 3 }
item_aspects["oil-refinery"] = { machine = 6, fire = 6, order = 3 }
item_aspects["chemical-plant"] = { machine = 6, craft = 6, order = 3 }
item_aspects["centrifuge"] = { machine = 40, exchange = 24, order = 24, entropy = 24 }
item_aspects["lab"] = { mind = 3, machine = 3, light = 1 }

-- modules
item_aspects["beacon"] = { machine = 12, exchange = 12, order = 4 }
item_aspects["speed-module"] = { exchange = 6, motion = 6 }
item_aspects["speed-module-2"] = { exchange = 24, motion = 24 }
item_aspects["speed-module-3"] = { exchange = 90, motion = 90 }
item_aspects["efficiency-module"] = { exchange = 6, energy = 6 }
item_aspects["efficiency-module-2"] = { exchange = 24, energy = 24 }
item_aspects["efficiency-module-3"] = { exchange = 90, energy = 90 }
item_aspects["productivity-module"] = { exchange = 6, greed = 6 }
item_aspects["productivity-module-2"] = { exchange = 24, greed = 24 }
item_aspects["productivity-module-3"] = { exchange = 90, greed = 90 }

-- weapons
item_aspects["pistol"] = { metal = 1, weapon = 1 }
item_aspects["submachine-gun"] = { metal = 3, weapon = 3 }
item_aspects["shotgun"] = { metal = 3, weapon = 3, plant = 3 }
item_aspects["combat-shotgun"] = { metal = 6, weapon = 6, plant = 6, order = 3 }
item_aspects["rocket-launcher"] = { metal = 3, weapon = 6, entropy = 3 }
item_aspects["flamethrower"] = { metal = 3, weapon = 6, fire = 3, order = 3 }

-- ammo
item_aspects["firearm-magazine"] = { metal = 1, weapon = 1 }
item_aspects["piercing-rounds-magazine"] = { metal = 2, weapon = 2, order = 1 }
item_aspects["uranium-rounds-magazine"] = { metal = 2, weapon = 2, order = 1, energy = 3 }
item_aspects["shotgun-shell"] = { metal = 1, weapon = 1 }
item_aspects["piercing-shotgun-shell"] = { metal = 3, weapon = 2, order = 1 }
item_aspects["cannon-shell"] = { entropy = 6, fire = 6, order = 1 }
item_aspects["explosive-cannon-shell"] = { entropy = 12, fire = 12, order = 2 }
item_aspects["uranium-cannon-shell"] = { entropy = 6, fire = 6, order = 1, energy = 3 }
item_aspects["explosive-uranium-cannon-shell"] = { entropy = 12, fire = 12, order = 2, energy = 3 }
item_aspects["artillery-shell"] = { entropy = 90, fire = 90 }
item_aspects["rocket"] = { entropy = 6, fire = 6, flight = 1 }
item_aspects["explosive-rocket"] = { entropy = 12, fire = 12, flight = 1 }
item_aspects["atomic-bomb"] = { entropy = 720, fire = 720, flight = 1 }
item_aspects["flamethrower-ammo"] = { fire = 6, order = 1 }

-- capsules
item_aspects["grenade"] = { entropy = 6, fire = 6, metal = 1 }
item_aspects["cluster-grenade"] = { entropy = 40, fire = 40, metal = 1, order = 1 }
item_aspects["poison-capsule"] = { poison = 6, metal = 1, order = 1 }
item_aspects["slowdown-capsule"] = { trap = 6, metal = 1, order = 1 }
item_aspects["defender-capsule"] = { flight = 3, weapon = 3, machine = 1 }
item_aspects["distractor-capsule"] = { flight = 12, weapon = 12, machine = 3 }
item_aspects["destroyer-capsule"] = { flight = 40, weapon = 40, machine = 12 }

-- armor
item_aspects["light-armor"] = { protection = 6, metal = 6 }
item_aspects["heavy-armor"] = { protection = 24, metal = 24 }
item_aspects["modular-armor"] = { protection = 40, metal = 40, void = 6, order = 12, energy = 6 }
item_aspects["power-armor"] = { protection = 90, metal = 90, void = 12, order = 24, motion = 90, energy = 12 }
item_aspects["power-armor-mk2"] = { protection = 720, metal = 720, void = 24, order = 120, motion = 120, energy = 120 }

-- equipment
item_aspects["solar-panel-equipment"] = { metal = 3, energy = 3, exchange = 6, order = 2 }
item_aspects["fission-reactor-equipment"] = { energy = 120, exchange = 120, machine = 120, entropy = 120, order = 90 }
item_aspects["battery-equipment"] = { energy = 24, exchange = 24 }
item_aspects["battery-mk2-equipment"] = { energy = 120, exchange = 120 }
item_aspects["belt-immunity-equipment"] = { motion = 12, machine = 6, order = 3 }
item_aspects["exoskeleton-equipment"] = { travel = 120, machine = 24, order = 12 }
item_aspects["personal-roboport-equipment"] = { machine = 40, order = 40, exchange = 40, energy = 40 }
item_aspects["personal-roboport-mk2-equipment"] = { machine = 120, order = 120, exchange = 120, energy = 120 }
item_aspects["night-vision-equipment"] = { senses = 6, machine = 3, order = 1 }
item_aspects["energy-shield-equipment"] = { protection = 6, machine = 3, order = 1 }
item_aspects["energy-shield-mk2-equipment"] = { protection = 40, machine = 40, order = 3 }
item_aspects["personal-laser-defense-equipment"] = { protection = 40, weapon = 40, energy = 40 }
item_aspects["discharge-defense-equipment"] = { protection = 40, weapon = 40, fire = 40 }

-- defense
item_aspects["stone-wall"] = { protection = 3, earth = 3, fire = 3 }
item_aspects["gate"] = { protection = 3, earth = 3, fire = 3, motion = 1, senses = 1 }
item_aspects["radar"] = { machine = 3, motion = 1, senses = 6 }
item_aspects["land-mine"] = { entropy = 6, fire = 6, earth = 1 }

-- turrets
item_aspects["gun-turret"] = { machine = 12, weapon = 12 }
item_aspects["laser-turret"] = { machine = 24, weapon = 24, energy = 24 }
item_aspects["flamethrower-turret"] = { machine = 24, weapon = 24, fire = 24, order = 6, void = 3 }
item_aspects["artillery-turret"] = { machine = 90, weapon = 90, order = 24 }
