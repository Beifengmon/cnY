local uiName = "无言脚本 -- 伐木大亨2";
local a =
    setmetatable(
    {},
    {__index = function(self, b)
            return game.GetService(game, b)
        end, __call = function(self, b)
            return game.GetService(game, b)
        end}
)
if a.CoreGui:FindFirstChild(uiName) then
    if run then
        run:Disconnect()
        run = nil
    end
    if full then
        full:Disconnect()
        full = nil
    end
    a.CoreGui[uiName]:Destroy()
end
local c = UDim.new
local d = UDim2.new
local e = color3.fromRGB
local f = Instance.new
local g = function()
end
local h = a.Players.LocalPlayer:GetMouse()
getgenv().library = {flags = {GetState = function(i, j)
            return library.flags[j].State
        end}, modules = {}, currentTab = nil}
function library:UpdateToggle(j, k)
    local k = k or library.flags:GetState(j)
    if k == library.flags:GetState(j) then
        return
    end
    library.flags[j]:SetState(k)
end
local l = {}
function l:Tween(m, n, o, p, q)
    return a.TweenService:Create(
        n,
        TweenInfo.new(o or 0.25, Enum.EasingStyle[p or "Linear"], Enum.EasingDirection[q or "InOut"]),
        m
    )
end
function l:SwitchTab(r)
    local s = library.currentTab
    if s == r then
        return
    end
    library.currentTab = r
    l:Tween({Transparency = 1}, s[2].Glow):Play()
    l:Tween({Transparency = 0}, r[2].Glow):Play()
    s[1].Visible = false
    r[1].Visible = true
end
local t = f("ScreenGui")
local u = f("TextButton")
local v = f("Frame")
local w = f("UICorner")
local x = f("TextLabel")
local y = f("UICorner")
local z = f("Frame")
local A = f("UICorner")
local B = f("ScrollingFrame")
local C = f("UIListLayout")
local D = f("UIPadding")
local E = f("Frame")
local F = f("UICorner")
t.Name = uiName
t.Parent = a.CoreGui
v.Name = "Main"
v.Parent = t
v.Backgroundcolor3 = e(255, 255, 255)
v.BorderSizePixel = 0
v.Position = d(0.5, 0, 0.5, 0)
v.Size = d(0, 448, 0, 280)
v.AnchorPoint = Vector2.new(0.5, 0.5)
v.Active = true
v.Draggable = true
w.CornerRadius = c(0, 6)
w.Name = "MainCorner"
w.Parent = v
x.Parent = v
x.BackgroundColor3 = e(58, 255, 255)
x.BorderSizePixel = 0
x.Position = d(0, 6, 0, 6)
x.Size = d(0, 436, 0, 24)
x.Font = Enum.Font.GothamBold
x.Text = "  " .. uiName
x.TextColor3 = e(255, 255, 255)
x.TextSize = 14.000
x.TextXAlignment = Enum.TextXAlignment.Left
u.Name = "Open"
u.Parent = t
u.BackgroundColor3 = v.BackgroundColor3
u.Position = UDim2.new(0.839879155, 0, -0.0123076923, 0)
u.BorderSizePixel = 2
u.BorderColor3 = x.BackgroundColor3
u.Size = UDim2.new(0, 55, 0, 25)
u.Font = Enum.Font.SourceSans
u.Text = "隐藏"
u.TextColor3 = Color3.fromRGB(255, 255, 255)
u.TextSize = 14.000
u.Active = true
u.Draggable = true
u.MouseButton1Down:connect(
    function()
        TOGGLE = not TOGGLE
        v.Visible = TOGGLE
        u.Text = TOGGLE and "隐藏" or "打开"
    end
)
y.CornerRadius = c(0, 6)
y.Name = "TextLabelCorner"
y.Parent = x
z.Name = "Sidebar"
z.Parent = v
z.BackgroundColor3 = e(58, 69, 80)
z.BorderSizePixel = 0
z.Position = d(0, 6, 0, 36)
z.Size = d(0, 106, 0, 238)
A.CornerRadius = c(0, 6)
A.Name = "SidebarCorner"
A.Parent = z
B.Name = "TabButtons"
B.Parent = z
B.Active = true
B.BackgroundColor3 = e(255, 255, 255)
B.BackgroundTransparency = 1.000
B.BorderSizePixel = 0
B.Size = d(0, 106, 0, 238)
B.ScrollBarThickness = 0
C.Parent = B
C.HorizontalAlignment = Enum.HorizontalAlignment.Center
C.SortOrder = Enum.SortOrder.LayoutOrder
C.Padding = c(0, 5)
D.Parent = B
D.PaddingTop = c(0, 6)
E.Name = "TabHolder"
E.Parent = v
E.BackgroundColor3 = e(58, 69, 80)
E.BorderSizePixel = 0
E.Position = d(0, 118, 0, 36)
E.Size = d(0, 324, 0, 238)
F.CornerRadius = c(0, 6)
F.Name = "TabHolderCorner"
F.Parent = E
C:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(
    function()
        B.CanvasSize = d(0, 0, 0, C.AbsoluteContentSize.Y + 12)
    end
)
function createBaseNotifications()
    if game:GetService("Players").LocalPlayer.PlayerGui:FindFirstChild("NotificationHolder") then
        return game:GetService("Players").LocalPlayer.PlayerGui.NotificationHolder
    end
    local G = Instance.new("ScreenGui")
    G.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
    local H = Instance.new("Frame")
    H.Name = "ToggleNotif"
    H.ZIndex = 5
    H.AnchorPoint = Vector2.new(1, 1)
    H.Visible = false
    H.Size = UDim2.new(0, 291, 0, 56)
    H.Position = UDim2.new(1, 0, 1, 0)
    H.BackgroundColor3 = Color3.fromRGB(48, 48, 48)
    H.Parent = G
    local I = Instance.new("UICorner")
    I.Name = "UiCorner"
    I.Parent = H
    local J = Instance.new("UIStroke")
    J.Name = "Dropshadow"
    J.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
    J.Transparency = 0.8
    J.Thickness = 2
    J.Color = Color3.fromRGB(20, 20, 20)
    J.Parent = H
    local K = Instance.new("Frame")
    K.Name = "SepVertical"
    K.Size = UDim2.new(0, 2, 0, 56)
    K.BackgroundTransparency = 0.5
    K.Position = UDim2.new(0.7423077, 0, 0, 0)
    K.BorderSizePixel = 0
    K.BackgroundColor3 = Color3.fromRGB(68, 68, 68)
    K.Parent = H
    local L = Instance.new("Frame")
    L.Name = "SepHorizontal"
    L.Size = UDim2.new(0, 72, 0, 2)
    L.BackgroundTransparency = 0.5
    L.Position = UDim2.new(0.75, 0, 0.4464286, 2)
    L.BorderSizePixel = 0
    L.BackgroundColor3 = Color3.fromRGB(68, 68, 68)
    L.Parent = H
    local M = Instance.new("TextLabel")
    M.Name = "Title"
    M.Size = UDim2.new(0, 216, 0, 19)
    M.BackgroundTransparency = 1
    M.BorderSizePixel = 0
    M.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    M.FontSize = Enum.FontSize.Size14
    M.TextSize = 14
    M.TextColor3 = Color3.fromRGB(255, 255, 255)
    M.Font = Enum.Font.SourceSans
    M.Parent = H
    local N = Instance.new("TextLabel")
    N.Name = "Paragraph"
    N.Size = UDim2.new(0, 218, 0, 37)
    N.BackgroundTransparency = 1
    N.Position = UDim2.new(0, 0, 0.3392857, 0)
    N.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    N.FontSize = Enum.FontSize.Size14
    N.TextSize = 14
    N.TextColor3 = Color3.fromRGB(255, 255, 255)
    N.Text = ""
    N.TextYAlignment = Enum.TextYAlignment.Top
    N.TextWrapped = true
    N.Font = Enum.Font.SourceSans
    N.TextWrap = true
    N.TextXAlignment = Enum.TextXAlignment.Left
    N.Parent = H
    local O = Instance.new("UIPadding")
    O.PaddingLeft = UDim.new(0, 10)
    O.PaddingRight = UDim.new(0, 5)
    O.Parent = N
    local P = Instance.new("TextButton")
    P.Name = "True"
    P.Size = UDim2.new(0, 72, 0, 27)
    P.BackgroundTransparency = 1
    P.Position = UDim2.new(0.75, 0, 0, 0)
    P.BorderSizePixel = 0
    P.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    P.FontSize = Enum.FontSize.Size14
    P.TextSize = 14
    P.TextColor3 = Color3.fromRGB(300, 255, 255)
    P.Text = "Yes"
    P.Font = Enum.Font.SourceSans
    P.Parent = H
    local Q = Instance.new("TextButton")
    Q.Name = "False"
    Q.Size = UDim2.new(0, 80, 0, 27)
    Q.BackgroundTransparency = 1
    Q.Position = UDim2.new(0.75, 0, 0.5178571, 0)
    Q.BorderSizePixel = 0
    Q.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    Q.FontSize = Enum.FontSize.Size14
    Q.TextSize = 14
    Q.TextColor3 = Color3.fromRGB(255, 255, 255)
    Q.Text = "No"
    Q.Font = Enum.Font.SourceSans
    Q.Parent = H
    local R = Instance.new("LocalScript")
    R.Parent = G
    local S = Instance.new("Frame")
    S.Name = "DefaultNotif"
    S.ZIndex = 5
    S.AnchorPoint = Vector2.new(1, 1)
    S.Visible = false
    S.Size = UDim2.new(0, 291, 0, 56)
    S.Position = UDim2.new(1, 0, 0.9999999, 0)
    S.BackgroundColor3 = Color3.fromRGB(48, 48, 48)
    S.Parent = G
    local T = Instance.new("UICorner")
    T.Name = "UiCorner"
    T.Parent = S
    local U = Instance.new("UIStroke")
    U.Name = "Dropshadow"
    U.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
    U.Transparency = 0.8
    U.Thickness = 2
    U.Color = Color3.fromRGB(20, 20, 20)
    U.Parent = S
    local V = Instance.new("TextLabel")
    V.Name = "Title"
    V.Size = UDim2.new(0, 291, 0, 19)
    V.BackgroundTransparency = 1
    V.BorderSizePixel = 0
    V.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    V.FontSize = Enum.FontSize.Size14
    V.TextSize = 14
    V.TextColor3 = Color3.fromRGB(255, 255, 255)
    V.Font = Enum.Font.SourceSans
    V.Parent = S
    local W = Instance.new("TextLabel")
    W.Name = "Paragraph"
    W.Size = UDim2.new(0, 291, 0, 37)
    W.BackgroundTransparency = 1
    W.Position = UDim2.new(0, 0, 0.3392857, 0)
    W.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    W.FontSize = Enum.FontSize.Size14
    W.TextSize = 14
    W.TextColor3 = Color3.fromRGB(255, 255, 255)
    W.Text = ""
    W.TextYAlignment = Enum.TextYAlignment.Top
    W.TextWrapped = true
    W.Font = Enum.Font.SourceSans
    W.TextWrap = true
    W.TextXAlignment = Enum.TextXAlignment.Left
    W.Parent = S
    local X = Instance.new("UIPadding")
    X.PaddingLeft = UDim.new(0, 10)
    X.PaddingRight = UDim.new(0, 5)
    X.Parent = W
    if syn then
        syn.protect_gui(G)
    end
    G.Parent = game:GetService("Players").LocalPlayer.PlayerGui
    return G
end
notificationHolder = createBaseNotifications()
notifAmount = 0
removedPos = nil
function library:SelectNotify(Y)
    Y = Y or {}
    Y.TweenSpeed = Y.TweenSpeed or 1
    Y.TweenInSpeed = Y.TweenInSpeed or Y.TweenSpeed
    Y.TweenOutSpeed = Y.TweenOutSpeed or Y.TweenSpeed
    Y.TweenVerticalSpeed = Y.TweenVerticalSpeed or Y.TweenSpeed
    Y.Title = Y.Title or "Title"
    Y.Text = Y.Text or "Text"
    Y.TrueText = Y.TrueText or "Yes"
    Y.FalseText = Y.FalseText or "No"
    Y.Duration = Y.Duration or 5
    Y.Callback = Y.Callback or function()
            warn("No callback for notif")
        end
    notifAmount = notifAmount + 1
    local Z = notifAmount
    local _ = notifAmount
    local a0 = true
    local a1 = notificationHolder.ToggleNotif:Clone()
    local a2 = false
    a1.Parent = notificationHolder
    a1.Visible = true
    a1.Position = UDim2.new(1, 300, 1, -5)
    a1.Transparency = 0.05
    a1.True.Text = Y.TrueText
    a1.False.Text = Y.FalseText
    task.spawn(
        function()
            task.wait(Y.Duration + Y.TweenInSpeed)
            a0 = false
        end
    )
    a1.True.MouseButton1Click:Connect(
        function()
            a0 = false
            a2 = true
            notifAmount = notifAmount - 1
            removedPos = a1.Position.Y.Offset
            pcall(Y.Callback, true)
        end
    )
    a1.False.MouseButton1Click:Connect(
        function()
            a0 = false
            a2 = true
            notifAmount = notifAmount - 1
            removedPos = a1.Position.Y.Offset
            pcall(Y.Callback, false)
        end
    )
    a1.Paragraph.Text = Y.Text
    a1.Title.Text = Y.Title
    a1:TweenPosition(UDim2.new(1, -5, 1, -5), Enum.EasingDirection.Out, Enum.EasingStyle.Quint, Y.TweenInSpeed)
    task.spawn(
        function()
            local a3 = a1.Position
            while a0 and task.wait() do
                local a4 = a1.Position
                if notifAmount > Z then
                    a1:TweenPosition(
                        UDim2.new(1, -5, 1, a3.Y.Offset - 65 * (notifAmount - _)),
                        Enum.EasingDirection.Out,
                        Enum.EasingStyle.Quint,
                        Y.TweenVerticalSpeed,
                        true
                    )
                    Z = Z + 1
                end
                if notifAmount < Z then
                    if removedPos > a4.Y.Offset then
                        a1:TweenPosition(
                            UDim2.new(1, -5, 1, a3.Y.Offset - 65 * (notifAmount - _)),
                            Enum.EasingDirection.Out,
                            Enum.EasingStyle.Quint,
                            Y.TweenVerticalSpeed,
                            true
                        )
                    else
                        _ = _ - 1
                    end
                    Z = Z - 1
                end
            end
            local a4 = a1.Position
            if a2 == false then
                notifAmount = notifAmount - 1
                removedPos = a1.Position.Y.Offset
            end
            a1:TweenPosition(
                UDim2.new(1, 300, 1, a4.Y.Offset),
                Enum.EasingDirection.Out,
                Enum.EasingStyle.Quint,
                Y.TweenOutSpeed,
                true
            )
            task.wait(Y.TweenOutSpeed)
            a1:Destroy()
        end
    )
end
function library:Notify(Y)
    Y = Y or {}
    Y.TweenSpeed = Y.TweenSpeed or 1
    Y.TweenInSpeed = Y.TweenInSpeed or Y.TweenSpeed
    Y.TweenOutSpeed = Y.TweenOutSpeed or Y.TweenSpeed
    Y.TweenVerticalSpeed = Y.TweenVerticalSpeed or Y.TweenSpeed
    Y.Title = Y.Title or "Title"
    Y.Text = Y.Text or "Text"
    Y.Duration = Y.Duration or 5
    notifAmount = notifAmount + 1
    local Z = notifAmount
    local _ = notifAmount
    local a2 = false
    local a0 = true
    local a1 = notificationHolder.DefaultNotif:Clone()
    a1.Parent = notificationHolder
    a1.Visible = true
    a1.Position = UDim2.new(1, 300, 1, -5)
    a1.Transparency = 0.05
    a1.InputBegan:Connect(
        function(a5)
            if a5.UserInputType == Enum.UserInputType.MouseButton1 then
                task.spawn(
                    function()
                        local a6 = TweenInfo.new(0.5, Enum.EasingStyle.Linear, Enum.EasingDirection.Out, 0, false, 0)
                        game:GetService("TweenService"):Create(a1, a6, {Transparency = 0.8}):Play()
                    end
                )
                a0 = false
                a2 = true
                notifAmount = notifAmount - 1
                removedPos = a1.Position.Y.Offset
            end
        end
    )
    task.spawn(
        function()
            task.wait(Y.Duration + Y.TweenInSpeed)
            a0 = false
        end
    )
    a1.Paragraph.Text = Y.Text
    a1.Title.Text = Y.Title
    a1:TweenPosition(UDim2.new(1, -5, 1, -5), Enum.EasingDirection.Out, Enum.EasingStyle.Quint, Y.TweenInSpeed)
    task.spawn(
        function()
            local a3 = a1.Position
            while a0 and task.wait() do
                local a4 = a1.Position
                if notifAmount > Z then
                    a1:TweenPosition(
                        UDim2.new(1, -5, 1, a3.Y.Offset - 65 * (notifAmount - _)),
                        Enum.EasingDirection.Out,
                        Enum.EasingStyle.Quint,
                        Y.TweenVerticalSpeed,
                        true
                    )
                    Z = Z + 1
                end
                if notifAmount < Z then
                    if removedPos > a4.Y.Offset then
                        a1:TweenPosition(
                            UDim2.new(1, -5, 1, a3.Y.Offset - 65 * (notifAmount - _)),
                            Enum.EasingDirection.Out,
                            Enum.EasingStyle.Quint,
                            Y.TweenVerticalSpeed,
                            true
                        )
                    else
                        _ = _ - 1
                    end
                    Z = Z - 1
                end
            end
            local a4 = a1.Position
            if a2 == false then
                notifAmount = notifAmount - 1
                removedPos = a1.Position.Y.Offset
            end
            a1:TweenPosition(
                UDim2.new(1, 300, 1, a4.Y.Offset),
                Enum.EasingDirection.Out,
                Enum.EasingStyle.Quint,
                Y.TweenOutSpeed,
                true
            )
            task.wait(Y.TweenOutSpeed)
            a1:Destroy()
        end
    )
