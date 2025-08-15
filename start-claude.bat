@echo off
echo ========================================
echo Launching Claude Code CLI for: Project_Template---Copy
echo ========================================
echo.
echo Opening project: %CD%
echo.

:: Method 1: Try using npx (no installation needed if npm exists)
where npx >nul 2>&1
if %errorlevel%==0 (
    echo Starting Claude Code CLI with npx...
    npx @anthropic-ai/claude-code
    goto :end
)

:: Method 2: Try globally installed claude-code command
where claude-code >nul 2>&1
if %errorlevel%==0 (
    echo Starting Claude Code CLI...
    claude-code
    goto :end
)

:: Method 3: Try globally installed claude command
where claude >nul 2>&1
if %errorlevel%==0 (
    echo Starting Claude Code CLI...
    claude
    goto :end
)

:: Method 4: Try npm exec
where npm >nul 2>&1
if %errorlevel%==0 (
    echo Starting Claude Code CLI with npm exec...
    npm exec @anthropic-ai/claude-code
    goto :end
)

:: If nothing worked, try to install it
echo.
echo ========================================
echo Claude Code CLI Not Found
echo ========================================
echo.

:: Check if npm is available for installation
where npm >nul 2>&1
if %errorlevel%==0 (
    echo Node.js is installed. Installing Claude Code CLI...
    echo.
    echo Running: npm install -g @anthropic-ai/claude-code
    echo This may take a minute...
    echo.
    npm install -g @anthropic-ai/claude-code
    
    if %errorlevel%==0 (
        echo.
        echo Installation successful! Launching Claude Code CLI...
        echo.
        claude-code
        goto :end
    ) else (
        echo.
        echo Installation failed. Please try manually:
        echo npm install -g @anthropic-ai/claude-code
        echo.
        pause
        goto :end
    )
) else (
    echo Node.js is not installed!
    echo.
    echo ========================================
    echo Installing Node.js automatically...
    echo ========================================
    echo.
    
    :: Download Node.js installer using PowerShell
    echo Downloading Node.js installer...
    powershell -Command "& {[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12; Invoke-WebRequest -Uri 'https://nodejs.org/dist/v20.11.0/node-v20.11.0-x64.msi' -OutFile '%TEMP%\nodejs-installer.msi'}"
    
    if exist "%TEMP%\nodejs-installer.msi" (
        echo.
        echo Installing Node.js...
        echo Please follow the installer prompts.
        echo.
        :: Run the installer
        msiexec /i "%TEMP%\nodejs-installer.msi" /qb
        
        :: Wait for installation to complete
        echo.
        echo Waiting for installation to complete...
        timeout /t 10 /nobreak >nul
        
        :: Clean up installer
        del "%TEMP%\nodejs-installer.msi"
        
        echo.
        echo ========================================
        echo Node.js installation complete!
        echo ========================================
        echo.
        echo Please close this window and run start-claude.bat again.
        echo The PATH needs to be refreshed for npm to be recognized.
        echo.
        pause
    ) else (
        echo.
        echo Failed to download Node.js installer.
        echo.
        echo Please install manually from: https://nodejs.org
        echo Then run this batch file again.
        echo.
        pause
    )
)

:end
