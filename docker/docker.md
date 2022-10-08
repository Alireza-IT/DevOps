container vs images : 

container is layers of images  with one base image like linux
we have application image as well like postgres.in changes, same layers will not downloading again .

docker is container environment which is created based on images.


docker vs VM : we have HW and os kernel level and application
docker virtialize application layer and use kernel as hosts --> small size and much faster
vm vitualize applicaiton layer and kernel together --> vm of any hosts on any hosts


docker components :

we install docker engine  with 3 parts: server for pulling imgages and managing images and containers 
second is api which interacting with docker server
third is cli for running command

docker server itself has some main parts: 
for pulling images and managin container lifecycle and volumes for persistent data and network and build images for building own docker images 


'we have different container runtime.


main docker Commands :

container is running env for image and with port binded and also included virtual file system.

docker pull imageName --> to get / download image
docker run -d imageName --name name -p portNumber
docker stop/start containrID/Name

docker rm containername
docker rmi imageName

container port vs host port => we can create binding port between container and hosts 
we could have conflict when open same port on hosts machines


docker run -p hostport:dockerPort ImageName
docker logs dockername 
docker exec -it  dockername /bin/bash

isolated docker network when we deployed two container into docker we dont need to define port-binding or network they can see each other.

by checking docker network ls 
docker network create name
if you want to put continer to wok=rk in this network use : 
docker run -p 27017:27017 -d --name mongodb --net mongo-network -e MONGO_INITDB_ROOT_USERNAME=admin -e MONGO_INITDB_ROOT_PASSWORD=password mongo



docker compose 
make automatic deployment ...like kubernetes

compose.yaml --> take whole comments into one file.yaml...

version:'3'
services : 
    mongodb: <- container name
        image:mongo <-- image name
        ports:
        - 27017:27017
        environment:
        - MONGO....=admin
    mongo-express:


no need to do network config ...dcker compose takes care of creating network

how to use it : 
docker-compose -f mongo.yaml up -> start


Dockerfile --> to create image
copy artifact into image and need to configure 
DockerFile has syntax and we have base image 

from node --> install node 
env jlkjkljlj=kjlj --> set hgjklkjlj=hkjhjkl
we can define env outside of image for example in docker compass

run mkdir -p /home/app --> create /home/app
copy . /home/app --> copy current folder files to /home/app --> execute on hosts

CMD[''node , 'server.js'] --> start app --> node server.js

build image --> docker build -t imageName:tag . 


Docker repository --> have to build and tag it.

docker login for logging into repo


docker tag imagename:tag repoAddress/imageNAme:tag --> to assign the name/repo to the image
docker push repoaddress


 naming in docker registry --> registryDomain/imageName:tag
 docker pull mongo === docker pull docker.io/library/mongo
 for private --> we can not skip the first part --> docker pull fullregistrydomain/my-app:tag

rebuild the app --> start from beginning 

Docker volumes:
on host we have physical filesystem and we plug into container filessytem path.
data gets automatically replicated if everythings is changed.in
3 type of volumes --> 1) by docker run -v /home/mount/data:var/lib/mysql/data command  
2) create volumes just by referencing container directory (no host directory) just created for container and called anonymous
3) docker run -v name:/var/lib/mysql we have name and we can reference to them. 

in compose : 
volumes : 
    - db-data:/var/lib/mysaql/data --> here reference name and is the path in continer

if you want to create different volumes for rest of containers we have to define at services level.

c:\ProgramData\docker\volumes
mac/linux : /var/lib/docker/volumes


docker volumes inspect volumes name --> to see current mount point on host.