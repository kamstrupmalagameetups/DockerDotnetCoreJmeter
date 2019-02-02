#!bin/bash
docker swarm init
# Create the stack with docker stack deploy
docker stack deploy --compose-file docker-compose.yml kamstrupstackdemo
#Check that it's running
docker stack services kamstrupstackdemo