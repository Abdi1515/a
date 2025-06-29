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

----Variables:
local MapBounds = {Vector2.new(0,0),Vector2.new(100,100)} --x,y = x,z in 3d
local MaxHeight	= 100
----Functions:
local function getHeightAtPoint(position : Vector2)
	local Pos3D  = Vector3.new(position.X,MaxHeight,position.Y)
	local result = workspace:Raycast(Pos3D,Vector3.new(0,-1,0)*(MaxHeight*1.1),)
	
	if result and result.Position then
		return result.Position.Y
	end
end

local function getRandomPosition()
	local randX  = math.random(MapBounds[1].X,MapBounds[2].X)
	local randZ  = math.random(MapBounds[1].Y,MapBounds[2].Y)
	local height = getHeightAtPoint(Vector2.new(randX,randZ))
	
	if not height then error("no height found") end 
	
	return Vector3.new(randX,height+1,randZ)
end

while true do
	script.Parent:MoveTo(getRandomPosition())
	script.Parent.MoveToFinished:Wait()
end
