@echo off
echo ========================================
echo Launching Claude Code for: Project_Template---Copy
echo ========================================
echo.
echo Opening project: %CD%
echo.

:: Try multiple methods to launch Claude Code
:: Method 1: Try AnthropicClaude installation path
if exist "C:\Users\%USERNAME%\AppData\Local\AnthropicClaude\claude.exe" (
    start "" "C:\Users\%USERNAME%\AppData\Local\AnthropicClaude\claude.exe" "%CD%"
    exit
)

:: Method 2: Try Program Files
if exist "C:\Program Files\Claude\Claude.exe" (
    start "" "C:\Program Files\Claude\Claude.exe" "%CD%"
    exit
)

:: Method 3: Try launching via protocol handler
start claude://open?path="%CD%"
timeout /t 2 /nobreak >nul 2>&1

:: Method 4: Try via system PATH
where claude >nul 2>&1
if %errorlevel%==0 (
    claude "%CD%"
    exit
)

:: If Claude Code not found, show instructions
echo.
echo ========================================
echo Claude Code doesn't appear to be installed
echo ========================================
echo.
echo Please install Claude Code from:
echo https://claude.ai/download
echo.
echo Once installed, run this file again.
echo.
echo Your project has a CLAUDE.md file ready for context.
echo.
pause
