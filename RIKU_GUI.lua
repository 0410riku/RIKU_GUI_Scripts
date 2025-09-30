-- Rayfieldロード
local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()
local Window = Rayfield:CreateWindow({
    Name = "RIKU GUI",
    LoadingTitle = "Loading...",
    LoadingSubtitle = "by [0410riku]",
    ConfigurationSaving = { Enabled = false }
})

-- ==== タブ1：のり弁当 ====
local TabNoriben = Window:CreateTab("のり弁当")

-- 飛ぶ
TabNoriben:CreateButton({
    Name = "食ってみな飛ぶぞ",
    Callback = function()
        print("食ってみな飛ぶぞ")
        loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-Fly-gui-v3-43427"))()
    end
})

-- ナイフ
TabNoriben:CreateButton({
    Name = "ナイフ",
    Callback = function()
        print("ナイフ")
        loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-Grab-knife-v4-24753"))()
    end
})

-- R15エモート
TabNoriben:CreateButton({
    Name = "R15エモート",
    Callback = function()
        print("エモート")
        loadstring(game:HttpGet('https://raw.githubusercontent.com/Gazer-Ha/Gaze-stuff/refs/heads/main/Silly%20emote'))()
    end
})

-- レントゲン
local function createXRayGUI()
    print("レントゲン")
    local ScreenGui = Instance.new("ScreenGui")
    local MainFrame = Instance.new("Frame")
    local Title = Instance.new("TextLabel")
    local MinimizeButton = Instance.new("TextButton")
    local CloseButton = Instance.new("TextButton")
    local StatusLabel = Instance.new("TextLabel")
    local XRayButton = Instance.new("TextButton")
    local CreditsButton = Instance.new("TextButton")
    local CreditsLabel = Instance.new("TextLabel")
    local TweenService = game:GetService("TweenService")
    
    ScreenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
    ScreenGui.Name = "XRayGUI"
    ScreenGui.ResetOnSpawn = false
    
    MainFrame.Name = "MainFrame"
    MainFrame.Parent = ScreenGui
    MainFrame.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
    MainFrame.BorderSizePixel = 0
    MainFrame.Position = UDim2.new(0.4, 0, 0.4, 0)
    MainFrame.Size = UDim2.new(0, 250, 0, 150)
    MainFrame.Active = true
    MainFrame.Draggable = true
    
    Title.Name = "Title"
    Title.Parent = MainFrame
    Title.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
    Title.Size = UDim2.new(1, 0, 0, 30)
    Title.Font = Enum.Font.SourceSansBold
    Title.Text = "X-Ray"
    Title.TextColor3 = Color3.fromRGB(255, 255, 255)
    Title.TextSize = 20
    
    MinimizeButton.Name = "MinimizeButton"
    MinimizeButton.Parent = MainFrame
    MinimizeButton.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
    MinimizeButton.Position = UDim2.new(1, -60, 0, 0)
    MinimizeButton.Size = UDim2.new(0, 30, 0, 30)
    MinimizeButton.Font = Enum.Font.SourceSansBold
    MinimizeButton.Text = "-"
    MinimizeButton.TextColor3 = Color3.fromRGB(255, 255, 0)
    MinimizeButton.TextSize = 20
    
    CloseButton.Name = "CloseButton"
    CloseButton.Parent = MainFrame
    CloseButton.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
    CloseButton.Position = UDim2.new(1, -30, 0, 0)
    CloseButton.Size = UDim2.new(0, 30, 0, 30)
    CloseButton.Font = Enum.Font.SourceSansBold
    CloseButton.Text = "X"
    CloseButton.TextColor3 = Color3.fromRGB(255, 0, 0)
    CloseButton.TextSize = 20
    
    StatusLabel.Name = "StatusLabel"
    StatusLabel.Parent = MainFrame
    StatusLabel.BackgroundTransparency = 1
    StatusLabel.Position = UDim2.new(0, 0, 0, 30)
    StatusLabel.Size = UDim2.new(1, 0, 0, 20)
    StatusLabel.Font = Enum.Font.SourceSans
    StatusLabel.Text = "Status: Off"
    StatusLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
    StatusLabel.TextSize = 16
    
    XRayButton.Name = "XRayButton"
    XRayButton.Parent = MainFrame
    XRayButton.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
    XRayButton.Position = UDim2.new(0.1, 0, 0.4, 0)
    XRayButton.Size = UDim2.new(0.8, 0, 0, 30)
    XRayButton.Font = Enum.Font.SourceSansBold
    XRayButton.Text = "X-Ray"
    XRayButton.TextColor3 = Color3.fromRGB(255, 255, 255)
    XRayButton.TextSize = 18
    
    CreditsButton.Name = "CreditsButton"
    CreditsButton.Parent = MainFrame
    CreditsButton.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
    CreditsButton.Position = UDim2.new(0.1, 0, 0.7, 0)
    CreditsButton.Size = UDim2.new(0.8, 0, 0, 30)
    CreditsButton.Font = Enum.Font.SourceSansBold
    CreditsButton.Text = "Credits"
    CreditsButton.TextColor3 = Color3.fromRGB(255, 255, 0)
    CreditsButton.TextSize = 18
    
    CreditsLabel.Name = "CreditsLabel"
    CreditsLabel.Parent = MainFrame
    CreditsLabel.BackgroundTransparency = 1
    CreditsLabel.Position = UDim2.new(0, 0, 1, -20)
    CreditsLabel.Size = UDim2.new(1, 0, 0, 20)
    CreditsLabel.Font = Enum.Font.SourceSansItalic
    CreditsLabel.Text = ""
    CreditsLabel.TextColor3 = Color3.fromRGB(255, 255, 0)
    CreditsLabel.TextSize = 14
    CreditsLabel.Visible = false
    
    -- Variables
    local xrayEnabled = false
    local showingCredits = false
    
    -- Functions
    local function toggleXRay()
        xrayEnabled = not xrayEnabled
        StatusLabel.Text = xrayEnabled and "Status: On" or "Status: Off"
        for _, v in pairs(workspace:GetDescendants()) do
            if v:IsA("BasePart") and not v:IsDescendantOf(game.Players.LocalPlayer.Character) then
                v.LocalTransparencyModifier = xrayEnabled and 0.5 or 0
            end
        end
    end
    
    local function minimizeGui()
        if MainFrame.Size == UDim2.new(0, 250, 0, 150) then
            MainFrame:TweenSize(UDim2.new(0, 250, 0, 30), "Out", "Sine", 0.3, true)
            for _, v in ipairs(MainFrame:GetChildren()) do
                if v ~= Title and v ~= MinimizeButton and v ~= CloseButton then
                    v.Visible = false
                end
            end
        else
            MainFrame:TweenSize(UDim2.new(0, 250, 0, 150), "Out", "Sine", 0.3, true)
            for _, v in ipairs(MainFrame:GetChildren()) do
                v.Visible = true
            end
        end
    end
    
    -- Connections
    XRayButton.MouseButton1Click:Connect(toggleXRay)
    MinimizeButton.MouseButton1Click:Connect(minimizeGui)
    CloseButton.MouseButton1Click:Connect(function()
        ScreenGui:Destroy()
    end)
    
    CreditsButton.MouseButton1Click:Connect(function()
        showingCredits = not showingCredits
        CreditsButton.Text = showingCredits and "Made By HiroshiPh338" or "Credits"
    end)
    
    -- Hover effect
    local function hoverEffect(button)
        button.MouseEnter:Connect(function()
            button.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
        end)
        button.MouseLeave:Connect(function()
            button.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
        end)
    end
    
    hoverEffect(XRayButton)
    hoverEffect(CreditsButton)
