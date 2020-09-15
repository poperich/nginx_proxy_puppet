# -*- mode: ruby -*-
# vi: set ft=ruby :
 
Vagrant.configure(2) do |config|
  config.vm.box = "ubuntu/trusty64"
  config.vm.define "nginx.vm", primary: true do |dev|
    config.ssh.insert_key = false
    config.vm.hostname = "domain.com"
    config.puppet_install.puppet_version = :latest

    config.vm.network "private_network", ip: "10.10.10.1"
    config.vm.network "private_network", ip: "20.20.20.1"

    config.vm.provision "puppet" do |puppet|
      puppet.manifests_path = "./manifests"
      puppet.manifest_file  = "site.pp"
      puppet.module_path = "./site-modules"
      #puppet.options = "--verbose --debug"
    end
  end
end