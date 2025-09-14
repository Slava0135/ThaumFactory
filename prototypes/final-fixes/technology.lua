local mod_data = require("prototypes.mod-data"):get()

-- unlock effects for crystallization technology
local crystal_recipes = {}
for element, _ in pairs(mod_data.aspects) do
  local crystal_name = "thaumfactory-" .. element .. "-crystal"
  table.insert(crystal_recipes, crystal_name)
end

local unlocked_recipes = {}
for _, recipe in pairs(crystal_recipes) do
  table.insert(unlocked_recipes,{
    type = "unlock-recipe",
    recipe = recipe
  })
end

data.raw["technology"]["thaumfactory-crystallization"].effects = unlocked_recipes
