class reverse (
  $reverse_ip_1 = '10.10.10.10',
  $reverse_ip_2 = '20.20.20.20',
  $server_name = 'domain.com',
  $source_location_1  = '/',
  $source_location_2  = '/resource',
  $nginx_reverse_config_file = '/etc/nginx/conf.d/reverse_proxy.conf',
){
  $reverse_proxy_config_hash = {
    'reverse_ip_1'       => $reverse_ip_1,
    'reverse_ip_2'       => $reverse_ip_2,
    'source_location_1'  =>  $source_location_1,
    'source_location_2'  => $source_location_2,
  }

  file { $nginx_reverse_config_file:
    ensure  => file,
    content => epp('reverse/reverse_proxy.conf.epp', $reverse_proxy_config_hash),
    notify  => Service['nginx'],
  }

}
