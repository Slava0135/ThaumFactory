local tablext = {}

function tablext:to_array(t)
  local a = {}
  local i = 1
  for _, v in pairs(t) do
    a[i] = v
    i = i + 1
  end
  return a
end

return tablext
