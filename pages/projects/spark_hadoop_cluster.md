# General

* Ubuntu Server > k8s, docker

# Host

## Download

* [Ubuntu 20.04.03 Desktop](https://releases.ubuntu.com/20.04.3/ubuntu-20.04.3-desktop-amd64.iso?_ga=2.192166504.37755249.1634021994-306704312.1634021994)
* [Ubuntu 20.04.03 Server](https://releases.ubuntu.com/20.04.3/ubuntu-20.04.3-desktop-amd64.iso?_ga=2.192166504.37755249.1634021994-306704312.1634021994)
* [VirtualBox 6.1.26](https://download.virtualbox.org/virtualbox/6.1.26/virtualbox-6.1_6.1.26-145957~Ubuntu~eoan_amd64.deb)

## Install

### Ubuntu

Download [Ubuntu](https://ubuntu.com/#download) and create a USB-Sticl with [Rufus (Win)](https://rufus.ie/en/), or the Ubuntu Disk Creator tool.

### Git

    $ sudo apt install git-all

### Docker

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
    $ sudo usermod -aG docker $USER
    
### Docker Compose

[Git](https://github.com/docker/compose/releases)

    $ sudo curl -L "https://github.com/docker/compose/releases/download/v2.0.1/docker-compose-linux-x86_64" -o /usr/local/bin/docker-compose
    $ sudo chmod +x /usr/local/bin/docker-compose
    $ docker-compose --version
    
### VirtualBox

Install Package
    
### Vagrant

    $ curl -fsSL https://apt.releases.hashicorp.com/gpg | sudo apt-key add -
    $ sudo apt-add-repository "deb [arch=amd64] https://apt.releases.hashicorp.com $(lsb_release -cs) main"
    $ sudo apt-get update && sudo apt-get install vagrant
    
## Setup Kubernetes Cluster

[Source Kubernetes](https://medium.com/swlh/setup-own-kubernetes-cluster-via-virtualbox-99a82605bfcc)

    $ git clone https://github.com/datainsightat/k8s_cluster.git
    $ cd k8s_cluster
    $ vagrand up
    
ssh to the virtualbox master VM.
    
    master $ sudo kubeadm init --apiserver-advertise-address 192.168.33.13 --pod-network-cidr=10.244.0.0/16
    master $ mkdir -p $HOME/.kube
    master $ sudo cp -i /etc/kubernetes/admin.conf $HOME/.kube/config
    master $ sudo chown $(id -u):$(id -g) $HOME/.kube/config
    
## Setup Spark

[Source Spark](https://medium.com/analytics-vidhya/deploy-spark-on-kubernetes-cluster-7779c658bf6c)  

Configure Spark on both the virtualbox master and worker VMs  

    master/worker $ sudo apt install -y openjdk-8-jdk
    master/worker $ export JAVA_HOME=/usr/lib/jvm/java-8-openjdk-amd64
    
    master/worker $ wget https://archive.apache.org/dist/spark/spark-3.1.2/spark-3.1.2-bin-hadoop3.2.tgz
    master/worker $ tar -xvf spark-3.1.2-bin-hadoop3.2.tgz
    master/worker $ sudo mv spark-3.1.2-bin-hadoop3.2 /usr/local/
    master/worker $ sudo ln -s /usr/local/spark-3.1.2-bin-hadoop3.2/ /usr/local/spark
    master/worker $ cd /usr/local/spark
    master/worker $ export SPARK_HOME=/usr/local/spark
    
    worker $ sudo apt install -y docker.io
    worker $ sudo systemctl start docker
    worker $ sudo systemctl enable docker
    worker $ sudo bin/docker-image-tool.sh -r spark -t latest ./usr/local/spark/kubernetes/dockerfiles/spark/Dockerfile build
    worker $ sudo bin/docker-image-tool.sh -r spark -p latest ./usr/local/spark/kubernetes/dockerfiles/spark/Dockerfile build
    worker $ sudo bin/docker-image-tool.sh -r spark -R latest ./usr/local/spark/kubernetes/dockerfiles/spark/Dockerfile build
    
Test setup  

Create a python testapp on the master VM

    /home/vagrant/wordcount.py
    
    from pyspark import SparkContext
    sc = SparkContext("local", "count app")
    words = sc.parallelize (["scala","java","hadoop","spark","akka","spark vs hadoop","pyspark","pyspark and spark"])
    counts = words.count()
    print(counts)
    
To host the file run this command in the directory of your testapp:

    master $ /home/vagrant/python3 -m http.server 30001 &
    master $ kubectl proxy &
    master $ /usr/local/spark/bin/spark-submit --master k8s://http://127.0.0.1:8001 --deploy-mode cluster --name wordcount --conf spark.executor.instances=2 --conf spark.kubernetes.driver.container.image=spark/spark-py /home/vagrant/wordcount.py
    
    
    

## Setup Hadoop Cluster


    
    
    
    
    
    

# Install Microk8s

[Documentation](https://microk8s.io)

    $ sudo snap install microk8s --classic
    $ sudo usermod -a -G microk8s $USER
    $ sudo chown -f -R $USER ~/.kube
    $ su - $USER
    $ microk8s status --wait-ready
    $ microk8s enable dashboard dns ingress dashboard dns registry istio
    $ microk8s kubectl get all --all-namespaces

## Start/Stop Service

    $ microk8s stop
    $ microk8s start
    
# Dashboard
    
## Enable Kubernetes Dashboard

    $ token=$(microk8s kubectl -n kube-system get secret | grep default-token | cut -d " " -f1)
    $ microk8s kubectl -n kube-system describe secret $token
    $ microk8s kubectl port-forward -n kube-system service/kubernetes-dashboard 10443:443
    
## Start Dashboard

    $ microk8s dashboard-proxy





# NEW

[Source](https://web.njit.edu/~avp38/projects/multi_projects/hadoop_spark_environment.html)

## Cluster Architecture

|VM|HDFS|YARN|Spark|Other|
|-|-|-|-|-|
|head|NameNode||Master||
|body||ResourceManager|JobHistoryServer|ProxyServer|
|slave1|DataNode|NodeManager|Slave||
|slave2|DataNode|NodeManager|Slave||

## Webinterfaces

|Service|URL|
|-|-|
|NameNode|http://localhost:50070/dfshealth.html|
|ResourceManager|http://localhost:18088/cluster|
|JobHistory|http://localhost:19888/jobhistory|
|Spark|http://localhost:8080|

# Setup Host

## Download

* [Ubuntu 20.04.03 Desktop](https://releases.ubuntu.com/20.04.3/ubuntu-20.04.3-desktop-amd64.iso?_ga=2.192166504.37755249.1634021994-306704312.1634021994)
* [Ubuntu 20.04.03 Server](https://releases.ubuntu.com/20.04.3/ubuntu-20.04.3-desktop-amd64.iso?_ga=2.192166504.37755249.1634021994-306704312.1634021994)
* [VirtualBox 6.1.26](https://download.virtualbox.org/virtualbox/6.1.26/virtualbox-6.1_6.1.26-145957~Ubuntu~eoan_amd64.deb)

## Install

### Ubuntu

Create an USB-Stick with [Rufus (Win)](https://rufus.ie/en/), or the Ubuntu Disk Creator tool and install Ubuntu

### Git

    $ sudo apt install git-all

### Docker

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
    $ sudo usermod -aG docker $USER
    
### Docker Compose

[Git](https://github.com/docker/compose/releases)

    $ sudo curl -L "https://github.com/docker/compose/releases/download/v2.0.1/docker-compose-linux-x86_64" -o /usr/local/bin/docker-compose
    $ sudo chmod +x /usr/local/bin/docker-compose
    $ docker-compose --version
    
### VirtualBox

Install Package
    
### Vagrant

    $ curl -fsSL https://apt.releases.hashicorp.com/gpg | sudo apt-key add -
    $ sudo apt-add-repository "deb [arch=amd64] https://apt.releases.hashicorp.com $(lsb_release -cs) main"
    $ sudo apt-get update && sudo apt-get install vagrant
    
Add user 'vagrant' do /etc/sudoers

    $ sudo nano /etc/sudoers
    
    vagrant ALL=(ALL) NOPASSWD:ALL

## Setup Cluster

    $ git clone https://github.com/avp38/Hadoop-Spark-Environment.git
    $ cd Hadoop-Spark-Environment/resources
    $ wget https://mirror.klaus-uwe.me/apache/hadoop/common/hadoop-3.3.1/hadoop-3.3.1.tar.gz
    $ wget https://mirror.klaus-uwe.me/apache/spark/spark-3.1.2/spark-3.1.2-bin-hadoop3.2.tgz
    $ sudo vagrant up
    
    $ vagrant ssh head
    $ sudo su
    $ 
    
# Operate Cluster

    $ cd PATH_TO_CLUSTER
    $ sudo vagrant up
    $ sudp vagrant halt
