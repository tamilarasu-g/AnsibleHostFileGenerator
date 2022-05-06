#!/bin/bash

#File name for the usernames
INPUT_FILE="data.csv"

#File name of the Ansible Hosts
ANSIBLE_HOSTS="ansible.conf"

#Loop through the files and do the thing

#Set the i variable for looping
i=1

while IFS="," read -r username password port_no
do
    echo -n "
[host${i}]
host${i}-ip

[host${i}:vars]
ansible_user=${username}
ansible_password=${password}
ansible_port=${port_no}
    
    " >> "${ANSIBLE_HOSTS}"
    #Increment the value of i during each iteration
i=$(($i+1))
done < "${INPUT_FILE}"