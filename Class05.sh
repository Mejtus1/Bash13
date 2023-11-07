# if statements 
nano myscript.sh 
#!/bin/bash 
mynum=200
if [ $mynum -eq 200 ]                   
then 
    echo "The condition is true."
fi 
# making script executable and running it 
sudo chmod +x myscript.sh
./myscript.sh # The condition is true 


nano myscript.sh
#!/bin/bash 
mynum=200
if [ $mynum -eq 200 ]                   
then 
    echo "The condition is true."
fi 

if [ $mynum -eq 300 ]
then 
    echo "The variable does not equal 200"
fi


# we can combine 2 if statements into one 
#!/bin/bash 
mynum=300 # change to 300  
if [ $mynum -eq 200 ]                   
then 
    echo "The condition is true."
else
    echo "The variable does not equal 200"
fi

./myscript.sh # The variable does not equal 200


# Negation 
nano myscript.sh
mynum=300  
if [ ! $mynum -eq 200 ] # ! neglects, reverses                    
then 
    echo "The condition is true."
else
    echo "The variable does not equal 200"
fi
# The condition is true. 

# -ne 
mynum=300  
if [ $mynum -ne 200 ] # -ne neglects, reverses                    
then 
    echo "The condition is true."
else
    echo "The variable does not equal 200"
fi
# The condition is true. 

# -gt 
mynum=300  
if [ $mynum -ne 200 ] # -gt greater than                 
then 
    echo "The condition is true."
else
    echo "The variable does not equal 200"
fi
# The condition is true. 


####
# check for presence of files on file system
nano myscript2.sh
if [ -f ~/myfile ]
then 
    echo "The file does exist."
else
    echo "The file does not exist."
fi 

./myscript2.sh 
# The file does not exist. 
# we check to see if there is /myfile and in home directory = "~"

# SCRIPT WHERE OUTPUT CHANGES BASED ON CRITERIA OF FILE SYSTEM
touch myfile
./myscript2.sh
# The file exists. 
rm myfile
./myscript2.sh
# The file does not exist. 


# looking for directories
if [ -d ~/myfile ] 


# which command 
# find whether application or binary or command is present on file system
which htop 

nano myscript3.sh
#!/bin/bash
command=/usr/bin/htop
if [ -f $command ]
then 
    echo "$command is available, lets run it..."
else 
    echo "$command is NOT available, installing it..."
    sudo apt update && sudo apt install -y htop 
fi 

$command
# if we run this it tells us if command is available
# if it is not it will go ahead and install it for us 

./myscript3.sh
# NOT available
# downloads it and runs it after download


#!/bin/bash
command=htop
if command -v $command #command -v is a command that is build in 
# we removed brackets (they are only needed when running test command)
# [] when using brackets, bash thinks you are using test command 
then 
    echo "$command is available, lets run it..."
else 
    echo "$command is NOT available, installing it..."
    sudo apt update && sudo apt install -y $command
fi 

$command

# test command 
man test # manual , test command 