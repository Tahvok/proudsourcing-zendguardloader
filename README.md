# Puppet module: zendguardloader

Puppet module to install Zend Guard Loader for PHP 5.3 and PHP 5.4 (64-bit systems).


## Usage

* Install using default options: PHP 5.3, automatic detection of Operating System and restart of apache service upon change:

        class { 'zendguardloader': }

* You can define php version, apache modules, php conf.d directory and more:

        class { 'zendguardloader':
                php_version        => "5.4",
                php_modules_dir	   => "",
                apache_modules_dir => ""
        }

## Supported Operating Systems

* RedHat/Centos 5-7
* Debian/Ubuntu (Not tested)
* OpenSuSE (Not tested)

## License

This program is free software: you can redistribute it and/or modify
it under the terms of the GNU General Public License as published by
the Free Software Foundation, either version 3 of the License, or
(at your option) any later version.

This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License for more details.

You should have received a copy of the GNU General Public License
along with this program.  If not, see <http://www.gnu.org/licenses/>.

## Copyright

Proud Sourcing GmbH 2014
www.proudsourcing.de / www.proudcommerce.com

