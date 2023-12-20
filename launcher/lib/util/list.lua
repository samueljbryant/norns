-- Tables, properties, and methods prepended with `_` are private and should NEVER be called directly
-- Combination of a hash table and a linked list allows for O(1) delete, insert, has etc.
-- Do not modify unless you know what you're doing!
include "lib/util/cache"
include "lib/util/node"

List = {
  head = nil,
  selected = nil,
  tail = nil,
  size = 0,
  cache = Cache.new{},
}

function List.new(list)
  list = list or {}
  setmetatable(list, List)
  List.__index = List
  return list
end

function List:push(value)
  local node = Node.new{ data = value }
  self.cache:set(node.data.name, node)
  if self.head == nil then
    self.head = node
    self.tail = node
    self.selected = node
    self.selected:toggle_selected()
    self.size = 1
    return
  end
  self.tail.next_node = node
  node.prev_node = self.tail
  self.tail = self.tail.next_node
  self.size = self.size + 1
end

function List:pop()
  if self.tail == nil then
    return nil
  end
  self.cache:delete(self.tail.data.name)
  local temp = self.tail
  if self.tail == self.head then
    self.head = nil
    self.tail = nil
    self.selected:toggle_selected()
    self.selected = nil
    self.size = 0
    return temp
  end
  if self.tail == self.selected then
    self.selected:toggle_selected()
    self.selected = self.selected.prev_node
    self.selected:toggle_selected()
  end
  temp = self.tail
  self.tail = nil
  self.tail = temp.prev_node
  
  if self.tail == self.head then
    self.head.next_node = nil
  end
  
  self.size = self.size - 1
  return temp
end

function List:unshift(value)
  node = Node.new{ data = value }
  self.cache:set(node.data.name, node)
  if self.head == nil then
    self.head = node
    self.tail = node
    self.selected = node
    self.selected:toggle_selected()
    self.size = 1
    return
  end
  node.next_node = self.head
  self.head = node
  self.size = self.size + 1
end

function List:shift()
  if self.head == nil then
    return nil
  end
  self.cache:delete(node.data.name)
  local temp = self.head
  if self.head == self.tail then
    self.head = nil
    self.tail = nil
    self.selected:toggle_selected()
    self.selected = nil
    self.size = 0
    return temp
  end
  if self.head == self.selected then
    self.selected:toggle_selected()
    self.selected = self.selected.next_node
    self.selected:toggle_selected()
  end
  self.head = self.head.next_node
  self.size = self.size - 1
  return temp
end

function List:each(callback)
  local current_node = self.head
  local result = {}
  local value
  while current_node ~= nil do
    value = callback(current_node)
    if value ~= nil then
      table.insert(result, value)
    end
     current_node = current_node.next_node
  end
  return result
end

function List:reverse_each(callback)
  local current_node = self.tail
  local result = {}
  local value
  while current_node ~= nil do
    value = callback(current_node)
    if value ~= nil then
      table.insert(result, value)
    end
    current_node = current_node.prev_node
  end
  return result
end

function List:clear()
  self.head = nil
  self.tail = nil
  self.selected:toggle_selected()
  self.selected = nil
  self.cache:clear()
  self.size = 0
end


function List:swap_selected(direction)
  local swap_node
  if direction < 0 then
    if self.selected.prev_node == nil then
      return
    end
    swap_node = self.selected.prev_node
  elseif direction > 0 then
    if self.selected.next_node == nil then
      return
    end
    swap_node = self.selected.next_node
  end
  self.selected:toggle_selected()
  self.selected = swap_node
  self.selected:toggle_selected()
  return
end

function List:delete(key)
  if self.cache:has(key) == false then
    return
  end
  
  local current_node = self.cache:get(key)
  local parent_node = current_node.prev_node
  local child_node = current_node.next_node
  local temp
  
  if current_node == self.head then
    self.shift()
    return
  end
  if current_node == self.tail then
    self.pop()
    return
  end
  
  if current_node == self.selected then
    self.selected:toggle_selected()
    self.selected = parent_node
    self.selected:toggle_selected()
  end
  
  self.cache:delete(key)
  self.size = self.size - 1
  parent_node.next_node = child_node
  child_node.prev_node = parent_node
  return current_node
end
  

  