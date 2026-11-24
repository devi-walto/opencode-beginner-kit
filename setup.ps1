# One-time setup for a brand-new coder on Windows (no WSL needed).
# Gets git, the GitHub command line tool, Node.js and opencode ready, signs in to GitHub,
# then installs the beginner rules and skills. Safe to run again: it skips what's done.
# Run it with:  powershell -ExecutionPolicy Bypass -File setup.ps1
# Not "Stop": Windows PowerShell 5.1 treats any text a program writes to its error
# stream as a failure, and git/gh/winget write normal progress there.
$ErrorActionPreference = "Continue"

function Say($text) { Write-Host "`n==> $text" -ForegroundColor Cyan }
function Refresh-Path {  # lets this window see programs that were just installed
  $env:Path = [Environment]::GetEnvironmentVariable("Path", "Machine") + ";" +
              [Environment]::GetEnvironmentVariable("Path", "User")
}

if (-not (Get-Command winget -ErrorAction SilentlyContinue)) {
  Write-Host "winget is missing. Install 'App Installer' from the Microsoft Store, then run this again."
  exit 1
}

Say "Installing git, the GitHub tool (gh) and Node.js (Windows may ask for permission)"
foreach ($id in "Git.Git", "GitHub.cli", "OpenJS.NodeJS.LTS") {
  winget list --id $id -e *> $null
  if ($LASTEXITCODE -eq 0) { Write-Host "$id already installed" }
  else { winget install --id $id -e --source winget --accept-package-agreements --accept-source-agreements }
}
Refresh-Path

Say "Telling git who you are (this is just the name on your save points)"
if (-not (git config --global user.name)) {
  git config --global user.name (Read-Host "Your name")
}
if (-not (git config --global user.email)) {
  Write-Host "Use your GitHub email, or the private one GitHub gives you under Settings > Emails"
  git config --global user.email (Read-Host "Your email")
}
git config --global init.defaultBranch main   # new projects start on a branch called main

Say "Signing in to GitHub (a browser page will open; copy the code it shows you)"
gh auth status *> $null
if ($LASTEXITCODE -eq 0) { Write-Host "already signed in" }
else { gh auth login --hostname github.com --git-protocol https --web }
gh auth setup-git   # git uses this sign-in, so no passwords to type when pushing

Say "Installing opencode"
if (Get-Command opencode -ErrorAction SilentlyContinue) { Write-Host "already installed" }
else { npm install -g opencode-ai; Refresh-Path }

Say "Installing the beginner rules, skills and commands"
& (Join-Path $PSScriptRoot "install.ps1")

# Not Documents: Windows often syncs Documents to OneDrive, which fights with code folders.
$projects = Join-Path $HOME "Projects"
New-Item -ItemType Directory -Force -Path $projects | Out-Null

Say "All set"
Write-Host @"
Next:
  1. Close this window and open a new PowerShell (so it finds everything).
  2. Connect opencode to an AI model:   opencode auth login
  3. Go to your projects folder:        cd "$projects"
  4. Start opencode:                    opencode
  5. Type:                              /start
"@
