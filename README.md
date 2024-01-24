# osquery-containers
Ready to use Docker containers with a ready-to-use osquery interface.

## Why?
Imagine that you want to test the latest osquery version in a certain environment. With this Dockerfiles, you are fully covered without doing any change to the osquery deployment you are currently running on your device.

## Usage
Usage is pretty simple:
1. Ensure you have Docker up and running.
2. Download an available `Dockerfile` from list and run. [LIST WIP]
3. Execute `docker build -t <IMAGE>-osquery .`
4. Run the container with `docker run -it <IMAGE>-osquery`

Now you'd be able to use osquery natively in the environment of your choice.
