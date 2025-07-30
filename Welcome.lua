--[=[
 d888b  db    db d888888b      .d888b.      db      db    db  .d8b.  
88' Y8b 88    88   `88'        VP  `8D      88      88    88 d8' `8b 
88      88    88    88            odD'      88      88    88 88ooo88 
88  ooo 88    88    88          .88'        88      88    88 88~~~88 
88. ~8~ 88b  d88   .88.        j88.         88booo. 88b  d88 88   88    @uniquadev
 Y888P  ~Y8888P' Y888888P      888888D      Y88888P ~Y8888P' YP   YP  CONVERTER 

designed using localmaze gui creator
]=]

-- Instances: 7 | Scripts: 0 | Modules: 0 | Tags: 1
local CollectionService = game:GetService("CollectionService");
local G2L = {};

-- Players.test87403.PlayerGui.ScreenGui
G2L["ScreenGui_1"] = Instance.new("ScreenGui", game:GetService("Players").LocalPlayer:WaitForChild("PlayerGui"));
G2L["ScreenGui_1"]["ZIndexBehavior"] = Enum.ZIndexBehavior.Sibling;

-- Tags
CollectionService:AddTag(G2L["ScreenGui_1"], [[main]]);

-- Players.test87403.PlayerGui.ScreenGui.TextLabel
G2L["TextLabel_2"] = Instance.new("TextLabel", G2L["ScreenGui_1"]);
G2L["TextLabel_2"]["BorderSizePixel"] = 0;
G2L["TextLabel_2"]["TextSize"] = 24;
G2L["TextLabel_2"]["BackgroundColor3"] = Color3.fromRGB(50, 50, 50);
G2L["TextLabel_2"]["FontFace"] = Font.new([[rbxasset://fonts/families/SourceSansPro.json]], Enum.FontWeight.Bold, Enum.FontStyle.Normal);
G2L["TextLabel_2"]["TextColor3"] = Color3.fromRGB(255, 255, 255);
G2L["TextLabel_2"]["Size"] = UDim2.new(0.34892, 0, 0.37348, 0);
G2L["TextLabel_2"]["Text"] = [[Welcome to delta, geometry.]];
G2L["TextLabel_2"]["Position"] = UDim2.new(0.29598, 0, 0.22635, 0);


-- Players.test87403.PlayerGui.ScreenGui.TextLabel.UICorner
G2L["UICorner_3"] = Instance.new("UICorner", G2L["TextLabel_2"]);



-- Players.test87403.PlayerGui.ScreenGui.TextLabel.UIAspectRatioConstraint
G2L["UIAspectRatioConstraint_4"] = Instance.new("UIAspectRatioConstraint", G2L["TextLabel_2"]);
G2L["UIAspectRatioConstraint_4"]["AspectRatio"] = 2.19697;


-- Players.test87403.PlayerGui.ScreenGui.Frame
G2L["Frame_5"] = Instance.new("Frame", G2L["ScreenGui_1"]);
G2L["Frame_5"]["ZIndex"] = 0;
G2L["Frame_5"]["BorderSizePixel"] = 0;
G2L["Frame_5"]["BackgroundColor3"] = Color3.fromRGB(0, 168, 255);
G2L["Frame_5"]["Size"] = UDim2.new(0.36336, 0, 0.39612, 0);
G2L["Frame_5"]["Position"] = UDim2.new(0.28876, 0, 0.21504, 0);


-- Players.test87403.PlayerGui.ScreenGui.Frame.UICorner
G2L["UICorner_6"] = Instance.new("UICorner", G2L["Frame_5"]);



-- Players.test87403.PlayerGui.ScreenGui.Frame.UIAspectRatioConstraint
G2L["UIAspectRatioConstraint_7"] = Instance.new("UIAspectRatioConstraint", G2L["Frame_5"]);
G2L["UIAspectRatioConstraint_7"]["AspectRatio"] = 2.15714;



return G2L["ScreenGui_1"], require;