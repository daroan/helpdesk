#!/bin/bash

read -p "NextCloud Username: " username
read -s -p "NextCloud Password: " password

# Obtém o número de série do Mac
serial_number=$(system_profiler SPHardwareDataType | awk '/Serial Number/ {print $4}')

# Loop infinito para testar a bateria a cada 5 minutos
while true; do
    # Obtém informações da bateria
    # battery_info=$(pmset -g batt)
    battery_info=$(system_profiler SPPowerDataType | grep -A3 -B7 "Condition")
    timenow=$(date '+%Y-%m-%d %X UTC')

    # Registra as informações no arquivo de log
    echo "~~~~~~~~~" >> ~/Desktop/battery_${serial_number}.txt
    echo "$timenow" >> ~/Desktop/battery_${serial_number}.txt
    echo "Serial Number: $serial_number" >> ~/Desktop/battery_${serial_number}.txt
    echo "$battery_info" >> ~/Desktop/battery_${serial_number}.txt

    # Enviar para Nextcloud
    curl -u ${username}:${password} -T ~/Desktop/battery_${serial_number}.txt https://cloud01.opsdata.ch/remote.php/dav/files/$username/
    
    # Espera 5 minutos
    echo $timenow
    sleep 300
done

