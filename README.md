# Quick Lab
A quick lab environment for testing Salt.

## NOTE
This is only tested to work on Linux. You may need to remove references
to mounting `/sys` for usage on your host.

# Usage

In order to get our little Docker environment up and running we're 
going to do the following steps:
1. Update docker-compose.yml as needed
2. Have docker-compose finish building our environment
3. Start our docker-services
4. Log in to the Salt master

Stand-up the environment with the following commands.

```
user@labmachine ~/apps/quicklab $ docker-compose build
user@labmachine ~/apps/quicklab $ docker-compose up -d --scale minion=5
user@labmachine ~/apps/quicklab $ docker exec -it quicklab_master_1 bash
[root@spidermaster /]# exit
```

# Todo List
1. Add option to try to set whatever options someone adds to ENV as an option
in either the master config or the minion config
