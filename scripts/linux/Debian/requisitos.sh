#!/bin/bash

# - UNIDERP - LABS TI
# - Projeto Dual-boot Windows/Linux
# - Script de Instalação de componentes.
# - Parte integrante do Projeto Dual-boot.
# - Versão 1.0 - 2024-06-13 - bash shell script
# - Autor: Prof. Luiz Augusto Rodrigues
# - Notas: 
# - - Antes de executar o script, verifique se vc é o proprietário do arquivo.
# - - Se não for, precisa mudar a propriedade para o seu usuário.
# - - Você pode fazer isso usando o comando a seguir:
# - - sudo chown $USER reqsv1.sh, onde $USER seria o seu usuário.

# init
function pause(){
   read -p "$*"
}

function header(){
	clear
	echo "<<< ...............UNIDERP - LABS TI............... >>>"
	echo "<<< ........Projeto Dual-boot Windows/Linux........ >>>"
	echo "<<< ......Script de Instalação de Componentes...... >>>"
	echo "."
	echo "."
	echo -e "\033[0;41m <<< OBS.: clique [CONTROL + c] para finalizar.\033[0;0m"
	echo "."
	echo "."
	echo "----------------------------------------"
}

function apresentacao(){
	header
	echo "."
	echo -e "\033[0;41m <<< ATENÇÃO >>>\033[0;0m"
	echo -e "\033[0;41m <<< Antes de executar o script, verifique se vc é o proprietário do arquivo.\033[0;0m"
	echo -e "\033[0;41m <<< Se não for, precisa mudar a propriedade para o seu usuário.\033[0;0m"
	echo -e "\033[0;41m <<< Você pode fazer isso usando o comando a seguir:\033[0;0m"
	echo -e "\033[0;41m <<< sudo chown $USER reqsv1.sh\033[0;0m"
	echo -e "\033[0;41m <<< onde $USER seria o seu usuário.\033[0;0m"
	echo "."
	echo "----------------------------------------"
	echo "."
	pause "### Clique [ENTER] para iniciar..."
}

# Pós instalação
function etapa00(){
	header
	echo "### Etapa 00 - Pós-instalação"
	echo "."
	sudo apt update
	echo "."
	sudo apt remove --purge libreoffice*
	echo "."
	sudo apt clean
	echo "."
	sudo apt autoremove
	echo "."
	sudo apt update
	echo "."
	sudo apt upgrade -y
	echo "."
	pause "### Clique [ENTER] para continuar..."
}

function etapa01(){
	header
	echo "### Etapa 01 - Componentes Multimedia"
	echo "."
	sudo apt update
	echo "."
	sudo apt install -y ubuntu-restricted-extras
	echo "."
	cd ~/Downloads
	wget -v https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
	echo "."
	sudo apt install -y ~/Downloads/google-chrome-stable_current_amd64.deb
	cd 
	echo "."
	pause "### Clique [ENTER] para continuar..."
}

# Instalação dos requisitos para desenvolvimento
function etapa02(){
	header
	echo "### Etapa 02 - Requisitos para desenvolvimento"
	echo "."
	sudo apt update
	echo "."
	sudo apt install -y build-essential gcc-12 dkms linux-headers-$(uname -r)
	echo "."
	pause "### Clique [ENTER] para continuar..."	
}

# Instalando samba (compartilhamento de arquivos com redes windows)
function etapa03(){
	header
	echo "### Etapa 03 - Samba (compartilhamento de arquivos com redes windows)"
	echo "."
	sudo apt update
	echo "."
	sudo apt install -y samba
	echo "."
	pause "### Clique [ENTER] para continuar..."
}

# Instalando UFW (Firewall do Linux)
function etapa04(){
	header
	echo "### Etapa 04 - Instalando UFW (Firewall do Linux)"
	echo "."
	sudo apt update
	echo "."
	sudo apt install -y ufw
	echo "."
	sudo ufw allow ssh
	echo "."
	sudo ufw allow samba
	echo "."
	sudo ufw enable
	echo "."
	pause "### Clique [ENTER] para continuar..."
}

# Instalando clamav & clamtk (antivirus)
function etapa05(){
	header
	echo "### Etapa 05 - Instalando clamav & clamtk (antivirus)"
	echo "."
	sudo apt update
	echo "."
	sudo apt install -y clamav clamav-daemon clamtk
	echo "."
	sudo systemctl stop clamav-freshclam
	echo "."
	sudo freshclam
	echo "."	
	sudo systemctl start clamav-freshclam
	echo "."
	pause "### Clique [ENTER] para continuar..."
}

