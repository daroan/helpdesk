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
hardwaredatatype=$(system_profiler SPHardwareDataType)

# ObtŽm o nœmero de sŽrie do Mac
serial_number=$(system_profiler SPHardwareDataType | awk '/Serial/ {print $4}')

# remove oldest file
rm ~/Desktop/${serial_number}_audit_mac.txt

# Escreve as informa›es no arquivo de texto
echo "Datetime: $timenow" >> ~/Desktop/${serial_number}_audit_mac.txt
echo "Serial_Number: $serial_number" >> ~/Desktop/${serial_number}_audit_mac.txt
echo "Model: $model" >> ~/Desktop/${serial_number}_audit_mac.txt
echo "Graphic_Card: $gpu" >> ~/Desktop/${serial_number}_audit_mac.txt
echo "CPU: $cpu" >> ~/Desktop/${serial_number}_audit_mac.txt
echo "Screen_Resolution: $resolution" >> ~/Desktop/${serial_number}_audit_mac.txt
echo "RAM: $ram" >> ~/Desktop/${serial_number}_audit_mac.txt
echo "Storage: $disk" >> ~/Desktop/${serial_number}_audit_mac.txt
echo "Battery: 
$battery_capacity" >> ~/Desktop/${serial_number}_audit_mac.txt
echo "Hardware Data Type:
$hardwaredatatype" >> ~/Desktop/${serial_number}_audit_mac.txt

