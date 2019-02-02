#!bin/bash
#Bring the stack down with docker stack rm:
docker stack rm kamstrupstackdemo
#To bring your Docker Engine out of swarm mode
docker swarm leave --force