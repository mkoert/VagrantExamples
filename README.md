# Quick Vagrant Setup
This is a vagrant shortcut to set up a Ubuntu Raring x64 box with LAMP and Postgresql.

### Install Oracle VirtualBox

Download Here: [https://www.virtualbox.org/wiki/Downloads] (https://www.virtualbox.org/wiki/Downloads)

### Install Vagrant

Download Here: [http://downloads.vagrantup.com/] (http://downloads.vagrantup.com/)

### Clone this project

	git clone https://github.com/djheru/VagrantExamples.git ./project_name
	
### Modify the Apache vhost config if needed

	nano ./project_name/provision/modules/apache/files/default

Currently it looks like:
```
<VirtualHost *:80>
	
	ServerName vagrant
    ServerAdmin webmaster@localhost
    DocumentRoot /var/www/site/public
    SetEnv APPLICATION_ENV "development"
	
    <Directory /var/www/site/public>
        DirectoryIndex index.php
        AllowOverride All
        Order allow,deny
        Allow from all
    </Directory>
	
	ErrorLog /var/log/apache2/error.log
	
	#Possible values include: debug, info, notice, warn, error, crit, alert, emerg
	LogLevel warn
	
	CustomLog /var/log/apache2/access.log combined
	
</VirtualHost>
```
	
### Start the box (building if needed)

	cd ./project_name && vagrant up
	
(this will take a while)

### Edit your hosts file
	192.168.56.2	project-name #or whatever hostname you want
	
### Access your box via ssh

	vagrant ssh
	
### Pause your box

(remember to exit your ssh session)
	vagrant suspend
	
### Resume your box

	vagrant resume
	
### Shut down your box

	vagrant halt
	
### Destroy the box

	vagrant destroy
	
## Vagrant Docs
View Here: [http://docs.vagrantup.com/v2/getting-started/index.html] (http://docs.vagrantup.com/v2/getting-started/index.html)