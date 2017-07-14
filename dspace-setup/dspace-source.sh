#!/bin/bash

# =================================================
# MÓDULO DE CÓPIA DOS ARQUIVOS-FONTE
# =================================================
# dspace-source, version 1.0, UFPA | 2017

# Argumentos de entrada:
#	$1 - caminho dos arquivos de instalação
#	$2 - diretório 'home/$user' do usuário padrão do DSpace

# Atribuições locais
font=$1
home=$2

# Import da biblioteca de verificação
source dspace-setup/verifier.sh

# Copia os arquivos de instação do DSpace para a pasta do usuário padrão
cp $font $home -R
writewarning $? "Problema ao copiar arquivos-fonte para a pasta do usuário"
mv $home/dspace* $home/dspace-5.x
