#prepare-rdo
START_IP=$1
END_IP=$2
neutron_cmd=$3

key="/root/.ssh/id_rsa"
private_net="ens34"

nova keypair-add userkey --pub_key $key".pub"
wget http://download.cirros-cloud.net/0.3.1/cirros-0.3.1-x86_64-disk.img
glance image-create --property hypervisor_type=qemu --name cirros-qcow2 --disk-format qcow2 --container-format bare --file cirros-0.3.1-x86_64-disk.img

ovs-vsctl add-port br-ex $private_net

START_IP="10.7.5.180"
END_IP="10.7.5.190"
NETWORK="10.7.0.0/16"
GATEWAY="10.7.1.1"

bash create-networks-openstack.sh $START_IP $END_IP $GATEWAY $NETWORK
