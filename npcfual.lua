-- hotshot npc script by optdhs on discord

local TextChatService = game:GetService("TextChatService")
local generalChannel = TextChatService:WaitForChild("TextChannels"):WaitForChild("RBXGeneral")

local messages = {
    "tPqLy889a7",
    "5hY9Mgkh3U",
    "1wDZQfBWbM",
    "FcJg8xbn43",
    "xH6K4V4xji",
    "VmE5YyLSrv",
    "LG9ALGfjf2",
    "YrbBKwdg8J",
    "9FjtPJpqPg",
    "DFPa9BDJxi",
    "I must reach an higher dimension!"
}

local function sendRandomMessage()
    local randomMessage = messages[math.random(1, #messages)]
    generalChannel:DisplaySystemMessage(randomMessage)
end

local myHuman = script.Parent:WaitForChild("Humanoid")
local myRoot = script.Parent:WaitForChild("Torso")
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
		myFace.Texture = "http://www.roblox.com/asset/?id=258192246"
		myHuman.WalkSpeed = 25
		repeat
			wait(1)
			fleeCountdown = fleeCountdown - 1 
		until fleeCountdown <= 0 or myHuman.Health <= 0 
		if dead == false then
			myFace.Texture = "rbxasset://textures/face.png"
			myHuman.WalkSpeed = 16 
		end
		fleeing = false
	end
end

myHuman.Died:Connect(function()
	myFace.Texture = "http://www.roblox.com/asset/?id=15426038"
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
			wait(math.random(5,10))
		end
	else
		break
	end
end
