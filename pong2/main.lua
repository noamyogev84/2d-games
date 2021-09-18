-- Library that allows drawing at virtual resolution, very nice for retro awsthetic
-- https://github.com/Ulydev/push
push = require 'push'

WINDOW_WIDTH = 1280
WINDOW_HEIGHT = 720

VIRTUAL_WIDTH = 432
VIRTUAL_HEIGHT = 243

-- Called by love on game start
function love.load()
    love.graphics.setDefaultFilter('nearest', 'nearest')
    
    -- Setting font in love
    smallFont = love.graphics.newFont('font.ttf', 8)
    love.graphics.setFont(smallFont)

    push:setupScreen(VIRTUAL_WIDTH, VIRTUAL_HEIGHT, WINDOW_WIDTH, WINDOW_HEIGHT, {
        fullscreen = false,
        resizable = false,
        vsync = true
    })
end

-- Called by love on game start (access key by string name)
function love.keypressed(key)
    if key == 'escape' then
        love.event.quit()
    end
end

-- Called by love on each frame (after love.update)
function love.draw()
    push:apply('start')

    -- Clear canvas with specific color
    love.graphics.clear(0/255, 45/255, 52/255, 255/255)
    love.graphics.printf('Hello Pong!', 0, 20, VIRTUAL_WIDTH, 'center')

    -- Render the rectangles on the sides
    love.graphics.rectangle('fill', 10, 30, 5, 20)
    love.graphics.rectangle('fill', VIRTUAL_WIDTH - 10, VIRTUAL_HEIGHT - 50, 5, 20)
    love.graphics.rectangle('fill', VIRTUAL_WIDTH / 2 - 2, VIRTUAL_HEIGHT / 2 - 2, 4, 4)

    push:apply('end')
end