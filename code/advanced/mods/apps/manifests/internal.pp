class apps::internal {
    class { 'apache': }

    file { "/var/www/html/apps":
        ensure => directory,
        owner  => 'root',
        group  => 'root',
    }

    $app_names = [ "marketing", "sales" ]

    $app_names.each |String $app_name| {
        apps::deploy { "${app_name}": }
    }
}
