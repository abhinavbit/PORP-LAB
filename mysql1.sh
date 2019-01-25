#!/bin/bash
sudo apt-get update
(grep -q vagrant /etc/passwd || useradd -m vagrant );
mkdir -p /vagrant 
chown vagrant:adm /vagrant 
chmod g+w -R /vagrant 
