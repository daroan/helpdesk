#!/bin/bash

# Solicitar login do usuário
# echo "Login required"
read -p "NextCloud Username: " username
read -s -p "NextCloud Password: " password
# echo

# sudo apt update
# sudo apt install -y curl

sudo systemctl mask sleep.target suspend.target hibernate.target hybrid-sleep.target

# Obter o número de série do PC
pc_serial=$(sudo dmidecode -s system-serial-number)

# Nome do arquivo de log com o número de série do PC
log_file=Desktop/"battery_${pc_serial}.txt"

sudo rm $log_file

# Função para obter informações completas da bateria e do PC
get_battery_and_pc_info() {
    # Obter informações do número de série do PC
    pc_serial=$(echo $password | sudo -S dmidecode -s system-serial-number)

    # Obter informações do número de série da bateria
    battery_serial=$(upower -i $(upower -e | grep BAT) | grep serial | awk '{print $2}')

    # Obter informações completas da bateria
    battery_info=$(upower -i $(upower -e | grep BAT))

    # Imprimir informações
    echo "PC Serial Number: $pc_serial"
    echo "Battery Serial Number: $battery_serial"
    echo "Battery Info:"
    echo "$battery_info"
}

echo 100 | sudo tee /sys/class/backlight/*/brightness

# Loop principal
while true; do
    # echo "test1357" | sudo -S 
    
    # Coletar informações da bateria e do PC
    info=$(get_battery_and_pc_info)

    # Salvar informações em um arquivo com timestamp
    timestamp=$(date +"%Y-%m-%d_%H:%M:%S")
    echo "Bat and PC Info at $timestamp:" >> "$log_file"
    echo "$info" >> "$log_file"
    echo "-------------------DaRoAn---------------------" >> "$log_file"

    # Enviar para Nextcloud
    curl -u ${username}:${password} -T "${log_file}" https://cloud01.opsdata.ch/remote.php/dav/files/$username/
    
    # Informações no terminal
    echo "Bat and PC Info at $timestamp:"
    
    # Esperar 5 minutos até a próxima coleta de dados
    sleep 300
done
