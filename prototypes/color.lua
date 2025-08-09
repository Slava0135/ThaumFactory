local color = {}

function color:hex2rgb(hex)
  hex = hex:gsub("#", "")
  local r = tonumber("0x" .. hex:sub(1, 2)) / 255
  local g = tonumber("0x" .. hex:sub(3, 4)) / 255
  local b = tonumber("0x" .. hex:sub(5, 6)) / 255
  return { r = r, g = g, b = b }
end

return color
