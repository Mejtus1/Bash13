# Arguments 

# simple script in bash of argument 
touch myscript60.sh
sudo chmod +X myscript60.sh 
nano myscript60.sh 

#!/bin/bash
echo "You entered the argument: $1"

# quit to console
./myscript60.sh Linux 
# You entered the argument: Linux

# argument is declared when you run the script, rather than within the script itself
# - we replaced $1 with word linux (in this case $1 is argument)
# - we can have more than one argument 
nano myscript60.sh
#!/bin/bash
echo "You entered the argument: $1, $2, $3 and $4"
./myscript60.sh Linux Pizza Books games
# You entered the argument: Linux, Pizza, Books, and Games

# why are arguments useful ? 
# ls -l etc (we are using etc directory as argument to ls command)

touch myscript61.sh
sudo chmox +X myscript61.sh
NANO myscript61.sh

lines=$(ls -lh $1 | wc -l) # creating variable and it is equal command
                           # wl -l (counting lines in argument)
                           # $1 functions as an argument in our script

echo "You have $(($lines-1)) objects in $1 directory." # (()) = subshell 
                                                       # $lines -1 = minus one line
                                                       # every time $lines will be different
./myscript.sh /etc
# You have 247 objects in /etc directory. 

touch myscript62.sh
sudo chmox +X myscript62.sh
NANO myscript62.sh

lines=$(ls -lh $1 | wc -l)
if [ $# -ne 1]
then
    echo "This script requires exactly one directory path passed to it."
    echo "Please try again."
    Exit 1
fi
echo "You have $(($lines-1)) objects in $1 directory."

./myscript62.sh /etc /home /var
# This script requires exactly one directory path passed to it. 
# Please try again. 