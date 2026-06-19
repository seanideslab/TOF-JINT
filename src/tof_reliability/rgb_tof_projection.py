import numpy as np

def project(point_tof, K_rgb, R_ext, T_ext):
    p = R_ext @ np.asarray(point_tof, dtype=float) + T_ext
    uvw = K_rgb @ p
    return uvw[:2] / uvw[2]
