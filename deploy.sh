#!/usr/bin/env bash

while getopts i:h: option
do
case "${option}"
in
i) pem=${OPTARG};;
h) host=${OPTARG};;
esac
done

ssh -i $pem ubuntu@$host 'rm -rf ~/docker'
ssh -i $pem ubuntu@$host 'mkdir ~/docker'
ssh -i $pem ubuntu@$host 'mkdir ~/docker/install'


scp -i $pem ./docker/install/install-docker.sh ubuntu@$host:~/docker/install/install-docker.sh
scp -i $pem ./docker/install/install-docker-compose.sh ubuntu@$host:~/docker/install/install-docker-compose.sh
scp -i $pem ./docker/docker-compose.yml ubuntu@$host:~/docker/docker-compose.yml
scp -i $pem -r ./data ubuntu@$host:~/docker/data

ssh -i $pem ubuntu@$host 'bash ~/docker/install/install-docker.sh'
ssh -i $pem ubuntu@$host 'bash ~/docker/install/install-docker-compose.sh'
ssh -i $pem ubuntu@$host 'rm -rf ~/docker/install'

ssh -i $pem ubuntu@$host 'sudo docker stop $(sudo docker ps -a -q); sudo docker rm $(sudo docker ps -a -q)'
ssh -i $pem ubuntu@$host 'cd ~/docker; sudo docker-compose up --build'



