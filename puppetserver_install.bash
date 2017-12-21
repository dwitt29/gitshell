## on Master node

sudo rpm -Uvh https://yum.puppetlabs.com/puppetlabs-release-pc1-el-7.noarch.rpm

sudo yum -y install puppetserver

sudo vi /etc/puppetlabs/puppet/puppet.conf    ## [main] server = centos1.dwhome.com,puppetserver.dwhome.com
sudo vi /etc/hosts				## add puppetserver.dwhome.com

sudo vi /etc/sysconfig/puppetserver		## change memory allocations

sudo systemctl start puppetserver

sudo /opt/puppetlabs/bin/puppet agent --test --debug
sudo /opt/puppetlabs/bin/puppet cert list   ## key appears
#  "centos1.dwhome.com" (SHA256) 8D:89:B8:C1:61:B2:E5:FA:E8:AF:34:8C:AF:56:25:9D:99:A7:A3:69:EC:B1:AF:FA:81:8B:F1:86:AC:CB:83:E3 (alt names: "DNS:centos1.dwhome.com", "DNS:puppetserver.dwhome.com")
sudo /opt/puppetlabs/bin/puppet cert sign centos1.dwhome.com
#Notice: Signed certificate request for centos1.dwhome.com
#Notice: Removing file Puppet::SSL::CertificateRequest centos1.dwhome.com at '/etc/puppetlabs/puppet/ssl/ca/requests/centos1.dwhome.com.pem'
sudo systemctl start puppet



## On agents

sudo rpm -Uvh https://yum.puppetlabs.com/puppetlabs-release-pc1-el-7.noarch.rpm

sudo yum -y install puppet-agent

sudo vi /etc/puppetlabs/puppet/puppet.conf    ## [main] server = centos1.dwhome.com,puppetserver.dwhome.com \n  dns_alt_names = puppetserver.dwhome.com
sudo vi /etc/hosts                              ## add puppetserver.dwhome.com

sudo /opt/puppetlabs/bin/puppet agent --test --debug ## on agent
sudo /opt/puppetlabs/bin/puppet cert list  ## on master
#  "centos2.dwhome.com" (SHA256) E6:84:72:EC:02:4A:B8:EA:1E:1B:26:42:0A:76:F7:E9:ED:02:42:1C:77:00:3A:51:D6:C5:47:C2:F8:9C:D0:39 (alt names: "DNS:centos2.dwhome.com", "DNS:puppetserver.dwhome.com")
sudo /opt/puppetlabs/bin/puppet cert --allow-dns-alt-names sign centos2.dwhome.com   ## on master
#Notice: Signed certificate request for centos2.dwhome.com
#Notice: Removing file Puppet::SSL::CertificateRequest centos2.dwhome.com at '/etc/puppetlabs/puppet/ssl/ca/requests/centos2.dwhome.com.pem'

sudo systemctl start puppet ## on agent
