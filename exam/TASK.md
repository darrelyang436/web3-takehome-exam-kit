# Take-home: ERC-20 `Transfer` log decoding (Web3 / EVM)

**Target audience:** Web3 engineers comfortable with logs, ABI encoding, and hex.  
**Suggested time budget:** about **60 minutes** (Part C is optional commentary only).

---

## Repository layout

| Path | Role |
|------|------|
| `src/lib/hex.js` | **Provided** — `0x` stripping and fixed-width hex checks. Do **not** change unless you fix a typo; you may `require` it. |
| `src/evm/transferLog.js` | **Your work** — implement and export the API described below. |
| `src/evmTransfer.js` | Re-export entry; keep `require('./src/evmTransfer')` working for tests. |
| `fixtures/erc20-transfer-logs.json` | Synthetic logs used by tests (you may add your own cases locally). |

---

## Part A — Event `topic0`

Implement `transferTopic0()` in `src/evm/transferLog.js`:

- Keccak-256 (**Ethereum** definition, **not** NIST SHA3-256) over the **canonical** event signature string (exactly, no spaces):

```
Transfer(address,address,uint256)
```

- Return **`0x` + 64 lowercase hex characters** (32 bytes).

You may use the declared dependency **`js-sha3`**. Do **not** use `ethers`, `web3`, or `viem`.

Export **`TRANSFER_TOPIC0`** as a constant string equal to the return value of `transferTopic0()`.

---

## Part B — Decode one log

Implement `decodeTransferFromLog(log)` for an object shaped like an `eth_getLogs` row:

```js
{
  topics: [topic0, topic1, topic2],
  data: "0x..."
}
```

Rules:

- `topic0` is the canonical `Transfer` topic (incoming hex may be mixed case; compare case-insensitively).
- `topic1` / `topic2` are **indexed** `from` / `to` (32-byte topics; address is the **lowest** 20 bytes).
- `data` is the non-indexed `uint256` value, 32-byte ABI encoding (`data` without `0x` must be **64** hex chars).

Return:

- On success: `{ from: "0x…", to: "0x…", valueWei: bigint }` with addresses as **lowercase** `0x` + 40 hex.
- On invalid shape / length / topic mismatch: **`null`** (no throw).

---

## Part C — Optional (short answer in code comments)

Add a brief comment (a few sentences) on why `value` lives in `data` rather than as a third indexed topic (gas / log design).

---

## Part D — Batch decode

Implement `decodeTransferLogs(logs)`:

- If `logs` is **not** an array, return **`null`**.
- Otherwise return an array of the **same length** as the input: each element is the Part B result or **`null`** if that row fails.
- Do not let bad rows throw uncaught exceptions.

---

## Part E — Quick filter

Implement `isLikelyErc20TransferLog(log)`:

- **`true`** iff `decodeTransferFromLog(log)` would return a non-`null` value; otherwise **`false`**.

---

## Required exports

`src/evm/transferLog.js` must `module.exports` at least:

- `transferTopic0`
- `decodeTransferFromLog`
- `decodeTransferLogs`
- `isLikelyErc20TransferLog`
- `TRANSFER_TOPIC0`
- `TRANSFER_SIGN` (the exact canonical signature string constant, for grading clarity)

Tests load via `require('../src/evmTransfer')`.

---

## Acceptance

From the repository root:

```bash
npm install
npm test
```

All tests must pass.

---

## After you finish

1. Export **Session attestation** when you finish (Command Palette: **Proctor: Export session attestation**). A short notification when Proctor becomes ready also reminds you.  
2. Return **`exam-output/session-attestation.json`** to the interviewer (attach to email or include in the same bundle as your PR), together with your solution and a short note on approach / edge cases.

Use **Proctor: Open dashboard** or the **Session** side panel → **Download exam script & begin session** when you are ready to start the timed portion (or run that command from the palette). The extension downloads from its built-in fixed URL, then **Elapsed** counts from the moment `node` starts successfully.
