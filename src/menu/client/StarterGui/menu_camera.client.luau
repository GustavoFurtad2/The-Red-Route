local camera = game.Workspace.CurrentCamera
local defaultCFrame = camera.CFrame

function updateCamera()
	camera.CFrame = game.Workspace.MenuCamera.CFrame
end

wait(0.1)

game:GetService("RunService").RenderStepped:Connect(updateCamera)