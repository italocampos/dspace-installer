#!/bin/bash

# =================================================
# MÓDULO DE CONFIGURAÇÃO DA APLICAÇÃO WEB
# =================================================
# dspace-webservice, version 1.0, UFPA | 2017

# Argumentos de entrada:
#	$1 - diretório base do DSpace
#	$2 - diretório 'home/$user' do usuário padrão do DSpace

# Atribuições locais
base_dir=$1
home=$2
logo=$3

# Import da biblioteca de verificação
source dspace-setup/verifier.sh

# Configura arquivos de tradução
cp $home/dspace-5.x/dspace-api/src/main/resources/Messages* /$base_dir/webapps/jspui/WEB-INF/classes
writewarning $? "Não foi possível copiar os arquivos de tradução"

# Configura a logo da página inicial do repositório
if [ "$logo" != "" ]; then
	cp "$logo" "$home/logo.png"
	mv "$home/logo.png" /$base_dir/webapps/jspui/image/ -f
	writewarning $? "Problema ao configurar logotipo em 'webapps'"
fi

# Configurações da aplicação web no Apache Tomcat
cp -R /$base_dir/webapps/jspui $home/apache-tomcat/webapps
writewarning $? "Problema ao copiar arquivos 'webapps' do DSpace"
cp -R /$base_dir/webapps/solr $home/apache-tomcat/webapps
cp -R /$base_dir/webapps/oai $home/apache-tomcat/webapps
