#!/usr/bin/env bash
set -euo pipefail
python scripts/verify_tables.py results/tables/tableS1_uncertainty_fusion_ablation.csv results/tables/tableS2_paco_routing_ablation.csv results/tables/tableS3_completion_benchmark.csv results/tables/tableS4_experimental_matrix.csv results/tables/tableS5_parameter_sensitivity.csv results/tables/tableS6_task_level_performance.csv
