#!/bin/bash
# init
function pause(){
   read -p "$*"
}

function header(){
   clear
   echo "### Script de teste ###"
}

# 
header
echo '<< Executando o whoami >>'
whoami
pause "Clique [ENTER] para continuar..."

# 
header
echo '<< Executando o hostname >>'
hostname
pause "Clique [ENTER] para continuar..."

# 
header
echo '<< Executando o uptime >>'
uptime -p
pause 'Press [Enter] key to continue...'

# 
header
echo '<< Executando o uname >>'
uname -rms
pause 'Press [Enter] key to finalize...'
