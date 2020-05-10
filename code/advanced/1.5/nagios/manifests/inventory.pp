class nagios::inventory {
        $nagios_nodes_query = ["from", "nodes",
                                ["extract", "certname",
                                 ["~", "certname", "nagios-client"]]]
        $nagios_nodes = puppetdb_query($nagios_nodes_query).each |$value| { $value["certname"] }

        Notify {"Nagios clients":
            message => "The nagios clients being managed are ${join($nagios_nodes, ', ')}",
            require => Class["stdlib"],
        }
}
