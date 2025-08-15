@echo off
setlocal enabledelayedexpansion

:: Get the current directory name for the project name
for %%I in (.) do set "PROJECT_NAME=%%~nxI"

:: Get the full current directory path
set "PROJECT_DIR=%CD%"

echo ========================================
echo Setting up Claude Project: %PROJECT_NAME%
echo Project Directory: %PROJECT_DIR%
echo ========================================
echo.

:: Create the launch script for this specific project
echo Creating launch script for %PROJECT_NAME%...

(
echo @echo off
echo setlocal enabledelayedexpansion
echo.
echo :: Project-specific configuration
echo set "PROJECT_NAME=%PROJECT_NAME%"
echo set "PROJECT_DIR=%PROJECT_DIR%"
echo.
echo echo ========================================
echo echo Claude Project: %%PROJECT_NAME%%
echo echo Directory: %%PROJECT_DIR%%
echo echo ========================================
echo echo.
echo echo IMPORTANT: Claude is restricted to files in this directory only.
echo echo Claude will NOT access parent or sibling directories.
echo echo.
echo.
echo :: Set strict directory isolation prompt
echo set "ISOLATION_PROMPT=CRITICAL WORKSPACE RULES: You are working ONLY in '%%PROJECT_DIR%%'. NEVER read, access, or follow references to files outside this directory. Do not access parent directories ^(.../^) or absolute paths. Do not follow import statements that lead outside this directory. If you encounter references to external files, do not read them. Treat this project as completely isolated. If you need to access external resources, ask for explicit permission first."
echo.
echo :: Launch Claude with the specific project context and isolation rules
echo echo Starting Claude with isolated context for %%PROJECT_NAME%%...
echo echo.
echo claude "%%ISOLATION_PROMPT%% You are now working on the %%PROJECT_NAME%% project located at %%PROJECT_DIR%%. Remember this context for our entire conversation."
echo.
echo :: Keep the window open
echo echo.
echo echo ========================================
echo echo Claude session ended for %%PROJECT_NAME%%
echo echo ========================================
echo pause
) > "start-claude.bat"

echo Launch script created successfully!
echo.

:: Create an optional configuration file for reference
echo Creating project configuration file...

(
echo :: Claude Project Configuration
echo :: Project: %PROJECT_NAME%
echo :: Directory: %PROJECT_DIR%
echo :: Created: %DATE% %TIME%
echo :: 
echo :: This project has strict directory isolation enabled.
echo :: Claude will NOT access files outside of: %PROJECT_DIR%
echo ::
echo :: To modify isolation rules, edit the ISOLATION_PROMPT in start-claude.bat
) > "claude.config"

echo Configuration file created!
echo.
echo ========================================
echo Setup complete for %PROJECT_NAME%!
echo ========================================
echo.
echo You can now use:
echo   - start-claude.bat : Launch Claude with isolated context for this project
echo   - claude.config    : View project configuration
echo.
echo DIRECTORY ISOLATION: ENABLED
echo Claude will be restricted to: %PROJECT_DIR%
echo.
pause