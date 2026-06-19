#!/usr/bin/env bash
set -euo pipefail

# Smoke-test the asynchronous RGB-TOF pipeline support files.
# Usage:
#   bash deployment/run_async_pipeline.sh
#
# This verifies that the repository contains the files needed to support
# semantic triggering, reliability-weighted TOF restoration, asynchronous
# 3D processing, and queue/thermal monitoring. A live UAV run should be
# executed on the physical Raspberry Pi 5 platform.

REPO_ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
cd "$REPO_ROOT"

echo "[deployment] Checking asynchronous pipeline repository structure..."

python - <<'PY'
from pathlib import Path
import csv

required_paths = [
    "src/detection/inference_edge_cpu.py",
    "src/tof_reliability/reliability_map.py",
    "src/tof_reliability/confidence_weighting.py",
    "src/pointcloud/den4_denoising.py",
    "src/pointcloud/paco_completion_wrapper.py",
    "src/pointcloud/alpha_shape_volume.py",
    "src/pointcloud/voxel_grid_volume.py",
    "src/pointcloud/occupancy_voxel_volume.py",
    "src/scheduling/async_worker_pool.py",
    "src/scheduling/queue_monitor.py",
    "src/scheduling/thermal_monitor.py",
    "results/logs/rpi5_30min_thermal_log.csv",
    "results/tables/table5_scheduler_stability.csv",
]

missing = [p for p in required_paths if not Path(p).exists()]
if missing:
    print("[warning] Missing expected repository paths:")
    for p in missing:
        print("  -", p)
else:
    print("[ok] All expected pipeline support files are present.")

log_path = Path("results/logs/rpi5_30min_thermal_log.csv")
if log_path.exists():
    with log_path.open(newline="", encoding="utf-8") as f:
        rows = list(csv.DictReader(f))
    if rows:
        max_queue = max(float(r.get("queue_length", 0) or 0) for r in rows)
        max_temp = max(float(r.get("cpu_temp_c", 0) or 0) for r in rows)
        max_power = max(float(r.get("power_w", 0) or 0) for r in rows)
        print(f"[ok] Thermal log summary: max_queue={max_queue:g}, max_temp={max_temp:.1f} C, max_power={max_power:.1f} W")
        print("[deployment] Expected full-system reference: bounded queue, 68.4 C peak CPU temperature, 6.8 W peak power.")

print("[deployment] Async pipeline smoke test completed.")
PY
