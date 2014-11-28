
pushd /etc/sysconfig/network-scripts

eth0="ens32"
eth1="ens33"
eth2="ens34"

IPADDR="10.7.5.9"
NETMASK="255.255.0.0"
GATEWAY="10.7.1.1"

sed -i -e 's/^BOOTPROTO.*$/BOOTPROTO=static/' ifcfg-$eth0
sed -i -e 's/^BOOTPROTO.*$/BOOTPROTO=none/' ifcfg-$eth1
sed -i -e 's/^BOOTPROTO.*$/BOOTPROTO=none/' ifcfg-$eth2
sed -i -e 's/^ONBOOT.*$/ONBOOT=yes/' ifcfg-$eth0
sed -i -e 's/^ONBOOT.*$/ONBOOT=yes/' ifcfg-$eth1
sed -i -e 's/^ONBOOT.*$/ONBOOT=yes/' ifcfg-$eth2
sed -i -e 's/^UUID/#UUID/' ifcfg-$eth0
sed -i -e 's/^UUID/#UUID/' ifcfg-$eth1
sed -i -e 's/^UUID/#UUID/' ifcfg-$eth2

echo "IPADDR=$IPADDR" >> ifcfg-$eth0
echo "NETMASK=$NETMASK" >> ifcfg-$eth0
echo "GATEWAY=$GATEWAY" >> ifcfg-$eth0
echo "DNS1=8.8.8.8" >> ifcfg-$eth0
echo "DNS2=$GATEWAY" >> ifcfg-$eth0

service network restart

popd
