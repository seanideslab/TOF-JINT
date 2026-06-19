# Hardware Setup

## Edge Computing Platform

- Board: Raspberry Pi 5
- Memory: 8 GB LPDDR4X
- Deployment mode: CPU-only inference
- External accelerator: none assumed
- Runtime backend: ONNX Runtime CPU backend
- Monitoring targets: CPU temperature, system power, queue length, latency, runtime, and task status

## Sensor Payload

- RGB camera: gimbal-mounted RGB camera for high-altitude semantic screening
- TOF sensor: industrial TOF depth camera for low-altitude 3D scanning
- Calibration files: RGB intrinsics, TOF intrinsics, RGB–TOF extrinsics, gimbal extrinsics, and distortion coefficients are stored under `calibration/`

## CPU-only Deployment Assumptions

The repository is organized around CPU-only edge deployment. INT8 inference, QDQ export notes, asynchronous pipeline scripts, and 30-minute thermal-stability logs are provided to support the reported Raspberry Pi 5 results.

## Supported Manuscript Results

This setup supports:

- Main Table 2: Raspberry Pi 5 CPU-only quantization and latency results
- Main Fig. 5 and Main Table 5: 30-minute resource monitoring and scheduler-stability results
- Supplementary Note S1: RGB–TOF reprojection and covariance initialization
- Supplementary Note S2: Lyapunov-inspired scheduling objective
