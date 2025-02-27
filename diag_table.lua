local composer = require("composer")
local scene = composer.newScene()

function scene:create(event)
    local sceneGroup = self.view

    -- BACKGROUND
    local bg = display.newImage("image/cutscene/cutscene_5.png")
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

    -- JSON DATA
    local Data = jsonParse("json/diag_table.json")
    if (Data) then print(Data[1].dialogue) end

    local index = 0
    function nextScript(event)
        index = index + 1
        if (index > #Data) then
            composer.gotoScene("after_diag_table")
            return
        end

        content.text = Data[index].dialogue or ""
    end

    dialogueBox:addEventListener("tap", nextScript)

    sceneGroup:insert(bg)
    sceneGroup:insert(dialogueBox)
    sceneGroup:insert(dialog)
    sceneGroup:insert(content)
end

function scene:show(event)
    local sceneGroup = self.view
    local phase = event.phase
    if phase == "did" then
        -- Scene is now on screen
    end
end

function scene:hide(event)
    local sceneGroup = self.view
    local phase = event.phase
    if phase == "did" then
        -- Scene is now off screen
    end
end

function scene:destroy(event)
    composer.gotoScene("diag_outside")
end

scene:addEventListener("create", scene)
scene:addEventListener("show", scene)
scene:addEventListener("hide", scene)
scene:addEventListener("destroy", scene)

return scene
