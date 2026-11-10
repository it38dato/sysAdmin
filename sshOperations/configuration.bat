@echo off

setlocal enabledelayedexpansion

:: Считываем конфиг
for /f "delims=" %%a in (config.txt) do (
    set "%%a"
)

setlocal

:: Настройки (измените на свои)
set "HOST=%host%"
set "PUBKEY=%pubkey%"
set "HOSTKEY=%hostkey%"

:: Путь к конфигу (исправлено написание config)
set "SSH_CONFIG=%USERPROFILE%\.ssh\config"

:: Проверяем, существует ли папка .ssh, если нет — создаем
if not exist "%USERPROFILE%\.ssh" mkdir "%USERPROFILE%\.ssh1"

:: Записываем настройки в файл (дозапись в конец файла)
echo Host %HOST% >> "%SSH_CONFIG%"
echo     HostKeyAlgorithms %HOSTKEY% >> "%SSH_CONFIG%"
echo     PubkeyAcceptedAlgorithms %PUBKEY% >> "%SSH_CONFIG%"
echo. >> "%SSH_CONFIG%"

echo Finished! 
echo cmd: ssh %user%@%HOST% -p %port%
pause
