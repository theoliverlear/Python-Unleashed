#!/bin/bash

set -e  

curl -fsSL https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh -o miniconda.sh

bash miniconda.sh -b -p "$HOME/miniconda"

eval "$($HOME/miniconda/bin/conda shell.bash hook)"
conda init bash

conda create -y -n venv python=3.12

conda activate venv

pip install --upgrade pip
pip install pandas numpy matplotlib scikit-learn tensorflow jupyter seaborn ipykernel

python -m ipykernel install --user --name=venv --display-name "Python (venv)"