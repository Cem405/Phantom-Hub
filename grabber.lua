local Player = game.Players.LocalPlayer
local Character = Player.Character
local Humanoid = Character:WaitForChild("Humanoid")

Humanoid.Name = "x"

local ClonedHumanoid = Character.x:Clone()

ClonedHumanoid.Parent = Character

ClonedHumanoid.Name = "Humanoid"

Character.x:Destroy()

local Camera = workspace.CurrentCamera
Camera.CameraSubject = Character.Humanoid
Character.Humanoid.WalkSpeed = 15000000000000000
