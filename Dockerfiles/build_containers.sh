#! /bin/bash 

# Build an image, keeping the full output in build-<name>.log and reporting failures
build_image() {
    local name="$1"
    if docker build -t "${name}-osquery" . -f "${name}.dockerfile" > "build-${name}.log" 2>&1; then
        echo -e "\nContainer ${name}-osquery is ready to use! 📦 "
    else
        echo -e "\n❌ Build of ${name}-osquery FAILED. Last lines of build-${name}.log:\n"
        tail -n 15 "build-${name}.log"
        return 1
    fi
}

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
        build_image amazonlinux && docker run -it --name "amazonlinux-osquery" amazonlinux-osquery
        ;;
    2)
        echo -e "\n\nBuilding Fedora container... ⏳ \n"
        build_image fedora && docker run -it --name "fedora-osquery" fedora-osquery
        ;;
    3)
        echo -e "\n\nBuilding Debian container... ⏳ \n"
        build_image debian && docker run -it --name "debian-osquery" debian-osquery
        ;;
    4)
        echo -e "\n\nBuilding Ubuntu container... ⏳ \n"
        build_image ubuntu && docker run -it --name "ubuntu-osquery" ubuntu-osquery
        ;;
    5)
        echo -e "\n\nBuilding Amazon Linux container... ⏳ \n"
        build_image amazonlinux
        echo -e "\n\nBuilding Fedora container... ⏳ \n"
        build_image fedora
        echo -e "\n\nBuilding Debian container... ⏳ \n"
        build_image debian
        echo -e "\n\nBuilding Ubuntu container... ⏳ \n"
        build_image ubuntu
        echo -e "\nAll containers are built but not run. You can run them individually using 'docker run -it --name <container_name> <image_name>' command."
        ;;
    *)
        echo -e "\nGoodbye! 👋"
        exit 0
        ;;
esac
