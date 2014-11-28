
neutron router-gateway-clear router public
neutron router-interface-delete router private-subnet
neutron router-delete router
neutron net-delete private
neutron net-delete public

