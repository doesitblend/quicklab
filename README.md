# Quick Lab
A quick lab environment for testing Salt.

## NOTE
This is only tested to work on Linux. You may need to remove references
to mounting `/sys` for usage on your host.

# Usage

In order to get our little Docker environment up and running we're 
going to do the following steps:
1. Build the base image with provided script or `docker build`
2. Update docker-compose.yml as needed
3. Have docker-compose finish building our environment
4. Start our docker-services
5. Log in to the Salt master

Stand-up the environment with the following commands.

```
user@labmachine ~/apps/quicklab $ # The tag and version should match what you specified in the other Dockerfile files
user@labmachine ~/apps/quicklab $ # This is base:latest 
user@labmachine ~/apps/quicklab $ docker build -t base:latest --build-arg masterip=spidermaster --build-arg saltversion=2017.7.8 .
user@labmachine ~/apps/quicklab $ docker-compose build
user@labmachine ~/apps/quicklab $ docker-compose up -d --scale minion=5
user@labmachine ~/apps/quicklab $ docker exec -it quicklab_master_1 bash
[root@spidermaster /]# exit
```

