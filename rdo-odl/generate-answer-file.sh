answer_file="/root/odl-vlan/packstack-answers-check"
driver_type="vlan"
internal_network="ens33"

packstack --gen-answer-file=$answer_file

crudini --set $answer_file general CONFIG_NTP_SERVERS 0.pool.ntp.org,1.pool.ntp.org,2.pool.ntp.org,3.pool.ntp.org
crudini --set $answer_file general CONFIG_NAGIOS_INSTALL n
crudini --set $answer_file general CONFIG_SWIFT_INSTALL n
crudini --set $answer_file general CONFIG_PROVISION_DEMO n

crudini --set $answer_file general CONFIG_NEUTRON_ML2_TYPE_DRIVERS $driver_type
crudini --set $answer_file general CONFIG_NEUTRON_ML2_TENANT_NETWORK_TYPES $driver_type
crudini --set $answer_file general CONFIG_NEUTRON_OVS_TENANT_NETWORK_TYPE $driver_type

crudini --set $answer_file general CONFIG_NEUTRON_OVS_BRIDGE_MAPPINGS physnet1:br-$internal_network
crudini --set $answer_file general CONFIG_NEUTRON_OVS_BRIDGE_IFACES br-$internal_network:$internal_network

crudini --set $answer_file general CONFIG_NEUTRON_ML2_MECHANISM_DRIVERS openvswitch,hyperv

crudini --set $answer_file general CONFIG_NEUTRON_ML2_VLAN_RANGES physnet1:1:4094
crudini --set $answer_file general CONFIG_NEUTRON_OVS_VLAN_RANGES physnet1:1:4094
crudini --set $answer_file general CONFIG_NEUTRON_OVS_TUNNEL_RANGES 1:1000
