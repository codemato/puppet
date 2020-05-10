class nagios::repo {
	file { "/tmp/epel-release-7-9.noarch.rpm": source => "https://dl.fedoraproject.org/pub/epel/7/x86_64/e/epel-release-7-9.noarch.rpm" }

	package { "epel-release-7-9.noarch":
    	    ensure => installed,
    	    provider => 'rpm',
    	    source => "/tmp/epel-release-7-9.noarch.rpm",
    	    require => File["/tmp/epel-release-7-9.noarch.rpm"],
  	}
}
