yum update -y
yum install -y https://rdo.fedorapeople.org/rdo-release.rpm
yum install -y openstack-packstack

yum install -y git vim wget net-tools tcpdump
yum install -y epel-release
yum install -y crudini


# Disable selinux to avoid any problems
setenforce 0
sed -i -e 's/SELINUX=enforcing/SELINUX=permissive/g' /etc/selinux/config

# Use iptables instead of firewalld since that is what OpenStack uses.
#systemctl stop firewalld.service
#systemctl disable firewalld.service
#yum install -y iptables-services
#touch /etc/sysconfig/iptables
#systemctl enable iptables.service
#systemctl start iptables.service

# Use network service instead of NetworkManager so
# that we can uniquely define everything.
#systemctl stop NetworkManager.service
#systemctl disable NetworkManager.service

#systemctl enable network
#systemctl restart network



