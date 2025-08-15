@echo off
setlocal enabledelayedexpansion

echo ============================================
echo   Claude Project Setup
echo ============================================
echo.

REM Get current directory name (project name)
for %%I in (.) do set PROJECT_NAME=%%~nxI
echo Project Name: %PROJECT_NAME%

REM Get current directory path
set WIN_PATH=%cd%
echo Windows Path: %WIN_PATH%

REM Convert to WSL path
set WSL_PATH=%WIN_PATH:\=/%
set WSL_PATH=%WSL_PATH:C:=/mnt/c%
set WSL_PATH=%WSL_PATH:D:=/mnt/d%
set WSL_PATH=%WSL_PATH:E:=/mnt/e%
echo WSL Path: %WSL_PATH%

REM Create safe session name (replace spaces and special chars)
set SESSION_NAME=%PROJECT_NAME: =-%
set SESSION_NAME=%SESSION_NAME:_=-% 
echo Session Name: claude-%SESSION_NAME%
echo.

echo Creating project files...

REM Create claude.bat from template
echo Creating claude.bat...
(
    for /f "delims=" %%a in (claude.bat.template) do (
        set "line=%%a"
        set "line=!line:{{PROJECT_NAME}}=%PROJECT_NAME%!"
        set "line=!line:{{SESSION_NAME}}=%SESSION_NAME%!"
        set "line=!line:{{WSL_PATH}}=%WSL_PATH%!"
        echo !line!
    )
) > claude.bat

REM Create launch-claude.sh from template
echo Creating launch-claude.sh...
(
    for /f "delims=" %%a in (launch-claude.sh.template) do (
        set "line=%%a"
        set "line=!line:{{PROJECT_NAME}}=%PROJECT_NAME%!"
        set "line=!line:{{SESSION_NAME}}=%SESSION_NAME%!"
        set "line=!line:{{WSL_PATH}}=%WSL_PATH%!"
        echo !line!
    )
) > launch-claude.sh

REM Convert line endings for shell script
echo Converting line endings...
wsl.exe -d Ubuntu sed -i 's/\r$//' "%WSL_PATH%/launch-claude.sh" 2>nul

REM Make shell script executable
echo Setting permissions...
wsl.exe -d Ubuntu chmod +x "%WSL_PATH%/launch-claude.sh" 2>nul

REM Clean up templates
echo Cleaning up templates...
del claude.bat.template 2>nul
del launch-claude.sh.template 2>nul

echo.
echo ============================================
echo   Setup Complete!
echo ============================================
echo.
echo Your project "%PROJECT_NAME%" is ready.
echo.
echo To start Claude Code:
echo   - Double-click claude.bat
echo.
echo This setup script will now self-destruct...
timeout /t 5 >nul

REM Delete this setup script
(goto) 2>nul & del "%~f0"