--[[
	科技感多功能控制面板 - LocalScript
	作者：助手
	功能：
		1. 速度 +/- (全局变量)
		2. 穿墙 开关 (全局变量)
		3. 连续跳跃 开关
		4. 跳跃高度 +/-
		5. UI 缩放/还原
		6. 彩色渐变背景 + 科技感
		7. 关闭/显示 UI
]]

-- 获取必要服务
local player = game:GetService("Players").LocalPlayer
local userInputService = game:GetService("UserInputService")
local runService = game:GetService("RunService")
local tweenService = game:GetService("TweenService")

-- 等待角色加载
local character = player.Character or player.CharacterAdded:Wait()
local humanoid = character:WaitForChild("Humanoid")

-- 状态变量
local speed = 16                       -- 默认行走速度
local jumpHeight = 7.2                  -- 默认跳跃高度 (对应 JumpPower 约 50)
local noclipEnabled = false
local infiniteJumpEnabled = false
local uiVisible = true
local uiScale = 1

-- 存储原始值（用于恢复等，可选）
local originalSpeed = humanoid.WalkSpeed
local originalJumpHeight = humanoid.JumpHeight

-- 创建 ScreenGui
local screenGui = Instance.new("ScreenGui")
screenGui.Name = "TechControlPanel"
screenGui.ResetOnSpawn = false          -- 角色重生时不重置
screenGui.Parent = player:WaitForChild("PlayerGui")

-- 主框架 (用于整体缩放和隐藏)
local mainFrame = Instance.new("Frame")
mainFrame.Name = "MainFrame"
mainFrame.Size = UDim2.new(0, 350, 0, 300)
mainFrame.Position = UDim2.new(0.5, -175, 0.5, -150)
mainFrame.BackgroundColor3 = Color3.new(0.05, 0.05, 0.1)
mainFrame.BorderSizePixel = 0
mainFrame.Parent = screenGui

-- 圆角
local corner = Instance.new("UICorner")
corner.CornerRadius = UDim.new(0, 8)
corner.Parent = mainFrame

-- 渐变背景 (科技感)
local gradient = Instance.new("UIGradient")
gradient.Color = ColorSequence.new({
	ColorSequenceKeypoint.new(0, Color3.new(0.2, 0.6, 1)),    -- 亮蓝
	ColorSequenceKeypoint.new(0.5, Color3.new(0.8, 0.2, 0.8)), -- 紫
	ColorSequenceKeypoint.new(1, Color3.new(1, 0.5, 0.2))      -- 橙
})
gradient.Rotation = 45                                          -- 45度渐变
gradient.Parent = mainFrame

-- 添加一点发光效果 (可选)
local stroke = Instance.new("UIStroke")
stroke.Color = Color3.new(1, 1, 1)
stroke.Thickness = 1
stroke.Transparency = 0.7
stroke.Parent = mainFrame

-- 标题
local title = Instance.new("TextLabel")
title.Name = "Title"
title.Size = UDim2.new(1, 0, 0, 40)
title.Position = UDim2.new(0, 0, 0, 5)
title.BackgroundTransparency = 1
title.Text = "⚡ 控制面板 ⚡"
title.TextColor3 = Color3.new(1, 1, 1)
title.TextSize = 22
title.Font = Enum.Font.SourceSansBold
title.TextStrokeTransparency = 0.5
title.TextStrokeColor3 = Color3.new(0, 0.5, 1)
title.Parent = mainFrame

-- 布局 (方便排列)
local layout = Instance.new("UIListLayout")
layout.Padding = UDim.new(0, 8)
layout.HorizontalAlignment = Enum.HorizontalAlignment.Center
layout.VerticalAlignment = Enum.VerticalAlignment.Top
layout.Parent = mainFrame

