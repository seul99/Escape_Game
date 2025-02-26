-----------------------------------------------------------------------------------------
--
-- game_wrong.lua
-- 테스트 입니다.
-----------------------------------------------------------------------------------------

local composer = require( "composer" )
local scene = composer.newScene()
local json = require("json")

function scene:create( event )
	local sceneGroup = self.view

	local background = display.newImageRect("image/bedroom/bedroom_wrong.png", display.contentWidth, display.contentHeight)
	background.x, background.y = display.contentWidth/2, display.contentHeight/2

	local dialogBox = display.newImage("image/UI/dialogue/dialogue_default.png")
	dialogBox.x, dialogBox.y = display.contentWidth/2, display.contentWidth/2


	-- 대화창
	local dialog = display.newGroup()

	local content = display.newText(dialog, "", display.contentWidth*0.6, display.contentHeight*0.85, display.contentWidth*0.7, display.contentHeight*0.2)
	content:setFillColor(0)
	content.size = 30

  -- JSON 정보 읽기
  local function jsonParse(filename)
	local path = system.pathForFile(filename, system.ResourceDirectory)
	local file = io.open(path, "r")

	if not file then
		 print("파일을 찾을 수 없습니다: " .. filename)
		 return nil
	end

	local contents = file:read("*a")
	io.close(file)

	local decoded, pos, msg = json.decode(contents)
	if not decoded then
		 print("JSON 파싱 실패: " .. msg)
		 return nil
	end

	return decoded
end

-- JSON 데이터 읽기
local Data = jsonParse("json/fail.json")
if not Data then
	print("JSON 데이터를 불러올 수 없습니다.")
	return
end

  -- json 에서 읽은 정보 적용하기
  -- failCount 값 설정 (이 값을 1 또는 2로 바꾸면 해당하는 JSON 데이터를 출력)
  local failCount = 1  -- 예시로 1로 설정, 이 값에 따라 출력되는 JSON이 달라짐
  local index = failCount  -- failCount 값에 맞춰 index 설정
  local lineIndex = 1  -- 각 content 배열 내에서의 인덱스

  -- 대사 처리 함수
  local function nextScript(event) 
	-- 대사 출력
	content.text = Data[index].content[lineIndex]

	-- 한 항목의 모든 대사를 다 출력했으면 다음 항목으로 넘어감
	lineIndex = lineIndex + 1
	if lineIndex > #Data[index].content then
		 lineIndex = 1  -- 다음 항목의 첫 번째 대사로 리셋

		 -- failCount 증가하여 다음 항목으로 넘어감
		 failCount = failCount + 1
		 index = failCount

		 -- 더 이상 대사가 없으면 bedroom_main 화면으로 전환
		 if index > #Data then 
			  composer.gotoScene("bedroom_main")
		 end
	end
end

  -- dialogBox 클릭 시 대사 진행
  dialogBox:addEventListener("tap", nextScript)

  -- 초기 대사 출력
  content.text = Data[index].content[lineIndex]

  	sceneGroup:insert(background)
	sceneGroup:insert(dialogBox)
	sceneGroup:insert(dialog)
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