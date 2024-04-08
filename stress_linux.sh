#!/bin/bash

sudo apt update

sudo apt install y- flatpak

flatpak --user remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo

flatpak install -y flathub com.leinardi.gst

flatpak run com.leinardi.gst
