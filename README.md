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

## Configuration
A minimal default configuration is included in every image under `/etc/osquery/`:

| File | Purpose |
|---|---|
| `osquery.conf` | Base configuration with UTC timestamps and events enabled |
| `osquery.flags` | Runtime flags: enables event-based tables, suppresses log noise |

Event-based tables (process events, socket events, file events, etc.) are disabled by default in osquery. The bundled flags file enables them automatically so new event-driven tables work out of the box without any extra setup.

You can override either file at runtime by bind-mounting your own:
```
docker run -it --rm -v /path/to/your/osquery.flags:/etc/osquery/osquery.flags <IMAGENAME>-osquery
```

## Notes
* Containers run as a non-root `osquery` user (UID 10000).
* The first time a container starts, a welcome banner is shown with a reminder to run `osqueryi`. On subsequent restarts of the same container the banner is skipped.
* This project is not intended for production environments. The main purpose is to be able to test the latest osquery release without the need to build everything from scratch.
