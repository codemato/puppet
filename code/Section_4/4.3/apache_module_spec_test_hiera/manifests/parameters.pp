class apache::parameters {
	if $::osfamily == 'RedHat' {
		$packagename  = 'httpd'
    		$configfile   = '/etc/httpd/conf/httpd.conf'
    		$configsource = 'puppet:///modules/apache/httpd.conf'
		$vhostfile    = '/etc/httpd/conf.d/vhost.conf'
		$vhostsource  = 'apache/vhost.conf.erb'
  		$servicename  = 'httpd'
        } elsif $::osfamily == 'Debian' {
		$packagename  = 'apache2'
    		$configfile   = '/etc/apache2/apache2.conf'
    		$configsource = 'puppet:///modules/apache/apache2.conf'
		$vhostfile    = '/etc/apache2/sites-enabled/vhost.conf'
		$vhostsource  = 'apache/vhost.conf.erb'
  		$servicename  = 'apache2'
  	} else {
	}
}
