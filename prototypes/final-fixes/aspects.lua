local mod_data = require("prototypes.mod-data"):get()

for name, aspects in pairs(mod_data.item_aspects) do
  local tooltips = {}
  for element, n in pairs(aspects) do
    -- some random number as "base"
    local order = 220 + mod_data.aspects[element].tier
    -- max value for order is 255 which is not enough to specify correct order
    -- TODO: sort based on order, use index instead
    if order > 255 then
      order = 255
    end
    table.insert(tooltips,
      { name = { "aspect-name." .. element, tostring(n) }, value = { "aspect-description." .. element }, order = order })
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
