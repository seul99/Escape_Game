local composer = require( "composer" )
local scene = composer.newScene()

function scene:create( event )
	local sceneGroup = self.view
	
	-- BACKGROUND
	local bg = display.newImage("image/cutscene/cutscene_4.png")
	bg.x = display.contentCenterX
	bg.y = display.contentCenterY
	
	local dialogueBox = display.newImage("image/UI/dialogue/dialogue_default.png")
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


	-- #6 산장 식탁 앞
	local Data = jsonParse("json/diag_table.json")
	if(Data) then
		print(Data[1].dialogue)
	end

	-- json에서 읽은 정보 적용하기
	local index = 0
	local horror = "change"
	local eat = "first"

	local choices = {}
	local buttons = {}

	local function NotEatTapped( event )

		if (choices[2].x - 50 < event.target.x and event.target.x < choices[2].x + 50
			and choices[2].y - 50 < event.target.y and event.target.y < choices[2].y + 50) then
				choices[2].text = "먹는다."
				eat = "second"
				
				--choices[1]:addEventListener("tap", EatTapped)
				--choices[2]:addEventListener("tap", EatTapped)
			--dialogueBox:addEventListener("tap", nextScript)
			index = index + 1
		end
	end

	-- done!
	local function EatTapped( event )

		if (eat ~= "second") then
			if (choices[1].x - 50 < event.target.x and event.target.x < choices[1].x + 50
				and choices[1].y - 50 < event.target.y and event.target.y < choices[1].y + 50) then
				--index = index + 1
				-- display.remove(event.target)
				-- display.remove(buttons[1])
				for i = 1, 2 do
					display.remove(buttons[i])
					display.remove(choices[i])
				end
				
				--dialogueBox:removeEventListener("tap", nextScript)
				--dialogueBox:addEventListener("tap", nextScript)
				index = index + 1
			end
		else
			if (choices[1].x - 50 < event.target.x and event.target.x < choices[1].x + 50
				and choices[1].y - 50 < event.target.y and event.target.y < choices[1].y + 50
				and choices[2].x - 50 < event.target.x and event.target.x < choices[2].x + 50
				and choices[2].y - 50 < event.target.y and event.target.y < choices[2].y + 50) then
				--index = index + 1
				-- display.remove(event.target)
				-- display.remove(buttons[1])
				for i = 1, 2 do
					display.remove(buttons[i])
					display.remove(choices[i])
				end
				
				--dialogueBox:removeEventListener("tap", nextScript)
				--dialogueBox:addEventListener("tap", nextScript)
				index = index + 1
			end
		end
	end

	local function nextScript( event )
		index = index + 1

		if (index > #Data) then
			composer.gotoScene("diag_outside")
			composer.removeScene("diag_table")
			return
		end

		--dialogueBox:removeEventListener("tap", nextScript)
		--- 칠면조 먹을지 말지 선택하는 첫번째 창
		if (Data[index].eat == eat) then
			dialogueBox:removeEventListener("tap", nextScript)

    		choices[1] = display.newText("먹는다.", display.contentCenterX*1.15, display.contentCenterY + 180, 300, 50)
    		choices[2] = display.newText("먹지 않는다.", display.contentCenterX*1.15, display.contentCenterY + 230, 300, 50)
			for i = 1, 2 do
				choices[i]:setFillColor(1)
				choices[i].size = 30
			end

			buttons[1] = display.newRect(display.contentCenterX*1.05 - 22, display.contentCenterY + 175, 165, 45)
			buttons[1]:setFillColor(0)
			buttons[1].alpha = 0.5
			buttons[2] = display.newRect(display.contentCenterX*1.05 - 22, display.contentCenterY + 225, 165, 45)
			buttons[2]:setFillColor(0)
			buttons[2].alpha = 0.5

			choices[1]:addEventListener("tap", EatTapped)
			choices[2]:addEventListener("tap", NotEatTapped)

			-- if (eat == "second") then
			-- 	choices[1]:addEventListener("tap", EatTapped)
			-- 	choices[2]:addEventListener("tap", EatTapped)
			-- end
			
			--dialogueBox:addEventListener("tap", nextScript)
			continue
		elseif(eat == "second") then

			choices[1]:addEventListener("tap", EatTapped)
			choices[2]:addEventListener("tap", EatTapped)
		end
		dialogueBox:addEventListener("tap", nextScript)

		if (Data[index].scene == horror) then

    		bg = display.newImage("image/cutscene/cutscene_5.png")
			bg.x = display.contentCenterX
			bg.y = display.contentCenterY
			bg:toBack()
			
			content.text = Data[index].dialogue
			
			bg = display.newImage("image/cutscene/cutscene_6.png")
			bg.x = display.contentCenterX
			bg.y = display.contentCenterY
			bg:toBack()

			for i = 1, 2 do
				display.remove(buttons[i])
				display.remove(choices[i])
			end

			content.text = Data[index].dialogue

			bg = display.newImage("image/cutscene/cutscene_7.png")
			bg.x = display.contentCenterX
			bg.y = display.contentCenterY

			sceneGroup:insert(bg)
			sceneGroup:insert(dialogueBox)
			sceneGroup:insert(content)
			
		else
			content.text = Data[index].dialogue
		end

	end
	
	dialogueBox:addEventListener("tap", nextScript)

	

	sceneGroup:insert(bg)
	sceneGroup:insert(dialogueBox)
	sceneGroup:insert(dialog)
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
		--composer.removeScene("intro")
	end
end

function scene:destroy( event )
	local sceneGroup = self.view
	
	composer.gotoScene("diag_outside")
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
