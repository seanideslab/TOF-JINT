# TOF-JINT-edge-uav

Data and code availability package for:

**Semantic-Guided RGB-TOF Volume Estimation and Thermally Aware Scheduling for Edge UAVs**

This repository skeleton supports the compact JINT main manuscript and supplementary material. It provides source-code modules, Raspberry Pi 5 deployment notes, processed/anonymized data examples, RGB-TOF calibration files, evaluation tables/logs, and reproduction scripts for the principal manuscript and supplementary results.

## Manuscript Coverage

- Main Fig. 1-Fig. 6 and Main Table 1-Table 5
- Supplementary Fig. S1-Fig. S5 and Supplementary Table S1-Table S6
- Supplementary Notes S1-S2 for RGB-TOF reprojection covariance and Lyapunov-inspired scheduling

See `docs/manuscript_crosswalk.md` for the full figure/table-to-file mapping.

## Quick Reproduction

```bash
python scripts/verify_tables.py results/tables/table2_rpi5_quantization_accuracy_resource.csv
python scripts/verify_tables.py results/tables/table5_scheduler_stability.csv
python scripts/verify_tables.py results/tables/tableS6_task_level_performance.csv
python scripts/plot_fig5.py --input results/logs/rpi5_30min_thermal_log.csv
```

## Data Availability

This package includes processed/anonymized examples and result summaries. Raw UAV flight records, exact GPS trajectories, private site imagery, people, vehicles, and sensitive operational data are not redistributed. Third-party datasets, including VisDrone-DET2019 and ABC, are not included; download instructions and split/configuration references are provided under `data/external/`.

## Code Availability

The `src/` directory is organized by system module:

- `detection/`: YOLOv11n training/export/inference placeholders for semantic triggering.
- `tof_reliability/`: RGB-TOF projection, uncertainty penalty, confidence weighting, and reliability maps.
- `pointcloud/`: depth-to-point-cloud conversion, DEN4 denoising, conditional PaCo routing, and volume integration interfaces.
- `scheduling/`: asynchronous worker pool, thermal monitor, queue monitor, and Lyapunov-inspired scheduling objective.
- `evaluation/`: detection, depth, volume, latency, power, temperature, and task-level evaluation helpers.

## Data and Code Availability Statement

The source code, Raspberry Pi 5 deployment scripts, RGB-TOF calibration files, processed and anonymized datasets, evaluation logs, and scripts for reproducing the main-manuscript and supplementary tables and figures are available at: [`seanideslab/TOF-JINT`](https://github.com/seanideslab/TOF-JINT). The repository includes materials supporting Main Fig. 1-Fig. 6, Main Table 1-Table 5, Supplementary Fig. S1-Fig. S5, Supplementary Table S1-Table S6, and Supplementary Notes S1-S2. Third-party datasets, including VisDrone-DET2019 and ABC, are not redistributed in this repository; instead, download instructions, preprocessing scripts, and configuration files are provided. Raw field data containing site-specific or operational information are released only in processed or anonymized form when applicable.
