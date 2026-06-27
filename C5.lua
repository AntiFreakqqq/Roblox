local TweenService = game:GetService("TweenService")
local UserInputService = game:GetService("UserInputService")
local Players = game:GetService("Players")
local LP = Players.LocalPlayer
local WS = game:GetService("Workspace")

local guiName = "EliteMenu_V2"
local targetGui = (pcall(function() return game:GetService("CoreGui"):GetChildren() end)) and game:GetService("CoreGui") or LP:WaitForChild("PlayerGui")

if targetGui:FindFirstChild(guiName) then targetGui[guiName]:Destroy() end

local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = guiName
ScreenGui.Parent = targetGui
ScreenGui.ResetOnSpawn = false
ScreenGui.IgnoreGuiInset = true

local Style = {
    Bg = Color3.fromRGB(15, 15, 15),
    Secondary = Color3.fromRGB(22, 22, 22),
    Accent = Color3.fromRGB(65, 130, 220),
    Text = Color3.fromRGB(235, 235, 235),
    TextDark = Color3.fromRGB(150, 150, 150),
    Corner = UDim.new(0, 12),
    Tween = TweenInfo.new(0.4, Enum.EasingStyle.Quart, Enum.EasingDirection.Out)
}

local OpenBtn = Instance.new("TextButton", ScreenGui)
OpenBtn.Size = UDim2.new(0, 52, 0, 52)
OpenBtn.Position = UDim2.new(0.05, 0, 0.5, -26)
OpenBtn.BackgroundColor3 = Style.Bg
OpenBtn.Text = "★"
OpenBtn.TextColor3 = Style.Accent
OpenBtn.TextSize = 24
OpenBtn.Font = Enum.Font.GothamBold
Instance.new("UICorner", OpenBtn).CornerRadius = UDim.new(1, 0)

local StrokeBtn = Instance.new("UIStroke", OpenBtn)
StrokeBtn.Color = Style.Accent
StrokeBtn.Thickness = 1.5

local Main = Instance.new("Frame", ScreenGui)
Main.Size = UDim2.new(0, 340, 0, 260)
Main.Position = UDim2.new(0.5, -170, 0.5, -130)
Main.BackgroundColor3 = Style.Bg
Main.Visible = false
Main.Active = true
Instance.new("UICorner", Main).CornerRadius = Style.Corner

local MainStroke = Instance.new("UIStroke", Main)
MainStroke.Color = Color3.fromRGB(40, 40, 40)
MainStroke.Thickness = 1

local StatsFrame = Instance.new("Frame", ScreenGui)
StatsFrame.Size = UDim2.new(0, 200, 0, 100)
StatsFrame.Position = UDim2.new(0.5, -100, 0.1, 0)
StatsFrame.BackgroundColor3 = Style.Bg
StatsFrame.Visible = false
StatsFrame.Active = true
Instance.new("UICorner", StatsFrame).CornerRadius = Style.Corner

local StatsStroke = Instance.new("UIStroke", StatsFrame)
StatsStroke.Color = Style.Accent
StatsStroke.Thickness = 1

local TimeLabel = Instance.new("TextLabel", StatsFrame)
TimeLabel.Size = UDim2.new(1, -20, 0, 40)
TimeLabel.Position = UDim2.new(0, 10, 0, 10)
TimeLabel.BackgroundTransparency = 1
TimeLabel.Text = "Time: 00:00"
TimeLabel.TextColor3 = Style.Text
TimeLabel.TextSize = 16
TimeLabel.Font = Enum.Font.GothamBold
TimeLabel.TextXAlignment = Enum.TextXAlignment.Left

local GoldLabel = Instance.new("TextLabel", StatsFrame)
GoldLabel.Size = UDim2.new(1, -20, 0, 40)
GoldLabel.Position = UDim2.new(0, 10, 0, 50)
GoldLabel.BackgroundTransparency = 1
GoldLabel.Text = "Gold: 0"
GoldLabel.TextColor3 = Style.Accent
GoldLabel.TextSize = 16
GoldLabel.Font = Enum.Font.GothamBold
GoldLabel.TextXAlignment = Enum.TextXAlignment.Left

local dragging, dragInput, dragStart, startPos

OpenBtn.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
        dragging = true
        dragStart = input.Position
        startPos = OpenBtn.Position
        
        input.Changed:Connect(function()
            if input.UserInputState == Enum.UserInputState.End then
                dragging = false
            end
        end)
    end
end)

UserInputService.InputChanged:Connect(function(input)
    if dragging and (input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch) then
        local delta = input.Position - dragStart
        OpenBtn.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
    end
end)

OpenBtn.MouseButton1Click:Connect(function()
    Main.Visible = not Main.Visible
    if Main.Visible then
        Main.Size = UDim2.new(0, 0, 0, 0)
        TweenService:Create(Main, Style.Tween, {Size = UDim2.new(0, 340, 0, 260)}):Play()
    end
end)

local FarmEnabled = false
local FarmSpeed = 1.6
local TotalGold = 0
local StartTime = os.time()

task.spawn(function()
    while true do
        if FarmEnabled then
            local duration = os.time() - StartTime
            local minutes = math.floor(duration / 60)
            local seconds = duration % 60
            TimeLabel.Text = string.format("Time: %02d:%02d", minutes, seconds)
        end
        task.wait(1)
    end
end)

