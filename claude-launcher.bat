@echo off
setlocal enabledelayedexpansion

:: Get the current directory name for the project name
for %%I in (.) do set "PROJECT_NAME=%%~nxI"

:: Get the full current directory path
set "PROJECT_DIR=%CD%"

:: Convert Windows path to WSL path for tmux
set "WSL_PATH=%PROJECT_DIR:\=/%"
set "WSL_PATH=%WSL_PATH:C:=/mnt/c%"
set "WSL_PATH=%WSL_PATH:D:=/mnt/d%"
set "WSL_PATH=%WSL_PATH:E:=/mnt/e%"

:: Create safe session name (replace spaces with dashes)
set "SESSION_NAME=%PROJECT_NAME: =-%"
set "SESSION_NAME=%SESSION_NAME:_=-%"

:: Clear screen for clean interface
cls

echo ========================================
echo Claude Code - Persistent Session Manager
echo ========================================
echo Project: %PROJECT_NAME%
echo Directory: %PROJECT_DIR%
echo Session: claude-%SESSION_NAME%
echo ========================================
echo.

:: Create or update CLAUDE.md file for persistent project context
echo Setting up persistent project context...
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
echo - Check this file for any project-specific context
echo - DO NOT access files outside this directory
echo.
echo ## Project Notes
echo ^(Add your project-specific notes below - they will persist across sessions^)
echo.
echo ---
echo.
echo ## Session Information
echo This project uses tmux for TRUE conversation persistence.
echo Your conversations continue exactly where you left off.
echo This CLAUDE.md file provides additional project context.
echo.
echo ---
echo Last Updated: %DATE% %TIME%
echo Launcher Version: claude-launcher.bat v2.0 ^(with tmux persistence^)
) > "CLAUDE.md"

:: Create or update claude.config for additional settings
(
echo :: Claude Project Configuration
echo :: Project: %PROJECT_NAME%
echo :: Directory: %PROJECT_DIR%
echo :: Updated: %DATE% %TIME%
echo :: 
echo :: Project Isolation Settings:
echo :: - Working Directory: %PROJECT_DIR%
echo :: - Context File: CLAUDE.md
echo :: - Persistence: Enabled
echo ::
echo :: This configuration ensures Claude maintains context for this specific project
) > "claude.config"

echo [✓] Project context files ready
echo.

:: Now launch Claude Code CLI
echo Detecting Claude Code CLI installation...
echo ========================================
echo.

:: Method 1: Try WSL with tmux (best option for persistence)
where wsl.exe >nul 2>&1
if %errorlevel% neq 0 (
    :: WSL not installed at all - offer to install it
    echo [!] WSL not installed
    echo.
    echo ========================================
    echo ONE-TIME SETUP REQUIRED
    echo ========================================
    echo.
    echo Claude Code requires WSL ^(Windows Subsystem for Linux^)
    echo This is a built-in Windows feature that:
    echo - Installs Linux environment on Windows
    echo - Includes Ubuntu automatically ^(no separate download^)
    echo - Takes about 5-10 minutes
    echo.
    choice /C YN /M "Install WSL now?"
    if !errorlevel!==1 (
        echo.
        echo Installing WSL with Ubuntu...
        echo This Windows feature will:
        echo 1. Enable WSL
        echo 2. Download and install Ubuntu
        echo 3. Require ONE restart
        echo.
        wsl --install
        echo.
        echo ========================================
        echo RESTART REQUIRED - ALMOST DONE^^!
        echo ========================================
        echo After restarting:
        echo 1. Run claude-launcher.bat again
        echo 2. Ubuntu will open to complete setup
        echo 3. Create a username/password
        echo 4. Claude Code will be ready^^!
        echo.
        pause
        exit
    ) else (
        echo.
        echo Skipping WSL installation.
        echo Running in limited mode ^(no persistence^)...
        echo.
        goto :fallback_mode
    )
)

:: WSL is installed, check for distro
if %errorlevel%==0 (
    :: Check if any WSL distro exists (use default)
    wsl.exe -- echo test >nul 2>&1
    if !errorlevel!==0 (
        echo [✓] Found WSL with Linux distribution
        echo.
        echo ========================================
        echo LAUNCHING PERSISTENT CLAUDE SESSION
        echo ========================================
        echo.
        echo Session: claude-%SESSION_NAME%
        echo.
        echo TMUX SESSION CONTROLS:
        echo ^^^^^^^^^^^^^^^^^^^^^^
        echo - Your conversation will persist across restarts
        echo - To detach ^(keep running^): Press Ctrl+B, then D
        echo - Session auto-resumes when you run this launcher again
        echo.
        echo Press any key to launch/resume Claude session...
        pause >nul
        
        :: Launch tmux session in WSL (using default distro)
        wsl.exe -- bash -lic "cd '%WSL_PATH%' && tmux new-session -A -s 'claude-%SESSION_NAME%' 'claude code --resume; bash'"
        goto :end
    )
)

:fallback_mode
:: Method 2: Fallback to claude-code command (no tmux persistence)
where claude-code >nul 2>&1
if %errorlevel%==0 (
    echo [!] WSL not available
    echo [✓] Found Claude Code CLI - using fallback mode
    echo.
    echo ========================================
    echo LAUNCHING CLAUDE CODE ^(No Persistence^)
    echo ========================================
    echo.
    echo WARNING: Running without tmux - conversations won't persist!
    echo To enable persistence, install WSL: wsl --install
    echo.
    echo IMPORTANT FIRST STEP:
    echo ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
    echo When Claude opens, type: "Read CLAUDE.md"
    echo This loads your project's context
    echo.
    echo Press any key to launch Claude Code CLI...
    pause >nul
    cd /d "%CD%"
    cmd /k claude-code
    goto :end
)

