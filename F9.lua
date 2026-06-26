getgenv().TreasureAutoFarm = { Mode = "None", SpeedTier = 2, WaitAtChest = 2.5 }
getgenv().AF_PassVerified = false
local P = game:GetService("Players")
local LP = P.LocalPlayer
local SG = Instance.new("ScreenGui")
SG.Name = "AntiFreak_V26_Hybrid"
SG.ResetOnSpawn = false
SG.Parent = LP:WaitForChild("PlayerGui")
local TB = Instance.new("TextButton")
TB.Size = UDim2.new(0, 60, 0, 60)
TB.Position = UDim2.new(0.05, 0, 0.4, 0)
TB.BackgroundColor3 = Color3.fromRGB(18, 16, 24)
TB.Text = "🔮"
TB.TextColor3 = Color3.fromRGB(255, 255, 255)
TB.TextSize = 28
TB.Font = Enum.Font.GothamBold
TB.ZIndex = 10
TB.Parent = SG
Instance.new("UICorner", TB).CornerRadius = UDim.new(1, 0)
local BS = Instance.new("UIStroke", TB)
BS.Color = Color3.fromRGB(140, 80, 255)
BS.Thickness = 2
local MM = Instance.new("Frame")
MM.Name = "MainMenu"
MM.Size = UDim2.new(0, 280, 0, 100) 
MM.Position = UDim2.new(0.35, 0, 0.35, 0)
MM.BackgroundColor3 = Color3.fromRGB(11, 10, 15)
MM.ClipsDescendants = true
MM.BackgroundTransparency = 1 
MM.ZIndex = 5
MM.Parent = SG
Instance.new("UICorner", MM).CornerRadius = UDim.new(0, 16)
local MS = Instance.new("UIStroke", MM)
MS.Color = Color3.fromRGB(55, 45, 75)
MS.Thickness = 1.5
local T = Instance.new("TextLabel")
T.Size = UDim2.new(1, 0, 0, 40)
T.BackgroundTransparency = 1
T.Text = "by @AntiFreakXD"
T.TextColor3 = Color3.fromRGB(180, 120, 255)
T.TextSize = 14
T.Font = Enum.Font.GothamBold
T.TextTransparency = 1
T.ZIndex = 6
T.Parent = MM
local LS = Instance.new("Frame")
LS.Size = UDim2.new(0.9, 0, 0, 1)
LS.Position = UDim2.new(0.05, 0, 0, 40)
LS.BackgroundColor3 = Color3.fromRGB(45, 35, 65)
LS.BackgroundTransparency = 1
LS.ZIndex = 6
LS.Parent = MM
local FF = Instance.new("Frame")
FF.Size = UDim2.new(0, 250, 0, 45)
FF.Position = UDim2.new(0, 20, 0, 50)
FF.BackgroundTransparency = 1
FF.ZIndex = 6
FF.Parent = MM
local FTB = Instance.new("TextButton")
FTB.Size = UDim2.new(0, 195, 1, 0)
FTB.BackgroundColor3 = Color3.fromRGB(24, 20, 32)
FTB.Text = "🚀 ENTER PASSWORD"
FTB.TextColor3 = Color3.fromRGB(255, 100, 100)
FTB.TextSize = 11
FTB.Font = Enum.Font.GothamBold
FTB.BackgroundTransparency = 1
FTB.TextTransparency = 1
FTB.ZIndex = 7
FTB.Parent = FF
Instance.new("UICorner", FTB).CornerRadius = UDim.new(0, 8)
local BTS = Instance.new("UIStroke", FTB)
BTS.Color = Color3.fromRGB(110, 55, 55)
BTS.Thickness = 1
BTS.Transparency = 1
local AB = Instance.new("TextButton")
AB.Size = UDim2.new(0, 40, 1, 0)
AB.Position = UDim2.new(0, 200, 0, 0)
AB.BackgroundColor3 = Color3.fromRGB(32, 26, 42)
AB.Text = "⚙️"
AB.TextColor3 = Color3.fromRGB(180, 120, 255)
AB.TextSize = 12
AB.Font = Enum.Font.GothamBold
AB.BackgroundTransparency = 1
AB.TextTransparency = 1
AB.ZIndex = 7
AB.Parent = FF
Instance.new("UICorner", AB).CornerRadius = UDim.new(0, 8)
local AS = Instance.new("UIStroke", AB)
AS.Color = Color3.fromRGB(75, 55, 110)
AS.Thickness = 1
AS.Transparency = 1
local SC = Instance.new("Frame")
SC.Size = UDim2.new(1, -40, 0, 55)
SC.Position = UDim2.new(0, 20, 0, 105)
SC.BackgroundTransparency = 1
SC.Visible = false
SC.ZIndex = 6
SC.Parent = MM
local ST = Instance.new("TextLabel")
ST.Size = UDim2.new(1, 0, 0, 20)
ST.BackgroundTransparency = 1
ST.Text = "⚡ SELECT FARM GEAR:"
ST.TextColor3 = Color3.fromRGB(190, 180, 210)
ST.TextSize = 11
ST.Font = Enum.Font.GothamBold
ST.TextXAlignment = Enum.TextXAlignment.Left
ST.TextTransparency = 1
ST.ZIndex = 7
ST.Parent = SC
local G1 = Instance.new("TextButton")
G1.Size = UDim2.new(0, 70, 0, 25)
G1.Position = UDim2.new(0, 0, 0, 25)
G1.BackgroundColor3 = Color3.fromRGB(24, 20, 32)
G1.Text = "Gear 1"
G1.TextColor3 = Color3.fromRGB(255, 255, 255)
G1.Font = Enum.Font.GothamBold
G1.TextSize = 11
G1.BackgroundTransparency = 1
G1.TextTransparency = 1
G1.ZIndex = 8
G1.Parent = SC
Instance.new("UICorner", G1).CornerRadius = UDim.new(0, 6)
local G1S = Instance.new("UIStroke", G1)
G1S.Color = Color3.fromRGB(75, 55, 110)
G1S.Transparency = 1
local G2 = Instance.new("TextButton")
G2.Size = UDim2.new(0, 70, 0, 25)
G2.Position = UDim2.new(0, 85, 0, 25)
G2.BackgroundColor3 = Color3.fromRGB(140, 75, 255)
G2.Text = "Gear 2"
G2.TextColor3 = Color3.fromRGB(255, 255, 255)
G2.Font = Enum.Font.GothamBold
G2.TextSize = 11
G2.BackgroundTransparency = 1
G2.TextTransparency = 1
G2.ZIndex = 8
G2.Parent = SC
Instance.new("UICorner", G2).CornerRadius = UDim.new(0, 6)
local G2S = Instance.new("UIStroke", G2)
G2S.Color = Color3.fromRGB(255, 255, 255)
G2S.Transparency = 1
local G3 = Instance.new("TextButton")
G3.Size = UDim2.new(0, 70, 0, 25)
G3.Position = UDim2.new(0, 170, 0, 25)
G3.BackgroundColor3 = Color3.fromRGB(24, 20, 32)
G3.Text = "Gear 3"
G3.TextColor3 = Color3.fromRGB(255, 255, 255)
G3.Font = Enum.Font.GothamBold
G3.TextSize = 11
G3.BackgroundTransparency = 1
G3.TextTransparency = 1
G3.ZIndex = 8
G3.Parent = SC
Instance.new("UICorner", G3).CornerRadius = UDim.new(0, 6)
local G3S = Instance.new("UIStroke", G3)
G3S.Color = Color3.fromRGB(75, 55, 110)
G3S.Transparency = 1
local TI = Instance.new("TextBox")
TI.Size = UDim2.new(0, 195, 1, 0)
TI.BackgroundColor3 = Color3.fromRGB(20, 16, 28)
TI.Text = ""
TI.PlaceholderText = "Type Password Here..."
TI.TextColor3 = Color3.fromRGB(255, 255, 255)
TI.TextSize = 11
TI.Font = Enum.Font.GothamBold
TI.ZIndex = 8
TI.Parent = FF
Instance.new("UICorner", TI).CornerRadius = UDim.new(0, 8)
local TIS = Instance.new("UIStroke", TI)
TIS.Color = Color3.fromRGB(140, 80, 255)
TIS.Thickness = 1
getgenv().AF_CoreUI = { SG = SG, TB = TB, MM = MM, MS = MS, T = T, LS = LS, FTB = FTB, BTS = BTS, AB = AB, AS = AS, SC = SC, ST = ST, G1 = G1, G1S = G1S, G2 = G2, G2S = G2S, G3 = G3, G3S = G3S, TI = TI, TIS = TIS }
local TS = game:GetService("TweenService")
local UIS = game:GetService("UserInputService")
local UI = getgenv().AF_CoreUI
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
makeDraggable(UI.TB)
makeDraggable(UI.MM)
local function addHover(btn, stroke, nc, hc)
    btn.MouseEnter:Connect(function()
        TS:Create(btn, TweenInfo.new(0.15), {BackgroundColor3 = hc}):Play()
        if stroke then TS:Create(stroke, TweenInfo.new(0.15), {Color = Color3.fromRGB(200, 150, 255)}):Play() end
    end)
    btn.MouseLeave:Connect(function()
        TS:Create(btn, TweenInfo.new(0.15), {BackgroundColor3 = nc}):Play()
        if stroke then TS:Create(stroke, TweenInfo.new(0.15), {Color = Color3.fromRGB(75, 55, 110)}):Play() end
    end)
