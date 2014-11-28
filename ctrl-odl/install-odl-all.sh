
install_dir="/root"
yum update -y
yum install -y git vim wget net-tools tcpdump java

iptables -D INPUT -j REJECT --reject-with icmp-host-prohibited
iptables -D FORWARD -j REJECT --reject-with icmp-host-prohibited

yum install -y ntpdate
ntpdate -u 0.pool.ntp.org
   
#iwget https://nexus.opendaylight.org/content/repositories/opendaylight.snapshot/org/opendaylight/integration/distribution-karaf/0.3.0-SNAPSHOT/distribution-karaf-0.3.0-20141126.181503-148.tar.gz
#tar -xzvf distribution-karaf-0.3.0-20141126.181503-148.tar.gz

pushd $install_dir

wget https://nexus.opendaylight.org/content/groups/public/org/opendaylight/integration/distribution-karaf/0.2.1-Helium-SR1/distribution-karaf-0.2.1-Helium-SR1.tar.gz

tar -xzvf distribution-karaf-0.2.1-Helium-SR1.tar.gz

popd $install_dir
