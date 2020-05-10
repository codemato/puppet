class nagios::install {
    package { [ 'nagios', 'nagios-plugins', 'nagios-plugins-nrpe', 'nagios-plugins-load' ]:
        ensure  => present,
	require => Class[ 'nagios::repo' ],
    }
}
