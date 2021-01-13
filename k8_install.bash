#!/bin/bash

# from https://phoenixnap.com/kb/how-to-install-kubernetes-on-centos

# step 1
cat <<EOF > /etc/yum.repos.d/kubernetes.repo
[kubernetes]
name=Kubernetes
baseurl=https://packages.cloud.google.com/yum/repos/kubernetes-el7-x86_64
enabled=1
gpgcheck=1
repo_gpgcheck=1
gpgkey=https://packages.cloud.google.com/yum/doc/yum-key.gpg https://packages.cloud.google.com/yum/doc/rpm-package-key.gpg
EOF

# step 2
sudo yum install -y kubelet kubeadm kubectl
systemctl enable kubelet
systemctl start kubelet

# step 4 replacement
systemctl stop firewalld
systemctl disable firewalld

# step 5
cat <<EOF > /etc/sysctl.d/k8s.conf
net.bridge.bridge-nf-call-ip6tables = 1
net.bridge.bridge-nf-call-iptables = 1
EOF
sysctl --system

# step 6
setenforce 0
sed -i 's/^SELINUX=enforcing$/SELINUX=disabled/' /etc/selinux/config

# step 7
sed -i '/swap/d' /etc/fstab   # or comment line in /etc/fstab
swapoff -a
