# where to store scripts 
# to keep scripts in home directory is not best place
# 
# 
# script from Class08
nano update.sh
release_file=/etc/os-release
if grep -q "Arch" $release_file
then 
    # The host is based on Arch, run the pacman update command 
    sudo pacman -Syu
fi 

if grep -q "Pop" $release_file || grep -q "Ubuntu" $release_file
then 
    # The host is based or Debian or Ubuntu, 
    # Run the apt version of the command 
    sudo apt update
    sudo apt dist-upgrade 
fi 

# FHS 
# - clarify each or specific directories on most Linuxes
# - linux foundation document 
# - /usr/local/bin/ = where most of our binary executable files are stored 

sudo mv update.sh /usr/local/bin/update #move our file to bin 
ls -l /usr/local/bin
#total 4 
#-rwxrwxr-x 1 jay jay 363 Mar 29 13:17 update
# - it would be good practice so our script can run only root user
sudo chown root:root /usr/local/bin/update
#-rwxrwxr-x 1 root root 363 Mar 29 13:18 update

# - we dont specify our file extensions in linux, it handles them differently than Windows 
# - if we type update, it runs without specifying anything else
which update 
# /usr/local/bin/update

echo $PATH # - variable with all CAPS = System or Enviroment variable 
# - shell knows where find update, it is stored in PATH variable
# - /usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/sbin:/sbin:/bin:/snap/bin

