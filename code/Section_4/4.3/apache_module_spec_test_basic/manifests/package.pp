class apache::package {
	package { 'apache-package':
		name   => 'httpd',
    		ensure => installed
  	}
}
