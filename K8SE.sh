#!/bin/bash -v

# clone all repos
cd ~
git clone https://github.com/acinwinstack/chimichanga.git
git clone https://github.com/acinwinstack/k8s101-course-content.git

##########################################
# docker lab app.py
mkdir -p ~/Desktop/01_Docker/lab1/
cp ~/k8s101-course-content/K8S101_Ch1_Docker/docker_getstartedlab/lab1/app.py ~/Desktop/01_Docker/lab1/app.py
echo "app.py Downloaded for Ch1 Docker Lab"

##########################################
# deploy minikube
cd ~
curl -LO https://storage.googleapis.com/kubernetes-release/release/$(curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt)/bin/linux/amd64/kubectl
chmod +x ~/kubectl
sudo mv ~/kubectl /usr/local/bin/kubectl
curl -Lo minikube https://storage.googleapis.com/minikube/releases/latest/minikube-linux-amd64 && chmod +x minikube && sudo cp minikube /usr/local/bin/ && rm minikube
minikube start
minikube stop

###########################################
# minikube lab app.py
mkdir -p ~/Desktop/02_Minikube/build/
cp ~/k8s101-course-content/K8S101_Ch2_KubernetesIntro/minikube_lab/workshop/build/app.py ~/Desktop/02_Minikube/build/app.py

###########################################
# deploy k8s manual installation lab nodes
cp -rf ~/chimichanga/k8s-manual ~/Desktop/03_k8s-manual
cd ~/Desktop/03_k8s-manual
vagrant up
vagrant suspend

##########################################
# kube-ansible resources
cd ~/Desktop/
git clone https://github.com/inwinstack/kube-ansible.git

##########################################
# deploy kubeadm installation lab nodes

## lab removed


##########################################
# deploy docker registry ndoe

## lab removed


###########################################
# Practical Kubernetes Labs
cp -rf ~/k8s101-course-content/K8S101_Ch4_PracticalKubernetes/PracticalApps/ ~/Desktop/04_PracticalApps/


###########################################
# clean up
rm -rf ~/chimichanga
rm ~/K8SE.sh

ifconfig |grep 172.24.0.
