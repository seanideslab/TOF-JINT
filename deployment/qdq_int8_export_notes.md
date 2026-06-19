# QDQ INT8 Export Notes

This note documents the INT8 deployment workflow corresponding to **Main Table 2** and **Main Fig. 3**.

## Purpose

The INT8 model is used as the final front-end detector for high-altitude semantic triggering. The purpose of quantization is not only faster inference, but also reduced memory bandwidth, lower average power, and more stable tail latency on the Raspberry Pi 5 CPU-only platform.

## Export Workflow

1. Train or load the YOLOv11n-based front-end detector with the adopted architecture:
   - P2 small-object detection head,
   - dynamic multi-scale feature fusion,
   - shape-aware regression loss.
2. Export the detector to ONNX.
3. Prepare representative calibration images from the UAV detection validation split.
4. Apply QDQ INT8 quantization so that quantize/dequantize operators are explicit in the ONNX graph.
5. Run CPU-only inference using ONNX Runtime `CPUExecutionProvider`.
6. Record average latency, p95/p99 tail latency, RAM usage, and power.

## Expected Result

The adopted QDQ INT8 setting reported in the manuscript is:

| Metric | Value |
|---|---:|
| mAP@0.5 | 39.4% |
| mAP@0.5:0.95 | 23.3% |
| Average latency | 76.8 ms |
| p95 / p99 latency | 85.2 / 92.1 ms |
| Peak RAM | 185 MB |
| Average system power | 6.2 W |

Compared with the FP32 baseline, the INT8 model trades a small detection-accuracy loss for substantially lower latency, RAM usage, and power consumption. This is why INT8 is used as the deployed front-end configuration.
