# for loops 
# allows you to perform task repeatedly for every item in set 

# if statement performs task once if a certain set of conditions are met 
# while loop performs task or set of tasks over and over again
# for loop = executing command or set of commands aganst each item in set 

nano myscript
#!/bin/bash
for current_number in 1 2 3 4 5 6 7 8 9 10
do 
    echo $current_number # we declared variable here
    sleep 1              # variable name doesnt matter (usually i is used)
done

echo "This is outside of for loop."
./myscript.sh
# 1
# 2
# 3 
# 4 
# 5 
# 6 
# 7 
# 8 
# 9 
# 10 
# This is outside of for loop.

nano myscript2.sh
for n in {1..10}
do 
    echo $n # we declared variable here
    sleep 1              # variable name doesnt matter (usually i is used)
done

echo "This is outside of for loop."
./myscript2.sh

#############################
# useful bash script for loop 
nano myscript3.sh
#!/bin/bash
for file in logfiles/*.log
do 
    tar -czvf $file.tar.gz $file
done 
# for every file in logfiles directory that ends in /.log we create zipped file 
mkdir logfiles # create that directory or script will not work 
cp /var/log/*.log logfiles/ 

