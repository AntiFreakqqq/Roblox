local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local LocalPlayer = Players.LocalPlayer

local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "PremiumTargetGui"
ScreenGui.ResetOnSpawn = false
ScreenGui.Parent = game:CoreGui

local config = { speed = 15, distance = 3, amplitude = 2.5 }
local menuOpen, selectedPlayer, activeMode, loopConnection = false, nil, nil, nil

local function round(instance, radius)
    local corner = Instance.new("UICorner")
    corner.CornerRadius = UDim.new(0, radius)
    corner.Parent = instance
end

local function drag(gui)
    local dragging, dragInput, dragStart, startPos
    gui.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
            dragging = true
            dragStart = input.Position
            startPos = gui.Position
            input.Changed:Connect(function()
                if input.UserInputState == Enum.UserInputState.End then dragging = false end
            end)
        end
    end)
    gui.InputChanged:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
            dragInput = input
        end
    end)
    RunService.RenderStepped:Connect(function()
        if dragging and dragInput then
            local delta = dragInput.Position - dragStart
            gui.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
        end
    end)
end

local ToggleButton = Instance.new("TextButton")
ToggleButton.Size = UDim2.new(0, 60, 0, 60)
ToggleButton.Position = UDim2.new(0, 40, 0, 40)
ToggleButton.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
ToggleButton.TextColor3 = Color3.fromRGB(255, 255, 255)
ToggleButton.Text = "MENU"
ToggleButton.Font = Enum.Font.GothamBold
ToggleButton.TextSize = 14
ToggleButton.Parent = ScreenGui
round(ToggleButton, 30)
drag(ToggleButton)

local MainMenu = Instance.new("Frame")
MainMenu.Size = UDim2.new(0, 340, 0, 360)
MainMenu.Position = UDim2.new(0.5, -170, 0.5, -180)
MainMenu.BackgroundColor3 = Color3.fromRGB(12, 12, 12)
MainMenu.Visible = false
MainMenu.Parent = ScreenGui
round(MainMenu, 14)

local Title = Instance.new("TextLabel")
Title.Size = UDim2.new(1, 0, 0, 45)
Title.BackgroundTransparency = 1
Title.Text = "TARGET CONTROL SYSTEM v2"
Title.TextColor3 = Color3.fromRGB(240, 240, 240)
Title.Font = Enum.Font.GothamBold
Title.TextSize = 15
Title.Parent = MainMenu
local TargetLabel = Instance.new("TextLabel")
TargetLabel.Size = UDim2.new(1, -30, 0, 25)
TargetLabel.Position = UDim2.new(0, 15, 0, 45)
TargetLabel.BackgroundTransparency = 1
TargetLabel.Text = "ЦЕЛЬ: НЕ ВЫБРАНА"
TargetLabel.TextColor3 = Color3.fromRGB(255, 170, 0)
TargetLabel.Font = Enum.Font.GothamBold
TargetLabel.TextSize = 12
TargetLabel.TextXAlignment = Enum.TextXAlignment.Left
TargetLabel.Parent = MainMenu

local DropdownToggle = Instance.new("TextButton")
DropdownToggle.Size = UDim2.new(1, -30, 0, 35)
DropdownToggle.Position = UDim2.new(0, 15, 0, 75)
DropdownToggle.BackgroundColor3 = Color3.fromRGB(22, 22, 22)
DropdownToggle.TextColor3 = Color3.fromRGB(200, 200, 200)
DropdownToggle.Text = "Выбрать игрока из списка          ▶"
DropdownToggle.Font = Enum.Font.GothamMedium
DropdownToggle.TextSize = 13
DropdownToggle.Parent = MainMenu
round(DropdownToggle, 6)

local BackBtn = Instance.new("TextButton")
BackBtn.Size = UDim2.new(0, 145, 0, 40)
BackBtn.Position = UDim2.new(0, 15, 0, 125)
BackBtn.BackgroundColor3 = Color3.fromRGB(22, 22, 22)
BackBtn.TextColor3 = Color3.fromRGB(255, 70, 70)
BackBtn.Text = "ТАРГЕТ СПИНА: ВЫКЛ"
BackBtn.Font = Enum.Font.GothamBold
BackBtn.TextSize = 11
BackBtn.Parent = MainMenu
round(BackBtn, 6)

