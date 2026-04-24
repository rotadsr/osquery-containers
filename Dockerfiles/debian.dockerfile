FROM debian:latest

# Install curl and other utils
RUN apt update \
    && apt install -y \
    curl \
    bsdmainutils

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

COPY entrypoint.sh /usr/local/bin/entrypoint.sh
RUN chmod +x /usr/local/bin/entrypoint.sh

# Install default osquery configuration
RUN mkdir -p /etc/osquery
COPY osquery.conf /etc/osquery/osquery.conf
COPY osquery.flags /etc/osquery/osquery.flags

USER osquery

ENTRYPOINT ["/usr/local/bin/entrypoint.sh"]
CMD ["/bin/bash"]
