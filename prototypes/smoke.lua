local smoke_animations = require("__base__.prototypes.entity.smoke-animations")

local trivial_smoke = smoke_animations.trivial_smoke

data:extend
{
  trivial_smoke {
    name = "thaumfactory-magic-smoke",
    color = { r = 0.5, g = 0, b = 0.5, a = 0.4 }
  },
}
