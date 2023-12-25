-- a container
views = {}

View = {
  animation = nil,
  bounds = {
    x = nil,
    y = nil,
    z = nil,
    w = nil,
    height = nil,
  },
  class_list = {},
  children = {},
  id = nil,
  parent = nil,
  view_type = "view",
  visible = false,
}

function View:new(view)
    view = view or {}
    if view.id ~= nil and views[view.id] == nil or views[view.id] == false then
    setmetatable(view, self)
    self.__index = self
    views[view.id] = view
    return view
  else
    error "Attempted to re-index an existing view"
  end
end

function View:destroy()
  views[self.id] = nil
  if #self.children > 1 then
    for _, v in pairs(self.children) do
      v.destroy()
    end
  end
  self = nil
end






