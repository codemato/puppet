class apps::prodapp {
    deploy_app { "sales":
        name   => "sales",
        ensure => present,
        install_location => "/var/www/html/apps",
        deploy_source => "https://github.com/extendingpuppet/sample-apache-app.git"
    }
}
