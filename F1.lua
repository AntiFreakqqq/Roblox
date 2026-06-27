getgenv().TreasureAutoFarm = { Mode = "None", SpeedTier = 2, WaitAtChest = 2.5 }
getgenv().AF_PassVerified = false
getgenv().AF_AntiAFK = false
getgenv().AF_TotalRuns = 0
getgenv().AF_TotalGold = 0

local LP = game:GetService("Players").LocalPlayer
local SG = Instance.new("ScreenGui", LP:WaitForChild("PlayerGui"))
SG.Name = "AntiFreak_Gate"
SG.ResetOnSpawn = false

local PassFrame = Instance.new("Frame", SG)
PassFrame.Name = "PasswordWindow"
PassFrame.Size = UDim2.new(0, 240, 0, 90)
PassFrame.Position = UDim2.new(0.35, 0, 0.4, 0)
PassFrame.BackgroundColor3 = Color3.fromRGB(14, 12, 20)
Instance.new("UICorner", PassFrame).CornerRadius = UDim.new(0, 10)
local PassStroke = Instance.new("UIStroke", PassFrame)
PassStroke.Color = Color3.fromRGB(140, 80, 255)
PassStroke.Thickness = 1.5

local PassTitle = Instance.new("TextLabel", PassFrame)
PassTitle.Size = UDim2.new(1, 0, 0, 30)
PassTitle.BackgroundTransparency = 1
PassTitle.Text = "ACCESS REQUIRED"
PassTitle.TextColor3 = Color3.fromRGB(180, 120, 255)
PassTitle.TextSize = 12
PassTitle.Font = Enum.Font.GothamBold

local TI = Instance.new("TextBox", PassFrame)
TI.Size = UDim2.new(0, 200, 0, 35)
TI.Position = UDim2.new(0, 20, 0, 40)
TI.BackgroundColor3 = Color3.fromRGB(22, 18, 30)
TI.Text = ""
TI.PlaceholderText = "Enter Password Here..."
TI.TextColor3 = Color3.fromRGB(255, 255, 255)
TI.TextSize = 11
TI.Font = Enum.Font.GothamBold
Instance.new("UICorner", TI).CornerRadius = UDim.new(0, 6)
local TIS = Instance.new("UIStroke", TI)
TIS.Color = Color3.fromRGB(55, 45, 75)

local UIS = game:GetService("UserInputService")
local function makeDraggable(obj)
    local d, di, ds, sp
    obj.InputBegan:Connect(function(i)
        if i.UserInputType == Enum.UserInputType.MouseButton1 or i.UserInputType == Enum.UserInputType.Touch then
            d = true; ds = i.Position; sp = obj.Position
            i.Changed:Connect(function() if i.UserInputState == Enum.UserInputState.End then d = false end end)
        end
    end)
    obj.InputChanged:Connect(function(i) if i.UserInputType == Enum.UserInputType.MouseMovement or i.UserInputType == Enum.UserInputType.Touch then di = i end end)
    UIS.InputChanged:Connect(function(i)
        if i == di and d then
            local delta = i.Position - ds
            obj.Position = UDim2.new(sp.X.Scale, sp.X.Offset + delta.X, sp.Y.Scale, sp.Y.Offset + delta.Y)
        end
    end)
