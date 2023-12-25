include "lib/interface/view"
include "lib/interface/animations"

-- Initialize App --------------------------
function intialize_interface()
  count = 0
  intitial_view = View:new{
    animation = opening_animation,
    id = "start_frame",
    visible = true,
  }
  start_main_animation_thread = clock.run(
    function()
      while true do
        clock.sleep(1/30) -- 30 fps
        if screen_dirty == true then
          redraw()
          screen_dirty = false
        end
      end
    end
  )
  active_view = intitial_view
  screen_dirty = true
  clock.transport.start()
end

-- Clock Start --------------------------
function clock.transport.start()
  main_thread = clock.run(animate)
  transport_active = true
  screen_dirty = true
end

function clock.transport.stop()
  clock.cancel(main_thread)
  transport_active = false
end

function animate()
  while true do
    screen_dirty = true
    clock.sync(1/4)
  end
end

-- Draw Animation ------------------------
function redraw()
  screen.clear()
  active_view.animation()
  screen.update()
end
