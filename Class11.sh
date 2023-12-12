# DATA STREAMS 
# Standard input, standard output, standard error 

# - ls command is example of standard output (results of command are outputted to screeb)
# - when we execute commands and see results, thats standard output 
ls /notexist
# - is standard error 
echo #? #exit code for previous command 
# that means failed command printing output = standar error 
echo "Hello World" # Hello World
echo $? # 0 = (standard output)

# find command (contains standard output and error at same time)
# - finds files or directories on file system
# - outputs list of every file and folder that meats your criteria 
find /etc -type f # search for every object that is a file 
# - if file has elevated privilige, find command will output "Permission denied"
# and this finding of file will be outputted as standard error, other finding would be stanrad output

# Splitting standard output and standard error 

find /etc -type f 2> /dev/null # (we are hiding standard error messages)
find /etc -type f > /dev/null # (we get only bunch of errors, becuase standard output is outputted into dev/null)
find /etc -type f 1> /dev/null # (same output as above with >)
# 1 constitutes standard output, 1 = standard output redirection
# > if we dont specify, system autmatically redirects standard output
# 2> standard error 
find /etc -type f &> file.txt # & (ampersand) means to send both STDOUT, STDERR to one place

# Standard error redirection with action 
find /etc -type f 1>find_results.txt 2>find_errors.txt
# redirecct STDOUT to findresults.txt and STDERR to find_errors.txt
cat find_results.txt
cat find_errors.txt

# Utilizing Standard output / error inside of Bash Script
sudo nano /usr/local/bin/update
#!/bin/bash
release_file=/etc/os-release
logfile=/var/log/updater.log
errorlog=/var/log/updater_errors.log

if grep -q "Arch" $release_file
then
    # The host is based on Arch, run the pacman update command
    sudo pacman -Syu 1>>$logfile 2>>$errorlog #send STDOUT to logfile, STDERR to errorlog
    if [ $? -ne 0 ]
    then    
        echo "An error occured, please check the $errorlog file."
    fi
fi

if grep -q "Pop" $release_file || grep -q "Ubuntu" $release_file
then
    # The host is based on Ubuntu, 
    # run the apt version of the command
    sudo apt update 1>>$logfile 2>>errorlog
    if [ $? -ne 0 ]
    then 
        echo "An error occurred, please check the $errorlog file"
    fi
    sudo apt dist-upgrade -y 1>>$logfile 2>>$errorlog
    if [ $? -ne 0 ]
    then    
        echo "An error occured, please check the $errorlog file."
    fi
fi 
# you dont want to get prompted for anything when scripting 
# that is why you have to add -y at line 62 so it runs automatically when you call the script

# STANDARD INPUT 
# new file myscript55.sh
#!/bin/bash

echo "Please enter your name:"
read myname
echo "Your name is: $myname" 

