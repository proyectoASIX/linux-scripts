#!/bin/bash
# Script: entrada_segura.sh
# Objectiu: Demanar una ruta vàlida utilitzant UNTIL i fer un compte enrere amb WHILE

# Bucle UNTIL → es repeteix mentre la condició és falsa
# Condició de parada: que la ruta existeixi (-e) o que l'usuari escrigui "sortir"

ruta=""

until [ -e "$ruta" ]; do
    read -p "Introdueix una ruta de fitxer existent (o escriu 'sortir'): " ruta

    # Si l'usuari vol sortir
    if [ "$ruta" = "sortir" ]; then
        echo "Has decidit sortir. Adeu!"
        exit 0
    fi

    # Si la ruta no existeix
    if [ ! -e "$ruta" ]; then
        echo "La ruta no és vàlida, torna-ho a intentar."
    fi
done

echo "Perfecte! La ruta '$ruta' existeix."

# Ara demanem un número per fer el compte enrere
read -p "Introdueix un número per al compte enrere: " num

# Validació numèrica
if ! [[ "$num" =~ ^[0-9]+$ ]]; then
    echo "Error: Has d'introduir un valor numèric."
    exit 1
fi

echo "Iniciant processament..."

# Bucle WHILE → es repeteix mentre la condició és certa
# Condició: mentre num sigui més gran o igual que 0
while [ "$num" -ge 0 ]; do
    echo "Processant l'element en $num segons..."
    sleep 1
    num=$((num - 1))
done

echo "Processament completat!"
