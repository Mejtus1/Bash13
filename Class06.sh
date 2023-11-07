# Exit Codes 
# When we run command in bash, how do we know if it was succesfull or if it failed
# exit codes help us determine whether or not commands were successful 
# special variable that contains exit code, it lets us know if command was successfull
ls -l # shows output so it must have been successful 

echo $? # contains status wheter or not that command is considered success 
ls -l /misc # list storage of invalid directory 
# ls: cannot access '/misc': No such file or directory 
echo $?
# 2
# Exit code of 0 means SUCCESS 
# Exit code of anything else than 0 means failure 

# Example Bash script that utiliyes Exit Codes 
nano myscript.sh
package=htop
sudo apt install $package
echo "The exit code for package install is: $?"

sudo apt remove htop # remot htop from system so our script works
./myscript
# ... install .... 
# The exit code for package install is: 0

nano myscript2.sh
package=notexist
sudo apt install $package
echo "The exit code for package install is: $?"
./myscript2 
# E: Unable to locate package notexist
# The exit code for package install is: 100


nano myscript3.sh
package=htop
sudo apt install $package
if [ $? -eq 0 ]
then 
    echo "The installation of $package was successful"
    echo "The new command is available here:"
    which $package
else
    echo"$package failed to install."
fi

./myscript3.sh 
# The installation of $package was successful
# The new command is available here:
# /usr/bin/htop


nano myscript4.sh
package=notexist
sudo apt install $package
if [ $? -eq 0 ]
then 
    echo "The installation of $package was successful"
    echo "The new command is available here:"
    which $package
else
    echo"$package failed to install."
fi

./myscript4.sh 
# E: Unable to locate package notexist
# notexist failed to install


nano myscript5.sh
package=htop
sudo apt install $package >> package_install_results.log
if [ $? -eq 0 ]
then 
    echo "The installation of $package was successful"
    echo "The new command is available here:"
    which $package
else
    echo"$package failed to install." >> failure.log 
fi

./myscript5.sh
# The installation of htop was successful. 
# The new command is available here:
# /usr/bin/htop 

# package_install_results.log
# cat package_install_results.log = ALL OUTPUT we would see if we didnt redirect it to this file 

# TESTING PACKAGE 
package=notexist
sudo apt install $package >> package_install_results.log
if [ $? -eq 0 ]
then 
    echo "The installation of $package was successful"
    echo "The new command is available here:"
    which $package
else
    echo"$package failed to install." >> failure.log 
fi
./myscript5.sh
# E: unable to locate package notexist
ls # failure.log file containing log of error 

#################################################
# Execution order in Bash 

nano myscript7.sh 
#!/bin/bash
directory=/etc 
if [ -d $directory ]
then 
    echo "The directory $directory exists."
else
    echo "The directory $directory doesnt exist."
fi 

echo "The exit code for this script run is: $?"

./myscript.sh 
# The directory /etc exists. 
# The exit code for this script run is 0
ls -l /etc 

# testing our script 
#!/bin/bash
directory=/notexist
if [ -d $directory ]
then 
    echo "The directory $directory exists."
else
    echo "The directory $directory doesnt exist."
fi 

echo "The exit code for this script run is: $?"
# The exit code for this script run is 0 ??? 
# exit code is wrong, we need to fix it 
# we need to check exit code inside then/else statements not after executing them 

nano myscript8.sh
#!/bin/bash

echo "Hello world"
exit 199
echo $?
# 199 

sudo apt install notexist
exit 0 
echo $?
# 0 (althrough not successful we forced exit code 0)

# exit manipulates exit code if we specify it with exit command 
# exit exists entire script, it doesnt matter wheather it is inside if statement

#!/bin/bash
if [ -d $directory ]
then 
    echo "The directory $directory exists."
    exit 0
else
    echo "The directory $directory doesnt exist."
    exit 1
fi 
echo "The exit code for this script run is: $?"
echo "This is not going to run"
echo "This is not going to run too"
# Why is it important 
# given exit code within if statement, so we have control as creator of script 
# we can create exit code 199 and look at that exact exit code, 
# we can create scenario where exit code is going to be 120 and it is going to be 
# like that only in certain outcome which can lead to alert or another outcome 
