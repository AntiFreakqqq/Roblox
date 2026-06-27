getgenv().TreasureAutoFarm = { Mode = "None", SpeedTier = 2, WaitAtChest = 2.5 }
getgenv().AF_PassVerified, getgenv().AF_AntiAFK = false, false
getgenv().AF_TotalRuns, getgenv().AF_TotalGold = 0, 0
getgenv().AF_SessionStart = nil
getgenv().AF_SessionActive = false
getgenv().AF_LastCheckpoint = 0

local LP = game:GetService("Players").LocalPlayer
getgenv().AF_SG = Instance.new("ScreenGui", LP:WaitForChild("PlayerGui"))
getgenv().AF_SG.Name = "AntiFreak_Gate"
getgenv().AF_SG.ResetOnSpawn = false

getgenv().AF_PF = Instance.new("Frame", getgenv().AF_SG)
getgenv().AF_PF.Name = "PasswordWindow"
getgenv().AF_PF.Size = UDim2.new(0, 260, 0, 130)
getgenv().AF_PF.Position = UDim2.new(0.35, 0, 0.4, 0)
getgenv().AF_PF.BackgroundColor3 = Color3.fromRGB(14, 12, 20)
Instance.new("UICorner", getgenv().AF_PF).CornerRadius = UDim.new(0, 10)
local PassStroke = Instance.new("UIStroke", getgenv().AF_PF)
PassStroke.Color = Color3.fromRGB(140, 80, 255)
PassStroke.Thickness = 1.5

local PassTitle = Instance.new("TextLabel", getgenv().AF_PF)
PassTitle.Size = UDim2.new(1, 0, 0, 30)
PassTitle.BackgroundTransparency = 1
PassTitle.Text = "ACCESS REQUIRED"
PassTitle.TextColor3 = Color3.fromRGB(180, 120, 255)
PassTitle.TextSize = 12
PassTitle.Font = Enum.Font.GothamBold

getgenv().AF_TI = Instance.new("TextBox", getgenv().AF_PF)
getgenv().AF_TI.Size = UDim2.new(1, -40, 0, 30)
getgenv().AF_TI.Position = UDim2.new(0, 20, 0, 35)
getgenv().AF_TI.BackgroundColor3 = Color3.fromRGB(22, 18, 30)
getgenv().AF_TI.Text = ""
getgenv().AF_TI.PlaceholderText = "Type Password Here..."
getgenv().AF_TI.TextColor3 = Color3.fromRGB(255, 255, 255)
getgenv().AF_TI.TextSize = 11
getgenv().AF_TI.Font = Enum.Font.GothamBold
Instance.new("UICorner", getgenv().AF_TI).CornerRadius = UDim.new(0, 6)
local TIS = Instance.new("UIStroke", getgenv().AF_TI)
TIS.Color = Color3.fromRGB(55, 45, 75)

getgenv().AF_PasteBtn = Instance.new("TextButton", getgenv().AF_PF)
getgenv().AF_PasteBtn.Size = UDim2.new(0, 105, 0, 30)
getgenv().AF_PasteBtn.Position = UDim2.new(0, 20, 0, 75)
getgenv().AF_PasteBtn.BackgroundColor3 = Color3.fromRGB(30, 25, 45)
getgenv().AF_PasteBtn.Text = "📋 PASTE"
getgenv().AF_PasteBtn.TextColor3 = Color3.fromRGB(200, 180, 255)
getgenv().AF_PasteBtn.TextSize = 10
getgenv().AF_PasteBtn.Font = Enum.Font.GothamBold
Instance.new("UICorner", getgenv().AF_PasteBtn).CornerRadius = UDim.new(0, 6)

getgenv().AF_SubBtn = Instance.new("TextButton", getgenv().AF_PF)
getgenv().AF_SubBtn.Size = UDim2.new(0, 105, 0, 30)
getgenv().AF_SubBtn.Position = UDim2.new(1, -125, 0, 75)
getgenv().AF_SubBtn.BackgroundColor3 = Color3.fromRGB(140, 75, 255)
getgenv().AF_SubBtn.Text = "✅ SUBMIT"
getgenv().AF_SubBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
getgenv().AF_SubBtn.TextSize = 10
getgenv().AF_SubBtn.Font = Enum.Font.GothamBold
Instance.new("UICorner", getgenv().AF_SubBtn).CornerRadius = UDim.new(0, 6)

