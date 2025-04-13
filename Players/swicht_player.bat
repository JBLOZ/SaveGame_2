@echo off
setlocal EnableDelayedExpansion

echo ¿Con qué jugador deseas jugar localmente?
echo Escribe "africa" o "jordi" y presiona Enter:
set /p choice=

REM Comprobamos la opción ingresada
if /I "%choice%"=="africa" goto switch_africa
if /I "%choice%"=="jordi" goto switch_jordi

echo Opción no válida. Usa "africa" o "jordi".
pause
goto :EOF

:switch_africa
REM Verifica qué perfil está activo actualmente leyendo el archivo player.txt
if not exist "Player_0\player.txt" (
    echo No se encontró el archivo player.txt en Player_0.
    echo Se asume que el perfil activo es "jordi" por defecto.
    set current=jordi
) else (
    set /p current=<"Player_0\player.txt"
)

if /I "%current%"=="africa" (
    echo El perfil local ya es africa.
    pause
    goto :EOF
)

echo Cambiando perfil local a africa...

REM Respaldamos el contenido actual de Player_0 (que es de jordi) a su carpeta remota
if exist "Player_0" (
    robocopy "Player_0" "Player_76561198838768404" /MIR
) else (
    echo No se encontró la carpeta Player_0, no se puede hacer backup.
)

REM Borramos el contenido de Player_0
if exist "Player_0" (
    mkdir "empty_temp"
    robocopy "empty_temp" "Player_0" /MIR
    rmdir /S /Q "empty_temp"
)

REM Copiamos el respaldo de africa a Player_0
robocopy "Player_0_africa" "Player_0" /MIR

REM Actualizamos el archivo de identificación
echo africa > "Player_0\player.txt"

echo Cambio completado: ahora el perfil local es africa.
pause
goto :EOF

:switch_jordi
REM Verifica qué perfil está activo actualmente leyendo player.txt
if not exist "Player_0\player.txt" (
    echo No se encontró el archivo player.txt en Player_0.
    echo Se asume que el perfil activo es "africa" por defecto.
    set current=africa
) else (
    set /p current=<"Player_0\player.txt"
)

if /I "%current%"=="jordi" (
    echo El perfil local ya es jordi.
    pause
    goto :EOF
)

echo Cambiando perfil local a jordi...

REM Respaldamos el contenido actual de Player_0 (que es de africa) a su carpeta remota
if exist "Player_0" (
    robocopy "Player_0" "Player_76561198838768401" /MIR
) else (
    echo No se encontró la carpeta Player_0, no se puede hacer backup.
)

REM Borramos el contenido de Player_0
if exist "Player_0" (
    mkdir "empty_temp"
    robocopy "empty_temp" "Player_0" /MIR
    rmdir /S /Q "empty_temp"
)

REM Copiamos el respaldo de jordi a Player_0
robocopy "Player_0_jordi" "Player_0" /MIR

REM Actualizamos el archivo de identificación
echo jordi > "Player_0\player.txt"

echo Cambio completado: ahora el perfil local es jordi.
pause
goto :EOF
