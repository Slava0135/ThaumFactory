local resource_autoplace = require("__core__.lualib.resource-autoplace")
local tile_sounds = require("__base__.prototypes.tile.tile-sounds")
local util = require("__core__.lualib.util")

-- based on stone prototype
local function shard(element, color)
  local e = string.sub(element, 1, 1) -- for ordering purposes first letter is used

  data.raw.planet.nauvis.map_gen_settings.autoplace_controls["thaumfactory-" .. element .. "-infused-stone"] = {}
  data.raw.planet.nauvis.map_gen_settings.autoplace_settings.entity.settings["thaumfactory-" .. element .. "-infused-stone"] = {}

  data:extend({
    {
      type = "tool",
      name = "thaumfactory-" .. element .. "-shard",
      durability = 1,
      icons = {
        {
          icon = "__thaumfactory__/graphics/icons/pure-shard.png",
          tint = { color.r, color.g, color.b },
        }
      },
      subgroup = "raw-resource",
      order = "t[thaumfactory-" .. element .. "-shard]",
      stack_size = 50,
    },
    {
      type = "resource",
      name = "thaumfactory-" .. element .. "-infused-stone",
      icons = {
        {
          icon = "__base__/graphics/icons/stone.png",
          tint = { color.r, color.g, color.b }
        }
      },
      flags = { "placeable-neutral" },
      order = "t-" .. e,
      tree_removal_probability = 0,
      tree_removal_max_distance = 0,
      minable = {
        mining_particle = "stone-particle",
        mining_time = 1,
        result = "thaumfactory-" .. element .. "-shard",
      },
      walking_sound = tile_sounds.walking.ore,
      driving_sound = tile_sounds.driving.stone,
      collision_box = { { -0.1, -0.1 }, { 0.1, 0.1 } },
      selection_box = { { -0.5, -0.5 }, { 0.5, 0.5 } },
      autoplace = resource_autoplace.resource_autoplace_settings({
        name = "thaumfactory-" .. element .. "-infused-stone",
        order = "t-" .. e,
        base_density = 4,
        regular_rq_factor_multiplier = 1.0,
        starting_rq_factor_multiplier = 1.1
      }),
      stage_counts = { 15000, 9500, 5500, 2900, 1300, 400, 150, 80 },
      stages =
      {
        sheet =
        {
          filename = "__base__/graphics/entity/stone/stone.png",
          priority = "extra-high",
          size = 128,
          frame_count = 8,
          variation_count = 8,
          scale = 0.5,
          tint = { color.r, color.g, color.b }
        }
      },
      mining_visualisation_tint = { r = color.r, g = color.g, b = color.b, a = 1.000 },
      map_color = { color.r, color.g, color.b },
    },
    {
      type = "autoplace-control",
      name = "thaumfactory-" .. element .. "-infused-stone",
      localised_name = { "", "[entity=thaumfactory-" .. element .. "-infused-stone] ", { "entity-name.thaumfactory-" .. element .. "-infused-stone" } },
      richness = true,
      order = "t-" .. e,
      category = "resource"
    },
  })
end

shard("air", util.color("#FFFF7E"))
shard("fire", util.color("#FF5A01"))
shard("water", util.color("#3CD4FC"))
shard("earth", util.color("#56C000"))
shard("order", util.color("#D5D4EC"))
shard("entropy", util.color("#404040"))
