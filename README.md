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
- **Directory Isolation**: Claude is strictly restricted to your project directory - prevents accidental access to parent/sibling directories
- **One-Click Setup**: Automated installation and configuration
- **No Windows Terminal Required**: Works directly with Command Prompt
- **Auto-Recovery**: Conversations persist even after system restarts
- **200K Token Context**: Full Claude context window per project


## I had Claude Code build this so I don't have to worry about Claude losing context for each of my projects. I hope it helps others with this same issue.

## 🔍 Security & Verification
**Last developer verification:** August 15, 2025  
**Status:** Clean - No issues found

### Verify It Yourself with Claude Code:
For your security, **please verify this repository yourself** before using:
1. Open this repository in Claude Code
2. Copy and paste this comprehensive security audit prompt:

```
Please perform a COMPREHENSIVE SECURITY AUDIT of the repository located at the current directory where this README.md file exists. Use all available tools (Read, Grep, LS, etc.) to thoroughly examine EVERY file in this directory for malicious code, security vulnerabilities, and privacy risks.

## SYSTEM SECURITY CHECKS:
1. Registry modifications beyond documented WSL installation
2. Creation of new user accounts or modification of existing ones
3. Scheduled tasks, startup items, or persistence mechanisms
4. Privilege escalation attempts or UAC bypasses
5. Modifications to system files, hosts file, or PATH environment
6. Attempts to disable Windows Defender, antivirus, or firewall
7. PowerShell execution policy changes

## NETWORK & DATA SECURITY:
1. Unauthorized network connections or data exfiltration
2. DNS hijacking or proxy configuration changes
3. Firewall rule modifications
4. Hidden downloads from non-official sources
5. Curl/wget/Invoke-WebRequest to suspicious domains
6. Reverse shells or remote access tools
7. Data collection or telemetry not disclosed

## FILE ANALYSIS - Check ALL files, especially:
- *.bat, *.cmd, *.ps1, *.sh, *.bash files
- Hidden files (starting with .)
- Any embedded or encoded content

## MALICIOUS CODE PATTERNS TO DETECT:
1. Base64 encoded executables or scripts
2. Obfuscated or encrypted payloads
3. PowerShell download cradles (IEX, DownloadString, etc.)
4. Cryptocurrency miners or resource hijacking
5. Keyloggers, clipboard monitors, or screen capture
6. Browser hijacking or credential theft attempts
7. Backdoors, trojans, or rootkits

## SPECIFIC FILE VERIFICATION:
1. INSTALL-PREREQUISITES.bat:
   - Verify it ONLY installs: WSL, Ubuntu, Node.js, Claude CLI, tmux
   - Confirm all URLs are official (Microsoft, Ubuntu, NPM)
   - Check for any hidden commands between legitimate ones
   
2. All .sh scripts:
   - Verify no access outside project directory
   - Check for hidden background processes (&, nohup, disown)
   - Look for suspicious environment modifications

3. Template files:
   - Ensure no pre-configured malicious content
   - Verify no hidden execution triggers

## RED FLAGS - IMMEDIATE UNSAFE if found:
- Any cryptocurrency addresses or wallet references
- Connections to IP addresses instead of domains
- Obfuscated strings or deliberate code hiding
- Attempts to modify security software
- Unexplained binary data or executables
- Commands that delete or encrypt user files
- Network traffic to non-Microsoft/Ubuntu/NPM domains

## REQUIRED OUTPUT FORMAT:
Provide a clear security summary with visual indicators:

### SECURITY AUDIT SUMMARY:
Use these symbols for each category:
- ✅ = Verified SAFE
- ⚠️ = Warning/Note (not dangerous but worth mentioning)  
- 🚫 = DANGER/MALICIOUS CODE FOUND

Example format:
```
SECURITY AUDIT RESULTS - [Repository Name]
=========================================
✅ System Security: No privilege escalation or system modifications
✅ Network Security: All connections to legitimate sources only
✅ File Integrity: All scripts perform only documented functions
✅ Privacy: No data collection or telemetry
✅ Installation Sources: Microsoft, Ubuntu, NPM official repos only

⚠️ Notes: [Any minor observations]
🚫 Dangers: [Any malicious code found - DO NOT USE if this appears]

FINAL VERDICT: [SAFE/UNSAFE]
```

## FINAL REQUIREMENTS:
1. Provide the formatted summary above
2. Give clear SAFE or UNSAFE verdict
3. If ANY 🚫 appears, verdict must be UNSAFE
4. List specific files checked
5. Users should see ALL ✅ before using this repository

BE EXTREMELY THOROUGH - User security depends on your analysis!
```

3. Claude will perform an exhaustive security review
4. **Only proceed if Claude gives a clear "SAFE" verdict**
5. If ANY suspicious code is found, do not use the repository

*We encourage this practice for ANY repository you download from the internet!*



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

The system uses three layers:
- **tmux**: Manages terminal sessions (background running)
- **Claude CLI**: Maintains conversation persistence
- **Directory Isolation**: Enforces strict workspace boundaries

Each project gets:
- Unique tmux session named after the project
- Isolated conversation history
- Independent 200K token context
- Automatic resume capability
- Strict directory isolation - Claude cannot access files outside your project folder

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
- Claude is isolated to your project directory - won't accidentally read parent folders or follow imports outside

  ## ## 🚀 Roadmap

### Current Features (v1.0)
- ✅ Project isolation
- ✅ Persistent sessions per project
- ✅ Directory access restrictions

### Planned Features (v2.0)
- [ ] Context checkpoints - Save/load specific context states
- [ ] Checkpoint browser - Easy selection of saved contexts  
- [ ] Export context to markdown for team sharing
- [ ] Auto-checkpoint on task completion

### Future Ideas
- [ ] Context templates for common workflows
- [ ] Team checkpoint sharing
- [ ] Integration with git branches

## 🤝 Contributing

Feel free to submit issues and enhancement requests!

## 📄 License

MIT License - feel free to use this template for your projects

## 🙏 Credits

Created to solve the problem of managing multiple Claude Code projects with persistent context across sessions.

---

**Note**: Requires a Claude Pro subscription ($20/month). The Claude CLI authenticates through your browser - no API keys needed. Visit [Claude.ai](https://claude.ai) to subscribe.
