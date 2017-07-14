#!/bin/bash

# =================================================
# BIBLIOTECA VERIFIER
# =================================================
# Descrição curta:
#	Biblioteca de verificação de falhas e erros na instalação
# Detalhes:
#	verifier.sh, version 1.0, UFPA | 2017

# Uso básico:
# @ procedimentos check:
#	>> nome_procedimento $? "Mensagem de erro"

# Import da biblioteca de janelas de diálogo
source dspace-setup/dialog.sh
errorfile='dspace-setup/error.des'

# Verifica erros em comandos críticos (para a execução)
checkerror() {
	if [ $1 -ne 0 ]; then
		messagebox "Houve um erro em um processo crítico da instalação e por isso ela será finalizada. Verifique se você iniciou essa instalação com as configurações de sistema corretas. O arquivo 'INSTALL' contém detalhes sobre a documentação e o procedimento de instalação.\nDetalhes: $2" "ERRO NA INSTALAÇÃO"
		exit 1
	fi
}

# Verifica erros em comandos não críticos (consulta o usuário)
checkwarning() {
	if [ $1 -ne 0 ]; then
		opcao=$(chosebox "Ocorreu um problema com uma ou mais operações (você tem permissões de root?). Você pode continuar a instalação, mas o software pode não funcionar corretamente ou ter um comportamento insesperado.\nDetalhes: $2\nDeseja continuar a instalação?" "ATENÇÃO")
		if [ "$opcao" = "1" ]; then
			messagebox "A instalação foi cancelada pelo usuário" "INSTALAÇÃO INTERROMPIDA"
			exit 1
		fi
	fi
}

# Repete comando enquanto obtém erro
checkloop() {
	if [ $1 -ne 0 ]; then
		retorno=$1
		while [ $retorno -ne 0 ]; do
			echo 'Algo deu errado.'
			echo 'Tentando novamente...'
			`$2` #repete o comando passado como segundo argumento
			retorno=$?
		done
	fi
}

# Verifica se o usuário quer cancelar a instalação
checkexit() {
	if [ "$1" = "1" ]; then
		messagebox "A instalação foi cancelada pelo usuário" "INSTALAÇÃO INTERROMPIDA"
		exit 1
	fi
}

# Altera as permissões de objetos
changeown() {
	directory=$1
	user=$2
	chown $user:$user $directory -R
	chown $user $directory -R
}

makeerrorfile() {
	if ! [ -e $errorfile ]; then
		touch $errorfile
		echo "# ==========================================" >> $errorfile
		echo "# ERROR DESCRIPTOR FILE" >>$errorfile
		echo "# ==========================================" >> $errorfile
		echo "error=0" >> $errorfile
		echo "description=''" >> $errorfile
		chmod 777 $errorfile
	fi
}

writeerror() {
	if [ $1 -eq 1 ]; then
		sed -i "s/^error.*/error=1/" $errorfile
		sed -i "s/^description.*/description=$2/" $errorfile
		exit 1
	fi
}

writewarning() {
	if [ $1 -eq 1 ]; then
		sed -i "s/^error.*/error=2/" $errorfile
		sed -i "s/^description.*/description=$2/" $errorfile
	fi
}

getfail() {
	error=$(cat $errorfile | grep 'error=' | cut -d'=' -f2)
	desc=$(cat $errorfile | grep 'description=' | cut -d'=' -f2)
	if [ $error -eq 1 ]; then
		checkerror 1 "$desc"
	elif [ $error -eq 2 ]; then
		checkwarning 1 "$desc"
	fi
}

makeerrorfile
