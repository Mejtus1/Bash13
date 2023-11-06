# Basic Math 
# bash has to understand what are we going to do 
# we cannot just write 30 + 10 
expr 30 + 10 # evaulate an expression 
expr 30 - 10 # 20 
expr 30 / 10 # 3 
expr 30 \* 4 # 400
# * is used in bash for look for everything, we cannot use it for multiplication 

mynum=100
echo $mynum1
expr $mynum1 + 50 #150
mynum2=88
expr $mynum1 + $mynum2 #188