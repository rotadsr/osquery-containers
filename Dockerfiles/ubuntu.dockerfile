FROM ubuntu:latest

# Install curl
RUN apt update \
    && apt upgrade -y \
    && apt install -y \
    curl \
    gnupg2

# Add the official osquery repository
RUN curl -fsSL  https://pkg.osquery.io/deb/pubkey.gpg |  gpg --dearmor -o /etc/apt/keyrings/osquery.gpg \
    && echo "deb [arch=amd64,arm64 signed-by=/etc/apt/keyrings/osquery.gpg] https://pkg.osquery.io/deb deb main" | tee /etc/apt/sources.list.d/osquery.list > /dev/null

# Install osquery
RUN apt update && apt install -y osquery

# Run as a non-root user
RUN groupadd -g 10001 osquery && \
    useradd -u 10000 -g osquery osquery \
    && chown -R osquery:osquery /home/ubuntu

#Execute osquery at the start
ENTRYPOINT ["bash", "-c", "echo \" \n\n 🚀 Starting container... \n\n 🚨 DO NOT USE THIS CONTAINER IN PRODUCTION ENVIRONMENTS! 🚨 \n\n \"; exec \"$@\"", "--"]
CMD ["osqueryi"]
