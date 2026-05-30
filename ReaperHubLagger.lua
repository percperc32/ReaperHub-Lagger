ReaperHub Lagger

--// ReaperHub GUI | Lag Engine



local Players = game:GetService("Players")

local UserInputService = game:GetService("UserInputService")

local TweenService = game:GetService("TweenService")

local CoreGui = game:GetService("CoreGui")

local player = Players.LocalPlayer



--// ============================

--//  COLORS (ReaperHub Theme)

--// ============================

local C = {

    MainBg           = Color3.fromRGB(8, 8, 8),

    Border           = Color3.fromRGB(0, 220, 200),

    TopBar           = Color3.fromRGB(0, 220, 200),

    Title            = Color3.fromRGB(255, 255, 255),

    SubText          = Color3.fromRGB(150, 150, 150),

    TabBg            = Color3.fromRGB(18, 18, 18),

    TabHover         = Color3.fromRGB(30, 30, 30),

    ToggleOn         = Color3.fromRGB(0, 220, 200),

    ToggleOff        = Color3.fromRGB(45, 45, 45),

    ToggleCircleOn   = Color3.fromRGB(255, 255, 255),

    ToggleCircleOff  = Color3.fromRGB(120, 120, 120),

    DangerRed        = Color3.fromRGB(255, 50, 50),

    BtnHover         = Color3.fromRGB(255, 80, 80),

    SliderBg         = Color3.fromRGB(35, 35, 35),

    SliderFill       = Color3.fromRGB(0, 220, 200),

    SliderCircle     = Color3.fromRGB(0, 220, 200),

    SliderLabel      = Color3.fromRGB(180, 180, 180),

    IntensityLow     = Color3.fromRGB(0, 220, 200),

    IntensityMid     = Color3.fromRGB(0, 180, 255),

    IntensityHigh    = Color3.fromRGB(180, 0, 255),

    CloseBtn         = Color3.fromRGB(255, 50, 50),

    CloseBtnHover    = Color3.fromRGB(255, 80, 80),

    MinBtn           = Color3.fromRGB(255, 180, 0),

    MinBtnHover      = Color3.fromRGB(255, 200, 50),

    BombBtn          = Color3.fromRGB(255, 50, 50),

    BombBtnHover     = Color3.fromRGB(255, 80, 80),

}



--// ============================

--//  CREATE SCREEN GUI

--// ============================

local screenGui = Instance.new("ScreenGui")

screenGui.Name = "ReaperHubLag"

screenGui.Parent = CoreGui





--// ============================

--//  MAIN FRAME (WINDOW)

--// ============================

local main = Instance.new("Frame")

main.Name = "MainWindow"

main.Size = UDim2.new(0, 280, 0, 290)

main.Position = UDim2.new(0.5, -140, 0.5, -145)

main.BackgroundColor3 = C.MainBg

main.BorderSizePixel = 0

main.Parent = screenGui



local mainCorner = Instance.new("UICorner")

mainCorner.CornerRadius = UDim.new(0, 10)

mainCorner.Parent = main



local mainStroke = Instance.new("UIStroke")

mainStroke.Color = C.Border

mainStroke.Thickness = 2

mainStroke.Parent = main





--// ============================

--//  DRAG BAR (TOP)

--// ============================

local topBar = Instance.new("Frame")

topBar.Name = "TopBar"

topBar.Size = UDim2.new(1, 0, 0, 36)

topBar.BackgroundColor3 = C.TopBar

topBar.BorderSizePixel = 0

topBar.Parent = main



local topCorner = Instance.new("UICorner")

topCorner.CornerRadius = UDim.new(0, 10)

topCorner.Parent = topBar



-- fix bottom corners so top bar blends into main

local topFix = Instance.new("Frame")

topFix.Size = UDim2.new(1, 0, 0, 12)

topFix.Position = UDim2.new(0, 0, 1, -12)

topFix.BackgroundColor3 = C.TopBar

topFix.BorderSizePixel = 0

topFix.Parent = topBar



-- title

local titleLabel = Instance.new("TextLabel")

titleLabel.Name = "Title"

titleLabel.Size = UDim2.new(0, 160, 1, 0)

titleLabel.Position = UDim2.new(0, 12, 0, 0)

