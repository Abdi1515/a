-- hotshot npc script by optdhs on discord

local myHuman = script.Parent:WaitForChild("Humanoid")
local myRoot = script.Parent:WaitForChild("HumanoidRootPart")
local myHead = script.Parent:WaitForChild("Head")
local myFace = myHead:WaitForChild("face")

local oldHealth = myHuman.Health
local fleeing = false
local fleeLength = 5
local fleeCountdown = fleeLength
local pathCount = 0 
local dead = false

local clone = script.Parent:Clone()

function getUnstuck()
	myHuman:Move(Vector3.new(math.random(-1,1),0,math.random(-1,1)))
	myHuman.Jump = true
	wait(0.5)
end

function pathToLocation(location)
	local path = game:GetService("PathfindingService"):CreatePath()
	path:ComputeAsync(myRoot.Position,location)
	local waypoints = path:GetWaypoints()
	pathCount = pathCount + 1
	
	if path.Status == Enum.PathStatus.Success then
		local currentPathCount = pathCount
		for i, waypoint in ipairs(waypoints) do
			if currentPathCount ~= pathCount then
				return
			end
			if waypoint.Action == Enum.PathWaypointAction.Jump then
				myHuman.Jump = true
			end
			myHuman:MoveTo(waypoint.Position)
			delay(0.5, function()
				if myHuman.WalkToPoint.Y > myRoot.Position.Y then
					myHuman.Jump = true
				end
			end)
			local moveSuccess = myHuman.MoveToFinished:Wait()
			if not moveSuccess then
				break
			end
			if fleeing == true then
				if i == #waypoints then
					wander()
				end
			end
		end
	else
		getUnstuck()
	end
end

function wander()
	local randX = math.random(-50,50)
	local randZ = math.random(-50,50)
	local goal = myRoot.Position + Vector3.new(randX,0,randZ)
	
	pathToLocation(goal)
end

function findThreat()
	local dist = 100
	local threat = nil
	for i,v in ipairs(workspace:GetChildren()) do
		local human = v:FindFirstChild("Humanoid")
		local torso = v:FindFirstChild("Torso") or v:FindFirstChild("HumanoidRootPart")
		if human and torso and v ~= script.Parent then
			if (myRoot.Position - torso.Position).Magnitude < dist then
				threat = torso
				dist = (myRoot.Position - torso.Position).Magnitude
			end
		end
	end
	return threat
end

function flee()
	local threat = findThreat()
	if threat then
		local cframe = myRoot.CFrame * CFrame.new((threat.Position - myRoot.Position).Unit * 50)
		spawn(function() pathToLocation(cframe.Position) end)
	else
		spawn(wander)
	end
	
	fleeCountdown = fleeLength
	if fleeing == false then
		fleeing = true
		myHuman.WalkSpeed = 16
		repeat
			wait(1)
			fleeCountdown = fleeCountdown - 1 
		until fleeCountdown <= 0 or myHuman.Health <= 0 
		if dead == false then
			myHuman.WalkSpeed = 16 
		end
		fleeing = false
	end
end

myHuman.Died:Connect(function()
	dead = true 
	wait(20)
	clone.Parent = workspace
	game:GetService("Debris"):AddItem(script.Parent,0.1)
end)

myHuman.HealthChanged:Connect(function(health)
	if dead == false then
		if health < oldHealth then
			flee()
		end
		oldHealth = health
	end
end)

while wait() do
	if myHuman.Health > 0 then
		if fleeing == false then
			wander()
			wait(math.random(1,5))
		end
	else
		break
	end
end

local Figure = script.Parent
local Torso = Figure:WaitForChild("Torso")
local RightShoulder = Torso:WaitForChild("Right Shoulder")
local LeftShoulder = Torso:WaitForChild("Left Shoulder")
local RightHip = Torso:WaitForChild("Right Hip")
local LeftHip = Torso:WaitForChild("Left Hip")
local Neck = Torso:WaitForChild("Neck")
local Humanoid = Figure:WaitForChild("Humanoid")
local pose = "Standing"

local currentAnim = ""
local currentAnimInstance = nil
local currentAnimTrack = nil
local currentAnimKeyframeHandler = nil
local currentAnimSpeed = 1.0
local animTable = {}
local animNames = { 
	idle = 	{	
				{ id = "http://www.roblox.com/asset/?id=180435571", weight = 9 },
				{ id = "http://www.roblox.com/asset/?id=180435792", weight = 1 }
			},
	walk = 	{ 	
				{ id = "http://www.roblox.com/asset/?id=180426354", weight = 10 } 
			}, 
	run = 	{
				{ id = "run.xml", weight = 10 } 
			}, 
	jump = 	{
				{ id = "http://www.roblox.com/asset/?id=125750702", weight = 10 } 
			}, 
	fall = 	{
				{ id = "http://www.roblox.com/asset/?id=180436148", weight = 10 } 
			}, 
	climb = {
				{ id = "http://www.roblox.com/asset/?id=180436334", weight = 10 } 
			}, 
	sit = 	{
				{ id = "http://www.roblox.com/asset/?id=178130996", weight = 10 } 
			},	
	toolnone = {
				{ id = "http://www.roblox.com/asset/?id=182393478", weight = 10 } 
			},
	toolslash = {
				{ id = "http://www.roblox.com/asset/?id=129967390", weight = 10 } 
--				{ id = "slash.xml", weight = 10 } 
			},
	toollunge = {
				{ id = "http://www.roblox.com/asset/?id=129967478", weight = 10 } 
			},
	wave = {
				{ id = "http://www.roblox.com/asset/?id=128777973", weight = 10 } 
			},
	point = {
				{ id = "http://www.roblox.com/asset/?id=128853357", weight = 10 } 
			},
	dance1 = {
				{ id = "http://www.roblox.com/asset/?id=182435998", weight = 10 }, 
				{ id = "http://www.roblox.com/asset/?id=182491037", weight = 10 }, 
				{ id = "http://www.roblox.com/asset/?id=182491065", weight = 10 } 
			},
	dance2 = {
				{ id = "http://www.roblox.com/asset/?id=182436842", weight = 10 }, 
				{ id = "http://www.roblox.com/asset/?id=182491248", weight = 10 }, 
				{ id = "http://www.roblox.com/asset/?id=182491277", weight = 10 } 
			},
	dance3 = {
				{ id = "http://www.roblox.com/asset/?id=182436935", weight = 10 }, 
				{ id = "http://www.roblox.com/asset/?id=182491368", weight = 10 }, 
				{ id = "http://www.roblox.com/asset/?id=182491423", weight = 10 } 
			},
	laugh = {
				{ id = "http://www.roblox.com/asset/?id=129423131", weight = 10 } 
			},
	cheer = {
				{ id = "http://www.roblox.com/asset/?id=129423030", weight = 10 } 
			},
}
local dances = {"dance1", "dance2", "dance3"}

