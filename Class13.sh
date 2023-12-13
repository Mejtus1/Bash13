# Case statements 

touch myscript56.sh 
sudo chmod +X myscript56.sh
nano myscript56.sh
#!/bin/bash

echo "What is your favorite Linux distribution?"

echo "1 - Arch"
echo "2 - CentOS"
echo "3 - Debian"
echo "4 - Mint"
echo "5 - Ubuntu"
echo "6 - Something else..."

read distro; 

case $distro in 
    1) echo "Arch is a rolling release.";;
    2) echo "CebtOS is popular on servers.";;
    3) echo "Debian is a community distribution.";;
    4) echo "Mint is popular on desktops and laptops.";;
    5) echo "Ubuntu is popular on both servers and computers.";;
    6) echo "There are many distributions out there.";;
    *) echo "you didnt enter an appropriate choice"
esac


touch myscript57.sh 
sudo chmod +X myscript57.sh
nano myscript57.sh
#!/bin/bash

finished=0

while [ $finished -ne 1 ] # (finished not equal to 1)
do 
    echo "What is your favorite Linux distribution?"

    echo "1 - Arch"
    echo "2 - CentOS"
    echo "3 - Debian"
    echo "4 - Mint"
    echo "5 - Ubuntu"
    echo "6 - Something else..."
    echo "7 - Exit the script."

    read distro; 

    case $distro in 
        1) echo "Arch is a rolling release.";;
        2) echo "CebtOS is popular on servers.";;
        3) echo "Debian is a community distribution.";;
        4) echo "Mint is popular on desktops and laptops.";;
        5) echo "Ubuntu is popular on both servers and computers.";;
        6) echo "There are many distributions out there.";;
        7) finished=1 ;;
        *) echo "you didnt enter an appropriate choice"
    esac
done
