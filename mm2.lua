-- ===========================================================================
-- PUTIN HUB (Murder Mystery 2 Edition) - ЧАСТЬ 1 ИЗ 2
-- Инициализация интерфейса, глобальных таблиц и тем оформления
-- ===========================================================================

local Players = game:GetService("Players")
local CoreGui = game:GetService("CoreGui")
local UserInputService = game:GetService("UserInputService")
local LocalPlayer = Players.LocalPlayer

if CoreGui:FindFirstChild("PutinHub") then
    CoreGui.PutinHub:Destroy()
end

local PutinHub = Instance.new("ScreenGui")
PutinHub.Name = "PutinHub"
PutinHub.Parent = CoreGui
PutinHub.ResetOnSpawn = false

local MainFrame = Instance.new("Frame")
MainFrame.Name = "MainFrame"
MainFrame.Size = UDim2.new(0, 540, 0, 310)
MainFrame.Position = UDim2.new(0.5, -270, 0.5, -155)
MainFrame.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
MainFrame.Active = true
MainFrame.Draggable = true 
MainFrame.Parent = PutinHub

local MainCorner = Instance.new("UICorner")
MainCorner.CornerRadius = UDim.new(0, 9)
MainCorner.Parent = MainFrame

local MainStroke = Instance.new("UIStroke")
MainStroke.Thickness = 1.5
MainStroke.Color = Color3.fromRGB(34, 197, 94)
MainStroke.Parent = MainFrame

local Sidebar = Instance.new("Frame")
Sidebar.Name = "Sidebar"
Sidebar.Size = UDim2.new(0, 125, 1, 0)
Sidebar.BackgroundColor3 = Color3.fromRGB(14, 14, 14)
Sidebar.Parent = MainFrame

local SidebarCorner = Instance.new("UICorner")
SidebarCorner.CornerRadius = UDim.new(0, 9)
SidebarCorner.Parent = Sidebar

local SidebarFix = Instance.new("Frame")
SidebarFix.Size = UDim2.new(0, 12, 1, 0)
SidebarFix.Position = UDim2.new(1, -12, 0, 0)
SidebarFix.BackgroundColor3 = Color3.fromRGB(14, 14, 14)
SidebarFix.BorderSizePixel = 0
SidebarFix.Parent = Sidebar

local SidebarList = Instance.new("UIListLayout")
SidebarList.Padding = UDim.new(0, 6)
SidebarList.SortOrder = Enum.SortOrder.LayoutOrder
SidebarList.Parent = Sidebar

local SidebarPadding = Instance.new("UIPadding")
SidebarPadding.PaddingTop = UDim.new(0, 42)
SidebarPadding.PaddingLeft = UDim.new(0, 8)
SidebarPadding.PaddingRight = UDim.new(0, 8)
SidebarPadding.Parent = Sidebar

local HubTitle = Instance.new("TextLabel")
HubTitle.Size = UDim2.new(1, 0, 0, 30)
HubTitle.Position = UDim2.new(0, 0, 0, 6)
HubTitle.BackgroundTransparency = 1
HubTitle.Text = "PUTIN HUB"
HubTitle.Font = Enum.Font.GothamBold
HubTitle.TextColor3 = Color3.fromRGB(255, 255, 255)
HubTitle.TextSize = 13
HubTitle.Parent = MainFrame

local Container = Instance.new("Frame")
Container.Name = "Container"
Container.Size = UDim2.new(1, -135, 1, -45)
Container.Position = UDim2.new(0, 130, 0, 38)
Container.BackgroundTransparency = 1
Container.Parent = MainFrame

local CloseButton = Instance.new("TextButton")
CloseButton.Name = "CloseButton"
CloseButton.Size = UDim2.new(0, 24, 0, 24)
CloseButton.Position = UDim2.new(1, -30, 0, 8)
CloseButton.BackgroundColor3 = Color3.fromRGB(28, 28, 28)
CloseButton.Text = "×"
CloseButton.Font = Enum.Font.GothamBold
CloseButton.TextColor3 = Color3.fromRGB(239, 68, 68)
CloseButton.TextSize = 16
CloseButton.Parent = MainFrame

local CloseCorner = Instance.new("UICorner")
CloseCorner.CornerRadius = UDim.new(0, 5)
CloseCorner.Parent = CloseButton

