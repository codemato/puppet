class apps::mon {
    package { 'monit':
        before => Service["monit"]
    }

    service { 'monit':
        ensure => apps::check_site( $::networking['interfaces']['eth1']['ip'], 'apache-app' ),
        enable => apps::check_site( $::networking['interfaces']['eth1']['ip'], 'apache-app' ),
    }
}
