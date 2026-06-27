local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local CoreGui = game:GetService("CoreGui")

local LocalPlayer = Players.LocalPlayer

local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "TargetSystem"
ScreenGui.Parent = CoreGui
ScreenGui.ResetOnSpawn = false

local ToggleButton = Instance.new("TextButton")
local UICornerToggle = Instance.new("UICorner")

ToggleButton.Name = "ToggleButton"
ToggleButton.Parent = ScreenGui
ToggleButton.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
ToggleButton.Position = UDim2.new(0.05, 0, 0.4, 0)
ToggleButton.Size = UDim2.new(0, 50, 0, 50)
ToggleButton.Font = Enum.Font.GothamBold
ToggleButton.Text = "O"
ToggleButton.TextColor3 = Color3.fromRGB(255, 255, 255)
ToggleButton.TextSize = 18
ToggleButton.Active = true
ToggleButton.Draggable = true

UICornerToggle.CornerRadius = UDim.new(1, 0)
UICornerToggle.Parent = ToggleButton

local MainFrame = Instance.new("Frame")
local UICornerMain = Instance.new("UICorner")
local FeatureFrame = Instance.new("Frame")
local FeatureText = Instance.new("TextLabel")
local ArrowButton = Instance.new("TextButton")
local DropdownFrame = Instance.new("ScrollingFrame")
local UIListLayout = Instance.new("UIListLayout")

MainFrame.Name = "MainFrame"
MainFrame.Parent = ScreenGui
MainFrame.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
MainFrame.Position = UDim2.new(0.3, 0, 0.3, 0)
MainFrame.Size = UDim2.new(0, 250, 0, 60)
MainFrame.Visible = false
MainFrame.Active = true
MainFrame.Draggable = true

UICornerMain.CornerRadius = UDim.new(0, 12)
UICornerMain.Parent = MainFrame

FeatureFrame.Name = "FeatureFrame"
FeatureFrame.Parent = MainFrame
FeatureFrame.BackgroundTransparency = 1
FeatureFrame.Position = UDim2.new(0, 10, 0, 10)
FeatureFrame.Size = UDim2.new(1, -20, 0, 40)

FeatureText.Name = "FeatureText"
FeatureText.Parent = FeatureFrame
FeatureText.BackgroundTransparency = 1
FeatureText.Size = UDim2.new(0.75, 0, 1, 0)
FeatureText.Font = Enum.Font.GothamBold
FeatureText.Text = "Target Loop: None"
FeatureText.TextColor3 = Color3.fromRGB(180, 180, 180)
FeatureText.TextSize = 14
FeatureText.TextXAlignment = Enum.TextXAlignment.Left

ArrowButton.Name = "ArrowButton"
ArrowButton.Parent = FeatureFrame
ArrowButton.BackgroundTransparency = 1
ArrowButton.Position = UDim2.new(0.75, 0, 0, 0)
ArrowButton.Size = UDim2.new(0.25, 0, 1, 0)
ArrowButton.Font = Enum.Font.GothamBold
ArrowButton.Text = "▼"
ArrowButton.TextColor3 = Color3.fromRGB(255, 255, 255)
ArrowButton.TextSize = 14

DropdownFrame.Name = "DropdownFrame"
DropdownFrame.Parent = MainFrame
DropdownFrame.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
DropdownFrame.BorderSizePixel = 0
DropdownFrame.Position = UDim2.new(0, 10, 0, 55)
DropdownFrame.Size = UDim2.new(1, -20, 0, 150)
DropdownFrame.Visible = false
DropdownFrame.CanvasSize = UDim2.new(0, 0, 0, 0)
DropdownFrame.ScrollBarThickness = 4

UIListLayout.Parent = DropdownFrame
UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
UIListLayout.Padding = UDim.new(0, 4)

local targetPlayer = nil
local loopActive = false
local dropdownOpen = false

ToggleButton.MouseButton1Click:Connect(function()
    MainFrame.Visible = not MainFrame.Visible
    if not MainFrame.Visible then
        DropdownFrame.Visible = false
        dropdownOpen = false
        ArrowButton.Text = "▼"
    end
end)

local function updateDropdown()
    for _, child in ipairs(DropdownFrame:GetChildren()) do
        if child:IsA("TextButton") then
            child:Destroy()
        end
    end

    local count = 0
    for _, player in ipairs(Players:GetPlayers()) do
        if player ~= LocalPlayer then
            count = count + 1
            local pButton = Instance.new("TextButton")
            pButton.Size = UDim2.new(1, 0, 0, 30)
            pButton.BackgroundColor3 = Color3.fromRGB(30, 30, 35)
            pButton.Font = Enum.Font.Gotham
            pButton.Text = player.DisplayName or player.Name
            pButton.TextColor3 = Color3.fromRGB(255, 255, 255)
            pButton.TextSize = 12
            pButton.BorderSizePixel = 0
            pButton.Parent = DropdownFrame

            local pCorner = Instance.new("UICorner")
            pCorner.CornerRadius = UDim.new(0, 6)
            pCorner.Parent = pButton

            pButton.MouseButton1Click:Connect(function()
                if targetPlayer == player then
                    loopActive = not loopActive
                else
                    targetPlayer = player
                    loopActive = true
                end

                if loopActive then
                    FeatureText.Text = "Target Loop: ON"
                    FeatureText.TextColor3 = Color3.fromRGB(46, 204, 113)
                else
                    FeatureText.Text = "Target Loop: OFF"
                    FeatureText.TextColor3 = Color3.fromRGB(180, 180, 180)
                end

                DropdownFrame.Visible = false
                dropdownOpen = false
                ArrowButton.Text = "▼"
            end)
        end
    end
    DropdownFrame.CanvasSize = UDim2.new(0, 0, 0, count * 34)
end

ArrowButton.MouseButton1Click:Connect(function()
    dropdownOpen = not dropdownOpen
    if dropdownOpen then
        updateDropdown()
        DropdownFrame.Visible = true
        ArrowButton.Text = "▲"
    else
        DropdownFrame.Visible = false
        ArrowButton.Text = "▼"
    end
end)

local cycle = 0
RunService.Heartbeat:Connect(function()
    if loopActive and targetPlayer and targetPlayer.Character then
        local targetRoot = targetPlayer.Character:FindFirstChild("HumanoidRootPart")
        local localRoot = LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
        
        if targetRoot and localRoot then
            cycle = cycle + 0.3
            local distance = 2 + math.sin(cycle) * 2.5
            local offset = targetRoot.CFrame.LookVector * -distance
            localTargetCFrame = targetRoot.CFrame + offset
            localRoot.CFrame = CFrame.new(localTargetCFrame.Position, targetRoot.Position)
        end
    elseif loopActive and (not targetPlayer or not targetPlayer.Parent) then
        loopActive = false
        targetPlayer = nil
        FeatureText.Text = "Target Loop: None"
        FeatureText.TextColor3 = Color3.fromRGB(180, 180, 180)
    end
end)
