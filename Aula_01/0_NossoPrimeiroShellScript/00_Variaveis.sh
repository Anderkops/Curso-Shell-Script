#!/usr/bin/env bash

# Atribui variavel e printa na tela
NOME="ANDERSON GREGORIO"
echo "$NOME"

# Atribui 2 variaveis globais e printa na tela
NUMERO_1=34
NUMERO_2=45
TOTAL=$(($NUMERO_1 + $NUMERO_2)) #Conta precisa de parenteses
echo $TOTAL

#Executa um comando
SAIDA_CAT="$(cat /etc/python3/debian_config | grep byte)"
echo "$SAIDA_CAT"

# Comandos com variaveis reservadas
echo "Parametro 1: $1"
echo "Parametro 2: $2"
echo "Todos os parametros: $*"     #executa o script com todos os parametros
echo "Quantos parametros: $#"      # mostra quantos parametros foram enviados para o script
echo "Saida do ultimo comando: $?" #mostra se o ultimo comando foi sucesso: 0 ou erro (maior que 0)
echo "PID=$$"                      # Mostra o PID do processo
echo $0                            #Mostra o nome do script
