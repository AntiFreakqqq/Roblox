local Players = game:GetService("Players")
local player = Players.LocalPlayer

local isActive = false
local targetPlayer = nil

local screenGui = Instance.new("ScreenGui")
screenGui.Name = "FuckerGui"
screenGui.ResetOnSpawn = false
screenGui.Parent = game:GetService("CoreGui")

local btn = Instance.new("TextButton")
btn.Size = UDim2.new(0, 50, 0, 50)
btn.Position = UDim2.new(0.4, 0, 0.4, 0)
btn.BackgroundColor3 = Color3.fromRGB(25,25,25)
btn.Text = ""
btn.AutoButtonColor = false
btn.Active = true
btn.Parent = screenGui
Instance.new("UICorner", btn).CornerRadius = UDim.new(1,0)
Instance.new("UIDragDetector", btn)

local menu = Instance.new("Frame")
menu.Size = UDim2.new(0, 300, 0, 260)
menu.Position = UDim2.new(0.3, 0, 0.3, 0)
menu.BackgroundColor3 = Color3.fromRGB(18,18,18)
menu.BorderSizePixel = 0
menu.Visible = false
menu.ZIndex = 5
menu.Parent = screenGui
Instance.new("UICorner", menu).CornerRadius = UDim.new(0, 12)

local header = Instance.new("TextLabel")
header.Size = UDim2.new(1, -10, 0, 28)
header.Position = UDim2.new(0, 5, 0, 5)
header.BackgroundTransparency = 1
header.Text = "Target Fucker"
header.TextColor3 = Color3.fromRGB(220,220,220)
header.Font = Enum.Font.GothamBold
header.TextSize = 15
header.TextXAlignment = Enum.TextXAlignment.Center
header.Parent = menu
Instance.new("UIDragDetector", header)

local line = Instance.new("Frame")
line.Size = UDim2.new(1, 0, 0, 1)
line.Position = UDim2.new(0, 0, 0, 35)
line.BackgroundColor3 = Color3.fromRGB(100,100,100)
line.Parent = menu

local playerFrame = Instance.new("Frame")
playerFrame.Size = UDim2.new(1, -20, 0, 28)
playerFrame.Position = UDim2.new(0, 10, 0, 42)
playerFrame.BackgroundColor3 = Color3.fromRGB(45,45,45)
playerFrame.Parent = menu
Instance.new("UICorner", playerFrame).CornerRadius = UDim.new(0, 6)

local selectedText = Instance.new("TextLabel")
selectedText.Size = UDim2.new(1, -30, 1, 0)
selectedText.Position = UDim2.new(0, 8, 0, 0)
selectedText.BackgroundTransparency = 1
selectedText.Text = "Выбери игрока"
selectedText.TextColor3 = Color3.fromRGB(200,200,200)
selectedText.Font = Enum.Font.Gotham
selectedText.TextSize = 13
selectedText.TextXAlignment = Enum.TextXAlignment.Left
selectedText.Parent = playerFrame

local arrowBtn = Instance.new("ImageButton")
arrowBtn.Size = UDim2.new(0, 20, 0, 20)
arrowBtn.Position = UDim2.new(1, -25, 0.5, -10)
arrowBtn.BackgroundTransparency = 1
arrowBtn.Image = "rbxassetid://3926305904"
arrowBtn.ImageRectOffset = Vector2.new(784, 204)
arrowBtn.ImageRectSize = Vector2.new(36, 36)
arrowBtn.Active = true
arrowBtn.Parent = playerFrame

local scroll = Instance.new("ScrollingFrame")
scroll.Size = UDim2.new(1, -20, 0, 100)
scroll.Position = UDim2.new(0, 10, 0, 75)
scroll.BackgroundColor3 = Color3.fromRGB(40,40,40)
scroll.BorderSizePixel = 0
scroll.ScrollBarThickness = 4
scroll.CanvasSize = UDim2.new(0, 0, 0, 0)
scroll.ScrollingDirection = Enum.ScrollingDirection.Y
scroll.Visible = false
scroll.Parent = menu
Instance.new("UICorner", scroll).CornerRadius = UDim.new(0, 6)
Instance.new("UIListLayout", scroll).Padding = UDim.new(0, 2)

