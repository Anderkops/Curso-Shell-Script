#!/usr/bin/env bash
#
# listaUsuarios.sh - extrai usuarios do /etc/passwd
#
# Site:       https://meusite.com.br
# Autor:      Anderson
# Manutenção: Anderson
#
# ------------------------------------------------------------------------ #
# Ira extrair usuários do /etc/passwd, havendo a possibilidade de colocar em
# maiuscula e em ordem alfabética
#
# Exemplos:
#
# $ ./listaUsuarios.sh -s -m
# Neste exemplo ficará em maiúsculo e em ordem alfabética
#
# ------------------------------------------------------------------------ #
# Historico:
#
# v1.0 18/09/2021, Anderson:
#       Adicionado -s, -h & -v
# v1.1 14/10/2021, Anderson:
#       Trocamos o if pelo case
#       Adicionamos o basename
# v1.2 14/10/2021, Anderson:
#       Adicionado -m
#       Adicionado 2 flags
#
#
# ------------------------------------------------------------------------ #
# Testado em: $SHELL --version
# GNU bash, version 5.0.17(1)-release (x86_64-pc-linux-gnu)
# ------------------------------------------------------------------------ #

# -------------------------------- VARIAVEIS ----------------------------- #

# Pega a coluna 1 do /etc/passwd
USUARIOS="$(cat /etc/passwd | cut -d : -f 1)"
MENSAGEM_USO="
   $(basename $0) - [OPÇÕES]

    -h - Menu de ajuda
    -v - Versão
    -s - Ordenar a saida
    -m - Coloca em maiúsculo"
VERSAO="v1.2"
CHAVE_ORDENA=0
CHAVE_MAIUSCULO=0
# ---------------------------------- TESTES ------------------------------ #

# --------------------------------- FUNÇÕES ------------------------------ #

# --------------------------------- EXECUÇÕES ---------------------------- #
# if [ "$1" = "-h" ]; then
#     echo "$MENSAGEM_USO" && exit 0
# fi

# if [ "$1" = "-v" ]; then
#     echo "$VERSAO" && exit 0
# fi

# if [ "$1" = "-s" ]; then
#     echo "$USUARIOS" | sort && exit 0
# fi

case "$1" in
-h) echo "$MENSAGEM_USO" && exit 0 ;;
-v) echo "$VERSAO" && exit 0 ;;
-s) CHAVE_ORDENA=1 ;;
-m) CHAVE_MAIUSCULO=1 ;;
*) echo "$USUARIOS" ;;
esac

[ $CHAVE_ORDENA -eq 1 ] && USUARIOS=$(echo "$USUARIOS" | sort)
[ $CHAVE_MAIUSCULO -eq 1 ] && USUARIOS=$(echo "$USUARIOS" | tr [a-z] [A-Z])

echo "$USUARIOS"
# ------------------------------------------------------------------------ #
