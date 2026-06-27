-- Roblox TargetFucker GUI (Mobile optimized)
local Players = game:GetService("Players")
local player = Players.LocalPlayer

-- Переменные
local isActive = false
local targetPlayer = nil

-- === GUI ===
local screenGui = Instance.new("ScreenGui")
screenGui.Name = "TargetFuckerGUI"
screenGui.Parent = game:GetService("CoreGui")
screenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

-- Круглая кнопка
local toggleBtn = Instance.new("TextButton")
toggleBtn.Size = UDim2.new(0, 56, 0, 56)
toggleBtn.Position = UDim2.new(0.4, 0, 0.4, 0)
toggleBtn.BackgroundColor3 = Color3.fromRGB(30,30,30)
toggleBtn.Text = ""
toggleBtn.AutoButtonColor = false
toggleBtn.Active = true
toggleBtn.Parent = screenGui

local btnCorner = Instance.new("UICorner", toggleBtn)
btnCorner.CornerRadius = UDim.new(0.5, 0) -- круг
Instance.new("UIDragDetector", toggleBtn)

-- Основное меню (автовысота)
local menu = Instance.new("Frame")
menu.Name = "MainMenu"
menu.Size = UDim2.new(0, 300, 0, 0)
menu.Position = UDim2.new(0.3, 0, 0.3, 0)
menu.BackgroundColor3 = Color3.fromRGB(20,20,20)
menu.BorderSizePixel = 0
menu.Visible = false
menu.AutomaticSize = Enum.AutomaticSize.Y
menu.ClipsDescendants = true
menu.Parent = screenGui

local menuCorner = Instance.new("UICorner", menu)
menuCorner.CornerRadius = UDim.new(0, 12)

local uiList = Instance.new("UIListLayout", menu)
uiList.SortOrder = Enum.SortOrder.LayoutOrder
uiList.Padding = UDim.new(0, 5)
uiList.HorizontalAlignment = Enum.HorizontalAlignment.Center

-- Заголовок (перетаскивание)
local header = Instance.new("TextLabel")
header.Size = UDim2.new(1, -10, 0, 30)
header.BackgroundTransparency = 1
header.Text = "Target Fucker"
header.TextColor3 = Color3.fromRGB(220,220,220)
header.Font = Enum.Font.GothamBold
header.TextSize = 16
header.TextXAlignment = Enum.TextXAlignment.Center
header.LayoutOrder = 0
header.Parent = menu
Instance.new("UIDragDetector", header)

-- Разделитель
local divider = Instance.new("Frame")
divider.Size = UDim2.new(1, 0, 0, 2)
divider.BackgroundColor3 = Color3.fromRGB(100,100,100)
divider.LayoutOrder = 1
divider.Parent = menu

-- Панель выбора игрока
local playerSelectFrame = Instance.new("Frame")
playerSelectFrame.Size = UDim2.new(1, -20, 0, 30)
playerSelectFrame.BackgroundColor3 = Color3.fromRGB(45,45,45)
playerSelectFrame.LayoutOrder = 2
local psCorner = Instance.new("UICorner", playerSelectFrame)
psCorner.CornerRadius = UDim.new(0, 6)
playerSelectFrame.Parent = menu

local selectedText = Instance.new("TextLabel")
selectedText.Size = UDim2.new(1, -30, 1, 0)
selectedText.Position = UDim2.new(0, 8, 0, 0)
selectedText.BackgroundTransparency = 1
selectedText.Text = "Выбери игрока"
selectedText.TextColor3 = Color3.fromRGB(200,200,200)
selectedText.Font = Enum.Font.Gotham
selectedText.TextSize = 14
selectedText.TextXAlignment = Enum.TextXAlignment.Left
selectedText.Parent = playerSelectFrame

local arrow = Instance.new("ImageButton")
arrow.Size = UDim2.new(0, 24, 0, 24)
arrow.Position = UDim2.new(1, -28, 0.5, -12)
arrow.BackgroundTransparency = 1
arrow.Image = "rbxassetid://3926305904"
arrow.ImageRectOffset = Vector2.new(784, 204)
arrow.ImageRectSize = Vector2.new(36, 36)
arrow.Active = true
arrow.Parent = playerSelectFrame

