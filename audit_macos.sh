#!/bin/bash

# Collect Information in Variables
timenow=$(date '+%Y-%m-%d %X UTC')
gpu=$(system_profiler SPDisplaysDataType)
disk=$(system_profiler SPNVMeDataType | grep -B200 "Detachable Drive")
battery_capacity=$(system_profiler SPPowerDataType | grep -A3 -B7 "Condition")
hardware_data=$(system_profiler SPHardwareDataType)
serial_number=$(system_profiler SPHardwareDataType | awk '/Serial/ {print $4}')
cpu=$(sysctl -n machdep.cpu.brand_string)

# remove oldest file
rm ~/Desktop/${serial_number}_audit_mac.txt

# Write information in text file inside Desktop
echo "Datetime: $timenow" >> ~/Desktop/audit_mac.txt
echo "CPU: $cpu" >> ~/Desktop/audit_mac.txt

echo "
$hardware_data" >> ~/Desktop/audit_mac.txt

echo "
$gpu" >> ~/Desktop/audit_mac.txt

echo "
Storage: $disk" >> ~/Desktop/audit_mac.txt

echo "
Battery: 
$battery_capacity" >> ~/Desktop/audit_mac.txt

curl https://raw.githubusercontent.com/daroan/helpdesk/master/coconutBattery.zip -o ~/coconutBattery.zip

unzip ~/coconutBattery.zip

rm -rf ~/coconutBattery.zip

open -a ~/coconutBattery.app

sleep 5

rm -rf ~/coconutBattery.app

grep . ~/Desktop/audit_mac.txt >> ~/Desktop/${serial_number}_audit_mac.txt

rm ~/Desktop/audit_mac.txt

rm ~/test.sh

