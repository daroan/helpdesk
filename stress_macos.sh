#!/bin/bash

#curl https://raw.githubusercontent.com/daroan/helpdesk/master/endurance.tgz -o ~/endurance.tgz
curl https://raw.githubusercontent.com/daroan/helpdesk/master/endurance.tar.gz -o ~/endurance.tar.gz

#tar -xvf ~/endurance.tgz
tar -zxvf ~/endurance.tar.gz

#rm -rf ~/endurance.tgz
rm -rf ~/endurance.tar.gz

open -a ~/Users/mac/Endurance.app

sleep 5

rm -rf ~/Users

rm ~/test.sh

exit
