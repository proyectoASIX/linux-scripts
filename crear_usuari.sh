#!/bin/bash

# Neteja la pantalla per millorar l'experiència d'usuari
clear

echo "=== Eina de creació d'usuaris ==="

# Funció per llegir una dada no buida
demanar_no_buit() {
    local missatge="$1"
    local variable

    while true; do
        read -p "$missatge" variable
        if [ -z "$variable" ]; then
            echo "Error: aquest camp no pot estar buit. Torna-ho a intentar."
        else
            # Retornem el valor mitjançant echo perquè es pugui capturar
            echo "$variable"
            return 0
        fi
    done
}

# Demanar nom d'usuari
# Aquest bloc demana el nom d'usuari i s'assegura que no estigui buit
nom_usuari=$(demanar_no_buit "Introdueix el nom d'usuari desitjat: ")

# Demanar comentari o nom complet
# Aquest bloc demana el nom complet o comentari de la persona
comentari=$(demanar_no_buit "Introdueix el comentari o nom complet: ")

# Demanar nom del grup
# Aquest bloc demana el nom del grup on s'afegirà l'usuari
nom_grup=$(demanar_no_buit "Introdueix el nom del grup: ")

# Crear el grup si no existeix
if getent group "$nom_grup" > /dev/null 2>&1; then
    echo "El grup '$nom_grup' ja existeix. No cal crear-lo."
else
    echo "El grup '$nom_grup' no existeix. Creant-lo..."
    groupadd "$nom_grup"
    if [ $? -ne 0 ]; then
        echo "Error en crear el grup. Sortint."
        exit 1
    fi
fi

# Crear l'usuari amb el comentari i el grup primari
useradd -c "$comentari" -g "$nom_grup" "$nom_usuari"
if [ $? -ne 0 ]; then
    echo "Error en crear l'usuari. Revisa els paràmetres o els permisos."
    exit 1
fi

echo "L'usuari '$nom_usuari' s'ha creat correctament dins del grup '$nom_grup'."
