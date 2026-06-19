#!/usr/bin/env bash
set -euo pipefail

# Install the Python dependencies from the repository root.
# Usage:
#   bash deployment/install_dependencies.sh

REPO_ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
cd "$REPO_ROOT"

if [[ ! -f "requirements.txt" ]]; then
  echo "[error] requirements.txt not found. Run this script from a complete repository checkout." >&2
  exit 1
fi

python -m pip install --upgrade pip
python -m pip install -r requirements.txt

echo "[deployment] Dependencies installed from requirements.txt."
