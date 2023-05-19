local composer = require("composer") -- 用於創建場景
local startScreen = composer.newScene()

function startScreen:create(event)
    local sceneGroup = self.view

    -- 設定背景
    local background = display.newRect(display.contentCenterX, display.contentCenterY, display.actualContentWidth, display.actualContentHeight)
    background:setFillColor(0.2, 0.2, 0.2)
    sceneGroup:insert(background)

    -- 顯示遊戲標題
    local gameTitle = display.newText({
        text = "音樂遊戲",
        x = display.contentCenterX,
        y = display.contentCenterY - 100,
        width = 300,
        font = native.systemFontBold,
        fontSize = 48
    })
    gameTitle:setFillColor(1, 1, 1)
    sceneGroup:insert(gameTitle)

    -- 開始遊戲按鈕
    local startButton = display.newRect(display.contentCenterX, display.contentCenterY, 200, 80)
    startButton:setFillColor(0.4, 0.4, 0.8)
    sceneGroup:insert(startButton)

    local startButtonText = display.newText({
        text = "開始遊戲",
        x = display.contentCenterX,
        y = display.contentCenterY,
        width = 180,
        font = native.systemFontBold,
        fontSize = 36
    })
    startButtonText:setFillColor(1, 1, 1)
    sceneGroup:insert(startButtonText)

    -- 點擊開始遊戲按鈕的事件處理函式
    local function startGame(event)
        if event.phase == "ended" then
            -- 在這裡執行開始遊戲的相關邏輯
            -- 例如切換到遊戲場景、載入遊戲資源等
            composer.gotoScene("gameScene", { effect = "fade", time = 500 })
        end
    end

    startButton:addEventListener("touch", startGame)
end

startScreen:addEventListener("create", startScreen)
 
return startScreen
