# sample LAMP Setup With Vagrant/Puppet

## Initialize project

`mkdir project_name && cd project_name`

`vagrant init precise64 http://files.vagrantup.com/precise64.box`


## Configure Vagrantfile

__in Vagrantfile, forward port 80 to port 8080 by uncommenting the following line__

`config.vm.network :forwarded_port, guest: 80, host: 8080`


__Before running the Puppet provisioner to install the LAMP stack we need to do an inline apt-get update__

`config.vm.provision :shell, :inline => "apt-get update"`


__add config to Vagrantfile for manifests and modules, uncomment the existing comment and update__

	config.vm.provision :puppet do |puppet|
		puppet.manifests_path = "provision/manifests"
		puppet.module_path = "provision/modules"
		puppet.manifest_file = "default.pp"
	end

	
## Make the directory structure required by above config settings

__setup directory structure__

`mkdir provision && cd provision`

`mkdir modules`

`mkdir manifests`

`touch ./manifests/default.pp`


__make the apache module__

`mkdir ./modules/apache`

`touch ./modules/apache/init.pp`


__make the custom apache config file__

`mkdir ./modules/apache/files`

`touch ./modules/apache/files/default`


__make the mysql module__

`mkdir ./modules/mysql`

`touch ./modules/mysql/init.pp`


__make the php module__

`mkdir ./modules/php`

`touch ./modules/php/init.pp`


__make the email module__

`mkdir ./modules/email`

`touch ./modules/email/init.pp`


## The manifest file (./manifests/default.pp):

	import "apache"
	include apache
	import "modrewrite"
	include modrewrite
	import "php"
	include php
	import "mysql"
	include mysql
	import "mail"
	include mail
