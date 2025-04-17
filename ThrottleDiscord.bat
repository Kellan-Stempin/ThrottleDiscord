@echo off
:: Wait a few seconds for Discord to open
timeout /t 10 >nul

:: Set Discord process to low priority
for /f "tokens=*" %%i in ('tasklist /fi "imagename eq discord.exe" /fo csv ^| findstr /i "discord.exe"') do (
    for /f "tokens=2 delims=," %%a in ("%%i") do (
        wmic process where processid=%%~a CALL setpriority 64 >nul
    )
)

echo.
echo ✅ Discord is now running in low priority mode.
pause