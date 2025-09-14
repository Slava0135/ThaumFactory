local mod_data = require("prototypes.mod-data"):get()

local lab_inputs = data.raw["lab"]["thaumfactory-arcane-lab"].inputs

-- make sure order is always correct (unlikely to change)
table.insert(lab_inputs, "thaumfactory-air-shard")
table.insert(lab_inputs, "thaumfactory-earth-shard")
table.insert(lab_inputs, "thaumfactory-fire-shard")
table.insert(lab_inputs, "thaumfactory-water-shard")
table.insert(lab_inputs, "thaumfactory-order-shard")
table.insert(lab_inputs, "thaumfactory-entropy-shard")

for element, a in pairs(mod_data.aspects) do
  table.insert(lab_inputs, "thaumfactory-" .. element .. "-crystal")
end
