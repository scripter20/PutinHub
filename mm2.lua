-- PutinHub Version: 3.6
-- ЧАСТЬ 1 (Скопируй и вставь первой в свой файл на GitHub)

local Players = game:GetService("Players")
local CoreGui = game:GetService("CoreGui")
local LocalPlayer = Players.LocalPlayer

-- Общие переменные для связи всех трех частей скрипта
local targetParent, PutinHub, MainFrame, TopBar, TopBarFix, HubTitle, AccentLine, CloseButton, ToggleButton, ToggleStroke, TabsContainer, CreditsCard, CreditsStroke, ContentFrame
local pages = {}
local tabs = {}
local themeStrokes = {}
local currentThemeName = "Green"
local currentActiveTab = "Main"

local success, err = pcall(function()
    targetParent = CoreGui
end)
if not success or not targetParent then
    targetParent = LocalPlayer:WaitForChild("PlayerGui")
end

if targetParent:FindFirstChild("PutinHub") then
    targetParent["PutinHub"]:Destroy()
end

PutinHub = Instance.new("ScreenGui")
PutinHub.Name = "PutinHub"
PutinHub.ResetOnSpawn = false
PutinHub.Parent = targetParent

-- Главная панель
MainFrame = Instance.new("Frame")
MainFrame.Name = "MainFrame"
MainFrame.Size = UDim2.new(0, 480, 0, 280)
MainFrame.Position = UDim2.new(0.5, -240, 0.5, -140)
MainFrame.BackgroundColor3 = Color3.fromRGB(15, 25, 15)
MainFrame.BorderSizePixel = 0
MainFrame.Active = true
MainFrame.Draggable = true
MainFrame.Parent = PutinHub

local MainCorner = Instance.new("UICorner")
MainCorner.CornerRadius = UDim.new(0, 9)
MainCorner.Parent = MainFrame

-- Шапка
TopBar = Instance.new("Frame")
TopBar.Name = "TopBar"
TopBar.Size = UDim2.new(1, 0, 0, 40)
TopBar.BackgroundColor3 = Color3.fromRGB(22, 38, 22)
TopBar.BorderSizePixel = 0
TopBar.Parent = MainFrame

local TopBarCorner = Instance.new("UICorner")
TopBarCorner.CornerRadius = UDim.new(0, 9)
TopBarCorner.Parent = TopBar

TopBarFix = Instance.new("Frame")
TopBarFix.Name = "TopBarFix"
TopBarFix.Size = UDim2.new(1, 0, 0, 10)
TopBarFix.Position = UDim2.new(0, 0, 1, -10)
TopBarFix.BackgroundColor3 = Color3.fromRGB(22, 38, 22)
TopBarFix.BorderSizePixel = 0
TopBarFix.Parent = TopBar

HubTitle = Instance.new("TextLabel")
HubTitle.Name = "HubTitle"
HubTitle.Size = UDim2.new(1, -50, 1, 0)
HubTitle.Position = UDim2.new(0, 15, 0, 0)
HubTitle.BackgroundTransparency = 1
HubTitle.Text = "PutinHub"
HubTitle.TextColor3 = Color3.fromRGB(74, 222, 128)
HubTitle.TextSize = 20
HubTitle.Font = Enum.Font.GothamBold
HubTitle.TextXAlignment = Enum.TextXAlignment.Left
HubTitle.Parent = TopBar

AccentLine = Instance.new("Frame")
AccentLine.Name = "AccentLine"
AccentLine.Size = UDim2.new(1, 0, 0, 2)
AccentLine.Position = UDim2.new(0, 0, 1, 0)
AccentLine.BackgroundColor3 = Color3.fromRGB(34, 197, 94)
AccentLine.BorderSizePixel = 0
AccentLine.Parent = TopBar

-- Кнопка закрытия
CloseButton = Instance.new("TextButton")
CloseButton.Name = "CloseButton"
CloseButton.Size = UDim2.new(0, 30, 0, 30)
CloseButton.Position = UDim2.new(1, -35, 0, 5)
CloseButton.BackgroundTransparency = 1
CloseButton.Text = "×"
CloseButton.TextColor3 = Color3.fromRGB(239, 68, 68)
CloseButton.TextSize = 26
CloseButton.Font = Enum.Font.GothamBold
CloseButton.Parent = TopBar

