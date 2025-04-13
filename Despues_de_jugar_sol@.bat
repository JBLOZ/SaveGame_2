@echo off
REM Cambia al directorio donde se encuentra el script (raíz del repositorio)
cd /d "%~dp0"

REM Agrega todos los cambios (si deseas, puedes refinar qué archivos incluir)
git add .

REM Realiza un commit con un mensaje predeterminado (puedes incluir fecha u otro identificador)
git commit -m "Actualización del mundo tras sesión de juego"

REM Envía el commit a la rama principal (ajusta "main" si es necesario)
git push origin main

echo.
echo [Push completado. Presiona cualquier tecla para salir]
pause >nul
