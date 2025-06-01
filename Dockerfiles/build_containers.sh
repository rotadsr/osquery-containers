#! /bin/bash 
echo "Please choose an option:"
echo "1) Build and run Amazon Linux container"
echo "2) Build and run Fedora container"
echo "3) Build and run Debian container"
echo "4) Build and run Ubuntu container"
echo "5) Build ALL images but don't run them"
echo -e "0) Exit the setup script\n\n"

read -p "Enter your choice [0-5]: " choice

case $choice in
    1)
        echo -e "\n\nBuilding Amazon Linux container... ⏳ \n" 
        docker build . -f amazonlinux.dockerfile > /dev/null 2>&1
        docker build -t amazonlinux-osquery . -f amazonlinux.dockerfile > /dev/null 2>&1
        echo -e "\nContainer is ready to use! 📦 "
        docker run -it --name "amazonlinux-osquery" amazonlinux-osquery 
        ;;
    2)
        echo -e "\n\nBuilding Fedora container... ⏳ \n" 
        docker build . -f fedora.dockerfile > /dev/null 2>&1
        docker build -t fedora-osquery . -f fedora.dockerfile > /dev/null 2>&1
        echo -e "\nContainer is ready to use! 📦 "
        docker run -it --name "fedora-osquery" fedora-osquery 
        ;;
    3)
        echo -e "\n\nBuilding Debian container... ⏳ \n" 
        docker build . -f debian.dockerfile > /dev/null 2>&1
        docker build -t debian-osquery . -f debian.dockerfile > /dev/null 2>&1
        echo -e "\nContainer is ready to use! 📦 "
        docker run -it --name "debian-osquery" debian-osquery 
        ;;
    4)
        echo -e "\n\nBuilding Ubuntu container... ⏳ \n" 
        docker build . -f ubuntu.dockerfile > /dev/null 2>&1
        docker build -t ubuntu-osquery . -f ubuntu.dockerfile > /dev/null 2>&1
        echo -e "\nContainer is ready to use! 📦 "
        docker run -it --name "ubuntu-osquery" ubuntu-osquery 
        ;;
    5)
        echo -e "\n\nBuilding Amazon Linux container... ⏳ \n" 
        docker build . -f amazonlinux.dockerfile > /dev/null 2>&1
        docker build -t amazonlinux-osquery . -f amazonlinux.dockerfile > /dev/null 2>&1
        echo -e "\nContainer amazonlinux-osquery is ready to use! 📦 "
        echo -e "\n\nBuilding Fedora container... ⏳ \n" 
        docker build . -f fedora.dockerfile > /dev/null 2>&1
        docker build -t fedora-osquery . -f fedora.dockerfile > /dev/null 2>&1
        echo -e "\nContainer fedora-osquery is ready to use! 📦 "
        echo -e "\n\nBuilding Debian container... ⏳ \n" 
        docker build . -f debian.dockerfile > /dev/null 2>&1
        docker build -t debian-osquery . -f debian.dockerfile > /dev/null 2>&1
        echo -e "\nContainer debian-osquery is ready to use! 📦 "
        echo -e "\n\nBuilding Ubuntu container... ⏳ \n" 
        docker build . -f ubuntu.dockerfile > /dev/null 2>&1
        docker build -t ubuntu-osquery . -f ubuntu.dockerfile > /dev/null 2>&1
        echo -e "\nContainer ubuntu-osquery is ready to use! 📦 "
        echo -e "\nAll containers are built but not run. You can run them individually using 'docker run -it --name <container_name> <image_name>' command."
        ;;
    *)
        echo -e "\nGoodbye! 👋"
        exit 1
        ;;
esac
