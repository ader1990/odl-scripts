wget https://cloud-images.ubuntu.com/trusty/current/trusty-server-cloudimg-amd64-disk1.img

qemu-img convert -f qcow2 -O vhdx trusty-server-cloudimg-amd64-disk1.img trusty-server-cloudimg-amd64-disk1.vhdx

glance image-create --property hypervisor_type=hyperv --name trusty-vhdx --disk-format vhd --container-format bare --file trusty-server-cloudimg-amd64-disk1.vhdx
