-- Roblox TargetFucker GUI
-- Круглая кнопка + перемещаемое меню, телепорт за спину и ритмичное движение

local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local player = Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local root = character:WaitForChild("HumanoidRootPart")

-- ====== GUI ======
local screenGui = Instance.new("ScreenGui")
screenGui.Name = "TargetFuckerGUI"
screenGui.Parent = game:GetService("CoreGui") -- в CoreGui прячется от обычного поиска

-- ----- Круглая кнопка -----
local toggleBtn = Instance.new("TextButton")
toggleBtn.Size = UDim2.new(0, 40, 0, 40)
toggleBtn.Position = UDim2.new(0.1, 0, 0.2, 0)
toggleBtn.BackgroundColor3 = Color3.fromRGB(30,30,30)
toggleBtn.Text = ""
toggleBtn.AutoButtonColor = false
toggleBtn.Parent = screenGui

local corner = Instance.new("UICorner", toggleBtn)
corner.CornerRadius = UDim.new(1,0) -- полностью круг

-- Внутренний круг (индикатор)
local innerCircle = Instance.new("Frame", toggleBtn)
innerCircle.Size = UDim2.new(0, 30, 0, 30)
innerCircle.Position = UDim2.new(0.5, -15, 0.5, -15)
innerCircle.BackgroundColor3 = Color3.fromRGB(80,80,80)
local innerCorner = Instance.new("UICorner", innerCircle)
innerCorner.CornerRadius = UDim.new(1,0)

-- Перетаскивание кнопки
local dragBtn = Instance.new("UIDragDetector", toggleBtn)

-- ----- Главное меню (скрыто сначала) -----
local menu = Instance.new("Frame")
menu.Name = "MainMenu"
menu.Size = UDim2.new(0, 240, 0, 130)
menu.Position = UDim2.new(0.2, 0, 0.3, 0)
menu.BackgroundColor3 = Color3.fromRGB(20,20,20)
menu.BorderSizePixel = 0
menu.Visible = false
menu.Parent = screenGui

local menuCorner = Instance.new("UICorner", menu)
menuCorner.CornerRadius = UDim.new(0, 12)

-- Заголовок (перетаскиваемый)
local header = Instance.new("TextLabel", menu)
header.Size = UDim2.new(1, 0, 0, 30)
header.Position = UDim2.new(0, 0, 0, 0)
header.BackgroundTransparency = 1
header.Text = "Target Fucker"
header.TextColor3 = Color3.fromRGB(220,220,220)
header.Font = Enum.Font.GothamBold
header.TextSize = 16
header.TextXAlignment = Enum.TextXAlignment.Center

local dragMenu = Instance.new("UIDragDetector", header)

-- Разделитель
local line = Instance.new("Frame", menu)
line.Size = UDim2.new(1, 0, 0, 2)
line.Position = UDim2.new(0, 0, 0, 30)
line.BackgroundColor3 = Color3.fromRGB(100,100,100)

-- Выпадающий список игроков
local playerListFrame = Instance.new("Frame", menu)
playerListFrame.Size = UDim2.new(1, -20, 0, 20)
playerListFrame.Position = UDim2.new(0.05, 0, 0.35, 0)
playerListFrame.BackgroundColor3 = Color3.fromRGB(50,50,50)
local listCorner = Instance.new("UICorner", playerListFrame)
listCorner.CornerRadius = UDim.new(0, 6)

local selectedText = Instance.new("TextLabel", playerListFrame)
selectedText.Size = UDim2.new(1, -10, 1, 0)
selectedText.Position = UDim2.new(0, 5, 0, 0)
selectedText.BackgroundTransparency = 1
selectedText.Text = "Выбери игрока"
selectedText.TextColor3 = Color3.fromRGB(200,200,200)
selectedText.Font = Enum.Font.Gotham
selectedText.TextSize = 14
selectedText.TextXAlignment = Enum.TextXAlignment.Left

local arrow = Instance.new("ImageButton", playerListFrame)
arrow.Size = UDim2.new(0, 20, 0, 20)
arrow.Position = UDim2.new(1, -22, 0, 0)
arrow.BackgroundTransparency = 1
arrow.Image = "rbxassetid://3926305904" -- стрелка вправо
arrow.ImageRectOffset = Vector2.new(784, 204)
arrow.ImageRectSize = Vector2.new(36, 36)

-- Список (скрытый)
local listScrolling = Instance.new("ScrollingFrame", menu)
listScrolling.Size = UDim2.new(1, -20, 0, 100)
listScrolling.Position = UDim2.new(0.05, 0, 0.6, 0)
listScrolling.BackgroundColor3 = Color3.fromRGB(40,40,40)
listScrolling.BorderSizePixel = 0
listScrolling.ScrollBarThickness = 4
listScrolling.Visible = false
listScrolling.CanvasSize = UDim2.new(0, 0, 0, 0)
local scrollCorner = Instance.new("UICorner", listScrolling)
scrollCorner.CornerRadius = UDim.new(0, 6)

