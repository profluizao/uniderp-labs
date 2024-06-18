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
   echo "<<< ..Script de Instalação de componentes.. >>>"
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
sudo apt update
sudo apt upgrade -y
echo "."
pause "### Clique [ENTER] para continuar..."

# Instalação dos requisitos para desenvolvimento
header
echo "### Etapa 02 - Instalação dos requisitos para Guest Additions"
echo "."
sudo apt update
sudo apt install -y build-essential gcc-12 dkms linux-headers-$(uname -r)
echo "."
pause "### Clique [ENTER] para continuar..."

# Finalização
# Após a instalação bem sucedida, carregue o CD com os Guest Additions,
# e execute o arquivo VBoxLinuxAdditions.run, na raiz do volume, utilizando sudo.
header
echo "### FINALIZAÇÃO"
echo "."
echo "### Após a instalação bem sucedida, carregue o CD com os Guest Additions,"
echo "### e execute o arquivo VBoxLinuxAdditions.run, na raiz do volume, utilizando sudo."
echo "."
pause "### Clique [ENTER] para finalizar..."

