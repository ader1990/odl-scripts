#DO NOT RUN THIS
#this is just a how to about the run order of the scripts

#does not need edit
#install the repos and basic packages before rdo
STEP 1
prepare-rdo.sh 

#needs editing
#sets the ifcfg proper values
STEP 2
set-interfaces.sh 

#needs editiong
#creates an answer file for packstack
#!!!!!!!!!!!!!!!!!!
#if you wannt vxlan or vlan, here you must change the value of the driver_type
STEP 3
generate-answer-file.sh

#does not need editing
#runs the packstack
#if mongo puppet script fails to pass, while it s at the step, run STEP 5
STEP 4
run-packstack.sh

#needs editing
#due to a /etc/mongodb.conf config issue, mongod service fails to start
#the solution is to have the conf replaced with a good one
STEP 5
restart-mongo.sh #this scripts needs the file mongodb.conf, which needs editing

#needs editing
#creates a nova key, glance cirros image and the neutron networks/routers/connections
STEP 6 
after-rdo.sh

#needs editing
#changes the neutron config for the opendaylight ml2 mechanism drivers, sets the odl configs, disables openvswitch-agent and restarts the neutron services
#!!!!!!!!!!!!!!!!!!
#if you wannt vxlan or vlan, here you must change the value of the driver_type
STEP 7
set-odl.sh


#HELPERS

#creates vms
create-vm.sh
create-vm-hyperv.sh #needs create-image-vhd.sh

#deletes all the networks
clean-networks.sh #the networks cannot be deleted if there are vms or floating ips

#recreate all the networks
create-nets.sh

#adds a hyperv image(ubuntu trustu)
create-image-vhd.sh
