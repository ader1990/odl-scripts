
work_dir="/root/distribution-karaf-0.2.1-Helium-SR1"

pushd $work_dir

#start karaf
./bin/karaf

#run in karaf
#feature:install odl-base-all odl-aaa-authn odl-restconf odl-nsf-all odl-adsal-northbound odl-mdsal-apidocs odl-ovsdb-openstack odl-ovsdb-northbound odl-dlux-core odl-base-all odl-ovsdb-northbound odl-l2switch-switch odl-integration-compatible-with-ovs-openstack


#then go to:  http://localhost:8181/dlux/index.html
#user/pass admin/admin
