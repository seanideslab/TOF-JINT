# Corrected Results Logs

This folder contains cleaned log CSVs for the JINT compact repository.

Cleaning rule:
- Timestamps are sorted in ascending order.
- Duplicate `timestamp_s` entries are removed by keeping the last occurrence.
- This preserves the saturated log entry at `T = 1500 s` used in the manuscript text:
  `theta_t = 68.4 °C, Pwr = 6.8 W, q_t = 2, T_2D = 76.5 ms, status = stable`.

Files:
- `rpi5_30min_thermal_log.csv`: combined 30-minute CPU temperature, power, queue, latency, runtime, and status log.
- `latency_log.csv`: 2D latency and bounded 3D runtime trace.
- `queue_length_log.csv`: background 3D queue-length trace.
- `rpi5_power_log.csv`: onboard power trace.
- `task_failure_log.csv`: task-failure trace.

Expected sampling:
- 0 to 1800 seconds, sampled every 60 seconds.
- 31 rows per log after duplicate removal.
