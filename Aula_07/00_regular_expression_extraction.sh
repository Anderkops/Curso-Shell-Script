#!/usr/bin/env bash                           # Compilador
#
# regular_expression_extraction.sh - Extrair dados do site usando Lynx direto no terminal
#
# Site:   https://seusite.com.br
# Autor: Anderson
# Manutenção: Anderson
#
# ------------------------------------------------------------------------ #
#
# Exemplos:
#
# $ ./nomeDoScript.sh -d 1
# Neste exemplo o script será executado no modo debug nivel 1
<< ESCREVER_NO_TERMINAL

Instalando Lynx no Linux

> sudo apt-get update       #Para ter certeza que atualizou 
> sudo apt install lynx -y

#Ver a pagina no browser do terminal
> lynx -source http://lxer.com/

#Filtrando Blurb
> lynx -source http://lxer.com/ | grep "blurb" 

# Colocando no arquivo titulos.txt
> lynx -source http://lxer.com/ | grep "blurb" > titulos.txt
> cat titulos.txt
> tail -n 2 titulos.txt
#Usa sed para filtrar tudo que começa com <div até line"
> tail -n 1 titulos.txt | sed 's/<div.*line"//'
> tail -n 1 titulos.txt | sed 's/<div.*line"//' | sed 's/<\/span.*'//
#Ao invés de usar 2 seds, da pra separar os filtros por ";"
#O "\" serve para não tratar o caractere como expressão regular, mas sim como caracter
> tail -n 1 titulos.txt | sed 's/<div.*line">//;s/<\/span.*//'
>  cat titulos.txt | sed 's/<div.*line">//;s/<\/span.*//'
ESCREVER_NO_TERMINAL >>