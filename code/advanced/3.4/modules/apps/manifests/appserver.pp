class apps::appserver {
    include tomcat_prod
    include git
    include apps::tomcat

    Class['tomcat_prod'] -> Class['git'] -> Class['apps::tomcat']
}
