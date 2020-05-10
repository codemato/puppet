define apps::deploy {

    $appname = $title

    file { "${appname}":
        path    => "/var/www/html/apps/${appname}",
        ensure  => directory,
        recurse => true,
        owner  => 'root',
        group  => 'root',
        source  => "puppet:///modules/apps/${appname}",
    }
}