local ToggleButton = Instance.new("TextButton")
ToggleButton.Name = "ToggleButton"
ToggleButton.Size = UDim2.new(0, 44, 0, 44)
ToggleButton.Position = UDim2.new(0, 15, 0, 15)
ToggleButton.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
ToggleButton.Text = "P"
ToggleButton.Font = Enum.Font.GothamBold
ToggleButton.TextColor3 = Color3.fromRGB(255, 255, 255)
ToggleButton.TextSize = 18
ToggleButton.ZIndex = 10
ToggleButton.Parent = PutinHub

local ToggleCorner = Instance.new("UICorner")
ToggleCorner.CornerRadius = UDim.new(0, 22)
ToggleCorner.Parent = ToggleButton

local ToggleStroke = Instance.new("UIStroke")
ToggleStroke.Thickness = 1.5
ToggleStroke.Color = Color3.fromRGB(34, 197, 94)
ToggleStroke.Parent = ToggleButton

-- Экспорт в глобальное окружение для связи с Частью 2
_G.PutinHubEnv = {
    pages = {},
    tabButtons = {},
    themeStrokes = {},
    currentThemeName = "Green",
    currentActiveTab = "Main",
    Container = Container,
    Sidebar = Sidebar,
    MainStroke = MainStroke,
    ToggleStroke = ToggleStroke,
    MainFrame = MainFrame,
    PutinHub = PutinHub,
    CloseButton = CloseButton,
    ToggleButton = ToggleButton
}

local env = _G.PutinHubEnv
local themes = {
    White = Color3.fromRGB(240, 240, 240),
    Black = Color3.fromRGB(35, 35, 35),
    Green = Color3.fromRGB(34, 197, 94),
    Blue = Color3.fromRGB(30, 90, 220),
    Orange = Color3.fromRGB(234, 88, 12),
    Purple = Color3.fromRGB(130, 40, 210),
    Kazakhstan = Color3.fromRGB(0, 155, 210)
}

function env.updateTheme(themeKey)
    local color = themes[themeKey] or themes.Green
    env.MainStroke.Color = color
    env.ToggleStroke.Color = color
    for name, stroke in pairs(env.themeStrokes) do
        if name == themeKey then
            stroke.Enabled = true; stroke.Color = color; stroke.Thickness = 2
        else
            stroke.Enabled = false
        end
    end
    for tName, btn in pairs(env.tabButtons) do
        btn.TextColor3 = (tName == env.currentActiveTab) and color or Color3.fromRGB(150, 150, 150)
    end
end

function env.switchTab(tabName)
    env.currentActiveTab = tabName
    for pName, page in pairs(env.pages) do
        page.Visible = (pName == tabName)
    end
    env.updateTheme(env.currentThemeName)
end

function env.createTab(name, layoutOrder)
    local tabBtn = Instance.new("TextButton")
    tabBtn.Name = name .. "TabBtn"; tabBtn.Size = UDim2.new(1, 0, 0, 32); tabBtn.BackgroundTransparency = 1
    tabBtn.Text = name; tabBtn.Font = Enum.Font.GothamBold; tabBtn.TextSize = 13
    tabBtn.TextColor3 = Color3.fromRGB(150, 150, 150); tabBtn.LayoutOrder = layoutOrder; tabBtn.Parent = env.Sidebar
    env.tabButtons[name] = tabBtn

    local page = Instance.new("ScrollingFrame")
    page.Name = name .. "Page"; page.Size = UDim2.new(1, 0, 1, 0); page.BackgroundTransparency = 1
    page.Visible = false; page.ScrollBarThickness = 2; page.CanvasSize = UDim2.new(0, 0, 0, 0); page.Parent = env.Container
    env.pages[name] = page

    tabBtn.MouseButton1Click:Connect(function() env.switchTab(name) end)
    page.ChildAdded:Connect(function()
        task.wait(0.05)
        local list = page:FindFirstChildOfClass("UIListLayout")
        if list then page.CanvasSize = UDim2.new(0, 0, 0, list.AbsoluteContentSize.Y + 25) end
    end)
end

env.createTab("Main", 1); env.createTab("Player", 2); env.createTab("AutoFarm", 3); env.createTab("Theme", 4); env.createTab("Info", 5)

