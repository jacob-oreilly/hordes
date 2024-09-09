import "CoreLibs/object"
import "CoreLibs/graphics"
import "CoreLibs/sprites"
import "CoreLibs/timer"

import "player"

local pd <const> = playdate
local gfx <const> = pd.graphics
local screenWidth, screenHeight = pd.display.getSize()
Player(screenWidth / 2, screenHeight / 2)

function pd.update()
    gfx.fillRect(0, 0, 400, 240)
    gfx.sprite.update()
    pd.timer.updateTimers()
    pd.drawFPS(0,0)
end