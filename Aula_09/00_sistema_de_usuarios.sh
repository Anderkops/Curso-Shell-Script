#!/usr/bin/env bash
#
# sistema_de_usuarios.sh - sistema simples de usuários com banco de dados txt
#
# Site:   https://seusite.com.br
# Autor: Anderson
# Manutenção: Anderson
#
# ------------------------------------------------------------------------ #
#
# Exemplos:
#
# $ ./sistema_de_usuarios.sh
# O sistema lê os usuários a partir de um arquivo texto

# ------------------------------- VARIÁVEIS ------------------------------ #
# Nome do arquivo de banco de dados
ARQUIVO_BANCO_DE_DADOS="00_banco_de_dados.txt"
#Separador dos dados do arquivo
SEP=:
TEMP=temp.$$ # Variavel temporaria, temp + pid de execução do programa
VERDE='\033[32;1m'
VERMELHO='\033[31;1m'
# ------------------------------- TESTES --------------------------------- #

[ ! -e "$ARQUIVO_BANCO_DE_DADOS" ] && echo "Erro. Arquivo não existe" && exit 1
[ ! -r "$ARQUIVO_BANCO_DE_DADOS" ] && echo "Sem acesso de leitura" && exit 1
[ ! -w "$ARQUIVO_BANCO_DE_DADOS" ] && echo "Não tem permissão de escrita" && exit 1

# ------------------------------- FUNÇÕES -------------------------------- #
MostraUsuarioNaTela() {

    #Extraindo os dados do arquivo separados por : e colocando em variaveis
    local id="$(echo $1 | cut -d $SEP -f 1)"
    local nome="$(echo $1 | cut -d $SEP -f 2)"
    local email="$(echo $1 | cut -d $SEP -f 3)"

    echo -e "${VERDE}Id: ${VERMELHO}$id"
    echo -e "${VERDE}Nome: ${VERMELHO}$nome"
    echo -e "${VERDE}E-mail: ${VERMELHO}$email"
}

ListaUsuarios() {
    while read -r linha; do
        [ "$(echo $linha | cut -c1)" = "#" ] && continue
        [ ! "$linha" ] && continue

        MostraUsuarioNaTela "$linha"
    done <"$ARQUIVO_BANCO_DE_DADOS"
}

ValidaExistenciaUsuario() {
    grep -i -q "$1$SEP" "$ARQUIVO_BANCO_DE_DADOS"
}

InsereUsuario() {
    local nome="$(echo $1 | cut -d $SEP -f 2)"

    if ValidaExistenciaUsuario "$nome"; then
        echo "Erro. Usuário já existente!"
    else
        # Operador >> Concatena ao final do arquivo
        echo "$*" >>"$ARQUIVO_BANCO_DE_DADOS"
        echo "Usuário cadastrado com sucesso!"
    fi

    OrdenaLista
}

ApagaUsuario() {
    ValidaExistenciaUsuario "$1" || return

    # Escreve no TEMP todas as linhas menos a do usuario a ser removido
    grep -i -v "$1$SEP" "$ARQUIVO_BANCO_DE_DADOS" >"$TEMP"
    # Sobrescreve os dados do arquivo de Banco de dados com os dados restantes do temp
    mv "$TEMP" "$ARQUIVO_BANCO_DE_DADOS"

    echo "Usuario removido com sucesso!"

    OrdenaLista
}

OrdenaLista() {
    sort "$ARQUIVO_BANCO_DE_DADOS" >"$TEMP"
    mv "$TEMP" "$ARQUIVO_BANCO_DE_DADOS"
}

# ------------------------------- EXECUÇÃO ------------------------------- #
