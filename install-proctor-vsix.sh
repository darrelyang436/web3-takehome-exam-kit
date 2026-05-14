#!/usr/bin/env bash
set -euo pipefail

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

if ! command -v code >/dev/null 2>&1; then
  echo "ERROR: 'code' command not found. In VS Code run: Shell Command: Install 'code' command in PATH"
  exit 1
fi

if ! ls "$ROOT_DIR"/takehome-exam-monitor-*.vsix >/dev/null 2>&1; then
  echo "ERROR: No takehome-exam-monitor-*.vsix found beside this script."
  echo "Put the VSIX in repo root, then rerun."
  exit 1
fi

LATEST_VSIX="$(ls "$ROOT_DIR"/takehome-exam-monitor-*.vsix | sort -V | tail -n 1)"
echo "Installing: $LATEST_VSIX"
code --install-extension "$LATEST_VSIX" --force
echo "Done. Reload VS Code window if prompted."
