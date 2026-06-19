import numpy as np

def one_step_score_denoise(points, score, step=0.05):
    return np.asarray(points) + step * np.asarray(score)
