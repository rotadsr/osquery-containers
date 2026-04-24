FROM amazonlinux:latest

# Install yum-utils and sudo
RUN yum -y install \
    yum-utils \
    util-linux \
    sudo

# Add the official osquery repository
RUN curl -Lk https://pkg.osquery.io/rpm/GPG | sudo tee /etc/pki/rpm-gpg/RPM-GPG-KEY-osquery \
    && echo "sslverify=false" >> /etc/yum.conf \
    && yum-config-manager --save --setopt=sslverify=false \
    && sudo yum-config-manager --add-repo https://pkg.osquery.io/rpm/osquery-s3-rpm.repo \
    && sudo yum-config-manager --enable osquery-s3-rpm-repo 

# Install osquery
RUN sudo yum update --assumeyes && sudo yum -y install osquery

# Run as a non-root user
RUN groupadd -g 10001 osquery && \
    useradd -u 10000 -g osquery osquery

COPY entrypoint.sh /usr/local/bin/entrypoint.sh
RUN chmod +x /usr/local/bin/entrypoint.sh

USER osquery

ENTRYPOINT ["/usr/local/bin/entrypoint.sh"]
CMD ["/bin/bash"]
