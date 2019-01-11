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
  config.vm.box_check_update = false

  config.vm.define "app" do |h|
h.vm.network "private_network", ip: "192.168.135.101"
    h.vm.hostname = "app"

   h.vm.provision "shell" do |s|
    s.path = "bootstrap.sh"
    s.privileged = true
  end

    h.vm.provider "virtualbox" do |vb|
     vb.memory = "512"
     vb.cpus = 1
    end
  end

  config.vm.define "mysql1" do |h|
h.vm.network "private_network", ip: "192.168.135.111"
    h.vm.hostname = "mysql1"

    h.vm.provider "virtualbox" do |vb|
     vb.memory = "512"
     vb.cpus = 1
    end
  end

  config.vm.define "mysql2" do |h|
h.vm.network "private_network", ip: "192.168.135.112"
    h.vm.hostname = "mysql2"

    h.vm.provider "virtualbox" do |vb|
     vb.memory = "512"
     vb.cpus = 1
    end
  end

  config.vm.define "mysql3" do |h|
h.vm.network "private_network", ip: "192.168.135.113"
    h.vm.hostname = "mysql3"

    h.vm.provider "virtualbox" do |vb|
     vb.memory = "512"
     vb.cpus = 1
    end
  end

end
