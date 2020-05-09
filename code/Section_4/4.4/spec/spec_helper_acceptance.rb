require 'beaker-rspec'

unless ENV['RS_PROVISION'] == 'no' or ENV['BEAKER_provision'] == 'no'
  foss_opts = {:default_action => 'gem_install'}

  if default.is_pe?; then
    install_pe;
  else
    install_puppet(foss_opts);
  end
end

RSpec.configure do |c|
  # Project root
  proj_root = File.expand_path(File.join(File.dirname(__FILE__), '..'))

  # Readable test descriptions
  c.formatter = :documentation

  # Configure all nodes in nodeset
  c.before :suite do
    hosts.each do |host|
      if fact_on(host, 'osfamily') == 'RedHat'
        on host, "rpm -ihv http://yum.puppetlabs.com/puppetlabs-release-pc1-el-7.noarch.rpm; yum -y install puppet-agent"
      elsif fact_on(host, 'osfamily') == 'Debian'
        on host, "wget http://apt.puppetlabs.com/puppetlabs-release-pc1-xenial.deb -P /tmp; dpkg -i /tmp/puppetlabs-release-pc1-xenial.deb; apt-get -y update; apt-get -y install puppet-agent"
      end
      on host, "export PATH=$PATH:/opt/puppetlabs/bin; ln -s /opt/puppetlabs/puppet/bin/puppet /usr/bin/puppet"
      scp_to host, "#{proj_root}", "/etc/puppetlabs/code/modules/"
    end
  end
end
