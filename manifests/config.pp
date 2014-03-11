# == Class phpapc::config
#
# This class is called from phpapc
#
class phpapc::config (
  $config,
  $config_file) {

  file { $config_file:
    ensure  => present,
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
    content => template('phpapc/apc.ini.erb'),
  }
}
