#!/bin/bash

for service in crond firewalld  chronyd tuned atd smartd mcelog libstoragemgmt
do
  sudo systemctl stop ${service}.service; systemctl disable ${service}.service
done
sudo service auditd stop 

# reference https://linuxconfig.org/how-to-install-puppet-on-redhat-8

sudo dnf install https://yum.puppetlabs.com/puppet-release-el-8.noarch.rpm -y

sudo dnf install puppetserver -y

# edit Xms Xmx from JAVA_ARGS /etc/sysconfig/puppetserver to be 128m instead of 2g
sudo vi /etc/sysconfig/puppetserver

sudo puppet resource package puppetserver ensure=latest

sudo systemctl start puppetserver

sudo systemctl enable puppetserver

