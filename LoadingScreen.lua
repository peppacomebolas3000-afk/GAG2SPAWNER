-- Script de Pantalla de Carga Infinita para Roblox

local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")

local player = Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")

-- Crear ScreenGui
local screenGui = Instance.new("ScreenGui")
screenGui.Name = "LoadingScreenGui"
screenGui.IgnoreGuiInset = true -- Ocupa toda la pantalla, ignorando la barra superior de Roblox
screenGui.Parent = playerGui

-- Crear Frame de fondo
local backgroundFrame = Instance.new("Frame")
backgroundFrame.Name = "BackgroundFrame"
backgroundFrame.Size = UDim2.new(1, 0, 1, 0) -- Ocupa el 100% del ScreenGui
backgroundFrame.BackgroundColor3 = Color3.fromRGB(18, 18, 18) -- Color de fondo oscuro
backgroundFrame.Parent = screenGui

-- Crear TextLabel para el mensaje
local loadingText = Instance.new("TextLabel")
loadingText.Name = "LoadingText"
loadingText.Size = UDim2.new(0.8, 0, 0.1, 0) -- 80% de ancho, 10% de alto
loadingText.Position = UDim2.new(0.1, 0, 0.4, 0) -- Centrado horizontalmente, un poco arriba del centro vertical
loadingText.BackgroundColor3 = Color3.fromRGB(255, 255, 255) -- Fondo blanco para el texto
loadingText.BackgroundTransparency = 1 -- Hacer el fondo del texto transparente
loadingText.TextColor3 = Color3.fromRGB(255, 255, 255) -- Color del texto blanco
loadingText.Font = Enum.Font.SourceSansBold
loadingText.TextSize = 30
loadingText.Text = "El script se está cargando..."
loadingText.TextScaled = true -- Escalar el texto para que se ajuste
loadingText.TextWrapped = true
loadingText.Parent = backgroundFrame

-- Crear Frame para la barra de carga (contenedor)
local loadingBarContainer = Instance.new("Frame")
loadingBarContainer.Name = "LoadingBarContainer"
loadingBarContainer.Size = UDim2.new(0.6, 0, 0.05, 0) -- 60% de ancho, 5% de alto
loadingBarContainer.Position = UDim2.new(0.2, 0, 0.55, 0) -- Debajo del texto
loadingBarContainer.BackgroundColor3 = Color3.fromRGB(50, 50, 50) -- Fondo gris oscuro para el contenedor
loadingBarContainer.BorderSizePixel = 0
loadingBarContainer.Parent = backgroundFrame

-- Crear Frame para la barra de carga (progreso)
local loadingBar = Instance.new("Frame")
loadingBar.Name = "LoadingBar"
loadingBar.Size = UDim2.new(0, 0, 1, 0) -- Inicialmente 0% de ancho, 100% de alto del contenedor
loadingBar.BackgroundColor3 = Color3.fromRGB(52, 152, 219) -- Color azul para la barra
loadingBar.BorderSizePixel = 0
loadingBar.Parent = loadingBarContainer

-- Animación de la barra de carga infinita
local tweenService = game:GetService("TweenService")
local tweenInfo = TweenInfo.new(
    2, -- Duración de la animación en segundos
    Enum.EasingStyle.Linear, -- Estilo de easing
    Enum.EasingDirection.Out, -- Dirección de easing
    -1, -- Repetir infinitamente
    true, -- Invertir la animación (ida y vuelta)
    0 -- Retraso inicial
)

local goal = {Size = UDim2.new(1, 0, 1, 0)} -- El objetivo es que la barra ocupe el 100% del contenedor

local tween = tweenService:Create(loadingBar, tweenInfo, goal)
tween:Play()

-- Mantener la pantalla de carga visible indefinidamente
-- Si quisieras que desapareciera, añadirías aquí la lógica para destruir screenGui
-- Por ejemplo: task.wait(tiempo_para_cargar_real); screenGui:Destroy()

-- Para este caso, la pantalla de carga se mantendrá activa indefinidamente
-- hasta que el script sea detenido o el juego termine.
