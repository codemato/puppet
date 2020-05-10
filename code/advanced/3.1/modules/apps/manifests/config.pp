class apps::config ($appname) {

    class { 'apache': }

    file { "/var/www/html/apps":
        ensure => directory,
        owner  => 'root',
        group  => 'root',
    }

    file { "${appname}":
        path      => "/var/www/html/apps/${appname}",
        ensure    => directory,
        recurse   => true,
        source    => "puppet:///modules/apps/${appname}",
    }
}
