# osquery-containers
Updated ready-to-use Docker containers with an updated ready-to-use osquery environment.

## Why?
Imagine that you want to test the latest osquery version in a certain environment. With these Dockerfiles, you are fully covered without doing any change to the osquery deployment you are currently running on your device.

## Supported distros
| Dockerfile | Base image |
|---|---|
| `ubuntu.dockerfile` | Ubuntu |
| `debian.dockerfile` | Debian |
| `amazonlinux.dockerfile` | Amazon Linux |
| `fedora.dockerfile` | Fedora |

## Usage
Usage is pretty simple:
1. Ensure you have Docker up and running.
2. Clone or download this repository.
3. Build a container image:
   ```
   docker build -t <IMAGENAME>-osquery . -f <IMAGENAME>.dockerfile
   ```
4. Run the container:
   ```
   docker run -it --name <IMAGENAME>-osquery <IMAGENAME>-osquery
   ```
5. Once inside, launch the osquery interactive interface:
   ```
   osqueryi
   ```

You can also run the `build_containers.sh` script to automatically build and run a container of your choice.

## Notes
* Containers run as a non-root `osquery` user (UID 10000).
* The first time a container starts, a welcome banner is shown with a reminder to run `osqueryi`. On subsequent restarts of the same container the banner is skipped.
* There is no need to specify an osquery configuration file as there is no need to have the osquery daemon (`osqueryd`) running scheduled searches.
* This project is not intended for production environments. The main purpose is to be able to test the latest osquery release without the need to build everything from scratch.
