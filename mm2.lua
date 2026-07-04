-- ===========================================================================
-- PUTIN HUB (Murder Mystery 2 Edition) - ЧАСТЬ 1 из 3
-- Оптимизировано под мобильные устройства (Nothing Phone 3a)
-- ===========================================================================

local Players = game:GetService("Players")
local CoreGui = game:GetService("CoreGui")
local TweenService = game:GetService("TweenService")
local UserInputService = game:GetService("UserInputService")
local LocalPlayer = Players.LocalPlayer

-- Защита от дублирования скрипта
if CoreGui:FindFirstChild("PutinHub") then
    CoreGui.PutinHub:Destroy()
end

-- Создание главного контейнера интерфейса
local PutinHub = Instance.new("ScreenGui")
PutinHub.Name = "PutinHub"
PutinHub.Parent = CoreGui
PutinHub.ResetOnSpawn = false

-- Главное окно Хаба
local MainFrame = Instance.new("Frame")
MainFrame.Name = "MainFrame"
MainFrame.Size = UDim2.new(0, 540, 0, 310)
MainFrame.Position = UDim2.new(0.5, -270, 0.5, -155)
MainFrame.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
MainFrame.Active = true
MainFrame.Draggable = true -- Удобное перетаскивание на сенсорном экране
MainFrame.Parent = PutinHub

local MainCorner = Instance.new("UICorner")
MainCorner.CornerRadius = UDim.new(0, 9)
MainCorner.Parent = MainFrame

local MainStroke = Instance.new("UIStroke")
MainStroke.Thickness = 1.5
MainStroke.Color = Color3.fromRGB(34, 197, 94)
MainStroke.Parent = MainFrame

-- Боковая панель навигации (Сайдбар)
local Sidebar = Instance.new("Frame")
Sidebar.Name = "Sidebar"
Sidebar.Size = UDim2.new(0, 125, 1, 0)
Sidebar.BackgroundColor3 = Color3.fromRGB(14, 14, 14)
Sidebar.Parent = MainFrame

local SidebarCorner = Instance.new("UICorner")
SidebarCorner.CornerRadius = UDim.new(0, 9)
SidebarCorner.Parent = Sidebar

-- Скрытие правых углов сайдбара для плавного стыка
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

-- Логотип / Название хаба
local HubTitle = Instance.new("TextLabel")
HubTitle.Size = UDim2.new(1, 0, 0, 30)
HubTitle.Position = UDim2.new(0, 0, 0, 6)
HubTitle.BackgroundTransparency = 1
HubTitle.Text = "PUTIN HUB"
HubTitle.Font = Enum.Font.GothamBold
HubTitle.TextColor3 = Color3.fromRGB(255, 255, 255)
HubTitle.TextSize = 13
HubTitle.Parent = MainFrame

-- Контейнер для динамических страниц вкладок
local Container = Instance.new("Frame")
Container.Name = "Container"
Container.Size = UDim2.new(1, -135, 1, -45)
Container.Position = UDim2.new(0, 130, 0, 38)
Container.BackgroundTransparency = 1
Container.Parent = MainFrame

-- Кнопка быстрого закрытия меню (Крестик)
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

-- Плавающая кнопка свертывания интерфейса на мобилках
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

-- Глобальные таблицы состояний для остальных частей
local pages = {}
local tabButtons = {}
local themeStrokes = {}
local currentThemeName = "Green"
local currentActiveTab = "Main"
-- ===========================================================================
-- PUTIN HUB (Murder Mystery 2 Edition) - ЧАСТЬ 2 из 3
-- Управление визуальными темами хаба и создание адаптивного скроллинга
-- ===========================================================================

local themes = {
    White = Color3.fromRGB(240, 240, 240),
    Black = Color3.fromRGB(35, 35, 35),
    Green = Color3.fromRGB(34, 197, 94),
    Blue = Color3.fromRGB(30, 90, 220),
    Orange = Color3.fromRGB(234, 88, 12),
    Purple = Color3.fromRGB(130, 40, 210),
    Kazakhstan = Color3.fromRGB(0, 155, 210)
}

