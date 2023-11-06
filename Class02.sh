CLASS 1 
# - anytime we open terminal on Linux or Unix system we enter commands --> we are interacting with a shell 
# - shell allows us to enter commands and presents us with output  

ls # list storage (list storage of our current working directory)

# - there are different shells available 
# - default shell is BASH
echo $SHELL # /bin/bash
which bash # /usr/bin/bash # - where your bash is 

# Bash Script
# - a text file with one or more commands inside
# - commands are executed like if you runned them yourself 
nano myscript.sh # - runs nano text editor 
# we type ls inside of it 
# - for script to execute we need certain steps to take 
# 1. 
sudo chmod +x myscript.sh # add execute function

ls -l # shows additional ls information (we are looking for x = executable for myscript.sh)

# - since script is in our current working directory 
./myscript.sh # outputs current working directory (ls command)
cat myscript.sh # ls 

# - problem is it takes lot more time to run actual script than typing ls 
# - in real world scripts are used to save time 

# - we can call script however we want
# - we need to mark it executable 
# - as long as there are valid commands inside the script it will run 

nano myscript.sh 
# add pwd 
./myscript.sh # prints ls and pwd 


# PROPERLY writing a bash script 
nano myscript.sh 
#!/bin/bash = shebang (tells the script which interpreter script is supposed to use)
echo "Hello World!"
echo "My current working directory is:"
pwd

./myscript.sh
# Hello World
# My current working direcotry is 
# /home/jay






