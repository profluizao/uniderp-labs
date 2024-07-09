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
	echo "<<< ...........Script Wallpaper............ >>>"
	echo "."
	echo "."
	echo "### Instalação dos requisitos para o Guest Additions, utilizado em VMs."
	echo "."
	echo "."
	echo "### OBS.: caso queira finalizar, clique [CONTROL + c]"
	echo "."
	echo "."
}

echo "# Baixando wallpaper uniderp001.jpg"
echo "."
cd ~/Pictures
wget -v https://github.com/profluizao/uniderp-labs/blob/main/imagens/uniderp001.jpg
printf ".\n.\n.\n"

# xfconf-query -c xfce4-desktop -p /backdrop/screen0/monitor0/workspace0/last-image -s /home/aluno/Pictures/uniderp001.jpg

echo "### O script finalizou."
echo "### Se deu tudo certo, agora é só testar as configurações."
pause "### Clique [ENTER] para finalizar..."
