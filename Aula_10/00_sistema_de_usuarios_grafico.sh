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
[ ! -x "$(which dialog)" ] && sudo apt install dialog 1>/dev/null 2>&1

# ------------------------------- FUNÇÕES -------------------------------- #
ListaUsuarios() {
    egrep -v "^#|^$" "$ARQUIVO_BANCO_DE_DADOS" | tr : ' ' >"$TEMP"
    # Passa o arquivo temporario para o Dialog com espaço ao invés de :
    dialog --title "Lista Usuarios" --textbox "$TEMP" 20 40
    rm -f "$TEMP"
}

ValidaExistenciaUsuario() {
    grep -i -q "$1$SEP" "$ARQUIVO_BANCO_DE_DADOS"
}

InsereUsuario() {
    local ultimo_id="$(egrep -v "^#|^$" "$ARQUIVO_BANCO_DE_DADOS" | sort | tail -n 1 | cut -d $SEP -f 1)"
    local proximo_id=$(($ultimo_id + 1))

    local nome=$(dialog --title "Cadastro de Usuários" --stdout --inputbox "Digite o seu nome" 0 0)
    [ ! "$nome" ] && return

    ValidaExistenciaUsuario "$nome" && {
        dialog --title "Erro Fatal!" --msgbox "Usuario ja cadastrado no sistema" 6 40
        return
    }

    local email=$(dialog --title "Cadastro de Usuários" --stdout --inputbox "Digite o seu email" 0 0)
    [ $? -ne 0 ] && return #Ne significa que a saida é diferente de 0

    echo "$proximo_id$SEP$nome$SEP$email" >>"$ARQUIVO_BANCO_DE_DADOS"
    dialog --title "SUCESSO!" --msgbox "Usuario cadastrado com sucesso!" 6 40
    ListaUsuarios
}

RemoverUsuario() {
    local usuarios=$(egrep "^#|^$" -v "$ARQUIVO_BANCO_DE_DADOS" | sort -h | cut -d $SEP -f 1,2 | sed 's/:/ "/;s/$/"/')
    local id_usuario=$(eval dialog --stdout --menu \"Escolha um usuário:\" 0 0 0 $usuarios)
    [ $? -ne 0 ] && return #Ne significa que a saida é diferente de 0

    grep -i -v "^$id_usuario$SEP" "$ARQUIVO_BANCO_DE_DADOS" >"$TEMP"
    mv "$TEMP" "$ARQUIVO_BANCO_DE_DADOS"

    dialog --msgbox "Usuário removido com sucesso!"
    ListaUsuarios
}

OrdenaLista() {
    sort "$ARQUIVO_BANCO_DE_DADOS" >"$TEMP"
    mv "$TEMP" "$ARQUIVO_BANCO_DE_DADOS"
}

# ------------------------------- EXECUÇÃO ------------------------------- #

while :; do
    acao=$(dialog --title "Gerenciamento de Usuários 2.0" \
        --stdout \
        --menu "Escolha uma das opções abaixo:" \
        0 0 0 \
        listar "Listar todos os usuários do sistema" \
        inserir "Inserir um novo usuário no sistema" \
        remover "Remover um usuário do sistema")
    [ $? -ne 0 ] && exit

    case $acao in
    listar) ListaUsuarios ;;
    inserir) InsereUsuario ;;
    remover) RemoverUsuario ;;
    esac
done