-- Кнопка ZOV
ToggleButton = Instance.new("TextButton")
ToggleButton.Name = "ZOVButton"
ToggleButton.Size = UDim2.new(0, 45, 0, 45)
ToggleButton.Position = UDim2.new(1, -60, 0.5, -22)
ToggleButton.BackgroundColor3 = Color3.fromRGB(20, 35, 20)
ToggleButton.BorderSizePixel = 0
ToggleButton.Text = "ZOV"
ToggleButton.TextColor3 = Color3.fromRGB(74, 222, 128)
ToggleButton.TextSize = 14
ToggleButton.Font = Enum.Font.GothamBold
ToggleButton.Active = true
ToggleButton.Draggable = true
ToggleButton.Parent = PutinHub

local ToggleCorner = Instance.new("UICorner")
ToggleCorner.CornerRadius = UDim.new(0, 5)
ToggleCorner.Parent = ToggleButton

ToggleStroke = Instance.new("UIStroke")
ToggleStroke.Color = Color3.fromRGB(34, 197, 94)
ToggleStroke.Thickness = 1.2
ToggleStroke.Parent = ToggleButton

-- Панель вкладок (Слева)
TabsContainer = Instance.new("Frame")
TabsContainer.Name = "TabsContainer"
TabsContainer.Size = UDim2.new(0, 100, 0, 184)
TabsContainer.Position = UDim2.new(0, 10, 0, 45)
TabsContainer.BackgroundTransparency = 1
TabsContainer.Parent = MainFrame

local TabsList = Instance.new("UIListLayout")
TabsList.Padding = UDim.new(0, 6)
TabsList.SortOrder = Enum.SortOrder.LayoutOrder
TabsList.Parent = TabsContainer

-- Блок автора
CreditsCard = Instance.new("Frame")
CreditsCard.Name = "CreditsCard"
CreditsCard.Size = UDim2.new(0, 100, 0, 40)
CreditsCard.Position = UDim2.new(0, 10, 1, -45)
CreditsCard.BackgroundColor3 = Color3.fromRGB(22, 38, 22)
CreditsCard.BorderSizePixel = 0
CreditsCard.Parent = MainFrame

local CreditsCorner = Instance.new("UICorner")
CreditsCorner.CornerRadius = UDim.new(0, 6)
CreditsCorner.Parent = CreditsCard

CreditsStroke = Instance.new("UIStroke")
CreditsStroke.Color = Color3.fromRGB(34, 197, 94)
CreditsStroke.Thickness = 1
CreditsStroke.Parent = CreditsCard

local CreditsLabel = Instance.new("TextLabel")
CreditsLabel.Name = "CreditsLabel"
CreditsLabel.Size = UDim2.new(1, 0, 1, 0)
CreditsLabel.BackgroundTransparency = 1
CreditsLabel.Text = "Created by:\nPavelDurak"
CreditsLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
CreditsLabel.TextSize = 11
CreditsLabel.Font = Enum.Font.GothamBold
CreditsLabel.TextWrapped = true
CreditsLabel.Parent = CreditsCard

-- Основной контейнер страниц
ContentFrame = Instance.new("Frame")
ContentFrame.Name = "ContentFrame"
ContentFrame.Size = UDim2.new(1, -125, 1, -50)
ContentFrame.Position = UDim2.new(0, 115, 0, 45)
ContentFrame.BackgroundTransparency = 1
ContentFrame.Parent = MainFrame
-- ЧАСТЬ 2 (Скопируй и вставь сразу под первой частью в свой файл на GitHub)