titleLabel.BackgroundTransparency = 1

titleLabel.Text = "ReaperHub"

titleLabel.TextColor3 = C.Title

titleLabel.TextSize = 18

titleLabel.Font = Enum.Font.GothamBold

titleLabel.TextXAlignment = Enum.TextXAlignment.Left

titleLabel.Parent = topBar



-- minimize button

local minBtn = Instance.new("TextButton")

minBtn.Name = "MinimizeBtn"

minBtn.Size = UDim2.new(0, 24, 0, 24)

minBtn.Position = UDim2.new(1, -56, 0, 6)

minBtn.BackgroundColor3 = C.MinBtn

minBtn.Text = "-"

minBtn.TextColor3 = Color3.new(0,0,0)

minBtn.TextSize = 18

minBtn.Font = Enum.Font.GothamBold

minBtn.AutoButtonColor = false

minBtn.Parent = topBar



local minCorner = Instance.new("UICorner")

minCorner.CornerRadius = UDim.new(0, 6)

minCorner.Parent = minBtn



-- close button

local closeBtn = Instance.new("TextButton")

closeBtn.Name = "CloseBtn"

closeBtn.Size = UDim2.new(0, 24, 0, 24)

closeBtn.Position = UDim2.new(1, -30, 0, 6)

closeBtn.BackgroundColor3 = C.CloseBtn

closeBtn.Text = "X"

closeBtn.TextColor3 = Color3.new(1,1,1)

closeBtn.TextSize = 14

closeBtn.Font = Enum.Font.GothamBold

closeBtn.AutoButtonColor = false

closeBtn.Parent = topBar



local closeCorner = Instance.new("UICorner")

closeCorner.CornerRadius = UDim.new(0, 6)

closeCorner.Parent = closeBtn





--// ============================

--//  STATUS DOT

--// ============================

local statusDot = Instance.new("Frame")

statusDot.Name = "StatusDot"

statusDot.Size = UDim2.new(0, 10, 0, 10)

statusDot.Position = UDim2.new(0, 12, 0, 48)

statusDot.BackgroundColor3 = Color3.fromRGB(90, 95, 110)

statusDot.BorderSizePixel = 0

statusDot.Parent = main



local dotCorner = Instance.new("UICorner")

dotCorner.CornerRadius = UDim.new(1, 0)

dotCorner.Parent = statusDot



local statusText = Instance.new("TextLabel")

statusText.Name = "StatusText"

statusText.Size = UDim2.new(0, 160, 0, 16)

statusText.Position = UDim2.new(0, 28, 0, 45)

statusText.BackgroundTransparency = 1

statusText.Text = "OFF"

statusText.TextColor3 = C.SubText

statusText.TextSize = 13

statusText.Font = Enum.Font.Gotham

statusText.TextXAlignment = Enum.TextXAlignment.Left

statusText.Parent = main





--// ============================

--//  TOGGLE BUTTON (BIG POWER)

--// ============================

local toggleContainer = Instance.new("Frame")

toggleContainer.Name = "ToggleContainer"

toggleContainer.Size = UDim2.new(0, 200, 0, 60)

toggleContainer.Position = UDim2.new(0.5, -100, 0, 72)

toggleContainer.BackgroundTransparency = 1

toggleContainer.Parent = main



local toggleBtn = Instance.new("TextButton")

toggleBtn.Name = "ToggleBtn"

toggleBtn.Size = UDim2.new(0, 200, 0, 40)

toggleBtn.Position = UDim2.new(0, 0, 0, 0)

toggleBtn.BackgroundColor3 = C.ToggleOff

toggleBtn.Text = "Toggle Lag"

toggleBtn.TextColor3 = Color3.new(1,1,1)

toggleBtn.TextSize = 16

toggleBtn.Font = Enum.Font.GothamBold

toggleBtn.AutoButtonColor = false

toggleBtn.Parent = toggleContainer



local toggleCorner = Instance.new("UICorner")

toggleCorner.CornerRadius = UDim.new(0, 8)

toggleCorner.Parent = toggleBtn



local toggleLabel = Instance.new("TextLabel")

toggleLabel.Name = "ToggleLabel"

toggleLabel.Size = UDim2.new(1, 0, 0, 16)

