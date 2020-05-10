class consul_prod::server {
  class { '::consul':
    config_hash => {
      'bootstrap_expect' => 1,
      'data_dir'         => '/opt/consul',
      'datacenter'       => 'prod',
      'log_level'        => 'INFO',
      'advertise_addr'   => $::networking['interfaces']['eth1']['ip'],
      'node_name'        => $::hostname,
      'server'           => true,
    }
  }
}