-- Обновление цветовой схемы всего хаба
local function updateTheme(themeKey)
    local color = themes[themeKey] or themes.Green
    MainStroke.Color = color
    ToggleStroke.Color = color
    
    for name, stroke in pairs(themeStrokes) do
        if name == themeKey then
            stroke.Enabled = true
            stroke.Color = color
            stroke.Thickness = 2
        else
            stroke.Enabled = false
        end
    end

    for tName, btn in pairs(tabButtons) do
        if tName == currentActiveTab then
            btn.TextColor3 = color
        else
            btn.TextColor3 = Color3.fromRGB(150, 150, 150)
        end
    end
end

-- Переключение активной вкладки
local function switchTab(tabName)
    currentActiveTab = tabName
    for pName, page in pairs(pages) do
        if pName == tabName then
            page.Visible = true
        else
            page.Visible = false
        end
    end
    updateTheme(currentThemeName)
end

-- Конструктор страниц с автоматической настройкой CanvasSize под телефоны
local function createTab(name, layoutOrder)
    local tabBtn = Instance.new("TextButton")
    tabBtn.Name = name .. "TabBtn"
    tabBtn.Size = UDim2.new(1, 0, 0, 32)
    tabBtn.BackgroundTransparency = 1
    tabBtn.Text = name
    tabBtn.Font = Enum.Font.GothamBold
    tabBtn.TextSize = 13
    tabBtn.TextColor3 = Color3.fromRGB(150, 150, 150)
    tabBtn.LayoutOrder = layoutOrder
    tabBtn.Parent = Sidebar

    tabButtons[name] = tabBtn

    local page = Instance.new("ScrollingFrame")
    page.Name = name .. "Page"
    page.Size = UDim2.new(1, 0, 1, 0)
    page.BackgroundTransparency = 1
    page.Visible = false
    page.ScrollBarThickness = 2
    page.CanvasSize = UDim2.new(0, 0, 0, 0)
    page.Parent = Container

    pages[name] = page

    tabBtn.MouseButton1Click:Connect(function()
        switchTab(name)
    end)
    
    -- Динамический пересчет высоты контента, чтобы скролл на Nothing Phone работал идеально
    page.ChildAdded:Connect(function()
        task.wait(0.05)
        local list = page:FindFirstChildOfClass("UIListLayout")
        if list then
            page.CanvasSize = UDim2.new(0, 0, 0, list.AbsoluteContentSize.Y + 25)
        end
    end)
end
-- ===========================================================================
-- PUTIN HUB (Murder Mystery 2 Edition) - ЧАСТЬ 3 из 3
-- Наполнение вкладок, фикс логики поднятого пистолета, цветные Ники и ESP
-- ===========================================================================

-- Создаём структуру вкладок
createTab("Main", 1)
createTab("Player", 2)
createTab("AutoFarm", 3)
createTab("Theme", 4)
createTab("Info", 5)

-- Хелпер для создания заголовков разделов (Movement, Visuals)
local function createSectionHeader(page, text, layoutOrder)
    local header = Instance.new("TextLabel")
    header.Name = "Header_" .. text
    header.Size = UDim2.new(1, 0, 0, 20)
    header.BackgroundTransparency = 1
    header.Text = text:upper()
    header.Font = Enum.Font.GothamBold
    header.TextSize = 15
    header.TextColor3 = Color3.fromRGB(240, 240, 240)
    header.TextXAlignment = Enum.TextXAlignment.Left
    header.LayoutOrder = layoutOrder
    header.ZIndex = 3
    header.Parent = page
end

---------------------------------------------------------------------------
-- НАСТРОЙКА ВКЛАДКИ MAIN (Умный ESP и Ники для MM2)
---------------------------------------------------------------------------
local MainPage = pages["Main"]

local MainList = Instance.new("UIListLayout")
MainList.Padding = UDim.new(0, 12)
MainList.SortOrder = Enum.SortOrder.LayoutOrder
MainList.Parent = MainPage

