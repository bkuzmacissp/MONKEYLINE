Vagrant.configure("2") do |config|
  config.vm.provider "vmware_workstation" do |v|
    v.gui=true
	end
  config.vm.define "targetserver" do |targetserver|
    targetserver.vm.box ="boxcutter/ubuntu1604"
	targetserver.vm.hostname = "server"
	targetserver.vm.provision :shell, path: "targetbootstrap.sh"
	targetserver.vm.network :private_network, ip: "192.168.0.5"
    end
  config.vm.define "client" do |client|
    client.vm.box = "boxcutter/ubuntu1604"
	client.vm.hostname=  "client"
	client.vm.provision :shell,path: "clientbootstrap.sh"
	client.vm.network :private_network, ip: "192.168.0.6"
    end
  end
