@echo off
setlocal enabledelayedexpansion

:: Get the current directory name for the project name
for %%I in (.) do set "PROJECT_NAME=%%~nxI"

:: Get the full current directory path
set "PROJECT_DIR=%CD%"

echo ========================================
echo Setting up Claude Context for: %PROJECT_NAME%
echo Directory: %PROJECT_DIR%
echo ========================================
echo.

:: Update or create CLAUDE.md file for context
echo Updating CLAUDE.md context file...
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
echo.
echo ## Project Notes
echo ^(Add your project-specific notes here^)
echo.
echo ## How to Use This
echo 1. Open this folder in Claude Code
echo 2. Claude will see this CLAUDE.md file
echo 3. Reference this file to maintain context
echo 4. Add project notes as needed
echo.
echo ---
echo Updated: %DATE% %TIME%
) > "CLAUDE.md"

:: Update or create start-claude.bat
echo Updating start-claude.bat...
(
echo @echo off
echo echo ========================================
echo echo Launching Claude Code CLI for: %PROJECT_NAME%
echo echo ========================================
echo echo.
echo echo Opening project: %%CD%%
echo echo.
echo.
echo :: Method 1: Try using npx ^(no installation needed if npm exists^)
echo where npx ^>nul 2^>^&1
echo if %%errorlevel%%==0 ^(
echo     echo Starting Claude Code CLI with npx...
echo     npx @anthropic-ai/claude-code
echo     goto :end
echo ^)
echo.
echo :: Method 2: Try globally installed claude-code command
echo where claude-code ^>nul 2^>^&1
echo if %%errorlevel%%==0 ^(
echo     echo Starting Claude Code CLI...
echo     claude-code
echo     goto :end
echo ^)
echo.
echo :: Method 3: Try globally installed claude command
echo where claude ^>nul 2^>^&1
echo if %%errorlevel%%==0 ^(
echo     echo Starting Claude Code CLI...
echo     claude
echo     goto :end
echo ^)
echo.
echo :: Method 4: Try npm exec
echo where npm ^>nul 2^>^&1
echo if %%errorlevel%%==0 ^(
echo     echo Starting Claude Code CLI with npm exec...
echo     npm exec @anthropic-ai/claude-code
echo     goto :end
echo ^)
echo.
echo :: If nothing worked, try to install it
echo echo.
echo echo ========================================
echo echo Claude Code CLI Not Found
echo echo ========================================
echo echo.
echo.
echo :: Check if npm is available for installation
echo where npm ^>nul 2^>^&1
echo if %%errorlevel%%==0 ^(
echo     echo Node.js is installed. Installing Claude Code CLI...
echo     echo.
echo     echo Running: npm install -g @anthropic-ai/claude-code
echo     echo This may take a minute...
echo     echo.
echo     npm install -g @anthropic-ai/claude-code
echo     
echo     if %%errorlevel%%==0 ^(
echo         echo.
echo         echo Installation successful! Launching Claude Code CLI...
echo         echo.
echo         claude-code
echo         goto :end
echo     ^) else ^(
echo         echo.
echo         echo Installation failed. Please try manually:
echo         echo npm install -g @anthropic-ai/claude-code
echo         echo.
echo         pause
echo         goto :end
echo     ^)
echo ^) else ^(
echo     echo Node.js is not installed!
echo     echo.
echo     echo ========================================
echo     echo Installing Node.js automatically...
echo     echo ========================================
echo     echo.
echo     
echo     :: Download Node.js installer using PowerShell
echo     echo Downloading Node.js installer...
echo     powershell -Command "& {[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12; Invoke-WebRequest -Uri 'https://nodejs.org/dist/v20.11.0/node-v20.11.0-x64.msi' -OutFile '%%TEMP%%\nodejs-installer.msi'}"
echo     
echo     if exist "%%TEMP%%\nodejs-installer.msi" ^(
echo         echo.
echo         echo Installing Node.js...
echo         echo Please follow the installer prompts.
echo         echo.
echo         :: Run the installer
echo         msiexec /i "%%TEMP%%\nodejs-installer.msi" /qb
echo         
echo         :: Wait for installation to complete
echo         echo.
echo         echo Waiting for installation to complete...
echo         timeout /t 10 /nobreak ^>nul
echo         
echo         :: Clean up installer
echo         del "%%TEMP%%\nodejs-installer.msi"
echo         
echo         echo.
echo         echo ========================================
echo         echo Node.js installation complete!
echo         echo ========================================
echo         echo.
echo         echo Please close this window and run start-claude.bat again.
echo         echo The PATH needs to be refreshed for npm to be recognized.
echo         echo.
echo         pause
echo     ^) else ^(
echo         echo.
echo         echo Failed to download Node.js installer.
echo         echo.
echo         echo Please install manually from: https://nodejs.org
echo         echo Then run this batch file again.
echo         echo.
echo         pause
echo     ^)
echo ^)
echo.
echo :end
) > "start-claude.bat"

:: Update claude.config if it exists
if exist "claude.config" (
    echo Updating claude.config...
    (
    echo :: Claude Project Configuration
    echo :: Project: %PROJECT_NAME%
    echo :: Directory: %PROJECT_DIR%
    echo :: Updated: %DATE% %TIME%
    echo :: 
    echo :: This project has strict directory isolation enabled.
    echo :: Claude will NOT access files outside of: %PROJECT_DIR%
    echo ::
    echo :: To modify isolation rules, edit the ISOLATION_PROMPT in start-claude.bat
    ) > "claude.config"
)

echo ========================================
echo Setup Complete!
echo ========================================
echo.
echo Updated files:
echo - CLAUDE.md (context file for Claude)
echo - start-claude.bat (launches Claude Code CLI)
if exist "claude.config" echo - claude.config (project configuration)
echo.
echo Project Name: %PROJECT_NAME%
echo Project Directory: %PROJECT_DIR%
echo.
echo How to use:
echo 1. Double-click start-claude.bat to launch Claude Code CLI
echo 2. Tell Claude to read CLAUDE.md for context
echo.
pause