end
makeDraggable(PassFrame)
getgenv().AF_DragFunc = makeDraggable
local function initMainCheatUI()
    SG:Destroy()
    local MainSG = Instance.new("ScreenGui", LP:WaitForChild("PlayerGui"))
    MainSG.Name = "AntiFreak_V26_Hybrid"
    MainSG.ResetOnSpawn = false
    getgenv().AF_MainSG = MainSG

    local TB = Instance.new("TextButton", MainSG)
    TB.Size = UDim2.new(0, 50, 0, 50)
    TB.Position = UDim2.new(0.05, 0, 0.4, 0)
    TB.BackgroundColor3 = Color3.fromRGB(18, 16, 24)
    TB.Text = "🔮"
    TB.TextSize = 24
    TB.Font = Enum.Font.GothamBold
    TB.ZIndex = 10
    Instance.new("UICorner", TB).CornerRadius = UDim.new(1, 0)
    local BS = Instance.new("UIStroke", TB)
    BS.Color = Color3.fromRGB(140, 80, 255)
    BS.Thickness = 2

    local MM = Instance.new("Frame", MainSG)
    MM.Name = "MainMenu"
    MM.Size = UDim2.new(0, 260, 0, 0) 
    MM.Position = UDim2.new(0.35, 0, 0.35, 0)
    MM.BackgroundColor3 = Color3.fromRGB(11, 10, 15)
    MM.ClipsDescendants = true
    MM.BackgroundTransparency = 1 
    MM.ZIndex = 5
    Instance.new("UICorner", MM).CornerRadius = UDim.new(0, 12)
    local MS = Instance.new("UIStroke", MM)
    MS.Color = Color3.fromRGB(55, 45, 75)
    MS.Thickness = 1.5
    MS.Transparency = 1

    local T = Instance.new("TextLabel", MM)
    T.Size = UDim2.new(1, 0, 0, 35)
    T.BackgroundTransparency = 1
    T.Text = "by @AntiFreakXD"
    T.TextColor3 = Color3.fromRGB(180, 120, 255)
    T.TextSize = 13
    T.Font = Enum.Font.GothamBold
    T.TextTransparency = 1
    T.ZIndex = 6

    local LS = Instance.new("Frame", MM)
    LS.Size = UDim2.new(0.9, 0, 0, 1)
    LS.Position = UDim2.new(0.05, 0, 0, 35)
    LS.BackgroundColor3 = Color3.fromRGB(45, 35, 65)
    LS.BackgroundTransparency = 1
    LS.ZIndex = 6

    local FF = Instance.new("Frame", MM)
    FF.Size = UDim2.new(0, 220, 0, 130)
    FF.Position = UDim2.new(0, 20, 0, 45)
    FF.BackgroundTransparency = 1
    FF.ZIndex = 6

    local FTB = Instance.new("TextButton", FF)
    FTB.Size = UDim2.new(1, -45, 0, 36)
    FTB.Position = UDim2.new(0, 0, 0, 0)
    FTB.BackgroundColor3 = Color3.fromRGB(24, 20, 32)
    FTB.Text = "🚀 LAUNCH FLY-TP"
    FTB.TextColor3 = Color3.fromRGB(220, 200, 255)
    FTB.TextSize = 11
    FTB.Font = Enum.Font.GothamBold
    FTB.ZIndex = 7
    Instance.new("UICorner", FTB).CornerRadius = UDim.new(0, 6)
    local BTS = Instance.new("UIStroke", FTB)
    BTS.Color = Color3.fromRGB(75, 55, 110)

    local FAST = Instance.new("TextButton", FF)
    FAST.Size = UDim2.new(1, -45, 0, 36)
    FAST.Position = UDim2.new(0, 0, 0, 42)
    FAST.BackgroundColor3 = Color3.fromRGB(24, 20, 32)
    FAST.Text = "⚡ FAST 16 FARM"
    FAST.TextColor3 = Color3.fromRGB(220, 200, 255)
    FAST.TextSize = 11
    FAST.Font = Enum.Font.GothamBold
    FAST.ZIndex = 7
    Instance.new("UICorner", FAST).CornerRadius = UDim.new(0, 6)
    local FASTS = Instance.new("UIStroke", FAST)
    FASTS.Color = Color3.fromRGB(75, 55, 110)

    local AAFK = Instance.new("TextButton", FF)
    AAFK.Size = UDim2.new(1, -45, 0, 36)
    AAFK.Position = UDim2.new(0, 0, 0, 84)
    AAFK.BackgroundColor3 = Color3.fromRGB(24, 20, 32)
    AAFK.Text = "🛡️ TOGGLE ANTI-AFK: OFF"
    AAFK.TextColor3 = Color3.fromRGB(255, 120, 120)
    AAFK.TextSize = 10
    AAFK.Font = Enum.Font.GothamBold
    AAFK.ZIndex = 7
    Instance.new("UICorner", AAFK).CornerRadius = UDim.new(0, 6)
    local AAFKS = Instance.new("UIStroke", AAFK)
    AAFKS.Color = Color3.fromRGB(110, 55, 55)

    getgenv().AF_Objects = { TB=TB, MM=MM, MS=MS, T=T, LS=LS, FTB=FTB, BTS=BTS, FAST=FAST, FASTS=FASTS, AAFK=AAFK, AAFKS=AAFKS, FF=FF }
