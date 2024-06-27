#!/bin/bash
# Instalação do Docker CE - Engine, para família Ubuntu.
# Nota:
# - Para uso com o Debian, verificar as modificações adequadas.

# init
function pause(){
   read -p "$*"
}

function header(){
  clear
  echo "<<< ............Labs TI - UNIDERP............ >>>"
  echo "<<< .....Projeto Dual-boot Windows/Linux..... >>>"
  echo "<<< ....Script de instalação do Docker-CE....>>>"
  echo "."
  echo "."
  echo "<<< OBS.: caso queira finalizar, clique [CONTROL + c] para finalizar."
  echo "."
  echo "."
}

function instalacao(){
  # Add Docker's official GPG key:
  echo ">>> Atualizando cache dos repositórios."
  sudo apt update
  echo "."
  echo "."
  echo "."
  echo ">>> Instalando pacotes essenciais."
  sudo apt install -y ca-certificates curl
  echo "."
  echo "."
  echo "."
  echo ">>> Instalando e configurando pasta de chaves criptografadas."
  sudo install -m 0755 -d /etc/apt/keyrings
  echo "."
  echo "."
  echo "."
  echo ">>> Baixando chave criptografada do Docker CE."
  sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg -o /etc/apt/keyrings/docker.asc
  echo "."
  echo "."
  echo "."
  echo ">>> Ajustando permissão da chave recém baixada."
  sudo chmod a+r /etc/apt/keyrings/docker.asc
  echo "."
  # Add the repository to Apt sources:
  echo ">>> Adicionando endereço dos repositórios do Docker."
  echo "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/ubuntu $(. /etc/os-release && echo "$VERSION_CODENAME") stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
  echo "."
  echo "."
  echo "."  
  sudo apt update
  echo "."
  echo ">>> Instalando o Docker CE e pacotes essenciais."
  sudo apt install -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin
  echo "."
  echo "."
  echo "."
  echo ">>> Testando se o Docker foi instalado corretamente."
  sudo docker run hello-world
  echo "."
  echo "."
  echo "."
}

function finalizacao(){
  echo "### O script finalizou."
  echo "### Teste as configurações."
  pause "### Clique [ENTER] para finalizar..."  
}

header
instalacao
finalizacao