-- Existance in this list signifies that it is an emote, the value indicates if it is a looping emote
local emoteNames = { wave = false, point = false, dance1 = true, dance2 = true, dance3 = true, laugh = false, cheer = false}

function configureAnimationSet(name, fileList)
	if (animTable[name] ~= nil) then
		for _, connection in pairs(animTable[name].connections) do
			connection:disconnect()
		end
	end
	animTable[name] = {}
	animTable[name].count = 0
	animTable[name].totalWeight = 0	
	animTable[name].connections = {}

	-- check for config values
	local config = script:FindFirstChild(name)
	if (config ~= nil) then
--		print("Loading anims " .. name)
		table.insert(animTable[name].connections, config.ChildAdded:connect(function(child) configureAnimationSet(name, fileList) end))
		table.insert(animTable[name].connections, config.ChildRemoved:connect(function(child) configureAnimationSet(name, fileList) end))
		local idx = 1
		for _, childPart in pairs(config:GetChildren()) do
			if (childPart:IsA("Animation")) then
				table.insert(animTable[name].connections, childPart.Changed:connect(function(property) configureAnimationSet(name, fileList) end))
				animTable[name][idx] = {}
				animTable[name][idx].anim = childPart
				local weightObject = childPart:FindFirstChild("Weight")
				if (weightObject == nil) then
					animTable[name][idx].weight = 1
				else
					animTable[name][idx].weight = weightObject.Value
				end
				animTable[name].count = animTable[name].count + 1
				animTable[name].totalWeight = animTable[name].totalWeight + animTable[name][idx].weight
	--			print(name .. " [" .. idx .. "] " .. animTable[name][idx].anim.AnimationId .. " (" .. animTable[name][idx].weight .. ")")
				idx = idx + 1
			end
		end
	end

	-- fallback to defaults
	if (animTable[name].count <= 0) then
		for idx, anim in pairs(fileList) do
			animTable[name][idx] = {}
			animTable[name][idx].anim = Instance.new("Animation")
			animTable[name][idx].anim.Name = name
			animTable[name][idx].anim.AnimationId = anim.id
			animTable[name][idx].weight = anim.weight
			animTable[name].count = animTable[name].count + 1
			animTable[name].totalWeight = animTable[name].totalWeight + anim.weight
--			print(name .. " [" .. idx .. "] " .. anim.id .. " (" .. anim.weight .. ")")
		end
	end
end

-- Setup animation objects
function scriptChildModified(child)
	local fileList = animNames[child.Name]
	if (fileList ~= nil) then
		configureAnimationSet(child.Name, fileList)
	end	
end

script.ChildAdded:connect(scriptChildModified)
script.ChildRemoved:connect(scriptChildModified)


for name, fileList in pairs(animNames) do 
	configureAnimationSet(name, fileList)
end	

-- ANIMATION

-- declarations
local toolAnim = "None"
local toolAnimTime = 0

local jumpAnimTime = 0
local jumpAnimDuration = 0.3

local toolTransitionTime = 0.1
local fallTransitionTime = 0.3
local jumpMaxLimbVelocity = 0.75

-- functions

function stopAllAnimations()
	local oldAnim = currentAnim

	-- return to idle if finishing an emote
	if (emoteNames[oldAnim] ~= nil and emoteNames[oldAnim] == false) then
		oldAnim = "idle"
	end

	currentAnim = ""
	currentAnimInstance = nil
	if (currentAnimKeyframeHandler ~= nil) then
		currentAnimKeyframeHandler:disconnect()
	end

	if (currentAnimTrack ~= nil) then
		currentAnimTrack:Stop()
		currentAnimTrack:Destroy()
		currentAnimTrack = nil
	end
	return oldAnim
end

function setAnimationSpeed(speed)
	if speed ~= currentAnimSpeed then
		currentAnimSpeed = speed
		currentAnimTrack:AdjustSpeed(currentAnimSpeed)
	end
end

function keyFrameReachedFunc(frameName)
	if (frameName == "End") then

		local repeatAnim = currentAnim
		-- return to idle if finishing an emote
		if (emoteNames[repeatAnim] ~= nil and emoteNames[repeatAnim] == false) then
			repeatAnim = "idle"
		end
		
		local animSpeed = currentAnimSpeed
		playAnimation(repeatAnim, 0.0, Humanoid)
		setAnimationSpeed(animSpeed)
	end
end

