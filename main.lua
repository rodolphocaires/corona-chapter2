-----------------------------------------------------------------------------------------
--
-- main.lua
--
-----------------------------------------------------------------------------------------

local physics = require('physics')
physics.start()
physics.getGravity(0, 0)

-- seed the rng
math.randomseed(os.time())

local sheetOptions = {
    frames = {
        -- asteroid 1
        {
            x = 0,
            y = 0,
            width = 102,
            height = 85
        },
        --asteroid 2
        {
            x = 0,
            y = 85,
            width = 90,
            height = 83
        },
        -- asteroid 3
        {
            x = 0,
            y = 168,
            width = 100,
            height = 97
        },
        -- ship
        {
            x = 0,
            y = 265,
            width = 98,
            height = 79
        },
        -- laser
        {
            x = 98,
            y = 265,
            width = 14,
            height = 40
        }
    }
}

local objectSheet = graphics.newImageSheet("gameObjects.png", sheetOptions)

-- Initializa variables
local lives = 3
local score = 0
local died = false

local asteroidsTable = {}

local ship
local gameLoopTimer
local livesText

-- Set up display groups
local backGroup = display.newGroup()
local mainGroup = display.newGroup();
local uiGroup = display.newGroup();

-- Load the background
local background = display.newImageRect(backGroup, 'background.png', 800, 1400)
background.x = display.contentCenterX
background.y = display.contentCenterY

ship = display.newImageRect(mainGroup, objectSheet, 4, 98, 79) 