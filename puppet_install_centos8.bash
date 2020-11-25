#!/bin/bash

for service in crond firewalld chronyd tuned atd smartd mcelog libstoragemgmt
do
  sudo systemctl stop 		${service}.service 
  sudo systemctl disable 	${service}.service
done

for service in auditd
do
  sudo service 	${service} stop 
  sudo systemctl disable ${service}
done

# reference https://linuxconfig.org/how-to-install-puppet-on-redhat-8
sudo dnf install https://yum.puppetlabs.com/puppet-release-el-8.noarch.rpm -y
sudo dnf install puppet -y
sudo systemctl start puppet
sudo systemctl enable puppet

