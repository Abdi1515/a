local StigmanFroud = Instance.new("ScreenGui")
local trajectory = Instance.new("ImageLabel")
local R = Instance.new("ImageLabel")
local Earth = Instance.new("ImageLabel")
local Green = Instance.new("ImageLabel")

StigmanFroud.Name = "Stigman Froud"
StigmanFroud.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
StigmanFroud.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
StigmanFroud.DisplayOrder = 999
StigmanFroud.ResetOnSpawn = false

trajectory.Name = "trajectory"
trajectory.Parent = StigmanFroud
trajectory.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
trajectory.BackgroundTransparency = 1.000
trajectory.Position = UDim2.new(0.45430705, 0, 0.430432826, 0)
trajectory.Size = UDim2.new(0, 110, 0, 110)
trajectory.Image = "http://www.roblox.com/asset/?id=7102118272"
trajectory.SliceScale = 3.000

R.Name = "R"
R.Parent = StigmanFroud
R.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
R.BackgroundTransparency = 1.000
R.Position = UDim2.new(0.45430705, 0, 0.430432826, 0)
R.Size = UDim2.new(0, 110, 0, 110)
R.ZIndex = 3
R.Image = "http://www.roblox.com/asset/?id=7102117818"
R.SliceScale = 3.000

R.Name = "R"
R.Parent = StigmanFroud
R.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
R.BackgroundTransparency = 1.000
R.Position = UDim2.new(0.45430705, 0, 0.430432826, 0)
R.Size = UDim2.new(0, 110, 0, 110)
R.ZIndex = 3
R.Image = "http://www.roblox.com/asset/?id=7102117818"
R.SliceScale = 3.000

Earth.Name = "Earth"
Earth.Parent = R
Earth.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Earth.BackgroundTransparency = 1.000
Earth.BorderColor3 = Color3.fromRGB(0, 0, 0)
Earth.BorderSizePixel = 0
Earth.Position = UDim2.new(0.404999346, 0, 0.406818181, 0)
Earth.Size = UDim2.new(0, 20, 0, 20)
Earth.ZIndex = 4
Earth.Image = "rbxassetid://78137783929126"

Green.Name = "Green"
Green.Parent = StigmanFroud
Green.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Green.BackgroundTransparency = 1.000
Green.BorderColor3 = Color3.fromRGB(0, 0, 0)
Green.BorderSizePixel = 0
Green.Position = UDim2.new(0.00499999989, 0, 0.824999988, 0)
Green.Size = UDim2.new(0, 110, 0, 110)
Green.ZIndex = 6
Green.Image = "rbxassetid://75554667916597"
Green.ImageTransparency = 1.000

local function AARC_fake_script() -- trajectory.Info 
	local script = Instance.new('LocalScript', trajectory)

	local img = script.Parent
	local sonic = script.Parent
	
	img:TweenPosition(UDim2.new(0.451, 0,0.395, 0), "Out", "Linear", 0.4, false)
	wait(3)
	img:TweenPosition(UDim2.new(0.005, 0,0.619, 0), "Out", "Sine", 0.7, false)
	
	
	
	while true do
		wait(0.01)
		sonic.Rotation = sonic.Rotation +0.3
	end
	
	
end
coroutine.wrap(AARC_fake_script)()
local function LQERQ_fake_script() -- Earth.LocalScript 
	local script = Instance.new('LocalScript', Earth)

	local Angle = 0;
	local AngleIncrement = 0.02;
	local OriginPos = script.Parent.Position;
	local Distance = 55;
	
	while wait() do
		Angle = Angle + AngleIncrement;
		local dirX = math.cos(Angle) -- X
		local dirY = math.sin(Angle) -- Y
		script.Parent.Position = OriginPos + UDim2.new(0, dirX * Distance, 0, dirY * Distance);
	end
end
coroutine.wrap(LQERQ_fake_script)()
local function XBQODE_fake_script() -- R.Info 
	local script = Instance.new('LocalScript', R)

	local img = script.Parent
	
	img:TweenPosition(UDim2.new(0.451, 0,0.395, 0), "Out", "Linear", 0.4, false)
	wait(3)
	img:TweenPosition(UDim2.new(0.005, 0,0.619, 0), "Out", "Sine", 0.7, false)
	
	
end
coroutine.wrap(XBQODE_fake_script)()
local function NSHDR_fake_script() -- Green.LocalScript 
	local script = Instance.new('LocalScript', Green)

	local Tween = game:GetService("TweenService")
	local Greenfn = script.Parent
	wait(2)
	while true do
	  local TranspncyTween = Tween:Create(Greenfn, TweenInfo.new(0.5), {ImageTransparency = 0})
		TranspncyTween:Play()
		wait(0.3)
		local TranspncyTween = Tween:Create(Greenfn, TweenInfo.new(0.5), {ImageTransparency = 1})
		TranspncyTween:Play()
		wait(0.3)
		local TranspncyTween = Tween:Create(Greenfn, TweenInfo.new(0.5), {ImageTransparency = 0})
		TranspncyTween:Play()
		wait(0.3)
		local TranspncyTween = Tween:Create(Greenfn, TweenInfo.new(0.5), {ImageTransparency = 1})
		TranspncyTween:Play()
		wait(4)
	end
end
coroutine.wrap(NSHDR_fake_script)()
local function UDIRPT_fake_script() -- Green.Info 
	local script = Instance.new('LocalScript', Green)

	local img = script.Parent
	local GetName = game:GetService("MarketplaceService"):GetProductInfo(game.PlaceId)
	
	img:TweenPosition(UDim2.new(0.451, 0,0.395, 0), "Out", "Linear", 0.4, false)
	wait(3)
	img:TweenPosition(UDim2.new(0.005, 0,0.619, 0), "Out", "Sine", 0.7, false)
	
	
	
	
end
coroutine.wrap(NSHDR_fake_script)()
local function UDIRPT_fake_script() -- Green.Info 
	local script = Instance.new('LocalScript', Green)

	local img = script.Parent
	local GetName = game:GetService("MarketplaceService"):GetProductInfo(game.PlaceId)
	
	img:TweenPosition(UDim2.new(0.451, 0,0.395, 0), "Out", "Linear", 0.4, false)
	wait(3)
	img:TweenPosition(UDim2.new(0.005, 0,0.619, 0), "Out", "Sine", 0.7, false)
	
	
	
	
end
coroutine.wrap(UDIRPT_fake_script)()
local function WGFAMY_fake_script() -- StigmanFroud.LocalScript 
	local script = Instance.new('LocalScript', StigmanFroud)

	local GetName = game:GetService("MarketplaceService"):GetProductInfo(game.PlaceId)
	
	print("Loaded At",GetName.Name)
	wait(0.1)
	print("Welcome,",game.Players.LocalPlayer.Name)
	
end
coroutine.wrap(WGFAMY_fake_script)()
