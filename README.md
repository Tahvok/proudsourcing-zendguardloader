# Puppet module: zendguardloader

Puppet module to install Zend Guard Loader for PHP 5.3 and PHP 5.4 (64-bit systems).


## Usage

* Install using default options: PHP 5.3, automatic detection of Operating System and restart of apache service upon change:

        class { 'zendguardloader': }

* You can define php version, apache modules, php conf.d directory and more:

        class { 'zendguardloader':
                php_version     => "5.4",
                php_modules_dir	=> "",
                apache_php_dir	=> ""
        }

## Supported Operating Systems

* RedHat/Centos 5-7
* Debian/Ubuntu (Not tested)
* OpenSuSE (Not tested)
