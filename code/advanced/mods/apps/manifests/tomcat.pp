class apps::tomcat {
    deploy_app { "tomcat-app":
        name   => "tomcat-app",
        ensure => present,
        install_location => "/opt/tomcat",
        deploy_source => "https://github.com/extendingpuppet/plugin-app-tomcat.git",
        source_war => "sample.war"
    }
}
