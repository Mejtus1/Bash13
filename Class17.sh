# backup script in bash 

touch backup.sh
sudo chmod +X backup.sh 
nano backup.sh

#!/bin/bash

# Check to make sure the user has entered exactly two arguments. 
if [ $# -ne 2 ] # statements checks if we provided 2 arguments
then 
    echo "Usage: backup.sh <source_directory> <target_directory>"
    echo "Please try again."
    exit 1
fi 

# Check to see if rsync is installed. 
if ! command -v rsync > /dev/null 2>&1 # all output that is being sent is redirected to the /dev/null
                                       # we only need to see if rsync is installed
then 
    echo "This script requires rsync to be installed."
    echo "Please use your distributions package manager to install it and try again."
    exit 2 
fi 

# Capture the current date, and store it in the format YYYY-MM-DD 
current_date=$(date +%Y-%m-%d) # creating variable current_date and format it YYYY-MM-DD

rsync_options="-avb --backup-dir $2/current_date --delete --dry-run" # options that can be passed into rsync menually
 # -avb 
 # -a = archive mode (tries to retain all metadata that is being copied)
 # -v = verbose (shows what is going on in the output)
 # -b = we would rather not have files replaced on the target, syncs files on 1 directory to another
 # --backup-dir = option to b option, instead of creating backup file, 
 # $2 = second argument (represents backup files to be copied to) 
 # --delete = deleted backups dont delete, they just move to incremental directory
 # ==dry-run = (most important part) creates a simulation what would happen if we would have run, without copying anythin anywhere
 # (it is important because if we have any typo, we can blow)
 # after we are sure everything works good in test enviroment (dry run) we can delete it from our script

$(which rsync) $rsync_options $1 $2/current >> backup_$current_date.log
 # -v option in our sync options (prints out list of things it is working on)
 # - we redirect this output to our backup_log
