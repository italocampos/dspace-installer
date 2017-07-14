#!/bin/bash

# =================================================
# MÓDULO DE COMPILAÇÃO DO DSPACE
# =================================================
# dspace-compiler, version 1.0, UFPA | 2017

# Argumentos de entrada:
#	$1 - diretório 'home/$user' do usuário padrão do DSpace

# Atribuições locais
home=$1

# Import das bibliotecas de diálogo e verificação
source dspace-setup/verifier.sh

# Compila o DSpace [usa Apache Maven]
cd $home/dspace-5.x
writewarning $? "Não foi possível acessar o diretório '$home/dspace-5.x'"
$home/apache-maven/bin/mvn -U clean package
writeerror $? "Problema na compilação do código-fonte [Apache Maven]"
