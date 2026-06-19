def rmse(errors):
    return (sum(e * e for e in errors) / len(errors)) ** 0.5
