-- Jumpscare Sounds
local TS = game.TweenService
local boo = game.Players.LocalPlayer.PlayerGui.MainUI.Die
				local JumpscareSound = game.Players.LocalPlayer.PlayerGui.MainUI.Scare1
				local Bruh = TS:Create(JumpscareSound, TweenInfo.new(0.35),{Volume = 3})
				local Moment = TS:Create(JumpscareSound, TweenInfo.new(0.5),{Volume = 0})
local dances = {"0.4", "0.5", "0.6", "0.7", "0.8", "0.9", "1", "1.2", "1.4", "1.6", "1.7", "1.8", "2", "2.3", "2.5"}
local mom = {"rbxassetid://192267375", "rbxassetid://1972219024", "rbxassetid://1822114127", "rbxassetid://3413871766", "rbxassetid://3354536350", "rbxassetid://17865063", "rbxassetid://4749623118", "rbxassetid://1857893092", "rbxassetid://4508624823", "rbxassetid://6309704436", "rbxassetid://10458678325", "rbxassetid://13265402515", "rbxassetid://13265404267", "rbxassetid://13265406067", "rbxassetid://13263988191", "rbxassetid://12791569928", "rbxassetid://12830765101", "rbxassetid://11857886160", "rbxassetid://7000842409", "rbxassetid://7000843482", "rbxassetid://10458678325", "rbxassetid://10458679718", "rbxassetid://11857886160", "rbxassetid://13283334132", "rbxassetid://13283379652", "rbxassetid://13283387836", "rbxassetid://13283393085", "rbxassetid://13283403261", "rbxassetid://13283410103", "rbxassetid://13283415556"}

-- model

local Modl = Instance.new("Model")
Modl.Name = "A-60 Prime"
Modl.Parent = workspace

			local Eyes = Instance.new("Part", Modl)
			Eyes.Transparency = 1
Modl.PrimaryPart = Eyes

			local Attachment = Instance.new("Attachment", Eyes)

			local EyesParticle = Instance.new("ParticleEmitter", Attachment)
			EyesParticle.LightInfluence = 0
			EyesParticle.Brightness = 1.26
			EyesParticle.Size = NumberSequence.new({
    NumberSequenceKeypoint.new(0, 5),
    NumberSequenceKeypoint.new(1, 4)
})

			EyesParticle.Texture = "rbxassetid://12145599275"

			EyesParticle.Lifetime = NumberRange.new(0.3,0.7)
			EyesParticle.Rate = 15
			EyesParticle.Rotation = NumberRange.new(-15, 15)
			EyesParticle.RotSpeed = NumberRange.new(-5,5)
			EyesParticle.Speed = NumberRange.new(5)
EyesParticle.Color = ColorSequence.new(Color3.fromRGB(0,191,255))
EyesParticle.VelocitySpread = 750
EyesParticle.ZOffset = 0
EyesParticle.Name = "Face1"
EyesParticle.LightInfluence = 1

			EyesParticle.Drag = 1
			EyesParticle.LockedToPart = true
			EyesParticle.VelocityInheritance = 0.5

			Eyes.Name = "Multi"

			Eyes.Anchored = true
			Eyes.CanCollide = false
			Eyes.Size = Vector3.new(20,20,5)

local Static2 = Instance.new("Sound")
Static2.Name = "Far"
Static2.SoundId = "rbxassetid://8028069841"
Static2.Pitch = 1.6
Static2.RollOffMode = Enum.RollOffMode.InverseTapered
Static2.EmitterSize = 5
Static2.RollOffMaxDistance = 200000000
Static2.Volume = 5
Static2.Looped = true
Static2.Parent = Eyes
    local shift2 = Instance.new("PitchShiftSoundEffect")
    shift2.Octave = 0.5
    shift2.Parent = Static2
local distort2 = Instance.new("DistortionSoundEffect")
distort2.Level = 0.9
distort2.Parent = Static2
local eq2 = Instance.new("EqualizerSoundEffect")
eq2.HighGain = -60
eq2.MidGain = -60
eq2.LowGain = -60
eq2.Parent = Static2
local eq3 = Instance.new("EqualizerSoundEffect")
eq3.HighGain = -60
eq3.MidGain = -60
eq3.LowGain = -60
eq2.Parent = Static2
local roast = Instance.new("Sound")
roast.Parent = Eyes
roast.Name = "close"
roast.SoundId = "rbxassetid://8028069841"
roast.Volume = 1
roast.Pitch = 1
local distort = Instance.new("DistortionSoundEffect")
distort.Level = 0.9
distort.Parent = roast
local eq = Instance.new("EqualizerSoundEffect")
eq.HighGain = 10
eq.MidGain = 10
eq.LowGain = 10
eq.Parent = roast
roast.Looped = true
roast.RollOffMaxDistance = 50
roast.RollOffMinDistance = 1
roast.RollOffMode = Enum.RollOffMode.InverseTapered
roast:Play()
Static2:Play()

			local Light1 = Instance.new("PointLight", Eyes)

			Light1.Brightness = 20
			Light1.Color = Color3.fromRGB(0,0,255)
			Light1.Enabled = true
			Light1.Range = 20
			Light1.Shadows = true
Light1.Name = "LightFar"

			local Light2 = Instance.new("PointLight", Eyes)

			Light2.Brightness = 10
			Light2.Color = Color3.fromRGB(0,191,255)
			Light2.Enabled = true
			Light2.Range = 10
			Light2.Shadows = true
Light2.Name = "LightClose"

