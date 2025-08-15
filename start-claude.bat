@echo off
echo ========================================
echo Launching Claude Code CLI for: Project_Template---Copy
echo ========================================
echo.
echo Opening project: %CD%
echo.

:: Launch Claude Code CLI in current directory
claude-code

:: If claude-code command not found, try alternative command names
if %errorlevel% neq 0 (
    echo Trying alternative command: claude...
    claude
)

:: If still not found, show instructions
if %errorlevel% neq 0 (
    echo.
    echo ========================================
    echo Claude Code CLI doesn't appear to be installed
    echo ========================================
    echo.
    echo Please install Claude Code CLI using:
    echo npm install -g @anthropic/claude-code
    echo.
    echo Or download from:
    echo https://github.com/anthropics/claude-code
    echo.
    echo Once installed, run this file again.
    echo.
    pause
)
