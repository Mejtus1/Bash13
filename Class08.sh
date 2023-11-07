# Useful script for analyzing Linux distribution 
# this script is not perfect 

nano myscript.sh 
if [ -d /etc/pacman.d ]
then 
    # The host is based on Arch, run the pacman update command 
    sudo pacman -Syu
fi 

if [ -d /etc/apt ]
then 
    # The host is based or Debian or Ubuntu, 
    # Run the apt version of the command 
    sudo apt update
    sudo apt dist-upgrade 
fi 

# first if statement is looking for directory pacman.d 
# (This means that Arch linux system is installed)
# second if statement is looking for directory /etc/apt
# (probably debian or ubuntu distribution installed) 

./myscript.sh
# runs sudo apt update

/etc/os-release
# this file contains information about operation system

# grep - check for existence 
# grep -q (quiet, check for existence but dont output anything)
# grep is looking for word arch inside release_file

#semi usefil script (better version than upper one)
nano myscript2.sh 
release_file=/etc/os-release
if grep -q "Arch" $release_file
then 
    # The host is based on Arch, run the pacman update command 
    sudo pacman -Syu
fi 

if grep -q "Pop" $release_file || grep -q "Ubuntu" $release_file
then 
    # The host is based or Debian or Ubuntu, 
    # Run the apt version of the command 
    sudo apt update
    sudo apt dist-upgrade 
fi 