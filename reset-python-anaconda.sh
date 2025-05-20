#!/bin/bash

echo "🧹 REMOVENDO TUDO RELACIONADO A PYTHON, ANACONDA E AMBIENTES VIRTUAIS..."

# Remover ambientes virtuais
find ~ -type d -name ".venv" -exec rm -rf {} +
find ~ -type d -name "venv" -exec rm -rf {} +

# Remover Anaconda e vestígios
rm -rf ~/anaconda3 ~/miniconda3 ~/.conda ~/.condarc ~/.continuum ~/.anaconda_backup

# Limpar bashrc de anaconda
sed -i '/conda/d' ~/.bashrc
sed -i '/anaconda3/d' ~/.bashrc

# Remover pacotes pip
pip freeze --break-system-packages | xargs pip uninstall -y --break-system-packages 2>/dev/null

# Remover pip e venv via apt
sudo apt remove --purge python3-pip python3-venv -y
sudo apt autoremove -y

# Limpar cache pip
rm -rf ~/.cache/pip

echo "✅ AMBIENTE LIMPO!"

# Atualizar pacotes e reinstalar python + venv + pip
echo "📦 Instalando Python, pip e venv novamente..."
sudo apt update
sudo apt install -y python3 python3-pip python3-venv wget

# Baixar Anaconda
cd ~/Downloads
echo "🌐 Baixando Anaconda..."
wget https://repo.anaconda.com/archive/Anaconda3-2024.10-1-Linux-x86_64.sh -O anaconda.sh

# Instalar Anaconda silenciosamente
echo "⚙️ Instalando Anaconda..."
bash anaconda.sh -b -p $HOME/anaconda3

# Adicionar ao PATH
echo 'export PATH="$HOME/anaconda3/bin:$PATH"' >> ~/.bashrc
source ~/.bashrc

# Ativar conda base
eval "$($HOME/anaconda3/bin/conda shell.bash hook)"

# Confirmar versão
conda --version

# Instalar pacotes
echo "📦 Instalando pacotes de ciência de dados no ambiente base..."
conda install -y numpy pandas matplotlib seaborn scikit-learn jupyterlab

echo "✅ Tudo pronto! Execute 'jupyter lab' para começar."



# chmod +x reset-python-anaconda.sh
# ./reset-python-anaconda.sh