local MainPadding = Instance.new("UIPadding")
MainPadding.PaddingLeft = UDim.new(0, 15)
MainPadding.PaddingTop = UDim.new(0, 12)
MainPadding.PaddingRight = UDim.new(0, 15)
MainPadding.Parent = MainPage

createSectionHeader(MainPage, "Visuals", 1)

local espToggleFrame = Instance.new("Frame")
espToggleFrame.Name = "EspToggleFrame"
espToggleFrame.Size = UDim2.new(1, 0, 0, 34)
espToggleFrame.BackgroundTransparency = 1
espToggleFrame.LayoutOrder = 2
espToggleFrame.Parent = MainPage

local espBtn = Instance.new("TextButton")
espBtn.Name = "EspToggleBtn"
espBtn.Size = UDim2.new(0, 140, 1, 0)
espBtn.BackgroundColor3 = Color3.fromRGB(25, 35, 25)
espBtn.Text = "ESP & NAMES: OFF"
espBtn.Font = Enum.Font.GothamBold
espBtn.TextColor3 = Color3.fromRGB(239, 68, 68)
espBtn.TextSize = 11
espBtn.ZIndex = 3
espBtn.Parent = espToggleFrame

local espBtnCorner = Instance.new("UICorner")
espBtnCorner.CornerRadius = UDim.new(0, 6)
espBtnCorner.Parent = espBtn

local espStroke = Instance.new("UIStroke")
espStroke.Color = Color3.fromRGB(239, 68, 68)
espStroke.Thickness = 1
espStroke.Parent = espBtn

---------------------------------------------------------------------------
-- НАСТРОЙКА ВКЛАДКИ PLAYER (Слайдеры движения)
---------------------------------------------------------------------------
local PlayerPage = pages["Player"]

local PlayerList = Instance.new("UIListLayout")
PlayerList.Padding = UDim.new(0, 12)
PlayerList.SortOrder = Enum.SortOrder.LayoutOrder
PlayerList.Parent = PlayerPage

local PlayerPadding = Instance.new("UIPadding")
PlayerPadding.PaddingLeft = UDim.new(0, 15)
PlayerPadding.PaddingTop = UDim.new(0, 12)
PlayerPadding.PaddingRight = UDim.new(0, 15)
PlayerPadding.Parent = PlayerPage

createSectionHeader(PlayerPage, "Movement", 1)

local currentWalkSpeed = 16
local currentJumpPower = 50

local function createSlider(text, min, max, default, step, layoutOrder)
    local sliderFrame = Instance.new("Frame")
    sliderFrame.Name = text .. "SliderFrame"
    sliderFrame.Size = UDim2.new(1, 0, 0, 45)
    sliderFrame.BackgroundTransparency = 1
    sliderFrame.LayoutOrder = layoutOrder
    sliderFrame.Parent = PlayerPage

    local title = Instance.new("TextLabel")
    title.Name = "SliderTitle"
    title.Size = UDim2.new(1, 0, 0, 18)
    title.BackgroundTransparency = 1
    title.Text = text .. ": " .. tostring(default)
    title.Font = Enum.Font.GothamBold
    title.TextSize = 13
    title.TextColor3 = Color3.fromRGB(180, 180, 180)
    title.TextXAlignment = Enum.TextXAlignment.Left
    title.ZIndex = 3
    title.Parent = sliderFrame

    local track = Instance.new("TextButton")
    track.Name = "SliderTrack"
    track.Size = UDim2.new(1, 0, 0, 6)
    track.Position = UDim2.new(0, 0, 0, 25)
    track.BackgroundColor3 = Color3.fromRGB(35, 45, 35)
    track.Text = ""
    track.AutoButtonColor = false
    track.ZIndex = 3
    track.Parent = sliderFrame
    
    local trackCorner = Instance.new("UICorner")
    trackCorner.CornerRadius = UDim.new(0, 3)
    trackCorner.Parent = track

    local fill = Instance.new("Frame")
    fill.Name = "SliderFill"
    fill.Size = UDim2.new((default - min) / (max - min), 0, 1, 0)
    fill.BackgroundColor3 = Color3.fromRGB(34, 197, 94)
    fill.BorderSizePixel = 0
    fill.ZIndex = 4
    fill.Parent = track
    
    local fillCorner = Instance.new("UICorner")
    fillCorner.CornerRadius = UDim.new(0, 3)
    fillCorner.Parent = fill

    local holding = false

    local function updateSlider(input)
        local pos = math.clamp((input.Position.X - track.AbsolutePosition.X) / track.AbsoluteSize.X, 0, 1)
        local rawValue = min + (max - min) * pos
        local value = math.floor(rawValue / step + 0.5) * step
        value = math.clamp(value, min, max)
        
        fill.Size = UDim2.new((value - min) / (max - min), 0, 1, 0)
        title.Text = text .. ": " .. tostring(value)
        
        if text == "WalkSpeed" then currentWalkSpeed = value
        elseif text == "JumpPower" then currentJumpPower = value end
    end

    track.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
            holding = true
            updateSlider(input)
        end
    end)

    UserInputService.InputChanged:Connect(function(input)
        if holding and (input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch) then
            updateSlider(input)
        end
    end)

    UserInputService.InputEnded:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
            holding = false
        end
    end)
