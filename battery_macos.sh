#!/bin/bash

# Apaga ultimo arquivo
rm ~/Desktop/battery.txt

# Obtém o número de série do Mac
serial_number=$(system_profiler SPHardwareDataType | awk '/Serial Number/ {print $4}')

# Loop infinito para testar a bateria a cada 5 minutos
while true; do
    # Obtém informações da bateria
    # battery_info=$(pmset -g batt)
    battery_info=$(system_profiler SPPowerDataType | grep -A3 -B7 "Condition")
    timenow=$(date '+%Y-%m-%d %X UTC')

    # Registra as informações no arquivo de log
    echo "~~~~~~~~~" >> ~/Desktop/battery.txt
    echo "$timenow" >> ~/Desktop/battery.txt
    echo "Serial Number: $serial_number" >> ~/Desktop/battery.txt
    echo "$battery_info" >> ~/Desktop/battery.txt

    # Espera 5 minutos
    echo $timenow
    sleep 300
done

