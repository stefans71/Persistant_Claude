@echo off
setlocal enabledelayedexpansion

:: Project-specific configuration
set "PROJECT_NAME=Project_Template---Copy"
set "PROJECT_DIR=C:\Users\Scott\Desktop\Sofware_Dev\Project_Template---Copy"

echo ========================================
echo Claude Project: %PROJECT_NAME%
echo Directory: %PROJECT_DIR%
echo ========================================
echo.
echo IMPORTANT: Claude is restricted to files in this directory only.
echo Claude will NOT access parent or sibling directories.
echo.

:: Set strict directory isolation prompt
set "ISOLATION_PROMPT=CRITICAL WORKSPACE RULES: You are working ONLY in '%PROJECT_DIR%'. NEVER read, access, or follow references to files outside this directory. Do not access parent directories ^(.../^) or absolute paths. Do not follow import statements that lead outside this directory. If you encounter references to external files, do not read them. Treat this project as completely isolated. If you need to access external resources, ask for explicit permission first."

:: Launch Claude with the specific project context and isolation rules
echo Starting Claude with isolated context for %PROJECT_NAME%...
echo.
claude "%ISOLATION_PROMPT% You are now working on the %PROJECT_NAME% project located at %PROJECT_DIR%. Remember this context for our entire conversation."

:: Keep the window open
echo.
echo ========================================
echo Claude session ended for %PROJECT_NAME%
echo ========================================
pause