local function StartFarm()
    task.spawn(function()
        while FarmEnabled do
            local char = LP.Character
            if char and char:FindFirstChild("HumanoidRootPart") and char:FindFirstChild("Humanoid") then
                local hrp = char.HumanoidRootPart
                local hum = char.Humanoid
                
                local stage = WS:FindFirstChild("BoatStages") and WS.BoatStages:FindFirstChild("NormalStages")
                local dark = stage and stage:FindFirstChild("CaveStage1") and stage.CaveStage1:FindFirstChild("DarknessPart")
                
                if dark then
                    hrp.CFrame = dark.CFrame
                    
                    for i = 1, 20 do
                        if not FarmEnabled then break end
                        firetouchinterest(hrp, dark, 0)
                        firetouchinterest(hrp, dark, 1)
                    end
                    
                    local tTime = 0
                    while tTime < FarmSpeed and FarmEnabled do
                        hrp.CFrame = dark.CFrame * CFrame.new(1.2, 0, 0)
                        task.wait(0.08)
                        hrp.CFrame = dark.CFrame * CFrame.new(-1.2, 0, 0)
                        task.wait(0.08)
                        tTime = tTime + 0.16
                    end
                    
                    if FarmEnabled then
                        TotalGold = TotalGold + 16
                        GoldLabel.Text = "Gold: " .. TotalGold
                        
                        local respawned = false
                        local conn = LP.CharacterAdded:Connect(function() respawned = true end)
                        
                        hum.Health = 0
                        repeat task.wait(0.05) until respawned or not FarmEnabled
                        if conn then conn:Disconnect() end
                    end
                end
            end
            task.wait(0.5)
        end
    end)
end

local ToggleBtn = Instance.new("TextButton", Main)
ToggleBtn.Size = UDim2.new(0, 300, 0, 42)
ToggleBtn.Position = UDim2.new(0, 20, 0, 20)
ToggleBtn.BackgroundColor3 = Style.Secondary
ToggleBtn.Text = "Fast Farm: OFF"
ToggleBtn.TextColor3 = Style.Text
ToggleBtn.Font = Enum.Font.GothamBold
ToggleBtn.TextSize = 14
Instance.new("UICorner", ToggleBtn).CornerRadius = UDim.new(0, 6)

ToggleBtn.MouseButton1Click:Connect(function()
    FarmEnabled = not FarmEnabled
    StatsFrame.Visible = true
    
    if FarmEnabled then
        ToggleBtn.Text = "Fast Farm: ON"
        ToggleBtn.BackgroundColor3 = Style.Accent
        StartTime = os.time()
        StartFarm()
    else
        ToggleBtn.Text = "Fast Farm: OFF"
        ToggleBtn.BackgroundColor3 = Style.Secondary
    end
end)

local SliderFrame = Instance.new("Frame", Main)
SliderFrame.Size = UDim2.new(0, 300, 0, 50)
SliderFrame.Position = UDim2.new(0, 20, 0, 80)
SliderFrame.BackgroundColor3 = Style.Secondary
Instance.new("UICorner", SliderFrame).CornerRadius = UDim.new(0, 6)

local SliderLabel = Instance.new("TextLabel", SliderFrame)
SliderLabel.Size = UDim2.new(1, -20, 0, 20)
SliderLabel.Position = UDim2.new(0, 10, 0, 5)
SliderLabel.BackgroundTransparency = 1
SliderLabel.Text = "Farm Delay: 1.6s"
SliderLabel.TextColor3 = Style.TextDark
SliderLabel.TextSize = 12
SliderLabel.Font = Enum.Font.GothamMedium
SliderLabel.TextXAlignment = Enum.TextXAlignment.Left

local SliderBar = Instance.new("TextButton", SliderFrame)
SliderBar.Size = UDim2.new(1, -20, 0, 6)
SliderBar.Position = UDim2.new(0, 10, 0, 32)
SliderBar.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
SliderBar.Text = ""
Instance.new("UICorner", SliderBar).CornerRadius = UDim.new(1, 0)

local SliderFill = Instance.new("Frame", SliderBar)
SliderFill.Size = UDim2.new(0.6, 0, 1, 0)
SliderFill.BackgroundColor3 = Style.Accent
Instance.new("UICorner", SliderFill).CornerRadius = UDim.new(1, 0)

local function UpdateSlider(input)
    local percentage = math.clamp((input.Position.X - SliderBar.AbsolutePosition.X) / SliderBar.AbsoluteSize.X, 0, 1)
    SliderFill.Size = UDim2.new(percentage, 0, 1, 0)
    
    FarmSpeed = math.round((0.5 + (percentage * 2.5)) * 10) / 10
    SliderLabel.Text = "Farm Delay: " .. string.format("%.1f", FarmSpeed) .. "s"
end

local sliding = false
SliderBar.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
        sliding = true
        UpdateSlider(input)
    end
end)

UserInputService.InputChanged:Connect(function(input)
    if sliding and (input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch) then
        UpdateSlider(input)
    end
end)

UserInputService.InputEnded:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
        sliding = false
    end
end)