-- Preload animations
function playAnimation(animName, transitionTime, humanoid) 
		
	local roll = math.random(1, animTable[animName].totalWeight) 
	local origRoll = roll
	local idx = 1
	while (roll > animTable[animName][idx].weight) do
		roll = roll - animTable[animName][idx].weight
		idx = idx + 1
	end
--		print(animName .. " " .. idx .. " [" .. origRoll .. "]")
	local anim = animTable[animName][idx].anim

	-- switch animation		
	if (anim ~= currentAnimInstance) then
		
		if (currentAnimTrack ~= nil) then
			currentAnimTrack:Stop(transitionTime)
			currentAnimTrack:Destroy()
		end

		currentAnimSpeed = 1.0
	
		-- load it to the humanoid; get AnimationTrack
		currentAnimTrack = humanoid:LoadAnimation(anim)
		currentAnimTrack.Priority = Enum.AnimationPriority.Core
		 
		-- play the animation
		currentAnimTrack:Play(transitionTime)
		currentAnim = animName
		currentAnimInstance = anim

		-- set up keyframe name triggers
		if (currentAnimKeyframeHandler ~= nil) then
			currentAnimKeyframeHandler:disconnect()
		end
		currentAnimKeyframeHandler = currentAnimTrack.KeyframeReached:connect(keyFrameReachedFunc)
		
	end

end

-------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------

local toolAnimName = ""
local toolAnimTrack = nil
local toolAnimInstance = nil
local currentToolAnimKeyframeHandler = nil

function toolKeyFrameReachedFunc(frameName)
	if (frameName == "End") then
--		print("Keyframe : ".. frameName)	
		playToolAnimation(toolAnimName, 0.0, Humanoid)
	end
end


function playToolAnimation(animName, transitionTime, humanoid, priority)	 
		
		local roll = math.random(1, animTable[animName].totalWeight) 
		local origRoll = roll
		local idx = 1
		while (roll > animTable[animName][idx].weight) do
			roll = roll - animTable[animName][idx].weight
			idx = idx + 1
		end
--		print(animName .. " * " .. idx .. " [" .. origRoll .. "]")
		local anim = animTable[animName][idx].anim

		if (toolAnimInstance ~= anim) then
			
			if (toolAnimTrack ~= nil) then
				toolAnimTrack:Stop()
				toolAnimTrack:Destroy()
				transitionTime = 0
			end
					
			-- load it to the humanoid; get AnimationTrack
			toolAnimTrack = humanoid:LoadAnimation(anim)
			if priority then
				toolAnimTrack.Priority = priority
			end
			 
			-- play the animation
			toolAnimTrack:Play(transitionTime)
			toolAnimName = animName
			toolAnimInstance = anim

			currentToolAnimKeyframeHandler = toolAnimTrack.KeyframeReached:connect(toolKeyFrameReachedFunc)
		end
end

function stopToolAnimations()
	local oldAnim = toolAnimName

	if (currentToolAnimKeyframeHandler ~= nil) then
		currentToolAnimKeyframeHandler:disconnect()
	end

	toolAnimName = ""
	toolAnimInstance = nil
	if (toolAnimTrack ~= nil) then
		toolAnimTrack:Stop()
		toolAnimTrack:Destroy()
		toolAnimTrack = nil
	end


	return oldAnim
end

-------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------


function onRunning(speed)
	if speed > 0.01 then
		playAnimation("walk", 0.1, Humanoid)
		if currentAnimInstance and currentAnimInstance.AnimationId == "http://www.roblox.com/asset/?id=180426354" then
			setAnimationSpeed(speed / 14.5)
		end
		pose = "Running"
	else
		if emoteNames[currentAnim] == nil then
			playAnimation("idle", 0.1, Humanoid)
			pose = "Standing"
		end
	end
end

function onDied()
	pose = "Dead"
end

function onJumping()
	playAnimation("jump", 0.1, Humanoid)
	jumpAnimTime = jumpAnimDuration
	pose = "Jumping"
end

function onClimbing(speed)
	playAnimation("climb", 0.1, Humanoid)
	setAnimationSpeed(speed / 12.0)
	pose = "Climbing"
end

function onGettingUp()
	pose = "GettingUp"
end

function onFreeFall()
	if (jumpAnimTime <= 0) then
		playAnimation("fall", fallTransitionTime, Humanoid)
	end
	pose = "FreeFall"
end

function onFallingDown()
	pose = "FallingDown"
end

function onSeated()
	pose = "Seated"
end

function onPlatformStanding()
	pose = "PlatformStanding"
end

function onSwimming(speed)
	if speed > 0 then
		pose = "Running"
	else
		pose = "Standing"
	end
end

function getTool()	
	for _, kid in ipairs(Figure:GetChildren()) do
		if kid.className == "Tool" then return kid end
	end
	return nil
end

function getToolAnim(tool)
	for _, c in ipairs(tool:GetChildren()) do
		if c.Name == "toolanim" and c.className == "StringValue" then
			return c
		end
	end
	return nil
end

function animateTool()
	
	if (toolAnim == "None") then
		playToolAnimation("toolnone", toolTransitionTime, Humanoid, Enum.AnimationPriority.Idle)
		return
	end

	if (toolAnim == "Slash") then
		playToolAnimation("toolslash", 0, Humanoid, Enum.AnimationPriority.Action)
		return
	end

	if (toolAnim == "Lunge") then
		playToolAnimation("toollunge", 0, Humanoid, Enum.AnimationPriority.Action)
		return
	end
end

