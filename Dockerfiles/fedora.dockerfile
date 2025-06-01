FROM fedora:latest

# Install yum-utils
RUN yum -y install yum-utils

# Add the official osquery repository
RUN curl -kL https://pkg.osquery.io/rpm/GPG | sudo tee /etc/pki/rpm-gpg/RPM-GPG-KEY-osquery \
    && sudo yum-config-manager --add-repo https://pkg.osquery.io/rpm/osquery-s3-rpm.repo \
    && sudo yum-config-manager --enable osquery-s3-rpm-repo 

# Install osquery
RUN sudo yum update --assumeyes && sudo yum -y install osquery

#Execute osquery at the start
ENTRYPOINT ["bash", "-c", "echo \" \n\n 🚀 Starting container... \n\n 🚨 DO NOT USE THIS CONTAINER IN PRODUCTION ENVIRONMENTS! 🚨 \n\n \"; exec \"$@\"", "--"]
CMD ["osqueryi"]
