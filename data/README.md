# Data

This directory contains processed or anonymized samples only. Raw UAV flight logs, exact GPS trajectories, private site imagery, vehicle/person identifiers, and site-specific operational records are intentionally not redistributed.

External datasets such as VisDrone-DET2019 and ABC should be downloaded from their original sources using the instructions in `data/external/`.

- `external/`: Download instructions and license notes for third-party datasets, including VisDrone-DET2019 and ABC.
- `processed/detection_splits/`: Compact split references and class mapping files for detection evaluation.
- `processed/tof_samples_anonymized/`: Processed RGB–TOF samples representing reflective, absorptive, and sparse-depth cases.
- `processed/volume_targets_anonymized/`: Metadata and reference volume summaries for regular solids, loose aggregates, and porous vegetation.

Only processed, anonymized, or derived data are included. Raw UAV flight logs, exact GPS trajectories, private site imagery, and sensitive operational records are not redistributed.