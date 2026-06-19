# Raspberry Pi 5 Setup

This document describes the edge deployment environment used for the compact JINT manuscript.

## Edge Platform

- Board: Raspberry Pi 5
- Memory: 8 GB LPDDR4X
- Deployment mode: CPU-only
- Runtime: Python 3.10+, ONNX Runtime CPU, OpenCV, NumPy, Open3D-compatible point-cloud tooling
- Cooling: active cooling is recommended for sustained hovering or 30-minute stress tests
- Accelerator: no external GPU, TPU, NPU, or AI accelerator is assumed

## Sensor Payload

- RGB gimbal camera: used for high-altitude semantic screening
- TOF depth sensor: used for low-altitude 3D scanning after semantic triggering
- Calibration files: RGB intrinsics, TOF intrinsics, RGB–TOF extrinsics, gimbal extrinsics, and distortion coefficients are stored under `calibration/`

## Benchmark Conditions

For CPU-only inference and scheduling tests:

1. Install dependencies with `deployment/install_dependencies.sh`.
2. Use the QDQ INT8 detector for front-end inference.
3. Keep the RGB 2D perception loop in the high-priority path.
4. Dispatch TOF restoration, DEN4 denoising, conditional PaCo, and volume integration to asynchronous background workers.
5. Record CPU temperature, power, queue length, latency, and task status during the 30-minute stability run.

## Supported Manuscript Results

This setup supports:

- **Main Table 2**: Raspberry Pi 5 quantization and accuracy–resource trade-off.
- **Main Fig. 5**: end-to-end resource-monitoring time series.
- **Main Table 5**: 30-minute scheduler-stability comparison.
- **Supplementary Note S1**: RGB–TOF reprojection, gimbal transform, and covariance initialization.
- **Supplementary Note S2**: Lyapunov-inspired queue–thermal scheduling objective.

## Data Policy

Raw flight logs, exact GPS trajectories, private site imagery, and sensitive operational records are not redistributed. The repository provides processed/anonymized samples and derived logs sufficient for reproducibility review.
