
-- ==========================================
-- ИНИЦИАЛИЗАЦИЯ СЕРВИСОВ И ПЕРЕМЕННЫХ
-- ==========================================
local CoreGui = game:GetService("CoreGui")
local Players = game:GetService("Players")
local UserInputService = game:GetService("UserInputService")
local WS = game:GetService("Workspace")
local LP = Players.LocalPlayer

-- Защита от дублирования интерфейса при перезапуске скрипта
local guiName = "ModernMenuGUI"
local targetGui = (pcall(function() return CoreGui:GetChildren() end)) and CoreGui or LP:WaitForChild("PlayerGui")

if targetGui:FindFirstChild(guiName) then
    targetGui[guiName]:Destroy()
end

-- Настройки фарма
getgenv().TreasureAutoFarm = getgenv().TreasureAutoFarm or {
    Enabled = false,
    Mode = "Fast-16",
    SpeedTier = 2
}
getgenv().AF_TotalRuns = getgenv().AF_TotalRuns or 0
getgenv().AF_TotalGold = getgenv().AF_TotalGold or 0

-- Цветовая палитра меню
local Colors = {
    Background = Color3.fromRGB(25, 25, 25),
    Sidebar = Color3.fromRGB(20, 20, 20),
    Accent = Color3.fromRGB(65, 130, 220),
    Text = Color3.fromRGB(220, 220, 220),
    ButtonBg = Color3.fromRGB(35, 35, 35)
}

-- ==========================================
-- СОЗДАНИЕ ГЛАВНОГО ИНТЕРФЕЙСА
-- ==========================================
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = guiName
ScreenGui.Parent = targetGui
ScreenGui.ResetOnSpawn = false

-- 1. КРУГЛАЯ КНОПКА ОТКРЫТИЯ/ЗАКРЫТИЯ
local ToggleButton = Instance.new("TextButton")
ToggleButton.Name = "OpenButton"
ToggleButton.Size = UDim2.new(0, 50, 0, 50)
ToggleButton.Position = UDim2.new(0, 20, 0.5, -25)
ToggleButton.BackgroundColor3 = Colors.ButtonBg
ToggleButton.Text = "M"
ToggleButton.TextColor3 = Colors.Accent
ToggleButton.TextSize = 24
ToggleButton.Font = Enum.Font.GothamBold
ToggleButton.Parent = ScreenGui

local ToggleCorner = Instance.new("UICorner")
ToggleCorner.CornerRadius = UDim.new(1, 0)
ToggleCorner.Parent = ToggleButton

-- 2. ГЛАВНОЕ ОКНО
local MainFrame = Instance.new("Frame")
MainFrame.Name = "MainFrame"
MainFrame.Size = UDim2.new(0, 650, 0, 420)
MainFrame.Position = UDim2.new(0.5, -325, 0.5, -210)
MainFrame.BackgroundColor3 = Colors.Background
MainFrame.BorderSizePixel = 0
MainFrame.Visible = false
MainFrame.Parent = ScreenGui

local MainCorner = Instance.new("UICorner")
MainCorner.CornerRadius = UDim.new(0, 8)
MainCorner.Parent = MainFrame

-- Боковая панель
local Sidebar = Instance.new("Frame")
Sidebar.Name = "Sidebar"
Sidebar.Size = UDim2.new(0, 60, 1, 0)
Sidebar.BackgroundColor3 = Colors.Sidebar
Sidebar.BorderSizePixel = 0
Sidebar.Parent = MainFrame

local SidebarCorner = Instance.new("UICorner")
SidebarCorner.CornerRadius = UDim.new(0, 8)
SidebarCorner.Parent = Sidebar

local SidebarFix = Instance.new("Frame")
SidebarFix.Size = UDim2.new(0, 8, 1, 0)
SidebarFix.Position = UDim2.new(1, -8, 0, 0)
SidebarFix.BackgroundColor3 = Colors.Sidebar
SidebarFix.BorderSizePixel = 0
SidebarFix.Parent = Sidebar

-- Заголовок вкладки
local TabTitle = Instance.new("TextLabel")
TabTitle.Size = UDim2.new(0, 200, 0, 40)
TabTitle.Position = UDim2.new(0, 80, 0, 10)
TabTitle.BackgroundTransparency = 1
TabTitle.Text = "Misc"
TabTitle.TextColor3 = Colors.Text
TabTitle.TextSize = 22
TabTitle.Font = Enum.Font.GothamBold
TabTitle.TextXAlignment = Enum.TextXAlignment.Left
TabTitle.Parent = MainFrame

-- 3. КОНТЕЙНЕР ДЛЯ ЭЛЕМЕНТОВ (SCROLLING FRAME)
local ContentArea = Instance.new("ScrollingFrame")
ContentArea.Name = "ContentArea"
ContentArea.Size = UDim2.new(1, -90, 1, -60) 
ContentArea.Position = UDim2.new(0, 80, 0, 50)
ContentArea.BackgroundTransparency = 1
ContentArea.ScrollBarThickness = 2
ContentArea.ScrollBarImageColor3 = Colors.Accent
ContentArea.BorderSizePixel = 0
ContentArea.Parent = MainFrame

local ListLayout = Instance.new("UIListLayout")
ListLayout.Parent = ContentArea
ListLayout.SortOrder = Enum.SortOrder.LayoutOrder
ListLayout.Padding = UDim.new(0, 12)

-- Обновление размера скролла при добавлении элементов
ListLayout.GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
    ContentArea.CanvasSize = UDim2.new(0, 0, 0, ListLayout.AbsoluteContentSize.Y + 20)
