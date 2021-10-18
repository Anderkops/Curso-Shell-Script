#!/usr/bin/env bash
#
# listaUsuarios.sh - extrai usuarios do /etc/passwd
#
# Site:       https://meusite.com.br
# Autor:      Anderson
# Manutenção: Anderson
#
# ------------------------------------------------------------------------ #
# Irá extrair usuários do /etc/passwd, havendo a possibilidade de colocar em
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
#
# ------------------------------------------------------------------------ #
# Testado em: $SHELL --version
# GNU bash, version 5.0.17(1)-release (x86_64-pc-linux-gnu)
# ------------------------------------------------------------------------ #

# -------------------------------- VARIAVEIS ----------------------------- #

# ---------------------------------- TESTES ------------------------------ #

# --------------------------------- FUNÇÕES ------------------------------ #

# --------------------------------- EXECUÇÕES ---------------------------- #
if [ "$1" = "-h" ]; then
   echo "$MENSAGEM_USO" && exit 0
fi

if [ "$1" = "-v" ]; then
   echo "$VERSAO" && exit 0
fi

if [ "$1" = "-s" ]; then
   echo "$USUARIOS" | sort && exit 0
fi

echo "$USUARIOS"
# ------------------------------------------------------------------------ #
