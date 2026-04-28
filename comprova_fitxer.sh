#!/bin/bash

# Neteja la pantalla per millorar la visibilitat
clear

# Demana a l'usuari la ruta del fitxer o directori
read -p "Introdueix la ruta d'un fitxer o directori: " RUTA

# Validació: comprova que la variable no estigui buida
if [ -z "$RUTA" ]; then
    echo "No has introduït cap ruta"
    exit 1
fi

# Comprovació d'existència
# Test -e: comprova si l'element existeix al sistema
if [ -e "$RUTA" ]; then
    echo "L'element $RUTA existeix"

    # Comprovació del tipus d'element
    # Test -f: comprova si és un fitxer regular
    if [ -f "$RUTA" ]; then
        echo "És un fitxer"
    # Test -d: comprova si és un directori
    elif [ -d "$RUTA" ]; then
        echo "És un directori"
    else
        echo "Existeix però no és ni fitxer ni directori estàndard"
    fi

    # Comprovació de permisos de lectura
    # Test -r: comprova si l'usuari té permís de lectura
    if [ -r "$RUTA" ]; then
        echo "Tens permisos per llegir aquest element"
    else
        echo "No tens permís de lectura"
    fi

else
    # Si no existeix, mostra error
    echo "Error: La ruta $RUTA no es troba en el sistema"
fi
