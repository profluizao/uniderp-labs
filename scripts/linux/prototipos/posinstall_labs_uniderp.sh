#!/bin/bash
# Instalação dos requisitos para o Guest Additions, utilizado em VMs.
# init
function pause(){
   read -p "$*"
}

function header(){
	clear
	echo "<<< ...........Labs TI - UNIDERP........... >>>"
	echo "<<< ....Projeto Dual-boot Windows/Linux.... >>>"
	echo "<<< .........Script Pós-instalação......... >>>"
	echo "."
	echo "."
	echo "<<< OBS.: caso queira finalizar, clique [CONTROL + c] para finalizar."
	echo "."
	echo "."
}

# Pós instalação
header
echo "### Etapa 01 - Pós-instalação"
echo "."
echo "."
echo "."
sudo apt update
echo "."
echo "--- Removendo LibreOffice..."
echo "."
sudo apt remove --purge libreoffice*
echo "."
echo "--- Limpando cache do APT..."
echo "."
sudo apt clean
echo "."
echo "--- Limpando pacotes orfãos..."
echo "."
sudo apt autoremove
echo "."
echo "--- Atualizando cache do APT..."
echo "."
sudo apt update
echo "."
echo "--- Atualizando pacotes..."
echo "."
sudo apt upgrade -y
echo "."
pause "### Clique [ENTER] para continuar..."

# Instalação dos requisitos para desenvolvimento
header
echo "### Etapa 02 - Instalação dos requisitos para desenvolvimento"
echo "."
echo "--- Atualizando cache do APT..."
echo "."
sudo apt update
echo "."
echo "--- Instalando requisitos..."
sudo apt install -y build-essential gcc-12 dkms linux-headers-$(uname -r)
echo "."
pause "### Clique [ENTER] para continuar..."

# Finalização
header
echo "### O script finalizou."
echo "### Teste as configurações."
pause "### Clique [ENTER] para finalizar..."

