node default {
  class { '::apache':
    default_vhost  => false,
    service_manage => false,
    use_systemd    => false,
  }
}
