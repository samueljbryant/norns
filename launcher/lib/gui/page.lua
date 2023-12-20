include "lib/util/list"
Page = {
  name = nil,
  state = {},
  custom_state = nil,
  active = false,
  children = {},
  actions = {},
  render_callback = nil,
  frame_rate = 1/30,
  active_state = nil,
  clock_is_playing = false,
  k1_action = nil,
  k2_action = nil,
  k3_action = nil,
  enc1_action = nil,
  enc2_action = nil,
  enc3_action = nil,
}

function Page.new(page)
  page = page or {}
  setmetatable(page, Page)
  Page.__index = Page
  page.state.start = List.new{}
  page.state.done = List.new{}
  return page
end

function Page:start_clock()
  self.animation_clock = clock.run(
    function()
      while self.clock_is_playing == true and self.active == true do
        clock.sleep(self.frame_rate)
        self:render()
      end
    end
  )
  print("started the clock")
end

function Page:stop_clock()
  clock.cancel(self.animation_clock)
  print("stopped the clock")
end



function Page:render()
  local start_node = self.state.start.head
  local end_node = self.state.done.head
  local custom_list = self.custom_state or nil
  if custom_list ~= nil then
    custom_node = custom_list.head
  else
    custom_state = nil
  end
  screen.clear()
  
  while start_node ~= nil do
    start_node.data.fn()
    start_node = start_node.next_node
  end
  
  while custom_node ~= nil do
    custom_node.data.fn()
    custom_node = custom_node.next_node
  end
  
  while end_node ~= nil do
    end_node.data.fn()
    end_node = end_node.next_node
  end
  screen.update()
end

function Page:toggle_animation_clock()
  if self.clock_is_playing == false then
    self.clock_is_playing = true
    self:start_clock()
    return
  end
  self.clock_is_playing = false
  self:stop_clock()
end

  
