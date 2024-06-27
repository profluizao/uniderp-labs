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
	echo "### Instalação dos requisitos para o Guest Additions, utilizado em VMs."
	echo "."
	echo "."
	echo "### OBS.: caso queira finalizar, clique [CONTROL + c]"
	echo "."
	echo "."
}

# Pós instalação
header
echo "### Etapa 01 - Pós-instalação"
printf ".\n.\n.\n"

echo "--- Atualizando cache do APT..."
echo "."
sudo apt update
printf ".\n.\n.\n"

echo "--- Removendo LibreOffice (caso tenha sido instalado)..."
echo "."
sudo apt remove --purge libreoffice*
printf ".\n.\n.\n"

echo "--- Limpando cache do APT..."
echo "."
sudo apt clean
printf ".\n.\n.\n"

echo "--- Limpando pacotes orfãos..."
echo "."
sudo apt autoremove
printf ".\n.\n.\n"

echo "--- Atualizando cache do APT..."
echo "."
sudo apt update
printf ".\n.\n.\n"

echo "--- Atualizando pacotes..."
echo "."
sudo apt upgrade -y
printf ".\n.\n.\n"
pause "### Clique [ENTER] para continuar..."

# Instalação dos requisitos para desenvolvimento
header
echo "### Etapa 02 - Instalação dos requisitos para desenvolvimento"
printf ".\n.\n.\n"

echo "--- Atualizando cache do APT..."
echo "."
sudo apt update
printf ".\n.\n.\n"


echo "--- Instalando requisitos de compilação necessários..."
sudo apt install -y build-essential gcc-12 dkms linux-headers-$(uname -r)
printf ".\n.\n.\n"
pause "### Clique [ENTER] para continuar..."

# Finalização
header
echo "### O script finalizou."
echo "### Teste as configurações."
pause "### Clique [ENTER] para finalizar..."

