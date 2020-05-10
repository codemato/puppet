class apps::prodapp {
    deploy_app { "apache-app":
        name   => "apache-app",
        ensure => present,
        install_location => "/var/www/html/apps",
        deploy_source => "https://github.com/extendingpuppet/sample-apache-app.git"
    }
}
