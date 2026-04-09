#!/bin/bash
# a.sh - Script para actualizar el sistema en una distro basado en Debian/Ubuntu

# Actualiza la lista de paquetes disponibles desde los repositorios
sudo apt update

# Actualiza todos los paquetes instalados sin pedir confirmación (-Y)
sudo apt upgrade -y