local ThemePage = env.pages["Theme"]
local ThemeGrid = Instance.new("UIGridLayout")
ThemeGrid.CellSize = UDim2.new(0, 72, 0, 80); ThemeGrid.CellPadding = UDim2.new(0, 12, 0, 12)
ThemeGrid.HorizontalAlignment = Enum.HorizontalAlignment.Center; ThemeGrid.VerticalAlignment = Enum.VerticalAlignment.Center; ThemeGrid.Parent = ThemePage

local function createThemeBlock(themeKey, blockColor, displayName)
    local blockFrame = Instance.new("Frame")
    blockFrame.BackgroundTransparency = 1; blockFrame.ZIndex = 3; blockFrame.Parent = ThemePage
    local colorBtn = Instance.new("TextButton")
    colorBtn.Size = UDim2.new(1, 0, 0, 46); colorBtn.BackgroundColor3 = blockColor; colorBtn.Text = ""; colorBtn.Parent = blockFrame
    local btnCorner = Instance.new("UICorner")
    btnCorner.CornerRadius = UDim.new(0, 8); btnCorner.Parent = colorBtn
    local btnStroke = Instance.new("UIStroke")
    btnStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border; btnStroke.Enabled = false; btnStroke.Parent = colorBtn
    env.themeStrokes[themeKey] = btnStroke
    local nameLabel = Instance.new("TextLabel")
    nameLabel.Size = UDim2.new(1, 0, 0, 25); nameLabel.Position = UDim2.new(0, 0, 0, 50); nameLabel.BackgroundTransparency = 1
    nameLabel.Text = displayName; nameLabel.Font = Enum.Font.GothamBold; nameLabel.TextSize = 11; nameLabel.ZIndex = 3; nameLabel.Parent = blockFrame
    colorBtn.MouseButton1Click:Connect(function()
        env.currentThemeName = themeKey; env.updateTheme(themeKey); env.switchTab(env.currentActiveTab)
    end)
end
createThemeBlock("White", Color3.fromRGB(240, 240, 240), "White"); createThemeBlock("Black", Color3.fromRGB(35, 35, 35), "Black")
createThemeBlock("Green", Color3.fromRGB(34, 197, 94), "Green"); createThemeBlock("Blue", Color3.fromRGB(30, 90, 220), "Blue")
createThemeBlock("Orange", Color3.fromRGB(234, 88, 12), "Orange"); createThemeBlock("Purple", Color3.fromRGB(130, 40, 210), "Purple")
createThemeBlock("Kazakhstan", Color3.fromRGB(0, 155, 210), "Kazakh")
-- ===========================================================================
-- PUTIN HUB (Murder Mystery 2 Edition) - ЧАСТЬ 2 ИЗ 2
-- Функциональные модули: Умный ESP, Бегунки кастомизации физики и циклы
-- ===========================================================================

local env = _G.PutinHubEnv
if not env then return warn("Ошибка: Запусти сначала ЧАСТЬ 1!") end

local Players = game:GetService("Players")
local CoreGui = game:GetService("CoreGui")
local UserInputService = game:GetService("UserInputService")
local LocalPlayer = Players.LocalPlayer

local function createSectionHeader(page, text, layoutOrder)
    local header = Instance.new("TextLabel")
    header.Size = UDim2.new(1, 0, 0, 20); header.BackgroundTransparency = 1; header.Text = text:upper()
    header.Font = Enum.Font.GothamBold; header.TextSize = 15; header.TextColor3 = Color3.fromRGB(240, 240, 240)
    header.TextXAlignment = Enum.TextXAlignment.Left; header.LayoutOrder = layoutOrder; header.ZIndex = 3; header.Parent = page
end

-- НАПОЛНЕНИЕ ВКЛАДКИ MAIN (Visuals)
local MainPage = env.pages["Main"]
local MainList = Instance.new("UIListLayout")
MainList.Padding = UDim.new(0, 12); MainList.SortOrder = Enum.SortOrder.LayoutOrder; MainList.Parent = MainPage
local MainPadding = Instance.new("UIPadding")
MainPadding.PaddingLeft = UDim.new(0, 15); MainPadding.PaddingTop = UDim.new(0, 12); MainPadding.Parent = MainPage

