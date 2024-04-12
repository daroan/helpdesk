
#!/bin/bash

# From site https://lindevs.com/install-inxi-on-ubuntu/
# sudo wget -O /usr/local/bin/inxi https://raw.githubusercontent.com/smxi/inxi/master/inxi

pc_serial=$(sudo dmidecode -s system-serial-number)
log_file=Desktop/"${pc_serial}_audit_test.txt"

sudo systemctl mask sleep.target suspend.target hibernate.target hybrid-sleep.target

sudo wget -O /usr/local/bin/inxi https://raw.githubusercontent.com/daroan/helpdesk/master/inxi

sudo chmod a+x /usr/local/bin/inxi

# Our command to get hardware specifications
# sudo inxi -Fxxc 0 > Desktop/audit_test.txt
sudo inxi -Fxxc 0 > "$log_file"

echo "
Storage Information:"  >> "$log_file" 
#>> Desktop/audit_test.txt

sudo lsblk -d -o name,rota  >> "$log_file"
#>> Desktop/audit_test.txt


