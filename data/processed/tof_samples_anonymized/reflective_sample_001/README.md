# reflective_sample_001

This folder contains the corrected semantic routing label for the anonymized TOF sample.

- `semantic_label` follows the topology classes used in the manuscript:
  - `regular_solid`
  - `loose_aggregate`
  - `porous_vegetation`
- `route` follows the corresponding topology-aware volume integrator:
  - `alpha_shape`
  - `voxel_grid`
  - `occupancy_voxel_grid`

The original processed TOF files (`anonymized_pointcloud.ply`, `processed_tof_depth.csv`, `depth_confidence_map.csv`, and `target_metadata.csv`) should remain in this folder when used in the final repository.
