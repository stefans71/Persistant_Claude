@echo off
setlocal enabledelayedexpansion

cls
echo ============================================
echo   Claude Code Prerequisites Installer
echo ============================================
echo.
echo This script will check and install required components:
echo - WSL2 with Ubuntu
echo - Node.js (via NVM)
echo - Claude CLI
echo - tmux
echo.
pause

REM Check if running as administrator
net session >nul 2>&1
if %errorlevel% neq 0 (
    echo.
    echo ERROR: This script must be run as Administrator!
    echo.
    echo Please:
    echo 1. Right-click on INSTALL-PREREQUISITES.bat
    echo 2. Select "Run as administrator"
    echo.
    pause
    exit /b 1
)

echo.
echo [1/5] Checking WSL installation...
wsl --list --quiet >nul 2>&1
if %errorlevel% neq 0 (
    echo WSL not found. Installing WSL2...
    wsl --install
    echo.
    echo ============================================
    echo WSL2 has been installed!
    echo.
    echo IMPORTANT: You must restart your computer now.
    echo After restart:
    echo 1. Ubuntu will open automatically
    echo 2. Create a username and password
    echo 3. Run this script again
    echo ============================================
    echo.
    pause
    shutdown /r /t 30 /c "Restarting to complete WSL installation. Save your work!"
    echo Restart scheduled in 30 seconds. Press any key to cancel restart...
    pause >nul
    shutdown /a
    echo Restart cancelled. Please restart manually when ready.
    pause
    exit /b
)

echo WSL is installed. Checking for Ubuntu...
wsl -l -q | findstr /i "Ubuntu" >nul
if %errorlevel% neq 0 (
    echo Ubuntu not found. Installing Ubuntu...
    wsl --install -d Ubuntu
    echo.
    echo ============================================
    echo Ubuntu has been installed!
    echo.
    echo Please:
    echo 1. Wait for Ubuntu window to open
    echo 2. Create a username and password
    echo 3. Close Ubuntu window when done
    echo 4. Press any key here to continue
    echo ============================================
    echo.
    pause
)

echo.
echo [2/5] Checking Ubuntu is running...
wsl -d Ubuntu echo "Ubuntu is working" >nul 2>&1
if %errorlevel% neq 0 (
    echo Starting Ubuntu...
    wsl -d Ubuntu echo "Ubuntu started"
)

echo.
echo [3/5] Installing Node.js in Ubuntu...
echo This may take a few minutes...

