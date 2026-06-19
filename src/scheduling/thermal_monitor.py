def thermal_state(cpu_temp_c, soft_limit_c=80.0):
    return 'throttle_risk' if cpu_temp_c >= soft_limit_c else 'stable'
