#!/bin/bash -v

# clone all repos
cd ~
git clone https://github.com/acinwinstack/chimichanga.git
git clone https://github.com/acinwinstack/k8s101-course-content.git

##########################################
# docker lab app.py
mkdir -p ~/Desktop/Docker/lab/
cp ~/k8s101-course-content/K8S101_Ch1_Docker/docker_getstartedlab/lab1/app.py ~/Desktop/Docker/lab/app.py
echo "app.py Downloaded for Ch1 Docker Lab"

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
# minikube lab app.py
mkdir -p ~/Desktop/minikube/build/
cp ~/k8s101-course-content/K8S101_Ch2_KubernetesIntro/minikube_lab/workshop/build/app.py ~/Desktop/minikube/build/app.py

###########################################
# deploy k8s manual installation lab nodes
cd ~/chimichanga/k8s-manual
vagrant up
vagrant suspend

##########################################
# deploy kubeadm installation lab nodes

## lab removed

##########################################
# deploy docker registry ndoe

## lab removed

###########################################
# clean up
mv ~/chimichanga ~/k8s101env

ifconfig |grep 172.24.0.
