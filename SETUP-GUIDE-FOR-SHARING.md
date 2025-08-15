# Claude Code Project Template - Setup Guide

## Prerequisites (One-Time Setup)

Before using this template, you need:

### 1. Install WSL2 with Ubuntu
```powershell
# Run in PowerShell as Administrator
wsl --install -d Ubuntu
```
- Restart computer after installation
- Set up a username/password when Ubuntu first launches

### 2. Install Node.js in WSL Ubuntu
```bash
# Open Ubuntu terminal and run:
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.0/install.sh | bash
source ~/.bashrc
nvm install --lts
nvm use --lts
```

### 3. Install Claude CLI
```bash
# In Ubuntu terminal:
npm install -g @anthropic/claude-cli
```

### 4. Install tmux
```bash
# In Ubuntu terminal:
sudo apt update
sudo apt install tmux
```

### 5. Authenticate Claude
```bash
# In Ubuntu terminal:
claude login
```
Follow the prompts to authenticate with your Anthropic account.

## Using the Template

Once prerequisites are installed:

1. **Copy the template folder** to any location on your Windows machine
2. **Rename the folder** to your project name
3. **Double-click `setup-project.bat`** - this configures everything
4. **Double-click `claude.bat`** - starts Claude Code

## Verification Commands

To check if everything is installed:

```powershell
# In Windows Command Prompt:
wsl -l -v                    # Should show Ubuntu
wsl -d Ubuntu which claude   # Should show /usr/local/bin/claude or similar
wsl -d Ubuntu which tmux     # Should show /usr/bin/tmux
```

## Common Issues

**"WSL 2 requires an update to its kernel component"**
- Download and install: https://aka.ms/wsl2kernel

**"Ubuntu not found"**
- Make sure to use exactly "Ubuntu" in commands, not "Ubuntu-20.04" or other variants
- Or modify the .bat files to match your WSL distribution name

**Performance on Windows 10**
- WSL2 works best on Windows 10 version 2004+ or Windows 11
- Enable virtualization in BIOS if WSL2 is slow

## Sharing This Template

To share with others:
1. Zip the entire template folder
2. Send them this SETUP-GUIDE-FOR-SHARING.md file
3. They follow the prerequisites, then use the template

## What This Template Does

- Creates isolated Claude Code sessions for each project
- Maintains conversation history per project
- Allows multiple projects to run simultaneously
- Works without Windows Terminal dependency
- Automatically configures all paths and settings

## Support

- Claude CLI docs: https://docs.anthropic.com/en/docs/claude-cli
- WSL docs: https://docs.microsoft.com/en-us/windows/wsl/
- tmux cheatsheet: https://tmuxcheatsheet.com/