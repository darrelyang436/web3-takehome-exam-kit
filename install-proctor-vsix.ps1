Set-StrictMode -Version Latest
$ErrorActionPreference = "Stop"

$rootDir = Split-Path -Parent $MyInvocation.MyCommand.Path

if (-not (Get-Command code -ErrorAction SilentlyContinue)) {
  Write-Error "The 'code' command was not found. In VS Code run: Shell Command: Install 'code' command in PATH"
}

$vsixFiles = Get-ChildItem -Path $rootDir -Filter "takehome-exam-monitor-*.vsix" -File | Sort-Object Name
if (-not $vsixFiles) {
  Write-Error "No takehome-exam-monitor-*.vsix found beside this script. Put the VSIX in repo root, then rerun."
}

$latest = $vsixFiles[-1].FullName
Write-Host "Installing: $latest"
code --install-extension $latest --force
Write-Host "Done. Reload VS Code window if prompted."
