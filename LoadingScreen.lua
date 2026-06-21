-- GAG2SPAWNER: Pantalla de Carga Oficial
-- Diseñado para Delta Executor y otros ejecutores de Roblox

local Players = game:GetService("Players")
local player = Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")

-- 1. Crear ScreenGui de GAG2SPAWNER
local screenGui = Instance.new("ScreenGui")
screenGui.Name = "GAG2SPAWNERGui"
screenGui.IgnoreGuiInset = true
screenGui.DisplayOrder = 999999
screenGui.Parent = playerGui

-- Frame de fondo (Pantalla completa)
local backgroundFrame = Instance.new("Frame")
backgroundFrame.Name = "BackgroundFrame"
backgroundFrame.Size = UDim2.new(1, 0, 1, 0)
backgroundFrame.BackgroundColor3 = Color3.fromRGB(18, 18, 18) -- Color oscuro elegante
backgroundFrame.BorderSizePixel = 0
backgroundFrame.Parent = screenGui

-- Texto principal
local loadingText = Instance.new("TextLabel")
loadingText.Name = "LoadingText"
loadingText.Size = UDim2.new(0.8, 0, 0.1, 0)
loadingText.Position = UDim2.new(0.1, 0, 0.4, 0)
loadingText.BackgroundTransparency = 1
loadingText.TextColor3 = Color3.fromRGB(255, 255, 255)
loadingText.Font = Enum.Font.SourceSansBold
loadingText.TextSize = 40
loadingText.Text = "GAG2SPAWNER"
loadingText.TextScaled = true
loadingText.Parent = backgroundFrame

-- Subtexto informativo
local subText = Instance.new("TextLabel")
subText.Name = "SubText"
subText.Size = UDim2.new(0.8, 0, 0.05, 0)
subText.Position = UDim2.new(0.1, 0, 0.48, 0)
subText.BackgroundTransparency = 1
subText.TextColor3 = Color3.fromRGB(200, 200, 200)
subText.Font = Enum.Font.SourceSansItalic
subText.TextSize = 18
subText.Text = "El script se está cargando..."
subText.Parent = backgroundFrame

-- Barra de carga (contenedor)
local barContainer = Instance.new("Frame")
barContainer.Name = "BarContainer"
barContainer.Size = UDim2.new(0.5, 0, 0.02, 0)
barContainer.Position = UDim2.new(0.25, 0, 0.55, 0)
barContainer.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
barContainer.BorderSizePixel = 0
barContainer.Parent = backgroundFrame

-- Barra de carga (progreso animado)
local barProgress = Instance.new("Frame")
barProgress.Name = "BarProgress"
barProgress.Size = UDim2.new(0, 0, 1, 0)
barProgress.BackgroundColor3 = Color3.fromRGB(0, 162, 255) -- Azul neón
barProgress.BorderSizePixel = 0
barProgress.Parent = barContainer

-- Animación de carga infinita
local tweenService = game:GetService("TweenService")
local tweenInfo = TweenInfo.new(
    2.5, -- Duración
    Enum.EasingStyle.Sine, 
    Enum.EasingDirection.InOut, 
    -1, -- Infinito
    true -- Ida y vuelta
)

local tween = tweenService:Create(barProgress, tweenInfo, {Size = UDim2.new(1, 0, 1, 0)})
tween:Play()

print("GAG2SPAWNER: Pantalla de carga ejecutada correctamente.")
