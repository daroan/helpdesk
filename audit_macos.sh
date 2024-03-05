#!/bin/bash

# Apaga ultimo arquivo
rm ~/Desktop/audit.txt

# Obt�m informa��es do sistema
timenow=$(date '+%Y-%m-%d %X UTC')

model=$(sysctl -n hw.model)
gpu=$(system_profiler SPDisplaysDataType | grep Chipset)
cpu=$(sysctl -n machdep.cpu.brand_string)
resolution=$(system_profiler SPDisplaysDataType | awk '/Resolution:/ {print $2, $3, $4}')
ram=$(sysctl -n hw.memsize | awk '{print $0/1024^3 " GB"}')
disk=$(system_profiler SPNVMeDataType)
battery_capacity=$(system_profiler SPPowerDataType | grep -A3 -B7 "Condition")

# Obt�m o n�mero de s�rie do Mac
serial_number=$(system_profiler SPHardwareDataType | awk '/Serial/ {print $4}')

# Escreve as informa��es no arquivo de texto
echo "Datetime: $timenow" >> ~/Desktop/audit.txt
echo "Serial_Number: $serial_number" >> ~/Desktop/audit.txt
echo "Model: $model" >> ~/Desktop/audit.txt
echo "Graphic_Card: $gpu" >> ~/Desktop/audit.txt
echo "CPU: $cpu" >> ~/Desktop/audit.txt
echo "Screen_Resolution: $resolution" >> ~/Desktop/audit.txt
echo "RAM: $ram" >> ~/Desktop/audit.txt
echo "Storage: $disk" >> ~/Desktop/audit.txt
echo "Battery: $battery_capacity" >> ~/Desktop/audit.txt


