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

local customMessage = "-gh 14255528083 14768701869 14255554762 14768693948 14255556501 17550887328 1073690"
local netMessage = "-net"

SendChatMessage(customMessage)
SendChatMessage(netMessage)

task.wait(0.2)

loadstring(game:HttpGet("https://gist.githubusercontent.com/MelonsStuff/e8540373afe9e1af9fe8d8f38a399d2a/raw/d62543cedf9aa0a716b60fac89d7db82279ec277/DubstepGun.txt"))()
