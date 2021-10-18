#!/usr/bin/env bash
#
# Soma.sh - Faz a soma dentro de um while e verifica o nivel de debug
#
# Site:       https://meusite.com.br
# Autor:      Anderson
# Manitenção: Anderson
#
# ------------------------------------------------------------------------ #
# Exemplos:
#
# ------------------------------------------------------------------------ #
# Historico:
#
# v1.0 14/10/2021, Anderson: Criada funcao de soma
#
# ------------------------------------------------------------------------ #
# Testado em: $SHELL --version
# GNU bash, version 5.0.17(1)-release (x86_64-pc-linux-gnu)
# ------------------------------------------------------------------------ #

# -------------------------------- VARIAVEIS ----------------------------- #
CHAVE_DEBUG=0
NIVEL_DEBUG=0
# ---------------------------------- DEBUG ------------------------------ #
# -- Forma 1
# $bash -x -v ./00_debug_1.sh
# -- Forma 2
# set -x
# BLOCO DE CODIGO
# set +x
# Função Debugar niveis de debug
# ---------------------------------- TESTES ------------------------------ #

# --------------------------------- FUNÇÕES ------------------------------ #
Debugar() {
    [ $1 -le $NIVEL_DEBUG ] && echo "Debug $* ------"
}

Soma() {
    local total=0
    for i in $(seq 1 25); do
        Debugar 1 "Entrei no for com o valor: $i"
        total=$(($total + $i))
        Debugar 2 "Depois da soma: $total"
    done
    echo $total
}

# --------------------------------- EXECUÇÕES ---------------------------- #
case "$1" in
-d) [ $2 ] && NIVEL_DEBUG=$2 ;;
*) Soma ;;
esac

Soma
# ------------------------------------------------------------------------ #
