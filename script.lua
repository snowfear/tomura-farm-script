-- Made by snow_fear#7003
-- Instances:

local Main = Instance.new("ScreenGui")
local Button = Instance.new("TextButton")
local UICorner = Instance.new("UICorner")

--Properties:

Main.Name = "Main"
Main.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")

Button.Name = "Button"
Button.Parent = Main
Button.BackgroundColor3 = Color3.fromRGB(0, 4, 255)
Button.BorderSizePixel = 0
Button.Position = UDim2.new(0.705338001, 0, 0.27510047, 0)
Button.Size = UDim2.new(0, 108, 0, 31)
Button.Font = Enum.Font.LuckiestGuy
Button.Text = "Undefined"
Button.TextColor3 = Color3.fromRGB(255, 255, 255)
Button.TextScaled = true
Button.TextSize = 14.000
Button.TextWrapped = true

UICorner.Parent = Button

-- Scripts:

local function DAFFX_fake_script() -- Button.Toggle 
	local script = Instance.new('LocalScript', Button)

	local Encendido = true
	local Player = game:GetService("Players").LocalPlayer
	local valid = true
	local pl = game.Players.LocalPlayer.Character.HumanoidRootPart
	local humanoid = game.Players.LocalPlayer.Character.Humanoid
	local location = CFrame.new(-47.752182, 1896.27734, 206.116669)
	
	function Imprimir(State)
		if State == "On" then
			Player.PlayerGui.Main.Button.Text = "Encendido"
			Encendido = false
			valid = false
			State = "Off"
			while valid == false do
				wait(0.5)
				game:GetService("Players").LocalPlayer.Character.Clones.Z:FireServer()
				pl.CFrame = location
			end
		else
			print(State)
			Player.PlayerGui.Main.Button.Text = "Apagado"
			Encendido = true
			State = "On"
			valid = true
			end
		end
	
	Player.PlayerGui.Main.Button.MouseButton1Click:Connect(function()
		if Encendido then
			Imprimir("On")
		else
			Imprimir("Off")
			end
	end)
	
end
coroutine.wrap(DAFFX_fake_script)()
local function BZHTEMD_fake_script() -- Button.Drag 
	local script = Instance.new('LocalScript', Button)

	--Credits go to whoever made this script.
	
	local UIS = game:GetService("UserInputService")
	function drag (Frame)
		dragToggle = nil
		dragSpeed = 0.23
		dragInput = nil
		dragStart = nil
		dragPos = nil
		function updateInput(input)
			Delta = input.Position - dragStart
			Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + Delta.X, startPos.Y.Scale, startPos.Y.Offset + Delta.Y)
			game:GetService("TweenService"):Create(Frame, TweenInfo.new(0.25), {Position = Position}):Play()
		end
		Frame.InputBegan:Connect(function(input)
			if (input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch) and UIS:GetFocusedTextBox() == nil then
				dragToggle = true
				dragStart = input.Position
				startPos = Frame.Position
				input.Changed:Connect(function()
					if input.UserInputState == Enum.UserInputState.End then
						dragToggle = false
					end
				end)
			end
		end)
		Frame.InputChanged:Connect(function(input)
			if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
				dragInput = input
			end
		end)
		game:GetService("UserInputService").InputChanged:Connect(function(input)
			if input == dragInput and dragToggle then
				updateInput(input)
			end
		end)
	end
	drag(script.Parent)
	
end
coroutine.wrap(BZHTEMD_fake_script)()
