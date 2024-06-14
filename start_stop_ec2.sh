#!/bin/bash

# Función para detener la instancia
stop_instance() {
    echo "Deteniendo la instancia con ID ${INSTANCE_ID}..."
    aws ec2 stop-instances --instance-ids "${INSTANCE_ID}"
    echo "La instancia con ID ${INSTANCE_ID} ha sido detenida."
}

# Función para iniciar la instancia
start_instance() {
    echo "Iniciando la instancia con ID ${INSTANCE_ID}..."
    aws ec2 start-instances --instance-ids "${INSTANCE_ID}"
    echo "La instancia con ID ${INSTANCE_ID} ha sido iniciada."
}

# Menú interactivo
echo "Menú de control de instancia EC2"
echo ""
echo "1. Iniciar instancia"
echo "2. Detener instancia"
echo ""
read -p "Seleccione una opción: " OPTION

# Obtener el ID de la instancia del usuario
read -p "Ingrese el ID de la instancia EC2: " INSTANCE_ID

case $OPTION in
    1) start_instance ;;
    2) stop_instance ;;
    *) echo "Opción inválida. Saliendo del script." ;;
esac


