local CoreGui = game:GetService("CoreGui")
local Players = game:GetService("Players")
local UserInputService = game:GetService("UserInputService")
local WS = game:GetService("Workspace")
local LP = Players.LocalPlayer

local guiName = "ModernMenuGUI"
local targetGui = (pcall(function() return CoreGui:GetChildren() end)) and CoreGui or LP:WaitForChild("PlayerGui")

if targetGui:FindFirstChild(guiName) then targetGui[guiName]:Destroy() end

local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = guiName
ScreenGui.Parent = targetGui
ScreenGui.ResetOnSpawn = false
ScreenGui.IgnoreGuiInset = true
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

local Colors = {
    Background = Color3.fromRGB(25, 25, 25),
    Sidebar = Color3.fromRGB(20, 20, 20),
    Accent = Color3.fromRGB(65, 130, 220),
    Text = Color3.fromRGB(220, 220, 220),
    ButtonBg = Color3.fromRGB(35, 35, 35)
}
-- Круглая кнопка
local ToggleButton = Instance.new("TextButton")
ToggleButton.Name = "OpenButton"
ToggleButton.Size = UDim2.new(0, 50, 0, 50)
ToggleButton.Position = UDim2.new(0, 20, 0.5, -25)
ToggleButton.BackgroundColor3 = Colors.ButtonBg
ToggleButton.Text = "M"
ToggleButton.TextColor3 = Colors.Accent
ToggleButton.Font = Enum.Font.GothamBold
ToggleButton.TextSize = 24
ToggleButton.Active = true
ToggleButton.ZIndex = 10
ToggleButton.Parent = ScreenGui

local ToggleCorner = Instance.new("UICorner", ToggleButton)
ToggleCorner.CornerRadius = UDim.new(1, 0)

-- Основное меню
local MainFrame = Instance.new("Frame")
MainFrame.Name = "MainFrame"
MainFrame.Size = UDim2.new(0, 650, 0, 420)
MainFrame.Position = UDim2.new(0.5, -325, 0.5, -210)
MainFrame.BackgroundColor3 = Colors.Background
MainFrame.Visible = false
MainFrame.Active = true
MainFrame.ZIndex = 5
MainFrame.Parent = ScreenGui

Instance.new("UICorner", MainFrame).CornerRadius = UDim.new(0, 8)

-- Контейнер
local ContentArea = Instance.new("ScrollingFrame", MainFrame)
ContentArea.Size = UDim2.new(1, -90, 1, -60)
ContentArea.Position = UDim2.new(0, 80, 0, 50)
ContentArea.BackgroundTransparency = 1
ContentArea.ScrollBarThickness = 2
ContentArea.Parent = MainFrame

local ListLayout = Instance.new("UIListLayout", ContentArea)
ListLayout.Padding = UDim.new(0, 12)
-- Логика перетаскивания
local dragging, dragStart, startPos
MainFrame.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 then
        dragging = true
        dragStart = input.Position
        startPos = MainFrame.Position
    end
end)
UserInputService.InputChanged:Connect(function(input)
    if dragging and input.UserInputType == Enum.UserInputType.MouseMovement then
        local delta = input.Position - dragStart
        MainFrame.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
    end
end)
UserInputService.InputEnded:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 then dragging = false end
end)

-- Открытие меню
ToggleButton.MouseButton1Click:Connect(function() MainFrame.Visible = not MainFrame.Visible end)

-- Функция Toggle
local function CreateToggle(name, callback)
    local btn = Instance.new("TextButton", ContentArea)
    btn.Size = UDim2.new(1, 0, 0, 30)
    btn.Text = name
    btn.TextColor3 = Colors.Text
    btn.BackgroundColor3 = Colors.ButtonBg
    local state = false
    btn.MouseButton1Click:Connect(function()
        state = not state
        btn.BackgroundColor3 = state and Colors.Accent or Colors.ButtonBg
        callback(state)
    end)
end

-- Применение Fast Farm
CreateToggle("Fast Farm", function(state)
    getgenv().TreasureAutoFarm = {Enabled = state, Mode = "Fast-16"}
    if state then
        task.spawn(function()
            while getgenv().TreasureAutoFarm.Enabled do
                local hrp = LP.Character and LP.Character:FindFirstChild("HumanoidRootPart")
                local dark = WS:FindFirstChild("BoatStages") and WS.BoatStages.NormalStages.CaveStage1.DarknessPart
                if hrp and dark then
                    hrp.CFrame = dark.CFrame
                    for i=1,10 do firetouchinterest(hrp, dark, 0) firetouchinterest(hrp, dark, 1) end
                    task.wait(1.6)
                    LP.Character.Humanoid.Health = 0
                end
                task.wait(1)
            end
        end)
    end
end)
