-- PutinHub Version: 3.5
-- ЧАСТЬ 1 (Скопируй и вставь первой)

local Players = game:GetService("Players")
local CoreGui = game:GetService("CoreGui")
local LocalPlayer = Players.LocalPlayer

local targetParent
local success, err = pcall(function()
    targetParent = CoreGui
end)
if not success or not targetParent then
    targetParent = LocalPlayer:WaitForChild("PlayerGui")
end

if targetParent:FindFirstChild("PutinHub") then
    targetParent["PutinHub"]:Destroy()
end

local PutinHub = Instance.new("ScreenGui")
PutinHub.Name = "PutinHub"
PutinHub.ResetOnSpawn = false
PutinHub.Parent = targetParent

local MainFrame = Instance.new("Frame")
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

local TopBar = Instance.new("Frame")
TopBar.Name = "TopBar"
TopBar.Size = UDim2.new(1, 0, 0, 40)
TopBar.BackgroundColor3 = Color3.fromRGB(22, 38, 22)
TopBar.BorderSizePixel = 0
TopBar.Parent = MainFrame

local TopBarCorner = Instance.new("UICorner")
TopBarCorner.CornerRadius = UDim.new(0, 9)
TopBarCorner.Parent = TopBar

local TopBarFix = Instance.new("Frame")
TopBarFix.Name = "TopBarFix"
TopBarFix.Size = UDim2.new(1, 0, 0, 10)
TopBarFix.Position = UDim2.new(0, 0, 1, -10)
TopBarFix.BackgroundColor3 = Color3.fromRGB(22, 38, 22)
TopBarFix.BorderSizePixel = 0
TopBarFix.Parent = TopBar

local HubTitle = Instance.new("TextLabel")
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

local AccentLine = Instance.new("Frame")
AccentLine.Name = "AccentLine"
AccentLine.Size = UDim2.new(1, 0, 0, 2)
AccentLine.Position = UDim2.new(0, 0, 1, 0)
AccentLine.BackgroundColor3 = Color3.fromRGB(34, 197, 94)
AccentLine.BorderSizePixel = 0
AccentLine.Parent = TopBar

local CloseButton = Instance.new("TextButton")
CloseButton.Name = "CloseButton"
CloseButton.Size = UDim2.new(0, 30, 0, 30)
CloseButton.Position = UDim2.new(1, -35, 0, 5)
CloseButton.BackgroundTransparency = 1
CloseButton.Text = "×"
CloseButton.TextColor3 = Color3.fromRGB(239, 68, 68)
CloseButton.TextSize = 26
CloseButton.Font = Enum.Font.GothamBold
CloseButton.Parent = TopBar

local ToggleButton = Instance.new("TextButton")
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

local ToggleStroke = Instance.new("UIStroke")
ToggleStroke.Color = Color3.fromRGB(34, 197, 94)
ToggleStroke.Thickness = 1.2
ToggleStroke.Parent = ToggleButton

local TabsContainer = Instance.new("Frame")
TabsContainer.Name = "TabsContainer"
TabsContainer.Size = UDim2.new(0, 100, 0, 184)
TabsContainer.Position = UDim2.new(0, 10, 0, 45)
TabsContainer.BackgroundTransparency = 1
TabsContainer.Parent = MainFrame

local TabsList = Instance.new("UIListLayout")
TabsList.Padding = UDim.new(0, 6)
TabsList.SortOrder = Enum.SortOrder.LayoutOrder
TabsList.Parent = TabsContainer

local CreditsCard = Instance.new("Frame")
CreditsCard.Name = "CreditsCard"
CreditsCard.Size = UDim2.new(0, 100, 0, 40)
CreditsCard.Position = UDim2.new(0, 10, 1, -45)
CreditsCard.BackgroundColor3 = Color3.fromRGB(22, 38, 22)
CreditsCard.BorderSizePixel = 0
CreditsCard.Parent = MainFrame

local CreditsCorner = Instance.new("UICorner")
CreditsCorner.CornerRadius = UDim.new(0, 6)
CreditsCorner.Parent = CreditsCard

local CreditsStroke = Instance.new("UIStroke")
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

local ContentFrame = Instance.new("Frame")
ContentFrame.Name = "ContentFrame"
ContentFrame.Size = UDim2.new(1, -125, 1, -50)
ContentFrame.Position = UDim2.new(0, 115, 0, 45)
ContentFrame.BackgroundTransparency = 1
ContentFrame.Parent = MainFrame
-- ЧАСТЬ 2 (Скопируй и вставь сразу под первой частью)

local pages = {}
local tabs = {}

local function createTab(name, layoutOrder)
    local TabButton = Instance.new("TextButton")
    TabButton.Name = name .. "Tab"
    TabButton.Size = UDim2.new(1, 0, 0, 32)
    TabButton.BackgroundColor3 = Color3.fromRGB(22, 38, 22)
    TabButton.BorderSizePixel = 0
    TabButton.Text = name
    TabButton.TextColor3 = Color3.fromRGB(74, 222, 128)
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
end

createTab("Main", 1)
createTab("Player", 2)
createTab("AutoFarm", 3)
createTab("Theme", 4)
createTab("Info", 5)

local function switchTab(activeName)
    for name, page in pairs(pages) do
        page.Visible = (name == activeName)
    end
    for name, button in pairs(tabs) do
        if name == activeName then
            button.BackgroundColor3 = Color3.fromRGB(34, 197, 94)
            button.TextColor3 = Color3.fromRGB(15, 25, 15)
        else
            button.BackgroundColor3 = Color3.fromRGB(22, 38, 22)
            button.TextColor3 = Color3.fromRGB(74, 222, 128)
        end
    end
end

for name, button in pairs(tabs) do
    button.MouseButton1Click:Connect(function()
        switchTab(name)
    end)
end

switchTab("Main")

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
