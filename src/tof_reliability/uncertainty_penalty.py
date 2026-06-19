import numpy as np

def boundary_uncertainty_penalty(base_uncertainty, gradient_strength, risk, tau=1.0, beta=0.5):
    return np.asarray(base_uncertainty) + beta * np.maximum(0, np.asarray(risk) - tau) * np.asarray(gradient_strength)
