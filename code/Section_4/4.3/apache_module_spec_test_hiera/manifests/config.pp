class apache::config (
	String $configsource = lookup({"name" => "apache.configsource", "default_value" => $::apache::parameters::configsource}),
	String $configfile = lookup({"name" => "apache.configfile", "default_value" => $::apache::parameters::configfile}),
	String $vhostsource = lookup({"name" => "apache.vhostsource", "default_value" => $::apache::parameters::vhostsource}),
	String $vhostfile = lookup({"name" => "apache.vhostfile", "default_value" => $::apache::parameters::vhostfile})
	) inherits ::apache::parameters {
	file { 'config-file':
		path   => $configfile,
		ensure => file,
		source => $configsource,
        }

	file { 'vhost-file':
		path    => $vhostfile,
		ensure  => file,
		content => template($vhostsource),
        }
}