createSectionHeader(MainPage, "Visuals", 1)
local espToggleFrame = Instance.new("Frame")
espToggleFrame.Size = UDim2.new(1, 0, 0, 34); espToggleFrame.BackgroundTransparency = 1; espToggleFrame.LayoutOrder = 2; espToggleFrame.Parent = MainPage
local espBtn = Instance.new("TextButton")
espBtn.Size = UDim2.new(0, 140, 1, 0); espBtn.BackgroundColor3 = Color3.fromRGB(25, 35, 25); espBtn.Text = "ESP & NAMES: OFF"
espBtn.Font = Enum.Font.GothamBold; espBtn.TextColor3 = Color3.fromRGB(239, 68, 68); espBtn.TextSize = 11; espBtn.ZIndex = 3; espBtn.Parent = espToggleFrame
local espBtnCorner = Instance.new("UICorner")
espBtnCorner.CornerRadius = UDim.new(0, 6); espBtnCorner.Parent = espBtn
local espStroke = Instance.new("UIStroke")
espStroke.Color = Color3.fromRGB(239, 68, 68); espStroke.Thickness = 1; espStroke.Parent = espBtn

-- НАПОЛНЕНИЕ ВКЛАДКИ PLAYER (Sliders)
local PlayerPage = env.pages["Player"]
local PlayerList = Instance.new("UIListLayout")
PlayerList.Padding = UDim.new(0, 12); PlayerList.SortOrder = Enum.SortOrder.LayoutOrder; PlayerList.Parent = PlayerPage
local PlayerPadding = Instance.new("UIPadding")
PlayerPadding.PaddingLeft = UDim.new(0, 15); PlayerPadding.PaddingTop = UDim.new(0, 12); PlayerPadding.Parent = PlayerPage

createSectionHeader(PlayerPage, "Movement", 1)
local currentWalkSpeed, currentJumpPower = 16, 50

local function createSlider(text, min, max, default, step, layoutOrder)
    local sliderFrame = Instance.new("Frame")
    sliderFrame.Size = UDim2.new(1, 0, 0, 45); sliderFrame.BackgroundTransparency = 1; sliderFrame.LayoutOrder = layoutOrder; sliderFrame.Parent = PlayerPage
    local title = Instance.new("TextLabel")
    title.Size = UDim2.new(1, 0, 0, 18); title.BackgroundTransparency = 1; title.Text = text .. ": " .. tostring(default)
    title.Font = Enum.Font.GothamBold; title.TextSize = 13; title.TextColor3 = Color3.fromRGB(180, 180, 180); title.TextXAlignment = Enum.TextXAlignment.Left; title.Parent = sliderFrame
    local track = Instance.new("TextButton")
    track.Size = UDim2.new(1, 0, 0, 6); track.Position = UDim2.new(0, 0, 0, 25); track.BackgroundColor3 = Color3.fromRGB(35, 45, 35); track.Text = ""; track.AutoButtonColor = false; track.Parent = sliderFrame
    local trackCorner = Instance.new("UICorner")
    trackCorner.CornerRadius = UDim.new(0, 3); trackCorner.Parent = track
    local fill = Instance.new("Frame")
    fill.Size = UDim2.new((default - min) / (max - min), 0, 1, 0); fill.BackgroundColor3 = Color3.fromRGB(34, 197, 94); fill.BorderSizePixel = 0; fill.Parent = track
    local fillCorner = Instance.new("UICorner")
    fillCorner.CornerRadius = UDim.new(0, 3); fillCorner.Parent = fill

    local holding = false
    local function updateSlider(input)
        local pos = math.clamp((input.Position.X - track.AbsolutePosition.X) / track.AbsoluteSize.X, 0, 1)
        local value = math.clamp(math.floor((min + (max - min) * pos) / step + 0.5) * step, min, max)
        fill.Size = UDim2.new((value - min) / (max - min), 0, 1, 0); title.Text = text .. ": " .. tostring(value)
        if text == "WalkSpeed" then currentWalkSpeed = value elseif text == "JumpPower" then currentJumpPower = value end
    end
    track.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then holding = true; updateSlider(input) end
    end)
    UserInputService.InputChanged:Connect(function(input)
        if holding and (input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch) then updateSlider(input) end
    end)
    UserInputService.InputEnded:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then holding = false end
    end)
end
createSlider("WalkSpeed", 0, 50, 16, 0.5, 2)
createSlider("JumpPower", 0, 200, 50, 1, 3)