end

TabNoriben:CreateButton({ Name = "レントゲン", Callback = createXRayGUI })

-- テレポート
TabNoriben:CreateButton({
    Name = "テレポート",
    Callback = function()
        print("テレポート")
        local mouse = game.Players.LocalPlayer:GetMouse()
        local tool = Instance.new("Tool")
        tool.RequiresHandle = false
        tool.Name = "Tp tool(Equip to Click TP)"
        tool.Activated:Connect(function()
            local pos = mouse.Hit + Vector3.new(0, 2.5, 0)
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(pos.X, pos.Y, pos.Z)
        end)
        tool.Parent = game.Players.LocalPlayer.Backpack
    end
})

-- オートクリッカー
TabNoriben:CreateButton({
    Name = "オートクリッカー",
    Callback = function()
        print("オートクリッカー")
        loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-Auto-Clicker-47778"))()
    end
})

-- ==== 音楽プレイヤー拡張（現在再生中表示＋一時停止・再開） ====
local sound = Instance.new("Sound")
sound.Parent = workspace
sound.Looped = false
sound.Volume = 1

local favoriteSongs = {}
local songName = ""
local isPaused = false -- 一時停止管理

-- 再生中ラベル
local nowPlayingLabel = TabNoriben:CreateLabel({
    Name = "現在再生中: なし"
})

-- 音楽ID入力
TabNoriben:CreateTextBox({
    Name = "音楽ID入力",
    PlaceholderText = "rbxassetid://数字",
    Callback = function(value)
        sound.SoundId = value
    end
})

