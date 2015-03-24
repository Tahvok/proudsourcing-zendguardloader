# Class: zendguardloader::params
#
# This class defines default parameters used by the main module class
# Operating System differences in names and paths are addressed here
#
# == Variables
#
# Refer to php class for variables defined here
#
# == Isage
#
# This class is not intended te be used directly
# It may be imported or inherited by onter classes
#
#
class zendguardloader::params
{
    $apache_modules_dir = $::operatingsystem ? {
      /(?i:Ubuntu|Debian|Mint|SLES|OpenSuSE)/ => '/etc/apache2/modules',
      default                                 => '/etc/httpd/modules',
    }

    $php_modules_dir = $::operatingsystem ? {
      /(?i:Ubuntu|Debian|Mint|SLES|OpenSuSE)/ => '/etc/php5',
      default => '/etc/php.d'
    }

    $service = $::operatingsystem ? {
      /(?i:Ubuntu|Debian|Mint|SLES|OpenSuSE)/ => 'apache2',
      default => 'httpd',
    }

    # General settings
    $service_autorestart = true
    $php_version        = '5.3'
}
