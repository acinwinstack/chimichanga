# deploy k8s lab nodes
cd ~/chimichanga/kube-ansible
./tools/setup

vagrant halt

vboxmanage modifyvm k8s-master1 --hostonlyadapter3 vboxnet1
vboxmanage modifyvm k8s-master1 --nic3
vboxmanage modifyvm k8s-node1 --hostonlyadapter3 vboxnet1
vboxmanage modifyvm k8s-node1 --nic3
vboxmanage modifyvm k8s-node2 --hostonlyadapter3 vboxnet1
vboxmanage modifyvm k8s-node2 --nic3