-- 音楽名入力（お気に入り用）
TabNoriben:CreateTextBox({
    Name = "音楽名入力",
    PlaceholderText = "名前を入力",
    Callback = function(value)
        songName = value
    end
})

-- 再生ボタン
TabNoriben:CreateButton({
    Name = "再生",
    Callback = function()
        if sound.SoundId ~= "" then
            sound:Play()
            isPaused = false
            nowPlayingLabel:Set("現在再生中: "..(songName ~= "" and songName or sound.SoundId))
        end
    end
})

-- 停止ボタン
TabNoriben:CreateButton({
    Name = "停止",
    Callback = function()
        sound:Stop()
        isPaused = false
        nowPlayingLabel:Set("現在再生中: なし")
    end
})

-- 一時停止ボタン
TabNoriben:CreateButton({
    Name = "一時停止/再開",
    Callback = function()
        if sound.IsPlaying then
            sound:Pause()
            isPaused = true
            nowPlayingLabel:Set("現在再生中: "..(songName ~= "" and songName or sound.SoundId).." (一時停止)")
        elseif isPaused then
            sound:Play()
            isPaused = false
            nowPlayingLabel:Set("現在再生中: "..(songName ~= "" and songName or sound.SoundId))
        end
    end
})

-- 音量スライダー
TabNoriben:CreateSlider({
    Name = "音量",
    Range = {0, 10},
    CurrentValue = sound.Volume,
    Suffix = "",
    Callback = function(val)
        sound.Volume = val
    end
})

-- ループトグル
TabNoriben:CreateToggle({
    Name = "ループ再生",
    CurrentValue = false,
    Callback = function(state)
        sound.Looped = state
    end
})

-- お気に入り追加ボタン
local function updateDropdown()
    local options = {}
    for name,_ in pairs(favoriteSongs) do
        table.insert(options, name)
    end
    dropdown:UpdateOptions(options)
end

TabNoriben:CreateButton({
    Name = "お気に入りに追加",
    Callback = function()
        if sound.SoundId ~= "" and songName ~= "" then
            favoriteSongs[songName] = sound.SoundId
            updateDropdown()
        end
    end
})

-- お気に入りドロップダウン
local dropdown = TabNoriben:CreateDropdown({
    Name = "お気に入り選択",
    Options = {},
    Callback = function(selected)
        if favoriteSongs[selected] then
            sound.SoundId = favoriteSongs[selected]
            sound:Play()
            isPaused = false
            nowPlayingLabel:Set("現在再生中: "..selected)
        end
    end
})

-- お気に入り削除ボタン
TabNoriben:CreateButton({
    Name = "お気に入り削除",
    Callback = function()
        local selected = dropdown.CurrentOption
        if selected and favoriteSongs[selected] then
            favoriteSongs[selected] = nil
            updateDropdown()
            if nowPlayingLabel.Text == "現在再生中: "..selected then
                nowPlayingLabel:Set("現在再生中: なし")
            end
        end
    end
})

-- ==== タブ2：お前 ====
local TabOmae = Window:CreateTab("お前")

-- === WalkSpeed スライダー ===
local SpeedSlider = TabMove:CreateSlider({
    Name = "速さ",
    Range = {16, 1500},
    Increment = 1,
    CurrentValue = 16,
    Suffix = " studs",
    Callback = function(Value)
        if LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("Humanoid") then
            LocalPlayer.Character.Humanoid.WalkSpeed = Value
        end
    end,
})

-- === JumpPower スライダー ===
local JumpSlider = TabMove:CreateSlider({
    Name = "ジャンプ力",
    Range = {50, 1500},
    Increment = 1,
    CurrentValue = 50,
    Suffix = " studs",
    Callback = function(Value)
        if LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("Humanoid") then
            LocalPlayer.Character.Humanoid.UseJumpPower = true
            LocalPlayer.Character.Humanoid.JumpPower = Value
        end
    end,
})

-- === リセット (両方まとめて) ===
TabMove:CreateButton({
    Name = "リセット (初期値に戻す)",
    Callback = function()
        if LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("Humanoid") then
            LocalPlayer.Character.Humanoid.WalkSpeed = 16
            LocalPlayer.Character.Humanoid.JumpPower = 50
        end
        SpeedSlider:Set(16)
        JumpSlider:Set(50)
    end,
})

-- 透明化
TabOmae:CreateButton({
    Name = "透明化",
    Callback = function()
        print("透明化")
        loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-Invisible-script-20557"))()
    end
})

