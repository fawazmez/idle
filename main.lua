-----------------------------------------------------------------------------------------
--
-- main.Lua
--
-- This file animates a charact using a spritesheet
--
--
-- Created by: Fawaz Mezher
-- Created on: april 2018 
-----------------------------------------------------------------------------------------
display.setStatusBar(display.HiddenStatusBar)
 
centerX = display.contentWidth * .5
centerY = display.contentHeight * .5

local sheetOptionsIdle =
{
    width = 587,
    height = 707,
    numFrames = 5
}
local sheetIdlerobot = graphics.newImageSheet( "./assets/spritesheets/robotIdle.png", sheetOptionsIdle )

local sheetOptionsWalk =
{
    width = 587,
    height = 707,
    numFrames = 5
}
local sheetWalkingrobot = graphics.newImageSheet( "./assets/spritesheets/robotWalking.png", sheetOptionsWalk )


-- sequences table
local sequence_data = {
    -- consecutive frames sequence
    {
        name = "idle",
        start = 1,
        count = 10,
        time = 800,
        loopCount = 0,
        sheet = sheetIdlerobot
    },
    {
        name = "walk",
        start = 1,
        count = 10,
        time = 800,
        loopCount = 0,
        sheet = sheetWalkingrobot
    }
}

local knight = display.newSprite( sheetIdlerobot, sequence_data )
robot.x = centerX
robot.y = centerY

knight:play()

-- After a short time, swap the sequence to 'seq2' which uses the second image sheet
local function swapSheet()
    knight:setSequence( "walk" )
    knight:play()
    print("walk")
end
