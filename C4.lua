local TweenService = game:GetService("TweenService")
local UserInputService = game:GetService("UserInputService")
local Players = game:GetService("Players")
local LP = Players.LocalPlayer
local WS = game:GetService("Workspace")

local guiName = "EliteMenu_V3"
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
Main.Size = UDim2.new(0, 340, 0, 320)
Main.Position = UDim2.new(0.5, -170, 0.5, -160)
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
        TweenService:Create(Main, Style.Tween, {Size = UDim2.new(0, 340, 0, 320)}):Play()
    end
end)

local FastFarmEnabled = false
local SilentFarmEnabled = false
local FarmSpeed = 1.6
local TotalGold = 0
local StartTime = os.time()

task.spawn(function()
    while true do
        if FastFarmEnabled or SilentFarmEnabled then
            local duration = os.time() - StartTime
            local minutes = math.floor(duration / 60)
            local seconds = duration % 60
            TimeLabel.Text = string.format("Time: %02d:%02d", minutes, seconds)
        end
        task.wait(1)
    end
end)

local function RunFastFarm()
    task.spawn(function()
        while FastFarmEnabled do
            local char = LP.Character
            if char and char:FindFirstChild("HumanoidRootPart") and char:FindFirstChild("Humanoid") then
                local hrp = char.HumanoidRootPart
                local hum = char.Humanoid
                
                local boatStages = WS:FindFirstChild("BoatStages")
                local normalStages = boatStages and boatStages:FindFirstChild("NormalStages")
                local finalStage = normalStages and normalStages:FindFirstChild("TheEnd")
                local goldenChest = finalStage and finalStage:FindFirstChild("GoldenChest")
                local targetPart = goldenChest and goldenChest:FindFirstChild("ChestTop")
                
                if targetPart then
                    local bodyVelocity = Instance.new("BodyVelocity")
                    bodyVelocity.Velocity = Vector3.new(0, 0, 0)
                    bodyVelocity.MaxForce = Vector3.new(math.huge, math.huge, math.huge)
                    bodyVelocity.Parent = hrp
                    
                    hrp.CFrame = targetPart.CFrame + Vector3.new(0, 3, 0)
                    
                    for i = 1, 10 do
                        if not FastFarmEnabled then break end
                        firetouchinterest(hrp, targetPart, 0)
                        firetouchinterest(hrp, targetPart, 1)
                        task.wait(0.02)
                    end
                    
                    task.wait(FarmSpeed)
                    if bodyVelocity then bodyVelocity:Destroy() end
                    
                    if FastFarmEnabled then
                        TotalGold = TotalGold + 24
                        GoldLabel.Text = "Gold: " .. TotalGold
                    end
                end
            end
            task.wait(0.3)
        end
    end)
end

local function RunSilentFarm()
    task.spawn(function()
        while SilentFarmEnabled do
            local char = LP.Character
            if char and char:FindFirstChild("HumanoidRootPart") then
                local hrp = char.HumanoidRootPart
                
                local boatStages = WS:FindFirstChild("BoatStages")
                local normalStages = boatStages and boatStages:FindFirstChild("NormalStages")
                local finalStage = normalStages and normalStages:FindFirstChild("TheEnd")
                local goldenChest = finalStage and finalStage:FindFirstChild("GoldenChest")
                local targetPart = goldenChest and goldenChest:FindFirstChild("ChestTop")
                
                if targetPart then
                    for i = 1, 10 do
                        if not SilentFarmEnabled then break end
                        firetouchinterest(hrp, targetPart, 0)
                        firetouchinterest(hrp, targetPart, 1)
                    end
                    
                    if SilentFarmEnabled then
                        TotalGold = TotalGold + 24
                        GoldLabel.Text = "Gold: " .. TotalGold
                    end
                end
            end
            task.wait(FarmSpeed)
        end
    end)
end

local FastToggle = Instance.new("TextButton", Main)
FastToggle.Size = UDim2.new(0, 300, 0, 42)
FastToggle.Position = UDim2.new(0, 20, 0, 20)
FastToggle.BackgroundColor3 = Style.Secondary
FastToggle.Text = "Fast Farm: OFF"
FastToggle.TextColor3 = Style.Text
FastToggle.Font = Enum.Font.GothamBold
FastToggle.TextSize = 14
Instance.new("UICorner", FastToggle).CornerRadius = UDim.new(0, 6)

local SilentToggle = Instance.new("TextButton", Main)
SilentToggle.Size = UDim2.new(0, 300, 0, 42)
SilentToggle.Position = UDim2.new(0, 20, 0, 72)
SilentToggle.BackgroundColor3 = Style.Secondary
SilentToggle.Text = "Silent Farm: OFF"
SilentToggle.TextColor3 = Style.Text
SilentToggle.Font = Enum.Font.GothamBold
SilentToggle.TextSize = 14
Instance.new("UICorner", SilentToggle).CornerRadius = UDim.new(0, 6)

FastToggle.MouseButton1Click:Connect(function()
    FastFarmEnabled = not FastFarmEnabled
    StatsFrame.Visible = true
    if FastFarmEnabled then
        SilentFarmEnabled = false
        SilentToggle.Text = "Silent Farm: OFF"
        SilentToggle.BackgroundColor3 = Style.Secondary
        FastToggle.Text = "Fast Farm: ON"
        FastToggle.BackgroundColor3 = Style.Accent
        StartTime = os.time()
        RunFastFarm()
    else
        FastToggle.Text = "Fast Farm: OFF"
        FastToggle.BackgroundColor3 = Style.Secondary
    end
end)

SilentToggle.MouseButton1Click:Connect(function()
    SilentFarmEnabled = not SilentFarmEnabled
    StatsFrame.Visible = true
    if SilentFarmEnabled then
        FastFarmEnabled = false
        FastToggle.Text = "Fast Farm: OFF"
        FastToggle.BackgroundColor3 = Style.Secondary
        SilentToggle.Text = "Silent Farm: ON"
        SilentToggle.BackgroundColor3 = Style.Accent
        StartTime = os.time()
        RunSilentFarm()
    else
        SilentToggle.Text = "Silent Farm: OFF"
        SilentToggle.BackgroundColor3 = Style.Secondary
    end
end)

local SliderFrame = Instance.new("Frame", Main)
SliderFrame.Size = UDim2.new(0, 300, 0, 50)
SliderFrame.Position = UDim2.new(0, 20, 0, 132)
SliderFrame.BackgroundColor3 = Style.Secondary
Instance.new("UICorner", SliderFrame).CornerRadius = UDim.new(0, 6)

local SliderLabel = Instance.new("TextLabel", SliderFrame)
SliderLabel.Size = UDim2.new(1, -20, 0, 20)
SliderLabel.Position = UDim2.new(0, 10, 0, 5)
SliderLabel.BackgroundTransparency = 1
SliderLabel.Text = "Farm Delay ➔➔➔ 1.6s"
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
    SliderLabel.Text = "Farm Delay ➔➔➔ " .. string.format("%.1f", FarmSpeed) .. "s"
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
