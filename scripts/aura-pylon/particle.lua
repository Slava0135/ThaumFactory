local math2d = require("__core__.lualib.math2d")

local particle = {}

local function random_scalar()
  local min_val = -0.3
  local max_val = 0.3
  return min_val + (max_val - min_val) * math.random()
end

local function random_vector()
  return { x = random_scalar(), y = random_scalar() }
end

--- @param arg {
---   density: number,
---   from: table,
---   name: string,
---   surface: table,
---   to: table,
---   wide: boolean,
--- }
function particle:trail(arg)
  local vector = math2d.position.subtract(arg.to, arg.from)
  local direction = math2d.position.get_normalised(vector)
  local length = math2d.vector.length(vector)
  if length == 0 or length ~= length then -- NaN
    return
  end
  local particle_position = arg.from
  local offset = math2d.position.divide_scalar(math2d.position.rotate_vector(direction, 90), 4)
  local steps = arg.density * length + 1
  for i = 0, steps do
    arg.surface.create_particle {
      name = arg.name,
      position = math2d.position.add(particle_position, random_vector()),
      movement = { 0, 0 },
      height = i / steps,
      vertical_speed = -0.01,
      frame_speed = 1,
    }
    if arg.wide then
      arg.surface.create_particle {
        name = arg.name,
        position = math2d.position.add(math2d.position.add(particle_position, offset), random_vector()),
        movement = { 0, 0 },
        height = i / steps,
        vertical_speed = -0.01,
        frame_speed = 1,
      }
      arg.surface.create_particle {
        name = arg.name,
        position = math2d.position.add(math2d.position.add(particle_position, math2d.position.multiply_scalar(offset, -1)), random_vector()),
        movement = { 0, 0 },
        height = i / steps,
        vertical_speed = -0.01,
        frame_speed = 1,
      }
    end
    particle_position = math2d.position.add(particle_position,
      math2d.position.multiply_scalar(direction, 1 / arg.density))
  end
end

return particle