-- Конфигурация цветовых палитр тем
local themes = {
    Green = {
        MainBg = Color3.fromRGB(15, 25, 15),
        TopBarBg = Color3.fromRGB(22, 38, 22),
        TitleText = Color3.fromRGB(74, 222, 128),
        Accent = Color3.fromRGB(34, 197, 94),
        TabBg = Color3.fromRGB(22, 38, 22),
        TabText = Color3.fromRGB(74, 222, 128),
        ActiveTabBg = Color3.fromRGB(34, 197, 94),
        ActiveTabText = Color3.fromRGB(15, 25, 15),
        CardBg = Color3.fromRGB(22, 38, 22),
        CardStroke = Color3.fromRGB(34, 197, 94),
        ThemeLabelText = Color3.fromRGB(255, 255, 255)
    },
    White = {
        MainBg = Color3.fromRGB(245, 245, 245),
        TopBarBg = Color3.fromRGB(255, 255, 255),
        TitleText = Color3.fromRGB(40, 40, 40),
        Accent = Color3.fromRGB(180, 180, 180),
        TabBg = Color3.fromRGB(230, 230, 230),
        TabText = Color3.fromRGB(100, 100, 100),
        ActiveTabBg = Color3.fromRGB(200, 200, 200),
        ActiveTabText = Color3.fromRGB(30, 30, 30),
        CardBg = Color3.fromRGB(230, 230, 230),
        CardStroke = Color3.fromRGB(160, 160, 160),
        ThemeLabelText = Color3.fromRGB(40, 40, 40)
    },
    Black = {
        MainBg = Color3.fromRGB(20, 20, 20),
        TopBarBg = Color3.fromRGB(12, 12, 12),
        TitleText = Color3.fromRGB(240, 240, 240),
        Accent = Color3.fromRGB(60, 60, 60),
        TabBg = Color3.fromRGB(28, 28, 28),
        TabText = Color3.fromRGB(160, 160, 160),
        ActiveTabBg = Color3.fromRGB(50, 50, 50),
        ActiveTabText = Color3.fromRGB(255, 255, 255),
        CardBg = Color3.fromRGB(28, 28, 28),
        CardStroke = Color3.fromRGB(70, 70, 70),
        ThemeLabelText = Color3.fromRGB(255, 255, 255)
    }
}

-- Функция динамической смены тем оформления
local function updateTheme(themeName)
    local currentTheme = themes[themeName]
    if not currentTheme then return end

    MainFrame.BackgroundColor3 = currentTheme.MainBg
    TopBar.BackgroundColor3 = currentTheme.TopBarBg
    TopBarFix.BackgroundColor3 = currentTheme.TopBarBg
    HubTitle.TextColor3 = currentTheme.TitleText
    AccentLine.BackgroundColor3 = currentTheme.Accent
    CreditsCard.BackgroundColor3 = currentTheme.CardBg
    CreditsStroke.Color = currentTheme.CardStroke
    
    ToggleButton.BackgroundColor3 = currentTheme.TabBg
    ToggleButton.TextColor3 = currentTheme.TitleText
    ToggleStroke.Color = currentTheme.Accent

    -- Обновление обводок выбора кнопок внутри вкладки Theme
    for tName, stroke in pairs(themeStrokes) do
        stroke.Enabled = (tName == themeName)
        stroke.Color = currentTheme.Accent
    end

    -- Адаптация цвета текста названий цветов под текущий фон
    if pages["Theme"] then
        for _, object in ipairs(pages["Theme"]:GetDescendants()) do
            if object:IsA("TextLabel") then
                object.TextColor3 = currentTheme.ThemeLabelText
            end
        end
    end
end

-- Функция переключения вкладок с учётом цветов темы
local function switchTab(activeName)
    currentActiveTab = activeName
    local currentTheme = themes[currentThemeName]
    
    for name, page in pairs(pages) do
        page.Visible = (name == activeName)
    end
    
    for name, button in pairs(tabs) do
        if name == activeName then
            button.BackgroundColor3 = currentTheme.ActiveTabBg
            button.TextColor3 = currentTheme.ActiveTabText
        else
            button.BackgroundColor3 = currentTheme.TabBg
            button.TextColor3 = currentTheme.TabText
        end
    end
end

