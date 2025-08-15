# Project Template

This template provides automated Claude Code integration for new projects.

## First Time Setup (For New Users)

If Claude Code has never been installed on this computer:
1. **Right-click `INSTALL-PREREQUISITES.bat`** and select "Run as administrator"
2. Follow the installation prompts (may require one restart)
3. **Authenticate Claude:**
   - Click Windows Start menu, type "Ubuntu", click the Ubuntu app
   - In the Ubuntu terminal window, type: `claude login`
   - Press Enter and follow the prompts (opens a browser to login)
   - Close Ubuntu window when done
4. You're ready to use the template!

## Quick Start - New Project (3 Steps)

1. **Copy this entire folder** and rename it to your project name
2. **Double-click `setup-project.bat`** to configure everything automatically
3. **Double-click `claude.bat`** to start Claude Code

That's it! No manual editing required.

## Quick Start - Existing Project (3 Steps)

To add Claude Code to a project you already have:

1. **Copy these files** into your existing project folder:
   - `setup-project.bat`
   - `claude.bat.template`
   - `launch-claude.sh.template`
2. **Double-click `setup-project.bat`** in your project folder
3. **Double-click `claude.bat`** to start Claude Code

The setup script will:
- Detect your project name from the folder
- Create customized launcher files
- Delete the template files when done

## What Happens During Setup

The `setup-project.bat` script automatically:
- Detects your project name from the folder name
- Creates customized `claude.bat` and `launch-claude.sh` files
- Sets up proper paths and session names
- Removes template files
- Deletes itself when done

## How Claude Sessions Work

### Two-Layer System:
1. **tmux** - Keeps your terminal session running in the background (resets when computer restarts)
2. **Claude** - Saves all your conversations permanently (never lost, even after reboot)

When your computer restarts:
- tmux session ends (just the terminal window)
- Claude conversation history remains saved
- Running `claude.bat` will resume exactly where you left off

## Daily Usage

- **Start/Resume**: Double-click `claude.bat` or run from Command Prompt
- **Alternative**: Use `start-claude.bat` if you prefer
- **Leave session running in background**: 
  - Press `Ctrl+B` (hold both keys)
  - Release, then press `D`
  - This "detaches" - Claude keeps running, you can close the window
  - Run `claude.bat` again to reattach
- **Exit Claude**: Type `exit` at the Claude prompt

## Multiple Projects

Each project maintains its own:
- Separate tmux session
- Independent Claude conversation history  
- Unique context and memory

You can work on multiple projects simultaneously without interference.

## Context and Memory

**Current Setup:**
- Claude has a 200K token context window (approximately 150,000 words)
- Each project maintains its own conversation history
- Recent conversations are automatically loaded when you resume

**To manage context:**
- View current usage: Type `/context` in Claude
- Clear context and start fresh: Type `/clear` in Claude
- See all commands: Type `/help` in Claude

**To increase context (if needed):**
- Edit `launch-claude.sh` in your project folder
- Change `claude code -c` to `claude code -c --max-tokens 200000`
- Note: Higher context uses more API credits

## Troubleshooting

**"The system cannot find the file specified"**
- Make sure WSL Ubuntu is installed
- Try running from Command Prompt instead of double-clicking
- Run `wsl -l -v` to verify Ubuntu is installed

**"claude: command not found"**
- Ensure Claude CLI is installed: `npm install -g @claude-cli/claude`

**tmux errors**
- Usually Windows line endings issue
- The setup script handles this automatically

**Windows Terminal issues**
- This template uses direct WSL commands, avoiding Windows Terminal dependency
- Works reliably from Command Prompt

## Manual Session Management

```bash
# List all sessions
tmux list-sessions

# Attach to specific project
tmux attach -t claude-[project-name]

# Kill a session
tmux kill-session -t claude-[project-name]
```

## Sharing This Template

To share with friends or colleagues:
1. Zip this entire template folder
2. They run `INSTALL-PREREQUISITES.bat` as admin (first time only)
3. They can then use the template for all their projects

## Technical Notes

- Uses `wsl.exe -d Ubuntu` for reliable WSL access
- No Windows Terminal dependency
- Automatically handles path conversion (Windows → WSL)
- Preserves conversation context across sessions
- Includes automated installer for all prerequisites