end

createSlider("WalkSpeed", 0, 50, 16, 0.5, 2)
createSlider("JumpPower", 0, 200, 50, 1, 3)

---------------------------------------------------------------------------
-- СИСТЕМНАЯ ЛОГИКА ОПТИМИЗИРОВАННОГО ESP И НИКОВ
---------------------------------------------------------------------------
local espEnabled = false
local espFolder = Instance.new("Folder")
espFolder.Name = "PutinHub_ESP"
espFolder.Parent = CoreGui

local originalSheriff = nil

espBtn.MouseButton1Click:Connect(function()
    espEnabled = not espEnabled
    if espEnabled then
        espBtn.Text = "ESP & NAMES: ON"
        espBtn.TextColor3 = Color3.fromRGB(74, 222, 128)
        espStroke.Color = Color3.fromRGB(34, 197, 94)
    else
        espBtn.Text = "ESP & NAMES: OFF"
        espBtn.TextColor3 = Color3.fromRGB(239, 68, 68)
        espStroke.Color = Color3.fromRGB(239, 68, 68)
        espFolder:ClearAllChildren()
        originalSheriff = nil
    end
end)

-- Вечный поток удержания WalkSpeed и JumpPower
task.spawn(function()
    while task.wait(0.1) do
        pcall(function()
            if LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("Humanoid") then
                local hum = LocalPlayer.Character.Humanoid
                if hum.WalkSpeed ~= currentWalkSpeed then hum.WalkSpeed = currentWalkSpeed end
                if hum.JumpPower ~= currentJumpPower then
                    hum.UseJumpPower = true
                    hum.JumpPower = currentJumpPower
                end
            end
        end)
    end
end)

