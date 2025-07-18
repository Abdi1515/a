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

local customMessage = "-gh 5268602207 5593848751 5505301521 80479688830908 80401121980206 74603792617282 111809732325428 94138150908378"
local netMessage = "-net"

SendChatMessage(customMessage)
SendChatMessage(netMessage)

task.wait(0.2)

loadstring(game:HttpGet("https://gist.githubusercontent.com/MelonsStuff/342631416698bc733c93dbce1fc43371/raw/5b506412e72fbc1b9e9730ae7f096d33bf06e128/ImmortalityLord.lua"))()