-- 辅助函数：创建带渐变背景的按钮
local function createButton(text, width, height)
	local btnFrame = Instance.new("Frame")
	btnFrame.BackgroundColor3 = Color3.new(0.2, 0.2, 0.3)
	btnFrame.Size = UDim2.new(0, width, 0, height)
	btnFrame.BackgroundTransparency = 0.3
	btnFrame.BorderSizePixel = 0
	btnFrame.Parent = mainFrame

	local btnCorner = Instance.new("UICorner")
	btnCorner.CornerRadius = UDim.new(0, 6)
	btnCorner.Parent = btnFrame

	local btnGradient = Instance.new("UIGradient")
	btnGradient.Color = ColorSequence.new({
		ColorSequenceKeypoint.new(0, Color3.new(0.3, 0.7, 1)),
		ColorSequenceKeypoint.new(1, Color3.new(0.7, 0.3, 1))
	})
	btnGradient.Rotation = 90
	btnGradient.Parent = btnFrame

	local btnStroke = Instance.new("UIStroke")
	btnStroke.Color = Color3.new(1, 1, 1)
	btnStroke.Thickness = 1
	btnStroke.Transparency = 0.6
	btnStroke.Parent = btnFrame

	local btnText = Instance.new("TextLabel")
	btnText.Size = UDim2.new(1, 0, 1, 0)
	btnText.BackgroundTransparency = 1
	btnText.Text = text
	btnText.TextColor3 = Color3.new(1, 1, 1)
	btnText.TextSize = 16
	btnText.Font = Enum.Font.SourceSansBold
	btnText.Parent = btnFrame

	-- 按钮事件 (点击)
	local button = btnFrame
	button.MouseEnter:Connect(function()
		tweenService:Create(btnFrame, TweenInfo.new(0.2), {BackgroundTransparency = 0}):Play()
	end)
	button.MouseLeave:Connect(function()
		tweenService:Create(btnFrame, TweenInfo.new(0.2), {BackgroundTransparency = 0.3}):Play()
	end)

	return button
end

-- 速度控制行
local speedLabel = Instance.new("TextLabel")
speedLabel.Size = UDim2.new(0.8, 0, 0, 30)
speedLabel.BackgroundTransparency = 1
speedLabel.Text = "速度: " .. speed
speedLabel.TextColor3 = Color3.new(1, 1, 1)
speedLabel.TextSize = 18
speedLabel.Font = Enum.Font.SourceSans
speedLabel.Parent = mainFrame

local speedDecBtn = createButton("- 速度", 80, 30)
speedDecBtn.MouseButton1Click:Connect(function()
	speed = math.max(1, speed - 2)
	humanoid.WalkSpeed = speed
	speedLabel.Text = "速度: " .. speed
end)

local speedIncBtn = createButton("+ 速度", 80, 30)
speedIncBtn.MouseButton1Click:Connect(function()
	speed = math.min(200, speed + 2)
	humanoid.WalkSpeed = speed
	speedLabel.Text = "速度: " .. speed
end)

-- 跳跃高度控制行
local jumpLabel = Instance.new("TextLabel")
jumpLabel.Size = UDim2.new(0.8, 0, 0, 30)
jumpLabel.BackgroundTransparency = 1
jumpLabel.Text = "跳跃高度: " .. string.format("%.1f", jumpHeight)
jumpLabel.TextColor3 = Color3.new(1, 1, 1)
jumpLabel.TextSize = 18
jumpLabel.Font = Enum.Font.SourceSans
jumpLabel.Parent = mainFrame

local jumpDecBtn = createButton("- 跳跃", 80, 30)
jumpDecBtn.MouseButton1Click:Connect(function()
	jumpHeight = math.max(2, jumpHeight - 0.5)
	humanoid.JumpHeight = jumpHeight
	jumpLabel.Text = "跳跃高度: " .. string.format("%.1f", jumpHeight)
end)

local jumpIncBtn = createButton("+ 跳跃", 80, 30)
jumpIncBtn.MouseButton1Click:Connect(function()
	jumpHeight = math.min(30, jumpHeight + 0.5)
	humanoid.JumpHeight = jumpHeight
	jumpLabel.Text = "跳跃高度: " .. string.format("%.1f", jumpHeight)
end)

-- 穿墙开关
local noclipBtn = createButton("穿墙: 关闭", 120, 35)
noclipBtn.MouseButton1Click:Connect(function()
	noclipEnabled = not noclipEnabled
	noclipBtn:FindFirstChildOfClass("TextLabel").Text = noclipEnabled and "穿墙: 开启" or "穿墙: 关闭"
end)

-- 连续跳跃开关
local infiniteJumpBtn = createButton("连跳: 关闭", 120, 35)
infiniteJumpBtn.MouseButton1Click:Connect(function()
	infiniteJumpEnabled = not infiniteJumpEnabled
	infiniteJumpBtn:FindFirstChildOfClass("TextLabel").Text = infiniteJumpEnabled and "连跳: 开启" or "连跳: 关闭"
end)

-- UI缩放按钮
local scaleBtn = createButton("UI缩放", 100, 35)
scaleBtn.MouseButton1Click:Connect(function()
	if uiScale == 1 then
		uiScale = 0.6
	else
		uiScale = 1
	end
	-- 缩放主框架
	mainFrame.Size = UDim2.new(0, 350 * uiScale, 0, 300 * uiScale)
	mainFrame.Position = UDim2.new(0.5, -175 * uiScale, 0.5, -150 * uiScale)
	-- 调整内部文字大小等? 简单起见不调整，但字体不变可能会变形，但效果可接受。
end)

