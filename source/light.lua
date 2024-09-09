local pd <const> = playdate
local gfx <const> = pd.graphics

class("Light").extends(gfx.sprite)

function Light:init(player)
    self.player = player
    self.shadeImage = gfx.image.new(400, 240, gfx.kColorBlack)
    self.shadeImage:addMask()
    self:setImage(self.shadeImage)
    self:setSize(400, 240)
    self:setCenter(0,0)
    self:moveTo(0, 0)
    -- self:setZIndex(100)
    self:add()
    self.ditherMask = self.shadeImage:getMaskImage()
    gfx.pushContext( self.ditherMask )
        gfx.setColor(gfx.kColorBlack)
        gfx.setDitherPattern(0.5, gfx.image.kDitherTypeBayer8x8)
        -- gfx.fillCircleAtPoint( self.player.x, self.player.y, 150)
        gfx.fillTriangle(20, -20, 400, -20, self.player.x, self.player.y - 8)
    gfx.popContext()
end

function Light:update() 
    local crankValue = pd.getCrankChange()
    -- print("rotation: " + tostring(self:getRotation()))
    self:setRotation(self:getRotation() + crankValue)
    self.shadeImage:setMaskImage(self.ditherMask)
    self.shadeImage:drawAnchored(self.player.x, self.player.y, 0.5, 0.5)
end