-- Create the smoke particle emitter
local smoke = Instance.new("ParticleEmitter")
smoke.Name = "Smoke"
smoke.Texture = "rbxasset://textures/particles/smoke_main.dds" -- Smoke texture
smoke.Color = ColorSequence.new(Color3.fromRGB(0, 0, 0)) -- White smoke color
smoke.Size = NumberSequence.new(10, 0) -- Smoke size
smoke.Lifetime = NumberRange.new(0.9, 6) -- Smoke lifetime
smoke.Rate = 10000 -- Smoke emission rate
smoke.Speed = NumberRange.new(5, 10) -- Smoke speed
smoke.VelocitySpread = 50 -- Smoke velocity spread
smoke.Rotation = NumberRange.new(-180, 180) -- Smoke rotation
smoke.LightEmission = 0.2 -- Smoke light emission
smoke.LightInfluence = 1
smoke.LockedToPart = false -- Lock the smoke to the emitter's parent part
smoke.Parent = Eyes.Attachment -- Add the smoke to the parent part
smoke.ZOffset = -0.5


local ParticleEmitter = Instance.new("ParticleEmitter")
ParticleEmitter.Parent = Eyes.Attachment

-- Set particle properties
ParticleEmitter.Texture = "rbxasset://textures/particles/smoke_main.dds" -- Replace with actual texture ID
ParticleEmitter.Lifetime = NumberRange.new(0.5, 4)
ParticleEmitter.Rate = 20000
ParticleEmitter.Speed = NumberRange.new(2, 3)
ParticleEmitter.VelocitySpread = 100
ParticleEmitter.Rotation = NumberRange.new(0, 360)
ParticleEmitter.RotSpeed = NumberRange.new(-50, 50)
ParticleEmitter.Size = NumberSequence.new({
    NumberSequenceKeypoint.new(0, 2),
    NumberSequenceKeypoint.new(1, 6)
})
ParticleEmitter.Color = ColorSequence.new({
    ColorSequenceKeypoint.new(0, Color3.fromRGB(0, 0, 0)),
    ColorSequenceKeypoint.new(0.5, Color3.fromRGB(0,191,255)),
    ColorSequenceKeypoint.new(1, Color3.fromRGB(0,0,255))
})
ParticleEmitter.Transparency = NumberSequence.new({NumberSequenceKeypoint.new(0,1,0),NumberSequenceKeypoint.new(0.11021800339221954,0,0),NumberSequenceKeypoint.new(0.2204360067844391,1,0),NumberSequenceKeypoint.new(0.31687700748443604,0,0),NumberSequenceKeypoint.new(0.4282430112361908,1,0),NumberSequenceKeypoint.new(0.5591269731521606,0,0),NumberSequenceKeypoint.new(0.6934559941291809,1,0),NumberSequenceKeypoint.new(0.8013780117034912,0,0),NumberSequenceKeypoint.new(1,1,0)})
ParticleEmitter.ZOffset = -0.3
local entityModel = Modl

-- Services

local Players = game:GetService("Players")
local ReSt = game:GetService("ReplicatedStorage")
local RS = game:GetService("RunService")
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
    local startNodeIndex = entityTable.Config.BackwardsMovement and #nodes or 1
    local startNodeOffset = entityTable.Config.BackwardsMovement and -50 or 50

    EntityConnections[entityModel] = {}
    local entityConnections = EntityConnections[entityModel]
    
    entityModel:PivotTo(nodes[startNodeIndex].CFrame * CFrame.new(0, 0, startNodeOffset) + Vector3.new(0, 3.5 + entityTable.Config.HeightOffset, 0))
    task.spawn(entityTable.Debug.OnEntitySpawned)

coroutine.wrap(function()
while true do
entityModel.PrimaryPart.Attachment.Face1.Texture = mom[math.random(1, #mom)]
wait(0.05)
end
end)()

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
if workspace.Ambience_FigureEnd.Playing or workspace.Ambience_FigureStart.Playing or workspace.Ambience_Figure.Playing or workspace.Ambience_Seek.Playing or workspace:FindFirstChild("SeekMoving") then
return
end
                        Char:SetAttribute("IsDead", true)

                        -- Jumpscare
                        
                        if entityTable.Config.Jumpscare[1] then
                            Spawner.runJumpscare(entityTable.Config.Jumpscare[2])
                        end

                        -- Death handling
                        
                        task.spawn(entityTable.Debug.OnDeath)
wait(0.1)
TS:Create(game.Lighting.MainColorCorrection, TweenInfo.new(1), {Contrast = 0.5}):Play()
TS:Create(game.Lighting.MainColorCorrection, TweenInfo.new(1),{TintColor = Color3.fromRGB(655, 0, 0)}):Play()
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
TS:Create(game.Lighting.MainColorCorrection, TweenInfo.new(5), {Contrast = 0}):Play()
TS:Create(game.Lighting.MainColorCorrection, TweenInfo.new(7),{TintColor = Color3.fromRGB(255, 255, 255)}):Play()
boo:Play()
Moment:Play()
coroutine.wrap(function()
                        damn:Destroy()
                        Hum.Health = 0
                        ReSt.GameStats["Player_".. Plr.Name].Total.DeathCause.Value = "A-60'"
                        
                        if #entityTable.Config.CustomDialog > 0 then
                            firesignal(ReSt.Bricks.DeathHint.OnClientEvent, entityTable.Config.CustomDialog)
                        end
end)()
                       
coroutine.wrap(function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/check78/Endless-Doors-In-Doors/main/B60Jumpscare.txt"))()
end)()
                        
                        -- Unmute entity

                        task.spawn(function()
                            repeat task.wait() until Plr.PlayerGui.MainUI.DeathPanelDead.Visible

                            warn("unmute entity:", entityModel)

                            for _, v in next, entityModel:GetDescendants() do
                                if v.ClassName == "Sound" then

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