#!/bin/bash

echo "🚀 Atualizando pacotes do sistema..."
sudo apt update && sudo apt upgrade -y

echo "🐍 Instalando Python 3, pip e venv..."
sudo apt install -y python3 python3-pip python3-venv

echo "📁 Criando diretório ~/ciencia-dados..."
mkdir -p ~/ciencia-dados
cd ~/ciencia-dados

echo "🔧 Criando ambiente virtual .venv..."
python3 -m venv .venv
source .venv/bin/activate

echo "⬆️ Atualizando pip..."
pip install --upgrade pip

echo "📦 Instalando pacotes de Ciência de Dados..."
pip install numpy pandas matplotlib seaborn scikit-learn jupyterlab notebook ipywidgets plotly statsmodels

echo "✅ Ambiente pronto! Iniciando JupyterLab..."
jupyter lab


# chmod +x setup.sh
# ./setup.sh
