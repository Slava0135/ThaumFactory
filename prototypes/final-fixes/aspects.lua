local mod_data = require("prototypes.mod-data"):get()
local aspect_sorting = require("aspect-sorting")

-- add aspects to item descriptions
for name, aspects in pairs(mod_data.item_aspects) do
  local sorted_aspects = aspect_sorting:sort(aspects)

  -- some random number as base
  local order = 213
  local tooltips = {}
  for _, a in pairs(sorted_aspects) do
    table.insert(tooltips,
      {
        name = { "aspect-name." .. a.element, tostring(a.n) },
        value = { "aspect-description." .. a.element },
        order = order,
      })
    order = order + 1
  end
  for _, proto in ipairs(mod_data.item_types) do
    local item = data.raw[proto][name]
    if item == nil then
      goto continue
    end
    if item.custom_tooltip_fields == nil then
      item.custom_tooltip_fields = {}
    end
    for _, tt in pairs(tooltips) do
      table.insert(item.custom_tooltip_fields, tt)
    end
    goto next
    ::continue::
  end
  ::next::
end

-- add aspects to aspect (fluid) descriptions
for element, a in pairs(mod_data.aspects) do
  if a.component1 and a.component2 then
    local fluid = data.raw["fluid"]["thaumfactory-aspect-" .. element]
    if fluid.custom_tooltip_fields == nil then
      fluid.custom_tooltip_fields = {}
    end
    table.insert(fluid.custom_tooltip_fields,
      { name = { "aspect-name." .. a.component1, tostring(1) }, value = { "aspect-description." .. a.component1 }, order = 1 })
    table.insert(fluid.custom_tooltip_fields,
      { name = { "aspect-name." .. a.component2, tostring(1) }, value = { "aspect-description." .. a.component2 }, order = 2 })
  end
end
