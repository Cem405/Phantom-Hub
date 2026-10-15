local tool = script.Parent
local allowedUser = "Stealbrainrot8269" -- change to your Roblox username
local grabDistance = 15

local grabbedPlayer = nil
local weld = nil

tool.Activated:Connect(function()
	local character = tool.Parent
	local player = game.Players:GetPlayerFromCharacter(character)
	
	if not player or player.Name ~= allowedUser then
		return
	end
	
	local root = character:FindFirstChild("HumanoidRootPart")
	if not root then return end
	
	-- Release if already grabbing
	if grabbedPlayer then
		if weld then weld:Destroy() end
		grabbedPlayer = nil
		return
	end
	
	-- Find nearby player
	for _, target in pairs(game.Players:GetPlayers()) do
		if target ~= player and target.Character and target.Character:FindFirstChild("HumanoidRootPart") then
			local targetRoot = target.Character.HumanoidRootPart
			if (targetRoot.Position - root.Position).Magnitude <= grabDistance then
				
				weld = Instance.new("WeldConstraint")
				weld.Part0 = root
				weld.Part1 = targetRoot
				weld.Parent = root
				
				grabbedPlayer = target
				break
			end
		end
	end
end)
