local shuffle = {}

function shuffle:shuffle_array(a)
  for i = #a, 2, -1 do
    local j = math.random(i)
    a[i], a[j] = a[j], a[i]
  end
  return a
end

return shuffle
