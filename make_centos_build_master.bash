useradd dave
usermod -G wheel dave
ssh-keygen  # for user "dave"
yum install git -y
dnf install https://yum.puppetlabs.com/puppet-release-el-8.noarch.rpm -y
dnf install puppet -y
systemctl start puppet
systemctl enable puppet

cat <<EOF > /etc/sysconfig/network-scripts/ifcfg-enp0s3
DEVICE=enp0s3
ONBOOT=yes
BOOTPROTO=dhcp
EOF

cat <<EOF > /etc/hostname
centos8_build
EOF

systemctl restart NetworkManager.service
