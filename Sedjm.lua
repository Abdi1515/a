--[=[
 d888b  db    db d888888b      .d888b.      db      db    db  .d8b.  
88' Y8b 88    88   `88'        VP  `8D      88      88    88 d8' `8b 
88      88    88    88            odD'      88      88    88 88ooo88 
88  ooo 88    88    88          .88'        88      88    88 88~~~88 
88. ~8~ 88b  d88   .88.        j88.         88booo. 88b  d88 88   88    @uniquadev
 Y888P  ~Y8888P' Y888888P      888888D      Y88888P ~Y8888P' YP   YP  CONVERTER 

designed using localmaze gui creator
]=]

-- Instances: 11 | Scripts: 1 | Modules: 0 | Tags: 1
local CollectionService = game:GetService("CollectionService");
local G2L = {};

-- Players.test87403.PlayerGui.ScreenGui
G2L["ScreenGui_1"] = Instance.new("ScreenGui", game:GetService("Players").LocalPlayer:WaitForChild("PlayerGui"));
G2L["ScreenGui_1"]["ZIndexBehavior"] = Enum.ZIndexBehavior.Sibling;

-- Tags
CollectionService:AddTag(G2L["ScreenGui_1"], [[main]]);

-- Players.test87403.PlayerGui.ScreenGui.Frame
G2L["Frame_2"] = Instance.new("Frame", G2L["ScreenGui_1"]);
G2L["Frame_2"]["BorderSizePixel"] = 0;
G2L["Frame_2"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
G2L["Frame_2"]["Size"] = UDim2.new(0.60639, 0, 0.69038, 0);
G2L["Frame_2"]["Position"] = UDim2.new(0.18529, 0, 0.07357, 0);
G2L["Frame_2"]["BackgroundTransparency"] = 0.5;


-- Players.test87403.PlayerGui.ScreenGui.Frame.UICorner
G2L["UICorner_3"] = Instance.new("UICorner", G2L["Frame_2"]);



-- Players.test87403.PlayerGui.ScreenGui.Frame.UIAspectRatioConstraint
G2L["UIAspectRatioConstraint_4"] = Instance.new("UIAspectRatioConstraint", G2L["Frame_2"]);
G2L["UIAspectRatioConstraint_4"]["AspectRatio"] = 2.06557;


-- Players.test87403.PlayerGui.ScreenGui.TextButton
G2L["TextButton_5"] = Instance.new("TextButton", G2L["ScreenGui_1"]);
G2L["TextButton_5"]["BorderSizePixel"] = 0;
G2L["TextButton_5"]["TextSize"] = 24;
G2L["TextButton_5"]["TextColor3"] = Color3.fromRGB(0, 0, 0);
G2L["TextButton_5"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
G2L["TextButton_5"]["FontFace"] = Font.new([[rbxasset://fonts/families/GothamSSm.json]], Enum.FontWeight.Bold, Enum.FontStyle.Normal);
G2L["TextButton_5"]["Size"] = UDim2.new(0.19972, 0, 0.18674, 0);
G2L["TextButton_5"]["Text"] = [[Execute]];
G2L["TextButton_5"]["Position"] = UDim2.new(0.38501, 0, 0.49232, 0);


-- Players.test87403.PlayerGui.ScreenGui.TextButton.UICorner
G2L["UICorner_6"] = Instance.new("UICorner", G2L["TextButton_5"]);



-- Players.test87403.PlayerGui.ScreenGui.TextButton.LocalScript
G2L["LocalScript_7"] = Instance.new("LocalScript", G2L["TextButton_5"]);



-- Players.test87403.PlayerGui.ScreenGui.TextButton.UIAspectRatioConstraint
G2L["UIAspectRatioConstraint_8"] = Instance.new("UIAspectRatioConstraint", G2L["TextButton_5"]);
G2L["UIAspectRatioConstraint_8"]["AspectRatio"] = 2.51515;


-- Players.test87403.PlayerGui.ScreenGui.TextLabel
G2L["TextLabel_9"] = Instance.new("TextLabel", G2L["ScreenGui_1"]);
G2L["TextLabel_9"]["BorderSizePixel"] = 0;
G2L["TextLabel_9"]["TextSize"] = 24;
G2L["TextLabel_9"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
G2L["TextLabel_9"]["FontFace"] = Font.new([[rbxasset://fonts/families/GothamSSm.json]], Enum.FontWeight.Bold, Enum.FontStyle.Normal);
G2L["TextLabel_9"]["TextColor3"] = Color3.fromRGB(0, 0, 0);
G2L["TextLabel_9"]["BackgroundTransparency"] = 0.5;
G2L["TextLabel_9"]["Size"] = UDim2.new(0.5703, 0, 0.29992, 0);
G2L["TextLabel_9"]["Text"] = [[SEDJM By geometry]];
G2L["TextLabel_9"]["Position"] = UDim2.new(0.20454, 0, 0.10752, 0);


-- Players.test87403.PlayerGui.ScreenGui.TextLabel.UICorner
G2L["UICorner_a"] = Instance.new("UICorner", G2L["TextLabel_9"]);



-- Players.test87403.PlayerGui.ScreenGui.TextLabel.UIAspectRatioConstraint
G2L["UIAspectRatioConstraint_b"] = Instance.new("UIAspectRatioConstraint", G2L["TextLabel_9"]);
G2L["UIAspectRatioConstraint_b"]["AspectRatio"] = 4.4717;


-- Players.test87403.PlayerGui.ScreenGui.TextButton.LocalScript
G2L["TextButton"]["MouseButton1Click"]:Connect(function()
G2L["Frame_2"]:Destroy()
loadstring(game:HttpGet("https://raw.githubusercontent.com/Abdi1515/a/refs/heads/main/sedjm2.txt"))()
	
end;
task.spawn(C_7);

return G2L["ScreenGui_1"], require;