REM Create installation script
echo Creating installation script...
(
echo #!/bin/bash
echo set -e
echo
echo echo "Installing NVM and Node.js..."
echo export NVM_DIR="$HOME/.nvm"
echo
echo # Install NVM if not present
echo if [ ! -d "$NVM_DIR" ]; then
echo     echo "Downloading NVM..."
echo     curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.0/install.sh ^| bash
echo     echo "NVM installed"
echo else
echo     echo "NVM already installed"
echo fi
echo
echo # Load NVM
echo [ -s "$NVM_DIR/nvm.sh" ] ^&^& \. "$NVM_DIR/nvm.sh"
echo [ -s "$NVM_DIR/bash_completion" ] ^&^& \. "$NVM_DIR/bash_completion"
echo
echo # Add NVM to bashrc if not present
echo if ! grep -q "NVM_DIR" ~/.bashrc; then
echo     echo "" ^>^> ~/.bashrc
echo     echo 'export NVM_DIR="$HOME/.nvm"' ^>^> ~/.bashrc
echo     echo '[ -s "$NVM_DIR/nvm.sh" ] ^&^& \. "$NVM_DIR/nvm.sh"' ^>^> ~/.bashrc
echo     echo '[ -s "$NVM_DIR/bash_completion" ] ^&^& \. "$NVM_DIR/bash_completion"' ^>^> ~/.bashrc
echo fi
echo
echo # Install Node LTS if not present
echo if ! command -v node ^&^> /dev/null; then
echo     echo "Installing Node.js LTS..."
echo     nvm install --lts
echo     nvm use --lts
echo     nvm alias default lts/*
echo else
echo     echo "Node.js already installed: $(node --version)"
echo fi
echo
echo echo "Node.js setup complete"
) > "%TEMP%\install_node.sh"

REM Convert line endings and run script
wsl -d Ubuntu dos2unix /mnt/c/Users/%USERNAME%/AppData/Local/Temp/install_node.sh 2>nul || wsl -d Ubuntu sed -i 's/\r$//' /mnt/c/Users/%USERNAME%/AppData/Local/Temp/install_node.sh
wsl -d Ubuntu bash /mnt/c/Users/%USERNAME%/AppData/Local/Temp/install_node.sh

echo.
echo [4/5] Installing Claude CLI...

REM Create Claude installation script
(
echo #!/bin/bash
echo set -e
echo source ~/.bashrc
echo export NVM_DIR="$HOME/.nvm"
echo [ -s "$NVM_DIR/nvm.sh" ] ^&^& \. "$NVM_DIR/nvm.sh"
echo
echo # Check if Claude is installed
echo if ! command -v claude ^&^> /dev/null; then
echo     echo "Installing Claude CLI..."
echo     npm install -g @anthropic/claude-cli
echo else
echo     echo "Claude CLI already installed"
echo fi
echo
echo # Verify installation
echo if command -v claude ^&^> /dev/null; then
echo     echo "Claude CLI installed successfully"
echo     echo "Version: $(claude --version 2^>^&1 ^|^| echo 'version check failed')"
echo else
echo     echo "Warning: Claude CLI installation may have failed"
echo     echo "Try running manually in Ubuntu: npm install -g @anthropic/claude-cli"
echo fi
) > "%TEMP%\install_claude.sh"

wsl -d Ubuntu dos2unix /mnt/c/Users/%USERNAME%/AppData/Local/Temp/install_claude.sh 2>nul || wsl -d Ubuntu sed -i 's/\r$//' /mnt/c/Users/%USERNAME%/AppData/Local/Temp/install_claude.sh
wsl -d Ubuntu bash /mnt/c/Users/%USERNAME%/AppData/Local/Temp/install_claude.sh

echo.
echo [5/5] Installing tmux...
wsl -d Ubuntu bash -c "sudo apt-get update && sudo apt-get install -y tmux"

echo.
echo ============================================
echo   Installation Complete!
echo ============================================
echo.
echo Verifying installations...
echo.

REM Verification
echo Checking WSL: 
wsl -l -v | findstr /i "Ubuntu"
echo.

echo Checking Node.js:
wsl -d Ubuntu bash -c "source ~/.bashrc && node --version 2>/dev/null || echo 'Node not found - may need manual installation'"
echo.

echo Checking Claude CLI:
wsl -d Ubuntu bash -c "source ~/.bashrc && export NVM_DIR=$HOME/.nvm && [ -s $NVM_DIR/nvm.sh ] && . $NVM_DIR/nvm.sh && claude --version 2>/dev/null || echo 'Claude not found - may need manual installation'"
echo.

echo Checking tmux:
wsl -d Ubuntu bash -c "tmux -V"
echo.

echo ============================================
echo   IMPORTANT: Final Steps
echo ============================================
echo.
echo 1. You need to authenticate Claude CLI:
echo    - Open Ubuntu terminal
echo    - Run: claude login
echo    - Follow the prompts
echo.
echo 2. Then you can use the template:
echo    - Copy template folder to your projects location
echo    - Rename to your project name
echo    - Run setup-project.bat
echo    - Run claude.bat
echo.
echo If any component shows "not found" above:
echo - Open Ubuntu terminal
echo - For Node: Run the commands in SETUP-GUIDE-FOR-SHARING.md
echo - For Claude: npm install -g @anthropic/claude-cli
echo.
pause

REM Cleanup temp files
del "%TEMP%\install_node.sh" 2>nul
del "%TEMP%\install_claude.sh" 2>nul