-- ノークリップ
local function createNoclipGUI()
    print("ノークリップ")
    local ScreenGui = Instance.new("ScreenGui")
    local ToggleButton = Instance.new("TextButton")
    ScreenGui.Parent = game.CoreGui
    ToggleButton.Parent = ScreenGui
    ToggleButton.Text = "Noclip: OFF"
    ToggleButton.Size = UDim2.new(0, 200, 0, 50)
    ToggleButton.Position = UDim2.new(0.4, 0, 0.1, 0)
    ToggleButton.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
    ToggleButton.TextColor3 = Color3.fromRGB(255, 255, 255)
    ToggleButton.Font = Enum.Font.SourceSansBold
    ToggleButton.TextSize = 24
    ToggleButton.Draggable = true

    getgenv().NoclipEnabled = false

    ToggleButton.MouseButton1Click:Connect(function()
        getgenv().NoclipEnabled = not getgenv().NoclipEnabled
        if getgenv().NoclipEnabled then
            ToggleButton.Text = "Noclip: ON"
            ToggleButton.BackgroundColor3 = Color3.fromRGB(0, 170, 0)
        else
            ToggleButton.Text = "Noclip: OFF"
            ToggleButton.BackgroundColor3 = Color3.fromRGB(170, 0, 0)
            if game.Players.LocalPlayer.Character then
                for _,v in pairs(game.Players.LocalPlayer.Character:GetDescendants()) do
                    if v:IsA("BasePart") then
                        v.CanCollide = true
                    end
                end
            end
        end
    end)

    game:GetService("RunService").Stepped:Connect(function()
        if getgenv().NoclipEnabled and game.Players.LocalPlayer.Character then
            for _,v in pairs(game.Players.LocalPlayer.Character:GetDescendants()) do
                if v:IsA("BasePart") and v.CanCollide then
                    v.CanCollide = false
                end
            end
        end
    end)
end

TabOmae:CreateButton({ Name = "ノークリップ", Callback = createNoclipGUI })

-- 巨人化
TabLooks:CreateButton({
    Name = "巨人化",
    Callback = function()
        local char = game.Players.LocalPlayer.Character
        for _, v in pairs(char:GetDescendants()) do
            if v:IsA("BasePart") then
                v.Size = v.Size * 3
            end
        end
    end
})

-- ミニ化
TabLooks:CreateButton({
    Name = "ミニ化",
    Callback = function()
        local char = game.Players.LocalPlayer.Character
        for _, v in pairs(char:GetDescendants()) do
            if v:IsA("BasePart") then
                v.Size = v.Size * 0.3
            end
        end
    end
})

-- ゴリラ化（腕だけ巨大）
TabLooks:CreateButton({
    Name = "ゴリラ化（腕デカすぎ）",
    Callback = function()
        local char = game.Players.LocalPlayer.Character
        local armL = char:FindFirstChild("Left Arm") or char:FindFirstChild("LeftUpperArm")
        local armR = char:FindFirstChild("Right Arm") or char:FindFirstChild("RightUpperArm")
        if armL then armL.Size = armL.Size * 5 end
        if armR then armR.Size = armR.Size * 5 end
    end
})

-- エモート固定（踊り続ける）
TabLooks:CreateButton({
    Name = "エモート固定 (ループダンス)",
    Callback = function()
        local plr = game.Players.LocalPlayer
        local humanoid = plr.Character:FindFirstChildOfClass("Humanoid")
        if humanoid then
            humanoid:LoadAnimation(Instance.new("Animation", humanoid)).AnimationId = "rbxassetid://5918726674"
        end
    end
})

-- 頭を消す
TabLooks:CreateButton({
    Name = "首無しモード",
    Callback = function()
        local char = game.Players.LocalPlayer.Character
        if char:FindFirstChild("Head") then
            char.Head:Destroy()
        end
    end
})

-- ==== タブ3：アド民 ====
local TabAdmin = Window:CreateTab("アド民")
TabAdmin:CreateButton({
    Name = "Infinite Yield",
    Callback = function()
        print("Infinite yield")
        loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-Infinite-Yield-43437"))()
    end
})

-- ==== タブ4：スプリクト ====

local TabAdmin = Window:CreateTab("スプリクト")

-- 99日生き残る
TabAdmin:CreateButton({
    Name = "99日生き残る",
    Callback = function()
        print("99日生き残る")
        loadstring(game:HttpGet("https://raw.githubusercontent.com/VapeVoidware/VW-Add/main/nightsintheforest.lua", true))()
    end
})

