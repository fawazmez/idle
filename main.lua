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
    width = 536,
    height = 495,
    numFrames = 10
}
local ninjaBoyAttack = graphics.newImageSheet( "./assets/spritesheets/ninjaBoyAttack.png", sheetOptionsIdle )

local sheetOptionsWalk =
{
    width = 363,
    height = 458,
    numFrames = 10
}
local sheetWalkingKnight = graphics.newImageSheet( "./assets/spritesheets/ninjaBoyJumpRun.png", sheetOptionsWalk )


-- sequences table
local sequence_data = {
    -- consecutive frames sequence
    {
        name = "idle",
        start = 1,
        count = 10,
        time = 800,
        loopCount = 0,
        sheet = ninjaBoyAttack
    },
    {
        name = "walk",
        start = 1,
        count = 10,
        time = 800,
        loopCount = 0,
        sheet = ninjaBoyJumpRun
    }
}

local ninja = display.newSprite( ninjaBoyAttack, sequence_data )
ninja.x = centerX
ninja.y = centerY

ninja:play()

--After a short time, swap the sequence to 'seq2' which uses the second image sheet
local function swapSheet()
    ninja:setSequence( "walk" )
    ninja:play()
    print("walk")
end

timer.performWithDelay( 2000, swapSheet )
