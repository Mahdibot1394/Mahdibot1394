-- m4GUI (Safe Version)
-- Made for Mah6i - Safe Features Only

local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "m4GUI"
ScreenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")

-- Main Frame
local Main = Instance.new("Frame")
Main.Size = UDim2.new(0, 300, 0, 350)
Main.Position = UDim2.new(0.5, -150, 0.5, -175)
Main.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
Main.BorderSizePixel = 0
Main.Active = true
Main.Draggable = true
Main.Parent = ScreenGui

-- Titlebar
local Title = Instance.new("TextLabel")
Title.Size = UDim2.new(1, 0, 0, 35)
Title.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
Title.Text = "m4GUI — Safe Mode"
Title.TextColor3 = Color3.fromRGB(0, 255, 150)
Title.Font = Enum.Font.GothamBold
Title.TextSize = 20
Title.Parent = Main

-- Button container
local List = Instance.new("UIListLayout")
List.Padding = UDim.new(0, 6)
List.Parent = Main

-- Utility function for buttons
local function NewButton(txt, callback)
	local btn = Instance.new("TextButton")
	btn.Size = UDim2.new(1, -20, 0, 35)
	btn.Position = UDim2.new(0, 10, 0, 0)
	btn.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
	btn.TextColor3 = Color3.fromRGB(255, 255, 255)
	btn.Font = Enum.Font.Gotham
	btn.TextSize = 17
	btn.Text = txt
	btn.Parent = Main

	btn.MouseButton1Click:Connect(callback)

	return btn
end

-- Skybox changer
NewButton("Change Skybox", function()
	local sky = Instance.new("Sky")
	sky.SkyboxBk = "rbxassetid://616115533"
	sky.SkyboxDn = "rbxassetid://616113871"
	sky.SkyboxFt = "rbxassetid://616115601"
	sky.SkyboxLf = "rbxassetid://616115372"
	sky.SkyboxRt = "rbxassetid://616115703"
	sky.SkyboxUp = "rbxassetid://616115087"
	sky.Parent = game.Lighting
end)

-- Spawn Part
NewButton("Spawn Part", function()
	local p = Instance.new("Part")
	p.Size = Vector3.new(4,4,4)
	p.Position = game.Players.LocalPlayer.Character.HumanoidRootPart.Position + Vector3.new(0,6,0)
	p.Parent = workspace
end)

-- Local BTools (only works in your own places)
NewButton("Enable BTools", function()
	for _, id in pairs({73089190, 73089161, 73089152}) do
		local tool = Instance.new("HopperBin")
		tool.BinType = id
		tool.Parent = game.Players.LocalPlayer.Backpack
	end
end)

-- Notepad UI
NewButton("Open Notepad", function()
	local n = Instance.new("TextBox")
	n.Size = UDim2.new(1, -20, 0, 120)
	n.Position = UDim2.new(0, 10, 0, 0)
	n.Text = "Write here..."
	n.TextColor3 = Color3.new(1,1,1)
	n.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
	n.Font = Enum.Font.Code
	n.TextXAlignment = Enum.TextXAlignment.Left
	n.TextYAlignment = Enum.TextYAlignment.Top
	n.ClearTextOnFocus = false
	n.Parent = Main
end)