local UIS = game:GetService("UserInputService")
getgenv().AF_DragFunc = function(obj)
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
getgenv().AF_DragFunc(getgenv().AF_PF)

getgenv().AF_PasteBtn.MouseButton1Click:Connect(function()
    if getclipboard then getgenv().AF_TI.Text = getclipboard() else getgenv().AF_TI.PlaceholderText = "Not supported..." end
end)

getgenv().AF_SpawnMainUI = function()
    if getgenv().AF_SG then getgenv().AF_SG:Destroy() end
    
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
    MM.Size = UDim2.new(0, 260, 0, 0) 
    MM.Position = UDim2.new(0.35, 0, 0.35, 0)
    MM.BackgroundColor3 = Color3.fromRGB(11, 10, 15)
    MM.ClipsDescendants = true
    MM.ZIndex = 5
    Instance.new("UICorner", MM).CornerRadius = UDim.new(0, 12)
    local MS = Instance.new("UIStroke", MM)
    MS.Color = Color3.fromRGB(55, 45, 75)
    MS.Thickness = 1.5

    local T = Instance.new("TextLabel", MM)
    T.Size = UDim2.new(1, 0, 0, 35)
    T.BackgroundTransparency = 1
    T.Text = "by @AntiFreakXD"
    T.TextColor3 = Color3.fromRGB(180, 120, 255)
    T.Font = Enum.Font.GothamBold
    T.TextSize = 13
    T.ZIndex = 6

    local LS = Instance.new("Frame", MM)
    LS.Size = UDim2.new(0.9, 0, 0, 1)
    LS.Position = UDim2.new(0.05, 0, 0, 35)
    LS.BackgroundColor3 = Color3.fromRGB(45, 35, 65)
    LS.ZIndex = 6

    local FF = Instance.new("Frame", MM)
    FF.Size = UDim2.new(0, 220, 0, 130)
    FF.Position = UDim2.new(0, 20, 0, 45)
    FF.BackgroundTransparency = 1
    FF.ZIndex = 6

    local FTB = Instance.new("TextButton", FF)
    FTB.Size = UDim2.new(1, -45, 0, 35)
    FTB.BackgroundColor3 = Color3.fromRGB(24, 20, 32)
    FTB.Text = "🚀 LAUNCH FLY-TP"
    FTB.TextColor3 = Color3.fromRGB(220, 200, 255)
    FTB.Font = Enum.Font.GothamBold
    FTB.TextSize = 11
    FTB.ZIndex = 7
    Instance.new("UICorner", FTB).CornerRadius = UDim.new(0, 6)
    local BTS = Instance.new("UIStroke", FTB)
    BTS.Color = Color3.fromRGB(75, 55, 110)

    local FAST = Instance.new("TextButton", FF)
    FAST.Size = UDim2.new(1, -45, 0, 35)
    FAST.Position = UDim2.new(0, 0, 0, 42)
    FAST.BackgroundColor3 = Color3.fromRGB(24, 20, 32)
    FAST.Text = "⚡ FAST 16 FARM"
    FAST.TextColor3 = Color3.fromRGB(220, 200, 255)
    FAST.Font = Enum.Font.GothamBold
    FAST.TextSize = 11
    FAST.ZIndex = 7
    Instance.new("UICorner", FAST).CornerRadius = UDim.new(0, 6)
    local FASTS = Instance.new("UIStroke", FAST)
    FASTS.Color = Color3.fromRGB(75, 55, 110)

    local AFK = Instance.new("TextButton", FF)
    AFK.Size = UDim2.new(1, -45, 0, 35)
    AFK.Position = UDim2.new(0, 0, 0, 84)
    AFK.BackgroundColor3 = Color3.fromRGB(24, 20, 32)
    AFK.Text = "🛡️ TOGGLE ANTI-AFK: OFF"
    AFK.TextColor3 = Color3.fromRGB(255, 120, 120)
    AFK.Font = Enum.Font.GothamBold
    AFK.TextSize = 10
    AFK.ZIndex = 7
    Instance.new("UICorner", AFK).CornerRadius = UDim.new(0, 6)
    local AFKS = Instance.new("UIStroke", AFK)
    AFKS.Color = Color3.fromRGB(110, 55, 55)

    local AB = Instance.new("TextButton", FF)
    AB.Size = UDim2.new(0, 38, 0, 119)
    AB.Position = UDim2.new(1, -38, 0, 0)
    AB.BackgroundColor3 = Color3.fromRGB(32, 26, 42)
    AB.Text = "⚙️"
    AB.TextColor3 = Color3.fromRGB(180, 120, 255)
    AB.Font = Enum.Font.GothamBold
    AB.TextSize = 12
    AB.ZIndex = 7
    Instance.new("UICorner", AB).CornerRadius = UDim.new(0, 6)
    local AS = Instance.new("UIStroke", AB)
    AS.Color = Color3.fromRGB(75, 55, 110)

    local SC = Instance.new("Frame", MM)
    SC.Size = UDim2.new(1, -40, 0, 60)
    SC.Position = UDim2.new(0, 20, 0, 180)
    SC.BackgroundTransparency = 1
    SC.Visible = false
    SC.ZIndex = 6
    SC.ClipsDescendants = true

    local ST = Instance.new("TextLabel", SC)
    ST.Size = UDim2.new(1, 0, 0, 18)
    ST.BackgroundTransparency = 1
    ST.Text = "⚡ SELECT FARM GEAR:"
    ST.TextColor3 = Color3.fromRGB(190, 180, 210)
    ST.Font = Enum.Font.GothamBold
    ST.TextSize = 10
    ST.TextXAlignment = Enum.TextXAlignment.Left

    local ISG = Instance.new("ScreenGui", LP:WaitForChild("PlayerGui"))
    ISG.Name = "AntiFreak_Stats"
    ISG.ResetOnSpawn = false
    ISG.Enabled = false

    local IF = Instance.new("Frame", ISG)
    IF.Size = UDim2.new(0, 220, 0, 130)
    IF.Position = UDim2.new(0.75, 0, 0.4, 0)
    IF.BackgroundColor3 = Color3.fromRGB(14, 12, 20)
    Instance.new("UICorner", IF).CornerRadius = UDim.new(0, 8)
    local IS = Instance.new("UIStroke", IF)
    IS.Color = Color3.fromRGB(140, 80, 255)
    IS.Thickness = 1.5

    local IT = Instance.new("TextLabel", IF)
    IT.Size = UDim2.new(1, 0, 0, 22)
    IT.BackgroundTransparency = 1
    IT.Text = "📊 SESSION STATS"
    IT.TextColor3 = Color3.fromRGB(180, 120, 255)
    IT.Font = Enum.Font.GothamBold
    IT.TextSize = 11

    local SR = Instance.new("TextLabel", IF)
    SR.Size = UDim2.new(1, -20, 0, 20)
    SR.Position = UDim2.new(0, 10, 0, 25)
    SR.BackgroundTransparency = 1
    SR.Text = "Runs: 0"
    SR.TextColor3 = Color3.fromRGB(255, 255, 255)
    SR.Font = Enum.Font.GothamBold
    SR.TextSize = 10
    SR.TextXAlignment = Enum.TextXAlignment.Left

    local SGld = Instance.new("TextLabel", IF)
    SGld.Size = UDim2.new(1, -20, 0, 20)
    SGld.Position = UDim2.new(0, 10, 0, 45)
    SGld.BackgroundTransparency = 1
    SGld.Text = "Gold: 0"
    SGld.TextColor3 = Color3.fromRGB(220, 200, 255)
    SGld.Font = Enum.Font.GothamBold
    SGld.TextSize = 10
    SGld.TextXAlignment = Enum.TextXAlignment.Left

    local STm = Instance.new("TextLabel", IF)
    STm.Size = UDim2.new(1, -20, 0, 20)
    STm.Position = UDim2.new(0, 10, 0, 65)
    STm.BackgroundTransparency = 1
    STm.Text = "Time: 00:00:00"
    STm.TextColor3 = Color3.fromRGB(100, 200, 255)
    STm.Font = Enum.Font.GothamBold
    STm.TextSize = 10
    STm.TextXAlignment = Enum.TextXAlignment.Left

    local SRate = Instance.new("TextLabel", IF)
    SRate.Size = UDim2.new(1, -20, 0, 20)
    SRate.Position = UDim2.new(0, 10, 0, 85)
    SRate.BackgroundTransparency = 1
    SRate.Text = "Rate: 0/h"
    SRate.TextColor3 = Color3.fromRGB(100, 255, 150)
    SRate.Font = Enum.Font.GothamBold
    SRate.TextSize = 10
    SRate.TextXAlignment = Enum.TextXAlignment.Left

    getgenv().AF_MainData = { TB=TB, MM=MM, MS=MS, T=T, LS=LS, FTB=FTB, BTS=BTS, FAST=FAST, FASTS=FASTS, AFK=AFK, AFKS=AFKS, AB=AB, AS=AS, SC=SC, ST=ST, ISG=ISG, IF=IF, SR=SR, SGld=SGld, STm=STm, SRate=SRate, MainSG=MainSG }
