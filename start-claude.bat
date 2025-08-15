@echo off
REM Start Claude Code session for this project

REM Get the current directory name as session name
for %%I in (.) do set SESSION_NAME=%%~nxI

REM Get the full path of current directory
set PROJECT_PATH=%cd%

REM Convert Windows path to WSL path
set WSL_PATH=%PROJECT_PATH:\=/%
set WSL_PATH=%WSL_PATH:C:=/mnt/c%
set WSL_PATH=%WSL_PATH:D:=/mnt/d%
set WSL_PATH=%WSL_PATH:E:=/mnt/e%

echo Starting Claude Code session: %SESSION_NAME%
echo Project path: %PROJECT_PATH%
echo.

REM Direct WSL command (more reliable than Windows Terminal)
wsl.exe -d Ubuntu bash -c "cd '%WSL_PATH%' && tmux new-session -A -s '%SESSION_NAME%' 'claude code --resume; bash'"

if errorlevel 1 (
    echo.
    echo ERROR: Failed to start session
    echo Make sure WSL Ubuntu is installed and running
    pause
)