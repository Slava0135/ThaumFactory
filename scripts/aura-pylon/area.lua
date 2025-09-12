local math2d = require("__core__.lualib.math2d")

local area = { radius = 11, storage_radius = 2 }

function area:storage(position)
  return math2d.bounding_box.create_from_centre(position, 2 * area.storage_radius,
    2 * area.storage_radius)
end

function area:pylon(position)
  return math2d.bounding_box.create_from_centre(position, 2 * area.radius,
    2 * area.radius)
end

return area
