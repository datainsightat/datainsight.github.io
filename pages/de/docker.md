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

    $ docker container run -it --name ubuntu unbuntu bash
    
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
    copy ..
    cmd [tini","--","node","./bin/www"]
    
    $ docker built -t testnode .
    $ docker container run --vm -p 80:3000 testnode
    $ docker tag testnode username/testing-node
    $ docker push username/testing-node