-- 99日生き残る2
TabAdmin:CreateButton({
    Name = "99日生き残る2",
    Callback = function()
        print("99日生き残る")
        loadstring(game:HttpGet("https://raw.githubusercontent.com/yoursvexyyy/VEX-OP/refs/heads/main/99%20nights%20in%20the%20forest%20premium"))()
    end
})

-- スラップバトル
TabAdmin:CreateButton({
    Name = "SBヘルパー",
    Callback = function()
        print("SBヘルパー")
        loadstring(game:HttpGet('https://raw.githubusercontent.com/Ekanite-a/Scripts/refs/heads/main/Slap%20battles/Mastery_helper.lua'))()
    end
})

-- スラップバトル2
TabAdmin:CreateButton({
    Name = "edgelord",
    Callback = function()
        print("edgelord")
        loadstring(game:HttpGet("https://raw.githubusercontent.com/IncognitoScripts/SlapBattles/refs/heads/main/Edgelord"))()
    end
})

-- プリズンライフ
TabAdmin:CreateButton({
    Name = "プリズンアドミン",
    Callback = function()
        print("プリズンアドミン")
        -- https://scriptblox.com/script/Prison-Life-Prizz-Admin-14511

loadstring(game:HttpGet('https://raw.githubusercontent.com/devguy100/PrizzLife/main/pladmin.lua'))()
    end
})

-- アバターハブ
TabAdmin:CreateButton({
    Name = "よくばりセット",
    Callback = function()
        print("よくばりセット")
        loadstring(game:HttpGet('https://raw.githubusercontent.com/Avtor1zaTion/Avtor/main/AvtorHub'))()
    end
})

-- ブロフル1
TabAdminCreateButton({
    Name = "ブロフル1",
    Callback = function()
        print("ブロフル1")
        loadstring(game:HttpGet("https://raw.githubusercontent.com/xQuartyx/QuartyzScript/main/Loader.lua"))()
    end
})

-- ブロフル2
TabAdminCreateButton({
    Name = "ブロフル2",
    Callback = function()
        print("ブロフル2")
        loadstring(game:HttpGet("https://raw.githubusercontent.com/3345-c-a-t-s-u-s/Kncrypt/refs/heads/main/sources/BloxFruit.lua"))()
    end
})

-- 最強の戦場
TabAdminCreateButton({
    Name = "最強の戦場",
    Callback = function()
        print("最強の戦場")
        loadstring(game:HttpGet("https://raw.githubusercontent.com/ATrainz/Phantasm/refs/heads/main/Games/TSB.lua"))()
    end
})

-- ==== タブ5：バトル系 ====
local TabBattle = Window:CreateTab("バトル")

-- スーパーパンチ
TabBattle:CreateButton({
    Name = "スーパーパンチ（クリックで敵を倒す）",
    Callback = function()
        local plr = game.Players.LocalPlayer
        local mouse = plr:GetMouse()
        mouse.Button1Down:Connect(function()
            local target = mouse.Target
            if target and target.Parent:FindFirstChildOfClass("Humanoid") then
                target.Parent:FindFirstChildOfClass("Humanoid").Health = 0
            end
        end)
    end
})

-- 吹っ飛ばしパンチ
TabBattle:CreateButton({
    Name = "吹っ飛ばしパンチ",
    Callback = function()
        local plr = game.Players.LocalPlayer
        local mouse = plr:GetMouse()
        mouse.Button1Down:Connect(function()
            local target = mouse.Target
            if target and target.Parent:FindFirstChildOfClass("HumanoidRootPart") then
                target.Parent.HumanoidRootPart.Velocity = Vector3.new(0, 200, 0)
            end
        end)
    end
})

-- クリック即死（敵をクリックしたら即倒す）
TabBattle:CreateButton({
    Name = "クリック即死",
    Callback = function()
        local plr = game.Players.LocalPlayer
        local mouse = plr:GetMouse()
        mouse.Button1Down:Connect(function()
            local target = mouse.Target
            if target and target.Parent:FindFirstChildOfClass("Humanoid") then
                target.Parent:FindFirstChildOfClass("Humanoid").Health = 0
            end
        end)
    end
})

-- オーラ攻撃（近づいた敵を自動で倒す）
TabBattle:CreateButton({
    Name = "オーラ攻撃（周囲の敵を即死）",
    Callback = function()
        local plr = game.Players.LocalPlayer
        while task.wait(0.5) do
            for _, v in pairs(game.Players:GetPlayers()) do
                if v ~= plr and v.Character and v.Character:FindFirstChild("Humanoid") then
                    local hrp = v.Character:FindFirstChild("HumanoidRootPart")
                    local myHrp = plr.Character:FindFirstChild("HumanoidRootPart")
                    if hrp and myHrp and (hrp.Position - myHrp.Position).magnitude < 10 then
                        v.Character.Humanoid.Health = 0
                    end
                end
            end
        end
    end
})

