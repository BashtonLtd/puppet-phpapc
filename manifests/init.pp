# == Class: phpapc
#
# Full description of class phpapc here.
#
# === Parameters
#
# [*sample_parameter*]
#   Explanation of what this parameter affects and what it defaults to.
#
class phpapc (
  $package_name = $phpapc::params::package_name,
  $config_file  = $phpapc::params::config_file,
  $config       = $phpapc::params::config
) inherits phpapc::params {

  # validate parameters here

  class { 'phpapc::install':
    package => $package_name
  } ->
  class { 'phpapc::config':
    config_file => $config_file,
    config      => $config,
  }
}