local function createSlider(name, min, max, default, step, yPos)
    local frame = Instance.new("Frame")
    frame.Size = UDim2.new(1, -20, 0, 24)
    frame.Position = UDim2.new(0, 10, 0, yPos)
    frame.BackgroundTransparency = 1
    frame.Parent = menu

    local label = Instance.new("TextLabel", frame)
    label.Size = UDim2.new(0.45, 0, 1, 0)
    label.BackgroundTransparency = 1
    label.Text = name .. ": " .. string.format("%.1f", default)
    label.TextColor3 = Color3.fromRGB(200,200,200)
    label.Font = Enum.Font.Gotham
    label.TextSize = 12
    label.TextXAlignment = Enum.TextXAlignment.Left

    local minus = Instance.new("TextButton", frame)
    minus.Size = UDim2.new(0, 22, 0, 22)
    minus.Position = UDim2.new(0.55, 0, 0, 0)
    minus.Text = "-"
    minus.TextColor3 = Color3.new(1,1,1)
    minus.BackgroundColor3 = Color3.fromRGB(80,80,80)
    minus.Font = Enum.Font.GothamBold
    minus.TextSize = 16

    local valLabel = Instance.new("TextLabel", frame)
    valLabel.Size = UDim2.new(0, 36, 1, 0)
    valLabel.Position = UDim2.new(0.55, 24, 0, 0)
    valLabel.BackgroundTransparency = 1
    valLabel.Text = string.format("%.1f", default)
    valLabel.TextColor3 = Color3.new(1,1,1)
    valLabel.Font = Enum.Font.Gotham
    valLabel.TextSize = 13
    valLabel.TextXAlignment = Enum.TextXAlignment.Center

    local plus = Instance.new("TextButton", frame)
    plus.Size = UDim2.new(0, 22, 0, 22)
    plus.Position = UDim2.new(0.55, 62, 0, 0)
    plus.Text = "+"
    plus.TextColor3 = Color3.new(1,1,1)
    plus.BackgroundColor3 = Color3.fromRGB(80,80,80)
    plus.Font = Enum.Font.GothamBold
    plus.TextSize = 16

    local current = default
    local function set(v)
        current = math.clamp(math.floor(v * 10 + 0.5) / 10, min, max)
        valLabel.Text = string.format("%.1f", current)
        label.Text = name .. ": " .. string.format("%.1f", current)
    end
    minus.MouseButton1Click:Connect(function() set(current - step) end)
    plus.MouseButton1Click:Connect(function() set(current + step) end)
    return {get = function() return current end, set = set}
end

local speed = createSlider("Speed", 0.1, 2.0, 0.4, 0.1, 185)
local backDist = createSlider("Back Dist", 1.0, 10.0, 2.5, 0.5, 212)
local closeDist = createSlider("Close Dist", 0.2, 5.0, 0.8, 0.2, 239)

local actionBtn = Instance.new("TextButton")
actionBtn.Size = UDim2.new(0, 140, 0, 30)
actionBtn.Position = UDim2.new(0.5, -70, 0, 266)
actionBtn.BackgroundColor3 = Color3.fromRGB(150,30,30)
actionBtn.Text = "Start"
actionBtn.TextColor3 = Color3.new(1,1,1)
actionBtn.Font = Enum.Font.GothamBold
actionBtn.TextSize = 13
actionBtn.Parent = menu
Instance.new("UICorner", actionBtn).CornerRadius = UDim.new(0, 8)

local function updateList()
    for _, b in ipairs(scroll:GetChildren()) do
        if b:IsA("TextButton") then b:Destroy() end
    end
    local list = Players:GetPlayers()
    local y = 0
    for _, p in ipairs(list) do
        if p ~= player then
            local b = Instance.new("TextButton")
            b.Size = UDim2.new(1, 0, 0, 22)
            b.BackgroundColor3 = Color3.fromRGB(60,60,60)
            b.Text = p.Name
            b.TextColor3 = Color3.new(1,1,1)
            b.Font = Enum.Font.Gotham
            b.TextSize = 12
            Instance.new("UICorner", b).CornerRadius = UDim.new(0, 4)
            b.MouseButton1Click:Connect(function()
                selectedText.Text = p.Name
                targetPlayer = p
                scroll.Visible = false
            end)
            b.Parent = scroll
            y = y + 24
        end
    end
    scroll.CanvasSize = UDim2.new(0, 0, 0, y)
end

arrowBtn.MouseButton1Click:Connect(function()
    scroll.Visible = not scroll.Visible
    if scroll.Visible then
        updateList()
    end
end)

local function loop()
    while isActive and targetPlayer do
        local tChar = targetPlayer.Character
        if not tChar then break end
        local tRoot = tChar:FindFirstChild("HumanoidRootPart")
        if not tRoot then break end
        local mChar = player.Character
        if not mChar then break end
        local mRoot = mChar:FindFirstChild("HumanoidRootPart")
        if not mRoot then break end
        local dir = tRoot.CFrame.LookVector
        local pos = tRoot.Position
        local far = pos - dir * backDist.get()
        local near = pos - dir * closeDist.get()
        mRoot.CFrame = CFrame.new(far) * CFrame.Angles(0, tRoot.CFrame.Rotation.Y, 0)
        task.wait(speed.get())
        if not isActive then break end
        mRoot.CFrame = CFrame.new(near) * CFrame.Angles(0, tRoot.CFrame.Rotation.Y, 0)
        task.wait(speed.get())
    end
    isActive = false
    actionBtn.Text = "Start"
    actionBtn.BackgroundColor3 = Color3.fromRGB(150,30,30)
end

actionBtn.MouseButton1Click:Connect(function()
    if isActive then
        isActive = false
        actionBtn.Text = "Start"
        actionBtn.BackgroundColor3 = Color3.fromRGB(150,30,30)
    else
        if not targetPlayer then return end
        isActive = true
        actionBtn.Text = "Stop"
        actionBtn.BackgroundColor3 = Color3.fromRGB(30,150,30)
        task.spawn(loop)
    end
end)

btn.MouseButton1Click:Connect(function()
    menu.Visible = not menu.Visible
    btn.BackgroundColor3 = menu.Visible and Color3.fromRGB(140,40,40) or Color3.fromRGB(25,25,25)
    if not menu.Visible then scroll.Visible = false end
end)
