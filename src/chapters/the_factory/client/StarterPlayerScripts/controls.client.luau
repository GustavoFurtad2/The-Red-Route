local UserInputService = game:GetService("UserInputService")

local PlatformTypes : {type: number} = {

    PC      = 1,
    MOBILE  = 2,
    CONSOLE = 3
}

local PlayerType : number = PlatformTypes.PC

if UserInputService.TouchEnabled then

    PlayerType = PlatformTypes.MOBILE
elseif UserInputService.GamepadEnabled then

    PlayerType = PlatformTypes.CONSOLE
end