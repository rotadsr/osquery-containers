FROM debian:latest

# Get add-apt-repository
RUN apt update \
    && apt install -y \
    curl 

# Add the official osquery repository
RUN mkdir -p /etc/apt/keyrings \
    && curl -L https://pkg.osquery.io/deb/pubkey.gpg | tee /etc/apt/keyrings/osquery.asc \
    && echo -e '\nTypes: deb\n# http://snapshot.debian.org/archive/debian/20240110T000000Z\nURIs: https://pkg.osquery.io/deb\nSuites: deb\nComponents: main\nSigned-By: /etc/apt/keyrings/osquery.asc\n' >> /etc/apt/sources.list.d/debian.sources 

# Install osquery
RUN apt update && apt install -y osquery

#Execute osquery at the start
CMD ["osqueryi"]
