if script.active_mods["atan-nuclear-science"] then
  -- the mod adds nuclear science to tech, but the arcane lab doesn't accept it
  local ingredients = data.raw["technology"]["thaumfactory-native-uranium-cluster"].unit.ingredients
  -- only keep thaumfactory items as ingredients
  local patched_ingredients = {}
  for _, ingredient in ipairs(ingredients) do
    if string.find(ingredient[1], "thaumfactory", 1) then
      table.insert(patched_ingredients, ingredient)
    end
  end
  data.raw["technology"]["thaumfactory-native-uranium-cluster"].unit.ingredients = patched_ingredients
end
