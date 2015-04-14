# == Class: zendguardloader
#
# This is the main zendguardloader class
#
#
# == Parameters
# 
# [*apache_modules_dir*]
#   apache modules directory. If not specified uses the default of OS.
#  
# [*php_modules_dir*]
#   php modules ini derictory. If not specified uses the default of OS.
#
# [*php_version*]
#   php version for Zend Guard Loader
#
# [*service*]
#   Service name that should be notified in case of change. If not specified
#   uses apache service according to OS.
#
# [*service_autorestart*]
#   Whether it should notify the service for restart. true or false only.
#   Default true
#
#
class zendguardloader (
  $module_dir             = undef,
  $module_dir_array       = $zendguardloader::params::module_dir_array,
  $guardloader_file       = undef,
  $guardloader_file_array = $zendguardloader::params::guardloader_file_array,
  $php_config_dir         = $zendguardloader::params::php_modules_dir,
  $php_version            = $zendguardloader::params::php_version,
  $service                = $zendguardloader::params::service,
  $service_autorestart    = $zendguardloader::params::service_autorestart,
  $config_template        = $zendguardloader::params::config_template,
  $enable_module_command  = $zendguardloader::params::enable_module_command,
) inherits zendguardloader::params {

  $realservice_autorestart = $service_autorestart ? {
    true  => Service[$zendguardloader::service],
    false => undef,
  }

  if ($module_dir) {
    $module_dir = $zendguardloader::module_dir_array[$php_version]
  }

  if ($guardloader_file) {
    $guardloader_file = $zendguardloader::guardloader_file_array[$zendguardloader::php_version]
  }


  file { 'ZendGuardLoader.so':
    ensure => present,
    path   => "${zendguardloader::module_dir}/ZendGuardLoader.so",
    source => $zendguardloader::guardloader_file,
  }

  file { 'loader.ini':
    ensure    => present,
    path      => "${zendguardloader::php_config_dir}/loader.ini",
    content   => $zendguardloader::config_template,
    subscribe => File['ZendGuardLoader.so'],
    notify    => $zendguardloader::realservice_autorestart,
  }

  case $::osfamily {

    'Debian': {
      exec { 'enable_loader':
        command     => $zendguardloader::enable_module_command,
        refreshonly => true,
        subscribe   => File['loader.ini'],
      }
    }

    default: {
    }
  }
}
