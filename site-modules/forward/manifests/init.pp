class forward (
  $forward_port = '8888',
  $resolver_ip  = '8.8.8.8',
  $nginx_forward_config_file = '/etc/nginx/conf.d/forward_proxy.conf',
){
  notify {'Running forward proxy':}

  $forward_proxy_config_hash = {
    'forward_port'      => $forward_port,
    'resolver_ip'       => $resolver_ip,
  }

  file { $nginx_forward_config_file:
    ensure  => file,
    content => epp('forward/forward_proxy.conf.epp', $forward_proxy_config_hash),
    notify  => Service['nginx'],
  }

}
