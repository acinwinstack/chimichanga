#!/bin/bash -v


# clone all repos
cd ~
git clone https://github.com/acinwinstack/chimichanga.git
git clone https://github.com/acinwinstack/k8s101-course-content.git

##########################################
# deploy minikube
cd ~
curl -LO https://storage.googleapis.com/kubernetes-release/release/$(curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt)/bin/linux/amd64/kubectl
chmod +x ~/kubectl
sudo mv ~/kubectl /usr/local/bin/kubectl
curl -Lo minikube https://storage.googleapis.com/minikube/releases/v0.24.1/minikube-linux-amd64 && chmod +x minikube && sudo mv minikube /usr/local/bin/
minikube start
minikube stop

###########################################
## deploy docker-registry node
#cd ~/chimichanga/docker-registry
#vagrant up

#vagrant ssh
#pull necessary images
#docker pull python
#docker pull redis
#docker pull mongodb
#docker pull nginx
#vagrant halt

###########################################
# deploy k8s manual installation lab nodes
cd ~/chimichanga/k8s-manual
vagrant up

scp -r ~/k8s101-course-content/K8S101_Ch3_K8sManualInstallation/* vagrant@172.16.33.10:~/
ssh vagrant@172.16.33.10 'sh ~/init.sh'
scp -r ~/k8s101-course-content/K8S101_Ch3_K8sManualInstallation/* vagrant@172.16.33.11:~/
ssh vagrant@172.16.33.11 'sh ~/init.sh'
scp -r ~/k8s101-course-content/K8S101_Ch3_K8sManualInstallation/* vagrant@172.16.33.12:~/
ssh vagrant@172.16.33.12 'sh ~/init.sh'

vagrant suspend

###########################################
# deploy k8s kubeadm installation lab nodes
cd ~/chimichanga/k8s-kubeadm
vagrant up
vagrant suspend

###########################################
# clean up
mv ~/chimichanga ~/k8s101env


ifconfig |grep 172.24.0.
