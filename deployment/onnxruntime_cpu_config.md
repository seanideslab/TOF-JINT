# ONNX Runtime CPU Configuration

This note records the CPU-only inference settings used to support **Main Table 2** and **Main Fig. 3** of the compact JINT manuscript.

## Deployment Target

- Platform: Raspberry Pi 5
- Deployment mode: CPU-only
- Runtime backend: ONNX Runtime `CPUExecutionProvider`
- Input resolution: 640 × 640
- Quantization format: QDQ INT8 ONNX graph
- Accelerator assumption: no GPU, TPU, NPU, or external AI accelerator

## Recommended Runtime Settings

Use a bounded CPU thread count to reduce tail-latency jitter on the Raspberry Pi 5:

```python
import onnxruntime as ort

session_options = ort.SessionOptions()
session_options.intra_op_num_threads = 4
session_options.inter_op_num_threads = 1
session_options.execution_mode = ort.ExecutionMode.ORT_SEQUENTIAL
session_options.graph_optimization_level = ort.GraphOptimizationLevel.ORT_ENABLE_ALL

session = ort.InferenceSession(
    "models/yolov11n_int8_qdq.onnx",
    sess_options=session_options,
    providers=["CPUExecutionProvider"],
)
```

For benchmark runs, use a consistent CPU governor and cooling configuration. The exact governor command may differ by Raspberry Pi OS version. A typical setup is:

```bash
sudo apt-get install -y linux-cpupower || true
sudo cpupower frequency-set -g performance || true
```

If the operating system does not support `cpupower`, record the default governor and thermal policy in the benchmark log.

## Reported INT8 Configuration

The adopted INT8 configuration corresponds to the following manuscript values:

- mAP@0.5: 39.4%
- mAP@0.5:0.95: 23.3%
- average CPU-only latency: 76.8 ms
- p95 / p99 latency: 85.2 / 92.1 ms
- peak RAM: 185 MB
- average system power: 6.2 W

These settings are intended to preserve CPU, memory, and thermal headroom for asynchronous RGB–TOF restoration and 3D reconstruction tasks.
