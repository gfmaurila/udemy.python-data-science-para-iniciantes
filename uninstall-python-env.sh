#!/bin/bash

echo "🧹 Removendo ambientes virtuais..."
find ~ -type d -name ".venv" -exec rm -rf {} +
find ~ -type d -name "venv" -exec rm -rf {} +

echo "🧼 Removendo Anaconda, Miniconda e arquivos relacionados..."
rm -rf ~/anaconda3 ~/miniconda3 ~/.conda ~/.condarc ~/.continuum ~/.anaconda_backup

echo "🧨 Limpando pacotes pip globais (com --break-system-packages)..."
pip freeze --break-system-packages | xargs pip uninstall -y --break-system-packages

echo "🗑️ Limpando cache do pip..."
rm -rf ~/.cache/pip

echo "🧯 Removendo pacotes Python instalados via APT..."
sudo apt remove --purge -y python3-pip python3-venv
sudo apt autoremove -y

echo "✅ Tudo desinstalado com sucesso."



# chmod +x uninstall-python-env.sh
# ./uninstall-python-env.sh