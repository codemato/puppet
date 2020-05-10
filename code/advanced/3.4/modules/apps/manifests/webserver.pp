class apps::webserver {
    include apache
    include git
    include apps::apache

    Class['apache'] -> Class['git'] -> Class['apps::apache']
}
