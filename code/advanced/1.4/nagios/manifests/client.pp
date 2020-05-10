class nagios::client {
    include nagios::repo
    include nagios::nrpe
    include nagios::export
}
