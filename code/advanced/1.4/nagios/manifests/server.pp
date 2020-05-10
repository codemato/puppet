class nagios::server {
    include nagios::repo
    include nagios::install
    include nagios::service
    include nagios::import
}