-- ЛОГИКА ESP И СИСТЕМНЫХ ПОТОКОВ
local espEnabled, originalSheriff = false, nil
local espFolder = Instance.new("Folder", CoreGui)
espFolder.Name = "PutinHub_ESP"

espBtn.MouseButton1Click:Connect(function()
    espEnabled = not espEnabled
    if espEnabled then
        espBtn.Text = "ESP & NAMES: ON"; espBtn.TextColor3 = Color3.fromRGB(74, 222, 128); espStroke.Color = Color3.fromRGB(34, 197, 94)
    else
        espBtn.Text = "ESP & NAMES: OFF"; espBtn.TextColor3 = Color3.fromRGB(239, 68, 68); espStroke.Color = Color3.fromRGB(239, 68, 68)
        espFolder:ClearAllChildren(); originalSheriff = nil
    end
end)

task.spawn(function()
    while task.wait(0.1) do
        pcall(function()
            if LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("Humanoid") then
                local hum = LocalPlayer.Character.Humanoid
                if hum.WalkSpeed ~= currentWalkSpeed then hum.WalkSpeed = currentWalkSpeed end
                if hum.JumpPower ~= currentJumpPower then hum.UseJumpPower = true; hum.JumpPower = currentJumpPower end
            end
        end)
    end
end)

task.spawn(function()
    while task.wait(0.4) do
        if not espEnabled then continue end
        pcall(function()
            local knifeFound, gunHolders = false, {}
            for _, p in ipairs(Players:GetPlayers()) do
                if p.Character then
                    if p.Backpack:FindFirstChild("Knife") or p.Character:FindFirstChild("Knife") then knifeFound = true end
                    if p.Backpack:FindFirstChild("Gun") or p.Character:FindFirstChild("Gun") then table.insert(gunHolders, p.Name) end
                end
            end
            if not knifeFound and #gunHolders == 0 then originalSheriff = nil
            elseif #gunHolders > 0 and originalSheriff == nil then originalSheriff = gunHolders[1] end

            local currentVisuals = {}
            for _, obj in ipairs(espFolder:GetChildren()) do if obj.Adornee then currentVisuals[obj.Name] = obj end end

            for _, p in ipairs(Players:GetPlayers()) do
                if p ~= LocalPlayer and p.Character and p.Character:FindFirstChild("Head") then
                    local char = p.Character
                    local color = Color3.fromRGB(34, 197, 94)

                    if p.Backpack:FindFirstChild("Knife") or char:FindFirstChild("Knife") then color = Color3.fromRGB(239, 68, 68)
                    elseif p.Backpack:FindFirstChild("Gun") or char:FindFirstChild("Gun") then
                        color = (originalSheriff == p.Name) and Color3.fromRGB(59, 130, 246) or Color3.fromRGB(234, 179, 8)
                    end

                    local hlName, tag = p.Name .. "_HL", p.Name .. "Tag"
                    local hl = currentVisuals[hlName] or Instance.new("Highlight", espFolder)
                    hl.Name = hlName; hl.Adornee = char; hl.FillColor = color; hl.FillTransparency = 0.6; hl.OutlineColor = color; hl.OutlineTransparency = 0
                    currentVisuals[hlName] = nil

                    local bgui = currentVisuals[tag] or Instance.new("BillboardGui", espFolder)
                    bgui.Name = tag; bgui.Size = UDim2.new(0, 120, 0, 24); bgui.StudsOffset = Vector3.new(0, 2.8, 0); bgui.AlwaysOnTop = true; bgui.Adornee = char.Head
                    local lbl = bgui:FindFirstChild("TextLabel") or Instance.new("TextLabel", bgui)
                    lbl.Size = UDim2.new(1, 0, 1, 0); lbl.BackgroundTransparency = 1; lbl.Text = p.Name; lbl.Font = Enum.Font.GothamBold; lbl.TextSize = 12; lbl.TextStrokeTransparency = 0; lbl.TextColor3 = color
                    currentVisuals[tag] = nil
                end
            end
            for _, obj in pairs(currentVisuals) do obj:Destroy() end
        end)
    end
end)

