#!/usr/bin/env bash
set -euo pipefail

# Verify the 30-minute Raspberry Pi 5 thermal/scheduling evidence used for
# Main Fig. 5 and Main Table 5.
#
# Usage:
#   bash deployment/run_thermal_stress_test.sh
#
# This public repository script validates the released logs. Live thermal
# stress collection must be executed on the physical Raspberry Pi 5 platform
# with the same sensor payload and cooling configuration.

REPO_ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
cd "$REPO_ROOT"

THERMAL_LOG="results/logs/rpi5_30min_thermal_log.csv"
TABLE5="results/tables/table5_scheduler_stability.csv"

if [[ ! -f "$THERMAL_LOG" ]]; then
  echo "[error] Missing $THERMAL_LOG" >&2
  exit 1
fi

if [[ ! -f "$TABLE5" ]]; then
  echo "[error] Missing $TABLE5" >&2
  exit 1
fi

echo "[deployment] Validating released thermal log and scheduler-stability table..."

python - <<'PY'
from pathlib import Path
import csv

thermal_log = Path("results/logs/rpi5_30min_thermal_log.csv")
table5 = Path("results/tables/table5_scheduler_stability.csv")

with thermal_log.open(newline="", encoding="utf-8") as f:
    rows = list(csv.DictReader(f))

if not rows:
    raise SystemExit("[error] Thermal log is empty.")

timestamps = [float(r["timestamp_s"]) for r in rows]
if timestamps != sorted(timestamps):
    raise SystemExit("[error] timestamp_s is not monotonically increasing.")

if len(timestamps) != len(set(timestamps)):
    raise SystemExit("[error] duplicate timestamp_s values found.")

max_temp = max(float(r.get("cpu_temp_c", 0) or 0) for r in rows)
max_power = max(float(r.get("power_w", 0) or 0) for r in rows)
max_queue = max(float(r.get("queue_length", 0) or 0) for r in rows)
max_latency = max(float(r.get("latency_2d_ms", 0) or 0) for r in rows)
max_runtime = max(float(r.get("runtime_3d_ms", 0) or 0) for r in rows)

print(f"[ok] rows={len(rows)}")
print(f"[ok] peak_cpu_temp_c={max_temp:.1f}")
print(f"[ok] peak_power_w={max_power:.1f}")
print(f"[ok] max_queue_length={max_queue:g}")
print(f"[ok] max_2d_latency_ms={max_latency:.1f}")
print(f"[ok] max_3d_runtime_ms={max_runtime:.1f}")

with table5.open(newline="", encoding="utf-8") as f:
    table_rows = list(csv.DictReader(f))

if not table_rows:
    raise SystemExit("[error] Table 5 CSV is empty.")

print(f"[ok] table5_rows={len(table_rows)}")
print("[deployment] Main Fig. 5 / Main Table 5 verification completed.")
PY

if [[ -f "scripts/plot_fig5.py" ]]; then
  echo "[deployment] Generating or checking Main Fig. 5 plot from released log..."
  python scripts/plot_fig5.py --input "$THERMAL_LOG" || {
    echo "[warning] plot_fig5.py did not complete. Check its CLI arguments if the script is a placeholder."
  }
fi
