local_ip="10.7.5.11"
integration_bridge="br-ens224"
provider_mappings="physnet1:$integration_bridge"
odl_ip="10.7.5.54"
net_type="vlan"

crudini --set /etc/neutron/plugins/ml2/ml2_conf.ini ml2 mechanism_drivers opendaylight,hyperv
crudini --set /etc/neutron/plugins/ml2/ml2_conf.ini ml2 tenant_network_types $net_type
crudini --set /etc/neutron/plugins/ml2/ml2_conf.ini ml2 type_drivers $net_type

crudini --set /etc/neutron/plugins/ml2/ml2_conf.ini ml2_odl url http://$odl_ip:8080/controller/nb/v2/neutron
crudini --set /etc/neutron/plugins/ml2/ml2_conf.ini ml2_odl username admin
crudini --set /etc/neutron/plugins/ml2/ml2_conf.ini ml2_odl password admin

crudini --set /etc/neutron/plugins/ml2/ml2_conf.ini odl nodes
crudini --set /etc/neutron/plugins/ml2/ml2_conf.ini odl network_vlan_ranges 1:4000 
crudini --set /etc/neutron/plugins/ml2/ml2_conf.ini odl tunnel_id_ranges 1:4000
crudini --set /etc/neutron/plugins/ml2/ml2_conf.ini odl tun_peer_patch_port patch-int
crudini --set /etc/neutron/plugins/ml2/ml2_conf.ini odl int_peer_patch_port patch-tun
crudini --set /etc/neutron/plugins/ml2/ml2_conf.ini odl tenant_network_type $net_type
crudini --set /etc/neutron/plugins/ml2/ml2_conf.ini odl tunnel_bridge br-tun
crudini --set /etc/neutron/plugins/ml2/ml2_conf.ini odl integration_bridge br-int
crudini --set /etc/neutron/plugins/ml2/ml2_conf.ini odl controllers $odl_ip:8080:admin:admin

bash odl.sh --local_ip $local_ip --provider_mappings $provider_mappings --odl_ip $odl_ip

systemctl status neutron-server.service
service neutron-server stop
service neutron-openvswitch-agent stop
systemctl disable neutron-openvswitch-agent.service

service neutron-server restart
service neutron-l3-agent restart
service neutron-dhcp-agent restart
service neutron-metadata-agent restart

ovs-vsctl set bridge "br-tun" protocols=OpenFlow10,OpenFlow11,OpenFlow12,OpenFlow13
ovs-vsctl set bridge "br-int" protocols=OpenFlow10,OpenFlow11,OpenFlow12,OpenFlow13
ovs-vsctl set bridge "br-ex" protocols=OpenFlow10,OpenFlow11,OpenFlow12,OpenFlow13
ovs-vsctl set bridge $integration_bridge protocols=OpenFlow10,OpenFlow11,OpenFlow12,OpenFlow13


