class apache::package (
	String $packagename = lookup({"name" => "apache.packagename", "default_value" => "httpd"})
	) {
	package { 'apache-package':
		name   => $packagename,
		ensure => present
	}
}
