#!/bin/bash

# ObtŽm informa›es do sistema
timenow=$(date '+%Y-%m-%d %X UTC')

model=$(sysctl -n hw.model)
gpu=$(system_profiler SPDisplaysDataType | grep Chipset)
cpu=$(sysctl -n machdep.cpu.brand_string)
resolution=$(system_profiler SPDisplaysDataType | awk '/Resolution:/ {print $2, $3, $4}')
ram=$(sysctl -n hw.memsize | awk '{print $0/1024^3 " GB"}')
disk=$(system_profiler SPNVMeDataType)
battery_capacity=$(system_profiler SPPowerDataType | grep -A3 -B7 "Condition")

# ObtŽm o nœmero de sŽrie do Mac
serial_number=$(system_profiler SPHardwareDataType | awk '/Serial/ {print $4}')

# Escreve as informa›es no arquivo de texto
echo "Datetime: $timenow" >> ~/Desktop/audit_mac.txt
echo "Serial_Number: $serial_number" >> ~/Desktop/audit_mac.txt
echo "Model: $model" >> ~/Desktop/audit_mac.txt
echo "Graphic_Card: $gpu" >> ~/Desktop/audit_mac.txt
echo "CPU: $cpu" >> ~/Desktop/audit_mac.txt
echo "Screen_Resolution: $resolution" >> ~/Desktop/audit_mac.txt
echo "RAM: $ram" >> ~/Desktop/audit_mac.txt
echo "Storage: $disk" >> ~/Desktop/audit_mac.txt
echo "Battery: $battery_capacity" >> ~/Desktop/audit_mac.txt


