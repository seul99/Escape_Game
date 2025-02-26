-----------------------------------------------------------------------------------------
--
-- game_wrong.lua
-- 게임실패 했을 경우
-----------------------------------------------------------------------------------------

local composer = require( "composer" )
local scene = composer.newScene()
local json = require("json")

function scene:create( event )
	local sceneGroup = self.view

	local background = display.newImageRect("image/bedroom/bedroom_wrong.png", display.contentWidth, display.contentHeight)
	background.x, background.y = display.contentWidth/2, display.contentHeight/2

	function ui.createDialogueBox(sceneGroup)
		local dialogueBox = display.newImage("image/UI/dialogue/dialogue_default.png")
		dialogueBox.x = display.contentCenterX  
		dialogueBox.y = display.contentHeight - 150  
  
		local text = display.newText({
			 text = "", 
			 x = display.contentWidth * 0.5, 
			 y = display.contentHeight - 170,
			 width = display.contentWidth - 120,
			 height = 200,
			 fontSize = 40,
			 align = "left"
		})
		text:setFillColor(1, 1, 1)
		
		sceneGroup:insert(dialogueBox)
		sceneGroup:insert(text)
  
		return dialogueBox, text
  end


	-- 대화창

  local failCount = 1

  function checkFailCount()
		if failCount == 1 then
			content = "1번째 대사"
		elseif failCount == 2 then
			content = "2번째 대사"
		else 
			content = "게임 실패"
		end

		print(content) -- 화면에 출력 (Solar2D에서는 display.newText 사용 가능)
	end
  
  	sceneGroup:insert(background)

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