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

local CurrentPart = nil
local MaxInc = 16

function onTouched(hit)
	if hit.Parent == nil then
		return
	end

	local humanoid = hit.Parent:findFirstChild("Humanoid")

	if humanoid == nil then
		CurrentPart = hit
	end
end

function waitForChild(parent, childName)
	local child = parent:findFirstChild(childName)

	if child then
		return child
	end

	while true do
		print(childName)

		child = parent.ChildAdded:wait()

		if child.Name==childName then
			return child
		end
	end
end

local Figure = script.Parent
local Humanoid = waitForChild(Figure, "Humanoid")
local Torso = waitForChild(Figure, "Torso")
local Left = waitForChild(Figure, "Left Leg")
local Right = waitForChild(Figure, "Right Leg")

Humanoid.Jump = true

Left.Touched:connect(onTouched)
Right.Touched:connect(onTouched)

while true do
	wait(math.random(2, 6))

	if CurrentPart ~= nil then
		if math.random(1, 2) == 1 then
			Humanoid.Jump = true
		end

		Humanoid:MoveTo(Torso.Position + Vector3.new(math.random(-MaxInc, MaxInc), 0, math.random(-MaxInc, MaxInc)), CurrentPart)
	end
end