toggleLabel.Position = UDim2.new(0, 0, 1, -14)

toggleLabel.BackgroundTransparency = 1

toggleLabel.Text = "Tap to ignite"

toggleLabel.TextColor3 = C.SubText

toggleLabel.TextSize = 11

toggleLabel.Font = Enum.Font.Gotham

toggleLabel.Parent = toggleContainer





--// ============================

--//  INTENSITY SECTION

--// ============================

local intensityTitle = Instance.new("TextLabel")

intensityTitle.Name = "IntensityTitle"

intensityTitle.Size = UDim2.new(0, 120, 0, 18)

intensityTitle.Position = UDim2.new(0, 12, 0, 125)

intensityTitle.BackgroundTransparency = 1

intensityTitle.Text = "Intensity"

intensityTitle.TextColor3 = C.SliderLabel

intensityTitle.TextSize = 13

intensityTitle.Font = Enum.Font.GothamBold

intensityTitle.TextXAlignment = Enum.TextXAlignment.Left

intensityTitle.Parent = main



local intensityLow = Instance.new("TextButton")

intensityLow.Name = "Low"

intensityLow.Size = UDim2.new(0, 80, 0, 28)

intensityLow.Position = UDim2.new(0, 12, 0, 148)

intensityLow.BackgroundColor3 = C.IntensityLow

intensityLow.Text = "Low"

intensityLow.TextColor3 = Color3.new(0,0,0)

intensityLow.TextSize = 12

intensityLow.Font = Enum.Font.GothamBold

intensityLow.AutoButtonColor = false

intensityLow.Parent = main



local lowCorner = Instance.new("UICorner")

lowCorner.CornerRadius = UDim.new(0, 6)

lowCorner.Parent = intensityLow



local intensityMid = Instance.new("TextButton")

intensityMid.Name = "Mid"

intensityMid.Size = UDim2.new(0, 80, 0, 28)

intensityMid.Position = UDim2.new(0.5, -40, 0, 148)

intensityMid.BackgroundColor3 = C.SliderBg

intensityMid.Text = "Mid"

intensityMid.TextColor3 = Color3.new(1,1,1)

intensityMid.TextSize = 12

intensityMid.Font = Enum.Font.GothamBold

intensityMid.AutoButtonColor = false

intensityMid.Parent = main



local midCorner = Instance.new("UICorner")

midCorner.CornerRadius = UDim.new(0, 6)

midCorner.Parent = intensityMid



local intensityHigh = Instance.new("TextButton")

intensityHigh.Name = "High"

intensityHigh.Size = UDim2.new(0, 80, 0, 28)

intensityHigh.Position = UDim2.new(1, -92, 0, 148)

intensityHigh.BackgroundColor3 = C.SliderBg

intensityHigh.Text = "High"

intensityHigh.TextColor3 = Color3.new(1,1,1)

intensityHigh.TextSize = 12

intensityHigh.Font = Enum.Font.GothamBold

intensityHigh.AutoButtonColor = false

intensityHigh.Parent = main



local highCorner = Instance.new("UICorner")

highCorner.CornerRadius = UDim.new(0, 6)

highCorner.Parent = intensityHigh





--// ============================

--//  BOMB BUTTON

--// ============================

local bombBtn = Instance.new("TextButton")

bombBtn.Name = "BombBtn"

bombBtn.Size = UDim2.new(0, 256, 0, 36)

bombBtn.Position = UDim2.new(0.5, -128, 0, 190)

bombBtn.BackgroundColor3 = C.BombBtn

bombBtn.Text = "BOMB SERVER"

bombBtn.TextColor3 = Color3.new(1,1,1)

bombBtn.TextSize = 15

bombBtn.Font = Enum.Font.GothamBold

bombBtn.AutoButtonColor = false

bombBtn.Parent = main



local bombCorner = Instance.new("UICorner")

bombCorner.CornerRadius = UDim.new(0, 8)

bombCorner.Parent = bombBtn





--// ============================

--//  FOOTER (made by)

--// ============================

local footer = Instance.new("TextLabel")

footer.Name = "Footer"

footer.Size = UDim2.new(1, 0, 0, 20)

footer.Position = UDim2.new(0, 0, 1, -20)

