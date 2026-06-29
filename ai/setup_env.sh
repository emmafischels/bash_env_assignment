#!/bin/bash
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# Load Miniconda
module load miniconda3/24.1.2-py310

# Create or update the conda environment
if conda env list | grep -qE '^ai[[:space:]]'; then
    conda env update -f "${SCRIPT_DIR}/environment.yml" --prune
else
    conda env create -f "${SCRIPT_DIR}/environment.yml"
fi

# Activate the environment
conda activate ai

# Install optional pip packages
pip install -r "${SCRIPT_DIR}/requirements.txt"

echo "Environment 'ai' is ready. Run: conda activate ai"
