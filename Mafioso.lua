-- Instances: 5 | Scripts: 0 | Modules: 0 | Tags: 1
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
G2L["Ability1_2"]["Image"] = [[rbxassetid://93874368032471]];
G2L["Ability1_2"]["Size"] = UDim2.new(0.08636, 0, 0.19939, 0);
G2L["Ability1_2"]["Name"] = [[Ability1]];
G2L["Ability1_2"]["Position"] = UDim2.new(0.55004, 0, 0.59509, 0);


-- Players.Theo_TheoBenzo.PlayerGui.AbilityForsaken.Ability2
G2L["Ability2_3"] = Instance.new("ImageButton", G2L["AbilityForsaken_1"]);
G2L["Ability2_3"]["BorderSizePixel"] = 0;
G2L["Ability2_3"]["BackgroundTransparency"] = 1;
-- G2L["Ability2_3"]["ImageContent"] = ;
G2L["Ability2_3"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
G2L["Ability2_3"]["Image"] = [[rbxassetid://81200466982776]];
G2L["Ability2_3"]["Size"] = UDim2.new(0.08636, 0, 0.19939, 0);
G2L["Ability2_3"]["Name"] = [[Ability2]];
G2L["Ability2_3"]["Position"] = UDim2.new(0.64039, 0, 0.59509, 0);


-- Players.Theo_TheoBenzo.PlayerGui.AbilityForsaken.Ability3
G2L["Ability3_4"] = Instance.new("ImageButton", G2L["AbilityForsaken_1"]);
G2L["Ability3_4"]["BorderSizePixel"] = 0;
G2L["Ability3_4"]["BackgroundTransparency"] = 1;
-- G2L["Ability3_4"]["ImageContent"] = ;
G2L["Ability3_4"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
G2L["Ability3_4"]["Image"] = [[rbxassetid://98648060230891]];
G2L["Ability3_4"]["Size"] = UDim2.new(0.08636, 0, 0.19939, 0);
G2L["Ability3_4"]["Name"] = [[Ability3]];
G2L["Ability3_4"]["Position"] = UDim2.new(0.73074, 0, 0.59509, 0);


-- Players.Theo_TheoBenzo.PlayerGui.AbilityForsaken.Ability4
G2L["Ability4_5"] = Instance.new("ImageButton", G2L["AbilityForsaken_1"]);
G2L["Ability4_5"]["BorderSizePixel"] = 0;
G2L["Ability4_5"]["BackgroundTransparency"] = 1;
-- G2L["Ability4_5"]["ImageContent"] = ;
G2L["Ability4_5"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
G2L["Ability4_5"]["Image"] = [[rbxassetid://105652328381208]];
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
G2L["Sprint_5"]["Name"] = [[Ability4]];
G2L["Sprint_5"]["Position"] = UDim2.new(0.82108, 0, 0.25, 0);


local AnimH = loadstring(game:HttpGet("https://raw.githubusercontent.com/ProudNamed/SuperLightning/refs/heads/main/AnimModule/MainModule"))()
local Anim
local id
local i = 74991820003820
local hidle = 74991820003820
local punch = 74991820003820
local punching = false
local idle = true
local walk = 84752698910628 
local walking = false
local corruptn = 74991820003820
local corrupt = false
local overrideStart = 74991820003820
local Ovr = 74991820003820
local overrideEnd = 74991820003820
local overridden = false
local pizzadelivery = 74991820003820
local pizza = false
local sprinting1 = false
local sprinting = false
local sprint = false
local run = 84752698910628
local ws = 10
local ability = false
local charging = false
local char = game.Players.LocalPlayer.Character
local hum = char:FindFirstChild("Humanoid")
local uis = game:GetService("UserInputService")
local overvel = Instance.new("VectorForce")
overvel.Parent = char.HumanoidRootPart
overvel.Attachment0 = char.HumanoidRootPart.RootAttachment
overvel.Enabled = false
overvel.Force = Vector3.new(0, 0, -50)
local overchargevel = Instance.new("VectorForce")
overchargevel.Parent = char.HumanoidRootPart
overchargevel.Attachment0 = char.HumanoidRootPart.RootAttachment
overchargevel.Enabled = false
overchargevel.Force = Vector3.new(0, 0, -8500)
hum.Animator:Destroy()
char.Animate:Destroy()
local anim = game:GetObjects("rbxassetid://" .. i)[1]
anim.Parent = char
id = i
Anim = AnimH.new(char, anim)
Anim:Play()
hum.WalkSpeed = ws

if ability== true then
idle = false
walking = false
sprinting = false
end 
if ability== false then
idle = true
walking = true
sprinting = true
end
G2L["Sprint_5"]["MouseButton1Click"]:Connect(function()
sprinting1 = not sprinting1 
if sprinting1 then
sprint = true
hum.WalkSpeed = 27.5
else
sprint = false
hum.WalkSpeed = ws
end
end)
uis.InputBegan:Connect(function(input)
if input.KeyCode == Enum.KeyCode.LeftShift  then
local sprinting1 = false
if sprinting1 then
  hum.WalkSpeed = 20   
  sprinting = true
  else
       sprinting = false
     hum.WalkSpeed = ws
end
end
end)

uis.InputBegan:Connect(function(input)
if input.KeyCode == Enum.KeyCode.Q and  punching == false and ability== false then
         ability= true
         punching= true
         sprinting1 = false
         hum.WalkSpeed = 2.5
         wait(1)
         if sprinting == false then
         hum.WalkSpeed = ws
         end
         if sprinting == true then
         hum.WalkSpeed = 27.5
         end
         ability= false
         punching= false
end 
end)
uis.InputBegan:Connect(function(input)
if input.KeyCode == Enum.KeyCode.E and corrupt == false and ability== false then
     ability= true 
     corrupt = true
     hum.WalkSpeed = 2.5
     wait(1)
     if sprinting == false then 
     hum.WalkSpeed = ws
     end 
     if sprinting == true then
     hum.WalkSpeed = 27.5
     end
     ability= false
     corrupt = false
end
end)
uis.InputBegan:Connect(function(input)
if input.KeyCode == Enum.KeyCode.R and corrupt == false and ability== false then
     ability= true 
     corrupt = true
     sprinting1 = false
     hum.WalkSpeed = 2.5
     wait(1)
     if sprinting == false then 
     hum.WalkSpeed = ws
     end 
     if sprinting == true then
     hum.WalkSpeed = 27.5
     end
     ability= false
     corrupt = false
    end
end)

uis.InputBegan:Connect(function(input)
if input.KeyCode == Enum.KeyCode.T and pizza== false and ability == false then
          pizza = true
          ability= true
          sprinting1 = false
          hum.WalkSpeed = 0
          wait(.999)
          if sprinting == false then 
          hum.WalkSpeed = ws
          end 
          if sprinting == true then
          hum.WalkSpeed = 27.5
          end
          ability = false
          pizza = false
     end 
end)

G2L["Ability1_2"]["MouseButton1Click"]:Connect(function()
    if punching == false and ability== false then
         ability= true
         punching= true
         sprinting1 = false
         hum.WalkSpeed = 2.5
         wait(1)
         if sprinting == false then
         hum.WalkSpeed = ws
         end
         if sprinting == true then
         hum.WalkSpeed = 27.5
         end
         ability= false
         punching= false
     end
end)
G2L["Ability2_3"]["MouseButton1Click"]:Connect(function()
if corrupt == false and ability== false then
     ability= true 
     corrupt = true
     sprinting1 = false
     hum.WalkSpeed = 2.5
     wait(1)
     if sprinting == false then 
     hum.WalkSpeed = ws
     end 
     if sprinting == true then
     hum.WalkSpeed = 27.5
     end
     ability= false
     corrupt = false
end
end)

G2L["Ability3_4"]["MouseButton1Click"]:Connect(function()
if overridden == false and ability == false then
     overridden = true
     ability = true
     hum.WalkSpeed = 0
     sprinting1 = false
     wait(.750)
     overchargevel.Enabled = true 
     wait(1.050)
     overchargevel.Enabled = false
     wait(.250)
     if sprinting == false then
     hum.WalkSpeed = ws
     end 
     if sprinting == true then
     hum.WalkSpeed = 27.5
     end
     overridden = false
     ability = false
     end
end)
G2L["Ability4_5"]["MouseButton1Click"]:Connect(function()
     if pizza== false and ability == false then
          pizza = true
          ability= true
          sprinting1 = false
          hum.WalkSpeed = 0
          wait(.999)
          if sprinting == false then 
          hum.WalkSpeed = ws
          end 
          if sprinting == true then
          hum.WalkSpeed = 27.5
          end
          ability = false
          pizza = false
     end 
end)


while wait() do
if idle == true and walking == false and punching == false and ability== false and corrupt == false and sprinting == false and overridden == false and pizza == false then
     if id ~= i then
     Anim:Stop()
     anim = game:GetObjects("rbxassetid://"..i)[1]
     Anim =AnimH.new(char, anim)
     Anim.Looped = true
     Anim:Play()
     id = i
     end
end

if walking == true and idle == false and punching == false and ability == false and corrupt == false and sprinting == false and overridden== false and pizza == false then
    if id ~= walk then 
     Anim:Stop()
     anim = game:GetObjects("rbxassetid://"..walk)[1]
     Anim = AnimH.new(char, anim)
     Anim.Looped = true
     Anim:Play()
     id = walk
    end
end
if sprinting == true and idle == false and punching == false and ability == false and corrupt == false  and walking == false and overridden== false and pizza == false then
     if id ~= run then
     Anim:Stop()
     anim = game:GetObjects("rbxassetid://"..run)[1]
     Anim = AnimH.new(char, anim)
     Anim.Looped = true
     Anim:Play()
     id = run
     end
end
if hum.MoveDirection ~= Vector3.new(0,0,0) and ability == false and sprint == false then 
idle = false
walking = true
sprinting = false
end
if hum.MoveDirection ~= Vector3.new(0,0,0) and ability== false and sprint == true then 
     walking = false
     idle = false
     sprinting = true
end
if hum.MoveDirection == Vector3.new(0,0,0)then
     idle = true 
     walking= false
     sprinting= false
end


if punching == true then
if id ~= punch then 
     Anim:Stop()
     anim = game:GetObjects("rbxassetid://"..punch)[1]
     Anim = AnimH.new(char, anim)
     Anim.Looped = false
     Anim:Play()
     if sprinting == false then
     hum.WalkSpeed = ws
     end
     if sprinting == true then
     hum.WalkSpeed = 27.5
     end
     id = punch
   end
end 
if corrupt == true then
     if id ~= corrupt then 
          Anim:Stop()
          anim = game:GetObjects("rbxassetid://"..corruptn)[1]
          Anim = AnimH.new(char, anim)
          Anim.Looped = false
          Anim:Play()
          if sprinting == false then
          hum.WalkSpeed = ws
          end
          if sprinting == true then
          hum.WalkSpeed = 27.5
          end
          id = corrupt
       end
end
if overridden == true then
     if id ~= overrideStart then
          Anim:Stop()
          anim = game:GetObjects("rbxassetid://"..overrideStart)[1]
          Anim = AnimH.new(char, anim)
          Anim.Looped = false
          Anim:Play()
          wait(.750)
          Anim:Stop()
          anim = game:GetObjects("rbxassetid://"..Ovr)[1]
          Anim = AnimH.new(char, anim)
          Anim.Looped = false
          Anim:Play()
          wait(1.050)
          Anim:Stop()
          anim = game:GetObjects("rbxassetid://"..overrideEnd)[1]
          Anim = AnimH.new(char, anim)
          Anim.Looped = false
          Anim:Play()
          if sprinting == false then
          hum.WalkSpeed = ws
          end
          if sprinting == true then
          hum.WalkSpeed = 27.5
          end
          id=overrideStart
     end
end
if pizza == true then
     if id ~= pizza then
          Anim:Stop()
          anim = game:GetObjects("rbxassetid://"..pizzadelivery)[1]
          Anim = AnimH.new(char, anim)
          Anim.Looped = false
          Anim:Play()
          if sprinting == false then
          hum.WalkSpeed = ws
          end
          if sprinting == true then
          hum.WalkSpeed = 27.5
          end
          id = pizza
     end 
end
end

return G2L["AbilityForsaken_1"], require;