footer.BackgroundTransparency = 1

footer.Text = "discord.gg/BkJY9Arn3Z"

footer.TextColor3 = C.SubText

footer.TextSize = 11

footer.Font = Enum.Font.Gotham

footer.TextXAlignment = Enum.TextXAlignment.Center

footer.Parent = main





--// ============================

--//  STATE / VARIABLES

--// ============================

local lagEnabled = false

local lagThread = nil

local waitTime = 0.15

local bombing = false

local selectedIntensity = "Low"





--// ============================

--//  INTENSITY VALUES

--// ============================

local intensityMap = {

    Low  = { wait = 0.15, bombSize = 800 },

    Mid  = { wait = 0.08, bombSize = 1500 },

    High = { wait = 0.03, bombSize = 3000 },

}





--// ============================

--//  INTENSITY SELECTION

--// ============================

local function setIntensity(level)

    selectedIntensity = level

    waitTime = intensityMap[level].wait

    for _, btn in ipairs({intensityLow, intensityMid, intensityHigh}) do

        if btn.Name == level then

            TweenService:Create(btn, TweenInfo.new(0.15), {

                BackgroundColor3 = (level=="Low" and C.IntensityLow) or (level=="Mid" and C.IntensityMid) or C.IntensityHigh,

                TextColor3 = Color3.new(0,0,0)

            }):Play()

        else

            TweenService:Create(btn, TweenInfo.new(0.15), {

                BackgroundColor3 = C.SliderBg,

                TextColor3 = Color3.new(1,1,1)

            }):Play()

        end

    end

end



intensityLow.MouseButton1Click:Connect(function() setIntensity("Low") end)

intensityMid.MouseButton1Click:Connect(function() setIntensity("Mid") end)

intensityHigh.MouseButton1Click:Connect(function() setIntensity("High") end)





--// ============================

--//  TOGGLE LOGIC

--// ============================

local function enableLag()

    lagEnabled = true

    statusDot.BackgroundColor3 = Color3.fromRGB(0, 255, 100)

    statusText.Text = "ON"

    toggleLabel.Text = "Engine live"

    TweenService:Create(toggleBtn, TweenInfo.new(0.2), {BackgroundColor3 = C.ToggleOn}):Play()



    if lagThread then lagThread:Disconnect() end

    lagThread = game:GetService("RunService").Heartbeat:Connect(function()

        if not lagEnabled then return end

        for _, plr in ipairs(Players:GetPlayers()) do

            if plr ~= player and plr.Character and plr.Character:FindFirstChild("HumanoidRootPart") then

                local hrp = plr.Character.HumanoidRootPart

                for i = 1, 3 do

                    local cf = hrp.CFrame

                    hrp.CFrame = cf * CFrame.new(math.random(-3,3), math.random(-3,3), math.random(-3,3))

                end

            end

        end

        task.wait(waitTime)

    end)

end



local function disableLag()

    lagEnabled = false

    if lagThread then lagThread:Disconnect() lagThread = nil end

    statusDot.BackgroundColor3 = Color3.fromRGB(90, 95, 110)

    statusText.Text = "OFF"

    toggleLabel.Text = "Tap to ignite"

    TweenService:Create(toggleBtn, TweenInfo.new(0.2), {BackgroundColor3 = C.ToggleOff}):Play()

end



toggleBtn.MouseButton1Click:Connect(function()

    if lagEnabled then

        disableLag()

    else

        enableLag()

    end

end)





--// ============================

--//  BOMB LOGIC

--// ============================

bombBtn.MouseButton1Click:Connect(function()

    if bombing then return end

    bombing = true

    local originalText = bombBtn.Text

    bombBtn.Text = "BOMBING..."

    TweenService:Create(bombBtn, TweenInfo.new(0.2), {BackgroundColor3 = C.BombBtnHover}):Play()



    task.spawn(function()

        local size = intensityMap[selectedIntensity].bombSize

        for i = 1, size do

            for _, plr in ipairs(Players:GetPlayers()) do

                if plr ~= player and plr.Character and plr.Character:FindFirstChild("HumanoidRootPart") then

                    local hrp = plr.Character.HumanoidRootPart

                    hrp.CFrame = hrp.CFrame * CFrame.new(math.random(-20,20), math.random(-20,20), math.random(-20,20))

                end

            end

            if i % 100 == 0 then task.wait() end

        end

        bombBtn.Text = originalText

        TweenService:Create(bombBtn, TweenInfo.new(0.2), {BackgroundColor3 = C.BombBtn}):Play()

        bombing = false

    end)

end)





