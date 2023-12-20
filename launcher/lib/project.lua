-- Holds the list and manages application state... swapable
include "lib/util/list"
Project = {
  timeline = List.new{},
  is_playing = false,
  name = nil, -- random name generator
  screen_actions = {},
  edit_mode = false,
}

function Project.new(project)
  local project = project or {}
  setmetatable(project, Project)
  Project.__index = Project
  return project
end

function Project:initialize()
  
end

function Project:toggle_edit_mode()
  if self.edit_mode == true then
    self.edit_mode = false
  else
    self.edit_mode = true
  end
end

      
