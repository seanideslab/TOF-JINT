#!/usr/bin/env bash
set -euo pipefail
python scripts/verify_tables.py results/tables/table1_detection_ablation.csv results/tables/table2_rpi5_quantization_accuracy_resource.csv results/tables/table3_den4_denoising_quality.csv results/tables/table4_volume_switching.csv results/tables/table5_scheduler_stability.csv
