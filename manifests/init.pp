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
  $apache_modules_dir     = $zendguardloader::params::apache_modules_dir,
  $php_modules_dir        = $zendguardloader::params::apache_php_dir,
  $php_version            = $zendguardloader::params::php_version,
  $service                = $zendguardloader::params::service,
  $service_autorestart    = $zendguardloader::params::service_autorestart,
) inherits zendguardloader::params {

  $realservice_autorestart = $service_autorestart ? {
    true  => Service[$zendguardloader::service],
    false => undef,
  }

  file { 'ZendGuardLoader.so':
    ensure => present,
    path   => "${zendguardloader::apache_modules_dir}/ZendGuardLoader.so"
    source =>"puppet:///modules/zendguardloader/ZendGuardLoader-php-${zendguardloader::php_version}.so",
  }

  file { 'loader.ini':
    ensure    => present,
    path      => "${zendguardloader::php_modules_dir}/loader.ini",
    content   => template('zendguardloader/loader.ini.erb'),
    subscribe => File["${zendguardloader::apache_modules_dir}/ZendGuardLoader.so"],
    notify    => $zendguardloader::realservice_autorestart,
  }

}
