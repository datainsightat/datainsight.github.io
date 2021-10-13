# Hadoop Spark Cluster

[Source](https://web.njit.edu/~avp38/projects/multi_projects/hadoop_spark_environment.html)

## Cluster Architecture

|VM|HDFS|YARN|Spark|
|-|-|-|-|
|head|NameNode||Master|
|body||ResourceManager</br>JobHistoryServer</br>ProxyServer||
|slave1|DataNode|NodeManager|Slave|
|slave2|DataNode|NodeManager|Slave|

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

## Setup Cluster

    $ git clone https://github.com/avp38/Hadoop-Spark-Environment.git
    $ cd Hadoop-Spark-Environment/resources
    $ wget https://mirror.klaus-uwe.me/apache/hadoop/common/hadoop-3.3.1/hadoop-3.3.1.tar.gz
    $ wget https://mirror.klaus-uwe.me/apache/spark/spark-3.1.2/spark-3.1.2-bin-hadoop3.2.tgz
    $ sudo vagrant up
 
## Start Hadoop
    
    $ vagrant ssh head
    $ sudo su
    $ hdfs --daemon start namenode --config $HADOOP_CONF_DIR
    $ hdfs --daemon start datanode --config $HADOOP_CONF_DIR
    
    $ vagrant ssh body
    $ yarn --daemon start resourcemanager --config $HADOOP_CONF_DIR 
    $ yarn --daemon start nodemanager --config $HADOOP_CONF_DIR 
    $ yarn --daemon start proxyserver --config $HADOOP_CONF_DIR
    $ yarn --daemon start historyserver --config $HADOOP_CONF_DIR

## Test yarn

    $ yarn jar /usr/local/hadoop/share/hadoop/mapreduce/hadoop-mapreduce-examples-*.jar pi 2 100
    
## Test Spark

    $ $SPARK_HOME/sbin/start-all.sh
    
## Start Spark

    $ vagrant ssh head
    
# Operate Cluster

    $ cd PATH_TO_CLUSTER
    $ sudo vagrant up
    $ sudp vagrant halt