end
getgenv().AF_InitMainUI = initMainCheatUI
local function setupMenuLogic()
    local OB = getgenv().AF_Objects
    local FF = OB.FF
    local MM = OB.MM
    local TS = game:GetService("TweenService")
    
    local AB = Instance.new("TextButton", FF)
    AB.Size = UDim2.new(0, 38, 0, 120)
    AB.Position = UDim2.new(1, -38, 0, 0)
    AB.BackgroundColor3 = Color3.fromRGB(32, 26, 42)
    AB.Text = "⚙️"
    AB.TextColor3 = Color3.fromRGB(180, 120, 255)
    AB.TextSize = 12
    AB.Font = Enum.Font.GothamBold
    AB.ZIndex = 7
    Instance.new("UICorner", AB).CornerRadius = UDim.new(0, 6)
    local AS = Instance.new("UIStroke", AB)
    AS.Color = Color3.fromRGB(75, 55, 110)

    local SC = Instance.new("Frame", MM)
    SC.Size = UDim2.new(1, -40, 0, 50)
    SC.Position = UDim2.new(0, 20, 0, 180)
    SC.BackgroundTransparency = 1
    SC.Visible = false
    SC.ZIndex = 6

    local ST = Instance.new("TextLabel", SC)
    ST.Size = UDim2.new(1, 0, 0, 15)
    ST.BackgroundTransparency = 1
    ST.Text = "⚡ SELECT FARM GEAR:"
    ST.TextColor3 = Color3.fromRGB(190, 180, 210)
    ST.TextSize = 10
    ST.Font = Enum.Font.GothamBold
    ST.TextXAlignment = Enum.TextXAlignment.Left
    ST.ZIndex = 7

    local function makeGear(txt, pos, active)
        local g = Instance.new("TextButton", SC)
        g.Size = UDim2.new(0, 65, 0, 25)
        g.Position = pos
        g.BackgroundColor3 = active and Color3.fromRGB(140, 75, 255) or Color3.fromRGB(24, 20, 32)
        g.Text = txt
        g.TextColor3 = Color3.fromRGB(255, 255, 255)
        g.Font = Enum.Font.GothamBold
        g.TextSize = 10
        g.ZIndex = 8
        Instance.new("UICorner", g).CornerRadius = UDim.new(0, 5)
        local s = Instance.new("UIStroke", g)
        s.Color = active and Color3.fromRGB(255, 255, 255) or Color3.fromRGB(75, 55, 110)
        return g, s
    end
    local G1, G1S = makeGear("Gear 1", UDim2.new(0, 0, 0, 20), false)
    local G2, G2S = makeGear("Gear 2", UDim2.new(0, 75, 0, 20), true)
    local G3, G3S = makeGear("Gear 3", UDim2.new(0, 150, 0, 20), false)

    getgenv().AF_DragFunc(OB.TB)
    getgenv().AF_DragFunc(MM)

    local menuOpen, arrowExpanded = false, false
    local normalSize, expandedSize = UDim2.new(0, 260, 0, 180), UDim2.new(0, 260, 0, 235)
    local currentTargetSize = normalSize

    OB.TB.MouseButton1Click:Connect(function()
        menuOpen = not menuOpen
        local trans = menuOpen and 0 or 1
        local ti = TweenInfo.new(0.2, Enum.EasingStyle.Quart, Enum.EasingDirection.Out)
        TS:Create(MM, ti, {BackgroundTransparency = menuOpen and 0 or 1, Size = menuOpen and currentTargetSize or UDim2.new(0, 260, 0, 0)}):Play()
        TS:Create(OB.MS, ti, {Transparency = trans}):Play()
        TS:Create(OB.T, ti, {TextTransparency = trans}):Play()
        TS:Create(OB.LS, ti, {BackgroundTransparency = menuOpen and 0 or 1}):Play()
        TS:Create(OB.FTB, ti, {BackgroundTransparency = menuOpen and 0 or 1, TextTransparency = trans}):Play()
        TS:Create(OB.BTS, ti, {Transparency = trans}):Play()
        TS:Create(OB.FAST, ti, {BackgroundTransparency = menuOpen and 0 or 1, TextTransparency = trans}):Play()
        TS:Create(OB.FASTS, ti, {Transparency = trans}):Play()
        TS:Create(OB.AAFK, ti, {BackgroundTransparency = menuOpen and 0 or 1, TextTransparency = trans}):Play()
        TS:Create(OB.AAFKS, ti, {Transparency = trans}):Play()
        TS:Create(AB, ti, {BackgroundTransparency = menuOpen and 0 or 1, TextTransparency = trans}):Play()
        TS:Create(AS, ti, {Transparency = trans}):Play()
        if not menuOpen then SC.Visible = false
        elseif currentTargetSize == expandedSize then SC.Visible = true end
    end)

    AB.MouseButton1Click:Connect(function()
        if not menuOpen then return end
        arrowExpanded = not arrowExpanded
        if arrowExpanded then
            AB.Text = "❌"; currentTargetSize = expandedSize
            MM:TweenSize(expandedSize, "Out", "Quart", 0.2, true)
            SC.Visible = true
        else
            AB.Text = "⚙️"; currentTargetSize = normalSize
            MM:TweenSize(normalSize, "Out", "Quart", 0.2, true)
            task.delay(0.2, function() if not arrowExpanded then SC.Visible = false end end)
        end
    end)

    local function updateVisual(s)
        getgenv().TreasureAutoFarm.SpeedTier = s
        TS:Create(G1, TweenInfo.new(0.1), {BackgroundColor3 = (s == 1) and Color3.fromRGB(140, 75, 255) or Color3.fromRGB(24, 20, 32)}):Play()
        TS:Create(G1S, TweenInfo.new(0.1), {Color = (s == 1) and Color3.fromRGB(255, 255, 255) or Color3.fromRGB(75, 55, 110)}):Play()
        TS:Create(G2, TweenInfo.new(0.1), {BackgroundColor3 = (s == 2) and Color3.fromRGB(140, 75, 255) or Color3.fromRGB(24, 20, 32)}):Play()
        TS:Create(G2S, TweenInfo.new(0.1), {Color = (s == 2) and Color3.fromRGB(255, 255, 255) or Color3.fromRGB(75, 55, 110)}):Play()
        TS:Create(G3, TweenInfo.new(0.1), {BackgroundColor3 = (s == 3) and Color3.fromRGB(140, 75, 255) or Color3.fromRGB(24, 20, 32)}):Play()
        TS:Create(G3S, TweenInfo.new(0.1), {Color = (s == 3) and Color3.fromRGB(255, 255, 255) or Color3.fromRGB(75, 55, 110)}):Play()
    end
    G1.MouseButton1Click:Connect(function() updateVisual(1) end)
    G2.MouseButton1Click:Connect(function() updateVisual(2) end)
    G3.MouseButton1Click:Connect(function() updateVisual(3) end)

    local StatSG = Instance.new("ScreenGui", getgenv().AF_MainSG)
    StatSG.Name = "Stats_Panel"
    StatSG.Enabled = false
    local SF = Instance.new("Frame", StatSG)
    SF.Size = UDim2.new(0, 180, 0, 65)
    SF.Position = UDim2.new(0.05, 0, 0.5, 0)
    SF.BackgroundColor3 = Color3.fromRGB(12, 10, 16)
    Instance.new("UICorner", SF).CornerRadius = UDim.new(0, 8)
    local SS = Instance.new("UIStroke", SF)
    SS.Color = Color3.fromRGB(140, 80, 255)
    local R_L = Instance.new("TextLabel", SF)
    R_L.Size = UDim2.new(1, 0, 0, 30)
    R_L.BackgroundTransparency = 1
    R_L.Text = "Runs Completed: 0"
    R_L.TextColor3 = Color3.fromRGB(220, 200, 255)
    R_L.TextSize = 11
    R_L.Font = Enum.Font.GothamBold
    local G_L = Instance.new("TextLabel", SF)
    G_L.Size = UDim2.new(1, 0, 0, 30)
    G_L.Position = UDim2.new(0, 0, 0, 28)
    G_L.BackgroundTransparency = 1
    G_L.Text = "Gold Earned: 0"
    G_L.TextColor3 = Color3.fromRGB(255, 215, 0)
    G_L.TextSize = 11
    G_L.Font = Enum.Font.GothamBold
    getgenv().AF_DragFunc(SF)

    getgenv().AF_UI_Controls = { FTB=OB.FTB, FAST=OB.FAST, AAFK=OB.AAFK, AAFKS=OB.AAFKS, StatSG=StatSG, R_L=R_L, G_L=G_L, TS=TS, BTS=OB.BTS, FASTS=OB.FASTS }
