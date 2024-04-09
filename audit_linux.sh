
#!/bin/bash

# From site https://lindevs.com/install-inxi-on-ubuntu/
# sudo wget -O /usr/local/bin/inxi https://raw.githubusercontent.com/smxi/inxi/master/inxi

sudo wget -O /usr/local/bin/inxi https://raw.githubusercontent.com/daroan/helpdesk/master/inxi

sudo chmod a+x /usr/local/bin/inxi

# Our command to get hardware specifications
sudo inxi -Fxxc 0 > Desktop/audit_test.txt

echo "
Storage Information:" >> Desktop/audit_test.txt

sudo lsblk -d -o name,rota >> Desktop/audit_test.txt


