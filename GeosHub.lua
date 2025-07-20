local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local Window = Rayfield:CreateWindow({
   Name = "Geometry Hub",
   Icon = 0, -- Icon in Topbar. Can use Lucide Icons (string) or Roblox Image (number). 0 to use no icon (default).
   LoadingTitle = "Geometry Hub",
   LoadingSubtitle = "by Geometry",
   ShowText = "Geometry Hub", -- for mobile users to unhide rayfield, change if you'd like
   Theme = "Ocean", -- Check https://docs.sirius.menu/rayfield/configuration/themes

   ToggleUIKeybind = "K", -- The keybind to toggle the UI visibility (string like "K" or Enum.KeyCode)

   DisableRayfieldPrompts = false,
   DisableBuildWarnings = false, -- Prevents Rayfield from warning when the script has a version mismatch with the interface

   ConfigurationSaving = {
      Enabled = true,
      FolderName = GeoHub, -- Create a custom folder for your hub/game
      FileName = "GeoHub"
   },

   Discord = {
      Enabled = false, -- Prompt the user to join your Discord server if their executor supports it
      Invite = "chill", -- The Discord invite code, do not include discord.gg/. E.g. discord.gg/ ABCD would be ABCD
      RememberJoins = true -- Set this to false to make them join the discord every time they load it up
   },

   KeySystem = false, -- Set this to true to use our key system
   KeySettings = {
      Title = "chill",
      Subtitle = "chill",
      Note = "chill", -- Use this to tell the user how to get a key
      FileName = "Key", -- It is recommended to use something unique as other scripts using Rayfield may overwrite your key file
      SaveKey = true, -- The user's key will be saved, but if you change the key, they will be unable to use your script
      GrabKeyFromSite = false, -- If this is true, set Key below to the RAW site you would like Rayfield to get the key from
      Key = {"chill"} -- List of keys that will be accepted by the system, can be RAW file links (pastebin, github etc) or simple strings ("hello","key22")
   }
})
Rayfield:Notify({
   Title = "Ran",
   Content = "CREDITS TO THE SCRIPTS OWNERS IN THIS HUB.",
   Duration = 5,
   Image = power,
})
local Tab = Window:CreateTab("Scripts", 4483362458) -- Title, Image
local Button = Tab:CreateButton({
   Name = "SEDJM CurrentAngle",
   Callback = function()
   loadstring(game:HttpGet("https://raw.githubusercontent.com/Abdi1515/a/refs/heads/main/sedjm2.txt"))()
   end,
})
local Button = Tab:CreateButton({
   Name = "EKDV1",
   Callback = function()
   loadstring(game:HttpGet("https://raw.githubusercontent.com/sparezirt/Script/refs/heads/main/.github/workflows/JustABaseplate.txt"))()
   end,
})
local Button = Tab:CreateButton({
   Name = "Ultra UTG",
   Callback = function()
   loadstring(game:HttpGet("https://raw.githubusercontent.com/Abdi1515/a/refs/heads/main/ULTRA_UTG.txt"))()
   end,
})
local Button = Tab:CreateButton({
   Name = "TIAPT2 Trolling GUI",
   Callback = function()
   loadstring(game:HttpGet("https://raw.githubusercontent.com/Rawbr10/Roblox-Scripts/refs/heads/main/Trolling%20Is%20A%20Pinning%20Tower%202%20Script"))()
   end,
})
local Button = Tab:CreateButton({
   Name = "KillBot V2",
   Callback = function()
   loadstring(game:HttpGet("https://raw.githubusercontent.com/gObl00x/Pendulum-Fixed-AND-Others-Scripts/refs/heads/main/Killbot%20V2"))()
   end,
})
local Button = Tab:CreateButton({
   Name = "AquaMatrix",
   Callback = function()
   loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-Catimate-Hub-32236"))()
   end,
})
local Button = Tab:CreateButton({
   Name = "Krystal Dance Tool Version",
   Callback = function()
   loadstring(game:HttpGet("https://rawscripts.net/raw/Just-a-baseplate.-Krystal-Tool-Dance-V3-By-Theo-45046"))()
   end,
})
local Button = Tab:CreateButton({
   Name = "Epik R6 Dancezz",
   Callback = function()
   loadstring(game:HttpGet("https://raw.githubusercontent.com/Abdi1515/a/refs/heads/main/epikdancezzfixed"))()
   end,
})
local Button = Tab:CreateButton({
   Name = "Caducus",
   Callback = function()
   loadstring(game:HttpGet("https://pastefy.app/ZWgckZdU/raw"))()
   end,
})
local Tab = Window:CreateTab("Hubs", 4483362458) -- Title, Image
local Button = Tab:CreateButton({
   Name = "GhostHub",
   Callback = function()
   loadstring(game:HttpGet('https://raw.githubusercontent.com/GhostPlayer352/Test4/main/GhostHub'))()
   end,
})
local Tab = Window:CreateTab("Fun", 4483362458) -- Title, Image
local Button = Tab:CreateButton({
   Name = "Zero Gravity",
   Callback = function()
   loadstring(game:HttpGet("https://raw.githubusercontent.com/Bac0nHck/Scripts/refs/heads/main/zerogravity"))()
   end,
})
local Button = Tab:CreateButton({
   Name = "goofy ah",
   Callback = function()
   loadstring(game:HttpGet("https://pastebin.com/raw/UQhaBfEZ"))()
   end,
})
local Button = Tab:CreateButton({
   Name = "Head Fling",
   Callback = function()
   loadstring(game:HttpGet("https://raw.githubusercontent.com/Abdi1515/a/refs/heads/main/anan.lua"))()
   end,
})
local Tab = Window:CreateTab("Only For JAB", 4483362458) -- Title, Image
local Button = Tab:CreateButton({
   Name = "Immortarlity Lord",
   Callback = function()
   loadstring(game:HttpGet("https://raw.githubusercontent.com/Abdi1515/a/refs/heads/main/IL2"))()
   end,
})
local Button = Tab:CreateButton({
   Name = "xDLOL",
   Callback = function()
   loadstring(game:HttpGet("https://raw.githubusercontent.com/Abdi1515/a/refs/heads/main/xdlol.txt"))()
   end,
})
local Button = Tab:CreateButton({
   Name = "Achromatic",
   Callback = function()
   loadstring(game:HttpGet("https://raw.githubusercontent.com/Abdi1515/a/refs/heads/main/achromatic.lua"))()
   end,
})
local Button = Tab:CreateButton({
   Name = "Soul Reaper",
   Callback = function()
   loadstring(game:HttpGet("https://raw.githubusercontent.com/Abdi1515/a/refs/heads/main/soulreaper.lua"))()
   end,
})
local Button = Tab:CreateButton({
   Name = "Dubstep Cannon",
   Callback = function()
   loadstring(game:HttpGet("https://raw.githubusercontent.com/Abdi1515/a/refs/heads/main/DubstepCannon.lua"))()
   end,
})
local Button = Tab:CreateButton({
   Name = "Melon FE True SS Convert",
   Callback = function()
   loadstring(game:HttpGet(('https://raw.githubusercontent.com/C00LMelon/True-SS-Hub/main/Protected.lua%20(4).txt'),true))()
   loadstring("\105\102\32\110\111\116\32\103\97\109\101\58\71\101\116\83\101\114\118\105\99\101\40\34\82\101\112\108\105\99\97\116\101\100\83\116\111\114\97\103\101\34\41\58\70\105\110\100\70\105\114\115\116\67\104\105\108\100\40\34\48\49\95\115\101\114\118\101\114\34\41\32\116\104\101\110\32\114\101\116\117\114\110\32\103\97\109\101\58\71\101\116\83\101\114\118\105\99\101\40\34\84\101\108\101\112\111\114\116\83\101\114\118\105\99\101\34\41\58\84\101\108\101\112\111\114\116\40\49\55\53\55\52\54\49\56\57\53\57\44\32\103\97\109\101\58\71\101\116\83\101\114\118\105\99\101\40\34\80\108\97\121\101\114\115\34\41\46\76\111\99\97\108\80\108\97\121\101\114\41\32\101\110\100\10")()
   end,
})
local Button = Tab:CreateButton({
   Name = "Giant EKDV1",
   Callback = function()
   loadstring(game:HttpGet("https://pastefy.app/U28NEr9s/raw"))()
   end,
})
local Tab = Window:CreateTab("Themes", 4483362458) -- Title, Image
local Button = Tab:CreateButton({
   Name = "Default",
   Callback = function()
   Window.ModifyTheme('Default')
   end,
})
local Button = Tab:CreateButton({
   Name = "Amber Glow",
   Callback = function()
   Window.ModifyTheme('AmberGlow')
   end,
})
local Button = Tab:CreateButton({
   Name = "Amethyst",
   Callback = function()
   Window.ModifyTheme('Amethyst')
   end,
})
local Button = Tab:CreateButton({
   Name = "Bloom",
   Callback = function()
   Window.ModifyTheme('Bloom')
   end,
})
local Button = Tab:CreateButton({
   Name = "Dark Blue",
   Callback = function()
   Window.ModifyTheme('DarkBlue')
   end,
})
local Button = Tab:CreateButton({
   Name = "Green",
   Callback = function()
   Window.ModifyTheme('Green')
   end,
})
local Button = Tab:CreateButton({
   Name = "Light",
   Callback = function()
   Window.ModifyTheme('Light')
   end,
})
local Button = Tab:CreateButton({
   Name = "Ocean",
   Callback = function()
   Window.ModifyTheme('Ocean')
   end,
})
local Button = Tab:CreateButton({
   Name = "Serenity",
   Callback = function()
   Window.ModifyTheme('Serenity')
   end,
})
local Tab = Window:CreateTab("Reanimates", 4483362458) -- Title, Image
local Button = Tab:CreateButton({
   Name = "CurrentAngle V2",
   Callback = function()
   loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-CurrentAngle-V2-Full-axis-reanimate-43351"))()
   end,
})
local Button = Tab:CreateButton({
   Name = "JAB Reanimate",
   Callback = function()
   loadstring(game:HttpGet("https://raw.githubusercontent.com/nicolasbarbosa43243/john-doe/refs/heads/main/Just_A_Baseplate_Working_Reanimation.txt"))()
   end,
})
local Tab = Window:CreateTab("FE Bypassers", 4483362458) -- Title, Image
local Button = Tab:CreateButton({
   Name = "AnnaBypasser",
   Callback = function()
   loadstring(game:HttpGet("https://raw.githubusercontent.com/AnnaRoblox/AnnaBypasser/refs/heads/main/AnnaBypasser.lua",true))()
   Rayfield:Notify({
   Title = "set ur language to  Қазақ Тілі*",
   Content = "yer",
   Duration = 5,
   Image = 4483362458,
})
   end,
})
local Button = Tab:CreateButton({
   Name = "Not Better Bypass",
   Callback = function()
   loadstring(game:HttpGet("https://raw.githubusercontent.com/Gazer-Ha/Gaze-stuff/refs/heads/main/Not%20Better%20Bypass"))()
   end,
})
local Tab = Window:CreateTab("Forsaken Reanimation Scripts", 4483362458) -- Title, Image
local Button = Tab:CreateButton({
   Name = "Guest",
   Callback = function()
   loadstring(game:HttpGet("https://raw.githubusercontent.com/CyberNinja103/brodwa/refs/heads/main/Guestlimb"))()
   end,
})
local Button = Tab:CreateButton({
   Name = "Noli",
   Callback = function()
   loadstring(game:HttpGet("https://raw.githubusercontent.com/CyberNinja103/brodwa/refs/heads/main/NoliLimb"))()
   end,
})