-- Функция создания новой вкладки
local function createTab(name, layoutOrder)
    local TabButton = Instance.new("TextButton")
    TabButton.Name = name .. "Tab"
    TabButton.Size = UDim2.new(1, 0, 0, 32)
    TabButton.BorderSizePixel = 0
    TabButton.Text = name
    TabButton.TextSize = 14
    TabButton.Font = Enum.Font.GothamBold
    TabButton.LayoutOrder = layoutOrder
    TabButton.Parent = TabsContainer

    local TabCorner = Instance.new("UICorner")
    TabCorner.CornerRadius = UDim.new(0, 6)
    TabCorner.Parent = TabButton

    local Page = Instance.new("Frame")
    Page.Name = name .. "Page"
    Page.Size = UDim2.new(1, 0, 1, 0)
    Page.BackgroundTransparency = 1
    Page.Visible = false
    Page.Parent = ContentFrame

    pages[name] = Page
    tabs[name] = TabButton
    
    TabButton.MouseButton1Click:Connect(function()
        switchTab(name)
    end)
end
-- ЧАСТЬ 3 (Скопируй и вставь сразу под второй частью в свой файл на GitHub)

-- Инициализация вкладок хаба
createTab("Main", 1)
createTab("Player", 2)
createTab("AutoFarm", 3)
createTab("Theme", 4)
createTab("Info", 5)

-- Проектирование внутренней сетки страницы кастомизации тем
local ThemePage = pages["Theme"]

local ThemeLayout = Instance.new("UIListLayout")
ThemeLayout.FillDirection = Enum.FillDirection.Horizontal
ThemeLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
ThemeLayout.VerticalAlignment = Enum.VerticalAlignment.Center
ThemeLayout.Padding = UDim.new(0, 22)
ThemeLayout.Parent = ThemePage

-- Вспомогательная функция для генерации карточек выбора темы
local function createThemeBlock(themeKey, blockColor, displayName)
    local blockFrame = Instance.new("Frame")
    blockFrame.Name = themeKey .. "Container"
    blockFrame.Size = UDim2.new(0, 80, 0, 95)
    blockFrame.BackgroundTransparency = 1
    blockFrame.Parent = ThemePage

    local colorBtn = Instance.new("TextButton")
    colorBtn.Name = themeKey .. "Btn"
    colorBtn.Size = UDim2.new(1, 0, 0, 55)
    colorBtn.BackgroundColor3 = blockColor
    colorBtn.Text = ""
    colorBtn.AutoButtonColor = true
    colorBtn.Parent = blockFrame

    local btnCorner = Instance.new("UICorner")
    btnCorner.CornerRadius = UDim.new(0, 8)
    btnCorner.Parent = colorBtn

    local btnStroke = Instance.new("UIStroke")
    btnStroke.Thickness = 2
    btnStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
    btnStroke.Enabled = false
    btnStroke.Parent = colorBtn
    
    themeStrokes[themeKey] = btnStroke

    local nameLabel = Instance.new("TextLabel")
    nameLabel.Name = themeKey .. "Label"
    nameLabel.Size = UDim2.new(1, 0, 0, 25)
    nameLabel.Position = UDim2.new(0, 0, 0, 62)
    nameLabel.BackgroundTransparency = 1
    nameLabel.Text = displayName
    nameLabel.Font = Enum.Font.GothamBold
    nameLabel.TextSize = 13
    nameLabel.Parent = blockFrame

    colorBtn.MouseButton1Click:Connect(function()
        currentThemeName = themeKey
        updateTheme(themeKey)
        switchTab(currentActiveTab)
    end)
end

-- Спавн трёх аккуратных интерактивных кнопок выбора палитры
createThemeBlock("White", Color3.fromRGB(240, 240, 240), "White")
createThemeBlock("Black", Color3.fromRGB(35, 35, 35), "Black")
createThemeBlock("Green", Color3.fromRGB(34, 197, 94), "Green")

-- Создание окна предупреждения (ConfirmFrame)
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

-- Обработчики системных нажатий и запуск интерфейса
CloseButton.MouseButton1Click:Connect(function()
    ConfirmFrame.Visible = true
end)

YesButton.MouseButton1Click:Connect(function()
    PutinHub:Destroy()
end)

NoButton.MouseButton1Click:Connect(function()
    ConfirmFrame.Visible = false
end)

ToggleButton.MouseButton1Click:Connect(function()
    MainFrame.Visible = not MainFrame.Visible
end)

-- Первичная загрузка стандартных стилей
updateTheme("Green")
switchTab("Main")

