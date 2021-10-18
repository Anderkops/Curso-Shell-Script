#!/usr/bin/env bash
#
# extrai_titulos.sh - Extrair dados do site usando shell script
#
# Site:   https://seusite.com.br
# Autor: Anderson
# Manutenção: Anderson
#
# ------------------------------------------------------------------------ #
#
# Exemplos:
#        $ ./extrai_titulos.sh
#        Nesse exemplo o programa vai extrar os titulos da página
#
# ------------------------------------------------------------------------ #
# Historico:
#
# v1.0 16/10/2021 Anderson:
#       Extrair titulos da página http://lxer.com/
#
# ------------------------------------------------------------------------ #
# Testado em: $SHELL --version
# GNU bash, version 5.0.17(1)-release (x86_64-pc-linux-gnu)
# ------------------------------------------------------------------------ #

# -------------------------------- VARIAVEIS ----------------------------- #
ARQUIVO_DE_TITULOS='titulos.txt'
VERDE='\033[32;1m'    #Cores
VERMELHO='\033[31;1m' #Cores
# --------------------------------- TESTES ------------------------------- #
#Verifica se o Lynx está instalado
[ ! -x "$(which lynx)" ] && sudo apt install lynx -y #Lynx Instalado
# --------------------------------- FUNÇÕES ------------------------------ #

#-------------------------------- EXECUÇÕES ----------------------------- #
lynx -source http://lxer.com/ | grep blurb | sed 's/<div.*line">//;s/<\/span.*//' >titulos.txt

while read -r titulo_lxer; do
    echo -e "${VERMELHO}Titulo: ${VERDE}$titulo_lxer"
done <"$ARQUIVO_DE_TITULOS"
#------------------------------------------------------------------------ #
