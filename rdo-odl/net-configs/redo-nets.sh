yes|cp ifcfg-* /etc/sysconfig/network-scripts/
service network restart
ifconfig ens256 up

service openvswitch restart
