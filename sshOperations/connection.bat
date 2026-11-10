@echo off
setlocal enabledelayedexpansion

:: Считываем конфиг
for /f "delims=" %%a in (config.txt) do (
    set "%%a"
)

:: Подключаемся
ssh %user%@%host% -p %port%

pause
