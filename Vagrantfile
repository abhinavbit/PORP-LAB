Vagrant.configure(2) do |config|

  config.vm.box = "ubuntu/xenial64"
  config.vm.box_check_update = false

  config.vm.provider "virtualbox" do |vb|
     vb.memory = "512"
     vb.cpus = 1
     vb.linked_clone = true
    end

  config.vm.define "app" do |h|
h.vm.network "private_network", ip: "192.168.135.101"
    h.vm.hostname = "app"

   h.vm.provision "shell" do |s|
    s.path = "app.sh"
    s.privileged = true
  end
    h.vm.provision "file", source: "app.yml", destination: "/vagrant/app.yml"
    h.vm.provision "ansible_local" do |ansible|
    ansible.install_mode = "pip"
    ansible.playbook = "app.yml"
    ansible.compatibility_mode = "2.0"
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
    ansible.install_mode = "pip"
    ansible.playbook = "mysql1.yml"
    ansible.compatibility_mode = "2.0"
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
    ansible.install_mode = "pip"
    ansible.playbook = "mysql2.yml"
    ansible.compatibility_mode = "2.0"
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
    ansible.install_mode = "pip"
    ansible.playbook = "mysql3.yml"
    ansible.compatibility_mode = "2.0"
  end

  end

end
