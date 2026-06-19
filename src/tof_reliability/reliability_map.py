import numpy as np

def composite_reliability(confidence, geometric_reliability):
    return np.asarray(confidence) * np.asarray(geometric_reliability)
