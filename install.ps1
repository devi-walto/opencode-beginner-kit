# Copies the beginner rules, skills and slash commands into opencode's global config
# (%USERPROFILE%\.config\opencode), so every project gets them. Anything already there
# with the same name is backed up first, never silently overwritten.
$ErrorActionPreference = "Stop"

$src = Join-Path $PSScriptRoot "config\opencode"
$base = if ($env:XDG_CONFIG_HOME) { $env:XDG_CONFIG_HOME } else { Join-Path $HOME ".config" }
$dest = Join-Path $base "opencode"
$backup = Join-Path $dest ("backup-" + (Get-Date -Format "yyyyMMdd-HHmmss"))

New-Item -ItemType Directory -Force -Path (Join-Path $dest "skills"), (Join-Path $dest "commands") | Out-Null

function Copy-Item-Safely($rel) {  # back up an existing file or folder, then copy ours in
  $target = Join-Path $dest $rel
  if (Test-Path $target) {
    $saved = Join-Path $backup $rel
    New-Item -ItemType Directory -Force -Path (Split-Path $saved) | Out-Null
    Move-Item $target $saved
    Write-Host "backed up existing $rel"
  }
  Copy-Item (Join-Path $src $rel) $target -Recurse
  Write-Host "installed $rel"
}

Copy-Item-Safely "AGENTS.md"
Get-ChildItem (Join-Path $src "skills") -Directory | ForEach-Object { Copy-Item-Safely "skills\$($_.Name)" }
Get-ChildItem (Join-Path $src "commands") -Filter *.md | ForEach-Object { Copy-Item-Safely "commands\$($_.Name)" }

if (Test-Path $backup) { Write-Host "old files are in $backup" }
Write-Host "done. restart opencode, then type /start"
