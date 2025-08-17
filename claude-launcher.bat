@echo off
setlocal enabledelayedexpansion

:: Get project info
for %%I in (.) do set "PROJECT_NAME=%%~nxI"
set "PROJECT_DIR=%CD%"
set "WSL_PATH=%PROJECT_DIR:\=/%"
set "WSL_PATH=%WSL_PATH:C:=/mnt/c%"
set "WSL_PATH=%WSL_PATH:D:=/mnt/d%"
set "WSL_PATH=%WSL_PATH:E:=/mnt/e%"
set "SESSION_NAME=%PROJECT_NAME: =-%"
set "SESSION_NAME=%SESSION_NAME:_=-%"

cls
echo ========================================
echo Claude Code - Persistent Session Manager
echo ========================================
echo Project: %PROJECT_NAME%
echo Directory: %PROJECT_DIR%
echo Session: claude-%SESSION_NAME%
echo ========================================
echo.

:: Create/update CLAUDE.md
(
echo # Claude Code Context for %PROJECT_NAME%
echo.
echo ## Project Directory
echo %PROJECT_DIR%
echo.
echo ## Instructions for Claude Code
echo When working on this project, please:
echo - Stay within this directory: %PROJECT_DIR%
echo - Remember this is the %PROJECT_NAME% project
echo.
echo ---
echo Last Updated: %DATE% %TIME%
) > "CLAUDE.md"

echo [✓] Project context ready
echo.

:: Check for WSL
wsl echo test >nul 2>&1
if %errorlevel% neq 0 (
    echo [!] WSL not installed
    echo Please install WSL: wsl --install
    pause
    exit /b
)

:: Use Ubuntu if available
set "WSL_CMD=wsl"
wsl -d Ubuntu -- echo test >nul 2>&1
if %errorlevel%==0 (
    set "WSL_CMD=wsl -d Ubuntu"
    echo [✓] Using Ubuntu WSL
) else (
    echo [✓] Using default WSL
)

:: Check for tmux
echo Checking tmux...
%WSL_CMD% -- which tmux >nul 2>&1
if %errorlevel% neq 0 (
    echo Installing tmux...
    %WSL_CMD% -- bash -c "sudo apt-get update && sudo apt-get install -y tmux"
)
echo [✓] tmux ready
echo.

:: Check for Claude
echo Checking Claude Code...
%WSL_CMD% -- bash -lc "[ -s '$HOME/.nvm/nvm.sh' ] && . '$HOME/.nvm/nvm.sh'; which claude" >nul 2>&1
if %errorlevel% neq 0 (
    echo [!] Claude Code not found
    echo.
    choice /C YN /M "Install Claude Code"
    if !errorlevel!==2 goto :skip_install
    
    echo Installing Node.js if needed...
    %WSL_CMD% -- bash -c "which node || (curl -fsSL https://deb.nodesource.com/setup_20.x | sudo -E bash - && sudo apt-get install -y nodejs)"
    
    echo Installing Claude Code...
    %WSL_CMD% -- npm install -g @anthropic-ai/claude-code
    
    echo [✓] Installation complete
    echo.
)
echo [✓] Claude Code ready
echo.

:skip_install
echo ========================================
echo LAUNCHING PERSISTENT CLAUDE SESSION
echo ========================================
echo.
echo Session Controls:
echo - Chat normally with Claude
echo - Detach (keep running): Ctrl+B, then D
echo - Exit Claude: Ctrl+C twice
echo - Reattach: Run this launcher again
echo.
echo Press any key to launch/resume session...
pause >nul

:: Launch or attach to tmux session with Claude
%WSL_CMD% -- bash -lc "[ -s '$HOME/.nvm/nvm.sh' ] && . '$HOME/.nvm/nvm.sh'; tmux new-session -A -s 'claude-%SESSION_NAME%' -c '%WSL_PATH%' 'claude --continue || claude'"

echo.
echo ========================================
echo Session ended or detached
echo ========================================
echo.
echo Run this launcher again to reconnect
echo.
pause