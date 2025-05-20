#!/bin/bash

echo "🔍 Verificando ambiente Python + Anaconda + Jupyter..."

# Verificar conda
echo -n "📦 Conda instalado: "
conda --version || echo "❌ Conda não encontrado"

# Verificar Python no Anaconda
echo -n "🐍 Python usado: "
which python

# Verificar onde o conda está instalado
echo -n "📂 Conda path: "
which conda

# Verificar se pacotes de ciência de dados estão instalados
echo "📊 Verificando pacotes essenciais:"
for pkg in numpy pandas matplotlib seaborn scikit-learn jupyterlab; do
    conda list $pkg | grep $pkg > /dev/null && \
        echo "✅ $pkg instalado" || \
        echo "❌ $pkg não encontrado"
done

# Verificar JupyterLab
echo -n "🧪 JupyterLab disponível: "
which jupyter-lab || echo "❌ JupyterLab não encontrado"

# Verificar ambiente base ativado
echo -n "🔄 Ambiente atual: "
conda info | grep "active environment"

# Status final
echo "✅ Verificação concluída!"
echo "Para iniciar o JupyterLab, use: jupyter lab"


# chmod +x verify-anaconda-env.sh
# ./verify-anaconda-env.sh