function moveSit()
	RightShoulder.MaxVelocity = 0.15
	LeftShoulder.MaxVelocity = 0.15
	RightShoulder:SetDesiredAngle(3.14 /2)
	LeftShoulder:SetDesiredAngle(-3.14 /2)
	RightHip:SetDesiredAngle(3.14 /2)
	LeftHip:SetDesiredAngle(-3.14 /2)
end

local lastTick = 0

function move(time)
	local amplitude = 1
	local frequency = 1
  	local deltaTime = time - lastTick
  	lastTick = time

	local climbFudge = 0
	local setAngles = false

  	if (jumpAnimTime > 0) then
  		jumpAnimTime = jumpAnimTime - deltaTime
  	end

	if (pose == "FreeFall" and jumpAnimTime <= 0) then
		playAnimation("fall", fallTransitionTime, Humanoid)
	elseif (pose == "Seated") then
		playAnimation("sit", 0.5, Humanoid)
		return
	elseif (pose == "Running") then
		playAnimation("walk", 0.1, Humanoid)
	elseif (pose == "Dead" or pose == "GettingUp" or pose == "FallingDown" or pose == "Seated" or pose == "PlatformStanding") then
--		print("Wha " .. pose)
		stopAllAnimations()
		amplitude = 0.1
		frequency = 1
		setAngles = true
	end

	if (setAngles) then
		local desiredAngle = amplitude * math.sin(time * frequency)

		RightShoulder:SetDesiredAngle(desiredAngle + climbFudge)
		LeftShoulder:SetDesiredAngle(desiredAngle - climbFudge)
		RightHip:SetDesiredAngle(-desiredAngle)
		LeftHip:SetDesiredAngle(-desiredAngle)
	end

	-- Tool Animation handling
	local tool = getTool()
	if tool and tool:FindFirstChild("Handle") then
	
		local animStringValueObject = getToolAnim(tool)

		if animStringValueObject then
			toolAnim = animStringValueObject.Value
			-- message recieved, delete StringValue
			animStringValueObject.Parent = nil
			toolAnimTime = time + .3
		end

		if time > toolAnimTime then
			toolAnimTime = 0
			toolAnim = "None"
		end

		animateTool()		
	else
		stopToolAnimations()
		toolAnim = "None"
		toolAnimInstance = nil
		toolAnimTime = 0
	end
end

-- connect events
Humanoid.Died:connect(onDied)
Humanoid.Running:connect(onRunning)
Humanoid.Jumping:connect(onJumping)
Humanoid.Climbing:connect(onClimbing)
Humanoid.GettingUp:connect(onGettingUp)
Humanoid.FreeFalling:connect(onFreeFall)
Humanoid.FallingDown:connect(onFallingDown)
Humanoid.Seated:connect(onSeated)
Humanoid.PlatformStanding:connect(onPlatformStanding)
Humanoid.Swimming:connect(onSwimming)

