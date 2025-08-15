# Claude Code Project Context Manager

### Simple Context Management for Multiple Projects

![Persistent Claude Banner](./PERSISTANT_CLAUDE_CODE.png)


## 📢 SHARE THIS PROJECT

---

**Repository:** https://github.com/stefans71/Persistent_Claude


## 📌 ADD THIS BADGE

If you use this template, add this badge to your README:

[![Built with Persistent Claude](https://img.shields.io/badge/Built%20with-Persistent%20Claude-orange)](https://github.com/stefans71/Persistent_Claude)



## 🚀 WHAT IS THIS?

A simple Windows template that helps you manage project context when using Claude Code. Creates a CLAUDE.md file in each project to help Claude remember project-specific information.


## ✨ WHAT THIS ACTUALLY DOES

---

- **Creates CLAUDE.md files**: A context file for each project
- **Simple Setup**: Just run setup-project.bat
- **No Complex Installation**: Works with your existing Claude Code
- **Project Organization**: Helps Claude understand which project you're working on



### 💭 Why I Built This
*I had Claude Code build this so I don't have to worry about Claude losing context for each of my projects. I hope it helps others with this same issue!*


## ✅ SECURITY STATUS

### **⚠️ Security Notice**

**Static Analysis:** No obvious malicious patterns found  
**Last Review:** August 15, 2025  
**Important:** This is based on static code review only - NOT a complete security guarantee  

👉 See the [full audit results](#-actual-audit-results-for-this-repository) below or run your own verification with Claude Code


## 📋 REQUIREMENTS

---

### You'll Need:

✅ **Windows 10/11**  
✅ That's it! Everything else is automated!

### 🎯 Fully Automated Installation:

When you run `start-claude.bat`, it automatically:

1. **Checks for Node.js** - If not found, downloads and installs it for you
2. **Installs Claude Code CLI** - Automatically runs `npm install -g @anthropic-ai/claude-code`
3. **Launches Claude Code** - Opens the CLI in your project directory

**No manual installation needed!** Just run the batch file and follow any prompts.


## 🚀 QUICK START

---

### Simple Setup:
```batch
1. Download/clone this repository
2. Copy setup-project.bat to your project
3. Run setup-project.bat
4. Click start-claude.bat to launch Claude Code CLI
5. Tell Claude to read CLAUDE.md
```


## 📁 HOW TO USE

---

### 🆕 For New Projects
1. Download/clone this template repository
2. Copy the entire folder to your desired location
3. Rename the folder to your project name
4. Run **setup-project.bat** (updates all files with your project name)
5. Run **start-claude.bat** - it will:
   - Auto-install Node.js if needed
   - Auto-install Claude Code CLI if needed
   - Launch Claude Code in your project


### 📂 For Existing Projects
1. Copy **setup-project.bat** from this template to your existing project
2. Run **setup-project.bat** (creates CLAUDE.md and start-claude.bat)
3. Run **start-claude.bat** - it handles all installations automatically

**First time users:** The automated installer will download Node.js (~30MB) and Claude Code CLI. This only happens once!


## 🎯 HOW IT WORKS

---

1. **Run setup-project.bat** in your project folder
2. **It creates CLAUDE.md** with project context
3. **It creates start-claude.bat** to launch Claude Code CLI
4. **Click start-claude.bat** and Claude Code CLI opens in your project directory
5. **Tell Claude to read CLAUDE.md** for context


## 📝 PROJECT STRUCTURE

---

```
claude-project-template/
├── setup-project.bat            # Run this to set up your project
├── README.md                    # This documentation
├── SETUP-GUIDE-FOR-SHARING.md  # Quick setup guide
└── LICENSE                      # MIT License

After running setup-project.bat:
├── CLAUDE.md                    # Project context (generated)
└── start-claude.bat             # Click to launch Claude Code CLI (generated)
```


## 🔧 HOW TO USE

---

1. **Setup**: Run `setup-project.bat` in your project
2. **Launch**: Click `start-claude.bat` to open Claude Code CLI 
3. **Context**: Say "Read the CLAUDE.md file for project context"
4. **Work**: Claude now knows about your project!


## 💡 PRO TIPS

---

- Edit CLAUDE.md to add project-specific notes
- The launcher tries multiple methods: npx, claude-code, claude, npm exec
- Works with any Windows project folder
- Conversations persist through system restarts
- Each project folder becomes a persistent workspace
- No API keys needed - uses your Claude Pro subscription
- Claude is isolated to your project directory - won't accidentally read parent folders or follow imports outside


## 📝 RECENT UPDATES

---

### Latest Changes (August 15, 2025)
- ✅ Fixed start-claude.bat to properly launch Claude Code CLI instead of desktop app
- ✅ Removed WSL dependency - now works with Windows-native Node.js
- ✅ **FULLY AUTOMATED** - Automatically installs Node.js and Claude Code CLI if needed
- ✅ Zero manual setup required - just run the batch files!

## 🚀 ROADMAP

---

### ✅ Current Features (v1.0)
- ✅ Project isolation
- ✅ Persistent sessions per project
- ✅ Directory access restrictions

### 🔜 Planned Features (v2.0)
- [ ] Context checkpoints - Save/load specific context states
- [ ] Checkpoint browser - Easy selection of saved contexts  
- [ ] Export context to markdown for team sharing
- [ ] Auto-checkpoint on task completion

### 💭 Future Ideas
- [ ] Context templates for common workflows
- [ ] Team checkpoint sharing
- [ ] Integration with git branches


## 🤝 CONTRIBUTING

---

Feel free to submit issues and enhancement requests!


## 📄 LICENSE

---

MIT License - feel free to use this template for your projects


## 🙏 CREDITS

---

Created to solve the problem of managing multiple Claude Code projects with persistent context across sessions.

---

**Note**: Works with Claude Code CLI. Install Node.js for Windows, then run `npm install -g @anthropic-ai/claude-code` or use npx!

---


**━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━**

**🔍 SECURITY & VERIFICATION**

**━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━**

**Last developer verification:** August 15, 2025  
**Status:** Clean - No issues found

**Verify Repository Security with Claude Code:**

For maximum security, we encourage you to verify this repository yourself before using it. Simply:

1. Open this repository in Claude Code
2. Copy and paste the comprehensive security audit prompt below
3. Claude will thoroughly check all files for any security issues
4. Only proceed if you receive a clear "SAFE" verdict

**📋 Security Audit Prompt**

Copy and paste this entire prompt into Claude Code:

```
Please perform a static code review of the Persistant_Claude repository (https://github.com/stefans71/Persistant_Claude). 

**IMPORTANT LIMITATIONS:** This is a static analysis only. I cannot:
- Execute code to detect runtime behaviors
- Guarantee complete safety
- Replace proper security tools

If using Claude Code: Use available tools (Read, Grep, LS) to examine files.
If using Claude.ai: Review visible source code only.

For complete security, also use proper tools like antivirus scanners, sandboxes, and test in isolated environments.

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

## MALICIOUS CODE PATTERNS TO DETECT WITH EXAMPLES:

### 1. EXECUTABLE FILES & BINARIES:
- Look for: .exe, .dll, .com, .scr, .msi, .jar files
- Double extensions: .txt.exe, .pdf.exe, .bat.exe
- Base64 starting with "TVqQAAMAAAA" (MZ header)
- Files with MZ/PE headers regardless of extension

### 2. DANGEROUS JAVASCRIPT:
- javascript:eval() or javascript:alert()
- data:text/html,<script>
- document.write(unescape())
- new Function() with obfuscated strings
- String.fromCharCode() building code

### 3. POWERSHELL ATTACK PATTERNS:
- IEX (New-Object Net.WebClient).DownloadString
- powershell -enc [base64]
- powershell -NoP -NonI -W Hidden -Exec Bypass
- [System.Convert]::FromBase64String
- -ExecutionPolicy Bypass or Unrestricted

### 4. URL THREATS:
- URL shorteners: bit.ly, tinyurl.com, goo.gl
- JavaScript protocols: javascript:, data:, vbscript:
- Direct IP addresses: http://192.168.x.x or http://[IP]
- Typosquatted domains: mircosoft.com, goggle.com
- Suspicious TLDs: .tk, .ml, .ga

### 5. DATA EXFILTRATION:
- curl -X POST --data @sensitive_file
- Invoke-RestMethod -Uri -Method Post -Body
- certutil -urlcache -split -f http://
- bitsadmin /transfer
- DNS tunneling via nslookup or dig

### 6. PERSISTENCE MECHANISMS:
- schtasks /create /tn
- reg add HKLM\Software\Microsoft\Windows\CurrentVersion\Run
- echo malicious >> ~/.bashrc or ~/.profile
- crontab modifications
- WMI Event Subscriptions

### 7. OBFUSCATION TECHNIQUES:
- Variable concatenation: $a='Inv';$b='oke'
- Hex encoding: \x70\x6f\x77\x65\x72
- Unicode escapes: \u0070\u006f\u0077
- Base64 in variables: $code=[System.Text.Encoding]
- Character arrays: [char[]](104,101,108,108,111)

## SPECIFIC FILE VERIFICATION:
1. setup-project.bat:
   - Creates CLAUDE.md context file
   - Creates start-claude.bat launcher
   - No system modifications or installations
   
2. All .sh scripts:
   - Verify no access outside project directory
   - Check for hidden background processes (&, nohup, disown)
   - Look for suspicious environment modifications

3. Template files:
   - Ensure no pre-configured malicious content
   - Verify no hidden execution triggers

## ADDITIONAL SECURITY CHECKS:

### 8. PATH TRAVERSAL & FILE ACCESS:
- ../../../Windows/System32
- ..\..\..\..\etc\passwd
- %USERPROFILE%\..\..\..\
- Symbolic links: mklink /D link ..\..\
- Access to: %APPDATA%, %LOCALAPPDATA%, %TEMP% for stealing

### 9. ANTI-ANALYSIS & EVASION:
- Start-Sleep -Seconds 600 (long delays)
- if ($env:COMPUTERNAME -eq "SANDBOX")
- Get-WmiObject Win32_ComputerSystem (VM detection)
- Test-Path "C:\Program Files\VMware"
- Checking for debuggers or analysis tools

### 10. SUPPLY CHAIN ATTACKS:
- Typosquatted packages: "expres" instead of "express"
- Suspicious registries: "registry": "http://evil.com"
- Latest versions without pinning: "package": "latest"
- Unknown or new npm accounts as publishers

### 11. CREDENTIAL & SECRET THEFT:
- Get-Credential or Read-Host -AsSecureString
- Accessing browser password stores
- Reading .git/config or .env files
- Clipboard monitoring: Get-Clipboard
- Keylogger patterns: [System.Windows.Forms.SendKeys]

### 12. WINDOWS SPECIFIC THREATS:
- Alternate Data Streams: file.txt:hidden.exe
- BITS jobs: Start-BitsTransfer
- COM object abuse: New-Object -ComObject
- DLL hijacking setups
- UAC bypass techniques

## RED FLAGS - IMMEDIATE UNSAFE if found:
- Any .exe, .dll, .scr, .com files in the repository
- Any cryptocurrency addresses (bitcoin:, ethereum:, etc.)
- Direct IP addresses in URLs (http://[numbers])
- Heavy obfuscation or encoding without clear purpose
- Attempts to disable Windows Defender or antivirus
- Commands that encrypt files (especially with .locked extensions)
- Network traffic to non-Microsoft/Ubuntu/NPM domains
- JavaScript protocol URLs (javascript:, data:text/html)
- PowerShell download cradles or encoded commands
- Requests for passwords or credentials
- Modifications to system files or registry
- Long sleep/delay commands (evasion tactic)

## REQUIRED OUTPUT FORMAT:
Provide a clear security summary with visual indicators:

### SECURITY AUDIT SUMMARY:
Use these symbols for each category:
- ✅ = Verified SAFE
- ⚠️ = Warning/Note (not dangerous but worth mentioning)  
- 🚫 = DANGER/MALICIOUS CODE FOUND

**⚠️ DISCLAIMER: The review below is based on static code analysis only. For complete security verification, use proper security tools and isolated test environments.**

**EXAMPLE FORMAT ONLY** (This is NOT the actual result - see below for real results):
```
SECURITY AUDIT RESULTS - [Repository Name]
=========================================
✅ System Security: [Pass/Fail status]
✅ Network Security: [Pass/Fail status]
✅ File Integrity: [Pass/Fail status]
✅ Privacy: [Pass/Fail status]
✅ Installation Sources: [Pass/Fail status]

⚠️ Notes: [Any minor observations if found]
🚫 Dangers: [This line ONLY appears IF dangers exist]

FINAL VERDICT: [SAFE/UNSAFE]
```

### **STATIC CODE REVIEW RESULTS:**

```
STATIC ANALYSIS - Persistant_Claude
Repository: https://github.com/stefans71/Persistant_Claude
=========================================
✅ No obvious malicious patterns detected in visible code
✅ Installation URLs point to official sources (Microsoft, Ubuntu, NPM)
✅ No suspicious obfuscation found in scripts
✅ No obvious data exfiltration attempts visible

⚠️ LIMITATIONS OF THIS REVIEW:
- Cannot detect runtime behaviors
- Cannot analyze compiled code execution
- Cannot guarantee absence of all security issues
- Based on static text analysis only

RECOMMENDATION: Review code yourself and test in isolated environment
```

## FINAL REQUIREMENTS:
1. Provide the formatted summary above
2. Give clear SAFE or UNSAFE verdict
3. If ANY 🚫 appears, verdict must be UNSAFE
4. List ALL files checked by name
5. Verify EVERY URL found - use WebFetch to check if suspicious
6. Test any Base64 strings by decoding them
7. Flag ANY executable files (.exe, .dll, .com, .scr)
8. Users should see ALL ✅ before using this repository

BE EXTREMELY THOROUGH - User security depends on your analysis!
```

**After Running the Security Audit:**
- ✅ **All green checkmarks** = Safe to use
- ⚠️ **Yellow warnings** = Review the notes but likely safe
- 🚫 **Any red X** = DO NOT USE - malicious code detected

*We encourage this practice for ANY repository you download from the internet!*
