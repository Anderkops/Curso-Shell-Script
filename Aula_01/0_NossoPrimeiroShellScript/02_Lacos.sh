#!/usr/bin/env bash

# Exemplo For 1
<<COMENTARIO_EM_BLOCO
echo "======= FOR 1"
for ((i = 0; i < 10; i++)); do
    echo $i
done

# Exemplo For 2 usando SEQ
echo "======= FOR 2"
for i in $(seq 20); do
    echo $i
done

# Exemplo For 3 com array
echo "======= FOR 3 (array)"
FRUTAS=(
    'Laranja'
    'Ameixa'
    'Abacaxi'
    'Melancia'
)

for i in "${FRUTAS[@]}"; do
    echo $i
done

COMENTARIO_EM_BLOCO

# Exemplo While com array
echo "======= While"

FRUTAS=(
    'Laranja'
    'Ameixa'
    'Abacaxi'
    'Melancia'
)
contador=0
while [[ $contador -lt ${#FRUTAS[@]} ]]; do #lt = less then
    echo $contador
    contador=$(($contador + 1))
done
