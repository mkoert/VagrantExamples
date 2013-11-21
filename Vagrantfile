VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|

  # Every Vagrant virtual environment requires a box to build off of.
  config.vm.box = "raring64"

  # The url from where the 'config.vm.box' box will be fetched if it
  # doesn't already exist on the user's system.
  config.vm.box_url = "http://cloud-images.ubuntu.com/vagrant/raring/20131116/raring-server-cloudimg-amd64-vagrant-disk1.box"
  
  # Create a private network, which allows host-only access to the machine
  # using a specific IP.
  config.vm.network :private_network, ip: "192.168.56.2"
  
  # Use VBoxManage to customize the VM. For example to change memory:
  config.vm.provider :virtualbox do |vb|
    vb.customize ["modifyvm", :id, "--memory", "1024"]
  end  
  
  # Share an additional folder to the guest VM. The first argument is
  # the path on the host to the actual folder. The second argument is
  # the path on the guest to mount the folder. And the optional third
  # argument is a set of non-required options.
  # This is the default
  # config.vm.synced_folder "./", "/vagrant"

  # We're using an ubuntu box, so do an apt-get update
  # to update our sources before we start running the 
  # provisioning scripts
  config.vm.provision :shell, :inline => "apt-get update"
  
  config.vm.provision :puppet do |puppet|
    puppet.manifests_path = "provision/manifests"
	puppet.manifest_file = "default.pp"
    puppet.module_path = "provision/modules"
  end

end
