# Functions 
# function allows you to define a set of tasks (and call all of those tasks
# at once just by calling the function)
# in this lesson we are going to see how functions help consoidate our scripts 

# previous file (we are going to update it)
#################################################################################################
sudo nano /usr/local/bin/update
#!/bin/bash
release_file=/etc/os-release
logfile=/var/log/updater.log
errorlog=/var/log/updater_errors.log

check_exit_status() {
    if [ $? -ne 0 ]
    then
        echo "An error occurred, please check the $errorlog file."
    fi 
}


if grep -q "Arch" $release_file
then
    # The host is based on Arch, run the pacman update command
    sudo pacman -Syu 1>>$logfile 2>>$errorlog #send STDOUT to logfile, STDERR to errorlog
    check_exit_status
fi

if grep -q "Pop" $release_file || grep -q "Ubuntu" $release_file
then
    # The host is based on Ubuntu, 
    # run the apt version of the command
    sudo apt update 1>>$logfile 2>>errorlog
    check_exit_status

    sudo apt dist-upgrade -y 1>>$logfile 2>>$errorlog
    check_exit_status
fi 
#################################################################################################

