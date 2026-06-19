import csv
import sys

for path in sys.argv[1:]:
    with open(path, newline='', encoding='utf-8') as f:
        rows = list(csv.reader(f))
    if len(rows) < 2:
        raise SystemExit(f'{path}: missing data rows')
    print(f'{path}: {len(rows) - 1} data rows, {len(rows[0])} columns')
