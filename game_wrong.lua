-----------------------------------------------------------------------------------------
--
-- game_wrong.lua
-- 게임실패 했을 경우
-----------------------------------------------------------------------------------------

local composer = require( "composer" )
local scene = composer.newScene()

local failCount = composer.getVariable( "failCount" ) or 0
failCount = failCount + 1
composer.setVariable( "failCount", failCount )

local currentLine = 1
local content

function scene:create( event )
	local sceneGroup = self.view

	local background = display.newImageRect("image/bedroom/bedroom_wrong.png", display.contentWidth, display.contentHeight)
	background.x, background.y = display.contentWidth / 2, display.contentHeight / 2

	local dialogBox = display.newImage("image/UI/dialogue/dialogue_default.png")
	dialogBox.x, dialogBox.y = display.contentWidth / 2, display.contentHeight * 0.8  -- `dialogBox.y` 수정

	 -- 첫 번째 대사 설정
    local dialogText = ""

    if failCount == 1 then
        dialogText = "너 한번 실패했어"
    elseif failCount == 2 then
        dialogText = "너 지금 두 번째 실패했어."
    else
        dialogText = "게임 실패"
    end

	content = display.newText({
		text = dialogText, 
		x = display.contentWidth * 0.6,
		y = display.contentHeight * 0.85,
		width = display.contentWidth * 0.7,
		height = display.contentHeight * 0.2,
		fontSize = 30,
		align = "center"
  })
  content:setFillColor(0)


	-- 터치하면 다음 대사로 변경 (주먹구구식으로 직접 설정)
	local function changeDialog()
		if failCount == 1 then
			 if currentLine == 1 then
				  content.text = "다시 시도해봐"
				  currentLine = currentLine + 1
			 else
				  composer.gotoScene("bedroom_main")
			 end
		elseif failCount == 2 then
			 if currentLine == 1 then
				  content.text = "지금 뭐하는거야?"
				  currentLine = currentLine + 1
			 elseif currentLine == 2 then
				  content.text = "다시 시도해"
				  currentLine = currentLine + 1
			 else
				  composer.gotoScene("bedroom_main")
			 end
		else
			 composer.gotoScene("ending")
		end
  end

  -- 배경을 터치하면 changeDialog() 실행
  dialogBox:addEventListener("tap", changeDialog)


	-- 화면에 추가
	sceneGroup:insert(background)
	sceneGroup:insert(dialogBox)
	sceneGroup:insert(content)

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