#!/usr/bin/env bash                           # Compilador
#
# regular_expression.sh - Conjunto de expressões regulares escrito direto no terminal
#
# Site:   https://seusite.com.br
# Autor: Anderson
# Manutenção: Anderson
#
# ------------------------------------------------------------------------ #
# Aqui voce deve utilizar uma descrição mais detalhada sobre seu programa
# explicando a forma de utilizar
#
# Exemplos:
#
# $ ./nomeDoScript.sh -d 1
# Neste exemplo o script será executado no modo debug nivel 1

#Tudo que começa com m
<< COMANDOS_DIRETO_NO_TERMINAL
>cat /etc/passwd | grep "^m"  (#O pipe aloca mais recursos, da pra usar direto o grep)

#Busca mais otimizada
>grep "^m" /etc/passwd 

#Tudo que termina com h
>grep "h$" /etc/passwd

#Tudo que começa com r e termina com h e tem qualquer coisa no meio
>grep "^r.*h$" /etc/passwd

#Tudo que começa com m e o segundo digito seja 'a' ou 'e'
>grep "^m[ae]" /etc/passwd

#Tudo que começa com m e o segundo digito não seja 'a'
>grep "^m[^a]" /etc/passwd

#Tudo que começa com m e o segundo digito não seja 'a'
>grep "^m[^e]" /etc/passwd

#Tudo que começa com qualquer coisa (ponto .) mas que o segundo dígito seja o 'a'
>grep "^.[a]"  /etc/passwd

COMANDOS_DIRETO_NO_TERMINAL >>
