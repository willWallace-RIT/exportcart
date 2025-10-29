-- test code for pico-8
-- known to compile in 2.6

-- _init() runs once at the beginning
function _init()
  x = 60
  y = 60
  color = 12
end

-- _update() runs 30 times per second to update game state
function _update()
  if btn(0) then x = x - 1 end -- left
  if btn(1) then x = x + 1 end -- right
  if btn(2) then y = y - 1 end -- up
  if btn(3) then y = y + 1 end -- down
end

-- _draw() runs 30 times per second to draw graphics
function _draw()
  cls(0) -- clear the screen with color 0 (black)
  circfill(x, y, 5, color) -- draw a filled circle
end
