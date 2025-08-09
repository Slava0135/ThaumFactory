local mod_data = require("prototypes.mod-data"):get()

for name, a in pairs(mod_data.item_aspects) do
  -- aspects should be sorted so the recipes always use same pipe outputs
  local sorted_aspects = {}
  for element, _ in pairs(a) do
    table.insert(sorted_aspects, { element = element, order = mod_data.aspects[element].order })
  end
  table.sort(sorted_aspects, function(a, b)
    return a.order < b.order
  end)

  local results = {}
  for i = 1, #sorted_aspects do
    local element = sorted_aspects[i].element
    table.insert(results, { type = "fluid", name = "thaumfactory-aspect-" .. element, amount = a[element] })
  end

  data:extend({
    {
      type = "recipe",
      name = "thaumfactory-smelt-" .. name,
      category = "thaumfactory-alchemistry-smelt",
      enabled = true,
      energy_required = 1,
      ingredients =
      {
        { type = "item", name = name, amount = 1 },
      },
      results = results,
      allow_productivity = false,
      icon = "__core__/graphics/empty.png",
      subgroup = "thaumfactory-recipes",
      order = "t-smelt-" .. name,
      allow_decomposition = false,
      hide_from_player_crafting = true,
    },
  })
end

for element, a in pairs(mod_data.aspects) do
  if a.component1 and a.component2 then
    local fluid = data.raw["fluid"]["thaumfactory-aspect-" .. element]
    data:extend({
      {
        type = "recipe",
        name = "thaumfactory-break-aspect-" .. element,
        category = "thaumfactory-alchemistry-break",
        enabled = true,
        energy_required = 1,
        ingredients =
        {
          { type = "fluid", name = "thaumfactory-aspect-" .. element, amount = 2 },
        },
        results =
        {
          { type = "fluid", name = "thaumfactory-aspect-" .. a.component1, amount = 1 },
          { type = "fluid", name = "thaumfactory-aspect-" .. a.component2, amount = 1 },
        },
        allow_productivity = false,
        icon = fluid.icon,
        icons = fluid.icons,
        subgroup = "thaumfactory-recipes",
        order = "t-break-" .. a.tier .. "-" .. a.order,
        allow_decomposition = false,
        hide_from_player_crafting = true,
      }
    })
  end
  local crystal_name = "thaumfactory-" .. element .. "-crystal"
  local crystal = data.raw["item"][crystal_name]
  data:extend({
    {
      type = "recipe",
      name = crystal_name,
      category = "thaumfactory-fabricate",
      enabled = true,
      energy_required = 1,
      ingredients =
      {
        { type = "fluid", name = "thaumfactory-aspect-" .. element, amount = 1 },
      },
      results =
      {
        { type = "item", name = crystal_name, amount = 1 },
      },
      allow_productivity = false,
      icon = crystal.icon,
      icons = crystal.icons,
      subgroup = "thaumfactory-recipes",
      order = "t-break-" .. a.tier .. "-" .. a.order,
      allow_decomposition = false,
      hide_from_player_crafting = true,
    }
  })
end
