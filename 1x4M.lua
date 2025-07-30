local CollectionService = game:GetService("CollectionService");
local G2L = {};

-- Players.Theo_TheoBenzo.PlayerGui.AbilityForsaken
G2L["AbilityForsaken_1"] = Instance.new("ScreenGui", game:GetService("Players").LocalPlayer:WaitForChild("PlayerGui"));
G2L["AbilityForsaken_1"]["Name"] = [[AbilityForsaken]];
G2L["AbilityForsaken_1"]["ZIndexBehavior"] = Enum.ZIndexBehavior.Sibling;

-- Tags
CollectionService:AddTag(G2L["AbilityForsaken_1"], [[main]]);

-- Players.Theo_TheoBenzo.PlayerGui.AbilityForsaken.Ability1
G2L["Ability1_2"] = Instance.new("ImageButton", G2L["AbilityForsaken_1"]);
G2L["Ability1_2"]["BorderSizePixel"] = 0;
G2L["Ability1_2"]["BackgroundTransparency"] = 1;
-- G2L["Ability1_2"]["ImageContent"] = ;
G2L["Ability1_2"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
G2L["Ability1_2"]["Image"] = [[rbxassetid://113542202113247]];
G2L["Ability1_2"]["Size"] = UDim2.new(0.08636, 0, 0.19939, 0);
G2L["Ability1_2"]["Name"] = [[Ability1]];
G2L["Ability1_2"]["Position"] = UDim2.new(0.55004, 0, 0.59509, 0);


-- Players.Theo_TheoBenzo.PlayerGui.AbilityForsaken.Ability2
G2L["Ability2_3"] = Instance.new("ImageButton", G2L["AbilityForsaken_1"]);
G2L["Ability2_3"]["BorderSizePixel"] = 0;
G2L["Ability2_3"]["BackgroundTransparency"] = 1;
-- G2L["Ability2_3"]["ImageContent"] = ;
G2L["Ability2_3"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
G2L["Ability2_3"]["Image"] = [[rbxassetid://80768186497198]];
G2L["Ability2_3"]["Size"] = UDim2.new(0.08636, 0, 0.19939, 0);
G2L["Ability2_3"]["Name"] = [[Ability2]];
G2L["Ability2_3"]["Position"] = UDim2.new(0.64039, 0, 0.59509, 0);


-- Players.Theo_TheoBenzo.PlayerGui.AbilityForsaken.Ability3
G2L["Ability3_4"] = Instance.new("ImageButton", G2L["AbilityForsaken_1"]);
G2L["Ability3_4"]["BorderSizePixel"] = 0;
G2L["Ability3_4"]["BackgroundTransparency"] = 1;
-- G2L["Ability3_4"]["ImageContent"] = ;
G2L["Ability3_4"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
G2L["Ability3_4"]["Image"] = [[rbxassetid://119069138923680]];
G2L["Ability3_4"]["Size"] = UDim2.new(0.08636, 0, 0.19939, 0);
G2L["Ability3_4"]["Name"] = [[Ability3]];
G2L["Ability3_4"]["Position"] = UDim2.new(0.73074, 0, 0.59509, 0);


-- Players.Theo_TheoBenzo.PlayerGui.AbilityForsaken.Ability4
G2L["Ability4_5"] = Instance.new("ImageButton", G2L["AbilityForsaken_1"]);
G2L["Ability4_5"]["BorderSizePixel"] = 0;
G2L["Ability4_5"]["BackgroundTransparency"] = 1;
-- G2L["Ability4_5"]["ImageContent"] = ;
G2L["Ability4_5"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
G2L["Ability4_5"]["Image"] = [[rbxassetid://135373963092918]];
G2L["Ability4_5"]["Size"] = UDim2.new(0.08636, 0, 0.19939, 0);
G2L["Ability4_5"]["Name"] = [[Ability4]];
G2L["Ability4_5"]["Position"] = UDim2.new(0.82108, 0, 0.59509, 0);

G2L["Sprint_5"] = Instance.new("ImageButton", G2L["AbilityForsaken_1"]);
G2L["Sprint_5"]["BorderSizePixel"] = 0;
G2L["Sprint_5"]["BackgroundTransparency"] = 1;
-- G2L["Sprint_5"]["ImageContent"] = ;
G2L["Sprint_5"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
G2L["Sprint_5"]["Image"] = [[rbxassetid://132640025048316]];
G2L["Sprint_5"]["Size"] = UDim2.new(0.08636, 0, 0.19939, 0);
G2L["Sprint_5"]["Name"] = [[Sprint]];
G2L["Sprint_5"]["Position"] = UDim2.new(0.82108, 0, 0.25, 0);

--[[
1x1x1x1 Forsaken Anims Made By Theo
]]
local AnimH =
loadstring(game:HttpGet("https://raw.githubusercontent.com/ProudNamed/SuperLightning/refs/heads/main/AnimModule/MainModule"))()
local Anim
local New = AnimH.new
local id
local i = 73013861111747 -- idle 
local idle = true
local walk = 137667027613415 -- walk 
local walking = false
local run = 73013861111747 -- run 
local run1 = false
local run2 = false
local sprint = false
local m1 = 11633796026411 --m1 
local ism1 = false
local mass = 11633796026411 -- mass 
local mas = false
local throw = 9755968220095 -- throw
local throwing = false
local unstable = 11633796026411 -- unstable 
local stable= false
local ability= false
local ws = 10
local Vector3 = Vector3.new
local char = game.Players.LocalPlayer.Character
local hum = char:FindFirstChild("Humanoid")
local uis = game:GetService("UserInputService")
local anim = game:GetObjects("rbxassetid://" .. i)[1]
anim.Parent = char
id = i
Anim = New(char, anim)
Anim:Play()
hum.WalkSpeed = ws

G2L["Sprint_5"]["MouseButton1Click"]:Connect(function()
   run1 = not run1
   if run1 then 
        run2 = true
        hum.WalkSpeed=27.5
        else
            run2 = false
            hum.WalkSpeed=ws
    end 
end)
G2L["Ability1_2"]["MouseButton1Click"]:Connect(function()
if ability== false then
     ability= true
     ism1 = true
     hum.WalkSpeed= 2.5
     wait(1)
     ability= false
     ism1 = false
     if run2 == false then
     hum.WalkSpeed = ws
     end
     if run2 == true then
     hum.WalkSpeed = 27.5
           end
     end
end)
G2L["Ability2_3"]["MouseButton1Click"]:Connect(function()
if ability== false then 
     ability=true
     mas=true
     hum.WalkSpeed=2.5
     wait(2.550)
     ability=false
     mas=false
     if run2 == false then
     hum.WalkSpeed = ws
     end
     if run2 == true then
     hum.WalkSpeed = 27.5
           end
     end
end)
G2L["Ability3_4"]["MouseButton1Click"]:Connect(function()
if ability== false then 
     ability=true
     throwing=true
     hum.WalkSpeed=2.5
     wait(2.050)
     ability=false
     throwing=false
     if run2 == false then
     hum.WalkSpeed = ws
     end
     if run2 == true then
     hum.WalkSpeed = 27.5
          end
     end
end)
G2L["Ability4_5"]["MouseButton1Click"]:Connect(function()
if ability==false then
     ability=true
     stable=true
     hum.WalkSpeed=1.5
     wait(1.550)
     ability=false
     stable=false
     if run2 == false then
     hum.WalkSpeed = ws
     end
     if run2 == true then
     hum.WalkSpeed = 27.5
           end
     end 
end)

while wait() do
if idle==true and walking==false and sprint==false and ability==false then 
     if id ~= i then 
          Anim:Stop()
          anim=game:GetObjects("rbxassetid://"..i)[1]
          Anim=New(char,anim)
          Anim.Looped=true
          Anim:Play()
          id=i
          end
   end
if walking==true and idle==false and sprint==false and ability==false then 
     if id~=walk then
          Anim:Stop()
          anim=game:GetObjects("rbxassetid://"..walk)[1]
          Anim=New(char,anim)
          Anim.Looped=true
          Anim:Play()
          id=walk
          end
    end
if sprint==true and walking==false and idle==false and ability==false then
     if id~=run then
          Anim:Stop()
          anim=game:GetObjects("rbxassetid://"..run)[1]
          Anim=New(char,anim)
          Anim.Looped=true
          Anim:Play()
          id=run
          end 
     end
if hum.MoveDirection ~= Vector3(0,0,0) and run2 == false then 
     idle=false
     walking=true
     sprint=false
end
if hum.MoveDirection ~= Vector3(0,0,0) and run2 == true then 
     idle=false
     walking=false
     sprint=true
end
if hum.MoveDirection == Vector3(0,0,0) then 
     idle=true
     walking=false
     sprint=false
end 
if ism1==true then 
     if id~=m1 then 
          Anim:Stop()
          anim=game:GetObjects("rbxassetid://"..m1)[1]
          Anim=New(char,anim)
          Anim.Looped=false
          Anim:Play()
          id=m1
          end
end
if mas==true then 
     if id~=mass then 
          Anim:Stop()
          anim=game:GetObjects("rbxassetid://"..mass)[1]
          Anim=New(char,anim)
          Anim.Looped=false
          Anim:Play()
          id=mass
          end
end
if throwing==true then 
     if id~=throw then
          Anim:Stop()
          anim=game:GetObjects("rbxassetid://"..throw)[1]
          Anim=New(char,anim)
          Anim.Looped=false
          Anim:Play()
          id=throw
          end
end
if stable==true then 
     if id~=unstable then
          Anim:Stop()
          anim=game:GetObjects("rbxassetid://"..unstable)[1]
          Anim=New(char,anim)
          Anim.Looped=false
          Anim:Play()
          id=unstable
          end
     end
end

return G2L["AbilityForsaken_1"], require;