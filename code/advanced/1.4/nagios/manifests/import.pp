class nagios::import {

    Nagios_host <<||>> {
        require => Class[ 'nagios::install' ],
        notify  => Class[ 'nagios::service' ]
    }

    Nagios_service <<||>> {
        require => Class[ 'nagios::install' ],
        notify  => Class[ 'nagios::service' ]
    }
}
