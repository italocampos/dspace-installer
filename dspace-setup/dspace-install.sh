#!/bin/bash

# =================================================
# MÓDULO DE INSTALAÇÃO DOS ARQUIVOS-BASE
# =================================================
# dspace-install, version 1.0, UFPA | 2017

# Argumentos de entrada:
#	$1 - diretório 'home/$user' do usuário padrão do DSpace

# Atribuições locais
home=$1

# Import da biblioteca de verificação
source dspace-setup/verifier.sh

# Instala o dspace no diretório-base [usa Apache Ant]
cd $home/dspace-5.x/dspace/target/dspace-installer
writewarning $? "Não foi possível acessar o diretório '$home/dspace-5.x/dspace/target/dspace-installer'"
$home/apache-ant/bin/ant fresh_install
writeerror $? "Problema na instalação do sistema [Apache Ant]"
