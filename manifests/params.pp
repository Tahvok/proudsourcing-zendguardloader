# Class: zendguardloader::params
#
# This class defines default parameters used by the main module class
# Operating System differences in names and paths are addressed here
#
# == Variables
#
# Refer to php class for variables defined here
#
# == Usage
#
# This class is not intended te be used directly
# It may be imported or inherited by other classes
#
#
class zendguardloader::params
{

  case $::osfamily {
    'Debian': {
      $module_dir_array = { 5.3 => '/var/lib/php5/20090626',
                            5.4 => '/var/lib/php5/20121212',
      }
    }

    'RedHat': {
      $module_dir_array = { 5.3 => '/etc/httpd/modules',
                            5.4 => '/etc/httpd/modules',
      }
    }

    default: {
      $module_dir_array = { 5.3 => '/etc/httpd/modules',
                            5.4 => '/etc/httpd/modules',
      }
    }
  }

  $guardloader_file_array = { 5.3 => 'puppet:///modules/zendguardloader/ZendGuardLoader-5.3.so',
                              5.4 => 'puppet:///modules/zendguardloader/ZendGuardLoader-5.4.so',
  }

  $php_config_dir = $::operatingsystem ? {
    /(?i:Ubuntu|Debian|Mint|SLES|OpenSuSE)/ => '/etc/php5/mods-available',
    default => '/etc/php.d'
  }

  $service = $::operatingsystem ? {
    /(?i:Ubuntu|Debian|Mint|SLES|OpenSuSE)/ => 'apache2',
    default => 'httpd',
  }

  # General settings
  $service_autorestart   = true
  $php_version           = '5.3'
  $config_template       = template('zendguardloader/loader.ini.erb')
  $enable_module_command = 'php5enmod loader'
}
