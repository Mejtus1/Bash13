# Scheduling Jobs 
# - we want our scripts to run at specific times 
# "at" command 
which at # (if we type which at command, our shell will interact if we have)
# make sure you are on server that needs to run the script at certain time 
sudo apt install at #(small utility, fast download)
which at # /usr/bin/at

touch myscript58.sh
sudo chmod +X myscript56.sh

#!/bin/bash]

logfile=job_results.log

echo "The script ran at the following time: $(date)" > $logfile


at 15:32 -f ./myscript58.sh
#warning: commands will be executed using /bin/sh
#job 2 at Thu Mar 31 15:32:00 2022
cat job_results.log
# The script ran at the following time: Thu Mar 31 03:32:00 PM EDT 2022

# at command closer look 
# jobs at "at" queue 
atq #(at queue)
1    Thu Mar 31 15:45:00 2022 a jay
atrm 1 # (removes at command in queue number 1)

# scheduling job for summer 2023
at 18:00 0816 -f ./myscript.sh
#warning: command will be executed using /bin/sh
#job 4 at Tue Aug 16 18:00:00 2022
atq
1      Tue Aug 16 18:00:00 2022 a jay
