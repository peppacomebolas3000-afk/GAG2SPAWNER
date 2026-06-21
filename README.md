# Pantalla de Carga Infinita para Roblox

Este script de Luau crea una pantalla de carga que ocupa toda la pantalla en Roblox y muestra el mensaje "El script se está cargando...". La barra de carga está diseñada para no terminar nunca, simulando un proceso de carga continuo.

## Características
- **Compatibilidad:** Diseñado para ejecutarse en Roblox (Luau).
- **Pantalla Completa:** Ocupa el 100% del ancho y alto de la pantalla, ignorando el inset de la GUI de Roblox.
- **Mensaje Personalizable:** Muestra "El script se está cargando..." con texto escalable.
- **Barra de Carga Infinita:** Incluye una barra de progreso animada que se mueve de forma continua, sin alcanzar nunca el 100%.
- **Fácil Implementación:** Se puede insertar como un `LocalScript` en `StarterPlayerScripts` o en cualquier lugar donde se ejecuten scripts del lado del cliente.

## Cómo usar
1. Copia el contenido del archivo `LoadingScreen.lua`.
2. En Roblox Studio, abre tu juego.
3. En el explorador, navega a `StarterPlayer` -> `StarterPlayerScripts`.
4. Inserta un nuevo `LocalScript` y pega el código dentro.
5. Ejecuta el juego para ver la pantalla de carga.

**Nota:** Esta pantalla de carga está diseñada para ser infinita. Si deseas que desaparezca después de un tiempo o una condición específica, deberás añadir lógica para destruir el `ScreenGui` (por ejemplo, `screenGui:Destroy()`) en el script.
