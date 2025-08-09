---@class ModData
---@field aspects table<string, Aspect> Table of defined aspects
---@field item_aspects table<string, ItemAspects> Aspects defined for each item
---@field item_types string[] Types of prototypes that can have aspects
local mod_data = {}

---@class Aspect
---@field color string
---@field tier number
---@field order number
---@field component1 string?
---@field component2 string?

---@alias ItemAspects table<string, number>

local mod_data_name = "thaumfactory-data"

function mod_data:create()
  data:extend({
    {
      type = "mod-data",
      name = "thaumfactory-data",
      data = {
        aspects = {},
        item_aspects = {},
        item_types = {},
      },
    }
  })
end

---@return ModData
function mod_data:get()
  return data.raw["mod-data"][mod_data_name]
end

return mod_data
