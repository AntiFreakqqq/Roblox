getgenv().TreasureAutoFarm = { Mode = "None", SpeedTier = 2, WaitAtChest = 2.5 }
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
local function initMainCheatUI()
    SG:Destroy()
    
    local MainSG = Instance.new("ScreenGui", LP:WaitForChild("PlayerGui"))
    MainSG.Name = "AntiFreak_V26_Hybrid"
    MainSG.ResetOnSpawn = false

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
    FF.Size = UDim2.new(0, 220, 0, 40)
    FF.Position = UDim2.new(0, 20, 0, 45)
    FF.BackgroundTransparency = 1
    FF.ZIndex = 6

    local FTB = Instance.new("TextButton", FF)
    FTB.Size = UDim2.new(0, 170, 1, 0)
    FTB.BackgroundColor3 = Color3.fromRGB(24, 20, 32)
    FTB.Text = "🚀 LAUNCH FLY-TP"
    FTB.TextColor3 = Color3.fromRGB(220, 200, 255)
    FTB.TextSize = 11
    FTB.Font = Enum.Font.GothamBold
    FTB.BackgroundTransparency = 1
    FTB.TextTransparency = 1
    FTB.ZIndex = 7
    Instance.new("UICorner", FTB).CornerRadius = UDim.new(0, 6)
    local BTS = Instance.new("UIStroke", FTB)
    BTS.Color = Color3.fromRGB(75, 55, 110)
    BTS.Transparency = 1

    local AB = Instance.new("TextButton", FF)
    AB.Size = UDim2.new(0, 40, 1, 0)
    AB.Position = UDim2.new(0, 180, 0, 0)
    AB.BackgroundColor3 = Color3.fromRGB(32, 26, 42)
    AB.Text = "⚙️"
    AB.TextColor3 = Color3.fromRGB(180, 120, 255)
    AB.TextSize = 12
    AB.Font = Enum.Font.GothamBold
    AB.BackgroundTransparency = 1
    AB.TextTransparency = 1
    AB.ZIndex = 7
    Instance.new("UICorner", AB).CornerRadius = UDim.new(0, 6)
    local AS = Instance.new("UIStroke", AB)
    AS.Color = Color3.fromRGB(75, 55, 110)
    AS.Transparency = 1

    local SC = Instance.new("Frame", MM)
    SC.Size = UDim2.new(1, -40, 0, 50)
    SC.Position = UDim2.new(0, 20, 0, 95)
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
    ST.TextTransparency = 1
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
        g.BackgroundTransparency = 1
        g.TextTransparency = 1
        g.ZIndex = 8
        Instance.new("UICorner", g).CornerRadius = UDim.new(0, 5)
        local s = Instance.new("UIStroke", g)
        s.Color = active and Color3.fromRGB(255, 255, 255) or Color3.fromRGB(75, 55, 110)
        s.Transparency = 1
        return g, s
    end
    local G1, G1S = makeGear("Gear 1", UDim2.new(0, 0, 0, 20), false)
    local G2, G2S = makeGear("Gear 2", UDim2.new(0, 75, 0, 20), true)
    local G3, G3S = makeGear("Gear 3", UDim2.new(0, 150, 0, 20), false)

    local TS = game:GetService("TweenService")
    makeDraggable(TB)
    makeDraggable(MM)

    local menuOpen, arrowExpanded = false, false
    local normalSize, expandedSize = UDim2.new(0, 260, 0, 95), UDim2.new(0, 260, 0, 155)
    local currentTargetSize = normalSize

    TB.MouseButton1Click:Connect(function()
        menuOpen = not menuOpen
        local trans = menuOpen and 0 or 1
        local ti = TweenInfo.new(0.2, Enum.EasingStyle.Quart, Enum.EasingDirection.Out)
        TS:Create(MM, ti, {BackgroundTransparency = menuOpen and 0 or 1, Size = menuOpen and currentTargetSize or UDim2.new(0, 260, 0, 0)}):Play()
        TS:Create(MS, ti, {Transparency = trans}):Play()
        TS:Create(T, ti, {TextTransparency = trans}):Play()
        TS:Create(LS, ti, {BackgroundTransparency = menuOpen and 0 or 1}):Play()
        TS:Create(FTB, ti, {BackgroundTransparency = menuOpen and 0 or 1, TextTransparency = trans}):Play()
        TS:Create(BTS, ti, {Transparency = trans}):Play()
        TS:Create(AB, ti, {BackgroundTransparency = menuOpen and 0 or 1, TextTransparency = trans}):Play()
        TS:Create(AS, ti, {Transparency = trans}):Play()
        if not menuOpen then SC.Visible = false
        elseif currentTargetSize == expandedSize then
            SC.Visible = true
            TS:Create(ST, ti, {TextTransparency = 0}):Play()
            TS:Create(G1, ti, {BackgroundTransparency = (getgenv().TreasureAutoFarm.SpeedTier == 1) and 0 or 0.5, TextTransparency = 0}):Play()
            TS:Create(G2, ti, {BackgroundTransparency = (getgenv().TreasureAutoFarm.SpeedTier == 2) and 0 or 0.5, TextTransparency = 0}):Play()
            TS:Create(G3, ti, {BackgroundTransparency = (getgenv().TreasureAutoFarm.SpeedTier == 3) and 0 or 0.5, TextTransparency = 0}):Play()
            TS:Create(G1S, ti, {Transparency = 0}):Play()
            TS:Create(G2S, ti, {Transparency = 0}):Play()
            TS:Create(G3S, ti, {Transparency = 0}):Play()
        end
    end)

    AB.MouseButton1Click:Connect(function()
        if not menuOpen then return end
        arrowExpanded = not arrowExpanded
        local ti = TweenInfo.new(0.2, Enum.EasingStyle.Quart, Enum.EasingDirection.Out)
        if arrowExpanded then
            AB.Text = "❌"; currentTargetSize = expandedSize
            MM:TweenSize(expandedSize, "Out", "Quart", 0.2, true)
            SC.Visible = true
            TS:Create(ST, ti, {TextTransparency = 0}):Play()
            TS:Create(G1, ti, {BackgroundTransparency = (getgenv().TreasureAutoFarm.SpeedTier == 1) and 0 or 0.5, TextTransparency = 0}):Play()
            TS:Create(G2, ti, {BackgroundTransparency = (getgenv().TreasureAutoFarm.SpeedTier == 2) and 0 or 0.5, TextTransparency = 0}):Play()
            TS:Create(G3, ti, {BackgroundTransparency = (getgenv().TreasureAutoFarm.SpeedTier == 3) and 0 or 0.5, TextTransparency = 0}):Play()
            TS:Create(G1S, ti, {Transparency = 0}):Play()
            TS:Create(G2S, ti, {Transparency = 0}):Play()
            TS:Create(G3S, ti, {Transparency = 0}):Play()
        else
            AB.Text = "⚙️"; currentTargetSize = normalSize
            MM:TweenSize(normalSize, "Out", "Quart", 0.2, true)
            TS:Create(ST, TweenInfo.new(0.1), {TextTransparency = 1}):Play()
            TS:Create(G1, TweenInfo.new(0.1), {BackgroundTransparency = 1, TextTransparency = 1}):Play()
            TS:Create(G2, TweenInfo.new(0.1), {BackgroundTransparency = 1, TextTransparency = 1}):Play()
            TS:Create(G3, TweenInfo.new(0.1), {BackgroundTransparency = 1, TextTransparency = 1}):Play()
            TS:Create(G1S, TweenInfo.new(0.1), {Transparency = 1}):Play()
            TS:Create(G2S, TweenInfo.new(0.1), {Transparency = 1}):Play()
            TS:Create(G3S, TweenInfo.new(0.1), {Transparency = 1}):Play()
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

    FTB.MouseButton1Click:Connect(function()
        if getgenv().TreasureAutoFarm.Mode == "Fly-TP" then 
            getgenv().TreasureAutoFarm.Mode = "None"
            FTB.BackgroundColor3 = Color3.fromRGB(24, 20, 32)
            FTB.Text = "🚀 LAUNCH FLY-TP"
            TS:Create(BTS, TweenInfo.new(0.1), {Color = Color3.fromRGB(75, 55, 110)}):Play()
        else 
            getgenv().TreasureAutoFarm.Mode = "Fly-TP"
            FTB.BackgroundColor3 = Color3.fromRGB(140, 75, 255)
            FTB.Text = "⚡ FLY-TP: ACTIVE" 
            TS:Create(BTS, TweenInfo.new(0.1), {Color = Color3.fromRGB(255, 255, 255)}):Play()
        end
    end)

    pcall(function() for _, v in pairs(getconnections(LP.Idled)) do v:Disable() end end)
    local RS = game:GetService("RunService")
    local WS = game:GetService("Workspace")

    RS.Stepped:Connect(function()
        if getgenv().TreasureAutoFarm.Mode == "Fly-TP" and LP.Character then
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
        local tier = getgenv().TreasureAutoFarm.SpeedTier or 2
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

    task.spawn(function()
        while true do
            task.wait(0.3)
            local char = LP.Character
            local hrp = char and char:FindFirstChild("HumanoidRootPart")
            local hum = char and char:FindFirstChildOfClass("Humanoid")
            if getgenv().TreasureAutoFarm.Mode == "Fly-TP" and hrp and hum and hum.Health > 0 then
                pcall(function()
                    local ns = WS:WaitForChild("BoatStages", 10):WaitForChild("NormalStages", 10)
                    local tier = getgenv().TreasureAutoFarm.SpeedTier or 2
                    local startY = (tier == 3) and 52 or 85
                    local startPos = Vector3.new(-50, startY, -1025)
                    local st1 = ns:FindFirstChild("CaveStage1")
                    if st1 and st1:FindFirstChild("DarknessPart") then 
                        startPos = Vector3.new(st1.DarknessPart.Position.X, startY, st1.DarknessPart.Position.Z) 
                        pcall(function() firetouchinterest(hrp, st1.DarknessPart, 0); firetouchinterest(hrp, st1.DarknessPart, 1) end)
                    end
                    hrp.CFrame = CFrame.new(startPos); task.wait(0.3)
                    for i = 2, 10 do
                        if getgenv().TreasureAutoFarm.Mode ~= "Fly-TP" then break end
                        local stage = ns:FindFirstChild("CaveStage" .. i)
                        local stagePos = (stage and stage:FindFirstChild("DarknessPart")) and stage.DarknessPart.Position or Vector3.new(-50, 85, -1025 + (i * -775))
                        hybridMoveTo(stagePos, i)
                        if tier < 3 and (i == 3 or i == 6 or i == 9 or i == 10) then
                            hybridMoveTo(Vector3.new(stagePos.X + 18, 85, stagePos.Z), false)
                            hybridMoveTo(Vector3.new(stagePos.X - 18, 85, stagePos.Z), false)
                            hybridMoveTo(Vector3.new(stagePos.X, 85, stagePos.Z), i)
                        end
                    end
                    if getgenv().TreasureAutoFarm.Mode == "Fly-TP" and ns:FindFirstChild("TheEnd") then
                        local chest = ns.TheEnd:FindFirstChild("GoldenChest")
                        local trig = chest and chest:FindFirstChild("Trigger")
                        if trig then 
                            hrp.CFrame = CFrame.new(trig.Position) 
                            pcall(function() for i = 1, 15 do firetouchinterest(hrp, trig, 0); firetouchinterest(hrp, trig, 1) end end)
                        else hrp.CFrame = CFrame.new(-50, -15, -9200) end
                        task.wait(getgenv().TreasureAutoFarm.WaitAtChest)
                    end
                    if getgenv().TreasureAutoFarm.Mode == "Fly-TP" then
                        local respawned = false
                        local conn = LP.CharacterAdded:Connect(function() respawned = true end)
                        if char:FindFirstChildOfClass("Humanoid") then char:FindFirstChildOfClass("Humanoid").Health = 0 end
                        repeat task.wait(0.05) until respawned
                        conn:Disconnect()
                    end
                end)
            end
        end
    end)
end

TI.FocusLost:Connect(function()
    if TI.Text == "Антифрикбог" then
        initMainCheatUI()
    else
        TI.Text = ""
        TI.PlaceholderText = "Wrong! Try Again..."
    end
end)
