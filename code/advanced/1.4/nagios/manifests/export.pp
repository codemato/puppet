class nagios::export {

    @@nagios_host { $::hostname :
        ensure              => present,
        address             => $::networking[interfaces][eth1][ip],
        use                 => 'generic-host',
        check_command       => 'check-host-alive',
        hostgroups          => 'all-servers',
        target              => "/etc/nagios/conf.d/${::hostname}.cfg",
	max_check_attempts  => 3,
    }

    @@nagios_service { "${::hostname}_check-load":
        ensure              => present,
        use                 => 'generic-service',
        host_name           => $::hostname,
        service_description => 'Current Load',
        check_command       => "check_nrpe!check_load!-a '-w 15,10,5 -c 30,20,10'",
        target              => "/etc/nagios/conf.d/${::hostname}.cfg",
	max_check_attempts  => 3,
    }
}
