FROM debian:latest

# Install curl
RUN apt update \
    && apt install -y \
    curl 

# Add the official osquery repository
RUN mkdir -p /etc/apt/keyrings \
    && curl -kL https://pkg.osquery.io/deb/pubkey.gpg | tee /etc/apt/keyrings/osquery.asc \
    && echo -e '\nTypes: deb\n# http://snapshot.debian.org/archive/debian/\nURIs: https://pkg.osquery.io/deb\nSuites: deb\nComponents: main\nSigned-By: /etc/apt/keyrings/osquery.asc\n' >> /etc/apt/sources.list.d/debian.sources 

# Install osquery
RUN apt update && apt install -y osquery

# Run as a non-root user
RUN groupadd -g 10001 osquery && \
    useradd -u 10000 -g osquery osquery \
    && chown -R osquery:osquery /home

#Execute osquery at the start
CMD ["osqueryi"]
