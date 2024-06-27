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
	echo "<<< ......Script de Criação de Usuário..... >>>"
	echo "."
	echo "."
}

create_user() {
    username=$1
    password=$2

    # Create the user with the specified username
    sudo useradd -m -s /bin/bash $username

    # Set the user's password
    echo "$username:$password" | sudo chpasswd

    echo "Usuário '$username' foi criado e sua senha é '$password'"
}

# Pós instalação
header
echo "### Criação de Usuário"
printf ".\n.\n.\n"

create_user aluno uniderp@2024
printf ".\n.\n.\n"

# Finalização
echo "### O script finalizou."
echo "### Teste as configurações."
pause "### Clique [ENTER] para finalizar..."

