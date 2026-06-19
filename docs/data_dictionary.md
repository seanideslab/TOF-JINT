# Data Dictionary

Key columns use SI units where applicable. Temperature is reported in degrees Celsius, power in watts, latency and runtime in milliseconds, volume error as MAPE percent, and confidence calibration as expected calibration error (ECE).

## Common Time-series Columns

| Column | Meaning | Unit / Format |
|---|---|---|
| `timestamp_s` | Elapsed time from the beginning of the test | seconds |
| `cpu_temp_c` | CPU temperature | °C |
| `power_w` | System power consumption | W |
| `queue_length` | Number of pending background 3D tasks | count |
| `latency_2d_ms` | Front-end 2D perception latency | ms |
| `runtime_3d_ms` | Per-trigger 3D processing runtime | ms |
| `status` | System status, e.g., `stable`, `warning`, `throttling`, or `failure` | text |

## Detection and Deployment Columns

| Column | Meaning | Unit / Format |
|---|---|---|
| `mAP50_percent` | mAP@0.5 detection accuracy | % |
| `mAP5095_percent` | mAP@0.5:0.95 detection accuracy | % |
| `precision_percent` | Detection precision | % |
| `recall_percent` | Detection recall | % |
| `avg_latency_ms` | Average CPU-only inference latency | ms |
| `p95_latency_ms` | 95th-percentile latency | ms |
| `p99_latency_ms` | 99th-percentile latency | ms |
| `avg_fps` | Average inference frame rate | FPS |
| `peak_ram_mb` | Peak RAM usage | MB |
| `avg_power_w` | Average system power | W |

## Depth, Reliability, and Point-cloud Columns

| Column | Meaning | Unit / Format |
|---|---|---|
| `u`, `v` | Pixel coordinate or projected feature coordinate | pixels |
| `depth_m` | Processed TOF depth | m |
| `confidence` | Normalized confidence value | [0, 1] |
| `rmse_m` | Root mean squared depth error | m |
| `ece` | Expected calibration error for confidence calibration | unitless |
| `point_cloud_mse_x1e3` | Point-cloud mean squared error scaled by 1e-3 | numeric |
| `hausdorff_distance` | Hausdorff distance used for geometric quality evaluation | numeric |
| `snr` | Signal-to-noise ratio | numeric |

## Volume-estimation and Routing Columns

| Column | Meaning | Unit / Format |
|---|---|---|
| `target_type` | Target group, e.g., `regular_solid`, `loose_aggregate`, `porous_vegetation` | text |
| `topology` | Descriptive topology of the target | text |
| `semantic_label` | Topology label used for semantic-guided routing | text |
| `route` | Selected integration route, e.g., `alpha_shape`, `voxel_grid`, `occupancy_voxel_grid` | text |
| `mape_percent` | Volume mean absolute percentage error | % |
| `runtime_ms` | Runtime of the corresponding geometric operation | ms |
| `reference_volume_m3` | Reference volume from ground measurement or LiDAR-supported measurement | m³ |

## Supplementary Sensitivity Columns

| Column | Meaning |
|---|---|
| `tau_c` | Semantic trigger confidence threshold |
| `voxel_size_cm` | Voxel-grid size in centimeters |
| `alpha_scale` | Alpha-shape parameter expressed relative to mean point spacing |
| `lambda_confidence` | Cross-modal confidence weighting strength |
| `thermal_control_weight_V` | Lyapunov-inspired thermal-control weight |