:: Method 3: Check for globally installed claude command (no tmux)
where claude >nul 2>&1
if %errorlevel%==0 (
    echo [!] WSL not available
    echo [✓] Found Claude CLI - using fallback mode
    echo.
    echo ========================================
    echo LAUNCHING CLAUDE ^(No Persistence^)
    echo ========================================
    echo.
    echo WARNING: Running without tmux - conversations won't persist!
    echo To enable persistence, install WSL: wsl --install
    echo.
    echo IMPORTANT FIRST STEP:
    echo ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
    echo When Claude opens, type: "Read CLAUDE.md"
    echo This loads your project's context
    echo.
    echo Press any key to launch Claude CLI...
    pause >nul
    cd /d "%CD%"
    cmd /k claude
    goto :end
)

:: Method 4: Try using npx if npm is available (without prompting)
where npm >nul 2>&1
if %errorlevel%==0 (
    :: Check if package exists in npm registry
    npm view @anthropic-ai/claude-code >nul 2>&1
    if %errorlevel%==0 (
        echo [✓] npm is available - can use npx
        echo.
        echo ========================================
        echo LAUNCHING CLAUDE VIA NPX
        echo ========================================
        echo.
        echo IMPORTANT FIRST STEP:
        echo ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
        echo When Claude opens, type: "Read CLAUDE.md"
        echo This loads your project's persistent context
        echo.
        echo Note: npx will download Claude Code CLI temporarily
        echo.
        echo Press any key to launch Claude...
        pause >nul
        cd /d "%CD%"
        npx -y @anthropic-ai/claude-code
        goto :end
    )
)

:: If nothing worked, offer to install
echo [!] Claude Code CLI not found
echo.
echo ========================================
echo INSTALLATION REQUIRED
echo ========================================
echo.

:: Check if npm is available for installation
where npm >nul 2>&1
if %errorlevel%==0 (
    echo Node.js is installed. Ready to install Claude Code CLI.
    echo.
    choice /C YN /M "Install Claude Code CLI now?"
    if !errorlevel!==1 (
        echo.
        echo Installing Claude Code CLI globally...
        echo This may take a minute...
        echo.
        npm install -g @anthropic-ai/claude-code
        
        if !errorlevel!==0 (
            echo.
            echo [✓] Installation successful!
            echo.
            echo ========================================
            echo LAUNCHING CLAUDE CODE CLI
            echo ========================================
            echo.
            echo IMPORTANT FIRST STEP:
            echo ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
            echo When Claude opens, type: "Read CLAUDE.md"
            echo This loads your project's persistent context
            echo.
            echo Press any key to launch Claude Code CLI...
            pause >nul
            claude-code
            goto :end
        ) else (
            echo.
            echo [X] Installation failed.
            echo.
            echo Please try manually:
            echo   npm install -g @anthropic-ai/claude-code
            echo.
            pause
            goto :end
        )
    ) else (
        echo.
        echo Skipping installation.
        echo To install manually: npm install -g @anthropic-ai/claude-code
        echo.
        pause
        goto :end
    )
) else (
    echo Node.js is NOT installed!
    echo.
    echo Claude Code CLI requires Node.js to run.
    echo.
    choice /C YN /M "Download and install Node.js automatically?"
    if !errorlevel!==1 (
        echo.
        echo Downloading Node.js installer...
        echo.
        powershell -Command "& {[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12; try { Invoke-WebRequest -Uri 'https://nodejs.org/dist/v20.11.0/node-v20.11.0-x64.msi' -OutFile '%TEMP%\nodejs-installer.msi' -ErrorAction Stop; exit 0 } catch { exit 1 }}"
        
        if !errorlevel!==0 (
            if exist "%TEMP%\nodejs-installer.msi" (
                echo [✓] Download complete
                echo.
                echo Installing Node.js...
                echo Please wait...
                echo.
                start /wait msiexec /i "%TEMP%\nodejs-installer.msi" /qb
                
                :: Clean up
                del "%TEMP%\nodejs-installer.msi" >nul 2>&1
                
                echo.
                echo ========================================
                echo NODE.JS INSTALLATION COMPLETE
                echo ========================================
                echo.
                echo IMPORTANT: You must restart this batch file!
                echo.
                echo The system PATH has been updated and needs
                echo to be refreshed for npm commands to work.
                echo.
                echo 1. Close this window
                echo 2. Run claude-launcher.bat again
                echo 3. Claude Code CLI will be installed automatically
                echo.
                pause
                exit
            )
        ) else (
            echo.
            echo [X] Download failed
            echo.
            echo Please install Node.js manually:
            echo 1. Visit https://nodejs.org
            echo 2. Download the Windows installer
            echo 3. Run the installer
            echo 4. Run claude-launcher.bat again
            echo.
            pause
            goto :end
        )
    ) else (
        echo.
        echo Please install Node.js from https://nodejs.org
        echo Then run claude-launcher.bat again
        echo.
        pause
        goto :end
    )
)

:end
echo.
echo ========================================
echo Claude Code Session Ended
echo ========================================
echo Project: %PROJECT_NAME%
echo Context saved in: CLAUDE.md
echo.
echo Your project context persists across sessions.
echo Run claude-launcher.bat anytime to continue.
echo.
pause