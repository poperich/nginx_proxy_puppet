class role::proxy_app {
  package { 'nginx':
  ensure => present,
  }
  file { '/etc/nginx/sites-enabled/default':
  ensure  => absent,
  }
  service { 'nginx':
  ensure    => running,
  }
  include profile::reverse_proxy
  include profile::forward_proxy
}
