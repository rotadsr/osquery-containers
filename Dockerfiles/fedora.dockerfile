FROM fedora:latest

# Install yum-utils
RUN yum update \
    && yum install -y yum-utils

# Add the official osquery repository
RUN curl -L https://pkg.osquery.io/rpm/GPG | sudo tee /etc/pki/rpm-gpg/RPM-GPG-KEY-osquery \
    && sudo yum-config-manager --add-repo https://pkg.osquery.io/rpm/osquery-s3-rpm.repo \
    && sudo yum-config-manager --enable osquery-s3-rpm-repo

# Install osquery
RUN yum update && yum install -y osquery

#Execute osquery at the start
CMD ["osqueryi"]
