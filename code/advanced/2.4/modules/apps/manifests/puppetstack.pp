class apps::puppetstack {

	include docker_prod::install

	$images = ['puppetserver', 'puppetdb', 'puppetdb-postgres', 'puppetboard', 'puppetexplorer']

	$images.each |String $image| {
	    docker::image { "puppet/${image}": require => [ Class['docker_prod::install'] ] }
        }

	class { git::clone: repo => 'puppet-in-docker-examples' }

	file { 'compose-file':
		path   => '/opt/puppet-in-docker-examples/compose/docker-compose.yml',
		ensure => file,
		source => 'puppet:///modules/apps/docker-compose.yml',
		require  => [ Class['git::clone'], Class['docker_prod::install'] ],
        }

	docker_compose { '/opt/puppet-in-docker-examples/compose/docker-compose.yml':
  		ensure  => present,
		require  => [ File['compose-file'], Class['docker_prod::install'] ]
	}
}
