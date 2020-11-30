useradd dave
usermod -G wheel dave
ssh-keygen  # for user "dave"
yum install git -y

cat <<EOF > /etc/sysconfig/network-scripts/ifcfg-enp0s3
DEVICE=enp0s3
ONBOOT=yes
BOOTPROTO=dhcp
EOF

cat <<EOF > /etc/hostname
centos8_build
EOF

cat <<EOF >> /etc/hosts
192.168.1.216 centos8_build
192.168.1.217 centos8_0 puppet
EOF

systemctl restart NetworkManager.service

dnf install https://yum.puppetlabs.com/puppet-release-el-8.noarch.rpm -y
dnf install puppet -y
systemctl start puppet
systemctl enable puppet
