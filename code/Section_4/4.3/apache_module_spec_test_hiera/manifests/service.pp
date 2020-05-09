class apache::service (
	String $servicename = lookup({"name" => "apache.servicename", "default_value" => $::apache::parameters::servicename})
	) inherits ::apache::parameters {
	service { 'apache-service':
		name        => $servicename,
		ensure      => running,
		enable      => true,
		hasrestart  => true,
	}
}
