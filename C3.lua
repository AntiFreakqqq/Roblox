local ScreenGui = Instance.new("ScreenGui")
local MainFrame = Instance.new("Frame")
local Title = Instance.new("TextLabel")
local ButtonsFrame = Instance.new("ScrollingFrame")
local UIListLayout = Instance.new("UIListLayout")

ScreenGui.Parent = game:GetService("CoreGui")
ScreenGui.ResetOnSpawn = false

MainFrame.Name = "MainFrame"
MainFrame.Parent = ScreenGui
MainFrame.BackgroundColor3 = Color3.fromRGB(30, 30, 35)
MainFrame.BorderSizePixel = 0
MainFrame.Position = UDim2.new(0.1, 0, 0.2, 0)
MainFrame.Size = UDim2.new(0, 220, 0, 300)
MainFrame.Active = true
MainFrame.Draggable = true

Title.Name = "Title"
Title.Parent = MainFrame
Title.BackgroundColor3 = Color3.fromRGB(45, 45, 50)
Title.BorderSizePixel = 0
Title.Size = UDim2.new(1, 0, 0, 35)
Title.Font = Enum.Font.GothamBold
Title.Text = "BABFT Premium Hub"
Title.TextColor3 = Color3.fromRGB(255, 255, 255)
Title.TextSize = 14

ButtonsFrame.Name = "ButtonsFrame"
ButtonsFrame.Parent = MainFrame
ButtonsFrame.BackgroundTransparency = 1
ButtonsFrame.BorderSizePixel = 0
ButtonsFrame.Position = UDim2.new(0, 5, 0, 40)
ButtonsFrame.Size = UDim2.new(1, -10, 1, -45)
ButtonsFrame.CanvasSize = UDim2.new(0, 0, 0, 320)
ButtonsFrame.ScrollBarThickness = 4

UIListLayout.Parent = ButtonsFrame
UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
UIListLayout.Padding = UDim.new(0, 6)

local function createToggle(name, default, callback)
    local state = default
    local Button = Instance.new("TextButton")
    Button.Parent = ButtonsFrame
    Button.Size = UDim2.new(1, 0, 0, 35)
    Button.Font = Enum.Font.Gotham
    Button.TextSize = 13
    Button.BorderSizePixel = 0
    
    local function updateVisuals()
        if state then
            Button.BackgroundColor3 = Color3.fromRGB(46, 204, 113)
            Button.Text = name .. ": [ВКЛ]"
            Button.TextColor3 = Color3.fromRGB(255, 255, 255)
        else
            Button.BackgroundColor3 = Color3.fromRGB(50, 50, 55)
            Button.Text = name .. ": [ВЫКЛ]"
            Button.TextColor3 = Color3.fromRGB(180, 180, 180)
        end
    end
    
    Button.MouseButton1Click:Connect(function()
        state = not state
        updateVisuals()
        callback(state)
    end)
    
    updateVisuals()
    return Button
end

local LocalPlayer = game:GetService("Players").LocalPlayer
local TweenService = game:GetService("TweenService")

local goldFarmActive = false
local autoBuyActive = false
local walkSpeedActive = false
local infiniteJumpActive = false

task.spawn(function()
    while task.wait(0.5) do
        if goldFarmActive then
            pcall(function()
                local character = LocalPlayer.Character
                local root = character and character:FindFirstChild("HumanoidRootPart")
                local humanoid = character and character:FindFirstChildOfClass("Humanoid")
                
                if root and humanoid and humanoid.Health > 0 then
                    for _, part in ipairs(character:GetChildren()) do
                        if part:IsA("BasePart") then
                            part.CanCollide = false
                        end
                    end
                    
                    local DarknessZones = workspace:FindFirstChild("TheDarknessZones")
                    if DarknessZones then
                        for i = 1, 10 do
                            if not goldFarmActive then break end
                            local zone = DarknessZones:FindFirstChild("Zone_" .. i)
                            if zone then
                                root.CFrame = zone.CFrame + Vector3.new(0, 5, 0)
                                task.wait(0.6)
                            end
                        end
                    end
                    
                    if goldFarmActive then
                        local boatStages = workspace:FindFirstChild("BoatStages")
                        if boatStages then
                            local normalStages = boatStages:FindFirstChild("NormalStages")
                            if normalStages then
                                local cave = normalStages:FindFirstChild("TheCave")
                                if cave and cave:FindFirstChild("Chest") then
                                    root.CFrame = cave.Chest.Top.CFrame
                                    task.wait(2)
                                end
                            end
                        end
                    end
                    
                    humanoid.Health = 0
                    task.wait(4)
                end
            end)
        end
    end
end)

task.spawn(function()
    while task.wait(0.8) do
        if autoBuyActive then
            pcall(function()
                workspace.ItemDemandOnServer.BuyItem:InvokeServer("Common Chest", 1)
            end)
        end
    end
end)

game:GetService("UserInputService").JumpRequest:Connect(function()
    if infiniteJumpActive then
        pcall(function()
            local character = LocalPlayer.Character
            local humanoid = character and character:FindFirstChildOfClass("Humanoid")
            if humanoid then
                humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
            end
        end)
    end
end)

task.spawn(function()
    while task.wait(0.1) do
        pcall(function()
            local character = LocalPlayer.Character
            local humanoid = character and character:FindFirstChildOfClass("Humanoid")
            if humanoid then
                if walkSpeedActive then
                    humanoid.WalkSpeed = 80
                else
                    humanoid.WalkSpeed = 16
                end
            end
        end)
    end
end)

createToggle("Auto Gold Farm", false, function(toggled)
    goldFarmActive = toggled
end)

createToggle("Auto Buy Chests", false, function(toggled)
    autoBuyActive = toggled
end)

createToggle("Fast WalkSpeed", false, function(toggled)
    walkSpeedActive = toggled
end)

createToggle("Infinite Jump", false, function(toggled)
    infiniteJumpActive = toggled
end)
