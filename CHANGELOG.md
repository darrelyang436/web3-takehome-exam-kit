# Changelog

All notable changes to this take-home kit are documented in this file.

## [1.7.5] - 2026-05-14

### Added
- Dashboard begin button UX feedback: click now changes button text to `Starting...` and disables repeat clicks until flow completes.
- One-step VSIX install scripts:
  - `install-proctor-vsix.sh` (bash)
  - `install-proctor-vsix.ps1` (PowerShell)

### Changed
- `Download exam script & begin session` now uses a fixed built-in URL from `downloadScriptWizard.js`.
- Begin-session flow removes confirmation modal and runs directly after click.
- Begin-session failure paths are silent (no warning/error popups), while preserving timer-start-on-success behavior.
- Proctor side panel moved to a stable TreeView layout with grouped telemetry/actions and a prominent dashboard entry.

## [1.6.0] - 2026-05-14

### Added
- `Download exam script & begin session` command and dashboard action.
- Exam clock reset hook on successful begin-session flow.

## [1.5.0] - 2026-05-14

### Added
- Session attestation export reminder notification and dashboard entry flow.
