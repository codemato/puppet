class mcollective::client {

  package { 'puppetlabs-release-22.0-2.noarch':
    ensure   => installed,
    provider => 'rpm',
    source   => 'http://yum.puppetlabs.com/puppetlabs-release-el-7.noarch.rpm',
  }

  package { 'mcollective-client':
    ensure => latest,
	require => Package[ "puppetlabs-release-22.0-2.noarch" ]
  }
  package { 'mcollective-puppet-client':
    ensure => latest,
	require => Package[ "puppetlabs-release-22.0-2.noarch" ]
  }
  package { 'mcollective-service-client':
    ensure => latest,
	require => Package[ "puppetlabs-release-22.0-2.noarch" ]
  }
  file { '/etc/puppetlabs/mcollective/client.cfg':
    ensure => present,
    owner => 'root',
    group => 'root',
    mode => '0400',
    source => 'puppet:///modules/mcollective/client.cfg'
  }
}