local listLayout = Instance.new("UIListLayout", listScrolling)
listLayout.SortOrder = Enum.SortOrder.Name
listLayout.Padding = UDim.new(0, 2)

-- Кнопка старт/стоп
local actionButton = Instance.new("TextButton", menu)
actionButton.Size = UDim2.new(0, 120, 0, 26)
actionButton.Position = UDim2.new(0.5, -60, 0.85, 0)
actionButton.BackgroundColor3 = Color3.fromRGB(150,30,30)
actionButton.Text = "Start Fucking"
actionButton.TextColor3 = Color3.new(1,1,1)
actionButton.Font = Enum.Font.GothamBold
actionButton.TextSize = 14
local btnCorner = Instance.new("UICorner", actionButton)
btnCorner.CornerRadius = UDim.new(0, 8)

-- Логика
local isActive = false
local targetPlayer = nil
local selectedIdx = nil

local function updatePlayerList()
    -- Очищаем старые кнопки
    for _, child in ipairs(listScrolling:GetChildren()) do
        if child:IsA("TextButton") then child:Destroy() end
    end
    local players = Players:GetPlayers()
    local ySize = 0
    for i, p in ipairs(players) do
        if p ~= player then
            local btn = Instance.new("TextButton")
            btn.Size = UDim2.new(1, 0, 0, 22)
            btn.BackgroundColor3 = Color3.fromRGB(60,60,60)
            btn.Text = p.Name
            btn.TextColor3 = Color3.new(1,1,1)
            btn.Font = Enum.Font.Gotham
            btn.TextSize = 14
            btn.Name = p.Name
            local corner = Instance.new("UICorner", btn)
            corner.CornerRadius = UDim.new(0, 4)
            btn.MouseButton1Click:Connect(function()
                selectedText.Text = p.Name
                targetPlayer = p
                listScrolling.Visible = false
            end)
            btn.Parent = listScrolling
            ySize = ySize + 24
        end
    end
    listScrolling.CanvasSize = UDim2.new(0, 0, 0, ySize)
end

-- Показать/скрыть список
arrow.MouseButton1Click:Connect(function()
    listScrolling.Visible = not listScrolling.Visible
    updatePlayerList()
end)

-- Логика движения
local function trollLoop()
    while isActive and targetPlayer do
        local targetChar = targetPlayer.Character
        if not targetChar then break end
        local targetRoot = targetChar:FindFirstChild("HumanoidRootPart")
        if not targetRoot then break end
        local myChar = player.Character
        if not myChar then break end
        local myRoot = myChar:FindFirstChild("HumanoidRootPart")
        if not myRoot then break end

        local look = targetRoot.CFrame.LookVector
        local targetPos = targetRoot.Position

        -- Дальняя точка (2.5 стада позади)
        local farPos = targetPos - (look * 2.5)
        -- Ближняя точка (0.8 стада позади)
        local nearPos = targetPos - (look * 0.8)

        -- Телепорт в дальнюю
        myRoot.CFrame = CFrame.new(farPos) * CFrame.Angles(0, targetRoot.CFrame.Rotation.Y, 0)
        task.wait(0.4)

        if not isActive then break end

        -- Телепорт в ближнюю
        myRoot.CFrame = CFrame.new(nearPos) * CFrame.Angles(0, targetRoot.CFrame.Rotation.Y, 0)
        task.wait(0.4)
    end
    isActive = false
    actionButton.Text = "Start Fucking"
    actionButton.BackgroundColor3 = Color3.fromRGB(150,30,30)
end

actionButton.MouseButton1Click:Connect(function()
    if isActive then
        isActive = false
        actionButton.Text = "Start Fucking"
        actionButton.BackgroundColor3 = Color3.fromRGB(150,30,30)
    else
        if not targetPlayer then
            selectedText.Text = "Выбери игрока!"
            return
        end
        isActive = true
        actionButton.Text = "Stop Fucking"
        actionButton.BackgroundColor3 = Color3.fromRGB(30,150,30)
        -- Запускаем цикл в отдельном потоке
        coroutine.wrap(trollLoop)()
    end
end)

-- Открытие/закрытие меню по клику на круглую кнопку
toggleBtn.MouseButton1Click:Connect(function()
    menu.Visible = not menu.Visible
    innerCircle.BackgroundColor3 = menu.Visible and Color3.fromRGB(150,50,50) or Color3.fromRGB(80,80,80)
end)