-- Точный скан раунда MM2 + Силуэты + 3D Ники над головой
task.spawn(function()
    while task.wait(0.4) do
        if not espEnabled then continue end

        pcall(function()
            local knifeFound = false
            local gunHolders = {}

            -- Глобальный скан всех игроков для безошибочного вычисления состояния раунда
            for _, p in ipairs(Players:GetPlayers()) do
                if p.Character then
                    if p.Backpack:FindFirstChild("Knife") or p.Character:FindFirstChild("Knife") then
                        knifeFound = true
                    end
                    if p.Backpack:FindFirstChild("Gun") or p.Character:FindFirstChild("Gun") then
                        table.insert(gunHolders, p.Name)
                    end
                end
            end

            -- Логика разделения Шерифа и Героя (Фикс)
            if not knifeFound and #gunHolders == 0 then
                originalSheriff = nil
            elseif #gunHolders > 0 and originalSheriff == nil then
                originalSheriff = gunHolders[1] -- Самый первый владелец пушки — Шериф
            end

            -- Сбор кэша отрисованных визуальных объектов
            local currentVisuals = {}
            for _, obj in ipairs(espFolder:GetChildren()) do
                if (obj:IsA("Highlight") or obj:IsA("BillboardGui")) and obj.Adornee then
                    currentVisuals[obj.Name] = obj
                end
            end

            -- Отрисовка визуала
            for _, p in ipairs(Players:GetPlayers()) do
                if p ~= LocalPlayer and p.Character and p.Character:FindFirstChild("HumanoidRootPart") and p.Character:FindFirstChild("Head") then
                    local char = p.Character
                    local color = Color3.fromRGB(34, 197, 94) -- Дефолт: Выживший (Зелёный)

                    if p.Backpack:FindFirstChild("Knife") or char:FindFirstChild("Knife") then
                        color = Color3.fromRGB(239, 68, 68) -- Мардер (Красный)
                    elseif p.Backpack:FindFirstChild("Gun") or char:FindFirstChild("Gun") then
                        if originalSheriff == p.Name then
                            color = Color3.fromRGB(59, 130, 246) -- Истинный Шериф (Синий)
                        else
                            color = Color3.fromRGB(234, 179, 8) -- Герой, который подобрал ствол (Жёлтый!)
                        end
                    end

                    local hlName = p.Name .. "_HL"
                    local nameTagName = p.Name .. "Tag"

                    -- 1. Силуэт игрока (Highlight)
                    local hl = currentVisuals[hlName]
                    if not hl then
                        hl = Instance.new("Highlight")
                        hl.Name = hlName
                        hl.Adornee = char
                        hl.Parent = espFolder
                    else
                        currentVisuals[hlName] = nil
                    end
                    hl.FillColor = color
                    hl.FillTransparency = 0.6
                    hl.OutlineColor = color
                    hl.OutlineTransparency = 0

                    -- 2. Ник над головой игрока (BillboardGui NameTag)
                    local bgui = currentVisuals[nameTagName]
                    if not bgui then
                        bgui = Instance.new("BillboardGui")
                        bgui.Name = nameTagName
                        bgui.Size = UDim2.new(0, 120, 0, 24)
                        bgui.StudsOffset = Vector3.new(0, 2.8, 0)
                        bgui.AlwaysOnTop = true
                        bgui.Adornee = char.Head
                        bgui.Parent = espFolder

                        local lbl = Instance.new("TextLabel")
                        lbl.Name = "TextLabel"
                        lbl.Size = UDim2.new(1, 0, 1, 0)
                        lbl.BackgroundTransparency = 1
                        lbl.Text = p.Name
                        lbl.Font = Enum.Font.GothamBold
                        lbl.TextSize = 12
                        lbl.TextStrokeTransparency = 0
                        lbl.TextStrokeColor3 = Color3.fromRGB(0, 0, 0)
                        lbl.Parent = bgui
                    else
                        currentVisuals[nameTagName] = nil
                    end
                    bgui.TextLabel.TextColor3 = color
                end
            end

            -- Чистка памяти от вышедших или погибших игроков (Разгрузка CPU)
            for _, obj in pairs(currentVisuals) do
                obj:Destroy()
            end
        end)
    end
end)

---------------------------------------------------------------------------
-- КАСТОМИЗАЦИЯ И СИСТЕМНЫЕ ОКНА (THEME, INFO, CONFIRMATION)
---------------------------------------------------------------------------

-- Вкладка выбора тем оформления
local ThemePage = pages["Theme"]
local ThemeGrid = Instance.new("UIGridLayout")
ThemeGrid.CellSize = UDim2.new(0, 72, 0, 80)
ThemeGrid.CellPadding = UDim2.new(0, 12, 0, 12)
ThemeGrid.HorizontalAlignment = Enum.HorizontalAlignment.Center
ThemeGrid.VerticalAlignment = Enum.VerticalAlignment.Center
ThemeGrid.Parent = ThemePage

