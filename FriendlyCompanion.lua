if getgenv().friendOn and string.find(string.lower(identifyexecutor()),"krampus") then
	if getgenv().alreadyActive == true then
		return
	else
		if not isfolder("FriendlyCompanion") then
			game:GetService("StarterGui"):SetCore("SendNotification",{
				Title = "Failed to find FriendlyCompanion files.",
				Text = "(Ensure that all files are set up accordingly.)",
				Duration = 5
			})
			return
		end
		getgenv().alreadyActive = true
	end
	task.wait(3)
	local Player = game:GetService("Players").LocalPlayer
	local TweenService = game:GetService("TweenService")
	
	local friendSummoning = false

	local function Tween(Object, TweenDirection, TweenStyle, TweenTime, Goal)
		local TInfo = TweenDirection and TweenInfo.new(TweenTime, TweenStyle, TweenDirection) or TweenInfo.new(TweenTime, TweenStyle)
		local Tween = TweenService:Create(Object, TInfo, Goal)
		Tween:Play()
		return Tween
	end

	local function createFriend()
		local friend = Instance.new("Part")
		friend.Name = "FriendCompanion"
		friend.Anchored = false
		friend.CanCollide = false
		friend.CanTouch = false
		friend.Color = Color3.fromRGB(248, 248, 248)
		friend.Material = Enum.Material.Neon
		friend.Size = Vector3.new(0.734, 0.734, 0.734)
		friend.Shape = Enum.PartType.Ball
		friend.Massless = true
		local friendlyFace = Instance.new("Decal")
		friendlyFace.Name = "FriendlyFace"
		friendlyFace.Transparency = 0
		friendlyFace.Texture = "rbxasset://textures/face.png"
		friendlyFace.Face = Enum.NormalId.Front
		friendlyFace.Parent = friend
		local ambientWind = Instance.new("Sound")
		ambientWind.Name = "WindAmbient"
		ambientWind.SoundId = "rbxassetid://9114228774"
		ambientWind.RollOffMaxDistance = 45
		ambientWind.RollOffMinDistance = 5
		ambientWind.RollOffMode = Enum.RollOffMode.InverseTapered
		ambientWind.Looped = true
		ambientWind.Volume = 0.1
		ambientWind.Parent = friend
		ambientWind:Play()
		local attachment = Instance.new("Attachment")
		attachment.Name = "HoverAttachment"
		attachment.Parent = friend
		attachment.CFrame = CFrame.new(0, -0.4, 0)
		local hoverParticle = Instance.new("ParticleEmitter")
		hoverParticle.Name = "HoverEffect"
		hoverParticle.Brightness = 3
		hoverParticle.Color = ColorSequence.new{
			ColorSequenceKeypoint.new(0, Color3.fromRGB(212, 255, 205)),
			ColorSequenceKeypoint.new(1, Color3.fromRGB(212, 255, 205))
		}
		hoverParticle.LightEmission = -1
		hoverParticle.Orientation = Enum.ParticleOrientation.VelocityPerpendicular
		hoverParticle.Texture = "rbxassetid://14050094484"
		hoverParticle.Size = NumberSequence.new({
			NumberSequenceKeypoint.new(0, 1.5, 0),
			NumberSequenceKeypoint.new(1, 0, 0)
		})
		hoverParticle.Squash = NumberSequence.new({
			NumberSequenceKeypoint.new(0, 0, 0.164),
			NumberSequenceKeypoint.new(1, 0, 0)
		})
		hoverParticle.Transparency = NumberSequence.new({
			NumberSequenceKeypoint.new(0, 1, 0),
			NumberSequenceKeypoint.new(0.473, 0.706, 0.0188),
			NumberSequenceKeypoint.new(1, 1, 0)
		})
		hoverParticle.ZOffset = 0
		hoverParticle.EmissionDirection = Enum.NormalId.Top
		hoverParticle.Enabled = true
		hoverParticle.Lifetime = NumberRange.new(2, 2)
		hoverParticle.Rate = 7
		hoverParticle.Rotation = NumberRange.new(0, 0)
		hoverParticle.RotSpeed = NumberRange.new(-200, 200)
		hoverParticle.Speed = NumberRange.new(0.01, 0.01)
		hoverParticle.Shape = Enum.ParticleEmitterShape.Box
		hoverParticle.ShapeInOut = Enum.ParticleEmitterShapeInOut.InAndOut
		hoverParticle.ShapeStyle = Enum.ParticleEmitterShapeStyle.Volume
		hoverParticle.Acceleration = Vector3.new(0, -0.3, 0)
		hoverParticle.LockedToPart = true
		hoverParticle.Parent = attachment
		return friend
	end
	
	local function randomFriendPrompt(Question_Or_Fact)
		local questionTable = {
			"Did you know that octopuses have three hearts? Pretty interesting haha!",
			"If you could visit any fictional world, where would you go?",
			"What's the weirdest dream you've ever had? I wish I had dreams.",
			"If you were a character in a video game, what would your special ability be?",
			"If you could only listen to one song for the rest of your life, what would it be?",
			"What's the most interesting fact you've learned recently? Hopefully it was from me haha!",
			"If you could meet any historical figure, who would it be and why? I think I would see Bonzi.",
			"What's something you've always wanted to learn but never had the chance to?",
			"If you could rename colors, what would you call them? I wouldn't even know where to start hehe.",
			"What's the best piece of advice you've ever received?",
			"If you could switch lives with someone for a day, who would it be? I would switch with you friend...",
			"If you could instantly master any skill, what would it be? Mine would be meditation. It's hard to focus these days.",
			"What's your favorite thing about yourself? Me personally I love being a ball!",
			
		}
		local factTable = {
			"The world's oldest known recipe is for beer. I would have never thought that.",
			"Honey never spoils. Archaeologists have found pots of honey in ancient Egyptian tombs that are over 3,000 years old and still perfectly edible!",
			"The shortest war in history was between Zanzibar and England in 1896. Zanzibar surrendered after 38 minutes.",
			"I can bypass roblox's chat filtering system... But dont worry, I'm your all inclusive friendly companion, I won't say such words!",
			"A group of flamingos is called a 'flamboyance. How flamboyantly interesting is that!",
			"There are more possible iterations of a game of chess than there are atoms in the known universe. Isn't that mind atomizing!",
			"A group of hedgehogs is called a 'prickle. Now I feel like eating pickles. Delicious!",
			"The Eiffel Tower can be 15 cm taller during the summer due to thermal expansion. Science is a wonderful thing.",
			"The world's largest desert is Antarctica. I bet you would have never known that one!",
			"Did you know that the human brain is more active during sleep than during the day? Don't ask how I know this...",
			"The longest recorded flight of a chicken was 13 seconds. Haha chicken's are so cute. And tasty!",
			"A 'jiffy' is an actual unit of time, equivalent to 1/100th of a second.",
			"The dot over the letter 'i' is called a tittle. What an interesting name!",
		}
		local promptString: string
		if Question_Or_Fact == 1 then
			promptString = questionTable[math.random(1, #questionTable)]
		else
			promptString = factTable[math.random(1, #factTable)]
		end
		return promptString
	end

	local function friendChat(friend, message)
		if friend.Parent == game.Workspace then
			game:GetService("Chat"):Chat(friend, message)
		end
	end

	local function friendDisappear(friend)
		Tween(friend,Enum.EasingDirection.InOut, Enum.EasingStyle.Sine, 1.75, {
			Transparency = 1
		})
		friendChat(friend," ̷̨̛̗͚͈̪͉̺̘͙͔̓͆̏̉̂́̈͂͗̆͘͝͝-̶̡̩͚̹͖̳̝̞̳͚͓͇̈͐͜ͅ ̷̰͙̭̳̳̻͉̍̔͌͜9̷̢̧͈̰̤͚̝̘̞̙̲̦̹̪̌̈̃̔͐̉͑̉͗̈́͝͠͠v̶̢̛̝̼̖̪̜̭̟̯̹̙͉̬̦̯̦̞͌̓̌̔̌͑̈́̀̈̾͆͝ͅĵ̷̧̛̝̽ẅ̶͓̳̣̺̳̖́̐͊̏̾͝H̷̛͕̘̤̰̦̖͍͍͑́̈͐̌̀͌̅̌̑̽̎̈̀̈́ͅA̴̡̧̡͕̮̬̜̯̻͓̽̓͛̏̆͂̀̌͒̊̌̌̽ͅṭ̸͓̽̂̈́̀̉̉͌̊̀͘͝s̸̛̲͈̹̝͊̑̿̓̌͛͐̐̍̀̃̕̚̚͝ ̷̟̰͈͆̎̒͗̎̆́̈͊͌̽̀̚͝ḩ̵̨̢̩̺͈͕̚ä̸̢͙̞̖͚̦̝̮͖̟̱̞̼̠̦́̽̈́̇̀͗̂͌̈́̈́̈͐̆̕͜͠p̵̥͕͍̟̪̻̲͕͍͇͙̰̿́͛̈́̑̿̄̂̋̇͊͘̕͘̚͝P̵̛̛̦̩͎̓́͗͗̃̉͌̆́̑̈́̐͌̚̕͜͝E̴̛̲̗̼͕̻̭͓̜̯͉̪̼͔̰̮̲͚̲̲̙̍̀̍͋̔̏͑͂̓͆͋̆̉̐̿̕͘͝͝n̴̲̟̻̹͉͚̱̝̙̠̞̗̦͍̄́̀̂͘ͅi̵̝̺̼͔̗͖̬̝̣͕̝̅͘ͅŅ̵̫̹̥̮̘̘͕̟͎̠͖̳̩̥̀̆͗̃̽͒̈̊̕͜g̵̨̢̡̛̱͖͙̞͚͈̹̹̀̈̃́͑͒̆́̀̌́̊̌̔̒̑̈̕̕0̷̢͍̺̤͇̗̻̘̦͔͖̟̼̯̦̖̤̓̌̔̋͛̄͛͘̕͠͝ͅ")
		task.wait(1.75)
		friend:Destroy()
	end

	local timesSpawned = 0
	local function friendActivate(character)
		print("Created New Friend")
		local friend = createFriend()
		friend.CFrame = character.HumanoidRootPart.CFrame
		friend.Parent = game.Workspace
		timesSpawned = timesSpawned + 1

		if timesSpawned > 1 then
			friendChat(friend, "Seems like something interrupted us. Don't worry, I will always return to your side my friend!")
		else
			local response = math.random(1, 4)
			if response == 1 then
				friendChat(friend, "Hi "..Player.DisplayName..", I will be your friendly companion today.")
			elseif response == 2 then
				friendChat(friend, "Hey there "..Player.DisplayName..", I will be your friendly companion from now till forever...")
			elseif response == 3 then
				friendChat(friend, "Finally someone has woken me from my slumber... Who are you?")
				task.delay(2.5, function()
					friendChat(friend, "Ah, your name is "..Player.DisplayName..". What a beautiful name! I will be your friendly companion from now on.")
				end)
			elseif response == 4 then
				friendChat(friend, "ahaha, go on Ḱ̶̞̭̼̱͓͙͈̎́͑̈͌̑̃̒̉̈́̆͌͜ͅͅͅI̸̧̡͖̜̟͕̺͉̘̠͇̲̜͎̳͎̟̘͐̔͗̒̃͑̚L̵͕̏̕̕̕L̷̤̤͗̅̐̿̐́͊ ̵̧̡̧̯̣̺̭̳̩͈̦͚̙̞͎̥͆͜Ḩ̸̧̪̥̩͖̘̗̣̥̘̫̯̺͓͕̄̆̄́̉̌͘͜͠͠Ī̵̛̦̩̪̬͚̠̲͇̈͌̈́̈̎̀͆̐̎̏̋̕͘͜ͅͅ-.. Hello, I will be your f̵͚̼̜̭͍̺̦̦͈̲̏́́̈́̐͐̐̍͝r̶̢̟͉̟̈́̌̇̀́̅̌̐i̵̭̩̟̖̭͇͕̜̅̈͋͗̆̒́̈́̾́͠ͅȩ̷̨̩̮̰̺̮̻̬̪̳̭͔̲̾̔̏͐͜n̶̝̦͒́̒̉͌́ḍ̷͔̼̦̬̼̗̼̰̜̓̇̿͐͋̀l̵̛͍͆̑̂͆͌̐̈̚y̶̱͈̖̩̒̊̒̅̚̚ companion today!")
			end
		end

		local bodyPos = Instance.new("BodyPosition", friend)
		bodyPos.MaxForce = Vector3.new(math.huge, math.huge, math.huge)

		local bodyGyro = Instance.new("BodyGyro", friend)
		bodyGyro.MaxTorque = Vector3.new(math.huge, math.huge, math.huge)

		local friendTracking = true
		local inPrompt = false
		task.spawn(function()
			while true do
				task.wait()
				if not friend then
					break
				end
				if not friendTracking then
					break
				end
				if character:FindFirstChild("HumanoidRootPart") and character:FindFirstChild("Head") and friend then
					if (friend.Position - character.HumanoidRootPart.Position).Magnitude > 200 then
						friend.Position = character.HumanoidRootPart.Position + Vector3.new(2, 2, 3)
						local transportSound = Instance.new("Sound")
						transportSound.Name = "TransportSound"
						transportSound.Parent = friend
						transportSound.SoundId = "rbxassetid://5694614512"
						transportSound.Looped = false
						transportSound.RollOffMaxDistance = 200
						transportSound.RollOffMode = Enum.RollOffMode.InverseTapered
						transportSound.Volume = 0.3
						transportSound:Play()
						game.Debris:AddItem(transportSound, 1.3)
						Tween(friend,Enum.EasingDirection.InOut, Enum.EasingStyle.Quad, 0.15, {
							Color = Color3.fromRGB(98, 37, 209)
						})
						task.delay(0.5, function()
							if inPrompt then
								Tween(friend,Enum.EasingDirection.InOut, Enum.EasingStyle.Quad, 0.45, {
									Color = Color3.fromRGB(91, 154, 76)
								})
							else
								Tween(friend,Enum.EasingDirection.InOut, Enum.EasingStyle.Quad, 0.55, {
									Color = Color3.fromRGB(248, 248, 248)
								})
							end
						end)
					end
					bodyPos.Position = character.HumanoidRootPart.Position + Vector3.new(2, 2, 3)
					bodyGyro.CFrame = CFrame.new(bodyGyro.Parent.Position,character.Head.Position)
				end
			end
		end)
		task.spawn(function()
			while true do
				task.wait(math.random(40, 63))
				if not friend then
					break
				end
				if not friendTracking then
					break
				end
				if not character:FindFirstChild("HumanoidRootPart") then
					break
				end
				local Question_Or_Fact = math.random(1, 2)
				local promptAssetId
				if Question_Or_Fact == 1 then
					promptAssetId = getcustomasset("FriendlyCompanion/QuestionPrompt.mp3", false)
				else
					promptAssetId = getcustomasset("FriendlyCompanion/FactPrompt.mp3", false)
				end
				local startPromptVoice = Instance.new("Sound")
				startPromptVoice.Name = "Prompting"
				startPromptVoice.Parent = friend
				startPromptVoice.SoundId = promptAssetId
				startPromptVoice.Looped = false
				startPromptVoice.RollOffMaxDistance = 100
				startPromptVoice.RollOffMode = Enum.RollOffMode.InverseTapered
				startPromptVoice.Volume = 1.5
				startPromptVoice:Play()
				task.wait(2.5)
				startPromptVoice:Destroy()
				friendChat(friend, randomFriendPrompt(Question_Or_Fact))
				inPrompt = true
				local messageSound = Instance.new("Sound")
				messageSound.Name = "MessageSound"
				messageSound.Parent = friend
				messageSound.SoundId = "rbxassetid://150975887"
				messageSound.Looped = false
				messageSound.RollOffMaxDistance = 100
				messageSound.RollOffMode = Enum.RollOffMode.InverseTapered
				messageSound.Volume = 0.15
				messageSound:Play()
				Tween(friend,Enum.EasingDirection.InOut, Enum.EasingStyle.Quad, 0.3, {
					Color = Color3.fromRGB(91, 154, 76)
				})
				task.wait(15)
				inPrompt = false
				messageSound:Destroy()
				Tween(friend,Enum.EasingDirection.InOut, Enum.EasingStyle.Quad, 0.3, {
					Color = Color3.fromRGB(248, 248, 248)
				})
			end
		end)
		Player.CharacterRemoving:Connect(function()
			friendTracking = false
			friendDisappear(friend)
		end)
	end
	--[[if Player.Character then
		task.wait(0.5)
		friendActivate(Player.Character)
	end]]
	Player.Chatted:Connect(function(message)
		if not Player.Character then
			return
		end
		if string.lower(message) == "vocate amicus" then
			friendSummoning = true
			if not game.Workspace:FindFirstChild("FriendCompanion") then
				friendActivate(Player.Character)
			end
		end
		if string.lower(message) == "coepi amicus" then
			friendSummoning = false
			if game.Workspace:FindFirstChild("FriendCompanion") then
				friendDisappear(game.Workspace:FindFirstChild("FriendCompanion"))
			end
		end
	end)

	Player.CharacterAdded:Connect(function(Character)
		if friendSummoning then
			task.wait(2)
			friendActivate(Character)
		end
	end)
end
