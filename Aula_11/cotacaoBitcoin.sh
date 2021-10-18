#!/usr/bin/env bash
#
# cotacaoBitcoin.sh - Obtem informações do "Mercado Bitcoin" API
#
# Site:       https://meusite.com.br
# Ator:       Anderson
# Manutenção: Anderson
#
# ------------------------------------------------------------------------ #
#  Esse script recebe 2 parametros
#    * tempo de atualização (segundos) - Quanto tempo leva para atualizar
#    * numero de requisições - Quantas requisições serão feitas para a API
#
# Examples:
#      $ ./cotacaoBitcoin.sh 5 10 - 10 Requisições a cada 5 segundos
# ------------------------------------------------------------------------ #
# Historico:
#
#   v1.0 18/10/2021, Anderson
# ------------------------------------------------------------------------ #
# Testado em: $SHELL --version
#  GNU bash, version 5.0.16(1)-release (x86_64-pc-linux-gnu)
# ------------------------------- VARIAVEIS ------------------------------ #
# Cores para impressao
VERDE='\033[1;32m'
SEM_COR='\033[0m'
AMARELO='\033[1;33m'

# Mensagem -h
MENSAGEM="
Uso: $(basename "$0") TEMPO_DE_ATUALIZACAO VEZES_EXECUTADAS (OPÇÕES)

OPÇÕES:
    -v, --version - Mostra a versão do script
    -h, --help - Mostra opções de ajuda
"
VERSAO="v1.0"

API_MERCADO_BITCOIN="https://www.mercadobitcoin.net/api/BTC/ticker/"
DESCRICAO_DAS_INFORMACOES=(
  "Maior Preço nas ultimas 24 horas: "
  "Menor Preço nas ultimas 24 horas: "
  "Quantidade negociada nas últimas 24 horas: "
  "Preço unitário da ultima negociação: "
  "Maior preço de oferta de compra das últimas 24 horas: "
  "Menor preço de oferta de venda das ultimas 24 horas: "
  "Preço unitário de abertura de negociação no dia: "
  "Data: "
)
TEMPO_DE_ATUALIZACAO=${1:-1}
VEZES_EXECUTADAS=${2:-10}
# ------------------------------------------------------------------------ #

# ------------------------------- TESTES --------------------------------- #
# Lynx está instalado?
[ ! -x "$(which lynx)" ] && printf "${AMARELO}Precisamos instalar o ${VERDE}Lynx${AMARELO}, entre com sua senha:${SEM_COR}\n" && sudo apt install lynx -y 1>/dev/null 2>&1

# ------------------------------ FUNÇÕES --------------------------------- #
formatarData() {
  date -d "@${1}" +%d/%m/%Y # Formatando data para dd/mm/yyyy
}

obterDados() {
  # O numero 6 significa formatar a data para dd/mm/yyyy
  [ $1 -eq 7 ] && echo -e "${VERDE}${DESCRICAO_DAS_INFORMACOES[$1]}${AMARELO}$(formatarData ${ARRAY_JSON_MERCADO_BITCOIN[$1]})\n--" && return
  echo -e "${VERDE}${DESCRICAO_DAS_INFORMACOES[$1]}${AMARELO}${ARRAY_JSON_MERCADO_BITCOIN[$1]}"
}

listaDados() {
  local counter=0
  local counter_2=0

  while [[ $counter -lt $VEZES_EXECUTADAS ]]; do
    while [[ $counter_2 -lt ${#ARRAY_JSON_MERCADO_BITCOIN[@]} ]]; do
      obterDados $counter_2
      counter_2=$(($counter_2 + 1))
    done
    sleep $TEMPO_DE_ATUALIZACAO
    counter=$(($counter + 1))
    counter_2=0
  done
}
# ------------------------------ EXECUÇÃO --------------------------------- #

if test -n "$1"; then
  case "$1" in
  -v | --version) printf "Versao $VERSAO\n" && exit 0 ;;
  -h | --help) printf "$MENSAGEM\n" && exit 0 ;;
  esac
fi

# Cria um array com as variaveis de retorno
read -r -a ARRAY_JSON_MERCADO_BITCOIN <<<"$(lynx -source $API_MERCADO_BITCOIN | sed 's/[^0-9 .]/ /g')"

listaDados
# ------------------------------------------------------------------------ #
