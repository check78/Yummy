-- Jumpscare Sounds
local sek = loadstring(game:HttpGet("https://raw.githubusercontent.com/check78/Yummy/main/A-60%20Model.txt"))()
local boo = Instance.new("Sound")
				boo.Volume = 2
				boo.SoundId = "rbxassetid://6169705721"
				boo.Parent = game.Players.LocalPlayer.PlayerGui
				local JumpscareSound = Instance.new("Sound")
				JumpscareSound.SoundId = "rbxassetid://6459610652"
				JumpscareSound.Parent = game.Players.LocalPlayer.PlayerGui
				JumpscareSound.Volume = 0
				JumpscareSound.Looped = true
				JumpscareSound:Play()
				local Bruh = game:GetService("TweenService"):Create(JumpscareSound, TweenInfo.new(0.2),{Volume = 3})
				local Moment = game:GetService("TweenService"):Create(JumpscareSound, TweenInfo.new(0.5),{Volume = 0})
local dances = {"0.4", "0.5", "0.6", "0.7", "0.8", "0.9", "1", "1.2", "1.4", "1.6", "1.7", "1.8", "2", "2.3", "2.5"}
local mom = {"rbxassetid://192267375", "rbxassetid://1972219024", "rbxassetid://1822114127", "rbxassetid://3413871766", "rbxassetid://3354536350", "rbxassetid://17865063", "rbxassetid://4749623118", "rbxassetid://1857893092", "rbxassetid://4508624823", "rbxassetid://6309704436", "rbxassetid://10458678325", "rbxassetid://13265402515", "rbxassetid://13265404267", "rbxassetid://13265406067", "rbxassetid://13263988191", "rbxassetid://12791569928", "rbxassetid://12830765101", "rbxassetid://11857886160", "rbxassetid://7000842409", "rbxassetid://7000843482", "rbxassetid://10458678325", "rbxassetid://10458679718", "rbxassetid://11857886160"}

-- Services

local Players = game:GetService("Players")
local ReSt = game:GetService("ReplicatedStorage")
local RS = game:GetService("RunService")
local TS = game:GetService("TweenService")
local CG = game:GetService("CoreGui")

-- Variables

local Plr = Players.LocalPlayer
local Char = Plr.Character or Plr.CharacterAdded:Wait()
local Hum = Char:WaitForChild("Humanoid")
local Camera = workspace.CurrentCamera

local StaticRushSpeed = 60

local FindPartOnRayWithIgnoreList = workspace.FindPartOnRayWithIgnoreList
local WorldToViewportPoint = Camera.WorldToViewportPoint

local SelfModules = {
    DefaultConfig = loadstring(game:HttpGet("https://raw.githubusercontent.com/RegularVynixu/Utilities/main/Doors%20Entity%20Spawner/DefaultConfig.lua"))(),
    Functions = loadstring(game:HttpGet("https://raw.githubusercontent.com/RegularVynixu/Utilities/main/Functions.lua"))(),
}
local ModuleScripts = {
    ModuleEvents = require(ReSt.ClientModules.Module_Events),
    MainGame = require(Plr.PlayerGui.MainUI.Initiator.Main_Game),
}
local EntityConnections = {}

local Spawner = {}

-- Misc Functions

function onCharacterAdded(char)
    Char, Hum = char, char:WaitForChild("Humanoid")
end

function getPlayerRoot()
    return Char:FindFirstChild("HumanoidRootPart") or Char:FindFirstChild("Head")
end

function dragEntity(entityModel, pos, speed)
    local entityConnections = EntityConnections[entityModel]

    if entityConnections.movementNode then
        entityConnections.movementNode:Disconnect()
    end

    entityConnections.movementNode = RS.Stepped:Connect(function(_, step)
        if entityModel.Parent and not entityModel:GetAttribute("NoAI") then
            local rootPos = entityModel.PrimaryPart.Position
            local diff = Vector3.new(pos.X, pos.Y, pos.Z) - rootPos

            if diff.Magnitude > 0.1 then
                entityModel:PivotTo(CFrame.new(rootPos + diff.Unit * math.min(step * speed, diff.Magnitude)))
            else
                entityConnections.movementNode:Disconnect()
            end
        end
    end)

    repeat task.wait() until not entityConnections.movementNode.Connected
