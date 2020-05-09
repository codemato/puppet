class apache::package {
	if $::osfamily == 'RedHat' {
		package { 'apache-package':
			name   => 'httpd',
    			ensure => installed
  		}
	} elsif $::osfamily == 'Debian' {
		package { 'apache-package':
                        name   => 'apache2',
                        ensure => installed
                }
	}
}