-- 無限体力（HPが減らない）
TabBattle:CreateButton({
    Name = "無限体力",
    Callback = function()
        local plr = game.Players.LocalPlayer
        local hum = plr.Character:WaitForChild("Humanoid")
        hum:GetPropertyChangedSignal("Health"):Connect(function()
            hum.Health = hum.MaxHealth
        end)
    end
})

-- 無敵モード（死ななくなる）
TabBattle:CreateButton({
    Name = "無敵モード",
    Callback = function()
        local hum = game.Players.LocalPlayer.Character:WaitForChild("Humanoid")
        hum.Name = "1x無敵Humanoid" -- 偽装
    end
})

-- ==== タブ6：移動系 ====
local TabMove = Window:CreateTab("移動")

-- 無限ジャンプ
TabMove:CreateToggle({
    Name = "無限ジャンプ",
    CurrentValue = false,
    Callback = function(state)
        local InfiniteJumpEnabled = state
        game:GetService("UserInputService").JumpRequest:Connect(function()
            if InfiniteJumpEnabled then
                local humanoid = game.Players.LocalPlayer.Character:FindFirstChildOfClass("Humanoid")
                if humanoid then
                    humanoid:ChangeState("Jumping")
                end
            end
        end)
    end
})

-- フロート（低重力）
TabMove:CreateButton({
    Name = "ふわふわ浮遊 (低重力)",
    Callback = function()
        game:GetService("Workspace").Gravity = 30 -- 通常は196
    end
})

-- 元に戻す（重力リセット）
TabMove:CreateButton({
    Name = "重力リセット",
    Callback = function()
        game:GetService("Workspace").Gravity = 196
    end
})

-- ==== タブ6：武器 ====
local TabWeapon = Window:CreateTab("武器")

-- 無限弾
TabWeapon:CreateButton({
    Name = "無限弾",
    Callback = function()
        local plr = game.Players.LocalPlayer
        for _, tool in pairs(plr.Backpack:GetChildren()) do
            if tool:FindFirstChild("Ammo") then
                tool.Ammo.Changed:Connect(function()
                    tool.Ammo.Value = math.huge
                end)
                tool.Ammo.Value = math.huge
            end
        end
    end
})

-- 即死銃
TabWeapon:CreateButton({
    Name = "即死銃",
    Callback = function()
        local plr = game.Players.LocalPlayer
        for _, tool in pairs(plr.Backpack:GetChildren()) do
            if tool:IsA("Tool") and tool:FindFirstChild("Handle") then
                tool.Activated:Connect(function()
                    local mouse = plr:GetMouse()
                    if mouse.Target and mouse.Target.Parent:FindFirstChildOfClass("Humanoid") then
                        mouse.Target.Parent:FindFirstChildOfClass("Humanoid").Health = 0
                    end
                end)
            end
        end
    end
})

-- バズーカ（爆発）
TabWeapon:CreateButton({
    Name = "バズーカ (爆発攻撃)",
    Callback = function()
        local mouse = game.Players.LocalPlayer:GetMouse()
        mouse.Button1Down:Connect(function()
            local explosion = Instance.new("Explosion")
            explosion.Position = mouse.Hit.p
            explosion.BlastRadius = 15
            explosion.BlastPressure = 500000
            explosion.Parent = game.Workspace
        end)
    end
})

-- 剣のリーチ無限
TabWeapon:CreateButton({
    Name = "剣のリーチ無限",
    Callback = function()
        for _, tool in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
            if tool:IsA("Tool") and tool:FindFirstChild("Handle") then
                tool.Handle.Size = Vector3.new(999, 999, 999)
                tool.Handle.Massless = true
            end
        end
    end
})

-- 爆弾ばらまき
TabWeapon:CreateButton({
    Name = "爆弾ばらまき",
    Callback = function()
        for i = 1, 20 do
            local bomb = Instance.new("Explosion")
            bomb.Position = game.Players.LocalPlayer.Character.HumanoidRootPart.Position + Vector3.new(math.random(-10,10),0,math.random(-10,10))
            bomb.BlastRadius = 10
            bomb.BlastPressure = 300000
            bomb.Parent = workspace
        end
    end
})

-- ==== タブ7：トロール ====
local TabTroll = Window:CreateTab("トロール")