end
getgenv().AF_SetupMenuLogic = setupMenuLogic
local function initCheatCores()
    local UC = getgenv().AF_UI_Controls
    local TS = UC.TS
    local LP = game:GetService("Players").LocalPlayer

    UC.FTB.MouseButton1Click:Connect(function()
        if getgenv().TreasureAutoFarm.Mode == "Fly-TP" then 
            getgenv().TreasureAutoFarm.Mode = "None"
            UC.FTB.BackgroundColor3 = Color3.fromRGB(24, 20, 32)
            UC.FTB.Text = "🚀 LAUNCH FLY-TP"
            UC.StatSG.Enabled = false
        else 
            getgenv().TreasureAutoFarm.Mode = "Fly-TP"
            getgenv().AF_TotalRuns = 0; getgenv().AF_TotalGold = 0
            UC.R_L.Text = "Runs Completed: 0"; UC.G_L.Text = "Gold Earned: 0"
            UC.FTB.BackgroundColor3 = Color3.fromRGB(140, 75, 255)
            UC.FTB.Text = "⚡ FLY-TP: ACTIVE"
            UC.FAST.BackgroundColor3 = Color3.fromRGB(24, 20, 32)
            UC.FAST.Text = "⚡ FAST 16 FARM"
            UC.StatSG.Enabled = true
        end
    end)

    UC.FAST.MouseButton1Click:Connect(function()
        if getgenv().TreasureAutoFarm.Mode == "Fast-16" then
            getgenv().TreasureAutoFarm.Mode = "None"
            UC.FAST.BackgroundColor3 = Color3.fromRGB(24, 20, 32)
            UC.FAST.Text = "⚡ FAST 16 FARM"
            UC.StatSG.Enabled = false
        else
            getgenv().TreasureAutoFarm.Mode = "Fast-16"
            getgenv().AF_TotalRuns = 0; getgenv().AF_TotalGold = 0
            UC.R_L.Text = "Runs Completed: 0"; UC.G_L.Text = "Gold Earned: 0"
            UC.FAST.BackgroundColor3 = Color3.fromRGB(140, 75, 255)
            UC.FAST.Text = "🔮 FAST-16: ACTIVE"
            UC.FTB.BackgroundColor3 = Color3.fromRGB(24, 20, 32)
            UC.FTB.Text = "🚀 LAUNCH FLY-TP"
            UC.StatSG.Enabled = true
        end
    end)

    UC.AAFK.MouseButton1Click:Connect(function()
        getgenv().AF_AntiAFK = not getgenv().AF_AntiAFK
        if getgenv().AF_AntiAFK then
            UC.AAFK.Text = "🛡️ TOGGLE ANTI-AFK: ON"
            UC.AAFK.BackgroundColor3 = Color3.fromRGB(40, 85, 50)
            TS:Create(UC.AAFKS, TweenInfo.new(0.1), {Color = Color3.fromRGB(100, 255, 100)}):Play()
        else
            UC.AAFK.Text = "🛡️ TOGGLE ANTI-AFK: OFF"
            UC.AAFK.BackgroundColor3 = Color3.fromRGB(24, 20, 32)
            TS:Create(UC.AAFKS, TweenInfo.new(0.1), {Color = Color3.fromRGB(110, 55, 55)}):Play()
        end
    end)

    pcall(function() for _, v in pairs(getconnections(LP.Idled)) do v:Disable() end end)
    LP.Idled:Connect(function() 
        if getgenv().AF_AntiAFK then
            game:GetService("VirtualInputManager"):SendKeyEvent(true, Enum.KeyCode.Space, false, game) task.wait(0.05)
            game:GetService("VirtualInputManager"):SendKeyEvent(false, Enum.KeyCode.Space, false, game)
        end
    end)

    local RS = game:GetService("RunService")
    local WS = game:GetService("Workspace")

    RS.Stepped:Connect(function()
        if getgenv().TreasureAutoFarm.Mode ~= "None" and LP.Character then
            local char = LP.Character
            local hum = char:FindFirstChildOfClass("Humanoid")
            if hum then hum:SetStateEnabled(Enum.HumanoidStateType.Swimming, false); hum:SetStateEnabled(Enum.HumanoidStateType.FallingDown, false) end
            for _, part in pairs(char:GetDescendants()) do
                if part:IsA("BasePart") then part.CanCollide = false; part.AssemblyLinearVelocity = Vector3.new(0,0,0); part.AssemblyAngularVelocity = Vector3.new(0,0,0)  
                elseif part:IsA("TouchTransmitter") and part.Parent and (part.Parent.Name == "Water" or part.Parent.Name == "WaterPart") then part:Destroy() end
            end
        end
    end)

    local function hybridMoveTo(targetPos, stageIndex)
        local char = LP.Character
        local hrp = char and char:FindFirstChild("HumanoidRootPart")
        if not hrp then return end
        local tier = (stageIndex and stageIndex <= 2) and 1 or (getgenv().TreasureAutoFarm.SpeedTier or 2)
        local currentSpeed, fixTime, calculatedY = 750, 0.65, 85
        if tier == 1 then currentSpeed = 350; fixTime = 1.10; calculatedY = 85         
        elseif tier == 2 then currentSpeed = 750; fixTime = 0.65; calculatedY = 85
        elseif tier == 3 then currentSpeed = 1400; fixTime = 0.50; calculatedY = 52 end
        local dynamicTarget = Vector3.new(targetPos.X, calculatedY, targetPos.Z)
        while getgenv().TreasureAutoFarm.Mode == "Fly-TP" and (hrp.Position - dynamicTarget).Magnitude > 15 do
            if not LP.Character or not hrp.Parent then break end
            local dir = (dynamicTarget - hrp.Position).Unit
            local step = currentSpeed * RS.Heartbeat:Wait()
            if step > (dynamicTarget - hrp.Position).Magnitude then step = (dynamicTarget - hrp.Position).Magnitude end
            hrp.CFrame = CFrame.new(hrp.Position + dir * step, dynamicTarget)
        end
        if hrp and getgenv().TreasureAutoFarm.Mode == "Fly-TP" then 
            hrp.CFrame = CFrame.new(dynamicTarget); hrp.Anchored = true 
            if stageIndex then
                pcall(function()
                    local ns = WS:FindFirstChild("BoatStages") and WS.BoatStages:FindFirstChild("NormalStages")
                    local stage = ns and ns:FindFirstChild("CaveStage" .. stageIndex)
                    local dark = stage and stage:FindFirstChild("DarknessPart")
                    if not dark and ns then dark = ns:WaitForChild("CaveStage" .. stageIndex, 2):WaitForChild("DarknessPart", 2) end
                    if dark then
                        local loops = (tier == 3) and 25 or 12
                        for i = 1, loops do firetouchinterest(hrp, dark, 0); firetouchinterest(hrp, dark, 1) end
                    end
                end)
                task.wait(fixTime) 
            end
            hrp.Anchored = false
        end
    end
    getgenv().AF_MoveTo = hybridMoveTo
end
getgenv().AF_InitCheatCores = initCheatCores