-- Функция создания контрола с +/- (возвращает объект с get())
local function createAdjuster(name, initial, min, max, step, layoutOrder)
    local frame = Instance.new("Frame")
    frame.Size = UDim2.new(1, -20, 0, 24)
    frame.BackgroundTransparency = 1
    frame.LayoutOrder = layoutOrder

    local label = Instance.new("TextLabel", frame)
    label.Size = UDim2.new(0.45, 0, 1, 0)
    label.BackgroundTransparency = 1
    label.Text = name .. ": " .. tostring(initial)
    label.TextColor3 = Color3.fromRGB(200,200,200)
    label.Font = Enum.Font.Gotham
    label.TextSize = 12
    label.TextXAlignment = Enum.TextXAlignment.Left

    local minusBtn = Instance.new("TextButton", frame)
    minusBtn.Size = UDim2.new(0, 22, 0, 22)
    minusBtn.Position = UDim2.new(0.55, 0, 0, 0)
    minusBtn.Text = "-"
    minusBtn.TextColor3 = Color3.new(1,1,1)
    minusBtn.BackgroundColor3 = Color3.fromRGB(80,80,80)
    minusBtn.Font = Enum.Font.GothamBold
    minusBtn.TextSize = 18

    local valueText = Instance.new("TextLabel", frame)
    valueText.Size = UDim2.new(0, 36, 1, 0)
    valueText.Position = UDim2.new(0.55, 24, 0, 0)
    valueText.BackgroundTransparency = 1
    valueText.Text = tostring(initial)
    valueText.TextColor3 = Color3.new(1,1,1)
    valueText.Font = Enum.Font.Gotham
    valueText.TextSize = 14
    valueText.TextXAlignment = Enum.TextXAlignment.Center

    local plusBtn = Instance.new("TextButton", frame)
    plusBtn.Size = UDim2.new(0, 22, 0, 22)
    plusBtn.Position = UDim2.new(0.55, 62, 0, 0)
    plusBtn.Text = "+"
    plusBtn.TextColor3 = Color3.new(1,1,1)
    plusBtn.BackgroundColor3 = Color3.fromRGB(80,80,80)
    plusBtn.Font = Enum.Font.GothamBold
    plusBtn.TextSize = 18

    local current = initial
    local function updateValue(newVal)
        newVal = math.clamp(tonumber(string.format("%.1f", newVal)) or newVal, min, max)
        current = newVal
        valueText.Text = string.format("%.1f", current)
        label.Text = name .. ": " .. string.format("%.1f", current)
        return current
    end

    minusBtn.MouseButton1Click:Connect(function()
        current = updateValue(current - step)
    end)
    plusBtn.MouseButton1Click:Connect(function()
        current = updateValue(current + step)
    end)

    local controller = { frame = frame }
    function controller.get()
        return current
    end
    function controller.set(v)
        updateValue(v)
    end
    return controller
end

-- Добавляем контролы в меню
local speedCtrl = createAdjuster("Speed", 0.4, 0.1, 2.0, 0.1, 3)
speedCtrl.frame.Parent = menu
local backDistCtrl = createAdjuster("Back Dist", 2.5, 1.0, 10.0, 0.5, 4)
backDistCtrl.frame.Parent = menu
local closeDistCtrl = createAdjuster("Close Dist", 0.8, 0.2, 5.0, 0.2, 5)
closeDistCtrl.frame.Parent = menu

-- Кнопка Старт/Стоп
local actionButton = Instance.new("TextButton")
actionButton.Size = UDim2.new(0, 140, 0, 32)
actionButton.BackgroundColor3 = Color3.fromRGB(150,30,30)
actionButton.Text = "Start Fucking"
actionButton.TextColor3 = Color3.new(1,1,1)
actionButton.Font = Enum.Font.GothamBold
actionButton.TextSize = 14
actionButton.LayoutOrder = 6
local btnCorner2 = Instance.new("UICorner", actionButton)
btnCorner2.CornerRadius = UDim.new(0, 8)
actionButton.Parent = menu