end
function library:CreateTab(a7)
    local a8 = f("TextButton")
    local a9 = f("UICorner")
    local aa = f("Frame")
    local ab = f("UICorner")
    local ac = f("UIGradient")
    local ad = f("ScrollingFrame")
    local ae = f("UIPadding")
    local af = f("UIListLayout")
    a8.Name = "TabButton"
    a8.Parent = B
    a8.BackgroundColor3 = e(52, 62, 72)
    a8.BorderSizePixel = 0
    a8.Size = d(0, 94, 0, 28)
    a8.AutoButtonColor = false
    a8.Font = Enum.Font.GothamSemibold
    a8.Text = a7
    a8.TextColor3 = e(255, 255, 255)
    a8.TextSize = 14.000
    a9.CornerRadius = c(0, 6)
    a9.Name = "TabButtonCorner"
    a9.Parent = a8
    aa.Name = "Glow"
    aa.Parent = a8
    aa.BackgroundColor3 = e(255, 255, 255)
    aa.BorderSizePixel = 0
    aa.Position = d(0, 0, 0.928571463, 0)
    aa.Size = d(0, 94, 0, 2)
    aa.Transparency = 1
    ab.CornerRadius = c(0, 6)
    ab.Name = "GlowCorner"
    ab.Parent = aa
    ac.Color =
        ColorSequence.new {
        ColorSequenceKeypoint.new(0.00, e(52, 62, 72)),
        ColorSequenceKeypoint.new(0.50, e(255, 255, 255)),
        ColorSequenceKeypoint.new(1.00, e(52, 62, 72))
    }
    ac.Name = "GlowGradient"
    ac.Parent = aa
    ad.Name = "Tab"
    ad.Parent = E
    ad.Active = true
    ad.BackgroundColor3 = e(255, 255, 255)
    ad.BackgroundTransparency = 1.000
    ad.BorderSizePixel = 0
    ad.Size = d(0, 324, 0, 238)
    ad.ScrollBarThickness = 0
    ad.Visible = false
    if library.currentTab == nil then
        library.currentTab = {ad, a8}
        aa.Transparency = 0
        ad.Visible = true
    end
    ae.Name = "TabPadding"
    ae.Parent = ad
    ae.PaddingTop = c(0, 6)
    af.Name = "TabLayout"
    af.Parent = ad
    af.HorizontalAlignment = Enum.HorizontalAlignment.Center
    af.SortOrder = Enum.SortOrder.LayoutOrder
    af.Padding = c(0, 5)
    af:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(
        function()
            ad.CanvasSize = d(0, 0, 0, af.AbsoluteContentSize.Y + 12)
        end
    )
    a8.MouseButton1Click:Connect(
        function()
            l:SwitchTab({ad, a8})
        end
    )
    local ag = {}
    function ag:NewSeparator()
        local ah = f("Frame")
        ah.Transparency = 1
        ah.Size = d(0, 0, 0, 0)
        ah.BorderSizePixel = 0
        ah.Parent = ad
    end
    function ag:NewButton(ai, aj)
        local aj = aj or g
        local ak = f("TextButton")
        local al = f("UICorner")
        ak.Name = "BtnModule"
        ak.Parent = ad
        ak.BackgroundColor3 = e(52, 62, 72)
        ak.BorderSizePixel = 0
        ak.Size = d(0, 312, 0, 28)
        ak.AutoButtonColor = false
        ak.Font = Enum.Font.GothamSemibold
        ak.Text = "  " .. ai
        ak.TextColor3 = e(255, 255, 255)
        ak.TextSize = 14.000
        ak.TextXAlignment = Enum.TextXAlignment.Left
        al.CornerRadius = c(0, 6)
        al.Name = "BtnModuleCorner"
        al.Parent = ak
        ak.MouseButton1Click:Connect(aj)
    end
    function ag:NewToggle(ai, j, am, aj)
        local aj = aj or g
        local am = am or false
        local an = f("TextButton")
        local ao = f("UICorner")
        local ap = f("Frame")
        local aq = f("UIGradient")
        local ar = f("UICorner")
        local as = f("Frame")
        local at = f("UICorner")
        local au = f("UIGradient")
        library.flags[j or ai] = {
            State = false,
            Callback = aj,
            SetState = function(self, k)
                local k = k ~= nil and k or not library.flags:GetState(j)
                library.flags[j].State = k
                task.spawn(
                    function()
                        library.flags[j].Callback(k)
                    end
                )
                l:Tween({Transparency = k and 1 or 0}, ap):Play()
                l:Tween({Transparency = k and 0 or 1}, as):Play()
            end
        }
        an.Name = "ToggleModule"
        an.Parent = ad
        an.BackgroundColor3 = e(52, 62, 72)
        an.BorderSizePixel = 0
        an.Size = d(0, 312, 0, 28)
        an.AutoButtonColor = false
        an.Font = Enum.Font.GothamSemibold
        an.Text = "  " .. ai
        an.TextColor3 = e(255, 255, 255)
        an.TextSize = 14.000
        an.TextXAlignment = Enum.TextXAlignment.Left
        ao.CornerRadius = c(0, 6)
        ao.Name = "ToggleModuleCorner"
        ao.Parent = an
        ap.Name = "OffStatus"
        ap.Parent = an
        ap.BackgroundColor3 = e(255, 255, 255)
        ap.BorderSizePixel = 0
        ap.Position = d(0.878205061, 0, 0.178571433, 0)
        ap.Size = d(0, 34, 0, 18)
        aq.Color =
            ColorSequence.new {
            ColorSequenceKeypoint.new(0.00, e(255, 83, 83)),
            ColorSequenceKeypoint.new(0.15, e(255, 83, 83)),
            ColorSequenceKeypoint.new(0.62, e(52, 62, 72)),
            ColorSequenceKeypoint.new(1.00, e(52, 62, 72))
        }
        aq.Rotation = 300
        aq.Name = "OffGrad"
        aq.Parent = ap
        ar.CornerRadius = c(0, 4)
        ar.Name = "OffStatusCorner"
        ar.Parent = ap
        as.Name = "OnStatus"
        as.Parent = an
        as.BackgroundColor3 = e(255, 255, 255)
        as.BackgroundTransparency = 1.000
        as.BorderSizePixel = 0
        as.Position = d(0.878205121, 0, 0.178571433, 0)
        as.Size = d(0, 34, 0, 18)
        as.Transparency = 1
        at.CornerRadius = c(0, 4)
        at.Name = "OnStatusCorner"
        at.Parent = as
        au.Color =
            ColorSequence.new {
            ColorSequenceKeypoint.new(0.00, e(52, 62, 72)),
            ColorSequenceKeypoint.new(0.38, e(48, 57, 67)),
            ColorSequenceKeypoint.new(1.00, e(53, 255, 134))
        }
        au.Rotation = 300
        au.Name = "OnGrad"
        au.Parent = as
        an.MouseButton1Click:Connect(
            function()
                library.flags[j or ai]:SetState()
            end
        )
        if am then
            library.flags[j or ai]:SetState(am)
        end
    end
    function ag:NewBind(ai, av, aj)
        local av = Enum.KeyCode[av]
        local aw = {
            Return = true,
            Space = true,
            Tab = true,
            Backquote = true,
            CapsLock = true,
            Escape = true,
            Unknown = true
        }
        local ax = {
            RightControl = "Right Ctrl",
            LeftControl = "Left Ctrl",
            LeftShift = "Left Shift",
            RightShift = "Right Shift",
            Semicolon = ";",
            Quote = '"',
            LeftBracket = "[",
            RightBracket = "]",
            Equals = "=",
            Minus = "-",
            RightAlt = "Right Alt",
            LeftAlt = "Left Alt"
        }
        local ay = av
        local az = av and (ax[av.Name] or av.Name) or "None"
        local aA = f("TextButton")
        local aB = f("UICorner")
        local aC = f("TextButton")
        local aD = f("UICorner")
        aA.Name = "KeybindModule"
        aA.Parent = ad
        aA.BackgroundColor3 = e(52, 62, 72)
        aA.BorderSizePixel = 0
        aA.Size = d(0, 312, 0, 28)
        aA.AutoButtonColor = false
        aA.Font = Enum.Font.GothamSemibold
        aA.Text = "  " .. ai
        aA.TextColor3 = e(255, 255, 255)
        aA.TextSize = 14.000
        aA.TextXAlignment = Enum.TextXAlignment.Left
        aB.CornerRadius = c(0, 6)
        aB.Name = "KeybindModuleCorner"
        aB.Parent = aA
        aC.Name = "KeybindValue"
        aC.Parent = aA
        aC.BackgroundColor3 = e(58, 69, 80)
        aC.BorderSizePixel = 0
        aC.Position = d(0.75, 0, 0.178571433, 0)
        aC.Size = d(0, 74, 0, 18)
        aC.AutoButtonColor = false
        aC.Font = Enum.Font.Gotham
        aC.Text = az
        aC.TextColor3 = e(255, 255, 255)
        aC.TextSize = 12.000
        aD.CornerRadius = c(0, 4)
        aD.Name = "KeybindValueCorner"
        aD.Parent = aC
        a.UserInputService.InputBegan:Connect(
            function(aE, aF)
                if aF then
                    return
                end
                if aE.UserInputType ~= Enum.UserInputType.Keyboard then
                    return
                end
                if aE.KeyCode ~= ay then
                    return
                end
                aj(ay.Name)
            end
        )
        aC.MouseButton1Click:Connect(
            function()
                aC.Text = "..."
                wait()
                local aG, aH = a.UserInputService.InputEnded:Wait()
                local aI = tostring(aG.KeyCode.Name)
                if aG.UserInputType ~= Enum.UserInputType.Keyboard then
                    aC.Text = az
                    return
                end
                if aw[aI] then
                    aC.Text = az
                    return
                end
                wait()
                ay = Enum.KeyCode[aI]
                aC.Text = ax[aI] or aI
            end
        )
    end
    function ag:NewSlider(ai, j, av, aJ, aK, aL, aj)
        local av = av or aJ
        local aj = aj or g
        local aM = f("TextButton")
        local aN = f("UICorner")
        local aO = f("Frame")
        local aP = f("UICorner")
        local aQ = f("Frame")
        local aR = f("UICorner")
        local aS = f("TextBox")
        local aT = f("UICorner")
        local aU = f("TextButton")
        local aV = f("TextButton")
        library.flags[j] = {State = av, SetValue = function(self, k)
                local aW = (h.X - aO.AbsolutePosition.X) / aO.AbsoluteSize.X
                if k then
                    aW = (k - aJ) / (aK - aJ)
                end
                aW = math.clamp(aW, 0, 1)
                if aL then
                    k = k or tonumber(string.format("%.1f", tostring(aJ + (aK - aJ) * aW)))
                else
                    k = k or math.floor(aJ + (aK - aJ) * aW)
                end
                library.flags[j].State = tonumber(k)
                aS.Text = tostring(k)
                aQ.Size = d(aW, 0, 1, 0)
                aj(tonumber(k))
            end}
        aM.Name = "SliderModule"
        aM.Parent = ad
        aM.BackgroundColor3 = e(52, 62, 72)
        aM.BorderSizePixel = 0
        aM.Position = d(0, 0, -0.140425533, 0)
        aM.Size = d(0, 312, 0, 28)
        aM.AutoButtonColor = false
        aM.Font = Enum.Font.GothamSemibold
        aM.Text = "  " .. ai
        aM.TextColor3 = e(255, 255, 255)
        aM.TextSize = 14.000
        aM.TextXAlignment = Enum.TextXAlignment.Left
        aN.CornerRadius = c(0, 6)
        aN.Name = "SliderModuleCorner"
        aN.Parent = aM
        aO.Name = "SliderBar"
        aO.Parent = aM
        aO.BackgroundColor3 = e(58, 69, 80)
        aO.BorderSizePixel = 0
        aO.Position = d(0.442307681, 0, 0.392857134, 0)
        aO.Size = d(0, 108, 0, 6)
        aP.CornerRadius = c(0, 2)
        aP.Name = "SliderBarCorner"
        aP.Parent = aO
        aQ.Name = "SliderPart"
        aQ.Parent = aO
        aQ.BackgroundColor3 = e(255, 255, 255)
        aQ.BorderSizePixel = 0
        aQ.Size = d(0, 0, 0, 6)
        aR.CornerRadius = c(0, 2)
        aR.Name = "SliderPartCorner"
        aR.Parent = aQ
        aS.Name = "SliderValue"
        aS.Parent = aM
        aS.BackgroundColor3 = e(58, 69, 80)
        aS.BorderSizePixel = 0
        aS.Position = d(0.884615362, 0, 0.178571433, 0)
        aS.Size = d(0, 32, 0, 18)
        aS.Font = Enum.Font.Gotham
        aS.Text = av or aJ
        aS.TextColor3 = e(255, 255, 255)
        aS.TextSize = 12.000
        aT.CornerRadius = c(0, 4)
        aT.Name = "SliderValueCorner"
        aT.Parent = aS
        aU.Name = "AddSlider"
        aU.Parent = aM
        aU.BackgroundColor3 = e(255, 255, 255)
        aU.BackgroundTransparency = 1.000
        aU.BorderSizePixel = 0
        aU.Position = d(0.807692289, 0, 0.178571433, 0)
        aU.Size = d(0, 18, 0, 18)
        aU.Font = Enum.Font.Gotham
        aU.Text = "+"
        aU.TextColor3 = e(255, 255, 255)
        aU.TextSize = 18.000
        aV.Name = "MinusSlider"
        aV.Parent = aM
        aV.BackgroundColor3 = e(255, 255, 255)
        aV.BackgroundTransparency = 1.000
        aV.BorderSizePixel = 0
        aV.Position = d(0.365384609, 0, 0.178571433, 0)
        aV.Size = d(0, 18, 0, 18)
        aV.Font = Enum.Font.Gotham
        aV.Text = "-"
        aV.TextColor3 = e(255, 255, 255)
        aV.TextSize = 18.000
        aV.MouseButton1Click:Connect(
            function()
                local aX = library.flags:GetState(j)
                aX = math.clamp(aX - 1, aJ, aK)
                library.flags[j]:SetValue(aX)
            end
        )
        aU.MouseButton1Click:Connect(
            function()
                local aX = library.flags:GetState(j)
                aX = math.clamp(aX + 1, aJ, aK)
                library.flags[j]:SetValue(aX)
            end
        )
        library.flags[j]:SetValue(av)
        local aY, aZ, a_ = false, false, {[""] = true, ["-"] = true}
        aO.InputBegan:Connect(
            function(b0)
                if b0.UserInputType == Enum.UserInputType.MouseButton1 or b0.UserInputType == Enum.UserInputType.Touch then
                    library.flags[j]:SetValue()
                    aY = true
                end
            end
        )
        a.UserInputService.InputEnded:Connect(
            function(b0)
                if
                    aY and b0.UserInputType == Enum.UserInputType.MouseButton1 or
                        b0.UserInputType == Enum.UserInputType.Touch
                 then
                    aY = false
                end
            end
        )
        a.UserInputService.InputChanged:Connect(
            function(b0)
                if aY == true then
                    library.flags[j]:SetValue()
                end
            end
        )
        aS.Focused:Connect(
            function()
                aZ = true
            end
        )
        aS.FocusLost:Connect(
            function()
                aZ = false
                if aS.Text == "" then
                    library.flags[j]:SetValue(av)
                end
            end
        )
        aS:GetPropertyChangedSignal("Text"):Connect(
            function()
                if not aZ then
                    return
                end
                aS.Text = aS.Text:gsub("%D+", "")
                local ai = aS.Text
                if not tonumber(ai) then
                    aS.Text = aS.Text:gsub("%D+", "")
                elseif not a_[ai] then
                    if tonumber(ai) > aK then
                        ai = aK
                        aS.Text = tostring(aK)
                    end
                    library.flags[j]:SetValue(tonumber(ai))
                end
            end
        )
    end
    function ag:NewDropdown(ai, j, b1, aj)
        local aj = aj or g
        library.flags[j] = {State = b1[1]}
        local b2 = f("TextButton")
        local b3 = f("UICorner")
        local b4 = f("TextBox")
        local b5 = f("TextButton")
        local b6 = f("TextButton")
        local b7 = f("UICorner")
        local b8 = f("UIListLayout")
        local b9 = f("UIPadding")
        b2.Name = "DropdownModule"
        b2.Parent = ad
        b2.BackgroundColor3 = e(52, 62, 72)
        b2.BorderSizePixel = 0
        b2.Size = d(0, 312, 0, 28)
        b2.AutoButtonColor = false
        b2.Font = Enum.Font.GothamSemibold
        b2.Text = ""
        b2.TextColor3 = e(255, 255, 255)
        b2.TextSize = 14.000
        b2.TextXAlignment = Enum.TextXAlignment.Left
        b3.CornerRadius = c(0, 6)
        b3.Name = "DropdownModuleCorner"
        b3.Parent = b2
        b4.Name = "DropdownText"
        b4.Parent = b2
        b4.BackgroundColor3 = e(255, 255, 255)
        b4.BackgroundTransparency = 1.000
        b4.Position = d(0.025641026, 0, 0, 0)
        b4.Size = d(0, 192, 0, 28)
        b4.Font = Enum.Font.GothamSemibold
        b4.PlaceholderText = ai
        b4.PlaceholderColor3 = e(255, 255, 255)
        b4.TextColor3 = e(255, 255, 255)
        b4.TextSize = 14.000
        b4.TextXAlignment = Enum.TextXAlignment.Left
        b4.Text = ""
        b5.Name = "OpenDropdown"
        b5.Parent = b2
        b5.BackgroundColor3 = e(255, 255, 255)
        b5.BackgroundTransparency = 1.000
        b5.BorderSizePixel = 0
        b5.Position = d(0.907051265, 0, 0.178571433, 0)
        b5.Size = d(0, 18, 0, 18)
        b5.Font = Enum.Font.Gotham
        b5.Text = "+"
        b5.TextColor3 = e(255, 255, 255)
        b5.TextSize = 22.000
        b6.Name = "DropdownBottom"
        b6.Parent = ad
        b6.BackgroundColor3 = e(52, 62, 72)
        b6.BorderSizePixel = 0
        b6.ClipsDescendants = true
        b6.Position = d(0.0185185187, 0, 0.206896558, 0)
        b6.Size = d(0, 312, 0, 0)
        b6.AutoButtonColor = false
        b6.Font = Enum.Font.GothamSemibold
        b6.Text = ""
        b6.TextColor3 = e(255, 255, 255)
        b6.TextSize = 14.000
        b6.TextXAlignment = Enum.TextXAlignment.Left
        b6.Visible = false
        b7.CornerRadius = c(0, 6)
        b7.Name = "DropdownBottomCorner"
        b7.Parent = b6
        b8.Name = "DropdownBottomLayout"
        b8.Parent = b6
        b8.HorizontalAlignment = Enum.HorizontalAlignment.Center
        b8.SortOrder = Enum.SortOrder.LayoutOrder
        b8.Padding = c(0, 6)
        b9.Name = "DropdownBottomPadding"
        b9.Parent = b6
        b9.PaddingTop = c(0, 6)
        local ba = false
        b8:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(
            function()
                if not ba then
                    return
                end
                l:Tween({Size = d(0, 312, 0, b8.AbsoluteContentSize.Y + 12)}, b6, 0.1):Play()
            end
        )
        local bb = function()
            local bc = b4.Text
            for bd, be in next, b6:GetChildren() do
                if be:IsA("TextButton") then
                    if string.find(be.Name:lower(), bc:lower()) then
                        be.Visible = true
                    else
                        be.Visible = false
                    end
                end
            end
        end
        local bf = function(ai)
            local b1 = b6:GetChildren()
            for bg = 1, #b1 do
                local bh = b1[bg]
                if ai == "" then
                    bb()
                else
                    if bh:IsA("TextButton") then
                        if bh.Name:lower():sub(1, string.len(ai)) == ai:lower() then
                            bh.Visible = true
                        else
                            bh.Visible = false
                        end
                    end
                end
            end
        end
        local bi = function()
            ba = not ba
            if ba then
                b6.Visible = true
                bb()
            else
                task.spawn(
                    function()
                        task.wait(0.35)
                        b6.Visible = false
                    end
                )
            end
            b5.Text = ba and "-" or "+"
            l:Tween({Size = d(0, 312, 0, ba and b8.AbsoluteContentSize.Y + 12 or 0)}, b6, 0.35):Play()
        end
        b5.MouseButton1Click:Connect(bi)
        b4.Focused:Connect(
            function()
                if ba then
                    return
                end
                bi()
            end
        )
        b4:GetPropertyChangedSignal("Text"):Connect(
            function()
                local bc = b4.Text
                for bd, be in next, b6:GetChildren() do
                    if be:IsA("TextButton") then
                        if string.find(be.Name:lower(), bc:lower()) then
                            be.Visible = true
                        else
                            be.Visible = false
                        end
                    end
                end
            end
        )
        library.flags[j].SetOptions = function(self, b1)
            library.flags[j]:ClearOptions()
            for bg = 1, #b1 do
                library.flags[j]:AddOption(b1[bg])
            end
        end
        library.flags[j].ClearOptions = function(self)
            local bj = b6:GetChildren()
            for bg = 1, #bj do
                local n = bj[bg]
                if n:IsA("TextButton") then
                    n:Destroy()
                end
            end
        end
        library.flags[j].AddOption = function(self, bh)
            local bk = f("TextButton")
            local bl = f("UICorner")
            bk.Name = bh
            bk.Parent = b6
            bk.BackgroundColor3 = e(58, 69, 80)
            bk.BorderSizePixel = 0
            bk.Size = d(0, 300, 0, 28)
            bk.AutoButtonColor = false
            bk.Font = Enum.Font.GothamSemibold
            bk.Text = bh
            bk.TextColor3 = e(255, 255, 255)
            bk.TextSize = 14.000
            bl.CornerRadius = c(0, 6)
            bl.Name = "OptionCorner"
            bl.Parent = bk
            bk.MouseButton1Click:Connect(
                function()
                    b4.PlaceholderText = bh
                    b4.Text = ""
                    library.flags[j].State = bh
                    task.spawn(bi)
                    aj(bh)
                end
            )
        end
        library.flags[j].RemoveOption = function(self, bh)
            b6:WaitForChild(bh):Destroy()
        end
        library.flags[j]:SetOptions(b1)
    end
    function ag:NewBox(ai, j, aj)
        local aj = aj or g
        local aM = f("TextButton")
        local aN = f("UICorner")
        local aS = f("TextBox")
        local aT = f("UICorner")
        aM.Name = "SliderModule"
        aM.Parent = ad
        aM.BackgroundColor3 = e(52, 62, 72)
        aM.BorderSizePixel = 0
        aM.Position = d(0, 0, -0.140425533, 0)
        aM.Size = d(0, 312, 0, 28)
        aM.AutoButtonColor = false
        aM.Font = Enum.Font.GothamSemibold
        aM.Text = "  " .. ai
        aM.TextColor3 = e(255, 255, 255)
        aM.TextSize = 14.000
        aM.TextXAlignment = Enum.TextXAlignment.Left
        aN.CornerRadius = c(0, 6)
        aN.Name = "BoxButtonCorner"
        aN.Parent = aM
        aS.Name = "Box"
        aS.Parent = aM
        aS.BackgroundColor3 = e(58, 69, 80)
        aS.BorderSizePixel = 0
        aS.Position = d(0.774615362, 0, 0.178571433, 0)
        aS.Size = d(0, 65, 0, 18)
        aS.Font = Enum.Font.Gotham
        aS.Text = ""
        aS.PlaceholderText = j
        aS.TextColor3 = e(255, 255, 255)
        aS.TextSize = 12.000
        aT.CornerRadius = c(0, 4)
        aT.Name = "BoxCorner"
        aT.Parent = aS
        aS.FocusLost:Connect(
            function(bm)
                if not bm then
                    return
                else
                    aj(aS.Text)
                    if getgenv().ClearTextBoxText then
                        wait(0.10)
                        aS.Text = ""
                    end
                end
            end
        )
    end
    return ag
end
setmetatable(
    getgenv().library,
    {__newindex = function(self, bn, bo)
            if bn == "Name" then
                x.Text = "   " .. bo
                return true
            end
            rawset(self, bn, bo)
        end}
)
--分界线
--忍者源码
local LBLG = Instance.new("ScreenGui", getParent)
local LBL = Instance.new("TextLabel", getParent)
local player = game.Players.LocalPlayer

LBLG.Name = "LBLG"
LBLG.Parent = game.CoreGui
LBLG.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
LBLG.Enabled = true
LBL.Name = "LBL"
LBL.Parent = LBLG
LBL.BackgroundColor3 = Color3.new(1, 1, 1)
LBL.BackgroundTransparency = 1
LBL.BorderColor3 = Color3.new(0, 0, 0)
LBL.Position = UDim2.new(0.75,0,0.010,0)
LBL.Size = UDim2.new(0, 133, 0, 30)
LBL.Font = Enum.Font.GothamSemibold
LBL.Text = "TextLabel"
LBL.TextColor3 = Color3.new(1, 1, 1)
LBL.TextScaled = true
LBL.TextSize = 14
LBL.TextWrapped = true
LBL.Visible = true

local FpsLabel = LBL
local Heartbeat = game:GetService("RunService").Heartbeat
local LastIteration, Start
local FrameUpdateTable = { }

