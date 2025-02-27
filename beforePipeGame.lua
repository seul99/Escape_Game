-----------------------------------------------------------------------------------------
--
-- beforePipeGame.lua
--
-----------------------------------------------------------------------------------------
local composer = require( "composer" )
local ui = require("ui")                --ui.lua 파일 불러오기기

local scene = composer.newScene()

function scene:create( event )
	local sceneGroup = self.view

     -- BackGround
	-- local bg = display.newImage("Image/cutscene/bathroom_blood.png")
    -- bg.x, bg.y = display.contentWidth/2, display.contentHeight/2
	-- sceneGroup:insert(bg)
	local bg = display.newImage("Image/cutscene/bathroom_blood.png")
	bg.x = display.contentCenterX
	bg.y = display.contentCenterY
	
	local dialogueBox = display.newImage("Image/UI/dialogue/dialogue_blood.png")
	dialogueBox.x = display.contentCenterX  
	dialogueBox.y = display.contentHeight - 130
	dialogueBox:scale(1, 0.65)


	-- DIALOG
	local dialog = display.newGroup()

	local content = display.newText({
        text = "", 
        x = display.contentWidth * 0.5 + 15, 
        y = display.contentHeight - 105,
        width = display.contentWidth - 120,
        height = 200,
        fontSize = 40,
        align = "left"
    })
	content:setFillColor(1)
	content.size = 30

	local Data = jsonParse("json/diag_game_bathroom.json")
	if(Data) then
		print(Data[1].dialogue)
	end

	-- json에서 읽은 정보 적용하기
	local index = 0
	local horror = "change"

	local function nextScript( event )
		index = index + 1

		if (index > #Data) then
			composer.gotoScene("pipeGame")
			--composer.removeScene("diag_table")
			return
		end

		bg.fill = {
			type = "image",
			filename = Data[index].bg
		}
		content.text = Data[index].dialogue
	end
	
	dialogueBox:addEventListener("tap", nextScript)


	sceneGroup:insert(bg)
	sceneGroup:insert(dialogueBox)
	sceneGroup:insert(dialog)
	sceneGroup:insert(content)

    -- local dialogueBox, dialogueText = ui.createDialogueBox(sceneGroup)
    -- ui.updateDialogueText(dialogueText, "(임시)지금 야근을 얼마나 하고 있는 거지...?")

    -- -- 대화창 클릭 이벤트 리스너
	-- local function onDialogueBoxTap(event)
	-- 	if no_more_text == 1 then
	-- 		composer.gotoScene("pipeGame")
	-- 	elseif event.phase == "ended" then    
	-- 		ui.updateDialogueText(dialogueText, "(임시)하... 집에 가고 싶다...")
	-- 		no_more_text = 1
	-- 	end
	-- 	return true  -- 이벤트 전파 방지
	-- end

    -- dialogueBox:addEventListener("touch", onDialogueBoxTap)

	-- -- -- BGM
	-- -- local bgm = {}



end

function scene:show( event )
	local sceneGroup = self.view
	local phase = event.phase
	
	if phase == "will" then
		-- Called when the scene is still off screen and is about to move on screen


	elseif phase == "did" then
		-- Called when the scene is now on screen
		-- 
		-- INSERT code here to make the scene come alive
		-- e.g. start timers, begin animation, play audio, etc.
	end	
end

function scene:hide( event )
	local sceneGroup = self.view
	local phase = event.phase
	
	if event.phase == "will" then
		-- Called when the scene is on screen and is about to move off screen
		--
		-- INSERT code here to pause the scene
		-- e.g. stop timers, stop animation, unload sounds, etc.)
		--composer.removeScene("dialogue")
	
	elseif phase == "did" then
		-- Called when the scene is now off screen
	
	end
end

function scene:destroy( event )
	local sceneGroup = self.view
	-- Called prior to the removal of scene's "view" (sceneGroup)
	-- 
	-- INSERT code here to cleanup the scene
	-- e.g. remove display objects, remove touch listeners, save state, etc.
end

---------------------------------------------------------------------------------

-- Listener setup
scene:addEventListener( "create", scene )
scene:addEventListener( "show", scene )
scene:addEventListener( "hide", scene )
scene:addEventListener( "destroy", scene )

-----------------------------------------------------------------------------------------

return scene
