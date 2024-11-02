local car = workspace:WaitForChild("Car")
local carPathPoints = workspace:WaitForChild("CarPath"):GetChildren()

local remainCarPathPoints = #carPathPoints

local TweenService = game:GetService("TweenService")
local duration = 4

table.sort(carPathPoints, function(a, b)

    return tonumber(a.Name) < tonumber(b.Name)
end)

local function rotateCar(toPosition, toAngle)

    local tweenInfo = TweenInfo.new(duration, Enum.EasingStyle.Linear, Enum.EasingDirection.Out)

    local objective = {CFrame = toPosition.CFrame * CFrame.fromEulerAngles(math.rad(toAngle.x), math.rad(toAngle.y), math.rad(toAngle.z))}

    local tween = TweenService:Create(car.PrimaryPart, tweenInfo, objective)

    tween:Play()

    return tween.Completed

end

local function moveCar(toPosition)

    local tweenInfo = TweenInfo.new(duration, Enum.EasingStyle.Linear, Enum.EasingDirection.Out)

    local objective = {CFrame = toPosition.CFrame}

    local tween = TweenService:Create(car.PrimaryPart, tweenInfo, objective)

    tween:Play()
    
    tween.Completed:Wait()

    remainCarPathPoints = remainCarPathPoints - 1


    if remainCarPathPoints >= 2 then

        rotateCar(toPosition, CFrame.new(0, -90, 0)):Wait()
    end
end
	
for _, point in next, carPathPoints do

    moveCar(point)
end