local function HeartbeatUpdate()
	LastIteration = tick()
	for Index = #FrameUpdateTable, 1, -1 do
		FrameUpdateTable[Index + 1] = (FrameUpdateTable[Index] >= LastIteration - 1) and FrameUpdateTable[Index] or nil
	end
	FrameUpdateTable[1] = LastIteration
	local CurrentFPS = (tick() - Start >= 1 and #FrameUpdateTable) or (#FrameUpdateTable / (tick() - Start))
	CurrentFPS = CurrentFPS - CurrentFPS % 1
	FpsLabel.Text = ("北京时间:"..os.date("%H").."时"..os.date("%M").."分"..os.date("%S")).."秒"
end
Start = tick()
Heartbeat:Connect(HeartbeatUpdate)

local gs = function(service)
    return game:GetService(service)
end

local lp = gs("Players").LocalPlayer
local pos = lp.Character.HumanoidRootPart.CFrame + Vector3.new(0, 5, 0)
local ME = game.Players.LocalPlayer.Character.HumanoidRootPart
local Mouse = game:GetService('Players').LocalPlayer:GetMouse()
local CurrentSlot = game.Players.LocalPlayer:WaitForChild("CurrentSaveSlot").Value
local ScriptLoadOrSave = false
local CurrentlySavingOrLoading = game.Players.LocalPlayer:WaitForChild("CurrentlySavingOrLoading")
local mouse = game.Players.LocalPlayer:GetMouse()
local bai = {
    axedupe = false,
    soltnumber = "1",
    waterwalk = false,
    awaysday = false,
    awaysdnight = false,
    nofog = false,
    axeflying = false,
    playernamedied = "",
    tptree = "",
    moneyaoumt = 1,
    moneytoplayername = "",
    donationRecipient = tostring(game.Players.LocalPlayer),
    autodropae = false,
    farAxeEquip = nil,
    cuttreeselect = "Generic",
    autofarm = false,
    PlankToBlueprint = nil,
    plankModel = nil,
    blueprintModel = nil,
    saymege = "",
    autosay = false,
    saymount = 1,
    sayfast = false,
    autofarm1 = false,
    bringamount = 1,
    bringtree = false,
    dxmz = "",
    color = 0,
    0,
    0,
    zlwjia = "",
    mtwjia = nil,
    zix = 1,
    zlz = 3,
    axeFling = nil,
    itemtoopen = "",
    openItem = nil,
    car = nil,
    load = false,
    autobuyamount = 1,
    autopick = false,
    loaddupeaxewaittime = 3.1,
    walkspeed = 16,
    JumpPower = 50,
    pickupaxeamount = 1,
    whthmose = false,
    itemset = nil,
    LoneCaveAxeDetection = nil,
    cuttree = false,
    LoneCaveCharacterAddedDetection = nil,
    LoneCaveDeathDetection = nil,
    lovecavecutcframe = nil,
    lovecavepast = nil,
    zlmt = nil,
    shuzhe = false,
    modwood = false,
    tchonmt = nil,
    cskais = false,
    dledetree = false,
    delereeset = nil,
    treecutset = nil,
    autobuyset = nil,
    wood = 7,
    cswjia = nil,
    boxOpenConnection = nil,
    autobuystop = flase,
    dropdown = {},
    autocsdx = nil,
    kuangxiu = nil,
    xzemuban = false,
    daiwp = false,
    stopcar = false
}
spawn(function()
    while task.wait() do
        game:GetService("Workspace").Stores.WoodRUs.Parts.PREMIUMSELECTION.SurfaceGui.TextLabel.Text = "无言脚本"
        game:GetService("Workspace").Stores.WoodRUs.Parts.PREMIUMSELECTION.SurfaceGui.TextLabel.TextColor3 =
            Color3.fromRGB(255, 0, 0)
        wait(1)
        game:GetService("Workspace").Stores.WoodRUs.Parts.PREMIUMSELECTION.SurfaceGui.TextLabel.Text =
            "无言脚本"
        game:GetService("Workspace").Stores.WoodRUs.Parts.PREMIUMSELECTION.SurfaceGui.TextLabel.TextColor3 =
            Color3.fromRGB(255, 0, 0)
        wait(1)
        game:GetService("Workspace").Stores.WoodRUs.Parts.PREMIUMSELECTION.SurfaceGui.TextLabel.Text =
            "无言脚本"
        game:GetService("Workspace").Stores.WoodRUs.Parts.PREMIUMSELECTION.SurfaceGui.TextLabel.TextColor3 =
            Color3.fromRGB(255, 0, 0)
        wait(1)
        game:GetService("Workspace").Stores.WoodRUs.Parts.PREMIUMSELECTION.SurfaceGui.TextLabel.Text = "无言脚本"
        game:GetService("Workspace").Stores.WoodRUs.Parts.PREMIUMSELECTION.SurfaceGui.TextLabel.TextColor3 =
            Color3.fromRGB(255, 0, 0)
        wait(1)
        game:GetService("Workspace").Stores.WoodRUs.Parts.PREMIUMSELECTION.SurfaceGui.TextLabel.Text = "无言脚本"
        game:GetService("Workspace").Stores.WoodRUs.Parts.PREMIUMSELECTION.SurfaceGui.TextLabel.TextColor3 =
            Color3.fromRGB(255, 0, 0)
        wait(1)
    end
end)
game:GetService("Workspace").Stores.WoodRUs.Parts.OPEN24HOURS.SurfaceGui.TextLabel.Text = "改版🤓🤓🤓 ";
game:GetService("Workspace").Stores.WoodRUs.Parts.OPEN24HOURS.SurfaceGui.TextLabel.TextColor3 =
    Color3.fromRGB(255, 0, 0)
game:GetService("Workspace").Stores.WoodRUs.Parts.SELLWOOD.SurfaceGui.TextLabel.Text = "作者:Mimeiwg";
game:GetService("Workspace").Stores.WoodRUs.Parts.SELLWOOD.SurfaceGui.TextLabel.TextColor3 = Color3.fromRGB(255, 0, 0)
game:GetService("Workspace").Stores.WoodRUs.Parts.WOODDROPOFF.SurfaceGui.TextLabel.Text = "感谢使用无言脚本";
game:GetService("Workspace").Stores.WoodRUs.Parts.WOODDROPOFF.SurfaceGui.TextLabel.TextColor3 =
    Color3.fromRGB(255, 0, 0)

local Player = game.Players.LocalPlayer

local function droptool(Position)
    local aQ = game.Players.LocalPlayer.Character;
    if aQ:FindFirstChildOfClass "Tool" then
        local y = aQ:FindFirstChildOfClass "Tool"
        if y:FindFirstChild("ToolName") then
            game.ReplicatedStorage.Interaction.ClientInteracted:FireServer(b, "Drop tool", Position or
                game.Players.LocalPlayer.Character.Head.CFrame)

        end
    end
    for a, b in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
        if b.Name == "Tool" and b.ClassName == "Tool" then
            game.ReplicatedStorage.Interaction.ClientInteracted:FireServer(b, "Drop tool", Position or
                game.Players.LocalPlayer.Character.Head.CFrame)
        end
    end
end
local function gplr(String)
    local Found = {}
    local strl = String:lower()
    if strl == "all" then
        for i, v in pairs(game:GetService("Players"):GetPlayers()) do
            table.insert(Found, v)
        end
    elseif strl == "others" then
        for i, v in pairs(game:GetService("Players"):GetPlayers()) do
            if v.Name ~= lp.Name then
                table.insert(Found, v)
            end
        end
    elseif strl == "me" then
        for i, v in pairs(game:GetService("Players"):GetPlayers()) do
            if v.Name == lp.Name then
                table.insert(Found, v)
            end
        end
    else
        for i, v in pairs(game:GetService("Players"):GetPlayers()) do
            if v.Name:lower():sub(1, #String) == String:lower() then
                table.insert(Found, v)
            end
        end
    end
    return Found
end

function tools(plr)
    if plr:FindFirstChildOfClass("Backpack"):FindFirstChildOfClass('Tool') or
        plr.Character:FindFirstChildOfClass('Tool') then
        return true
    end
end
local a = game:GetService("Workspace")
local b = game:GetService("ReplicatedStorage")
local c = game:GetService("Players").LocalPlayer
DragModel = function(...)
    local d = {...}
    pcall(function()
        game:GetService("ReplicatedStorage")
        b.Interaction.ClientIsDragging:FireServer(d[1])
    end)
    d[1]:PivotTo(d[2])
    return d
end
DragModelmain = function(...)
    local d = {...}
    pcall(function()
        b.Interaction.ClientIsDragging:FireServer(d[1])
    end)
    d[1].Main.CFrame = d[2]
    return d
end
DragModel2 = function(...)
    local d = {...}
    pcall(function()
        b.Interaction.ClientIsDragging:FireServer(d[1])
        b.Interaction.ClientIsDragging:FireServer(d[1])
        b.Interaction.ClientIsDragging:FireServer(d[1])
        b.Interaction.ClientIsDragging:FireServer(d[1])

    end)
    d[1]:SetPrimaryPartCFrame(d[2])
    return d
end
DragModel1 = function(...)
    local d = {...}
    pcall(function()
        b.Interaction.ClientIsDragging:FireServer(d[1])
        b.Interaction.ClientIsDragging:FireServer(d[1])
    end)
    d[1]:MoveTo(d[2])
    d[1]:MoveTo(d[2])
    return d
end


repeat wait(.1) until lp.Character
local Character0 = lp.Character
Character0.Archivable = true
local IsInvis = false
local IsRunning = true
local InvisibleCharacter = Character0:Clone()
InvisibleCharacter.Parent = game:GetService'Lighting'
local Void = workspace.FallenPartsDestroyHeight
InvisibleCharacter.Name = ""
local CF

lp.CharacterAdded:Connect(function()
	if lp.Character == InvisibleCharacter then return end
	repeat wait(.1) until lp.Character:FindFirstChildWhichIsA'Humanoid'
	if IsRunning == false then
		IsInvis = false
		IsRunning = true
		Character0 = lp.Character
		Character0.Archivable = true
		InvisibleCharacter = Character0:Clone()
		InvisibleCharacter.Name = ""
		InvisibleCharacter:FindFirstChildOfClass'Humanoid'.Died:Connect(function()
			Respawn()
		end)
		for i,v in pairs(InvisibleCharacter:GetDescendants())do
			if v:IsA("BasePart") then
				if v.Name == "HumanoidRootPart" then
					v.Transparency = 1
				else
					v.Transparency = .5
				end
			end
		end
	end
end)

local Fix = game:GetService("RunService").Stepped:Connect(function()
	pcall(function()
		local IsInteger
		if tostring(Void):find'-' then
			IsInteger = true
		else
			IsInteger = false
		end
		local Pos = lp.Character.HumanoidRootPart.Position
		local Pos_String = tostring(Pos)
		local Pos_Seperate = Pos_String:split(', ')
		local X = tonumber(Pos_Seperate[1])
		local Y = tonumber(Pos_Seperate[2])
		local Z = tonumber(Pos_Seperate[3])
		if IsInteger == true then
			if Y <= Void then
				Respawn()
			end
		elseif IsInteger == false then
			if Y >= Void then
				Respawn()
			end
		end
	end)
end)

for i,v in pairs(InvisibleCharacter:GetDescendants())do
	if v:IsA("BasePart") then
		if v.Name == "HumanoidRootPart" then
			v.Transparency = 1
		else
			v.Transparency = .5
		end
	end
end

function Respawn()
	IsRunning = false
	if IsInvis == true then
		pcall(function()
			lp.Character = Character0
			wait()
			Character0.Parent = workspace
			Character0:FindFirstChildWhichIsA'Humanoid':Destroy()
			IsInvis = false
			InvisibleCharacter.Parent = nil
		end)
	elseif IsInvis == false then
		pcall(function()
			lp.Character = Character0
			wait()
			Character0.Parent = workspace
			Character0:FindFirstChildWhichIsA'Humanoid':Destroy()
			IsInvis = false
		end)
	end
end

InvisibleCharacter:FindFirstChildOfClass'Humanoid'.Died:Connect(function()
	Respawn()
end)

function FixCam()
	workspace.CurrentCamera.CameraSubject = lp.Character:FindFirstChildWhichIsA'Humanoid'
	workspace.CurrentCamera.CFrame = CF
end

function freezecam(arg)
	if arg == true then
		workspace.CurrentCamera.CameraType = Enum.CameraType.Scriptable
	else
		workspace.CurrentCamera.CameraType = Enum.CameraType.Custom
	end
end

function TurnInvisible()
	if IsInvis == true then return end
	IsInvis = true
	CF = workspace.CurrentCamera.CFrame
	local CF_1 = lp.Character.HumanoidRootPart.CFrame
	lp.Character.HumanoidRootPart.CFrame=CFrame.new(9e9, 9e9, 9e9)
	freezecam(true)
	wait(.6)
	freezecam(false)
	InvisibleCharacter = InvisibleCharacter
	Character0.Parent = game:GetService'Lighting'
	InvisibleCharacter.Parent = workspace
	InvisibleCharacter.HumanoidRootPart.CFrame = CF_1
	lp.Character = InvisibleCharacter
	FixCam()
	lp.Character.Animate.Disabled = true
	lp.Character.Animate.Disabled = false
end

function TurnVisible()
	if IsInvis == false then return end
	CF = workspace.CurrentCamera.CFrame
	Character0 = Character0
	local CF_1 = lp.Character.HumanoidRootPart.CFrame
	Character0.HumanoidRootPart.CFrame = CF_1
	InvisibleCharacter.Parent = game:GetService'Lighting'
	lp.Character = Character0
	Character0.Parent = workspace
	IsInvis = false
	FixCam()
	lp.Character.Animate.Disabled = true
	lp.Character.Animate.Disabled = false
end
for i, v in next, game:GetService("Players").LocalPlayer.PlayerGui:GetChildren() do
    if v.Name ~= "Chat" and v.Name ~= "TargetGui" then
        for i, v in next, v:GetDescendants() do
            local UC = Instance.new("UICorner", v)
            UC.CornerRadius = UDim.new(0, 5)
            if v.Name == "DropShadow" then
                v:Destroy()
            end
            if v:IsA("TextButton") or v:IsA("Frame") or v:IsA("ScrollingFrame") then
                v.BackgroundColor3 = Color3.fromRGB(24, 24, 24)
            end
            if v:IsA("TextLabel") or v:IsA("TextButton") or v:IsA("TextBox") then
                v.TextColor3 = Color3.fromRGB(225, 225, 225)
                v.BackgroundColor3 = Color3.fromRGB(24, 24, 24)
            end
        end
    end
end
notify = function(...)
    local GUI = game:GetService("CoreGui"):FindFirstChild("STX_Nofitication")
    if not GUI then
        local STX_Nofitication = Instance.new("ScreenGui")
        local STX_NofiticationUIListLayout = Instance.new("UIListLayout")
        STX_Nofitication.Name = "STX_Nofitication"
        STX_Nofitication.Parent = game.CoreGui
        STX_Nofitication.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
        STX_Nofitication.ResetOnSpawn = false

        STX_NofiticationUIListLayout.Name = "STX_NofiticationUIListLayout"
        STX_NofiticationUIListLayout.Parent = STX_Nofitication
        STX_NofiticationUIListLayout.HorizontalAlignment = Enum.HorizontalAlignment.Right
        STX_NofiticationUIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
        STX_NofiticationUIListLayout.VerticalAlignment = Enum.VerticalAlignment.Bottom
    end
    local Args = {...}
    local Nofitication = {}
    local GUI = game:GetService("CoreGui"):FindFirstChild("STX_Nofitication")
    function Nofitication:Notify(nofdebug, middledebug, all)
        local SelectedType = string.lower(tostring(middledebug.Type))
        local ambientShadow = Instance.new("ImageLabel")
        local Window = Instance.new("Frame")
        local Outline_A = Instance.new("Frame")
        local WindowTitle = Instance.new("TextLabel")
        local WindowDescription = Instance.new("TextLabel")

        ambientShadow.Name = "ambientShadow"
        ambientShadow.Parent = GUI
        ambientShadow.AnchorPoint = Vector2.new(0.5, 0.5)
        ambientShadow.BackgroundTransparency = 1.000
        ambientShadow.BorderSizePixel = 0
        ambientShadow.Position = UDim2.new(0.91525954, 0, 0.936809778, 0)
        ambientShadow.Size = UDim2.new(0, 0, 0, 0)
        ambientShadow.Image = "rbxassetid://1316045217"
        ambientShadow.ImageColor3 = Color3.fromRGB(0, 0, 0)
        ambientShadow.ImageTransparency = 0.400
        ambientShadow.ScaleType = Enum.ScaleType.Slice
        ambientShadow.SliceCenter = Rect.new(10, 10, 118, 118)

        Window.Name = "Window"
        Window.Parent = ambientShadow
        Window.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
        Window.BorderSizePixel = 0
        Window.Position = UDim2.new(0, 5, 0, 5)
        Window.Size = UDim2.new(0, 230, 0, 80)
        Window.ZIndex = 2

        Outline_A.Name = "Outline_A"
        Outline_A.Parent = Window
        Outline_A.BackgroundColor3 = middledebug.OutlineColor
        Outline_A.BorderSizePixel = 0
        Outline_A.Position = UDim2.new(0, 0, 0, 25)
        Outline_A.Size = UDim2.new(0, 230, 0, 2)
        Outline_A.ZIndex = 5

        WindowTitle.Name = "WindowTitle"
        WindowTitle.Parent = Window
        WindowTitle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        WindowTitle.BackgroundTransparency = 1.000
        WindowTitle.BorderColor3 = Color3.fromRGB(27, 42, 53)
        WindowTitle.BorderSizePixel = 0
        WindowTitle.Position = UDim2.new(0, 8, 0, 2)
        WindowTitle.Size = UDim2.new(0, 222, 0, 22)
        WindowTitle.ZIndex = 4
        WindowTitle.Font = Enum.Font.GothamSemibold
        WindowTitle.Text = nofdebug.Title
        WindowTitle.TextColor3 = Color3.fromRGB(220, 220, 220)
        WindowTitle.TextSize = 12.000
        WindowTitle.TextXAlignment = Enum.TextXAlignment.Left

        WindowDescription.Name = "WindowDescription"
        WindowDescription.Parent = Window
        WindowDescription.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        WindowDescription.BackgroundTransparency = 1.000
        WindowDescription.BorderColor3 = Color3.fromRGB(27, 42, 53)
        WindowDescription.BorderSizePixel = 0
        WindowDescription.Position = UDim2.new(0, 8, 0, 34)
        WindowDescription.Size = UDim2.new(0, 216, 0, 40)
        WindowDescription.ZIndex = 4
        WindowDescription.Font = Enum.Font.GothamSemibold
        WindowDescription.Text = nofdebug.Description
        WindowDescription.TextColor3 = Color3.fromRGB(180, 180, 180)
        WindowDescription.TextSize = 12.000
        WindowDescription.TextWrapped = true
        WindowDescription.TextXAlignment = Enum.TextXAlignment.Left
        WindowDescription.TextYAlignment = Enum.TextYAlignment.Top

        if SelectedType == "default" then
            local function ORBHB_fake_script()
                local script = Instance.new("LocalScript", ambientShadow)

                ambientShadow:TweenSize(UDim2.new(0, 240, 0, 90), "Out", "Linear", 0.2)
                Window.Size = UDim2.new(0, 230, 0, 80)
                Outline_A:TweenSize(UDim2.new(0, 0, 0, 2), "Out", "Linear", middledebug.Time)

                wait(middledebug.Time)

                ambientShadow:TweenSize(UDim2.new(0, 0, 0, 0), "Out", "Linear", 0.2)

                wait(0.2)
                ambientShadow:Destroy()
            end
            coroutine.wrap(ORBHB_fake_script)()
        elseif SelectedType == "image" then
            ambientShadow:TweenSize(UDim2.new(0, 240, 0, 90), "Out", "Linear", 0.2)
            Window.Size = UDim2.new(0, 230, 0, 80)
            WindowTitle.Position = UDim2.new(0, 24, 0, 2)
            local ImageButton = Instance.new("ImageButton")
            ImageButton.Parent = Window
            ImageButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            ImageButton.BackgroundTransparency = 1.000
            ImageButton.BorderSizePixel = 0
            ImageButton.Position = UDim2.new(0, 4, 0, 4)
            ImageButton.Size = UDim2.new(0, 18, 0, 18)
            ImageButton.ZIndex = 5
            ImageButton.AutoButtonColor = false
            ImageButton.Image = all.Image
            ImageButton.ImageColor3 = all.ImageColor

            local function ORBHB_fake_script()
                local script = Instance.new("LocalScript", ambientShadow)

                Outline_A:TweenSize(UDim2.new(0, 0, 0, 2), "Out", "Linear", middledebug.Time)

                wait(middledebug.Time)

                ambientShadow:TweenSize(UDim2.new(0, 0, 0, 0), "Out", "Linear", 0.2)

                wait(0.2)
                ambientShadow:Destroy()
            end
            coroutine.wrap(ORBHB_fake_script)()
        elseif SelectedType == "option" then
            ambientShadow:TweenSize(UDim2.new(0, 240, 0, 110), "Out", "Linear", 0.2)
            Window.Size = UDim2.new(0, 230, 0, 100)
            local Uncheck = Instance.new("ImageButton")
            local Check = Instance.new("ImageButton")

            Uncheck.Name = "Uncheck"
            Uncheck.Parent = Window
            Uncheck.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            Uncheck.BackgroundTransparency = 1.000
            Uncheck.BorderSizePixel = 0
            Uncheck.Position = UDim2.new(0, 7, 0, 76)
            Uncheck.Size = UDim2.new(0, 18, 0, 18)
            Uncheck.ZIndex = 5
            Uncheck.AutoButtonColor = false
            Uncheck.Image = "http://www.roblox.com/asset/?id=6031094678"
            Uncheck.ImageColor3 = Color3.fromRGB(255, 84, 84)

            Check.Name = "Check"
            Check.Parent = Window
            Check.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            Check.BackgroundTransparency = 1.000
            Check.BorderSizePixel = 0
            Check.Position = UDim2.new(0, 28, 0, 76)
            Check.Size = UDim2.new(0, 18, 0, 18)
            Check.ZIndex = 5
            Check.AutoButtonColor = false
            Check.Image = "http://www.roblox.com/asset/?id=6031094667"
            Check.ImageColor3 = Color3.fromRGB(83, 230, 50)

            local function ORBHB_fake_script()
                local script = Instance.new("LocalScript", ambientShadow)

                local Stilthere = true
                local function Unchecked()
                    pcall(function()
                        all.Callback(false)
                    end)
                    ambientShadow:TweenSize(UDim2.new(0, 0, 0, 0), "Out", "Linear", 0.2)

                    wait(0.2)
                    ambientShadow:Destroy()
                    Stilthere = false
                end
                local function Checked()
                    pcall(function()
                        all.Callback(true)
                    end)
                    ambientShadow:TweenSize(UDim2.new(0, 0, 0, 0), "Out", "Linear", 0.2)

                    wait(0.2)
                    ambientShadow:Destroy()
                    Stilthere = false
                end
                Uncheck.MouseButton1Click:Connect(Unchecked)
                Check.MouseButton1Click:Connect(Checked)

                Outline_A:TweenSize(UDim2.new(0, 0, 0, 2), "Out", "Linear", middledebug.Time)

                wait(middledebug.Time)

                if Stilthere == true then
                    ambientShadow:TweenSize(UDim2.new(0, 0, 0, 0), "Out", "Linear", 0.2)

                    wait(0.2)
                    ambientShadow:Destroy()
                end
            end
            coroutine.wrap(ORBHB_fake_script)()
        end
    end
    Nofitication:Notify({
        Title = Args[1],
        Description = Args[2]
    }, {
        OutlineColor = Color3.fromRGB(80, 80, 80),
        Time = Args[3],
        Type = "image"
    }, {
        Image = "http://www.roblox.com/asset/?id=6023426923",
        ImageColor = Color3.fromRGB(255, 84, 84)
    })
end
function getTieredAxe()
    return {
        ['Beesaxe'] = 13,
        ['AxeAmber'] = 12,
        ['ManyAxe'] = 15,
        ['BasicHatchet'] = 0,
        ['RustyAxe'] = -1,
        ['Axe1'] = 2,
        ['Axe2'] = 3,
        ['AxeAlphaTesters'] = 9,
        ['Rukiryaxe'] = 8,
        ['Axe3'] = 4,
        ['AxeBetaTesters'] = 10,
        ['FireAxe'] = 11,
        ['SilverAxe'] = 5,
        ['EndTimesAxe'] = 16,
        ['AxeChicken'] = 6,
        ['CandyCaneAxe'] = 1,
        ['AxeTwitter'] = 7,
        ['CandyCornAxe'] = 14
    }
end
function getAxeList()
    local aP = {}
    for J, v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
        table.insert(aP, v)
    end
    local aQ = game.Players.LocalPlayer.Character;
    if aQ:FindFirstChildOfClass "Tool" then
        table.insert(aP, aQ:FindFirstChildOfClass("Tool"))
    end
    return aP
end
function getWorstAxe()
    local aQ = game.Players.LocalPlayer.Character;
    if aQ:FindFirstChildOfClass "Tool" then
        local y = aQ:FindFirstChildOfClass "Tool"
        if y:FindFirstChild("ToolName") then
            return y
        end
    end
    local aR = 9999;
    local aS = nil;
    local aT = getTieredAxe()
    for J, v in pairs(getAxeList()) do
        if v:FindFirstChild("ToolName") then
            if aT[v.ToolName.Value] < aR then
                aS = v;
                aR = aT[v.ToolName.Value]
            end
        end
    end
    return aS
end

local function barkgetBestAxe()
    local aQ = game.Players.LocalPlayer.Character;
    if aQ:FindFirstChildOfClass "Tool" then
        local y = aQ:FindFirstChildOfClass "Tool"
        if y:FindFirstChild("ToolName") then
            return y
        end
    end
    local aU = -1;
    local aV = nil;
    local aT = getTieredAxe()
    for J, v in pairs(getAxeList()) do
        if v:FindFirstChild("ToolName") then
            if aT[v.ToolName.Value] > aU then
                aV = v;
                aU = aT[v.ToolName.Value]
            end
        end
    end
    return aV
end
function getHitPointsTbl()
    return {
        ['Beesaxe'] = 1.4,
        ['AxeAmber'] = 3.39,
        ['ManyAxe'] = 10.2,
        ['BasicHatchet'] = 0.2,
        ['Axe1'] = 0.55,
        ['Axe2'] = 0.93,
        ['AxeAlphaTesters'] = 1.5,
        ['Rukiryaxe'] = 1.68,
        ['Axe3'] = 1.45,
        ['AxeBetaTesters'] = 1.45,
        ['FireAxe'] = 0.6,
        ['SilverAxe'] = 1.6,
        ['EndTimesAxe'] = 1.58,
        ['AxeChicken'] = 0.9,
        ['CandyCaneAxe'] = 0,
        ['AxeTwitter'] = 1.65,
        ['CandyCornAxe'] = 1.75,
        ["CaveAxe"] = 0.4
    }
end
local function getMouseTarget()
    local b2 = game:GetService("UserInputService"):GetMouseLocation()
    return workspace:FindPartOnRayWithIgnoreList(Ray.new(workspace.CurrentCamera.CFrame.p,
        workspace.CurrentCamera:ViewportPointToRay(b2.x, b2.y, 0).Direction * 1000),
        game.Players.LocalPlayer.Character:GetDescendants())
end
local Pos = game:service 'Players'.LocalPlayer.Character.HumanoidRootPart.CFrame + Vector3.new(0, 5, 0)

local function table_foreach(table, callback)
    for i = 1, #table do
        callback(i, table[i])
    end
end

local function getCFrame(part)
    local part = part or (lp.Character and lp.Character.HumanoidRootPart)
    if not part then
        return
    end
    return part.CFrame
end

local function tp(pos)
    local pos = pos or lp:GetMouse().Hit + Vector3.new(0, lp.Character.HumanoidRootPart.Size.Y, 0)
    if typeof(pos) == "CFrame" then
        lp.Character:SetPrimaryPartCFrame(pos)
    elseif typeof(pos) == "Vector3" then
        lp.Character:MoveTo(pos)
    end
end

require = getgenv().require -- for pebc and sentinel

function get_axe_damage(tool, tree)
    -- totally not skidded from lumbsmasher
    local axe_class = require(game.ReplicatedStorage.AxeClasses['AxeClass_' .. tool.ToolName.Value])
    local axe_table = axe_class.new()
    if axe_table["SpecialTrees"] then
        if axe_table["SpecialTrees"][tree] then
            return axe_table["SpecialTrees"][tree].Damage
        else
            return axe_table.Damage
        end
    else
        return axe_table.Damage
    end
end
function get_axe_cooldown(tool)
    local success, return_value = pcall(function()
        local axe_class = require(game.ReplicatedStorage.AxeClasses['AxeClass_' .. tool.ToolName.Value])
        local axe_table = axe_class.new()

        return axe_table.SwingCooldown
    end)
    if success then
        return return_value
    else
        warn("ERROR WHILE REQUIRING MODULE: " .. return_value)
        return 1
    end
end
function get_axe_swingdelay(tool)
    local axe_cooldown = get_axe_cooldown(tool)
    local start = tick()
    game.ReplicatedStorage.TestPing:InvokeServer()
    local ping = (tick() - start) / 2
    local swing_delay = 0.65 * axe_cooldown - ping
    return swing_delay
end
local override_sawmill = nil
function getBestSawmill()
    local best = nil
    for i, v in pairs(game.Workspace.PlayerModels:GetChildren()) do
        if v:FindFirstChild("Owner") and v:FindFirstChild("ItemName") and v.Owner.Value == game.Players.LocalPlayer and
            v.ItemName.Value:sub(1, 7) == "Sawmill" then
            if not best then
                best = v
            else
                if #v.ItemName.Value > #best.ItemName.Value then
                    best = v
                elseif tonumber(v.ItemName.Value:sub(8, 8)) > tonumber(best.ItemName.Value:sub(8, 8)) then
                    best = v
                end
            end
        end
    end
    return best
end
function barkgetBestAxe2()
    -- changing it to my own method ~applebee#3071
    local pc = game.Players.LocalPlayer.Character
    local axe_damage
    local best_axe
    for i, v in pairs(getAxeList()) do
        if v.name == "Tool" then
            local damage = get_axe_damage(v, "Generic")
            if best_axe == nil then
                best_axe = v
                axe_damage = damage
            elseif get_axe_damage(best_axe, "Generic") < damage then
                best_axe = v
                axe_damage = damage
            end
        end
    end
    return best_axe
end
local function lumbsmasher_legitpaint(wood_class, blueprint, tpback)

    local old = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
    local remote = game.ReplicatedStorage.PlaceStructure.ClientPlacedStructure
    local bp_type = blueprint.ItemName.Value

    local Player = game.Players.LocalPlayer
    local wood
    for i, v in pairs(game:GetService("ReplicatedStorage").ClientItemInfo:GetChildren()) do
        if v.Name == bp_type then
            for i, s in pairs(v:GetChildren()) do
                if s.Name == "WoodCost" then
                    wood = s.Value
                end
            end
        end

    end
    if lp.SuperBlueprint.Value then
        wood = 1
    end
    local required_wood = wood

    -- getting the axe
    local tool = barkgetBestAxe2()
    local sawmill = getBestSawmill()
    if tool == nil then
        notify("无言脚本", "请你装备斧头", 4)
        return
    end

    if wood_class == "LoneCave" then
        if tool.ToolName.Value ~= "EndTimesAxe" then
            notify("无言脚本", "请你装备末日斧头", 4)
            return
        end
    end

    local WoodSection
    local Min = 9e99

    for i, v in pairs(game.Workspace:GetChildren()) do
        if v.Name == 'TreeRegion' then
            for j, Tree in pairs(v:GetChildren()) do
                if Tree:FindFirstChild('Leaves') and Tree:FindFirstChild('WoodSection') and
                    Tree:FindFirstChild('TreeClass') then
                    if Tree:FindFirstChild('TreeClass').Value == wood_class then

                        for k, TreeSection in pairs(Tree:GetChildren()) do
                            if TreeSection.Name == 'WoodSection' then
                                local Size = TreeSection.Size.X * TreeSection.Size.Y * TreeSection.Size.Z
                                if (Size > required_wood) and (#TreeSection.ChildIDs:GetChildren() == 0) then
                                    if Min > TreeSection.Size.X then
                                        Min = TreeSection.Size.X
                                        WoodSection = TreeSection
                                    end
                                end
                            end
                        end
                    end
                end
            end
        end
    end

    if not WoodSection then
        notify("无言脚本", "没有找到树", 4)
        return
    end

    local Chopped = false
    local treecon = game.Workspace.LogModels.ChildAdded:connect(function(add)
        local Owner = add:WaitForChild('Owner')
        if (add.Owner.Value == Player) and (add.TreeClass.Value == wood_class) and add:FindFirstChild("WoodSection") then
            Chopped = add
            treecon:Disconnect()
        end
    end)

    local CutSize = required_wood / (WoodSection.Size.X * WoodSection.Size.X) + 0.01
    local swing_delay = get_axe_swingdelay(tool)
    local function axe(v, id, h)
        local hps = get_axe_damage(tool, Wood)
        local table = {
            ["tool"] = tool,
            ["faceVector"] = Vector3.new(0, 0, -1),
            ["height"] = h,
            ["sectionId"] = id,
            ["hitPoints"] = hps,
            ["cooldown"] = 0.112,
            ["cuttingClass"] = "Axe"
        }
        game:GetService("ReplicatedStorage").Interaction.RemoteProxy:FireServer(v.CutEvent, table)
        task.wait()
    end
    local iterations = 0
    _G.GetTreeNC = game:GetService 'RunService'.Stepped:connect(oldnocliprun)
    while Chopped == false do
        iterations = iterations + 1
        if iterations > 1000 then
            game.ReplicatedStorage.Interaction.ClientIsDragging:FireServer(WoodSection.Parent)
            game.ReplicatedStorage.Interaction.DestroyStructure:FireServer(WoodSection.Parent)
            Chopped = true
        end
        tp(WoodSection.CFrame + Vector3.new(4, 2, 2))
        axe(WoodSection.Parent, WoodSection.ID.Value, WoodSection.Size.Y - CutSize)
    end
    _G.GetTreeNC:Disconnect()
    _G.GetTreeNC = nil
    game.Players.LocalPlayer.Character.Humanoid:ChangeState(7)

    local target_cframe
    if blueprint:FindFirstChild("MainCFrame") then
        target_cframe = blueprint.MainCFrame.Value
    else
        target_cframe = blueprint.PrimaryPart.CFrame
    end

    -- local fill_target_cframe = sawmill.Particles.CFrame + Vector3.new((sawmill.Main.Size.X/2)-2, 0, 0)
    local fill_target_cframe = sawmill.Particles.CFrame + Vector3.new(0, 1, 0)
    -- teleport bp to sawmill --ignore as teleporting to wood directly
    -- game.ReplicatedStorage.PlaceStructure.ClientPlacedBlueprint:FireServer(blueprint.ItemName.Value, fill_target_cframe, game.Players.LocalPlayer, blueprint, true)

    iterations = 0
    local Sawed = false
    sawconn = game.Workspace.PlayerModels.ChildAdded:connect(function(add)
        local Owner = add:WaitForChild('Owner')
        if (add.Owner.Value == Player) and add:FindFirstChild("WoodSection") then
            if not add:FindFirstChild('TreeClass') then
                repeat
                    wait()
                until add:FindFirstChild('TreeClass')
            end
            if add.TreeClass.Value == wood_class then
                Sawed = add
                sawconn:Disconnect()
            end
        end
    end)
    iterations = 0
    while Chopped.Parent ~= nil do
        if Sawed then
            break
        end
        iterations = iterations + 1
        if iterations > 300 then
            notify("无言脚本", "没有成功处理树", 4)
        end
        tp(CFrame.new(Chopped.WoodSection.Position) + Vector3.new(0, 4, 0))
        -- game.ReplicatedStorage.Interaction.ClientRequestOwnership:FireServer(Chopped.WoodSection)
        game.ReplicatedStorage.Interaction.ClientIsDragging:FireServer(Chopped)
        Chopped.PrimaryPart = Chopped.WoodSection
        Chopped:SetPrimaryPartCFrame(sawmill.Particles.CFrame)
        -- Chopped.WoodSection.CFrame = sawmill.Particles.CFrame
        game.ReplicatedStorage.Interaction.ClientIsDragging:FireServer(Chopped)
        wait(2)
    end
    repeat
        wait()
    until Sawed
    iterations = 0

    local placed = false
    local new_structure_connection
    new_structure_connection = game.Workspace.PlayerModels.ChildAdded:Connect(function(child)
        local owner = child:WaitForChild("Owner")
        if owner.Value == game.Players.LocalPlayer and child:FindFirstChild("Type") and child.Type.Value == "Structure" then
            if not child:FindFirstChild("BuildDependentWood") then
                notify("无言脚本", "没有成功", 4)
                return
            end
            new_structure_connection:Disconnect()
            local wood_type
            if child:FindFirstChild("BlueprintWoodClass") then
                wood_type = child.BlueprintWoodClass.Value
            end
            remote:FireServer(child.ItemName.Value, target_cframe, game.Players.LocalPlayer, wood_type, child, true, nil)
            placed = true
            -- pcall(rconsoleprint, "Moved and Placed Structure!\n")
        end
    end)
    while Sawed.Parent ~= nil do
        -- pcall(rconsoleprint, "Plank Exists! Filling Blueprint...\n")
        if iterations > 50 then
            -- if blueprint.Parent then
            game.ReplicatedStorage.Interaction.DestroyStructure:FireServer(Sawed)
            game.ReplicatedStorage.Interaction.DestroyStructure:FireServer(blueprint)
            -- pcall(rconsoleprint, "Way too many attempts to teleport blueprint to wood!\n")
            notify("无言脚本", "尝试太多次蓝图填充了", 4)
            -- end
        end
        iterations = iterations + 1
        if Sawed.Parent == nil then
            break
        end
        local connection, blueprint_made
        connection = game.Workspace.PlayerModels.ChildAdded:Connect(function(child)
            if child:WaitForChild("Owner") and child.Owner.Value == game.Players.LocalPlayer and
                child:FindFirstChild("Type") and child.Type.Value == "Blueprint" then
                connection:Disconnect()
                blueprint = child
                blueprint_made = true
            end
        end)
        game.ReplicatedStorage.PlaceStructure.ClientPlacedBlueprint:FireServer(bp_type, Sawed.WoodSection.CFrame,
            game.Players.LocalPlayer, blueprint, blueprint.Parent ~= nil)
        -- pcall(rconsoleprint, "Waiting for BP Move...\n")
        local bp_wait_iter = 0
        repeat
            if bp_wait_iter > 500 then
                notify("无言脚本", "没有找到蓝图", 4)
                -- game.ReplicatedStorage.Interaction.DestroyStructure:FireServer(blueprint)
                -- game.ReplicatedStorage.PlaceStructure.ClientPlacedBlueprint:FireServer(bp_type, Sawed.WoodSection.CFrame, game.Players.LocalPlayer, nil, false)
                -- bp_wait_iter = 0
            end
            wait()
            bp_wait_iter = bp_wait_iter + 1
        until blueprint_made or placed
        if placed then
            pcall(connection.Disconnect, connection)
        end

    end
    iterations = 0
    -- pcall(rconsoleprint, "Waiting for placement...\n")
    repeat
        wait()
    until placed
    -- pcall(rconsoleprint, "Placed!\n")
    if tpback then
        tp(old)
        notify("无言脚本", "完成", 4)
    end
end

local function getPosition(part)
    return getCFrame(part).Position
end

local function getTools()
    lp.Character.Humanoid:UnequipTools()
    local tools = {}
    table_foreach(lp.Backpack:GetChildren(), function(_, v)
        if v.Name ~= "BlueprintTool" then
            tools[#tools + 1] = v
        end
    end)
    return tools
end
local function getToolStats(toolName)
    if typeof(toolName) ~= "string" then

        toolName = toolName.ToolName.Value
    end
    return require(gs("ReplicatedStorage").AxeClasses['AxeClass_' .. toolName]).new()
end
local getTool = function()
    return lp.Character:FindFirstChild("Tool") or lp.Backpack:FindFirstChild("Tool")
end
local function getBestAxe(treeClass)
    local tools = getTools()
    if #tools == 0 then
        return notify("无言脚本", "你需要斧头", 4)
    end
    local toolStats = {}
    local tool
    for _, v in next, tools do
        if treeClass == "LoneCave" and v.ToolName.Value == "EndTimesAxe" then
            tool = v
            break
        end
        local axeStats = getToolStats(v)
        if axeStats.SpecialTrees and axeStats.SpecialTrees[treeClass] then
            for i, v in next, axeStats.SpecialTrees[treeClass] do
                axeStats[i] = v
            end
        end
        table.insert(toolStats, {
            tool = v,
            damage = axeStats.Damage
        })
    end
    if not tool and treeClass == "LoneCave" then
        return notify("无言脚本", "你需要末日斧头", 4)
    end
    table.sort(toolStats, function(a, b)
        return a.damage > b.damage
    end)
    return true, tool or toolStats[1].tool
end

local function cutPart(event, section, height, tool, treeClass)
    local axeStats = getToolStats(tool)
    if axeStats.SpecialTrees and axeStats.SpecialTrees[treeClass] then
        for i, v in next, axeStats.SpecialTrees[treeClass] do
            axeStats[i] = v
        end
    end
    game:GetService 'ReplicatedStorage'.Interaction.RemoteProxy:FireServer(event, {
        tool = tool,
        faceVector = Vector3.new(-1, 0, 0),
        height = height or 0.3,
        sectionId = section or 1,
        hitPoints = axeStats.Damage,
        cooldown = axeStats.SwingCooldown,
        cuttingClass = "Axe"
    })
end
local treeListener = function(treeClass, callback)
    local childAdded
    childAdded = workspace.LogModels.ChildAdded:Connect(function(child)
        local owner = child:WaitForChild("Owner")
        if owner.Value == lp and child.TreeClass.Value == treeClass then
            childAdded:Disconnect()
            callback(child)
        end
    end)
end

local getBiggestTree = function(treeClass)
    for _, v in next, workspace:children() do
        if tostring(v) == "TreeRegion" then
            for _, g in next, v:children() do
                if g:FindFirstChild("TreeClass") and tostring(g.TreeClass.Value) == treeClass and
                    g:FindFirstChild("Owner") then
                    if g.Owner.Value == nil or tostring(g.Owner.Value) == tostring(game.Players.LocalPlayer) then
                        if #g:children() > 5 and g:FindFirstChild("WoodSection") then
                            for h, j in next, g:children() do
                                if j:FindFirstChild("ID") and j.ID.Value == 1 and j.Size.Y > .5 then
                                    return j;
                                end
                            end
                        end
                    end
                end
            end
        end
    end
    return false;
end

local function bringTree(treeClass)

    local success, data = getBestAxe(treeClass)

    local axeStats = getToolStats(data)

    local treeCut = false

    treeListener(treeClass, function(tree)
        tree:WaitForChild('Owner', 60)

        tree.PrimaryPart = tree:FindFirstChild("WoodSection")
        treeCut = true

        task.spawn(function()
            for i = 1, 60 do
                game:GetService("ReplicatedStorage")
                b.Interaction.ClientIsDragging:FireServer(tree)
                game["Run Service"].Heartbeat:wait()
            end
        end)
        task.wait(0.1)
        tree.PrimaryPart = tree.WoodSection
        spawn(function()
            for i = 1, 60 do
                tree.PrimaryPart.Velocity = Vector3.new(0, 0, 0)
                tree:PivotTo(bai.treecutset)
                game["Run Service"].Heartbeat:wait()
            end
        end)

        wait(0.5)
        if treeClass == "LoneCave" then
            lp.Character.Head:Destroy()
            lp.CharacterAdded:Wait()
            wait(2)
        end

        tp(bai.treecutset)
    end)

    if treeClass == "LoneCave" then
        local GM = game.Players.LocalPlayer.Character.HumanoidRootPart.RootJoint
        GM:Clone().Parent = game.Players.LocalPlayer.Character.HumanoidRootPart
        GM:Destroy()
    end
    local tree = getBiggestTree(treeClass)
    if not tree then
        return notify("无言脚本", "没有找到树", 3)
    end

    spawn(function()
        repeat
            tp(tree.CFrame + Vector3.new(3, 3, 0))
            cutPart(tree.Parent.CutEvent, 1, 0.3, data, treeClass)
            game["Run Service"].Heartbeat:wait()
        until treeCut
    end)

end

local function autofarm(treeClass)
    local oldpos = lp.Character.HumanoidRootPart.CFrame
    local success, data = getBestAxe(treeClass)

    local axeStats = getToolStats(data)

    local tree = getBiggestTree(treeClass)

    if not tree then
        return notify("无言脚本", "没有找到树", 3)
    end

    local treeCut = false

    treeListener(treeClass, function(tree)
        tree.PrimaryPart = tree:FindFirstChild("WoodSection")
        treeCut = true

        for i = 1, 70 do

            game:GetService 'ReplicatedStorage'.Interaction.ClientIsDragging:FireServer(tree.WoodSection)
            tree:MoveTo(oldPosition)
            task.wait()
        end

    end)
    task.wait(0.15)

    task.spawn(function()
        repeat
            tp(tree.trunk.CFrame * CFrame.new(4, 3, 4))
            task.wait()
        until treeCut
    end)

    task.wait()

    repeat
        cutPart(tree.tree.CutEvent, 1, 0.3, data, treeClass)
        task.wait(axeStats.SwingCooldown - 14)
    until treeCut
    if bai.autofarm1 == false then
        notify("无言脚本", "完成", 3)
    end
    tp(oldPosition)
end

local function lowerBridge(value)

    if value == 'Higher' then
        for _, v in pairs(game.workspace.Bridge.VerticalLiftBridge.Lift:GetChildren()) do
            v.CFrame = v.CFrame + Vector3.new(0, 26, 0)
        end

    elseif value == 'Lower' then
        for _, v in pairs(game.workspace.Bridge.VerticalLiftBridge.Lift:GetChildren()) do
            v.CFrame = v.CFrame + Vector3.new(0, -26, 0)
        end
    end
end

local function OpenSelectedItem(item)
    local itemBox = item:FindFirstChild('BoxItemName') or item:FindFirstChild('PurchasedBoxItemName');
    if itemBox and item:FindFirstChild('Type') and item.Type.Value ~= 'Structure' then
        game:GetService('ReplicatedStorage').Interaction.ClientInteracted:FireServer(item, 'Open box');
        notify('无言脚本', '成功打开', 4)
    end
end

local function donate(plr, amount)
    local spawnf = function(func, ...)
        return coroutine.wrap(func)(...)
    end
    if tostring(plr) == tostring(lp) then
        notify('错误', '请选择玩家', 4);
        return;
    end
    if bai.donationRecipient == nil or not game:GetService('Players'):FindFirstChild(plr) then
        notify('错误', '没有找到玩家', 4);
        return;
    end
    if tonumber(bai.moneyaoumt) >= 60000000 then
        notify('错误', '数字太高', 4);
        return;
    end
    if tonumber(bai.moneyaoumt) <= 0 then
        notify('错误', '数字太高', 4);
        return;
    end
    if lp.CurrentSaveSlot.Value <= 0 then
        notify('错误', '基地没有加载', 4);
        return;
    end
    if not lp:FindFirstChild('CurrentlySavingOrLoading') then
        notify('错误', '正在保存', 4);
        return;
    end
    if tonumber(bai.moneyaoumt) > lp.leaderstats.Money.Value then
        notify('错误', '你没有足够的钱', 4);
        return;
    end

    local scr = getsenv(lp.PlayerGui.DonateGUI.DonateClient)
    local scr2 = getsenv(lp.PlayerGui.NoticeGUI.NoticeClient)
    scr.setPlatformControls = function()
    end
    scr.openWindow();
    game:GetService 'RunService'.Heartbeat:wait();
    local oldAmount = bai.Players:FindFirstChild(plr).leaderstats.Money.Value;
    local success, errormsg = spawnf(function()
        game:GetService 'ReplicatedStorage'.Transactions.ClientToServer.Donate:InvokeServer(game:GetService('Players')
            :FindFirstChild(plr), tonumber(amount), tonumber(lp.CurrentSaveSlot.Value))
    end);
    game:GetService 'RunService'.Heartbeat:wait();
    for i, v in next, getupvalues(scr.sendDonation) do
        if i == 1 then
            debug.setupvalue(scr.sendDonation, i, game.Players:FindFirstChild(plr));
        end
    end
    scr.sendDonation();
    game:GetService 'RunService'.Heartbeat:wait();
    scr2.exitNotice();
    notify('无言脚本', '正在尝试转钱', 2);
    wait(6)
    if game:GetService('Players'):FindFirstChild(plr).leaderstats.Money.Value ~= oldAmount + amount then
        notify('错误', '错误可能需要冷却', 4);
        scr2.exitNotice();
        return;
    end
    notify('无言脚本', '转钱' .. tostring(amount) .. ' 给 ' .. tostring(plr), 4);
    scr2.exitNotice();
end
local function OwnerCheck(item)
    if item:FindFirstChild('Owner') then
        return tostring(item.Owner.Value);
    end
end

local function WhitelistCheck(player)
    return game:GetService('ReplicatedStorage').Interaction.ClientIsWhitelisted:InvokeServer(player) == true;
end
local function farAxeEquip()

    local done = false;
    if bai.farAxeEquip == nil then
        notify('无言脚本', '选择一把斧头', 4);
        bai.farAxeEquip = Mouse.Button1Down:connect(function()
            local target = Mouse.Target;
            if target.Parent:IsA('Model') and target.Parent:FindFirstChild('ToolName') then
                if OwnerCheck(target.Parent) == tostring(lp) or WhitelistCheck(target.Parent.Owner.Value) then
                    game:GetService('ReplicatedStorage').Interaction.ClientInteracted:FireServer(target.Parent,
                        'Pick up tool');
                    done = true;
                end
            end
        end);
        repeat
            wait()
        until done;
        notify('无言脚本', '已装备', 4);
        if bai.farAxeEquip then
            bai.farAxeEquip:Disconnect();
            bai.farAxeEquip = nil;
        end
    else
        notify('错误', '已经激活', 4);
    end
end
local function applyLight(value)
    if value then
        local light = Instance.new('PointLight', lp.Character.Head)
        light.Name = 'bai'
        light.Range = 150
        light.Brightness = 1.7
    else
        pcall(function()
            lp.Character.Head.bai:remove();
        end);
    end
end

local function carTeleport(cframe)
    if game.Players.LocalPlayer.Character then
        Character = game.Players.LocalPlayer.Character
        if Character.Humanoid.SeatPart ~= nil then
            Car = Character.Humanoid.SeatPart.Parent
            spawn(function()
                for i = 1, 5 do
                    wait()
                    Car:SetPrimaryPartCFrame(cframe *
                                                 CFrame.Angles(math.rad(Character.HumanoidRootPart.Orientation.x),
                            math.rad(Character.HumanoidRootPart.Orientation.y), 0))
                    game.ReplicatedStorage.Interaction.ClientRequestOwnership:FireServer(Car.Main)
                    game.ReplicatedStorage.Interaction.ClientIsDragging:FireServer(Car.Main)
                end
            end)
        end
    end

end
local function CheckIfSlotAvailable(Slot)
    for a, b in pairs(game.ReplicatedStorage.LoadSaveRequests.GetMetaData:InvokeServer(game.Players.LocalPlayer)) do
        if a == Slot then
            for c, d in pairs(b) do
                if c == "NumSaves" and d ~= 0 then
                    return true
                else
                    return false
                end
            end
        end
    end
end

local function CheckSlotNumber() -- Checks if the slot number is right
    if bai.soltnumber == "1" or bai.soltnumber == "2" or bai.soltnumber == "3" or bai.soltnumber == "4" or
        bai.soltnumber == "5" or bai.soltnumber == "6" then
        local SlotNumber = tonumber(bai.soltnumber)
        return SlotNumber
    else
        return false
    end
end

local function getPlanks()
    local plankList = {};
    for _, plank in next, game:GetService('Workspace').PlayerModels:children() do
        if plank:FindFirstChild('WoodSection') and plank:FindFirstChild('Owner') and plank.Owner.Value ==
            game:GetService('Players').LocalPlayer and not table.find(plankList, plank) then
            table.insert(plankList, plank)
        end
    end
    return plankList;
end

local function sellwood()
    local oldpos = lp.Character.HumanoidRootPart.CFrame
    for i, v in next, game:GetService("Workspace").LogModels:GetChildren() do
        if v:FindFirstChild("Owner") and v.Owner.Value == game.Players.LocalPlayer then
            tp(v.WoodSection.CFrame)
            spawn(function()
                for i2, v2 in next, v:GetChildren() do
                    if v2.Name == "WoodSection" then
                        local FreezeWood = Instance.new("BodyVelocity", v2)
                        FreezeWood.Velocity = Vector3.new(0, 0, 0)
                        FreezeWood.P = 100000
                        spawn(function()

                            for i = 1, 50 do
                                game.ReplicatedStorage.Interaction.ClientIsDragging:FireServer(v)
                                v:PivotTo(CFrame.new(314.54, -0.5, 86.823))
                                v2.CFrame = CFrame.new(314.54, -0.5, 86.823)
                                game.ReplicatedStorage.Interaction.ClientIsDragging:FireServer(v)
                                game:GetService 'RunService'.Heartbeat:wait();
                            end
                        end)
                        task.wait(1)
                    end
                end
            end)
            task.wait(2)
        end
    end
    tp(oldpos)
end

local function PlankToBlueprint()

    local target;
    notify('无言脚本', '选择一个木头和蓝图', 2);
    bai.PlankToBlueprint = game:GetService('Players').LocalPlayer:GetMouse().Button1Down:Connect(function()
        if game:GetService('Players').LocalPlayer:GetMouse().Target then
            target = game:GetService('Players').LocalPlayer:GetMouse().Target;
        end
        if target.Parent:FindFirstChild('Type') and target.Parent.Type.Value == 'Blueprint' then
            bai.blueprintModel = game:GetService('Players').LocalPlayer:GetMouse().Parent;
            notify('无言脚本', '蓝图已选择', 2);
        end
        if tostring(target.Parent) == 'Plank' and target.Parent:FindFirstChild('Owner') and
            tostring(target.Parent.Owner.Value) == tostring(lp) then
            bai.plankModel = target.Parent;
            notify('无言脚本', '木头已选择', 2);
        end
    end);
    repeat
        wait()
    until bai.plankModel and bai.blueprintModel;
    bai.PlankToBlueprint:Disconnect();
    bai.PlankToBlueprint = nil;
    tp(CFrame.new(bai.plankModel:FindFirstChildOfClass 'Part'.CFrame.p + Vector3.new(0, 3, 4)))
    wait(.2)
    for i = 1, 30 do
        pcall(function()
            game:GetService('ReplicatedStorage').Interaction.ClientIsDragging:FireServer(bai.plankModel)
            bai.plankModel.WoodSection.CFrame = CFrame.new(bai.blueprintModel.Main.CFrame.p + Vector3.new(0, 1.5, 0));
            game:GetService 'RunService'.Stepped:wait();
        end);
    end

    notify('无言脚本', '完成', 2);
    bai.blueprintModel = nil;
    bai.plankModel = nil;
end

local function burnAllShopItems()
    local found = false;
    for _, PressurePlate in pairs(game.Workspace.PlayerModels:children()) do
        if PressurePlate:FindFirstChild 'ItemName' and PressurePlate.ItemName.Value == 'PressurePlate' then
            if PressurePlate.Output.BrickColor ~= BrickColor.new 'Electric blue' then
                repeat
                    wait()
                    lp.Character.HumanoidRootPart.CFrame = CFrame.new(
                        PressurePlate.Plate.CFrame.p + Vector3.new(0, .3, 0));
                until PressurePlate.Output.BrickColor == BrickColor.new 'Electric blue' or not PressurePlate;
                found = true;
            end
        end
    end
    if not found then
        notify('无言脚本', '没有找到压力板', 4);
        return;
    end
end

function axefily()

    bai.axeFling = mouse.Button1Down:Connect(function()
        local axe = nil
        local axeConnection = workspace.PlayerModels.ChildAdded:connect(function(v)
            v:WaitForChild('Owner', 60)
            if v.Owner.Value == lp then
                print(v)
                axe = v;
                wait(2);
                game.ReplicatedStorage.Interaction.ClientInteracted:FireServer(axe, 'Pick up tool');
            end
        end);

        local oldpos = lp.Character.HumanoidRootPart.CFrame
        droptool(oldpos)

        repeat
            task.wait(0.1)
        until axe ~= nil
        axeConnection:Disconnect();
        axeConnection = nil;
        local fling = Instance.new('BodyPosition', axe.Main);
        fling.MaxForce = Vector3.new(math.huge, math.huge, math.huge);
        fling.P = 650000;
        fling.Position = lp:GetMouse().Hit.p;

        spawn(function()
            while bai.whthmose == true do
                task.wait(0.1)
                fling.Position = lp:GetMouse().Hit.p;
            end
        end)
        local flingPower = 9e9;
        axe.Main.CanCollide = false;
        repeat
            task.wait();
            axe.Main.RotVelocity = Vector3.new(5, 5, 5) * flingPower;
        until (axe.Main.CFrame.p - fling.Position).Magnitude < 1;
        wait(7);
        fling:Destroy();
        axe.Main.CanCollide = true;

    end)
end

local function Press(Button)
    game.ReplicatedStorage.Interaction.RemoteProxy:FireServer(Button)
end
function CanClientLoad()
    if not game:GetService "ReplicatedStorage".LoadSaveRequests.ClientMayLoad:InvokeServer(lp) then
        notify("无言脚本", "等待加载时间,请耐心的等待", 4)
        repeat
            game:GetService "RunService".Stepped:wait()
        until game:GetService "ReplicatedStorage".LoadSaveRequests.ClientMayLoad:InvokeServer(lp)
    end
    return true
end
function GetLoadedSlot()
    return lp.CurrentSaveSlot.Value
end
function LoadSlot(slot)
    local CheckLoad
    spawn(function()
        CheckLoad = game:GetService('ReplicatedStorage').LoadSaveRequests.ClientMayLoad:InvokeServer(lp)
        if not CheckLoad then
            repeat
                wait()
            until CheckLoad
        end
        game:GetService('ReplicatedStorage').LoadSaveRequests.RequestLoad:InvokeServer(slot, lp)
        return slot
    end)
end

Teleport = function(...)
    local d = {...}
    for e = 1, 3 do
        task.wait()
        c.Character.HumanoidRootPart.CFrame = d[1]
    end
    return d
end

local k = tonumber(1)
local l = {}
GetShopID = {
    ["WoodRus"] = {
        ["Character"] = a.Stores.WoodRUs.Thom,
        ["Name"] = "Thom",
        ["ID"] = tonumber(7)
    },
    ["FurnitureStore"] = {
        ["Character"] = a.Stores.FurnitureStore.Corey,
        ["Name"] = "Corey",
        ["ID"] = tonumber(8)
    },
    ["CarStore"] = {
        ["Character"] = a.Stores.CarStore.Jenny,
        ["Name"] = "Jenny",
        ["ID"] = tonumber(9)
    },
    ["ShackShop"] = {
        ["Character"] = a.Stores.ShackShop.Bob,
        ["Name"] = "Bob",
        ["ID"] = tonumber(10)
    },
    ["FineArt"] = {
        ["Character"] = a.Stores.FineArt.Timothy,
        ["Name"] = "Timothy",
        ["ID"] = tonumber(11)
    },
    ["LogicStore"] = {
        ["Character"] = a.Stores.LogicStore.Lincoln,
        ["Name"] = "Lincoln",
        ["ID"] = tonumber(12)
    }
}
BuyItem = function(m)
    return b.NPCDialog.PlayerChatted:InvokeServer(m, "ConfirmPurchase")
end

function finditem(o)
    for e, h in next, a.Stores:children() do
        if h.Name == "ShopItems" and h:FindFirstChild "Box" then
            for i, j in next, h:children() do

                if j.BoxItemName.Value == o then
                    for i, w in next, h:children() do

                        if w.BoxItemName.Value == "Bed1" or w.BoxItemName.Value == "Seat_Couch" then
                            ID = GetShopID.FurnitureStore
                            Cashier = game.Workspace.Stores.FurnitureStore.Corey.HumanoidRootPart.CFrame
                            Counter = game.Workspace.Stores.FurnitureStore.Counter.CFrame + Vector3.new(0, .4, 0)
                        elseif w.BoxItemName.Value == "Sawmill" or w.BoxItemName.Value == "Sawmill2" then
                            ID = GetShopID.WoodRus
                            Cashier = game.Workspace.Stores.WoodRUs.Thom.HumanoidRootPart.CFrame
                            Counter = game.Workspace.Stores.WoodRUs.Counter.CFrame + Vector3.new(0, .4, 0)
                        elseif w.BoxItemName.Value == "Trailer2" or w.BoxItemName.Value == "UtilityTruck2" then
                            ID = GetShopID.CarStore
                            Cashier = game.Workspace.Stores.CarStore.Jenny.HumanoidRootPart.CFrame
                            Counter = game.Workspace.Stores.CarStore.Counter.CFrame + Vector3.new(0, .4, 0)
                        elseif w.BoxItemName.Value == "CanOfWorms" or w.BoxItemName.Value == "Dynamite" then
                            ID = GetShopID.ShackShop
                            Cashier = game.Workspace.Stores.ShackShop.Bob.HumanoidRootPart.CFrame
                            Counter = game.Workspace.Stores.ShackShop.Counter.CFrame + Vector3.new(0, .4, 0)
                        elseif w.BoxItemName.Value == "Painting1" or w.BoxItemName.Value == "Painting2" then
                            ID = GetShopID.FineArt
                            Cashier = game.Workspace.Stores.FineArt.Timothy.HumanoidRootPart.CFrame
                            Counter = game.Workspace.Stores.FineArt.Counter.CFrame + Vector3.new(0, .4, 0)
                        elseif w.BoxItemName.Value == "GateXOR" or w.BoxItemName.Value == "NeonWireOrange" then
                            ID = GetShopID.LogicStore
                            Cashier = game.Workspace.Stores.LogicStore.Lincoln.HumanoidRootPart.CFrame
                            Counter = game.Workspace.Stores.LogicStore.Counter.CFrame + Vector3.new(0, .4, 0)

                        end
                    end
                    return {j, Cashier, ID, Counter}
                end
            end
        end
    end
end
function autobuyv2(o)

    local item = nil
    local ltem = nil

    item = finditem(o)

    if item == nil then
        notify("无言脚本", "没有找到商品或者没有刷新，请你等待", 4)
        repeat
            task.wait()
            item = finditem(o)
        until item ~= nil

    end

    ltem = item[1]

    Teleport(ltem.Main.CFrame)
    task.wait()

    game:GetService('RunService').Stepped:wait();
    for e = 1, 15 do
        game:GetService("ReplicatedStorage").Interaction.ClientIsDragging:FireServer(ltem)
        ltem:PivotTo(item[4])
        game:GetService("ReplicatedStorage").Interaction.ClientIsDragging:FireServer(ltem)
        game:GetService('RunService').Stepped:wait();
    end
    Teleport(item[4] + Vector3.new(5, 0, 5))

    repeat

        BuyItem(item[3])
        game:GetService('RunService').Stepped:wait()

    until tostring(ltem.Parent) ~= "ShopItems"

    return o
end

function autobuy(o, r)
    bai.autocsdx = game.Workspace.PlayerModels.ChildAdded:connect(function(v)
        v:WaitForChild('Owner', 60)
        if v.Owner.Value == lp then
            for i = 1, 20 do
                game:GetService("ReplicatedStorage").Interaction.ClientIsDragging:FireServer(v)
                v:PivotTo(bai.autobuyset)
                game:GetService("ReplicatedStorage").Interaction.ClientIsDragging:FireServer(v)
                game:GetService('RunService').Stepped:wait();
            end
        end
    end)
    for e = 1, r do
        if bai.autobuystop == false then
            autobuyv2(o)
            task.wait()
        end
    end
    spawn(function()
        wait(1)
        bai.autocsdx:Disconnect();
        bai.autocsdx = nil;
    end)
    return o, r
end

local cashierIds = {};
spawn(function()
    local connection = game.ReplicatedStorage.NPCDialog.PromptChat.OnClientEvent:connect(function(ba, data)
        if cashierIds[data.Name] == nil then
            cashierIds[data.Name] = data.ID;
        end
    end);
    game.ReplicatedStorage.NPCDialog.SetChattingValue:InvokeServer(1);
    wait(2)
    connection:Disconnect();
    connection = nil;
    game.ReplicatedStorage.NPCDialog.SetChattingValue:InvokeServer(0);
end);

local function getSpecialID(Shop)
    return cashierIds[Shop];
end

function shuaxinlb(zji)
    bai.dropdown = {}
    if zji == true then
        for p, I in next, game.Players:GetChildren() do
            table.insert(bai.dropdown, I.Name)
        end
    else
        for p, I in next, game.Players:GetChildren() do
            if I ~= lp then
                table.insert(bai.dropdown, I.Name)
            end
        end
    end
end
shuaxinlb(true)
local win1 = library:CreateTab("斧头＆土地");
win1:NewToggle("自动扔斧头", "id随便", false, function(state)
    bai.autodropae = true
    if state then

        while wait() do

            if bai.autodropae == true then
                local oldpos = lp.Character.HumanoidRootPart.CFrame
                droptool(oldpos)
            end
        end
    else
        bai.autodropae = false
    end
    print(state)
end)
win1:NewToggle("自动捡斧头", "id", false, function(state)
    print(bool)
    if state then
        bai.autopick = true
        while bai.autopick == true do

            task.wait(0.1)
            for a, b in pairs(workspace.PlayerModels:GetChildren()) do
                if b:FindFirstChild("Owner") and b.Owner.Value == game.Players.LocalPlayer then
                    if b:FindFirstChild("Type") and b.Type.Value == "Tool" then

                        game:GetService('ReplicatedStorage').Interaction.ClientInteracted:FireServer(b, 'Pick up tool')

                    end
                end

            end
        end
    else
        bai.autopick = false
    end
	end)
	win1:NewBox("复制斧头:死亡多久后加载存档", "请输入!", function(txt)
    bai.loaddupeaxewaittime = txt
end)
win1:NewButton("获取当前死亡时间", function()
    bailib:Notification("无言脚本", " 时间为" .. bai.loaddupeaxewaittime .. "秒", "好")
end)
win1:NewButton("加载复制斧头", function()
    CanClientLoad()
    wait(1)
    lp.Character.Head:Destroy()
    wait(bai.loaddupeaxewaittime)
    LoadSlot(GetLoadedSlot())
    wait(6)
    lp.Character.HumanoidRootPart.CFrame = oldpos
    print("btn3");
end)
win1:NewButton("远程装备斧头", function()
    farAxeEquip()
    print("btn3");
end)
win1:NewToggle("斧头炸家(电脑)", "i123", false, function(state)
    print(bool)
    if state then
        bai.whthmose = true
    else
        bai.whthmose = false
    end
	end)
win1:NewToggle("斧头炸家", "izane便", false, function(state)
    print(bool)
    if state then
        axefily()
    else
        if bai.axeFling then
            bai.axeFling:Disconnect(0.1);
            bai.axeFling = nil;
        end
    end
	end)
	win1:NewButton("土地区", function()
    print("btn3");
end)
win1:NewButton("点击获得土地", function()
    freeland=nil
    notify("无言脚本","请你点击一个空的土地",4)
    ClickToSelectClick = Mouse.Button1Up:Connect(function()
    Clicked = Mouse.Target
   
        if  tostring(Clicked.Parent.Name) == "Property" then
            local v =Clicked.Parent
        
            if v:FindFirstChild("Owner") and v.Owner.Value==nil then
                game.ReplicatedStorage.PropertyPurchasing.ClientPurchasedProperty:FireServer(v, v.OriginSquare.OriginCFrame.Value.p + Vector3.new(0, 3, 0))
                wait(0.5)
                freeland=true
                Instance.new('RemoteEvent', game:service 'ReplicatedStorage'.Interaction).Name = "Ban"
                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.OriginSquare.CFrame +Vector3.new(0, 10, 0)
            else
                notify("无言脚本","这个土地有主人了",4)
       end
    end
    end)
repeat
    task.wait()
until freeland~=nil
    ClickToSelectClick:Disconnect()
    ClickToSelectClick=nil
    print("btn3");
end)
win1:NewButton("免费获得土地", function()
    for a, b in pairs(workspace.Properties:GetChildren()) do
        if b:FindFirstChild("Owner") and b:FindFirstChild("OriginSquare") and b.Owner.Value == nil then
            game.ReplicatedStorage.PropertyPurchasing.ClientPurchasedProperty:FireServer(b, b.OriginSquare.OriginCFrame
                .Value.p + Vector3.new(0, 3, 0))
            wait(0.5)
            Instance.new('RemoteEvent', game:service 'ReplicatedStorage'.Interaction).Name = "Ban"
            for i, v in pairs(game.Workspace.Properties:GetChildren()) do
                if v.Owner.Value == game.Players.LocalPlayer then
                    game.Players.LocalPlayer.Character.Humanoid.Jump = true
                    wait(0.1)
                    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.OriginSquare.CFrame +
                                                                                     Vector3.new(0, 10, 0)
                    game.Players.LocalPlayer.Character.Humanoid.Jump = true
                    wait(0.1)
                end
            end
        end
    end
    print("btn3");
end)
win1:NewButton("最大土地", function()
    for i, v in pairs(game:GetService("Workspace").Properties:GetChildren()) do
        if v:FindFirstChild("Owner") and v.Owner.Value == game.Players.LocalPlayer then
            base = v
            square = v.OriginSquare
        end
    end
    function makebase(pos)
        local Event = game:GetService("ReplicatedStorage").PropertyPurchasing.ClientExpandedProperty
        Event:FireServer(base, pos)
    end
    spos = square.Position
    makebase(CFrame.new(spos.X + 40, spos.Y, spos.Z))
    makebase(CFrame.new(spos.X - 40, spos.Y, spos.Z))
    makebase(CFrame.new(spos.X, spos.Y, spos.Z + 40))
    makebase(CFrame.new(spos.X, spos.Y, spos.Z - 40))
    makebase(CFrame.new(spos.X + 40, spos.Y, spos.Z + 40))
    makebase(CFrame.new(spos.X + 40, spos.Y, spos.Z - 40))
    makebase(CFrame.new(spos.X - 40, spos.Y, spos.Z + 40))
    makebase(CFrame.new(spos.X - 40, spos.Y, spos.Z - 40))
    makebase(CFrame.new(spos.X + 80, spos.Y, spos.Z))
    makebase(CFrame.new(spos.X - 80, spos.Y, spos.Z))
    makebase(CFrame.new(spos.X, spos.Y, spos.Z + 80))
    makebase(CFrame.new(spos.X, spos.Y, spos.Z - 80))
    -- Corners--
    makebase(CFrame.new(spos.X + 80, spos.Y, spos.Z + 80))
    makebase(CFrame.new(spos.X + 80, spos.Y, spos.Z - 80))
    makebase(CFrame.new(spos.X - 80, spos.Y, spos.Z + 80))
    makebase(CFrame.new(spos.X - 80, spos.Y, spos.Z - 80))
    -- Corners--
    makebase(CFrame.new(spos.X + 40, spos.Y, spos.Z + 80))
    makebase(CFrame.new(spos.X - 40, spos.Y, spos.Z + 80))
    makebase(CFrame.new(spos.X + 80, spos.Y, spos.Z + 40))
    makebase(CFrame.new(spos.X + 80, spos.Y, spos.Z - 40))
    makebase(CFrame.new(spos.X - 80, spos.Y, spos.Z + 40))
    makebase(CFrame.new(spos.X - 80, spos.Y, spos.Z - 40))
    makebase(CFrame.new(spos.X + 40, spos.Y, spos.Z - 80))
    makebase(CFrame.new(spos.X - 40, spos.Y, spos.Z - 80))

    print("btn3");
end)

local win2 = library:CreateTab("存档＆木头");
win2:NewBox("选择存档", "请输入!", function(s)
    bai.soltnumber = s
    print(text);
end)
win2:NewButton("加载存档", function()
    ScriptLoadOrSave = true
    local CheckSlot = CheckSlotNumber()
    if CheckSlot ~= false then
        if CheckIfSlotAvailable(CheckSlot) == true then
            local LoadSlot = game.ReplicatedStorage.LoadSaveRequests.RequestLoad:InvokeServer(CheckSlot)
            if LoadSlot == false then
                notify("无言脚本", "有冷却现在不能加载!", 1)
            end
            if LoadSlot == true then
                notify("无言脚本", "已加载!", 2)
                CurrentSlot = CheckSlot
            end
        else
            notify("无言脚本", "貌似不工作了", 2)
        end
    else
        notify("无言脚本", "请你填数字☹️", 2)
    end
    ScriptLoadOrSave = false
    print("btn3");
end)
win2:NewButton("一键复制存档", function()
DupeSlot=tonumber(bai.soltnumber)
    local ItemAdded, ItemAdded = game:GetService("Workspace").PlayerModels.ChildAdded:Connect(function(v)
        if v:WaitForChild("Owner") and v.Owner.Value == game.Players.LocalPlayer then
            game:GetService('RunService').Stepped:wait();
            game:Shutdown()
        end
    end)

    game:GetService("ReplicatedStorage").LoadSaveRequests.RequestLoad:InvokeServer(DupeSlot, game.Players.LocalPlayer)
end)
win2:NewButton("传送木板", function()
    local logFolder = getPlanks();
    local oldPos = game:GetService('Players').LocalPlayer.Character.HumanoidRootPart.CFrame;
    for _, log in next, logFolder do
        if log:FindFirstChild('WoodSection') then

            spawn(function()
                for i = 1, 20 do

                    game:GetService('ReplicatedStorage').Interaction.ClientIsDragging:FireServer(log);
                    task.wait();
                end
            end)
            wait(0.18)
            if not log.PrimaryPart then
                log.PrimaryPart = log.WoodSection;
            end
            log:SetPrimaryPartCFrame(oldPos);
        end
    end
    print("btn3");
end)
win2:NewButton("传送木头", function()
    OldPos = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
    for i, v in next, game:GetService("Workspace").LogModels:GetChildren() do
        if v:FindFirstChild("Owner") and v.Owner.Value == game.Players.LocalPlayer then
            if not v.PrimaryPart then
                v.PrimaryPart = v:FindFirstChild("WoodSection")
            end
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(
                v:FindFirstChild("WoodSection").CFrame.p)
            spawn(function()
                for i = 1, 50 do
                    game.ReplicatedStorage.Interaction.ClientIsDragging:FireServer(v)
                    task.wait()
                end
            end)
            for i = 1, 50 do
                task.wait()
                v:PivotTo(OldPos)
            end
            task.wait()
        end
    end
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = OldPos
    print("btn3");
end)
win2:NewButton("卖木板", function()
    for _, Plank in pairs(game.Workspace.PlayerModels:GetChildren()) do
        if Plank.Name == "Plank" and Plank:findFirstChild("Owner") then
            if Plank.Owner.Value == game.Players.LocalPlayer then
                for i, v in pairs(Plank:GetChildren()) do
                    if v.Name == "WoodSection" then
                        spawn(function()
                            for i = 1, 100 do
                                wait()
                                v.CFrame = CFrame.new(Vector3.new(315, -0.296, 85.791)) *
                                               CFrame.Angles(math.rad(90), 0, 0)
                            end
                        end)
                    end
                end
                spawn(function()
                    for i = 1, 100 do
                        wait()
                        game.ReplicatedStorage.Interaction.ClientIsDragging:FireServer(Plank)
                    end
                end)
            end
        end
    end
    print("btn3");
end)
win2:NewButton("卖木头", function()
    sellwood()
    print("btn3");
end)
win2:NewToggle("自动卖木板", "id傻逼", false, function(state)
    print(bool)
    if win2.Text == "关1" then
        win2.Text = "开1"
    else
        win2.Text = "关1"
    end

    if state then
        while wait() do

            if win2.Text == "关1" then
                for _, Plank in pairs(game.Workspace.PlayerModels:GetChildren()) do
                    if Plank.Name == "Plank" and Plank:findFirstChild("Owner") then
                        if Plank.Owner.Value == game.Players.LocalPlayer then
                            for i, v in pairs(Plank:GetChildren()) do
                                if v.Name == "WoodSection" then
                                    spawn(function()
                                        for i = 1, 10 do
                                            wait()
                                            v.CFrame = CFrame.new(Vector3.new(315, -0.296, 85.791)) *
                                                           CFrame.Angles(math.rad(90), 0, 0)
                                        end
                                    end)
                                end
                            end
                            spawn(function()
                                for i = 1, 20 do
                                    wait()
                                    game.ReplicatedStorage.Interaction.ClientIsDragging:FireServer(Plank)
                                end
                            end)
                        end

                    end
                end
            end
        end
    end
	end)
	win2:NewToggle("自动卖木头", "id114514", false, function(state)
	    if win2.Text == "关" then
        win2.Text = "开"
    else
        win2.Text = "关"
    end

    local oldpos = lp.Character.HumanoidRootPart.CFrame
    while wait() do
        if state then
            if win2.Text == "关" then
                sellwood()
            end
        end
    end
    print(bool)

	end)
	win1:NewToggle("拖拽器", "134567", false, function(state)
    if state then
        workspace.ChildAdded:connect(function(Dragger)
            if tostring(Dragger) == 'Dragger' then
                local BodyGyro = Dragger:WaitForChild 'BodyGyro';
                local BodyPosition = Dragger:WaitForChild 'BodyPosition';
                repeat
                    game:GetService 'RunService'.Stepped:wait()
                until workspace:FindFirstChild 'Dragger';

                BodyPosition.P = 120000;
                BodyPosition.D = 1000;
                BodyPosition.maxForce = Vector3.new(1, 1, 1) * 1000000;
                BodyGyro.maxTorque = Vector3.new(1, 1, 1) * 200;
                BodyGyro.P = 1200;
                BodyGyro.D = 140;

            end
        end)
    else

        workspace.ChildAdded:connect(function(Dragger)
            if tostring(Dragger) == 'Dragger' then
                local BodyGyro = Dragger:WaitForChild 'BodyGyro';
                local BodyPosition = Dragger:WaitForChild 'BodyPosition';
                repeat
                    game:GetService 'RunService'.Stepped:wait()
                until workspace:FindFirstChild 'Dragger';

                BodyPosition.P = 10000;
                BodyPosition.D = 800;
                BodyPosition.maxForce = Vector3.new(17000, 17000, 17000);
                BodyGyro.maxTorque = Vector3.new(200, 200, 200);
                BodyGyro.P = 1200;
                BodyGyro.D = 140;
            end
        end)

    end
    print(bool)

	end)
local win3 = library:CreateTab("处理木头＆带来树");
win3:NewButton("半自动处理树1", function()
    wait(0.5)
    local oldPosition = getPosition()
    local oldpos = lp.Character.HumanoidRootPart.CFrame
    local wood
    local sell = CFrame.new(314.943634, -6, 82.8602905, -0.999041438, -0.00970918871, 0.0426843949, -0.00323261251,
        0.988793433, 0.149255186, -0.0436551981, 0.148974136, -0.987876952)

    notify("半自动加工", "请点击一颗树", 4)

    local ModTree = Mouse.Button1Up:Connect(function()
        local obj = Mouse.Target.Parent
        if not obj:FindFirstChild "RootCut" and obj.Parent.Name == "TreeRegion" then
            return notify("错误!", "这棵树还没有砍!", 3)
        end
        if obj:FindFirstChild "Owner" and obj.Owner.Value == lp and obj:FindFirstChild "WoodSection" then
            wood = obj
            notify("半自动加工", "已选择树!", 3)
        end

    end)
    repeat
        task.wait(.01)
    until wood ~= nil
    ModTree:Disconnect()
    ModTree = nil

    tp(wood.WoodSection.CFrame)
    spawn(function()
        for i = 1, 20 do

            wood:PivotTo(sell)
            game.ReplicatedStorage.Interaction.ClientIsDragging:FireServer(wood)
            game:GetService('RunService').Stepped:wait();

        end
    end)
    task.wait(0.1)
    tp(wood.WoodSection.CFrame)
    task.wait(1.2)

    for i = 1, 20 do
        game.ReplicatedStorage.Interaction.ClientIsDragging:FireServer(wood)
        wood:MoveTo(oldPosition)
        game:GetService('RunService').Stepped:wait();

    end
    tp(oldpos)
    print("btn3");
end)
win3:NewButton("半自动处理树2", function()
    local oldpos = lp.Character.HumanoidRootPart.CFrame
    bai.modwood = true

    for _, Log in pairs(workspace.LogModels:GetChildren()) do
        if Log.Name:sub(1, 6) == "Loose_" and Log:findFirstChild("Owner") then
            if Log.Owner.Value == game.Players.LocalPlayer then
                for i, v in pairs(Log:GetChildren()) do
                    if v.Name == "WoodSection" then
                        if bai.modwood == true then
                            tp(v.CFrame)
                        end
                        wait(0.2)

                        spawn(function()
                            for i = 1, 20 do
                                if bai.modwood == true then
                                    task.wait()
                                    v.CFrame = CFrame.new(330.98587, -0.574430406, 79.0872726, -6, 0.000781620154,
                                        -0.0201439466, 0.000569172669, 0.99994421, 0.0105500417, 0.0201510694,
                                        0.0105364323, -0.999741435)
                                    game.ReplicatedStorage.Interaction.ClientIsDragging:FireServer(Log)
                                end
                            end

                            wait(1)

                            for i = 1, 10 do
                                task.wait()
                                v.CFrame = oldpos
                                game.ReplicatedStorage.Interaction.ClientIsDragging:FireServer(Log)
                            end
                            bai.modwood = false
                        end)

                    end
                end

            end
        end
    end
    tp(oldpos)
    print("btn3");
end)
local this_table = {
"普通树",
"幻影木",
"沼泽黄金",
"樱花",
"蓝木",
"冰木",
"火山木",
"橡木",
"巧克力木",
"白桦木",
"黄金木",
"雪地松",
"僵尸木",
"大巧克力树",
"椰子树",
"南瓜木",
"幽灵木",
}
win3:NewDropdown("选择树", "这个有用", this_table, function(b)
        if b == '普通树' then
            bai.cuttreeselect = "Generic"
        elseif b == '沼泽黄金' then
            bai.cuttreeselect = "GoldSwampy"
        elseif b == '樱花' then
            bai.cuttreeselect = "Cherry"
        elseif b == '蓝木' then
            bai.cuttreeselect = "CaveCrawler"
        elseif b == '冰木' then
            bai.cuttreeselect = "Frost"
        elseif b == '火山木' then
            bai.cuttreeselect = "Volcano"
        elseif b == '橡木' then
            bai.cuttreeselect = "Oak"
        elseif b == '巧克力木' then
            bai.cuttreeselect = "Walnut"
        elseif b == '白桦木' then
            bai.cuttreeselect = "Birch"
        elseif b == '黄金木' then
            bai.cuttreeselect = "SnowGlow"
        elseif b == '雪地松' then
            bai.cuttreeselect = "Pine"
        elseif b == '僵尸木' then
            bai.cuttreeselect = "GreenSwampy"
        elseif b == '大巧克力树' then
            bai.cuttreeselect = "Koa"
        elseif b == '椰子树' then
            bai.cuttreeselect = "Palm"
        elseif b == '幽灵木' then
            bai.cuttreeselect = "Spooky"
        elseif b == '南瓜木' then
            bai.cuttreeselect = "SpookyNeon"
        elseif b == '幻影木' then
            bai.cuttreeselect = "LoneCave"
        end
	print(item);
end)
win3:NewBox("带来树的数量", "请输入!", function(txt)
    bai.bringamount = txt
    print(text);
end)
win3:NewButton("带来树", function()
    bai.bringtree = true
    bai.treecutset = lp.Character.HumanoidRootPart.CFrame
    task.wait(0.2)
    for i = 1, bai.bringamount do
        if bai.bringtree == true then
            task.wait()
            bringTree(bai.cuttreeselect)
        end

    end
    task.wait()

    print("btn3");
end)
win3:NewButton("停止带来树", function()
    bai.bringtree = false
    print("btn3");
end)
win3:NewToggle("自动砍树", "1145146随便", false, function(state)
    if state then
        bai.autofarm = true
        task.spawn(function()
            while task.wait(0.3) do

                if bai.autofarm == true then

                    bringTree(bai.cuttreeselect)

                end
            end
        end)
    else
        bai.autofarm = false

    end
    print(bool)

	end)
	win1:NewToggle("自动赚钱", "id随便", false, function(state)
	  local oldpos = lp.Character.HumanoidRootPart.CFrame

    if state then
        bai.autofarm1 = true
        local function callback(Text)
            if Text == "确定" then
                pcall(function()

                    while task.wait() do
                        if bai.autofarm1 == true then
                            game:GetService("Players").LocalPlayer.Character:MoveTo(Vector3.new(315, -0.296, 102.791));

                            autofarm(bai.cuttreeselect)

                            wait(1)
                            game:GetService("Players").LocalPlayer.Character:MoveTo(Vector3.new(315, -0.296, 102.791));

                            wait(20)
                        end
                    end
                end)

            elseif Text == "取消" then

            end
        end

        local NotificationBindable = Instance.new("BindableFunction")
        NotificationBindable.OnInvoke = callback
        --
        game.StarterGui:SetCore("SendNotification", {
            Title = "无言脚本",
            Text = "使用此功能前请你打开自动卖木头",
            Icon = "",
            Duration = 6,
            Button1 = "确定",
            Button2 = "取消",
            Callback = NotificationBindable
        })
    else
        bai.autofarm1 = false
        for i, v in pairs(game.Workspace.Properties:GetChildren()) do
            if v.Owner.Value == game.Players.LocalPlayer then
                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.OriginSquare.CFrame +
                                                                                 Vector3.new(0, 10, 0)
            end
        end
    end
    print(bool)

	end)
	win3:NewButton("用木板填充蓝图", function()
	    PlankToBlueprint()
    print("btn3");
end)

win3:NewToggle("查看幻影木", "id9999", false, function(state)
    print(bool)
    if state then

        for i, v in pairs(game.workspace:GetChildren()) do
            if v.Name == "TreeRegion" and v:FindFirstChildOfClass("Model") then
                if v.Model.TreeClass.Value == "LoneCave" then
                    workspace.Camera.CameraSubject = v.Model.WoodSection
                    task.wait()
                end
            end
        end

    else
        workspace.Camera.CameraSubject = game.Players.LocalPlayer.Character

    end
	end)
	win3:NewButton("锯木机最大体型", function()
	    local connection, sawmillModel;
    notify('无言脚本', '选择一个剧木机', 4)
    connection = mouse.Button1Down:Connect(function(b)
        local target = mouse.Target;
        if target then
            sawmill = target.Parent;
            if sawmill.Name:find('Sawmill') then
                sawmillModel = sawmill;
                notify('无言脚本', '剧木机已选择', 4)
            elseif sawmill.Parent.Name:find('Sawmill') or sawmill.Parent:FindFirstChild 'BlockageAlert' then
                sawmillModel = sawmill.Parent
                notify('无言脚本', '剧木机已选择', 4)
            end
        end
    end);
    repeat
        wait()
    until sawmillModel ~= nil;
    if connection then
        connection:Disconnect();
        connection = nil;
    end
    spawn(function()
        for i = 1, 50 do
            game:GetService('ReplicatedStorage').Interaction.RemoteProxy:FireServer(
                sawmillModel:FindFirstChild 'ButtonRemote_XUp');
            task.wait(0.5)
            game:GetService('ReplicatedStorage').Interaction.RemoteProxy:FireServer(
                sawmillModel:FindFirstChild 'ButtonRemote_YUp');

        end
    end);
    print("btn3");
end)
win3:NewToggle("把木头切割成一个单位长度", "id0000", false, function(state)
     local oldpos = lp.Character.HumanoidRootPart.CFrame

    if state then
        PlankReAdded = game:GetService("Workspace").PlayerModels.ChildAdded:Connect(function(v)
            if v:WaitForChild("TreeClass") and v:WaitForChild("WoodSection") then
                SelTree = v
                task.wait()
            end
        end)
        UnitCutterClick = Mouse.Button1Up:Connect(function()
            Clicked = Mouse.Target

            if Clicked.Name == "WoodSection" then
                SelTree = Clicked.Parent
                game.Players.LocalPlayer.Character:MoveTo(Clicked.Position + Vector3.new(0, 3, -3))
                local success, data = getBestAxe(SelTree.TreeClass.Value)
                repeat
                    if state == false then
                        break
                    end
                    cutPart(SelTree.CutEvent, 1, 1, data, SelTree.TreeClass.Value)
                    if SelTree:FindFirstChild("Cut") then
                        game.Players.LocalPlayer.Character:MoveTo(
                            SelTree:FindFirstChild("Cut").Position + Vector3.new(0, 3, -3))
                    end
                    task.wait()
                until SelTree.WoodSection.Size.X <= 1.88 and SelTree.WoodSection.Size.Y <= 1.88 and
                    SelTree.WoodSection.Size.Z <= 1.88 or state == false
            end
        end)

    else
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = oldpos
        UnitCutterClick:Disconnect()
        UnitCutterClick = nil
        PlankReAdded:Disconnect()
        PlankReAdded = nil
    end
       print(bool)

	end)
	win3:NewButton("分解树", function()
	    OldPos = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
    local LogChopped = false
    branchadded = game:GetService("Workspace").LogModels.ChildAdded:Connect(function(v)
        if v:WaitForChild("Owner") and v.Owner.Value == game.Players.LocalPlayer then
            if v:WaitForChild("WoodSection") then
                LogChopped = true
            end
        end
    end)
    notify("无言脚本", "请你点击一棵树", 4)

    DismemberTreeC = Mouse.Button1Up:Connect(function()
        Clicked = Mouse.Target
        if Clicked.Parent:FindFirstAncestor("LogModels") then
            if Clicked.Parent:FindFirstChild("Owner") and Clicked.Parent.Owner.Value == game.Players.LocalPlayer then
                TreeToJointCut = Clicked.Parent
            end
        end
    end)
    repeat
        task.wait()
    until tostring(TreeToJointCut) ~= "nil"

    for i, v in next, TreeToJointCut:GetChildren() do
        if v.Name == "WoodSection" then
            if v:FindFirstChild("ID") and v.ID.Value ~= 1 then
                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(v.CFrame.p)
                local success, data = getBestAxe(v.Parent:FindFirstChild("TreeClass").Value)
                repeat
                    cutPart(v.Parent:FindFirstChild("CutEvent"), v.ID.Value, 0.2, data,
                        v.Parent:FindFirstChild("TreeClass").Value)
                    task.wait()
                until LogChopped == true
                LogChopped = false
                task.wait(1)
            end
        end
    end
    TreeToJointCut = nil
    branchadded:Disconnect()
    DismemberTreeC:Disconnect()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = OldPos
    print("btn3");
end)
win3:NewButton("处理树(自动)", function()
    local wood
    local Saw
    local sell = CFrame.new(315, -4, 84)
    notify("一键加工", "请点击一颗树,再点击一个锯木机", 4)
    wait(0.5)
    local oldPosition = getPosition()
    local oldpos = lp.Character.HumanoidRootPart.CFrame
    local ModTree = Mouse.Button1Up:Connect(function()
        local obj = Mouse.Target.Parent
        if not obj:FindFirstChild "RootCut" and obj.Parent.Name == "TreeRegion" then
            return notify("错误!", "这棵树还没有砍!", 3)
        end
        if obj:FindFirstChild "Owner" and obj.Owner.Value == lp and obj:FindFirstChild "WoodSection" then
            wood = obj
            notify("一键加工", "已选择树!", 3)
        end

        if obj.Name:find('Sawmill') then
            Saw = sawmill;
            notify('无言脚本', '剧木机已选择', 4)
        elseif obj.Parent.Name:find('Sawmill') or obj.Parent:FindFirstChild 'BlockageAlert' then
            Saw = obj.Parent
            notify('无言脚本', '剧木机已选择', 4)
        end

    end)
    repeat
        task.wait(.01)
    until wood and Saw ~= nil
    ModTree:Disconnect()
    ModTree = nil
    local SawC = Saw.Particles.CFrame + Vector3.new(0.7, 0)
    tp(wood.WoodSection.CFrame)
    spawn(function()
        for i = 1, 20 do

            wood:SetPrimaryPartCFrame(sell)
            game.ReplicatedStorage.Interaction.ClientIsDragging:FireServer(wood)
            game:GetService('RunService').Stepped:wait();

        end
    end)
    task.wait(0.3)
    tp(wood.WoodSection.CFrame)
    task.wait(1)
    for i = 1, 20 do
        game.ReplicatedStorage.Interaction.ClientIsDragging:FireServer(wood)
        wood:MoveTo(oldPosition)
        game:GetService('RunService').Stepped:wait();

    end
    tp(oldpos)
    pcall(function()
        spawn(function()
            for i = 1, 200 do
                game.ReplicatedStorage.Interaction.ClientIsDragging:FireServer(wood)
                game.ReplicatedStorage.Interaction.ClientIsDragging:FireServer(wood)

                wood:SetPrimaryPartCFrame(SawC)
                game.ReplicatedStorage.Interaction.ClientIsDragging:FireServer(wood)

                task.wait()

            end
        end)
    end)

    Teleport(oldpos)
    print("btn3");
end)
win3:NewButton("删除树/木板", function()
    local a = game:GetService("ReplicatedStorage")
    local b = game:GetService("Players").LocalPlayer
    local c = b:GetMouse()
    local f = Instance.new("Tool", b.Backpack)
    f.Name = "点击你要删除的树或木板"
    f.RequiresHandle = false
    f.Activated:Connect(function()
        local g = c.Target.Parent
        local h = b.Character.HumanoidRootPart.CFrame
        if not g:FindFirstChild "WoodSection" then
            return
        end
        local i
        if g:FindFirstChild "Owner" and g.Owner.Value == b or g.Owner.Value == nil then
            if not g:FindFirstChild "RootCut" and g.Parent.Name == "TreeRegion" then
                for e, j in next, g:children() do
                    if j.Name == "WoodSection" and j:FindFirstChild "ID" and j:FindFirstChild "ID".Value == tonumber(1) then
                        i = j
                    end
                end
            else
                i = g.WoodSection
            end
            tp(i.CFrame)
            for e = 1, 3 do
                spawn(function()
                    for e = 1, 20 do

                        a.Interaction.ClientIsDragging:FireServer(g)
                        a.Interaction.DestroyStructure:FireServer(g)
                        game:GetService('RunService').Stepped:wait();

                    end
                end)
                task.wait(.1)
            end
        else
            return
        end
        task.wait()
        tp(h)
    end)
    f.Parent = game.Players.LocalPlayer.Backpack
    print("btn3");
end)
local win4 = library:CreateTab("娱乐＆环境");
win4:NewBox("你要说的话", "请输入!", function(txt)
    bai.saymege = txt
    print(text);
end)
win4:NewBox("说话次数", "请输入!", function(txt)
    bai.saymount = txt
    print(text);
end)
win4:NewButton("开始说话", function()
    bai.sayfast = true
    for i = 1, bai.saymount do
        if bai.sayfast == true then
            game:GetService('ReplicatedStorage').DefaultChatSystemChatEvents.SayMessageRequest:FireServer(bai.saymege,
                'All')
        end
    end
    print("btn3");
end)
win4:NewButton("停止说话", function()
    bai.sayfast = false
    print("btn3");
end)
win4:NewToggle("全自动说话", "id19784", false, function(state)
    if state then
        bai.autosay = true
        while task.wait() do
            if bai.autosay == true then
                game:GetService('ReplicatedStorage').DefaultChatSystemChatEvents.SayMessageRequest:FireServer(
                    bai.saymege, 'All')

            end
        end
    else
        bai.autosay = false
    end
    print(bool)

	end)
	win4:NewDropdown("选择玩家", "用", bai.dropdown, function(v)
	    bai.moneytoplayername = v
	print(item);
end)
win4:NewButton("刷新列表", function()
    shuaxinlb(true)
    dropdown:SetOptions(bai.dropdown)
    print("btn3");
end)
win4:NewBox("给玩家转钱的数量", "请输入!", function(txt)
    bai.moneyaoumt = txt
    print(text);
end)
win4:NewButton("开始转钱", function()
    donate(bai.moneytoplayername, bai.moneyaoumt)
    print("btn3");
end)
win4:NewButton("小工具", function()
    if lp.Backpack:FindFirstChildOfClass 'HopperBin' then
        return
    end
    for index = 1, 4 do
        Instance.new('HopperBin', lp.Backpack).BinType = index
    end
    print("btn3");
end)
win4:NewToggle("远程打开东西", "77646便", false, function(state)
    if state then
        notify('无言脚本', '选择一个东西去打开', 4)
        bai.openItem = mouse.Button1Down:Connect(function()
            if mouse.Target then
                bai.itemtoopen = mouse.Target;
            end
            OpenSelectedItem(bai.itemtoopen.Parent);
        end)
    else
        if bai.openItem then
            bai.openItem:Disconnect();
            bai.openItem = nil;
        end
        notify('无言脚本', '打开东西已关闭', 4)
        bai.itemToOpen = nil;
    end
    print(bool)

	end)
	win4:NewToggle("终日白天", "idzjsisjjs", false, function(state)
    print(bool)
    if state then
        bai.awaysday = true
        while task.wait() do
            if bai.awaysday == true then
                game:GetService('Lighting').TimeOfDay = ('12:00:00');
            end
        end
    else
        bai.awaysday = false
    end
	end)
	win4:NewToggle("终日黑天", "idkiskajaka", false, function(state)
	    if state then
        bai.awaysdnight = true
        while task.wait() do
            if bai.awaysdnight == true then
                game:GetService('Lighting').TimeOfDay = ('2:00:00');
            end
        end
    else
        bai.awaysdnight = false
    end
    print(bool)

	end)
	game:GetService("Lighting").GlobalShadows = true
	win4:NewToggle("消除阴影", "idqoejsh", false, function(state)
    print(bool)
    if state then
        game:GetService("Lighting").GlobalShadows = false
    else
        game:GetService("Lighting").GlobalShadows = true
    end
	end)
		win4:NewButton("圣诞节地图", function()
		    for i, v in pairs(game:GetService("Workspace"):GetDescendants()) do
        if v.Name == "Ground" then
            v.BrickColor = BrickColor.new("White")
            v.Material = "Sand"
        end
        if v.Name == "Slate" then
            v.BrickColor = BrickColor.new("White")
        end
        if v.Name == "LeafPart" then
            v.BrickColor = BrickColor.new("White")
            v.Material = "Sand"
        end
        if v.Name == "Sand" then
            v.BrickColor = BrickColor.new("White")
        end
    end
    print("btn3");
end)	win4:NewButton("秋天地图", function()
    for i, v in pairs(game:GetService("Workspace"):GetDescendants()) do
        if v.Name == "Ground" then
            v.BrickColor = BrickColor.new("Burnt Sienna")
            v.Material = "Sand"
        end
        if v.Name == "Slate" then
            v.BrickColor = BrickColor.new("Burnt Sienna")
        end
        if v.Name == "LeafPart" then
            v.BrickColor = BrickColor.new("Burnt Sienna")
            v.Material = "Sand"
        end
    end

    print("btn3");
end)	win4:NewButton("万圣节地图", function()
    loadstring(game:HttpGet 'https://raw.githubusercontent.com/silentben8x/Silent/main/Halloween')()

    print("btn3");
end)	win4:NewButton("糖果地图", function()
    loadstring(
        game:HttpGet 'https://raw.githubusercontent.com/silentben9x/silentwinningmain/main/Willy%20Wonker%20Map%20Theme')()

    print("btn3");
end)
	game:GetService("Lighting").GlobalShadows = true
	win4:NewToggle("消除阴影", "idqwwieoosnan", false, function(state)
	    if state then
        game:GetService("Lighting").GlobalShadows = false
    else
        game:GetService("Lighting").GlobalShadows = true
    end
    print(bool)

	end)
	win4:NewButton("删除灵视神殿的石头", function()
     workspace.Region_Mountainside.BoulderRegen.Boulder:Destroy()
    workspace.Region_Mountainside.Door.Door:Destroy()

       print("btn3");
end)
win4:NewToggle("删除岩浆", "id11451496", false, function(state)
    for i, v in pairs(game.Workspace.Region_Volcano:GetDescendants()) do
        if v.Name == "TouchInterest" then
            v:Destroy()
        elseif v.Name == "Lava" then
            for n, k in pairs(v:GetChildren()) do
                if k:IsA("Part") then
                    if state == true then
                        k.Transparency = 1
                    else
                        k.Transparency = 0
                    end
                end
            end
        end
    end
    print(bool)

	end)
	win4:NewToggle("水上行走", "id9876125", false, function(state)
	    for i, v in next, game.workspace.Water:children() do
        if v.ClassName == 'Part' then
            bai.waterwalk, v.CanCollide = state, state;
        end
    end
    for i, v in next, game:GetService('Workspace').Bridge.VerticalLiftBridge.WaterModel:children() do
        if v:IsA('BasePart') then
            v.CanCollide = state;
        end
    end
    print(bool)

	end)
	win4:NewToggle("删除水", "id64518679", false, function(state)
	    for _, v in pairs(game.Workspace.Water:GetChildren()) do
        if v.Name == "Water" then
            if state then
                v.Transparency = 1;
            else
                v.Transparency = 0;
            end
        end
    end
    print(bool)

	end)
	win4:NewToggle("去除雾气", "6461933736随便", false, function(state)
	    if state then
        bai.nofog = true
        while task.wait() do
            if bai.nofog == true then
                game:GetService('Lighting').FogEnd = 1000000;
            end
        end
    else
        bai.nofog = false
    end
    print(bool)

	end)
	win4:NewButton("获得小绿盒", function()
	    local greenBox = game:GetService('Workspace')['Region_Volcano'].VolcanoWin;
    firetouchinterest(greenBox, lp.Character.HumanoidRootPart, 0)
    firetouchinterest(greenBox, lp.Character.HumanoidRootPart, 1)
    print("btn3");
end)
	win4:NewButton("上火山捷径", function()
    local Model = Instance.new("Model", game:GetService("Workspace"))
    Model.Name = "Lumber"

    local Part1 = Instance.new("Part", Model)
    Part1.Name = "Bridge"
    Part1.Reflectance = 0
    Part1.Transparency = 0
    Part1.Anchored = true
    Part1.Archivable = true
    Part1.CanCollide = true
    Part1.Locked = false
    Part1.BrickColor = BrickColor.new("Medium green")
    Part1.Material = Enum.Material.Fabric
    Part1.Position = Vector3.new(4380.8090820313, -11.749999046326, -101.56007385254)
    Part1.Size = Vector3.new(254.85998535156, 0.10000000149012, 1012.0200805664)
    Part1.Rotation = Vector3.new(0, 0, 0)

    local Part2 = Instance.new("Part", Model)
    Part2.Name = "Part"
    Part2.Reflectance = 0
    Part2.Transparency = 0
    Part2.Anchored = true
    Part2.Archivable = true
    Part2.CanCollide = true
    Part2.Locked = false
    Part2.BrickColor = BrickColor.new("Medium green")
    Part2.Material = Enum.Material.Fabric
    Part2.Position = Vector3.new(-1498.7203369141, 628.11077880859, 1146.8332519531)
    Part2.Size = Vector3.new(54.889999389648, 0.38999998569489, 46.719993591309)
    Part2.Rotation = Vector3.new(0, 30, 0)

    local Part3 = Instance.new("Part", Model)
    Part3.Name = "RoadVol"
    Part3.Reflectance = 0
    Part3.Transparency = 0
    Part3.Anchored = true
    Part3.Archivable = true
    Part3.CanCollide = true
    Part3.Locked = false
    Part3.BrickColor = BrickColor.new("Medium green")
    Part3.Material = Enum.Material.Fabric
    Part3.Position = Vector3.new(-604.03656005859, 301.07205200195, 637.69116210938)
    Part3.Size = Vector3.new(40, 0.20000000298023, 2030.8299560547)
    Part3.Rotation = Vector3.new(147.75, 55.680000305176, -152.4700012207)

    local WedgePart8 = Instance.new("WedgePart", Model)
    WedgePart8.Name = "UP"
    WedgePart8.Reflectance = 0
    WedgePart8.Transparency = 0
    WedgePart8.Anchored = true
    WedgePart8.Archivable = true
    WedgePart8.CanCollide = true
    WedgePart8.Locked = false
    WedgePart8.BrickColor = BrickColor.new("Beige")
    WedgePart8.Material = Enum.Material.Fabric
    WedgePart8.Position = Vector3.new(341.31372070313, -5.8850064277649, -772.25903320313)
    WedgePart8.Size = Vector3.new(65.220001220703, 11.829997062683, 159.52000427246)
    WedgePart8.Rotation = Vector3.new(0, -21.549999237061, 0)

    local WedgePart9 = Instance.new("WedgePart", Model)
    WedgePart9.Name = "UP2"
    WedgePart9.Reflectance = 0
    WedgePart9.Transparency = 0
    WedgePart9.Anchored = true
    WedgePart9.Archivable = true
    WedgePart9.CanCollide = true
    WedgePart9.Locked = false
    WedgePart9.BrickColor = BrickColor.new("Beige")
    WedgePart9.Material = Enum.Material.Fabric
    WedgePart9.Position = Vector3.new(384.87704467773, -5.8850121498108, -1050.4354248047)
    WedgePart9.Size = Vector3.new(65.220001220703, 11.829997062683, 155.8099822998)
    WedgePart9.Rotation = Vector3.new(180, -25.35000038147, 180)

    local WedgePart10 = Instance.new("WedgePart", Model)
    WedgePart10.Name = "Vol1"
    WedgePart10.Reflectance = 0
    WedgePart10.Transparency = 0
    WedgePart10.Anchored = true
    WedgePart10.Archivable = true
    WedgePart10.CanCollide = true
    WedgePart10.Locked = false
    WedgePart10.BrickColor = BrickColor.new("Medium green")
    WedgePart10.Material = Enum.Material.Fabric
    WedgePart10.Position = Vector3.new(-1133.5314941406, 499.67663574219, 943.49224853516)
    WedgePart10.Size = Vector3.new(39.729999542236, 10.650003433228, 823.29010009766)
    WedgePart10.Rotation = Vector3.new(-32.25, -55.680000305176, -27.529998779297)

    local WedgePart11 = Instance.new("WedgePart", Model)
    WedgePart11.Name = "Vol2"
    WedgePart11.Reflectance = 0
    WedgePart11.Transparency = 0
    WedgePart11.Anchored = true
    WedgePart11.Archivable = true
    WedgePart11.CanCollide = true
    WedgePart11.Locked = false
    WedgePart11.BrickColor = BrickColor.new("Medium green")
    WedgePart11.Material = Enum.Material.Fabric
    WedgePart11.Position = Vector3.new(-1526.9182128906, 623.2353515625, 1112.2694091797)
    WedgePart11.Size = Vector3.new(33.96000289917, 10.470000267029, 43.559997558594)
    WedgePart11.Rotation = Vector3.new(0, 32.899997711182, 0)

    local WedgePart12 = Instance.new("WedgePart", Model)
    WedgePart12.Name = "Wedge2"
    WedgePart12.Reflectance = 0
    WedgePart12.Transparency = 0
    WedgePart12.Anchored = true
    WedgePart12.Archivable = true
    WedgePart12.CanCollide = true
    WedgePart12.Locked = false
    WedgePart12.BrickColor = BrickColor.new("Medium green")
    WedgePart12.Material = Enum.Material.Fabric
    WedgePart12.Position = Vector3.new(-580.31176757813, 50.62678527832, -2443.0573730469)
    WedgePart12.Size = Vector3.new(58.749996185303, 1, 69.490005493164)
    WedgePart12.Rotation = Vector3.new(-179.08000183105, 14.309999465942, -178.72999572754)

    local WedgePart13 = Instance.new("WedgePart", Model)
    WedgePart13.Name = "Wedge"
    WedgePart13.Reflectance = 0
    WedgePart13.Transparency = 0
    WedgePart13.Anchored = true
    WedgePart13.Archivable = true
    WedgePart13.CanCollide = true
    WedgePart13.Locked = false
    WedgePart13.BrickColor = BrickColor.new("Medium green")
    WedgePart13.Material = Enum.Material.Fabric
    WedgePart13.Position = Vector3.new(-554.13073730469, 37.368190765381, -2545.1484375)
    WedgePart13.Size = Vector3.new(59.18998336792, 30.919998168945, 140.86001586914)
    WedgePart13.Rotation = Vector3.new(0.91999995708466, -14.309999465942, -1.2699999809265)

    local Part14 = Instance.new("Part", Model)
    Part14.Name = "Wall"
    Part14.Reflectance = 0
    Part14.Transparency = 0.60000002384186
    Part14.Anchored = false
    Part14.Archivable = true
    Part14.CanCollide = true
    Part14.Locked = false
    Part14.BrickColor = BrickColor.new("Medium stone grey")
    Part14.Material = Enum.Material.Fabric
    Part14.Position = Vector3.new(-1522.0369873047, 632.79083251953, 1160.2779541016)
    Part14.Size = Vector3.new(46.590003967285, 8.9700002670288, 1.0400000810623)
    Part14.Rotation = Vector3.new(-180, 60, -180)

    local Part15 = Instance.new("Part", Model)
    Part15.Name = "Fence2"
    Part15.Reflectance = 0
    Part15.Transparency = 0.5
    Part15.Anchored = true
    Part15.Archivable = true
    Part15.CanCollide = true
    Part15.Locked = false
    Part15.BrickColor = BrickColor.new("Beige")
    Part15.Material = Enum.Material.Fabric
    Part15.Position = Vector3.new(-620.37908935547, 319.05871582031, 669.19006347656)
    Part15.Size = Vector3.new(2037.669921875, 16.129999160767, 2)
    Part15.Rotation = Vector3.new(0.0099999997764826, 30, -17.510000228882)

    local Part16 = Instance.new("Part", Model)
    Part16.Name = "Fence"
    Part16.Reflectance = 0
    Part16.Transparency = 0.5
    Part16.Anchored = true
    Part16.Archivable = true
    Part16.CanCollide = true
    Part16.Locked = false
    Part16.BrickColor = BrickColor.new("Beige")
    Part16.Material = Enum.Material.Fabric
    Part16.Position = Vector3.new(-639.38134765625, 319.06237792969, 636.27484130859)
    Part16.Size = Vector3.new(2037.669921875, 16.129999160767, 2)
    Part16.Rotation = Vector3.new(0.0099999997764826, 30, -17.510000228882)
    wait(4.6)
    for index, lumber in pairs(game.Workspace.Lumber:GetChildren()) do

    end
    print("btn3");
end)
	win4:NewButton("椰子岛捷径", function()
    local palm1 = Instance.new("Part", workspace)
    palm1.Name = "K Truck's Goin' There"
    palm1.Position = Vector3.new(1753.475, -10, -45.351)
    palm1.Size = Vector3.new(1600, 1, 50)
    palm1.BrickColor = BrickColor.Random()
    palm1.Anchored = true
    palm1.CanCollide = true
    print("btn3");
end)
	win4:NewButton("沼泽捷径", function()
    local part = Instance.new("Part", workspace)
    part.CFrame = CFrame.new(-499.196075, 155.460663, -166.186081, 1, 0, 0, 0, 1, 0, 0, 0, 1)
    part.Size = Vector3.new(295.87, 1, 40.14)
    local part2 = Instance.new("Part", workspace)
    part2.CFrame = CFrame.new(-53.5482712, 75.8732529, -166.035767, 0.965925813, 0.258819044, 0, -0.258819044,
        0.965925813, 0, 0, 0, 1)
    part2.Size = Vector3.new(617.23, 0.72, 40)
    part2.Rotation = Vector3.new(0, 0, -15)
    part.BrickColor = BrickColor.new(255, 255, 255)
    part.Material = Enum.Material.DiamondPlate;
    part.Anchored = true
    part2.BrickColor = BrickColor.new(255, 255, 255)
    part2.Material = Enum.Material.DiamondPlate;
    part2.Anchored = true
    print("btn3");
end)
	win4:NewButton("黄金木捷径", function()
    local f0 = Instance.new("Folder", workspace)
    f0.Name = "SGlowPath"
    local part = Instance.new("Part", f0)
    part.CFrame = CFrame.new(8.54199982, -0.914913177, -812.122375, 1, 0, 0, 0, 1, 0, 0, 0, 1)
    part.Size = Vector3.new(55, 1, 186)
    local part = Instance.new("Part", f0)
    part.CFrame = CFrame.new(-309.958008, -0.834023476, -879.710388, 1, 0, 0, 0, 1, 0, 0, 0, 1)
    part.Size = Vector3.new(582, 1, 50)
    local part = Instance.new("Part", f0)
    part.CFrame = CFrame.new(-606.630554, -0.843258381, -748.689453, 0.965925813, 0, -0.258819044, 0, 1, 0, 0.258819044,
        0, 0.965925813)
    part.Size = Vector3.new(47, 1, 246)
    part.Rotation = Vector3.new(0, -15, 0)
    local part = Instance.new("Part", f0)
    part.CFrame = CFrame.new(-763.458679, -0.723966122, -652.31958, 1, 0, 0, 0, 1, 0, 0, 0, 1)
    part.Size = Vector3.new(227, 1, 38)
    local part = Instance.new("Part", f0)
    part.CFrame = CFrame.new(-842.989868, -0.602809906, -713.690918, 0.965925872, 0, -0.258818835, 0, 1, 0, 0.258818835,
        0, 0.965925872)
    part.Size = Vector3.new(43, 1, 108)
    part.Rotation = Vector3.new(0, -15, 0)
    local part = Instance.new("Part", f0)
    part.CFrame = CFrame.new(-775.692932, -0.588047981, -815.868713, 0.707106829, 0, -0.707106769, 0, 1, 0, 0.707106769,
        0, 0.707106829)
    part.Size = Vector3.new(42, 1, 170)
    part.Rotation = Vector3.new(0, -45, 0)
    local part = Instance.new("Part", f0)
    part.CFrame = CFrame.new(-728.159668, -0.591278076, -952.04364, 1, 0, 0, 0, 1, 0, 0, 0, 1)
    part.Size = Vector3.new(55, 1, 182)
    local part = Instance.new("Part", f0)
    part.CFrame = CFrame.new(-864.098999, -0.257263005, -985.877014, 0.965925872, 0, 0.258818835, 0, 1, 0, -0.258818835,
        0, 0.965925872)
    part.Size = Vector3.new(235, 1, 56)
    part.Rotation = Vector3.new(0, 15, 0)
    local part = Instance.new("Part", f0)
    part.CFrame = CFrame.new(-1015.87311, -11.1293316, -945.632751, 0.933012664, -0.258819044, 0.25, 0.267445326,
        0.963572919, -0.000555455685, -0.240749463, 0.0673795789, 0.968245745)
    part.Size = Vector3.new(82, 1, 55)
    part.Rotation = Vector3.new(0.03, 14.48, 15.51)
    for J, v in pairs(f0:children()) do
        v.BrickColor = BrickColor.new(255, 255, 255)
        v.Material = Enum.Material.DiamondPlate;
        v.Anchored = true
    end
    print("btn3");
end)
	win4:NewButton("冰木捷径", function()
    local f0 = Instance.new("Folder", workspace)
    f0.Name = "FrostPath"
    local part = Instance.new("Part", f0)
    part.CFrame = CFrame.new(744.516663, 71.5780411, 861.148438, 1, -1.04308164e-07, -1.78813934e-07, 1.47034342e-07,
        0.965925932, 0.258818656, 1.45724101e-07, -0.258818656, 0.965925932)
    part.Size = Vector3.new(40, 1, 202)
    part.Rotation = Vector3.new(-15, 0, 0)
    local part = Instance.new("Part", f0)
    part.CFrame = CFrame.new(744.273, 97.5341, 1003.82)
    part.Size = Vector3.new(41, 1, 90)
    local part = Instance.new("Part", f0)
    part.CFrame = CFrame.new(775.181458, 100.246162, 1027.58276, 0.965925813, -0.258819044, 0, 0.258819044, 0.965925813,
        0, 0, 0, 1)
    part.Size = Vector3.new(46, 1, 43)
    part.Rotation = Vector3.new(0, 0, 15)
    local part = Instance.new("Part", f0)
    part.CFrame = CFrame.new(815.776672, 106.550224, 1027.4032, 1, 0, 0, 0, 1, 0, 0, 0, 1)
    part.Size = Vector3.new(38, 1, 42)
    local part = Instance.new("Part", f0)
    part.CFrame = CFrame.new(815.849976, 257.424072, 1608.79456, 1, 0, 0, 0, 0.965925813, 0.258819044, 0, -0.258819044,
        0.965925813)
    part.Size = Vector3.new(38, 1, 1164)
    part.Rotation = Vector3.new(-15, 0, 0)
    local part = Instance.new("Part", f0)
    part.CFrame = CFrame.new(900.612122, 407.759827, 2194.72363, 1, 0, 0, 0, 1, 0, 0, 0, 1)
    part.Size = Vector3.new(208, 1, 50)
    local part = Instance.new("Part", f0)
    part.CFrame = CFrame.new(1268.40649, 407.26062, 2798.83594, 0.91354543, 0, 0.406736642, 0, 1, 0, -0.406736642, 0,
        0.91354543)
    part.Size = Vector3.new(41, 2, 1364)
    part.Rotation = Vector3.new(0, 24, 0)
    for J, v in pairs(f0:children()) do
        v.BrickColor = BrickColor.new(255, 255, 255)
        v.Material = Enum.Material.DiamondPlate;
        v.Anchored = true
    end
    print("btn3");
end)
	win4:NewButton("简单砍幻影木", function()
	    local yellow1 = Instance.new("Part", workspace)
    yellow1.Name = "Lol Truck There Easy"
    yellow1.Position = Vector3.new(-5.915, -217, -1250.256)
    yellow1.Size = Vector3.new(1207.06, 1, 1160.09)
    yellow1.BrickColor = BrickColor.Random()
    yellow1.Anchored = true
    yellow1.CanCollide = true
    print("btn3");
end)
	win4:NewButton("点击传送", function()
	    mouse = game.Players.LocalPlayer:GetMouse()
    tool = Instance.new("Tool")
    tool.RequiresHandle = false
    tool.Name = "点击传送工具"
    tool.Activated:connect(function()
        local pos = mouse.Hit + Vector3.new(0, 2.5, 0)
        pos = CFrame.new(pos.X, pos.Y, pos.Z)
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = pos
    end)
    tool.Parent = game.Players.LocalPlayer.Backpack
    print("btn3");
end)
	win4:NewButton("重进服务器", function()
	    game:GetService("TeleportService"):Teleport(13822889)
    print("btn3");
end)
	win4:NewButton("安全紫砂", function()
	    lp.Character.Head:Destroy()
    print("btn3");
end)
local win5= library:CreateTab("整理木头＆玩家功能");
win5:NewDropdown("选择玩家", "这个用", bai.dropdown, function(v)
    bai.mtwjia = v
	print(item);
end)
	win5:NewButton("重置名称", function()
	    shuaxinlb(true)
    Players:SetOptions(bai.dropdown)
    print("btn3");
end)
local this_table = {
"普通树", "沼泽黄金", "樱花", "蓝木", "冰木", "火山木", "橡木", "巧克力木", "白桦木",
     "黄金木", "雪地松", "僵尸木", "大巧克力树", "椰子树", '幻影', '幽灵木', '南瓜木'}
win5:NewDropdown("选择木头", "这个有用", this_table, function(b)
        if b == '普通树' then
            bai.zlmt = "Generic"
        elseif b == '沼泽黄金' then
            bai.zlmt = "GoldSwampy"
        elseif b == '樱花' then
            bai.zlmt = "Cherry"
        elseif b == '蓝木' then
            bai.zlmt = "CaveCrawler"
        elseif b == '冰木' then
            bai.zlmt = "Frost"
        elseif b == '火山木' then
            bai.zlmt = "Volcano"
        elseif b == '橡木' then
            bai.zlmt = "Oak"
        elseif b == '巧克力木' then
            bai.zlmt = "Walnut"
        elseif b == '白桦木' then
            bai.zlmt = "Birch"
        elseif b == '黄金木' then
            bai.zlmt = "SnowGlow"
        elseif b == '雪地松' then
            bai.zlmt = "Pine"
        elseif b == '僵尸木' then
            bai.zlmt = "GreenSwampy"
        elseif b == '大巧克力树' then
            bai.zlmt = "Koa"
        elseif b == '椰子树' then
            bai.zlmt = "Palm"
        elseif b == '幻影' then
            bai.zlmt = "LoneCave"
        elseif b == '幽灵木' then
            bai.zlmt = "Spooky"
        elseif b == '南瓜木' then
            bai.zlmt = "SpookyNeon"
        end
	print(item);
end)
win5:NewToggle("竖着整理木头", "id46769457376", false, function(state)
    print(bool)
        if state then

        bai.shuzhe = true
    else
        bai.shuzhe = false

    end

	end)
		win5:NewButton("开始整理", function()
		    if bai.zlmt == nil then
        return notify("无言脚本", "你没有选择木头", 4)
    end
    if bai.shuzhe == false then
        local oldpos = lp.Character.HumanoidRootPart.Position

        for _, Plank in pairs(game.Workspace.PlayerModels:GetChildren()) do
            if Plank.Name == "Plank" and Plank:findFirstChild("Owner") then
                if Plank:FindFirstChild("Owner") and tostring(Plank.Owner.Value) == bai.mtwjia then
                    if Plank.TreeClass.Value == bai.zlmt then
                        tp(Plank.WoodSection.CFrame)
                        for i = 1, 50 do
                            game:GetService("ReplicatedStorage").Interaction.ClientIsDragging:FireServer(Plank)
                            Plank.WoodSection.Position = oldpos
                            game:GetService("ReplicatedStorage").Interaction.ClientIsDragging:FireServer(Plank)

                            game:GetService('RunService').Stepped:wait();
                        end
                    end
                end
            end
        end
    else
        local oldpos = lp.Character.HumanoidRootPart.CFrame

        for _, Plank in pairs(game.Workspace.PlayerModels:GetChildren()) do
            if Plank.Name == "Plank" and Plank:findFirstChild("Owner") then
                if Plank:FindFirstChild("Owner") and tostring(Plank.Owner.Value) == bai.mtwjia then
                    if Plank.TreeClass.Value == bai.zlmt then
                        tp(Plank.WoodSection.CFrame)
                        for i = 1, 50 do
                            game:GetService("ReplicatedStorage").Interaction.ClientIsDragging:FireServer(Plank)
                            Plank.WoodSection.CFrame = oldpos
                            game:GetService("ReplicatedStorage").Interaction.ClientIsDragging:FireServer(Plank)

                            game:GetService('RunService').Stepped:wait();
                        end
                    end
                end
            end
        end
    end
    print("btn3");
end)
local this_table = {
"普通树", "沼泽黄金", "樱花", "蓝木", "冰木", "火山木", "橡木", "巧克力木", "白桦木",
     "黄金木", "雪地松", "僵尸木", "大巧克力树", "椰子树", '幻影'}
win1:NewDropdown("选择木头填充蓝图", "这个11", this_table, function(b)
        if b == '普通树' then
            bai.tchonmt = "Generic"
        elseif b == '沼泽黄金' then
            bai.tchonmt = "GoldSwampy"
        elseif b == '樱花' then
            bai.tchonmt = "Cherry"
        elseif b == '蓝木' then
            bai.tchonmt = "CaveCrawler"
        elseif b == '冰木' then
            bai.tchonmt = "Frost"
        elseif b == '火山木' then
            bai.tchonmt = "Volcano"
        elseif b == '橡木' then
            bai.tchonmt = "Oak"
        elseif b == '巧克力木' then
            bai.tchonmt = "Walnut"
        elseif b == '白桦木' then
            bai.tchonmt = "Birch"
        elseif b == '黄金木' then
            bai.tchonmt = "SnowGlow"
        elseif b == '雪地松' then
            bai.tchonmt = "Pine"
        elseif b == '僵尸木' then
            bai.tchonmt = "GreenSwampy"
        elseif b == '大巧克力树' then
            bai.tchonmt = "Koa"
        elseif b == '椰子树' then
            bai.tchonmt = "Palm"
        elseif b == '幻影' then
            bai.tchonmt = "LoneCave"
        end
	print(item);
end)
	win5:NewButton("填充蓝图(木头)", function()
	    local plr = game:GetService("Players").LocalPlayer
    local tool = Instance.new("Tool", plr.Backpack)
    tool.RequiresHandle = false
    tool.Name = "点击一块蓝图"
    tool.Activated:Connect(function()
        local str = getMouseTarget().Parent
        if str:FindFirstChild("Type") and str.Type.Value == "Blueprint" and str:FindFirstChild("Owner") then
            lumbsmasher_legitpaint(bai.tchonmt, str, true)
        end
    end)
    print("btn3");
end)
	win5:NewButton("填充蓝图(全部)", function()
	    for i, v in pairs(game.Workspace.PlayerModels:GetChildren()) do

        if v:FindFirstChild("Type") and v.Type.Value == "Blueprint" and v:FindFirstChild("Owner") then
            if v.Owner.Value == lp then

                lumbsmasher_legitpaint(bai.tchonmt, v, true)

                task.wait()
            end

        end

    end
    print("btn3");
end)
local _default = 50; -- 默认值
local min = 50; -- 最小值
local max = 900; -- 最大值
local showFloat = false; -- 显示小数点


win5:NewSlider("玩家速度", "滑id", _default, min, max, showFloat, function(value)
    bai.walkspeed =value
    spawn(function()
        while task.wait() do
            game:GetService("Players").LocalPlayer.Character.Humanoid.WalkSpeed = bai.walkspeed
        end
    end)
    print(("现在是%d"):format(value));
end)
local _default = 16; -- 默认值
local min = 0; -- 最小值
local max = 300; -- 最大值
local showFloat = false; -- 显示小数点


win5:NewSlider("跳跃高度", "滑块id", _default, min, max, showFloat, function(value)
    bai.JumpPower = value
    spawn(function()
        while task.wait() do
            game:GetService("Players").LocalPlayer.Character.Humanoid.JumpPower = bai.JumpPower
        end
    end)
    print(("现在是%d"):format(value));
end)
local _default = 0; -- 默认值
local min = 0; -- 最小值
local max = 300; -- 最大值
local showFloat = false; -- 显示小数点


win5:NewSlider("悬浮高度", "滑块id", _default, min, max, showFloat, function(value)
    lp.Character.Humanoid.HipHeight = value
    print(("现在是%d"):format(value));
end)
local _default = 0; -- 默认值
local min = 0; -- 最小值
local max = 300; -- 最大值
local showFloat = false; -- 显示小数点


win5:NewSlider("重力", "滑块id", _default, min, max, showFloat, function(value)
    game.workspace.Gravity = value
    print(("现在是%d"):format(value));
end)
local _default = 198; -- 默认值
local min = 0; -- 最小值
local max = 300; -- 最大值
local showFloat = false; -- 显示小数点


win5:NewSlider("相机焦距", "滑块id", _default, min, max, showFloat, function(value)
    lp.CameraMaxZoomDistance = value
    print(("现在是%d"):format(value));
end)
	win5:NewButton("飞行", function()
	    loadstring(
        "\108\111\97\100\115\116\114\105\110\103\40\103\97\109\101\58\72\116\116\112\71\101\116\40\40\39\104\116\116\112\115\58\47\47\103\105\115\116\46\103\105\116\104\117\98\117\115\101\114\99\111\110\116\101\110\116\46\99\111\109\47\109\101\111\122\111\110\101\89\84\47\98\102\48\51\55\100\102\102\57\102\48\97\55\48\48\49\55\51\48\52\100\100\100\54\55\102\100\99\100\51\55\48\47\114\97\119\47\101\49\52\101\55\52\102\52\50\53\98\48\54\48\100\102\53\50\51\51\52\51\99\102\51\48\98\55\56\55\48\55\52\101\98\51\99\53\100\50\47\97\114\99\101\117\115\37\50\53\50\48\120\37\50\53\50\48\102\108\121\37\50\53\50\48\50\37\50\53\50\48\111\98\102\108\117\99\97\116\111\114\39\41\44\116\114\117\101\41\41\40\41\10\10")()
    print("btn3");
end)
win5:NewToggle("自身发光", "id645751986", false, function(state)
    if state then
        applyLight(true);
    else
        applyLight();
    end
end)
function NoClip(NoClipVal)
    if not NoClipVal then
        if Clipping then
            Clipping:Disconnect()
        end
        return
    end
    Clipping = game:GetService("RunService").Stepped:connect(function()
        for i, v in next, game.Players.LocalPlayer.Character:GetChildren() do
            if v:IsA("Part") or v:IsA("BasePart") then
                v.CanCollide = false
            end
        end
    end)
    print(bool)

	end
	win5:NewToggle("穿墙", "idoaisjej", false, function(state)
    print(bool)
    NoClip(state)
	end)
		win5:NewButton("安全紫砂", function()
		    lp.Character.Head:Destroy()
    print("btn3");
end)
	win5:NewButton("最大焦距", function()
	    lp.CameraMaxZoomDistance = 9e9
    print("btn3");
end)
local invisnum = 0
win5:NewToggle("隐身", "id664676767", false, function(state)
    print(bool)
    if state then
        TurnInvisible()
    else
        TurnVisible()
    end
	end)
	local this_table = {
'出生点', '木材反斗城', '土地商店', '桥', '码头', '椰子岛', '洞穴', '鲨鱼斧合成',
     '火山', '沼泽', '家具店', '盒子车行', '连锁逻辑店', '鲍勃的小店', '画廊', '雪山',
     '灵视神殿', '怪人', '小绿盒', '滑雪小屋', '黄金木洞穴', '小鸟斧头', "灯塔", '回家'}
win5:NewDropdown("选择传送地点", "这个有用", this_table, function(b)
        if b == '木材反斗城' then
            carTeleport(CFrame.new(270, 4, 60));
        elseif b == '出生点' then
            carTeleport(CFrame.new(174, 10.5, 66));
        elseif b == '土地商店' then
            carTeleport(CFrame.new(270, 3, -98));
        elseif b == '桥' then
            carTeleport(CFrame.new(112, 37, -892));
        elseif b == '码头' then
            carTeleport(CFrame.new(1136, 0, -206));
        elseif b == '椰子岛' then
            carTeleport(CFrame.new(2614, -4, -34));
        elseif b == '洞穴' then
            carTeleport(CFrame.new(3590, -177, 415));
        elseif b == '火山' then
            carTeleport(CFrame.new(-1588, 623, 1069));
        elseif b == '沼泽' then
            carTeleport(CFrame.new(-1216, 131, -822));
        elseif b == '家具店' then
            carTeleport(CFrame.new(486, 3, -1722));
        elseif b == '盒子车行' then
            carTeleport(CFrame.new(509, 3, -1458));
        elseif b == '雪山' then
            carTeleport(CFrame.new(1487, 415, 3259));
        elseif b == '连锁逻辑店' then
            carTeleport(CFrame.new(4615, 7, -794));
        elseif b == '鲍勃的小店' then
            carTeleport(CFrame.new(292, 8, -2544));
        elseif b == '画廊' then
            carTeleport(CFrame.new(5217, -166, 721));
        elseif b == '灵视神殿' then
            carTeleport(CFrame.new(-1608, 195, 928));
        elseif b == '怪人' then
            carTeleport(CFrame.new(1071, 16, 1141));
        elseif b == '小绿盒' then
            carTeleport(CFrame.new(-1667, 349, 1474));
        elseif b == '滑雪小屋' then
            carTeleport(CFrame.new(1244, 59, 2290));
        elseif b == '黄金木洞穴' then
            carTeleport(CFrame.new(-1080, -5, -942));
        elseif b == '鲨鱼斧合成' then
            carTeleport(CFrame.new(330.259735, 45.7998505, 1943.30823, 0.972010553, -8.07546598e-08, 0.234937176,
                7.63610259e-08, 1, 2.77986647e-08, -0.234937176, -9.08055142e-09, 0.972010553))
        elseif b == '小鸟斧头' then
            carTeleport(CFrame.new(4813.1, 33.5, -978.8));
        elseif b == '灯塔' then
            carTeleport(CFrame.new(1464.8, 356.3, 3257.2));
        else
            if b == '回家' then
                for i, v in pairs(game.Workspace.Properties:GetChildren()) do
                    if v.Owner.Value == game.Players.LocalPlayer then
                        carTeleport(v.OriginSquare.CFrame + Vector3.new(0, 10, 0))
                    end
                end
            end
        end
	print(item);
end)

local this_table = {
"普通树", "沼泽黄金", "樱花", "蓝木", "冰木", "火山木", "橡木", "巧克力木", "白桦木",
     "黄金木", "雪地松", "僵尸木", "大巧克力树", "椰子树", "幻影木"}
win5:NewDropdown("传送到树", "这个有用", this_table, function(b)
        if b == '普通树' then
            bai.tptree = "Generic"
        elseif b == '沼泽黄金' then
            bai.tptree = "GoldSwampy"
        elseif b == '樱花' then
            bai.tptree = "Cherry"
        elseif b == '蓝木' then
            bai.tptree = "CaveCrawler"
        elseif b == '冰木' then
            bai.tptree = "Frost"
        elseif b == '火山木' then
            bai.tptree = "Volcano"
        elseif b == '橡木' then
            bai.tptree = "Oak"
        elseif b == '巧克力木' then
            bai.tptree = "Walnut"
        elseif b == '白桦木' then
            bai.tptree = "Birch"
        elseif b == '黄金木' then
            bai.tptree = "SnowGlow"
        elseif b == '雪地松' then
            bai.tptree = "Pine"
        elseif b == '僵尸木' then
            bai.tptree = "GreenSwampy"
        elseif b == '大巧克力树' then
            bai.tptree = "Koa"
        elseif b == '椰子树' then
            bai.tptree = "Palm"
        elseif b == '幻影木' then
            bai.tptree = "LoneCave"
        end
        for i, v in pairs(game.Workspace:GetChildren()) do
            if v.Name == "TreeRegion" then
                for j, k in ipairs(v:GetChildren()) do
                    if k:FindFirstChild("TreeClass") and k.TreeClass.Value == bai.tptree then
                        game.Players.LocalPlayer.Character:MoveTo(k.WoodSection.Position)
                        break
                    end
                end
            end
        end
	print(item);
end)
local win6= library:CreateTab("整理物品＆传送物品");
win6:NewDropdown("选择玩家", "这个有用", bai.dropdown, function(v)
    bai.zlwjia = v
	print(item);
end)
	win6:NewButton("重置名称", function()
	    shuaxinlb(true)
    Players:SetOptions(bai.dropdown)
    print("btn3");
end)
win6:NewBox("x轴", "请输入!", function(txt)
    bai.zix = txt
    print(text);
end)
win6:NewBox("z轴", "请输入!", function(txt)
    bai.zlz = txt

    print(text);
end)
	win6:NewButton("整理工具", function()
	    Identify = Instance.new("Tool")
    Identify.RequiresHandle = false;
    Identify.Name = "点击要整理的物品"
    Identify.Activated:connect(function()
        local Player = game.Players.LocalPlayer.Character.HumanoidRootPart.Position - Vector3.new(0, 4, 0)
        local Items = {}
        if mouse.Target.Parent:FindFirstChild("PurchasedBoxItemName") then
            bai.dxmz = (mouse.Target.Parent.PurchasedBoxItemName.Value)

            function ItemStacker(ItemType, XAxis, ZAxis)
                for i, v in pairs(game:GetService("Workspace").PlayerModels:GetChildren()) do
                    if v:FindFirstChild("Owner") and tostring(v.Owner.Value) == bai.zlwjia then
                        if v:FindFirstChild("PurchasedBoxItemName") and tostring(v.PurchasedBoxItemName.Value) ==
                            ItemType then
                            table.insert(Items, v)

                        end
                    end
                end
                local Count = 0
                for Y = 1, math.ceil(#Items / (XAxis * ZAxis)) do
                    for X = 1, XAxis do
                        for Z = 1, ZAxis do
                            Count = Count + 1
                            tp(Items[Count].Main.CFrame + Vector3.new(3, 0, 3))
                            for e = 1, 40 do

                                game:GetService("ReplicatedStorage").Interaction.ClientIsDragging:FireServer(
                                    Items[Count])
                                Items[Count].Main.CFrame = CFrame.new(X * Items[1].Main.Size.X,
                                    Y * Items[1].Main.Size.Y, Z * Items[1].Main.Size.Z) + Player
                                game:GetService("ReplicatedStorage").Interaction.ClientIsDragging:FireServer(
                                    Items[Count])
                                game:GetService('RunService').Stepped:wait();
                            end

                        end
                    end
                end
            end

            ItemStacker(bai.dxmz, bai.zlz, bai.zix)
            notify('', '' .. mouse.Target.Parent.PurchasedBoxItemName.Value, 5)

        elseif mouse.Target.Parent:FindFirstChild("ItemName") then

            bai.dxmz = (mouse.Target.Parent.ItemName.Value)
            local Player = game.Players.LocalPlayer.Character.HumanoidRootPart.Position - Vector3.new(0, 5.5, 0)

            function ItemStackerft(ItemType, XAxis, ZAxis)
                for i, v in pairs(game:GetService("Workspace").PlayerModels:GetChildren()) do

                    if v:FindFirstChild("Owner") and tostring(v.Owner.Value) == bai.zlwjia then
                        if (v:FindFirstChild 'DraggableItem' and tostring(v.DraggableItem.Parent) == ItemType) then
                            table.insert(Items, v)
                        end
                    end
                end
                local Count = 0
                for Y = 1, math.ceil(#Items / (XAxis * ZAxis)) do
                    for X = 1, XAxis do
                        for Z = 1, ZAxis do
                            Count = Count + 1
                            tp(Items[Count].Main.CFrame + Vector3.new(3, 0, 3))

                            for e = 1, 40 do

                                game:GetService("ReplicatedStorage").Interaction.ClientIsDragging:FireServer(
                                    Items[Count])
                                Items[Count].Main.CFrame = CFrame.new(X * Items[1].Main.Size.X,
                                    Y * Items[1].Main.Size.Y, Z * Items[1].Main.Size.Z) + Player
                                game:GetService("ReplicatedStorage").Interaction.ClientIsDragging:FireServer(
                                    Items[Count])
                                game:GetService('RunService').Stepped:wait();
                            end

                        end
                    end
                end
            end
            ItemStackerft(bai.dxmz, bai.zlz, bai.zix)
            notify('', '' .. mouse.Target.Parent.ItemName.Value, 5)
        end
    end)
    Identify.Parent = game.Players.LocalPlayer.Backpack
    print("btn3");
end)
win6:NewDropdown("选择玩家", "这个1", bai.dropdown, function(v)
    bai.cswjia = v
	print(item);
	
end)
win6:NewButton("重置玩家名称", function()
     shuaxinlb(true)
    Players:SetOptions(bai.dropdown)
       print("btn3");
    
end)
win6:NewButton("设置传送点", function()
    pcall(function()
        game.Workspace.baiBasedropCord:Destroy();
        bai.itemset = nil
    end)
    local baiBasedropCord = Instance.new("Part", game.Workspace)
    baiBasedropCord.CanCollide = false
    baiBasedropCord.Anchored = true
    baiBasedropCord.Shape = Enum.PartType.Ball
    baiBasedropCord.Color = Color3.fromRGB(0, 217, 255);
    baiBasedropCord.Transparency = 0
    baiBasedropCord.Size = Vector3.new(2, 2, 2)
    baiBasedropCord.CFrame = lp.Character.HumanoidRootPart.CFrame
    baiBasedropCord.Material = Enum.Material.Marble
    baiBasedropCord.Name = "baiBasedropCord"

    bai.itemset = lp.Character.HumanoidRootPart.CFrame
    print("btn3");
end)win6:NewButton("删除传送点", function()
    pcall(function()
        game.Workspace.baiBasedropCord:Destroy();
        bai.itemset = nil
    end)

    print("btn3");
end)win6:NewButton("获得传送工具", function()
      if bai.itemset == nil then
        return notify("无言脚本", "请你放传送点", 4)
    end
    local Tool = Instance.new("Tool", game:GetService("Players").LocalPlayer.Backpack)
    Tool.Name = "点击你想要传送的物品"
    Tool.RequiresHandle = false;

    Tool.Activated:connect(function()

        bai.cskais = true
        if mouse.Target.Parent:FindFirstChild("PurchasedBoxItemName") then

            bai.dxmz = (mouse.Target.Parent.PurchasedBoxItemName.Value)

        elseif mouse.Target.Parent:FindFirstChild("ItemName") then
            bai.dxmz = (mouse.Target.Parent.ItemName.Value)

        end

        for _, v in next, workspace.PlayerModels:children() do
            local check = v:FindFirstChild('ItemName') or v:FindFirstChild('PurchasedBoxItemName');
            local check2 = v:FindFirstChild 'Type'
            local main
            if bai.cskais == true then

                if check and check.Value == bai.dxmz and v:FindFirstChild('Owner') and tostring(v.Owner.Value) ==
                    bai.cswjia or check2 and check2.Value == bai.dxmz and v:FindFirstChild('Owner') and
                    tostring(v.Owner.Value) == bai.cswjia then
                    local main = v:FindFirstChild 'Main';
                    if (lp.Character.HumanoidRootPart.CFrame.p - main.CFrame.p).magnitude > 5 then
                        tp(v.Main.CFrame + Vector3.new(4, 0, 4))
                    end

                    for e = 1, 20 do

                        game:GetService("ReplicatedStorage").Interaction.ClientIsDragging:FireServer(v)
                        v.Main.CFrame = bai.itemset
                        game:GetService("ReplicatedStorage").Interaction.ClientIsDragging:FireServer(v)
                        game:GetService('RunService').Stepped:wait();
                    end

                end
            end
        end

    end)
    Tool.Parent = game.Players.LocalPlayer.Backpack
      print("btn3");
end)
win6:NewToggle("选择传送物品", "64518976734随便", false, function(state)
    print(bool)
    if state then
        ClickToSelectClick = Mouse.Button1Up:Connect(function()
            Clicked = Mouse.Target
            if Clicked.Parent:FindFirstChild("Owner") and tostring(Clicked.Parent.Owner.Value) == bai.cswjia then
                if Clicked.Parent:FindFirstAncestor("PlayerModels") then
                    if not Clicked.Parent:FindFirstChild("SelectionBox") then
                        local SB = Instance.new("SelectionBox", Clicked.Parent)
                        SB.Adornee = Clicked.Parent
                    else
                        Clicked.Parent:FindFirstChild("SelectionBox"):Destroy()
                    end
                end
            end
        end)
    else
        ClickToSelectClick:Disconnect()
    end
	end)
win6:NewButton("取消选择", function()
    for i, v in next, game:GetService("Workspace").PlayerModels:GetChildren() do
        if v:FindFirstChild("Owner") and tostring(v.Owner.Value) == bai.cswjia then
            if v:FindFirstChild("SelectionBox") then
                v.SelectionBox:Destroy()
            end
        end
    end
    print("btn3");
    
end)
local ScreenGui = Instance.new("ScreenGui")
local Frame = Instance.new("Frame")

ScreenGui.Parent = game.CoreGui
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

Frame.Parent = ScreenGui
Frame.BackgroundColor3 = Color3.fromRGB(163, 163, 163)
Frame.BackgroundTransparency = 0.8
Frame.BorderColor3 = 3.new(76, 104, 72)
Frame.BorderSizePixel = 2
Frame.Position = UDim2.new(0, 0, 0, 0)
Frame.Size = UDim2.new(0, 0, 0, 0)
function is_in_frame(screenpos, frame)
    local xPos = frame.AbsolutePosition.X
    local yPos = frame.AbsolutePosition.Y

    local xSize = frame.AbsoluteSize.X
    local ySize = frame.AbsoluteSize.Y

    local check1 = screenpos.X >= xPos and screenpos.X <= xPos + xSize
    local check2 = screenpos.X <= xPos and screenpos.X >= xPos + xSize

    local check3 = screenpos.Y >= yPos and screenpos.Y <= yPos + ySize
    local check4 = screenpos.Y <= yPos and screenpos.Y >= yPos + ySize

    local finale = (check1 and check3) or (check2 and check3) or (check1 and check4) or (check2 and check4)

    return finale
end

win6:NewToggle("框选物品", "64664346199随便", false, function(state)
    if state then
        bai.kuangxiu = game:GetService("UserInputService").InputBegan:Connect(function(cilk)

            if cilk.UserInputType == Enum.UserInputType.MouseButton1 then
                Frame.Visible = true
                Frame.Position = UDim2.new(0, Mouse.X, 0, Mouse.Y)

                while game:GetService("UserInputService"):IsMouseButtonPressed(Enum.UserInputType.MouseButton1) do
                    game:GetService("RunService").RenderStepped:wait()
                    Frame.Size = UDim2.new(0, Mouse.X, 0, Mouse.Y) - Frame.Position

                    for i, v in pairs(workspace.PlayerModels:GetChildren()) do
                        if bai.xzemuban == true and v:FindFirstChild("Owner") and tostring(v.Owner.Value) == bai.cswjia and
                            v:FindFirstChild("WoodSection") then
                            local screenpos, visible = game.Workspace.CurrentCamera:WorldToScreenPoint(v.WoodSection
                                                                                                           .CFrame.p)
                            if visible then
                                if is_in_frame(screenpos, Frame) then
                                    if not v:FindFirstChild("SelectionBox") then
                                        local SB = Instance.new("SelectionBox", v)
                                        SB.Adornee = v
                                    end
                                end
                            end
                        end
                        if v:FindFirstChild("Owner") and tostring(v.Owner.Value) == bai.cswjia and
                            v:FindFirstChild("Main") then
                            local screenpos, visible = game.Workspace.CurrentCamera:WorldToScreenPoint(v.Main.CFrame.p)
                            if visible then
                                if is_in_frame(screenpos, Frame) then
                                    if not v:FindFirstChild("SelectionBox") then
                                        local SB = Instance.new("SelectionBox", v)
                                        SB.Adornee = v
                                    end
                                end
                            end
                        end
                    end
                end
            end
            Frame.Size = UDim2.new(0, 1, 0, 1)
            Frame.Visible = false

        end)
    else
        Frame.Visible = false
        bai.kuangxiu:Disconnect()
        bai.kuangxiu = nil
    end
    print(bool)

	end)
win6:NewToggle("带木板", "id随便", false, function(state)
    bai.xzemuban = state

    print(bool)

	end)
	win6:NewButton("开始传送物品", function()
	    if bai.itemset == nil then
        return notify("浮光掠影", "请你放传送点", 4)
    end
    bai.cskais = true
    OldPos = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
    for i, v in next, game:GetService("Workspace").PlayerModels:GetChildren() do
        if bai.cskais == false then
            break
        end
        if v:FindFirstChild("Owner") and tostring(v.Owner.Value) == bai.cswjia then
            if v:FindFirstChild("SelectionBox") then
                if v:FindFirstChild("Main") then
                    if (lp.Character.HumanoidRootPart.CFrame.p - v.Main.CFrame.p).magnitude > 5 then
                        tp(v.Main.CFrame + Vector3.new(4, 0, 4))
                    end
                    for e = 1, 30 do
                        if bai.cskais == false then
                            break
                        end
                        game:GetService("ReplicatedStorage").Interaction.ClientIsDragging:FireServer(v)
                        v:PivotTo(bai.itemset)
                        game:GetService("ReplicatedStorage").Interaction.ClientIsDragging:FireServer(v)
                        game:GetService('RunService').Stepped:wait();
                    end
                    v.SelectionBox:Destroy()
                    game:GetService('RunService').Stepped:wait();
                elseif v:FindFirstChild("WoodSection") then
                    tp(v.WoodSection.CFrame + Vector3.new(4, 0, 4))
                    for e = 1, 70 do
                        if bai.cskais == false then
                            break
                        end
                        game:GetService("ReplicatedStorage").Interaction.ClientIsDragging:FireServer(v)
                        v.WoodSection.CFrame = bai.itemset * CFrame.Angles(math.rad(90), 0, 90)
                        game:GetService("ReplicatedStorage").Interaction.ClientIsDragging:FireServer(v)
                        game:GetService('RunService').Stepped:wait();
                    end
                    v.SelectionBox:Destroy()
                    game:GetService('RunService').Stepped:wait();
                end

            end

        end
    end
    tp(OldPos)
    print("btn3");
end)
win6:NewButton("停止", function()
    bai.cskais = false
    print("btn3");
end)
local win7= library:CreateTab("自动购买");
win7:NewBox("购买数量", "请输入!", function(txt)
    bai.autobuyamount = txt

    print(text);
end)
local this_table = {
'按钮', '控制杆', '电线', '4/4x1木楔', '3/4x1木楔', '2/4x1木楔', '1/4X1木楔', '3/3x1木楔',
           '2/3x1木楔', '1/3x1木楔', '2/2x1木楔', '1/2x1木楔', '1/1x1木楔', '篱笆', '压力板',
           '1/3木楔', '锯木机01', '锯木机02L', '波纹墙角立柱', '传送带', '普通凳子',
           '倾斜传送带', '3/4木楔', '2/3木楔', '光滑的墙', '光滑墙角', '普通锯木厂', '4/4木楔',
           '光滑墙立柱', '篱笆角', '矮篱笆角', '矮波纹墙', '长桌', '矮篱笆', '光滑墙角立柱',
           '破旧锯木厂', '普通门', '矮光滑墙', '工作灯', '弯传送带', '切换传送带', '宽敞门',
           '3/3木楔', '400元小汽车', '波纹墙立柱', '锯木机02', '漏斗式传送带', '小型地板',
           '小型瓷砖', '矮波纹墙角', '波纹墙', '大型地板', '微型瓷砖', '微型地板', '1/1木楔',
           '左转直式传送带', '银斧头', '切割机', '基础斧头', '右转传送带', '普通斧头',
           '转向传送带支架', '传送带支架', '波纹墙角立柱', '楼梯', '陡峭楼梯', '钢斧',
           '标志杆', '梯子', '大型瓷砖', '瓷砖', '硬化斧', '半截门', '木头清扫机',
           '光滑墙立柱', '沙子袋', '小型拖车', '531式拖车', '小汽车XL', '大卡车', '长沙发',
           '洗碗机', '薄柜子', '冰箱', '火炉', '马桶', '双人沙发', '床', '落地灯', '台灯',
           '微型玻璃板', '小型玻璃板', '玻璃板', '大型玻璃板', '玻璃门', '琥珀色冰柱灯串',
           '红色冰柱灯串', '绿色冰柱灯串', '蓝色冰柱灯串', '烟花发射器', '惊悚冰柱灯串',
           '单人沙发', '双人床', '灯泡', '工作台面', '薄工作台面', '带水槽的工作台面',
           '照明灯', '墙灯', '橱柜角', '宽橱柜角', '橱柜', '炸药', '毛毛虫软糖', '未知标题',
           '困扰装饰画', '户外水彩素描', '阴郁的黄昏海景', '北极灯串', '菠萝画',
           '孤独的长颈鹿', '信号维持器', '与门', '异与门', '木材检测器', '按钮', '压力板',
           'OR门', '拉杆', '信号延时器', '信号变换器', '激光', '激光探测器', '舱门',
           '橙色发光线', '绿色发光线', '黄色发光线', '浮光掠影色发光线', '紫色发光线',
           '红色发光线', '青色发光线', '蓝色发光线', '定时开关'}
win7:NewDropdown("选择物品", "这个有用", this_table, function(a)
    if a == '按钮' then
        l = 'Button0'
    elseif a == '控制杆' then
        l = 'Lever0'
    elseif a == '电线' then
        l = 'Wire'
    elseif a == '4/4x1木楔' then
        l = 'Wedge1_Thin'
    elseif a == '3/4x1木楔' then
        l = 'Wedge2_Thin'
    elseif a == '2/4x1木楔' then
        l = 'Wedge3_Thin'
    elseif a == '1/4x1木楔' then
        l = 'Wedge4_Thin'
    elseif a == '3/3x1木楔' then
        l = 'Wedge5_Thin'
    elseif a == '2/3x1木楔' then
        l = 'Wedge6_Thin'
    elseif a == '1/3x1木楔' then
        l = 'Wedge7_Thin'
    elseif a == '2/2x1木楔' then
        l = 'Wedge8_Thin'
    elseif a == '1/2x1木楔' then
        l = 'Wedge9_Thin'
    elseif a == '1/1x1木楔' then
        l = 'Wedge10_Thin'
    elseif a == '篱笆' then
        l = 'Wall3TallThin'
    elseif a == '压力板' then
        l = 'PressurePlate'
    elseif a == '1/3木楔' then
        l = 'Wedge7'
    elseif a == '锯木机01' then
        l = 'Sawmill3'
    elseif a == '锯木机02L' then
        l = 'Sawmill4L'
    elseif a == '波纹墙角立柱' then
        l = 'Wall1ShortCorner'
    elseif a == '传送带' then
        l = 'StraightConveyor'
    elseif a == '普通凳子' then
        l = 'Chair1'
    elseif a == '倾斜传送带' then
        l = 'TiltConveyor'
    elseif a == '3/4木楔' then
        l = 'Wedge2'
    elseif a == '2/3木楔' then
        l = 'Wedge6'
    elseif a == '光滑的墙' then
        l = "Wall2"
    elseif a == '光滑墙角' then
        l = 'Wall2TallCorner'
    elseif a == '普通锯木厂' then
        l = 'Sawmill2'
    elseif a == '4/4木楔' then
        l = 'Wedge1'
    elseif a == '光滑墙立柱' then
        l = 'Wall2Short'
    elseif a == '篱笆角' then
        l = 'Wall3TallCorner'
    elseif a == '矮篱笆角' then
        l = 'Wall3Corner'
    elseif a == '矮波纹墙' then
        l = 'Wall1Thin'
    elseif a == '长桌' then
        l = 'Table2'
    elseif a == '矮篱笆' then
        l = 'Wall3'
    elseif a == '光滑墙角立柱' then
        l = 'Wall2ShortCorner'
    elseif a == '破旧锯木厂' then
        l = 'Sawmill'
    elseif a == '普通门' then
        l = 'Door1'
    elseif a == '矮光滑墙' then
        l = 'Wall2'
    elseif a == '工作灯' then
        l = 'WorkLight'
    elseif a == '弯传送带' then
        l = 'TightTurnConveyor'
    elseif a == '切换传送带' then
        l = 'ConveyorSwitch'
    elseif a == '宽敞门' then
        l = 'Door3'
    elseif a == '3/3木楔' then
        l = 'Wedge5'
    elseif a == '400元小汽车' then
        l = 'UtilityTruck'
    elseif a == '波纹墙立柱' then
        l = 'Wall1ShortThin'
    elseif a == '锯木机02' then
        l = 'Sawmill4L'
    elseif a == '漏斗式传送带' then
        l = 'ConveyorFunnel'
    elseif a == '小型地板' then
        l = 'Floor1Small'
    elseif a == '小型瓷砖' then
        l = 'Floor2Small'
    elseif a == '矮波纹墙角' then
        l = 'Wall1Corner'
    elseif a == '波纹墙' then
        l = 'Wall1Tall'
    elseif a == '大型地板' then
        l = 'Floor1Large'
    elseif a == '微型瓷砖' then
        l = 'Floor2Tiny'
    elseif a == '微型地板' then
        l = 'Floor1Tiny'
    elseif a == '1/1木楔' then
        l = 'Wedge10'
    elseif a == '左转直式传送带' then
        l = 'StraightSwitchConveyorLeft'
    elseif a == '银斧头' then
        l = 'SilverAxe'
    elseif a == '切割机' then
        l = 'ChopSaw'
    elseif a == '基础斧头' then
        l = 'BasicHatchet'
    elseif a == '右转传送带' then
        l = 'StraightSwitchConveyorRight'
    elseif a == '普通斧头' then
        l = 'Axe1'
    elseif a == '转向传送带支架' then
        l = 'TightTurnConveyorSupports'
    elseif a == '传送带支架' then
        l = 'ConveyorSupports'
    elseif a == '波纹墙角立柱' then
        l = 'Wall1ShortCorner'
    elseif a == '楼梯' then
        l = 'Stair2'
    elseif a == '陡峭楼梯' then
        l = 'Stair1'
    elseif a == '钢斧' then
        l = 'Axe2'
    elseif a == '标志杆' then
        l = 'Post'
    elseif a == '梯子' then
        l = 'Ladder1'
    elseif a == '大型瓷砖' then
        l = 'Floor2Large'
    elseif a == '瓷砖' then
        l = 'Floor2'
    elseif a == '硬化斧' then
        l = 'Axe3'
    elseif a == '半截门' then
        l = 'Door2'
    elseif a == '木头清扫机' then
        l = 'LogSweeper'
    elseif a == '光滑墙立柱' then
        l = 'Wall2ShortThin'
    elseif a == '沙子袋' then
        l = 'BagOfSand'
    elseif a == '小型拖车' then
        l = 'SmallTrailer'
    elseif a == '531式拖车' then
        l = 'Trailer2'
    elseif a == '小汽车XL' then
        l = 'UtilityTruck2'
    elseif a == '大卡车' then
        l = 'Pickup1'
    elseif a == '长沙发' then
        l = 'Seat_Couch'
    elseif a == '洗碗机' then
        l = 'Dishwasher'
    elseif a == '薄柜子' then
        l = 'Cabinet1Thin'
    elseif a == '冰箱' then
        l = 'Refridgerator'
    elseif a == '马桶' then
        l = 'Toilet'
    elseif a == '双人沙发' then
        l = 'Seat_Loveseat'
    elseif a == '床' then
        l = 'Bed1'
    elseif a == '落地灯' then
        l = 'FloorLamp1'
    elseif a == '台灯' then
        l = 'Lamp1'
    elseif a == '微型玻璃板' then
        l = 'GlassPane1'
    elseif a == '小型玻璃板' then
        l = 'GlassPane2'
    elseif a == '玻璃板' then
        l = 'GlassPane3'
    elseif a == '大型玻璃板' then
        l = 'GlassPane4'
    elseif a == '玻璃门' then
        l = 'GlassDoor1'
    elseif a == '琥珀色冰柱灯串' then
        l = 'IcicleWireAmber'
    elseif a == '红色冰柱灯串' then
        l = 'IcicleWireRed'
    elseif a == '绿色冰柱灯串' then
        l = 'IcicleWireGreen'
    elseif a == '蓝色冰柱灯串' then
        l = 'IcicleWireBlue'
    elseif a == '烟花发射器' then
        l = 'FireworkLauncher'
    elseif a == '惊悚冰柱灯串' then
        l = 'IcicleWireHalloween'
    elseif a == '单人沙发' then
        l = 'Seat_Armchair'
    elseif a == '双人床' then
        l = 'Bed2'
    elseif a == '灯泡' then
        l = 'LightBulb'
    elseif a == '工作台面' then
        l = 'CounterTop1'
    elseif a == '薄工作台面' then
        l = 'CounterTop1Thin'
    elseif a == '带水槽的工作台面' then
        l = 'CounterTop1Sink'
    elseif a == '照明灯' then
        l = 'WallLight2'
    elseif a == '墙灯' then
        l = 'WallLight1'
    elseif a == '橱柜角' then
        l = 'Cabinet1CornerTight'
    elseif a == '宽橱柜角' then
        l = 'Cabinet1CornerWide'
    elseif a == '橱柜' then
        l = 'Cabinet1'
    elseif a == '毛毛虫软糖' then
        l = 'CanOfWorms'
    elseif a == '炸药' then
        l = 'Dynamite'
    elseif a == '未知标题' then
        l = 'Painting1'
    elseif a == '困扰装饰画' then
        l = 'Painting2'
    elseif a == '户外水彩素描' then
        l = 'Painting3'
    elseif a == '阴郁的黄昏海景' then
        l = 'Painting6'
    elseif a == '北极灯串' then
        l = 'Painting7'
    elseif a == '菠萝画' then
        l = 'Painting8'
    elseif a == '孤独的长颈鹿' then
        l = 'Painting9'
    elseif a == '信号维持器' then
        l = 'SignalSustain'
    elseif a == '与门' then
        l = 'GateAND'
    elseif a == '异与门' then
        l = 'GateXOR'
    elseif a == '木材检测器' then
        l = 'WoodChecker'
    elseif a == '按钮' then
        l = 'lutton0'
    elseif a == '压力板' then
        l = 'PressurePlate'
    elseif a == 'OR门' then
        l = 'GateOR'
    elseif a == '拉杆' then
        l = 'Lever0'
    elseif a == '信号延时器' then
        l = 'SignalDelay'
    elseif a == '信号变换器' then
        l = 'GateNOT'
    elseif a == '激光' then
        l = 'Laser'
    elseif a == '激光探测器' then
        l = 'LaserReceiver'
    elseif a == '舱门' then
        l = 'Hatch'
    elseif a == '橙色发光线' then
        l = 'NeonWireOrange'
    elseif a == '绿色发光线' then
        l = 'NeonWireGreen'
    elseif a == '黄色发光线' then
        l = 'NeonWireYellow'
    elseif a == '白色发光线' then
        l = 'NeonWireWhite'
    elseif a == '紫色发光线' then
        l = 'NeonWireViolet'
    elseif a == '红色发光线' then
        l = 'NeonWireRed'
    elseif a == '青色发光线' then
        l = 'NeonWireCyan'
    elseif a == '蓝色发光线' then
        l = 'NeonWireBlue'
    elseif a == '定时开关' then
        l = 'ClockSwitch'
    end
	print(item);
end)
	win7:NewButton("买", function()
	   bai.autobuystop = false
    bai.autobuyset = lp.Character.HumanoidRootPart.CFrame
    autobuy(l, bai.autobuyamount)
    task.wait()
    tp(bai.autobuyset)
    print("btn3");
end)
	win7:NewButton("停止购买", function()
	    bai.autobuystop = true
    pcall(function()
        bai.autocsdx:Disconnect();
        bai.autocsdx = nil;
    end)
    print("btn3");
end)
win7:NewButton("自动合成鲨鱼斧头", function()
    local oldPos = lp.Character.HumanoidRootPart.CFrame.Position
    bai.autobuystop = false
    bai.autobuyset = CFrame.new(319, 43, 1914)
    autobuy("BagOfSand", 1)
    task.wait(0.1)
    bai.autobuyset = CFrame.new(317, 43, 1918)
    autobuy('CanOfWorms', 1)
    task.wait(0.1)
    bai.autobuyset = CFrame.new(322, 43, 1916)
    autobuy('LightBulb', 1)
    tp(bai.autobuyset)
    local boxOpenConnection, axeConnection;

    axeConnection = workspace.PlayerModels.ChildAdded:Connect(function(Child)
        local Main = Child:WaitForChild('Main', 60)
        if Main:FindFirstChild 'Mesh' and Main.Mesh.TextureId == 'rbxassetid://273892918' then
            repeat
                wait()
            until Child:FindFirstChild 'ToolName';

            tp(CFrame.new(Child.Main.CFrame.p));
            repeat
                task.wait()
                game:GetService 'ReplicatedStorage'.Interaction.ClientIsDragging:FireServer(Child);

                game.ReplicatedStorage.Interaction.ClientInteracted:FireServer(Child, 'Pick up tool'); -- >not running?
            until tostring(Child.Parent) ~= 'PlayerModels';
            tp(CFrame.new(oldPos));
            pcall(function()
                axeConnection:Disconnect();
                axeConnection = nil;
                bai.boxOpenConnection:Disconnect();
                bai.boxOpenConnection = nil;
            end);
        end
    end);
    bai.boxOpenConnection = workspace.PlayerModels.ChildAdded:Connect(function(Child)
        pcall(function()
            wait(.5)
            local Owner = Child:WaitForChild('Owner', 60)
            if tostring(Owner.Value) == tostring(lp) then
                local itemName = Child:FindFirstChild 'ItemName' or Child:FindFirstChild 'PurchasedBoxItemName';
                if itemName then
                    if tostring(itemName.Value) == 'BagOfSand' or tostring(itemName.Value) == 'CanOfWorms' or
                        tostring(itemName.Value) == 'LightBulb' then
                        if Child:FindFirstChild 'ItemName' then
                            wait(0.1)
                            game:GetService("ReplicatedStorage").Interaction.ClientInteracted:FireServer(Child,
                                'Open box');
                        end

                    end
                end

            end
        end)
    end);
    print("btn3");
end)
local win8 = library:CreateTab("复仇玩家");
win8:NewDropdown("选择倒霉蛋", "这个有用", bai.dropdown, function(v)
    bai.playernamedied = v
	print(item);
end)
win8:NewButton("刷新倒霉蛋", function()
    shuaxinlb(true)
    dropdown:SetOptions(bai.dropdown)
    print("btn3");
end)
win8:NewButton("传送倒霉蛋身边", function()
    local HumRoot = game.Players.LocalPlayer.Character.HumanoidRootPart
    local tp_player = game:GetService("Players")[bai.playernamedied]
    if tp_player then
        for i = 1, 5 do
            wait()
            HumRoot.CFrame = tp_player.Character.HumanoidRootPart.CFrame + Vector3.new(0, 3, 0)
        end
    end
    print("btn3");
end)win8:NewButton("传送到倒霉蛋基地", function()
     local ME = game.Players.LocalPlayer.Character.HumanoidRootPart
    for i, v in pairs(game.Workspace.Properties:GetChildren()) do
        if v.Owner.Value == game.Players[bai.playernamedied] then
            ME.CFrame = v.OriginSquare.CFrame + Vector3.new(0, 10, 0)
        end
    end
       print("btn3");
end)win8:NewButton("汽车传送到到倒霉蛋基地", function()
    for i, v in pairs(game.Workspace.Properties:GetChildren()) do
        if v.Owner.Value == game.Players[bai.playernamedied] then

            carTeleport(v.OriginSquare.CFrame + Vector3.new(0, 10, 0))
        end
    end
    print("btn3");
end)win8:NewButton("汽车踢倒霉蛋", function()
    local ME = game.Players.LocalPlayer.Character.HumanoidRootPart

    local function callback(Text)
        if Text == "确定" then
            for i, v in pairs(game:GetService("Workspace").PlayerModels:GetChildren()) do
                if v.Name == "Model" and v:FindFirstChild("DriveSeat") and v:FindFirstChild("ItemName") then
                    if v.ItemName.Value == "UtilityTruck_Vehicle" then
                        if v.Owner.OwnerString.Value == tostring(game.Players.LocalPlayer) then
                            Car = v
                            Car.DriveSeat:Sit(game.Players.LocalPlayer.Character.Humanoid)
                            wait(0.5)
                            Car.PrimaryPart = v.Seat
                        end
                    end
                end
            end

            spawn(function()

                if not lp.Character.Humanoid.SeatPart then
                    print('错误,你需要坐在车上')
                    return
                end
                if not game.Players[bai.playernamedied].Character.Humanoid.SeatPart then
                    repeat
                        task.wait()
                        carTeleport(game.Players[bai.playernamedied].Character.HumanoidRootPart.CFrame +
                                        Vector3.new(0, -2, 0))
                    until game.Players[bai.playernamedied].Character.Humanoid.SeatPart
                end
                while task.wait() do
                    for i, v in pairs(game.Workspace.Properties:GetChildren()) do
                        if v.Owner.Value == game.Players.LocalPlayer then
                            carTeleport(v.OriginSquare.CFrame + Vector3.new(0, 10, 0))
                        end
                    end
                end

            end)
        elseif Text == "取消" then

        end
    end

    local NotificationBindable = Instance.new("BindableFunction")
    NotificationBindable.OnInvoke = callback
    --
    game.StarterGui:SetCore("SendNotification", {
        Title = "无言脚本",
        Text = "使用此功能前请自己拉黑他,然后再打开让他可以坐副驾驶的功能",
        Icon = "",
        Duration = 5,
        Button1 = "确定",
        Button2 = "取消",
        Callback = NotificationBindable
    })
    print("btn3");
end)win8:NewButton("斧头杀倒霉蛋", function()
    local tool = getTool()
    if not tool then
        return notify("浮光掠影", "你需要斧头", 4)
    end
    local KillPlayer = bai.playernamedied

    local Player = gplr(KillPlayer)

    if Player[1] then
        Player = Player[1]
        local LocalPlayer = game.Players.LocalPlayer

        if LocalPlayer.Character.PrimaryPart ~= nil then
            local Character = LocalPlayer.Character
            local previous = LocalPlayer.Character.PrimaryPart.CFrame

            Character.Archivable = true
            local Clone = Character:Clone()
            LocalPlayer.Character = Clone
            wait(0.5)
            LocalPlayer.Character = Character
            wait(0.2)

            if LocalPlayer.Character and Player.Character and Player.Character.PrimaryPart ~= nil then
                if LocalPlayer.Character:FindFirstChildOfClass("Humanoid") then
                    LocalPlayer.Character:FindFirstChildOfClass("Humanoid"):Destroy()
                end

                local Humanoid = Instance.new("Humanoid")
                Humanoid.Parent = LocalPlayer.Character

                local Tool = nil

                if LocalPlayer.Character:FindFirstChildOfClass("Tool") then
                    Tool = LocalPlayer.Character:FindFirstChildOfClass("Tool")
                elseif LocalPlayer.Backpack and LocalPlayer.Backpack:FindFirstChildOfClass("Tool") then
                    Tool = LocalPlayer.Backpack:FindFirstChildOfClass("Tool")
                end

                if Tool ~= nil then
                    Tool.Parent = LocalPlayer.Backpack

                    Player.Character.HumanoidRootPart.Anchored = true

                    local Arm = game.Players.LocalPlayer.Character['Right Arm'].CFrame *
                                    CFrame.new(0, -1, 0, 1, 0, 0, 0, 0, 1, 0, -1, 0)
                    Tool.Grip = Arm:ToObjectSpace(Player.Character.PrimaryPart.CFrame):Inverse()

                    Tool.Parent = LocalPlayer.Character
                    Workspace.CurrentCamera.CameraSubject = Tool.Handle

                    repeat
                        wait()
                    until not Tool or Tool and (Tool.Parent == Workspace or Tool.Parent == Player.Character)
                    Player.Character.HumanoidRootPart.Anchored = false
                    wait(0.1)
                    Humanoid.Health = 0
                    LocalPlayer.Character = nil
                end
            end

            spawn(function()
                LocalPlayer.CharacterAdded:Wait()
                Player.Character.HumanoidRootPart.Anchored = false
                if Player.Character.Humanoid.Health <= 15 then
                    notify("无言脚本", "成功", 4)
                    repeat
                        wait()
                    until LocalPlayer.Character.PrimaryPart ~= nil
                    wait(0.4)
                    LocalPlayer.Character:SetPrimaryPartCFrame(previous)
                end
            end)
        end
    end
    print("btn3");
end)win8:NewButton("斧头带人", function()
    Target = bai.playernamedied
    local tool = getTool()
    if not tool then
        return notify("无言脚本", "你需要斧头", 4)
    end

    NOW = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame

    game.Players.LocalPlayer.Character.Humanoid.Name = 1
    local l = game.Players.LocalPlayer.Character["1"]:Clone()
    l.Parent = game.Players.LocalPlayer.Character
    l.Name = "Humanoid"

    wait(0.1)
    game.Players.LocalPlayer.Character["1"]:Destroy()
    game.Workspace.CurrentCamera.CameraSubject = game.Players.LocalPlayer.Character
    game.Players.LocalPlayer.Character.Animate.Disabled = true
    wait(1.1)
    game.Players.LocalPlayer.Character.Animate.Disabled = false
    game.Players.LocalPlayer.Character.Humanoid.DisplayDistanceType = "None"
    for i, v in pairs(game:GetService 'Players'.LocalPlayer.Backpack:GetChildren()) do
        if v.Name:sub(1, 4) == "Tool" then
            game.Players.LocalPlayer.Character.Humanoid:EquipTool(v)
        end
    end
    local function tp(player, player2)
        local char1, char2 = player.Character, player2.Character
        if char1 and char2 then
            char1.HumanoidRootPart.CFrame = char2.HumanoidRootPart.CFrame
        end
    end
    local function getout(player, player2)
        local char1, char2 = player.Character, player2.Character
        if char1 and char2 then
            char1:MoveTo(char2.Head.Position)
        end
    end
    tp(game.Players[Target], game.Players.LocalPlayer)
    wait(0.1)
    tp(game.Players[Target], game.Players.LocalPlayer)
    wait(0.3)
    tp(game.Players[Target], game.Players.LocalPlayer)
    wait(0.3)
    fori = 1, 60
    do
        getout(game.Players.LocalPlayer, game.Players[Target])

        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = NOW
        task.wait(.1)
    end
    print("btn3");
end)win8:NewButton("岩浆杀人", function()
    local tool = getTool()
    if not tool then
        return notify("无言脚本", "你需要斧头", 4)
    end

    Target = bai.playernamedied
    NOW = CFrame.new(-1685, 200, 1216)

    game.Players.LocalPlayer.Character.Humanoid.Name = 1
    local l = game.Players.LocalPlayer.Character["1"]:Clone()
    l.Parent = game.Players.LocalPlayer.Character
    l.Name = "Humanoid"

    wait(0.1)
    game.Players.LocalPlayer.Character["1"]:Destroy()
    game.Workspace.CurrentCamera.CameraSubject = game.Players.LocalPlayer.Character
    game.Players.LocalPlayer.Character.Animate.Disabled = true
    wait(1.1)
    game.Players.LocalPlayer.Character.Animate.Disabled = false
    game.Players.LocalPlayer.Character.Humanoid.DisplayDistanceType = "None"
    for i, v in pairs(game:GetService 'Players'.LocalPlayer.Backpack:GetChildren()) do
        if v.Name:sub(1, 4) == "Tool" then
            game.Players.LocalPlayer.Character.Humanoid:EquipTool(v)
        end
    end
    local function tp(player, player2)
        local char1, char2 = player.Character, player2.Character
        if char1 and char2 then
            char1.HumanoidRootPart.CFrame = char2.HumanoidRootPart.CFrame
        end
    end
    local function getout(player, player2)
        local char1, char2 = player.Character, player2.Character
        if char1 and char2 then
            char1:MoveTo(char2.Head.Position)
        end
    end
    wait(0.1)
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = NOW
    tp(game.Players[Target], game.Players.LocalPlayer)
    wait(0.1)
    tp(game.Players[Target], game.Players.LocalPlayer)
    wait(0.3)
    tp(game.Players[Target], game.Players.LocalPlayer)
    fori = 1, 20
    do
        getout(game.Players.LocalPlayer, game.Players[Target])

        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = NOW
    end
    print("btn3");
end)