end

function loadSound(soundData)
    local sound = Instance.new("Sound")
    local soundId = tostring(soundData[1])
    local properties = soundData[2]

    for i, v in next, properties do
        if i ~= "SoundId" and i ~= "Parent" then
            sound[i] = v
        end
    end

    if soundId:find("rbxasset://") then -- Custom audio
        sound.SoundId = soundId
    else
        local numberId = soundId:gsub("%D", "")

        sound.SoundId = "rbxassetid://".. numberId
    end
    
    sound.Parent = workspace

    return sound
end

-- Functions

Spawner.createEntity = function(config)
    for i, v in next, SelfModules.DefaultConfig do
        if config[i] == nil then
            config[i] = v
        end
    end

    config.Speed = StaticRushSpeed / 100 * config.Speed

    -- Model

    local entityModel = sek

    if typeof(entityModel) == "Instance" and entityModel.ClassName == "Model" then
        entityModel.PrimaryPart = entityModel.PrimaryPart or entityModel:FindFirstChildWhichIsA("BasePart")
        
        if entityModel.PrimaryPart then
            entityModel.PrimaryPart.Anchored = true
            
            if config.CustomName then
                entityModel.Name = config.CustomName
            end

            entityModel:SetAttribute("IsCustomEntity", true)
            entityModel:SetAttribute("NoAI", false)

            -- EntityTable

            local entityTable = {
                Model = entityModel,
                Config = config,
                Debug = {
                    OnEntitySpawned = function() end,
                    OnEntityDespawned = function() end,
                    OnEntityStartMoving = function() end,
                    OnEntityFinishedRebound = function() end,
                    OnEntityEnteredRoom = function() end,
                    OnLookAtEntity = function() end,
                    OnDeath = function() end
                }
            }

            return entityTable
        end
    end
end

