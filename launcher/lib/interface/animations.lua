-- animations
function opening_animation()
  local x = 0
  local y = 10
  for i = 1, 7 do
    for j = 1, 20 do
      screen.level(math.random(1, 15))
      screen.move(x, y)
      if i % 2 == 1 then
        screen.text("<-")
      else
        screen.text("->")
      end
    x = x + 10
    end
    x = 0
    y = y + 10
  end
  
  screen.level(1)
  screen.rect(16, 16, 96, 32)
  screen.fill()
  screen.close()
  screen.level(15)
  screen.move(22, 24)
  screen.text("Welcome to Launcher")
  screen.move(22, 34)
  screen.text("k2: Load Project")
  screen.move(22, 44)
  screen.text("k3: New Project")
end
