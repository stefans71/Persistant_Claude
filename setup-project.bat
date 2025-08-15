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

:: Create CLAUDE.md file for context
echo Creating CLAUDE.md context file...
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
echo Created: %DATE% %TIME%
) > "CLAUDE.md"

:: Create start-claude.bat
echo Creating start-claude.bat...
(
echo @echo off
echo echo ========================================
echo echo Launching Claude Code for: %PROJECT_NAME%
echo echo ========================================
echo echo.
echo echo Opening project: %%CD%%
echo echo.
echo.
echo :: Try multiple methods to launch Claude Code
echo :: Method 1: Try AnthropicClaude installation path
echo if exist "C:\Users\%%USERNAME%%\AppData\Local\AnthropicClaude\claude.exe" ^(
echo     start "" "C:\Users\%%USERNAME%%\AppData\Local\AnthropicClaude\claude.exe" "%%CD%%"
echo     exit
echo ^)
echo.
echo :: Method 2: Try Program Files
echo if exist "C:\Program Files\Claude\Claude.exe" ^(
echo     start "" "C:\Program Files\Claude\Claude.exe" "%%CD%%"
echo     exit
echo ^)
echo.
echo :: Method 3: Try launching via protocol handler
echo start claude://open?path="%%CD%%"
echo timeout /t 2 /nobreak ^>nul 2^>^&1
echo.
echo :: Method 4: Try via system PATH
echo where claude ^>nul 2^>^&1
echo if %%errorlevel%%==0 ^(
echo     claude "%%CD%%"
echo     exit
echo ^)
echo.
echo :: If Claude Code not found, show instructions
echo echo.
echo echo ========================================
echo echo Claude Code doesn't appear to be installed!
echo echo ========================================
echo echo.
echo echo Please install Claude Code from:
echo echo https://claude.ai/download
echo echo.
echo echo Once installed, run this file again.
echo echo.
echo echo Your project has a CLAUDE.md file ready for context.
echo echo.
echo pause
) > "start-claude.bat"

echo ========================================
echo Setup Complete!
echo ========================================
echo.
echo Created:
echo - CLAUDE.md (context file for Claude)
echo - start-claude.bat (instructions)
echo.
echo How to use:
echo 1. Open Claude Code (the app you already have)
echo 2. Open this project folder
echo 3. Tell Claude to read CLAUDE.md for context
echo.
pause