--// ============================

--//  CLOSE / MINIMIZE

--// ============================

closeBtn.MouseButton1Click:Connect(function()

    screenGui:Destroy()

    if lagThread then lagThread:Disconnect() end

end)



local minimized = false

minBtn.MouseButton1Click:Connect(function()

    minimized = not minimized

    if minimized then

        TweenService:Create(main, TweenInfo.new(0.3, Enum.EasingStyle.Quint), {Size = UDim2.new(0, 280, 0, 36)}):Play()

        minBtn.Text = "+"

    else

        TweenService:Create(main, TweenInfo.new(0.3, Enum.EasingStyle.Quint), {Size = UDim2.new(0, 280, 0, 290)}):Play()

        minBtn.Text = "-"

    end

end)





--// ============================

--//  BUTTON HOVERS

--// ============================

local function buttonHover(btn, normal, hover)

    btn.MouseEnter:Connect(function()

        TweenService:Create(btn, TweenInfo.new(0.15), {BackgroundColor3 = hover}):Play()

    end)

    btn.MouseLeave:Connect(function()

        TweenService:Create(btn, TweenInfo.new(0.15), {BackgroundColor3 = normal}):Play()

    end)

end



buttonHover(closeBtn, C.CloseBtn, C.CloseBtnHover)

buttonHover(minBtn, C.MinBtn, C.MinBtnHover)

buttonHover(bombBtn, C.BombBtn, C.BombBtnHover)





--// ============================

--//  DRAGGING (topBar only)

--// ============================

local dragging = false

local dragStart, startPos



topBar.InputBegan:Connect(function(input)

    if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then

        dragging = true

        dragStart = input.Position

        startPos = main.Position

    end

end)



topBar.InputChanged:Connect(function(input)

    if dragging and (input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch) then

        local delta = input.Position - dragStart

        main.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)

    end

end)



topBar.InputEnded:Connect(function(input)

    if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then

        dragging = false

    end

end)





--// ============================

--//  HEAD TEXT (discord.gg/BkJY9Arn3Z)

--// ============================

local headGui = Instance.new("BillboardGui")

headGui.Name = "ReaperHubHead"

headGui.Size = UDim2.new(0, 200, 0, 40)

headGui.StudsOffset = Vector3.new(0, 2.5, 0)

headGui.AlwaysOnTop = true

headGui.Parent = player.Character and player.Character:FindFirstChild("Head") or player:WaitForChild("Character"):WaitForChild("Head")



local headLabel = Instance.new("TextLabel")

headLabel.Size = UDim2.new(1, 0, 1, 0)

headLabel.BackgroundTransparency = 1

headLabel.Text = "discord.gg/BkJY9Arn3Z"

headLabel.TextColor3 = C.Border

headLabel.TextSize = 14

headLabel.Font = Enum.Font.GothamBold

headLabel.Parent = headGui



-- Update head text when character respawns

player.CharacterAdded:Connect(function(char)

    local head = char:WaitForChild("Head")

    local newHeadGui = Instance.new("BillboardGui")

    newHeadGui.Name = "ReaperHubHead"

    newHeadGui.Size = UDim2.new(0, 200, 0, 40)

    newHeadGui.StudsOffset = Vector3.new(0, 2.5, 0)

    newHeadGui.AlwaysOnTop = true

    newHeadGui.Parent = head

    

    local newHeadLabel = Instance.new("TextLabel")

    newHeadLabel.Size = UDim2.new(1, 0, 1, 0)

    newHeadLabel.BackgroundTransparency = 1

    newHeadLabel.Text = "discord.gg/BkJY9Arn3Z"

    newHeadLabel.TextColor3 = C.Border

    newHeadLabel.TextSize = 14

    newHeadLabel.Font = Enum.Font.GothamBold

    newHeadLabel.Parent = newHeadGui

end)
