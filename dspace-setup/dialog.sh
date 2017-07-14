#!/bin/bash

# =================================================
# BIBLIOTECA DIALOG
# =================================================
# Descrição curta:
#	Biblioteca de janelas de diálogo com o usuário
#	Baseada nas chamadas do programa whiptail
# Detalhes:
#	dialog.sh, version 1.0, UFPA | 2017

# Uso básico:
# @ procedimentos:
#	>> nome_procedimento "Texto de diálogo" "Título"
#
# @ funções:
#	>> variavel=$(nome_funcao "Texto de diálogo" "Título")
#
# @ procedimentos com botões alteráveis:
#	>> nome_procedimentomod "Texto" "Título" "Botão 1" Botão n"
#
# @ funções com botões alteráveis:
#	>> variavel=$(nome_funcaomod "Texto de diálogo" "Título")

# Tamanho das janelas de diálogo
height=20
width=60

# Tempo de sleep entre verificações (barra de progresso)
time=0.7

messagebox() {
	whiptail --title "$2" --msgbox "$1" $height $width 3>&1 1>&2 2>&3
}

required() {
		messagebox "Este campo é obrigatório. Por favor, informe um valor válido." "VALOR REQUERIDO"
}

inputbox() {
	input=$(whiptail --title "$2" --inputbox "\n$1" $height $width 3>&1 1>&2 2>&3 "$3")
	if [ $? -eq 0 ]; then
		echo "$input"
	else
		echo '1'
	fi
}

passwordbox() {
	key=$(whiptail --title "$2" --passwordbox "\n$1" $height $width 3>&1 1>&2 2>&3)
	if [ $? -eq 0 ]; then
		echo "$key"
	else
		echo '1'
	fi
}

chosebox() {
	whiptail --title "$2" --yesno "$1" --yes-button "Sim" --no-button "Não" $height $width 3>&1 1>&2 2>&3
	echo $?
}

progressbar() {
	whiptail --title "$2" --gauge "\n$1" $height $width 0
}

messageboxmod() {
	whiptail --title "$2" --msbox "$1" --ok-button "$3" 3>&1 1>&2 2>&3
}

inputboxmod() {
	input=$(whiptail --title "$2" --inputbox "\n$1" --ok-button "$3" --cancel-button "$4" $height $width 3>&1 1>&2 2>&3 "$5")
	if [ $? -eq 0 ]; then
		echo "$input"
	else
		echo '1'
	fi
}

passwordboxmod() {
	key=$(whiptail --title "$2" --passwordbox "\n$1" --ok-button "$3" --cancel-button "$4" $height $width 3>&1 1>&2 2>&3)
	if [ $? -eq 0 ]; then
		echo "$key"
	else
		echo '1'
	fi
}

choseboxmod() {
	whiptail --title "$2" --yesno "$1" --yes-button "$3" --no-button "$4" $height $width 3>&1 1>&2 2>&3
	echo $?
}

setstep() {
	step=$2

	if [ "$1" = "1" ]; then
		step=$((step-1))
	else
		if [ "$3" = "r" ] && [ "$1" = "" ]; then
			required
		else
			step=$((step+1))
		fi
	fi

	echo $step
}

isrunning() {
	var=$(ps $1 | grep $1)
	if [ "$var" = "" ]; then
		echo 1
	else
		echo 0
	fi
}

# Retorna o tamanho de um objeto em bytes
sizeof() {
	siz=$(du -s "$1" | cut -f1)
	echo $siz
}

# Retorna o número de itens de um diretório
itemsof() {
	items=$(ls "$1" | wc -l)
	echo $items
}

showpercent() {
	origin=$1
	target=$2
	pid=$3

	all=$(sizeof "$origin")
	initial=$(sizeof "$target")
	while [ `isrunning $pid` -eq 0  ]; do
		update=$(sizeof "$target") # atualiza o tamanho da pasta-destino dos arquivos
		part=$((update-initial)) # verifica a variação do tamanho
		percent=$((100*part/all)) # calcula a porcentagem
		echo $percent # mostra a porcentagem
		sleep $time
	done
}

showpercentquantity() {
	origin=$1
	target=$2
	pid=$3

	all=$(itemsof "$origin")
	initial=$(itemsof "$target")
	while [ `isrunning $pid` -eq 0  ]; do
		update=$(itemsof "$target") # atualiza o número de itens da pasta-destino dos arquivos
		part=$((update-initial)) # verifica a variação do número de itens
		percent=$((100*part/all)) # calcula a porcentagem
		echo $percent # mostra a porcentagem
		sleep $time
	done
}

showpercentsize() {
	totalsize=$1
	target=$2
	pid=$3

	initial=$(sizeof "$target")
	while [ `isrunning $pid` -eq 0  ]; do
		update=$(sizeof "$target")
		part=$((update-initial))
		percent=$((100*part/totalsize))
		echo $percent
		sleep $time
	done
}
