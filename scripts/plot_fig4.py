import argparse
import csv

parser = argparse.ArgumentParser()
parser.add_argument('--input', default='results/figures_raw/fig4_detection_deployment.csv' if 'fig4' == 'fig3' else 'results/figures_raw/fig4_sensitivity.csv')
args = parser.parse_args()
with open(args.input, newline='', encoding='utf-8') as f:
    rows = list(csv.reader(f))
print(f'Loaded {len(rows)-1} rows from {args.input} for fig4. Use this table as the plotting source for the manuscript figure.')
