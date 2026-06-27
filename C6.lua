local TweenService = game:GetService("TweenService")
local UserInputService = game:GetService("UserInputService")
local Players = game:GetService("Players")
local LP = Players.LocalPlayer
local WS = game:GetService("Workspace")

local Style = {
    Bg = Color3.fromRGB(18, 18, 18),
    Accent = Color3.fromRGB(50, 150, 255),
    Corner = UDim.new(0, 8),
    Tween = TweenInfo.new(0.4, Enum.EasingStyle.Quart, Enum.EasingDirection.Out)
}

local ScreenGui = Instance.new("ScreenGui", game:GetService("CoreGui"))
ScreenGui.Name = "EliteMenu"

local OpenBtn = Instance.new("TextButton", ScreenGui)
OpenBtn.Size = UDim2.new(0, 50, 0, 50)
OpenBtn.Position = UDim2.new(0.1, 0, 0.5, 0)
OpenBtn.BackgroundColor3 = Style.Bg
OpenBtn.Text = "★"
OpenBtn.TextColor3 = Style.Accent
OpenBtn.Font = Enum.Font.GothamBold
Instance.new("UICorner", OpenBtn).CornerRadius = UDim.new(1, 0)

local Main = Instance.new("Frame", ScreenGui)
Main.Size = UDim2.new(0, 300, 0, 200)
Main.Position = UDim2.new(0.5, -150, 0.5, -100)
Main.BackgroundColor3 = Style.Bg
Main.Visible = false
Instance.new("UICorner", Main).CornerRadius = Style.Corner

local FarmEnabled = false

local function StartFarm()
    task.spawn(function()
        while FarmEnabled do
            local char = LP.Character
            if char and char:FindFirstChild("HumanoidRootPart") then
                local hrp = char.HumanoidRootPart
                local stage = WS:FindFirstChild("BoatStages") and WS:FindFirstChild("BoatStages"):FindFirstChild("NormalStages")
                local dark = stage and stage:FindFirstChild("CaveStage1") and stage.CaveStage1:FindFirstChild("DarknessPart")
                
                if dark then
                    hrp.CFrame = dark.CFrame
                    for i = 1, 15 do
                        firetouchinterest(hrp, dark, 0)
                        firetouchinterest(hrp, dark, 1)
                        task.wait(0.05)
                    end
                    task.wait(1.2)
                    if char:FindFirstChild("Humanoid") then char.Humanoid.Health = 0 end
                    repeat task.wait(0.5) until LP.Character ~= char
                end
            end
            task.wait(1.5)
        end
    end)
end

local Toggle = Instance.new("TextButton", Main)
Toggle.Size = UDim2.new(0, 260, 0, 40)
Toggle.Position = UDim2.new(0.5, -130, 0.5, -20)
Toggle.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
Toggle.Text = "Toggle Fast Farm"
Toggle.TextColor3 = Color3.fromRGB(255, 255, 255)
Instance.new("UICorner", Toggle).CornerRadius = Style.Corner

Toggle.MouseButton1Click:Connect(function()
    FarmEnabled = not FarmEnabled
    Toggle.BackgroundColor3 = FarmEnabled and Style.Accent or Color3.fromRGB(30, 30, 30)
    if FarmEnabled then StartFarm() end
end)

local dragging, dragStart, startPos
OpenBtn.InputBegan:Connect(function(i)
    if i.UserInputType == Enum.UserInputType.MouseButton1 or i.UserInputType == Enum.UserInputType.Touch then
        dragging = true
        dragStart = i.Position
        startPos = OpenBtn.Position
    end
end)
UserInputService.InputChanged:Connect(function(i)
    if dragging then
        local delta = i.Position - dragStart
        OpenBtn.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
    end
end)
UserInputService.InputEnded:Connect(function(i) if i.UserInputType == Enum.UserInputType.MouseButton1 or i.UserInputType == Enum.UserInputType.Touch then dragging = false end end)

OpenBtn.MouseButton1Click:Connect(function()
    Main.Visible = not Main.Visible
    if Main.Visible then
        Main.Size = UDim2.new(0, 0, 0, 0)
        TweenService:Create(Main, Style.Tween, {Size = UDim2.new(0, 300, 0, 200)}):Play()
    end
end)