end)

-- ==========================================
-- ЛОГИКА ПЕРЕТАСКИВАНИЯ И ОТКРЫТИЯ
-- ==========================================
local dragging, dragInput, dragStart, startPos

MainFrame.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
        dragging = true
        dragStart = input.Position
        startPos = MainFrame.Position
        
        input.Changed:Connect(function()
            if input.UserInputState == Enum.UserInputState.End then
                dragging = false
            end
        end)
    end
end)

MainFrame.InputChanged:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
        dragInput = input
    end
end)

UserInputService.InputChanged:Connect(function(input)
    if input == dragInput and dragging then
        local delta = input.Position - dragStart
        MainFrame.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
    end
end)

ToggleButton.MouseButton1Click:Connect(function()
    MainFrame.Visible = not MainFrame.Visible
end)

-- ==========================================
-- ФУНКЦИЯ СОЗДАНИЯ TOGGLE (ПЕРЕКЛЮЧАТЕЛЯ)
-- ==========================================
local function CreateToggle(name, parent, callback)
    local ToggleContainer = Instance.new("Frame")
    ToggleContainer.Size = UDim2.new(1, 0, 0, 30)
    ToggleContainer.BackgroundTransparency = 1
    ToggleContainer.Parent = parent

    local Label = Instance.new("TextLabel")
    Label.Size = UDim2.new(1, -60, 1, 0)
    Label.BackgroundTransparency = 1
    Label.Text = name
    Label.TextColor3 = Colors.Text
    Label.TextSize = 14
    Label.Font = Enum.Font.GothamMedium
    Label.TextXAlignment = Enum.TextXAlignment.Left
    Label.Parent = ToggleContainer

    local ToggleBg = Instance.new("TextButton")
    ToggleBg.Size = UDim2.new(0, 44, 0, 22)
    ToggleBg.Position = UDim2.new(1, -44, 0.5, -11)
    ToggleBg.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
    ToggleBg.Text = ""
    ToggleBg.AutoButtonColor = false
    ToggleBg.Parent = ToggleContainer
    
    local BgCorner = Instance.new("UICorner")
    BgCorner.CornerRadius = UDim.new(1, 0)
    BgCorner.Parent = ToggleBg

    local Indicator = Instance.new("Frame")
    Indicator.Size = UDim2.new(0, 18, 0, 18)
    Indicator.Position = UDim2.new(0, 2, 0.5, -9)
    Indicator.BackgroundColor3 = Color3.fromRGB(150, 150, 150)
    Indicator.Parent = ToggleBg

    local IndicatorCorner = Instance.new("UICorner")
    IndicatorCorner.CornerRadius = UDim.new(1, 0)
    IndicatorCorner.Parent = Indicator

    local isEnabled = false

    ToggleBg.MouseButton1Click:Connect(function()
        isEnabled = not isEnabled
        if isEnabled then
            Indicator:TweenPosition(UDim2.new(1, -20, 0.5, -9), "Out", "Sine", 0.2, true)
            Indicator.BackgroundColor3 = Colors.Accent
        else
            Indicator:TweenPosition(UDim2.new(0, 2, 0.5, -9), "Out", "Sine", 0.2, true)
            Indicator.BackgroundColor3 = Color3.fromRGB(150, 150, 150)
        end
        if callback then callback(isEnabled) end
    end)
end

-- ==========================================
-- ДОБАВЛЕНИЕ ФУНКЦИИ В МЕНЮ
-- ==========================================
CreateToggle("Fast Farm", ContentArea, function(state)
    getgenv().TreasureAutoFarm.Enabled = state
    
    if state then
        task.spawn(function()
            while getgenv().TreasureAutoFarm.Enabled do
                local char = LP.Character
                if char then
                    local hrp = char:FindFirstChild("HumanoidRootPart")
                    local hum = char:FindFirstChild("Humanoid")
                    
                    if hrp and hum and getgenv().TreasureAutoFarm.Mode == "Fast-16" then
                        pcall(function()
                            local ns = WS:FindFirstChild("BoatStages") and WS.BoatStages:FindFirstChild("NormalStages")
                            local dark = ns and ns:FindFirstChild("CaveStage1") and ns.CaveStage1:FindFirstChild("DarknessPart")
                            
                            if dark then
                                local tier = getgenv().TreasureAutoFarm.SpeedTier or 2
                                local serverWait = (tier == 1) and 2.2 or (tier == 2) and 1.6 or 1.0
                                
                                hrp.CFrame = dark.CFrame
                                for i = 1, 30 do 
                                    firetouchinterest(hrp, dark, 0)
                                    firetouchinterest(hrp, dark, 1) 
                                end
                                
                                local tTime = 0
                                while tTime < serverWait and getgenv().TreasureAutoFarm.Mode == "Fast-16" and getgenv().TreasureAutoFarm.Enabled do
                                    hrp.CFrame = dark.CFrame * CFrame.new(1.2, 0, 0)
                                    task.wait(0.08)
                                    hrp.CFrame = dark.CFrame * CFrame.new(-1.2, 0, 0)
                                    task.wait(0.08)
                                    tTime = tTime + 0.16
                                end
                                
                                local respawned = false
                                local conn = LP.CharacterAdded:Connect(function() respawned = true end)
                                hum.Health = 0
                                repeat task.wait(0.05) until respawned or not getgenv().TreasureAutoFarm.Enabled
                                if conn then conn:Disconnect() end
                            end
                        end)
                    end
                end
                task.wait(0.5)
            end
        end)
    end
end)
