# General

* Ubuntu Server > k8s, docker

# Install

## Ubuntu

    [Ubuntu](https://ubuntu.com/#download)
    
## Docker

    $ sudo apt update
    $ sudo apt install apt-transport-https ca-certificates curl software-properties-common
    $ curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
    $ sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu focal stable"
    $ apt-cache policy docker-ce
    $ sudo apt install docker-ce
    $ sudo systemctl status docker
    
Docker can be run by any user:  
    
    $ sudo usermod -aG docker ${USER}
    $ su - ${USER}
    $ groups
    $ sudo usermod -aG docker username

# Install Microk8s

    $ sudo snap install microk8s --classic
    $ sudo usermod -a -G microk8s $USER
    $ sudo chown -f -R $USER ~/.kube
    $ su - $USER
    $ microk8s status --wait-ready
    $ microk8s enable dashboard dns ingress
    $ microk8s kubectl get all --all-namespaces

## Start/Stop Service

    $ microk8s stop
    $ microk8s start
    
# Dashboard
    
## Enable Kubernetes Dashboard

    $ token=$(microk8s kubectl -n kube-system get secret | grep default-token | cut -d " " -f1)
microk8s kubectl -n kube-system describe secret $token
    $ microk8s kubectl port-forward -n kube-system service/kubernetes-dashboard 10443:443
    
## Start Dashboard

    $ microk8s dashboard-proxy
