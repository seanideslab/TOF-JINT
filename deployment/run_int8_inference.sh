#!/usr/bin/env bash
set -euo pipefail

# Run or smoke-test the Raspberry Pi 5 CPU-only INT8 inference path.
# Usage:
#   bash deployment/run_int8_inference.sh
#
# This script is intended to support Main Table 2 / Main Fig. 3.

REPO_ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
cd "$REPO_ROOT"

SCRIPT="src/detection/inference_edge_cpu.py"

if [[ ! -f "$SCRIPT" ]]; then
  echo "[error] $SCRIPT not found." >&2
  exit 1
fi

echo "[deployment] Running INT8 CPU-only inference entry point..."
python "$SCRIPT"

echo "[deployment] INT8 inference command completed."
echo "[deployment] Expected manuscript reference: Main Table 2, INT8 = 39.4% mAP@0.5, 76.8 ms average latency."
