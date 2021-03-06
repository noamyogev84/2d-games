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
    love.graphics.printf(
        'Yo yo yo starting to learn lua',
        0,
        VIRTUAL_HEIGHT / 2 - 6,
        VIRTUAL_WIDTH,
        'center'
    )
    push:apply('end')
end