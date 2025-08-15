# Persistant Claude Code


![Persistent Claude Banner](./PERSISTANT_CLAUDE_CODE.png)

## 📢 Share This Project

**Repository:** `https://github.com/stefans71/Persistent_Claude`

## 📌 Add This Badge
### If you use this template, add this badge to your README:

[![Built with Persistent Claude](https://img.shields.io/badge/Built%20with-Persistent%20Claude-orange)](https://github.com/stefans71/Persistent_Claude)


## 🚀 Persistent Claude Project Manager

### A Windows batch template that provides persistent Claude Code sessions for multiple projects simultaneously. Each project maintains its own conversation history and context.

## ✨ Features

- **Persistent Sessions**: Resume conversations exactly where you left off
- **Multi-Project Support**: Work on multiple projects with isolated contexts
- **One-Click Setup**: Automated installation and configuration
- **No Windows Terminal Required**: Works directly with Command Prompt
- **Auto-Recovery**: Conversations persist even after system restarts
- **200K Token Context**: Full Claude context window per project

## 📋 Requirements

- Windows 10/11
- Claude Pro subscription ($20/month or Pro Plan)
- No API key needed - uses browser authentication

## 🚀 Quick Start

### Option 1: First-Time Setup (Automated)
```batch
1. Download/clone this repository
2. Right-click INSTALL-PREREQUISITES.bat → Run as administrator
3. Follow prompts to install WSL, Ubuntu, Node.js, Claude CLI
4. Open Ubuntu from Start Menu and run: claude login
5. Copy template to create new projects
```

### Option 2: Manual Prerequisites
If you prefer manual installation or already have some components:
- Windows 10/11 with WSL2
- Ubuntu for WSL (`wsl --install -d Ubuntu`)
- Node.js in Ubuntu (via NVM recommended)
- Claude CLI (`npm install -g @anthropic/claude-cli`)
- tmux (`sudo apt install tmux`)

## 📁 Usage

### For New Projects
1. Copy the entire template folder
2. Rename to your project name
3. Double-click `setup-project.bat`
4. Double-click `claude.bat` to start

### For Existing Projects
1. Copy these files to your project:
   - `setup-project.bat`
   - `claude.bat.template`
   - `launch-claude.sh.template`
2. Run `setup-project.bat`
3. Use `claude.bat` to start Claude

## 🎯 How It Works

The system uses two layers:
- **tmux**: Manages terminal sessions (background running)
- **Claude CLI**: Maintains conversation persistence

Each project gets:
- Unique tmux session named after the project
- Isolated conversation history
- Independent 200K token context
- Automatic resume capability

## 📝 Project Structure

```
claude-project-manager/
├── INSTALL-PREREQUISITES.bat    # One-time setup script
├── setup-project.bat            # Project configuration
├── claude.bat.template          # Session launcher template
├── launch-claude.sh.template    # WSL script template
├── start-claude.bat             # Alternative launcher
├── start-claude.sh              # Alternative WSL script
├── README.md                    # Detailed documentation
├── SETUP-GUIDE-FOR-SHARING.md  # Sharing instructions
└── .claude/                     # Claude configuration (auto-created)
```

## 🔧 Commands

Inside Claude sessions:
- `/context` - View context usage
- `/clear` - Clear context and start fresh
- `/help` - See all available commands
- `exit` - Exit Claude

tmux commands:
- `Ctrl+B, D` - Detach (keep running in background)
- `tmux list-sessions` - List all sessions
- `tmux attach -t claude-[project]` - Reattach to session

## 💡 Tips

- Projects automatically resume where you left off
- Multiple projects can run simultaneously
- Conversations persist through system restarts
- Each project folder becomes a persistent workspace
- No API keys needed - uses your Claude Pro subscription

## 🤝 Contributing

Feel free to submit issues and enhancement requests!

## 📄 License

MIT License - feel free to use this template for your projects

## 🙏 Credits

Created to solve the problem of managing multiple Claude Code projects with persistent context across sessions.

---

**Note**: Requires a Claude Pro subscription ($20/month). The Claude CLI authenticates through your browser - no API keys needed. Visit [Claude.ai](https://claude.ai) to subscribe.
