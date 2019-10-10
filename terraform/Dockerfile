# Use AmazonLinux as a base disto.
FROM amazonlinux
# Install terraform
RUN yum -y update
RUN yum install -y golang-1.9.4 git wget unzip which python3 python2-pip
RUN pip-3 install deepmerge datadog pyyaml packaging
RUN pip install datadog pyyaml packaging
RUN mkdir -p /go/{bin,src}
RUN wget https://releases.hashicorp.com/terraform/0.12.6/terraform_0.12.6_linux_amd64.zip
RUN unzip terraform_0.12.6_linux_amd64.zip
RUN mv terraform /usr/local/bin/
WORKDIR /go/src/terratest
ADD files/Gopkg* /go/src/terratest/
ADD files/main.go /go/src/terratest/
ADD files/ac-ansible.sh /usr/local/bin/ac-ansible
ENV GOPATH="/go"
RUN curl https://raw.githubusercontent.com/golang/dep/master/install.sh | sh


# install bits for ansible
RUN yum -y install git python-jinja2 python-paramiko PyYAML make MySQL-python python-pip
RUN pip install ansible
