--[[
    GD50
    Match-3 Remake

    -- Tile Class --

    Author: Colton Ogden
    cogden@cs50.harvard.edu

    The individual tiles that make up our game board. Each Tile can have a
    color and a variety, with the varietes adding extra points to the matches.
]]

Tile = Class{}

function Tile:init(x, y, color, variety)
    -- board positions
    self.gridX = x
    self.gridY = y

    -- coordinate positions
    self.x = (self.gridX - 1) * 32
    self.y = (self.gridY - 1) * 32

    -- tile appearance/points
    self.color = color
    self.variety = variety

    self.colors = {
        [1] = {255, 0, 153},
        [2] = {243, 243, 21},
        [3] = {255, 102, 0},
        [4] = {131, 245, 44},
        [5] = {110, 13, 208},
        -- [6] = {223, 113, 38, 255}
    }

    -- time for a color change if it's been half a second
    self.colorTimer = Timer.every(0.075, function()
        -- shift every color to the next, looping the last to front
        -- assign it to 0 so the loop below moves it to 1, default start
        self.colors[0] = self.colors[5]

        for i = 5, 1, -1 do
            self.colors[i] = self.colors[i - 1]
        end
    end)
end

function Tile:update(dt)

end

--[[
    Function to swap this tile with another tile, tweening the two's positions.
]]
function Tile:swap(tile)

end

function Tile:render(x, y)
    -- draw shadow
    love.graphics.setColor(34, 32, 52, 255)
    love.graphics.draw(gTextures['main'], gFrames['tiles'][self.color][self.variety],
        self.x + x + 2, self.y + y + 2)

    -- draw tile itself
    if self.color == 18 then
        
        for i = 1, 5 do
            love.graphics.setColor(self.colors[i])
        end
    else
        love.graphics.setColor(255, 255, 255, 255)
    end
    
    love.graphics.draw(gTextures['main'], gFrames['tiles'][self.color][self.variety],
        self.x + x, self.y + y)
end