# Instalando o Sublime Text (alternativa ao Notepad++)
function etapa06(){
	header
	echo "### Etapa 06 - Instalando o Sublime Text (alternativa ao Notepad++)"
	# Instalar a chave GPG:
	echo "."	
	wget -qO - https://download.sublimetext.com/sublimehq-pub.gpg | gpg --dearmor | sudo tee /etc/apt/trusted.gpg.d/sublimehq-archive.gpg > /dev/null
	# Adicionar o repositório para APT:
	echo "deb https://download.sublimetext.com/ apt/stable/" | sudo tee /etc/apt/sources.list.d/sublime-text.list
	# Atualizar os repositórios:
	echo "."	
	sudo apt update
	# Instalar o pacote HTTPS para o APT (já deveria estar instalado):
	echo "."		
	sudo apt install -y apt-transport-https
	# Instalar o Sublime Text:
	echo "."		
	sudo apt install sublime-text -y
	echo "."
	pause "### Clique [ENTER] para continuar..."
}

# Instalando JDK 21
function etapa07(){
	header
	echo "### Etapa 07 - Instalando JDK 21"
	# Baixar o seguinte arquivo (pelo terminal), e salve na pasta Downloads:
	echo "."	
	cd ~/Downloads
	wget -v https://download.oracle.com/java/21/latest/jdk-21_linux-x64_bin.deb
	# Instalar o JDK 21, usando o seguinte comando:
	echo "."
	sudo apt install -y ./jdk-21_linux-x64_bin.deb
	cd 
	echo "."
	pause "### Clique [ENTER] para continuar..."
}

# Configurar JAVA_HOME e PATH (sem isso, o Java não compila ;-)
function etapa07_1(){
	header
	echo "### Etapa 07_1 - Configurar JAVA_HOME e PATH (sem isso, o Java não compila ;-)"
	# Adicionar as seguintes linhas no final do arquivo:
	echo "."
	echo "--- Adicionando entrada JAVA_HOME no .bashrc"
	echo "export JAVA_HOME=/usr/lib/jvm/jdk-21-oracle-x64" >> ~/.bashrc
	echo "."
	echo "--- Adicionando JAVA_HOME ao PATH no .bashrc"
	echo "export PATH=/usr/lib/jvm/jdk-21-oracle-x64/bin:$PATH" >> ~/.bashrc
	echo "."
	echo "--- Atualizando baseado no .bashrc"
	source ~/.bashrc
	echo "."
	# Testar a configuração (tem que aparecer o caminho):
	echo "--- Testando a configuração. Observe as saídas a seguir."
	echo "OBS.: Pode ser necessário fechar e abri o terminal novamente, após a finalização do script. :-("
	echo "."
	echo "--- JAVA_HOME:"
	echo $JAVA_HOME
	echo "."
	echo "--- PATH:"
	echo $PATH
	echo "."
	pause "### Clique [ENTER] para continuar..."
}

# Instalando o CodeBlocks
function etapa08(){
	header
	echo "### Etapa 08 - Instalando o CodeBlocks"
	echo "OBS: deixar a configuração das extensões para os Professores."
	echo "."
	sudo apt update
	echo "."
	sudo apt install -y codeblocks
	echo "."
	pause "### Clique [ENTER] para continuar..."
}

# Instalando o VS Code
function etapa09(){
	header
	echo "### Etapa 09 - Instalando o VS Code"
	echo "OBS: deixar a configuração das extensões para os Professores."
	echo "."
	sudo apt update
	# Instalar pacotes necessários (pode ser que não tenham sido instalados):
	echo "."
	sudo apt install -y software-properties-common apt-transport-https wget
	# Instalando a chave de autenticacao (OBRIGATÓRIA):
	echo "."
	wget -qO- https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > packages.microsoft.gpg
	echo "."
	sudo install -D -o root -g root -m 644 packages.microsoft.gpg /etc/apt/keyrings/packages.microsoft.gpg
	# Adicionando repositorio do VS Code (OBRIGATÓRIO):
	echo "."
	echo "deb [arch=amd64,arm64,armhf signed-by=/etc/apt/keyrings/packages.microsoft.gpg] https://packages.microsoft.com/repos/code stable main" |sudo tee /etc/apt/sources.list.d/vscode.list > /dev/null
	echo "."
	rm -f packages.microsoft.gpg
	echo "."
	sudo apt update
	echo "."
	sudo apt install -y code
	echo "."
	pause "### Clique [ENTER] para continuar..."
}

# Instalando o OnlyOffice Desktop Editors (Opção ao MS Office 365)
function etapa10(){
	header
	echo "### Etapa 10 - Instalando o OnlyOffice Desktop Editors"
	echo "."
	wget -v https://download.onlyoffice.com/install/desktop/editors/linux/onlyoffice-desktopeditors_amd64.deb
	echo "."
	sudo apt update
	sudo apt -y upgrade
	sudo apt install -y ./onlyoffice-desktopeditors_amd64.deb
	echo "."
	pause "### Clique [ENTER] para continuar..."
}

# Finalização
function finalizar(){
	header
	echo "### O script finalizou."
	echo "### Teste as configurações."
	pause "### Clique [ENTER] para finalizar..."
}

apresentacao
etapa00
etapa01
etapa02
etapa03
etapa04
etapa05
etapa06
etapa07
etapa07_1
etapa08
etapa09
etapa10
finalizar
