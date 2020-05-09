class webserver (
		$packagename   = $::webserver::parameters::packagename,
		$configfile    = $::webserver::parameters::configfile,
		$configsource  = $::webserver::parameters::configsource,
		$vhostfile     = $::webserver::parameters::vhostfile
		) inherits ::webserver::parameters {
	package { 'webserver-package':
		name   => $packagename,
		ensure => present
	}

	file { 'config-file':
		path   => $configfile,
		ensure => file,
		source => $configsource,
		require => Package['webserver-package'],
		notify  => Service['webserver-service'],
        }

	file { 'vhost-file':
		path    => $vhostfile,
		ensure  => file,
		content => template('webserver/vhost.conf.erb'),
		require => Package['webserver-package'],
		notify  => Service['webserver-service'],
        }

	service { 'webserver-service':
		name        => $packagename,
		ensure      => running,
		enable      => true,
		hasrestart  => true,
		require     => [ File['config-file'], File['vhost-file'] ],
	}
}
