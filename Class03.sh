# Variables 
myname="Jay" # variable named myname with value string "Jay"
echo "Hello World!" # Hello World!
# - we can use echo to print variables 
# - whenever we refference variable in bash we need to put it inside $ 
echo myname # myname
echo $myname # Jay
echo $newvariable # empty because we havent declared it, it doesnt exist 
# - but why $ ?
# - simple example
ls="Hello Again"
ls # still lists contents of current directory
$ls # contains Hello Again

# there is issue with variables that we want to have saved in mind 
# when we close our current terminal window, and open new terminal window 
echo $ls # nothing happen
# once we close session, it is gone (variables are gone)

#SRIPT with reference
nano myscript.sh # script from previous lesson 
                 # wipe out everything inside it 
# referencing variables inside our file
myname="Jay"
myage="40" 
echo "Hello, my name is $myname. "
echo "Im $myage years old."
# Ctrl O, enter, X to exit out of nano 
# if we opt out of shell and close it, variables are saved inside myscript.sh file 
./myscript.sh #Hello, my name is Jay "
              # Im 40 years old"

# editing more similar words together at same time 
nano myscript2.sh
word = "awesome"
echo "Linux is $word"
echo "Videogames are $word"
echo "Sunny days are $word"
# we can just edit word are it changes everywhere

# make variable that is equal to the output of a command 
files=$(ls) # $(ls) = subshell(allows execute command in background)
echo $files # ls output 

date
# give you date
# capture output of command, save it in variable and reference it in script
nano myscript3.sh
#!/bin/bash
now=$(date)
echo "The system time and date is:"
echo $now
./myscript3.sh

# another example 
nano myscript4.sh
#!/bin/bash
name="Jay LaCroix"
now=$(date)
echo "Hello $name"
echo "The system time and date is:"
echo $now
echo "Your username is: $USER" # $USER = default variable 
./myscript4.sh                 # we didnt declare it, it

env 
# shows variable already default in the system 
echo $HOME 
# /home/jay