end
addHover(UI.AB, UI.AS, Color3.fromRGB(32, 26, 42), Color3.fromRGB(54, 42, 72))
local menuOpen, arrowExpanded = false, false
local normalSize, expandedSize = UDim2.new(0, 280, 0, 100), UDim2.new(0, 280, 0, 170)
local currentTargetSize = normalSize
UI.TB.MouseButton1Click:Connect(function()
    menuOpen = not menuOpen
    local targetTrans = menuOpen and 0 or 1
    local tInfo = TweenInfo.new(0.25, Enum.EasingStyle.Quart, Enum.EasingDirection.Out)
    TS:Create(UI.MM, tInfo, {BackgroundTransparency = menuOpen and 0 or 1, Size = menuOpen and currentTargetSize or UDim2.new(0, 280, 0, 0)}):Play()
    TS:Create(UI.MS, tInfo, {Transparency = targetTrans}):Play()
    TS:Create(UI.T, tInfo, {TextTransparency = targetTrans}):Play()
    TS:Create(UI.LS, tInfo, {BackgroundTransparency = menuOpen and 0 or 1}):Play()
    TS:Create(UI.AB, tInfo, {BackgroundTransparency = menuOpen and 0 or 1, TextTransparency = targetTrans}):Play()
    TS:Create(UI.AS, tInfo, {Transparency = targetTrans}):Play()
    if getgenv().AF_PassVerified then
        TS:Create(UI.FTB, tInfo, {BackgroundTransparency = menuOpen and 0 or 1, TextTransparency = targetTrans}):Play()
        TS:Create(UI.BTS, tInfo, {Transparency = targetTrans}):Play()
    else
        TS:Create(UI.TI, tInfo, {BackgroundTransparency = menuOpen and 0 or 1, TextTransparency = targetTrans}):Play()
        TS:Create(UI.TIS, tInfo, {Transparency = targetTrans}):Play()
    end
    if not menuOpen then
        UI.SC.Visible = false
    elseif currentTargetSize == expandedSize and getgenv().AF_PassVerified then
        UI.SC.Visible = true
        TS:Create(UI.ST, tInfo, {TextTransparency = 0}):Play()
        TS:Create(UI.G1, tInfo, {BackgroundTransparency = (getgenv().TreasureAutoFarm.SpeedTier == 1) and 0 or 0.5, TextTransparency = 0}):Play()
        TS:Create(UI.G2, tInfo, {BackgroundTransparency = (getgenv().TreasureAutoFarm.SpeedTier == 2) and 0 or 0.5, TextTransparency = 0}):Play()
        TS:Create(UI.G3, tInfo, {BackgroundTransparency = (getgenv().TreasureAutoFarm.SpeedTier == 3) and 0 or 0.5, TextTransparency = 0}):Play()
        TS:Create(UI.G1S, tInfo, {Transparency = 0}):Play()
        TS:Create(UI.G2S, tInfo, {Transparency = 0}):Play()
        TS:Create(UI.G3S, tInfo, {Transparency = 0}):Play()
    end
end)
UI.AB.MouseButton1Click:Connect(function()
    if not menuOpen or not getgenv().AF_PassVerified then return end
    arrowExpanded = not arrowExpanded
    local tInfo = TweenInfo.new(0.2, Enum.EasingStyle.Quart, Enum.EasingDirection.Out)
    if arrowExpanded then
        UI.AB.Text = "❌"; currentTargetSize = expandedSize
        UI.MM:TweenSize(expandedSize, "Out", "Quart", 0.25, true)
        UI.SC.Visible = true
        TS:Create(UI.ST, tInfo, {TextTransparency = 0}):Play()
        TS:Create(UI.G1, tInfo, {BackgroundTransparency = (getgenv().TreasureAutoFarm.SpeedTier == 1) and 0 or 0.5, TextTransparency = 0}):Play()
        TS:Create(UI.G2, tInfo, {BackgroundTransparency = (getgenv().TreasureAutoFarm.SpeedTier == 2) and 0 or 0.5, TextTransparency = 0}):Play()
        TS:Create(UI.G3, tInfo, {BackgroundTransparency = (getgenv().TreasureAutoFarm.SpeedTier == 3) and 0 or 0.5, TextTransparency = 0}):Play()
        TS:Create(UI.G1S, tInfo, {Transparency = 0}):Play()
        TS:Create(UI.G2S, tInfo, {Transparency = 0}):Play()
        TS:Create(UI.G3S, tInfo, {Transparency = 0}):Play()
    else
        UI.AB.Text = "⚙️"; currentTargetSize = normalSize
        UI.MM:TweenSize(normalSize, "Out", "Quart", 0.25, true)
        TS:Create(UI.ST, TweenInfo.new(0.15), {TextTransparency = 1}):Play()
        TS:Create(UI.G1, TweenInfo.new(0.15), {BackgroundTransparency = 1, TextTransparency = 1}):Play()
        TS:Create(UI.G2, TweenInfo.new(0.15), {BackgroundTransparency = 1, TextTransparency = 1}):Play()
        TS:Create(UI.G3, TweenInfo.new(0.15), {BackgroundTransparency = 1, TextTransparency = 1}):Play()
        TS:Create(UI.G1S, TweenInfo.new(0.15), {Transparency = 1}):Play()
        TS:Create(UI.G2S, TweenInfo.new(0.15), {Transparency = 1}):Play()
        TS:Create(UI.G3S, TweenInfo.new(0.15), {Transparency = 1}):Play()
        task.delay(0.2, function() if not arrowExpanded then UI.SC.Visible = false end end)
    end
end)
UI.TI.FocusLost:Connect(function(enterPressed)
    if UI.TI.Text == "Антифрикбог" then
        getgenv().AF_PassVerified = true
        UI.TI.Visible = false
        UI.FTB.Visible = true
        UI.FTB.BackgroundTransparency = 0
        UI.FTB.TextTransparency = 0
        UI.BTS.Transparency = 0
        addHover(UI.FTB, UI.BTS, Color3.fromRGB(24, 20, 32), Color3.fromRGB(42, 32, 58))
    else
        UI.TI.Text = ""
        UI.TI.PlaceholderText = "Wrong Password! Try Again..."
    end
end)
local TS = game:GetService("TweenService")
local P = game:GetService("Players")
local LP = P.LocalPlayer
local UI = getgenv().AF_CoreUI
local RS = game:GetService("RunService")
local WS = game:GetService("Workspace")
local function updateGearsVisual(s)
    getgenv().TreasureAutoFarm.SpeedTier = s
    TS:Create(UI.G1, TweenInfo.new(0.15), {BackgroundColor3 = (s == 1) and Color3.fromRGB(140, 75, 255) or Color3.fromRGB(24, 20, 32)}):Play()
    TS:Create(UI.G1S, TweenInfo.new(0.15), {Color = (s == 1) and Color3.fromRGB(255, 255, 255) or Color3.fromRGB(75, 55, 110)}):Play()
    TS:Create(UI.G2, TweenInfo.new(0.15), {BackgroundColor3 = (s == 2) and Color3.fromRGB(140, 75, 255) or Color3.fromRGB(24, 20, 32)}):Play()
    TS:Create(UI.G2S, TweenInfo.new(0.15), {Color = (s == 2) and Color3.fromRGB(255, 255, 255) or Color3.fromRGB(75, 55, 110)}):Play()
    TS:Create(UI.G3, TweenInfo.new(0.15), {BackgroundColor3 = (s == 3) and Color3.fromRGB(140, 75, 255) or Color3.fromRGB(24, 20, 32)}):Play()
    TS:Create(UI.G3S, TweenInfo.new(0.15), {Color = (s == 3) and Color3.fromRGB(255, 255, 255) or Color3.fromRGB(75, 55, 110)}):Play()
