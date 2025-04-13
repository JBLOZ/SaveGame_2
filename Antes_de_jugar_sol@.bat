@echo off
REM Cambia al directorio donde se encuentra el script (raíz del repositorio)
cd /d "%~dp0"

REM Actualiza el repositorio desde la rama principal (ajusta "main" si tu rama se llama "master" u otro)
git pull origin main

echo.
echo [Pull completado. Presiona cualquier tecla para salir]
pause >nul