-- НАПОЛНЕНИЕ ВКЛАДКИ INFO И ОКНА ЗАКРЫТИЯ
local InfoPage = env.pages["Info"]
local InfoList = Instance.new("UIListLayout")
InfoList.Padding = UDim.new(0, 4); InfoList.SortOrder = Enum.SortOrder.LayoutOrder; InfoList.Parent = InfoPage
local InfoPadding = Instance.new("UIPadding")
InfoPadding.PaddingLeft = UDim.new(0, 15); InfoPadding.PaddingTop = UDim.new(0, 10); InfoPadding.Parent = InfoPage

local function createInfoLine(text, layoutOrder, isHeader)
    local label = Instance.new("TextLabel")
    label.Size = UDim2.new(1, -20, 0, isHeader and 22 or 16); label.BackgroundTransparency = 1; label.Text = text
    label.TextSize = isHeader and 15 or 13; label.Font = isHeader and Enum.Font.GothamBold or Enum.Font.Gotham; label.TextXAlignment = Enum.TextXAlignment.Left; label.LayoutOrder = layoutOrder; label.Parent = InfoPage
end
createInfoLine("📋 СВЕДЕНИЯ О СКРИПТЕ", 1, true); createInfoLine("• Версия: 3.9.1 (Kazakhstan Edition)", 2)
createInfoLine("• Created by: PavelDurak", 3); createInfoLine("• Telegram: @vamatuk", 4); createInfoLine("• Discord: pavel_durak", 5)

local ConfirmFrame = Instance.new("Frame")
ConfirmFrame.Size = UDim2.new(0, 260, 0, 120); ConfirmFrame.Position = UDim2.new(0.5, -130, 0.5, -60); ConfirmFrame.BackgroundColor3 = Color3.fromRGB(22, 33, 22); ConfirmFrame.Visible = false; ConfirmFrame.Active = true; ConfirmFrame.Draggable = true; ConfirmFrame.Parent = env.PutinHub
local ConfirmCorner = Instance.new("UICorner", ConfirmFrame)
ConfirmCorner.CornerRadius = UDim.new(0, 8)
local ConfirmStroke = Instance.new("UIStroke", ConfirmFrame)
ConfirmStroke.Color = Color3.fromRGB(239, 68, 68); ConfirmStroke.Thickness = 1.5
local ConfirmLabel = Instance.new("TextLabel", ConfirmFrame)
ConfirmLabel.Size = UDim2.new(1, -20, 0, 40); ConfirmLabel.Position = UDim2.new(0, 10, 0, 15); ConfirmLabel.BackgroundTransparency = 1; ConfirmLabel.Text = "Закрыть Hub?"; ConfirmLabel.TextColor3 = Color3.fromRGB(255, 255, 255); ConfirmLabel.TextSize = 16; ConfirmLabel.Font = Enum.Font.GothamBold
local YesButton = Instance.new("TextButton", ConfirmFrame)
YesButton.Size = UDim2.new(0, 100, 0, 32); YesButton.Position = UDim2.new(0, 20, 1, -45); YesButton.BackgroundColor3 = Color3.fromRGB(185, 28, 28); YesButton.Text = "Да, закрыть"; YesButton.TextColor3 = Color3.fromRGB(255, 255, 255); YesButton.Font = Enum.Font.GothamBold
local YesCorner = Instance.new("UICorner", YesButton)
YesCorner.CornerRadius = UDim.new(0, 6)
local NoButton = Instance.new("TextButton", ConfirmFrame)
NoButton.Size = UDim2.new(0, 100, 0, 32); NoButton.Position = UDim2.new(1, -120, 1, -45); NoButton.BackgroundColor3 = Color3.fromRGB(40, 60, 40); NoButton.Text = "Отмена"; NoButton.TextColor3 = Color3.fromRGB(74, 222, 128); NoButton.Font = Enum.Font.GothamBold
local NoCorner = Instance.new("UICorner", NoButton)
NoCorner.CornerRadius = UDim.new(0, 6)

env.CloseButton.MouseButton1Click:Connect(function() ConfirmFrame.Visible = true end)
YesButton.MouseButton1Click:Connect(function() espFolder:Destroy(); env.PutinHub:Destroy(); _G.PutinHubEnv = nil end)
NoButton.MouseButton1Click:Connect(function() ConfirmFrame.Visible = false end)
env.ToggleButton.MouseButton1Click:Connect(function() env.MainFrame.Visible = not env.MainFrame.Visible end)

env.updateTheme("Green")
env.switchTab("Main")
