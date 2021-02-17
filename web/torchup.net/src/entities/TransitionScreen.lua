
local class = require("./lib/middleclass/middleclass")
local gamestate = require("./lib/hump/gamestate")

local TransitionScreen = class("TransitionScreen")

TransitionScreen.hudFg = true

-- mode is true for "toblack" or false for "totransparent"
function TransitionScreen:initialize(mode, newState)
    self.lifetime = 0.5
    self.newState = newState
    if mode then
        self.alpha = 0
        self.fadeTime = -0.5
    else
        self.alpha = 1
        self.fadeTime = 0.5
    end
end

function TransitionScreen:drawHud(dt)
    local r1, g1, b1, a = love.graphics.getColor()
    love.graphics.setColor(0, 0, 0, self.alpha)
    love.graphics.rectangle("fill", 0, 0, love.graphics.getWidth(), love.graphics.getHeight())
    love.graphics.setColor(r1, g1, b1, a)
end

function TransitionScreen:onGameover()
    if self.newState then
        gamestate.switch(self.newState)
    end
end

return TransitionScreen
