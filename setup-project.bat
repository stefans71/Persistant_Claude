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
echo echo Claude Code Context: %PROJECT_NAME%
echo echo ========================================
echo echo.
echo echo Directory: %CD%
echo echo.
echo echo This project has a CLAUDE.md file with context.
echo echo.
echo echo To use with Claude Code:
echo echo 1. Make sure Claude Code is already running
echo echo 2. Open this folder in Claude Code
echo echo 3. Say: "Read the CLAUDE.md file for context"
echo echo.
echo echo If you need to install Claude Code:
echo echo https://claude.ai/download
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