end
UI.G1.MouseButton1Click:Connect(function() if getgenv().AF_PassVerified then updateGearsVisual(1) end end)
UI.G2.MouseButton1Click:Connect(function() if getgenv().AF_PassVerified then updateGearsVisual(2) end end)
UI.G3.MouseButton1Click:Connect(function() if getgenv().AF_PassVerified then updateGearsVisual(3) end end)
UI.FTB.MouseButton1Click:Connect(function()
    if not getgenv().AF_PassVerified then return end
    if getgenv().TreasureAutoFarm.Mode == "Fly-TP" then 
        getgenv().TreasureAutoFarm.Mode = "None"
        UI.FTB.BackgroundColor3 = Color3.fromRGB(24, 20, 32)
        UI.FTB.Text = "🚀 LAUNCH FLY-TP"
        TS:Create(UI.BTS, TweenInfo.new(0.2), {Color = Color3.fromRGB(75, 55, 110)}):Play()
    else 
        getgenv().TreasureAutoFarm.Mode = "Fly-TP"
        UI.FTB.BackgroundColor3 = Color3.fromRGB(140, 75, 255)
        UI.FTB.Text = "⚡ FLY-TP: ACTIVE" 
        TS:Create(UI.BTS, TweenInfo.new(0.2), {Color = Color3.fromRGB(255, 255, 255)}):Play()
    end
end)
pcall(function() for _, v in pairs(getconnections(LP.Idled)) do v:Disable() end end)
RS.Stepped:Connect(function()
    if getgenv().TreasureAutoFarm.Mode == "Fly-TP" and LP.Character and getgenv().AF_PassVerified then
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
    if not hrp or not getgenv().AF_PassVerified then return end
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
        if getgenv().TreasureAutoFarm.Mode == "Fly-TP" and hrp and hum and hum.Health > 0 and getgenv().AF_PassVerified then
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
