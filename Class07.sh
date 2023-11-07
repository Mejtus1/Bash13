# While loops 

nano myscript.sh 
myvar=1
while[ $myvar -le 10 ]
do 
    echo $myvar
    myvar=$(( $myvar +1 ))
    sleep 0.5
done 

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


nano myscript2.sh 
#!/bin/bash
while [ -f ~/testfile ]
do  
    echo "As of $(date), the test file exists."
    sleep 5
done 
echo "As of $(date), the test file has gone missing."

touch testfile
./myscript.sh
# As of Tue Mar 29 12:47:45 PM EDT 2023, the test file exists. 
# As of Tue Mar 29 12:47:50 PM EDT 2023, the test file exists. 
# As of Tue Mar 29 12:47:55 PM EDT 2023, the test file exists. 
# As of Tue Mar 29 12:48:00 PM EDT 2023, the test file exists. 
# As of Tue Mar 29 12:48:05 PM EDT 2023, the test file exists.
rm testfile
# As of Tue Mar 29 12:48:15 PM EDT 2023, the test file has gone missing. 

