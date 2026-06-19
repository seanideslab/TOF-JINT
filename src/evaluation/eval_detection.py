def detection_summary(row):
    return {'mAP@0.5': float(row['map_0_5_percent']), 'precision': float(row['precision_percent'])}
