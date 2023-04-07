# General

## Image Commands

Get images

    docker pull ubuntu
    
View pulled images

    docker image ls -a

## Docker Commands

### Run Container

detached

    $ docker container run -d mysql
    
detached, custom name

    $ docker container run -d --name mysql mysql
    
detached, port mirror

    $ docker container run -d -p 8080:80 httpd

interactive

    $ docker container run -it --name ubuntu ubuntu bash
    
### View Container

    $ docker container ls -a
    
### Stop container

    $ docker container stop mysql
    
### Start container

Interactive

    $ docker container start -ai ubuntu
    
Execute command

    $ docker container exec -it mysql bash
    
## Admin

Performance containers

    $ docker container stats mysql
    
Active processes

    $ docker container top mysql
    
# Networking

run container

    $ docker container run -p 80:80 --name webhost -d nginx
    
view ports

    $ docker container port webhost
    
## Virtual Networks

    $ docker network connect
    $ docker network disconnect
    
## Docker Networks: CLI Management

    $ docker network ls
    $ docker network inspect
    $ docker network create --driver
    $ docker network connect
    $ docker network disconnect
    
    $ docker network create my_app_net
    $ docker container run -d --name new_nginx --network my_app_net nginx
    $ docker network inspect my_app_net
    
# Images

Build image

    $ vim Dockerfile
    
    from node:6-alpine
    expose 3000
    run apk add --update tini
    run mkdir -p /usr/src/app
    workdir /usr/src/app
    copy package.json package.json
    run npm install && npm cache clean
    copy . .
    cmd [tini","--","node","./bin/www"]
    
    $ docker build -t testnode .
    $ docker container run --vm -p 80:3000 testnode
    $ docker tag testnode username/testing-node
    $ docker push username/testing-node
    
## Build Image from Container

    $ docker commit llm alpaca-llm:latest

# Get Bash in Docker

    $ docker exec -it <container name> /bin/bash

# Run GUI Applications

## Linux

    $ xhost +
    $ docker run -it --name gimp -e DISPLAY=$DISPLAY -v /tmp/.X11-unix:/tmp/.X11-unix:ro gimp:0.1

# Run Docker in Windows 11 WSL 2 without Docker Desktop

https://dev.to/felipecrs/simply-run-docker-on-wsl2-3o8

## Install Docker WSL 2: Ubuntu
    
    $ # Ensures not older packages are installed
    $ sudo apt-get remove docker docker-engine docker.io containerd runc

    # Ensure pre-requisites are installed
    $ sudo apt-get update
    $ sudo apt-get install \
        ca-certificates \
        curl \
        gnupg \
        lsb-release

    # Adds docker apt key
    $ sudo mkdir -p /etc/apt/keyrings
    $ curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg

    # Adds docker apt repository
    $ echo \
    "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
    $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

    # Refreshes apt repos
    $ sudo apt-get update

    # Installs Docker CE
    $ sudo apt-get install docker-ce docker-ce-cli containerd.io docker-compose-plugin
    
    # Ensures docker group exists
    $ sudo groupadd docker

    # Ensures you are part of it
    $ sudo usermod -aG docker $USER

    # Now, close your shell and open another for taking the group changes into account
    
    $ touch /etc/wsl.conf
    
    [boot]
    systemd=true

reboot

## Install VSCode

https://securecloud.blog/2021/12/07/wsl2-use-docker-with-vscode-without-docker-desktop/

    VSCode: Install 'Remote - WSL' Extension
    Remote - Explorer: WSL Targets > Ubuntu > Connect to WSL
    Ubuntu Remote: Install 'Docker' Extension

    
