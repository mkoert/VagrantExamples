# Quick Vagrant Setup
This is a vagrant shortcut to set up a Ubuntu Raring x64 box with LAMP and Postgresql.

### Install Oracle VirtualBox

Download Here: [https://www.virtualbox.org/wiki/Downloads] (https://www.virtualbox.org/wiki/Downloads)

### Install Vagrant

Download Here: [http://downloads.vagrantup.com/] (http://downloads.vagrantup.com/)

### Clone this project

	git clone https://github.com/djheru/VagrantExamples.git ./project_name
	
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