#!/usr/bin/env bash
# One-time setup for a brand-new coder on Linux or Windows WSL (Ubuntu).
# Gets git, the GitHub command line tool and opencode ready, signs in to GitHub, then
# installs the beginner rules and skills. Safe to run again: it skips what's already done.
set -euo pipefail

say() { printf '\n\033[1;36m==> %s\033[0m\n' "$1"; }

if ! command -v apt-get >/dev/null; then
  echo "This script expects Ubuntu or Debian (the WSL default). Install git, gh and opencode by hand, then run install.sh."
  exit 1
fi

say "Installing git, the GitHub tool (gh) and curl (it may ask for your Linux password)"
sudo apt-get update -qq
sudo apt-get install -y -qq git gh curl

say "Telling git who you are (this is just the name on your save points)"
if [ -z "$(git config --global user.name || true)" ]; then
  read -rp "Your name: " name
  git config --global user.name "$name"
fi
if [ -z "$(git config --global user.email || true)" ]; then
  echo "Use your GitHub email, or the private one GitHub gives you under Settings → Emails"
  read -rp "Your email: " email
  git config --global user.email "$email"
fi
git config --global init.defaultBranch main   # new projects start on a branch called main
git config --global core.autocrlf input       # stops Windows line endings sneaking into files
git config --global pull.rebase false         # the simplest way to pull others' changes

say "Signing in to GitHub (a browser page will open; copy the code it shows you)"
if gh auth status >/dev/null 2>&1; then
  echo "already signed in"
else
  gh auth login --hostname github.com --git-protocol https --web
fi
gh auth setup-git   # git uses this sign-in, so no passwords to type when pushing

say "Installing opencode"
if command -v opencode >/dev/null || [ -x "$HOME/.opencode/bin/opencode" ]; then
  echo "already installed"
else
  curl -fsSL https://opencode.ai/install | bash
fi

say "Installing the beginner rules, skills and commands"
bash "$(cd "$(dirname "$0")" && pwd)/install.sh"

mkdir -p "$HOME/Projects"

say "All set"
cat <<'EOF'
Next:
  1. Close this terminal and open a new one (so it finds opencode).
  2. Connect opencode to an AI model:   opencode auth login
  3. Go to your projects folder:        cd ~/Projects
  4. Start opencode:                    opencode
  5. Type:                              /start
EOF
