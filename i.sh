#!/bin/bash
# Script para actualizar el sistema e instalar paquetes definidos en una variab>

# Definición variable con los paquetes a instalar
PAQUETES="vim git curl"

# Actualización de la lista de paquetes
sudo apt update

# Actualización de los paquetes instalados
sudo apt upgrade -y 

# Instalación de los paquetes definidos en la variable
sudo apt install -y $PAQUETES