-- Выпадающий список игроков (отдельное окно)
local dropdown = Instance.new("Frame")
dropdown.Name = "Dropdown"
dropdown.Size = UDim2.new(0, 280, 0, 150)
dropdown.BackgroundColor3 = Color3.fromRGB(35,35,35)
dropdown.BorderSizePixel = 0
dropdown.Visible = false
dropdown.Parent = screenGui
dropdown.ZIndex = 10
local dropCorner = Instance.new("UICorner", dropdown)
dropCorner.CornerRadius = UDim.new(0, 8)

local listFrame = Instance.new("ScrollingFrame", dropdown)
listFrame.Size = UDim2.new(1, -8, 1, -8)
listFrame.Position = UDim2.new(0, 4, 0, 4)
listFrame.BackgroundColor3 = Color3.fromRGB(45,45,45)
listFrame.BorderSizePixel = 0
listFrame.ScrollBarThickness = 5
listFrame.CanvasSize = UDim2.new(0, 0, 0, 0)
listFrame.ScrollingDirection = Enum.ScrollingDirection.Y
local listLayout = Instance.new("UIListLayout", listFrame)
listLayout.Padding = UDim.new(0, 2)

-- Позиционирование выпадашки под кнопкой выбора
local function positionDropdown()
    local abs = playerSelectFrame.AbsolutePosition
    local size = playerSelectFrame.AbsoluteSize
    dropdown.Position = UDim2.new(0, abs.X, 0, abs.Y + size.Y + 2)
end

-- Обновление списка
local function updatePlayerList()
    for _, child in ipairs(listFrame:GetChildren()) do
        if child:IsA("TextButton") then child:Destroy() end
    end
    local players = Players:GetPlayers()
    local y = 0
    for _, p in ipairs(players) do
        if p ~= player then
            local btn = Instance.new("TextButton")
            btn.Size = UDim2.new(1, 0, 0, 24)
            btn.BackgroundColor3 = Color3.fromRGB(60,60,60)
            btn.Text = p.Name
            btn.TextColor3 = Color3.new(1,1,1)
            btn.Font = Enum.Font.Gotham
            btn.TextSize = 13
            local corner = Instance.new("UICorner", btn)
            corner.CornerRadius = UDim.new(0, 4)
            btn.MouseButton1Click:Connect(function()
                selectedText.Text = p.Name
                targetPlayer = p
                dropdown.Visible = false
            end)
            btn.Parent = listFrame
            y = y + 26
        end
    end
    listFrame.CanvasSize = UDim2.new(0, 0, 0, y)
end

-- Открыть/закрыть список
arrow.MouseButton1Click:Connect(function()
    dropdown.Visible = not dropdown.Visible
    if dropdown.Visible then
        updatePlayerList()
        positionDropdown()
    end
end)

-- Следить за перемещением меню
menu:GetPropertyChangedSignal("AbsolutePosition"):Connect(function()
    if dropdown.Visible then positionDropdown() end
end)

-- === Логика движения ===
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
        local pos = targetRoot.Position
        local far = pos - look * backDistCtrl.get()
        local near = pos - look * closeDistCtrl.get()

        myRoot.CFrame = CFrame.new(far) * CFrame.Angles(0, targetRoot.CFrame.Rotation.Y, 0)
        task.wait(speedCtrl.get())
        if not isActive then break end
        myRoot.CFrame = CFrame.new(near) * CFrame.Angles(0, targetRoot.CFrame.Rotation.Y, 0)
        task.wait(speedCtrl.get())
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
        coroutine.wrap(trollLoop)()
    end
end)

-- === Кнопка открытия меню ===
toggleBtn.MouseButton1Click:Connect(function()
    menu.Visible = not menu.Visible
    toggleBtn.BackgroundColor3 = menu.Visible and Color3.fromRGB(150,50,50) or Color3.fromRGB(30,30,30)
    if not menu.Visible then
        dropdown.Visible = false
    end
end)
