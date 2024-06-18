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
sudo apt remove --purge libreoffice*
sudo apt clean
sudo apt autoremove
sudo apt update
sudo apt upgrade -y
echo "."
pause "### Clique [ENTER] para continuar..."

# Instalação dos requisitos para desenvolvimento
header
echo "### Etapa 02 - Instalação dos requisitos para desenvolvimento"
echo "."
sudo apt update
sudo apt install -y build-essential gcc-12 dkms linux-headers-$(uname -r)
echo "."
pause "### Clique [ENTER] para continuar..."

# Instalando samba (compartilhamento de arquivos com redes windows)
header
echo "### Etapa 03 - Instalando samba (compartilhamento de arquivos com redes windows)"
echo "."
sudo apt update
sudo apt install samba -y
echo "."
pause "### Clique [ENTER] para continuar..."

# Instalando UFW (Firewall do Linux)
header
echo "### Etapa 04 - Instalando UFW (Firewall do Linux)"
echo "."
sudo apt update
sudo apt install ufw -y
sudo ufw allow ssh
sudo ufw allow samba
sudo ufw enable
echo "."
pause "### Clique [ENTER] para continuar..."

# Instalando clamav & clamtk (antivirus)
header
echo "### Etapa 05 - Instalando clamav & clamtk (antivirus)"
echo "."
sudo apt update
sudo apt install clamav clamav-daemon clamtk -y
sudo systemctl stop clamav-freshclam
sudo freshclam
sudo systemctl start clamav-freshclam
echo "."
pause "### Clique [ENTER] para continuar..."

# Instalando o Sublime Text (alternativa ao Notepad++)
header
echo "### Etapa 06 - Instalando o Sublime Text (alternativa ao Notepad++)"
echo "."
# Instalar a chave GPG:
wget -qO - https://download.sublimetext.com/sublimehq-pub.gpg | gpg --dearmor | sudo tee /etc/apt/trusted.gpg.d/sublimehq-archive.gpg > /dev/null
# Adicionar o repositório para APT:
echo "deb https://download.sublimetext.com/ apt/stable/" | sudo tee /etc/apt/sources.list.d/sublime-text.list
# Atualizar os repositórios:
sudo apt update
# Instalar o pacote HTTPS para o APT (já deveria estar instalado):
sudo apt install apt-transport-https -y
# Instalar o Sublime Text:
sudo apt install sublime-text -y
echo "."
pause "### Clique [ENTER] para continuar..."

# Instalando JDK 21
header
echo "### Etapa 07 - Instalando JDK 21"
echo "."
# Baixar o seguinte arquivo (pelo terminal), e salve na pasta Downloads:
wget -qO - https://download.oracle.com/java/21/latest/jdk-21_linux-x64_bin.deb
# Instalar o JDK 21, usando o seguinte comando:
sudo apt install -y ./jdk-21_linux-x64_bin.deb
cd 
echo "."
pause "### Clique [ENTER] para continuar..."

# Configurar JAVA_HOME e PATH (sem isso, o Java não compila ;-)
header
echo "### Etapa 08 - Configurar JAVA_HOME e PATH (sem isso, o Java não compila ;-)"
echo "."
# Adicionar as seguintes linhas no final do arquivo:
echo "export JAVA_HOME=/usr/lib/jvm/jdk-21-oracle-x64" >> ~/.bashrc
source ~/.bashrc
echo "export PATH=$JAVA_HOME/bin:$PATH" >> ~/.bashrc
source ~/.bashrc
echo "."
# Testar a configuração (tem que aparecer o caminho acima):
echo "### Testando a configuração. Observe as saídas a seguir."
echo $JAVA_HOME
echo "."
echo $PATH
echo "."
pause "### Clique [ENTER] para continuar..."

# Instalando o CodeBlocks
header
echo "### Etapa 09 - Instalando o CodeBlocks"
echo "OBS: deixar a configuração das extensões para os Professores."
echo "."
sudo apt update
sudo apt install -y codeblocks
echo "."
pause "### Clique [ENTER] para continuar..."

# Instalando o VS Code
header
echo "### Etapa 10 - Instalando o VS Code"
echo "OBS: deixar a configuração das extensões para os Professores."
echo "."
sudo apt update
# Instalar pacotes necessários (pode ser que não tenham sido instalados):
sudo apt install -y software-properties-common apt-transport-https wget
# Instalando a chave de autenticacao (OBRIGATÓRIA):
wget -qO- https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > packages.microsoft.gpg
sudo install -D -o root -g root -m 644 packages.microsoft.gpg /etc/apt/keyrings/packages.microsoft.gpg
# Adicionando repositorio do VS Code (OBRIGATÓRIO):
echo "deb [arch=amd64,arm64,armhf signed-by=/etc/apt/keyrings/packages.microsoft.gpg] https://packages.microsoft.com/repos/code stable main" |sudo tee /etc/apt/sources.list.d/vscode.list > /dev/null
rm -f packages.microsoft.gpg
sudo apt update
sudo apt install -y code
echo "."
pause "### Clique [ENTER] para continuar..."

# Finalização
header
echo "### O script finalizou."
echo "### Teste as configurações."
pause "### Clique [ENTER] para finalizar..."

