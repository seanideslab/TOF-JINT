# System Architecture

The repository implements the system pipeline described in the compact JINT manuscript:

1. RGB semantic triggering for high-altitude target screening.
2. RGB–TOF reliability estimation using boundary, texture, material, confidence, and uncertainty cues.
3. Reliability-weighted TOF restoration and point-cloud conversion.
4. DEN4 one-step denoising for degraded outdoor TOF point clouds.
5. Topology-conditional geometric routing:
   - `regular_solid` -> DEN4 + conditional PaCo + alpha-shape integration
   - `loose_aggregate` -> DEN4 + voxel-grid integration
   - `porous_vegetation` -> DEN4 + occupancy-aware voxel-grid integration
6. Asynchronous CPU-only scheduling on Raspberry Pi 5, where the 2D perception loop is prioritized and 3D reconstruction is dispatched to background workers under queue, power, and thermal constraints.

## Reliability Flow

RGB boundary, texture, and material cues are converted into gating, uncertainty, confidence, and reliability maps. The composite reliability coefficient suppresses unreliable TOF samples before point-cloud conversion and provides auxiliary weights for denoising, completion, and volume integration.

## Scheduling Flow

The front-end RGB detector is treated as the high-priority real-time loop. TOF restoration, DEN4 denoising, conditional PaCo, and volume integration are executed asynchronously when semantic triggers and resource conditions are satisfied.

This document corresponds to Main Fig. 1 and the system-level pipeline described in the manuscript.
