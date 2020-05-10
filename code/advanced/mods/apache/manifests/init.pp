class apache {
    package { "httpd":
        before => Service[ "httpd" ]
    }

    service { "httpd":
        ensure => running
    }
}