local FaceBtn = Instance.new("TextButton")
FaceBtn.Size = UDim2.new(0, 155, 0, 40)
FaceBtn.Position = UDim2.new(0, 170, 0, 125)
FaceBtn.BackgroundColor3 = Color3.fromRGB(22, 22, 22)
FaceBtn.TextColor3 = Color3.fromRGB(255, 70, 70)
FaceBtn.Text = "ЛИЦО (ДЕЛЬФИН): ВЫКЛ"
FaceBtn.Font = Enum.Font.GothamBold
FaceBtn.TextSize = 11
FaceBtn.Parent = MainMenu
round(FaceBtn, 6)

local function createSlider(name, min, max, default, orderY, callback)
    local SliderFrame = Instance.new("Frame")
    SliderFrame.Size = UDim2.new(1, -30, 0, 45)
    SliderFrame.Position = UDim2.new(0, 15, 0, orderY)
    SliderFrame.BackgroundTransparency = 1
    SliderFrame.Parent = MainMenu

    local Label = Instance.new("TextLabel")
    Label.Size = UDim2.new(1, 0, 0, 15)
    Label.BackgroundTransparency = 1
    Label.Text = name .. ": " .. default
    Label.TextColor3 = Color3.fromRGB(180, 180, 180)
    Label.Font = Enum.Font.Gotham
    Label.TextSize = 12
    Label.TextXAlignment = Enum.TextXAlignment.Left
    Label.Parent = SliderFrame

    local Track = Instance.new("Frame")
    Track.Size = UDim2.new(1, 0, 0, 6)
    Track.Position = UDim2.new(0, 0, 0, 25)
    Track.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
    Track.Parent = SliderFrame
    round(Track, 3)

    local Fill = Instance.new("Frame")
    Fill.Size = UDim2.new((default - min) / (max - min), 0, 1, 0)
    Fill.BackgroundColor3 = Color3.fromRGB(255, 170, 0)
    Fill.Parent = Track
    round(Fill, 3)

    local Trigger = Instance.new("TextButton")
    Trigger.Size = UDim2.new(1, 0, 1, 0)
    Trigger.BackgroundTransparency = 1
    Trigger.Text = ""
    Trigger.Parent = Track

    local function updateSlider(input)
        local percentage = math.clamp((input.Position.X - Track.AbsolutePosition.X) / Track.AbsoluteSize.X, 0, 1)
        Fill.Size = UDim2.new(percentage, 0, 1, 0)
        local value = math.floor(min + (percentage * (max - min)))
        Label.Text = name .. ": " .. value
        callback(value)
    end

    local sliding = false
    Trigger.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
            sliding = true; updateSlider(input)
        end
    end)
    UserInputService.InputChanged:Connect(function(input)
        if sliding and (input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch) then
            updateSlider(input)
        end
    end)
    UserInputService.InputEnded:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
            sliding = false
        end
    end)
end

createSlider("Скорость движений", 5, 40, config.speed, 185, function(v) config.speed = v end)
createSlider("Базовая дистанция", 1, 10, config.distance, 240, function(v) config.distance = v end)
createSlider("Амплитуда (Размах)", 1, 6, config.amplitude, 295, function(v) config.amplitude = v end)
local PlayerList = Instance.new("ScrollingFrame")
PlayerList.Size = UDim2.new(0, 310, 0, 140)
PlayerList.Position = UDim2.new(0, 15, 0, 115)
PlayerList.BackgroundColor3 = Color3.fromRGB(8, 8, 8)
PlayerList.BorderSizePixel = 0
PlayerList.Visible = false
PlayerList.ZIndex = 5
PlayerList.ScrollBarThickness = 4
PlayerList.Parent = MainMenu
round(PlayerList, 6)

local ListLayout = Instance.new("UIListLayout")
ListLayout.Parent = PlayerList

