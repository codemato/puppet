class nagios::nrpe {

    package { [ 'nrpe', 'nagios-plugins', 'nagios-plugins-load' ]:
        ensure      => present,
	require     => Class[ 'nagios::repo' ],
    }

    service { 'nrpe':
        ensure      => running,
        enable      => true,
        require     => Package[ 'nrpe', 'nagios-plugins', 'nagios-plugins-load' ],
    }
}
