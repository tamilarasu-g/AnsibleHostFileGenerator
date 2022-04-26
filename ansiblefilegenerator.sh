#!/bin/bash

#File name for the usernames
USER_NAME="username.txt"
PASSWORD="password.txt"
PORT_NO="port.txt"

#File name of the Ansible Hosts
ANSIBLE_HOSTS="ansible.conf"

#Count the no of lines in One of the files
LINES=$(sed -n '=' "${USER_NAME}")
echo "${LINES}" > lines.txt
NO_OF_LINES="lines.txt"


#Loop through the files and do the thing

paste -d@ "${USER_NAME}" "${PASSWORD}" "${PORT_NO}" "${NO_OF_LINES}" | while IFS="@" read -r username password port_no no_of_lines
do
    echo -n "
[host${no_of_lines}]
host${no_of_lines}-ip

[host${no_of_lines}:vars]
ansible_user=${username}
ansible_password=${password}
ansible_port=${port_no}
    
    " >> ansible.conf
done