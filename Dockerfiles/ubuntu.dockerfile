FROM ubuntu:latest

# Install curl
RUN apt update \
    && apt upgrade -y \
    && apt install -y \
    curl \
    gnupg2 \
    bsdmainutils

# Add the official osquery repository
RUN curl -fsSL  https://pkg.osquery.io/deb/pubkey.gpg |  gpg --dearmor -o /etc/apt/keyrings/osquery.gpg \
    && echo "deb [arch=amd64,arm64 signed-by=/etc/apt/keyrings/osquery.gpg] https://pkg.osquery.io/deb deb main" | tee /etc/apt/sources.list.d/osquery.list > /dev/null

# Install osquery
RUN apt update && apt install -y osquery

# Run as a non-root user
RUN groupadd -g 10001 osquery && \
    useradd -u 10000 -g osquery osquery \
    && chown -R osquery:osquery /home/ubuntu

COPY entrypoint.sh /usr/local/bin/entrypoint.sh
RUN chmod +x /usr/local/bin/entrypoint.sh

USER osquery

ENTRYPOINT ["/usr/local/bin/entrypoint.sh"]
CMD ["/bin/bash"]
