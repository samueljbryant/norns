-- a clip luancher
-- TODO new states for init page
include "lib/clip"
include "lib/util/list"
include "lib/util/names"
include "lib/project"
include "lib/gui/page"

PAGES = {}
PAGES.start_up = Page.new{ name = "startup", frame_rate = 1/8  }

function init()
  PAGES.start_up.active = true
  PAGES.start_up.state.init = List.new{}
  PAGES.start_up.state.load_project = List.new{}
  PAGES.start_up.state.new_project = List.new{}
  PAGES.start_up.children.matrix = initialize_start_up_screen()
  PAGES.start_up.custom_state = PAGES.start_up.state["init"]
  PAGES.start_up.state.start:push({name = "opening_animation", fn = function()
    local x = 0
    local y = 0
    for i, row in pairs(PAGES.start_up.children.matrix) do
      x = 0
      for j, el in pairs(row) do
        screen.level(math.random(3, 7))
        screen.move(x, y)
        screen.text(el)
        x = x + 10
      end
      y = y + 10
    end
  end
  })
  
  PAGES.start_up.state.init:push({name = "init_draw", fn = function()
    screen.level(1)
    screen.rect(0, 0, 100, 40)
    screen.fill()
    screen.level(15)
    screen.move(5, 10)
    screen.text("Welcome to Launcher!")
    screen.move(5, 20)
    screen.text("k2 -> Load Project")
    screen.move(5, 30)
    screen.text("k3 -> New Project")
    end
  })
  PAGES.start_up:toggle_animation_clock()
end

function key(k, z)
  if k == 3 and z == 1 then
    PAGES.start_up.state.start:pop()
    return
  end
end

function initialize_start_up_screen()
  matrix = {}
  for i = 1, 7 do 
    table.insert(matrix, {}) 
    for j = 1, 20 do
      if i % 2 == 1 then
        table.insert(matrix[i], "<-")
      else
        table.insert(matrix[i], "->")
      end
    end
  end
  return matrix
end