# Anonymization Notes

This repository releases only processed, anonymized, or derived data summaries for research review and reproducibility.

## Excluded Data

The following data are intentionally excluded from the repository:

- Raw UAV flight logs
- Exact GPS trajectories or mission paths
- Private site imagery
- Complete operational records
- License plates
- People or identifiable human subjects
- Vehicles or private facilities that could reveal sensitive site information
- Sensitive site-specific metadata or operational details

## Released Data Types

Released samples may include:

- Processed TOF depth matrices
- Anonymized point clouds
- Depth-confidence maps
- Semantic routing labels
- Target-level metadata
- Aggregate evaluation logs
- Derived table and figure CSV files

## Anonymization Procedure

When applicable, samples are cropped, renamed, stripped of location metadata, and represented using generic sample identifiers such as:

- `reflective_sample_001`
- `absorptive_sample_001`
- `sparse_cloud_sample_001`

The released files are intended to support the manuscript results without redistributing sensitive raw field data.
