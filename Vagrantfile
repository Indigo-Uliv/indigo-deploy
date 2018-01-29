# -*- mode: ruby -*-
# vi: set ft=ruby :

#Vagrant.configure("2") do |config|
#  config.vm.box = "iamseth/rhel-7.3"
#  config.vm.box_version = "1.0.0"
#end


Vagrant.configure("2") do |config|

#  config.vm.define "node0" do |node0|
#    node0.vm.box = "hashicorp/precise64"
#    node0.vm.box_version = "1.1.0"
#    node0.vm.network "private_network", ip: "192.168.12.10"
#    node0.vm.provision :shell, path: "bootstrap_ubuntu.sh"
#    
#    node0.vm.provider "virtualbox" do |v|
#      # vb.gui = true
#      v.memory = "1024"
#    end
#  end


  config.vm.define "node1" do |node1|
    node1.vm.box = "generic/fedora27"
    node1.vm.network "private_network", ip: "192.168.12.11"
    node1.vm.provision :shell, path: "bootstrap_fedora.sh"
    
    node1.vm.provider "virtualbox" do |v|
      # vb.gui = true
      v.memory = "1024"
    end
  end
  
end
