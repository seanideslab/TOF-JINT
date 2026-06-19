import numpy as np

def depth_to_points(depth, fx, fy, cx, cy):
    points = []
    for v, row in enumerate(depth):
        for u, z in enumerate(row):
            if z > 0:
                points.append([(u - cx) * z / fx, (v - cy) * z / fy, z])
    return np.asarray(points)
