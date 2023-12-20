Clip = {
  sample = nil, -- path to sample
  buffer = nil, -- softcut buffer
  is_loaded = false, -- is loaded in softcut
  is_playing = false, -- is playing
  duration = nil, -- duration in mil
  position = nil, -- playhead position
  comment = nil, -- notes
  id = nil, -- unique id use for reference this node
  name = "----",
  selected = false,
}


function Clip.new(clip)
  clip = clip or {}
  setmetatable(clip, Clip)
  Clip.__index = Clip
  return clip
end

function Clip:build(clip_data)
end


function Clip:toggle_playback()
  if self.is_playing == true then
    self.is_playing = false
  else
    self.is_playing = true
  end
end

function Clip:add_to_buffer()
end

function Clip:remove_from_buffer()
end

function Clip:screen_action(x, y)
  if self.selected == true then 
    screen.level(15)
  else
    screen.level(5)
  end
  screen.move(x, y)
  screen.text(self.name)
end
