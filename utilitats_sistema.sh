#!/bin/bash

###############################################
# Funció benvinguda
# Rep: un nom (paràmetre $1)
# Mostra un missatge personalitzat de benvinguda
###############################################
benvinguda() {
    local nom="$1"
    echo "Hola $nom, anem a comprovar el sistema"
}

###############################################
# Funció comprova_usuari
# Rep: un nom d'usuari ($1)
# Comprova si existeix a /etc/passwd
###############################################
comprova_usuari() {
    local usuari="$1"

    if grep -q "^$usuari:" /etc/passwd; then
        echo "L'usuari '$usuari' EXISTEIX al sistema."
    else
        echo "L'usuari '$usuari' NO existeix al sistema."
    fi
}

###############################################
# Funció calculadora_espai
# Mostra l'espai lliure de la partició /
###############################################
calculadora_espai() {
    echo "Espai lliure a la partició principal (/):"
    df -h /
}


# ------------------------------
# Lògica principal de l'script
# ------------------------------

# Demanar nom de l'alumne
read -p "Introdueix el teu nom: " nom_alumne
benvinguda "$nom_alumne"

# Demanar nom d'usuari del sistema
read -p "Introdueix un nom d'usuari del sistema: " nom_usuari
comprova_usuari "$nom_usuari"

# Mostrar espai lliure
calculadora_espai
