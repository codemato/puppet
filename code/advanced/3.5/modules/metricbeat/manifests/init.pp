class metricbeat {
    $elasticsearch_server = "192.168.33.201"

    package { 'metricbeat-5.4.1-1.x86_64':
        ensure   => installed,
        provider => 'rpm',
        source   => 'https://artifacts.elastic.co/downloads/beats/metricbeat/metricbeat-5.4.1-x86_64.rpm',
        before   => Service["metricbeat"]
    }

    service { 'metricbeat':
        ensure => metricbeat::check_elastic( $elasticsearch_server ),
        enable => metricbeat::check_elastic( $elasticsearch_server ),
    }
}
