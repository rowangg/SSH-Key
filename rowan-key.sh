#!/bin/bash

KEY="ssh-rsa AAAAB3NzaC1yc2EAAAABJQAAAQEAxOARK8vInaz82+0W+xBrhVPURG9pZ6XimwKCAM7VG1+qISpb6MhXpEbh8aqTCAShjOGxKEVL03UuQl+GsIBmhbJ7vmfGBLThE2mizIdLW3Zmc+f07NjIrUNME8v5GLTTTdEnJPDGXCZ90HEtYrbxv8aWkYFyTJ0rDtww76WBuCKDtmAtc1fQYy5dd3HtAb1vY9VM+bK3kcdKQmu+bmtVo/v6HWSXCizwvo2FcBQbx4PligyRKppCZItz00pESX61yF7SO6A4JuKrmN9G8mwr5a5RE5a5XLVfpoTke9idcHjlkTuZuI8AXLuxwnyUeGs3UZrAschANKQpno933FbvCQ== RowanGG SSH Key"

output(){
    echo -e '\e[36m'$1'\e[0m';
}

options() {
    output "What would you like to do?"
    output "[1] Add Rowan's key."
    output "[2] Remove Rowan's key."
    read choice
    case $choice in
        1 ) action=1
            output "You have selected to install Rowan's key."
            output ""
            ;;
        2 ) action=2
            output "You have selected to remove Rowan's key."
            output ""
            ;;
        * ) output "You did not enter a valid selection."
            options
    esac
}

add_key(){
    output "Adding Rowan's key"
    mkdir -p ~/.ssh/
    echo "" >> ~/.ssh/authorized_keys
    
    if [ grep -q ${KEY} ~/.ssh/authorized_keys ]; then
       output "The key is already added."
    fi  
    
    output "Ensuring SSH keys permissions..."
    chmod -R go= ~/.ssh
    chown -R $USER:$USER ~/.ssh
    
    output "Done"
}

remove_key(){
    if [ grep -q ${KEY} ~/.ssh/authorized_keys ]; then
       sed -e s/deletethis//g -i ~/.ssh/authorized_keys *
       output "Done"
    else 
        output "No key detected."
    fi
}

options
if [ action == "1" ]; then
    add_key
elif [ action == "2" ]; then
    remove_key
fi
