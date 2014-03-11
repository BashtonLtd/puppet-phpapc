# == Class phpapc::params
#
# This class is meant to be called from phpapc
# It sets variables according to platform
#
class phpapc::params {
  case $::osfamily {
    'Debian': {
      $package_name = 'php-apc'
    }
    'RedHat', 'Amazon': {
      $package_name = 'php-pecl-apc'
    }
    default: {
      fail("${::operatingsystem} not supported")
    }
  }

  $config_file = '/etc/php.d/apc.ini'

  $config = {
    'enable_opcode_cache' => 1,
    'shm_size'            => '128M',
  }

}
