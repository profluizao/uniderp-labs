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
function etapa01(){
	header
	echo "### Etapa 01 - Pós-instalação"
	echo "."
	sudo apt update
	sudo apt remove --purge libreoffice*
	sudo apt clean
	sudo apt autoremove
	sudo apt update
	sudo apt upgrade -y
	echo "."
	pause "### Clique [ENTER] para continuar..."
}

# Instalação dos requisitos para desenvolvimento
function etapa02(){
	MESSAGE="Executar Etapa 02!!!"
    zenity --info --text="$MESSAGE"
}

# Instalando samba (compartilhamento de arquivos com redes windows)
function etapa03(){
	MESSAGE="Executar Etapa 03!!!"
    zenity --info --text="$MESSAGE"
}

function error(){
	MESSAGE="Opção inválida!!!"
    zenity --notification --window-icon=error --text="$MESSAGE"    
}

items=(
		"Etapa 01 - Pós Instalação" 
		"Etapa 02 - Requisitos para desenvolvimento" 
		"Etapa 03 - Samba"
)

titulo="Labs TI - UNIDERP"

prompt="Script de Instalação de componentes"

while item=$(zenity --title="$titulo" --text="$prompt" --list --column="Etapas disponíveis" "${items[@]}")
do
    case "$item" in
        "${items[0]}") etapa01;;
        "${items[1]}") etapa02;;
        "${items[2]}") etapa03;;
        *) error;;
    esac
done