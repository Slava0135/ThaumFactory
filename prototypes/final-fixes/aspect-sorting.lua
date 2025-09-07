local mod_data = require("prototypes.mod-data"):get()

local aspect_sorting = {}

function aspect_sorting:sort(aspects)
  local sorted_aspects = {}
  for element, n in pairs(aspects) do
    table.insert(sorted_aspects,
      { element = element, n = n, tier = mod_data.aspects[element].tier, order = mod_data.aspects[element].order })
  end
  table.sort(sorted_aspects, function(a, b)
    if a.tier < b.tier then
      return true
    end
    return a.tier == b.tier and a.order < b.order
  end)
  return sorted_aspects
end

return aspect_sorting
