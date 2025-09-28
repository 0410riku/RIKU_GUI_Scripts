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

TabNoriben:CreateButton({ Name = "食ってみな飛ぶぞ", Callback = function()
    loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-Fly-gui-v3-43427"))()
end })

TabNoriben:CreateButton({ Name = "ナイフ", Callback = function()
    loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-Grab-knife-v4-24753"))()
end })

TabNoriben:CreateButton({ Name = "R15エモート", Callback = function()
    loadstring(game:HttpGet('https://raw.githubusercontent.com/Gazer-Ha/Gaze-stuff/refs/heads/main/Silly%20emote'))()
end })

TabNoriben:CreateButton({ Name = "レントゲン", Callback = function()
    createXRayGUI() -- 既存関数
end })

TabNoriben:CreateButton({ Name = "テレポート", Callback = function()
    local mouse = game.Players.LocalPlayer:GetMouse()
    local tool = Instance.new("Tool")
    tool.RequiresHandle = false
    tool.Name = "Tp tool(Equip to Click TP)"
    tool.Activated:Connect(function()
        local pos = mouse.Hit + Vector3.new(0, 2.5, 0)
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(pos.X, pos.Y, pos.Z)
    end)
    tool.Parent = game.Players.LocalPlayer.Backpack
end })

TabNoriben:CreateButton({ Name = "オートクリッカー", Callback = function()
    loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-Auto-Clicker-47778"))()
end })

-- ==== タブ2：移動・変身 ====
local TabMove = Window:CreateTab("移動・変身")

local speedValue, jumpValue = 16, 50
local function updateHumanoid()
    local plr = game.Players.LocalPlayer
    if plr.Character then
        local humanoid = plr.Character:FindFirstChildOfClass("Humanoid")
        if humanoid then
            humanoid.WalkSpeed = speedValue
            humanoid.JumpPower = jumpValue
        end
    end
end

TabMove:CreateSlider({ Name = "速さ", Range = {16,1500}, CurrentValue = speedValue, Suffix = " studs", Callback = function(val)
    speedValue = val
    updateHumanoid()
end })

TabMove:CreateSlider({ Name = "ジャンプ力", Range = {50,1500}, CurrentValue = jumpValue, Suffix = " studs", Callback = function(val)
    jumpValue = val
    updateHumanoid()
end })

TabMove:CreateToggle({ Name = "無限ジャンプ", CurrentValue = false, Callback = function(state)
    local InfiniteJumpEnabled = state
    game:GetService("UserInputService").JumpRequest:Connect(function()
        if InfiniteJumpEnabled then
            local humanoid = game.Players.LocalPlayer.Character:FindFirstChildOfClass("Humanoid")
            if humanoid then humanoid:ChangeState("Jumping") end
        end
    end)
end })

TabMove:CreateButton({ Name = "透明化", Callback = function()
    loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-Invisible-script-20557"))()
end })

TabMove:CreateButton({ Name = "ノークリップ", Callback = function()
    createNoclipGUI() -- 既存関数
end })

-- 変身系
TabMove:CreateButton({ Name = "巨人化", Callback = function()
    local char = game.Players.LocalPlayer.Character
    for _,v in pairs(char:GetDescendants()) do if v:IsA("BasePart") then v.Size = v.Size*3 end end
end })

TabMove:CreateButton({ Name = "ミニ化", Callback = function()
    local char = game.Players.LocalPlayer.Character
    for _,v in pairs(char:GetDescendants()) do if v:IsA("BasePart") then v.Size = v.Size*0.3 end end
end })

TabMove:CreateButton({ Name = "ゴリラ化（腕だけ巨大）", Callback = function()
    local char = game.Players.LocalPlayer.Character
    local armL = char:FindFirstChild("Left Arm") or char:FindFirstChild("LeftUpperArm")
    local armR = char:FindFirstChild("Right Arm") or char:FindFirstChild("RightUpperArm")
    if armL then armL.Size = armL.Size*5 end
    if armR then armR.Size = armR.Size*5 end
end })

