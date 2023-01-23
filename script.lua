-- Made by snow_fear#7003

if loaded == true then

	game:GetService("StarterGui"):SetCore("SendNotification",{
		Title = "Loaded",
		Text = "The script is already running!",  -- Checks if script is already loaded
		Icon = "rbxassetid://6022668888"
	})
	return
end

pcall(function() getgenv().loaded = true end)
-- Instances:

local Main = Instance.new("ScreenGui")
local Button = Instance.new("TextButton")
local UICorner = Instance.new("UICorner")

--Properties:

Main.Name = "Main"
Main.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
Main.ResetOnSpawn = false

Button.Name = "Button"
Button.Parent = Main
Button.BackgroundColor3 = Color3.fromRGB(0, 4, 255)
Button.BorderSizePixel = 0
Button.Position = UDim2.new(0.760210335, 0, 0.27510047, 0)
Button.Size = UDim2.new(0, 50, 0, 31)
Button.Font = Enum.Font.LuckiestGuy
Button.Text = "Start"
Button.TextColor3 = Color3.fromRGB(255, 255, 255)
Button.TextSize = 17.000
Button.TextWrapped = true

UICorner.Parent = Button

-- Scripts:

local function YTNSK_fake_script() -- Button.Toggle 
	local script = Instance.new('LocalScript', Button)

	local Player = game:GetService("Players").LocalPlayer
	local valid = true
	local args = {
		[1] = CFrame.new(1,1,1) -- Any args work here lmao
	}

	function repeating(State)
		if State == "On" then
			Player.PlayerGui.Main.Button.Text = "On"
			valid = false
			State = "Off"
			game.Players.LocalPlayer.CharacterAdded:Connect(function()
				valid = true
				game:GetService("Players").LocalPlayer.Character:WaitForChild("HumanoidRootPart")  -- Debug
				valid = false
			end)
			while valid == false do
				wait(0.1)
				game:GetService("Players").LocalPlayer.Character:WaitForChild("HumanoidRootPart")
                game:GetService("Players").LocalPlayer.Character:WaitForChild("Main") -- The function itself (Kinda messy)
                game:GetService("Players").LocalPlayer.Character.Main:WaitForChild("Swing")
				game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-47.752182, 1896.27734, 206.116669) -- Tomura's CFrame
				game:GetService("Players").LocalPlayer.Character.Main.Swing:FireServer(unpack(args))
		end 
	else
			Player.PlayerGui.Main.Button.Text = "Off"
			State = "On"
			valid = true
		end
	end

	Player.PlayerGui.Main.Button.MouseButton1Click:Connect(function() -- A little bit more clean
		if valid then
			repeating("On")
		else
			repeating("Off")
		end
	end)

end
coroutine.wrap(YTNSK_fake_script)()
local function DICPVYF_fake_script() -- Button.Drag 
	local script = Instance.new('LocalScript', Button)

	--Credits go to whoever made this script. (This one runs independently, it just makes the button to drag smoothly, but i could certainly be replace by the legacy draggable)

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
coroutine.wrap(DICPVYF_fake_script)()
