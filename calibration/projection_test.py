import numpy as np

def project_tof_to_rgb(point_tof, K_rgb, R_ext, T_ext):
    p = R_ext @ np.asarray(point_tof, dtype=float) + T_ext
    uvw = K_rgb @ p
    return uvw[:2] / uvw[2]

if __name__ == "__main__":
    K = np.array([[920.0, 0.0, 960.0], [0.0, 918.0, 540.0], [0.0, 0.0, 1.0]])
    R = np.eye(3)
    T = np.array([0.012, -0.004, 0.035])
    print(project_tof_to_rgb([0.0, 0.0, 1.2], K, R, T))