-- 全員ジャンプ連打
TabTroll:CreateButton({
    Name = "全員ジャンプ連打",
    Callback = function()
        for _, plr in pairs(game.Players:GetPlayers()) do
            if plr.Character and plr.Character:FindFirstChildOfClass("Humanoid") then
                while true do
                    task.wait(0.2)
                    pcall(function()
                        plr.Character:FindFirstChildOfClass("Humanoid"):ChangeState("Jumping")
                    end)
                end
            end
        end
    end
})

-- 全員回転
TabTroll:CreateButton({
    Name = "全員回転させる",
    Callback = function()
        while true do
            task.wait(0.1)
            for _, plr in pairs(game.Players:GetPlayers()) do
                if plr.Character and plr.Character:FindFirstChild("HumanoidRootPart") then
                    plr.Character.HumanoidRootPart.CFrame = plr.Character.HumanoidRootPart.CFrame * CFrame.Angles(0, math.rad(45), 0)
                end
            end
        end
    end
})

-- 全員打ち上げ
TabTroll:CreateButton({
    Name = "全員を空に打ち上げる",
    Callback = function()
        for _, plr in pairs(game.Players:GetPlayers()) do
            if plr.Character and plr.Character:FindFirstChild("HumanoidRootPart") then
                plr.Character.HumanoidRootPart.Velocity = Vector3.new(0, 500, 0)
            end
        end
    end
})

-- プレイヤーを凍らせる
TabTroll:CreateButton({
    Name = "全員を凍らせる",
    Callback = function()
        for _, plr in pairs(game.Players:GetPlayers()) do
            if plr.Character and plr.Character:FindFirstChildOfClass("Humanoid") then
                plr.Character:FindFirstChildOfClass("Humanoid").WalkSpeed = 0
                plr.Character:FindFirstChildOfClass("Humanoid").JumpPower = 0
            end
        end
    end
})

-- 音爆弾
TabTroll:CreateButton({
    Name = "音爆弾（超うるさい）",
    Callback = function()
        local sound = Instance.new("Sound")
        sound.SoundId = "rbxassetid://12222242" -- 爆音系サウンドID
        sound.Volume = 10
        sound.Looped = true
        sound.Parent = workspace
        sound:Play()
    end
})

-- ESP：ボックス + 名前 + 体力バー（Robust版）
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local LocalPlayer = Players.LocalPlayer

local espEnabled = false
local espTable = {} -- plr -> BillboardGui

