NET_ID=`neutron net-show private  | awk '{if (NR == 5) {print $4}}'`
nova boot --key-name userkey --flavor m1.ady --image trusty-vhdx --security-groups default --nic net-id=$NET_ID ader
