#!/usr/bin/env bash

# ------------------------------- VARIÁVEIS ------------------------------ #
ARQUIVO_DE_CONFIGURACAO="00_configuracao.cf"
USAR_CORES=
USAR_MAIUSCULAS=
MENSAGEM="Mensagem de teste"
VERDE='\033[32;1m'    #Cores
VERMELHO='\033[31;1m' #Cores
# -------------------------------- TESTES -------------------------------- #
#Verifica se o arquivo está definido e com permissão de leitura
[ ! -r "$ARQUIVO_DE_CONFIGURACAO" ] && echo "Não temos acesso de leitura" && exit 1
# ------------------------------- FUNÇÕES -------------------------------- #
DefinirParametros() {
    local parametro="$(echo $1 | cut -d = -f 1)"
    local valor="$(echo $1 | cut -d = -f 2)"

    case "$parametro" in
    USAR_CORES) USAR_CORES=$valor ;;
    USAR_MAIUSCULAS) USAR_MAIUSCULAS=$valor ;;
    esac
}

# ------------------------------------------------------------------------ #

# --------------------------------EXECUÇÃO-------------------------------- #
while read -r linha; do
    # Retira tudo que começa com comentário
    [ "$(echo $linha | cut -c1)" = "#" ] && continue
    [ ! "$linha" ] && continue
    DefinirParametros "$linha"
done <"$ARQUIVO_DE_CONFIGURACAO"

# -eq comparação numérica
[ $USAR_MAIUSCULAS -eq 1 ] && MENSAGEM="$(echo -e $MENSAGEM | tr [a-z] [A-Z])"
[ $USAR_CORES -eq 1 ] && MENSAGEM="$(echo -e ${VERDE}$MENSAGEM)"

echo "$MENSAGEM"
# ------------------------------------------------------------------------ #
