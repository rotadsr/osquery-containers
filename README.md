# osquery-containers
Updated ready-to-use Docker containers with an updated ready-to-use osquery environment.

## Why?
Imagine that you want to test the latest osquery version in a certain environment. With this Dockerfiles, you are fully covered without doing any change to the osquery deployment you are currently running on your device.

## Usage
Usage is pretty simple:
1. Ensure you have Docker up and running.
2. Download an available `Dockerfile` from list and run.
3. Build the file by running `docker build . -f <IMAGENAME>.dockerfile`
4. Execute `docker build -t <IMAGENAME>-osquery . -f <IMAGENAME>.dockerfile`
5. Run the container with `docker run -it <IMAGENAME>-osquery`

You can also run the `build_containers.sh` script to automatically set everything up!

Now you'd be able to use osquery natively in the environment of your choice.

## Notes
* There is no need to specify osquery configuration file as there is no need to have the osquery daemon (`osqueryd`) running scheduled searches.
* Containers are running as root because you'll be only running osquery interface (`osqueryi`) on them, once you exit from the osquery interface, you'll be exiting the container.
* This project is not intended to be something you'll find in production environments. The main purpose is to be able to test the latest osquery release without the need to be building everything from scratch.