Spawner.runEntity = function(entityTable)
    -- Nodes

    local nodes = {}

    for _, room in next, workspace.CurrentRooms:GetChildren() do
        local pathfindNodes = room:FindFirstChild("PathfindNodes")
        
        if pathfindNodes then
            pathfindNodes = pathfindNodes:GetChildren()
        else
            local fakeNode = Instance.new("Part")
            fakeNode.Name = "1"
            fakeNode.CFrame = room:WaitForChild("RoomExit").CFrame - Vector3.new(0, room.RoomExit.Size.Y / 2, 0)

            pathfindNodes = {fakeNode}
        end

        table.sort(pathfindNodes, function(a, b)
            return tonumber(a.Name) < tonumber(b.Name)
        end)

        for _, node in next, pathfindNodes do
            nodes[#nodes + 1] = node
        end
    end

    -- Spawn

    local entityModel = sek:Clone()
    local startNodeIndex = entityTable.Config.BackwardsMovement and #nodes or 1
    local startNodeOffset = entityTable.Config.BackwardsMovement and -50 or 50

    EntityConnections[entityModel] = {}
    local entityConnections = EntityConnections[entityModel]
    
    entityModel:PivotTo(nodes[startNodeIndex].CFrame * CFrame.new(0, 0, startNodeOffset) + Vector3.new(0, 3.5 + entityTable.Config.HeightOffset, 0))
    entityModel.Parent = workspace
    task.spawn(entityTable.Debug.OnEntitySpawned)

    -- Mute entity on spawn

    if CG:FindFirstChild("JumpscareGui") or (Plr.PlayerGui.MainUI.Death.HelpfulDialogue.Visible and not Plr.PlayerGui.MainUI.DeathPanelDead.Visible) then
        warn("on death screen, mute entity")

        for _, v in next, entityModel:GetDescendants() do
            if v.ClassName == "Sound" and v.Playing then
                v:Stop()
            end
        end
    end

    -- Flickering

    if entityTable.Config.FlickerLights[1] then
        ModuleScripts.ModuleEvents.flicker(workspace.CurrentRooms[ReSt.GameData.LatestRoom.Value], entityTable.Config.FlickerLights[2])
    end

    -- Movement

    task.wait(entityTable.Config.DelayTime)

    local enteredRooms = {}

    entityConnections.movementTick = RS.Stepped:Connect(function()
        if entityModel.Parent and not entityModel:GetAttribute("NoAI") then
            local entityPos = entityModel.PrimaryPart.Position
            local rootPos = getPlayerRoot().Position
            local floorRay = FindPartOnRayWithIgnoreList(workspace, Ray.new(entityPos, Vector3.new(0, -10, 0)), {entityModel, Char})
            local playerInSight = FindPartOnRayWithIgnoreList(workspace, Ray.new(entityPos, rootPos - entityPos), {entityModel, Char}) == nil
            
            -- Entered room

            if floorRay ~= nil and floorRay.Name == "Floor" then
                for _, room in next, workspace.CurrentRooms:GetChildren() do
                    if floorRay:IsDescendantOf(room) and not table.find(enteredRooms, room) then
                        enteredRooms[#enteredRooms + 1] = room
                        task.spawn(entityTable.Debug.OnEntityEnteredRoom, room)

                        -- Break lights
                        
                        if entityTable.Config.BreakLights then
                            ModuleScripts.ModuleEvents.shatter(room)
                        end

                        break
                    end
                end
            end

            -- Camera shaking
            
            local shakeConfig = entityTable.Config.CamShake
            local shakeMag = (getPlayerRoot().Position - entityModel.PrimaryPart.Position).Magnitude

            if shakeConfig[1] and shakeMag <= shakeConfig[3] then
                local shakeRep = {}

                for i, v in next, shakeConfig[2] do
                    shakeRep[i] = v
                end
                shakeRep[1] = shakeConfig[2][1] / shakeConfig[3] * (shakeConfig[3] - shakeMag)

                ModuleScripts.MainGame.camShaker.ShakeOnce(ModuleScripts.MainGame.camShaker, table.unpack(shakeRep))
            end

            -- Player in sight

            if playerInSight then
                -- Look at entity

                local _, onScreen = WorldToViewportPoint(Camera, entityModel.PrimaryPart.Position)

                if onScreen then
                    task.spawn(entityTable.Debug.OnLookAtEntity)
                end

                -- Kill player

                if entityTable.Config.CanKill and not Char:GetAttribute("IsDead") and not Char:GetAttribute("Invincible") and not Char:GetAttribute("Hiding") and (getPlayerRoot().Position - entityModel.PrimaryPart.Position).Magnitude <= entityTable.Config.KillRange then
                    task.spawn(function()
                        Char:SetAttribute("IsDead", true)

                        -- Mute entity

                        warn("mute entity")

                        for _, v in next, entityModel.RushNew:GetDescendants() do
                            if v.ClassName == "Sound" and v.Playing then
                                local oldVolume = v.Volume
                                v.Volume = 0
                            end
                        end

                        -- Jumpscare
                        
                        if entityTable.Config.Jumpscare[1] then
                            Spawner.runJumpscare(entityTable.Config.Jumpscare[2])
                        end

                        -- Death handling
                        
                        task.spawn(entityTable.Debug.OnDeath)
game:GetService("TweenService"):Create(game.Lighting.MainColorCorrection, TweenInfo.new(1), {Contrast = 0.5}):Play()
local TW = game:GetService("TweenService"):Create(game.Lighting.MainColorCorrection, TweenInfo.new(1),{TintColor = Color3.fromRGB(655, 0, 0)})
TW:Play()
                        local damn = entityModel.PrimaryPart:Clone()
                        damn.Parent = game.Workspace.CurrentCamera
                        game:GetService("RunService").RenderStepped:Connect(function()
                        game.TweenService:Create(damn,TweenInfo.new(0.3),{CFrame = game.Workspace.CurrentCamera.CFrame * CFrame.new(0, -0.2, -6)}):Play()
                        end)
coroutine.wrap(function()
while true do
damn.Attachment.Face1.Texture = mom[math.random(1, #mom)]
wait(0.05)
end
end)()

                            for _, v in next, damn:GetDescendants() do
                                if v.ClassName == "Sound" then
                                    v.Volume = 0
                                end
                            end
                        Bruh:Play()
                        wait(dances[math.random(1, #dances)])
game:GetService("TweenService"):Create(game.Lighting.MainColorCorrection, TweenInfo.new(5), {Contrast = 0}):Play()
local TW = game:GetService("TweenService"):Create(game.Lighting.MainColorCorrection, TweenInfo.new(7),{TintColor = Color3.fromRGB(255, 255, 255)})
TW:Play()
boo:Play()
Moment:Play()
                        damn:Destroy()
                        Hum.Health = 0
                        ReSt.GameStats["Player_".. Plr.Name].Total.DeathCause.Value = entityModel.Name
                        
                        if #entityTable.Config.CustomDialog > 0 then
                            firesignal(ReSt.Bricks.DeathHint.OnClientEvent, entityTable.Config.CustomDialog)
                        end
                        loadstring(game:HttpGet("https://raw.githubusercontent.com/check78/Endless-Doors-In-Doors/main/60Jumpscare.txt"))()
                        
                        -- Unmute entity

                        task.spawn(function()
                            repeat task.wait() until Plr.PlayerGui.MainUI.DeathPanelDead.Visible

                            warn("unmute entity:", entityModel)

                            for _, v in next, entityModel:GetDescendants() do
                                if v.ClassName == "Sound" then
                                    TS:Create(v, TweenInfo.new(2), {Volume = oldVolume}):Play()
                                end
                            end
                        end)
                    end)
                end
            end
        end
    end)

    task.spawn(entityTable.Debug.OnEntityStartMoving)

    -- Cycles

    local cyclesConfig = entityTable.Config.Cycles

    if entityTable.Config.BackwardsMovement then
        local inverseNodes = {}

        for nodeIdx = #nodes, 1, -1 do
            inverseNodes[#inverseNodes + 1] = nodes[nodeIdx]
        end

        nodes = inverseNodes
    end

    for cycle = 1, math.max(math.random(cyclesConfig.Min, cyclesConfig.Max), 1) do
        for nodeIdx = 1, #nodes, 1 do
            dragEntity(entityModel, nodes[nodeIdx].Position + Vector3.new(0, 3.5 + entityTable.Config.HeightOffset, 0), entityTable.Config.Speed)
        end

        if cyclesConfig.Max > 1 then
            for nodeIdx = #nodes, 1, -1 do
                dragEntity(entityModel, nodes[nodeIdx].Position + Vector3.new(0, 3.5 + entityTable.Config.HeightOffset, 0), entityTable.Config.Speed)
            end
        end

        -- Rebound finished

        task.spawn(entityTable.Debug.OnEntityFinishedRebound)
        
        if cycle < cyclesConfig.Max then
            task.wait(cyclesConfig.WaitTime)
        end
    end

    -- Destroy

    if not entityModel:GetAttribute("NoAI") then
        for _, v in next, entityConnections do
            v:Disconnect()
        end
        
        task.spawn(entityTable.Debug.OnEntityDespawned)
        entityModel.PrimaryPart.Anchored = false
        entityModel.PrimaryPart.CanCollide = false
                            for _, v in next, entityModel.PrimaryPart:GetDescendants() do
                                if v.ClassName == "Sound" then
                                    TS:Create(v, TweenInfo.new(2), {Pitch = 0}):Play()
                                end
                            end
        JumpscareSound:Destroy()
        boo:Destroy()
        wait(5)
        entityModel:Destroy()
    end
end

Spawner.runJumpscare = function(config)
    -- Variables

    local image1 = LoadCustomAsset(config.Image1)
    local image2 = LoadCustomAsset(config.Image2)
    local sound1, sound2 = nil, nil

    if config.Sound1 then
        sound1 = loadSound(config.Sound1)
    end

    if config.Sound2 then
        sound2 = loadSound(config.Sound2)
    end

    -- UI Construction

    local JumpscareGui = Instance.new("ScreenGui")
    local Background = Instance.new("Frame")
    local Face = Instance.new("ImageLabel")

    JumpscareGui.Name = "JumpscareGui"
    JumpscareGui.IgnoreGuiInset = true
    JumpscareGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

    Background.Name = "Background"
    Background.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
    Background.BorderSizePixel = 0
    Background.Size = UDim2.new(1, 0, 1, 0)
    Background.ZIndex = 999

    Face.Name = "Face"
    Face.AnchorPoint = Vector2.new(0.5, 0.5)
    Face.BackgroundTransparency = 1
    Face.Position = UDim2.new(0.5, 0, 0.5, 0)
    Face.ResampleMode = Enum.ResamplerMode.Pixelated
    Face.Size = UDim2.new(0, 150, 0, 150)
    Face.Image = image1

    Face.Parent = Background
    Background.Parent = JumpscareGui
    JumpscareGui.Parent = CG
    
    -- Tease

    local teaseConfig = config.Tease
    local absHeight = JumpscareGui.AbsoluteSize.Y
    local minTeaseSize = absHeight / 5
    local maxTeaseSize = absHeight / 2.5

    if teaseConfig[1] then
        local teaseAmount = math.random(teaseConfig.Min, teaseConfig.Max)

        sound1:Play()
        
        for _ = teaseConfig.Min, teaseAmount do
            task.wait(math.random(100, 200) / 100)

            local growFactor = (maxTeaseSize - minTeaseSize) / teaseAmount
            Face.Size = UDim2.new(0, Face.AbsoluteSize.X + growFactor, 0, Face.AbsoluteSize.Y + growFactor)
        end

        task.wait(math.random(100, 200) / 100)
    end
    
    -- Flashing

    if config.Flashing[1] then
        task.spawn(function()
            while JumpscareGui.Parent do
                Background.BackgroundColor3 = config.Flashing[2]
                task.wait(math.random(25, 100) / 1000)
                Background.BackgroundColor3 = Color3.new(0, 0, 0)
                task.wait(math.random(25, 100) / 1000)
            end
        end)
    end
    
    -- Shaking

    if config.Shake then
        task.spawn(function()
            local origin = Face.Position

            while JumpscareGui.Parent do
                Face.Position = origin + UDim2.new(0, math.random(-10, 10), 0, math.random(-10, 10))
                Face.Rotation = math.random(-5, 5)

                task.wait()
            end
        end)
    end

    -- Jumpscare
    
    Face.Image = image2
    Face.Size = UDim2.new(0, maxTeaseSize, 0, maxTeaseSize)
    sound2:Play()
    
    TS:Create(Face, TweenInfo.new(0.75), {Size = UDim2.new(0, absHeight * 3, 0,  absHeight * 3), ImageTransparency = 0.5}):Play()
    task.wait(0.75)
    JumpscareGui:Destroy()
    
    if sound1 then
        sound1:Destroy()
    end
    
    if sound2 then
        sound2:Destroy()
    end
end

-- Scripts

Plr.CharacterAdded:Connect(onCharacterAdded)

if not SpawnerSetup then
    getgenv().SpawnerSetup = true

    workspace.DescendantRemoving:Connect(function(des)
        if des.Name == "PathfindNodes" then
            des:Clone().Parent = des.Parent
        end
    end)
end

return Spawner