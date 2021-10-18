#!/usr/bin/env bash

ARQUIVO_DE_CONFIGURACAO="00_configuracao.cf"
MENSAGEM="Mensagem de teste"
USAR_CORES=0
USAR_MAIUSCULAS=0
VERDE='\033[32;1m'
VERMELHO='\033[31;1m'

#Cria um novo ambiente para manter as vari�veis ambiente
eval $(./01_parser.sh $ARQUIVO_DE_CONFIGURACAO)

[ "$(echo $CONF_USAR_MAIUSCULAS)" = "1" ] && USAR_MAIUSCULAS=1
[ "$(echo $CONF_USAR_CORES)" = "1" ] && USAR_CORES=1

# -eq compara��o num�rica
[ $USAR_MAIUSCULAS -eq 1 ] && MENSAGEM="$(echo -e $MENSAGEM | tr [a-z] [A-Z])"
[ $USAR_CORES -eq 1 ] && MENSAGEM="$(echo -e ${VERDE}$MENSAGEM)"

echo -e "$MENSAGEM"