TabMove:CreateButton({ Name = "首無しモード", Callback = function()
    local char = game.Players.LocalPlayer.Character
    if char:FindFirstChild("Head") then char.Head:Destroy() end
end })

game.Players.LocalPlayer.CharacterAdded:Connect(function() task.wait(0.5) updateHumanoid() end)
updateHumanoid()

-- ==== タブ3：アド民 ====
local TabAdmin = Window:CreateTab("アド民")
TabAdmin:CreateButton({ Name = "Infinite Yield", Callback = function()
    loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-Infinite-Yield-43437"))()
end })

-- ==== タブ4：スプリクト ====
local TabScript = Window:CreateTab("スプリクト")
TabScript:CreateButton({ Name = "99日生き残る", Callback = function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/VapeVoidware/VW-Add/main/nightsintheforest.lua", true))()
end })
TabScript:CreateButton({ Name = "SBヘルパー", Callback = function()
    loadstring(game:HttpGet('https://raw.githubusercontent.com/Ekanite-a/Scripts/refs/heads/main/Slap%20battles/Mastery_helper.lua'))()
end })
TabScript:CreateButton({ Name = "edgelord", Callback = function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/IncognitoScripts/SlapBattles/refs/heads/main/Edgelord"))()
end })
TabScript:CreateButton({ Name = "プリズンアドミン", Callback = function()
    loadstring(game:HttpGet('https://raw.githubusercontent.com/devguy100/PrizzLife/main/pladmin.lua'))()
end })
TabScript:CreateButton({ Name = "よくばりセット", Callback = function()
    loadstring(game:HttpGet('https://raw.githubusercontent.com/Avtor1zaTion/Avtor/main/AvtorHub'))()
end })
TabScript:CreateButton({ Name = "ブロフル1", Callback = function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/xQuartyx/QuartyzScript/main/Loader.lua"))()
end })
TabScript:CreateButton({ Name = "ブロフル2", Callback = function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/3345-c-a-t-s-u-s/Kncrypt/refs/heads/main/sources/BloxFruit.lua"))()
end })
TabScript:CreateButton({ Name = "最強の戦場", Callback = function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/ATrainz/Phantasm/refs/heads/main/Games/TSB.lua"))()
end })

-- ==== タブ5：バトル系 ====
local TabBattle = Window:CreateTab("バトル")
TabBattle:CreateButton({ Name = "スーパーパンチ", Callback = function()
    local plr = game.Players.LocalPlayer
    local mouse = plr:GetMouse()
    mouse.Button1Down:Connect(function()
        local target = mouse.Target
        if target and target.Parent:FindFirstChildOfClass("Humanoid") then
            target.Parent.Humanoid.Health = 0
        end
    end)
end })
TabBattle:CreateButton({ Name = "吹っ飛ばしパンチ", Callback = function()
    local plr = game.Players.LocalPlayer
    local mouse = plr:GetMouse()
    mouse.Button1Down:Connect(function()
        local target = mouse.Target
        if target and target.Parent:FindFirstChild("HumanoidRootPart") then
            target.Parent.HumanoidRootPart.Velocity = Vector3.new(0,200,0)
        end
    end)
end })
TabBattle:CreateButton({ Name = "オーラ攻撃", Callback = function()
    local plr = game.Players.LocalPlayer
    task.spawn(function()
        while task.wait(0.5) do
            for _,v in pairs(game.Players:GetPlayers()) do
                if v ~= plr and v.Character and v.Character:FindFirstChild("HumanoidRootPart") then
                    if (v.Character.HumanoidRootPart.Position - plr.Character.HumanoidRootPart.Position).Magnitude < 10 then
                        v.Character.Humanoid.Health = 0
                    end
                end
            end
        end
    end)
end })
TabBattle:CreateButton({ Name = "無限体力", Callback = function()
    local hum = game.Players.LocalPlayer.Character:WaitForChild("Humanoid")
    hum:GetPropertyChangedSignal("Health"):Connect(function() hum.Health = hum.MaxHealth end)
end })
TabBattle:CreateButton({ Name = "無敵モード", Callback = function()
    game.Players.LocalPlayer.Character:WaitForChild("Humanoid").Name = "1x無敵Humanoid"
end })

