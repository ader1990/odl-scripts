START_IP="10.7.5.190"
END_IP="10.7.5.200"
NETWORK="10.7.0.0/16"
GATEWAY="10.7.1.1"

bash create-networks-openstack.sh $START_IP $END_IP $GATEWAY $NETWORK

