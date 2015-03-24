# proudsourcing-zendguardloader

Puppet module to install ZEND Guard Loader for PHP 5.3 and PHP 5.4 (apache-linux-x64).


## Usage
* Install using default options: PHP 5.3, automatic detection of Operating System and restart of apache service upon change

	class { 'zendguardloader': }


* You can define php version, apache modules, php conf.d directory and more:

	class { 'zendguardloader':
		php_version			=> "5.4",
		php_modules_dir	=> "",
		apache_php_dir		=> ""
	}


