Node = {
  data = nil,
  next_node = nil,
  prev_node = nil,
  selected = false
}

function Node.new(node)
  node = node or {}
  setmetatable(node, Node)
  Node.__index = Node
  return node
end

function Node:toggle_selected()
  if self.selected == true then
    self.data.selected = false
    self.selected = false
    return
  end
  self.data.selected = true
  self.selected = true
end