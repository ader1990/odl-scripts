if [ $# -lt 4 ]; then
    echo "Usage: <ip start> <ip end> <gateway> <network> [<neutron>]"
    exit 1
else
    FROM_IP=$1
    TO_IP=$2
    GATEWAY=$3
    NETWORK=$4
    if [ $# -eq 4 ]; then
        neutron_cmd="neutron"
    else
        neutron_cmd=$3
    fi
fi

NETID1=`$neutron_cmd net-create private| awk '{if (NR == 6) {print $4}}'`
SUBNETID1=`$neutron_cmd subnet-create private --name private-subnet 10.0.1.0/24 --dns_nameservers list=true 8.8.8.8 | awk '{if (NR == 11) {print $4}}'`

ROUTERID1=`$neutron_cmd router-create router | awk '{if (NR == 9) {print $4}}'`

$neutron_cmd router-interface-add $ROUTERID1 $SUBNETID1

EXTNETID1=`$neutron_cmd net-create public --router:external=True | awk '{if (NR == 6) {print $4}}'`
$neutron_cmd subnet-create public --allocation-pool start=$FROM_IP,end=$TO_IP --gateway $GATEWAY $NETWORK --enable_dhcp=False

$neutron_cmd router-gateway-set $ROUTERID1 $EXTNETID1
