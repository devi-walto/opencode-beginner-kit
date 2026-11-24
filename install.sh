#!/usr/bin/env bash
# Copies the beginner rules, skills and slash commands into opencode's global config
# (~/.config/opencode), so every project he opens gets them. Anything already there
# with the same name is backed up first, never silently overwritten.
set -euo pipefail

src="$(cd "$(dirname "$0")" && pwd)/config/opencode"
dest="${XDG_CONFIG_HOME:-$HOME/.config}/opencode"
backup="$dest/backup-$(date +%Y%m%d-%H%M%S)"

mkdir -p "$dest/skills" "$dest/commands"

copy() {  # copy <relative path>, backing up an existing file or folder first
  if [ -e "$dest/$1" ]; then
    mkdir -p "$backup/$(dirname "$1")"
    mv "$dest/$1" "$backup/$1"
    echo "backed up existing $1"
  fi
  cp -R "$src/$1" "$dest/$1"
  echo "installed $1"
}

copy AGENTS.md
for d in "$src"/skills/*/;   do copy "skills/$(basename "$d")"; done
for f in "$src"/commands/*.md; do copy "commands/$(basename "$f")"; done

[ -d "$backup" ] && echo "old files are in $backup"
echo "done. restart opencode, then type /start"
