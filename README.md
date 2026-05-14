# Web3 take-home: ERC-20 `Transfer` log decoding

Timed exercise (~**60 minutes** suggested) for Web3 engineers: implement ERC-20 `Transfer` log decoding in plain Node.js (see **`exam/TASK.md`**). The **Take-Home Exam Proctor** VS Code extension adds activity-bar telemetry, a dashboard, and an **exportable session attestation** JSON for the interviewer.

---

## Requirements

| Item | Details |
|------|---------|
| **Node.js** | ≥ 18 |
| **Editor** | **Visual Studio Code** recommended |
| **Companion extension** | **Required** — build/install the VSIX from this repo. Primary UI: **activity bar → Proctor**. Session telemetry stays local. **Proctor: Download script from URL** only runs after you type a URL and confirm dialogs yourself. **Proctor: Download exam script & begin session** uses a fixed URL in extension source (`downloadScriptWizard.js`). |
| **Task spec** | **`exam/TASK.md`** (English) |

---

## Quick start

1. Clone the repo and open the **repository root** as a folder in VS Code.  
2. Install the companion extension from a VSIX placed in repo root:

   ```bash
   # Put takehome-exam-monitor-*.vsix beside this README first
   ./install-proctor-vsix.sh
   ```
   PowerShell (Windows):
   ```powershell
   ./install-proctor-vsix.ps1
   ```
   These scripts auto-detect the newest `takehome-exam-monitor-*.vsix` from the repo root, then run `code --install-extension ... --force`.  
   (Requires `code` command in PATH.)  
   Manual fallback: **Extensions → … → Install from VSIX…** → pick the VSIX in repo root → **Reload Window**.

3. Use the **Proctor** icon in the **activity bar** for a **Session** side panel (stable list view with live telemetry + quick actions). The status bar shows **Proctor** and a clock.
4. Implement **`src/evm/transferLog.js`**, then from the repo root:

   ```bash
   npm install
   npm test
   ```

5. Before you submit: use **Proctor: Export session attestation** (command palette or Proctor view toolbar). A short **notification** when Proctor becomes ready also reminds you. Commit or attach **`exam-output/session-attestation.json`** with your submission as instructed.

---

## VSIX install error: `Extract: unexpected end of file`

A VSIX is a ZIP. This error almost always means the file is **truncated or corrupted** (incomplete download, bad copy, 0-byte file).

1. Check the file size (should be several KB, not 0).  
2. Re-run `npm run package` locally; install the new VSIX from disk.  
3. Avoid opening the VSIX from chat apps or partial downloads — save fully, then install.  
4. Optional: rename to `.zip` and confirm it opens in an archive tool.

---

## Proctor side panel: “There is no data provider…”

That message usually means the running VSIX is out of date or did not activate yet.

1. Rebuild and reinstall the latest VSIX from **`extensions/takehome-exam-monitor`** (`npm run package`), then **Reload Window**.  
2. Open the **repository root** that contains **`exam/TASK.md`** so activation can run (or run any **Proctor:** command once, then open **Session** again).  
3. Run any **Proctor:** command once (for example **Proctor: Open dashboard**) and then reopen the Proctor side panel.

---

## Local verification

```bash
npm install
npm test
```

---

## Interviewer checklist

- Candidate runs `npm test` green and keeps implementation in `src/evm/transferLog.js` (no forbidden libs like ethers/web3/viem).
- Candidate can explain key ABI details: indexed address extraction from topics and `uint256` decoding from `data`.
- Submission includes `exam-output/session-attestation.json` and short write-up (approach + edge cases).
- Spot-check null-handling quality: malformed logs should return `null` rather than throw.
- Optional depth signal: clear comment on why `value` stays in `data` instead of indexed topics.

---

## Submission

Include: brief write-up (approach, edge cases), **`npm test`** green, and **`exam-output/session-attestation.json`** from the companion extension. The attestation contains **no source code** — only local session metadata (see file `disclosure` field).

---

## Changelog

See `CHANGELOG.md`.

---

## Full task text

**`exam/TASK.md`**
