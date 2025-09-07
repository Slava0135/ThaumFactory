local hash = {}

-- deterministic hash function based on Java hash function
---@param str string
---@return number
function hash:hash(str)
  local h = 1
  for idx = 1, #str do
    -- according to Lua manual max value for integer (without loosing precision) number is 100,000,000,000,000 (10^14)
    -- at each iteration at most hash is multiplied by 32 (less than 100)
    -- after next iteration hash cannot be bigger than 10^12
    h = (h * 31 % 10e10) + string.byte(idx)
  end
  return h
end

return hash
