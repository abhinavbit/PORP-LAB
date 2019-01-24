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
    s.path = "app.sh"
    s.privileged = true
  end
    h.vm.provision "file", source: "app.yml", destination: "/vagrant/app.yml"
    h.vm.provision "ansible_local" do |ansible|
    ansible.compatibility_mode = "auto"
    ansible.playbook = "app.yml"
    ansible.compatibility_mode = "2.0"
  end

    h.vm.provider "virtualbox" do |vb|
     vb.memory = "512"
     vb.cpus = 1
    end
  end

  config.vm.define "mysql1" do |h|
h.vm.network "private_network", ip: "192.168.135.111"
    h.vm.hostname = "mysql1"

    h.vm.provision "shell" do |s|
    s.path = "mysql1.sh"
    s.privileged = true
  end
    h.vm.provision "file", source: "mysql1.yml", destination: "/vagrant/mysql1.yml"
    h.vm.provision "ansible_local" do |ansible|
    ansible.compatibility_mode = "auto"
    ansible.playbook = "mysql1.yml"
    ansible.compatibility_mode = "2.0"
  end

    h.vm.provider "virtualbox" do |vb|
     vb.memory = "512"
     vb.cpus = 1
    end
  end

  config.vm.define "mysql2" do |h|
h.vm.network "private_network", ip: "192.168.135.112"
    h.vm.hostname = "mysql2"

    h.vm.provision "shell" do |s|
    s.path = "mysql2.sh"
    s.privileged = true
  end
    h.vm.provision "file", source: "mysql2.yml", destination: "/vagrant/mysql2.yml"
    h.vm.provision "ansible_local" do |ansible|
    ansible.compatibility_mode = "auto"
    ansible.playbook = "mysql2.yml"
    ansible.compatibility_mode = "2.0"
  end

    h.vm.provider "virtualbox" do |vb|
     vb.memory = "512"
     vb.cpus = 1
    end
  end

  config.vm.define "mysql3" do |h|
h.vm.network "private_network", ip: "192.168.135.113"
    h.vm.hostname = "mysql3"
 
    h.vm.provision "shell" do |s|
    s.path = "mysql3.sh"
    s.privileged = true
  end
    h.vm.provision "file", source: "mysql3.yml", destination: "/vagrant/mysql3.yml"
    h.vm.provision "ansible_local" do |ansible|
    ansible.compatibility_mode = "auto"
    ansible.playbook = "mysql3.yml"
    ansible.compatibility_mode = "2.0"
  end

    h.vm.provider "virtualbox" do |vb|
     vb.memory = "512"
     vb.cpus = 1
    end
  end

end
