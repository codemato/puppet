class apps::testapp {

	include docker_prod::install

	$images = ['nginx', 'mysql']

	$images.each |String $image| {
	    docker::image { "${image}": require => [ Class['docker_prod::install'] ] }
        }

	file { 'testapp-compose-file':
		path   => '/opt/testapp.yml',
		ensure => file,
		source => 'puppet:///modules/apps/testapp.yml',
		require  => [ Class['docker_prod::install'] ],
        }

	docker_compose { '/opt/testapp.yml':
  		ensure  => present,
		require  => [ File['testapp-compose-file'], Class['docker_prod::install'] ]
	}
}
