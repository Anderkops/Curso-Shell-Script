#!/usr/bin/env bash

#Lynx instalado?
[ ! -x "$which lynx" ] && printf "${AMARELO}Precisamos instalar o ${VERDE}Lynx{AMARELO}, por favor, digite sua senha:${SEM_COR}\n" && sudo apt-get install lynx

#Sem parametros obrigadorios
[ -z $1 ] && printf "${VERMELHO}[ERRO] - Informe os parametros obrigatorios. Consulte a opção -h.\n" && exit 1
