# -*- mode: ruby -*-
# vi: set ft=ruby :

# README
#
# Getting Started:
# 1. vagrant plugin install vagrant-hostmanager
# 2. vagrant up
# 3. vagrant ssh
#
# This should put you at the control host
#  with access, by name, to other vms
Vagrant.configure(2) do |config|

  config.vm.box = "ubuntu/trusty64"

  config.vm.define "app" do |h|
h.vm.network "private_network", ip: "192.168.135.101"
    h.vm.hostname = "app"

    h.vm.provider "virtualbox" do |vb|
     vb.memory = "512"
     vb.cpus = 1
    end
  end

for i in 1..3 do
  config.vm.define "mysql#{i}" do |h|
h.vm.network "private_network", ip: "192.168.135.11#{i}"
    h.vm.hostname = "mysql#{i}"
    
    h.vm.provider "virtualbox" do |vb|
     vb.memory = "512"
     vb.cpus = 1
    end
  end

end

end