local function createThemeBlock(themeKey, blockColor, displayName)
    local blockFrame = Instance.new("Frame")
    blockFrame.Name = themeKey .. "Container"
    blockFrame.BackgroundTransparency = 1
    blockFrame.ZIndex = 3
    blockFrame.Parent = ThemePage

    local colorBtn = Instance.new("TextButton")
    colorBtn.Name = themeKey .. "Btn"
    colorBtn.Size = UDim2.new(1, 0, 0, 46)
    colorBtn.BackgroundColor3 = blockColor
    colorBtn.Text = ""
    colorBtn.AutoButtonColor = true
    colorBtn.ZIndex = 3
    colorBtn.Parent = blockFrame

    local btnCorner = Instance.new("UICorner")
    btnCorner.CornerRadius = UDim.new(0, 8)
    btnCorner.Parent = colorBtn

    local btnStroke = Instance.new("UIStroke")
    btnStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
    btnStroke.Enabled = false
    btnStroke.Parent = colorBtn
    themeStrokes[themeKey] = btnStroke

    local nameLabel = Instance.new("TextLabel")
    nameLabel.Name = themeKey .. "Label"
    nameLabel.Size = UDim2.new(1, 0, 0, 25)
    nameLabel.Position = UDim2.new(0, 0, 0, 50)
    nameLabel.BackgroundTransparency = 1
    nameLabel.Text = displayName
    nameLabel.Font = Enum.Font.GothamBold
    nameLabel.TextSize = 11
    nameLabel.ZIndex = 3
    nameLabel.Parent = blockFrame

    colorBtn.MouseButton1Click:Connect(function()
        currentThemeName = themeKey
        updateTheme(themeKey)
        switchTab(currentActiveTab)
    end)
end

createThemeBlock("White", Color3.fromRGB(240, 240, 240), "White")
createThemeBlock("Black", Color3.fromRGB(35, 35, 35), "Black")
createThemeBlock("Green", Color3.fromRGB(34, 197, 94), "Green")
createThemeBlock("Blue", Color3.fromRGB(30, 90, 220), "Blue")
createThemeBlock("Orange", Color3.fromRGB(234, 88, 12), "Orange")
createThemeBlock("Purple", Color3.fromRGB(130, 40, 210), "Purple")
createThemeBlock("Kazakhstan", Color3.fromRGB(0, 155, 210), "Kazakh")

-- Вкладка информации о создателе скрипта
local InfoPage = pages["Info"]
local InfoList = Instance.new("UIListLayout")
InfoList.Padding = UDim.new(0, 4)
InfoList.SortOrder = Enum.SortOrder.LayoutOrder
InfoList.Parent = InfoPage

local InfoPadding = Instance.new("UIPadding")
InfoPadding.PaddingLeft = UDim.new(0, 15)
InfoPadding.PaddingTop = UDim.new(0, 10)
InfoPadding.Parent = InfoPage

local function createInfoLine(text, layoutOrder, isHeader)
    local label = Instance.new("TextLabel")
    label.Name = "InfoLabel_" .. layoutOrder
    label.Size = UDim2.new(1, -20, 0, isHeader and 22 or 16)
    label.BackgroundTransparency = 1
    label.Text = text
    label.TextSize = isHeader and 15 or 13
    label.Font = isHeader and Enum.Font.GothamBold or Enum.Font.Gotham
    label.TextXAlignment = Enum.TextXAlignment.Left
    label.LayoutOrder = layoutOrder
    label.ZIndex = 3
    label.Parent = InfoPage
end

createInfoLine("📋 СВЕДЕНИЯ О СКРИПТЕ", 1, true)
createInfoLine("• Версия: 3.9.1 (Kazakhstan Edition)", 2)
createInfoLine("• Created by: PavelDurak", 3)
createInfoLine("• Telegram: @vamatuk", 4)
createInfoLine("• Discord: pavel_durak", 5)
createInfoLine("──────────────────────────────────", 6)
createInfoLine("🚀 ОТ РАЗРАБОТЧИКА", 7, true)
createInfoLine("Скрипт полностью переведён на безопасный режим.", 8)

