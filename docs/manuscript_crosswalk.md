# Manuscript Crosswalk

This file maps the compact JINT main manuscript and supplementary material to the repository files that support each figure, table, and supplementary note.

## Main Manuscript

- **Main Fig. 1**: Overall system architecture -> `docs/system_architecture.md`; `assets/fig1/`
- **Main Fig. 2**: RGB-guided reliability estimation mechanism -> `src/tof_reliability/`; `calibration/`
- **Main Fig. 3**: Front-end ablation and CPU-only deployment -> `results/figures_raw/fig3_detection_deployment.csv`
- **Main Fig. 4**: Semantic-guided volume-integrator switching -> `results/figures_raw/fig4_volume_switching.csv`
- **Main Fig. 5**: End-to-end resource monitoring -> `results/figures_raw/fig5_resource_monitoring.csv`; `results/logs/rpi5_30min_thermal_log.csv`
- **Main Fig. 6**: Accuracy-latency-power Pareto comparison -> `results/figures_raw/fig6_pareto.csv`

- **Main Table 1**: Detector ablation -> `results/tables/table1_detection_ablation.csv`
- **Main Table 2**: Quantization and accuracy-resource trade-off -> `results/tables/table2_rpi5_quantization_accuracy_resource.csv`
- **Main Table 3**: DEN4 / point-cloud denoising quality -> `results/tables/table3_den4_denoising_quality.csv`
- **Main Table 4**: Volume-estimation integrator switching -> `results/tables/table4_volume_switching.csv`
- **Main Table 5**: 30-minute scheduler stability -> `results/tables/table5_scheduler_stability.csv`

## Supplementary Material

- **Supplementary Fig. S1**: Feature-level fusion and confidence propagation -> `assets/figS1/`
- **Supplementary Fig. S2**: Detailed TOF restoration pipeline -> `assets/figS2/`
- **Supplementary Fig. S3**: Qualitative restoration and calibration -> `results/figures_raw/figS3_quality_calibration/`
- **Supplementary Fig. S4**: Sensitivity curves -> `results/figures_raw/figS4_sensitivity.csv`
- **Supplementary Fig. S5**: Failure cases and deployment boundaries -> `assets/figS5_failure_cases/`

- **Supplementary Table S1**: Uncertainty-aware fusion ablation -> `results/tables/tableS1_uncertainty_fusion_ablation.csv`
- **Supplementary Table S2**: Conditional PaCo routing ablation -> `results/tables/tableS2_paco_routing_ablation.csv`
- **Supplementary Table S3**: Completion benchmark -> `results/tables/tableS3_completion_benchmark.csv`
- **Supplementary Table S4**: Experimental matrix -> `results/tables/tableS4_experimental_matrix.csv`
- **Supplementary Table S5**: Boundary sensitivity and robustness -> `results/tables/tableS5_parameter_sensitivity.csv`
- **Supplementary Table S6**: Integrated task-level performance -> `results/tables/tableS6_task_level_performance.csv`

- **Supplementary Note S1**: RGB–TOF reprojection covariance -> `calibration/`; `src/tof_reliability/rgb_tof_projection.py`
- **Supplementary Note S2**: Lyapunov drift relaxation and scheduling objective -> `src/scheduling/lyapunov_scheduler.py`