local function updateDropdown()
    for _, item in ipairs(PlayerList:GetChildren()) do
        if item:IsA("TextButton") then item:Destroy() end
    end
    local count = 0
    for _, p in ipairs(Players:GetPlayers()) do
        if p ~= LocalPlayer then
            count = count + 1
            local PBtn = Instance.new("TextButton")
            PBtn.Size = UDim2.new(1, 0, 0, 30)
            PBtn.BackgroundColor3 = Color3.fromRGB(16, 16, 16)
            PBtn.TextColor3 = Color3.fromRGB(230, 230, 230)
            PBtn.Text = p.DisplayName .. " (@" .. p.Name .. ")"
            PBtn.Font = Enum.Font.Gotham
            PBtn.TextSize = 12
            PBtn.ZIndex = 6
            PBtn.Parent = PlayerList
            
            PBtn.MouseButton1Click:Connect(function()
                selectedPlayer = p
                TargetLabel.Text = "ЦЕЛЬ: " .. p.Name:upper()
                PlayerList.Visible = false
                DropdownToggle.Text = "Выбрать игрока из списка          ▶"
            end)
        end
    end
    PlayerList.CanvasSize = UDim2.new(0, 0, 0, count * 30)
end

DropdownToggle.MouseButton1Click:Connect(function()
    if PlayerList.Visible then
        PlayerList.Visible = false
        DropdownToggle.Text = "Выбрать игрока из списка          ▶"
    else
        updateDropdown()
        PlayerList.Visible = true
        DropdownToggle.Text = "Закрыть список игроков            ▼"
    end
end)

ToggleButton.MouseButton1Click:Connect(function()
    menuOpen = not menuOpen
    MainMenu.Visible = menuOpen
    if not menuOpen then PlayerList.Visible = false end
end)

local function stopLoops()
    if loopConnection then loopConnection:Disconnect(); loopConnection = nil end
    BackBtn.Text = "ТАРГЕТ СПИНА: ВЫКЛ"; BackBtn.TextColor3 = Color3.fromRGB(255, 70, 70)
    FaceBtn.Text = "ЛИЦО (ДЕЛЬФИН): ВЫКЛ"; FaceBtn.TextColor3 = Color3.fromRGB(255, 70, 70)
end

local function startLoop(mode)
    stopLoops()
    activeMode = mode
    if mode == "back" then
        BackBtn.Text = "ТАРГЕТ СПИНА: ВКЛ"; BackBtn.TextColor3 = Color3.fromRGB(70, 255, 70)
    elseif mode == "face" then
        FaceBtn.Text = "ЛИЦО (ДЕЛЬФИН): ВКЛ"; FaceBtn.TextColor3 = Color3.fromRGB(70, 255, 70)
    end

    loopConnection = RunService.Heartbeat:Connect(function()
        if not selectedPlayer or not selectedPlayer.Character or not LocalPlayer.Character then return end
        local targetRoot = selectedPlayer.Character:FindFirstChild("HumanoidRootPart")
        local myRoot = LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
        if not targetRoot or not myRoot then return end
        
        local dynamicOffset = config.distance + (math.sin(tick() * config.speed) * config.amplitude)
        
        if activeMode == "back" then
            local finalPos = targetRoot.Position - (targetRoot.CFrame.LookVector * dynamicOffset)
            myRoot.CFrame = CFrame.new(finalPos, targetRoot.Position)
        elseif activeMode == "face" then
            local finalPos = targetRoot.Position + (targetRoot.CFrame.LookVector * dynamicOffset)
            local baseCFrame = CFrame.new(finalPos, targetRoot.Position + Vector3.new(0, 1.5, 0))
            myRoot.CFrame = baseCFrame * CFrame.Angles(math.rad(-90), 0, 0)
        end
    end)
end

BackBtn.MouseButton1Click:Connect(function()
    if not selectedPlayer then return end
    if activeMode == "back" then activeMode = nil; stopLoops() else startLoop("back") end
end)

FaceBtn.MouseButton1Click:Connect(function()
    if not selectedPlayer then return end
    if activeMode == "face" then activeMode = nil; stopLoops() else startLoop("face") end
end)