end

local TS = game:GetService("TweenService")
local RS = game:GetService("RunService")
local WS = game:GetService("Workspace")

local function makeGear(txt, pos, active, parent)
    local g = Instance.new("TextButton", parent)
    g.Size = UDim2.new(0, 60, 0, 25)
    g.Position = pos
    g.BackgroundColor3 = active and Color3.fromRGB(140, 75, 255) or Color3.fromRGB(24, 20, 32)
    g.Text = txt
    g.TextColor3 = Color3.fromRGB(255, 255, 255)
    g.Font = Enum.Font.GothamBold
    g.TextSize = 10
    Instance.new("UICorner", g).CornerRadius = UDim.new(0, 5)
    local s = Instance.new("UIStroke", g)
    s.Color = active and Color3.fromRGB(255, 255, 255) or Color3.fromRGB(75, 55, 110)
    return g, s
end

if getgenv().AF_SubBtn then
    getgenv().AF_SubBtn.MouseButton1Click:Connect(function()
        if getgenv().AF_TI and getgenv().AF_TI.Text == "Антифрикбог" then 
            getgenv().AF_PassVerified = true
            if getgenv().AF_SpawnMainUI then getgenv().AF_SpawnMainUI() end
            
            local UI = getgenv().AF_MainData
            if not UI then return end
            
            local G1, G1S = makeGear("Gear 1", UDim2.new(0, 0, 0, 22), false, UI.SC)
            local G2, G2S = makeGear("Gear 2", UDim2.new(0, 70, 0, 22), true, UI.SC)
            local G3, G3S = makeGear("Gear 3", UDim2.new(0, 140, 0, 22), false, UI.SC)
            
            if getgenv().AF_DragFunc then
                getgenv().AF_DragFunc(UI.TB)
                getgenv().AF_DragFunc(UI.MM)
                getgenv().AF_DragFunc(UI.IF)
            end

            local menuOpen, arrowExpanded = false, false
            local normalSize, expandedSize = UDim2.new(0, 260, 0, 180), UDim2.new(0, 260, 0, 260)
            local currentTargetSize = normalSize

            UI.TB.MouseButton1Click:Connect(function()
                menuOpen = not menuOpen
                local trans = menuOpen and 0 or 1
                local ti = TweenInfo.new(0.2, Enum.EasingStyle.Quart, Enum.EasingDirection.Out)
                TS:Create(UI.MM, ti, {BackgroundTransparency = menuOpen and 0 or 1, Size = menuOpen and currentTargetSize or UDim2.new(0, 260, 0, 0)}):Play()
                TS:Create(UI.MS, ti, {Transparency = trans}):Play()
                TS:Create(UI.T, ti, {TextTransparency = trans}):Play()
                TS:Create(UI.LS, ti, {BackgroundTransparency = menuOpen and 0 or 1}):Play()
                TS:Create(UI.FTB, ti, {BackgroundTransparency = menuOpen and 0 or 1, TextTransparency = trans}):Play()
                TS:Create(UI.BTS, ti, {Transparency = trans}):Play()
                TS:Create(UI.FAST, ti, {BackgroundTransparency = menuOpen and 0 or 1, TextTransparency = trans}):Play()
                TS:Create(UI.FASTS, ti, {Transparency = trans}):Play()
                TS:Create(UI.AFK, ti, {BackgroundTransparency = menuOpen and 0 or 1, TextTransparency = trans}):Play()
                TS:Create(UI.AFKS, ti, {Transparency = trans}):Play()
                TS:Create(UI.AB, ti, {BackgroundTransparency = menuOpen and 0 or 1, TextTransparency = trans}):Play()
                TS:Create(UI.AS, ti, {Transparency = trans}):Play()
                if not menuOpen then UI.SC.Visible = false
                elseif currentTargetSize == expandedSize then UI.SC.Visible = true end
            end)

            UI.AB.MouseButton1Click:Connect(function()
                if not menuOpen then return end
                arrowExpanded = not arrowExpanded
                if arrowExpanded then
                    UI.AB.Text = "❌"
                    currentTargetSize = expandedSize
                    UI.MM:TweenSize(expandedSize, "Out", "Quart", 0.2, true)
                    UI.SC.Visible = true
                else
                    UI.AB.Text = "⚙️"
                    currentTargetSize = normalSize
                    UI.MM:TweenSize(normalSize, "Out", "Quart", 0.2, true)
                    task.delay(0.2, function() if not arrowExpanded then UI.SC.Visible = false end end)
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

            UI.AFK.MouseButton1Click:Connect(function()
                getgenv().AF_AntiAFK = not getgenv().AF_AntiAFK
                if getgenv().AF_AntiAFK then
                    UI.AFK.Text = "🛡️ TOGGLE ANTI-AFK: ON"
                    UI.AFK.TextColor3 = Color3.fromRGB(120, 255, 120)
                    UI.AFKS.Color = Color3.fromRGB(55, 110, 55)
                else
                    UI.AFK.Text = "🛡️ TOGGLE ANTI-AFK: OFF"
                    UI.AFK.TextColor3 = Color3.fromRGB(255, 120, 120)
                    UI.AFKS.Color = Color3.fromRGB(110, 55, 55)
                end
            end)

            pcall(function() for _, v in pairs(getconnections(LP.Idled)) do v:Disable() end end)
            LP.Idled:Connect(function() 
                if getgenv().AF_AntiAFK then
                    game:GetService("VirtualInputManager"):SendKeyEvent(true, Enum.KeyCode.Space, false, game)
                    task.wait(0.05)
                    game:GetService("VirtualInputManager"):SendKeyEvent(false, Enum.KeyCode.Space, false, game) 
                end
            end)
            task.spawn(function() 
                while true do 
                    task.wait(25) 
                    if getgenv().AF_AntiAFK and getgenv().TreasureAutoFarm.Mode ~= "None" then 
                        pcall(function() 
                            game:GetService("VirtualInputManager"):SendKeyEvent(true, Enum.KeyCode.Space, false, game)
                            task.wait(0.05)
                            game:GetService("VirtualInputManager"):SendKeyEvent(false, Enum.KeyCode.Space, false, game) 
                        end) 
                    end 
                end 
            end)

            UI.FTB.MouseButton1Click:Connect(function()
                if getgenv().TreasureAutoFarm.Mode == "Fly-TP" then 
                    getgenv().TreasureAutoFarm.Mode = "None"
                    UI.FTB.BackgroundColor3 = Color3.fromRGB(24, 20, 32)
                    UI.FTB.Text = "🚀 LAUNCH FLY-TP"
                    UI.ISG.Enabled = false
                    getgenv().AF_SessionActive = false
                else 
                    getgenv().TreasureAutoFarm.Mode = "Fly-TP"
                    getgenv().AF_TotalRuns = 0
                    getgenv().AF_TotalGold = 0
                    getgenv().AF_LastCheckpoint = 0
                    getgenv().AF_SessionStart = tick()
                    getgenv().AF_SessionActive = true
                    UI.SR.Text = "Runs: 0"
                    UI.SGld.Text = "Gold: 0"
                    UI.STm.Text = "Time: 00:00:00"
                    UI.ISG.Enabled = true
                    UI.FTB.BackgroundColor3 = Color3.fromRGB(140, 75, 255)
                    UI.FTB.Text = "⚡ FLY-TP: ACTIVE"
                    UI.FAST.BackgroundColor3 = Color3.fromRGB(24, 20, 32)
                    UI.FAST.Text = "⚡ FAST 16 FARM"
                end
            end)

            UI.FAST.MouseButton1Click:Connect(function()
                if getgenv().TreasureAutoFarm.Mode == "Fast-16" then
                    getgenv().TreasureAutoFarm.Mode = "None"
                    UI.FAST.BackgroundColor3 = Color3.fromRGB(24, 20, 32)
                    UI.FAST.Text = "⚡ FAST 16 FARM"
                    UI.ISG.Enabled = false
                    getgenv().AF_SessionActive = false
                else
                    getgenv().TreasureAutoFarm.Mode = "Fast-16"
                    getgenv().AF_TotalRuns = 0
                    getgenv().AF_TotalGold = 0
                    getgenv().AF_SessionStart = tick()
                    getgenv().AF_SessionActive = true
                    UI.SR.Text = "Runs: 0"
                    UI.SGld.Text = "Gold: 0"
                    UI.STm.Text = "Time: 00:00:00"
                    UI.FAST.BackgroundColor3 = Color3.fromRGB(140, 75, 255)
                    UI.FAST.Text = "🔮 FAST-16: ACTIVE"
                    UI.FTB.BackgroundColor3 = Color3.fromRGB(24, 20, 32)
                    UI.FTB.Text = "🚀 LAUNCH FLY-TP"
                end
            end)

            RS.Stepped:Connect(function()
                if getgenv().TreasureAutoFarm.Mode ~= "None" and LP.Character then
                    local char = LP.Character
                    local hum = char:FindFirstChildOfClass("Humanoid")
                    if hum then 
                        hum:SetStateEnabled(Enum.HumanoidStateType.Swimming, false)
                        hum:SetStateEnabled(Enum.HumanoidStateType.FallingDown, false) 
                    end
                    for _, part in pairs(char:GetDescendants()) do
                        if part:IsA("BasePart") then 
                            part.CanCollide = false
                            part.AssemblyLinearVelocity = Vector3.new(0,0,0)
                            part.AssemblyAngularVelocity = Vector3.new(0,0,0)  
                        elseif part:IsA("TouchTransmitter") and part.Parent and (part.Parent.Name == "Water" or part.Parent.Name == "WaterPart") then 
                            part:Destroy() 
                        end
                    end
                end
            end)

            local function hybridMoveTo(targetPos, stageIndex)
                local char = LP.Character
                local hrp = char and char:FindFirstChild("HumanoidRootPart")
                if not hrp then return end
                local tier = getgenv().TreasureAutoFarm.SpeedTier or 2
                local currentSpeed, fixTime, calculatedY = 950, 0.5, 85
                
                if stageIndex and stageIndex <= 2 then 
                    currentSpeed = 400
                    fixTime = 0.9
                    calculatedY = 85
                else
                    if tier == 1 then 
                        currentSpeed = 400
                        fixTime = 0.9
                        calculatedY = 85         
                    elseif tier == 2 then 
                        currentSpeed = 950
                        fixTime = 0.5
                        calculatedY = 85
                    elseif tier == 3 then 
                        currentSpeed = 1800
                        fixTime = 0.35
                        calculatedY = 52 
                    end
                end
                
                local dynamicTarget = Vector3.new(targetPos.X, calculatedY, targetPos.Z)
                while getgenv().TreasureAutoFarm.Mode == "Fly-TP" and (hrp.Position - dynamicTarget).Magnitude > 15 do
                    if not LP.Character or not hrp.Parent then break end
                    local dir = (dynamicTarget - hrp.Position).Unit
                    local step = currentSpeed * RS.Heartbeat:Wait()
                    if step > (dynamicTarget - hrp.Position).Magnitude then 
                        step = (dynamicTarget - hrp.Position).Magnitude 
                    end
                    hrp.CFrame = CFrame.new(hrp.Position + dir * step, dynamicTarget)
                end
                
                if hrp and getgenv().TreasureAutoFarm.Mode == "Fly-TP" then 
                    hrp.CFrame = CFrame.new(dynamicTarget)
                    hrp.Anchored = true 
                    if stageIndex then
                        pcall(function()
                            local ns = WS:FindFirstChild("BoatStages") and WS.BoatStages:FindFirstChild("NormalStages")
                            local stage = ns and ns:FindFirstChild("CaveStage" .. stageIndex)
                            local dark = stage and stage:FindFirstChild("DarknessPart")
                            if not dark and ns then 
                                dark = ns:WaitForChild("CaveStage" .. stageIndex, 2):WaitForChild("DarknessPart", 2) 
                            end
                            if dark then
                                local loops = (tier == 3) and 20 or (tier == 2) and 10 or 8
                                for i = 1, loops do 
                                    firetouchinterest(hrp, dark, 0)
                                    firetouchinterest(hrp, dark, 1) 
                                end
                            end
                        end)
                        task.wait(fixTime) 
                    end
                    hrp.Anchored = false
                end
            end

            task.spawn(function()
                while true do
                    task.wait(0.2)
                    if getgenv().AF_SessionActive and getgenv().AF_SessionStart then
                        local elapsed = tick() - getgenv().AF_SessionStart
                        local hours = math.floor(elapsed / 3600)
                        local minutes = math.floor((elapsed % 3600) / 60)
                        local seconds = math.floor(elapsed % 60)
                        local timeStr = string.format("%02d:%02d:%02d", hours, minutes, seconds)
                        UI.STm.Text = "Time: " .. timeStr
                        
                        if elapsed > 0 then
                            local goldPerHour = math.floor((getgenv().AF_TotalGold / elapsed) * 3600)
                            UI.SRate.Text = "Rate: " .. goldPerHour .. "/h"
                        end
                    end
                end
            end)

            task.spawn(function()
                while true do
                    task.wait(0.1)
                    local char = LP.Character
                    local hrp = char and char:FindFirstChild("HumanoidRootPart")
                    local hum = char and char:FindFirstChildOfClass("Humanoid")
                    if hrp and hum and hum.Health > 0 then
                        if getgenv().TreasureAutoFarm.Mode == "Fly-TP" then
                            pcall(function()
                                local ns = WS:WaitForChild("BoatStages", 10):WaitForChild("NormalStages", 10)
                                local startPos = Vector3.new(-50, 85, -1025)
                                local st1 = ns:FindFirstChild("CaveStage1")
                                if st1 and st1:FindFirstChild("DarknessPart") then 
                                    startPos = Vector3.new(st1.DarknessPart.Position.X, 85, st1.DarknessPart.Position.Z) 
                                    pcall(function() firetouchinterest(hrp, st1.DarknessPart, 0); firetouchinterest(hrp, st1.DarknessPart, 1) end)
                                end
                                hrp.CFrame = CFrame.new(startPos); task.wait(0.2)
                                
                                local checkpoint = 0
                                for i = 2, 10 do
                                    if getgenv().TreasureAutoFarm.Mode ~= "Fly-TP" then break end
                                    local stage = ns:FindFirstChild("CaveStage" .. i)
                                    local stagePos = (stage and stage:FindFirstChild("DarknessPart")) and stage.DarknessPart.Position or Vector3.new(-50, 85, -1025 + (i * -775))
                                    hybridMoveTo(stagePos, i)
                                    checkpoint = i
                                    if (getgenv().TreasureAutoFarm.SpeedTier or 2) < 3 and (i == 3 or i == 6 or i == 9 or i == 10) then
                                        hybridMoveTo(Vector3.new(stagePos.X + 15, 85, stagePos.Z), false)
                                        hybridMoveTo(Vector3.new(stagePos.X - 15, 85, stagePos.Z), false)
                                        hybridMoveTo(Vector3.new(stagePos.X, 85, stagePos.Z + 15), false)
                                        hybridMoveTo(Vector3.new(stagePos.X, 85, stagePos.Z - 15), false)
                                    end
                                end
                                
                                getgenv().AF_LastCheckpoint = checkpoint
                                local goldEarned = 10 + (checkpoint * 10)
                                
                                if getgenv().TreasureAutoFarm.Mode == "Fly-TP" and ns:FindFirstChild("TheEnd") then
                                    local chest = ns.TheEnd:FindFirstChild("GoldenChest")
                                    local trig = chest and chest:FindFirstChild("Trigger")
                                    if trig then 
                                        hrp.CFrame = CFrame.new(trig.Position)
                                        pcall(function() 
                                            for i = 1, 12 do 
                                                firetouchinterest(hrp, trig, 0)
                                                firetouchinterest(hrp, trig, 1) 
                                            end 
                                        end)
                                        goldEarned = 105
                                    else 
                                        hrp.CFrame = CFrame.new(-50, -15, -9200) 
                                    end
                                    task.wait(getgenv().TreasureAutoFarm.WaitAtChest)
                                end
                                
                                if getgenv().TreasureAutoFarm.Mode == "Fly-TP" then
                                    local respawned = false
                                    local conn = LP.CharacterAdded:Connect(function() respawned = true end)
                                    getgenv().AF_TotalRuns = getgenv().AF_TotalRuns + 1
                                    getgenv().AF_TotalGold = getgenv().AF_TotalGold + goldEarned
                                    UI.SR.Text = "Runs: " .. getgenv().AF_TotalRuns
                                    UI.SGld.Text = "Gold: " .. getgenv().AF_TotalGold
                                    hum.Health = 0
                                    repeat task.wait(0.05) until respawned
                                    conn:Disconnect()
                                end
                            end)
                        elseif getgenv().TreasureAutoFarm.Mode == "Fast-16" then
                            pcall(function()
                                local ns = WS:WaitForChild("BoatStages", 10):WaitForChild("NormalStages", 10)
                                local st1 = ns:WaitForChild("CaveStage1", 5)
                                local dark = st1 and st1:WaitForChild("DarknessPart", 5)
                                if dark then
                                    local tier = getgenv().TreasureAutoFarm.SpeedTier or 2
                                    local serverWait = (tier == 1) and 1.2 or (tier == 2) and 0.8 or 0.5
                                    hrp.CFrame = dark.CFrame
                                    for i = 1, 35 do 
                                        firetouchinterest(hrp, dark, 0)
                                        firetouchinterest(hrp, dark, 1) 
                                    end
                                    local tTime = 0
                                    while tTime < serverWait and getgenv().TreasureAutoFarm.Mode == "Fast-16" do
                                        hrp.CFrame = dark.CFrame * CFrame.new(1, 0, 0)
                                        task.wait(0.05)
                                        hrp.CFrame = dark.CFrame * CFrame.new(-1, 0, 0)
                                        task.wait(0.05)
                                        tTime = tTime + 0.1
                                    end
                                    local respawned = false
                                    local conn = LP.CharacterAdded:Connect(function() respawned = true end)
                                    getgenv().AF_TotalRuns = getgenv().AF_TotalRuns + 1
                                    getgenv().AF_TotalGold = getgenv().AF_TotalGold + 16
                                    UI.SR.Text = "Runs: " .. getgenv().AF_TotalRuns
                                    UI.SGld.Text = "Gold: " .. getgenv().AF_TotalGold
                                    hum.Health = 0
                                    repeat task.wait(0.05) until respawned
                                    conn:Disconnect()
                                end
                            end)
                        end
                    end
                end
            end)
        else
            if getgenv().AF_TI then 
                getgenv().AF_TI.Text = ""
                getgenv().AF_TI.PlaceholderText = "Wrong Password!" 
            end
        end
    end)
else
    if getgenv().AF_TI then 
        getgenv().AF_TI.Text = ""
        getgenv().AF_TI.PlaceholderText = "Wrong Password!" 
    end
end
