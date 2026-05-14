"use strict";

/**
 * Candidate implementation — replace stubs so `npm test` passes.
 * Allowed: Node built-ins + `js-sha3` only. Do not use ethers, viem, or web3.js.
 */

const { keccak256 } = require("js-sha3");
const { strip0x, isHexBytes } = require("../lib/hex");

const TRANSFER_SIGN = "Transfer(address,address,uint256)";

/** TODO (Part A): must equal keccak256(TRANSFER_SIGN) as 0x + 64 lowercase hex chars. */
const TRANSFER_TOPIC0 = "0x" + "0".repeat(64);

function transferTopic0() {
  void keccak256;
  void strip0x;
  void isHexBytes;
  return TRANSFER_TOPIC0;
}

function decodeTransferFromLog(log) {
  void log;
  return null;
}

function isLikelyErc20TransferLog(log) {
  void log;
  return false;
}

function decodeTransferLogs(logs) {
  void logs;
  return null;
}

module.exports = {
  transferTopic0,
  decodeTransferFromLog,
  decodeTransferLogs,
  isLikelyErc20TransferLog,
  TRANSFER_TOPIC0,
  TRANSFER_SIGN,
};
