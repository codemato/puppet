class webserver::parameters {
	if $::osfamily == 'RedHat' {
		$packagename  = 'httpd'
    		$configfile   = '/etc/httpd/conf/httpd.conf'
    		$configsource = 'puppet:///modules/webserver/httpd.conf'
		$vhostfile    = '/etc/httpd/conf.d/vhost.conf'
        } elsif $::osfamily == 'Debian' {
		$packagename  = 'apache2'
    		$configfile   = '/etc/apache2/apache2.conf'
    		$configsource = 'puppet:///modules/webserver/apache2.conf'
		$vhostfile    = '/etc/apache2/sites-enabled/vhost.conf'
  	} else {
	}
}