local function createESPForCharacter(plr, char)
    if not plr or plr == LocalPlayer then return end
    if not char then return end
    local head = char:FindFirstChild("Head")
    if not head then return end

    -- 既存があれば削除（重複防止）
    if head:FindFirstChild("RIKU_ESP_Billboard") then
        head.RIKU_ESP_Billboard:Destroy()
    end

    local bg = Instance.new("BillboardGui")
    bg.Name = "RIKU_ESP_Billboard"
    bg.Adornee = head
    bg.AlwaysOnTop = true
    bg.Size = UDim2.new(0, 200, 0, 60)       -- 見た目のサイズ（必要なら調整）
    bg.StudsOffset = Vector3.new(0, 2.5, 0)  -- 頭上オフセット
    bg.Parent = head

    local container = Instance.new("Frame", bg)
    container.Size = UDim2.new(1,0,1,0)
    container.Position = UDim2.new(0,0,0,0)
    container.BackgroundTransparency = 1

    -- 名前ラベル
    local nameLabel = Instance.new("TextLabel", container)
    nameLabel.Name = "RIKU_Name"
    nameLabel.Size = UDim2.new(1,0,0,18)
    nameLabel.Position = UDim2.new(0,0,0,0)
    nameLabel.BackgroundTransparency = 1
    nameLabel.Text = plr.Name
    nameLabel.TextColor3 = Color3.fromRGB(255,255,255)
    nameLabel.TextStrokeTransparency = 0.6
    nameLabel.Font = Enum.Font.SourceSansBold
    nameLabel.TextScaled = true
    nameLabel.TextYAlignment = Enum.TextYAlignment.Top

    -- ボックスのアウトライン（擬似ボックス）
    local outline = Instance.new("Frame", container)
    outline.Name = "RIKU_Outline"
    outline.Size = UDim2.new(1,0,1,0)
    outline.Position = UDim2.new(0,0,0,0)
    outline.BackgroundTransparency = 1

    local thickness = 1
    local top = Instance.new("Frame", outline)
    top.Size = UDim2.new(1,0,0,thickness); top.Position = UDim2.new(0,0,0,0)
    top.BackgroundColor3 = Color3.fromRGB(255,255,255); top.BorderSizePixel = 0
    local bottom = Instance.new("Frame", outline)
    bottom.Size = UDim2.new(1,0,0,thickness); bottom.Position = UDim2.new(0,0,1,-thickness)
    bottom.BackgroundColor3 = Color3.fromRGB(255,255,255); bottom.BorderSizePixel = 0
    local left = Instance.new("Frame", outline)
    left.Size = UDim2.new(0,thickness,1,0); left.Position = UDim2.new(0,0,0,0)
    left.BackgroundColor3 = Color3.fromRGB(255,255,255); left.BorderSizePixel = 0
    local right = Instance.new("Frame", outline)
    right.Size = UDim2.new(0,thickness,1,0); right.Position = UDim2.new(1,-thickness,0,0)
    right.BackgroundColor3 = Color3.fromRGB(255,255,255); right.BorderSizePixel = 0

    -- 体力バー背景（横バー）
    local healthBg = Instance.new("Frame", container)
    healthBg.Name = "RIKU_HealthBg"
    healthBg.Size = UDim2.new(1, -22, 0, 8)
    healthBg.Position = UDim2.new(0, 11, 0, 36)
    healthBg.BackgroundColor3 = Color3.fromRGB(10,10,10)
    healthBg.BorderSizePixel = 0
    healthBg.BackgroundTransparency = 0.25

    local healthBar = Instance.new("Frame", healthBg)
    healthBar.Name = "RIKU_Health"
    healthBar.Size = UDim2.new(1,0,1,0)
    healthBar.Position = UDim2.new(0,0,0,0)
    healthBar.BorderSizePixel = 0
    healthBar.BackgroundColor3 = Color3.fromRGB(0,255,0)

    -- 更新関数
    local function update()
        if not (plr and plr.Character) then return end
        local humanoid = plr.Character:FindFirstChildOfClass("Humanoid")
        if humanoid then
            local maxH = humanoid.MaxHealth > 0 and humanoid.MaxHealth or 1
            local ratio = math.clamp(humanoid.Health / maxH, 0, 1)
            healthBar.Size = UDim2.new(ratio, 0, 1, 0)
            if ratio > 0.5 then
                healthBar.BackgroundColor3 = Color3.fromRGB(0,255,0)
            elseif ratio > 0.2 then
                healthBar.BackgroundColor3 = Color3.fromRGB(255,200,0)
            else
                healthBar.BackgroundColor3 = Color3.fromRGB(255,0,0)
            end
            nameLabel.Text = plr.Name .. "  " .. math.floor(humanoid.Health)
        end
    end

    -- 初回更新
    update()

    -- Humanoid の変化を監視
    local hum = char:FindFirstChildOfClass("Humanoid")
    if hum then
        hum.HealthChanged:Connect(function() pcall(update) end)
    end

    -- 保持
    espTable[plr] = bg
end

local function removeESP(plr)
    if not plr or not plr.Character then return end
    local head = plr.Character:FindFirstChild("Head")
    if head then
        local bb = head:FindFirstChild("RIKU_ESP_Billboard")
        if bb then bb:Destroy() end
    end
    espTable[plr] = nil
end

local function refreshAllESP()
    for _, plr in pairs(Players:GetPlayers()) do
        if plr ~= LocalPlayer and plr.Character then
            createESPForCharacter(plr, plr.Character)
        end
    end
end

-- プレイヤー追加・削除・キャラ再生成対応
Players.PlayerAdded:Connect(function(plr)
    plr.CharacterAdded:Connect(function(char)
        task.wait(0.5)
        if espEnabled then createESPForCharacter(plr, char) end
    end)
end)

Players.PlayerRemoving:Connect(function(plr)
    removeESP(plr)
end)

-- トグル関数（GUI用）
local function setESP(state)
    espEnabled = state
    if espEnabled then
        refreshAllESP()
        -- 既にいるプレイヤーのキャラに対しても再作成（安全のため少し遅延）
        for _, plr in pairs(Players:GetPlayers()) do
            if plr ~= LocalPlayer then
                if plr.Character then
                    pcall(function() createESPForCharacter(plr, plr.Character) end)
                else
                    plr.CharacterAdded:Wait()
                    pcall(function() createESPForCharacter(plr, plr.Character) end)
                end
            end
        end
    else
        -- 全て破棄
        for plr, _ in pairs(espTable) do
            pcall(function() removeESP(plr) end)
        end
    end
end

-- GUIと繋げる例（Rayfieldのトグル）
-- TabTroll:CreateToggle({ Name = "ESP（ボックス・名前・HP）", CurrentValue = false, Callback = function(state) setESP(state) end })

-- 直接有効化したいときは次を実行:
-- setESP(true)

