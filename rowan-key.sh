#!/bin/bash

welcome(){
    echo "
    
 _____                                     _____ _____ _    _        _  __________     __
|  __ \                                   / ____/ ____| |  | |      | |/ /  ____\ \   / /
| |__) |_____      ____ _ _ __  ___ _____| (___| (___ | |__| |______| ' /| |__   \ \_/ / 
|  _  // _ \ \ /\ / / _  |  _ \/ __|______\____ \____\|  __  |______|  < |  __|   \   /  
| | \ \ (_) \ V  V / (_| | | | \__ \      ____) |___) | |  | |      | . \| |____   | |   
|_|  \_\___/ \_/\_/ \__,_|_| |_|___/     |_____/_____/|_|  |_|      |_|\_\______|  |_|   

    "
    echo "Welcome to my script. This script installs and uninstalls my SSH key"
    echo "You should only run this script when you need to give me access to your server"
    echo "As soon as I am finished working on your server you should uninstall the key"
    echo "THIS SCRIPT EFFECTS ONLY THE LOGGED IN USER"
}

break(){
    echo ""
    echo ""
}

options(){
    echo "Please select from one of the following options"
    echo ""
    echo "1| Install key"
    echo "2| Remove key"
    read option
}

installkey(){
    cd
    mkdir -p .ssh
    if grep -q "ssh-rsa AAAAB3NzaC1yc2EAAAABJQAAAQEAxOARK8vInaz82+0W+xBrhVPURG9pZ6XimwKCAM7VG1+qISpb6MhXpEbh8aqTCAShjOGxKEVL03UuQl+GsIBmhbJ7vmfGBLThE2mizIdLW3Zmc+f07NjIrUNME8v5GLTTTdEnJPDGXCZ90HEtYrbxv8aWkYFyTJ0rDtww76WBuCKDtmAtc1fQYy5dd3HtAb1vY9VM+bK3kcdKQmu+bmtVo/v6HWSXCizwvo2FcBQbx4PligyRKppCZItz00pESX61yF7SO6A4JuKrmN9G8mwr5a5RE5a5XLVfpoTke9idcHjlkTuZuI8AXLuxwnyUeGs3UZrAschANKQpno933FbvCQ== Rowans Key" ".ssh/authorized_keys" -s ; then
    echo "ERROR: Key is already installed, please contact me if this is not the expected output."
    else 
    echo "ssh-rsa AAAAB3NzaC1yc2EAAAABJQAAAQEAxOARK8vInaz82+0W+xBrhVPURG9pZ6XimwKCAM7VG1+qISpb6MhXpEbh8aqTCAShjOGxKEVL03UuQl+GsIBmhbJ7vmfGBLThE2mizIdLW3Zmc+f07NjIrUNME8v5GLTTTdEnJPDGXCZ90HEtYrbxv8aWkYFyTJ0rDtww76WBuCKDtmAtc1fQYy5dd3HtAb1vY9VM+bK3kcdKQmu+bmtVo/v6HWSXCizwvo2FcBQbx4PligyRKppCZItz00pESX61yF7SO6A4JuKrmN9G8mwr5a5RE5a5XLVfpoTke9idcHjlkTuZuI8AXLuxwnyUeGs3UZrAschANKQpno933FbvCQ== Rowans Key" >> ~/.ssh/authorized_keys
    echo "Key sucessfully installed"
    fi
}

removekey(){
    cd
    mkdir -p .ssh
    if grep -q "ssh-rsa AAAAB3NzaC1yc2EAAAABJQAAAQEAxOARK8vInaz82+0W+xBrhVPURG9pZ6XimwKCAM7VG1+qISpb6MhXpEbh8aqTCAShjOGxKEVL03UuQl+GsIBmhbJ7vmfGBLThE2mizIdLW3Zmc+f07NjIrUNME8v5GLTTTdEnJPDGXCZ90HEtYrbxv8aWkYFyTJ0rDtww76WBuCKDtmAtc1fQYy5dd3HtAb1vY9VM+bK3kcdKQmu+bmtVo/v6HWSXCizwvo2FcBQbx4PligyRKppCZItz00pESX61yF7SO6A4JuKrmN9G8mwr5a5RE5a5XLVfpoTke9idcHjlkTuZuI8AXLuxwnyUeGs3UZrAschANKQpno933FbvCQ== Rowans Key" ".ssh/authorized_keys" -s ; then
    sed -i '/Rowans Key/d' .ssh/authorized_keys
    echo "Key sucessfully removed"
    else 
    echo "ERROR: Key not installed, please contact me if this is not the expected output."
    fi
}

welcome
break
options
case $option in 
    1)  installkey
    ;;
    2)  removekey
    ;;
    *)  echo "Your selection was not valid. Please try again:"
    options
esac
