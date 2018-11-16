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
user@labmachine ~/apps/quicklab $ usage: build_image.py [-h] [-t TAG] [-m M] [-v] version

positional arguments:
  version            Specify version to install

optional arguments:
  -h, --help         show this help message and exit
  -t TAG, --tag TAG  Specify the tag to use instead of the default (default:
                     base)
  -m M               Specify the master IP/hostname to use in the image
                     (default: salt)
  -v                 Print Python version and exit (default: False)

user@labmachine ~/apps/quicklab $ # The tag and version should match what you specified in your Dockerfiles
user@labmachine ~/apps/quicklab $ python3 ./build_image.py -t salty -m salt 2018.3.2 
user@labmachine ~/apps/quicklab $ docker-compose build
user@labmachine ~/apps/quicklab $ docker-compose up -d --scale minion=5
user@labmachine ~/apps/quicklab $ docker exec -it quicklab_master_1 bash
[root@spidermaster /]# exit
```

