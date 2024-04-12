#!/bin/bash

# Obter o número de série do PC
pc_serial=$(sudo dmidecode -s system-serial-number)

# Nome do arquivo de log com o número de série do PC
log_file=Desktop/"xstress_${pc_serial}.png"

sudo rm $log_file

sudo apt update

sudo apt install -y flatpak

sudo apt install -y gnome-screenshot

flatpak --user remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo

flatpak install -y flathub com.leinardi.gst

flatpak run com.leinardi.gst
