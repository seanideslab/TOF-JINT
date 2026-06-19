# Field Protocol

RGB samples are collected during high-altitude semantic screening. When the semantic trigger and geometric conditions are satisfied, the UAV descends to a low-altitude scanning range and activates TOF acquisition.

## Compact Protocol

1. Cruise at high altitude for RGB-based target screening.
2. Run the lightweight semantic detector on the edge platform.
3. Activate low-altitude TOF scanning only when semantic and geometric trigger conditions are satisfied.
4. Convert the triggered RGB/TOF observations into processed or anonymized data products.
5. Record reliability maps, point-cloud summaries, CPU temperature, power, queue length, 2D latency, 3D runtime, and task status.
6. Store only processed, anonymized, or aggregate data in the repository.

## Target Groups

The field protocol supports three topology groups used by the manuscript:

- `regular_solid`: smooth or closed targets such as enclosures, containers, blocks, or panel-like structures
- `loose_aggregate`: irregular collapsed materials such as gravel, soil, or construction piles
- `porous_vegetation`: trees, canopies, and low vegetation with internal air voids

## Data-release Boundary

Raw flight paths, exact GPS traces, private site imagery, complete operational logs, and sensitive site-specific information are not redistributed. Released files are limited to processed examples, anonymized point clouds, compact split references, metadata summaries, and derived evaluation CSV files.
