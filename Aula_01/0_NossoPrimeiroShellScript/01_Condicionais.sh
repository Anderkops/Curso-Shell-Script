#!/usr/bin/env bash

# Condicionais
VAR=""
VAR2="a"

if [[ "$VAR" == "$VAR2" ]]; then #Forma 1
    echo "Sao iguais!"
fi

#if [[ "$VAR" == "$VAR2" ]];     #Forma 2
#then
#    echo "Sao iguais!"
#fi

#if test "$VAR" = "$VAR2"        #Forma 3
#then
#    echo "Sao iguais!"
#fi

#if [ "$VAR" = "$VAR2" ]         #Forma 4
#then
#    echo "Sao iguais!"
#fi

#["$VAR" = "$VAR2"] && echo "Sao iguais." #Forma 5 so funciona se a condição for verdade

["$VAR" = "$VAR2"] || echo "Sao diferentes" #Forma 5 so funciona se a condição for verdade
