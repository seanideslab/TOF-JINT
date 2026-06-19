def drift_plus_penalty(queue_length, temperature_c, latency_ms, V=1.0, temp_ref_c=68.0):
    thermal_term = max(0.0, temperature_c - temp_ref_c) ** 2
    return queue_length ** 2 + thermal_term + V * latency_ms
