Cache = {}

function Cache.new(cache)
  cache = cache or {}
  setmetatable(cache, Cache)
  Cache.__index = Cache
  return cache
end

function Cache:clear()
  self = {}
end

function Cache:has(key)
  if self[key] ~= nil then
    return true
  end
  return false
end

function Cache:set(key, value)
  self[key] = value
end

function Cache:get(key)
  return self[key]
end


function Cache:delete(key)
  self[key] = nil
end
