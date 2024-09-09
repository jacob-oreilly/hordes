import "light"

local pd <const> = playdate
local gfx <const> = pd.graphics

class("Player").extends(gfx.sprite)

function Player:init(x, y)
    local playerImage = gfx.image.new("images/player")
    self.posX = x
    self.posY = y
    self:setImage(playerImage)
    self:setZIndex(5)
    self:moveTo(x,y)
    self:add()
end

function Player:update()
    local crankValue = pd.getCrankChange()
    -- print("rotation: " + tostring(self:getRotation()))
    self:setRotation(self:getRotation() + crankValue)
    Light(self)
end