# -*- mode: ruby -*-
# vi: set ft=ruby :

VAGRANTFILE_API_VERSION = "2" 

Vagrant.configure("2") do |config|
  config.vm.box = "precise"
  config.vm.box_url = "http://files.vagrantup.com/precise64.box"
  config.vm.hostname = "ci"

  config.vm.network :private_network, ip: "192.168.2.200"
  #config.vm.network :public_network

  config.ssh.forward_agent = true

  config.vm.provider :virtualbox do |v|
    v.customize ["modifyvm", :id, '--chipset', 'ich9'] # solves kernel panic issue on some host machines
    v.customize ["modifyvm", :id, "--memory", 1024] #1024mb memory
    v.customize ["modifyvm", :id, "--ioapic", "on"]
    v.customize ["modifyvm", :id, "--natdnshostresolver1", "on"]
    v.customize ["modifyvm", :id, "--natdnsproxy1", "on"]
  end

  config.vm.provision :puppet do |puppet|
    puppet.manifests_path = "manifests"
    puppet.module_path = "modules"
    puppet.options = ['--verbose']
  end
end

