class apache {
	package {"apache2":
		ensure => present
	}
	
	file { '/var/www/sites':
		ensure => 'link',
		target => '/vagrant/sites',
		require => Package['apache2']
	}
	
	file { '/etc/apache2/sites-available/default':
		source => 'puppet:///modules/apache/default',
		owner => 'root',
		group => 'root',
		require => Package['apache2']	
	}

	exec { "/usr/sbin/a2enmod vhost_alias":
	    notify => Exec["force-reload-apache2"],
	    require => Package['apache2']
	}
	
	service { "apache2":
		require => Package["apache2"],
		hasrestart => true,
		subscribe =>[File['/etc/apache2/sites-available/default'],
			Package['php5', 'php5-cli', 'php5-common', 'php5-pgsql', 'php5-mysql', 'php5-dev', 'php5-curl', 'php5-gd', 'php5-imagick', 
					'php5-mcrypt', 'php5-memcache', 'php5-mhash', 'php5-pspell', 'php5-snmp', 'php5-xdebug',
					'php5-xmlrpc', 'php5-xsl', 'php-pear', 'libapache2-mod-php5']]		
	}
	
	file { "/var/www/uploads":
		ensure => "directory",
		owner => "www-data",
		group => "www-data",
		mode => 777,
		require => Package['apache2']
	}

	exec { "force-reload-apache2":
        command => "/etc/init.d/apache2 force-reload",
        refreshonly => true,
    }

}
