# osquery-containers
Updated ready-to-use Docker containers with an updated ready-to-use osquery environment.

## Why?
Imagine that you want to test the latest osquery version in a certain environment. With this Dockerfiles, you are fully covered without doing any change to the osquery deployment you are currently running on your device.

## Usage
Usage is pretty simple:
1. Ensure you have Docker up and running.
2. Download an available `Dockerfile` from list and run. [LIST WIP]
3. Build the file by running `docker build . -f <IMAGE>.dockerfile`
4. Execute `docker build -t <IMAGE>-osquery .`
5. Run the container with `docker run -it <IMAGE>-osquery`

Now you'd be able to use osquery natively in the environment of your choice.

## Notes
* Containers are running as root because you'll be only running osquery interface (`osqueryi`) on them, once you exit from the osquery interface, you'll be exiting the container.
* This project is not intended to be something you'll find in production environments. The main purpose is to be able to test the latest osquery release without the need to be building everything from scratch.
