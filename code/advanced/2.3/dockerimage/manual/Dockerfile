FROM centos:7

RUN rpm -Uvh https://yum.puppetlabs.com/puppetlabs-release-pc1-el-7.noarch.rpm && \
    yum install -y puppet-agent && \
    yum clean all

COPY ./modules /etc/puppetlabs/code/modules
COPY ./manifests /tmp/manifests

ENV PATH=/opt/puppetlabs/server/bin:/opt/puppetlabs/puppet/bin:/opt/puppetlabs/bin:$PATH

RUN puppet apply /tmp/manifests/site.pp
