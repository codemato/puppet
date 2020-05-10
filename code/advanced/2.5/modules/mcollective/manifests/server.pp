class mcollective::server {
  $activemq_server = "activemq"
  $activemq_mcollective_password = "marionette"
  
  package { 'puppetlabs-release-22.0-2.noarch':
    ensure   => installed,
    provider => 'rpm',
    source   => 'http://yum.puppetlabs.com/puppetlabs-release-el-7.noarch.rpm',
  }
  
  package { 'mcollective-service-agent':
    ensure => latest,
    before => Service['mcollective'],
    require => Package[ "puppetlabs-release-22.0-2.noarch" ]
  }
  package { 'mcollective-puppet-agent':
    ensure => latest,
    before => Service['mcollective'],
    require => Package[ "puppetlabs-release-22.0-2.noarch" ]
  }
  service { 'mcollective':
    ensure => running,
    enable => true
  }
  file { '/etc/puppetlabs/mcollective/server_public.pem':
    ensure => present,
    source => 'puppet:///modules/mcollective/mcollective-servers.pem',
    owner  => 'root',
    group  => 'root',
    mode   => '0600',
    notify => Service['mcollective']
  }
  file { '/etc/puppetlabs/mcollective/server_private.pem':
    ensure => present,
    source => 'puppet:///modules/mcollective/mcollective-servers.key.pem',
    owner  => 'root',
    group  => 'root',
    mode   => '0600',
    notify => Service['mcollective']
  }
  file { '/etc/puppetlabs/mcollective/clients':
    ensure => directory,
    recurse => true,
    owner  => 'root',
    group  => 'root',
    mode   => '0600',
    source => 'puppet:///modules/mcollective/clients',
    notify => Service['mcollective']
  }
  file { '/etc/puppetlabs/mcollective/facts.yaml':
    owner    => 'root',
    group    => 'root',
    mode     => '0400',
    loglevel => debug, # reduce noise in Puppet reports
    content  => inline_template("<%= scope.to_hash.reject { |k,v| k.to_s =~ /(uptime_seconds|timestamp|free)/ }.to_yaml %>"), # exclude rapidly changing facts
  }
  file { '/etc/puppetlabs/mcollective/server.cfg':
    owner   => 'root',
    group   => 'root',
    mode    => '0400',
    content => template('mcollective/server.cfg.erb'),
    notify  => Service["mcollective"]
  }
}
