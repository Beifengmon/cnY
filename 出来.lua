local Players = game:GetService("Players")
local UIS = game:GetService("UserInputService")
local RunService = game:GetService("RunService")

local player = Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local H = character:WaitForChild("Humanoid")
local HRP = character:WaitForChild("HumanoidRootPart")

-- 全局变量
_G.speed = 16
_G.jump = 7.2
_G.noclip = false
_G.doubleJump = false
_G.fly = false
_G.uiMinimized = false

local flySpeed = 50
local jumpCount = 0

-- 角色重生自动应用
player.CharacterAdded:Connect(function(char)
    character = char
    H = char:WaitForChild("Humanoid")
    HRP = char:WaitForChild("HumanoidRootPart")
    H.WalkSpeed = _G.speed
    H.JumpHeight = _G.jump
end)

-- === GUI 科技渐变UI ===
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "TechPanel"
ScreenGui.Parent = player.PlayerGui

local Main = Instance.new("Frame")
Main.Size = UDim2.new(0, 240, 0, 340)
Main.Position = UDim2.new(0.02, 0, 0.2, 0)
Main.BackgroundColor3 = Color3.fromRGB(20, 20, 30)
Main.ClipsDescendants = true
Main.Active = true
Main.Draggable = true
Main.Parent = ScreenGui

local UICorner = Instance.new("UICorner")
UICorner.CornerRadius = UDim.new(0, 10)
UICorner.Parent = Main

local UIGradient = Instance.new("UIGradient")
UIGradient.Color = ColorSequence.new({
    ColorSequenceKeypoint.new(0, Color3.fromRGB(80, 180, 255)),
    ColorSequenceKeypoint.new(0.5, Color3.fromRGB(180, 100, 255)),
    ColorSequenceKeypoint.new(1, Color3.fromRGB(80, 220, 255))
})
UIGradient.Rotation = 80
UIGradient.Parent = Main

local UIStroke = Instance.new("UIStroke")
UIStroke.Color = Color3.fromRGB(100, 200, 255)
UIStroke.Thickness = 1
UIStroke.Parent = Main

-- 标题
local Title = Instance.new("TextLabel")
Title.Size = UDim2.new(1, 0, 0, 30)
Title.BackgroundTransparency = 1
Title.Text = "TECH PANEL"
Title.TextColor3 = Color3.new(1,1,1)
Title.TextSize = 18
Title.Font = Enum.Font.GothamBold
Title.Parent = Main

-- 状态显示
local Stats = Instance.new("TextLabel")
Stats.Size = UDim2.new(1, 0, 0, 24)
Stats.Position = UDim2.new(0, 0, 0, 30)
Stats.BackgroundTransparency = 1
Stats.TextColor3 = Color3.new(1,1,1)
Stats.TextSize = 14
Stats.Font = Enum.Font.Code
Stats.Text = "Speed: " .. _G.speed .. "  Jump: " .. _G.jump
Stats.Parent = Main

-- 按钮创建函数
local function Btn(txt, x, y, w, h)
    local b = Instance.new("TextButton")
    b.Size = UDim2.new(0, w, 0, h)
    b.Position = UDim2.new(0, x, 0, y)
    b.BackgroundColor3 = Color3.fromRGB(40,40,60)
    b.TextColor3 = Color3.new(1,1,1)
    b.Text = txt
    b.TextSize = 14
    b.Font = Enum.Font.Gotham
    local c = Instance.new("UICorner")
    c.CornerRadius = UDim.new(0, 6)
    c.Parent = b
    b.Parent = Main
    return b
end

-- 按钮
local SpeedUp = Btn("Speed +", 10, 60, 100, 30)
local SpeedDn = Btn("Speed -", 130, 60, 100, 30)
local JumpUp  = Btn("Jump +", 10, 100, 100, 30)
local JumpDn  = Btn("Jump -", 130, 100, 100, 30)
local ClipBtn = Btn("Noclip: OFF", 10, 140, 220, 30)
local DJump   = Btn("MultiJump: OFF", 10, 180, 220, 30)
local FlyBtn  = Btn("Fly: OFF", 10, 220, 220, 30)
local MiniBtn = Btn("Minimize", 10, 260, 100, 30)
local CloseBtn= Btn("Close", 130, 260, 100, 30)

