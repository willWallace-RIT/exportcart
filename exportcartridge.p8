pico-8 cartridge // http://www.pico-8.com
version 16
__lua__
-- Run this commandline script with:
-- $ pico8 -x export_cartridge.p8

-- It will export .bin and .p8.png for the current game release
-- Make sure to build your game and save it in your pico8/carts folder first (by copying it manually or by saving inside PICO-8).
-- Note that it will not warn if cartridge is not found.
-- Paths are relative to PICO-8 carts directory.
cd("web_exports")

param_name = stat(6)
function _init()
  cls(6)
  print(param_name, 32, 64, 13)
  -- wait a few frames for the drawing to happen
  _timer=0
-- poke random data into the sprite sheet memory
  for addr=0x0, 0x2000-1 do
    -- poke two random nibbles (4 bits) per byte
    -- Pico-8 colors range from 0 to 15 (0xf)
    local c1 = rnd(16)
    local c2 = rnd(16)
    local byte = c2*16 + c1
    poke(addr, byte)
  end
end

function _update()
  _timer+=1
  if _timer==2 then
    -- 'screen' takes a screenshot (saved to disk, like Ctrl+6)
    -- This saves to the desktop by default.
    extcmd("screen")
  end
  if _timer==3 then
	load(param_name..".p8")
-- png cartridge export is done via SAVE
-- the metadata label is used automatically
	save(param_name.."flat.p8.png")
-- other exports are done via EXPORT, and can use an icon
-- example of export options (see documentation for more details):
-- instead of the .p8.png label
-- icon is a 16x16 square => -s 2 tiles wide
-- with top-left at sprite 2 => -i 2
-- on pink (color 14) background => -c 14
-- export("game.bin -i 2 -s 2 -c 14")
	load(param_name.."flat.p8.png")
	export(param_name..".html")
	--export(param_name..".html -i 2 -s 2 -c 14")
	--export(param_name..".js -i 2 -s 2 -c 14")
	export(param_name..".js")
    -- 'shutdown' quits the cart when running with -x
    extcmd("shutdown")
  end
end

function _draw()
  cls()
  map(0, 0, 0, 0, 16, 16)
  print(param_name, 32, 64, 13)
end


