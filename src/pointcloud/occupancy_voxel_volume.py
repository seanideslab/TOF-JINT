def occupancy_weighted_volume(occupancies, voxel_size_m):
    return sum(occupancies) * (voxel_size_m ** 3)
