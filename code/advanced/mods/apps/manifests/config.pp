class apps::config ($appname) {

    file { "${appname}":
        path      => "/var/www/html/apps/${appname}",
        ensure    => directory,
        recurse   => true,
        source    => "puppet:///modules/apps/${appname}",
    }
}