-- ==== タブ6：武器 ====
local TabWeapon = Window:CreateTab("武器")
TabWeapon:CreateButton({ Name = "無限弾", Callback = function()
    local plr = game.Players.LocalPlayer
    for _,tool in pairs(plr.Backpack:GetChildren()) do
        if tool:FindFirstChild("Ammo") then
            tool.Ammo.Value = math.huge
            tool.Ammo.Changed:Connect(function() tool.Ammo.Value = math.huge end)
        end
    end
end })
TabWeapon:CreateButton({ Name = "即死銃", Callback = function()
    local plr = game.Players.LocalPlayer
    for _,tool in pairs(plr.Backpack:GetChildren()) do
        if tool:IsA("Tool") and tool:FindFirstChild("Handle") then
            tool.Activated:Connect(function()
                local mouse = plr:GetMouse()
                if mouse.Target and mouse.Target.Parent:FindFirstChildOfClass("Humanoid") then
                    mouse.Target.Parent.Humanoid.Health = 0
                end
            end)
        end
    end
end })
TabWeapon:CreateButton({ Name = "バズーカ", Callback = function()
    local mouse = game.Players.LocalPlayer:GetMouse()
    mouse.Button1Down:Connect(function()
        local explosion = Instance.new("Explosion")
        explosion.Position = mouse.Hit.p
        explosion.BlastRadius = 15
        explosion.BlastPressure = 500000
        explosion.Parent = workspace
    end)
end })

-- ==== タブ7：トロール ====
local TabTroll = Window:CreateTab("トロール")
TabTroll:CreateButton({ Name = "全員ジャンプ連打", Callback = function()
    for _,plr in pairs(game.Players:GetPlayers()) do
        if plr.Character and plr.Character:FindFirstChildOfClass("Humanoid") then
            task.spawn(function()
                while true do
                    task.wait(0.2)
                    pcall(function() plr.Character:FindFirstChildOfClass("Humanoid"):ChangeState("Jumping") end)
                end
            end)
        end
    end
end })
TabTroll:CreateButton({ Name = "全員回転", Callback = function()
    task.spawn(function()
        while true do
            task.wait(0.1)
            for _,plr in pairs(game.Players:GetPlayers()) do
                if plr.Character and plr.Character:FindFirstChild("HumanoidRootPart") then
                    plr.Character.HumanoidRootPart.CFrame = plr.Character.HumanoidRootPart.CFrame * CFrame.Angles(0, math.rad(45), 0)
                end
            end
        end
    end)
end })
TabTroll:CreateButton({ Name = "全員打ち上げ", Callback = function()
    for _,plr in pairs(game.Players:GetPlayers()) do
        if plr.Character and plr.Character:FindFirstChild("HumanoidRootPart") then
            plr.Character.HumanoidRootPart.Velocity = Vector3.new(0,500,0)
        end
    end
end })
TabTroll:CreateButton({ Name = "全員凍結", Callback = function()
    for _,plr in pairs(game.Players:GetPlayers()) do
        if plr.Character and plr.Character:FindFirstChildOfClass("Humanoid") then
            local hum = plr.Character.Humanoid
            hum.WalkSpeed = 0
            hum.JumpPower = 0
        end
    end
end })
TabTroll:CreateButton({ Name = "音爆弾", Callback = function()
    local sound = Instance.new("Sound")
    sound.SoundId = "rbxassetid://12222242"
    sound.Volume = 10
    sound.Looped = true
    sound.Parent = workspace
    sound:Play()
end })
