#!/bin/bash
# Script per actualitzar el sistema i instal·lar paquets passats com a paràmetres

# Comprovar que s'han passat paràmetres
if [ $# -eq 0 ]; then
    echo "Ús: $0 paquet1 paquet2 ..."
    exit 1
fi

echo "Actualitzant índex de paquets..."
sudo apt update

echo "Actualitzant paquets instal·lats..."
sudo apt upgrade -y

echo "Instal·lant paquets: $@"
sudo apt install -y "$@"

echo "Operació completada."