-- 最小化/还原
MiniBtn.MouseButton1Click:Connect(function()
    _G.uiMinimized = not _G.uiMinimized
    if _G.uiMinimized then
        Main.Size = UDim2.new(0, 120, 0, 40)
        MiniBtn.Text = "Maximize"
    else
        Main.Size = UDim2.new(0, 240, 0, 340)
        MiniBtn.Text = "Minimize"
    end
end)

-- 关闭UI
CloseBtn.MouseButton1Click:Connect(function()
    ScreenGui:Destroy()
end)

-- === 速度 ===
SpeedUp.MouseButton1Click:Connect(function()
    _G.speed += 5
    H.WalkSpeed = _G.speed
    Stats.Text = "Speed: " .. _G.speed .. "  Jump: " .. _G.jump
end)
SpeedDn.MouseButton1Click:Connect(function()
    _G.speed = math.max(16, _G.speed - 5)
    H.WalkSpeed = _G.speed
    Stats.Text = "Speed: " .. _G.speed .. "  Jump: " .. _G.jump
end)

-- === 跳跃 ===
JumpUp.MouseButton1Click:Connect(function()
    _G.jump += 1
    H.JumpHeight = _G.jump
    Stats.Text = "Speed: " .. _G.speed .. "  Jump: " .. _G.jump
end)
JumpDn.MouseButton1Click:Connect(function()
    _G.jump = math.max(5, _G.jump - 1)
    H.JumpHeight = _G.jump
    Stats.Text = "Speed: " .. _G.speed .. "  Jump: " .. _G.jump
end)

-- === 穿墙 ===
ClipBtn.MouseButton1Click:Connect(function()
    _G.noclip = not _G.noclip
    ClipBtn.Text = _G.noclip and "Noclip: ON" or "Noclip: OFF"
end)

-- === 连跳 ===
DJump.MouseButton1Click:Connect(function()
    _G.doubleJump = not _G.doubleJump
    DJump.Text = _G.doubleJump and "MultiJump: ON" or "MultiJump: OFF"
end)

H.StateChanged:Connect(function(_, new)
    if new == Enum.HumanoidStateType.Landed then jumpCount = 0 end
end)

UIS.JumpRequest:Connect(function()
    if not _G.doubleJump then return end
    if jumpCount < 2 and H:GetState() == Enum.HumanoidStateType.Freefall then
        jumpCount += 1
        H:ChangeState(Enum.HumanoidStateType.Jumping)
    end
end)

-- === 飞行（新增）===
FlyBtn.MouseButton1Click:Connect(function()
    _G.fly = not _G.fly
    FlyBtn.Text = _G.fly and "Fly: ON" or "Fly: OFF"
    H.GravityScale = _G.fly and 0 or 1
end)

RunService.Heartbeat:Connect(function()
    -- 穿墙
    if character then
        for _,v in pairs(character:GetDescendants()) do
            if v:IsA("BasePart") then
                v.CanCollide = not _G.noclip
            end
        end
    end
    
    -- 飞行
    if _G.fly and HRP then
        H.Velocity = Vector3.new(0,0,0)
        local move = Vector3.new(0,0,0)
        
        if UIS:IsKeyDown(Enum.KeyCode.W) then move += Vector3.new(0,1,0) end
        if UIS:IsKeyDown(Enum.KeyCode.S) then move += Vector3.new(0,-1,0) end
        if UIS:IsKeyDown(Enum.KeyCode.A) then move += Vector3.new(-1,0,0) end
        if UIS:IsKeyDown(Enum.KeyCode.D) then move += Vector3.new(1,0,0) end
        if UIS:IsKeyDown(Enum.KeyCode.Space) then move += Vector3.new(0,1,0) end
        if UIS:IsKeyDown(Enum.KeyCode.LeftControl) then move += Vector3.new(0,-1,0) end
        
        if move.Magnitude > 0 then
            HRP.CFrame = HRP.CFrame + move.Unit * flySpeed * RunService.Heartbeat:Wait()
        end
    end
end)
