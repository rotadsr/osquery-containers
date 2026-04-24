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

#Execute osquery at the start
ENTRYPOINT ["bash", "-c", "echo \" \n\n 🚀 Starting container... \n\n 🚨 DO NOT USE THIS CONTAINER IN PRODUCTION ENVIRONMENTS! 🚨 \n\n \"; exec \"$@\"", "--"]

#CMD ["osqueryi"] #Uncomment if you want your container to start osquery interface at run