-- 关闭UI按钮 (隐藏主面板，但留下一个恢复按钮)
local closeBtn = createButton("关闭面板", 100, 35)
closeBtn.MouseButton1Click:Connect(function()
	uiVisible = false
	mainFrame.Visible = false
	-- 显示一个小的恢复按钮
	restoreBtn.Visible = true
end)

-- 恢复按钮 (始终可见，用于重新打开面板)
local restoreBtn = Instance.new("TextButton")
restoreBtn.Name = "RestoreButton"
restoreBtn.Size = UDim2.new(0, 50, 0, 50)
restoreBtn.Position = UDim2.new(0, 10, 1, -60)
restoreBtn.BackgroundColor3 = Color3.new(0.2, 0.8, 1)
restoreBtn.BackgroundTransparency = 0.3
restoreBtn.Text = "⚙️"
restoreBtn.TextSize = 24
restoreBtn.Font = Enum.Font.SourceSansBold
restoreBtn.Visible = false  -- 初始隐藏，因为主面板可见
restoreBtn.Parent = screenGui

local restoreCorner = Instance.new("UICorner")
restoreCorner.CornerRadius = UDim.new(1, 0)  -- 圆形
restoreCorner.Parent = restoreBtn

local restoreStroke = Instance.new("UIStroke")
restoreStroke.Color = Color3.new(1, 1, 1)
restoreStroke.Thickness = 2
restoreStroke.Parent = restoreBtn

restoreBtn.MouseButton1Click:Connect(function()
	uiVisible = true
	mainFrame.Visible = true
	restoreBtn.Visible = false
end)

-- 可选：添加一个重置为默认值的按钮（趣味）
local resetBtn = createButton("重置默认", 100, 35)
resetBtn.MouseButton1Click:Connect(function()
	speed = 16
	jumpHeight = 7.2
	humanoid.WalkSpeed = speed
	humanoid.JumpHeight = jumpHeight
	speedLabel.Text = "速度: " .. speed
	jumpLabel.Text = "跳跃高度: " .. string.format("%.1f", jumpHeight)
	noclipEnabled = false
	infiniteJumpEnabled = false
	noclipBtn:FindFirstChildOfClass("TextLabel").Text = "穿墙: 关闭"
	infiniteJumpBtn:FindFirstChildOfClass("TextLabel").Text = "连跳: 关闭"
end)

-- 每帧处理穿墙和连续跳跃
runService.RenderStepped:Connect(function()
	-- 确保角色存在
	local currentChar = player.Character
	if not currentChar then return end
	local currentHumanoid = currentChar:FindFirstChild("Humanoid")
	if not currentHumanoid then return end

	-- 穿墙：将角色所有部件的 CanCollide 设为 false
	if noclipEnabled then
		for _, part in ipairs(currentChar:GetChildren()) do
			if part:IsA("BasePart") then
				part.CanCollide = false
			end
		end
	end

	-- 连续跳跃：检测空格键是否按下，且玩家可以跳跃
	if infiniteJumpEnabled then
		if userInputService:IsKeyDown(Enum.KeyCode.Space) then
			-- 确保不在游泳、攀爬等状态
			if currentHumanoid:GetState() ~= Enum.HumanoidStateType.Jumping 
				and currentHumanoid:GetState() ~= Enum.HumanoidStateType.Freefall 
				and currentHumanoid:GetState() ~= Enum.HumanoidStateType.Seated 
				and currentHumanoid:GetState() ~= Enum.HumanoidStateType.Climbing 
				and currentHumanoid:GetState() ~= Enum.HumanoidStateType.Swimming then
				currentHumanoid:ChangeState(Enum.HumanoidStateType.Jumping)
			end
		end
	end
end)

-- 当角色重生时，更新 humanoid 引用并重置属性（可选）
local function onCharacterAdded(newChar)
	character = newChar
	humanoid = newChar:WaitForChild("Humanoid")
	-- 恢复当前设置
	humanoid.WalkSpeed = speed
	humanoid.JumpHeight = jumpHeight
end
player.CharacterAdded:Connect(onCharacterAdded)

-- 全局变量 (可选，便于其他脚本访问)
_G.TechPanel = {
	speed = speed,
	jumpHeight = jumpHeight,
	noclip = noclipEnabled,
	infiniteJump = infiniteJumpEnabled
}

-- 提示脚本已运行
print("科技感控制面板已加载！")
