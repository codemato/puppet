class docker_prod::install {
	class {'docker':}

        class { 'docker::compose':
        	ensure => present
	}

	$ntwrks = ['prod-net', 'dev-net']

	$ntwrks.each |String $docker_net| {
		docker_network { "${docker_net}":
  	    	        ensure   => present,
		}
	}
}
