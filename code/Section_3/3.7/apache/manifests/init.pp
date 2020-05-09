class apache {
	include apache::package
	include apache::config
	include apache::service

	Class['apache::package'] -> Class['apache::config'] ~> Class['apache::service']
}