-- Защитный оверлей выхода из чита (ConfirmFrame)
local ConfirmFrame = Instance.new("Frame")
ConfirmFrame.Name = "ConfirmFrame"
ConfirmFrame.Size = UDim2.new(0, 260, 0, 120)
ConfirmFrame.Position = UDim2.new(0.5, -130, 0.5, -60)
ConfirmFrame.BackgroundColor3 = Color3.fromRGB(22, 33, 22)
ConfirmFrame.BorderSizePixel = 0
ConfirmFrame.Visible = false
ConfirmFrame.Active = true
ConfirmFrame.Draggable = true
ConfirmFrame.ZIndex = 5
ConfirmFrame.Parent = PutinHub

local ConfirmCorner = Instance.new("UICorner")
ConfirmCorner.CornerRadius = UDim.new(0, 8)
ConfirmCorner.Parent = ConfirmFrame

local ConfirmStroke = Instance.new("UIStroke")
ConfirmStroke.Color = Color3.fromRGB(239, 68, 68)
ConfirmStroke.Thickness = 1.5
ConfirmStroke.Parent = ConfirmFrame

local ConfirmLabel = Instance.new("TextLabel")
ConfirmLabel.Name = "ConfirmLabel"
ConfirmLabel.Size = UDim2.new(1, -20, 0, 40)
ConfirmLabel.Position = UDim2.new(0, 10, 0, 15)
ConfirmLabel.BackgroundTransparency = 1
ConfirmLabel.Text = "Закрыть Hub?"
ConfirmLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
ConfirmLabel.TextSize = 16
ConfirmLabel.Font = Enum.Font.GothamBold
ConfirmLabel.TextWrapped = true
ConfirmLabel.ZIndex = 5
ConfirmLabel.Parent = ConfirmFrame

local YesButton = Instance.new("TextButton")
YesButton.Name = "YesButton"
YesButton.Size = UDim2.new(0, 100, 0, 32)
YesButton.Position = UDim2.new(0, 20, 1, -45)
YesButton.BackgroundColor3 = Color3.fromRGB(185, 28, 28)
YesButton.Text = "Да, закрыть"
YesButton.TextColor3 = Color3.fromRGB(255, 255, 255)
YesButton.TextSize = 13
YesButton.Font = Enum.Font.GothamBold
YesButton.ZIndex = 5
YesButton.Parent = ConfirmFrame

local YesCorner = Instance.new("UICorner")
YesCorner.CornerRadius = UDim.new(0, 6)
YesCorner.Parent = YesButton

local NoButton = Instance.new("TextButton")
NoButton.Name = "NoButton"
NoButton.Size = UDim2.new(0, 100, 0, 32)
NoButton.Position = UDim2.new(1, -120, 1, -45)
NoButton.BackgroundColor3 = Color3.fromRGB(40, 60, 40)
NoButton.Text = "Отмена"
NoButton.TextColor3 = Color3.fromRGB(74, 222, 128)
NoButton.TextSize = 13
NoButton.Font = Enum.Font.GothamBold
NoButton.ZIndex = 5
NoButton.Parent = ConfirmFrame

local NoCorner = Instance.new("UICorner")
NoCorner.CornerRadius = UDim.new(0, 6)
NoCorner.Parent = NoButton

-- Подвязка системных кликов
CloseButton.MouseButton1Click:Connect(function() ConfirmFrame.Visible = true end)
YesButton.MouseButton1Click:Connect(function() espFolder:Destroy(); PutinHub:Destroy() end)
NoButton.MouseButton1Click:Connect(function() ConfirmFrame.Visible = false end)
ToggleButton.MouseButton1Click:Connect(function() MainFrame.Visible = not MainFrame.Visible end)

-- Запуск интерфейса
updateTheme("Green")
switchTab("Main")
