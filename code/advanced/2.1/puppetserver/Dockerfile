FROM centos:7

RUN yum -y install which
RUN rpm -ihv http://yum.puppetlabs.com/puppetlabs-release-pc1-el-7.noarch.rpm && rpm -ihv https://dl.fedoraproject.org/pub/epel/7/x86_64/e/epel-release-7-9.noarch.rpm && yum -y install puppetserver supervisor

ADD supervisord.conf /supervisord.conf
ADD autosign.conf /etc/puppetlabs/puppet/autosign.conf

EXPOSE 8140

CMD ["/usr/bin/supervisord", "--nodaemon", "-c", "/supervisord.conf"]