-- setup emote chat hook
--[[game:GetService("Players").LocalPlayer.Chatted:connect(function(msg)
	local emote = ""
	if msg == "/e dance" then
		emote = dances[math.random(1, #dances)]
	elseif (string.sub(msg, 1, 3) == "/e ") then
		emote = string.sub(msg, 4)
	elseif (string.sub(msg, 1, 7) == "/emote ") then
		emote = string.sub(msg, 8)
	end
	
	if (pose == "Standing" and emoteNames[emote] ~= nil) then
		playAnimation(emote, 0.1, Humanoid)
	end

end)--]]


-- main program

-- initialize to idle
playAnimation("idle", 0.1, Humanoid)
pose = "Standing"

while Figure.Parent ~= nil do
	local _, time = wait(0.1)
	move(time)
end

--Services--
local pathfindingService = game:GetService("PathfindingService")

--Modules--
local modules = script.Parent.Modules
local core = require(modules.Core)
local slingshot = require(modules.Slingshot)
local paintball = require(modules.Paintball)
local rocket = require(modules.Rocket)
local superball = require(modules.Superball)
local sword = require(modules.Sword)
local timebomb = require(modules.Timebomb)
local trowel = require(modules.Trowel)

local myHuman = script.Parent.Humanoid
local myRoot = script.Parent.HumanoidRootPart
local mySettings = script.Parent.Settings

while myRoot:GetNetworkOwnershipAuto() do
	myRoot:SetNetworkOwner(nil)
	wait()
end

local clone = script.Parent:Clone()

local currentTool = nil

local inventory = script.Parent.Inventory
local tools = {
	Paintball = {
		MinDist = 7,
		MaxDist = 40,
		Instance = inventory.LinkedPaintballGun,
		Handle = inventory.LinkedPaintballGun.Handle,
		CFrame = myRoot.CFrame:ToObjectSpace(inventory.LinkedPaintballGun.Handle.CFrame),
		Activate = function(handle,dir) paintball.Fire(handle,dir) end,
		Usable = true,
		Reload = 5
	},
	Rocket = {
		MinDist = 10,
		MaxDist = 40,
		Instance = inventory.LinkedRocketLauncher,
		Handle = inventory.LinkedRocketLauncher.Handle,
		CFrame = myRoot.CFrame:ToObjectSpace(inventory.LinkedRocketLauncher.Handle.CFrame),
		Activate = function(handle,dir) rocket.Fire(handle,dir) end,
		Usable = true,
		Reload = 5
	},
	Slingshot = {
		MinDist = 7,
		MaxDist = 30,
		Instance = inventory.LinkedSlingshot,
		Handle = inventory.LinkedSlingshot.Handle,
		CFrame = myRoot.CFrame:ToObjectSpace(inventory.LinkedSlingshot.Handle.CFrame),
		Activate = function(handle,dir) slingshot.Fire(handle,dir) end,
		Usable = true,
		Reload = 5
	},
	Superball = {
		MinDist = 7,
		MaxDist = 40,
		Instance = inventory.LinkedSuperball,
		Handle = inventory.LinkedSuperball.Handle,
		CFrame = myRoot.CFrame:ToObjectSpace(inventory.LinkedSuperball.Handle.CFrame),
		Activate = function(handle,dir) superball.Fire(handle,dir) end,
		Usable = true,
		Reload = 5
	},
	Sword = {
		MinDist = 0,
		MaxDist = 7,
		Instance = inventory.LinkedSword,
		Handle = inventory.LinkedSword.Handle,
		CFrame = myRoot.CFrame:ToObjectSpace(inventory.LinkedSword.Handle.CFrame),
		Activate = function(handle,dir) sword.Fire(handle,dir) end,
		Usable = true,
		Reload = 5
	},
	Timebomb = {
		MinDist = 0,
		MaxDist = 7,
		Instance = inventory.LinkedTimebomb,
		Handle = inventory.LinkedTimebomb.Handle,
		CFrame = myRoot.CFrame:ToObjectSpace(inventory.LinkedTimebomb.Handle.CFrame),
		Activate = function(handle,dir) timebomb.Fire(handle,dir) end,
		Usable = true,
		Reload = 5
	},
	Trowel = {
		MinDist = 10,
		MaxDist = 30,
		Instance = inventory.LinkedTrowel,
		Handle = inventory.LinkedTrowel.Handle,
		CFrame = myRoot.CFrame:ToObjectSpace(inventory.LinkedTrowel.Handle.CFrame),
		Activate = function(handle,dir) trowel.Fire(handle,dir) end,
		Usable = true,
		Reload = 5
	}
}

function unEquip()
	if currentTool then
		
		--Kill bot if tool is missing constraint
		--If constraint is missing likely the bot is missing arms and 
		--can't fight
		if not currentTool.Handle.WeldConstraint then
			myHuman.Health = 0
			return
		end
		wait(2)
		currentTool.Handle.Parent = script.Parent
		currentTool.Handle.Transparency = 1
		currentTool.Instance.Parent = inventory
		currentTool.Handle.CFrame = myRoot.CFrame * currentTool.CFrame
		currentTool.Handle.WeldConstraint.Enabled = true
		if currentTool == tools.Superball or currentTool == tools.Timebomb then
			currentTool.Handle.Size = Vector3.new(0.5,0.5,0.5)
			if currentTool == tools.Timebomb then
				currentTool.Handle.Mesh.Scale = Vector3.new(0.25,0.25,0.25)
			end
		end
		currentTool = nil
	end
end

function equip(tool)
	unEquip()
	
	--Kill bot if tool is missing constraint
	--If constraint is missing likely the bot is missing arms and 
	--can't fight
	if not tool.Handle:FindFirstChild("WeldConstraint") then
		myHuman.Health = 0
		return
	end
	wait(2)
	tool.Handle.Transparency = 0
	tool.Handle.WeldConstraint.Enabled = false
	tool.Handle.Parent = tool.Instance
	tool.Instance.Parent = script.Parent
	if tool == tools.Superball or tool == tools.Timebomb then
		tool.Handle.Size = Vector3.new(2,2,2)
		if tool == tools.Timebomb then
			tool.Handle.Mesh.Scale = Vector3.new(1,1,1)
		end
	end
	currentTool = tool
end

local target = nil
function updateTarget()
	local dist = mySettings.Distance.Value
	local tempTarget = nil
	for _,obj in ipairs(workspace:GetChildren()) do
		local human = obj:FindFirstChild("Humanoid")
		local ff = obj:FindFirstChild("ForceField")
		local root = obj:FindFirstChild("HumanoidRootPart") or obj:FindFirstChild("Torso")
		if not ff and human and human.Health>0 and root and obj ~= script.Parent then
			if not core.CheckTeam(obj) then
				local newDist = core.CheckDist(myRoot,root)
				if newDist < dist then
					dist = newDist
					tempTarget = root
				end
			end
		end
	end
	target = tempTarget
end

function determineTool()
	local dist = core.CheckDist(myRoot,target)
	local potentialTools = {}
	for _,tool in pairs(tools) do
		if dist < tool.MaxDist and dist > tool.MinDist then
			table.insert(potentialTools,tool)
		end
	end
	if #potentialTools > 0 then
		equip(potentialTools[math.random(#potentialTools)])
	end
end

function validateTool()
	local dist = core.CheckDist(myRoot,target)
	if currentTool and dist > currentTool.MinDist and dist < currentTool.MaxDist then
		return true
	end
	return false
end

function toolExist()
	if not currentTool.Handle.Parent or #currentTool.Handle:GetConnectedParts() < 2 then
		myHuman.Health = 0
		return false
	end
	
	return true
end

function movementHandler()
	while myHuman.Health>0 do
		if target then
			--action,critical,target,tool
			local dist = core.CheckDist(myRoot,target)
			if currentTool == tools.Sword then
				movement.Move("sword",false,target,currentTool)
			elseif (not currentTool or currentTool.MaxDist < dist) or not core.CheckSight(target) then
				movement.Move("target",false,target,currentTool)
			elseif math.random(3) ~= 1 then
				movement.Move("engage",false,target,currentTool)
			end
			wait(0.1)
		else
			wait(1)
		end
	end
end

function targetHandler()
	while myHuman.Health>0 do
		updateTarget()
		wait(3)
	end
end

function attack()
	if currentTool.Usable and currentTool.Handle.Parent and toolExist() then
		
		currentTool.Usable = false
		currentTool.Activate(currentTool.Handle,target.Position)
		
		
		core.Spawner(function()
			local tool = currentTool
			wait(tool.Reload)
			tool.Usable = true
		end)
		
		--action,critical,target,tool
		if currentTool == tools.Timebomb then
			movement.Move("flee",true,target,currentTool)
		end
		
		--For longer reload consider switching
		if target then
			if currentTool.Reload > 1 and math.random(2) == 1 then
				determineTool()
			elseif math.random(5) == 1 then
				--Consider switching tool sometimes anyways
				determineTool()
			end
		end
	end
end

function attackingLogic()
	while myHuman.Health>0 do
		if target then
			if not validateTool() then
				determineTool()
			end
			if currentTool and core.CheckSight(target) then
				attack()
			end
			wait(math.random(10)/10)
		else
			unEquip()
			wait(1)
		end
	end
end

--Put tool handles into our main model for better damage detection.
for i,v in pairs(tools) do
	v.Handle.Parent = script.Parent
end

core.Spawn()

core.Spawner(movementHandler)
core.Spawner(targetHandler)
core.Spawner(attackingLogic)

myHuman.Died:Connect(function()
	wait(mySettings.Respawn.Time.Value)
	if mySettings.Respawn.Value then
		clone.Parent = script.Parent.Parent
	end
	script.Parent:Destroy()
end)

--If any bodypart is blown off reset. 
--[[
local criticalParts = {}
for i,v in ipairs(script.Parent:GetDescendants()) do
	if v:IsA("BasePart") then
		table.insert(criticalParts,v)
	end
end
myHuman.HealthChanged:Connect(function()
	for i,v in ipairs(criticalParts) do
		if not v.Parent then
			myHuman.Health = 0
		end
	end
	if math.random(3) == 1 then
		myHuman.Jump = true
	end
end)--]]

local Char=script.Parent
local Hum=Char:WaitForChild("Humanoid")
local Tor=Char:WaitForChild("Torso")
local M=math.random
local R=math.rad
local rates={0.05,0.075,0.1,0.15}

local smooth=function(P)
local SM=Enum.SurfaceType.SmoothNoOutlines
P.TopSurface=SM
P.BottomSurface=SM
P.RightSurface=SM
P.LeftSurface=SM
P.FrontSurface=SM
P.BackSurface=SM	
end

local function BloodPool(Part,Size)
local Pool=Instance.new("Part",game.Workspace)
Pool.TopSurface=0
Pool.CanCollide=false
Pool.BrickColor=BrickColor.new("Crimson")
local SphereMesh=Instance.new("SpecialMesh",Pool)
SphereMesh.MeshType = ("Sphere")
Pool.Anchored=true
Pool.Name="BloodPoolPart"
smooth(Pool)
Pool.FormFactor=Enum.FormFactor.Custom
Pool.Size=Size
Pool.Transparency = 0.2
Pool.Reflectance = 0.1
Pool.Material = ("Glass")
local c=Part.CFrame*CFrame.new(M(-3.01,3.01),-2.9,M(-3.01,3.01))	
coroutine.resume(coroutine.create(function()
local rate=rates[M(1,#rates)]
game.Debris:AddItem(Pool,15)
for i=1,M(25,70) do
wait()
Pool.CFrame=c
Pool.Size=Pool.Size+Vector3.new(rate,0,rate)
end	
wait(5)
Pool:Destroy()
end))	
end

local function BloodDrops(Size,Area)
local Blood=Instance.new("Part",game.Workspace)
local DripMesh=Instance.new("SpecialMesh",Blood)
DripMesh.MeshType = ("Sphere")
Blood.BrickColor=BrickColor.new("Crimson")
Blood.TopSurface=0
Blood.CanCollide=false
Blood.Anchored=false
Blood.FormFactor=Enum.FormFactor.Custom
Blood.Size=Size
Blood.CFrame=Area*CFrame.new(M(-1.00,1.00),M(-1.00,1.00),M(-1.00,1.00))
Blood.Transparency = 0.2
Blood.Reflectance = 0.2	
return Blood
end


local Heath=Hum.Health

Hum.Changed:connect(function()
if Hum.Health<Heath then
Heath=Hum.Health		
for i=1, math.random(4,10)do
local Size=Vector3.new(M(-0.25,0.25),.2,M(-.25,.25))
local Blood=BloodDrops(Size,Tor.CFrame)	
local Stopper=false
local Size2=Vector3.new(M(-0.25,0.25),.2,M(-.25,.25))
BloodPool(Tor,Size2)	
end	
end
end)

function onDeath()
	local texture = "rbxassetid://4841508676"
	script.Parent.Head.face.Texture = texture
end

script.Parent.Humanoid.Died:Connect(onDeath)

--Put this inside the NPC you want to ragdoll on death
--Made by Yabsor

local Humanoid = script.Parent:FindFirstChild("Humanoid")
local Head = script.Parent:FindFirstChild("Head")
local RightArm = script.Parent:FindFirstChild("Right Arm")
local RightLeg = script.Parent:FindFirstChild("Right Leg")
local LeftArm = script.Parent:FindFirstChild("Left Arm")
local LeftLeg = script.Parent:FindFirstChild("Left Leg")
local Torso = script.Parent:FindFirstChild("Torso")
Humanoid.BreakJointsOnDeath = false

local NewTorsoToHead1 = Instance.new("Attachment") --Head 1
NewTorsoToHead1.Position = Vector3.new(0, -0.6, 0)
NewTorsoToHead1.Name = "TorsoToHead1"
NewTorsoToHead1.Parent = Head

local NewTorsoToRightArm1 = Instance.new("Attachment") --Right arm 1
NewTorsoToRightArm1.Position = Vector3.new(-0.5, 0.5, 0)
NewTorsoToRightArm1.Name = "TorsoToRightArm1"
NewTorsoToRightArm1.Parent = RightArm

local NewTorsoToRightLeg1 = Instance.new("Attachment") --Right leg 1
NewTorsoToRightLeg1.Position = Vector3.new(0, 1, 0)
NewTorsoToRightLeg1.Name = "TorsoToRightLeg1"
NewTorsoToRightLeg1.Parent = RightLeg

local NewTorsoToLeftArm1 = Instance.new("Attachment") --Left arm 1
NewTorsoToLeftArm1.Position = Vector3.new(0.5, 0.5, 0)
NewTorsoToLeftArm1.Name = "TorsoToLeftArm1"
NewTorsoToLeftArm1.Parent = LeftArm

local NewTorsoToLeftLeg1 = Instance.new("Attachment") --Left leg 1
NewTorsoToLeftLeg1.Position = Vector3.new(0, 1, 0)
NewTorsoToLeftLeg1.Name = "TorsoToLeftLeg1"
NewTorsoToLeftLeg1.Parent = LeftLeg

--------------------------------------------------------------------

local NewTorsoToHead0 = Instance.new("Attachment") --Head 0
NewTorsoToHead0.Position = Vector3.new(0, 1, 0)
NewTorsoToHead0.Name = "TorsoToHead0"
NewTorsoToHead0.Parent = Torso

local NewTorsoToRightArm0 = Instance.new("Attachment") --Right arm 0
NewTorsoToRightArm0.Position = Vector3.new(1, 0.5, 0)
NewTorsoToRightArm0.Name = "TorsoToRightArm0"
NewTorsoToRightArm0.Parent = Torso

local NewTorsoToRightLeg0 = Instance.new("Attachment") --Right leg 0
NewTorsoToRightLeg0.Position = Vector3.new(0.5, -1, 0)
NewTorsoToRightLeg0.Name = "TorsoToRightArm0"
NewTorsoToRightLeg0.Parent = Torso

local NewTorsoToLeftArm0 = Instance.new("Attachment") --Left arm 0
NewTorsoToLeftArm0.Position = Vector3.new(-1, 0.5, 0)
NewTorsoToLeftArm0.Name = "TorsoToLeftArm0"
NewTorsoToLeftArm0.Parent = Torso

local NewTorsoToLeftLeg0 = Instance.new("Attachment") --Left leg 0
NewTorsoToLeftLeg0.Position = Vector3.new(-0.5, -1, 0)
NewTorsoToLeftLeg0.Name = "TorsoToLeftLeg0"
NewTorsoToLeftLeg0.Parent = Torso

Humanoid.Died:Connect(function() --Death
	local function CreateBallSocket(Attachment0, Attachment1, TwistLowerAngle, TwistUpperAngle)
		local BallSocket = Instance.new("BallSocketConstraint")
		BallSocket.Attachment0 = Attachment0
		BallSocket.Attachment1 = Attachment1
		BallSocket.LimitsEnabled = true
		BallSocket.TwistLimitsEnabled = true
		BallSocket.TwistLowerAngle = TwistLowerAngle
		BallSocket.TwistUpperAngle = TwistUpperAngle
		BallSocket.MaxFrictionTorque = 10
		BallSocket.Parent = Torso
	end
	CreateBallSocket(NewTorsoToHead0, NewTorsoToHead1, -45, 45)
	CreateBallSocket(NewTorsoToRightArm0, NewTorsoToRightArm1, 45, 0)
	CreateBallSocket(NewTorsoToLeftArm0, NewTorsoToLeftArm1, 0, 45)
	CreateBallSocket(NewTorsoToRightLeg0, NewTorsoToRightLeg1, -45, 45)
	CreateBallSocket(NewTorsoToLeftLeg0, NewTorsoToLeftLeg1, -45, 45)
	Torso.Parent.HumanoidRootPart:Destroy()

	local LeftHip = Torso:FindFirstChild("Left Hip")
	if LeftHip then
		LeftHip:Destroy()
	end
	local LeftShoulder = Torso:FindFirstChild("Left Shoulder")
	if LeftShoulder then
		LeftShoulder:Destroy()
	end
	local Neck = Torso:FindFirstChild("Neck")
	if Neck then
		Neck:Destroy()
	end
	local RightShoulder = Torso:FindFirstChild("Right Shoulder")
	if RightShoulder then
		RightShoulder:Destroy()
	end
	local RightHip = Torso:FindFirstChild("Right Hip")
	if RightHip then
		RightHip:Destroy()
	end
end)

game.Players.PlayerAdded:Connect(function(player)
	player.Chatted:Connect(function(msg)
		if msg == "hello" or "hi" or "Hello" or "Hi" or "sup" or "Sup" or "wsg" or "hey" or "Hey" then --you can add or and put another message to say like or "sup"
			wait(1) --change it to how much time you want the npc to respond in
			game:GetService("Chat"):Chat(script.Parent.Head, "Hello, "..player.Name.."", Enum.ChatColor.Blue) --change "hi" to what you want the npc to respond with. also its gonna say hi and the player who chatted's name when you put ..player.Name... 
            wait(1)
            game:GetService("Chat"):Chat(script.Parent.Head, "I must reach an higher Dimension!", Enum.ChatColor.Blue) --change "hi" to what you want the npc to respond with. also its gonna say hi and the player who chatted's name when you put ..player.Name... 
		end
	end)
end)

--Universal Respawn Script by iiMayk.

local Copy = script.Parent:Clone()
local NPC = script.Parent
local Humanoid
for i,v in pairs(NPC:GetChildren()) do 
	if v:IsA('Humanoid') then 
		Humanoid = v 
	end 
end

if Humanoid then
	Humanoid.Died:Connect(function()
		wait(5)
		Copy.Parent = NPC.Parent
		Copy:MakeJoints()
		NPC:Destroy()
	end)
else
	warn('Cannot find Humanoid in Respawn Script!')
end

while true do 
	wait(1)
	while script.Parent.HumanoidRootPart:GetNetworkOwnershipAuto() do
	script.Parent.HumanoidRootPart:SetNetworkOwner(nil)
	wait()
end
end

---This server script creates the sounds and also exists so that it can be easily copied into an NPC and create sounds for that NPC. 
--Remove the local script if you copy this into an NPC.

function waitForChild(parent, childName)
	local child = parent:findFirstChild(childName)
	if child then return child end
	while true do
		child = parent.ChildAdded:wait()
		if child.Name==childName then return child end
	end
end

function newSound(name, id)
	local sound = Instance.new("Sound")
	sound.SoundId = id
	sound.Name = name
	sound.archivable = false
	sound.Parent = script.Parent.Head
	return sound
end

-- declarations

local sGettingUp = newSound("GettingUp", "rbxasset://sounds/action_get_up.mp3")
local sDied = newSound("Died", "rbxasset://sounds/uuhhh.mp3") 
local sFreeFalling = newSound("FreeFalling", "rbxasset://sounds/action_falling.mp3")
local sJumping = newSound("Jumping", "rbxasset://sounds/action_jump.mp3")
local sLanding = newSound("Landing", "rbxasset://sounds/action_jump_land.mp3")
local sSplash = newSound("Splash", "rbxasset://sounds/impact_water.mp3")
local sRunning = newSound("Running", "rbxasset://sounds/action_footsteps_plastic.mp3")
sRunning.Looped = true
local sSwimming = newSound("Swimming", "rbxasset://sounds/action_swim.mp3")
sSwimming.Looped = true
local sClimbing = newSound("Climbing", "rbxasset://sounds/action_footsteps_plastic.mp3")
sClimbing.Looped = true

local Figure = script.Parent
local Head = waitForChild(Figure, "Head")
local Humanoid = waitForChild(Figure, "Humanoid")
local hasPlayer = game.Players:GetPlayerFromCharacter(script.Parent)
local filteringEnabled = game.Workspace.FilteringEnabled

local prevState = "None"

-- functions

function onDied()
	stopLoopedSounds()
	sDied:Play()
end

local fallCount = 0
local fallSpeed = 0
function onStateFall(state, sound)
	fallCount = fallCount + 1
	if state then
		sound.Volume = 0
		sound:Play()
		Spawn( function()
			local t = 0
			local thisFall = fallCount
			while t < 1.5 and fallCount == thisFall do
				local vol = math.max(t - 0.3 , 0)
				sound.Volume = vol
				wait(0.1)
				t = t + 0.1
			end
		end)
	else
		sound:Stop()
	end
	fallSpeed = math.max(fallSpeed, math.abs(Head.Velocity.Y))
end


function onStateNoStop(state, sound)
	if state then
		sound:Play()
	end
end


function onRunning(speed)
	sClimbing:Stop()
	sSwimming:Stop()
	if (prevState == "FreeFall" and fallSpeed > 0.1) then
		local vol = math.min(1.0, math.max(0.0, (fallSpeed - 50) / 110))
		sLanding.Volume = vol
		sLanding:Play()
		fallSpeed = 0
	end
	if speed>0.5 then
		sRunning:Play()
		sRunning.Pitch = speed / 8.0
	else
		sRunning:Stop()
	end
	prevState = "Run"
end

function onSwimming(speed)
	if (prevState ~= "Swim" and speed > 0.1) then
		local volume = math.min(1.0, speed / 350)
		sSplash.Volume = volume
		sSplash:Play()
		prevState = "Swim"
	end
	sClimbing:Stop()
	sRunning:Stop()
	sSwimming.Pitch = 1.6
	sSwimming:Play()
end

function onClimbing(speed)
	sRunning:Stop()
	sSwimming:Stop()	
	if speed>0.01 then
		sClimbing:Play()
		sClimbing.Pitch = speed / 5.5
	else
		sClimbing:Stop()
	end
	prevState = "Climb"
end
-- connect up

function stopLoopedSounds()
	sRunning:Stop() 
	sClimbing:Stop()
	sSwimming:Stop()
end

if hasPlayer == nil then
	Humanoid.Died:connect(onDied)
	Humanoid.Running:connect(onRunning)
	Humanoid.Swimming:connect(onSwimming)
	Humanoid.Climbing:connect(onClimbing)
	Humanoid.Jumping:connect(function(state) onStateNoStop(state, sJumping) prevState = "Jump" end)
	Humanoid.GettingUp:connect(function(state) stopLoopedSounds() onStateNoStop(state, sGettingUp) prevState = "GetUp" end)
	Humanoid.FreeFalling:connect(function(state) stopLoopedSounds() onStateFall(state, sFreeFalling) prevState = "FreeFall" end)
	Humanoid.FallingDown:connect(function(state) stopLoopedSounds() end)
	Humanoid.StateChanged:connect(function(old, new) 
		if not (new.Name == "Dead" or 
				new.Name == "Running" or 
				new.Name == "RunningNoPhysics" or 
				new.Name == "Swimming" or 
				new.Name == "Jumping" or 
				new.Name == "GettingUp" or 
				new.Name == "Freefall" or 
				new.Name == "FallingDown") then
			stopLoopedSounds()
		end
	end)
end

