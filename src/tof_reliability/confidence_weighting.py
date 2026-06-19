import numpy as np

def apply_confidence(depth, confidence, fill_value=0.0):
    depth = np.asarray(depth)
    confidence = np.asarray(confidence)
    return np.where(confidence > 0, depth * confidence + fill_value * (1 - confidence), fill_value)
