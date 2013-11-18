class modrewrite{
	exec { 'enablemodrewrite':
		command => '/usr/sbin/a2enmod rewrite',
		require => Package['apache2']
	}
}